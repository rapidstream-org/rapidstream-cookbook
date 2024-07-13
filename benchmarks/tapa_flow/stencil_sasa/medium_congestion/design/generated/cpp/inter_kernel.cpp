

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
; // stencil kernel definition
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
void inter_kernel(tapa::async_mmap<ap_uint<512> >& a, tapa::async_mmap<ap_uint<512> >& b,
                tapa::ostream<ap_uint<512> > &stream_out, tapa::istream<ap_uint<512> > &stream_in,
                uint32_t iters){
#pragma HLS disaggregate variable = a
#pragma HLS interface ap_fifo port = a.read_addr._
#pragma HLS aggregate variable = a.read_addr._  bit
#pragma HLS interface ap_fifo port = a.read_data._
#pragma HLS aggregate variable = a.read_data._  bit
#pragma HLS interface ap_fifo port = a.write_addr._
#pragma HLS aggregate variable = a.write_addr._  bit
#pragma HLS interface ap_fifo port = a.write_data._
#pragma HLS aggregate variable = a.write_data._  bit
#pragma HLS interface ap_fifo port = a.write_resp._
#pragma HLS aggregate variable = a.write_resp._  bit
#pragma HLS disaggregate variable = a .read_data
#pragma HLS interface ap_fifo port = a.read_data._peek
#pragma HLS aggregate variable = a.read_data._peek bit
#pragma HLS disaggregate variable = a .write_resp
#pragma HLS interface ap_fifo port = a.write_resp._peek
#pragma HLS aggregate variable = a.write_resp._peek bit
void(a.read_addr._.full());
void(a.read_data._.empty());
void(a.read_data._peek.empty());
void(a.write_addr._.full());
void(a.write_data._.full());
void(a.write_resp._.empty());
void(a.write_resp._peek.empty());

#pragma HLS disaggregate variable = b
#pragma HLS interface ap_fifo port = b.read_addr._
#pragma HLS aggregate variable = b.read_addr._  bit
#pragma HLS interface ap_fifo port = b.read_data._
#pragma HLS aggregate variable = b.read_data._  bit
#pragma HLS interface ap_fifo port = b.write_addr._
#pragma HLS aggregate variable = b.write_addr._  bit
#pragma HLS interface ap_fifo port = b.write_data._
#pragma HLS aggregate variable = b.write_data._  bit
#pragma HLS interface ap_fifo port = b.write_resp._
#pragma HLS aggregate variable = b.write_resp._  bit
#pragma HLS disaggregate variable = b .read_data
#pragma HLS interface ap_fifo port = b.read_data._peek
#pragma HLS aggregate variable = b.read_data._peek bit
#pragma HLS disaggregate variable = b .write_resp
#pragma HLS interface ap_fifo port = b.write_resp._peek
#pragma HLS aggregate variable = b.write_resp._peek bit
void(b.read_addr._.full());
void(b.read_data._.empty());
void(b.read_data._peek.empty());
void(b.write_addr._.full());
void(b.write_data._.full());
void(b.write_resp._.empty());
void(b.write_resp._peek.empty());

#pragma HLS disaggregate variable = stream_out
#pragma HLS interface ap_fifo port = stream_out._
#pragma HLS aggregate variable = stream_out._ bit
void(stream_out._.full());

#pragma HLS disaggregate variable = stream_in
#pragma HLS interface ap_fifo port = stream_in._
#pragma HLS aggregate variable = stream_in._ bit
#pragma HLS interface ap_fifo port = stream_in._peek
#pragma HLS aggregate variable = stream_in._peek bit
void(stream_in._.empty());
void(stream_in._peek.empty());


  for(int i = 0; i < iters; i+=1){
    if(i%(2*1)==0){
      load(a, b, stream_out, stream_in, iters);
    }
    else{
      load(b, a, stream_out, stream_in, iters);
    }
  }
}
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
