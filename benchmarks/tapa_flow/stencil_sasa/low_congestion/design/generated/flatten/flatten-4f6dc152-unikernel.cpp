

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
void inter_kernel(tapa::async_mmap<ap_uint<512> >& a, tapa::async_mmap<ap_uint<512> >& b,
                tapa::ostream<ap_uint<512> > &stream_out, tapa::istream<ap_uint<512> > &stream_in,
                uint32_t iters){
  for(int i = 0; i < iters; i+=1){
    if(i%(2*1)==0){
      load(a, b, stream_out, stream_in, iters);
    }
    else{
      load(b, a, stream_out, stream_in, iters);
    }
  }
}
void unikernel(tapa::mmap<ap_uint<512> > in_0, tapa::mmap<ap_uint<512> > out_0, //HBM 0 1
               tapa::mmap<ap_uint<512> > in_1, tapa::mmap<ap_uint<512> > out_1,
               tapa::mmap<ap_uint<512> > in_2, tapa::mmap<ap_uint<512> > out_2,
               tapa::mmap<ap_uint<512> > in_3, tapa::mmap<ap_uint<512> > out_3,
               tapa::mmap<ap_uint<512> > in_4, tapa::mmap<ap_uint<512> > out_4,
               tapa::mmap<ap_uint<512> > in_5, tapa::mmap<ap_uint<512> > out_5,
               tapa::mmap<ap_uint<512> > in_6, tapa::mmap<ap_uint<512> > out_6,
               tapa::mmap<ap_uint<512> > in_7, tapa::mmap<ap_uint<512> > out_7,
               tapa::mmap<ap_uint<512> > in_8, tapa::mmap<ap_uint<512> > out_8,
               tapa::mmap<ap_uint<512> > in_9, tapa::mmap<ap_uint<512> > out_9,
               tapa::mmap<ap_uint<512> > in_10, tapa::mmap<ap_uint<512> > out_10,
               tapa::mmap<ap_uint<512> > in_11, tapa::mmap<ap_uint<512> > out_11,
                uint32_t iters){
  tapa::streams<ap_uint<512>, 12, 3> k_wr;
  tapa::streams<ap_uint<512>, 12, 3> k_rd;
  tapa::task()
    .invoke(inter_kernel, in_0, out_0, k_rd[0], k_wr[0], iters)
    .invoke(SEIDEL2D, k_rd[0], k_wr[0], iters)
    .invoke(inter_kernel, in_1, out_1, k_rd[1], k_wr[1], iters)
    .invoke(SEIDEL2D, k_rd[1], k_wr[1], iters)
    .invoke(inter_kernel, in_2, out_2, k_rd[2], k_wr[2], iters)
    .invoke(SEIDEL2D, k_rd[2], k_wr[2], iters)
    .invoke(inter_kernel, in_3, out_3, k_rd[3], k_wr[3], iters)
    .invoke(SEIDEL2D, k_rd[3], k_wr[3], iters)
    .invoke(inter_kernel, in_4, out_4, k_rd[4], k_wr[4], iters)
    .invoke(SEIDEL2D, k_rd[4], k_wr[4], iters)
    .invoke(inter_kernel, in_5, out_5, k_rd[5], k_wr[5], iters)
    .invoke(SEIDEL2D, k_rd[5], k_wr[5], iters)
    .invoke(inter_kernel, in_6, out_6, k_rd[6], k_wr[6], iters)
    .invoke(SEIDEL2D, k_rd[6], k_wr[6], iters)
    .invoke(inter_kernel, in_7, out_7, k_rd[7], k_wr[7], iters)
    .invoke(SEIDEL2D, k_rd[7], k_wr[7], iters)
    .invoke(inter_kernel, in_8, out_8, k_rd[8], k_wr[8], iters)
    .invoke(SEIDEL2D, k_rd[8], k_wr[8], iters)
    .invoke(inter_kernel, in_9, out_9, k_rd[9], k_wr[9], iters)
    .invoke(SEIDEL2D, k_rd[9], k_wr[9], iters)
    .invoke(inter_kernel, in_10, out_10, k_rd[10], k_wr[10], iters)
    .invoke(SEIDEL2D, k_rd[10], k_wr[10], iters)
    .invoke(inter_kernel, in_11, out_11, k_rd[11], k_wr[11], iters)
    .invoke(SEIDEL2D, k_rd[11], k_wr[11], iters)
    ;
}
