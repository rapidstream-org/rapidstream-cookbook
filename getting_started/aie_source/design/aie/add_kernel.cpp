// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


// Includes
#include "add_kernel.h"
#include "common.h"

void add_kernel(
    input_stream<uint32>*  stream_in1,
    input_stream<uint32>*  stream_in2,
    output_stream<uint32>* stream_out) {

    for (int i = 0; i < DATA_NUM; i++) {
        writeincr(stream_out, readincr(stream_in1) + readincr(stream_in2));
    }
}
