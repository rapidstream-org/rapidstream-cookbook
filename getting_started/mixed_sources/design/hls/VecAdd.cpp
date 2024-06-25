// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


// Includes
#include <stdint.h>
#include <hls_stream.h>

#define DATA_SIZE 4096

void read_mem(float* mem_in, hls::stream<float>& stream_out) {
#pragma HLS INTERFACE m_axi port = mem_in bundle = gmem0
#pragma HLS INTERFACE mode=axis register_mode=both port=stream_out register

    for (int i = 0; i < DATA_SIZE; i++) {
#pragma HLS PIPELINE II=1
        stream_out.write(mem_in[i]);
    }
}

// For free running kernel
void kernel_add(hls::stream<float>& stream_in1, hls::stream<float>& stream_in2, hls::stream<float>& stream_out) {
#pragma HLS INTERFACE mode=axis register_mode=both port=stream_in1 register
#pragma HLS INTERFACE mode=axis register_mode=both port=stream_in2 register
#pragma HLS INTERFACE mode=axis register_mode=both port=stream_out register
#pragma HLS interface ap_ctrl_none port = return
// This will create the kernel without ap_start. Kernel will always be in running states.

    // Compute the addition
    for (int i = 0; i < DATA_SIZE; i++) {
#pragma HLS PIPELINE II=1
        stream_out.write(stream_in1.read() + stream_in2.read());
    }
}

void write_mem(hls::stream<float>& stream_in, float* mem_out) {
#pragma HLS INTERFACE m_axi port = mem_out bundle = gmem1
#pragma HLS INTERFACE mode=axis register_mode=both port=stream_in register

    for (int i = 0; i < DATA_SIZE; i++) {
#pragma HLS PIPELINE II=1
        mem_out[i] = stream_in.read();
    }
}
