#include <hls_stream.h>
#include "math.h"
#include "HEAT3D.h"
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

void HEAT3D(tapa::istream<INTERFACE_WIDTH>&in, tapa::ostream<INTERFACE_WIDTH>&out, //int useless,
    int iters)
{
    INTERFACE_WIDTH in_block_m16;
    hls::stream<INTERFACE_WIDTH, 15> in_stream_m15_to_m2;
    INTERFACE_WIDTH in_block_m1;
    INTERFACE_WIDTH in_block_0;
    INTERFACE_WIDTH in_block_1;
    hls::stream<INTERFACE_WIDTH, 15> in_stream_2_to_15;
    INTERFACE_WIDTH in_block_16;

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
    for (int i = 0; i < GRID_COLS/WIDTH_FACTOR*PART_ROWS + (TOP_APPEND+BOTTOM_APPEND)*(iters-1); i++) {
        #pragma HLS pipeline II=1
        INTERFACE_WIDTH out_temp;
        COMPUTE_LOOP:
        for (int k = 0; k < PARA_FACTOR; k++) {
            #pragma HLS unroll
            float in_1_0_0[PARA_FACTOR], in_0_0_1[PARA_FACTOR], in_0_0_m1[PARA_FACTOR], in_0_0_0[PARA_FACTOR], in_0_m1_0[PARA_FACTOR], in_m1_0_0[PARA_FACTOR], in_0_1_0[PARA_FACTOR];
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

    INTERFACE_WIDTH popout_in_stream_m15_to_m2;
    for (int i = 0; i < 14; i++) {
        #pragma HLS pipeline II=1
        in_stream_m15_to_m2 >> popout_in_stream_m15_to_m2;
    }
    INTERFACE_WIDTH popout_in_stream_2_to_15;
    for (int i = 0; i < 14; i++) {
        #pragma HLS pipeline II=1
        in_stream_2_to_15 >> popout_in_stream_2_to_15;
    }
    return;
} // stencil kernel definition

void load(tapa::async_mmap<INTERFACE_WIDTH>& a, tapa::async_mmap<INTERFACE_WIDTH>& b,
                tapa::ostream<INTERFACE_WIDTH> &stream_out, tapa::istream<INTERFACE_WIDTH> &stream_in,
                uint32_t iters) {
  #pragma HLS inline off
  unsigned int loop_bound = GRID_COLS/WIDTH_FACTOR*PART_ROWS + (TOP_APPEND+BOTTOM_APPEND)*(iters-1) + 17 + 16;

  for(int k_wr_req = (17 + 16), k_wr_resp = (17 + 16), k_rd_req = 0, k_rd_resp = 0; k_rd_resp < loop_bound || k_wr_resp < loop_bound; ) {
    // read from a
    if (k_rd_req < loop_bound && a.read_addr.try_write(k_rd_req)) {
      k_rd_req++;
    }
    if (k_rd_resp < loop_bound && !a.read_data.empty() && !stream_out.full()) {
      INTERFACE_WIDTH temp = a.read_data.read(nullptr);
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

void inter_kernel(tapa::async_mmap<INTERFACE_WIDTH>& a, tapa::async_mmap<INTERFACE_WIDTH>& b,
                tapa::ostream<INTERFACE_WIDTH> &stream_out, tapa::istream<INTERFACE_WIDTH> &stream_in,
                uint32_t iters){

  for(int i = 0; i < iters; i+=STAGE_COUNT){
    if(i%(2*STAGE_COUNT)==0){
      load(a, b, stream_out, stream_in, iters);
    }
    else{
      load(b, a, stream_out, stream_in, iters);
    }
  }
}

void unikernel(tapa::mmap<INTERFACE_WIDTH> in_0, tapa::mmap<INTERFACE_WIDTH> out_0, //HBM 0 1
               tapa::mmap<INTERFACE_WIDTH> in_1, tapa::mmap<INTERFACE_WIDTH> out_1,
               tapa::mmap<INTERFACE_WIDTH> in_2, tapa::mmap<INTERFACE_WIDTH> out_2,
               tapa::mmap<INTERFACE_WIDTH> in_3, tapa::mmap<INTERFACE_WIDTH> out_3,
               tapa::mmap<INTERFACE_WIDTH> in_4, tapa::mmap<INTERFACE_WIDTH> out_4,
               tapa::mmap<INTERFACE_WIDTH> in_5, tapa::mmap<INTERFACE_WIDTH> out_5,
               tapa::mmap<INTERFACE_WIDTH> in_6, tapa::mmap<INTERFACE_WIDTH> out_6,
               tapa::mmap<INTERFACE_WIDTH> in_7, tapa::mmap<INTERFACE_WIDTH> out_7,
               tapa::mmap<INTERFACE_WIDTH> in_8, tapa::mmap<INTERFACE_WIDTH> out_8,
               tapa::mmap<INTERFACE_WIDTH> in_9, tapa::mmap<INTERFACE_WIDTH> out_9,
               tapa::mmap<INTERFACE_WIDTH> in_10, tapa::mmap<INTERFACE_WIDTH> out_10,
               tapa::mmap<INTERFACE_WIDTH> in_11, tapa::mmap<INTERFACE_WIDTH> out_11,
              //  tapa::mmap<INTERFACE_WIDTH> in_12, tapa::mmap<INTERFACE_WIDTH> out_12,
              //  tapa::mmap<INTERFACE_WIDTH> in_13, tapa::mmap<INTERFACE_WIDTH> out_13,
              //  tapa::mmap<INTERFACE_WIDTH> in_14, tapa::mmap<INTERFACE_WIDTH> out_14,
                uint32_t iters){
  tapa::streams<INTERFACE_WIDTH, 15, 3> k_wr;
  tapa::streams<INTERFACE_WIDTH, 15, 3> k_rd;

  tapa::task()
    .invoke(inter_kernel, in_0, out_0, k_rd[0], k_wr[0], iters)
    .invoke(HEAT3D, k_rd[0], k_wr[0], iters)
    .invoke(inter_kernel, in_1, out_1, k_rd[1], k_wr[1], iters)
    .invoke(HEAT3D, k_rd[1], k_wr[1], iters)
    .invoke(inter_kernel, in_2, out_2, k_rd[2], k_wr[2], iters)
    .invoke(HEAT3D, k_rd[2], k_wr[2], iters)
    .invoke(inter_kernel, in_3, out_3, k_rd[3], k_wr[3], iters)
    .invoke(HEAT3D, k_rd[3], k_wr[3], iters)
    .invoke(inter_kernel, in_4, out_4, k_rd[4], k_wr[4], iters)
    .invoke(HEAT3D, k_rd[4], k_wr[4], iters)
    .invoke(inter_kernel, in_5, out_5, k_rd[5], k_wr[5], iters)
    .invoke(HEAT3D, k_rd[5], k_wr[5], iters)
    .invoke(inter_kernel, in_6, out_6, k_rd[6], k_wr[6], iters)
    .invoke(HEAT3D, k_rd[6], k_wr[6], iters)
    .invoke(inter_kernel, in_7, out_7, k_rd[7], k_wr[7], iters)
    .invoke(HEAT3D, k_rd[7], k_wr[7], iters)
    .invoke(inter_kernel, in_8, out_8, k_rd[8], k_wr[8], iters)
    .invoke(HEAT3D, k_rd[8], k_wr[8], iters)
    .invoke(inter_kernel, in_9, out_9, k_rd[9], k_wr[9], iters)
    .invoke(HEAT3D, k_rd[9], k_wr[9], iters)
    .invoke(inter_kernel, in_10, out_10, k_rd[10], k_wr[10], iters)
    .invoke(HEAT3D, k_rd[10], k_wr[10], iters)
    .invoke(inter_kernel, in_11, out_11, k_rd[11], k_wr[11], iters)
    .invoke(HEAT3D, k_rd[11], k_wr[11], iters)
    // .invoke(inter_kernel, in_12, out_12, k_rd[12], k_wr[12], iters)
    // .invoke(HEAT3D, k_rd[12], k_wr[12], iters)
    // .invoke(inter_kernel, in_13, out_13, k_rd[13], k_wr[13], iters)
    // .invoke(HEAT3D, k_rd[13], k_wr[13], iters)
    // .invoke(inter_kernel, in_14, out_14, k_rd[14], k_wr[14], iters)
    // .invoke(HEAT3D, k_rd[14], k_wr[14], iters)
    ;
}
