

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
; // stencil kernel definition
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
extern "C" {

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
                uint32_t iters){

#pragma HLS interface s_axilite port = in_0 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_0); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_0); }

#pragma HLS interface s_axilite port = out_0 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_0); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_0); }

#pragma HLS interface s_axilite port = in_1 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_1); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_1); }

#pragma HLS interface s_axilite port = out_1 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_1); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_1); }

#pragma HLS interface s_axilite port = in_2 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_2); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_2); }

#pragma HLS interface s_axilite port = out_2 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_2); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_2); }

#pragma HLS interface s_axilite port = in_3 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_3); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_3); }

#pragma HLS interface s_axilite port = out_3 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_3); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_3); }

#pragma HLS interface s_axilite port = in_4 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_4); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_4); }

#pragma HLS interface s_axilite port = out_4 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_4); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_4); }

#pragma HLS interface s_axilite port = in_5 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_5); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_5); }

#pragma HLS interface s_axilite port = out_5 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_5); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_5); }

#pragma HLS interface s_axilite port = in_6 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_6); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_6); }

#pragma HLS interface s_axilite port = out_6 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_6); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_6); }

#pragma HLS interface s_axilite port = in_7 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_7); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_7); }

#pragma HLS interface s_axilite port = out_7 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_7); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_7); }

#pragma HLS interface s_axilite port = in_8 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_8); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_8); }

#pragma HLS interface s_axilite port = out_8 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_8); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_8); }

#pragma HLS interface s_axilite port = in_9 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_9); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_9); }

#pragma HLS interface s_axilite port = out_9 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_9); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_9); }

#pragma HLS interface s_axilite port = in_10 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_10); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_10); }

#pragma HLS interface s_axilite port = out_10 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_10); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_10); }

#pragma HLS interface s_axilite port = in_11 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_11); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_11); }

#pragma HLS interface s_axilite port = out_11 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_11); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_11); }

#pragma HLS interface s_axilite port = in_12 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_12); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_12); }

#pragma HLS interface s_axilite port = out_12 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_12); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_12); }

#pragma HLS interface s_axilite port = in_13 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_13); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_13); }

#pragma HLS interface s_axilite port = out_13 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_13); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_13); }

#pragma HLS interface s_axilite port = in_14 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(in_14); }
{ auto val = reinterpret_cast<volatile uint8_t&>(in_14); }

#pragma HLS interface s_axilite port = out_14 bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(out_14); }
{ auto val = reinterpret_cast<volatile uint8_t&>(out_14); }

#pragma HLS interface s_axilite port = iters bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(iters); }


#pragma HLS interface s_axilite port = return bundle = control
}


}  // extern "C"
