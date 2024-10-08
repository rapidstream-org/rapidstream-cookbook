// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.


#pragma once
#include <adf.h>

void kernel_lshift(
	input_stream<uint32>* s0,
	input_stream<uint32>* s1,
	output_stream<uint32>* s2,
	output_stream<uint32>* s3
);
