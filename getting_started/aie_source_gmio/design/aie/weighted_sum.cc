// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


// Includes
#include "weighted_sum.h"

void weighted_sum(
    input_window<uint32>*   restrict mem_in,
    output_window<uint32>*  mem_out) {

    uint32 sum = 0;
    for (int i = 0; i < 256; i++) {
        window_writeincr(mem_out, window_readincr(mem_in)+1);
    }
}
