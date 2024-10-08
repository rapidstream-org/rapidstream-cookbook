// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


// Includes
#include "write_mem.h"
#include "common.h"

void write_mem(
    input_stream<uint32>* stream_in,
    output_window<uint32>*  restrict mem_out
) {

    for (int i = 0; i < DATA_NUM; i++) {
        window_writeincr(mem_out, readincr(stream_in));
    }
}
