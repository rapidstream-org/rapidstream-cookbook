// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


// Includes
#include <cstdint>
#include <tapa.h>
#define DATA_NUM 64


[[tapa::target("aie", "xilinx")]] void read_mem(tapa::istream<uint32_t>& stream_in, tapa::ostream<uint32_t>& stream_out) {

    for (int i = 0; i < DATA_NUM; i++) {
        stream_out.write(stream_in.read());
        //stream_out.write(mem_in[i]);
    }
}

[[tapa::target("aie", "xilinx")]] void add_kernel(tapa::istream<uint32_t>& stream_in1, tapa::istream<uint32_t>& stream_in2, tapa::ostream<uint32_t>& stream_out) {

    // Compute the addition
    [[tapa::pipeline(1)]] for (int i = 0; i < DATA_NUM; i++) {
        stream_out.write(stream_in1.read() + stream_in2.read());
    }
}

[[tapa::target("aie", "xilinx")]] void write_mem(tapa::istream<uint32_t>& stream_in, tapa::ostream<uint32_t>& stream_out) {

    for (int i = 0; i < DATA_NUM; i++) {
        stream_out.write(stream_in.read());
    }
}

[[tapa::target("aie", "xilinx")]] void aie_add(tapa::istream<uint32_t>& stream_in_a, tapa::istream<uint32_t>& stream_in_b, tapa::ostream<uint32_t>& stream_out_c) {

    tapa::stream<uint32_t> stream_mem_out1("input_stream3");
    tapa::stream<uint32_t> stream_mem_out2("input_stream4");
    tapa::stream<uint32_t> stream_add_out("output_stream1");

    tapa::task()
    .invoke(read_mem, stream_in_a, stream_mem_out1)
    .invoke(read_mem, stream_in_b, stream_mem_out2)
    .invoke(add_kernel, stream_mem_out1, stream_mem_out2, stream_add_out)
    .invoke(write_mem, stream_add_out, stream_out_c);

}


void input_mover(
    tapa::mmap<const uint32_t> mem_in,
    tapa::ostream<uint32_t>& stream_out) {

    for (int i = 0; i < DATA_NUM; i++) {
        //stream_out.write(window_readincr(mem_in));
        stream_out.write(mem_in[i]);
    }
}


void output_mover(
    tapa::istream<uint32_t>& stream_in,
    tapa::mmap<uint32_t>     mem_out) {

    for (int i = 0; i < DATA_NUM; i++) {
        //window_writeincr(mem_out, stream_in.read());
        mem_out[i] = stream_in.read();
    }
}

void krnl_data_mover(
    tapa::mmap<const uint32_t> mem_in0,
    tapa::mmap<const uint32_t> mem_in1,
    tapa::mmap<uint32_t>       mem_out,
    tapa::ostream<uint32_t>&   s0_0,
    tapa::ostream<uint32_t>&   s1_0,
    tapa::istream<uint32_t>&   s2_0
){
    tapa::task()
    .invoke(input_mover, mem_in0, s0_0)
    .invoke(input_mover, mem_in1, s1_0)
    .invoke(output_mover, s2_0, mem_out);

}


void VecAdd(tapa::mmap<const uint32_t> mem_in0, tapa::mmap<const uint32_t> mem_in1, tapa::mmap<uint32_t> mem_out) {

    tapa::stream<uint32_t> stream_in1("input_stream1");
    tapa::stream<uint32_t> stream_in2("input_stream2");
    tapa::stream<uint32_t> stream_out2("output_stream2");

    tapa::task()
    .invoke(krnl_data_mover, mem_in0, mem_in1, mem_out, stream_in1, stream_in2, stream_out2)
    .invoke(aie_add, stream_in1, stream_in2, stream_out2);


}
