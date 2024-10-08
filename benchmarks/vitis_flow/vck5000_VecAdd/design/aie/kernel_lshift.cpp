// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include "kernel_lshift.h"
#include "common.h"
#include <cstring>

using namespace std;

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// VecAdd krnl to perform s1 << 1
// Input window w_s0: control packet. 64 bytes
// Input window w_s1: intput 1 window, 32bits x s0.VEC_LEN
// Output window w_s2:  output window, 32bits x s0.VEC_LEN
void kernel_lshift(
	input_stream<uint32>* s0,
	input_stream<uint32>* s1,
	output_stream<uint32>* s2,
	output_stream<uint32>* s3
){

	//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	//Acquire S0 control packet
	//window_acquire(w_s0);
	//window_acquire(w_s2);

	uint32_t VEC_NUM = readincr(s0);
	uint32_t VEC_LEN = readincr(s0);

	writeincr(s2, VEC_NUM);
	writeincr(s2, VEC_LEN);

	//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	//Process data
	for (int i = 0; i < VEC_NUM; i++)	// processing data of input vectors
	{
		// The input window size will be 32bits x s0.VEC_LEN
		for (int j = 0; j < VEC_LEN; j++)
		{
			uint32_t in1 = readincr(s1);
			writeincr(s3, (in1<<1));
			//printf("[KERNEL_LSHIFT] processing %d, %d\n", j, *(out+j));
		}

	}

	printf("%s: finish processing\n", __FILE__);

}
