#pragma once
#include <adf.h>

void read_mem(
    input_window<uint32>*  restrict mem_in,
    output_stream<uint32>* stream_out
);
