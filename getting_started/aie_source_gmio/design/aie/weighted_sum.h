#pragma once
#include <adf.h>

void weighted_sum(
    input_window<uint32>*   restrict mem_in,
    output_window<uint32>*  mem_out);
