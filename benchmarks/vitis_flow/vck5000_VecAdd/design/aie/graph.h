// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#pragma once
#include <adf.h>

#include "kernel_vadd.h"


#include "kernel_lshift.h"


#include "kernel_rshift.h"
#include "kernel_rshift_last.h"


using namespace adf;

#define SHIFT_NUM (4)

// 16 x 32 bits = 64 bytes
#define DATA_SIZE (64)
#define OCCUPANCY (0.9)
#define STARTCOL (0)
#define STARTROW (0)
#define MAXCOL (50)

class graph_overlay: public graph
{

private:
	kernel k_vadd;
	kernel k_lshift[SHIFT_NUM];
	kernel k_rshift[SHIFT_NUM];

public:
	input_plio p_s0;
	input_plio p_s1;
	input_plio p_s2;
	output_plio p_s3;

	graph_overlay()
	{
		// create kernel
		k_vadd                 = kernel::create(kernel_vadd);
		source(k_vadd)         = "../design/aie/kernel_vadd.cpp";
		headers(k_vadd)        = {"../design/aie/kernel_vadd.h","../design/aie/common.h"};
		runtime<ratio>(k_vadd) = OCCUPANCY;

		for(int i=0; i<SHIFT_NUM; i++)
		{
			k_lshift[i] = kernel::create(kernel_lshift);
			source(k_lshift[i])  = "../design/aie/kernel_lshift.cpp";
			headers(k_lshift[i]) = {"../design/aie/kernel_lshift.h","../design/aie/common.h"};
			runtime<ratio>(k_lshift[i]) = OCCUPANCY;
		}

		for(int i=0; i<SHIFT_NUM-1; i++)
		{
			k_rshift[i] = kernel::create(kernel_rshift);
			source(k_rshift[i])  = "../design/aie/kernel_rshift.cpp";
			headers(k_rshift[i]) = {"../design/aie/kernel_rshift.h","../design/aie/common.h"};
			runtime<ratio>(k_rshift[i]) = OCCUPANCY;
		}

		k_rshift[SHIFT_NUM-1] = kernel::create(kernel_rshift_last);
		source(k_rshift[SHIFT_NUM-1])  = "../design/aie/kernel_rshift_last.cpp";
		headers(k_rshift[SHIFT_NUM-1]) = {"../design/aie/kernel_rshift_last.h","../design/aie/common.h"};
		runtime<ratio>(k_rshift[SHIFT_NUM-1]) = OCCUPANCY;

		// Constrain the kernel to fixed locations

		for(int i=0; i<SHIFT_NUM; i++)
		{
			int col_offset = 0;
			int row_offset = 0;

			col_offset = i % MAXCOL;
			row_offset = i / MAXCOL;

			location<kernel>(k_lshift[i]) = tile(STARTCOL+col_offset, STARTROW+2*row_offset);
			location<kernel>(k_rshift[i]) = tile(STARTCOL+col_offset, STARTROW+2*row_offset+1);
		}



		// create port
		p_s0 = input_plio::create("s0",  plio_128_bits, "../data/s0.txt");
		p_s1 = input_plio::create("s1",  plio_32_bits, "../data/s1.txt");
		p_s2 = input_plio::create("s2",  plio_32_bits, "../data/s2.txt");
		p_s3 = output_plio::create("s3", plio_32_bits, "../data/s3_act.txt");


		// connect port and kernel
		connect<window<64>>(p_s0.out[0], k_vadd.in[0]);
		connect<window<DATA_SIZE>>(p_s1.out[0], k_vadd.in[1]);
		connect<window<DATA_SIZE>>(p_s2.out[0], k_vadd.in[2]);
		connect<stream> (k_vadd.out[0],    k_lshift[0].in[0]);

		connect<stream> (k_vadd.out[1],    k_lshift[0].in[1]);
		connect<stream> s_experi(k_lshift[0].out[0], k_rshift[0].in[0]);
		//fifo_depth(s_experi) = 64;

		for(int i=0; i<SHIFT_NUM-1; i++)
		{
			connect<stream> (k_rshift[i].out[0], k_lshift[i+1].in[0]);
			connect<stream> (k_lshift[i+1].out[0], k_rshift[i+1].in[0]);
		}

		for(int i=0; i<SHIFT_NUM-1; i++)
		{
			connect<stream> (k_lshift[i].out[1], k_rshift[i].in[1]);
			connect<stream> (k_rshift[i].out[1], k_lshift[i+1].in[1]);
		}

		connect<stream> (k_lshift[SHIFT_NUM-1].out[1], k_rshift[SHIFT_NUM-1].in[1]);
		connect<window<DATA_SIZE>>(k_rshift[SHIFT_NUM-1].out[0], p_s3.in[0]);

	};

};
