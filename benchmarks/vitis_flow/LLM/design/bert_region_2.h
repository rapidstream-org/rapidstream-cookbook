void Bert_layer_dataflow_region_2(
    io_pack_int16 *w_ds0_addr,
    hls::stream<double_io_pack_int8>& outp_k,
    hls::stream<double_io_pack_int8>& outp_v,
    hls::stream<double_io_pack_int8>& outp_q,
    hls::stream<io_pack_float>& outp_inp,
    hls::stream<io_pack_float>& outp_ln0 // depth=4
);
