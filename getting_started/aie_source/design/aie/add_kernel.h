#pragma once
#include <adf.h>

void add_kernel(
    input_stream<uint32>*  stream_in1,
    input_stream<uint32>*  stream_in2,
    output_stream<uint32>* stream_out
);
