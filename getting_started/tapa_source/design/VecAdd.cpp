// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


// Includes
#include <cstdint>
#include <tapa.h>
#define DATA_SIZE 4096

void read_mem1(tapa::mmap<const uint32_t> mem_in, tapa::ostream<uint32_t>& stream_out) {

    for (int i = 0; i < DATA_SIZE; i++) {
        stream_out << mem_in[i];
    }
}

void read_mem2(tapa::mmap<const uint32_t> mem_in, tapa::ostream<uint32_t>& stream_out) {

    for (int i = 0; i < DATA_SIZE; i++) {
        stream_out << mem_in[i];
    }
}

void add_kernel(tapa::istream<uint32_t>& stream_in1, tapa::istream<uint32_t>& stream_in2, tapa::ostream<uint32_t>& stream_out) {

    // Compute the addition
    for (int i = 0; i < DATA_SIZE; i++) {
        stream_out << (stream_in1.read() + stream_in2.read());
    }
}

void write_mem(tapa::istream<uint32_t>& stream_in, tapa::mmap<uint32_t> mem_out) {

    for (int i = 0; i < DATA_SIZE; i++) {
        stream_in >> mem_out[i];
    }
}

void VecAdd(tapa::mmap<const uint32_t> mem_in1, tapa::mmap<const uint32_t> mem_in2, tapa::mmap<uint32_t> mem_out) {

    tapa::stream<uint32_t> stream_in1("input_stream_1");
    tapa::stream<uint32_t> stream_in2("input_stream_2");
    tapa::stream<uint32_t> stream_out("output_stream");

    tapa::task()
    .invoke(read_mem1, mem_in1, stream_in1)
    .invoke(read_mem1, mem_in2, stream_in2)
    .invoke(add_kernel, stream_in1, stream_in2, stream_out)
    .invoke(write_mem, stream_out, mem_out);

}
