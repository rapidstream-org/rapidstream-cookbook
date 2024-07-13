

 #include "ap_int.h"

#include "ap_axi_sdata.h"

#include <tapa.h>

#include <inttypes.h>

#include <stdlib.h>

// CEIL_DIVISION(X, Y) = ceil(x/y).
// ROUND_TO_NEXT_MULTIPLE(X, Y) rounds X up to the nearest multiple of Y.
const int IWIDTH = 512;
const int INPUT_DIM = 16;
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
const int PARTITION_LEN_IN_I = (((( (( ((4194304)-1)/(27) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) * 32 * INPUT_DIM) / IWIDTH);
const int PARTITION_LEN_IN_D = (((( (( ((4194304)-1)/(27) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) * 32 * INPUT_DIM) / (INPUT_DIM * 32));
const int PARTITION_LEN_IN_L = (((( (( ((4194304)-1)/(27) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) * 32 * INPUT_DIM) / (INPUT_DIM * (32)));
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
// purposefully empty #define
/*************************************************/
/******************** LOADS: *********************/
/*************************************************/
void load_KNN( int debug_PE_ID,
                 uint64_t  searchSpace,
                 tapa::ostream<ap_uint<IWIDTH> >& load_to_compute_stream)
;
/*************************************************/
/******************* COMPUTES: *******************/
/*************************************************/
void compute_KNN( int debug_pe_idx,
                    int debug_start_idx,
                    tapa::istream<ap_uint<IWIDTH> >& load_to_compute_stream,
                    tapa::ostreams<float, (L2I_FACTOR_W * 2)>& compute_to_sort_stream)
;
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


#pragma HLS disaggregate variable = compute_to_sort_stream
#pragma HLS interface ap_fifo port = compute_to_sort_stream._
#pragma HLS aggregate variable = compute_to_sort_stream._ bit
#pragma HLS interface ap_fifo port = compute_to_sort_stream._peek
#pragma HLS aggregate variable = compute_to_sort_stream._peek bit
void(compute_to_sort_stream._.empty());
void(compute_to_sort_stream._peek.empty());

#pragma HLS disaggregate variable = sort_to_hiermerge_dist_stream_0
#pragma HLS interface ap_fifo port = sort_to_hiermerge_dist_stream_0._
#pragma HLS aggregate variable = sort_to_hiermerge_dist_stream_0._ bit
void(sort_to_hiermerge_dist_stream_0._.full());

#pragma HLS disaggregate variable = sort_to_hiermerge_id_stream_0
#pragma HLS interface ap_fifo port = sort_to_hiermerge_id_stream_0._
#pragma HLS aggregate variable = sort_to_hiermerge_id_stream_0._ bit
void(sort_to_hiermerge_id_stream_0._.full());

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
    int start_id = PE_idx * (( (( ((4194304)-1)/(27) + 1 )-1)/((L2I_FACTOR_W * 2)*D2I_FACTOR_W) + 1 ) * ((L2I_FACTOR_W * 2)*D2I_FACTOR_W)) + seg_idx*D2L_FACTOR_W;
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
;
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
;
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
                        uint64_t  hiermerge_dist_output,
                        uint64_t  hiermerge_id_output
)
;
void Knn(
    uint64_t  in_0,
    uint64_t  in_1,
    uint64_t  in_2,
    uint64_t  in_3,
    uint64_t  in_4,
    uint64_t  in_5,
    uint64_t  in_6,
    uint64_t  in_7,
    uint64_t  in_8,
    uint64_t  in_9,
    uint64_t  in_10,
    uint64_t  in_11,
    uint64_t  in_12,
    uint64_t  in_13,
    uint64_t  in_14,
    uint64_t  in_15,
    uint64_t  in_16,
    uint64_t  in_17,
    uint64_t  in_18,
    uint64_t  in_19,
    uint64_t  in_20,
    uint64_t  in_21,
    uint64_t  in_22,
    uint64_t  in_23,
    uint64_t  in_24,
    uint64_t  in_25,
    uint64_t  in_26,
    uint64_t  final_out_dist,
    uint64_t  final_out_id
) ;
