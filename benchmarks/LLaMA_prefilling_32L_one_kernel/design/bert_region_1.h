
void Bert_layer_dataflow_region_1(
  io_pack_float *inp_addr_0,
  io_pack_float *inp_addr_1,
  io_pack_float *inp_addr_2,
  io_pack_int16 *wk_addr,
  io_pack_int16 *wv_addr,
  io_pack_int16 *wq_addr,
  hls::stream<double_io_pack_int8>& outp_k,
  hls::stream<double_io_pack_int8>& outp_v,
  hls::stream<double_io_pack_int8>& outp_q,
  hls::stream<io_pack_float>& outp_inp
);
