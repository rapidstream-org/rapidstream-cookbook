

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
{


#pragma HLS disaggregate variable = load_to_compute_stream
#pragma HLS interface ap_fifo port = load_to_compute_stream._
#pragma HLS aggregate variable = load_to_compute_stream._ bit
#pragma HLS interface ap_fifo port = load_to_compute_stream._peek
#pragma HLS aggregate variable = load_to_compute_stream._peek bit
void(load_to_compute_stream._.empty());
void(load_to_compute_stream._peek.empty());

#pragma HLS disaggregate variable = compute_to_sort_stream
#pragma HLS array_partition variable = compute_to_sort_stream complete
#pragma HLS interface ap_fifo port = compute_to_sort_stream[0]._
#pragma HLS aggregate variable = compute_to_sort_stream[0]._ bit
void(compute_to_sort_stream[0]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[1]._
#pragma HLS aggregate variable = compute_to_sort_stream[1]._ bit
void(compute_to_sort_stream[1]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[2]._
#pragma HLS aggregate variable = compute_to_sort_stream[2]._ bit
void(compute_to_sort_stream[2]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[3]._
#pragma HLS aggregate variable = compute_to_sort_stream[3]._ bit
void(compute_to_sort_stream[3]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[4]._
#pragma HLS aggregate variable = compute_to_sort_stream[4]._ bit
void(compute_to_sort_stream[4]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[5]._
#pragma HLS aggregate variable = compute_to_sort_stream[5]._ bit
void(compute_to_sort_stream[5]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[6]._
#pragma HLS aggregate variable = compute_to_sort_stream[6]._ bit
void(compute_to_sort_stream[6]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[7]._
#pragma HLS aggregate variable = compute_to_sort_stream[7]._ bit
void(compute_to_sort_stream[7]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[8]._
#pragma HLS aggregate variable = compute_to_sort_stream[8]._ bit
void(compute_to_sort_stream[8]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[9]._
#pragma HLS aggregate variable = compute_to_sort_stream[9]._ bit
void(compute_to_sort_stream[9]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[10]._
#pragma HLS aggregate variable = compute_to_sort_stream[10]._ bit
void(compute_to_sort_stream[10]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[11]._
#pragma HLS aggregate variable = compute_to_sort_stream[11]._ bit
void(compute_to_sort_stream[11]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[12]._
#pragma HLS aggregate variable = compute_to_sort_stream[12]._ bit
void(compute_to_sort_stream[12]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[13]._
#pragma HLS aggregate variable = compute_to_sort_stream[13]._ bit
void(compute_to_sort_stream[13]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[14]._
#pragma HLS aggregate variable = compute_to_sort_stream[14]._ bit
void(compute_to_sort_stream[14]._.full());
#pragma HLS interface ap_fifo port = compute_to_sort_stream[15]._
#pragma HLS aggregate variable = compute_to_sort_stream[15]._ bit
void(compute_to_sort_stream[15]._.full());

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
;
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
    uint64_t  final_out_dist,
    uint64_t  final_out_id
) ;
