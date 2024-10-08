// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include "kernel_vadd.h"
#include "common.h"

using namespace std;

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// VecAdd krnl to perform s1 + s2
// Input window w_s0: control packet. 64 bytes
// Input window w_s1: intput 1 window, 32bits x s0.VEC_LEN
// Input window w_s2: intput 2 window, 32bits x s0.VEC_LEN
// Output window w_s3:  output window,  64 bytes
// Output window w_s4:  output window, 32bits x s0.VEC_LEN
void kernel_vadd(
	input_window_uint32*  restrict w_s0,
	input_window_uint32*  restrict w_s1,
	input_window_uint32*  restrict w_s2,
	output_stream<uint32>* s3,
	output_stream<uint32>* s4
	){

	//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	//Acquire S0 control packet
	//window_acquire(w_s0);
	//window_acquire(w_s3);

	overlay_S0_control& s0_ctrl(*reinterpret_cast<overlay_S0_control*>(w_s0->ptr));
	printf("[KERNEL_VADD] s0_ctrl.VEC_NUM = %d\n", s0_ctrl.VEC_NUM);

	writeincr(s3, s0_ctrl.VEC_NUM);
	writeincr(s3, s0_ctrl.VEC_LEN);

	//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	//Process data
	for (int i = 0; i < s0_ctrl.VEC_NUM; i++)	// processing data of input vectors
	{

		// The input window size will be 32bits x s0.VEC_LEN
		//window_acquire(w_s1);
		//window_acquire(w_s2);
		//window_acquire(w_s4);

		//Get working pointers into the acquired S1/S2 windows
		uint32_t* restrict in1  =reinterpret_cast<uint32_t* restrict>(w_s1->ptr);
		uint32_t* restrict in2  =reinterpret_cast<uint32_t* restrict>(w_s2->ptr);


		for (int j = 0; j < s0_ctrl.VEC_LEN; j++) {// processing data of input vectors
			writeincr(s4,  *(in1+j) + *(in2+j));
			printf("[KERNEL_VADD] processing %d\n", j);
		}

		//window_release(w_s1);
		//window_release(w_s2);
		//window_release(w_s4);

	}

	//All done, release S0 window
	//window_release(w_s0);
	//window_release(w_s3);

}
