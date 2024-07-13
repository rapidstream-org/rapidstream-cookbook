

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
float HEAT3D_stencil_kernel(float in_1_0_0, float in_0_0_1,
    float in_0_0_m1, float in_0_0_0, float in_0_m1_0, float in_m1_0_0,
    float in_0_1_0)
{
    /*
        (cal1 + cal2 + cal3 + in(0, 0, 0))
    */
    const float cal1 = ((in_1_0_0 - ((float)2 * in_0_0_0) + in_m1_0_0) / (float)8);
    const float cal2 = ((in_0_1_0 - ((float)2 * in_0_0_0) + in_0_m1_0) / (float)8);
    const float cal3 = ((in_0_0_1 - ((float)2 * in_0_0_0) + in_0_0_m1) / (float)8);
    return (cal1 + cal2 + cal3 + in_0_0_0);
} // stencil kernel definition
void HEAT3D(tapa::istream<ap_uint<512> >&in, tapa::ostream<ap_uint<512> >&out, //int useless,
    int iters)
{
#pragma HLS disaggregate variable = in
#pragma HLS interface ap_fifo port = in._
#pragma HLS aggregate variable = in._ bit
#pragma HLS interface ap_fifo port = in._peek
#pragma HLS aggregate variable = in._peek bit
void(in._.empty());
void(in._peek.empty());

#pragma HLS disaggregate variable = out
#pragma HLS interface ap_fifo port = out._
#pragma HLS aggregate variable = out._ bit
void(out._.full());


    ap_uint<512> in_block_m16;
    hls::stream<ap_uint<512>, 15> in_stream_m15_to_m2;
    ap_uint<512> in_block_m1;
    ap_uint<512> in_block_0;
    ap_uint<512> in_block_1;
    hls::stream<ap_uint<512>, 15> in_stream_2_to_15;
    ap_uint<512> in_block_16;
    in_block_m16 = in.read();
    for (int i = 16 + -15; i < 16 + -1; i++) {
        in_stream_m15_to_m2 << in.read();
    }
    in_block_m1 = in.read();
    in_block_0 = in.read();
    in_block_1 = in.read();
    for (int i = 16 + 2; i < 16 + 16; i++) {
        in_stream_2_to_15 << in.read();
    }
    in_block_16 = in.read();
    MAJOR_LOOP:
    for (int i = 0; i < 256/WIDTH_FACTOR*256 / 12 + (16 +17)*(iters-1); i++) {
#pragma HLS pipeline II=1
        ap_uint<512> out_temp;
        COMPUTE_LOOP:
        for (int k = 0; k < 16; k++) {
#pragma HLS unroll
            float in_1_0_0[16], in_0_0_1[16], in_0_0_m1[16], in_0_0_0[16], in_0_m1_0[16], in_m1_0_0[16], in_0_1_0[16];
#pragma HLS array_partition variable=in_1_0_0 complete dim=0
#pragma HLS array_partition variable=in_0_0_1 complete dim=0
#pragma HLS array_partition variable=in_0_0_m1 complete dim=0
#pragma HLS array_partition variable=in_0_0_0 complete dim=0
#pragma HLS array_partition variable=in_0_m1_0 complete dim=0
#pragma HLS array_partition variable=in_m1_0_0 complete dim=0
#pragma HLS array_partition variable=in_0_1_0 complete dim=0
            unsigned int idx_k = k << 5;
            uint32_t temp_in_1_0_0 = in_block_16.range(idx_k+31, idx_k);
            in_1_0_0[k] = *((float*)(&temp_in_1_0_0));
            uint32_t temp_in_0_0_1 = (k<15)?in_block_0.range(idx_k + 63, idx_k + 32) : in_block_1.range(idx_k + -449, idx_k + -480);
            in_0_0_1[k] = *((float*)(&temp_in_0_0_1));
            uint32_t temp_in_0_0_m1 = (k<1)?in_block_m1.range(idx_k + 511, idx_k + 480) : in_block_0.range(idx_k + -1, idx_k + -32);
            in_0_0_m1[k] = *((float*)(&temp_in_0_0_m1));
            uint32_t temp_in_0_0_0 = in_block_0.range(idx_k+31, idx_k);
            in_0_0_0[k] = *((float*)(&temp_in_0_0_0));
            uint32_t temp_in_0_m1_0 = in_block_m1.range(idx_k+31, idx_k);
            in_0_m1_0[k] = *((float*)(&temp_in_0_m1_0));
            uint32_t temp_in_m1_0_0 = in_block_m16.range(idx_k+31, idx_k);
            in_m1_0_0[k] = *((float*)(&temp_in_m1_0_0));
            uint32_t temp_in_0_1_0 = in_block_1.range(idx_k+31, idx_k);
            in_0_1_0[k] = *((float*)(&temp_in_0_1_0));
            float result = HEAT3D_stencil_kernel(in_1_0_0[k], in_0_0_1[k], in_0_0_m1[k], in_0_0_0[k], in_0_m1_0[k], in_m1_0_0[k], in_0_1_0[k]);
            out_temp.range(idx_k+31, idx_k) = *((uint32_t *)(&result));
        }
        out.write(out_temp);
        in_block_m16 = in_stream_m15_to_m2.read();
        in_stream_m15_to_m2 << HLS_REG(in_block_m1);
        in_block_m1 = HLS_REG(in_block_0);
        in_block_0 = HLS_REG(in_block_1);
        in_block_1 = in_stream_2_to_15.read();
        in_stream_2_to_15 << HLS_REG(in_block_16);
        unsigned int idx_in = 16 + (i + 17);
        in_block_16 = HLS_REG(in.read());
    }
    ap_uint<512> popout_in_stream_m15_to_m2;
    for (int i = 0; i < 14; i++) {
#pragma HLS pipeline II=1
        in_stream_m15_to_m2 >> popout_in_stream_m15_to_m2;
    }
    ap_uint<512> popout_in_stream_2_to_15;
    for (int i = 0; i < 14; i++) {
#pragma HLS pipeline II=1
        in_stream_2_to_15 >> popout_in_stream_2_to_15;
    }
    return;
} // stencil kernel definition
void load(tapa::async_mmap<ap_uint<512> >& a, tapa::async_mmap<ap_uint<512> >& b,
                tapa::ostream<ap_uint<512> > &stream_out, tapa::istream<ap_uint<512> > &stream_in,
                uint32_t iters) {
#pragma HLS inline off
  unsigned int loop_bound = 256/WIDTH_FACTOR*256 / 12 + (16 +17)*(iters-1) + 17 + 16;
  for(int k_wr_req = (17 + 16), k_wr_resp = (17 + 16), k_rd_req = 0, k_rd_resp = 0; k_rd_resp < loop_bound || k_wr_resp < loop_bound; ) {
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
              //  tapa::mmap<INTERFACE_WIDTH> in_12, tapa::mmap<INTERFACE_WIDTH> out_12,
              //  tapa::mmap<INTERFACE_WIDTH> in_13, tapa::mmap<INTERFACE_WIDTH> out_13,
              //  tapa::mmap<INTERFACE_WIDTH> in_14, tapa::mmap<INTERFACE_WIDTH> out_14,
                uint32_t iters);
