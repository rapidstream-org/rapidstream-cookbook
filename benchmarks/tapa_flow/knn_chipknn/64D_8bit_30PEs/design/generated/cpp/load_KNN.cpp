

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

#pragma HLS disaggregate variable = searchSpace
#pragma HLS interface ap_fifo port = searchSpace.read_addr._
#pragma HLS aggregate variable = searchSpace.read_addr._  bit
#pragma HLS interface ap_fifo port = searchSpace.read_data._
#pragma HLS aggregate variable = searchSpace.read_data._  bit
#pragma HLS interface ap_fifo port = searchSpace.write_addr._
#pragma HLS aggregate variable = searchSpace.write_addr._  bit
#pragma HLS interface ap_fifo port = searchSpace.write_data._
#pragma HLS aggregate variable = searchSpace.write_data._  bit
#pragma HLS interface ap_fifo port = searchSpace.write_resp._
#pragma HLS aggregate variable = searchSpace.write_resp._  bit
#pragma HLS disaggregate variable = searchSpace .read_data
#pragma HLS interface ap_fifo port = searchSpace.read_data._peek
#pragma HLS aggregate variable = searchSpace.read_data._peek bit
#pragma HLS disaggregate variable = searchSpace .write_resp
#pragma HLS interface ap_fifo port = searchSpace.write_resp._peek
#pragma HLS aggregate variable = searchSpace.write_resp._peek bit
void(searchSpace.read_addr._.full());
void(searchSpace.read_data._.empty());
void(searchSpace.read_data._peek.empty());
void(searchSpace.write_addr._.full());
void(searchSpace.write_data._.full());
void(searchSpace.write_resp._.empty());
void(searchSpace.write_resp._peek.empty());

#pragma HLS disaggregate variable = load_to_compute_stream
#pragma HLS interface ap_fifo port = load_to_compute_stream._
#pragma HLS aggregate variable = load_to_compute_stream._ bit
void(load_to_compute_stream._.full());

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
;
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
;
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
;
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
;
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
    uint64_t  in_27,
    uint64_t  in_28,
    uint64_t  in_29,
    uint64_t  final_out_dist,
    uint64_t  final_out_id
) ;
