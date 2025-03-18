
#pragma once
#include <adf.h>
#include "common.h"
#define OCCUPANCY 0.9
using namespace adf;
class aie_add: public graph
{
private:
    kernel k_add_kernel0;
	kernel k_read_mem0;
	kernel k_read_mem1;
	kernel k_write_mem0;

public:
    input_plio p_stream_in_a;
	input_plio p_stream_in_b;
	output_plio p_stream_out_c;

    aie_add()
	{
		// create kernel
        k_add_kernel0 = kernel::create(add_kernel);
		k_read_mem0 = kernel::create(read_mem);
		k_read_mem1 = kernel::create(read_mem);
		k_write_mem0 = kernel::create(write_mem);
        source(k_add_kernel0) = "../design/aie/add_kernel.cpp";
		source(k_read_mem0) = "../design/aie/read_mem.cpp";
		source(k_read_mem1) = "../design/aie/read_mem.cpp";
		source(k_write_mem0) = "../design/aie/write_mem.cpp";

        runtime<ratio>(k_add_kernel0) = OCCUPANCY;
		runtime<ratio>(k_read_mem0) = OCCUPANCY;
		runtime<ratio>(k_read_mem1) = OCCUPANCY;
		runtime<ratio>(k_write_mem0) = OCCUPANCY;
        //location<kernel>(k_add_kernel0) = tile(X, X);
		//location<kernel>(k_read_mem0) = tile(X, X);
		//location<kernel>(k_read_mem1) = tile(X, X);
		//location<kernel>(k_write_mem0) = tile(X, X);

		// create port
        p_stream_in_a = input_plio::create("stream_in_a", plio_32_bits, "stream_in_a.txt");
		p_stream_in_b = input_plio::create("stream_in_b", plio_32_bits, "stream_in_b.txt");
		p_stream_out_c = output_plio::create("stream_out_c", plio_32_bits, "stream_out_c.txt");

		// connect port and kernel
        connect<stream> stream_add_out (k_add_kernel0.out[0], k_write_mem0.in[0]);
		connect<stream> stream_mem_out1 (k_read_mem0.out[0], k_add_kernel0.in[0]);
		connect<stream> stream_mem_out2 (k_read_mem1.out[0], k_add_kernel0.in[1]);
		connect<stream> stream_in_a_link (p_stream_in_a.out[0], k_read_mem0.in[0]);
		connect<stream> stream_in_b_link (p_stream_in_b.out[0], k_read_mem1.in[0]);
		connect<stream> stream_out_c_link (k_write_mem0.out[0], p_stream_out_c.in[0]);
	};
};
