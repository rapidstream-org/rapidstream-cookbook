// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// Includes
#include <cstdint> /* clang -E -fkeep-system-includes */

#include <adf.h> /* clang -E -fkeep-system-includes */
void read_mem(input_stream<uint32> *stream_in,
              output_stream<uint32> *stream_out);

void add_kernel(input_stream<uint32> *stream_in1,
                input_stream<uint32> *stream_in2,
                output_stream<uint32> *stream_out);

void write_mem(input_stream<uint32> *stream_in,
               output_stream<uint32> *stream_out);

;

/*
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


void VecAdd(tapa::mmap<const uint32_t> mem_in0, tapa::mmap<const uint32_t>
mem_in1, tapa::mmap<uint32_t> mem_out) {

    tapa::stream<uint32_t> stream_in1("input_stream1");
    tapa::stream<uint32_t> stream_in2("input_stream2");
    tapa::stream<uint32_t> stream_out2("output_stream2");

    tapa::task()
    .invoke(krnl_data_mover, mem_in0, mem_in1, mem_out, stream_in1, stream_in2,
stream_out2) .invoke(aie_add, stream_in1, stream_in2, stream_out2);


}
*/
