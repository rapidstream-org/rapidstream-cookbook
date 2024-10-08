// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


// Includes
#include "read_mem.h"
#include "common.h"

void read_mem(
    input_window<uint32>*  restrict mem_in,
    output_stream<uint32>* stream_out) {

    for (int i = 0; i < DATA_NUM; i++) {
        writeincr(stream_out, window_readincr(mem_in));
    }
}
