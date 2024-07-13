

 #include "ap_int.h"

#include "ap_axi_sdata.h"

#include <tapa.h>

#include <inttypes.h>

#include <stdlib.h>

// CEIL_DIVISION(X, Y) = ceil(x/y).
// ROUND_TO_NEXT_MULTIPLE(X, Y) rounds X up to the nearest multiple of Y.
const int IWIDTH = 512;
const int INPUT_DIM = 2;
const int TOP = 10;
/***************************************************************/
// L2I = Local to Interface
const int L2I_FACTOR_W = ( (IWIDTH-1)/(INPUT_DIM * (32)) + 1 );
// D2L = Data_Type to Local
const int D2L_FACTOR_W = ( ((32)-1)/32 + 1 );
// D2I = Data_Type to Interface
const int D2I_FACTOR_W = ( (IWIDTH-1)/(INPUT_DIM * 32) + 1 );
// I2D = Interface to Data_type
const int I2D_FACTOR_W = ( ((INPUT_DIM * 32)-1)/IWIDTH + 1 );
// // DEBUG NOTE: BW_FACTOR = 1.1349753694581282
// Round up to the nearest multiple, because otherwise some logic breaks (incorrect sizes => bad logic in edgecases)
// We partition the input points, so each PE gets it's own partition, to maximize parallelization.
const int PARTITION_LEN_IN_I = (((( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) * 32 * INPUT_DIM) / IWIDTH);
const int PARTITION_LEN_IN_D = (((( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) * 32 * INPUT_DIM) / (INPUT_DIM * 32));
const int PARTITION_LEN_IN_L = (((( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) * 32 * INPUT_DIM) / (INPUT_DIM * (32)));
// We name each sub-array of the local_distance arrays a "segment".
//const int SWIDTH = DATA_TYPE_TOTAL_SZ;
//typedef ap_axiu<SWIDTH, 0, 0, 0> pkt;
//typedef ap_axiu<32, 0, 0, 0>    id_pkt;
//#define STREAM_WIDTH ap_uint<SWIDTH>
const int NUM_FEATURES_PER_READ = (IWIDTH/32);
const int QUERY_FEATURE_RESERVE = (128);
static inline float absval(float input){
    return (input > 0 ? input : static_cast<float>(-1*input));
}
/*************************************************/
/******************** LOADS: *********************/
/*************************************************/
void load_KNN( int debug_PE_ID,
                 tapa::async_mmap<ap_uint<IWIDTH> > & searchSpace,
                 tapa::ostream<ap_uint<IWIDTH> >& load_to_compute_stream)
{
#pragma HLS INLINE OFF
    ap_uint<IWIDTH> loaded_value = 0;
    LOAD_QUERY:
    for (int i_req = 0, i_resp = 0; i_resp < (INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1; ) {
#pragma HLS loop_tripcount min=((INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1) max=((INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1)
#pragma HLS pipeline II=1
        //Think of addr as an array index.
        int addr = i_req;
        if (i_req < (INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1 && searchSpace.read_addr.try_write(addr)) {
            i_req++;
        }
        if (!searchSpace.read_data.empty()) {
            loaded_value = searchSpace.read_data.read(nullptr);
            i_resp++;
            // DEBUGGING:
            load_to_compute_stream.write(loaded_value);
        }
    }
    LOAD_SEARCHSPACE:
    for (int i_req = 0, i_resp = 0; i_resp < PARTITION_LEN_IN_I; ) {
#pragma HLS loop_tripcount min=PARTITION_LEN_IN_I max=PARTITION_LEN_IN_I
#pragma HLS pipeline II=1
        //Think of addr as an array index.
        int addr = (QUERY_FEATURE_RESERVE / NUM_FEATURES_PER_READ) + i_req;
        if (i_req < PARTITION_LEN_IN_I && searchSpace.read_addr.try_write(addr)) {
            i_req++;
        }
        if (!searchSpace.read_data.empty()) {
            loaded_value = searchSpace.read_data.read(nullptr);
            i_resp++;
            //// DEBUGGING: Printing the loaded data:
            //#ifndef __SYNTHESIS__
            //for (int i = 0; i < NUM_FEATURES_PER_READ; ++i)
            //{
            //    DATA_TYPE cur_value = 0;
            //    TRANSFER_TYPE tmp;
            //    tmp.range(DATA_TYPE_TOTAL_SZ - 1, 0)
            //        = loaded_value(i*DATA_TYPE_TOTAL_SZ + (DATA_TYPE_TOTAL_SZ - 1),
            //                        i*DATA_TYPE_TOTAL_SZ);
            //    cur_value = *((DATA_TYPE*) (&tmp));
            //    if (cur_value < MAX_DATA_TYPE_VAL && debug_PE_ID == 0)
            //    {
            //        printf("LOAD SEARCHSPACE: value = %f, i_resp = %d\n", cur_value, i_resp);
            //    }
            //}
            //#endif
            //// DEBUGGING: Printing how many times we write to each stream:
            //#ifndef __SYNTHESIS__
            //if (debug_PE_ID == 0)
            //{
            //    printf("LOAD: Writing to load_to_compute_stream for the %d-th time\n",
            //            i_resp-1);
            //}
            //#endif
            load_to_compute_stream.write(loaded_value);
        }
    }
}
/*************************************************/
/******************* COMPUTES: *******************/
/*************************************************/
void compute_KNN( int debug_pe_idx,
                    int debug_start_idx,
                    tapa::istream<ap_uint<IWIDTH> >& load_to_compute_stream,
                    tapa::ostreams<float, (L2I_FACTOR_W * 2)>& compute_to_sort_stream)
{
#pragma HLS INLINE OFF
    ap_uint<IWIDTH> cur_data = 0;
    float local_Query[INPUT_DIM];
#pragma HLS ARRAY_PARTITION variable=local_Query complete dim=1
    /***********************************************/
    GET_QUERYDATA:
    for (int i = 0 ; i < (INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1; ++i)
    {
        ap_uint<32> tmp = 0;
        int input_dim_idx = 0;
        cur_data = load_to_compute_stream.read();
        for ( int j = 0;
              j < NUM_FEATURES_PER_READ && input_dim_idx < INPUT_DIM;
              ++j, ++input_dim_idx)
        {
            tmp.range(32 -1, 0)
                = cur_data.range(j*32 + (32 -1),
                                 j*32);
            local_Query[input_dim_idx] = *((float*)(&tmp));
        }
    }
    COMPUTE_DATA:
    for (int jj = 0; jj < (PARTITION_LEN_IN_I / (L2I_FACTOR_W * 2)); ++jj){
        for (int ii = 0 ; ii < (L2I_FACTOR_W * 2); ++ii){
#pragma HLS PIPELINE II=1
            float aggregated_local_dists = 0;
            //#ifndef __SYNTHESIS__
            //if (debug_pe_idx == 0)
            //{
            //    printf("COMPUTE: Reading from load_to_compute_stream for the %d-th time\n",
            //            DEBUG_load_ctr++);
            //}
            //#endif
            cur_data = load_to_compute_stream.read();
            for (int l2i = 0; l2i < L2I_FACTOR_W; ++l2i)
            {
#pragma HLS UNROLL
                for (int d2l = 0; d2l < D2L_FACTOR_W; ++d2l){
#pragma HLS UNROLL
                    int d2i = d2l + D2L_FACTOR_W*l2i;
                    float delta_squared_sum = 0.0;
                    int start_idx = d2i * INPUT_DIM;
                    for (int ll = 0; ll < INPUT_DIM; ++ll){
                        unsigned int sp_range_idx = (start_idx + ll) * 32;
                        float sp_dim_item_value;
                        ap_uint<32> tmp = 0;
                        tmp.range(32 -1, 0) =
                            cur_data.range(sp_range_idx + (32 -1),
                                                   sp_range_idx);
                        sp_dim_item_value = *((float*) (&tmp));
                        float delta = absval(sp_dim_item_value - local_Query[ll]);
                        delta_squared_sum += delta * delta;
                    }
                    aggregated_local_dists = delta_squared_sum;
                    //#ifndef __SYNTHESIS__
                    //if (delta_squared_sum < MAX_DATA_TYPE_VAL)
                    //{
                    //    printf("COMPUTE: At index %d, delta_squared_sum = %f\n",
                    //            debug_start_idx + ii*SEGMENT_SIZE_IN_D +
                    //            jj*D2I_FACTOR_W + d2i,
                    //            delta_squared_sum);
                    //}
                    //#endif
                }
                int stream_idx = (ii*L2I_FACTOR_W + l2i)%(L2I_FACTOR_W * 2);
                compute_to_sort_stream[stream_idx].write(aggregated_local_dists);
                //#ifndef __SYNTHESIS__
                //if (debug_pe_idx == 0)
                //{
                //    printf("COMPUTE: Writing the value %f to compute_to_sort_stream number %d, for the %d'th time\n",
                //            aggregated_local_dists,
                //            stream_idx,
                //            DEBUG_write_counters[stream_idx]++);
                //}
                //#endif
                aggregated_local_dists = 0;
            }
        }
    }
}
void swap(float* a, float* b,
               int* x, int* y)
{
#pragma HLS INLINE
    float tmpdist_a;
    float tmpdist_b;
    int tmpid_x;
    int tmpid_y;
    tmpdist_a = *a;
    tmpdist_b = *b;
    *b = tmpdist_a;
    *a = tmpdist_b;
    tmpid_x = *x;
    tmpid_y = *y;
    *x = tmpid_y;
    *y = tmpid_x;
}
void para_partial_sort(const int PE_idx,
                       int seg_idx,
                       tapa::istream<float>& compute_to_sort_stream,
                       tapa::ostream<float>& sort_to_hiermerge_dist_stream_0,
                       tapa::ostream<int>& sort_to_hiermerge_id_stream_0)
{
#pragma HLS INLINE OFF
    static // TAPA Known-issue: Static keyword fails CSIM because this is not thread-safe.
                //  but when running the HW build, it will instantiate several copies of this function. So this is OK.
    float local_kNearstDist[D2L_FACTOR_W][(TOP+1)];
#pragma HLS ARRAY_PARTITION variable=local_kNearstDist complete dim=0
    static
    int local_kNearstId[D2L_FACTOR_W][(TOP+1)];
#pragma HLS ARRAY_PARTITION variable=local_kNearstId complete dim=0
    /* Our segments used to be large chunks of each partition.
     * Now, however, our segments are cylically split, so our ID
     * logic has to change.
     */
    int start_id = PE_idx * (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) + seg_idx*D2L_FACTOR_W;
    /*******************************************/
    // Initialize all top-K distances to MAX, and their IDs to an invalid value.
    INIT_LOOP:
    for (int i = 0; i < D2L_FACTOR_W; ++i)
    {
        for (int j = 0; j < TOP+1; ++j)
        {
            local_kNearstId[i][j] = -1;
            local_kNearstDist[i][j] = (3.402823e+38f);
        }
    }
    SORT_LOOP:
    for (int lvalue_idx = 0; lvalue_idx < ((PARTITION_LEN_IN_L / (L2I_FACTOR_W * 2)) + TOP); ++lvalue_idx) {
#pragma HLS PIPELINE II=2
        float cur_Lval = 0;
        int stream_idx = seg_idx;
        if (lvalue_idx >= (PARTITION_LEN_IN_L / (L2I_FACTOR_W * 2))) {
            cur_Lval = (3.402823e+38f);
        } else {
            //#ifndef __SYNTHESIS__
            //if (PE_idx == 0)
            //{
            //    printf("PPS Unit %d: Reading from compute_to_sort_stream %d, for the %d-th time\n",
            //            seg_idx,
            //            stream_idx,
            //            DEBUG_stream_counters++);
            //}
            //#endif
            cur_Lval = compute_to_sort_stream.read();
        }
        for (int D_idx = 0; D_idx < D2L_FACTOR_W; ++D_idx)
        {
#pragma HLS UNROLL
            unsigned char range_idx = (D_idx)*32;
            float cur_Dval;
            cur_Dval = cur_Lval;
            local_kNearstDist[D_idx][0] = cur_Dval;
            local_kNearstId[D_idx][0] = start_id + lvalue_idx*D2L_FACTOR_W*(L2I_FACTOR_W * 2) + D_idx;
            //#ifndef __SYNTHESIS__
            //printf("SORT: Current ID = %d, cur_Dval = %f\n", start_id + lvalue_idx, cur_Dval);
            //printf("SORT: Best ID = %d, Best Dval = %f\n", local_kNearstId[D_idx][TOP], local_kNearstDist[D_idx][TOP]);
            //#endif
            //compare and swap odd
            for(int ii=1; ii<TOP; ii+=2){
#pragma HLS UNROLL
#pragma HLS DEPENDENCE variable="local_kNearstDist" inter false
#pragma HLS DEPENDENCE variable="local_kNearstId" inter false
                if (local_kNearstDist[D_idx][ii] < local_kNearstDist[D_idx][ii+1]){
                    swap(&local_kNearstDist[D_idx][ii], &local_kNearstDist[D_idx][ii+1],
                              &local_kNearstId[D_idx][ii], &local_kNearstId[D_idx][ii+1]);
                }
            }
            //compare and swap even
            for(int ii=1; ii<TOP+1; ii+=2){
#pragma HLS UNROLL
#pragma HLS DEPENDENCE variable="local_kNearstDist" inter false
#pragma HLS DEPENDENCE variable="local_kNearstId" inter false
                if (local_kNearstDist[D_idx][ii] > local_kNearstDist[D_idx][ii-1]){
                    swap(&local_kNearstDist[D_idx][ii], &local_kNearstDist[D_idx][ii-1],
                              &local_kNearstId[D_idx][ii], &local_kNearstId[D_idx][ii-1]);
                }
            }
        }
    }
    // Write data out
    OUTPUT_LOOP:
    for (int j = TOP; j > 0; --j)
    {
#pragma HLS PIPELINE II=1
        sort_to_hiermerge_dist_stream_0.write(local_kNearstDist[0][j]);
        sort_to_hiermerge_id_stream_0.write(local_kNearstId[0][j]);
    }
    REINITIALIZATION_LOOP:
    for (int i = 0; i < D2L_FACTOR_W; ++i){
        for (int j = 0; j < TOP+1; ++j){
#pragma HLS UNROLL
            // Reset the kNearst values so we can run the next iteration.
            local_kNearstId[i][j] = -1;
            local_kNearstDist[i][j] = (3.402823e+38f);
        }
    }
}
void merge_dual_streams(
                        int debug_PE_idx,
                        int debug_seg_d2l_idx,
                        int debug_stage_idx,
                        tapa::istream<float>& hiermerge_dist_istream_1,
                        tapa::istream<int>& hiermerge_id_istream_1,
                        tapa::istream<float>& hiermerge_dist_istream_2,
                        tapa::istream<int>& hiermerge_id_istream_2,
                        tapa::ostream<float>& hiermerge_dist_ostream,
                        tapa::ostream<int>& hiermerge_id_ostream
)
{
    float dist_1 = hiermerge_dist_istream_1.read();
    float dist_2 = hiermerge_dist_istream_2.read();
    int id_1 = hiermerge_id_istream_1.read();
    int id_2 = hiermerge_id_istream_2.read();
    int stream1_read_count = 1;
    int stream2_read_count = 1;
    for (int k = TOP-1; k > 0; --k)
    {
        if (dist_1 <= dist_2)
        {
            hiermerge_dist_ostream.write(dist_1);
            hiermerge_id_ostream.write(id_1);
            if (stream1_read_count < TOP)
            {
                ++stream1_read_count;
                dist_1 = hiermerge_dist_istream_1.read();
                id_1 = hiermerge_id_istream_1.read();
            }
        }
        else
        {
            hiermerge_dist_ostream.write(dist_2);
            hiermerge_id_ostream.write(id_2);
            if (stream2_read_count < TOP)
            {
                ++stream2_read_count;
                dist_2 = hiermerge_dist_istream_2.read();
                id_2 = hiermerge_id_istream_2.read();
            }
        }
    }
    // Final write.
    if (dist_1 <= dist_2) {
        hiermerge_dist_ostream.write(dist_1);
        hiermerge_id_ostream.write(id_1);
    }
    else {
        hiermerge_dist_ostream.write(dist_2);
        hiermerge_id_ostream.write(id_2);
    }
    // Empty the input streams.
    // NOTE: The total tripcount of these loops will be TOP.
    while (stream1_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream1_read_count;
        dist_1 = hiermerge_dist_istream_1.read();
        id_1 = hiermerge_id_istream_1.read();
    }
    while (stream2_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream2_read_count;
        dist_2 = hiermerge_dist_istream_2.read();
        id_2 = hiermerge_id_istream_2.read();
    }
}
void merge_trio_streams(
                        int debug_PE_idx,
                        int debug_seg_d2l_idx,
                        int debug_stage_idx,
                        tapa::istream<float>& hiermerge_dist_istream_1,
                        tapa::istream<int>& hiermerge_id_istream_1,
                        tapa::istream<float>& hiermerge_dist_istream_2,
                        tapa::istream<int>& hiermerge_id_istream_2,
                        tapa::istream<float>& hiermerge_dist_istream_3,
                        tapa::istream<int>& hiermerge_id_istream_3,
                        tapa::ostream<float>& hiermerge_dist_ostream,
                        tapa::ostream<int>& hiermerge_id_ostream
)
{
    float dist_1 = hiermerge_dist_istream_1.read();
    float dist_2 = hiermerge_dist_istream_2.read();
    float dist_3 = hiermerge_dist_istream_3.read();
    int id_1 = hiermerge_id_istream_1.read();
    int id_2 = hiermerge_id_istream_2.read();
    int id_3 = hiermerge_id_istream_3.read();
    int stream1_read_count = 1;
    int stream2_read_count = 1;
    int stream3_read_count = 1;
    for (int k = TOP-1; k > 0; --k)
    {
        if ( (dist_1 <= dist_2) && (dist_1 <= dist_3) )
        {
            hiermerge_dist_ostream.write(dist_1);
            hiermerge_id_ostream.write(id_1);
            if (stream1_read_count < TOP)
            {
                ++stream1_read_count;
                dist_1 = hiermerge_dist_istream_1.read();
                id_1 = hiermerge_id_istream_1.read();
            }
        }
        else if ( (dist_2 <= dist_3) && (dist_2 <= dist_1) )
        {
            hiermerge_dist_ostream.write(dist_2);
            hiermerge_id_ostream.write(id_2);
            if (stream2_read_count < TOP)
            {
                ++stream2_read_count;
                dist_2 = hiermerge_dist_istream_2.read();
                id_2 = hiermerge_id_istream_2.read();
            }
        }
        else
        {
            hiermerge_dist_ostream.write(dist_3);
            hiermerge_id_ostream.write(id_3);
            if (stream3_read_count < TOP)
            {
                ++stream3_read_count;
                dist_3 = hiermerge_dist_istream_3.read();
                id_3 = hiermerge_id_istream_3.read();
            }
        }
    }
    // Final write.
    if ( (dist_1 <= dist_2) && (dist_1 <= dist_3) ){
        hiermerge_dist_ostream.write(dist_1);
        hiermerge_id_ostream.write(id_1);
    }
    else if ( (dist_2 <= dist_3) && (dist_2 <= dist_1) ){
        hiermerge_dist_ostream.write(dist_2);
        hiermerge_id_ostream.write(id_2);
    }
    else{
        hiermerge_dist_ostream.write(dist_3);
        hiermerge_id_ostream.write(id_3);
    }
    // Empty the input streams.
    // NOTE: The total tripcount of these loops will be 2*TOP.
    while (stream1_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream1_read_count;
        dist_1 = hiermerge_dist_istream_1.read();
        id_1 = hiermerge_id_istream_1.read();
    }
    while (stream2_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream2_read_count;
        dist_2 = hiermerge_dist_istream_2.read();
        id_2 = hiermerge_id_istream_2.read();
    }
    while (stream3_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP max=TOP
        ++stream3_read_count;
        dist_3 = hiermerge_dist_istream_3.read();
        id_3 = hiermerge_id_istream_3.read();
    }
}
void write_out_mmap(
                    tapa::async_mmap<float>& output_knnDist,
                    tapa::async_mmap<int>& output_knnId,
                    float output_dist,
                    int output_id,
                    int& i_req_dist,
                    int& i_resp_dist,
                    int& i_req_id,
                    int& i_resp_id
) {
#pragma HLS INLINE
    // Writing the distance values:
    if (i_req_dist < TOP && i_req_dist >= 0 &&
        !output_knnDist.write_addr.full() &&
        !output_knnDist.write_data.full()
    ) {
      output_knnDist.write_addr.try_write(i_req_dist);
      output_knnDist.write_data.try_write(output_dist);
      --i_req_dist;
    }
    if (!output_knnDist.write_resp.empty()) {
      i_resp_dist += (unsigned int)(output_knnDist.write_resp.read(nullptr)) + 1;
    }
    // Writing the ID values:
    if (i_req_id < TOP && i_req_id >= 0 &&
        !output_knnId.write_addr.full() &&
        !output_knnId.write_data.full()
    ) {
      output_knnId.write_addr.try_write(i_req_id);
      output_knnId.write_data.try_write(output_id);
      --i_req_id;
    }
    if (!output_knnId.write_resp.empty()) {
      i_resp_id += (unsigned int)(output_knnId.write_resp.read(nullptr)) + 1;
    }
}
void merge_dual_streams_FINAL(
                        int debug_PE_idx,
                        int debug_seg_d2l_idx,
                        int debug_stage_idx,
                        tapa::istream<float>& hiermerge_dist_istream_1,
                        tapa::istream<int>& hiermerge_id_istream_1,
                        tapa::istream<float>& hiermerge_dist_istream_2,
                        tapa::istream<int>& hiermerge_id_istream_2,
                        tapa::async_mmap<float>& hiermerge_dist_output,
                        tapa::async_mmap<int>& hiermerge_id_output
)
{
    float dist_1 = hiermerge_dist_istream_1.read();
    float dist_2 = hiermerge_dist_istream_2.read();
    int id_1 = hiermerge_id_istream_1.read();
    int id_2 = hiermerge_id_istream_2.read();
    int stream1_read_count = 1;
    int stream2_read_count = 1;
    int i_req_dist = TOP-1;
    int i_resp_dist = TOP-1;
    int i_req_id = TOP-1;
    int i_resp_id = TOP-1;
    for (int k = TOP-1; k > 0; --k)
    {
        if (dist_1 <= dist_2)
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_1,
                            id_1,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);
            if (stream1_read_count < TOP)
            {
                ++stream1_read_count;
                dist_1 = hiermerge_dist_istream_1.read();
                id_1 = hiermerge_id_istream_1.read();
            }
        }
        else
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_2,
                            id_2,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);
            if (stream2_read_count < TOP)
            {
                ++stream2_read_count;
                dist_2 = hiermerge_dist_istream_2.read();
                id_2 = hiermerge_id_istream_2.read();
            }
        }
    }
    // Final write.
    if (dist_1 <= dist_2) {
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_1,
                        id_1,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }
    else {
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_2,
                        id_2,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }
    // Empty the input streams.
    while (stream1_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream1_read_count;
        dist_1 = hiermerge_dist_istream_1.read();
        id_1 = hiermerge_id_istream_1.read();
    }
    while (stream2_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream2_read_count;
        dist_2 = hiermerge_dist_istream_2.read();
        id_2 = hiermerge_id_istream_2.read();
    }
}
void merge_trio_streams_FINAL(
                        int debug_PE_idx,
                        int debug_seg_d2l_idx,
                        int debug_stage_idx,
                        tapa::istream<float>& hiermerge_dist_istream_1,
                        tapa::istream<int>& hiermerge_id_istream_1,
                        tapa::istream<float>& hiermerge_dist_istream_2,
                        tapa::istream<int>& hiermerge_id_istream_2,
                        tapa::istream<float>& hiermerge_dist_istream_3,
                        tapa::istream<int>& hiermerge_id_istream_3,
                        tapa::async_mmap<float>& hiermerge_dist_output,
                        tapa::async_mmap<int>& hiermerge_id_output
)
{
    float dist_1 = hiermerge_dist_istream_1.read();
    float dist_2 = hiermerge_dist_istream_2.read();
    float dist_3 = hiermerge_dist_istream_3.read();
    int id_1 = hiermerge_id_istream_1.read();
    int id_2 = hiermerge_id_istream_2.read();
    int id_3 = hiermerge_id_istream_3.read();
    int stream1_read_count = 1;
    int stream2_read_count = 1;
    int stream3_read_count = 1;
    int i_req_dist = TOP-1;
    int i_resp_dist = TOP-1;
    int i_req_id = TOP-1;
    int i_resp_id = TOP-1;
    for (int k = TOP-1; k > 0; --k)
    {
        if ( (dist_1 <= dist_2) && (dist_1 <= dist_3) )
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_1,
                            id_1,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);
            if (stream1_read_count < TOP)
            {
                ++stream1_read_count;
                dist_1 = hiermerge_dist_istream_1.read();
                id_1 = hiermerge_id_istream_1.read();
            }
        }
        else if ( (dist_2 <= dist_3) && (dist_2 <= dist_1) )
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_2,
                            id_2,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);
            if (stream2_read_count < TOP)
            {
                ++stream2_read_count;
                dist_2 = hiermerge_dist_istream_2.read();
                id_2 = hiermerge_id_istream_2.read();
            }
        }
        else
        {
            write_out_mmap( hiermerge_dist_output,
                            hiermerge_id_output,
                            dist_3,
                            id_3,
                            i_req_dist,
                            i_resp_dist,
                            i_req_id,
                            i_resp_id);
            if (stream3_read_count < TOP)
            {
                ++stream3_read_count;
                dist_3 = hiermerge_dist_istream_3.read();
                id_3 = hiermerge_id_istream_3.read();
            }
        }
    }
    // Final write.
    if ( (dist_1 <= dist_2) && (dist_1 <= dist_3) ){
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_1,
                        id_1,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }
    else if ( (dist_2 <= dist_3) && (dist_2 <= dist_1) ){
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_2,
                        id_2,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }
    else{
        write_out_mmap( hiermerge_dist_output,
                        hiermerge_id_output,
                        dist_3,
                        id_3,
                        i_req_dist,
                        i_resp_dist,
                        i_req_id,
                        i_resp_id);
    }
    // Empty the input streams.
    while (stream1_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream1_read_count;
        dist_1 = hiermerge_dist_istream_1.read();
        id_1 = hiermerge_id_istream_1.read();
    }
    while (stream2_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP/2 max=TOP/2
        ++stream2_read_count;
        dist_2 = hiermerge_dist_istream_2.read();
        id_2 = hiermerge_id_istream_2.read();
    }
    while (stream3_read_count < TOP)
    {
#pragma HLS loop_tripcount min=TOP max=TOP
        ++stream3_read_count;
        dist_3 = hiermerge_dist_istream_3.read();
        id_3 = hiermerge_id_istream_3.read();
    }
}
void Knn(
    tapa::mmap<ap_uint<IWIDTH> > in_0,
    tapa::mmap<ap_uint<IWIDTH> > in_1,
    tapa::mmap<ap_uint<IWIDTH> > in_2,
    tapa::mmap<ap_uint<IWIDTH> > in_3,
    tapa::mmap<ap_uint<IWIDTH> > in_4,
    tapa::mmap<ap_uint<IWIDTH> > in_5,
    tapa::mmap<ap_uint<IWIDTH> > in_6,
    tapa::mmap<ap_uint<IWIDTH> > in_7,
    tapa::mmap<ap_uint<IWIDTH> > in_8,
    tapa::mmap<ap_uint<IWIDTH> > in_9,
    tapa::mmap<ap_uint<IWIDTH> > in_10,
    tapa::mmap<ap_uint<IWIDTH> > in_11,
    tapa::mmap<ap_uint<IWIDTH> > in_12,
    tapa::mmap<ap_uint<IWIDTH> > in_13,
    tapa::mmap<ap_uint<IWIDTH> > in_14,
    tapa::mmap<float> final_out_dist,
    tapa::mmap<int> final_out_id
) {
    // Streams, for the global merge:
    tapa::streams<float, 15, TOP> L0_out_dist;
    tapa::streams<int, 15, TOP> L0_out_id;
    tapa::streams<float, 7, 2> L1_out_dist;
    tapa::streams<int, 7, 2> L1_out_id;
    tapa::streams<float, 3, 2> L2_out_dist;
    tapa::streams<int, 3, 2> L2_out_id;
    // Streams, for load->compute->sort:
    tapa::streams<ap_uint<IWIDTH>, (15), 2> load_to_compute_stream;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_0;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_1;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_2;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_3;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_4;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_5;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_6;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_7;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_8;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_9;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_10;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_11;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_12;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_13;
    tapa::streams<float, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_14;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_0;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_0;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_1;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_1;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_2;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_2;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_3;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_4;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_4;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_5;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_5;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_6;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_6;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_7;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_7;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_8;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_8;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_9;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_9;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_10;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_10;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_11;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_11;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_12;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_12;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_13;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_13;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_14;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_14;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_0_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_0_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_0_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_0_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_0_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_0_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_1_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_1_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_1_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_1_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_1_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_1_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_2_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_2_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_2_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_2_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_2_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_2_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_3_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_3_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_3_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_3_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_3_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_3_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_4_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_4_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_4_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_4_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_4_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_4_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_5_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_5_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_5_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_5_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_5_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_5_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_6_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_6_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_6_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_6_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_6_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_6_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_7_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_7_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_7_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_7_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_7_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_7_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_8_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_8_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_8_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_8_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_8_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_8_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_9_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_9_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_9_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_9_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_9_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_9_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_10_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_10_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_10_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_10_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_10_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_10_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_11_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_11_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_11_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_11_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_11_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_11_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_12_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_12_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_12_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_12_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_12_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_12_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_13_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_13_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_13_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_13_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_13_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_13_id_stage3;
    tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_14_dist_stage1; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/2 , TOP> PE_14_id_stage1; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_14_dist_stage2; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/4 , TOP> PE_14_id_stage2; tapa::streams<float, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_14_dist_stage3; tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W/8 , TOP> PE_14_id_stage3;
    tapa::task()
        .invoke( load_KNN, 0, in_0, load_to_compute_stream[0])
        .invoke( load_KNN, 1, in_1, load_to_compute_stream[1])
        .invoke( load_KNN, 2, in_2, load_to_compute_stream[2])
        .invoke( load_KNN, 3, in_3, load_to_compute_stream[3])
        .invoke( load_KNN, 4, in_4, load_to_compute_stream[4])
        .invoke( load_KNN, 5, in_5, load_to_compute_stream[5])
        .invoke( load_KNN, 6, in_6, load_to_compute_stream[6])
        .invoke( load_KNN, 7, in_7, load_to_compute_stream[7])
        .invoke( load_KNN, 8, in_8, load_to_compute_stream[8])
        .invoke( load_KNN, 9, in_9, load_to_compute_stream[9])
        .invoke( load_KNN, 10, in_10, load_to_compute_stream[10])
        .invoke( load_KNN, 11, in_11, load_to_compute_stream[11])
        .invoke( load_KNN, 12, in_12, load_to_compute_stream[12])
        .invoke( load_KNN, 13, in_13, load_to_compute_stream[13])
        .invoke( load_KNN, 14, in_14, load_to_compute_stream[14])
        .invoke( compute_KNN, 0, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*0, load_to_compute_stream[0 ], compute_to_sort_stream_0 )
        .invoke( compute_KNN, 1, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*1, load_to_compute_stream[1 ], compute_to_sort_stream_1 )
        .invoke( compute_KNN, 2, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*2, load_to_compute_stream[2 ], compute_to_sort_stream_2 )
        .invoke( compute_KNN, 3, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*3, load_to_compute_stream[3 ], compute_to_sort_stream_3 )
        .invoke( compute_KNN, 4, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*4, load_to_compute_stream[4 ], compute_to_sort_stream_4 )
        .invoke( compute_KNN, 5, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*5, load_to_compute_stream[5 ], compute_to_sort_stream_5 )
        .invoke( compute_KNN, 6, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*6, load_to_compute_stream[6 ], compute_to_sort_stream_6 )
        .invoke( compute_KNN, 7, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*7, load_to_compute_stream[7 ], compute_to_sort_stream_7 )
        .invoke( compute_KNN, 8, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*8, load_to_compute_stream[8 ], compute_to_sort_stream_8 )
        .invoke( compute_KNN, 9, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*9, load_to_compute_stream[9 ], compute_to_sort_stream_9 )
        .invoke( compute_KNN, 10, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*10, load_to_compute_stream[10 ], compute_to_sort_stream_10 )
        .invoke( compute_KNN, 11, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*11, load_to_compute_stream[11 ], compute_to_sort_stream_11 )
        .invoke( compute_KNN, 12, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*12, load_to_compute_stream[12 ], compute_to_sort_stream_12 )
        .invoke( compute_KNN, 13, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*13, load_to_compute_stream[13 ], compute_to_sort_stream_13 )
        .invoke( compute_KNN, 14, (( (( ((4194304)-1)/(15) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*14, load_to_compute_stream[14 ], compute_to_sort_stream_14 )
        .invoke(para_partial_sort, 0, 0, compute_to_sort_stream_0[0], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 0, 1, compute_to_sort_stream_0[1], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 0, 2, compute_to_sort_stream_0[2], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 0, 3, compute_to_sort_stream_0[3], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 0, 4, compute_to_sort_stream_0[4], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 0, 5, compute_to_sort_stream_0[5], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 0, 6, compute_to_sort_stream_0[6], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 0, 7, compute_to_sort_stream_0[7], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 0, 8, compute_to_sort_stream_0[8], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 0, 9, compute_to_sort_stream_0[9], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 0, 10, compute_to_sort_stream_0[10], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 0, 11, compute_to_sort_stream_0[11], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 0, 12, compute_to_sort_stream_0[12], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 0, 13, compute_to_sort_stream_0[13], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 0, 14, compute_to_sort_stream_0[14], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 0, 15, compute_to_sort_stream_0[15], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 1, 0, compute_to_sort_stream_1[0], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 1, 1, compute_to_sort_stream_1[1], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 1, 2, compute_to_sort_stream_1[2], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 1, 3, compute_to_sort_stream_1[3], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 1, 4, compute_to_sort_stream_1[4], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 1, 5, compute_to_sort_stream_1[5], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 1, 6, compute_to_sort_stream_1[6], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 1, 7, compute_to_sort_stream_1[7], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 1, 8, compute_to_sort_stream_1[8], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 1, 9, compute_to_sort_stream_1[9], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 1, 10, compute_to_sort_stream_1[10], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 1, 11, compute_to_sort_stream_1[11], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 1, 12, compute_to_sort_stream_1[12], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 1, 13, compute_to_sort_stream_1[13], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 1, 14, compute_to_sort_stream_1[14], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 1, 15, compute_to_sort_stream_1[15], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 2, 0, compute_to_sort_stream_2[0], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 2, 1, compute_to_sort_stream_2[1], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 2, 2, compute_to_sort_stream_2[2], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 2, 3, compute_to_sort_stream_2[3], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 2, 4, compute_to_sort_stream_2[4], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 2, 5, compute_to_sort_stream_2[5], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 2, 6, compute_to_sort_stream_2[6], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 2, 7, compute_to_sort_stream_2[7], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 2, 8, compute_to_sort_stream_2[8], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 2, 9, compute_to_sort_stream_2[9], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 2, 10, compute_to_sort_stream_2[10], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 2, 11, compute_to_sort_stream_2[11], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 2, 12, compute_to_sort_stream_2[12], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 2, 13, compute_to_sort_stream_2[13], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 2, 14, compute_to_sort_stream_2[14], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 2, 15, compute_to_sort_stream_2[15], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 3, 0, compute_to_sort_stream_3[0], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 3, 1, compute_to_sort_stream_3[1], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 3, 2, compute_to_sort_stream_3[2], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 3, 3, compute_to_sort_stream_3[3], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 3, 4, compute_to_sort_stream_3[4], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 3, 5, compute_to_sort_stream_3[5], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 3, 6, compute_to_sort_stream_3[6], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 3, 7, compute_to_sort_stream_3[7], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 3, 8, compute_to_sort_stream_3[8], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 3, 9, compute_to_sort_stream_3[9], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 3, 10, compute_to_sort_stream_3[10], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 3, 11, compute_to_sort_stream_3[11], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 3, 12, compute_to_sort_stream_3[12], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 3, 13, compute_to_sort_stream_3[13], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 3, 14, compute_to_sort_stream_3[14], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 3, 15, compute_to_sort_stream_3[15], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 4, 0, compute_to_sort_stream_4[0], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 4, 1, compute_to_sort_stream_4[1], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 4, 2, compute_to_sort_stream_4[2], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 4, 3, compute_to_sort_stream_4[3], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 4, 4, compute_to_sort_stream_4[4], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 4, 5, compute_to_sort_stream_4[5], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 4, 6, compute_to_sort_stream_4[6], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 4, 7, compute_to_sort_stream_4[7], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 4, 8, compute_to_sort_stream_4[8], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 4, 9, compute_to_sort_stream_4[9], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 4, 10, compute_to_sort_stream_4[10], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 4, 11, compute_to_sort_stream_4[11], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 4, 12, compute_to_sort_stream_4[12], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 4, 13, compute_to_sort_stream_4[13], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 4, 14, compute_to_sort_stream_4[14], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 4, 15, compute_to_sort_stream_4[15], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 5, 0, compute_to_sort_stream_5[0], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 5, 1, compute_to_sort_stream_5[1], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 5, 2, compute_to_sort_stream_5[2], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 5, 3, compute_to_sort_stream_5[3], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 5, 4, compute_to_sort_stream_5[4], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 5, 5, compute_to_sort_stream_5[5], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 5, 6, compute_to_sort_stream_5[6], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 5, 7, compute_to_sort_stream_5[7], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 5, 8, compute_to_sort_stream_5[8], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 5, 9, compute_to_sort_stream_5[9], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 5, 10, compute_to_sort_stream_5[10], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 5, 11, compute_to_sort_stream_5[11], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 5, 12, compute_to_sort_stream_5[12], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 5, 13, compute_to_sort_stream_5[13], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 5, 14, compute_to_sort_stream_5[14], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 5, 15, compute_to_sort_stream_5[15], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 6, 0, compute_to_sort_stream_6[0], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 6, 1, compute_to_sort_stream_6[1], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 6, 2, compute_to_sort_stream_6[2], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 6, 3, compute_to_sort_stream_6[3], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 6, 4, compute_to_sort_stream_6[4], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 6, 5, compute_to_sort_stream_6[5], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 6, 6, compute_to_sort_stream_6[6], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 6, 7, compute_to_sort_stream_6[7], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 6, 8, compute_to_sort_stream_6[8], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 6, 9, compute_to_sort_stream_6[9], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 6, 10, compute_to_sort_stream_6[10], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 6, 11, compute_to_sort_stream_6[11], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 6, 12, compute_to_sort_stream_6[12], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 6, 13, compute_to_sort_stream_6[13], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 6, 14, compute_to_sort_stream_6[14], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 6, 15, compute_to_sort_stream_6[15], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 7, 0, compute_to_sort_stream_7[0], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 7, 1, compute_to_sort_stream_7[1], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 7, 2, compute_to_sort_stream_7[2], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 7, 3, compute_to_sort_stream_7[3], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 7, 4, compute_to_sort_stream_7[4], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 7, 5, compute_to_sort_stream_7[5], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 7, 6, compute_to_sort_stream_7[6], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 7, 7, compute_to_sort_stream_7[7], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 7, 8, compute_to_sort_stream_7[8], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 7, 9, compute_to_sort_stream_7[9], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 7, 10, compute_to_sort_stream_7[10], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 7, 11, compute_to_sort_stream_7[11], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 7, 12, compute_to_sort_stream_7[12], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 7, 13, compute_to_sort_stream_7[13], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 7, 14, compute_to_sort_stream_7[14], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 7, 15, compute_to_sort_stream_7[15], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 8, 0, compute_to_sort_stream_8[0], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 8, 1, compute_to_sort_stream_8[1], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 8, 2, compute_to_sort_stream_8[2], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 8, 3, compute_to_sort_stream_8[3], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 8, 4, compute_to_sort_stream_8[4], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 8, 5, compute_to_sort_stream_8[5], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 8, 6, compute_to_sort_stream_8[6], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 8, 7, compute_to_sort_stream_8[7], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 8, 8, compute_to_sort_stream_8[8], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 8, 9, compute_to_sort_stream_8[9], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 8, 10, compute_to_sort_stream_8[10], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 8, 11, compute_to_sort_stream_8[11], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 8, 12, compute_to_sort_stream_8[12], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 8, 13, compute_to_sort_stream_8[13], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 8, 14, compute_to_sort_stream_8[14], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 8, 15, compute_to_sort_stream_8[15], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 9, 0, compute_to_sort_stream_9[0], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 9, 1, compute_to_sort_stream_9[1], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 9, 2, compute_to_sort_stream_9[2], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 9, 3, compute_to_sort_stream_9[3], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 9, 4, compute_to_sort_stream_9[4], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 9, 5, compute_to_sort_stream_9[5], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 9, 6, compute_to_sort_stream_9[6], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 9, 7, compute_to_sort_stream_9[7], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 9, 8, compute_to_sort_stream_9[8], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 9, 9, compute_to_sort_stream_9[9], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 9, 10, compute_to_sort_stream_9[10], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 9, 11, compute_to_sort_stream_9[11], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 9, 12, compute_to_sort_stream_9[12], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 9, 13, compute_to_sort_stream_9[13], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 9, 14, compute_to_sort_stream_9[14], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 9, 15, compute_to_sort_stream_9[15], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 10, 0, compute_to_sort_stream_10[0], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 10, 1, compute_to_sort_stream_10[1], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 10, 2, compute_to_sort_stream_10[2], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 10, 3, compute_to_sort_stream_10[3], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 10, 4, compute_to_sort_stream_10[4], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 10, 5, compute_to_sort_stream_10[5], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 10, 6, compute_to_sort_stream_10[6], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 10, 7, compute_to_sort_stream_10[7], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 10, 8, compute_to_sort_stream_10[8], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 10, 9, compute_to_sort_stream_10[9], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 10, 10, compute_to_sort_stream_10[10], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 10, 11, compute_to_sort_stream_10[11], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 10, 12, compute_to_sort_stream_10[12], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 10, 13, compute_to_sort_stream_10[13], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 10, 14, compute_to_sort_stream_10[14], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 10, 15, compute_to_sort_stream_10[15], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 11, 0, compute_to_sort_stream_11[0], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 11, 1, compute_to_sort_stream_11[1], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 11, 2, compute_to_sort_stream_11[2], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 11, 3, compute_to_sort_stream_11[3], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 11, 4, compute_to_sort_stream_11[4], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 11, 5, compute_to_sort_stream_11[5], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 11, 6, compute_to_sort_stream_11[6], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 11, 7, compute_to_sort_stream_11[7], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 11, 8, compute_to_sort_stream_11[8], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 11, 9, compute_to_sort_stream_11[9], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 11, 10, compute_to_sort_stream_11[10], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 11, 11, compute_to_sort_stream_11[11], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 11, 12, compute_to_sort_stream_11[12], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 11, 13, compute_to_sort_stream_11[13], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 11, 14, compute_to_sort_stream_11[14], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 11, 15, compute_to_sort_stream_11[15], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 12, 0, compute_to_sort_stream_12[0], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 12, 1, compute_to_sort_stream_12[1], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 12, 2, compute_to_sort_stream_12[2], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 12, 3, compute_to_sort_stream_12[3], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 12, 4, compute_to_sort_stream_12[4], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 12, 5, compute_to_sort_stream_12[5], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 12, 6, compute_to_sort_stream_12[6], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 12, 7, compute_to_sort_stream_12[7], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 12, 8, compute_to_sort_stream_12[8], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 12, 9, compute_to_sort_stream_12[9], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 12, 10, compute_to_sort_stream_12[10], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 12, 11, compute_to_sort_stream_12[11], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 12, 12, compute_to_sort_stream_12[12], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 12, 13, compute_to_sort_stream_12[13], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 12, 14, compute_to_sort_stream_12[14], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 12, 15, compute_to_sort_stream_12[15], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 13, 0, compute_to_sort_stream_13[0], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 13, 1, compute_to_sort_stream_13[1], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 13, 2, compute_to_sort_stream_13[2], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 13, 3, compute_to_sort_stream_13[3], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 13, 4, compute_to_sort_stream_13[4], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 13, 5, compute_to_sort_stream_13[5], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 13, 6, compute_to_sort_stream_13[6], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 13, 7, compute_to_sort_stream_13[7], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 13, 8, compute_to_sort_stream_13[8], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 13, 9, compute_to_sort_stream_13[9], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 13, 10, compute_to_sort_stream_13[10], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 13, 11, compute_to_sort_stream_13[11], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 13, 12, compute_to_sort_stream_13[12], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 13, 13, compute_to_sort_stream_13[13], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 13, 14, compute_to_sort_stream_13[14], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 13, 15, compute_to_sort_stream_13[15], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*15 + 0] )
        .invoke(para_partial_sort, 14, 0, compute_to_sort_stream_14[0], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 14, 1, compute_to_sort_stream_14[1], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*1 + 0] ) .invoke(para_partial_sort, 14, 2, compute_to_sort_stream_14[2], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*2 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*2 + 0] ) .invoke(para_partial_sort, 14, 3, compute_to_sort_stream_14[3], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*3 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*3 + 0] ) .invoke(para_partial_sort, 14, 4, compute_to_sort_stream_14[4], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*4 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*4 + 0] ) .invoke(para_partial_sort, 14, 5, compute_to_sort_stream_14[5], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*5 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*5 + 0] ) .invoke(para_partial_sort, 14, 6, compute_to_sort_stream_14[6], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*6 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*6 + 0] ) .invoke(para_partial_sort, 14, 7, compute_to_sort_stream_14[7], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*7 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*7 + 0] ) .invoke(para_partial_sort, 14, 8, compute_to_sort_stream_14[8], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*8 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*8 + 0] ) .invoke(para_partial_sort, 14, 9, compute_to_sort_stream_14[9], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*9 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*9 + 0] ) .invoke(para_partial_sort, 14, 10, compute_to_sort_stream_14[10], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*10 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*10 + 0] ) .invoke(para_partial_sort, 14, 11, compute_to_sort_stream_14[11], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*11 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*11 + 0] ) .invoke(para_partial_sort, 14, 12, compute_to_sort_stream_14[12], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*12 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*12 + 0] ) .invoke(para_partial_sort, 14, 13, compute_to_sort_stream_14[13], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*13 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*13 + 0] ) .invoke(para_partial_sort, 14, 14, compute_to_sort_stream_14[14], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*14 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*14 + 0] ) .invoke(para_partial_sort, 14, 15, compute_to_sort_stream_14[15], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*15 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*15 + 0] )
        .invoke(merge_dual_streams, 0, 0, 1, sort_to_hiermerge_dist_stream_0[0], sort_to_hiermerge_id_stream_0 [0], sort_to_hiermerge_dist_stream_0[1], sort_to_hiermerge_id_stream_0 [1], PE_0_dist_stage1[0], PE_0_id_stage1[0]) .invoke(merge_dual_streams, 0, 2, 1, sort_to_hiermerge_dist_stream_0[2], sort_to_hiermerge_id_stream_0 [2], sort_to_hiermerge_dist_stream_0[3], sort_to_hiermerge_id_stream_0 [3], PE_0_dist_stage1[1], PE_0_id_stage1[1]) .invoke(merge_dual_streams, 0, 4, 1, sort_to_hiermerge_dist_stream_0[4], sort_to_hiermerge_id_stream_0 [4], sort_to_hiermerge_dist_stream_0[5], sort_to_hiermerge_id_stream_0 [5], PE_0_dist_stage1[2], PE_0_id_stage1[2]) .invoke(merge_dual_streams, 0, 6, 1, sort_to_hiermerge_dist_stream_0[6], sort_to_hiermerge_id_stream_0 [6], sort_to_hiermerge_dist_stream_0[7], sort_to_hiermerge_id_stream_0 [7], PE_0_dist_stage1[3], PE_0_id_stage1[3]) .invoke(merge_dual_streams, 0, 8, 1, sort_to_hiermerge_dist_stream_0[8], sort_to_hiermerge_id_stream_0 [8], sort_to_hiermerge_dist_stream_0[9], sort_to_hiermerge_id_stream_0 [9], PE_0_dist_stage1[4], PE_0_id_stage1[4]) .invoke(merge_dual_streams, 0, 10, 1, sort_to_hiermerge_dist_stream_0[10], sort_to_hiermerge_id_stream_0 [10], sort_to_hiermerge_dist_stream_0[11], sort_to_hiermerge_id_stream_0 [11], PE_0_dist_stage1[5], PE_0_id_stage1[5]) .invoke(merge_dual_streams, 0, 12, 1, sort_to_hiermerge_dist_stream_0[12], sort_to_hiermerge_id_stream_0 [12], sort_to_hiermerge_dist_stream_0[13], sort_to_hiermerge_id_stream_0 [13], PE_0_dist_stage1[6], PE_0_id_stage1[6]) .invoke(merge_dual_streams, 0, 14, 1, sort_to_hiermerge_dist_stream_0[14], sort_to_hiermerge_id_stream_0 [14], sort_to_hiermerge_dist_stream_0[15], sort_to_hiermerge_id_stream_0 [15], PE_0_dist_stage1[7], PE_0_id_stage1[7]) .invoke(merge_dual_streams, 0, 0, 2, PE_0_dist_stage1[0], PE_0_id_stage1[0], PE_0_dist_stage1[1], PE_0_id_stage1[1], PE_0_dist_stage2[0], PE_0_id_stage2[0]) .invoke(merge_dual_streams, 0, 2, 2, PE_0_dist_stage1[2], PE_0_id_stage1[2], PE_0_dist_stage1[3], PE_0_id_stage1[3], PE_0_dist_stage2[1], PE_0_id_stage2[1]) .invoke(merge_dual_streams, 0, 4, 2, PE_0_dist_stage1[4], PE_0_id_stage1[4], PE_0_dist_stage1[5], PE_0_id_stage1[5], PE_0_dist_stage2[2], PE_0_id_stage2[2]) .invoke(merge_dual_streams, 0, 6, 2, PE_0_dist_stage1[6], PE_0_id_stage1[6], PE_0_dist_stage1[7], PE_0_id_stage1[7], PE_0_dist_stage2[3], PE_0_id_stage2[3]) .invoke(merge_dual_streams, 0, 0, 3, PE_0_dist_stage2[0], PE_0_id_stage2[0], PE_0_dist_stage2[1], PE_0_id_stage2[1], PE_0_dist_stage3[0], PE_0_id_stage3[0]) .invoke(merge_dual_streams, 0, 2, 3, PE_0_dist_stage2[2], PE_0_id_stage2[2], PE_0_dist_stage2[3], PE_0_id_stage2[3], PE_0_dist_stage3[1], PE_0_id_stage3[1]) .invoke(merge_dual_streams, 0, 0, 4, PE_0_dist_stage3[0], PE_0_id_stage3[0], PE_0_dist_stage3[1], PE_0_id_stage3[1], L0_out_dist[0],L0_out_id[0])
        .invoke(merge_dual_streams, 1, 0, 1, sort_to_hiermerge_dist_stream_1[0], sort_to_hiermerge_id_stream_1 [0], sort_to_hiermerge_dist_stream_1[1], sort_to_hiermerge_id_stream_1 [1], PE_1_dist_stage1[0], PE_1_id_stage1[0]) .invoke(merge_dual_streams, 1, 2, 1, sort_to_hiermerge_dist_stream_1[2], sort_to_hiermerge_id_stream_1 [2], sort_to_hiermerge_dist_stream_1[3], sort_to_hiermerge_id_stream_1 [3], PE_1_dist_stage1[1], PE_1_id_stage1[1]) .invoke(merge_dual_streams, 1, 4, 1, sort_to_hiermerge_dist_stream_1[4], sort_to_hiermerge_id_stream_1 [4], sort_to_hiermerge_dist_stream_1[5], sort_to_hiermerge_id_stream_1 [5], PE_1_dist_stage1[2], PE_1_id_stage1[2]) .invoke(merge_dual_streams, 1, 6, 1, sort_to_hiermerge_dist_stream_1[6], sort_to_hiermerge_id_stream_1 [6], sort_to_hiermerge_dist_stream_1[7], sort_to_hiermerge_id_stream_1 [7], PE_1_dist_stage1[3], PE_1_id_stage1[3]) .invoke(merge_dual_streams, 1, 8, 1, sort_to_hiermerge_dist_stream_1[8], sort_to_hiermerge_id_stream_1 [8], sort_to_hiermerge_dist_stream_1[9], sort_to_hiermerge_id_stream_1 [9], PE_1_dist_stage1[4], PE_1_id_stage1[4]) .invoke(merge_dual_streams, 1, 10, 1, sort_to_hiermerge_dist_stream_1[10], sort_to_hiermerge_id_stream_1 [10], sort_to_hiermerge_dist_stream_1[11], sort_to_hiermerge_id_stream_1 [11], PE_1_dist_stage1[5], PE_1_id_stage1[5]) .invoke(merge_dual_streams, 1, 12, 1, sort_to_hiermerge_dist_stream_1[12], sort_to_hiermerge_id_stream_1 [12], sort_to_hiermerge_dist_stream_1[13], sort_to_hiermerge_id_stream_1 [13], PE_1_dist_stage1[6], PE_1_id_stage1[6]) .invoke(merge_dual_streams, 1, 14, 1, sort_to_hiermerge_dist_stream_1[14], sort_to_hiermerge_id_stream_1 [14], sort_to_hiermerge_dist_stream_1[15], sort_to_hiermerge_id_stream_1 [15], PE_1_dist_stage1[7], PE_1_id_stage1[7]) .invoke(merge_dual_streams, 1, 0, 2, PE_1_dist_stage1[0], PE_1_id_stage1[0], PE_1_dist_stage1[1], PE_1_id_stage1[1], PE_1_dist_stage2[0], PE_1_id_stage2[0]) .invoke(merge_dual_streams, 1, 2, 2, PE_1_dist_stage1[2], PE_1_id_stage1[2], PE_1_dist_stage1[3], PE_1_id_stage1[3], PE_1_dist_stage2[1], PE_1_id_stage2[1]) .invoke(merge_dual_streams, 1, 4, 2, PE_1_dist_stage1[4], PE_1_id_stage1[4], PE_1_dist_stage1[5], PE_1_id_stage1[5], PE_1_dist_stage2[2], PE_1_id_stage2[2]) .invoke(merge_dual_streams, 1, 6, 2, PE_1_dist_stage1[6], PE_1_id_stage1[6], PE_1_dist_stage1[7], PE_1_id_stage1[7], PE_1_dist_stage2[3], PE_1_id_stage2[3]) .invoke(merge_dual_streams, 1, 0, 3, PE_1_dist_stage2[0], PE_1_id_stage2[0], PE_1_dist_stage2[1], PE_1_id_stage2[1], PE_1_dist_stage3[0], PE_1_id_stage3[0]) .invoke(merge_dual_streams, 1, 2, 3, PE_1_dist_stage2[2], PE_1_id_stage2[2], PE_1_dist_stage2[3], PE_1_id_stage2[3], PE_1_dist_stage3[1], PE_1_id_stage3[1]) .invoke(merge_dual_streams, 1, 0, 4, PE_1_dist_stage3[0], PE_1_id_stage3[0], PE_1_dist_stage3[1], PE_1_id_stage3[1], L0_out_dist[1],L0_out_id[1])
        .invoke(merge_dual_streams, 2, 0, 1, sort_to_hiermerge_dist_stream_2[0], sort_to_hiermerge_id_stream_2 [0], sort_to_hiermerge_dist_stream_2[1], sort_to_hiermerge_id_stream_2 [1], PE_2_dist_stage1[0], PE_2_id_stage1[0]) .invoke(merge_dual_streams, 2, 2, 1, sort_to_hiermerge_dist_stream_2[2], sort_to_hiermerge_id_stream_2 [2], sort_to_hiermerge_dist_stream_2[3], sort_to_hiermerge_id_stream_2 [3], PE_2_dist_stage1[1], PE_2_id_stage1[1]) .invoke(merge_dual_streams, 2, 4, 1, sort_to_hiermerge_dist_stream_2[4], sort_to_hiermerge_id_stream_2 [4], sort_to_hiermerge_dist_stream_2[5], sort_to_hiermerge_id_stream_2 [5], PE_2_dist_stage1[2], PE_2_id_stage1[2]) .invoke(merge_dual_streams, 2, 6, 1, sort_to_hiermerge_dist_stream_2[6], sort_to_hiermerge_id_stream_2 [6], sort_to_hiermerge_dist_stream_2[7], sort_to_hiermerge_id_stream_2 [7], PE_2_dist_stage1[3], PE_2_id_stage1[3]) .invoke(merge_dual_streams, 2, 8, 1, sort_to_hiermerge_dist_stream_2[8], sort_to_hiermerge_id_stream_2 [8], sort_to_hiermerge_dist_stream_2[9], sort_to_hiermerge_id_stream_2 [9], PE_2_dist_stage1[4], PE_2_id_stage1[4]) .invoke(merge_dual_streams, 2, 10, 1, sort_to_hiermerge_dist_stream_2[10], sort_to_hiermerge_id_stream_2 [10], sort_to_hiermerge_dist_stream_2[11], sort_to_hiermerge_id_stream_2 [11], PE_2_dist_stage1[5], PE_2_id_stage1[5]) .invoke(merge_dual_streams, 2, 12, 1, sort_to_hiermerge_dist_stream_2[12], sort_to_hiermerge_id_stream_2 [12], sort_to_hiermerge_dist_stream_2[13], sort_to_hiermerge_id_stream_2 [13], PE_2_dist_stage1[6], PE_2_id_stage1[6]) .invoke(merge_dual_streams, 2, 14, 1, sort_to_hiermerge_dist_stream_2[14], sort_to_hiermerge_id_stream_2 [14], sort_to_hiermerge_dist_stream_2[15], sort_to_hiermerge_id_stream_2 [15], PE_2_dist_stage1[7], PE_2_id_stage1[7]) .invoke(merge_dual_streams, 2, 0, 2, PE_2_dist_stage1[0], PE_2_id_stage1[0], PE_2_dist_stage1[1], PE_2_id_stage1[1], PE_2_dist_stage2[0], PE_2_id_stage2[0]) .invoke(merge_dual_streams, 2, 2, 2, PE_2_dist_stage1[2], PE_2_id_stage1[2], PE_2_dist_stage1[3], PE_2_id_stage1[3], PE_2_dist_stage2[1], PE_2_id_stage2[1]) .invoke(merge_dual_streams, 2, 4, 2, PE_2_dist_stage1[4], PE_2_id_stage1[4], PE_2_dist_stage1[5], PE_2_id_stage1[5], PE_2_dist_stage2[2], PE_2_id_stage2[2]) .invoke(merge_dual_streams, 2, 6, 2, PE_2_dist_stage1[6], PE_2_id_stage1[6], PE_2_dist_stage1[7], PE_2_id_stage1[7], PE_2_dist_stage2[3], PE_2_id_stage2[3]) .invoke(merge_dual_streams, 2, 0, 3, PE_2_dist_stage2[0], PE_2_id_stage2[0], PE_2_dist_stage2[1], PE_2_id_stage2[1], PE_2_dist_stage3[0], PE_2_id_stage3[0]) .invoke(merge_dual_streams, 2, 2, 3, PE_2_dist_stage2[2], PE_2_id_stage2[2], PE_2_dist_stage2[3], PE_2_id_stage2[3], PE_2_dist_stage3[1], PE_2_id_stage3[1]) .invoke(merge_dual_streams, 2, 0, 4, PE_2_dist_stage3[0], PE_2_id_stage3[0], PE_2_dist_stage3[1], PE_2_id_stage3[1], L0_out_dist[2],L0_out_id[2])
        .invoke(merge_dual_streams, 3, 0, 1, sort_to_hiermerge_dist_stream_3[0], sort_to_hiermerge_id_stream_3 [0], sort_to_hiermerge_dist_stream_3[1], sort_to_hiermerge_id_stream_3 [1], PE_3_dist_stage1[0], PE_3_id_stage1[0]) .invoke(merge_dual_streams, 3, 2, 1, sort_to_hiermerge_dist_stream_3[2], sort_to_hiermerge_id_stream_3 [2], sort_to_hiermerge_dist_stream_3[3], sort_to_hiermerge_id_stream_3 [3], PE_3_dist_stage1[1], PE_3_id_stage1[1]) .invoke(merge_dual_streams, 3, 4, 1, sort_to_hiermerge_dist_stream_3[4], sort_to_hiermerge_id_stream_3 [4], sort_to_hiermerge_dist_stream_3[5], sort_to_hiermerge_id_stream_3 [5], PE_3_dist_stage1[2], PE_3_id_stage1[2]) .invoke(merge_dual_streams, 3, 6, 1, sort_to_hiermerge_dist_stream_3[6], sort_to_hiermerge_id_stream_3 [6], sort_to_hiermerge_dist_stream_3[7], sort_to_hiermerge_id_stream_3 [7], PE_3_dist_stage1[3], PE_3_id_stage1[3]) .invoke(merge_dual_streams, 3, 8, 1, sort_to_hiermerge_dist_stream_3[8], sort_to_hiermerge_id_stream_3 [8], sort_to_hiermerge_dist_stream_3[9], sort_to_hiermerge_id_stream_3 [9], PE_3_dist_stage1[4], PE_3_id_stage1[4]) .invoke(merge_dual_streams, 3, 10, 1, sort_to_hiermerge_dist_stream_3[10], sort_to_hiermerge_id_stream_3 [10], sort_to_hiermerge_dist_stream_3[11], sort_to_hiermerge_id_stream_3 [11], PE_3_dist_stage1[5], PE_3_id_stage1[5]) .invoke(merge_dual_streams, 3, 12, 1, sort_to_hiermerge_dist_stream_3[12], sort_to_hiermerge_id_stream_3 [12], sort_to_hiermerge_dist_stream_3[13], sort_to_hiermerge_id_stream_3 [13], PE_3_dist_stage1[6], PE_3_id_stage1[6]) .invoke(merge_dual_streams, 3, 14, 1, sort_to_hiermerge_dist_stream_3[14], sort_to_hiermerge_id_stream_3 [14], sort_to_hiermerge_dist_stream_3[15], sort_to_hiermerge_id_stream_3 [15], PE_3_dist_stage1[7], PE_3_id_stage1[7]) .invoke(merge_dual_streams, 3, 0, 2, PE_3_dist_stage1[0], PE_3_id_stage1[0], PE_3_dist_stage1[1], PE_3_id_stage1[1], PE_3_dist_stage2[0], PE_3_id_stage2[0]) .invoke(merge_dual_streams, 3, 2, 2, PE_3_dist_stage1[2], PE_3_id_stage1[2], PE_3_dist_stage1[3], PE_3_id_stage1[3], PE_3_dist_stage2[1], PE_3_id_stage2[1]) .invoke(merge_dual_streams, 3, 4, 2, PE_3_dist_stage1[4], PE_3_id_stage1[4], PE_3_dist_stage1[5], PE_3_id_stage1[5], PE_3_dist_stage2[2], PE_3_id_stage2[2]) .invoke(merge_dual_streams, 3, 6, 2, PE_3_dist_stage1[6], PE_3_id_stage1[6], PE_3_dist_stage1[7], PE_3_id_stage1[7], PE_3_dist_stage2[3], PE_3_id_stage2[3]) .invoke(merge_dual_streams, 3, 0, 3, PE_3_dist_stage2[0], PE_3_id_stage2[0], PE_3_dist_stage2[1], PE_3_id_stage2[1], PE_3_dist_stage3[0], PE_3_id_stage3[0]) .invoke(merge_dual_streams, 3, 2, 3, PE_3_dist_stage2[2], PE_3_id_stage2[2], PE_3_dist_stage2[3], PE_3_id_stage2[3], PE_3_dist_stage3[1], PE_3_id_stage3[1]) .invoke(merge_dual_streams, 3, 0, 4, PE_3_dist_stage3[0], PE_3_id_stage3[0], PE_3_dist_stage3[1], PE_3_id_stage3[1], L0_out_dist[3],L0_out_id[3])
        .invoke(merge_dual_streams, 4, 0, 1, sort_to_hiermerge_dist_stream_4[0], sort_to_hiermerge_id_stream_4 [0], sort_to_hiermerge_dist_stream_4[1], sort_to_hiermerge_id_stream_4 [1], PE_4_dist_stage1[0], PE_4_id_stage1[0]) .invoke(merge_dual_streams, 4, 2, 1, sort_to_hiermerge_dist_stream_4[2], sort_to_hiermerge_id_stream_4 [2], sort_to_hiermerge_dist_stream_4[3], sort_to_hiermerge_id_stream_4 [3], PE_4_dist_stage1[1], PE_4_id_stage1[1]) .invoke(merge_dual_streams, 4, 4, 1, sort_to_hiermerge_dist_stream_4[4], sort_to_hiermerge_id_stream_4 [4], sort_to_hiermerge_dist_stream_4[5], sort_to_hiermerge_id_stream_4 [5], PE_4_dist_stage1[2], PE_4_id_stage1[2]) .invoke(merge_dual_streams, 4, 6, 1, sort_to_hiermerge_dist_stream_4[6], sort_to_hiermerge_id_stream_4 [6], sort_to_hiermerge_dist_stream_4[7], sort_to_hiermerge_id_stream_4 [7], PE_4_dist_stage1[3], PE_4_id_stage1[3]) .invoke(merge_dual_streams, 4, 8, 1, sort_to_hiermerge_dist_stream_4[8], sort_to_hiermerge_id_stream_4 [8], sort_to_hiermerge_dist_stream_4[9], sort_to_hiermerge_id_stream_4 [9], PE_4_dist_stage1[4], PE_4_id_stage1[4]) .invoke(merge_dual_streams, 4, 10, 1, sort_to_hiermerge_dist_stream_4[10], sort_to_hiermerge_id_stream_4 [10], sort_to_hiermerge_dist_stream_4[11], sort_to_hiermerge_id_stream_4 [11], PE_4_dist_stage1[5], PE_4_id_stage1[5]) .invoke(merge_dual_streams, 4, 12, 1, sort_to_hiermerge_dist_stream_4[12], sort_to_hiermerge_id_stream_4 [12], sort_to_hiermerge_dist_stream_4[13], sort_to_hiermerge_id_stream_4 [13], PE_4_dist_stage1[6], PE_4_id_stage1[6]) .invoke(merge_dual_streams, 4, 14, 1, sort_to_hiermerge_dist_stream_4[14], sort_to_hiermerge_id_stream_4 [14], sort_to_hiermerge_dist_stream_4[15], sort_to_hiermerge_id_stream_4 [15], PE_4_dist_stage1[7], PE_4_id_stage1[7]) .invoke(merge_dual_streams, 4, 0, 2, PE_4_dist_stage1[0], PE_4_id_stage1[0], PE_4_dist_stage1[1], PE_4_id_stage1[1], PE_4_dist_stage2[0], PE_4_id_stage2[0]) .invoke(merge_dual_streams, 4, 2, 2, PE_4_dist_stage1[2], PE_4_id_stage1[2], PE_4_dist_stage1[3], PE_4_id_stage1[3], PE_4_dist_stage2[1], PE_4_id_stage2[1]) .invoke(merge_dual_streams, 4, 4, 2, PE_4_dist_stage1[4], PE_4_id_stage1[4], PE_4_dist_stage1[5], PE_4_id_stage1[5], PE_4_dist_stage2[2], PE_4_id_stage2[2]) .invoke(merge_dual_streams, 4, 6, 2, PE_4_dist_stage1[6], PE_4_id_stage1[6], PE_4_dist_stage1[7], PE_4_id_stage1[7], PE_4_dist_stage2[3], PE_4_id_stage2[3]) .invoke(merge_dual_streams, 4, 0, 3, PE_4_dist_stage2[0], PE_4_id_stage2[0], PE_4_dist_stage2[1], PE_4_id_stage2[1], PE_4_dist_stage3[0], PE_4_id_stage3[0]) .invoke(merge_dual_streams, 4, 2, 3, PE_4_dist_stage2[2], PE_4_id_stage2[2], PE_4_dist_stage2[3], PE_4_id_stage2[3], PE_4_dist_stage3[1], PE_4_id_stage3[1]) .invoke(merge_dual_streams, 4, 0, 4, PE_4_dist_stage3[0], PE_4_id_stage3[0], PE_4_dist_stage3[1], PE_4_id_stage3[1], L0_out_dist[4],L0_out_id[4])
        .invoke(merge_dual_streams, 5, 0, 1, sort_to_hiermerge_dist_stream_5[0], sort_to_hiermerge_id_stream_5 [0], sort_to_hiermerge_dist_stream_5[1], sort_to_hiermerge_id_stream_5 [1], PE_5_dist_stage1[0], PE_5_id_stage1[0]) .invoke(merge_dual_streams, 5, 2, 1, sort_to_hiermerge_dist_stream_5[2], sort_to_hiermerge_id_stream_5 [2], sort_to_hiermerge_dist_stream_5[3], sort_to_hiermerge_id_stream_5 [3], PE_5_dist_stage1[1], PE_5_id_stage1[1]) .invoke(merge_dual_streams, 5, 4, 1, sort_to_hiermerge_dist_stream_5[4], sort_to_hiermerge_id_stream_5 [4], sort_to_hiermerge_dist_stream_5[5], sort_to_hiermerge_id_stream_5 [5], PE_5_dist_stage1[2], PE_5_id_stage1[2]) .invoke(merge_dual_streams, 5, 6, 1, sort_to_hiermerge_dist_stream_5[6], sort_to_hiermerge_id_stream_5 [6], sort_to_hiermerge_dist_stream_5[7], sort_to_hiermerge_id_stream_5 [7], PE_5_dist_stage1[3], PE_5_id_stage1[3]) .invoke(merge_dual_streams, 5, 8, 1, sort_to_hiermerge_dist_stream_5[8], sort_to_hiermerge_id_stream_5 [8], sort_to_hiermerge_dist_stream_5[9], sort_to_hiermerge_id_stream_5 [9], PE_5_dist_stage1[4], PE_5_id_stage1[4]) .invoke(merge_dual_streams, 5, 10, 1, sort_to_hiermerge_dist_stream_5[10], sort_to_hiermerge_id_stream_5 [10], sort_to_hiermerge_dist_stream_5[11], sort_to_hiermerge_id_stream_5 [11], PE_5_dist_stage1[5], PE_5_id_stage1[5]) .invoke(merge_dual_streams, 5, 12, 1, sort_to_hiermerge_dist_stream_5[12], sort_to_hiermerge_id_stream_5 [12], sort_to_hiermerge_dist_stream_5[13], sort_to_hiermerge_id_stream_5 [13], PE_5_dist_stage1[6], PE_5_id_stage1[6]) .invoke(merge_dual_streams, 5, 14, 1, sort_to_hiermerge_dist_stream_5[14], sort_to_hiermerge_id_stream_5 [14], sort_to_hiermerge_dist_stream_5[15], sort_to_hiermerge_id_stream_5 [15], PE_5_dist_stage1[7], PE_5_id_stage1[7]) .invoke(merge_dual_streams, 5, 0, 2, PE_5_dist_stage1[0], PE_5_id_stage1[0], PE_5_dist_stage1[1], PE_5_id_stage1[1], PE_5_dist_stage2[0], PE_5_id_stage2[0]) .invoke(merge_dual_streams, 5, 2, 2, PE_5_dist_stage1[2], PE_5_id_stage1[2], PE_5_dist_stage1[3], PE_5_id_stage1[3], PE_5_dist_stage2[1], PE_5_id_stage2[1]) .invoke(merge_dual_streams, 5, 4, 2, PE_5_dist_stage1[4], PE_5_id_stage1[4], PE_5_dist_stage1[5], PE_5_id_stage1[5], PE_5_dist_stage2[2], PE_5_id_stage2[2]) .invoke(merge_dual_streams, 5, 6, 2, PE_5_dist_stage1[6], PE_5_id_stage1[6], PE_5_dist_stage1[7], PE_5_id_stage1[7], PE_5_dist_stage2[3], PE_5_id_stage2[3]) .invoke(merge_dual_streams, 5, 0, 3, PE_5_dist_stage2[0], PE_5_id_stage2[0], PE_5_dist_stage2[1], PE_5_id_stage2[1], PE_5_dist_stage3[0], PE_5_id_stage3[0]) .invoke(merge_dual_streams, 5, 2, 3, PE_5_dist_stage2[2], PE_5_id_stage2[2], PE_5_dist_stage2[3], PE_5_id_stage2[3], PE_5_dist_stage3[1], PE_5_id_stage3[1]) .invoke(merge_dual_streams, 5, 0, 4, PE_5_dist_stage3[0], PE_5_id_stage3[0], PE_5_dist_stage3[1], PE_5_id_stage3[1], L0_out_dist[5],L0_out_id[5])
        .invoke(merge_dual_streams, 6, 0, 1, sort_to_hiermerge_dist_stream_6[0], sort_to_hiermerge_id_stream_6 [0], sort_to_hiermerge_dist_stream_6[1], sort_to_hiermerge_id_stream_6 [1], PE_6_dist_stage1[0], PE_6_id_stage1[0]) .invoke(merge_dual_streams, 6, 2, 1, sort_to_hiermerge_dist_stream_6[2], sort_to_hiermerge_id_stream_6 [2], sort_to_hiermerge_dist_stream_6[3], sort_to_hiermerge_id_stream_6 [3], PE_6_dist_stage1[1], PE_6_id_stage1[1]) .invoke(merge_dual_streams, 6, 4, 1, sort_to_hiermerge_dist_stream_6[4], sort_to_hiermerge_id_stream_6 [4], sort_to_hiermerge_dist_stream_6[5], sort_to_hiermerge_id_stream_6 [5], PE_6_dist_stage1[2], PE_6_id_stage1[2]) .invoke(merge_dual_streams, 6, 6, 1, sort_to_hiermerge_dist_stream_6[6], sort_to_hiermerge_id_stream_6 [6], sort_to_hiermerge_dist_stream_6[7], sort_to_hiermerge_id_stream_6 [7], PE_6_dist_stage1[3], PE_6_id_stage1[3]) .invoke(merge_dual_streams, 6, 8, 1, sort_to_hiermerge_dist_stream_6[8], sort_to_hiermerge_id_stream_6 [8], sort_to_hiermerge_dist_stream_6[9], sort_to_hiermerge_id_stream_6 [9], PE_6_dist_stage1[4], PE_6_id_stage1[4]) .invoke(merge_dual_streams, 6, 10, 1, sort_to_hiermerge_dist_stream_6[10], sort_to_hiermerge_id_stream_6 [10], sort_to_hiermerge_dist_stream_6[11], sort_to_hiermerge_id_stream_6 [11], PE_6_dist_stage1[5], PE_6_id_stage1[5]) .invoke(merge_dual_streams, 6, 12, 1, sort_to_hiermerge_dist_stream_6[12], sort_to_hiermerge_id_stream_6 [12], sort_to_hiermerge_dist_stream_6[13], sort_to_hiermerge_id_stream_6 [13], PE_6_dist_stage1[6], PE_6_id_stage1[6]) .invoke(merge_dual_streams, 6, 14, 1, sort_to_hiermerge_dist_stream_6[14], sort_to_hiermerge_id_stream_6 [14], sort_to_hiermerge_dist_stream_6[15], sort_to_hiermerge_id_stream_6 [15], PE_6_dist_stage1[7], PE_6_id_stage1[7]) .invoke(merge_dual_streams, 6, 0, 2, PE_6_dist_stage1[0], PE_6_id_stage1[0], PE_6_dist_stage1[1], PE_6_id_stage1[1], PE_6_dist_stage2[0], PE_6_id_stage2[0]) .invoke(merge_dual_streams, 6, 2, 2, PE_6_dist_stage1[2], PE_6_id_stage1[2], PE_6_dist_stage1[3], PE_6_id_stage1[3], PE_6_dist_stage2[1], PE_6_id_stage2[1]) .invoke(merge_dual_streams, 6, 4, 2, PE_6_dist_stage1[4], PE_6_id_stage1[4], PE_6_dist_stage1[5], PE_6_id_stage1[5], PE_6_dist_stage2[2], PE_6_id_stage2[2]) .invoke(merge_dual_streams, 6, 6, 2, PE_6_dist_stage1[6], PE_6_id_stage1[6], PE_6_dist_stage1[7], PE_6_id_stage1[7], PE_6_dist_stage2[3], PE_6_id_stage2[3]) .invoke(merge_dual_streams, 6, 0, 3, PE_6_dist_stage2[0], PE_6_id_stage2[0], PE_6_dist_stage2[1], PE_6_id_stage2[1], PE_6_dist_stage3[0], PE_6_id_stage3[0]) .invoke(merge_dual_streams, 6, 2, 3, PE_6_dist_stage2[2], PE_6_id_stage2[2], PE_6_dist_stage2[3], PE_6_id_stage2[3], PE_6_dist_stage3[1], PE_6_id_stage3[1]) .invoke(merge_dual_streams, 6, 0, 4, PE_6_dist_stage3[0], PE_6_id_stage3[0], PE_6_dist_stage3[1], PE_6_id_stage3[1], L0_out_dist[6],L0_out_id[6])
        .invoke(merge_dual_streams, 7, 0, 1, sort_to_hiermerge_dist_stream_7[0], sort_to_hiermerge_id_stream_7 [0], sort_to_hiermerge_dist_stream_7[1], sort_to_hiermerge_id_stream_7 [1], PE_7_dist_stage1[0], PE_7_id_stage1[0]) .invoke(merge_dual_streams, 7, 2, 1, sort_to_hiermerge_dist_stream_7[2], sort_to_hiermerge_id_stream_7 [2], sort_to_hiermerge_dist_stream_7[3], sort_to_hiermerge_id_stream_7 [3], PE_7_dist_stage1[1], PE_7_id_stage1[1]) .invoke(merge_dual_streams, 7, 4, 1, sort_to_hiermerge_dist_stream_7[4], sort_to_hiermerge_id_stream_7 [4], sort_to_hiermerge_dist_stream_7[5], sort_to_hiermerge_id_stream_7 [5], PE_7_dist_stage1[2], PE_7_id_stage1[2]) .invoke(merge_dual_streams, 7, 6, 1, sort_to_hiermerge_dist_stream_7[6], sort_to_hiermerge_id_stream_7 [6], sort_to_hiermerge_dist_stream_7[7], sort_to_hiermerge_id_stream_7 [7], PE_7_dist_stage1[3], PE_7_id_stage1[3]) .invoke(merge_dual_streams, 7, 8, 1, sort_to_hiermerge_dist_stream_7[8], sort_to_hiermerge_id_stream_7 [8], sort_to_hiermerge_dist_stream_7[9], sort_to_hiermerge_id_stream_7 [9], PE_7_dist_stage1[4], PE_7_id_stage1[4]) .invoke(merge_dual_streams, 7, 10, 1, sort_to_hiermerge_dist_stream_7[10], sort_to_hiermerge_id_stream_7 [10], sort_to_hiermerge_dist_stream_7[11], sort_to_hiermerge_id_stream_7 [11], PE_7_dist_stage1[5], PE_7_id_stage1[5]) .invoke(merge_dual_streams, 7, 12, 1, sort_to_hiermerge_dist_stream_7[12], sort_to_hiermerge_id_stream_7 [12], sort_to_hiermerge_dist_stream_7[13], sort_to_hiermerge_id_stream_7 [13], PE_7_dist_stage1[6], PE_7_id_stage1[6]) .invoke(merge_dual_streams, 7, 14, 1, sort_to_hiermerge_dist_stream_7[14], sort_to_hiermerge_id_stream_7 [14], sort_to_hiermerge_dist_stream_7[15], sort_to_hiermerge_id_stream_7 [15], PE_7_dist_stage1[7], PE_7_id_stage1[7]) .invoke(merge_dual_streams, 7, 0, 2, PE_7_dist_stage1[0], PE_7_id_stage1[0], PE_7_dist_stage1[1], PE_7_id_stage1[1], PE_7_dist_stage2[0], PE_7_id_stage2[0]) .invoke(merge_dual_streams, 7, 2, 2, PE_7_dist_stage1[2], PE_7_id_stage1[2], PE_7_dist_stage1[3], PE_7_id_stage1[3], PE_7_dist_stage2[1], PE_7_id_stage2[1]) .invoke(merge_dual_streams, 7, 4, 2, PE_7_dist_stage1[4], PE_7_id_stage1[4], PE_7_dist_stage1[5], PE_7_id_stage1[5], PE_7_dist_stage2[2], PE_7_id_stage2[2]) .invoke(merge_dual_streams, 7, 6, 2, PE_7_dist_stage1[6], PE_7_id_stage1[6], PE_7_dist_stage1[7], PE_7_id_stage1[7], PE_7_dist_stage2[3], PE_7_id_stage2[3]) .invoke(merge_dual_streams, 7, 0, 3, PE_7_dist_stage2[0], PE_7_id_stage2[0], PE_7_dist_stage2[1], PE_7_id_stage2[1], PE_7_dist_stage3[0], PE_7_id_stage3[0]) .invoke(merge_dual_streams, 7, 2, 3, PE_7_dist_stage2[2], PE_7_id_stage2[2], PE_7_dist_stage2[3], PE_7_id_stage2[3], PE_7_dist_stage3[1], PE_7_id_stage3[1]) .invoke(merge_dual_streams, 7, 0, 4, PE_7_dist_stage3[0], PE_7_id_stage3[0], PE_7_dist_stage3[1], PE_7_id_stage3[1], L0_out_dist[7],L0_out_id[7])
        .invoke(merge_dual_streams, 8, 0, 1, sort_to_hiermerge_dist_stream_8[0], sort_to_hiermerge_id_stream_8 [0], sort_to_hiermerge_dist_stream_8[1], sort_to_hiermerge_id_stream_8 [1], PE_8_dist_stage1[0], PE_8_id_stage1[0]) .invoke(merge_dual_streams, 8, 2, 1, sort_to_hiermerge_dist_stream_8[2], sort_to_hiermerge_id_stream_8 [2], sort_to_hiermerge_dist_stream_8[3], sort_to_hiermerge_id_stream_8 [3], PE_8_dist_stage1[1], PE_8_id_stage1[1]) .invoke(merge_dual_streams, 8, 4, 1, sort_to_hiermerge_dist_stream_8[4], sort_to_hiermerge_id_stream_8 [4], sort_to_hiermerge_dist_stream_8[5], sort_to_hiermerge_id_stream_8 [5], PE_8_dist_stage1[2], PE_8_id_stage1[2]) .invoke(merge_dual_streams, 8, 6, 1, sort_to_hiermerge_dist_stream_8[6], sort_to_hiermerge_id_stream_8 [6], sort_to_hiermerge_dist_stream_8[7], sort_to_hiermerge_id_stream_8 [7], PE_8_dist_stage1[3], PE_8_id_stage1[3]) .invoke(merge_dual_streams, 8, 8, 1, sort_to_hiermerge_dist_stream_8[8], sort_to_hiermerge_id_stream_8 [8], sort_to_hiermerge_dist_stream_8[9], sort_to_hiermerge_id_stream_8 [9], PE_8_dist_stage1[4], PE_8_id_stage1[4]) .invoke(merge_dual_streams, 8, 10, 1, sort_to_hiermerge_dist_stream_8[10], sort_to_hiermerge_id_stream_8 [10], sort_to_hiermerge_dist_stream_8[11], sort_to_hiermerge_id_stream_8 [11], PE_8_dist_stage1[5], PE_8_id_stage1[5]) .invoke(merge_dual_streams, 8, 12, 1, sort_to_hiermerge_dist_stream_8[12], sort_to_hiermerge_id_stream_8 [12], sort_to_hiermerge_dist_stream_8[13], sort_to_hiermerge_id_stream_8 [13], PE_8_dist_stage1[6], PE_8_id_stage1[6]) .invoke(merge_dual_streams, 8, 14, 1, sort_to_hiermerge_dist_stream_8[14], sort_to_hiermerge_id_stream_8 [14], sort_to_hiermerge_dist_stream_8[15], sort_to_hiermerge_id_stream_8 [15], PE_8_dist_stage1[7], PE_8_id_stage1[7]) .invoke(merge_dual_streams, 8, 0, 2, PE_8_dist_stage1[0], PE_8_id_stage1[0], PE_8_dist_stage1[1], PE_8_id_stage1[1], PE_8_dist_stage2[0], PE_8_id_stage2[0]) .invoke(merge_dual_streams, 8, 2, 2, PE_8_dist_stage1[2], PE_8_id_stage1[2], PE_8_dist_stage1[3], PE_8_id_stage1[3], PE_8_dist_stage2[1], PE_8_id_stage2[1]) .invoke(merge_dual_streams, 8, 4, 2, PE_8_dist_stage1[4], PE_8_id_stage1[4], PE_8_dist_stage1[5], PE_8_id_stage1[5], PE_8_dist_stage2[2], PE_8_id_stage2[2]) .invoke(merge_dual_streams, 8, 6, 2, PE_8_dist_stage1[6], PE_8_id_stage1[6], PE_8_dist_stage1[7], PE_8_id_stage1[7], PE_8_dist_stage2[3], PE_8_id_stage2[3]) .invoke(merge_dual_streams, 8, 0, 3, PE_8_dist_stage2[0], PE_8_id_stage2[0], PE_8_dist_stage2[1], PE_8_id_stage2[1], PE_8_dist_stage3[0], PE_8_id_stage3[0]) .invoke(merge_dual_streams, 8, 2, 3, PE_8_dist_stage2[2], PE_8_id_stage2[2], PE_8_dist_stage2[3], PE_8_id_stage2[3], PE_8_dist_stage3[1], PE_8_id_stage3[1]) .invoke(merge_dual_streams, 8, 0, 4, PE_8_dist_stage3[0], PE_8_id_stage3[0], PE_8_dist_stage3[1], PE_8_id_stage3[1], L0_out_dist[8],L0_out_id[8])
        .invoke(merge_dual_streams, 9, 0, 1, sort_to_hiermerge_dist_stream_9[0], sort_to_hiermerge_id_stream_9 [0], sort_to_hiermerge_dist_stream_9[1], sort_to_hiermerge_id_stream_9 [1], PE_9_dist_stage1[0], PE_9_id_stage1[0]) .invoke(merge_dual_streams, 9, 2, 1, sort_to_hiermerge_dist_stream_9[2], sort_to_hiermerge_id_stream_9 [2], sort_to_hiermerge_dist_stream_9[3], sort_to_hiermerge_id_stream_9 [3], PE_9_dist_stage1[1], PE_9_id_stage1[1]) .invoke(merge_dual_streams, 9, 4, 1, sort_to_hiermerge_dist_stream_9[4], sort_to_hiermerge_id_stream_9 [4], sort_to_hiermerge_dist_stream_9[5], sort_to_hiermerge_id_stream_9 [5], PE_9_dist_stage1[2], PE_9_id_stage1[2]) .invoke(merge_dual_streams, 9, 6, 1, sort_to_hiermerge_dist_stream_9[6], sort_to_hiermerge_id_stream_9 [6], sort_to_hiermerge_dist_stream_9[7], sort_to_hiermerge_id_stream_9 [7], PE_9_dist_stage1[3], PE_9_id_stage1[3]) .invoke(merge_dual_streams, 9, 8, 1, sort_to_hiermerge_dist_stream_9[8], sort_to_hiermerge_id_stream_9 [8], sort_to_hiermerge_dist_stream_9[9], sort_to_hiermerge_id_stream_9 [9], PE_9_dist_stage1[4], PE_9_id_stage1[4]) .invoke(merge_dual_streams, 9, 10, 1, sort_to_hiermerge_dist_stream_9[10], sort_to_hiermerge_id_stream_9 [10], sort_to_hiermerge_dist_stream_9[11], sort_to_hiermerge_id_stream_9 [11], PE_9_dist_stage1[5], PE_9_id_stage1[5]) .invoke(merge_dual_streams, 9, 12, 1, sort_to_hiermerge_dist_stream_9[12], sort_to_hiermerge_id_stream_9 [12], sort_to_hiermerge_dist_stream_9[13], sort_to_hiermerge_id_stream_9 [13], PE_9_dist_stage1[6], PE_9_id_stage1[6]) .invoke(merge_dual_streams, 9, 14, 1, sort_to_hiermerge_dist_stream_9[14], sort_to_hiermerge_id_stream_9 [14], sort_to_hiermerge_dist_stream_9[15], sort_to_hiermerge_id_stream_9 [15], PE_9_dist_stage1[7], PE_9_id_stage1[7]) .invoke(merge_dual_streams, 9, 0, 2, PE_9_dist_stage1[0], PE_9_id_stage1[0], PE_9_dist_stage1[1], PE_9_id_stage1[1], PE_9_dist_stage2[0], PE_9_id_stage2[0]) .invoke(merge_dual_streams, 9, 2, 2, PE_9_dist_stage1[2], PE_9_id_stage1[2], PE_9_dist_stage1[3], PE_9_id_stage1[3], PE_9_dist_stage2[1], PE_9_id_stage2[1]) .invoke(merge_dual_streams, 9, 4, 2, PE_9_dist_stage1[4], PE_9_id_stage1[4], PE_9_dist_stage1[5], PE_9_id_stage1[5], PE_9_dist_stage2[2], PE_9_id_stage2[2]) .invoke(merge_dual_streams, 9, 6, 2, PE_9_dist_stage1[6], PE_9_id_stage1[6], PE_9_dist_stage1[7], PE_9_id_stage1[7], PE_9_dist_stage2[3], PE_9_id_stage2[3]) .invoke(merge_dual_streams, 9, 0, 3, PE_9_dist_stage2[0], PE_9_id_stage2[0], PE_9_dist_stage2[1], PE_9_id_stage2[1], PE_9_dist_stage3[0], PE_9_id_stage3[0]) .invoke(merge_dual_streams, 9, 2, 3, PE_9_dist_stage2[2], PE_9_id_stage2[2], PE_9_dist_stage2[3], PE_9_id_stage2[3], PE_9_dist_stage3[1], PE_9_id_stage3[1]) .invoke(merge_dual_streams, 9, 0, 4, PE_9_dist_stage3[0], PE_9_id_stage3[0], PE_9_dist_stage3[1], PE_9_id_stage3[1], L0_out_dist[9],L0_out_id[9])
        .invoke(merge_dual_streams, 10, 0, 1, sort_to_hiermerge_dist_stream_10[0], sort_to_hiermerge_id_stream_10 [0], sort_to_hiermerge_dist_stream_10[1], sort_to_hiermerge_id_stream_10 [1], PE_10_dist_stage1[0], PE_10_id_stage1[0]) .invoke(merge_dual_streams, 10, 2, 1, sort_to_hiermerge_dist_stream_10[2], sort_to_hiermerge_id_stream_10 [2], sort_to_hiermerge_dist_stream_10[3], sort_to_hiermerge_id_stream_10 [3], PE_10_dist_stage1[1], PE_10_id_stage1[1]) .invoke(merge_dual_streams, 10, 4, 1, sort_to_hiermerge_dist_stream_10[4], sort_to_hiermerge_id_stream_10 [4], sort_to_hiermerge_dist_stream_10[5], sort_to_hiermerge_id_stream_10 [5], PE_10_dist_stage1[2], PE_10_id_stage1[2]) .invoke(merge_dual_streams, 10, 6, 1, sort_to_hiermerge_dist_stream_10[6], sort_to_hiermerge_id_stream_10 [6], sort_to_hiermerge_dist_stream_10[7], sort_to_hiermerge_id_stream_10 [7], PE_10_dist_stage1[3], PE_10_id_stage1[3]) .invoke(merge_dual_streams, 10, 8, 1, sort_to_hiermerge_dist_stream_10[8], sort_to_hiermerge_id_stream_10 [8], sort_to_hiermerge_dist_stream_10[9], sort_to_hiermerge_id_stream_10 [9], PE_10_dist_stage1[4], PE_10_id_stage1[4]) .invoke(merge_dual_streams, 10, 10, 1, sort_to_hiermerge_dist_stream_10[10], sort_to_hiermerge_id_stream_10 [10], sort_to_hiermerge_dist_stream_10[11], sort_to_hiermerge_id_stream_10 [11], PE_10_dist_stage1[5], PE_10_id_stage1[5]) .invoke(merge_dual_streams, 10, 12, 1, sort_to_hiermerge_dist_stream_10[12], sort_to_hiermerge_id_stream_10 [12], sort_to_hiermerge_dist_stream_10[13], sort_to_hiermerge_id_stream_10 [13], PE_10_dist_stage1[6], PE_10_id_stage1[6]) .invoke(merge_dual_streams, 10, 14, 1, sort_to_hiermerge_dist_stream_10[14], sort_to_hiermerge_id_stream_10 [14], sort_to_hiermerge_dist_stream_10[15], sort_to_hiermerge_id_stream_10 [15], PE_10_dist_stage1[7], PE_10_id_stage1[7]) .invoke(merge_dual_streams, 10, 0, 2, PE_10_dist_stage1[0], PE_10_id_stage1[0], PE_10_dist_stage1[1], PE_10_id_stage1[1], PE_10_dist_stage2[0], PE_10_id_stage2[0]) .invoke(merge_dual_streams, 10, 2, 2, PE_10_dist_stage1[2], PE_10_id_stage1[2], PE_10_dist_stage1[3], PE_10_id_stage1[3], PE_10_dist_stage2[1], PE_10_id_stage2[1]) .invoke(merge_dual_streams, 10, 4, 2, PE_10_dist_stage1[4], PE_10_id_stage1[4], PE_10_dist_stage1[5], PE_10_id_stage1[5], PE_10_dist_stage2[2], PE_10_id_stage2[2]) .invoke(merge_dual_streams, 10, 6, 2, PE_10_dist_stage1[6], PE_10_id_stage1[6], PE_10_dist_stage1[7], PE_10_id_stage1[7], PE_10_dist_stage2[3], PE_10_id_stage2[3]) .invoke(merge_dual_streams, 10, 0, 3, PE_10_dist_stage2[0], PE_10_id_stage2[0], PE_10_dist_stage2[1], PE_10_id_stage2[1], PE_10_dist_stage3[0], PE_10_id_stage3[0]) .invoke(merge_dual_streams, 10, 2, 3, PE_10_dist_stage2[2], PE_10_id_stage2[2], PE_10_dist_stage2[3], PE_10_id_stage2[3], PE_10_dist_stage3[1], PE_10_id_stage3[1]) .invoke(merge_dual_streams, 10, 0, 4, PE_10_dist_stage3[0], PE_10_id_stage3[0], PE_10_dist_stage3[1], PE_10_id_stage3[1], L0_out_dist[10],L0_out_id[10])
        .invoke(merge_dual_streams, 11, 0, 1, sort_to_hiermerge_dist_stream_11[0], sort_to_hiermerge_id_stream_11 [0], sort_to_hiermerge_dist_stream_11[1], sort_to_hiermerge_id_stream_11 [1], PE_11_dist_stage1[0], PE_11_id_stage1[0]) .invoke(merge_dual_streams, 11, 2, 1, sort_to_hiermerge_dist_stream_11[2], sort_to_hiermerge_id_stream_11 [2], sort_to_hiermerge_dist_stream_11[3], sort_to_hiermerge_id_stream_11 [3], PE_11_dist_stage1[1], PE_11_id_stage1[1]) .invoke(merge_dual_streams, 11, 4, 1, sort_to_hiermerge_dist_stream_11[4], sort_to_hiermerge_id_stream_11 [4], sort_to_hiermerge_dist_stream_11[5], sort_to_hiermerge_id_stream_11 [5], PE_11_dist_stage1[2], PE_11_id_stage1[2]) .invoke(merge_dual_streams, 11, 6, 1, sort_to_hiermerge_dist_stream_11[6], sort_to_hiermerge_id_stream_11 [6], sort_to_hiermerge_dist_stream_11[7], sort_to_hiermerge_id_stream_11 [7], PE_11_dist_stage1[3], PE_11_id_stage1[3]) .invoke(merge_dual_streams, 11, 8, 1, sort_to_hiermerge_dist_stream_11[8], sort_to_hiermerge_id_stream_11 [8], sort_to_hiermerge_dist_stream_11[9], sort_to_hiermerge_id_stream_11 [9], PE_11_dist_stage1[4], PE_11_id_stage1[4]) .invoke(merge_dual_streams, 11, 10, 1, sort_to_hiermerge_dist_stream_11[10], sort_to_hiermerge_id_stream_11 [10], sort_to_hiermerge_dist_stream_11[11], sort_to_hiermerge_id_stream_11 [11], PE_11_dist_stage1[5], PE_11_id_stage1[5]) .invoke(merge_dual_streams, 11, 12, 1, sort_to_hiermerge_dist_stream_11[12], sort_to_hiermerge_id_stream_11 [12], sort_to_hiermerge_dist_stream_11[13], sort_to_hiermerge_id_stream_11 [13], PE_11_dist_stage1[6], PE_11_id_stage1[6]) .invoke(merge_dual_streams, 11, 14, 1, sort_to_hiermerge_dist_stream_11[14], sort_to_hiermerge_id_stream_11 [14], sort_to_hiermerge_dist_stream_11[15], sort_to_hiermerge_id_stream_11 [15], PE_11_dist_stage1[7], PE_11_id_stage1[7]) .invoke(merge_dual_streams, 11, 0, 2, PE_11_dist_stage1[0], PE_11_id_stage1[0], PE_11_dist_stage1[1], PE_11_id_stage1[1], PE_11_dist_stage2[0], PE_11_id_stage2[0]) .invoke(merge_dual_streams, 11, 2, 2, PE_11_dist_stage1[2], PE_11_id_stage1[2], PE_11_dist_stage1[3], PE_11_id_stage1[3], PE_11_dist_stage2[1], PE_11_id_stage2[1]) .invoke(merge_dual_streams, 11, 4, 2, PE_11_dist_stage1[4], PE_11_id_stage1[4], PE_11_dist_stage1[5], PE_11_id_stage1[5], PE_11_dist_stage2[2], PE_11_id_stage2[2]) .invoke(merge_dual_streams, 11, 6, 2, PE_11_dist_stage1[6], PE_11_id_stage1[6], PE_11_dist_stage1[7], PE_11_id_stage1[7], PE_11_dist_stage2[3], PE_11_id_stage2[3]) .invoke(merge_dual_streams, 11, 0, 3, PE_11_dist_stage2[0], PE_11_id_stage2[0], PE_11_dist_stage2[1], PE_11_id_stage2[1], PE_11_dist_stage3[0], PE_11_id_stage3[0]) .invoke(merge_dual_streams, 11, 2, 3, PE_11_dist_stage2[2], PE_11_id_stage2[2], PE_11_dist_stage2[3], PE_11_id_stage2[3], PE_11_dist_stage3[1], PE_11_id_stage3[1]) .invoke(merge_dual_streams, 11, 0, 4, PE_11_dist_stage3[0], PE_11_id_stage3[0], PE_11_dist_stage3[1], PE_11_id_stage3[1], L0_out_dist[11],L0_out_id[11])
        .invoke(merge_dual_streams, 12, 0, 1, sort_to_hiermerge_dist_stream_12[0], sort_to_hiermerge_id_stream_12 [0], sort_to_hiermerge_dist_stream_12[1], sort_to_hiermerge_id_stream_12 [1], PE_12_dist_stage1[0], PE_12_id_stage1[0]) .invoke(merge_dual_streams, 12, 2, 1, sort_to_hiermerge_dist_stream_12[2], sort_to_hiermerge_id_stream_12 [2], sort_to_hiermerge_dist_stream_12[3], sort_to_hiermerge_id_stream_12 [3], PE_12_dist_stage1[1], PE_12_id_stage1[1]) .invoke(merge_dual_streams, 12, 4, 1, sort_to_hiermerge_dist_stream_12[4], sort_to_hiermerge_id_stream_12 [4], sort_to_hiermerge_dist_stream_12[5], sort_to_hiermerge_id_stream_12 [5], PE_12_dist_stage1[2], PE_12_id_stage1[2]) .invoke(merge_dual_streams, 12, 6, 1, sort_to_hiermerge_dist_stream_12[6], sort_to_hiermerge_id_stream_12 [6], sort_to_hiermerge_dist_stream_12[7], sort_to_hiermerge_id_stream_12 [7], PE_12_dist_stage1[3], PE_12_id_stage1[3]) .invoke(merge_dual_streams, 12, 8, 1, sort_to_hiermerge_dist_stream_12[8], sort_to_hiermerge_id_stream_12 [8], sort_to_hiermerge_dist_stream_12[9], sort_to_hiermerge_id_stream_12 [9], PE_12_dist_stage1[4], PE_12_id_stage1[4]) .invoke(merge_dual_streams, 12, 10, 1, sort_to_hiermerge_dist_stream_12[10], sort_to_hiermerge_id_stream_12 [10], sort_to_hiermerge_dist_stream_12[11], sort_to_hiermerge_id_stream_12 [11], PE_12_dist_stage1[5], PE_12_id_stage1[5]) .invoke(merge_dual_streams, 12, 12, 1, sort_to_hiermerge_dist_stream_12[12], sort_to_hiermerge_id_stream_12 [12], sort_to_hiermerge_dist_stream_12[13], sort_to_hiermerge_id_stream_12 [13], PE_12_dist_stage1[6], PE_12_id_stage1[6]) .invoke(merge_dual_streams, 12, 14, 1, sort_to_hiermerge_dist_stream_12[14], sort_to_hiermerge_id_stream_12 [14], sort_to_hiermerge_dist_stream_12[15], sort_to_hiermerge_id_stream_12 [15], PE_12_dist_stage1[7], PE_12_id_stage1[7]) .invoke(merge_dual_streams, 12, 0, 2, PE_12_dist_stage1[0], PE_12_id_stage1[0], PE_12_dist_stage1[1], PE_12_id_stage1[1], PE_12_dist_stage2[0], PE_12_id_stage2[0]) .invoke(merge_dual_streams, 12, 2, 2, PE_12_dist_stage1[2], PE_12_id_stage1[2], PE_12_dist_stage1[3], PE_12_id_stage1[3], PE_12_dist_stage2[1], PE_12_id_stage2[1]) .invoke(merge_dual_streams, 12, 4, 2, PE_12_dist_stage1[4], PE_12_id_stage1[4], PE_12_dist_stage1[5], PE_12_id_stage1[5], PE_12_dist_stage2[2], PE_12_id_stage2[2]) .invoke(merge_dual_streams, 12, 6, 2, PE_12_dist_stage1[6], PE_12_id_stage1[6], PE_12_dist_stage1[7], PE_12_id_stage1[7], PE_12_dist_stage2[3], PE_12_id_stage2[3]) .invoke(merge_dual_streams, 12, 0, 3, PE_12_dist_stage2[0], PE_12_id_stage2[0], PE_12_dist_stage2[1], PE_12_id_stage2[1], PE_12_dist_stage3[0], PE_12_id_stage3[0]) .invoke(merge_dual_streams, 12, 2, 3, PE_12_dist_stage2[2], PE_12_id_stage2[2], PE_12_dist_stage2[3], PE_12_id_stage2[3], PE_12_dist_stage3[1], PE_12_id_stage3[1]) .invoke(merge_dual_streams, 12, 0, 4, PE_12_dist_stage3[0], PE_12_id_stage3[0], PE_12_dist_stage3[1], PE_12_id_stage3[1], L0_out_dist[12],L0_out_id[12])
        .invoke(merge_dual_streams, 13, 0, 1, sort_to_hiermerge_dist_stream_13[0], sort_to_hiermerge_id_stream_13 [0], sort_to_hiermerge_dist_stream_13[1], sort_to_hiermerge_id_stream_13 [1], PE_13_dist_stage1[0], PE_13_id_stage1[0]) .invoke(merge_dual_streams, 13, 2, 1, sort_to_hiermerge_dist_stream_13[2], sort_to_hiermerge_id_stream_13 [2], sort_to_hiermerge_dist_stream_13[3], sort_to_hiermerge_id_stream_13 [3], PE_13_dist_stage1[1], PE_13_id_stage1[1]) .invoke(merge_dual_streams, 13, 4, 1, sort_to_hiermerge_dist_stream_13[4], sort_to_hiermerge_id_stream_13 [4], sort_to_hiermerge_dist_stream_13[5], sort_to_hiermerge_id_stream_13 [5], PE_13_dist_stage1[2], PE_13_id_stage1[2]) .invoke(merge_dual_streams, 13, 6, 1, sort_to_hiermerge_dist_stream_13[6], sort_to_hiermerge_id_stream_13 [6], sort_to_hiermerge_dist_stream_13[7], sort_to_hiermerge_id_stream_13 [7], PE_13_dist_stage1[3], PE_13_id_stage1[3]) .invoke(merge_dual_streams, 13, 8, 1, sort_to_hiermerge_dist_stream_13[8], sort_to_hiermerge_id_stream_13 [8], sort_to_hiermerge_dist_stream_13[9], sort_to_hiermerge_id_stream_13 [9], PE_13_dist_stage1[4], PE_13_id_stage1[4]) .invoke(merge_dual_streams, 13, 10, 1, sort_to_hiermerge_dist_stream_13[10], sort_to_hiermerge_id_stream_13 [10], sort_to_hiermerge_dist_stream_13[11], sort_to_hiermerge_id_stream_13 [11], PE_13_dist_stage1[5], PE_13_id_stage1[5]) .invoke(merge_dual_streams, 13, 12, 1, sort_to_hiermerge_dist_stream_13[12], sort_to_hiermerge_id_stream_13 [12], sort_to_hiermerge_dist_stream_13[13], sort_to_hiermerge_id_stream_13 [13], PE_13_dist_stage1[6], PE_13_id_stage1[6]) .invoke(merge_dual_streams, 13, 14, 1, sort_to_hiermerge_dist_stream_13[14], sort_to_hiermerge_id_stream_13 [14], sort_to_hiermerge_dist_stream_13[15], sort_to_hiermerge_id_stream_13 [15], PE_13_dist_stage1[7], PE_13_id_stage1[7]) .invoke(merge_dual_streams, 13, 0, 2, PE_13_dist_stage1[0], PE_13_id_stage1[0], PE_13_dist_stage1[1], PE_13_id_stage1[1], PE_13_dist_stage2[0], PE_13_id_stage2[0]) .invoke(merge_dual_streams, 13, 2, 2, PE_13_dist_stage1[2], PE_13_id_stage1[2], PE_13_dist_stage1[3], PE_13_id_stage1[3], PE_13_dist_stage2[1], PE_13_id_stage2[1]) .invoke(merge_dual_streams, 13, 4, 2, PE_13_dist_stage1[4], PE_13_id_stage1[4], PE_13_dist_stage1[5], PE_13_id_stage1[5], PE_13_dist_stage2[2], PE_13_id_stage2[2]) .invoke(merge_dual_streams, 13, 6, 2, PE_13_dist_stage1[6], PE_13_id_stage1[6], PE_13_dist_stage1[7], PE_13_id_stage1[7], PE_13_dist_stage2[3], PE_13_id_stage2[3]) .invoke(merge_dual_streams, 13, 0, 3, PE_13_dist_stage2[0], PE_13_id_stage2[0], PE_13_dist_stage2[1], PE_13_id_stage2[1], PE_13_dist_stage3[0], PE_13_id_stage3[0]) .invoke(merge_dual_streams, 13, 2, 3, PE_13_dist_stage2[2], PE_13_id_stage2[2], PE_13_dist_stage2[3], PE_13_id_stage2[3], PE_13_dist_stage3[1], PE_13_id_stage3[1]) .invoke(merge_dual_streams, 13, 0, 4, PE_13_dist_stage3[0], PE_13_id_stage3[0], PE_13_dist_stage3[1], PE_13_id_stage3[1], L0_out_dist[13],L0_out_id[13])
        .invoke(merge_dual_streams, 14, 0, 1, sort_to_hiermerge_dist_stream_14[0], sort_to_hiermerge_id_stream_14 [0], sort_to_hiermerge_dist_stream_14[1], sort_to_hiermerge_id_stream_14 [1], PE_14_dist_stage1[0], PE_14_id_stage1[0]) .invoke(merge_dual_streams, 14, 2, 1, sort_to_hiermerge_dist_stream_14[2], sort_to_hiermerge_id_stream_14 [2], sort_to_hiermerge_dist_stream_14[3], sort_to_hiermerge_id_stream_14 [3], PE_14_dist_stage1[1], PE_14_id_stage1[1]) .invoke(merge_dual_streams, 14, 4, 1, sort_to_hiermerge_dist_stream_14[4], sort_to_hiermerge_id_stream_14 [4], sort_to_hiermerge_dist_stream_14[5], sort_to_hiermerge_id_stream_14 [5], PE_14_dist_stage1[2], PE_14_id_stage1[2]) .invoke(merge_dual_streams, 14, 6, 1, sort_to_hiermerge_dist_stream_14[6], sort_to_hiermerge_id_stream_14 [6], sort_to_hiermerge_dist_stream_14[7], sort_to_hiermerge_id_stream_14 [7], PE_14_dist_stage1[3], PE_14_id_stage1[3]) .invoke(merge_dual_streams, 14, 8, 1, sort_to_hiermerge_dist_stream_14[8], sort_to_hiermerge_id_stream_14 [8], sort_to_hiermerge_dist_stream_14[9], sort_to_hiermerge_id_stream_14 [9], PE_14_dist_stage1[4], PE_14_id_stage1[4]) .invoke(merge_dual_streams, 14, 10, 1, sort_to_hiermerge_dist_stream_14[10], sort_to_hiermerge_id_stream_14 [10], sort_to_hiermerge_dist_stream_14[11], sort_to_hiermerge_id_stream_14 [11], PE_14_dist_stage1[5], PE_14_id_stage1[5]) .invoke(merge_dual_streams, 14, 12, 1, sort_to_hiermerge_dist_stream_14[12], sort_to_hiermerge_id_stream_14 [12], sort_to_hiermerge_dist_stream_14[13], sort_to_hiermerge_id_stream_14 [13], PE_14_dist_stage1[6], PE_14_id_stage1[6]) .invoke(merge_dual_streams, 14, 14, 1, sort_to_hiermerge_dist_stream_14[14], sort_to_hiermerge_id_stream_14 [14], sort_to_hiermerge_dist_stream_14[15], sort_to_hiermerge_id_stream_14 [15], PE_14_dist_stage1[7], PE_14_id_stage1[7]) .invoke(merge_dual_streams, 14, 0, 2, PE_14_dist_stage1[0], PE_14_id_stage1[0], PE_14_dist_stage1[1], PE_14_id_stage1[1], PE_14_dist_stage2[0], PE_14_id_stage2[0]) .invoke(merge_dual_streams, 14, 2, 2, PE_14_dist_stage1[2], PE_14_id_stage1[2], PE_14_dist_stage1[3], PE_14_id_stage1[3], PE_14_dist_stage2[1], PE_14_id_stage2[1]) .invoke(merge_dual_streams, 14, 4, 2, PE_14_dist_stage1[4], PE_14_id_stage1[4], PE_14_dist_stage1[5], PE_14_id_stage1[5], PE_14_dist_stage2[2], PE_14_id_stage2[2]) .invoke(merge_dual_streams, 14, 6, 2, PE_14_dist_stage1[6], PE_14_id_stage1[6], PE_14_dist_stage1[7], PE_14_id_stage1[7], PE_14_dist_stage2[3], PE_14_id_stage2[3]) .invoke(merge_dual_streams, 14, 0, 3, PE_14_dist_stage2[0], PE_14_id_stage2[0], PE_14_dist_stage2[1], PE_14_id_stage2[1], PE_14_dist_stage3[0], PE_14_id_stage3[0]) .invoke(merge_dual_streams, 14, 2, 3, PE_14_dist_stage2[2], PE_14_id_stage2[2], PE_14_dist_stage2[3], PE_14_id_stage2[3], PE_14_dist_stage3[1], PE_14_id_stage3[1]) .invoke(merge_dual_streams, 14, 0, 4, PE_14_dist_stage3[0], PE_14_id_stage3[0], PE_14_dist_stage3[1], PE_14_id_stage3[1], L0_out_dist[14],L0_out_id[14])
        // INTER-PE HIERMERGE:
        .invoke( merge_dual_streams, -1, 0, -1, L0_out_dist[0], L0_out_id[0], L0_out_dist[1], L0_out_id[1], L1_out_dist[0], L1_out_id[0] )
        .invoke( merge_dual_streams, -1, 2, -1, L0_out_dist[2], L0_out_id[2], L0_out_dist[3], L0_out_id[3], L1_out_dist[1], L1_out_id[1] )
        .invoke( merge_dual_streams, -1, 4, -1, L0_out_dist[4], L0_out_id[4], L0_out_dist[5], L0_out_id[5], L1_out_dist[2], L1_out_id[2] )
        .invoke( merge_dual_streams, -1, 6, -1, L0_out_dist[6], L0_out_id[6], L0_out_dist[7], L0_out_id[7], L1_out_dist[3], L1_out_id[3] )
        .invoke( merge_dual_streams, -1, 8, -1, L0_out_dist[8], L0_out_id[8], L0_out_dist[9], L0_out_id[9], L1_out_dist[4], L1_out_id[4] )
        .invoke( merge_dual_streams, -1, 10, -1, L0_out_dist[10], L0_out_id[10], L0_out_dist[11], L0_out_id[11], L1_out_dist[5], L1_out_id[5] )
        .invoke( merge_trio_streams, -1, 12, -1, L0_out_dist[12], L0_out_id[12], L0_out_dist[13], L0_out_id[13], L0_out_dist[14], L0_out_id[14], L1_out_dist[6], L1_out_id[6] )
        .invoke( merge_dual_streams, -1, 0, 0, L1_out_dist[0], L1_out_id[0], L1_out_dist[1], L1_out_id[1], L2_out_dist[0], L2_out_id[0] )
        .invoke( merge_dual_streams, -1, 2, 0, L1_out_dist[2], L1_out_id[2], L1_out_dist[3], L1_out_id[3], L2_out_dist[1], L2_out_id[1] )
        .invoke( merge_trio_streams, -1, 4, 0, L1_out_dist[4], L1_out_id[4], L1_out_dist[5], L1_out_id[5], L1_out_dist[6], L1_out_id[6], L2_out_dist[2], L2_out_id[2] )
        .invoke( merge_trio_streams_FINAL, -1, 0, 1, L2_out_dist[0], L2_out_id[0], L2_out_dist[1], L2_out_id[1], L2_out_dist[2], L2_out_id[2], final_out_dist, final_out_id);
}
