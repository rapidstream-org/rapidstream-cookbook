// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#pragma once
#include <adf.h>

void kernel_rshift_last(
	input_stream<uint32>* s0,
	input_stream<uint32>* s1,
	output_window_uint32* restrict w_s3
);
