

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
; // stencil kernel definition
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

#pragma HLS interface s_axilite port = iters bundle = control
{ auto val = reinterpret_cast<volatile uint8_t&>(iters); }


#pragma HLS interface s_axilite port = return bundle = control
}


}  // extern "C"
