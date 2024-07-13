

 #include "ap_int.h"

#include "ap_axi_sdata.h"

#include <tapa.h>

#include <inttypes.h>

#include <stdlib.h>

// CEIL_DIVISION(X, Y) = ceil(x/y).
// ROUND_TO_NEXT_MULTIPLE(X, Y) rounds X up to the nearest multiple of Y.
const int IWIDTH = 512;
const int INPUT_DIM = 64;
const int TOP = 10;
// Datapacking compute's output & sort's input
/***************************************************************/
// L2I = Local to Interface
const int L2I_FACTOR_W = ( (IWIDTH-1)/(INPUT_DIM * (8)) + 1 );
// D2L = Data_Type to Local
const int D2L_FACTOR_W = ( ((8)-1)/8 + 1 );
// D2I = Data_Type to Interface
const int D2I_FACTOR_W = ( (IWIDTH-1)/(INPUT_DIM * 8) + 1 );
// I2D = Interface to Data_type
const int I2D_FACTOR_W = ( ((INPUT_DIM * 8)-1)/IWIDTH + 1 );
// // DEBUG NOTE: BW_FACTOR = 1.1349753694581282
// Round up to the nearest multiple, because otherwise some logic breaks (incorrect sizes => bad logic in edgecases)
// We partition the input points, so each PE gets it's own partition, to maximize parallelization.
const int PARTITION_LEN_IN_I = (((( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) * 8 * INPUT_DIM) / IWIDTH);
const int PARTITION_LEN_IN_D = (((( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) * 8 * INPUT_DIM) / (INPUT_DIM * 8));
const int PARTITION_LEN_IN_L = (((( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) * 8 * INPUT_DIM) / (INPUT_DIM * (8)));
// We name each sub-array of the local_distance arrays a "segment".
//const int SWIDTH = DATA_TYPE_TOTAL_SZ;
//typedef ap_axiu<SWIDTH, 0, 0, 0> pkt;
//typedef ap_axiu<32, 0, 0, 0>    id_pkt;
//#define STREAM_WIDTH ap_uint<SWIDTH>
const int NUM_FEATURES_PER_READ = (IWIDTH/8);
const int QUERY_FEATURE_RESERVE = (128);
static inline ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> absval(ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> input){
    return (input > 0 ? input : static_cast<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >(-1*input));
}
// purposefully empty #define
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
                    tapa::ostreams<ap_uint<(8)>, (L2I_FACTOR_W * 2)>& compute_to_sort_stream)
{
#pragma HLS INLINE OFF
    ap_uint<IWIDTH> cur_data = 0;
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> local_Query[INPUT_DIM];
#pragma HLS ARRAY_PARTITION variable=local_Query complete dim=1
    /***********************************************/
    GET_QUERYDATA:
    for (int i = 0 ; i < (INPUT_DIM-1)/NUM_FEATURES_PER_READ + 1; ++i)
    {
        ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> tmp = 0;
        int input_dim_idx = 0;
        cur_data = load_to_compute_stream.read();
        for ( int j = 0;
              j < NUM_FEATURES_PER_READ && input_dim_idx < INPUT_DIM;
              ++j, ++input_dim_idx)
        {
            tmp.range(8 -1, 0)
                = cur_data.range(j*8 + (8 -1),
                                 j*8);
            local_Query[input_dim_idx] = tmp;
        }
    }
    COMPUTE_DATA:
    for (int jj = 0; jj < (PARTITION_LEN_IN_I / (L2I_FACTOR_W * 2)); ++jj){
        for (int ii = 0 ; ii < (L2I_FACTOR_W * 2); ++ii){
#pragma HLS PIPELINE II=1
            ap_uint<(8)> aggregated_local_dists = 0;
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
                    int dist_range_idx = d2l * 8;
                    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> delta_squared_sum = 0.0;
                    int start_idx = d2i * INPUT_DIM;
                    for (int ll = 0; ll < INPUT_DIM; ++ll){
                        unsigned int sp_range_idx = (start_idx + ll) * 8;
                        ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> sp_dim_item_value;
                        ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> tmp = 0;
                        tmp.range(8 -1, 0) =
                            cur_data.range(sp_range_idx + (8 -1),
                                                   sp_range_idx);
                        sp_dim_item_value = tmp;
                        ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> delta = absval(sp_dim_item_value - local_Query[ll]);
                        delta_squared_sum += delta * delta;
                    }
                   aggregated_local_dists.range(dist_range_idx + (8 - 1),
                                                dist_range_idx)
                       = delta_squared_sum.range(8 - 1, 0);
                    //#ifndef __SYNTHESIS__
                    //if (delta_squared_sum < MAX_DATA_TYPE_VAL)
                    //{
                    //    printf("COMPUTE: At index %d, delta_squared_sum = %f\n",
                    //            debug_start_idx + ii*SEGMENT_SIZE_IN_D +
                    //            jj*D2I_FACTOR_W + d2i,
                    //            delta_squared_sum.to_float());
                    //}
                    //#endif
                }
                int stream_idx = (ii*L2I_FACTOR_W + l2i)%(L2I_FACTOR_W * 2);
                compute_to_sort_stream[stream_idx].write(aggregated_local_dists);
                //#ifndef __SYNTHESIS__
                //if (debug_pe_idx == 0)
                //{
                //    printf("COMPUTE: Writing the value %f to compute_to_sort_stream number %d, for the %d'th time\n",
                //            aggregated_local_dists.to_float(),
                //            stream_idx,
                //            DEBUG_write_counters[stream_idx]++);
                //}
                //#endif
                aggregated_local_dists = 0;
            }
        }
    }
}
void swap(ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>* a, ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>* b,
               int* x, int* y)
{
#pragma HLS INLINE
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> tmpdist_a;
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> tmpdist_b;
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
                       tapa::istream<ap_uint<(8)> >& compute_to_sort_stream,
                       tapa::ostream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& sort_to_hiermerge_dist_stream_0,
                       tapa::ostream<int>& sort_to_hiermerge_id_stream_0)
{
#pragma HLS INLINE OFF
    static // TAPA Known-issue: Static keyword fails CSIM because this is not thread-safe.
                //  but when running the HW build, it will instantiate several copies of this function. So this is OK.
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> local_kNearstDist[D2L_FACTOR_W][(TOP+1)];
#pragma HLS ARRAY_PARTITION variable=local_kNearstDist complete dim=0
    static
    int local_kNearstId[D2L_FACTOR_W][(TOP+1)];
#pragma HLS ARRAY_PARTITION variable=local_kNearstId complete dim=0
    /* Our segments used to be large chunks of each partition.
     * Now, however, our segments are cylically split, so our ID
     * logic has to change.
     */
    int start_id = PE_idx * (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) + seg_idx*D2L_FACTOR_W;
    /*******************************************/
    // Initialize all top-K distances to MAX, and their IDs to an invalid value.
    INIT_LOOP:
    for (int i = 0; i < D2L_FACTOR_W; ++i)
    {
        for (int j = 0; j < TOP+1; ++j)
        {
            local_kNearstId[i][j] = -1;
            local_kNearstDist[i][j] = (3.96875);
        }
    }
    SORT_LOOP:
    for (int lvalue_idx = 0; lvalue_idx < ((PARTITION_LEN_IN_L / (L2I_FACTOR_W * 2)) + TOP); ++lvalue_idx) {
#pragma HLS PIPELINE II=2
        ap_uint<(8)> cur_Lval = 0;
        int stream_idx = seg_idx;
        if (lvalue_idx >= (PARTITION_LEN_IN_L / (L2I_FACTOR_W * 2))) {
            for (int D_idx = 0; D_idx < D2L_FACTOR_W; ++D_idx)
            {
                ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> cur_Dval = (3.96875);
                cur_Lval.range(8*(D_idx+1) - 1, 8*(D_idx)) =
                    cur_Dval.range(8 -1, 0);
            }
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
            unsigned char range_idx = (D_idx)*8;
            ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> cur_Dval;
            cur_Dval.range(8 - 1, 0) =
                cur_Lval.range(range_idx + (8 - 1), range_idx);
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
            local_kNearstDist[i][j] = (3.96875);
        }
    }
}
void merge_dual_streams(
                        int debug_PE_idx,
                        int debug_seg_d2l_idx,
                        int debug_stage_idx,
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_1,
                        tapa::istream<int>& hiermerge_id_istream_1,
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_2,
                        tapa::istream<int>& hiermerge_id_istream_2,
                        tapa::ostream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_ostream,
                        tapa::ostream<int>& hiermerge_id_ostream
)
{
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_1 = hiermerge_dist_istream_1.read();
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_2 = hiermerge_dist_istream_2.read();
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
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_1,
                        tapa::istream<int>& hiermerge_id_istream_1,
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_2,
                        tapa::istream<int>& hiermerge_id_istream_2,
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_3,
                        tapa::istream<int>& hiermerge_id_istream_3,
                        tapa::ostream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_ostream,
                        tapa::ostream<int>& hiermerge_id_ostream
)
{
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_1 = hiermerge_dist_istream_1.read();
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_2 = hiermerge_dist_istream_2.read();
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_3 = hiermerge_dist_istream_3.read();
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
                    tapa::async_mmap<ap_uint<32> >& output_knnDist,
                    tapa::async_mmap<int>& output_knnId,
                    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> output_dist,
                    int output_id,
                    int& i_req_dist,
                    int& i_resp_dist,
                    int& i_req_id,
                    int& i_resp_id
) {
#pragma HLS INLINE
    ap_uint<32> output_dist_32bit = 0;
    output_dist_32bit.range(8 - 1, 0) = output_dist.range(8 - 1, 0);
    // Writing the distance values:
    if (i_req_dist < TOP && i_req_dist >= 0 &&
        !output_knnDist.write_addr.full() &&
        !output_knnDist.write_data.full()
    ) {
      output_knnDist.write_addr.try_write(i_req_dist);
      output_knnDist.write_data.try_write(output_dist_32bit);
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
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_1,
                        tapa::istream<int>& hiermerge_id_istream_1,
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_2,
                        tapa::istream<int>& hiermerge_id_istream_2,
                        tapa::async_mmap<ap_uint<32> >& hiermerge_dist_output,
                        tapa::async_mmap<int>& hiermerge_id_output
)
{
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_1 = hiermerge_dist_istream_1.read();
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_2 = hiermerge_dist_istream_2.read();
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
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_1,
                        tapa::istream<int>& hiermerge_id_istream_1,
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_2,
                        tapa::istream<int>& hiermerge_id_istream_2,
                        tapa::istream<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> >& hiermerge_dist_istream_3,
                        tapa::istream<int>& hiermerge_id_istream_3,
                        tapa::async_mmap<ap_uint<32> >& hiermerge_dist_output,
                        tapa::async_mmap<int>& hiermerge_id_output
)
{
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_1 = hiermerge_dist_istream_1.read();
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_2 = hiermerge_dist_istream_2.read();
    ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT> dist_3 = hiermerge_dist_istream_3.read();
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
    tapa::mmap<ap_uint<IWIDTH> > in_15,
    tapa::mmap<ap_uint<IWIDTH> > in_16,
    tapa::mmap<ap_uint<IWIDTH> > in_17,
    tapa::mmap<ap_uint<IWIDTH> > in_18,
    tapa::mmap<ap_uint<IWIDTH> > in_19,
    tapa::mmap<ap_uint<IWIDTH> > in_20,
    tapa::mmap<ap_uint<IWIDTH> > in_21,
    tapa::mmap<ap_uint<IWIDTH> > in_22,
    tapa::mmap<ap_uint<IWIDTH> > in_23,
    tapa::mmap<ap_uint<IWIDTH> > in_24,
    tapa::mmap<ap_uint<IWIDTH> > in_25,
    tapa::mmap<ap_uint<IWIDTH> > in_26,
    tapa::mmap<ap_uint<IWIDTH> > in_27,
    tapa::mmap<ap_uint<IWIDTH> > in_28,
    tapa::mmap<ap_uint<IWIDTH> > in_29,
    tapa::mmap<ap_uint<32> > final_out_dist,
    tapa::mmap<int> final_out_id
) {
    // Streams, for the global merge:
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, 30, TOP> L0_out_dist;
    tapa::streams<int, 30, TOP> L0_out_id;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, 15, 2> L1_out_dist;
    tapa::streams<int, 15, 2> L1_out_id;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, 7, 2> L2_out_dist;
    tapa::streams<int, 7, 2> L2_out_id;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, 3, 2> L3_out_dist;
    tapa::streams<int, 3, 2> L3_out_id;
    // Streams, for load->compute->sort:
    tapa::streams<ap_uint<IWIDTH>, (30), 2> load_to_compute_stream;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_0;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_1;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_2;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_3;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_4;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_5;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_6;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_7;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_8;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_9;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_10;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_11;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_12;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_13;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_14;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_15;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_16;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_17;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_18;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_19;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_20;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_21;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_22;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_23;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_24;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_25;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_26;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_27;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_28;
    tapa::streams<ap_uint<(8)>, (L2I_FACTOR_W * 2), 2> compute_to_sort_stream_29;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_0;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_0;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_1;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_1;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_2;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_2;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_3;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_3;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_4;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_4;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_5;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_5;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_6;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_6;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_7;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_7;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_8;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_8;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_9;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_9;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_10;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_10;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_11;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_11;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_12;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_12;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_13;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_13;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_14;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_14;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_15;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_15;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_16;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_16;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_17;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_17;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_18;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_18;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_19;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_19;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_20;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_20;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_21;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_21;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_22;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_22;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_23;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_23;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_24;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_24;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_25;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_25;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_26;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_26;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_27;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_27;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_28;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_28;
    tapa::streams<ap_fixed<8, 3 /* NOTE: This includes the sign bit, if applicable.*/, AP_RND, AP_SAT>, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_dist_stream_29;
    tapa::streams<int, (L2I_FACTOR_W * 2)*D2L_FACTOR_W, TOP> sort_to_hiermerge_id_stream_29;
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
        .invoke( load_KNN, 15, in_15, load_to_compute_stream[15])
        .invoke( load_KNN, 16, in_16, load_to_compute_stream[16])
        .invoke( load_KNN, 17, in_17, load_to_compute_stream[17])
        .invoke( load_KNN, 18, in_18, load_to_compute_stream[18])
        .invoke( load_KNN, 19, in_19, load_to_compute_stream[19])
        .invoke( load_KNN, 20, in_20, load_to_compute_stream[20])
        .invoke( load_KNN, 21, in_21, load_to_compute_stream[21])
        .invoke( load_KNN, 22, in_22, load_to_compute_stream[22])
        .invoke( load_KNN, 23, in_23, load_to_compute_stream[23])
        .invoke( load_KNN, 24, in_24, load_to_compute_stream[24])
        .invoke( load_KNN, 25, in_25, load_to_compute_stream[25])
        .invoke( load_KNN, 26, in_26, load_to_compute_stream[26])
        .invoke( load_KNN, 27, in_27, load_to_compute_stream[27])
        .invoke( load_KNN, 28, in_28, load_to_compute_stream[28])
        .invoke( load_KNN, 29, in_29, load_to_compute_stream[29])
        .invoke( compute_KNN, 0, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*0, load_to_compute_stream[0 ], compute_to_sort_stream_0 )
        .invoke( compute_KNN, 1, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*1, load_to_compute_stream[1 ], compute_to_sort_stream_1 )
        .invoke( compute_KNN, 2, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*2, load_to_compute_stream[2 ], compute_to_sort_stream_2 )
        .invoke( compute_KNN, 3, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*3, load_to_compute_stream[3 ], compute_to_sort_stream_3 )
        .invoke( compute_KNN, 4, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*4, load_to_compute_stream[4 ], compute_to_sort_stream_4 )
        .invoke( compute_KNN, 5, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*5, load_to_compute_stream[5 ], compute_to_sort_stream_5 )
        .invoke( compute_KNN, 6, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*6, load_to_compute_stream[6 ], compute_to_sort_stream_6 )
        .invoke( compute_KNN, 7, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*7, load_to_compute_stream[7 ], compute_to_sort_stream_7 )
        .invoke( compute_KNN, 8, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*8, load_to_compute_stream[8 ], compute_to_sort_stream_8 )
        .invoke( compute_KNN, 9, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*9, load_to_compute_stream[9 ], compute_to_sort_stream_9 )
        .invoke( compute_KNN, 10, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*10, load_to_compute_stream[10 ], compute_to_sort_stream_10 )
        .invoke( compute_KNN, 11, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*11, load_to_compute_stream[11 ], compute_to_sort_stream_11 )
        .invoke( compute_KNN, 12, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*12, load_to_compute_stream[12 ], compute_to_sort_stream_12 )
        .invoke( compute_KNN, 13, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*13, load_to_compute_stream[13 ], compute_to_sort_stream_13 )
        .invoke( compute_KNN, 14, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*14, load_to_compute_stream[14 ], compute_to_sort_stream_14 )
        .invoke( compute_KNN, 15, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*15, load_to_compute_stream[15 ], compute_to_sort_stream_15 )
        .invoke( compute_KNN, 16, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*16, load_to_compute_stream[16 ], compute_to_sort_stream_16 )
        .invoke( compute_KNN, 17, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*17, load_to_compute_stream[17 ], compute_to_sort_stream_17 )
        .invoke( compute_KNN, 18, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*18, load_to_compute_stream[18 ], compute_to_sort_stream_18 )
        .invoke( compute_KNN, 19, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*19, load_to_compute_stream[19 ], compute_to_sort_stream_19 )
        .invoke( compute_KNN, 20, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*20, load_to_compute_stream[20 ], compute_to_sort_stream_20 )
        .invoke( compute_KNN, 21, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*21, load_to_compute_stream[21 ], compute_to_sort_stream_21 )
        .invoke( compute_KNN, 22, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*22, load_to_compute_stream[22 ], compute_to_sort_stream_22 )
        .invoke( compute_KNN, 23, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*23, load_to_compute_stream[23 ], compute_to_sort_stream_23 )
        .invoke( compute_KNN, 24, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*24, load_to_compute_stream[24 ], compute_to_sort_stream_24 )
        .invoke( compute_KNN, 25, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*25, load_to_compute_stream[25 ], compute_to_sort_stream_25 )
        .invoke( compute_KNN, 26, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*26, load_to_compute_stream[26 ], compute_to_sort_stream_26 )
        .invoke( compute_KNN, 27, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*27, load_to_compute_stream[27 ], compute_to_sort_stream_27 )
        .invoke( compute_KNN, 28, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*28, load_to_compute_stream[28 ], compute_to_sort_stream_28 )
        .invoke( compute_KNN, 29, (( (( ((4194304)-1)/(30) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W))*29, load_to_compute_stream[29 ], compute_to_sort_stream_29 )
        .invoke(para_partial_sort, 0, 0, compute_to_sort_stream_0[0], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 0, 1, compute_to_sort_stream_0[1], sort_to_hiermerge_dist_stream_0[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_0[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 1, 0, compute_to_sort_stream_1[0], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 1, 1, compute_to_sort_stream_1[1], sort_to_hiermerge_dist_stream_1[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_1[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 2, 0, compute_to_sort_stream_2[0], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 2, 1, compute_to_sort_stream_2[1], sort_to_hiermerge_dist_stream_2[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_2[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 3, 0, compute_to_sort_stream_3[0], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 3, 1, compute_to_sort_stream_3[1], sort_to_hiermerge_dist_stream_3[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_3[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 4, 0, compute_to_sort_stream_4[0], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 4, 1, compute_to_sort_stream_4[1], sort_to_hiermerge_dist_stream_4[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_4[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 5, 0, compute_to_sort_stream_5[0], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 5, 1, compute_to_sort_stream_5[1], sort_to_hiermerge_dist_stream_5[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_5[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 6, 0, compute_to_sort_stream_6[0], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 6, 1, compute_to_sort_stream_6[1], sort_to_hiermerge_dist_stream_6[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_6[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 7, 0, compute_to_sort_stream_7[0], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 7, 1, compute_to_sort_stream_7[1], sort_to_hiermerge_dist_stream_7[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_7[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 8, 0, compute_to_sort_stream_8[0], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 8, 1, compute_to_sort_stream_8[1], sort_to_hiermerge_dist_stream_8[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_8[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 9, 0, compute_to_sort_stream_9[0], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 9, 1, compute_to_sort_stream_9[1], sort_to_hiermerge_dist_stream_9[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_9[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 10, 0, compute_to_sort_stream_10[0], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 10, 1, compute_to_sort_stream_10[1], sort_to_hiermerge_dist_stream_10[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_10[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 11, 0, compute_to_sort_stream_11[0], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 11, 1, compute_to_sort_stream_11[1], sort_to_hiermerge_dist_stream_11[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_11[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 12, 0, compute_to_sort_stream_12[0], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 12, 1, compute_to_sort_stream_12[1], sort_to_hiermerge_dist_stream_12[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_12[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 13, 0, compute_to_sort_stream_13[0], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 13, 1, compute_to_sort_stream_13[1], sort_to_hiermerge_dist_stream_13[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_13[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 14, 0, compute_to_sort_stream_14[0], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 14, 1, compute_to_sort_stream_14[1], sort_to_hiermerge_dist_stream_14[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_14[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 15, 0, compute_to_sort_stream_15[0], sort_to_hiermerge_dist_stream_15[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_15[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 15, 1, compute_to_sort_stream_15[1], sort_to_hiermerge_dist_stream_15[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_15[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 16, 0, compute_to_sort_stream_16[0], sort_to_hiermerge_dist_stream_16[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_16[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 16, 1, compute_to_sort_stream_16[1], sort_to_hiermerge_dist_stream_16[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_16[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 17, 0, compute_to_sort_stream_17[0], sort_to_hiermerge_dist_stream_17[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_17[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 17, 1, compute_to_sort_stream_17[1], sort_to_hiermerge_dist_stream_17[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_17[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 18, 0, compute_to_sort_stream_18[0], sort_to_hiermerge_dist_stream_18[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_18[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 18, 1, compute_to_sort_stream_18[1], sort_to_hiermerge_dist_stream_18[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_18[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 19, 0, compute_to_sort_stream_19[0], sort_to_hiermerge_dist_stream_19[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_19[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 19, 1, compute_to_sort_stream_19[1], sort_to_hiermerge_dist_stream_19[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_19[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 20, 0, compute_to_sort_stream_20[0], sort_to_hiermerge_dist_stream_20[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_20[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 20, 1, compute_to_sort_stream_20[1], sort_to_hiermerge_dist_stream_20[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_20[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 21, 0, compute_to_sort_stream_21[0], sort_to_hiermerge_dist_stream_21[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_21[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 21, 1, compute_to_sort_stream_21[1], sort_to_hiermerge_dist_stream_21[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_21[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 22, 0, compute_to_sort_stream_22[0], sort_to_hiermerge_dist_stream_22[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_22[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 22, 1, compute_to_sort_stream_22[1], sort_to_hiermerge_dist_stream_22[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_22[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 23, 0, compute_to_sort_stream_23[0], sort_to_hiermerge_dist_stream_23[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_23[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 23, 1, compute_to_sort_stream_23[1], sort_to_hiermerge_dist_stream_23[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_23[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 24, 0, compute_to_sort_stream_24[0], sort_to_hiermerge_dist_stream_24[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_24[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 24, 1, compute_to_sort_stream_24[1], sort_to_hiermerge_dist_stream_24[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_24[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 25, 0, compute_to_sort_stream_25[0], sort_to_hiermerge_dist_stream_25[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_25[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 25, 1, compute_to_sort_stream_25[1], sort_to_hiermerge_dist_stream_25[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_25[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 26, 0, compute_to_sort_stream_26[0], sort_to_hiermerge_dist_stream_26[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_26[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 26, 1, compute_to_sort_stream_26[1], sort_to_hiermerge_dist_stream_26[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_26[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 27, 0, compute_to_sort_stream_27[0], sort_to_hiermerge_dist_stream_27[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_27[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 27, 1, compute_to_sort_stream_27[1], sort_to_hiermerge_dist_stream_27[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_27[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 28, 0, compute_to_sort_stream_28[0], sort_to_hiermerge_dist_stream_28[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_28[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 28, 1, compute_to_sort_stream_28[1], sort_to_hiermerge_dist_stream_28[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_28[D2L_FACTOR_W*1 + 0] )
        .invoke(para_partial_sort, 29, 0, compute_to_sort_stream_29[0], sort_to_hiermerge_dist_stream_29[D2L_FACTOR_W*0 + 0], sort_to_hiermerge_id_stream_29[D2L_FACTOR_W*0 + 0] ) .invoke(para_partial_sort, 29, 1, compute_to_sort_stream_29[1], sort_to_hiermerge_dist_stream_29[D2L_FACTOR_W*1 + 0], sort_to_hiermerge_id_stream_29[D2L_FACTOR_W*1 + 0] )
        .invoke(merge_dual_streams, 0, 0, 1, sort_to_hiermerge_dist_stream_0[0], sort_to_hiermerge_id_stream_0 [0], sort_to_hiermerge_dist_stream_0[1], sort_to_hiermerge_id_stream_0 [1], L0_out_dist[0],L0_out_id[0])
        .invoke(merge_dual_streams, 1, 0, 1, sort_to_hiermerge_dist_stream_1[0], sort_to_hiermerge_id_stream_1 [0], sort_to_hiermerge_dist_stream_1[1], sort_to_hiermerge_id_stream_1 [1], L0_out_dist[1],L0_out_id[1])
        .invoke(merge_dual_streams, 2, 0, 1, sort_to_hiermerge_dist_stream_2[0], sort_to_hiermerge_id_stream_2 [0], sort_to_hiermerge_dist_stream_2[1], sort_to_hiermerge_id_stream_2 [1], L0_out_dist[2],L0_out_id[2])
        .invoke(merge_dual_streams, 3, 0, 1, sort_to_hiermerge_dist_stream_3[0], sort_to_hiermerge_id_stream_3 [0], sort_to_hiermerge_dist_stream_3[1], sort_to_hiermerge_id_stream_3 [1], L0_out_dist[3],L0_out_id[3])
        .invoke(merge_dual_streams, 4, 0, 1, sort_to_hiermerge_dist_stream_4[0], sort_to_hiermerge_id_stream_4 [0], sort_to_hiermerge_dist_stream_4[1], sort_to_hiermerge_id_stream_4 [1], L0_out_dist[4],L0_out_id[4])
        .invoke(merge_dual_streams, 5, 0, 1, sort_to_hiermerge_dist_stream_5[0], sort_to_hiermerge_id_stream_5 [0], sort_to_hiermerge_dist_stream_5[1], sort_to_hiermerge_id_stream_5 [1], L0_out_dist[5],L0_out_id[5])
        .invoke(merge_dual_streams, 6, 0, 1, sort_to_hiermerge_dist_stream_6[0], sort_to_hiermerge_id_stream_6 [0], sort_to_hiermerge_dist_stream_6[1], sort_to_hiermerge_id_stream_6 [1], L0_out_dist[6],L0_out_id[6])
        .invoke(merge_dual_streams, 7, 0, 1, sort_to_hiermerge_dist_stream_7[0], sort_to_hiermerge_id_stream_7 [0], sort_to_hiermerge_dist_stream_7[1], sort_to_hiermerge_id_stream_7 [1], L0_out_dist[7],L0_out_id[7])
        .invoke(merge_dual_streams, 8, 0, 1, sort_to_hiermerge_dist_stream_8[0], sort_to_hiermerge_id_stream_8 [0], sort_to_hiermerge_dist_stream_8[1], sort_to_hiermerge_id_stream_8 [1], L0_out_dist[8],L0_out_id[8])
        .invoke(merge_dual_streams, 9, 0, 1, sort_to_hiermerge_dist_stream_9[0], sort_to_hiermerge_id_stream_9 [0], sort_to_hiermerge_dist_stream_9[1], sort_to_hiermerge_id_stream_9 [1], L0_out_dist[9],L0_out_id[9])
        .invoke(merge_dual_streams, 10, 0, 1, sort_to_hiermerge_dist_stream_10[0], sort_to_hiermerge_id_stream_10 [0], sort_to_hiermerge_dist_stream_10[1], sort_to_hiermerge_id_stream_10 [1], L0_out_dist[10],L0_out_id[10])
        .invoke(merge_dual_streams, 11, 0, 1, sort_to_hiermerge_dist_stream_11[0], sort_to_hiermerge_id_stream_11 [0], sort_to_hiermerge_dist_stream_11[1], sort_to_hiermerge_id_stream_11 [1], L0_out_dist[11],L0_out_id[11])
        .invoke(merge_dual_streams, 12, 0, 1, sort_to_hiermerge_dist_stream_12[0], sort_to_hiermerge_id_stream_12 [0], sort_to_hiermerge_dist_stream_12[1], sort_to_hiermerge_id_stream_12 [1], L0_out_dist[12],L0_out_id[12])
        .invoke(merge_dual_streams, 13, 0, 1, sort_to_hiermerge_dist_stream_13[0], sort_to_hiermerge_id_stream_13 [0], sort_to_hiermerge_dist_stream_13[1], sort_to_hiermerge_id_stream_13 [1], L0_out_dist[13],L0_out_id[13])
        .invoke(merge_dual_streams, 14, 0, 1, sort_to_hiermerge_dist_stream_14[0], sort_to_hiermerge_id_stream_14 [0], sort_to_hiermerge_dist_stream_14[1], sort_to_hiermerge_id_stream_14 [1], L0_out_dist[14],L0_out_id[14])
        .invoke(merge_dual_streams, 15, 0, 1, sort_to_hiermerge_dist_stream_15[0], sort_to_hiermerge_id_stream_15 [0], sort_to_hiermerge_dist_stream_15[1], sort_to_hiermerge_id_stream_15 [1], L0_out_dist[15],L0_out_id[15])
        .invoke(merge_dual_streams, 16, 0, 1, sort_to_hiermerge_dist_stream_16[0], sort_to_hiermerge_id_stream_16 [0], sort_to_hiermerge_dist_stream_16[1], sort_to_hiermerge_id_stream_16 [1], L0_out_dist[16],L0_out_id[16])
        .invoke(merge_dual_streams, 17, 0, 1, sort_to_hiermerge_dist_stream_17[0], sort_to_hiermerge_id_stream_17 [0], sort_to_hiermerge_dist_stream_17[1], sort_to_hiermerge_id_stream_17 [1], L0_out_dist[17],L0_out_id[17])
        .invoke(merge_dual_streams, 18, 0, 1, sort_to_hiermerge_dist_stream_18[0], sort_to_hiermerge_id_stream_18 [0], sort_to_hiermerge_dist_stream_18[1], sort_to_hiermerge_id_stream_18 [1], L0_out_dist[18],L0_out_id[18])
        .invoke(merge_dual_streams, 19, 0, 1, sort_to_hiermerge_dist_stream_19[0], sort_to_hiermerge_id_stream_19 [0], sort_to_hiermerge_dist_stream_19[1], sort_to_hiermerge_id_stream_19 [1], L0_out_dist[19],L0_out_id[19])
        .invoke(merge_dual_streams, 20, 0, 1, sort_to_hiermerge_dist_stream_20[0], sort_to_hiermerge_id_stream_20 [0], sort_to_hiermerge_dist_stream_20[1], sort_to_hiermerge_id_stream_20 [1], L0_out_dist[20],L0_out_id[20])
        .invoke(merge_dual_streams, 21, 0, 1, sort_to_hiermerge_dist_stream_21[0], sort_to_hiermerge_id_stream_21 [0], sort_to_hiermerge_dist_stream_21[1], sort_to_hiermerge_id_stream_21 [1], L0_out_dist[21],L0_out_id[21])
        .invoke(merge_dual_streams, 22, 0, 1, sort_to_hiermerge_dist_stream_22[0], sort_to_hiermerge_id_stream_22 [0], sort_to_hiermerge_dist_stream_22[1], sort_to_hiermerge_id_stream_22 [1], L0_out_dist[22],L0_out_id[22])
        .invoke(merge_dual_streams, 23, 0, 1, sort_to_hiermerge_dist_stream_23[0], sort_to_hiermerge_id_stream_23 [0], sort_to_hiermerge_dist_stream_23[1], sort_to_hiermerge_id_stream_23 [1], L0_out_dist[23],L0_out_id[23])
        .invoke(merge_dual_streams, 24, 0, 1, sort_to_hiermerge_dist_stream_24[0], sort_to_hiermerge_id_stream_24 [0], sort_to_hiermerge_dist_stream_24[1], sort_to_hiermerge_id_stream_24 [1], L0_out_dist[24],L0_out_id[24])
        .invoke(merge_dual_streams, 25, 0, 1, sort_to_hiermerge_dist_stream_25[0], sort_to_hiermerge_id_stream_25 [0], sort_to_hiermerge_dist_stream_25[1], sort_to_hiermerge_id_stream_25 [1], L0_out_dist[25],L0_out_id[25])
        .invoke(merge_dual_streams, 26, 0, 1, sort_to_hiermerge_dist_stream_26[0], sort_to_hiermerge_id_stream_26 [0], sort_to_hiermerge_dist_stream_26[1], sort_to_hiermerge_id_stream_26 [1], L0_out_dist[26],L0_out_id[26])
        .invoke(merge_dual_streams, 27, 0, 1, sort_to_hiermerge_dist_stream_27[0], sort_to_hiermerge_id_stream_27 [0], sort_to_hiermerge_dist_stream_27[1], sort_to_hiermerge_id_stream_27 [1], L0_out_dist[27],L0_out_id[27])
        .invoke(merge_dual_streams, 28, 0, 1, sort_to_hiermerge_dist_stream_28[0], sort_to_hiermerge_id_stream_28 [0], sort_to_hiermerge_dist_stream_28[1], sort_to_hiermerge_id_stream_28 [1], L0_out_dist[28],L0_out_id[28])
        .invoke(merge_dual_streams, 29, 0, 1, sort_to_hiermerge_dist_stream_29[0], sort_to_hiermerge_id_stream_29 [0], sort_to_hiermerge_dist_stream_29[1], sort_to_hiermerge_id_stream_29 [1], L0_out_dist[29],L0_out_id[29])
        // INTER-PE HIERMERGE:
        .invoke( merge_dual_streams, -1, 0, -1, L0_out_dist[0], L0_out_id[0], L0_out_dist[1], L0_out_id[1], L1_out_dist[0], L1_out_id[0] )
        .invoke( merge_dual_streams, -1, 2, -1, L0_out_dist[2], L0_out_id[2], L0_out_dist[3], L0_out_id[3], L1_out_dist[1], L1_out_id[1] )
        .invoke( merge_dual_streams, -1, 4, -1, L0_out_dist[4], L0_out_id[4], L0_out_dist[5], L0_out_id[5], L1_out_dist[2], L1_out_id[2] )
        .invoke( merge_dual_streams, -1, 6, -1, L0_out_dist[6], L0_out_id[6], L0_out_dist[7], L0_out_id[7], L1_out_dist[3], L1_out_id[3] )
        .invoke( merge_dual_streams, -1, 8, -1, L0_out_dist[8], L0_out_id[8], L0_out_dist[9], L0_out_id[9], L1_out_dist[4], L1_out_id[4] )
        .invoke( merge_dual_streams, -1, 10, -1, L0_out_dist[10], L0_out_id[10], L0_out_dist[11], L0_out_id[11], L1_out_dist[5], L1_out_id[5] )
        .invoke( merge_dual_streams, -1, 12, -1, L0_out_dist[12], L0_out_id[12], L0_out_dist[13], L0_out_id[13], L1_out_dist[6], L1_out_id[6] )
        .invoke( merge_dual_streams, -1, 14, -1, L0_out_dist[14], L0_out_id[14], L0_out_dist[15], L0_out_id[15], L1_out_dist[7], L1_out_id[7] )
        .invoke( merge_dual_streams, -1, 16, -1, L0_out_dist[16], L0_out_id[16], L0_out_dist[17], L0_out_id[17], L1_out_dist[8], L1_out_id[8] )
        .invoke( merge_dual_streams, -1, 18, -1, L0_out_dist[18], L0_out_id[18], L0_out_dist[19], L0_out_id[19], L1_out_dist[9], L1_out_id[9] )
        .invoke( merge_dual_streams, -1, 20, -1, L0_out_dist[20], L0_out_id[20], L0_out_dist[21], L0_out_id[21], L1_out_dist[10], L1_out_id[10] )
        .invoke( merge_dual_streams, -1, 22, -1, L0_out_dist[22], L0_out_id[22], L0_out_dist[23], L0_out_id[23], L1_out_dist[11], L1_out_id[11] )
        .invoke( merge_dual_streams, -1, 24, -1, L0_out_dist[24], L0_out_id[24], L0_out_dist[25], L0_out_id[25], L1_out_dist[12], L1_out_id[12] )
        .invoke( merge_dual_streams, -1, 26, -1, L0_out_dist[26], L0_out_id[26], L0_out_dist[27], L0_out_id[27], L1_out_dist[13], L1_out_id[13] )
        .invoke( merge_dual_streams, -1, 28, -1, L0_out_dist[28], L0_out_id[28], L0_out_dist[29], L0_out_id[29], L1_out_dist[14], L1_out_id[14] )
        .invoke( merge_dual_streams, -1, 0, 0, L1_out_dist[0], L1_out_id[0], L1_out_dist[1], L1_out_id[1], L2_out_dist[0], L2_out_id[0] )
        .invoke( merge_dual_streams, -1, 2, 0, L1_out_dist[2], L1_out_id[2], L1_out_dist[3], L1_out_id[3], L2_out_dist[1], L2_out_id[1] )
        .invoke( merge_dual_streams, -1, 4, 0, L1_out_dist[4], L1_out_id[4], L1_out_dist[5], L1_out_id[5], L2_out_dist[2], L2_out_id[2] )
        .invoke( merge_dual_streams, -1, 6, 0, L1_out_dist[6], L1_out_id[6], L1_out_dist[7], L1_out_id[7], L2_out_dist[3], L2_out_id[3] )
        .invoke( merge_dual_streams, -1, 8, 0, L1_out_dist[8], L1_out_id[8], L1_out_dist[9], L1_out_id[9], L2_out_dist[4], L2_out_id[4] )
        .invoke( merge_dual_streams, -1, 10, 0, L1_out_dist[10], L1_out_id[10], L1_out_dist[11], L1_out_id[11], L2_out_dist[5], L2_out_id[5] )
        .invoke( merge_trio_streams, -1, 12, 0, L1_out_dist[12], L1_out_id[12], L1_out_dist[13], L1_out_id[13], L1_out_dist[14], L1_out_id[14], L2_out_dist[6], L2_out_id[6] )
        .invoke( merge_dual_streams, -1, 0, 1, L2_out_dist[0], L2_out_id[0], L2_out_dist[1], L2_out_id[1], L3_out_dist[0], L3_out_id[0] )
        .invoke( merge_dual_streams, -1, 2, 1, L2_out_dist[2], L2_out_id[2], L2_out_dist[3], L2_out_id[3], L3_out_dist[1], L3_out_id[1] )
        .invoke( merge_trio_streams, -1, 4, 1, L2_out_dist[4], L2_out_id[4], L2_out_dist[5], L2_out_id[5], L2_out_dist[6], L2_out_id[6], L3_out_dist[2], L3_out_id[2] )
        .invoke( merge_trio_streams_FINAL, -1, 0, 2, L3_out_dist[0], L3_out_id[0], L3_out_dist[1], L3_out_id[1], L3_out_dist[2], L3_out_id[2], final_out_dist, final_out_id);
}
