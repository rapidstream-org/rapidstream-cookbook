// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>


extern "C" {

	void krnl_output_mover(
		int         mem_out1_size,

		ap_int<32>* mem_out1,

		hls::stream<qdma_axis<32,0,0,0> >& stream_s1
	)
	{
		#pragma HLS INTERFACE m_axi port=mem_out1 offset=slave bundle=gmem1

		#pragma HLS INTERFACE axis port=stream_s1

		#pragma HLS INTERFACE s_axilite port=mem_out1_size bundle=control

		#pragma HLS INTERFACE s_axilite port=mem_out1  bundle=control

		#pragma HLS INTERFACE s_axilite port=return bundle=control

		#pragma HLS DATAFLOW

		for(int i=0; i<mem_out1_size; i++)
		{
			#pragma HLS PIPELINE II=1
			qdma_axis<32,0,0,0> x1;
			x1 = stream_s1.read();
			mem_out1[i] = x1.data;
		}

	}

}
