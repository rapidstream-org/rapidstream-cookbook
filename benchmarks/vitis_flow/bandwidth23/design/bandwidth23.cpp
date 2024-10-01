// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include "bandwidth23.h"
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

void bandwidth23(
    bit512* ch_0,
    bit512* ch_1,
    bit512* ch_2,
    bit512* ch_3,
    bit512* ch_4,
    bit512* ch_5,
    bit512* ch_6,
    bit512* ch_7,
    bit512* ch_8,
    bit512* ch_9,
    bit512* ch_10,
    bit512* ch_11,
    bit512* ch_12,
    bit512* ch_13,
    bit512* ch_14,
    bit512* ch_15,
    bit512* ch_16,
    bit512* ch_17,
    bit512* ch_18,
    bit512* ch_19,
    bit512* ch_20,
    bit512* ch_21,
    bit512* ch_22,
    long n)
{
#pragma HLS INTERFACE m_axi port=ch_0 bundle=ch_0
#pragma HLS INTERFACE m_axi port=ch_1 bundle=ch_1
#pragma HLS INTERFACE m_axi port=ch_2 bundle=ch_2
#pragma HLS INTERFACE m_axi port=ch_3 bundle=ch_3
#pragma HLS INTERFACE m_axi port=ch_4 bundle=ch_4
#pragma HLS INTERFACE m_axi port=ch_5 bundle=ch_5
#pragma HLS INTERFACE m_axi port=ch_6 bundle=ch_6
#pragma HLS INTERFACE m_axi port=ch_7 bundle=ch_7
#pragma HLS INTERFACE m_axi port=ch_8 bundle=ch_8
#pragma HLS INTERFACE m_axi port=ch_9 bundle=ch_9
#pragma HLS INTERFACE m_axi port=ch_10 bundle=ch_10
#pragma HLS INTERFACE m_axi port=ch_11 bundle=ch_11
#pragma HLS INTERFACE m_axi port=ch_12 bundle=ch_12
#pragma HLS INTERFACE m_axi port=ch_13 bundle=ch_13
#pragma HLS INTERFACE m_axi port=ch_14 bundle=ch_14
#pragma HLS INTERFACE m_axi port=ch_15 bundle=ch_15
#pragma HLS INTERFACE m_axi port=ch_16 bundle=ch_16
#pragma HLS INTERFACE m_axi port=ch_17 bundle=ch_17
#pragma HLS INTERFACE m_axi port=ch_18 bundle=ch_18
#pragma HLS INTERFACE m_axi port=ch_19 bundle=ch_19
#pragma HLS INTERFACE m_axi port=ch_20 bundle=ch_20
#pragma HLS INTERFACE m_axi port=ch_21 bundle=ch_21
#pragma HLS INTERFACE m_axi port=ch_22 bundle=ch_22
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
    hls::stream<bit512> stream_4;
#pragma HLS STREAM variable=stream_4 depth=2048
    hls::stream<bit512> stream_5;
#pragma HLS STREAM variable=stream_5 depth=2048
    hls::stream<bit512> stream_6;
#pragma HLS STREAM variable=stream_6 depth=2048
    hls::stream<bit512> stream_7;
#pragma HLS STREAM variable=stream_7 depth=2048
    hls::stream<bit512> stream_8;
#pragma HLS STREAM variable=stream_8 depth=2048
    hls::stream<bit512> stream_9;
#pragma HLS STREAM variable=stream_9 depth=2048
    hls::stream<bit512> stream_10;
#pragma HLS STREAM variable=stream_10 depth=2048
    hls::stream<bit512> stream_11;
#pragma HLS STREAM variable=stream_11 depth=2048
    hls::stream<bit512> stream_12;
#pragma HLS STREAM variable=stream_12 depth=2048
    hls::stream<bit512> stream_13;
#pragma HLS STREAM variable=stream_13 depth=2048
    hls::stream<bit512> stream_14;
#pragma HLS STREAM variable=stream_14 depth=2048
    hls::stream<bit512> stream_15;
#pragma HLS STREAM variable=stream_15 depth=2048
    hls::stream<bit512> stream_16;
#pragma HLS STREAM variable=stream_16 depth=2048
    hls::stream<bit512> stream_17;
#pragma HLS STREAM variable=stream_17 depth=2048
    hls::stream<bit512> stream_18;
#pragma HLS STREAM variable=stream_18 depth=2048
    hls::stream<bit512> stream_19;
#pragma HLS STREAM variable=stream_19 depth=2048
    hls::stream<bit512> stream_20;
#pragma HLS STREAM variable=stream_20 depth=2048
    hls::stream<bit512> stream_21;
#pragma HLS STREAM variable=stream_21 depth=2048
    hls::stream<bit512> stream_22;
#pragma HLS STREAM variable=stream_22 depth=2048


    for(int i=0; i<(n>>10); i++){
        read_mem(ch_0, stream_0, i);
        read_mem(ch_1, stream_1, i);
        read_mem(ch_2, stream_2, i);
        read_mem(ch_3, stream_3, i);
        read_mem(ch_4, stream_4, i);
        read_mem(ch_5, stream_5, i);
        read_mem(ch_6, stream_6, i);
        read_mem(ch_7, stream_7, i);
        read_mem(ch_8, stream_8, i);
        read_mem(ch_9, stream_9, i);
        read_mem(ch_10, stream_10, i);
        read_mem(ch_11, stream_11, i);
        read_mem(ch_12, stream_12, i);
        read_mem(ch_13, stream_13, i);
        read_mem(ch_14, stream_14, i);
        read_mem(ch_15, stream_15, i);
        read_mem(ch_16, stream_16, i);
        read_mem(ch_17, stream_17, i);
        read_mem(ch_18, stream_18, i);
        read_mem(ch_19, stream_19, i);
        read_mem(ch_20, stream_20, i);
        read_mem(ch_21, stream_21, i);
        read_mem(ch_22, stream_22, i);

        write_mem(stream_0, ch_0, i);
        write_mem(stream_1, ch_1, i);
        write_mem(stream_2, ch_2, i);
        write_mem(stream_3, ch_3, i);
        write_mem(stream_4, ch_4, i);
        write_mem(stream_5, ch_5, i);
        write_mem(stream_6, ch_6, i);
        write_mem(stream_7, ch_7, i);
        write_mem(stream_8, ch_8, i);
        write_mem(stream_9, ch_9, i);
        write_mem(stream_10, ch_10, i);
        write_mem(stream_11, ch_11, i);
        write_mem(stream_12, ch_12, i);
        write_mem(stream_13, ch_13, i);
        write_mem(stream_14, ch_14, i);
        write_mem(stream_15, ch_15, i);
        write_mem(stream_16, ch_16, i);
        write_mem(stream_17, ch_17, i);
        write_mem(stream_18, ch_18, i);
        write_mem(stream_19, ch_19, i);
        write_mem(stream_20, ch_20, i);
        write_mem(stream_21, ch_21, i);
        write_mem(stream_22, ch_22, i);
    }
}
}
