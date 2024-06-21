// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


// Includes
#include <stdint.h>
#include <hls_stream.h>
#include "VecAdd.h"

static void read_mem(uint32_t* mem_in, hls::stream<uint32_t>& stream_out) {

    for (int i = 0; i < DATA_SIZE; i++) {
#pragma HLS PIPELINE II=1
        stream_out.write(mem_in[i]);
    }
}

static void add_kernel(hls::stream<uint32_t>& stream_in1, hls::stream<uint32_t>& stream_in2, hls::stream<uint32_t>& stream_out) {

    // Compute the addition
    for (int i = 0; i < DATA_SIZE; i++) {
#pragma HLS PIPELINE II=1
        stream_out.write(stream_in1.read() + stream_in2.read());
    }
}

static void write_mem(hls::stream<uint32_t>& stream_in, uint32_t* mem_out) {

    for (int i = 0; i < DATA_SIZE; i++) {
#pragma HLS PIPELINE II=1
        mem_out[i] = stream_in.read();
    }
}

extern "C" {

void VecAdd(uint32_t mem_in1[DATA_SIZE], uint32_t mem_in2[DATA_SIZE], uint32_t mem_out[DATA_SIZE]) {
#pragma HLS INTERFACE m_axi port = mem_in1 bundle = gmem0
#pragma HLS INTERFACE m_axi port = mem_in2 bundle = gmem1
#pragma HLS INTERFACE m_axi port = mem_out bundle = gmem0
#pragma HLS INTERFACE s_axilite port=return bundle=control

    static hls::stream<uint32_t> stream_in1("input_stream_1");
    static hls::stream<uint32_t> stream_in2("input_stream_2");
    static hls::stream<uint32_t> stream_out("output_stream");

#pragma HLS dataflow
    read_mem(mem_in1, stream_in1);
    read_mem(mem_in2, stream_in2);
    add_kernel(stream_in1, stream_in2, stream_out);
    write_mem(stream_out, mem_out);
}
}
