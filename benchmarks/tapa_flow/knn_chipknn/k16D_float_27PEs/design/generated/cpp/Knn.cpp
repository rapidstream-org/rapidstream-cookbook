

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
extern "C" {

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
) {

#pragma HLS interface s_axilite port = in_0 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_0); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_0); }

#pragma HLS interface s_axilite port = in_1 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_1); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_1); }

#pragma HLS interface s_axilite port = in_2 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_2); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_2); }

#pragma HLS interface s_axilite port = in_3 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_3); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_3); }

#pragma HLS interface s_axilite port = in_4 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_4); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_4); }

#pragma HLS interface s_axilite port = in_5 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_5); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_5); }

#pragma HLS interface s_axilite port = in_6 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_6); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_6); }

#pragma HLS interface s_axilite port = in_7 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_7); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_7); }

#pragma HLS interface s_axilite port = in_8 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_8); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_8); }

#pragma HLS interface s_axilite port = in_9 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_9); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_9); }

#pragma HLS interface s_axilite port = in_10 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_10); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_10); }

#pragma HLS interface s_axilite port = in_11 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_11); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_11); }

#pragma HLS interface s_axilite port = in_12 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_12); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_12); }

#pragma HLS interface s_axilite port = in_13 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_13); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_13); }

#pragma HLS interface s_axilite port = in_14 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_14); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_14); }

#pragma HLS interface s_axilite port = in_15 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_15); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_15); }

#pragma HLS interface s_axilite port = in_16 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_16); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_16); }

#pragma HLS interface s_axilite port = in_17 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_17); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_17); }

#pragma HLS interface s_axilite port = in_18 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_18); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_18); }

#pragma HLS interface s_axilite port = in_19 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_19); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_19); }

#pragma HLS interface s_axilite port = in_20 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_20); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_20); }

#pragma HLS interface s_axilite port = in_21 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_21); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_21); }

#pragma HLS interface s_axilite port = in_22 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_22); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_22); }

#pragma HLS interface s_axilite port = in_23 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_23); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_23); }

#pragma HLS interface s_axilite port = in_24 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_24); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_24); }

#pragma HLS interface s_axilite port = in_25 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_25); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_25); }

#pragma HLS interface s_axilite port = in_26 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_26); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_26); }

#pragma HLS interface s_axilite port = final_out_dist bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(final_out_dist); }
{ auto val = reinterpret_cast<volatile uint8_t&>(final_out_dist); }

#pragma HLS interface s_axilite port = final_out_id bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(final_out_id); }
{ auto val = reinterpret_cast<volatile uint8_t&>(final_out_id); }


#pragma HLS interface s_axilite port = return bundle = control
}


}  // extern "C"