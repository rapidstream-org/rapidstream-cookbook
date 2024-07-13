

 #include <hls_stream.h>

#include "math.h"

// #define GRID_ROWS 9720


 #include <ap_int.h>

#include <inttypes.h>

 const int WIDTH_FACTOR = 512/32;
// #define OVERLAP_TOP_OVERHEAD 8255
// #define OVERLAP_BOTTOM_OVERHEAD 8382


 #include <tapa.h>

template<class T>
T HLS_REG(T stream_in){
#pragma HLS pipeline
#pragma HLS inline off
#pragma HLS interface port=return register
    return stream_in;
}
static float SEIDEL2D_stencil_kernel(float in_0_1, float in_m1_1, float in_0_0,
    float in_m1_0, float in_m1_m1, float in_0_m1, float in_1_m1, float in_1_1)
{
    /*
        ((stream_in(-1, -1) + stream_in(0, -1) + stream_in(1, -1) + stream_in(-1, 0) + stream_in(0, 0) + stream_in(0, 1) + stream_in(-1, 1) + stream_in(0, 1) + stream_in(1, 1)) / 9)
    */
    float temp_1 = in_m1_m1 + in_0_m1;
    float temp_2 = in_1_m1 + in_m1_0;
    float temp_3 = in_0_0 + in_0_1;
    float temp_4 = in_m1_1 + in_0_1;
    float temp_5 = temp_1 + temp_2;
    float temp_6 = temp_3 + temp_4;
    float temp_7 = temp_5 + temp_6;
    float temp_8 = (temp_7 + in_1_1) / (float)9;
    return temp_8;
    // return ((in_m1_m1 + in_0_m1 + in_1_m1 + in_m1_0 + in_0_0 + in_0_1 + in_m1_1 + in_0_1 + in_1_1) / (float)9);
} // stencil kernel definition
void SEIDEL2D(tapa::istream<ap_uint<512> >& stream_in, tapa::ostream<ap_uint<512> >& stream_out, //int useless,
                uint32_t iters
              )
{
#pragma HLS disaggregate variable = stream_in
#pragma HLS interface ap_fifo port = stream_in._
#pragma HLS aggregate variable = stream_in._ bit
#pragma HLS interface ap_fifo port = stream_in._peek
#pragma HLS aggregate variable = stream_in._peek bit
void(stream_in._.empty());
void(stream_in._peek.empty());

#pragma HLS disaggregate variable = stream_out
#pragma HLS interface ap_fifo port = stream_out._
#pragma HLS aggregate variable = stream_out._ bit
void(stream_out._.full());


    ap_uint<512> in_block_m65;
    ap_uint<512> in_block_m64;
    ap_uint<512> in_block_m63;
    hls::stream<ap_uint<512>, 62> in_stream_m62_to_m2;
    ap_uint<512> in_block_m1;
    ap_uint<512> in_block_0;
    ap_uint<512> in_block_1;
    hls::stream<ap_uint<512>, 62> in_stream_2_to_62;
    ap_uint<512> in_block_63;
    ap_uint<512> in_block_64;
    ap_uint<512> in_block_65;
  for(int m = 0; m < iters; m+=1){
    in_block_m65 = stream_in.read();
    in_block_m64 = stream_in.read();
    in_block_m63 = stream_in.read();
    for (int i = 65 + -62; i < 65 + -1; i++) {
        in_stream_m62_to_m2 << stream_in.read();
    }
    in_block_m1 = stream_in.read();
    in_block_0 = stream_in.read();
    in_block_1 = stream_in.read();
    for (int i = 65 + 2; i < 65 + 63; i++) {
        in_stream_2_to_62 << stream_in.read();
    }
    in_block_63 = stream_in.read();
    in_block_64 = stream_in.read();
    in_block_65 = stream_in.read();
    int i;
    MAJOR_LOOP:
    for (i = 0; i < 1024/WIDTH_FACTOR*60 / 12 + (65 +66)*(iters-1); i++) {
#pragma HLS pipeline II=1
        ap_uint<512> out_temp;
        COMPUTE_LOOP:
        for (int k = 0; k < 16; k++) {
#pragma HLS unroll
            float in_0_1[16], in_m1_1[16], in_0_0[16], in_m1_0[16], in_m1_m1[16], in_0_m1[16], in_1_m1[16], in_1_1[16];
#pragma HLS array_partition variable=in_0_1 complete dim=0
#pragma HLS array_partition variable=in_m1_1 complete dim=0
#pragma HLS array_partition variable=in_0_0 complete dim=0
#pragma HLS array_partition variable=in_m1_0 complete dim=0
#pragma HLS array_partition variable=in_m1_m1 complete dim=0
#pragma HLS array_partition variable=in_0_m1 complete dim=0
#pragma HLS array_partition variable=in_1_m1 complete dim=0
#pragma HLS array_partition variable=in_1_1 complete dim=0
            unsigned int idx_k = k << 5;
            uint32_t temp_in_0_1 = (k<15)?in_block_0.range(idx_k + 63, idx_k + 32) : in_block_1.range(idx_k + -449, idx_k + -480);
            in_0_1[k] = *((float*)(&temp_in_0_1));
            uint32_t temp_in_m1_1 = (k<15)?in_block_m64.range(idx_k + 63, idx_k + 32) : in_block_m63.range(idx_k + -449, idx_k + -480);
            in_m1_1[k] = *((float*)(&temp_in_m1_1));
            uint32_t temp_in_0_0 = in_block_0.range(idx_k+31, idx_k);
            in_0_0[k] = *((float*)(&temp_in_0_0));
            uint32_t temp_in_m1_0 = in_block_m64.range(idx_k+31, idx_k);
            in_m1_0[k] = *((float*)(&temp_in_m1_0));
            uint32_t temp_in_m1_m1 = (k<1)?in_block_m65.range(idx_k + 511, idx_k + 480) : in_block_m64.range(idx_k + -1, idx_k + -32);
            in_m1_m1[k] = *((float*)(&temp_in_m1_m1));
            uint32_t temp_in_0_m1 = (k<1)?in_block_m1.range(idx_k + 511, idx_k + 480) : in_block_0.range(idx_k + -1, idx_k + -32);
            in_0_m1[k] = *((float*)(&temp_in_0_m1));
            uint32_t temp_in_1_m1 = (k<1)?in_block_63.range(idx_k + 511, idx_k + 480) : in_block_64.range(idx_k + -1, idx_k + -32);
            in_1_m1[k] = *((float*)(&temp_in_1_m1));
            uint32_t temp_in_1_1 = (k<15)?in_block_64.range(idx_k + 63, idx_k + 32) : in_block_65.range(idx_k + -449, idx_k + -480);
            in_1_1[k] = *((float*)(&temp_in_1_1));
            //Original version
            float result = SEIDEL2D_stencil_kernel(in_0_1[k], in_m1_1[k], in_0_0[k], in_m1_0[k], in_m1_m1[k], in_0_m1[k], in_1_m1[k], in_1_1[k]);
            out_temp.range(idx_k+31, idx_k) = *((uint32_t *)(&result));
            // out[i + TOP_APPEND + OVERLAP_TOP_OVERHEAD].range(idx_k+31, idx_k) = *((uint32_t *)(&result));
        }
        stream_out.write(out_temp);
        in_block_m65 = HLS_REG(in_block_m64);
        in_block_m64 = HLS_REG(in_block_m63);
        in_block_m63 = in_stream_m62_to_m2.read();
        in_stream_m62_to_m2 << HLS_REG(in_block_m1);
        in_block_m1 = HLS_REG(in_block_0);
        in_block_0 = HLS_REG(in_block_1);
        in_block_1 = in_stream_2_to_62.read();
        in_stream_2_to_62 << HLS_REG(in_block_63);
        in_block_63 = HLS_REG(in_block_64);
        in_block_64 = HLS_REG(in_block_65);
        //unsigned int idx_in = 65 + (i + 66);
        // in_block_65 = HLS_REG(in[idx_in]);
        in_block_65 = HLS_REG(stream_in.read());
    }
    ap_uint<512> popout_in_stream_m62_to_m2;
    while(!in_stream_m62_to_m2.empty()){
    // for (int i = 0; i < 61; i++) {
#pragma HLS pipeline II=1
        in_stream_m62_to_m2 >> popout_in_stream_m62_to_m2;
    }
    ap_uint<512> popout_in_stream_2_to_62;
    while(!in_stream_2_to_62.empty()){
    // for (int i = 0; i < 61; i++) {
#pragma HLS pipeline II=1
        in_stream_2_to_62 >> popout_in_stream_2_to_62;
    }
  }//206
} // stencil kernel definition
void load(tapa::async_mmap<ap_uint<512> >& a, tapa::async_mmap<ap_uint<512> >& b,
                tapa::ostream<ap_uint<512> > &stream_out, tapa::istream<ap_uint<512> > &stream_in,
                uint32_t iters) {
#pragma HLS inline off
  unsigned int loop_bound = 1024/WIDTH_FACTOR*60 / 12 + (65 +66)*(iters-1) + 65 + 66;
  for(int k_wr_req = (65 + 66), k_wr_resp = (65 + 66 ), k_rd_req = 0, k_rd_resp = 0; k_rd_resp < loop_bound || k_wr_resp < loop_bound; ) {
    // read from a
    if (k_rd_req < loop_bound && a.read_addr.try_write(k_rd_req)) {
      k_rd_req++;
    }
    if (k_rd_resp < loop_bound && !a.read_data.empty() && !stream_out.full()) {
      ap_uint<512> temp = a.read_data.read(nullptr);
      stream_out.write(temp);
      k_rd_resp++;
    }
    // write to b
    if (k_wr_req < loop_bound && !b.write_addr.full() && !b.write_data.full() && !stream_in.empty()) {
      b.write_addr.write(k_wr_req);
      b.write_data.write(stream_in.read());
      k_wr_req++;
    }
    if (!b.write_resp.empty()) {
      k_wr_resp += (unsigned int)(b.write_resp.read()) + 1;
    }
  }
}
//Block reading
void inter_kernel(uint64_t  a, uint64_t  b,
                tapa::ostream<ap_uint<512> > &stream_out, tapa::istream<ap_uint<512> > &stream_in,
                uint32_t iters);
void unikernel(uint64_t  in_0, uint64_t  out_0, //HBM 0 1
               uint64_t  in_1, uint64_t  out_1,
               uint64_t  in_2, uint64_t  out_2,
               uint64_t  in_3, uint64_t  out_3,
               uint64_t  in_4, uint64_t  out_4,
               uint64_t  in_5, uint64_t  out_5,
               uint64_t  in_6, uint64_t  out_6,
               uint64_t  in_7, uint64_t  out_7,
               uint64_t  in_8, uint64_t  out_8,
               uint64_t  in_9, uint64_t  out_9,
               uint64_t  in_10, uint64_t  out_10,
               uint64_t  in_11, uint64_t  out_11,
                uint32_t iters);
