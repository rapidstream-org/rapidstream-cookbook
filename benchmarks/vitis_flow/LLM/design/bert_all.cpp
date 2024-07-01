

#include <algorithm>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>
#include <math.h>
#include <stdint.h>
#include "kernel.h"
using namespace std;

#include "bert_region_1.h"
#include "bert_region_2.h"
#include "bert_region_3.h"

#include "const/buf13.h"
#include "const/buf14.h"
#include "const/buf15.h"
#include "const/buf16.h"
#include "const/buf17.h"
#include "const/buf18.h"
#include "const/buf19.h"
#include "const/buf20.h"
#include "const/buf21.h"
#include "const/buf22.h"
#include "const/buf23.h"
#include "const/buf24.h"
#include "const/buf25.h"
#include "const/buf26.h"
#include "const/buf27.h"
#include "const/buf28.h"

extern "C" {
void bert_all1(
    io_pack_float *inp_addr_0,
    io_pack_float *inp_addr_1,
    io_pack_float *inp_addr_2,
    io_pack_int16 *wk_addr,
    io_pack_int16 *wv_addr,
    io_pack_int16 *wq_addr,
    io_pack_int16 *w_ds0_addr,
    double_io_pack_int16 *w_ds1_addr,
    double_io_pack_int16 *w_ds2_addr,
    io_pack_float *outp_addr
){
    #pragma HLS interface m_axi port=inp_addr_0 offset=slave bundle=gmem0
    #pragma HLS interface m_axi port=inp_addr_1 offset=slave bundle=gmem1
    #pragma HLS interface m_axi port=inp_addr_2 offset=slave bundle=gmem2
    #pragma HLS interface m_axi port=wk_addr    offset=slave bundle=gmem3
    #pragma HLS interface m_axi port=wv_addr    offset=slave bundle=gmem4
    #pragma HLS interface m_axi port=wq_addr    offset=slave bundle=gmem5
    #pragma HLS interface m_axi port=w_ds0_addr offset=slave bundle=gmem6
    #pragma HLS interface m_axi port=w_ds1_addr offset=slave bundle=gmem7
    #pragma HLS interface m_axi port=w_ds2_addr offset=slave bundle=gmem8
    #pragma HLS interface m_axi port=outp_addr  offset=slave bundle=gmem9

    #pragma HLS INTERFACE s_axilite port=inp_addr_0 bundle=control
    #pragma HLS INTERFACE s_axilite port=inp_addr_1 bundle=control
    #pragma HLS INTERFACE s_axilite port=inp_addr_2 bundle=control
    #pragma HLS INTERFACE s_axilite port=wk_addr    bundle=control
    #pragma HLS INTERFACE s_axilite port=wv_addr    bundle=control
    #pragma HLS INTERFACE s_axilite port=wq_addr    bundle=control
    #pragma HLS INTERFACE s_axilite port=w_ds0_addr bundle=control
    #pragma HLS INTERFACE s_axilite port=w_ds1_addr bundle=control
    #pragma HLS INTERFACE s_axilite port=w_ds2_addr bundle=control
    #pragma HLS INTERFACE s_axilite port=outp_addr  bundle=control

    #pragma HLS INTERFACE s_axilite port=return bundle=control

    hls::stream<double_io_pack_int8> outp_k;
    #pragma HLS STREAM variable=outp_k depth=16

    hls::stream<double_io_pack_int8> outp_v;
    #pragma HLS STREAM variable=outp_v depth=16

    hls::stream<double_io_pack_int8> outp_q;
    #pragma HLS STREAM variable=outp_q depth=16

    hls::stream<io_pack_float> outp_inp;
    #pragma HLS STREAM variable=outp_inp depth=16

    hls::stream<io_pack_float> outp_ln0;
    #pragma HLS STREAM variable=outp_ln0 depth=16

    #pragma HLS DATAFLOW
    Bert_layer_dataflow_region_1(
        inp_addr_0,
        inp_addr_1,
        inp_addr_2,
        wk_addr,
        wv_addr,
        wq_addr,
        outp_k,
        outp_v,
        outp_q,
        outp_inp
    );

    Bert_layer_dataflow_region_2(
        w_ds0_addr,
        outp_k,
        outp_v,
        outp_q,
        outp_inp,
        outp_ln0
    );

    Bert_layer_dataflow_region_3(
        w_ds1_addr,
        w_ds2_addr,
        outp_ln0,
        outp_addr
    );
}
}

void k1(
    io_pack_float *inp_addr_0,
    io_pack_float *inp_addr_1,
    io_pack_float *inp_addr_2,
    io_pack_int16 *wk_addr,
    io_pack_int16 *wv_addr,
    io_pack_int16 *wq_addr,
    hls::stream<uint32_t>& stream_out
){
    uint32_t out = 0;
    out = inp_addr_0[0] + inp_addr_1[0] + inp_addr_2[0] + wk_addr[0] + wv_addr[0] + wq_addr[0];
    stream_out.write(out);
}


void k2(
    io_pack_int16 *w_ds0_addr,
    double_io_pack_int16 *w_ds1_addr,
    double_io_pack_int16 *w_ds2_addr,
    hls::stream<uint32_t>& stream_out

){
    uint32_t out = 0;
    out = w_ds0_addr[0] + w_ds1_addr[0] + w_ds2_addr[0];
    stream_out.write(out);
}

void k3(
        hls::stream<uint32_t>& stream_in1,
        hls::stream<uint32_t>& stream_in2,
        hls::stream<uint32_t>& stream_out
){
    uint32_t out = 0;
    out = stream_in1.read() + stream_in2.read();
    stream_out.write(out);

}

void k4(
    hls::stream<uint32_t>& stream_in,
    io_pack_float *outp_addr
){
    uint32_t out = 0;
    out = stream_in.read();
    outp_addr[0] = out;
}


extern "C" {
void bert_all(
    io_pack_float *inp_addr_0,
    io_pack_float *inp_addr_1,
    io_pack_float *inp_addr_2,
    io_pack_int16 *wk_addr,
    io_pack_int16 *wv_addr,
    io_pack_int16 *wq_addr,
    io_pack_int16 *w_ds0_addr,
    double_io_pack_int16 *w_ds1_addr,
    double_io_pack_int16 *w_ds2_addr,
    io_pack_float *outp_addr
){
    #pragma HLS interface m_axi port=inp_addr_0 offset=slave bundle=gmem0
    #pragma HLS interface m_axi port=inp_addr_1 offset=slave bundle=gmem1
    #pragma HLS interface m_axi port=inp_addr_2 offset=slave bundle=gmem2
    #pragma HLS interface m_axi port=wk_addr    offset=slave bundle=gmem3
    #pragma HLS interface m_axi port=wv_addr    offset=slave bundle=gmem4
    #pragma HLS interface m_axi port=wq_addr    offset=slave bundle=gmem5
    #pragma HLS interface m_axi port=w_ds0_addr offset=slave bundle=gmem6
    #pragma HLS interface m_axi port=w_ds1_addr offset=slave bundle=gmem7
    #pragma HLS interface m_axi port=w_ds2_addr offset=slave bundle=gmem8
    #pragma HLS interface m_axi port=outp_addr  offset=slave bundle=gmem9

    #pragma HLS INTERFACE s_axilite port=inp_addr_0 bundle=control
    #pragma HLS INTERFACE s_axilite port=inp_addr_1 bundle=control
    #pragma HLS INTERFACE s_axilite port=inp_addr_2 bundle=control
    #pragma HLS INTERFACE s_axilite port=wk_addr    bundle=control
    #pragma HLS INTERFACE s_axilite port=wv_addr    bundle=control
    #pragma HLS INTERFACE s_axilite port=wq_addr    bundle=control
    #pragma HLS INTERFACE s_axilite port=w_ds0_addr bundle=control
    #pragma HLS INTERFACE s_axilite port=w_ds1_addr bundle=control
    #pragma HLS INTERFACE s_axilite port=w_ds2_addr bundle=control
    #pragma HLS INTERFACE s_axilite port=outp_addr  bundle=control

    #pragma HLS INTERFACE s_axilite port=return bundle=control

    static hls::stream<uint32_t> stream_in1("input_stream_1");
    static hls::stream<uint32_t> stream_in2("input_stream_2");
    static hls::stream<uint32_t> stream_in3("input_stream_3");
    static hls::stream<uint32_t> stream_in4("input_stream_4");
    static hls::stream<uint32_t> stream_in5("input_stream_5");
    static hls::stream<uint32_t> stream_in6("input_stream_6");
    static hls::stream<uint32_t> stream_in7("input_stream_7");

#pragma HLS dataflow
    k1(inp_addr_0, inp_addr_1, inp_addr_2, wk_addr, wv_addr, wq_addr, stream_in1);
    k2(w_ds0_addr, w_ds1_addr, w_ds2_addr, stream_in2);
    k3(stream_in1, stream_in2, stream_in3);
    k4(stream_in3, outp_addr);
}
}
