// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#pragma once
#include <adf.h>
#include "common.h"
#include "add_kernel.h"
#include "read_mem.h"
#include "write_mem.h"


using namespace adf;



class VecAdd: public graph
{

private:
	kernel k_vadd;
	kernel k_read_mem1;
    kernel k_read_mem2;
	kernel k_write_mem;

public:
	input_plio p_s0;
	input_plio p_s1;
	output_plio p_s2;

	VecAdd()
	{
		// create kernel
		k_read_mem1                 = kernel::create(read_mem);
		source(k_read_mem1)         = "../design/aie/read_mem.cpp";
		headers(k_read_mem1)        = {"../design/aie/read_mem.h","../design/aie/common.h"};
		runtime<ratio>(k_read_mem1) = OCCUPANCY;

		k_read_mem2                 = kernel::create(read_mem);
		source(k_read_mem2)         = "../design/aie/read_mem.cpp";
		headers(k_read_mem2)        = {"../design/aie/read_mem.h","../design/aie/common.h"};
		runtime<ratio>(k_read_mem2) = OCCUPANCY;

		k_vadd                      = kernel::create(add_kernel);
		source(k_vadd)              = "../design/aie/add_kernel.cpp";
		headers(k_vadd)             = {"../design/aie/add_kernel.h","../design/aie/common.h"};
		runtime<ratio>(k_vadd)      = OCCUPANCY;

		k_write_mem                 = kernel::create(write_mem);
		source(k_write_mem)         = "../design/aie/write_mem.cpp";
		headers(k_write_mem)        = {"../design/aie/write_mem.h","../design/aie/common.h"};
		runtime<ratio>(k_write_mem) = OCCUPANCY;


        location<kernel>(k_read_mem1) = tile(5, 1);
        location<kernel>(k_read_mem2) = tile(4, 1);
        location<kernel>(k_vadd)      = tile(5, 2);
        location<kernel>(k_write_mem) = tile(4, 2);

		// create port
		p_s0 = input_plio::create("s0",  plio_32_bits, "../data/s0.txt");
		p_s1 = input_plio::create("s1",  plio_32_bits, "../data/s1.txt");
		p_s2 = output_plio::create("s2",  plio_32_bits, "../data/s2_act.txt");


		// connect port and kernel
		connect<window<DATA_SIZE>>(p_s0.out[0], k_read_mem1.in[0]);
		connect<window<DATA_SIZE>>(p_s1.out[0], k_read_mem2.in[0]);
		connect<stream> (k_read_mem1.out[0], k_vadd.in[0]);
        connect<stream> (k_read_mem2.out[0], k_vadd.in[1]);
        connect<stream> (k_vadd.out[0], k_write_mem.in[0]);
		connect<window<DATA_SIZE>>(k_write_mem.out[0], p_s2.in[0]);
	};

};
