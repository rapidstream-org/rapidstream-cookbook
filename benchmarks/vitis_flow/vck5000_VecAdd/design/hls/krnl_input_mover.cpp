// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.

#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>


extern "C" {

	void krnl_input_mover(
		int          mem_in1_size,
		int          mem_in2_size,
		int          mem_in3_size,

		ap_int<32>* mem_in1,
		ap_int<32>* mem_in2,
		ap_int<32>* mem_in3,

		hls::stream<qdma_axis<32,0,0,0> >& stream_s1,
		hls::stream<qdma_axis<32,0,0,0> >& stream_s2,
		hls::stream<qdma_axis<32,0,0,0> >& stream_s3
	)
	{
		#pragma HLS INTERFACE m_axi port=mem_in1 offset=slave bundle=gmem1
		#pragma HLS INTERFACE m_axi port=mem_in2 offset=slave bundle=gmem2
		#pragma HLS INTERFACE m_axi port=mem_in3 offset=slave bundle=gmem3

		#pragma HLS INTERFACE axis port=stream_s1
		#pragma HLS INTERFACE axis port=stream_s2
		#pragma HLS INTERFACE axis port=stream_s3

		#pragma HLS INTERFACE s_axilite port=mem_in1_size bundle=control
		#pragma HLS INTERFACE s_axilite port=mem_in2_size bundle=control
		#pragma HLS INTERFACE s_axilite port=mem_in3_size bundle=control

		#pragma HLS INTERFACE s_axilite port=mem_in1  bundle=control
		#pragma HLS INTERFACE s_axilite port=mem_in2  bundle=control
		#pragma HLS INTERFACE s_axilite port=mem_in3  bundle=control

		#pragma HLS INTERFACE s_axilite port=return bundle=control

		#pragma HLS DATAFLOW

		for(int i=0; i<mem_in1_size; i++)
		{
			#pragma HLS PIPELINE II=1
			qdma_axis<32,0,0,0> x1;
			x1.data=mem_in1[i];
			x1.keep_all();
			stream_s1.write(x1);
		}

		for(int i=0; i<mem_in2_size; i++)
		{
			#pragma HLS PIPELINE II=1
			qdma_axis<32,0,0,0> x2;
			x2.data=mem_in2[i];
			x2.keep_all();
			stream_s2.write(x2);
		}

		for(int i=0; i<mem_in3_size; i++)
		{
			#pragma HLS PIPELINE II=1
			qdma_axis<32,0,0,0> x3;
			x3.data=mem_in3[i];
			x3.keep_all();
			stream_s3.write(x3);
		}

	}

}
