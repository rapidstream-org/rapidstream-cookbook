// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#pragma once
#include <adf.h>

void kernel_vadd(
	input_window_uint32*  restrict w_s0,
	input_window_uint32*  restrict w_s1,
	input_window_uint32*  restrict w_s2,
	output_stream<uint32>* s3,
	output_stream<uint32>* s4
);
