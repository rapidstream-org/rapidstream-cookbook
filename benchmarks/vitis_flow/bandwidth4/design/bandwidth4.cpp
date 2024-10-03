// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include "bandwidth4.h"
#include <stdio.h>


void print_512(bit512 din){
    // Print out the data 64-bit hex per line
    for (int i = 0; i < 8; i++) {
        printf("%08x%08x\n", (unsigned int) din(63+i*64, 32+i*64), (unsigned int) din(31+i*64, 0+i*64));
    }
}

void read_mem(bit512* mem, hls::stream<bit512>& ch, long offset) {
    for (int j = 0; j < 1024; j++) {
        ch.write(mem[(offset<<10) + j]<<1);
    }
}


void write_mem(hls::stream<bit512>& ch, bit512* mem, long offset) {
    for (int j = 0; j < 1024; j++) {
        mem[(offset<<10) + j] =  ch.read();
    }
}



extern "C" {

void bandwidth4(
    bit512* ch_0,
    bit512* ch_1,
    bit512* ch_2,
    bit512* ch_3,
    long n)
{
#pragma HLS INTERFACE m_axi port=ch_0 bundle=ch_0
#pragma HLS INTERFACE m_axi port=ch_1 bundle=ch_1
#pragma HLS INTERFACE m_axi port=ch_2 bundle=ch_2
#pragma HLS INTERFACE m_axi port=ch_3 bundle=ch_3
#pragma HLS INTERFACE s_axilite port=n bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control
    hls::stream<bit512> stream_0;
#pragma HLS STREAM variable=stream_0 depth=2048
    hls::stream<bit512> stream_1;
#pragma HLS STREAM variable=stream_1 depth=2048
    hls::stream<bit512> stream_2;
#pragma HLS STREAM variable=stream_2 depth=2048
    hls::stream<bit512> stream_3;
#pragma HLS STREAM variable=stream_3 depth=2048



    for(int i=0; i<(n>>10); i++){
        read_mem(ch_0, stream_0, i);
        read_mem(ch_1, stream_1, i);
        read_mem(ch_2, stream_2, i);
        read_mem(ch_3, stream_3, i);

        write_mem(stream_0, ch_0, i);
        write_mem(stream_1, ch_1, i);
        write_mem(stream_2, ch_2, i);
        write_mem(stream_3, ch_3, i);
    }
}
}
