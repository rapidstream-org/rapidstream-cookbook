#pragma once
#include <adf.h>

void write_mem(
    input_stream<uint32>* stream_in,
    output_window<uint32>*  restrict mem_out
);
