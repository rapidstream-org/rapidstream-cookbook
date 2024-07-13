

 #include <hls_stream.h>

#include "math.h"



 #include "ap_int.h"

#include <inttypes.h>

 const int WIDTH_FACTOR = 512/32;


 #include <tapa.h>

template<class T>
T HLS_REG(T in){
#pragma HLS pipeline
#pragma HLS inline off
#pragma HLS interface port=return register
    return in;
}
static float JACOBI3D_stencil_kernel(float t1_1_0_0, float t1_0_0_1,
    float t1_0_0_m1, float t1_0_0_0, float t1_0_m1_0, float t1_m1_0_0,
    float t1_0_1_0)
{
    /*
        ((t1(0, 0, 0) + t1(1, 0, 0) + t1(-1, 0, 0) + t1(0, 1, 0) + t1(0, -1, 0) + t1(0, 0, 1) + t1(0, 0, -1)) * 0.142857142)
    */
    return ((t1_0_0_0 + t1_1_0_0 + t1_m1_0_0 + t1_0_1_0 + t1_0_m1_0 + t1_0_0_1 + t1_0_0_m1) * (float)0.142857142);
} // stencil kernel definition
void JACOBI3D(tapa::istream<ap_uint<512> >&t1, tapa::ostream<ap_uint<512> >&t0, //int useless,
    int iters)
{
#pragma HLS disaggregate variable = t1
#pragma HLS interface ap_fifo port = t1._
#pragma HLS aggregate variable = t1._ bit
#pragma HLS interface ap_fifo port = t1._peek
#pragma HLS aggregate variable = t1._peek bit
void(t1._.empty());
void(t1._peek.empty());

#pragma HLS disaggregate variable = t0
#pragma HLS interface ap_fifo port = t0._
#pragma HLS aggregate variable = t0._ bit
void(t0._.full());


    ap_uint<512> t1_block_m256;
    hls::stream<ap_uint<512>, 252> t1_stream_m255_to_m5;
    ap_uint<512> t1_block_m4;
    hls::stream<ap_uint<512>, 3> t1_stream_m3_to_m2;
    ap_uint<512> t1_block_m1;
    ap_uint<512> t1_block_0;
    ap_uint<512> t1_block_1;
    hls::stream<ap_uint<512>, 3> t1_stream_2_to_3;
    ap_uint<512> t1_block_4;
    hls::stream<ap_uint<512>, 252> t1_stream_5_to_255;
    ap_uint<512> t1_block_256;
    t1_block_m256 = t1.read();
    for (int i = 256 + -255; i < 256 + -4; i++) {
        t1_stream_m255_to_m5 << t1.read();
    }
    t1_block_m4 = t1.read();
    for (int i = 256 + -3; i < 256 + -1; i++) {
        t1_stream_m3_to_m2 << t1.read();
    }
    t1_block_m1 = t1.read();
    t1_block_0 = t1.read();
    t1_block_1 = t1.read();
    for (int i = 256 + 2; i < 256 + 4; i++) {
        t1_stream_2_to_3 << t1.read();
    }
    t1_block_4 = t1.read();
    for (int i = 256 + 5; i < 256 + 256; i++) {
        t1_stream_5_to_255 << t1.read();
    }
    t1_block_256 = t1.read();
    MAJOR_LOOP:
    for (int i = 0; i < 4096/WIDTH_FACTOR*4096 / 15 + (256 +257)*(iters-1); i++) {
#pragma HLS pipeline II=1
        ap_uint<512> out_temp;
        COMPUTE_LOOP:
        for (int k = 0; k < 16; k++) {
#pragma HLS unroll
            float t1_1_0_0[16], t1_0_0_1[16], t1_0_0_m1[16], t1_0_0_0[16], t1_0_m1_0[16], t1_m1_0_0[16], t1_0_1_0[16];
#pragma HLS array_partition variable=t1_1_0_0 complete dim=0
#pragma HLS array_partition variable=t1_0_0_1 complete dim=0
#pragma HLS array_partition variable=t1_0_0_m1 complete dim=0
#pragma HLS array_partition variable=t1_0_0_0 complete dim=0
#pragma HLS array_partition variable=t1_0_m1_0 complete dim=0
#pragma HLS array_partition variable=t1_m1_0_0 complete dim=0
#pragma HLS array_partition variable=t1_0_1_0 complete dim=0
            unsigned int idx_k = k << 5;
            uint32_t temp_t1_1_0_0 = t1_block_256.range(idx_k+31, idx_k);
            t1_1_0_0[k] = *((float*)(&temp_t1_1_0_0));
            uint32_t temp_t1_0_0_1 = (k<15)?t1_block_0.range(idx_k + 63, idx_k + 32) : t1_block_1.range(idx_k + -449, idx_k + -480);
            t1_0_0_1[k] = *((float*)(&temp_t1_0_0_1));
            uint32_t temp_t1_0_0_m1 = (k<1)?t1_block_m1.range(idx_k + 511, idx_k + 480) : t1_block_0.range(idx_k + -1, idx_k + -32);
            t1_0_0_m1[k] = *((float*)(&temp_t1_0_0_m1));
            uint32_t temp_t1_0_0_0 = t1_block_0.range(idx_k+31, idx_k);
            t1_0_0_0[k] = *((float*)(&temp_t1_0_0_0));
            uint32_t temp_t1_0_m1_0 = t1_block_m4.range(idx_k+31, idx_k);
            t1_0_m1_0[k] = *((float*)(&temp_t1_0_m1_0));
            uint32_t temp_t1_m1_0_0 = t1_block_m256.range(idx_k+31, idx_k);
            t1_m1_0_0[k] = *((float*)(&temp_t1_m1_0_0));
            uint32_t temp_t1_0_1_0 = t1_block_4.range(idx_k+31, idx_k);
            t1_0_1_0[k] = *((float*)(&temp_t1_0_1_0));
            float result = JACOBI3D_stencil_kernel(t1_1_0_0[k], t1_0_0_1[k], t1_0_0_m1[k], t1_0_0_0[k], t1_0_m1_0[k], t1_m1_0_0[k], t1_0_1_0[k]);
            out_temp.range(idx_k+31, idx_k) = *((uint32_t *)(&result));
        }
        t0.write(out_temp);
        t1_block_m256 = t1_stream_m255_to_m5.read();
        t1_stream_m255_to_m5 << HLS_REG(t1_block_m4);
        t1_block_m4 = t1_stream_m3_to_m2.read();
        t1_stream_m3_to_m2 << HLS_REG(t1_block_m1);
        t1_block_m1 = HLS_REG(t1_block_0);
        t1_block_0 = HLS_REG(t1_block_1);
        t1_block_1 = t1_stream_2_to_3.read();
        t1_stream_2_to_3 << HLS_REG(t1_block_4);
        t1_block_4 = t1_stream_5_to_255.read();
        t1_stream_5_to_255 << HLS_REG(t1_block_256);
        unsigned int idx_t1 = 256 + (i + 257);
        t1_block_256 = HLS_REG(t1.read());
    }
    ap_uint<512> popout_t1_stream_m255_to_m5;
    while (!t1_stream_m255_to_m5.empty()) {
#pragma HLS pipeline II=1
        t1_stream_m255_to_m5 >> popout_t1_stream_m255_to_m5;
    }
    ap_uint<512> popout_t1_stream_m3_to_m2;
    while (!t1_stream_m3_to_m2.empty()) {
#pragma HLS pipeline II=1
        t1_stream_m3_to_m2 >> popout_t1_stream_m3_to_m2;
    }
    ap_uint<512> popout_t1_stream_2_to_3;
    while (!t1_stream_2_to_3.empty()) {
#pragma HLS pipeline II=1
        t1_stream_2_to_3 >> popout_t1_stream_2_to_3;
    }
    ap_uint<512> popout_t1_stream_5_to_255;
    while (!t1_stream_5_to_255.empty()) {
#pragma HLS pipeline II=1
        t1_stream_5_to_255 >> popout_t1_stream_5_to_255;
    }
    return;
} // stencil kernel definition
void load(tapa::async_mmap<ap_uint<512> >& a, tapa::async_mmap<ap_uint<512> >& b,
                tapa::ostream<ap_uint<512> > &stream_out, tapa::istream<ap_uint<512> > &stream_in,
                uint32_t iters) {
#pragma HLS inline off
  unsigned int loop_bound = 4096/WIDTH_FACTOR*4096 / 15 + (256 +257)*(iters-1) + 256 + 257;
  for(int k_wr_req = (256 + 257), k_wr_resp = (256 + 257), k_rd_req = 0, k_rd_resp = 0; k_rd_resp < loop_bound || k_wr_resp < loop_bound; ) {
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
               uint64_t  in_12, uint64_t  out_12,
               uint64_t  in_13, uint64_t  out_13,
               uint64_t  in_14, uint64_t  out_14,
                uint32_t iters);
