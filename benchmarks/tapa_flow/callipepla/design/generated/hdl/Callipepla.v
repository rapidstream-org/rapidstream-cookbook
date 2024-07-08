`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO = "Callipepla_Callipepla,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=4.300000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2078,HLS_SYN_LUT=3752,HLS_VERSION=2022_2}" *)


module Callipepla
(
  s_axi_control_AWVALID,
  s_axi_control_AWREADY,
  s_axi_control_AWADDR,
  s_axi_control_WVALID,
  s_axi_control_WREADY,
  s_axi_control_WDATA,
  s_axi_control_WSTRB,
  s_axi_control_ARVALID,
  s_axi_control_ARREADY,
  s_axi_control_ARADDR,
  s_axi_control_RVALID,
  s_axi_control_RREADY,
  s_axi_control_RDATA,
  s_axi_control_RRESP,
  s_axi_control_BVALID,
  s_axi_control_BREADY,
  s_axi_control_BRESP,
  ap_clk,
  ap_rst_n,
  interrupt,
  m_axi_vec_p_0_ARADDR,
  m_axi_vec_p_0_ARBURST,
  m_axi_vec_p_0_ARCACHE,
  m_axi_vec_p_0_ARID,
  m_axi_vec_p_0_ARLEN,
  m_axi_vec_p_0_ARLOCK,
  m_axi_vec_p_0_ARPROT,
  m_axi_vec_p_0_ARQOS,
  m_axi_vec_p_0_ARREADY,
  m_axi_vec_p_0_ARSIZE,
  m_axi_vec_p_0_ARVALID,
  m_axi_vec_p_0_AWADDR,
  m_axi_vec_p_0_AWBURST,
  m_axi_vec_p_0_AWCACHE,
  m_axi_vec_p_0_AWID,
  m_axi_vec_p_0_AWLEN,
  m_axi_vec_p_0_AWLOCK,
  m_axi_vec_p_0_AWPROT,
  m_axi_vec_p_0_AWQOS,
  m_axi_vec_p_0_AWREADY,
  m_axi_vec_p_0_AWSIZE,
  m_axi_vec_p_0_AWVALID,
  m_axi_vec_p_0_BID,
  m_axi_vec_p_0_BREADY,
  m_axi_vec_p_0_BRESP,
  m_axi_vec_p_0_BVALID,
  m_axi_vec_p_0_RDATA,
  m_axi_vec_p_0_RID,
  m_axi_vec_p_0_RLAST,
  m_axi_vec_p_0_RREADY,
  m_axi_vec_p_0_RRESP,
  m_axi_vec_p_0_RVALID,
  m_axi_vec_p_0_WDATA,
  m_axi_vec_p_0_WLAST,
  m_axi_vec_p_0_WREADY,
  m_axi_vec_p_0_WSTRB,
  m_axi_vec_p_0_WVALID,
  m_axi_vec_p_1_ARADDR,
  m_axi_vec_p_1_ARBURST,
  m_axi_vec_p_1_ARCACHE,
  m_axi_vec_p_1_ARID,
  m_axi_vec_p_1_ARLEN,
  m_axi_vec_p_1_ARLOCK,
  m_axi_vec_p_1_ARPROT,
  m_axi_vec_p_1_ARQOS,
  m_axi_vec_p_1_ARREADY,
  m_axi_vec_p_1_ARSIZE,
  m_axi_vec_p_1_ARVALID,
  m_axi_vec_p_1_AWADDR,
  m_axi_vec_p_1_AWBURST,
  m_axi_vec_p_1_AWCACHE,
  m_axi_vec_p_1_AWID,
  m_axi_vec_p_1_AWLEN,
  m_axi_vec_p_1_AWLOCK,
  m_axi_vec_p_1_AWPROT,
  m_axi_vec_p_1_AWQOS,
  m_axi_vec_p_1_AWREADY,
  m_axi_vec_p_1_AWSIZE,
  m_axi_vec_p_1_AWVALID,
  m_axi_vec_p_1_BID,
  m_axi_vec_p_1_BREADY,
  m_axi_vec_p_1_BRESP,
  m_axi_vec_p_1_BVALID,
  m_axi_vec_p_1_RDATA,
  m_axi_vec_p_1_RID,
  m_axi_vec_p_1_RLAST,
  m_axi_vec_p_1_RREADY,
  m_axi_vec_p_1_RRESP,
  m_axi_vec_p_1_RVALID,
  m_axi_vec_p_1_WDATA,
  m_axi_vec_p_1_WLAST,
  m_axi_vec_p_1_WREADY,
  m_axi_vec_p_1_WSTRB,
  m_axi_vec_p_1_WVALID,
  m_axi_vec_r_0_ARADDR,
  m_axi_vec_r_0_ARBURST,
  m_axi_vec_r_0_ARCACHE,
  m_axi_vec_r_0_ARID,
  m_axi_vec_r_0_ARLEN,
  m_axi_vec_r_0_ARLOCK,
  m_axi_vec_r_0_ARPROT,
  m_axi_vec_r_0_ARQOS,
  m_axi_vec_r_0_ARREADY,
  m_axi_vec_r_0_ARSIZE,
  m_axi_vec_r_0_ARVALID,
  m_axi_vec_r_0_AWADDR,
  m_axi_vec_r_0_AWBURST,
  m_axi_vec_r_0_AWCACHE,
  m_axi_vec_r_0_AWID,
  m_axi_vec_r_0_AWLEN,
  m_axi_vec_r_0_AWLOCK,
  m_axi_vec_r_0_AWPROT,
  m_axi_vec_r_0_AWQOS,
  m_axi_vec_r_0_AWREADY,
  m_axi_vec_r_0_AWSIZE,
  m_axi_vec_r_0_AWVALID,
  m_axi_vec_r_0_BID,
  m_axi_vec_r_0_BREADY,
  m_axi_vec_r_0_BRESP,
  m_axi_vec_r_0_BVALID,
  m_axi_vec_r_0_RDATA,
  m_axi_vec_r_0_RID,
  m_axi_vec_r_0_RLAST,
  m_axi_vec_r_0_RREADY,
  m_axi_vec_r_0_RRESP,
  m_axi_vec_r_0_RVALID,
  m_axi_vec_r_0_WDATA,
  m_axi_vec_r_0_WLAST,
  m_axi_vec_r_0_WREADY,
  m_axi_vec_r_0_WSTRB,
  m_axi_vec_r_0_WVALID,
  m_axi_vec_r_1_ARADDR,
  m_axi_vec_r_1_ARBURST,
  m_axi_vec_r_1_ARCACHE,
  m_axi_vec_r_1_ARID,
  m_axi_vec_r_1_ARLEN,
  m_axi_vec_r_1_ARLOCK,
  m_axi_vec_r_1_ARPROT,
  m_axi_vec_r_1_ARQOS,
  m_axi_vec_r_1_ARREADY,
  m_axi_vec_r_1_ARSIZE,
  m_axi_vec_r_1_ARVALID,
  m_axi_vec_r_1_AWADDR,
  m_axi_vec_r_1_AWBURST,
  m_axi_vec_r_1_AWCACHE,
  m_axi_vec_r_1_AWID,
  m_axi_vec_r_1_AWLEN,
  m_axi_vec_r_1_AWLOCK,
  m_axi_vec_r_1_AWPROT,
  m_axi_vec_r_1_AWQOS,
  m_axi_vec_r_1_AWREADY,
  m_axi_vec_r_1_AWSIZE,
  m_axi_vec_r_1_AWVALID,
  m_axi_vec_r_1_BID,
  m_axi_vec_r_1_BREADY,
  m_axi_vec_r_1_BRESP,
  m_axi_vec_r_1_BVALID,
  m_axi_vec_r_1_RDATA,
  m_axi_vec_r_1_RID,
  m_axi_vec_r_1_RLAST,
  m_axi_vec_r_1_RREADY,
  m_axi_vec_r_1_RRESP,
  m_axi_vec_r_1_RVALID,
  m_axi_vec_r_1_WDATA,
  m_axi_vec_r_1_WLAST,
  m_axi_vec_r_1_WREADY,
  m_axi_vec_r_1_WSTRB,
  m_axi_vec_r_1_WVALID,
  m_axi_vec_x_0_ARADDR,
  m_axi_vec_x_0_ARBURST,
  m_axi_vec_x_0_ARCACHE,
  m_axi_vec_x_0_ARID,
  m_axi_vec_x_0_ARLEN,
  m_axi_vec_x_0_ARLOCK,
  m_axi_vec_x_0_ARPROT,
  m_axi_vec_x_0_ARQOS,
  m_axi_vec_x_0_ARREADY,
  m_axi_vec_x_0_ARSIZE,
  m_axi_vec_x_0_ARVALID,
  m_axi_vec_x_0_AWADDR,
  m_axi_vec_x_0_AWBURST,
  m_axi_vec_x_0_AWCACHE,
  m_axi_vec_x_0_AWID,
  m_axi_vec_x_0_AWLEN,
  m_axi_vec_x_0_AWLOCK,
  m_axi_vec_x_0_AWPROT,
  m_axi_vec_x_0_AWQOS,
  m_axi_vec_x_0_AWREADY,
  m_axi_vec_x_0_AWSIZE,
  m_axi_vec_x_0_AWVALID,
  m_axi_vec_x_0_BID,
  m_axi_vec_x_0_BREADY,
  m_axi_vec_x_0_BRESP,
  m_axi_vec_x_0_BVALID,
  m_axi_vec_x_0_RDATA,
  m_axi_vec_x_0_RID,
  m_axi_vec_x_0_RLAST,
  m_axi_vec_x_0_RREADY,
  m_axi_vec_x_0_RRESP,
  m_axi_vec_x_0_RVALID,
  m_axi_vec_x_0_WDATA,
  m_axi_vec_x_0_WLAST,
  m_axi_vec_x_0_WREADY,
  m_axi_vec_x_0_WSTRB,
  m_axi_vec_x_0_WVALID,
  m_axi_vec_x_1_ARADDR,
  m_axi_vec_x_1_ARBURST,
  m_axi_vec_x_1_ARCACHE,
  m_axi_vec_x_1_ARID,
  m_axi_vec_x_1_ARLEN,
  m_axi_vec_x_1_ARLOCK,
  m_axi_vec_x_1_ARPROT,
  m_axi_vec_x_1_ARQOS,
  m_axi_vec_x_1_ARREADY,
  m_axi_vec_x_1_ARSIZE,
  m_axi_vec_x_1_ARVALID,
  m_axi_vec_x_1_AWADDR,
  m_axi_vec_x_1_AWBURST,
  m_axi_vec_x_1_AWCACHE,
  m_axi_vec_x_1_AWID,
  m_axi_vec_x_1_AWLEN,
  m_axi_vec_x_1_AWLOCK,
  m_axi_vec_x_1_AWPROT,
  m_axi_vec_x_1_AWQOS,
  m_axi_vec_x_1_AWREADY,
  m_axi_vec_x_1_AWSIZE,
  m_axi_vec_x_1_AWVALID,
  m_axi_vec_x_1_BID,
  m_axi_vec_x_1_BREADY,
  m_axi_vec_x_1_BRESP,
  m_axi_vec_x_1_BVALID,
  m_axi_vec_x_1_RDATA,
  m_axi_vec_x_1_RID,
  m_axi_vec_x_1_RLAST,
  m_axi_vec_x_1_RREADY,
  m_axi_vec_x_1_RRESP,
  m_axi_vec_x_1_RVALID,
  m_axi_vec_x_1_WDATA,
  m_axi_vec_x_1_WLAST,
  m_axi_vec_x_1_WREADY,
  m_axi_vec_x_1_WSTRB,
  m_axi_vec_x_1_WVALID,
  m_axi_vec_Ap_ARADDR,
  m_axi_vec_Ap_ARBURST,
  m_axi_vec_Ap_ARCACHE,
  m_axi_vec_Ap_ARID,
  m_axi_vec_Ap_ARLEN,
  m_axi_vec_Ap_ARLOCK,
  m_axi_vec_Ap_ARPROT,
  m_axi_vec_Ap_ARQOS,
  m_axi_vec_Ap_ARREADY,
  m_axi_vec_Ap_ARSIZE,
  m_axi_vec_Ap_ARVALID,
  m_axi_vec_Ap_AWADDR,
  m_axi_vec_Ap_AWBURST,
  m_axi_vec_Ap_AWCACHE,
  m_axi_vec_Ap_AWID,
  m_axi_vec_Ap_AWLEN,
  m_axi_vec_Ap_AWLOCK,
  m_axi_vec_Ap_AWPROT,
  m_axi_vec_Ap_AWQOS,
  m_axi_vec_Ap_AWREADY,
  m_axi_vec_Ap_AWSIZE,
  m_axi_vec_Ap_AWVALID,
  m_axi_vec_Ap_BID,
  m_axi_vec_Ap_BREADY,
  m_axi_vec_Ap_BRESP,
  m_axi_vec_Ap_BVALID,
  m_axi_vec_Ap_RDATA,
  m_axi_vec_Ap_RID,
  m_axi_vec_Ap_RLAST,
  m_axi_vec_Ap_RREADY,
  m_axi_vec_Ap_RRESP,
  m_axi_vec_Ap_RVALID,
  m_axi_vec_Ap_WDATA,
  m_axi_vec_Ap_WLAST,
  m_axi_vec_Ap_WREADY,
  m_axi_vec_Ap_WSTRB,
  m_axi_vec_Ap_WVALID,
  m_axi_edge_list_ch_0_ARADDR,
  m_axi_edge_list_ch_0_ARBURST,
  m_axi_edge_list_ch_0_ARCACHE,
  m_axi_edge_list_ch_0_ARID,
  m_axi_edge_list_ch_0_ARLEN,
  m_axi_edge_list_ch_0_ARLOCK,
  m_axi_edge_list_ch_0_ARPROT,
  m_axi_edge_list_ch_0_ARQOS,
  m_axi_edge_list_ch_0_ARREADY,
  m_axi_edge_list_ch_0_ARSIZE,
  m_axi_edge_list_ch_0_ARVALID,
  m_axi_edge_list_ch_0_AWADDR,
  m_axi_edge_list_ch_0_AWBURST,
  m_axi_edge_list_ch_0_AWCACHE,
  m_axi_edge_list_ch_0_AWID,
  m_axi_edge_list_ch_0_AWLEN,
  m_axi_edge_list_ch_0_AWLOCK,
  m_axi_edge_list_ch_0_AWPROT,
  m_axi_edge_list_ch_0_AWQOS,
  m_axi_edge_list_ch_0_AWREADY,
  m_axi_edge_list_ch_0_AWSIZE,
  m_axi_edge_list_ch_0_AWVALID,
  m_axi_edge_list_ch_0_BID,
  m_axi_edge_list_ch_0_BREADY,
  m_axi_edge_list_ch_0_BRESP,
  m_axi_edge_list_ch_0_BVALID,
  m_axi_edge_list_ch_0_RDATA,
  m_axi_edge_list_ch_0_RID,
  m_axi_edge_list_ch_0_RLAST,
  m_axi_edge_list_ch_0_RREADY,
  m_axi_edge_list_ch_0_RRESP,
  m_axi_edge_list_ch_0_RVALID,
  m_axi_edge_list_ch_0_WDATA,
  m_axi_edge_list_ch_0_WLAST,
  m_axi_edge_list_ch_0_WREADY,
  m_axi_edge_list_ch_0_WSTRB,
  m_axi_edge_list_ch_0_WVALID,
  m_axi_edge_list_ch_1_ARADDR,
  m_axi_edge_list_ch_1_ARBURST,
  m_axi_edge_list_ch_1_ARCACHE,
  m_axi_edge_list_ch_1_ARID,
  m_axi_edge_list_ch_1_ARLEN,
  m_axi_edge_list_ch_1_ARLOCK,
  m_axi_edge_list_ch_1_ARPROT,
  m_axi_edge_list_ch_1_ARQOS,
  m_axi_edge_list_ch_1_ARREADY,
  m_axi_edge_list_ch_1_ARSIZE,
  m_axi_edge_list_ch_1_ARVALID,
  m_axi_edge_list_ch_1_AWADDR,
  m_axi_edge_list_ch_1_AWBURST,
  m_axi_edge_list_ch_1_AWCACHE,
  m_axi_edge_list_ch_1_AWID,
  m_axi_edge_list_ch_1_AWLEN,
  m_axi_edge_list_ch_1_AWLOCK,
  m_axi_edge_list_ch_1_AWPROT,
  m_axi_edge_list_ch_1_AWQOS,
  m_axi_edge_list_ch_1_AWREADY,
  m_axi_edge_list_ch_1_AWSIZE,
  m_axi_edge_list_ch_1_AWVALID,
  m_axi_edge_list_ch_1_BID,
  m_axi_edge_list_ch_1_BREADY,
  m_axi_edge_list_ch_1_BRESP,
  m_axi_edge_list_ch_1_BVALID,
  m_axi_edge_list_ch_1_RDATA,
  m_axi_edge_list_ch_1_RID,
  m_axi_edge_list_ch_1_RLAST,
  m_axi_edge_list_ch_1_RREADY,
  m_axi_edge_list_ch_1_RRESP,
  m_axi_edge_list_ch_1_RVALID,
  m_axi_edge_list_ch_1_WDATA,
  m_axi_edge_list_ch_1_WLAST,
  m_axi_edge_list_ch_1_WREADY,
  m_axi_edge_list_ch_1_WSTRB,
  m_axi_edge_list_ch_1_WVALID,
  m_axi_edge_list_ch_2_ARADDR,
  m_axi_edge_list_ch_2_ARBURST,
  m_axi_edge_list_ch_2_ARCACHE,
  m_axi_edge_list_ch_2_ARID,
  m_axi_edge_list_ch_2_ARLEN,
  m_axi_edge_list_ch_2_ARLOCK,
  m_axi_edge_list_ch_2_ARPROT,
  m_axi_edge_list_ch_2_ARQOS,
  m_axi_edge_list_ch_2_ARREADY,
  m_axi_edge_list_ch_2_ARSIZE,
  m_axi_edge_list_ch_2_ARVALID,
  m_axi_edge_list_ch_2_AWADDR,
  m_axi_edge_list_ch_2_AWBURST,
  m_axi_edge_list_ch_2_AWCACHE,
  m_axi_edge_list_ch_2_AWID,
  m_axi_edge_list_ch_2_AWLEN,
  m_axi_edge_list_ch_2_AWLOCK,
  m_axi_edge_list_ch_2_AWPROT,
  m_axi_edge_list_ch_2_AWQOS,
  m_axi_edge_list_ch_2_AWREADY,
  m_axi_edge_list_ch_2_AWSIZE,
  m_axi_edge_list_ch_2_AWVALID,
  m_axi_edge_list_ch_2_BID,
  m_axi_edge_list_ch_2_BREADY,
  m_axi_edge_list_ch_2_BRESP,
  m_axi_edge_list_ch_2_BVALID,
  m_axi_edge_list_ch_2_RDATA,
  m_axi_edge_list_ch_2_RID,
  m_axi_edge_list_ch_2_RLAST,
  m_axi_edge_list_ch_2_RREADY,
  m_axi_edge_list_ch_2_RRESP,
  m_axi_edge_list_ch_2_RVALID,
  m_axi_edge_list_ch_2_WDATA,
  m_axi_edge_list_ch_2_WLAST,
  m_axi_edge_list_ch_2_WREADY,
  m_axi_edge_list_ch_2_WSTRB,
  m_axi_edge_list_ch_2_WVALID,
  m_axi_edge_list_ch_3_ARADDR,
  m_axi_edge_list_ch_3_ARBURST,
  m_axi_edge_list_ch_3_ARCACHE,
  m_axi_edge_list_ch_3_ARID,
  m_axi_edge_list_ch_3_ARLEN,
  m_axi_edge_list_ch_3_ARLOCK,
  m_axi_edge_list_ch_3_ARPROT,
  m_axi_edge_list_ch_3_ARQOS,
  m_axi_edge_list_ch_3_ARREADY,
  m_axi_edge_list_ch_3_ARSIZE,
  m_axi_edge_list_ch_3_ARVALID,
  m_axi_edge_list_ch_3_AWADDR,
  m_axi_edge_list_ch_3_AWBURST,
  m_axi_edge_list_ch_3_AWCACHE,
  m_axi_edge_list_ch_3_AWID,
  m_axi_edge_list_ch_3_AWLEN,
  m_axi_edge_list_ch_3_AWLOCK,
  m_axi_edge_list_ch_3_AWPROT,
  m_axi_edge_list_ch_3_AWQOS,
  m_axi_edge_list_ch_3_AWREADY,
  m_axi_edge_list_ch_3_AWSIZE,
  m_axi_edge_list_ch_3_AWVALID,
  m_axi_edge_list_ch_3_BID,
  m_axi_edge_list_ch_3_BREADY,
  m_axi_edge_list_ch_3_BRESP,
  m_axi_edge_list_ch_3_BVALID,
  m_axi_edge_list_ch_3_RDATA,
  m_axi_edge_list_ch_3_RID,
  m_axi_edge_list_ch_3_RLAST,
  m_axi_edge_list_ch_3_RREADY,
  m_axi_edge_list_ch_3_RRESP,
  m_axi_edge_list_ch_3_RVALID,
  m_axi_edge_list_ch_3_WDATA,
  m_axi_edge_list_ch_3_WLAST,
  m_axi_edge_list_ch_3_WREADY,
  m_axi_edge_list_ch_3_WSTRB,
  m_axi_edge_list_ch_3_WVALID,
  m_axi_edge_list_ch_4_ARADDR,
  m_axi_edge_list_ch_4_ARBURST,
  m_axi_edge_list_ch_4_ARCACHE,
  m_axi_edge_list_ch_4_ARID,
  m_axi_edge_list_ch_4_ARLEN,
  m_axi_edge_list_ch_4_ARLOCK,
  m_axi_edge_list_ch_4_ARPROT,
  m_axi_edge_list_ch_4_ARQOS,
  m_axi_edge_list_ch_4_ARREADY,
  m_axi_edge_list_ch_4_ARSIZE,
  m_axi_edge_list_ch_4_ARVALID,
  m_axi_edge_list_ch_4_AWADDR,
  m_axi_edge_list_ch_4_AWBURST,
  m_axi_edge_list_ch_4_AWCACHE,
  m_axi_edge_list_ch_4_AWID,
  m_axi_edge_list_ch_4_AWLEN,
  m_axi_edge_list_ch_4_AWLOCK,
  m_axi_edge_list_ch_4_AWPROT,
  m_axi_edge_list_ch_4_AWQOS,
  m_axi_edge_list_ch_4_AWREADY,
  m_axi_edge_list_ch_4_AWSIZE,
  m_axi_edge_list_ch_4_AWVALID,
  m_axi_edge_list_ch_4_BID,
  m_axi_edge_list_ch_4_BREADY,
  m_axi_edge_list_ch_4_BRESP,
  m_axi_edge_list_ch_4_BVALID,
  m_axi_edge_list_ch_4_RDATA,
  m_axi_edge_list_ch_4_RID,
  m_axi_edge_list_ch_4_RLAST,
  m_axi_edge_list_ch_4_RREADY,
  m_axi_edge_list_ch_4_RRESP,
  m_axi_edge_list_ch_4_RVALID,
  m_axi_edge_list_ch_4_WDATA,
  m_axi_edge_list_ch_4_WLAST,
  m_axi_edge_list_ch_4_WREADY,
  m_axi_edge_list_ch_4_WSTRB,
  m_axi_edge_list_ch_4_WVALID,
  m_axi_edge_list_ch_5_ARADDR,
  m_axi_edge_list_ch_5_ARBURST,
  m_axi_edge_list_ch_5_ARCACHE,
  m_axi_edge_list_ch_5_ARID,
  m_axi_edge_list_ch_5_ARLEN,
  m_axi_edge_list_ch_5_ARLOCK,
  m_axi_edge_list_ch_5_ARPROT,
  m_axi_edge_list_ch_5_ARQOS,
  m_axi_edge_list_ch_5_ARREADY,
  m_axi_edge_list_ch_5_ARSIZE,
  m_axi_edge_list_ch_5_ARVALID,
  m_axi_edge_list_ch_5_AWADDR,
  m_axi_edge_list_ch_5_AWBURST,
  m_axi_edge_list_ch_5_AWCACHE,
  m_axi_edge_list_ch_5_AWID,
  m_axi_edge_list_ch_5_AWLEN,
  m_axi_edge_list_ch_5_AWLOCK,
  m_axi_edge_list_ch_5_AWPROT,
  m_axi_edge_list_ch_5_AWQOS,
  m_axi_edge_list_ch_5_AWREADY,
  m_axi_edge_list_ch_5_AWSIZE,
  m_axi_edge_list_ch_5_AWVALID,
  m_axi_edge_list_ch_5_BID,
  m_axi_edge_list_ch_5_BREADY,
  m_axi_edge_list_ch_5_BRESP,
  m_axi_edge_list_ch_5_BVALID,
  m_axi_edge_list_ch_5_RDATA,
  m_axi_edge_list_ch_5_RID,
  m_axi_edge_list_ch_5_RLAST,
  m_axi_edge_list_ch_5_RREADY,
  m_axi_edge_list_ch_5_RRESP,
  m_axi_edge_list_ch_5_RVALID,
  m_axi_edge_list_ch_5_WDATA,
  m_axi_edge_list_ch_5_WLAST,
  m_axi_edge_list_ch_5_WREADY,
  m_axi_edge_list_ch_5_WSTRB,
  m_axi_edge_list_ch_5_WVALID,
  m_axi_edge_list_ch_6_ARADDR,
  m_axi_edge_list_ch_6_ARBURST,
  m_axi_edge_list_ch_6_ARCACHE,
  m_axi_edge_list_ch_6_ARID,
  m_axi_edge_list_ch_6_ARLEN,
  m_axi_edge_list_ch_6_ARLOCK,
  m_axi_edge_list_ch_6_ARPROT,
  m_axi_edge_list_ch_6_ARQOS,
  m_axi_edge_list_ch_6_ARREADY,
  m_axi_edge_list_ch_6_ARSIZE,
  m_axi_edge_list_ch_6_ARVALID,
  m_axi_edge_list_ch_6_AWADDR,
  m_axi_edge_list_ch_6_AWBURST,
  m_axi_edge_list_ch_6_AWCACHE,
  m_axi_edge_list_ch_6_AWID,
  m_axi_edge_list_ch_6_AWLEN,
  m_axi_edge_list_ch_6_AWLOCK,
  m_axi_edge_list_ch_6_AWPROT,
  m_axi_edge_list_ch_6_AWQOS,
  m_axi_edge_list_ch_6_AWREADY,
  m_axi_edge_list_ch_6_AWSIZE,
  m_axi_edge_list_ch_6_AWVALID,
  m_axi_edge_list_ch_6_BID,
  m_axi_edge_list_ch_6_BREADY,
  m_axi_edge_list_ch_6_BRESP,
  m_axi_edge_list_ch_6_BVALID,
  m_axi_edge_list_ch_6_RDATA,
  m_axi_edge_list_ch_6_RID,
  m_axi_edge_list_ch_6_RLAST,
  m_axi_edge_list_ch_6_RREADY,
  m_axi_edge_list_ch_6_RRESP,
  m_axi_edge_list_ch_6_RVALID,
  m_axi_edge_list_ch_6_WDATA,
  m_axi_edge_list_ch_6_WLAST,
  m_axi_edge_list_ch_6_WREADY,
  m_axi_edge_list_ch_6_WSTRB,
  m_axi_edge_list_ch_6_WVALID,
  m_axi_edge_list_ch_7_ARADDR,
  m_axi_edge_list_ch_7_ARBURST,
  m_axi_edge_list_ch_7_ARCACHE,
  m_axi_edge_list_ch_7_ARID,
  m_axi_edge_list_ch_7_ARLEN,
  m_axi_edge_list_ch_7_ARLOCK,
  m_axi_edge_list_ch_7_ARPROT,
  m_axi_edge_list_ch_7_ARQOS,
  m_axi_edge_list_ch_7_ARREADY,
  m_axi_edge_list_ch_7_ARSIZE,
  m_axi_edge_list_ch_7_ARVALID,
  m_axi_edge_list_ch_7_AWADDR,
  m_axi_edge_list_ch_7_AWBURST,
  m_axi_edge_list_ch_7_AWCACHE,
  m_axi_edge_list_ch_7_AWID,
  m_axi_edge_list_ch_7_AWLEN,
  m_axi_edge_list_ch_7_AWLOCK,
  m_axi_edge_list_ch_7_AWPROT,
  m_axi_edge_list_ch_7_AWQOS,
  m_axi_edge_list_ch_7_AWREADY,
  m_axi_edge_list_ch_7_AWSIZE,
  m_axi_edge_list_ch_7_AWVALID,
  m_axi_edge_list_ch_7_BID,
  m_axi_edge_list_ch_7_BREADY,
  m_axi_edge_list_ch_7_BRESP,
  m_axi_edge_list_ch_7_BVALID,
  m_axi_edge_list_ch_7_RDATA,
  m_axi_edge_list_ch_7_RID,
  m_axi_edge_list_ch_7_RLAST,
  m_axi_edge_list_ch_7_RREADY,
  m_axi_edge_list_ch_7_RRESP,
  m_axi_edge_list_ch_7_RVALID,
  m_axi_edge_list_ch_7_WDATA,
  m_axi_edge_list_ch_7_WLAST,
  m_axi_edge_list_ch_7_WREADY,
  m_axi_edge_list_ch_7_WSTRB,
  m_axi_edge_list_ch_7_WVALID,
  m_axi_edge_list_ch_8_ARADDR,
  m_axi_edge_list_ch_8_ARBURST,
  m_axi_edge_list_ch_8_ARCACHE,
  m_axi_edge_list_ch_8_ARID,
  m_axi_edge_list_ch_8_ARLEN,
  m_axi_edge_list_ch_8_ARLOCK,
  m_axi_edge_list_ch_8_ARPROT,
  m_axi_edge_list_ch_8_ARQOS,
  m_axi_edge_list_ch_8_ARREADY,
  m_axi_edge_list_ch_8_ARSIZE,
  m_axi_edge_list_ch_8_ARVALID,
  m_axi_edge_list_ch_8_AWADDR,
  m_axi_edge_list_ch_8_AWBURST,
  m_axi_edge_list_ch_8_AWCACHE,
  m_axi_edge_list_ch_8_AWID,
  m_axi_edge_list_ch_8_AWLEN,
  m_axi_edge_list_ch_8_AWLOCK,
  m_axi_edge_list_ch_8_AWPROT,
  m_axi_edge_list_ch_8_AWQOS,
  m_axi_edge_list_ch_8_AWREADY,
  m_axi_edge_list_ch_8_AWSIZE,
  m_axi_edge_list_ch_8_AWVALID,
  m_axi_edge_list_ch_8_BID,
  m_axi_edge_list_ch_8_BREADY,
  m_axi_edge_list_ch_8_BRESP,
  m_axi_edge_list_ch_8_BVALID,
  m_axi_edge_list_ch_8_RDATA,
  m_axi_edge_list_ch_8_RID,
  m_axi_edge_list_ch_8_RLAST,
  m_axi_edge_list_ch_8_RREADY,
  m_axi_edge_list_ch_8_RRESP,
  m_axi_edge_list_ch_8_RVALID,
  m_axi_edge_list_ch_8_WDATA,
  m_axi_edge_list_ch_8_WLAST,
  m_axi_edge_list_ch_8_WREADY,
  m_axi_edge_list_ch_8_WSTRB,
  m_axi_edge_list_ch_8_WVALID,
  m_axi_edge_list_ch_9_ARADDR,
  m_axi_edge_list_ch_9_ARBURST,
  m_axi_edge_list_ch_9_ARCACHE,
  m_axi_edge_list_ch_9_ARID,
  m_axi_edge_list_ch_9_ARLEN,
  m_axi_edge_list_ch_9_ARLOCK,
  m_axi_edge_list_ch_9_ARPROT,
  m_axi_edge_list_ch_9_ARQOS,
  m_axi_edge_list_ch_9_ARREADY,
  m_axi_edge_list_ch_9_ARSIZE,
  m_axi_edge_list_ch_9_ARVALID,
  m_axi_edge_list_ch_9_AWADDR,
  m_axi_edge_list_ch_9_AWBURST,
  m_axi_edge_list_ch_9_AWCACHE,
  m_axi_edge_list_ch_9_AWID,
  m_axi_edge_list_ch_9_AWLEN,
  m_axi_edge_list_ch_9_AWLOCK,
  m_axi_edge_list_ch_9_AWPROT,
  m_axi_edge_list_ch_9_AWQOS,
  m_axi_edge_list_ch_9_AWREADY,
  m_axi_edge_list_ch_9_AWSIZE,
  m_axi_edge_list_ch_9_AWVALID,
  m_axi_edge_list_ch_9_BID,
  m_axi_edge_list_ch_9_BREADY,
  m_axi_edge_list_ch_9_BRESP,
  m_axi_edge_list_ch_9_BVALID,
  m_axi_edge_list_ch_9_RDATA,
  m_axi_edge_list_ch_9_RID,
  m_axi_edge_list_ch_9_RLAST,
  m_axi_edge_list_ch_9_RREADY,
  m_axi_edge_list_ch_9_RRESP,
  m_axi_edge_list_ch_9_RVALID,
  m_axi_edge_list_ch_9_WDATA,
  m_axi_edge_list_ch_9_WLAST,
  m_axi_edge_list_ch_9_WREADY,
  m_axi_edge_list_ch_9_WSTRB,
  m_axi_edge_list_ch_9_WVALID,
  m_axi_edge_list_ch_10_ARADDR,
  m_axi_edge_list_ch_10_ARBURST,
  m_axi_edge_list_ch_10_ARCACHE,
  m_axi_edge_list_ch_10_ARID,
  m_axi_edge_list_ch_10_ARLEN,
  m_axi_edge_list_ch_10_ARLOCK,
  m_axi_edge_list_ch_10_ARPROT,
  m_axi_edge_list_ch_10_ARQOS,
  m_axi_edge_list_ch_10_ARREADY,
  m_axi_edge_list_ch_10_ARSIZE,
  m_axi_edge_list_ch_10_ARVALID,
  m_axi_edge_list_ch_10_AWADDR,
  m_axi_edge_list_ch_10_AWBURST,
  m_axi_edge_list_ch_10_AWCACHE,
  m_axi_edge_list_ch_10_AWID,
  m_axi_edge_list_ch_10_AWLEN,
  m_axi_edge_list_ch_10_AWLOCK,
  m_axi_edge_list_ch_10_AWPROT,
  m_axi_edge_list_ch_10_AWQOS,
  m_axi_edge_list_ch_10_AWREADY,
  m_axi_edge_list_ch_10_AWSIZE,
  m_axi_edge_list_ch_10_AWVALID,
  m_axi_edge_list_ch_10_BID,
  m_axi_edge_list_ch_10_BREADY,
  m_axi_edge_list_ch_10_BRESP,
  m_axi_edge_list_ch_10_BVALID,
  m_axi_edge_list_ch_10_RDATA,
  m_axi_edge_list_ch_10_RID,
  m_axi_edge_list_ch_10_RLAST,
  m_axi_edge_list_ch_10_RREADY,
  m_axi_edge_list_ch_10_RRESP,
  m_axi_edge_list_ch_10_RVALID,
  m_axi_edge_list_ch_10_WDATA,
  m_axi_edge_list_ch_10_WLAST,
  m_axi_edge_list_ch_10_WREADY,
  m_axi_edge_list_ch_10_WSTRB,
  m_axi_edge_list_ch_10_WVALID,
  m_axi_edge_list_ch_11_ARADDR,
  m_axi_edge_list_ch_11_ARBURST,
  m_axi_edge_list_ch_11_ARCACHE,
  m_axi_edge_list_ch_11_ARID,
  m_axi_edge_list_ch_11_ARLEN,
  m_axi_edge_list_ch_11_ARLOCK,
  m_axi_edge_list_ch_11_ARPROT,
  m_axi_edge_list_ch_11_ARQOS,
  m_axi_edge_list_ch_11_ARREADY,
  m_axi_edge_list_ch_11_ARSIZE,
  m_axi_edge_list_ch_11_ARVALID,
  m_axi_edge_list_ch_11_AWADDR,
  m_axi_edge_list_ch_11_AWBURST,
  m_axi_edge_list_ch_11_AWCACHE,
  m_axi_edge_list_ch_11_AWID,
  m_axi_edge_list_ch_11_AWLEN,
  m_axi_edge_list_ch_11_AWLOCK,
  m_axi_edge_list_ch_11_AWPROT,
  m_axi_edge_list_ch_11_AWQOS,
  m_axi_edge_list_ch_11_AWREADY,
  m_axi_edge_list_ch_11_AWSIZE,
  m_axi_edge_list_ch_11_AWVALID,
  m_axi_edge_list_ch_11_BID,
  m_axi_edge_list_ch_11_BREADY,
  m_axi_edge_list_ch_11_BRESP,
  m_axi_edge_list_ch_11_BVALID,
  m_axi_edge_list_ch_11_RDATA,
  m_axi_edge_list_ch_11_RID,
  m_axi_edge_list_ch_11_RLAST,
  m_axi_edge_list_ch_11_RREADY,
  m_axi_edge_list_ch_11_RRESP,
  m_axi_edge_list_ch_11_RVALID,
  m_axi_edge_list_ch_11_WDATA,
  m_axi_edge_list_ch_11_WLAST,
  m_axi_edge_list_ch_11_WREADY,
  m_axi_edge_list_ch_11_WSTRB,
  m_axi_edge_list_ch_11_WVALID,
  m_axi_edge_list_ch_12_ARADDR,
  m_axi_edge_list_ch_12_ARBURST,
  m_axi_edge_list_ch_12_ARCACHE,
  m_axi_edge_list_ch_12_ARID,
  m_axi_edge_list_ch_12_ARLEN,
  m_axi_edge_list_ch_12_ARLOCK,
  m_axi_edge_list_ch_12_ARPROT,
  m_axi_edge_list_ch_12_ARQOS,
  m_axi_edge_list_ch_12_ARREADY,
  m_axi_edge_list_ch_12_ARSIZE,
  m_axi_edge_list_ch_12_ARVALID,
  m_axi_edge_list_ch_12_AWADDR,
  m_axi_edge_list_ch_12_AWBURST,
  m_axi_edge_list_ch_12_AWCACHE,
  m_axi_edge_list_ch_12_AWID,
  m_axi_edge_list_ch_12_AWLEN,
  m_axi_edge_list_ch_12_AWLOCK,
  m_axi_edge_list_ch_12_AWPROT,
  m_axi_edge_list_ch_12_AWQOS,
  m_axi_edge_list_ch_12_AWREADY,
  m_axi_edge_list_ch_12_AWSIZE,
  m_axi_edge_list_ch_12_AWVALID,
  m_axi_edge_list_ch_12_BID,
  m_axi_edge_list_ch_12_BREADY,
  m_axi_edge_list_ch_12_BRESP,
  m_axi_edge_list_ch_12_BVALID,
  m_axi_edge_list_ch_12_RDATA,
  m_axi_edge_list_ch_12_RID,
  m_axi_edge_list_ch_12_RLAST,
  m_axi_edge_list_ch_12_RREADY,
  m_axi_edge_list_ch_12_RRESP,
  m_axi_edge_list_ch_12_RVALID,
  m_axi_edge_list_ch_12_WDATA,
  m_axi_edge_list_ch_12_WLAST,
  m_axi_edge_list_ch_12_WREADY,
  m_axi_edge_list_ch_12_WSTRB,
  m_axi_edge_list_ch_12_WVALID,
  m_axi_edge_list_ch_13_ARADDR,
  m_axi_edge_list_ch_13_ARBURST,
  m_axi_edge_list_ch_13_ARCACHE,
  m_axi_edge_list_ch_13_ARID,
  m_axi_edge_list_ch_13_ARLEN,
  m_axi_edge_list_ch_13_ARLOCK,
  m_axi_edge_list_ch_13_ARPROT,
  m_axi_edge_list_ch_13_ARQOS,
  m_axi_edge_list_ch_13_ARREADY,
  m_axi_edge_list_ch_13_ARSIZE,
  m_axi_edge_list_ch_13_ARVALID,
  m_axi_edge_list_ch_13_AWADDR,
  m_axi_edge_list_ch_13_AWBURST,
  m_axi_edge_list_ch_13_AWCACHE,
  m_axi_edge_list_ch_13_AWID,
  m_axi_edge_list_ch_13_AWLEN,
  m_axi_edge_list_ch_13_AWLOCK,
  m_axi_edge_list_ch_13_AWPROT,
  m_axi_edge_list_ch_13_AWQOS,
  m_axi_edge_list_ch_13_AWREADY,
  m_axi_edge_list_ch_13_AWSIZE,
  m_axi_edge_list_ch_13_AWVALID,
  m_axi_edge_list_ch_13_BID,
  m_axi_edge_list_ch_13_BREADY,
  m_axi_edge_list_ch_13_BRESP,
  m_axi_edge_list_ch_13_BVALID,
  m_axi_edge_list_ch_13_RDATA,
  m_axi_edge_list_ch_13_RID,
  m_axi_edge_list_ch_13_RLAST,
  m_axi_edge_list_ch_13_RREADY,
  m_axi_edge_list_ch_13_RRESP,
  m_axi_edge_list_ch_13_RVALID,
  m_axi_edge_list_ch_13_WDATA,
  m_axi_edge_list_ch_13_WLAST,
  m_axi_edge_list_ch_13_WREADY,
  m_axi_edge_list_ch_13_WSTRB,
  m_axi_edge_list_ch_13_WVALID,
  m_axi_edge_list_ch_14_ARADDR,
  m_axi_edge_list_ch_14_ARBURST,
  m_axi_edge_list_ch_14_ARCACHE,
  m_axi_edge_list_ch_14_ARID,
  m_axi_edge_list_ch_14_ARLEN,
  m_axi_edge_list_ch_14_ARLOCK,
  m_axi_edge_list_ch_14_ARPROT,
  m_axi_edge_list_ch_14_ARQOS,
  m_axi_edge_list_ch_14_ARREADY,
  m_axi_edge_list_ch_14_ARSIZE,
  m_axi_edge_list_ch_14_ARVALID,
  m_axi_edge_list_ch_14_AWADDR,
  m_axi_edge_list_ch_14_AWBURST,
  m_axi_edge_list_ch_14_AWCACHE,
  m_axi_edge_list_ch_14_AWID,
  m_axi_edge_list_ch_14_AWLEN,
  m_axi_edge_list_ch_14_AWLOCK,
  m_axi_edge_list_ch_14_AWPROT,
  m_axi_edge_list_ch_14_AWQOS,
  m_axi_edge_list_ch_14_AWREADY,
  m_axi_edge_list_ch_14_AWSIZE,
  m_axi_edge_list_ch_14_AWVALID,
  m_axi_edge_list_ch_14_BID,
  m_axi_edge_list_ch_14_BREADY,
  m_axi_edge_list_ch_14_BRESP,
  m_axi_edge_list_ch_14_BVALID,
  m_axi_edge_list_ch_14_RDATA,
  m_axi_edge_list_ch_14_RID,
  m_axi_edge_list_ch_14_RLAST,
  m_axi_edge_list_ch_14_RREADY,
  m_axi_edge_list_ch_14_RRESP,
  m_axi_edge_list_ch_14_RVALID,
  m_axi_edge_list_ch_14_WDATA,
  m_axi_edge_list_ch_14_WLAST,
  m_axi_edge_list_ch_14_WREADY,
  m_axi_edge_list_ch_14_WSTRB,
  m_axi_edge_list_ch_14_WVALID,
  m_axi_edge_list_ch_15_ARADDR,
  m_axi_edge_list_ch_15_ARBURST,
  m_axi_edge_list_ch_15_ARCACHE,
  m_axi_edge_list_ch_15_ARID,
  m_axi_edge_list_ch_15_ARLEN,
  m_axi_edge_list_ch_15_ARLOCK,
  m_axi_edge_list_ch_15_ARPROT,
  m_axi_edge_list_ch_15_ARQOS,
  m_axi_edge_list_ch_15_ARREADY,
  m_axi_edge_list_ch_15_ARSIZE,
  m_axi_edge_list_ch_15_ARVALID,
  m_axi_edge_list_ch_15_AWADDR,
  m_axi_edge_list_ch_15_AWBURST,
  m_axi_edge_list_ch_15_AWCACHE,
  m_axi_edge_list_ch_15_AWID,
  m_axi_edge_list_ch_15_AWLEN,
  m_axi_edge_list_ch_15_AWLOCK,
  m_axi_edge_list_ch_15_AWPROT,
  m_axi_edge_list_ch_15_AWQOS,
  m_axi_edge_list_ch_15_AWREADY,
  m_axi_edge_list_ch_15_AWSIZE,
  m_axi_edge_list_ch_15_AWVALID,
  m_axi_edge_list_ch_15_BID,
  m_axi_edge_list_ch_15_BREADY,
  m_axi_edge_list_ch_15_BRESP,
  m_axi_edge_list_ch_15_BVALID,
  m_axi_edge_list_ch_15_RDATA,
  m_axi_edge_list_ch_15_RID,
  m_axi_edge_list_ch_15_RLAST,
  m_axi_edge_list_ch_15_RREADY,
  m_axi_edge_list_ch_15_RRESP,
  m_axi_edge_list_ch_15_RVALID,
  m_axi_edge_list_ch_15_WDATA,
  m_axi_edge_list_ch_15_WLAST,
  m_axi_edge_list_ch_15_WREADY,
  m_axi_edge_list_ch_15_WSTRB,
  m_axi_edge_list_ch_15_WVALID,
  m_axi_vec_digA_ARADDR,
  m_axi_vec_digA_ARBURST,
  m_axi_vec_digA_ARCACHE,
  m_axi_vec_digA_ARID,
  m_axi_vec_digA_ARLEN,
  m_axi_vec_digA_ARLOCK,
  m_axi_vec_digA_ARPROT,
  m_axi_vec_digA_ARQOS,
  m_axi_vec_digA_ARREADY,
  m_axi_vec_digA_ARSIZE,
  m_axi_vec_digA_ARVALID,
  m_axi_vec_digA_AWADDR,
  m_axi_vec_digA_AWBURST,
  m_axi_vec_digA_AWCACHE,
  m_axi_vec_digA_AWID,
  m_axi_vec_digA_AWLEN,
  m_axi_vec_digA_AWLOCK,
  m_axi_vec_digA_AWPROT,
  m_axi_vec_digA_AWQOS,
  m_axi_vec_digA_AWREADY,
  m_axi_vec_digA_AWSIZE,
  m_axi_vec_digA_AWVALID,
  m_axi_vec_digA_BID,
  m_axi_vec_digA_BREADY,
  m_axi_vec_digA_BRESP,
  m_axi_vec_digA_BVALID,
  m_axi_vec_digA_RDATA,
  m_axi_vec_digA_RID,
  m_axi_vec_digA_RLAST,
  m_axi_vec_digA_RREADY,
  m_axi_vec_digA_RRESP,
  m_axi_vec_digA_RVALID,
  m_axi_vec_digA_WDATA,
  m_axi_vec_digA_WLAST,
  m_axi_vec_digA_WREADY,
  m_axi_vec_digA_WSTRB,
  m_axi_vec_digA_WVALID,
  m_axi_edge_list_ptr_ARADDR,
  m_axi_edge_list_ptr_ARBURST,
  m_axi_edge_list_ptr_ARCACHE,
  m_axi_edge_list_ptr_ARID,
  m_axi_edge_list_ptr_ARLEN,
  m_axi_edge_list_ptr_ARLOCK,
  m_axi_edge_list_ptr_ARPROT,
  m_axi_edge_list_ptr_ARQOS,
  m_axi_edge_list_ptr_ARREADY,
  m_axi_edge_list_ptr_ARSIZE,
  m_axi_edge_list_ptr_ARVALID,
  m_axi_edge_list_ptr_AWADDR,
  m_axi_edge_list_ptr_AWBURST,
  m_axi_edge_list_ptr_AWCACHE,
  m_axi_edge_list_ptr_AWID,
  m_axi_edge_list_ptr_AWLEN,
  m_axi_edge_list_ptr_AWLOCK,
  m_axi_edge_list_ptr_AWPROT,
  m_axi_edge_list_ptr_AWQOS,
  m_axi_edge_list_ptr_AWREADY,
  m_axi_edge_list_ptr_AWSIZE,
  m_axi_edge_list_ptr_AWVALID,
  m_axi_edge_list_ptr_BID,
  m_axi_edge_list_ptr_BREADY,
  m_axi_edge_list_ptr_BRESP,
  m_axi_edge_list_ptr_BVALID,
  m_axi_edge_list_ptr_RDATA,
  m_axi_edge_list_ptr_RID,
  m_axi_edge_list_ptr_RLAST,
  m_axi_edge_list_ptr_RREADY,
  m_axi_edge_list_ptr_RRESP,
  m_axi_edge_list_ptr_RVALID,
  m_axi_edge_list_ptr_WDATA,
  m_axi_edge_list_ptr_WLAST,
  m_axi_edge_list_ptr_WREADY,
  m_axi_edge_list_ptr_WSTRB,
  m_axi_edge_list_ptr_WVALID,
  m_axi_vec_res_ARADDR,
  m_axi_vec_res_ARBURST,
  m_axi_vec_res_ARCACHE,
  m_axi_vec_res_ARID,
  m_axi_vec_res_ARLEN,
  m_axi_vec_res_ARLOCK,
  m_axi_vec_res_ARPROT,
  m_axi_vec_res_ARQOS,
  m_axi_vec_res_ARREADY,
  m_axi_vec_res_ARSIZE,
  m_axi_vec_res_ARVALID,
  m_axi_vec_res_AWADDR,
  m_axi_vec_res_AWBURST,
  m_axi_vec_res_AWCACHE,
  m_axi_vec_res_AWID,
  m_axi_vec_res_AWLEN,
  m_axi_vec_res_AWLOCK,
  m_axi_vec_res_AWPROT,
  m_axi_vec_res_AWQOS,
  m_axi_vec_res_AWREADY,
  m_axi_vec_res_AWSIZE,
  m_axi_vec_res_AWVALID,
  m_axi_vec_res_BID,
  m_axi_vec_res_BREADY,
  m_axi_vec_res_BRESP,
  m_axi_vec_res_BVALID,
  m_axi_vec_res_RDATA,
  m_axi_vec_res_RID,
  m_axi_vec_res_RLAST,
  m_axi_vec_res_RREADY,
  m_axi_vec_res_RRESP,
  m_axi_vec_res_RVALID,
  m_axi_vec_res_WDATA,
  m_axi_vec_res_WLAST,
  m_axi_vec_res_WREADY,
  m_axi_vec_res_WSTRB,
  m_axi_vec_res_WVALID
);

  parameter C_S_AXI_CONTROL_DATA_WIDTH = 32;
  parameter C_S_AXI_CONTROL_ADDR_WIDTH = 9;
  parameter C_S_AXI_DATA_WIDTH = 32;
  parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 32 / 8;
  parameter C_S_AXI_WSTRB_WIDTH = 32 / 8;
  (* RS_HS = "s_axi_control_AW.valid" *)input s_axi_control_AWVALID;
  (* RS_HS = "s_axi_control_AW.ready" *)output s_axi_control_AWREADY;
  (* RS_HS = "s_axi_control_AW.data" *)input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_AWADDR;
  (* RS_HS = "s_axi_control_W.valid" *)input s_axi_control_WVALID;
  (* RS_HS = "s_axi_control_W.ready" *)output s_axi_control_WREADY;
  (* RS_HS = "s_axi_control_W.data" *)input [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_WDATA;
  (* RS_HS = "s_axi_control_W.data" *)input [C_S_AXI_CONTROL_WSTRB_WIDTH-1:0] s_axi_control_WSTRB;
  (* RS_HS = "s_axi_control_AR.valid" *)input s_axi_control_ARVALID;
  (* RS_HS = "s_axi_control_AR.ready" *)output s_axi_control_ARREADY;
  (* RS_HS = "s_axi_control_AR.data" *)input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_ARADDR;
  (* RS_HS = "s_axi_control_R.valid" *)output s_axi_control_RVALID;
  (* RS_HS = "s_axi_control_R.ready" *)input s_axi_control_RREADY;
  (* RS_HS = "s_axi_control_R.data" *)output [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_RDATA;
  (* RS_HS = "s_axi_control_R.data" *)output [1:0] s_axi_control_RRESP;
  (* RS_HS = "s_axi_control_B.valid" *)output s_axi_control_BVALID;
  (* RS_HS = "s_axi_control_B.ready" *)input s_axi_control_BREADY;
  (* RS_HS = "s_axi_control_B.data" *)output [1:0] s_axi_control_BRESP;
  (* RS_CLK *)input ap_clk;
  (* RS_RST = "ff" *)input ap_rst_n;
  (* RS_FF = "interrupt" *)output interrupt;
  (* RS_HS = "m_axi_vec_p_0_AR.data" *)output [63:0] m_axi_vec_p_0_ARADDR;
  (* RS_HS = "m_axi_vec_p_0_AR.data" *)output [1:0] m_axi_vec_p_0_ARBURST;
  (* RS_HS = "m_axi_vec_p_0_AR.data" *)output [3:0] m_axi_vec_p_0_ARCACHE;
  (* RS_HS = "m_axi_vec_p_0_AR.data" *)output [0:0] m_axi_vec_p_0_ARID;
  (* RS_HS = "m_axi_vec_p_0_AR.data" *)output [7:0] m_axi_vec_p_0_ARLEN;
  (* RS_HS = "m_axi_vec_p_0_AR.data" *)output m_axi_vec_p_0_ARLOCK;
  (* RS_HS = "m_axi_vec_p_0_AR.data" *)output [2:0] m_axi_vec_p_0_ARPROT;
  (* RS_HS = "m_axi_vec_p_0_AR.data" *)output [3:0] m_axi_vec_p_0_ARQOS;
  (* RS_HS = "m_axi_vec_p_0_AR.ready" *)input m_axi_vec_p_0_ARREADY;
  (* RS_HS = "m_axi_vec_p_0_AR.data" *)output [2:0] m_axi_vec_p_0_ARSIZE;
  (* RS_HS = "m_axi_vec_p_0_AR.valid" *)output m_axi_vec_p_0_ARVALID;
  (* RS_HS = "m_axi_vec_p_0_AW.data" *)output [63:0] m_axi_vec_p_0_AWADDR;
  (* RS_HS = "m_axi_vec_p_0_AW.data" *)output [1:0] m_axi_vec_p_0_AWBURST;
  (* RS_HS = "m_axi_vec_p_0_AW.data" *)output [3:0] m_axi_vec_p_0_AWCACHE;
  (* RS_HS = "m_axi_vec_p_0_AW.data" *)output [0:0] m_axi_vec_p_0_AWID;
  (* RS_HS = "m_axi_vec_p_0_AW.data" *)output [7:0] m_axi_vec_p_0_AWLEN;
  (* RS_HS = "m_axi_vec_p_0_AW.data" *)output m_axi_vec_p_0_AWLOCK;
  (* RS_HS = "m_axi_vec_p_0_AW.data" *)output [2:0] m_axi_vec_p_0_AWPROT;
  (* RS_HS = "m_axi_vec_p_0_AW.data" *)output [3:0] m_axi_vec_p_0_AWQOS;
  (* RS_HS = "m_axi_vec_p_0_AW.ready" *)input m_axi_vec_p_0_AWREADY;
  (* RS_HS = "m_axi_vec_p_0_AW.data" *)output [2:0] m_axi_vec_p_0_AWSIZE;
  (* RS_HS = "m_axi_vec_p_0_AW.valid" *)output m_axi_vec_p_0_AWVALID;
  (* RS_HS = "m_axi_vec_p_0_B.data" *)input [0:0] m_axi_vec_p_0_BID;
  (* RS_HS = "m_axi_vec_p_0_B.ready" *)output m_axi_vec_p_0_BREADY;
  (* RS_HS = "m_axi_vec_p_0_B.data" *)input [1:0] m_axi_vec_p_0_BRESP;
  (* RS_HS = "m_axi_vec_p_0_B.valid" *)input m_axi_vec_p_0_BVALID;
  (* RS_HS = "m_axi_vec_p_0_R.data" *)input [511:0] m_axi_vec_p_0_RDATA;
  (* RS_HS = "m_axi_vec_p_0_R.data" *)input [0:0] m_axi_vec_p_0_RID;
  (* RS_HS = "m_axi_vec_p_0_R.data" *)input m_axi_vec_p_0_RLAST;
  (* RS_HS = "m_axi_vec_p_0_R.ready" *)output m_axi_vec_p_0_RREADY;
  (* RS_HS = "m_axi_vec_p_0_R.data" *)input [1:0] m_axi_vec_p_0_RRESP;
  (* RS_HS = "m_axi_vec_p_0_R.valid" *)input m_axi_vec_p_0_RVALID;
  (* RS_HS = "m_axi_vec_p_0_W.data" *)output [511:0] m_axi_vec_p_0_WDATA;
  (* RS_HS = "m_axi_vec_p_0_W.data" *)output m_axi_vec_p_0_WLAST;
  (* RS_HS = "m_axi_vec_p_0_W.ready" *)input m_axi_vec_p_0_WREADY;
  (* RS_HS = "m_axi_vec_p_0_W.data" *)output [63:0] m_axi_vec_p_0_WSTRB;
  (* RS_HS = "m_axi_vec_p_0_W.valid" *)output m_axi_vec_p_0_WVALID;
  (* RS_HS = "m_axi_vec_p_1_AR.data" *)output [63:0] m_axi_vec_p_1_ARADDR;
  (* RS_HS = "m_axi_vec_p_1_AR.data" *)output [1:0] m_axi_vec_p_1_ARBURST;
  (* RS_HS = "m_axi_vec_p_1_AR.data" *)output [3:0] m_axi_vec_p_1_ARCACHE;
  (* RS_HS = "m_axi_vec_p_1_AR.data" *)output [0:0] m_axi_vec_p_1_ARID;
  (* RS_HS = "m_axi_vec_p_1_AR.data" *)output [7:0] m_axi_vec_p_1_ARLEN;
  (* RS_HS = "m_axi_vec_p_1_AR.data" *)output m_axi_vec_p_1_ARLOCK;
  (* RS_HS = "m_axi_vec_p_1_AR.data" *)output [2:0] m_axi_vec_p_1_ARPROT;
  (* RS_HS = "m_axi_vec_p_1_AR.data" *)output [3:0] m_axi_vec_p_1_ARQOS;
  (* RS_HS = "m_axi_vec_p_1_AR.ready" *)input m_axi_vec_p_1_ARREADY;
  (* RS_HS = "m_axi_vec_p_1_AR.data" *)output [2:0] m_axi_vec_p_1_ARSIZE;
  (* RS_HS = "m_axi_vec_p_1_AR.valid" *)output m_axi_vec_p_1_ARVALID;
  (* RS_HS = "m_axi_vec_p_1_AW.data" *)output [63:0] m_axi_vec_p_1_AWADDR;
  (* RS_HS = "m_axi_vec_p_1_AW.data" *)output [1:0] m_axi_vec_p_1_AWBURST;
  (* RS_HS = "m_axi_vec_p_1_AW.data" *)output [3:0] m_axi_vec_p_1_AWCACHE;
  (* RS_HS = "m_axi_vec_p_1_AW.data" *)output [0:0] m_axi_vec_p_1_AWID;
  (* RS_HS = "m_axi_vec_p_1_AW.data" *)output [7:0] m_axi_vec_p_1_AWLEN;
  (* RS_HS = "m_axi_vec_p_1_AW.data" *)output m_axi_vec_p_1_AWLOCK;
  (* RS_HS = "m_axi_vec_p_1_AW.data" *)output [2:0] m_axi_vec_p_1_AWPROT;
  (* RS_HS = "m_axi_vec_p_1_AW.data" *)output [3:0] m_axi_vec_p_1_AWQOS;
  (* RS_HS = "m_axi_vec_p_1_AW.ready" *)input m_axi_vec_p_1_AWREADY;
  (* RS_HS = "m_axi_vec_p_1_AW.data" *)output [2:0] m_axi_vec_p_1_AWSIZE;
  (* RS_HS = "m_axi_vec_p_1_AW.valid" *)output m_axi_vec_p_1_AWVALID;
  (* RS_HS = "m_axi_vec_p_1_B.data" *)input [0:0] m_axi_vec_p_1_BID;
  (* RS_HS = "m_axi_vec_p_1_B.ready" *)output m_axi_vec_p_1_BREADY;
  (* RS_HS = "m_axi_vec_p_1_B.data" *)input [1:0] m_axi_vec_p_1_BRESP;
  (* RS_HS = "m_axi_vec_p_1_B.valid" *)input m_axi_vec_p_1_BVALID;
  (* RS_HS = "m_axi_vec_p_1_R.data" *)input [511:0] m_axi_vec_p_1_RDATA;
  (* RS_HS = "m_axi_vec_p_1_R.data" *)input [0:0] m_axi_vec_p_1_RID;
  (* RS_HS = "m_axi_vec_p_1_R.data" *)input m_axi_vec_p_1_RLAST;
  (* RS_HS = "m_axi_vec_p_1_R.ready" *)output m_axi_vec_p_1_RREADY;
  (* RS_HS = "m_axi_vec_p_1_R.data" *)input [1:0] m_axi_vec_p_1_RRESP;
  (* RS_HS = "m_axi_vec_p_1_R.valid" *)input m_axi_vec_p_1_RVALID;
  (* RS_HS = "m_axi_vec_p_1_W.data" *)output [511:0] m_axi_vec_p_1_WDATA;
  (* RS_HS = "m_axi_vec_p_1_W.data" *)output m_axi_vec_p_1_WLAST;
  (* RS_HS = "m_axi_vec_p_1_W.ready" *)input m_axi_vec_p_1_WREADY;
  (* RS_HS = "m_axi_vec_p_1_W.data" *)output [63:0] m_axi_vec_p_1_WSTRB;
  (* RS_HS = "m_axi_vec_p_1_W.valid" *)output m_axi_vec_p_1_WVALID;
  (* RS_HS = "m_axi_vec_r_0_AR.data" *)output [63:0] m_axi_vec_r_0_ARADDR;
  (* RS_HS = "m_axi_vec_r_0_AR.data" *)output [1:0] m_axi_vec_r_0_ARBURST;
  (* RS_HS = "m_axi_vec_r_0_AR.data" *)output [3:0] m_axi_vec_r_0_ARCACHE;
  (* RS_HS = "m_axi_vec_r_0_AR.data" *)output [0:0] m_axi_vec_r_0_ARID;
  (* RS_HS = "m_axi_vec_r_0_AR.data" *)output [7:0] m_axi_vec_r_0_ARLEN;
  (* RS_HS = "m_axi_vec_r_0_AR.data" *)output m_axi_vec_r_0_ARLOCK;
  (* RS_HS = "m_axi_vec_r_0_AR.data" *)output [2:0] m_axi_vec_r_0_ARPROT;
  (* RS_HS = "m_axi_vec_r_0_AR.data" *)output [3:0] m_axi_vec_r_0_ARQOS;
  (* RS_HS = "m_axi_vec_r_0_AR.ready" *)input m_axi_vec_r_0_ARREADY;
  (* RS_HS = "m_axi_vec_r_0_AR.data" *)output [2:0] m_axi_vec_r_0_ARSIZE;
  (* RS_HS = "m_axi_vec_r_0_AR.valid" *)output m_axi_vec_r_0_ARVALID;
  (* RS_HS = "m_axi_vec_r_0_AW.data" *)output [63:0] m_axi_vec_r_0_AWADDR;
  (* RS_HS = "m_axi_vec_r_0_AW.data" *)output [1:0] m_axi_vec_r_0_AWBURST;
  (* RS_HS = "m_axi_vec_r_0_AW.data" *)output [3:0] m_axi_vec_r_0_AWCACHE;
  (* RS_HS = "m_axi_vec_r_0_AW.data" *)output [0:0] m_axi_vec_r_0_AWID;
  (* RS_HS = "m_axi_vec_r_0_AW.data" *)output [7:0] m_axi_vec_r_0_AWLEN;
  (* RS_HS = "m_axi_vec_r_0_AW.data" *)output m_axi_vec_r_0_AWLOCK;
  (* RS_HS = "m_axi_vec_r_0_AW.data" *)output [2:0] m_axi_vec_r_0_AWPROT;
  (* RS_HS = "m_axi_vec_r_0_AW.data" *)output [3:0] m_axi_vec_r_0_AWQOS;
  (* RS_HS = "m_axi_vec_r_0_AW.ready" *)input m_axi_vec_r_0_AWREADY;
  (* RS_HS = "m_axi_vec_r_0_AW.data" *)output [2:0] m_axi_vec_r_0_AWSIZE;
  (* RS_HS = "m_axi_vec_r_0_AW.valid" *)output m_axi_vec_r_0_AWVALID;
  (* RS_HS = "m_axi_vec_r_0_B.data" *)input [0:0] m_axi_vec_r_0_BID;
  (* RS_HS = "m_axi_vec_r_0_B.ready" *)output m_axi_vec_r_0_BREADY;
  (* RS_HS = "m_axi_vec_r_0_B.data" *)input [1:0] m_axi_vec_r_0_BRESP;
  (* RS_HS = "m_axi_vec_r_0_B.valid" *)input m_axi_vec_r_0_BVALID;
  (* RS_HS = "m_axi_vec_r_0_R.data" *)input [511:0] m_axi_vec_r_0_RDATA;
  (* RS_HS = "m_axi_vec_r_0_R.data" *)input [0:0] m_axi_vec_r_0_RID;
  (* RS_HS = "m_axi_vec_r_0_R.data" *)input m_axi_vec_r_0_RLAST;
  (* RS_HS = "m_axi_vec_r_0_R.ready" *)output m_axi_vec_r_0_RREADY;
  (* RS_HS = "m_axi_vec_r_0_R.data" *)input [1:0] m_axi_vec_r_0_RRESP;
  (* RS_HS = "m_axi_vec_r_0_R.valid" *)input m_axi_vec_r_0_RVALID;
  (* RS_HS = "m_axi_vec_r_0_W.data" *)output [511:0] m_axi_vec_r_0_WDATA;
  (* RS_HS = "m_axi_vec_r_0_W.data" *)output m_axi_vec_r_0_WLAST;
  (* RS_HS = "m_axi_vec_r_0_W.ready" *)input m_axi_vec_r_0_WREADY;
  (* RS_HS = "m_axi_vec_r_0_W.data" *)output [63:0] m_axi_vec_r_0_WSTRB;
  (* RS_HS = "m_axi_vec_r_0_W.valid" *)output m_axi_vec_r_0_WVALID;
  (* RS_HS = "m_axi_vec_r_1_AR.data" *)output [63:0] m_axi_vec_r_1_ARADDR;
  (* RS_HS = "m_axi_vec_r_1_AR.data" *)output [1:0] m_axi_vec_r_1_ARBURST;
  (* RS_HS = "m_axi_vec_r_1_AR.data" *)output [3:0] m_axi_vec_r_1_ARCACHE;
  (* RS_HS = "m_axi_vec_r_1_AR.data" *)output [0:0] m_axi_vec_r_1_ARID;
  (* RS_HS = "m_axi_vec_r_1_AR.data" *)output [7:0] m_axi_vec_r_1_ARLEN;
  (* RS_HS = "m_axi_vec_r_1_AR.data" *)output m_axi_vec_r_1_ARLOCK;
  (* RS_HS = "m_axi_vec_r_1_AR.data" *)output [2:0] m_axi_vec_r_1_ARPROT;
  (* RS_HS = "m_axi_vec_r_1_AR.data" *)output [3:0] m_axi_vec_r_1_ARQOS;
  (* RS_HS = "m_axi_vec_r_1_AR.ready" *)input m_axi_vec_r_1_ARREADY;
  (* RS_HS = "m_axi_vec_r_1_AR.data" *)output [2:0] m_axi_vec_r_1_ARSIZE;
  (* RS_HS = "m_axi_vec_r_1_AR.valid" *)output m_axi_vec_r_1_ARVALID;
  (* RS_HS = "m_axi_vec_r_1_AW.data" *)output [63:0] m_axi_vec_r_1_AWADDR;
  (* RS_HS = "m_axi_vec_r_1_AW.data" *)output [1:0] m_axi_vec_r_1_AWBURST;
  (* RS_HS = "m_axi_vec_r_1_AW.data" *)output [3:0] m_axi_vec_r_1_AWCACHE;
  (* RS_HS = "m_axi_vec_r_1_AW.data" *)output [0:0] m_axi_vec_r_1_AWID;
  (* RS_HS = "m_axi_vec_r_1_AW.data" *)output [7:0] m_axi_vec_r_1_AWLEN;
  (* RS_HS = "m_axi_vec_r_1_AW.data" *)output m_axi_vec_r_1_AWLOCK;
  (* RS_HS = "m_axi_vec_r_1_AW.data" *)output [2:0] m_axi_vec_r_1_AWPROT;
  (* RS_HS = "m_axi_vec_r_1_AW.data" *)output [3:0] m_axi_vec_r_1_AWQOS;
  (* RS_HS = "m_axi_vec_r_1_AW.ready" *)input m_axi_vec_r_1_AWREADY;
  (* RS_HS = "m_axi_vec_r_1_AW.data" *)output [2:0] m_axi_vec_r_1_AWSIZE;
  (* RS_HS = "m_axi_vec_r_1_AW.valid" *)output m_axi_vec_r_1_AWVALID;
  (* RS_HS = "m_axi_vec_r_1_B.data" *)input [0:0] m_axi_vec_r_1_BID;
  (* RS_HS = "m_axi_vec_r_1_B.ready" *)output m_axi_vec_r_1_BREADY;
  (* RS_HS = "m_axi_vec_r_1_B.data" *)input [1:0] m_axi_vec_r_1_BRESP;
  (* RS_HS = "m_axi_vec_r_1_B.valid" *)input m_axi_vec_r_1_BVALID;
  (* RS_HS = "m_axi_vec_r_1_R.data" *)input [511:0] m_axi_vec_r_1_RDATA;
  (* RS_HS = "m_axi_vec_r_1_R.data" *)input [0:0] m_axi_vec_r_1_RID;
  (* RS_HS = "m_axi_vec_r_1_R.data" *)input m_axi_vec_r_1_RLAST;
  (* RS_HS = "m_axi_vec_r_1_R.ready" *)output m_axi_vec_r_1_RREADY;
  (* RS_HS = "m_axi_vec_r_1_R.data" *)input [1:0] m_axi_vec_r_1_RRESP;
  (* RS_HS = "m_axi_vec_r_1_R.valid" *)input m_axi_vec_r_1_RVALID;
  (* RS_HS = "m_axi_vec_r_1_W.data" *)output [511:0] m_axi_vec_r_1_WDATA;
  (* RS_HS = "m_axi_vec_r_1_W.data" *)output m_axi_vec_r_1_WLAST;
  (* RS_HS = "m_axi_vec_r_1_W.ready" *)input m_axi_vec_r_1_WREADY;
  (* RS_HS = "m_axi_vec_r_1_W.data" *)output [63:0] m_axi_vec_r_1_WSTRB;
  (* RS_HS = "m_axi_vec_r_1_W.valid" *)output m_axi_vec_r_1_WVALID;
  (* RS_HS = "m_axi_vec_x_0_AR.data" *)output [63:0] m_axi_vec_x_0_ARADDR;
  (* RS_HS = "m_axi_vec_x_0_AR.data" *)output [1:0] m_axi_vec_x_0_ARBURST;
  (* RS_HS = "m_axi_vec_x_0_AR.data" *)output [3:0] m_axi_vec_x_0_ARCACHE;
  (* RS_HS = "m_axi_vec_x_0_AR.data" *)output [0:0] m_axi_vec_x_0_ARID;
  (* RS_HS = "m_axi_vec_x_0_AR.data" *)output [7:0] m_axi_vec_x_0_ARLEN;
  (* RS_HS = "m_axi_vec_x_0_AR.data" *)output m_axi_vec_x_0_ARLOCK;
  (* RS_HS = "m_axi_vec_x_0_AR.data" *)output [2:0] m_axi_vec_x_0_ARPROT;
  (* RS_HS = "m_axi_vec_x_0_AR.data" *)output [3:0] m_axi_vec_x_0_ARQOS;
  (* RS_HS = "m_axi_vec_x_0_AR.ready" *)input m_axi_vec_x_0_ARREADY;
  (* RS_HS = "m_axi_vec_x_0_AR.data" *)output [2:0] m_axi_vec_x_0_ARSIZE;
  (* RS_HS = "m_axi_vec_x_0_AR.valid" *)output m_axi_vec_x_0_ARVALID;
  (* RS_HS = "m_axi_vec_x_0_AW.data" *)output [63:0] m_axi_vec_x_0_AWADDR;
  (* RS_HS = "m_axi_vec_x_0_AW.data" *)output [1:0] m_axi_vec_x_0_AWBURST;
  (* RS_HS = "m_axi_vec_x_0_AW.data" *)output [3:0] m_axi_vec_x_0_AWCACHE;
  (* RS_HS = "m_axi_vec_x_0_AW.data" *)output [0:0] m_axi_vec_x_0_AWID;
  (* RS_HS = "m_axi_vec_x_0_AW.data" *)output [7:0] m_axi_vec_x_0_AWLEN;
  (* RS_HS = "m_axi_vec_x_0_AW.data" *)output m_axi_vec_x_0_AWLOCK;
  (* RS_HS = "m_axi_vec_x_0_AW.data" *)output [2:0] m_axi_vec_x_0_AWPROT;
  (* RS_HS = "m_axi_vec_x_0_AW.data" *)output [3:0] m_axi_vec_x_0_AWQOS;
  (* RS_HS = "m_axi_vec_x_0_AW.ready" *)input m_axi_vec_x_0_AWREADY;
  (* RS_HS = "m_axi_vec_x_0_AW.data" *)output [2:0] m_axi_vec_x_0_AWSIZE;
  (* RS_HS = "m_axi_vec_x_0_AW.valid" *)output m_axi_vec_x_0_AWVALID;
  (* RS_HS = "m_axi_vec_x_0_B.data" *)input [0:0] m_axi_vec_x_0_BID;
  (* RS_HS = "m_axi_vec_x_0_B.ready" *)output m_axi_vec_x_0_BREADY;
  (* RS_HS = "m_axi_vec_x_0_B.data" *)input [1:0] m_axi_vec_x_0_BRESP;
  (* RS_HS = "m_axi_vec_x_0_B.valid" *)input m_axi_vec_x_0_BVALID;
  (* RS_HS = "m_axi_vec_x_0_R.data" *)input [511:0] m_axi_vec_x_0_RDATA;
  (* RS_HS = "m_axi_vec_x_0_R.data" *)input [0:0] m_axi_vec_x_0_RID;
  (* RS_HS = "m_axi_vec_x_0_R.data" *)input m_axi_vec_x_0_RLAST;
  (* RS_HS = "m_axi_vec_x_0_R.ready" *)output m_axi_vec_x_0_RREADY;
  (* RS_HS = "m_axi_vec_x_0_R.data" *)input [1:0] m_axi_vec_x_0_RRESP;
  (* RS_HS = "m_axi_vec_x_0_R.valid" *)input m_axi_vec_x_0_RVALID;
  (* RS_HS = "m_axi_vec_x_0_W.data" *)output [511:0] m_axi_vec_x_0_WDATA;
  (* RS_HS = "m_axi_vec_x_0_W.data" *)output m_axi_vec_x_0_WLAST;
  (* RS_HS = "m_axi_vec_x_0_W.ready" *)input m_axi_vec_x_0_WREADY;
  (* RS_HS = "m_axi_vec_x_0_W.data" *)output [63:0] m_axi_vec_x_0_WSTRB;
  (* RS_HS = "m_axi_vec_x_0_W.valid" *)output m_axi_vec_x_0_WVALID;
  (* RS_HS = "m_axi_vec_x_1_AR.data" *)output [63:0] m_axi_vec_x_1_ARADDR;
  (* RS_HS = "m_axi_vec_x_1_AR.data" *)output [1:0] m_axi_vec_x_1_ARBURST;
  (* RS_HS = "m_axi_vec_x_1_AR.data" *)output [3:0] m_axi_vec_x_1_ARCACHE;
  (* RS_HS = "m_axi_vec_x_1_AR.data" *)output [0:0] m_axi_vec_x_1_ARID;
  (* RS_HS = "m_axi_vec_x_1_AR.data" *)output [7:0] m_axi_vec_x_1_ARLEN;
  (* RS_HS = "m_axi_vec_x_1_AR.data" *)output m_axi_vec_x_1_ARLOCK;
  (* RS_HS = "m_axi_vec_x_1_AR.data" *)output [2:0] m_axi_vec_x_1_ARPROT;
  (* RS_HS = "m_axi_vec_x_1_AR.data" *)output [3:0] m_axi_vec_x_1_ARQOS;
  (* RS_HS = "m_axi_vec_x_1_AR.ready" *)input m_axi_vec_x_1_ARREADY;
  (* RS_HS = "m_axi_vec_x_1_AR.data" *)output [2:0] m_axi_vec_x_1_ARSIZE;
  (* RS_HS = "m_axi_vec_x_1_AR.valid" *)output m_axi_vec_x_1_ARVALID;
  (* RS_HS = "m_axi_vec_x_1_AW.data" *)output [63:0] m_axi_vec_x_1_AWADDR;
  (* RS_HS = "m_axi_vec_x_1_AW.data" *)output [1:0] m_axi_vec_x_1_AWBURST;
  (* RS_HS = "m_axi_vec_x_1_AW.data" *)output [3:0] m_axi_vec_x_1_AWCACHE;
  (* RS_HS = "m_axi_vec_x_1_AW.data" *)output [0:0] m_axi_vec_x_1_AWID;
  (* RS_HS = "m_axi_vec_x_1_AW.data" *)output [7:0] m_axi_vec_x_1_AWLEN;
  (* RS_HS = "m_axi_vec_x_1_AW.data" *)output m_axi_vec_x_1_AWLOCK;
  (* RS_HS = "m_axi_vec_x_1_AW.data" *)output [2:0] m_axi_vec_x_1_AWPROT;
  (* RS_HS = "m_axi_vec_x_1_AW.data" *)output [3:0] m_axi_vec_x_1_AWQOS;
  (* RS_HS = "m_axi_vec_x_1_AW.ready" *)input m_axi_vec_x_1_AWREADY;
  (* RS_HS = "m_axi_vec_x_1_AW.data" *)output [2:0] m_axi_vec_x_1_AWSIZE;
  (* RS_HS = "m_axi_vec_x_1_AW.valid" *)output m_axi_vec_x_1_AWVALID;
  (* RS_HS = "m_axi_vec_x_1_B.data" *)input [0:0] m_axi_vec_x_1_BID;
  (* RS_HS = "m_axi_vec_x_1_B.ready" *)output m_axi_vec_x_1_BREADY;
  (* RS_HS = "m_axi_vec_x_1_B.data" *)input [1:0] m_axi_vec_x_1_BRESP;
  (* RS_HS = "m_axi_vec_x_1_B.valid" *)input m_axi_vec_x_1_BVALID;
  (* RS_HS = "m_axi_vec_x_1_R.data" *)input [511:0] m_axi_vec_x_1_RDATA;
  (* RS_HS = "m_axi_vec_x_1_R.data" *)input [0:0] m_axi_vec_x_1_RID;
  (* RS_HS = "m_axi_vec_x_1_R.data" *)input m_axi_vec_x_1_RLAST;
  (* RS_HS = "m_axi_vec_x_1_R.ready" *)output m_axi_vec_x_1_RREADY;
  (* RS_HS = "m_axi_vec_x_1_R.data" *)input [1:0] m_axi_vec_x_1_RRESP;
  (* RS_HS = "m_axi_vec_x_1_R.valid" *)input m_axi_vec_x_1_RVALID;
  (* RS_HS = "m_axi_vec_x_1_W.data" *)output [511:0] m_axi_vec_x_1_WDATA;
  (* RS_HS = "m_axi_vec_x_1_W.data" *)output m_axi_vec_x_1_WLAST;
  (* RS_HS = "m_axi_vec_x_1_W.ready" *)input m_axi_vec_x_1_WREADY;
  (* RS_HS = "m_axi_vec_x_1_W.data" *)output [63:0] m_axi_vec_x_1_WSTRB;
  (* RS_HS = "m_axi_vec_x_1_W.valid" *)output m_axi_vec_x_1_WVALID;
  (* RS_HS = "m_axi_vec_Ap_AR.data" *)output [63:0] m_axi_vec_Ap_ARADDR;
  (* RS_HS = "m_axi_vec_Ap_AR.data" *)output [1:0] m_axi_vec_Ap_ARBURST;
  (* RS_HS = "m_axi_vec_Ap_AR.data" *)output [3:0] m_axi_vec_Ap_ARCACHE;
  (* RS_HS = "m_axi_vec_Ap_AR.data" *)output [0:0] m_axi_vec_Ap_ARID;
  (* RS_HS = "m_axi_vec_Ap_AR.data" *)output [7:0] m_axi_vec_Ap_ARLEN;
  (* RS_HS = "m_axi_vec_Ap_AR.data" *)output m_axi_vec_Ap_ARLOCK;
  (* RS_HS = "m_axi_vec_Ap_AR.data" *)output [2:0] m_axi_vec_Ap_ARPROT;
  (* RS_HS = "m_axi_vec_Ap_AR.data" *)output [3:0] m_axi_vec_Ap_ARQOS;
  (* RS_HS = "m_axi_vec_Ap_AR.ready" *)input m_axi_vec_Ap_ARREADY;
  (* RS_HS = "m_axi_vec_Ap_AR.data" *)output [2:0] m_axi_vec_Ap_ARSIZE;
  (* RS_HS = "m_axi_vec_Ap_AR.valid" *)output m_axi_vec_Ap_ARVALID;
  (* RS_HS = "m_axi_vec_Ap_AW.data" *)output [63:0] m_axi_vec_Ap_AWADDR;
  (* RS_HS = "m_axi_vec_Ap_AW.data" *)output [1:0] m_axi_vec_Ap_AWBURST;
  (* RS_HS = "m_axi_vec_Ap_AW.data" *)output [3:0] m_axi_vec_Ap_AWCACHE;
  (* RS_HS = "m_axi_vec_Ap_AW.data" *)output [0:0] m_axi_vec_Ap_AWID;
  (* RS_HS = "m_axi_vec_Ap_AW.data" *)output [7:0] m_axi_vec_Ap_AWLEN;
  (* RS_HS = "m_axi_vec_Ap_AW.data" *)output m_axi_vec_Ap_AWLOCK;
  (* RS_HS = "m_axi_vec_Ap_AW.data" *)output [2:0] m_axi_vec_Ap_AWPROT;
  (* RS_HS = "m_axi_vec_Ap_AW.data" *)output [3:0] m_axi_vec_Ap_AWQOS;
  (* RS_HS = "m_axi_vec_Ap_AW.ready" *)input m_axi_vec_Ap_AWREADY;
  (* RS_HS = "m_axi_vec_Ap_AW.data" *)output [2:0] m_axi_vec_Ap_AWSIZE;
  (* RS_HS = "m_axi_vec_Ap_AW.valid" *)output m_axi_vec_Ap_AWVALID;
  (* RS_HS = "m_axi_vec_Ap_B.data" *)input [0:0] m_axi_vec_Ap_BID;
  (* RS_HS = "m_axi_vec_Ap_B.ready" *)output m_axi_vec_Ap_BREADY;
  (* RS_HS = "m_axi_vec_Ap_B.data" *)input [1:0] m_axi_vec_Ap_BRESP;
  (* RS_HS = "m_axi_vec_Ap_B.valid" *)input m_axi_vec_Ap_BVALID;
  (* RS_HS = "m_axi_vec_Ap_R.data" *)input [511:0] m_axi_vec_Ap_RDATA;
  (* RS_HS = "m_axi_vec_Ap_R.data" *)input [0:0] m_axi_vec_Ap_RID;
  (* RS_HS = "m_axi_vec_Ap_R.data" *)input m_axi_vec_Ap_RLAST;
  (* RS_HS = "m_axi_vec_Ap_R.ready" *)output m_axi_vec_Ap_RREADY;
  (* RS_HS = "m_axi_vec_Ap_R.data" *)input [1:0] m_axi_vec_Ap_RRESP;
  (* RS_HS = "m_axi_vec_Ap_R.valid" *)input m_axi_vec_Ap_RVALID;
  (* RS_HS = "m_axi_vec_Ap_W.data" *)output [511:0] m_axi_vec_Ap_WDATA;
  (* RS_HS = "m_axi_vec_Ap_W.data" *)output m_axi_vec_Ap_WLAST;
  (* RS_HS = "m_axi_vec_Ap_W.ready" *)input m_axi_vec_Ap_WREADY;
  (* RS_HS = "m_axi_vec_Ap_W.data" *)output [63:0] m_axi_vec_Ap_WSTRB;
  (* RS_HS = "m_axi_vec_Ap_W.valid" *)output m_axi_vec_Ap_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.data" *)output [63:0] m_axi_edge_list_ch_0_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.data" *)output [1:0] m_axi_edge_list_ch_0_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.data" *)output [3:0] m_axi_edge_list_ch_0_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.data" *)output [0:0] m_axi_edge_list_ch_0_ARID;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.data" *)output [7:0] m_axi_edge_list_ch_0_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.data" *)output m_axi_edge_list_ch_0_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.data" *)output [2:0] m_axi_edge_list_ch_0_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.data" *)output [3:0] m_axi_edge_list_ch_0_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.ready" *)input m_axi_edge_list_ch_0_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.data" *)output [2:0] m_axi_edge_list_ch_0_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_0_AR.valid" *)output m_axi_edge_list_ch_0_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.data" *)output [63:0] m_axi_edge_list_ch_0_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.data" *)output [1:0] m_axi_edge_list_ch_0_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.data" *)output [3:0] m_axi_edge_list_ch_0_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.data" *)output [0:0] m_axi_edge_list_ch_0_AWID;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.data" *)output [7:0] m_axi_edge_list_ch_0_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.data" *)output m_axi_edge_list_ch_0_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.data" *)output [2:0] m_axi_edge_list_ch_0_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.data" *)output [3:0] m_axi_edge_list_ch_0_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.ready" *)input m_axi_edge_list_ch_0_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.data" *)output [2:0] m_axi_edge_list_ch_0_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_0_AW.valid" *)output m_axi_edge_list_ch_0_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_0_B.data" *)input [0:0] m_axi_edge_list_ch_0_BID;
  (* RS_HS = "m_axi_edge_list_ch_0_B.ready" *)output m_axi_edge_list_ch_0_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_0_B.data" *)input [1:0] m_axi_edge_list_ch_0_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_0_B.valid" *)input m_axi_edge_list_ch_0_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_0_R.data" *)input [511:0] m_axi_edge_list_ch_0_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_0_R.data" *)input [0:0] m_axi_edge_list_ch_0_RID;
  (* RS_HS = "m_axi_edge_list_ch_0_R.data" *)input m_axi_edge_list_ch_0_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_0_R.ready" *)output m_axi_edge_list_ch_0_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_0_R.data" *)input [1:0] m_axi_edge_list_ch_0_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_0_R.valid" *)input m_axi_edge_list_ch_0_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_0_W.data" *)output [511:0] m_axi_edge_list_ch_0_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_0_W.data" *)output m_axi_edge_list_ch_0_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_0_W.ready" *)input m_axi_edge_list_ch_0_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_0_W.data" *)output [63:0] m_axi_edge_list_ch_0_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_0_W.valid" *)output m_axi_edge_list_ch_0_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.data" *)output [63:0] m_axi_edge_list_ch_1_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.data" *)output [1:0] m_axi_edge_list_ch_1_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.data" *)output [3:0] m_axi_edge_list_ch_1_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.data" *)output [0:0] m_axi_edge_list_ch_1_ARID;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.data" *)output [7:0] m_axi_edge_list_ch_1_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.data" *)output m_axi_edge_list_ch_1_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.data" *)output [2:0] m_axi_edge_list_ch_1_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.data" *)output [3:0] m_axi_edge_list_ch_1_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.ready" *)input m_axi_edge_list_ch_1_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.data" *)output [2:0] m_axi_edge_list_ch_1_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_1_AR.valid" *)output m_axi_edge_list_ch_1_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.data" *)output [63:0] m_axi_edge_list_ch_1_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.data" *)output [1:0] m_axi_edge_list_ch_1_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.data" *)output [3:0] m_axi_edge_list_ch_1_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.data" *)output [0:0] m_axi_edge_list_ch_1_AWID;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.data" *)output [7:0] m_axi_edge_list_ch_1_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.data" *)output m_axi_edge_list_ch_1_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.data" *)output [2:0] m_axi_edge_list_ch_1_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.data" *)output [3:0] m_axi_edge_list_ch_1_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.ready" *)input m_axi_edge_list_ch_1_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.data" *)output [2:0] m_axi_edge_list_ch_1_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_1_AW.valid" *)output m_axi_edge_list_ch_1_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_1_B.data" *)input [0:0] m_axi_edge_list_ch_1_BID;
  (* RS_HS = "m_axi_edge_list_ch_1_B.ready" *)output m_axi_edge_list_ch_1_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_1_B.data" *)input [1:0] m_axi_edge_list_ch_1_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_1_B.valid" *)input m_axi_edge_list_ch_1_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_1_R.data" *)input [511:0] m_axi_edge_list_ch_1_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_1_R.data" *)input [0:0] m_axi_edge_list_ch_1_RID;
  (* RS_HS = "m_axi_edge_list_ch_1_R.data" *)input m_axi_edge_list_ch_1_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_1_R.ready" *)output m_axi_edge_list_ch_1_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_1_R.data" *)input [1:0] m_axi_edge_list_ch_1_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_1_R.valid" *)input m_axi_edge_list_ch_1_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_1_W.data" *)output [511:0] m_axi_edge_list_ch_1_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_1_W.data" *)output m_axi_edge_list_ch_1_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_1_W.ready" *)input m_axi_edge_list_ch_1_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_1_W.data" *)output [63:0] m_axi_edge_list_ch_1_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_1_W.valid" *)output m_axi_edge_list_ch_1_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.data" *)output [63:0] m_axi_edge_list_ch_2_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.data" *)output [1:0] m_axi_edge_list_ch_2_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.data" *)output [3:0] m_axi_edge_list_ch_2_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.data" *)output [0:0] m_axi_edge_list_ch_2_ARID;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.data" *)output [7:0] m_axi_edge_list_ch_2_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.data" *)output m_axi_edge_list_ch_2_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.data" *)output [2:0] m_axi_edge_list_ch_2_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.data" *)output [3:0] m_axi_edge_list_ch_2_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.ready" *)input m_axi_edge_list_ch_2_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.data" *)output [2:0] m_axi_edge_list_ch_2_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_2_AR.valid" *)output m_axi_edge_list_ch_2_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.data" *)output [63:0] m_axi_edge_list_ch_2_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.data" *)output [1:0] m_axi_edge_list_ch_2_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.data" *)output [3:0] m_axi_edge_list_ch_2_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.data" *)output [0:0] m_axi_edge_list_ch_2_AWID;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.data" *)output [7:0] m_axi_edge_list_ch_2_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.data" *)output m_axi_edge_list_ch_2_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.data" *)output [2:0] m_axi_edge_list_ch_2_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.data" *)output [3:0] m_axi_edge_list_ch_2_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.ready" *)input m_axi_edge_list_ch_2_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.data" *)output [2:0] m_axi_edge_list_ch_2_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_2_AW.valid" *)output m_axi_edge_list_ch_2_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_2_B.data" *)input [0:0] m_axi_edge_list_ch_2_BID;
  (* RS_HS = "m_axi_edge_list_ch_2_B.ready" *)output m_axi_edge_list_ch_2_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_2_B.data" *)input [1:0] m_axi_edge_list_ch_2_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_2_B.valid" *)input m_axi_edge_list_ch_2_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_2_R.data" *)input [511:0] m_axi_edge_list_ch_2_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_2_R.data" *)input [0:0] m_axi_edge_list_ch_2_RID;
  (* RS_HS = "m_axi_edge_list_ch_2_R.data" *)input m_axi_edge_list_ch_2_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_2_R.ready" *)output m_axi_edge_list_ch_2_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_2_R.data" *)input [1:0] m_axi_edge_list_ch_2_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_2_R.valid" *)input m_axi_edge_list_ch_2_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_2_W.data" *)output [511:0] m_axi_edge_list_ch_2_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_2_W.data" *)output m_axi_edge_list_ch_2_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_2_W.ready" *)input m_axi_edge_list_ch_2_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_2_W.data" *)output [63:0] m_axi_edge_list_ch_2_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_2_W.valid" *)output m_axi_edge_list_ch_2_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.data" *)output [63:0] m_axi_edge_list_ch_3_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.data" *)output [1:0] m_axi_edge_list_ch_3_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.data" *)output [3:0] m_axi_edge_list_ch_3_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.data" *)output [0:0] m_axi_edge_list_ch_3_ARID;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.data" *)output [7:0] m_axi_edge_list_ch_3_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.data" *)output m_axi_edge_list_ch_3_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.data" *)output [2:0] m_axi_edge_list_ch_3_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.data" *)output [3:0] m_axi_edge_list_ch_3_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.ready" *)input m_axi_edge_list_ch_3_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.data" *)output [2:0] m_axi_edge_list_ch_3_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_3_AR.valid" *)output m_axi_edge_list_ch_3_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.data" *)output [63:0] m_axi_edge_list_ch_3_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.data" *)output [1:0] m_axi_edge_list_ch_3_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.data" *)output [3:0] m_axi_edge_list_ch_3_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.data" *)output [0:0] m_axi_edge_list_ch_3_AWID;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.data" *)output [7:0] m_axi_edge_list_ch_3_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.data" *)output m_axi_edge_list_ch_3_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.data" *)output [2:0] m_axi_edge_list_ch_3_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.data" *)output [3:0] m_axi_edge_list_ch_3_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.ready" *)input m_axi_edge_list_ch_3_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.data" *)output [2:0] m_axi_edge_list_ch_3_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_3_AW.valid" *)output m_axi_edge_list_ch_3_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_3_B.data" *)input [0:0] m_axi_edge_list_ch_3_BID;
  (* RS_HS = "m_axi_edge_list_ch_3_B.ready" *)output m_axi_edge_list_ch_3_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_3_B.data" *)input [1:0] m_axi_edge_list_ch_3_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_3_B.valid" *)input m_axi_edge_list_ch_3_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_3_R.data" *)input [511:0] m_axi_edge_list_ch_3_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_3_R.data" *)input [0:0] m_axi_edge_list_ch_3_RID;
  (* RS_HS = "m_axi_edge_list_ch_3_R.data" *)input m_axi_edge_list_ch_3_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_3_R.ready" *)output m_axi_edge_list_ch_3_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_3_R.data" *)input [1:0] m_axi_edge_list_ch_3_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_3_R.valid" *)input m_axi_edge_list_ch_3_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_3_W.data" *)output [511:0] m_axi_edge_list_ch_3_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_3_W.data" *)output m_axi_edge_list_ch_3_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_3_W.ready" *)input m_axi_edge_list_ch_3_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_3_W.data" *)output [63:0] m_axi_edge_list_ch_3_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_3_W.valid" *)output m_axi_edge_list_ch_3_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.data" *)output [63:0] m_axi_edge_list_ch_4_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.data" *)output [1:0] m_axi_edge_list_ch_4_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.data" *)output [3:0] m_axi_edge_list_ch_4_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.data" *)output [0:0] m_axi_edge_list_ch_4_ARID;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.data" *)output [7:0] m_axi_edge_list_ch_4_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.data" *)output m_axi_edge_list_ch_4_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.data" *)output [2:0] m_axi_edge_list_ch_4_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.data" *)output [3:0] m_axi_edge_list_ch_4_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.ready" *)input m_axi_edge_list_ch_4_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.data" *)output [2:0] m_axi_edge_list_ch_4_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_4_AR.valid" *)output m_axi_edge_list_ch_4_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.data" *)output [63:0] m_axi_edge_list_ch_4_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.data" *)output [1:0] m_axi_edge_list_ch_4_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.data" *)output [3:0] m_axi_edge_list_ch_4_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.data" *)output [0:0] m_axi_edge_list_ch_4_AWID;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.data" *)output [7:0] m_axi_edge_list_ch_4_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.data" *)output m_axi_edge_list_ch_4_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.data" *)output [2:0] m_axi_edge_list_ch_4_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.data" *)output [3:0] m_axi_edge_list_ch_4_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.ready" *)input m_axi_edge_list_ch_4_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.data" *)output [2:0] m_axi_edge_list_ch_4_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_4_AW.valid" *)output m_axi_edge_list_ch_4_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_4_B.data" *)input [0:0] m_axi_edge_list_ch_4_BID;
  (* RS_HS = "m_axi_edge_list_ch_4_B.ready" *)output m_axi_edge_list_ch_4_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_4_B.data" *)input [1:0] m_axi_edge_list_ch_4_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_4_B.valid" *)input m_axi_edge_list_ch_4_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_4_R.data" *)input [511:0] m_axi_edge_list_ch_4_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_4_R.data" *)input [0:0] m_axi_edge_list_ch_4_RID;
  (* RS_HS = "m_axi_edge_list_ch_4_R.data" *)input m_axi_edge_list_ch_4_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_4_R.ready" *)output m_axi_edge_list_ch_4_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_4_R.data" *)input [1:0] m_axi_edge_list_ch_4_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_4_R.valid" *)input m_axi_edge_list_ch_4_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_4_W.data" *)output [511:0] m_axi_edge_list_ch_4_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_4_W.data" *)output m_axi_edge_list_ch_4_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_4_W.ready" *)input m_axi_edge_list_ch_4_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_4_W.data" *)output [63:0] m_axi_edge_list_ch_4_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_4_W.valid" *)output m_axi_edge_list_ch_4_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.data" *)output [63:0] m_axi_edge_list_ch_5_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.data" *)output [1:0] m_axi_edge_list_ch_5_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.data" *)output [3:0] m_axi_edge_list_ch_5_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.data" *)output [0:0] m_axi_edge_list_ch_5_ARID;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.data" *)output [7:0] m_axi_edge_list_ch_5_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.data" *)output m_axi_edge_list_ch_5_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.data" *)output [2:0] m_axi_edge_list_ch_5_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.data" *)output [3:0] m_axi_edge_list_ch_5_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.ready" *)input m_axi_edge_list_ch_5_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.data" *)output [2:0] m_axi_edge_list_ch_5_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_5_AR.valid" *)output m_axi_edge_list_ch_5_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.data" *)output [63:0] m_axi_edge_list_ch_5_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.data" *)output [1:0] m_axi_edge_list_ch_5_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.data" *)output [3:0] m_axi_edge_list_ch_5_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.data" *)output [0:0] m_axi_edge_list_ch_5_AWID;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.data" *)output [7:0] m_axi_edge_list_ch_5_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.data" *)output m_axi_edge_list_ch_5_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.data" *)output [2:0] m_axi_edge_list_ch_5_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.data" *)output [3:0] m_axi_edge_list_ch_5_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.ready" *)input m_axi_edge_list_ch_5_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.data" *)output [2:0] m_axi_edge_list_ch_5_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_5_AW.valid" *)output m_axi_edge_list_ch_5_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_5_B.data" *)input [0:0] m_axi_edge_list_ch_5_BID;
  (* RS_HS = "m_axi_edge_list_ch_5_B.ready" *)output m_axi_edge_list_ch_5_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_5_B.data" *)input [1:0] m_axi_edge_list_ch_5_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_5_B.valid" *)input m_axi_edge_list_ch_5_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_5_R.data" *)input [511:0] m_axi_edge_list_ch_5_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_5_R.data" *)input [0:0] m_axi_edge_list_ch_5_RID;
  (* RS_HS = "m_axi_edge_list_ch_5_R.data" *)input m_axi_edge_list_ch_5_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_5_R.ready" *)output m_axi_edge_list_ch_5_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_5_R.data" *)input [1:0] m_axi_edge_list_ch_5_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_5_R.valid" *)input m_axi_edge_list_ch_5_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_5_W.data" *)output [511:0] m_axi_edge_list_ch_5_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_5_W.data" *)output m_axi_edge_list_ch_5_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_5_W.ready" *)input m_axi_edge_list_ch_5_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_5_W.data" *)output [63:0] m_axi_edge_list_ch_5_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_5_W.valid" *)output m_axi_edge_list_ch_5_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.data" *)output [63:0] m_axi_edge_list_ch_6_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.data" *)output [1:0] m_axi_edge_list_ch_6_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.data" *)output [3:0] m_axi_edge_list_ch_6_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.data" *)output [0:0] m_axi_edge_list_ch_6_ARID;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.data" *)output [7:0] m_axi_edge_list_ch_6_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.data" *)output m_axi_edge_list_ch_6_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.data" *)output [2:0] m_axi_edge_list_ch_6_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.data" *)output [3:0] m_axi_edge_list_ch_6_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.ready" *)input m_axi_edge_list_ch_6_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.data" *)output [2:0] m_axi_edge_list_ch_6_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_6_AR.valid" *)output m_axi_edge_list_ch_6_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.data" *)output [63:0] m_axi_edge_list_ch_6_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.data" *)output [1:0] m_axi_edge_list_ch_6_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.data" *)output [3:0] m_axi_edge_list_ch_6_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.data" *)output [0:0] m_axi_edge_list_ch_6_AWID;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.data" *)output [7:0] m_axi_edge_list_ch_6_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.data" *)output m_axi_edge_list_ch_6_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.data" *)output [2:0] m_axi_edge_list_ch_6_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.data" *)output [3:0] m_axi_edge_list_ch_6_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.ready" *)input m_axi_edge_list_ch_6_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.data" *)output [2:0] m_axi_edge_list_ch_6_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_6_AW.valid" *)output m_axi_edge_list_ch_6_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_6_B.data" *)input [0:0] m_axi_edge_list_ch_6_BID;
  (* RS_HS = "m_axi_edge_list_ch_6_B.ready" *)output m_axi_edge_list_ch_6_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_6_B.data" *)input [1:0] m_axi_edge_list_ch_6_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_6_B.valid" *)input m_axi_edge_list_ch_6_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_6_R.data" *)input [511:0] m_axi_edge_list_ch_6_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_6_R.data" *)input [0:0] m_axi_edge_list_ch_6_RID;
  (* RS_HS = "m_axi_edge_list_ch_6_R.data" *)input m_axi_edge_list_ch_6_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_6_R.ready" *)output m_axi_edge_list_ch_6_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_6_R.data" *)input [1:0] m_axi_edge_list_ch_6_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_6_R.valid" *)input m_axi_edge_list_ch_6_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_6_W.data" *)output [511:0] m_axi_edge_list_ch_6_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_6_W.data" *)output m_axi_edge_list_ch_6_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_6_W.ready" *)input m_axi_edge_list_ch_6_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_6_W.data" *)output [63:0] m_axi_edge_list_ch_6_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_6_W.valid" *)output m_axi_edge_list_ch_6_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.data" *)output [63:0] m_axi_edge_list_ch_7_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.data" *)output [1:0] m_axi_edge_list_ch_7_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.data" *)output [3:0] m_axi_edge_list_ch_7_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.data" *)output [0:0] m_axi_edge_list_ch_7_ARID;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.data" *)output [7:0] m_axi_edge_list_ch_7_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.data" *)output m_axi_edge_list_ch_7_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.data" *)output [2:0] m_axi_edge_list_ch_7_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.data" *)output [3:0] m_axi_edge_list_ch_7_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.ready" *)input m_axi_edge_list_ch_7_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.data" *)output [2:0] m_axi_edge_list_ch_7_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_7_AR.valid" *)output m_axi_edge_list_ch_7_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.data" *)output [63:0] m_axi_edge_list_ch_7_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.data" *)output [1:0] m_axi_edge_list_ch_7_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.data" *)output [3:0] m_axi_edge_list_ch_7_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.data" *)output [0:0] m_axi_edge_list_ch_7_AWID;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.data" *)output [7:0] m_axi_edge_list_ch_7_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.data" *)output m_axi_edge_list_ch_7_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.data" *)output [2:0] m_axi_edge_list_ch_7_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.data" *)output [3:0] m_axi_edge_list_ch_7_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.ready" *)input m_axi_edge_list_ch_7_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.data" *)output [2:0] m_axi_edge_list_ch_7_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_7_AW.valid" *)output m_axi_edge_list_ch_7_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_7_B.data" *)input [0:0] m_axi_edge_list_ch_7_BID;
  (* RS_HS = "m_axi_edge_list_ch_7_B.ready" *)output m_axi_edge_list_ch_7_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_7_B.data" *)input [1:0] m_axi_edge_list_ch_7_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_7_B.valid" *)input m_axi_edge_list_ch_7_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_7_R.data" *)input [511:0] m_axi_edge_list_ch_7_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_7_R.data" *)input [0:0] m_axi_edge_list_ch_7_RID;
  (* RS_HS = "m_axi_edge_list_ch_7_R.data" *)input m_axi_edge_list_ch_7_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_7_R.ready" *)output m_axi_edge_list_ch_7_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_7_R.data" *)input [1:0] m_axi_edge_list_ch_7_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_7_R.valid" *)input m_axi_edge_list_ch_7_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_7_W.data" *)output [511:0] m_axi_edge_list_ch_7_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_7_W.data" *)output m_axi_edge_list_ch_7_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_7_W.ready" *)input m_axi_edge_list_ch_7_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_7_W.data" *)output [63:0] m_axi_edge_list_ch_7_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_7_W.valid" *)output m_axi_edge_list_ch_7_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.data" *)output [63:0] m_axi_edge_list_ch_8_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.data" *)output [1:0] m_axi_edge_list_ch_8_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.data" *)output [3:0] m_axi_edge_list_ch_8_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.data" *)output [0:0] m_axi_edge_list_ch_8_ARID;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.data" *)output [7:0] m_axi_edge_list_ch_8_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.data" *)output m_axi_edge_list_ch_8_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.data" *)output [2:0] m_axi_edge_list_ch_8_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.data" *)output [3:0] m_axi_edge_list_ch_8_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.ready" *)input m_axi_edge_list_ch_8_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.data" *)output [2:0] m_axi_edge_list_ch_8_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_8_AR.valid" *)output m_axi_edge_list_ch_8_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.data" *)output [63:0] m_axi_edge_list_ch_8_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.data" *)output [1:0] m_axi_edge_list_ch_8_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.data" *)output [3:0] m_axi_edge_list_ch_8_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.data" *)output [0:0] m_axi_edge_list_ch_8_AWID;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.data" *)output [7:0] m_axi_edge_list_ch_8_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.data" *)output m_axi_edge_list_ch_8_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.data" *)output [2:0] m_axi_edge_list_ch_8_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.data" *)output [3:0] m_axi_edge_list_ch_8_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.ready" *)input m_axi_edge_list_ch_8_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.data" *)output [2:0] m_axi_edge_list_ch_8_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_8_AW.valid" *)output m_axi_edge_list_ch_8_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_8_B.data" *)input [0:0] m_axi_edge_list_ch_8_BID;
  (* RS_HS = "m_axi_edge_list_ch_8_B.ready" *)output m_axi_edge_list_ch_8_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_8_B.data" *)input [1:0] m_axi_edge_list_ch_8_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_8_B.valid" *)input m_axi_edge_list_ch_8_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_8_R.data" *)input [511:0] m_axi_edge_list_ch_8_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_8_R.data" *)input [0:0] m_axi_edge_list_ch_8_RID;
  (* RS_HS = "m_axi_edge_list_ch_8_R.data" *)input m_axi_edge_list_ch_8_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_8_R.ready" *)output m_axi_edge_list_ch_8_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_8_R.data" *)input [1:0] m_axi_edge_list_ch_8_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_8_R.valid" *)input m_axi_edge_list_ch_8_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_8_W.data" *)output [511:0] m_axi_edge_list_ch_8_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_8_W.data" *)output m_axi_edge_list_ch_8_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_8_W.ready" *)input m_axi_edge_list_ch_8_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_8_W.data" *)output [63:0] m_axi_edge_list_ch_8_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_8_W.valid" *)output m_axi_edge_list_ch_8_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.data" *)output [63:0] m_axi_edge_list_ch_9_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.data" *)output [1:0] m_axi_edge_list_ch_9_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.data" *)output [3:0] m_axi_edge_list_ch_9_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.data" *)output [0:0] m_axi_edge_list_ch_9_ARID;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.data" *)output [7:0] m_axi_edge_list_ch_9_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.data" *)output m_axi_edge_list_ch_9_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.data" *)output [2:0] m_axi_edge_list_ch_9_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.data" *)output [3:0] m_axi_edge_list_ch_9_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.ready" *)input m_axi_edge_list_ch_9_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.data" *)output [2:0] m_axi_edge_list_ch_9_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_9_AR.valid" *)output m_axi_edge_list_ch_9_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.data" *)output [63:0] m_axi_edge_list_ch_9_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.data" *)output [1:0] m_axi_edge_list_ch_9_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.data" *)output [3:0] m_axi_edge_list_ch_9_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.data" *)output [0:0] m_axi_edge_list_ch_9_AWID;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.data" *)output [7:0] m_axi_edge_list_ch_9_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.data" *)output m_axi_edge_list_ch_9_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.data" *)output [2:0] m_axi_edge_list_ch_9_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.data" *)output [3:0] m_axi_edge_list_ch_9_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.ready" *)input m_axi_edge_list_ch_9_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.data" *)output [2:0] m_axi_edge_list_ch_9_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_9_AW.valid" *)output m_axi_edge_list_ch_9_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_9_B.data" *)input [0:0] m_axi_edge_list_ch_9_BID;
  (* RS_HS = "m_axi_edge_list_ch_9_B.ready" *)output m_axi_edge_list_ch_9_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_9_B.data" *)input [1:0] m_axi_edge_list_ch_9_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_9_B.valid" *)input m_axi_edge_list_ch_9_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_9_R.data" *)input [511:0] m_axi_edge_list_ch_9_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_9_R.data" *)input [0:0] m_axi_edge_list_ch_9_RID;
  (* RS_HS = "m_axi_edge_list_ch_9_R.data" *)input m_axi_edge_list_ch_9_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_9_R.ready" *)output m_axi_edge_list_ch_9_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_9_R.data" *)input [1:0] m_axi_edge_list_ch_9_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_9_R.valid" *)input m_axi_edge_list_ch_9_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_9_W.data" *)output [511:0] m_axi_edge_list_ch_9_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_9_W.data" *)output m_axi_edge_list_ch_9_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_9_W.ready" *)input m_axi_edge_list_ch_9_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_9_W.data" *)output [63:0] m_axi_edge_list_ch_9_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_9_W.valid" *)output m_axi_edge_list_ch_9_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.data" *)output [63:0] m_axi_edge_list_ch_10_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.data" *)output [1:0] m_axi_edge_list_ch_10_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.data" *)output [3:0] m_axi_edge_list_ch_10_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.data" *)output [0:0] m_axi_edge_list_ch_10_ARID;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.data" *)output [7:0] m_axi_edge_list_ch_10_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.data" *)output m_axi_edge_list_ch_10_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.data" *)output [2:0] m_axi_edge_list_ch_10_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.data" *)output [3:0] m_axi_edge_list_ch_10_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.ready" *)input m_axi_edge_list_ch_10_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.data" *)output [2:0] m_axi_edge_list_ch_10_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_10_AR.valid" *)output m_axi_edge_list_ch_10_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.data" *)output [63:0] m_axi_edge_list_ch_10_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.data" *)output [1:0] m_axi_edge_list_ch_10_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.data" *)output [3:0] m_axi_edge_list_ch_10_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.data" *)output [0:0] m_axi_edge_list_ch_10_AWID;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.data" *)output [7:0] m_axi_edge_list_ch_10_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.data" *)output m_axi_edge_list_ch_10_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.data" *)output [2:0] m_axi_edge_list_ch_10_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.data" *)output [3:0] m_axi_edge_list_ch_10_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.ready" *)input m_axi_edge_list_ch_10_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.data" *)output [2:0] m_axi_edge_list_ch_10_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_10_AW.valid" *)output m_axi_edge_list_ch_10_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_10_B.data" *)input [0:0] m_axi_edge_list_ch_10_BID;
  (* RS_HS = "m_axi_edge_list_ch_10_B.ready" *)output m_axi_edge_list_ch_10_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_10_B.data" *)input [1:0] m_axi_edge_list_ch_10_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_10_B.valid" *)input m_axi_edge_list_ch_10_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_10_R.data" *)input [511:0] m_axi_edge_list_ch_10_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_10_R.data" *)input [0:0] m_axi_edge_list_ch_10_RID;
  (* RS_HS = "m_axi_edge_list_ch_10_R.data" *)input m_axi_edge_list_ch_10_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_10_R.ready" *)output m_axi_edge_list_ch_10_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_10_R.data" *)input [1:0] m_axi_edge_list_ch_10_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_10_R.valid" *)input m_axi_edge_list_ch_10_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_10_W.data" *)output [511:0] m_axi_edge_list_ch_10_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_10_W.data" *)output m_axi_edge_list_ch_10_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_10_W.ready" *)input m_axi_edge_list_ch_10_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_10_W.data" *)output [63:0] m_axi_edge_list_ch_10_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_10_W.valid" *)output m_axi_edge_list_ch_10_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.data" *)output [63:0] m_axi_edge_list_ch_11_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.data" *)output [1:0] m_axi_edge_list_ch_11_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.data" *)output [3:0] m_axi_edge_list_ch_11_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.data" *)output [0:0] m_axi_edge_list_ch_11_ARID;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.data" *)output [7:0] m_axi_edge_list_ch_11_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.data" *)output m_axi_edge_list_ch_11_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.data" *)output [2:0] m_axi_edge_list_ch_11_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.data" *)output [3:0] m_axi_edge_list_ch_11_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.ready" *)input m_axi_edge_list_ch_11_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.data" *)output [2:0] m_axi_edge_list_ch_11_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_11_AR.valid" *)output m_axi_edge_list_ch_11_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.data" *)output [63:0] m_axi_edge_list_ch_11_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.data" *)output [1:0] m_axi_edge_list_ch_11_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.data" *)output [3:0] m_axi_edge_list_ch_11_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.data" *)output [0:0] m_axi_edge_list_ch_11_AWID;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.data" *)output [7:0] m_axi_edge_list_ch_11_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.data" *)output m_axi_edge_list_ch_11_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.data" *)output [2:0] m_axi_edge_list_ch_11_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.data" *)output [3:0] m_axi_edge_list_ch_11_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.ready" *)input m_axi_edge_list_ch_11_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.data" *)output [2:0] m_axi_edge_list_ch_11_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_11_AW.valid" *)output m_axi_edge_list_ch_11_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_11_B.data" *)input [0:0] m_axi_edge_list_ch_11_BID;
  (* RS_HS = "m_axi_edge_list_ch_11_B.ready" *)output m_axi_edge_list_ch_11_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_11_B.data" *)input [1:0] m_axi_edge_list_ch_11_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_11_B.valid" *)input m_axi_edge_list_ch_11_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_11_R.data" *)input [511:0] m_axi_edge_list_ch_11_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_11_R.data" *)input [0:0] m_axi_edge_list_ch_11_RID;
  (* RS_HS = "m_axi_edge_list_ch_11_R.data" *)input m_axi_edge_list_ch_11_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_11_R.ready" *)output m_axi_edge_list_ch_11_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_11_R.data" *)input [1:0] m_axi_edge_list_ch_11_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_11_R.valid" *)input m_axi_edge_list_ch_11_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_11_W.data" *)output [511:0] m_axi_edge_list_ch_11_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_11_W.data" *)output m_axi_edge_list_ch_11_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_11_W.ready" *)input m_axi_edge_list_ch_11_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_11_W.data" *)output [63:0] m_axi_edge_list_ch_11_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_11_W.valid" *)output m_axi_edge_list_ch_11_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.data" *)output [63:0] m_axi_edge_list_ch_12_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.data" *)output [1:0] m_axi_edge_list_ch_12_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.data" *)output [3:0] m_axi_edge_list_ch_12_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.data" *)output [0:0] m_axi_edge_list_ch_12_ARID;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.data" *)output [7:0] m_axi_edge_list_ch_12_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.data" *)output m_axi_edge_list_ch_12_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.data" *)output [2:0] m_axi_edge_list_ch_12_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.data" *)output [3:0] m_axi_edge_list_ch_12_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.ready" *)input m_axi_edge_list_ch_12_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.data" *)output [2:0] m_axi_edge_list_ch_12_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_12_AR.valid" *)output m_axi_edge_list_ch_12_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.data" *)output [63:0] m_axi_edge_list_ch_12_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.data" *)output [1:0] m_axi_edge_list_ch_12_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.data" *)output [3:0] m_axi_edge_list_ch_12_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.data" *)output [0:0] m_axi_edge_list_ch_12_AWID;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.data" *)output [7:0] m_axi_edge_list_ch_12_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.data" *)output m_axi_edge_list_ch_12_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.data" *)output [2:0] m_axi_edge_list_ch_12_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.data" *)output [3:0] m_axi_edge_list_ch_12_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.ready" *)input m_axi_edge_list_ch_12_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.data" *)output [2:0] m_axi_edge_list_ch_12_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_12_AW.valid" *)output m_axi_edge_list_ch_12_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_12_B.data" *)input [0:0] m_axi_edge_list_ch_12_BID;
  (* RS_HS = "m_axi_edge_list_ch_12_B.ready" *)output m_axi_edge_list_ch_12_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_12_B.data" *)input [1:0] m_axi_edge_list_ch_12_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_12_B.valid" *)input m_axi_edge_list_ch_12_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_12_R.data" *)input [511:0] m_axi_edge_list_ch_12_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_12_R.data" *)input [0:0] m_axi_edge_list_ch_12_RID;
  (* RS_HS = "m_axi_edge_list_ch_12_R.data" *)input m_axi_edge_list_ch_12_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_12_R.ready" *)output m_axi_edge_list_ch_12_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_12_R.data" *)input [1:0] m_axi_edge_list_ch_12_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_12_R.valid" *)input m_axi_edge_list_ch_12_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_12_W.data" *)output [511:0] m_axi_edge_list_ch_12_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_12_W.data" *)output m_axi_edge_list_ch_12_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_12_W.ready" *)input m_axi_edge_list_ch_12_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_12_W.data" *)output [63:0] m_axi_edge_list_ch_12_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_12_W.valid" *)output m_axi_edge_list_ch_12_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.data" *)output [63:0] m_axi_edge_list_ch_13_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.data" *)output [1:0] m_axi_edge_list_ch_13_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.data" *)output [3:0] m_axi_edge_list_ch_13_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.data" *)output [0:0] m_axi_edge_list_ch_13_ARID;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.data" *)output [7:0] m_axi_edge_list_ch_13_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.data" *)output m_axi_edge_list_ch_13_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.data" *)output [2:0] m_axi_edge_list_ch_13_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.data" *)output [3:0] m_axi_edge_list_ch_13_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.ready" *)input m_axi_edge_list_ch_13_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.data" *)output [2:0] m_axi_edge_list_ch_13_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_13_AR.valid" *)output m_axi_edge_list_ch_13_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.data" *)output [63:0] m_axi_edge_list_ch_13_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.data" *)output [1:0] m_axi_edge_list_ch_13_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.data" *)output [3:0] m_axi_edge_list_ch_13_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.data" *)output [0:0] m_axi_edge_list_ch_13_AWID;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.data" *)output [7:0] m_axi_edge_list_ch_13_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.data" *)output m_axi_edge_list_ch_13_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.data" *)output [2:0] m_axi_edge_list_ch_13_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.data" *)output [3:0] m_axi_edge_list_ch_13_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.ready" *)input m_axi_edge_list_ch_13_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.data" *)output [2:0] m_axi_edge_list_ch_13_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_13_AW.valid" *)output m_axi_edge_list_ch_13_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_13_B.data" *)input [0:0] m_axi_edge_list_ch_13_BID;
  (* RS_HS = "m_axi_edge_list_ch_13_B.ready" *)output m_axi_edge_list_ch_13_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_13_B.data" *)input [1:0] m_axi_edge_list_ch_13_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_13_B.valid" *)input m_axi_edge_list_ch_13_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_13_R.data" *)input [511:0] m_axi_edge_list_ch_13_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_13_R.data" *)input [0:0] m_axi_edge_list_ch_13_RID;
  (* RS_HS = "m_axi_edge_list_ch_13_R.data" *)input m_axi_edge_list_ch_13_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_13_R.ready" *)output m_axi_edge_list_ch_13_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_13_R.data" *)input [1:0] m_axi_edge_list_ch_13_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_13_R.valid" *)input m_axi_edge_list_ch_13_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_13_W.data" *)output [511:0] m_axi_edge_list_ch_13_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_13_W.data" *)output m_axi_edge_list_ch_13_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_13_W.ready" *)input m_axi_edge_list_ch_13_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_13_W.data" *)output [63:0] m_axi_edge_list_ch_13_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_13_W.valid" *)output m_axi_edge_list_ch_13_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.data" *)output [63:0] m_axi_edge_list_ch_14_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.data" *)output [1:0] m_axi_edge_list_ch_14_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.data" *)output [3:0] m_axi_edge_list_ch_14_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.data" *)output [0:0] m_axi_edge_list_ch_14_ARID;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.data" *)output [7:0] m_axi_edge_list_ch_14_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.data" *)output m_axi_edge_list_ch_14_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.data" *)output [2:0] m_axi_edge_list_ch_14_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.data" *)output [3:0] m_axi_edge_list_ch_14_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.ready" *)input m_axi_edge_list_ch_14_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.data" *)output [2:0] m_axi_edge_list_ch_14_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_14_AR.valid" *)output m_axi_edge_list_ch_14_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.data" *)output [63:0] m_axi_edge_list_ch_14_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.data" *)output [1:0] m_axi_edge_list_ch_14_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.data" *)output [3:0] m_axi_edge_list_ch_14_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.data" *)output [0:0] m_axi_edge_list_ch_14_AWID;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.data" *)output [7:0] m_axi_edge_list_ch_14_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.data" *)output m_axi_edge_list_ch_14_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.data" *)output [2:0] m_axi_edge_list_ch_14_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.data" *)output [3:0] m_axi_edge_list_ch_14_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.ready" *)input m_axi_edge_list_ch_14_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.data" *)output [2:0] m_axi_edge_list_ch_14_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_14_AW.valid" *)output m_axi_edge_list_ch_14_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_14_B.data" *)input [0:0] m_axi_edge_list_ch_14_BID;
  (* RS_HS = "m_axi_edge_list_ch_14_B.ready" *)output m_axi_edge_list_ch_14_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_14_B.data" *)input [1:0] m_axi_edge_list_ch_14_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_14_B.valid" *)input m_axi_edge_list_ch_14_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_14_R.data" *)input [511:0] m_axi_edge_list_ch_14_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_14_R.data" *)input [0:0] m_axi_edge_list_ch_14_RID;
  (* RS_HS = "m_axi_edge_list_ch_14_R.data" *)input m_axi_edge_list_ch_14_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_14_R.ready" *)output m_axi_edge_list_ch_14_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_14_R.data" *)input [1:0] m_axi_edge_list_ch_14_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_14_R.valid" *)input m_axi_edge_list_ch_14_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_14_W.data" *)output [511:0] m_axi_edge_list_ch_14_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_14_W.data" *)output m_axi_edge_list_ch_14_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_14_W.ready" *)input m_axi_edge_list_ch_14_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_14_W.data" *)output [63:0] m_axi_edge_list_ch_14_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_14_W.valid" *)output m_axi_edge_list_ch_14_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.data" *)output [63:0] m_axi_edge_list_ch_15_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.data" *)output [1:0] m_axi_edge_list_ch_15_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.data" *)output [3:0] m_axi_edge_list_ch_15_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.data" *)output [0:0] m_axi_edge_list_ch_15_ARID;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.data" *)output [7:0] m_axi_edge_list_ch_15_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.data" *)output m_axi_edge_list_ch_15_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.data" *)output [2:0] m_axi_edge_list_ch_15_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.data" *)output [3:0] m_axi_edge_list_ch_15_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.ready" *)input m_axi_edge_list_ch_15_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.data" *)output [2:0] m_axi_edge_list_ch_15_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_15_AR.valid" *)output m_axi_edge_list_ch_15_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.data" *)output [63:0] m_axi_edge_list_ch_15_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.data" *)output [1:0] m_axi_edge_list_ch_15_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.data" *)output [3:0] m_axi_edge_list_ch_15_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.data" *)output [0:0] m_axi_edge_list_ch_15_AWID;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.data" *)output [7:0] m_axi_edge_list_ch_15_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.data" *)output m_axi_edge_list_ch_15_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.data" *)output [2:0] m_axi_edge_list_ch_15_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.data" *)output [3:0] m_axi_edge_list_ch_15_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.ready" *)input m_axi_edge_list_ch_15_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.data" *)output [2:0] m_axi_edge_list_ch_15_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_15_AW.valid" *)output m_axi_edge_list_ch_15_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_15_B.data" *)input [0:0] m_axi_edge_list_ch_15_BID;
  (* RS_HS = "m_axi_edge_list_ch_15_B.ready" *)output m_axi_edge_list_ch_15_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_15_B.data" *)input [1:0] m_axi_edge_list_ch_15_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_15_B.valid" *)input m_axi_edge_list_ch_15_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_15_R.data" *)input [511:0] m_axi_edge_list_ch_15_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_15_R.data" *)input [0:0] m_axi_edge_list_ch_15_RID;
  (* RS_HS = "m_axi_edge_list_ch_15_R.data" *)input m_axi_edge_list_ch_15_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_15_R.ready" *)output m_axi_edge_list_ch_15_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_15_R.data" *)input [1:0] m_axi_edge_list_ch_15_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_15_R.valid" *)input m_axi_edge_list_ch_15_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_15_W.data" *)output [511:0] m_axi_edge_list_ch_15_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_15_W.data" *)output m_axi_edge_list_ch_15_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_15_W.ready" *)input m_axi_edge_list_ch_15_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_15_W.data" *)output [63:0] m_axi_edge_list_ch_15_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_15_W.valid" *)output m_axi_edge_list_ch_15_WVALID;
  (* RS_HS = "m_axi_vec_digA_AR.data" *)output [63:0] m_axi_vec_digA_ARADDR;
  (* RS_HS = "m_axi_vec_digA_AR.data" *)output [1:0] m_axi_vec_digA_ARBURST;
  (* RS_HS = "m_axi_vec_digA_AR.data" *)output [3:0] m_axi_vec_digA_ARCACHE;
  (* RS_HS = "m_axi_vec_digA_AR.data" *)output [0:0] m_axi_vec_digA_ARID;
  (* RS_HS = "m_axi_vec_digA_AR.data" *)output [7:0] m_axi_vec_digA_ARLEN;
  (* RS_HS = "m_axi_vec_digA_AR.data" *)output m_axi_vec_digA_ARLOCK;
  (* RS_HS = "m_axi_vec_digA_AR.data" *)output [2:0] m_axi_vec_digA_ARPROT;
  (* RS_HS = "m_axi_vec_digA_AR.data" *)output [3:0] m_axi_vec_digA_ARQOS;
  (* RS_HS = "m_axi_vec_digA_AR.ready" *)input m_axi_vec_digA_ARREADY;
  (* RS_HS = "m_axi_vec_digA_AR.data" *)output [2:0] m_axi_vec_digA_ARSIZE;
  (* RS_HS = "m_axi_vec_digA_AR.valid" *)output m_axi_vec_digA_ARVALID;
  (* RS_HS = "m_axi_vec_digA_AW.data" *)output [63:0] m_axi_vec_digA_AWADDR;
  (* RS_HS = "m_axi_vec_digA_AW.data" *)output [1:0] m_axi_vec_digA_AWBURST;
  (* RS_HS = "m_axi_vec_digA_AW.data" *)output [3:0] m_axi_vec_digA_AWCACHE;
  (* RS_HS = "m_axi_vec_digA_AW.data" *)output [0:0] m_axi_vec_digA_AWID;
  (* RS_HS = "m_axi_vec_digA_AW.data" *)output [7:0] m_axi_vec_digA_AWLEN;
  (* RS_HS = "m_axi_vec_digA_AW.data" *)output m_axi_vec_digA_AWLOCK;
  (* RS_HS = "m_axi_vec_digA_AW.data" *)output [2:0] m_axi_vec_digA_AWPROT;
  (* RS_HS = "m_axi_vec_digA_AW.data" *)output [3:0] m_axi_vec_digA_AWQOS;
  (* RS_HS = "m_axi_vec_digA_AW.ready" *)input m_axi_vec_digA_AWREADY;
  (* RS_HS = "m_axi_vec_digA_AW.data" *)output [2:0] m_axi_vec_digA_AWSIZE;
  (* RS_HS = "m_axi_vec_digA_AW.valid" *)output m_axi_vec_digA_AWVALID;
  (* RS_HS = "m_axi_vec_digA_B.data" *)input [0:0] m_axi_vec_digA_BID;
  (* RS_HS = "m_axi_vec_digA_B.ready" *)output m_axi_vec_digA_BREADY;
  (* RS_HS = "m_axi_vec_digA_B.data" *)input [1:0] m_axi_vec_digA_BRESP;
  (* RS_HS = "m_axi_vec_digA_B.valid" *)input m_axi_vec_digA_BVALID;
  (* RS_HS = "m_axi_vec_digA_R.data" *)input [511:0] m_axi_vec_digA_RDATA;
  (* RS_HS = "m_axi_vec_digA_R.data" *)input [0:0] m_axi_vec_digA_RID;
  (* RS_HS = "m_axi_vec_digA_R.data" *)input m_axi_vec_digA_RLAST;
  (* RS_HS = "m_axi_vec_digA_R.ready" *)output m_axi_vec_digA_RREADY;
  (* RS_HS = "m_axi_vec_digA_R.data" *)input [1:0] m_axi_vec_digA_RRESP;
  (* RS_HS = "m_axi_vec_digA_R.valid" *)input m_axi_vec_digA_RVALID;
  (* RS_HS = "m_axi_vec_digA_W.data" *)output [511:0] m_axi_vec_digA_WDATA;
  (* RS_HS = "m_axi_vec_digA_W.data" *)output m_axi_vec_digA_WLAST;
  (* RS_HS = "m_axi_vec_digA_W.ready" *)input m_axi_vec_digA_WREADY;
  (* RS_HS = "m_axi_vec_digA_W.data" *)output [63:0] m_axi_vec_digA_WSTRB;
  (* RS_HS = "m_axi_vec_digA_W.valid" *)output m_axi_vec_digA_WVALID;
  (* RS_HS = "m_axi_edge_list_ptr_AR.data" *)output [63:0] m_axi_edge_list_ptr_ARADDR;
  (* RS_HS = "m_axi_edge_list_ptr_AR.data" *)output [1:0] m_axi_edge_list_ptr_ARBURST;
  (* RS_HS = "m_axi_edge_list_ptr_AR.data" *)output [3:0] m_axi_edge_list_ptr_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ptr_AR.data" *)output [0:0] m_axi_edge_list_ptr_ARID;
  (* RS_HS = "m_axi_edge_list_ptr_AR.data" *)output [7:0] m_axi_edge_list_ptr_ARLEN;
  (* RS_HS = "m_axi_edge_list_ptr_AR.data" *)output m_axi_edge_list_ptr_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ptr_AR.data" *)output [2:0] m_axi_edge_list_ptr_ARPROT;
  (* RS_HS = "m_axi_edge_list_ptr_AR.data" *)output [3:0] m_axi_edge_list_ptr_ARQOS;
  (* RS_HS = "m_axi_edge_list_ptr_AR.ready" *)input m_axi_edge_list_ptr_ARREADY;
  (* RS_HS = "m_axi_edge_list_ptr_AR.data" *)output [2:0] m_axi_edge_list_ptr_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ptr_AR.valid" *)output m_axi_edge_list_ptr_ARVALID;
  (* RS_HS = "m_axi_edge_list_ptr_AW.data" *)output [63:0] m_axi_edge_list_ptr_AWADDR;
  (* RS_HS = "m_axi_edge_list_ptr_AW.data" *)output [1:0] m_axi_edge_list_ptr_AWBURST;
  (* RS_HS = "m_axi_edge_list_ptr_AW.data" *)output [3:0] m_axi_edge_list_ptr_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ptr_AW.data" *)output [0:0] m_axi_edge_list_ptr_AWID;
  (* RS_HS = "m_axi_edge_list_ptr_AW.data" *)output [7:0] m_axi_edge_list_ptr_AWLEN;
  (* RS_HS = "m_axi_edge_list_ptr_AW.data" *)output m_axi_edge_list_ptr_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ptr_AW.data" *)output [2:0] m_axi_edge_list_ptr_AWPROT;
  (* RS_HS = "m_axi_edge_list_ptr_AW.data" *)output [3:0] m_axi_edge_list_ptr_AWQOS;
  (* RS_HS = "m_axi_edge_list_ptr_AW.ready" *)input m_axi_edge_list_ptr_AWREADY;
  (* RS_HS = "m_axi_edge_list_ptr_AW.data" *)output [2:0] m_axi_edge_list_ptr_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ptr_AW.valid" *)output m_axi_edge_list_ptr_AWVALID;
  (* RS_HS = "m_axi_edge_list_ptr_B.data" *)input [0:0] m_axi_edge_list_ptr_BID;
  (* RS_HS = "m_axi_edge_list_ptr_B.ready" *)output m_axi_edge_list_ptr_BREADY;
  (* RS_HS = "m_axi_edge_list_ptr_B.data" *)input [1:0] m_axi_edge_list_ptr_BRESP;
  (* RS_HS = "m_axi_edge_list_ptr_B.valid" *)input m_axi_edge_list_ptr_BVALID;
  (* RS_HS = "m_axi_edge_list_ptr_R.data" *)input [31:0] m_axi_edge_list_ptr_RDATA;
  (* RS_HS = "m_axi_edge_list_ptr_R.data" *)input [0:0] m_axi_edge_list_ptr_RID;
  (* RS_HS = "m_axi_edge_list_ptr_R.data" *)input m_axi_edge_list_ptr_RLAST;
  (* RS_HS = "m_axi_edge_list_ptr_R.ready" *)output m_axi_edge_list_ptr_RREADY;
  (* RS_HS = "m_axi_edge_list_ptr_R.data" *)input [1:0] m_axi_edge_list_ptr_RRESP;
  (* RS_HS = "m_axi_edge_list_ptr_R.valid" *)input m_axi_edge_list_ptr_RVALID;
  (* RS_HS = "m_axi_edge_list_ptr_W.data" *)output [31:0] m_axi_edge_list_ptr_WDATA;
  (* RS_HS = "m_axi_edge_list_ptr_W.data" *)output m_axi_edge_list_ptr_WLAST;
  (* RS_HS = "m_axi_edge_list_ptr_W.ready" *)input m_axi_edge_list_ptr_WREADY;
  (* RS_HS = "m_axi_edge_list_ptr_W.data" *)output [3:0] m_axi_edge_list_ptr_WSTRB;
  (* RS_HS = "m_axi_edge_list_ptr_W.valid" *)output m_axi_edge_list_ptr_WVALID;
  (* RS_HS = "m_axi_vec_res_AR.data" *)output [63:0] m_axi_vec_res_ARADDR;
  (* RS_HS = "m_axi_vec_res_AR.data" *)output [1:0] m_axi_vec_res_ARBURST;
  (* RS_HS = "m_axi_vec_res_AR.data" *)output [3:0] m_axi_vec_res_ARCACHE;
  (* RS_HS = "m_axi_vec_res_AR.data" *)output [0:0] m_axi_vec_res_ARID;
  (* RS_HS = "m_axi_vec_res_AR.data" *)output [7:0] m_axi_vec_res_ARLEN;
  (* RS_HS = "m_axi_vec_res_AR.data" *)output m_axi_vec_res_ARLOCK;
  (* RS_HS = "m_axi_vec_res_AR.data" *)output [2:0] m_axi_vec_res_ARPROT;
  (* RS_HS = "m_axi_vec_res_AR.data" *)output [3:0] m_axi_vec_res_ARQOS;
  (* RS_HS = "m_axi_vec_res_AR.ready" *)input m_axi_vec_res_ARREADY;
  (* RS_HS = "m_axi_vec_res_AR.data" *)output [2:0] m_axi_vec_res_ARSIZE;
  (* RS_HS = "m_axi_vec_res_AR.valid" *)output m_axi_vec_res_ARVALID;
  (* RS_HS = "m_axi_vec_res_AW.data" *)output [63:0] m_axi_vec_res_AWADDR;
  (* RS_HS = "m_axi_vec_res_AW.data" *)output [1:0] m_axi_vec_res_AWBURST;
  (* RS_HS = "m_axi_vec_res_AW.data" *)output [3:0] m_axi_vec_res_AWCACHE;
  (* RS_HS = "m_axi_vec_res_AW.data" *)output [0:0] m_axi_vec_res_AWID;
  (* RS_HS = "m_axi_vec_res_AW.data" *)output [7:0] m_axi_vec_res_AWLEN;
  (* RS_HS = "m_axi_vec_res_AW.data" *)output m_axi_vec_res_AWLOCK;
  (* RS_HS = "m_axi_vec_res_AW.data" *)output [2:0] m_axi_vec_res_AWPROT;
  (* RS_HS = "m_axi_vec_res_AW.data" *)output [3:0] m_axi_vec_res_AWQOS;
  (* RS_HS = "m_axi_vec_res_AW.ready" *)input m_axi_vec_res_AWREADY;
  (* RS_HS = "m_axi_vec_res_AW.data" *)output [2:0] m_axi_vec_res_AWSIZE;
  (* RS_HS = "m_axi_vec_res_AW.valid" *)output m_axi_vec_res_AWVALID;
  (* RS_HS = "m_axi_vec_res_B.data" *)input [0:0] m_axi_vec_res_BID;
  (* RS_HS = "m_axi_vec_res_B.ready" *)output m_axi_vec_res_BREADY;
  (* RS_HS = "m_axi_vec_res_B.data" *)input [1:0] m_axi_vec_res_BRESP;
  (* RS_HS = "m_axi_vec_res_B.valid" *)input m_axi_vec_res_BVALID;
  (* RS_HS = "m_axi_vec_res_R.data" *)input [63:0] m_axi_vec_res_RDATA;
  (* RS_HS = "m_axi_vec_res_R.data" *)input [0:0] m_axi_vec_res_RID;
  (* RS_HS = "m_axi_vec_res_R.data" *)input m_axi_vec_res_RLAST;
  (* RS_HS = "m_axi_vec_res_R.ready" *)output m_axi_vec_res_RREADY;
  (* RS_HS = "m_axi_vec_res_R.data" *)input [1:0] m_axi_vec_res_RRESP;
  (* RS_HS = "m_axi_vec_res_R.valid" *)input m_axi_vec_res_RVALID;
  (* RS_HS = "m_axi_vec_res_W.data" *)output [63:0] m_axi_vec_res_WDATA;
  (* RS_HS = "m_axi_vec_res_W.data" *)output m_axi_vec_res_WLAST;
  (* RS_HS = "m_axi_vec_res_W.ready" *)input m_axi_vec_res_WREADY;
  (* RS_HS = "m_axi_vec_res_W.data" *)output [7:0] m_axi_vec_res_WSTRB;
  (* RS_HS = "m_axi_vec_res_W.valid" *)output m_axi_vec_res_WVALID;
  wire ap_start;
  wire [63:0] edge_list_ptr;
  wire [63:0] edge_list_ch_0;
  wire [63:0] edge_list_ch_1;
  wire [63:0] edge_list_ch_2;
  wire [63:0] edge_list_ch_3;
  wire [63:0] edge_list_ch_4;
  wire [63:0] edge_list_ch_5;
  wire [63:0] edge_list_ch_6;
  wire [63:0] edge_list_ch_7;
  wire [63:0] edge_list_ch_8;
  wire [63:0] edge_list_ch_9;
  wire [63:0] edge_list_ch_10;
  wire [63:0] edge_list_ch_11;
  wire [63:0] edge_list_ch_12;
  wire [63:0] edge_list_ch_13;
  wire [63:0] edge_list_ch_14;
  wire [63:0] edge_list_ch_15;
  wire [63:0] vec_x_0;
  wire [63:0] vec_x_1;
  wire [63:0] vec_p_0;
  wire [63:0] vec_p_1;
  wire [63:0] vec_Ap;
  wire [63:0] vec_r_0;
  wire [63:0] vec_r_1;
  wire [63:0] vec_digA;
  wire [63:0] vec_res;
  wire [31:0] NUM_ITE;
  wire [31:0] NUM_A_LEN;
  wire [31:0] M;
  wire [31:0] rp_time;
  wire [63:0] th_termination;
  wire [32:0] PE_inst_Callipepla_0__dout;
  wire PE_inst_Callipepla_0__empty_n;
  wire PE_inst_Callipepla_0__read;
  wire [32:0] PE_inst_Callipepla_0__din;
  wire PE_inst_Callipepla_0__full_n;
  wire PE_inst_Callipepla_0__write;
  wire [32:0] PE_inst_Callipepla_10__dout;
  wire PE_inst_Callipepla_10__empty_n;
  wire PE_inst_Callipepla_10__read;
  wire [32:0] PE_inst_Callipepla_10__din;
  wire PE_inst_Callipepla_10__full_n;
  wire PE_inst_Callipepla_10__write;
  wire [32:0] PE_inst_Callipepla_11__dout;
  wire PE_inst_Callipepla_11__empty_n;
  wire PE_inst_Callipepla_11__read;
  wire [32:0] PE_inst_Callipepla_11__din;
  wire PE_inst_Callipepla_11__full_n;
  wire PE_inst_Callipepla_11__write;
  wire [32:0] PE_inst_Callipepla_12__dout;
  wire PE_inst_Callipepla_12__empty_n;
  wire PE_inst_Callipepla_12__read;
  wire [32:0] PE_inst_Callipepla_12__din;
  wire PE_inst_Callipepla_12__full_n;
  wire PE_inst_Callipepla_12__write;
  wire [32:0] PE_inst_Callipepla_13__dout;
  wire PE_inst_Callipepla_13__empty_n;
  wire PE_inst_Callipepla_13__read;
  wire [32:0] PE_inst_Callipepla_13__din;
  wire PE_inst_Callipepla_13__full_n;
  wire PE_inst_Callipepla_13__write;
  wire [32:0] PE_inst_Callipepla_14__dout;
  wire PE_inst_Callipepla_14__empty_n;
  wire PE_inst_Callipepla_14__read;
  wire [32:0] PE_inst_Callipepla_14__din;
  wire PE_inst_Callipepla_14__full_n;
  wire PE_inst_Callipepla_14__write;
  wire [32:0] PE_inst_Callipepla_15__dout;
  wire PE_inst_Callipepla_15__empty_n;
  wire PE_inst_Callipepla_15__read;
  wire [32:0] PE_inst_Callipepla_15__din;
  wire PE_inst_Callipepla_15__full_n;
  wire PE_inst_Callipepla_15__write;
  wire [32:0] PE_inst_Callipepla_16__dout;
  wire PE_inst_Callipepla_16__empty_n;
  wire PE_inst_Callipepla_16__read;
  wire [32:0] PE_inst_Callipepla_16__din;
  wire PE_inst_Callipepla_16__full_n;
  wire PE_inst_Callipepla_16__write;
  wire [32:0] PE_inst_Callipepla_1__dout;
  wire PE_inst_Callipepla_1__empty_n;
  wire PE_inst_Callipepla_1__read;
  wire [32:0] PE_inst_Callipepla_1__din;
  wire PE_inst_Callipepla_1__full_n;
  wire PE_inst_Callipepla_1__write;
  wire [32:0] PE_inst_Callipepla_2__dout;
  wire PE_inst_Callipepla_2__empty_n;
  wire PE_inst_Callipepla_2__read;
  wire [32:0] PE_inst_Callipepla_2__din;
  wire PE_inst_Callipepla_2__full_n;
  wire PE_inst_Callipepla_2__write;
  wire [32:0] PE_inst_Callipepla_3__dout;
  wire PE_inst_Callipepla_3__empty_n;
  wire PE_inst_Callipepla_3__read;
  wire [32:0] PE_inst_Callipepla_3__din;
  wire PE_inst_Callipepla_3__full_n;
  wire PE_inst_Callipepla_3__write;
  wire [32:0] PE_inst_Callipepla_4__dout;
  wire PE_inst_Callipepla_4__empty_n;
  wire PE_inst_Callipepla_4__read;
  wire [32:0] PE_inst_Callipepla_4__din;
  wire PE_inst_Callipepla_4__full_n;
  wire PE_inst_Callipepla_4__write;
  wire [32:0] PE_inst_Callipepla_5__dout;
  wire PE_inst_Callipepla_5__empty_n;
  wire PE_inst_Callipepla_5__read;
  wire [32:0] PE_inst_Callipepla_5__din;
  wire PE_inst_Callipepla_5__full_n;
  wire PE_inst_Callipepla_5__write;
  wire [32:0] PE_inst_Callipepla_6__dout;
  wire PE_inst_Callipepla_6__empty_n;
  wire PE_inst_Callipepla_6__read;
  wire [32:0] PE_inst_Callipepla_6__din;
  wire PE_inst_Callipepla_6__full_n;
  wire PE_inst_Callipepla_6__write;
  wire [32:0] PE_inst_Callipepla_7__dout;
  wire PE_inst_Callipepla_7__empty_n;
  wire PE_inst_Callipepla_7__read;
  wire [32:0] PE_inst_Callipepla_7__din;
  wire PE_inst_Callipepla_7__full_n;
  wire PE_inst_Callipepla_7__write;
  wire [32:0] PE_inst_Callipepla_8__dout;
  wire PE_inst_Callipepla_8__empty_n;
  wire PE_inst_Callipepla_8__read;
  wire [32:0] PE_inst_Callipepla_8__din;
  wire PE_inst_Callipepla_8__full_n;
  wire PE_inst_Callipepla_8__write;
  wire [32:0] PE_inst_Callipepla_9__dout;
  wire PE_inst_Callipepla_9__empty_n;
  wire PE_inst_Callipepla_9__read;
  wire [32:0] PE_inst_Callipepla_9__din;
  wire PE_inst_Callipepla_9__full_n;
  wire PE_inst_Callipepla_9__write;
  wire [32:0] Yvec_inst_Callipepla_0__dout;
  wire Yvec_inst_Callipepla_0__empty_n;
  wire Yvec_inst_Callipepla_0__read;
  wire [32:0] Yvec_inst_Callipepla_0__din;
  wire Yvec_inst_Callipepla_0__full_n;
  wire Yvec_inst_Callipepla_0__write;
  wire [32:0] Yvec_inst_Callipepla_10__dout;
  wire Yvec_inst_Callipepla_10__empty_n;
  wire Yvec_inst_Callipepla_10__read;
  wire [32:0] Yvec_inst_Callipepla_10__din;
  wire Yvec_inst_Callipepla_10__full_n;
  wire Yvec_inst_Callipepla_10__write;
  wire [32:0] Yvec_inst_Callipepla_11__dout;
  wire Yvec_inst_Callipepla_11__empty_n;
  wire Yvec_inst_Callipepla_11__read;
  wire [32:0] Yvec_inst_Callipepla_11__din;
  wire Yvec_inst_Callipepla_11__full_n;
  wire Yvec_inst_Callipepla_11__write;
  wire [32:0] Yvec_inst_Callipepla_12__dout;
  wire Yvec_inst_Callipepla_12__empty_n;
  wire Yvec_inst_Callipepla_12__read;
  wire [32:0] Yvec_inst_Callipepla_12__din;
  wire Yvec_inst_Callipepla_12__full_n;
  wire Yvec_inst_Callipepla_12__write;
  wire [32:0] Yvec_inst_Callipepla_13__dout;
  wire Yvec_inst_Callipepla_13__empty_n;
  wire Yvec_inst_Callipepla_13__read;
  wire [32:0] Yvec_inst_Callipepla_13__din;
  wire Yvec_inst_Callipepla_13__full_n;
  wire Yvec_inst_Callipepla_13__write;
  wire [32:0] Yvec_inst_Callipepla_14__dout;
  wire Yvec_inst_Callipepla_14__empty_n;
  wire Yvec_inst_Callipepla_14__read;
  wire [32:0] Yvec_inst_Callipepla_14__din;
  wire Yvec_inst_Callipepla_14__full_n;
  wire Yvec_inst_Callipepla_14__write;
  wire [32:0] Yvec_inst_Callipepla_15__dout;
  wire Yvec_inst_Callipepla_15__empty_n;
  wire Yvec_inst_Callipepla_15__read;
  wire [32:0] Yvec_inst_Callipepla_15__din;
  wire Yvec_inst_Callipepla_15__full_n;
  wire Yvec_inst_Callipepla_15__write;
  wire [32:0] Yvec_inst_Callipepla_1__dout;
  wire Yvec_inst_Callipepla_1__empty_n;
  wire Yvec_inst_Callipepla_1__read;
  wire [32:0] Yvec_inst_Callipepla_1__din;
  wire Yvec_inst_Callipepla_1__full_n;
  wire Yvec_inst_Callipepla_1__write;
  wire [32:0] Yvec_inst_Callipepla_2__dout;
  wire Yvec_inst_Callipepla_2__empty_n;
  wire Yvec_inst_Callipepla_2__read;
  wire [32:0] Yvec_inst_Callipepla_2__din;
  wire Yvec_inst_Callipepla_2__full_n;
  wire Yvec_inst_Callipepla_2__write;
  wire [32:0] Yvec_inst_Callipepla_3__dout;
  wire Yvec_inst_Callipepla_3__empty_n;
  wire Yvec_inst_Callipepla_3__read;
  wire [32:0] Yvec_inst_Callipepla_3__din;
  wire Yvec_inst_Callipepla_3__full_n;
  wire Yvec_inst_Callipepla_3__write;
  wire [32:0] Yvec_inst_Callipepla_4__dout;
  wire Yvec_inst_Callipepla_4__empty_n;
  wire Yvec_inst_Callipepla_4__read;
  wire [32:0] Yvec_inst_Callipepla_4__din;
  wire Yvec_inst_Callipepla_4__full_n;
  wire Yvec_inst_Callipepla_4__write;
  wire [32:0] Yvec_inst_Callipepla_5__dout;
  wire Yvec_inst_Callipepla_5__empty_n;
  wire Yvec_inst_Callipepla_5__read;
  wire [32:0] Yvec_inst_Callipepla_5__din;
  wire Yvec_inst_Callipepla_5__full_n;
  wire Yvec_inst_Callipepla_5__write;
  wire [32:0] Yvec_inst_Callipepla_6__dout;
  wire Yvec_inst_Callipepla_6__empty_n;
  wire Yvec_inst_Callipepla_6__read;
  wire [32:0] Yvec_inst_Callipepla_6__din;
  wire Yvec_inst_Callipepla_6__full_n;
  wire Yvec_inst_Callipepla_6__write;
  wire [32:0] Yvec_inst_Callipepla_7__dout;
  wire Yvec_inst_Callipepla_7__empty_n;
  wire Yvec_inst_Callipepla_7__read;
  wire [32:0] Yvec_inst_Callipepla_7__din;
  wire Yvec_inst_Callipepla_7__full_n;
  wire Yvec_inst_Callipepla_7__write;
  wire [32:0] Yvec_inst_Callipepla_8__dout;
  wire Yvec_inst_Callipepla_8__empty_n;
  wire Yvec_inst_Callipepla_8__read;
  wire [32:0] Yvec_inst_Callipepla_8__din;
  wire Yvec_inst_Callipepla_8__full_n;
  wire Yvec_inst_Callipepla_8__write;
  wire [32:0] Yvec_inst_Callipepla_9__dout;
  wire Yvec_inst_Callipepla_9__empty_n;
  wire Yvec_inst_Callipepla_9__read;
  wire [32:0] Yvec_inst_Callipepla_9__din;
  wire Yvec_inst_Callipepla_9__full_n;
  wire Yvec_inst_Callipepla_9__write;
  wire [512:0] fifo_AP_Callipepla__dout;
  wire fifo_AP_Callipepla__empty_n;
  wire fifo_AP_Callipepla__read;
  wire [512:0] fifo_AP_Callipepla__din;
  wire fifo_AP_Callipepla__full_n;
  wire fifo_AP_Callipepla__write;
  wire [512:0] fifo_AP_M1_Callipepla_0__dout;
  wire fifo_AP_M1_Callipepla_0__empty_n;
  wire fifo_AP_M1_Callipepla_0__read;
  wire [512:0] fifo_AP_M1_Callipepla_0__din;
  wire fifo_AP_M1_Callipepla_0__full_n;
  wire fifo_AP_M1_Callipepla_0__write;
  wire [512:0] fifo_AP_M1_Callipepla_1__dout;
  wire fifo_AP_M1_Callipepla_1__empty_n;
  wire fifo_AP_M1_Callipepla_1__read;
  wire [512:0] fifo_AP_M1_Callipepla_1__din;
  wire fifo_AP_M1_Callipepla_1__full_n;
  wire fifo_AP_M1_Callipepla_1__write;
  wire [512:0] fifo_A_Callipepla_0__dout;
  wire fifo_A_Callipepla_0__empty_n;
  wire fifo_A_Callipepla_0__read;
  wire [512:0] fifo_A_Callipepla_0__din;
  wire fifo_A_Callipepla_0__full_n;
  wire fifo_A_Callipepla_0__write;
  wire [512:0] fifo_A_Callipepla_10__dout;
  wire fifo_A_Callipepla_10__empty_n;
  wire fifo_A_Callipepla_10__read;
  wire [512:0] fifo_A_Callipepla_10__din;
  wire fifo_A_Callipepla_10__full_n;
  wire fifo_A_Callipepla_10__write;
  wire [512:0] fifo_A_Callipepla_11__dout;
  wire fifo_A_Callipepla_11__empty_n;
  wire fifo_A_Callipepla_11__read;
  wire [512:0] fifo_A_Callipepla_11__din;
  wire fifo_A_Callipepla_11__full_n;
  wire fifo_A_Callipepla_11__write;
  wire [512:0] fifo_A_Callipepla_12__dout;
  wire fifo_A_Callipepla_12__empty_n;
  wire fifo_A_Callipepla_12__read;
  wire [512:0] fifo_A_Callipepla_12__din;
  wire fifo_A_Callipepla_12__full_n;
  wire fifo_A_Callipepla_12__write;
  wire [512:0] fifo_A_Callipepla_13__dout;
  wire fifo_A_Callipepla_13__empty_n;
  wire fifo_A_Callipepla_13__read;
  wire [512:0] fifo_A_Callipepla_13__din;
  wire fifo_A_Callipepla_13__full_n;
  wire fifo_A_Callipepla_13__write;
  wire [512:0] fifo_A_Callipepla_14__dout;
  wire fifo_A_Callipepla_14__empty_n;
  wire fifo_A_Callipepla_14__read;
  wire [512:0] fifo_A_Callipepla_14__din;
  wire fifo_A_Callipepla_14__full_n;
  wire fifo_A_Callipepla_14__write;
  wire [512:0] fifo_A_Callipepla_15__dout;
  wire fifo_A_Callipepla_15__empty_n;
  wire fifo_A_Callipepla_15__read;
  wire [512:0] fifo_A_Callipepla_15__din;
  wire fifo_A_Callipepla_15__full_n;
  wire fifo_A_Callipepla_15__write;
  wire [512:0] fifo_A_Callipepla_1__dout;
  wire fifo_A_Callipepla_1__empty_n;
  wire fifo_A_Callipepla_1__read;
  wire [512:0] fifo_A_Callipepla_1__din;
  wire fifo_A_Callipepla_1__full_n;
  wire fifo_A_Callipepla_1__write;
  wire [512:0] fifo_A_Callipepla_2__dout;
  wire fifo_A_Callipepla_2__empty_n;
  wire fifo_A_Callipepla_2__read;
  wire [512:0] fifo_A_Callipepla_2__din;
  wire fifo_A_Callipepla_2__full_n;
  wire fifo_A_Callipepla_2__write;
  wire [512:0] fifo_A_Callipepla_3__dout;
  wire fifo_A_Callipepla_3__empty_n;
  wire fifo_A_Callipepla_3__read;
  wire [512:0] fifo_A_Callipepla_3__din;
  wire fifo_A_Callipepla_3__full_n;
  wire fifo_A_Callipepla_3__write;
  wire [512:0] fifo_A_Callipepla_4__dout;
  wire fifo_A_Callipepla_4__empty_n;
  wire fifo_A_Callipepla_4__read;
  wire [512:0] fifo_A_Callipepla_4__din;
  wire fifo_A_Callipepla_4__full_n;
  wire fifo_A_Callipepla_4__write;
  wire [512:0] fifo_A_Callipepla_5__dout;
  wire fifo_A_Callipepla_5__empty_n;
  wire fifo_A_Callipepla_5__read;
  wire [512:0] fifo_A_Callipepla_5__din;
  wire fifo_A_Callipepla_5__full_n;
  wire fifo_A_Callipepla_5__write;
  wire [512:0] fifo_A_Callipepla_6__dout;
  wire fifo_A_Callipepla_6__empty_n;
  wire fifo_A_Callipepla_6__read;
  wire [512:0] fifo_A_Callipepla_6__din;
  wire fifo_A_Callipepla_6__full_n;
  wire fifo_A_Callipepla_6__write;
  wire [512:0] fifo_A_Callipepla_7__dout;
  wire fifo_A_Callipepla_7__empty_n;
  wire fifo_A_Callipepla_7__read;
  wire [512:0] fifo_A_Callipepla_7__din;
  wire fifo_A_Callipepla_7__full_n;
  wire fifo_A_Callipepla_7__write;
  wire [512:0] fifo_A_Callipepla_8__dout;
  wire fifo_A_Callipepla_8__empty_n;
  wire fifo_A_Callipepla_8__read;
  wire [512:0] fifo_A_Callipepla_8__din;
  wire fifo_A_Callipepla_8__full_n;
  wire fifo_A_Callipepla_8__write;
  wire [512:0] fifo_A_Callipepla_9__dout;
  wire fifo_A_Callipepla_9__empty_n;
  wire fifo_A_Callipepla_9__read;
  wire [512:0] fifo_A_Callipepla_9__din;
  wire fifo_A_Callipepla_9__full_n;
  wire fifo_A_Callipepla_9__write;
  wire [512:0] fifo_P_dot_Callipepla__dout;
  wire fifo_P_dot_Callipepla__empty_n;
  wire fifo_P_dot_Callipepla__read;
  wire [512:0] fifo_P_dot_Callipepla__din;
  wire fifo_P_dot_Callipepla__full_n;
  wire fifo_P_dot_Callipepla__write;
  wire [512:0] fifo_P_from_mem_Callipepla__dout;
  wire fifo_P_from_mem_Callipepla__empty_n;
  wire fifo_P_from_mem_Callipepla__read;
  wire [512:0] fifo_P_from_mem_Callipepla__din;
  wire fifo_P_from_mem_Callipepla__full_n;
  wire fifo_P_from_mem_Callipepla__write;
  wire [512:0] fifo_P_pe_Callipepla_0__dout;
  wire fifo_P_pe_Callipepla_0__empty_n;
  wire fifo_P_pe_Callipepla_0__read;
  wire [512:0] fifo_P_pe_Callipepla_0__din;
  wire fifo_P_pe_Callipepla_0__full_n;
  wire fifo_P_pe_Callipepla_0__write;
  wire [512:0] fifo_P_pe_Callipepla_10__dout;
  wire fifo_P_pe_Callipepla_10__empty_n;
  wire fifo_P_pe_Callipepla_10__read;
  wire [512:0] fifo_P_pe_Callipepla_10__din;
  wire fifo_P_pe_Callipepla_10__full_n;
  wire fifo_P_pe_Callipepla_10__write;
  wire [512:0] fifo_P_pe_Callipepla_11__dout;
  wire fifo_P_pe_Callipepla_11__empty_n;
  wire fifo_P_pe_Callipepla_11__read;
  wire [512:0] fifo_P_pe_Callipepla_11__din;
  wire fifo_P_pe_Callipepla_11__full_n;
  wire fifo_P_pe_Callipepla_11__write;
  wire [512:0] fifo_P_pe_Callipepla_12__dout;
  wire fifo_P_pe_Callipepla_12__empty_n;
  wire fifo_P_pe_Callipepla_12__read;
  wire [512:0] fifo_P_pe_Callipepla_12__din;
  wire fifo_P_pe_Callipepla_12__full_n;
  wire fifo_P_pe_Callipepla_12__write;
  wire [512:0] fifo_P_pe_Callipepla_13__dout;
  wire fifo_P_pe_Callipepla_13__empty_n;
  wire fifo_P_pe_Callipepla_13__read;
  wire [512:0] fifo_P_pe_Callipepla_13__din;
  wire fifo_P_pe_Callipepla_13__full_n;
  wire fifo_P_pe_Callipepla_13__write;
  wire [512:0] fifo_P_pe_Callipepla_14__dout;
  wire fifo_P_pe_Callipepla_14__empty_n;
  wire fifo_P_pe_Callipepla_14__read;
  wire [512:0] fifo_P_pe_Callipepla_14__din;
  wire fifo_P_pe_Callipepla_14__full_n;
  wire fifo_P_pe_Callipepla_14__write;
  wire [512:0] fifo_P_pe_Callipepla_15__dout;
  wire fifo_P_pe_Callipepla_15__empty_n;
  wire fifo_P_pe_Callipepla_15__read;
  wire [512:0] fifo_P_pe_Callipepla_15__din;
  wire fifo_P_pe_Callipepla_15__full_n;
  wire fifo_P_pe_Callipepla_15__write;
  wire [512:0] fifo_P_pe_Callipepla_16__dout;
  wire fifo_P_pe_Callipepla_16__empty_n;
  wire fifo_P_pe_Callipepla_16__read;
  wire [512:0] fifo_P_pe_Callipepla_16__din;
  wire fifo_P_pe_Callipepla_16__full_n;
  wire fifo_P_pe_Callipepla_16__write;
  wire [512:0] fifo_P_pe_Callipepla_1__dout;
  wire fifo_P_pe_Callipepla_1__empty_n;
  wire fifo_P_pe_Callipepla_1__read;
  wire [512:0] fifo_P_pe_Callipepla_1__din;
  wire fifo_P_pe_Callipepla_1__full_n;
  wire fifo_P_pe_Callipepla_1__write;
  wire [512:0] fifo_P_pe_Callipepla_2__dout;
  wire fifo_P_pe_Callipepla_2__empty_n;
  wire fifo_P_pe_Callipepla_2__read;
  wire [512:0] fifo_P_pe_Callipepla_2__din;
  wire fifo_P_pe_Callipepla_2__full_n;
  wire fifo_P_pe_Callipepla_2__write;
  wire [512:0] fifo_P_pe_Callipepla_3__dout;
  wire fifo_P_pe_Callipepla_3__empty_n;
  wire fifo_P_pe_Callipepla_3__read;
  wire [512:0] fifo_P_pe_Callipepla_3__din;
  wire fifo_P_pe_Callipepla_3__full_n;
  wire fifo_P_pe_Callipepla_3__write;
  wire [512:0] fifo_P_pe_Callipepla_4__dout;
  wire fifo_P_pe_Callipepla_4__empty_n;
  wire fifo_P_pe_Callipepla_4__read;
  wire [512:0] fifo_P_pe_Callipepla_4__din;
  wire fifo_P_pe_Callipepla_4__full_n;
  wire fifo_P_pe_Callipepla_4__write;
  wire [512:0] fifo_P_pe_Callipepla_5__dout;
  wire fifo_P_pe_Callipepla_5__empty_n;
  wire fifo_P_pe_Callipepla_5__read;
  wire [512:0] fifo_P_pe_Callipepla_5__din;
  wire fifo_P_pe_Callipepla_5__full_n;
  wire fifo_P_pe_Callipepla_5__write;
  wire [512:0] fifo_P_pe_Callipepla_6__dout;
  wire fifo_P_pe_Callipepla_6__empty_n;
  wire fifo_P_pe_Callipepla_6__read;
  wire [512:0] fifo_P_pe_Callipepla_6__din;
  wire fifo_P_pe_Callipepla_6__full_n;
  wire fifo_P_pe_Callipepla_6__write;
  wire [512:0] fifo_P_pe_Callipepla_7__dout;
  wire fifo_P_pe_Callipepla_7__empty_n;
  wire fifo_P_pe_Callipepla_7__read;
  wire [512:0] fifo_P_pe_Callipepla_7__din;
  wire fifo_P_pe_Callipepla_7__full_n;
  wire fifo_P_pe_Callipepla_7__write;
  wire [512:0] fifo_P_pe_Callipepla_8__dout;
  wire fifo_P_pe_Callipepla_8__empty_n;
  wire fifo_P_pe_Callipepla_8__read;
  wire [512:0] fifo_P_pe_Callipepla_8__din;
  wire fifo_P_pe_Callipepla_8__full_n;
  wire fifo_P_pe_Callipepla_8__write;
  wire [512:0] fifo_P_pe_Callipepla_9__dout;
  wire fifo_P_pe_Callipepla_9__empty_n;
  wire fifo_P_pe_Callipepla_9__read;
  wire [512:0] fifo_P_pe_Callipepla_9__din;
  wire fifo_P_pe_Callipepla_9__full_n;
  wire fifo_P_pe_Callipepla_9__write;
  wire [512:0] fifo_P_to_dup_Callipepla__dout;
  wire fifo_P_to_dup_Callipepla__empty_n;
  wire fifo_P_to_dup_Callipepla__read;
  wire [512:0] fifo_P_to_dup_Callipepla__din;
  wire fifo_P_to_dup_Callipepla__full_n;
  wire fifo_P_to_dup_Callipepla__write;
  wire [512:0] fifo_P_to_mux_Callipepla__dout;
  wire fifo_P_to_mux_Callipepla__empty_n;
  wire fifo_P_to_mux_Callipepla__read;
  wire [512:0] fifo_P_to_mux_Callipepla__din;
  wire fifo_P_to_mux_Callipepla__full_n;
  wire fifo_P_to_mux_Callipepla__write;
  wire [512:0] fifo_P_updated_Callipepla__dout;
  wire fifo_P_updated_Callipepla__empty_n;
  wire fifo_P_updated_Callipepla__read;
  wire [512:0] fifo_P_updated_Callipepla__din;
  wire fifo_P_updated_Callipepla__full_n;
  wire fifo_P_updated_Callipepla__write;
  wire [512:0] fifo_P_updtp_Callipepla__dout;
  wire fifo_P_updtp_Callipepla__empty_n;
  wire fifo_P_updtp_Callipepla__read;
  wire [512:0] fifo_P_updtp_Callipepla__din;
  wire fifo_P_updtp_Callipepla__full_n;
  wire fifo_P_updtp_Callipepla__write;
  wire [512:0] fifo_P_updtx_Callipepla__dout;
  wire fifo_P_updtx_Callipepla__empty_n;
  wire fifo_P_updtx_Callipepla__read;
  wire [512:0] fifo_P_updtx_Callipepla__din;
  wire fifo_P_updtx_Callipepla__full_n;
  wire fifo_P_updtx_Callipepla__write;
  wire [65:0] fifo_RR_Callipepla__dout;
  wire fifo_RR_Callipepla__empty_n;
  wire fifo_RR_Callipepla__read;
  wire [65:0] fifo_RR_Callipepla__din;
  wire fifo_RR_Callipepla__full_n;
  wire fifo_RR_Callipepla__write;
  wire [512:0] fifo_R_Callipepla__dout;
  wire fifo_R_Callipepla__empty_n;
  wire fifo_R_Callipepla__read;
  wire [512:0] fifo_R_Callipepla__din;
  wire fifo_R_Callipepla__full_n;
  wire fifo_R_Callipepla__write;
  wire [512:0] fifo_R_tomem_Callipepla__dout;
  wire fifo_R_tomem_Callipepla__empty_n;
  wire fifo_R_tomem_Callipepla__read;
  wire [512:0] fifo_R_tomem_Callipepla__din;
  wire fifo_R_tomem_Callipepla__full_n;
  wire fifo_R_tomem_Callipepla__write;
  wire [512:0] fifo_R_updtd_m5_Callipepla__dout;
  wire fifo_R_updtd_m5_Callipepla__empty_n;
  wire fifo_R_updtd_m5_Callipepla__read;
  wire [512:0] fifo_R_updtd_m5_Callipepla__din;
  wire fifo_R_updtd_m5_Callipepla__full_n;
  wire fifo_R_updtd_m5_Callipepla__write;
  wire [512:0] fifo_R_updtd_m6_Callipepla__dout;
  wire fifo_R_updtd_m6_Callipepla__empty_n;
  wire fifo_R_updtd_m6_Callipepla__read;
  wire [512:0] fifo_R_updtd_m6_Callipepla__din;
  wire fifo_R_updtd_m6_Callipepla__full_n;
  wire fifo_R_updtd_m6_Callipepla__write;
  wire [512:0] fifo_R_updtd_rr_Callipepla__dout;
  wire fifo_R_updtd_rr_Callipepla__empty_n;
  wire fifo_R_updtd_rr_Callipepla__read;
  wire [512:0] fifo_R_updtd_rr_Callipepla__din;
  wire fifo_R_updtd_rr_Callipepla__full_n;
  wire fifo_R_updtd_rr_Callipepla__write;
  wire [512:0] fifo_X_Callipepla__dout;
  wire fifo_X_Callipepla__empty_n;
  wire fifo_X_Callipepla__read;
  wire [512:0] fifo_X_Callipepla__din;
  wire fifo_X_Callipepla__full_n;
  wire fifo_X_Callipepla__write;
  wire [512:0] fifo_X_updated_Callipepla__dout;
  wire fifo_X_updated_Callipepla__empty_n;
  wire fifo_X_updated_Callipepla__read;
  wire [512:0] fifo_X_updated_Callipepla__din;
  wire fifo_X_updated_Callipepla__full_n;
  wire fifo_X_updated_Callipepla__write;
  wire [64:0] fifo_Y_pe_Callipepla_0__dout;
  wire fifo_Y_pe_Callipepla_0__empty_n;
  wire fifo_Y_pe_Callipepla_0__read;
  wire [64:0] fifo_Y_pe_Callipepla_0__din;
  wire fifo_Y_pe_Callipepla_0__full_n;
  wire fifo_Y_pe_Callipepla_0__write;
  wire [64:0] fifo_Y_pe_Callipepla_10__dout;
  wire fifo_Y_pe_Callipepla_10__empty_n;
  wire fifo_Y_pe_Callipepla_10__read;
  wire [64:0] fifo_Y_pe_Callipepla_10__din;
  wire fifo_Y_pe_Callipepla_10__full_n;
  wire fifo_Y_pe_Callipepla_10__write;
  wire [64:0] fifo_Y_pe_Callipepla_11__dout;
  wire fifo_Y_pe_Callipepla_11__empty_n;
  wire fifo_Y_pe_Callipepla_11__read;
  wire [64:0] fifo_Y_pe_Callipepla_11__din;
  wire fifo_Y_pe_Callipepla_11__full_n;
  wire fifo_Y_pe_Callipepla_11__write;
  wire [64:0] fifo_Y_pe_Callipepla_12__dout;
  wire fifo_Y_pe_Callipepla_12__empty_n;
  wire fifo_Y_pe_Callipepla_12__read;
  wire [64:0] fifo_Y_pe_Callipepla_12__din;
  wire fifo_Y_pe_Callipepla_12__full_n;
  wire fifo_Y_pe_Callipepla_12__write;
  wire [64:0] fifo_Y_pe_Callipepla_13__dout;
  wire fifo_Y_pe_Callipepla_13__empty_n;
  wire fifo_Y_pe_Callipepla_13__read;
  wire [64:0] fifo_Y_pe_Callipepla_13__din;
  wire fifo_Y_pe_Callipepla_13__full_n;
  wire fifo_Y_pe_Callipepla_13__write;
  wire [64:0] fifo_Y_pe_Callipepla_14__dout;
  wire fifo_Y_pe_Callipepla_14__empty_n;
  wire fifo_Y_pe_Callipepla_14__read;
  wire [64:0] fifo_Y_pe_Callipepla_14__din;
  wire fifo_Y_pe_Callipepla_14__full_n;
  wire fifo_Y_pe_Callipepla_14__write;
  wire [64:0] fifo_Y_pe_Callipepla_15__dout;
  wire fifo_Y_pe_Callipepla_15__empty_n;
  wire fifo_Y_pe_Callipepla_15__read;
  wire [64:0] fifo_Y_pe_Callipepla_15__din;
  wire fifo_Y_pe_Callipepla_15__full_n;
  wire fifo_Y_pe_Callipepla_15__write;
  wire [64:0] fifo_Y_pe_Callipepla_1__dout;
  wire fifo_Y_pe_Callipepla_1__empty_n;
  wire fifo_Y_pe_Callipepla_1__read;
  wire [64:0] fifo_Y_pe_Callipepla_1__din;
  wire fifo_Y_pe_Callipepla_1__full_n;
  wire fifo_Y_pe_Callipepla_1__write;
  wire [64:0] fifo_Y_pe_Callipepla_2__dout;
  wire fifo_Y_pe_Callipepla_2__empty_n;
  wire fifo_Y_pe_Callipepla_2__read;
  wire [64:0] fifo_Y_pe_Callipepla_2__din;
  wire fifo_Y_pe_Callipepla_2__full_n;
  wire fifo_Y_pe_Callipepla_2__write;
  wire [64:0] fifo_Y_pe_Callipepla_3__dout;
  wire fifo_Y_pe_Callipepla_3__empty_n;
  wire fifo_Y_pe_Callipepla_3__read;
  wire [64:0] fifo_Y_pe_Callipepla_3__din;
  wire fifo_Y_pe_Callipepla_3__full_n;
  wire fifo_Y_pe_Callipepla_3__write;
  wire [64:0] fifo_Y_pe_Callipepla_4__dout;
  wire fifo_Y_pe_Callipepla_4__empty_n;
  wire fifo_Y_pe_Callipepla_4__read;
  wire [64:0] fifo_Y_pe_Callipepla_4__din;
  wire fifo_Y_pe_Callipepla_4__full_n;
  wire fifo_Y_pe_Callipepla_4__write;
  wire [64:0] fifo_Y_pe_Callipepla_5__dout;
  wire fifo_Y_pe_Callipepla_5__empty_n;
  wire fifo_Y_pe_Callipepla_5__read;
  wire [64:0] fifo_Y_pe_Callipepla_5__din;
  wire fifo_Y_pe_Callipepla_5__full_n;
  wire fifo_Y_pe_Callipepla_5__write;
  wire [64:0] fifo_Y_pe_Callipepla_6__dout;
  wire fifo_Y_pe_Callipepla_6__empty_n;
  wire fifo_Y_pe_Callipepla_6__read;
  wire [64:0] fifo_Y_pe_Callipepla_6__din;
  wire fifo_Y_pe_Callipepla_6__full_n;
  wire fifo_Y_pe_Callipepla_6__write;
  wire [64:0] fifo_Y_pe_Callipepla_7__dout;
  wire fifo_Y_pe_Callipepla_7__empty_n;
  wire fifo_Y_pe_Callipepla_7__read;
  wire [64:0] fifo_Y_pe_Callipepla_7__din;
  wire fifo_Y_pe_Callipepla_7__full_n;
  wire fifo_Y_pe_Callipepla_7__write;
  wire [64:0] fifo_Y_pe_Callipepla_8__dout;
  wire fifo_Y_pe_Callipepla_8__empty_n;
  wire fifo_Y_pe_Callipepla_8__read;
  wire [64:0] fifo_Y_pe_Callipepla_8__din;
  wire fifo_Y_pe_Callipepla_8__full_n;
  wire fifo_Y_pe_Callipepla_8__write;
  wire [64:0] fifo_Y_pe_Callipepla_9__dout;
  wire fifo_Y_pe_Callipepla_9__empty_n;
  wire fifo_Y_pe_Callipepla_9__read;
  wire [64:0] fifo_Y_pe_Callipepla_9__din;
  wire fifo_Y_pe_Callipepla_9__full_n;
  wire fifo_Y_pe_Callipepla_9__write;
  wire [64:0] fifo_Y_pe_abd_Callipepla_0__dout;
  wire fifo_Y_pe_abd_Callipepla_0__empty_n;
  wire fifo_Y_pe_abd_Callipepla_0__read;
  wire [64:0] fifo_Y_pe_abd_Callipepla_0__din;
  wire fifo_Y_pe_abd_Callipepla_0__full_n;
  wire fifo_Y_pe_abd_Callipepla_0__write;
  wire [64:0] fifo_Y_pe_abd_Callipepla_1__dout;
  wire fifo_Y_pe_abd_Callipepla_1__empty_n;
  wire fifo_Y_pe_abd_Callipepla_1__read;
  wire [64:0] fifo_Y_pe_abd_Callipepla_1__din;
  wire fifo_Y_pe_abd_Callipepla_1__full_n;
  wire fifo_Y_pe_abd_Callipepla_1__write;
  wire [64:0] fifo_Y_pe_abd_Callipepla_2__dout;
  wire fifo_Y_pe_abd_Callipepla_2__empty_n;
  wire fifo_Y_pe_abd_Callipepla_2__read;
  wire [64:0] fifo_Y_pe_abd_Callipepla_2__din;
  wire fifo_Y_pe_abd_Callipepla_2__full_n;
  wire fifo_Y_pe_abd_Callipepla_2__write;
  wire [64:0] fifo_Y_pe_abd_Callipepla_3__dout;
  wire fifo_Y_pe_abd_Callipepla_3__empty_n;
  wire fifo_Y_pe_abd_Callipepla_3__read;
  wire [64:0] fifo_Y_pe_abd_Callipepla_3__din;
  wire fifo_Y_pe_abd_Callipepla_3__full_n;
  wire fifo_Y_pe_abd_Callipepla_3__write;
  wire [64:0] fifo_Y_pe_abd_Callipepla_4__dout;
  wire fifo_Y_pe_abd_Callipepla_4__empty_n;
  wire fifo_Y_pe_abd_Callipepla_4__read;
  wire [64:0] fifo_Y_pe_abd_Callipepla_4__din;
  wire fifo_Y_pe_abd_Callipepla_4__full_n;
  wire fifo_Y_pe_abd_Callipepla_4__write;
  wire [64:0] fifo_Y_pe_abd_Callipepla_5__dout;
  wire fifo_Y_pe_abd_Callipepla_5__empty_n;
  wire fifo_Y_pe_abd_Callipepla_5__read;
  wire [64:0] fifo_Y_pe_abd_Callipepla_5__din;
  wire fifo_Y_pe_abd_Callipepla_5__full_n;
  wire fifo_Y_pe_abd_Callipepla_5__write;
  wire [64:0] fifo_Y_pe_abd_Callipepla_6__dout;
  wire fifo_Y_pe_abd_Callipepla_6__empty_n;
  wire fifo_Y_pe_abd_Callipepla_6__read;
  wire [64:0] fifo_Y_pe_abd_Callipepla_6__din;
  wire fifo_Y_pe_abd_Callipepla_6__full_n;
  wire fifo_Y_pe_abd_Callipepla_6__write;
  wire [64:0] fifo_Y_pe_abd_Callipepla_7__dout;
  wire fifo_Y_pe_abd_Callipepla_7__empty_n;
  wire fifo_Y_pe_abd_Callipepla_7__read;
  wire [64:0] fifo_Y_pe_abd_Callipepla_7__din;
  wire fifo_Y_pe_abd_Callipepla_7__full_n;
  wire fifo_Y_pe_abd_Callipepla_7__write;
  wire [512:0] fifo_Z_Callipepla_0__dout;
  wire fifo_Z_Callipepla_0__empty_n;
  wire fifo_Z_Callipepla_0__read;
  wire [512:0] fifo_Z_Callipepla_0__din;
  wire fifo_Z_Callipepla_0__full_n;
  wire fifo_Z_Callipepla_0__write;
  wire [512:0] fifo_Z_Callipepla_1__dout;
  wire fifo_Z_Callipepla_1__empty_n;
  wire fifo_Z_Callipepla_1__read;
  wire [512:0] fifo_Z_Callipepla_1__din;
  wire fifo_Z_Callipepla_1__full_n;
  wire fifo_Z_Callipepla_1__write;
  wire [656:0] fifo_aXvec_Callipepla_0__dout;
  wire fifo_aXvec_Callipepla_0__empty_n;
  wire fifo_aXvec_Callipepla_0__read;
  wire [656:0] fifo_aXvec_Callipepla_0__din;
  wire fifo_aXvec_Callipepla_0__full_n;
  wire fifo_aXvec_Callipepla_0__write;
  wire [656:0] fifo_aXvec_Callipepla_10__dout;
  wire fifo_aXvec_Callipepla_10__empty_n;
  wire fifo_aXvec_Callipepla_10__read;
  wire [656:0] fifo_aXvec_Callipepla_10__din;
  wire fifo_aXvec_Callipepla_10__full_n;
  wire fifo_aXvec_Callipepla_10__write;
  wire [656:0] fifo_aXvec_Callipepla_11__dout;
  wire fifo_aXvec_Callipepla_11__empty_n;
  wire fifo_aXvec_Callipepla_11__read;
  wire [656:0] fifo_aXvec_Callipepla_11__din;
  wire fifo_aXvec_Callipepla_11__full_n;
  wire fifo_aXvec_Callipepla_11__write;
  wire [656:0] fifo_aXvec_Callipepla_12__dout;
  wire fifo_aXvec_Callipepla_12__empty_n;
  wire fifo_aXvec_Callipepla_12__read;
  wire [656:0] fifo_aXvec_Callipepla_12__din;
  wire fifo_aXvec_Callipepla_12__full_n;
  wire fifo_aXvec_Callipepla_12__write;
  wire [656:0] fifo_aXvec_Callipepla_13__dout;
  wire fifo_aXvec_Callipepla_13__empty_n;
  wire fifo_aXvec_Callipepla_13__read;
  wire [656:0] fifo_aXvec_Callipepla_13__din;
  wire fifo_aXvec_Callipepla_13__full_n;
  wire fifo_aXvec_Callipepla_13__write;
  wire [656:0] fifo_aXvec_Callipepla_14__dout;
  wire fifo_aXvec_Callipepla_14__empty_n;
  wire fifo_aXvec_Callipepla_14__read;
  wire [656:0] fifo_aXvec_Callipepla_14__din;
  wire fifo_aXvec_Callipepla_14__full_n;
  wire fifo_aXvec_Callipepla_14__write;
  wire [656:0] fifo_aXvec_Callipepla_15__dout;
  wire fifo_aXvec_Callipepla_15__empty_n;
  wire fifo_aXvec_Callipepla_15__read;
  wire [656:0] fifo_aXvec_Callipepla_15__din;
  wire fifo_aXvec_Callipepla_15__full_n;
  wire fifo_aXvec_Callipepla_15__write;
  wire [656:0] fifo_aXvec_Callipepla_1__dout;
  wire fifo_aXvec_Callipepla_1__empty_n;
  wire fifo_aXvec_Callipepla_1__read;
  wire [656:0] fifo_aXvec_Callipepla_1__din;
  wire fifo_aXvec_Callipepla_1__full_n;
  wire fifo_aXvec_Callipepla_1__write;
  wire [656:0] fifo_aXvec_Callipepla_2__dout;
  wire fifo_aXvec_Callipepla_2__empty_n;
  wire fifo_aXvec_Callipepla_2__read;
  wire [656:0] fifo_aXvec_Callipepla_2__din;
  wire fifo_aXvec_Callipepla_2__full_n;
  wire fifo_aXvec_Callipepla_2__write;
  wire [656:0] fifo_aXvec_Callipepla_3__dout;
  wire fifo_aXvec_Callipepla_3__empty_n;
  wire fifo_aXvec_Callipepla_3__read;
  wire [656:0] fifo_aXvec_Callipepla_3__din;
  wire fifo_aXvec_Callipepla_3__full_n;
  wire fifo_aXvec_Callipepla_3__write;
  wire [656:0] fifo_aXvec_Callipepla_4__dout;
  wire fifo_aXvec_Callipepla_4__empty_n;
  wire fifo_aXvec_Callipepla_4__read;
  wire [656:0] fifo_aXvec_Callipepla_4__din;
  wire fifo_aXvec_Callipepla_4__full_n;
  wire fifo_aXvec_Callipepla_4__write;
  wire [656:0] fifo_aXvec_Callipepla_5__dout;
  wire fifo_aXvec_Callipepla_5__empty_n;
  wire fifo_aXvec_Callipepla_5__read;
  wire [656:0] fifo_aXvec_Callipepla_5__din;
  wire fifo_aXvec_Callipepla_5__full_n;
  wire fifo_aXvec_Callipepla_5__write;
  wire [656:0] fifo_aXvec_Callipepla_6__dout;
  wire fifo_aXvec_Callipepla_6__empty_n;
  wire fifo_aXvec_Callipepla_6__read;
  wire [656:0] fifo_aXvec_Callipepla_6__din;
  wire fifo_aXvec_Callipepla_6__full_n;
  wire fifo_aXvec_Callipepla_6__write;
  wire [656:0] fifo_aXvec_Callipepla_7__dout;
  wire fifo_aXvec_Callipepla_7__empty_n;
  wire fifo_aXvec_Callipepla_7__read;
  wire [656:0] fifo_aXvec_Callipepla_7__din;
  wire fifo_aXvec_Callipepla_7__full_n;
  wire fifo_aXvec_Callipepla_7__write;
  wire [656:0] fifo_aXvec_Callipepla_8__dout;
  wire fifo_aXvec_Callipepla_8__empty_n;
  wire fifo_aXvec_Callipepla_8__read;
  wire [656:0] fifo_aXvec_Callipepla_8__din;
  wire fifo_aXvec_Callipepla_8__full_n;
  wire fifo_aXvec_Callipepla_8__write;
  wire [656:0] fifo_aXvec_Callipepla_9__dout;
  wire fifo_aXvec_Callipepla_9__empty_n;
  wire fifo_aXvec_Callipepla_9__read;
  wire [656:0] fifo_aXvec_Callipepla_9__din;
  wire fifo_aXvec_Callipepla_9__full_n;
  wire fifo_aXvec_Callipepla_9__write;
  wire [64:0] fifo_alpha_Callipepla_0__dout;
  wire fifo_alpha_Callipepla_0__empty_n;
  wire fifo_alpha_Callipepla_0__read;
  wire [64:0] fifo_alpha_Callipepla_0__din;
  wire fifo_alpha_Callipepla_0__full_n;
  wire fifo_alpha_Callipepla_0__write;
  wire [64:0] fifo_alpha_Callipepla_1__dout;
  wire fifo_alpha_Callipepla_1__empty_n;
  wire fifo_alpha_Callipepla_1__read;
  wire [64:0] fifo_alpha_Callipepla_1__din;
  wire fifo_alpha_Callipepla_1__full_n;
  wire fifo_alpha_Callipepla_1__write;
  wire [512:0] fifo_dA_Callipepla__dout;
  wire fifo_dA_Callipepla__empty_n;
  wire fifo_dA_Callipepla__read;
  wire [512:0] fifo_dA_Callipepla__din;
  wire fifo_dA_Callipepla__full_n;
  wire fifo_dA_Callipepla__write;
  wire [512:0] fifo_din_AP_Callipepla__dout;
  wire fifo_din_AP_Callipepla__empty_n;
  wire fifo_din_AP_Callipepla__read;
  wire [512:0] fifo_din_AP_Callipepla__din;
  wire fifo_din_AP_Callipepla__full_n;
  wire fifo_din_AP_Callipepla__write;
  wire [512:0] fifo_din_P_Callipepla_0__dout;
  wire fifo_din_P_Callipepla_0__empty_n;
  wire fifo_din_P_Callipepla_0__read;
  wire [512:0] fifo_din_P_Callipepla_0__din;
  wire fifo_din_P_Callipepla_0__full_n;
  wire fifo_din_P_Callipepla_0__write;
  wire [512:0] fifo_din_P_Callipepla_1__dout;
  wire fifo_din_P_Callipepla_1__empty_n;
  wire fifo_din_P_Callipepla_1__read;
  wire [512:0] fifo_din_P_Callipepla_1__din;
  wire fifo_din_P_Callipepla_1__full_n;
  wire fifo_din_P_Callipepla_1__write;
  wire [512:0] fifo_din_R_Callipepla_0__dout;
  wire fifo_din_R_Callipepla_0__empty_n;
  wire fifo_din_R_Callipepla_0__read;
  wire [512:0] fifo_din_R_Callipepla_0__din;
  wire fifo_din_R_Callipepla_0__full_n;
  wire fifo_din_R_Callipepla_0__write;
  wire [512:0] fifo_din_R_Callipepla_1__dout;
  wire fifo_din_R_Callipepla_1__empty_n;
  wire fifo_din_R_Callipepla_1__read;
  wire [512:0] fifo_din_R_Callipepla_1__din;
  wire fifo_din_R_Callipepla_1__full_n;
  wire fifo_din_R_Callipepla_1__write;
  wire [512:0] fifo_din_X_Callipepla_0__dout;
  wire fifo_din_X_Callipepla_0__empty_n;
  wire fifo_din_X_Callipepla_0__read;
  wire [512:0] fifo_din_X_Callipepla_0__din;
  wire fifo_din_X_Callipepla_0__full_n;
  wire fifo_din_X_Callipepla_0__write;
  wire [512:0] fifo_din_X_Callipepla_1__dout;
  wire fifo_din_X_Callipepla_1__empty_n;
  wire fifo_din_X_Callipepla_1__read;
  wire [512:0] fifo_din_X_Callipepla_1__din;
  wire fifo_din_X_Callipepla_1__full_n;
  wire fifo_din_X_Callipepla_1__write;
  wire [512:0] fifo_dout_AP_Callipepla__dout;
  wire fifo_dout_AP_Callipepla__empty_n;
  wire fifo_dout_AP_Callipepla__read;
  wire [512:0] fifo_dout_AP_Callipepla__din;
  wire fifo_dout_AP_Callipepla__full_n;
  wire fifo_dout_AP_Callipepla__write;
  wire [512:0] fifo_dout_P_Callipepla_0__dout;
  wire fifo_dout_P_Callipepla_0__empty_n;
  wire fifo_dout_P_Callipepla_0__read;
  wire [512:0] fifo_dout_P_Callipepla_0__din;
  wire fifo_dout_P_Callipepla_0__full_n;
  wire fifo_dout_P_Callipepla_0__write;
  wire [512:0] fifo_dout_P_Callipepla_1__dout;
  wire fifo_dout_P_Callipepla_1__empty_n;
  wire fifo_dout_P_Callipepla_1__read;
  wire [512:0] fifo_dout_P_Callipepla_1__din;
  wire fifo_dout_P_Callipepla_1__full_n;
  wire fifo_dout_P_Callipepla_1__write;
  wire [512:0] fifo_dout_R_Callipepla_0__dout;
  wire fifo_dout_R_Callipepla_0__empty_n;
  wire fifo_dout_R_Callipepla_0__read;
  wire [512:0] fifo_dout_R_Callipepla_0__din;
  wire fifo_dout_R_Callipepla_0__full_n;
  wire fifo_dout_R_Callipepla_0__write;
  wire [512:0] fifo_dout_R_Callipepla_1__dout;
  wire fifo_dout_R_Callipepla_1__empty_n;
  wire fifo_dout_R_Callipepla_1__read;
  wire [512:0] fifo_dout_R_Callipepla_1__din;
  wire fifo_dout_R_Callipepla_1__full_n;
  wire fifo_dout_R_Callipepla_1__write;
  wire [512:0] fifo_dout_X_Callipepla_0__dout;
  wire fifo_dout_X_Callipepla_0__empty_n;
  wire fifo_dout_X_Callipepla_0__read;
  wire [512:0] fifo_dout_X_Callipepla_0__din;
  wire fifo_dout_X_Callipepla_0__full_n;
  wire fifo_dout_X_Callipepla_0__write;
  wire [512:0] fifo_dout_X_Callipepla_1__dout;
  wire fifo_dout_X_Callipepla_1__empty_n;
  wire fifo_dout_X_Callipepla_1__read;
  wire [512:0] fifo_dout_X_Callipepla_1__din;
  wire fifo_dout_X_Callipepla_1__full_n;
  wire fifo_dout_X_Callipepla_1__write;
  wire [66:0] fifo_mi_AP_Callipepla__dout;
  wire fifo_mi_AP_Callipepla__empty_n;
  wire fifo_mi_AP_Callipepla__read;
  wire [66:0] fifo_mi_AP_Callipepla__din;
  wire fifo_mi_AP_Callipepla__full_n;
  wire fifo_mi_AP_Callipepla__write;
  wire [66:0] fifo_mi_P_Callipepla_0__dout;
  wire fifo_mi_P_Callipepla_0__empty_n;
  wire fifo_mi_P_Callipepla_0__read;
  wire [66:0] fifo_mi_P_Callipepla_0__din;
  wire fifo_mi_P_Callipepla_0__full_n;
  wire fifo_mi_P_Callipepla_0__write;
  wire [66:0] fifo_mi_P_Callipepla_1__dout;
  wire fifo_mi_P_Callipepla_1__empty_n;
  wire fifo_mi_P_Callipepla_1__read;
  wire [66:0] fifo_mi_P_Callipepla_1__din;
  wire fifo_mi_P_Callipepla_1__full_n;
  wire fifo_mi_P_Callipepla_1__write;
  wire [66:0] fifo_mi_R_Callipepla_0__dout;
  wire fifo_mi_R_Callipepla_0__empty_n;
  wire fifo_mi_R_Callipepla_0__read;
  wire [66:0] fifo_mi_R_Callipepla_0__din;
  wire fifo_mi_R_Callipepla_0__full_n;
  wire fifo_mi_R_Callipepla_0__write;
  wire [66:0] fifo_mi_R_Callipepla_1__dout;
  wire fifo_mi_R_Callipepla_1__empty_n;
  wire fifo_mi_R_Callipepla_1__read;
  wire [66:0] fifo_mi_R_Callipepla_1__din;
  wire fifo_mi_R_Callipepla_1__full_n;
  wire fifo_mi_R_Callipepla_1__write;
  wire [66:0] fifo_mi_X_Callipepla_0__dout;
  wire fifo_mi_X_Callipepla_0__empty_n;
  wire fifo_mi_X_Callipepla_0__read;
  wire [66:0] fifo_mi_X_Callipepla_0__din;
  wire fifo_mi_X_Callipepla_0__full_n;
  wire fifo_mi_X_Callipepla_0__write;
  wire [66:0] fifo_mi_X_Callipepla_1__dout;
  wire fifo_mi_X_Callipepla_1__empty_n;
  wire fifo_mi_X_Callipepla_1__read;
  wire [66:0] fifo_mi_X_Callipepla_1__din;
  wire fifo_mi_X_Callipepla_1__full_n;
  wire fifo_mi_X_Callipepla_1__write;
  wire [1:0] fifo_resp_AP_Callipepla__dout;
  wire fifo_resp_AP_Callipepla__empty_n;
  wire fifo_resp_AP_Callipepla__read;
  wire [1:0] fifo_resp_AP_Callipepla__din;
  wire fifo_resp_AP_Callipepla__full_n;
  wire fifo_resp_AP_Callipepla__write;
  wire [1:0] fifo_resp_P_Callipepla_0__dout;
  wire fifo_resp_P_Callipepla_0__empty_n;
  wire fifo_resp_P_Callipepla_0__read;
  wire [1:0] fifo_resp_P_Callipepla_0__din;
  wire fifo_resp_P_Callipepla_0__full_n;
  wire fifo_resp_P_Callipepla_0__write;
  wire [1:0] fifo_resp_P_Callipepla_1__dout;
  wire fifo_resp_P_Callipepla_1__empty_n;
  wire fifo_resp_P_Callipepla_1__read;
  wire [1:0] fifo_resp_P_Callipepla_1__din;
  wire fifo_resp_P_Callipepla_1__full_n;
  wire fifo_resp_P_Callipepla_1__write;
  wire [1:0] fifo_resp_R_Callipepla_0__dout;
  wire fifo_resp_R_Callipepla_0__empty_n;
  wire fifo_resp_R_Callipepla_0__read;
  wire [1:0] fifo_resp_R_Callipepla_0__din;
  wire fifo_resp_R_Callipepla_0__full_n;
  wire fifo_resp_R_Callipepla_0__write;
  wire [1:0] fifo_resp_R_Callipepla_1__dout;
  wire fifo_resp_R_Callipepla_1__empty_n;
  wire fifo_resp_R_Callipepla_1__read;
  wire [1:0] fifo_resp_R_Callipepla_1__din;
  wire fifo_resp_R_Callipepla_1__full_n;
  wire fifo_resp_R_Callipepla_1__write;
  wire [1:0] fifo_resp_X_Callipepla_0__dout;
  wire fifo_resp_X_Callipepla_0__empty_n;
  wire fifo_resp_X_Callipepla_0__read;
  wire [1:0] fifo_resp_X_Callipepla_0__din;
  wire fifo_resp_X_Callipepla_0__full_n;
  wire fifo_resp_X_Callipepla_0__write;
  wire [1:0] fifo_resp_X_Callipepla_1__dout;
  wire fifo_resp_X_Callipepla_1__empty_n;
  wire fifo_resp_X_Callipepla_1__read;
  wire [1:0] fifo_resp_X_Callipepla_1__din;
  wire fifo_resp_X_Callipepla_1__full_n;
  wire fifo_resp_X_Callipepla_1__write;
  wire [64:0] fifo_rz_Callipepla_0__dout;
  wire fifo_rz_Callipepla_0__empty_n;
  wire fifo_rz_Callipepla_0__read;
  wire [64:0] fifo_rz_Callipepla_0__din;
  wire fifo_rz_Callipepla_0__full_n;
  wire fifo_rz_Callipepla_0__write;
  wire [64:0] fifo_rz_Callipepla_1__dout;
  wire fifo_rz_Callipepla_1__empty_n;
  wire fifo_rz_Callipepla_1__read;
  wire [64:0] fifo_rz_Callipepla_1__din;
  wire fifo_rz_Callipepla_1__full_n;
  wire fifo_rz_Callipepla_1__write;
  wire [1:0] tsignal_Y_Callipepla_0__dout;
  wire tsignal_Y_Callipepla_0__empty_n;
  wire tsignal_Y_Callipepla_0__read;
  wire [1:0] tsignal_Y_Callipepla_0__din;
  wire tsignal_Y_Callipepla_0__full_n;
  wire tsignal_Y_Callipepla_0__write;
  wire [1:0] tsignal_Y_Callipepla_10__dout;
  wire tsignal_Y_Callipepla_10__empty_n;
  wire tsignal_Y_Callipepla_10__read;
  wire [1:0] tsignal_Y_Callipepla_10__din;
  wire tsignal_Y_Callipepla_10__full_n;
  wire tsignal_Y_Callipepla_10__write;
  wire [1:0] tsignal_Y_Callipepla_11__dout;
  wire tsignal_Y_Callipepla_11__empty_n;
  wire tsignal_Y_Callipepla_11__read;
  wire [1:0] tsignal_Y_Callipepla_11__din;
  wire tsignal_Y_Callipepla_11__full_n;
  wire tsignal_Y_Callipepla_11__write;
  wire [1:0] tsignal_Y_Callipepla_12__dout;
  wire tsignal_Y_Callipepla_12__empty_n;
  wire tsignal_Y_Callipepla_12__read;
  wire [1:0] tsignal_Y_Callipepla_12__din;
  wire tsignal_Y_Callipepla_12__full_n;
  wire tsignal_Y_Callipepla_12__write;
  wire [1:0] tsignal_Y_Callipepla_13__dout;
  wire tsignal_Y_Callipepla_13__empty_n;
  wire tsignal_Y_Callipepla_13__read;
  wire [1:0] tsignal_Y_Callipepla_13__din;
  wire tsignal_Y_Callipepla_13__full_n;
  wire tsignal_Y_Callipepla_13__write;
  wire [1:0] tsignal_Y_Callipepla_14__dout;
  wire tsignal_Y_Callipepla_14__empty_n;
  wire tsignal_Y_Callipepla_14__read;
  wire [1:0] tsignal_Y_Callipepla_14__din;
  wire tsignal_Y_Callipepla_14__full_n;
  wire tsignal_Y_Callipepla_14__write;
  wire [1:0] tsignal_Y_Callipepla_15__dout;
  wire tsignal_Y_Callipepla_15__empty_n;
  wire tsignal_Y_Callipepla_15__read;
  wire [1:0] tsignal_Y_Callipepla_15__din;
  wire tsignal_Y_Callipepla_15__full_n;
  wire tsignal_Y_Callipepla_15__write;
  wire [1:0] tsignal_Y_Callipepla_1__dout;
  wire tsignal_Y_Callipepla_1__empty_n;
  wire tsignal_Y_Callipepla_1__read;
  wire [1:0] tsignal_Y_Callipepla_1__din;
  wire tsignal_Y_Callipepla_1__full_n;
  wire tsignal_Y_Callipepla_1__write;
  wire [1:0] tsignal_Y_Callipepla_2__dout;
  wire tsignal_Y_Callipepla_2__empty_n;
  wire tsignal_Y_Callipepla_2__read;
  wire [1:0] tsignal_Y_Callipepla_2__din;
  wire tsignal_Y_Callipepla_2__full_n;
  wire tsignal_Y_Callipepla_2__write;
  wire [1:0] tsignal_Y_Callipepla_3__dout;
  wire tsignal_Y_Callipepla_3__empty_n;
  wire tsignal_Y_Callipepla_3__read;
  wire [1:0] tsignal_Y_Callipepla_3__din;
  wire tsignal_Y_Callipepla_3__full_n;
  wire tsignal_Y_Callipepla_3__write;
  wire [1:0] tsignal_Y_Callipepla_4__dout;
  wire tsignal_Y_Callipepla_4__empty_n;
  wire tsignal_Y_Callipepla_4__read;
  wire [1:0] tsignal_Y_Callipepla_4__din;
  wire tsignal_Y_Callipepla_4__full_n;
  wire tsignal_Y_Callipepla_4__write;
  wire [1:0] tsignal_Y_Callipepla_5__dout;
  wire tsignal_Y_Callipepla_5__empty_n;
  wire tsignal_Y_Callipepla_5__read;
  wire [1:0] tsignal_Y_Callipepla_5__din;
  wire tsignal_Y_Callipepla_5__full_n;
  wire tsignal_Y_Callipepla_5__write;
  wire [1:0] tsignal_Y_Callipepla_6__dout;
  wire tsignal_Y_Callipepla_6__empty_n;
  wire tsignal_Y_Callipepla_6__read;
  wire [1:0] tsignal_Y_Callipepla_6__din;
  wire tsignal_Y_Callipepla_6__full_n;
  wire tsignal_Y_Callipepla_6__write;
  wire [1:0] tsignal_Y_Callipepla_7__dout;
  wire tsignal_Y_Callipepla_7__empty_n;
  wire tsignal_Y_Callipepla_7__read;
  wire [1:0] tsignal_Y_Callipepla_7__din;
  wire tsignal_Y_Callipepla_7__full_n;
  wire tsignal_Y_Callipepla_7__write;
  wire [1:0] tsignal_Y_Callipepla_8__dout;
  wire tsignal_Y_Callipepla_8__empty_n;
  wire tsignal_Y_Callipepla_8__read;
  wire [1:0] tsignal_Y_Callipepla_8__din;
  wire tsignal_Y_Callipepla_8__full_n;
  wire tsignal_Y_Callipepla_8__write;
  wire [1:0] tsignal_Y_Callipepla_9__dout;
  wire tsignal_Y_Callipepla_9__empty_n;
  wire tsignal_Y_Callipepla_9__read;
  wire [1:0] tsignal_Y_Callipepla_9__din;
  wire tsignal_Y_Callipepla_9__full_n;
  wire tsignal_Y_Callipepla_9__write;
  wire [1:0] tsignal_aby_Callipepla_0__dout;
  wire tsignal_aby_Callipepla_0__empty_n;
  wire tsignal_aby_Callipepla_0__read;
  wire [1:0] tsignal_aby_Callipepla_0__din;
  wire tsignal_aby_Callipepla_0__full_n;
  wire tsignal_aby_Callipepla_0__write;
  wire [1:0] tsignal_aby_Callipepla_1__dout;
  wire tsignal_aby_Callipepla_1__empty_n;
  wire tsignal_aby_Callipepla_1__read;
  wire [1:0] tsignal_aby_Callipepla_1__din;
  wire tsignal_aby_Callipepla_1__full_n;
  wire tsignal_aby_Callipepla_1__write;
  wire [1:0] tsignal_aby_Callipepla_2__dout;
  wire tsignal_aby_Callipepla_2__empty_n;
  wire tsignal_aby_Callipepla_2__read;
  wire [1:0] tsignal_aby_Callipepla_2__din;
  wire tsignal_aby_Callipepla_2__full_n;
  wire tsignal_aby_Callipepla_2__write;
  wire [1:0] tsignal_aby_Callipepla_3__dout;
  wire tsignal_aby_Callipepla_3__empty_n;
  wire tsignal_aby_Callipepla_3__read;
  wire [1:0] tsignal_aby_Callipepla_3__din;
  wire tsignal_aby_Callipepla_3__full_n;
  wire tsignal_aby_Callipepla_3__write;
  wire [1:0] tsignal_aby_Callipepla_4__dout;
  wire tsignal_aby_Callipepla_4__empty_n;
  wire tsignal_aby_Callipepla_4__read;
  wire [1:0] tsignal_aby_Callipepla_4__din;
  wire tsignal_aby_Callipepla_4__full_n;
  wire tsignal_aby_Callipepla_4__write;
  wire [1:0] tsignal_aby_Callipepla_5__dout;
  wire tsignal_aby_Callipepla_5__empty_n;
  wire tsignal_aby_Callipepla_5__read;
  wire [1:0] tsignal_aby_Callipepla_5__din;
  wire tsignal_aby_Callipepla_5__full_n;
  wire tsignal_aby_Callipepla_5__write;
  wire [1:0] tsignal_aby_Callipepla_6__dout;
  wire tsignal_aby_Callipepla_6__empty_n;
  wire tsignal_aby_Callipepla_6__read;
  wire [1:0] tsignal_aby_Callipepla_6__din;
  wire tsignal_aby_Callipepla_6__full_n;
  wire tsignal_aby_Callipepla_6__write;
  wire [1:0] tsignal_aby_Callipepla_7__dout;
  wire tsignal_aby_Callipepla_7__empty_n;
  wire tsignal_aby_Callipepla_7__read;
  wire [1:0] tsignal_aby_Callipepla_7__din;
  wire tsignal_aby_Callipepla_7__full_n;
  wire tsignal_aby_Callipepla_7__write;
  wire [1:0] tsignal_aby_Callipepla_8__dout;
  wire tsignal_aby_Callipepla_8__empty_n;
  wire tsignal_aby_Callipepla_8__read;
  wire [1:0] tsignal_aby_Callipepla_8__din;
  wire tsignal_aby_Callipepla_8__full_n;
  wire tsignal_aby_Callipepla_8__write;
  wire [1:0] tsignal_ctrlAP_Callipepla__dout;
  wire tsignal_ctrlAP_Callipepla__empty_n;
  wire tsignal_ctrlAP_Callipepla__read;
  wire [1:0] tsignal_ctrlAP_Callipepla__din;
  wire tsignal_ctrlAP_Callipepla__full_n;
  wire tsignal_ctrlAP_Callipepla__write;
  wire [1:0] tsignal_ctrlP_Callipepla__dout;
  wire tsignal_ctrlP_Callipepla__empty_n;
  wire tsignal_ctrlP_Callipepla__read;
  wire [1:0] tsignal_ctrlP_Callipepla__din;
  wire tsignal_ctrlP_Callipepla__full_n;
  wire tsignal_ctrlP_Callipepla__write;
  wire [1:0] tsignal_ctrlR_Callipepla__dout;
  wire tsignal_ctrlR_Callipepla__empty_n;
  wire tsignal_ctrlR_Callipepla__read;
  wire [1:0] tsignal_ctrlR_Callipepla__din;
  wire tsignal_ctrlR_Callipepla__full_n;
  wire tsignal_ctrlR_Callipepla__write;
  wire [1:0] tsignal_ctrlX_Callipepla__dout;
  wire tsignal_ctrlX_Callipepla__empty_n;
  wire tsignal_ctrlX_Callipepla__read;
  wire [1:0] tsignal_ctrlX_Callipepla__din;
  wire tsignal_ctrlX_Callipepla__full_n;
  wire tsignal_ctrlX_Callipepla__write;
  wire [1:0] tsignal_ctrldigA_Callipepla__dout;
  wire tsignal_ctrldigA_Callipepla__empty_n;
  wire tsignal_ctrldigA_Callipepla__read;
  wire [1:0] tsignal_ctrldigA_Callipepla__din;
  wire tsignal_ctrldigA_Callipepla__full_n;
  wire tsignal_ctrldigA_Callipepla__write;
  wire [1:0] tsignal_edgepointer_Callipepla_0__dout;
  wire tsignal_edgepointer_Callipepla_0__empty_n;
  wire tsignal_edgepointer_Callipepla_0__read;
  wire [1:0] tsignal_edgepointer_Callipepla_0__din;
  wire tsignal_edgepointer_Callipepla_0__full_n;
  wire tsignal_edgepointer_Callipepla_0__write;
  wire [1:0] tsignal_edgepointer_Callipepla_10__dout;
  wire tsignal_edgepointer_Callipepla_10__empty_n;
  wire tsignal_edgepointer_Callipepla_10__read;
  wire [1:0] tsignal_edgepointer_Callipepla_10__din;
  wire tsignal_edgepointer_Callipepla_10__full_n;
  wire tsignal_edgepointer_Callipepla_10__write;
  wire [1:0] tsignal_edgepointer_Callipepla_11__dout;
  wire tsignal_edgepointer_Callipepla_11__empty_n;
  wire tsignal_edgepointer_Callipepla_11__read;
  wire [1:0] tsignal_edgepointer_Callipepla_11__din;
  wire tsignal_edgepointer_Callipepla_11__full_n;
  wire tsignal_edgepointer_Callipepla_11__write;
  wire [1:0] tsignal_edgepointer_Callipepla_12__dout;
  wire tsignal_edgepointer_Callipepla_12__empty_n;
  wire tsignal_edgepointer_Callipepla_12__read;
  wire [1:0] tsignal_edgepointer_Callipepla_12__din;
  wire tsignal_edgepointer_Callipepla_12__full_n;
  wire tsignal_edgepointer_Callipepla_12__write;
  wire [1:0] tsignal_edgepointer_Callipepla_13__dout;
  wire tsignal_edgepointer_Callipepla_13__empty_n;
  wire tsignal_edgepointer_Callipepla_13__read;
  wire [1:0] tsignal_edgepointer_Callipepla_13__din;
  wire tsignal_edgepointer_Callipepla_13__full_n;
  wire tsignal_edgepointer_Callipepla_13__write;
  wire [1:0] tsignal_edgepointer_Callipepla_14__dout;
  wire tsignal_edgepointer_Callipepla_14__empty_n;
  wire tsignal_edgepointer_Callipepla_14__read;
  wire [1:0] tsignal_edgepointer_Callipepla_14__din;
  wire tsignal_edgepointer_Callipepla_14__full_n;
  wire tsignal_edgepointer_Callipepla_14__write;
  wire [1:0] tsignal_edgepointer_Callipepla_15__dout;
  wire tsignal_edgepointer_Callipepla_15__empty_n;
  wire tsignal_edgepointer_Callipepla_15__read;
  wire [1:0] tsignal_edgepointer_Callipepla_15__din;
  wire tsignal_edgepointer_Callipepla_15__full_n;
  wire tsignal_edgepointer_Callipepla_15__write;
  wire [1:0] tsignal_edgepointer_Callipepla_16__dout;
  wire tsignal_edgepointer_Callipepla_16__empty_n;
  wire tsignal_edgepointer_Callipepla_16__read;
  wire [1:0] tsignal_edgepointer_Callipepla_16__din;
  wire tsignal_edgepointer_Callipepla_16__full_n;
  wire tsignal_edgepointer_Callipepla_16__write;
  wire [1:0] tsignal_edgepointer_Callipepla_17__dout;
  wire tsignal_edgepointer_Callipepla_17__empty_n;
  wire tsignal_edgepointer_Callipepla_17__read;
  wire [1:0] tsignal_edgepointer_Callipepla_17__din;
  wire tsignal_edgepointer_Callipepla_17__full_n;
  wire tsignal_edgepointer_Callipepla_17__write;
  wire [1:0] tsignal_edgepointer_Callipepla_1__dout;
  wire tsignal_edgepointer_Callipepla_1__empty_n;
  wire tsignal_edgepointer_Callipepla_1__read;
  wire [1:0] tsignal_edgepointer_Callipepla_1__din;
  wire tsignal_edgepointer_Callipepla_1__full_n;
  wire tsignal_edgepointer_Callipepla_1__write;
  wire [1:0] tsignal_edgepointer_Callipepla_2__dout;
  wire tsignal_edgepointer_Callipepla_2__empty_n;
  wire tsignal_edgepointer_Callipepla_2__read;
  wire [1:0] tsignal_edgepointer_Callipepla_2__din;
  wire tsignal_edgepointer_Callipepla_2__full_n;
  wire tsignal_edgepointer_Callipepla_2__write;
  wire [1:0] tsignal_edgepointer_Callipepla_3__dout;
  wire tsignal_edgepointer_Callipepla_3__empty_n;
  wire tsignal_edgepointer_Callipepla_3__read;
  wire [1:0] tsignal_edgepointer_Callipepla_3__din;
  wire tsignal_edgepointer_Callipepla_3__full_n;
  wire tsignal_edgepointer_Callipepla_3__write;
  wire [1:0] tsignal_edgepointer_Callipepla_4__dout;
  wire tsignal_edgepointer_Callipepla_4__empty_n;
  wire tsignal_edgepointer_Callipepla_4__read;
  wire [1:0] tsignal_edgepointer_Callipepla_4__din;
  wire tsignal_edgepointer_Callipepla_4__full_n;
  wire tsignal_edgepointer_Callipepla_4__write;
  wire [1:0] tsignal_edgepointer_Callipepla_5__dout;
  wire tsignal_edgepointer_Callipepla_5__empty_n;
  wire tsignal_edgepointer_Callipepla_5__read;
  wire [1:0] tsignal_edgepointer_Callipepla_5__din;
  wire tsignal_edgepointer_Callipepla_5__full_n;
  wire tsignal_edgepointer_Callipepla_5__write;
  wire [1:0] tsignal_edgepointer_Callipepla_6__dout;
  wire tsignal_edgepointer_Callipepla_6__empty_n;
  wire tsignal_edgepointer_Callipepla_6__read;
  wire [1:0] tsignal_edgepointer_Callipepla_6__din;
  wire tsignal_edgepointer_Callipepla_6__full_n;
  wire tsignal_edgepointer_Callipepla_6__write;
  wire [1:0] tsignal_edgepointer_Callipepla_7__dout;
  wire tsignal_edgepointer_Callipepla_7__empty_n;
  wire tsignal_edgepointer_Callipepla_7__read;
  wire [1:0] tsignal_edgepointer_Callipepla_7__din;
  wire tsignal_edgepointer_Callipepla_7__full_n;
  wire tsignal_edgepointer_Callipepla_7__write;
  wire [1:0] tsignal_edgepointer_Callipepla_8__dout;
  wire tsignal_edgepointer_Callipepla_8__empty_n;
  wire tsignal_edgepointer_Callipepla_8__read;
  wire [1:0] tsignal_edgepointer_Callipepla_8__din;
  wire tsignal_edgepointer_Callipepla_8__full_n;
  wire tsignal_edgepointer_Callipepla_8__write;
  wire [1:0] tsignal_edgepointer_Callipepla_9__dout;
  wire tsignal_edgepointer_Callipepla_9__empty_n;
  wire tsignal_edgepointer_Callipepla_9__read;
  wire [1:0] tsignal_edgepointer_Callipepla_9__din;
  wire tsignal_edgepointer_Callipepla_9__full_n;
  wire tsignal_edgepointer_Callipepla_9__write;
  wire [1:0] tsignal_mux_Callipepla__dout;
  wire tsignal_mux_Callipepla__empty_n;
  wire tsignal_mux_Callipepla__read;
  wire [1:0] tsignal_mux_Callipepla__din;
  wire tsignal_mux_Callipepla__full_n;
  wire tsignal_mux_Callipepla__write;
  wire [1:0] tsignal_rdA_Callipepla_0__dout;
  wire tsignal_rdA_Callipepla_0__empty_n;
  wire tsignal_rdA_Callipepla_0__read;
  wire [1:0] tsignal_rdA_Callipepla_0__din;
  wire tsignal_rdA_Callipepla_0__full_n;
  wire tsignal_rdA_Callipepla_0__write;
  wire [1:0] tsignal_rdA_Callipepla_10__dout;
  wire tsignal_rdA_Callipepla_10__empty_n;
  wire tsignal_rdA_Callipepla_10__read;
  wire [1:0] tsignal_rdA_Callipepla_10__din;
  wire tsignal_rdA_Callipepla_10__full_n;
  wire tsignal_rdA_Callipepla_10__write;
  wire [1:0] tsignal_rdA_Callipepla_11__dout;
  wire tsignal_rdA_Callipepla_11__empty_n;
  wire tsignal_rdA_Callipepla_11__read;
  wire [1:0] tsignal_rdA_Callipepla_11__din;
  wire tsignal_rdA_Callipepla_11__full_n;
  wire tsignal_rdA_Callipepla_11__write;
  wire [1:0] tsignal_rdA_Callipepla_12__dout;
  wire tsignal_rdA_Callipepla_12__empty_n;
  wire tsignal_rdA_Callipepla_12__read;
  wire [1:0] tsignal_rdA_Callipepla_12__din;
  wire tsignal_rdA_Callipepla_12__full_n;
  wire tsignal_rdA_Callipepla_12__write;
  wire [1:0] tsignal_rdA_Callipepla_13__dout;
  wire tsignal_rdA_Callipepla_13__empty_n;
  wire tsignal_rdA_Callipepla_13__read;
  wire [1:0] tsignal_rdA_Callipepla_13__din;
  wire tsignal_rdA_Callipepla_13__full_n;
  wire tsignal_rdA_Callipepla_13__write;
  wire [1:0] tsignal_rdA_Callipepla_14__dout;
  wire tsignal_rdA_Callipepla_14__empty_n;
  wire tsignal_rdA_Callipepla_14__read;
  wire [1:0] tsignal_rdA_Callipepla_14__din;
  wire tsignal_rdA_Callipepla_14__full_n;
  wire tsignal_rdA_Callipepla_14__write;
  wire [1:0] tsignal_rdA_Callipepla_15__dout;
  wire tsignal_rdA_Callipepla_15__empty_n;
  wire tsignal_rdA_Callipepla_15__read;
  wire [1:0] tsignal_rdA_Callipepla_15__din;
  wire tsignal_rdA_Callipepla_15__full_n;
  wire tsignal_rdA_Callipepla_15__write;
  wire [1:0] tsignal_rdA_Callipepla_16__dout;
  wire tsignal_rdA_Callipepla_16__empty_n;
  wire tsignal_rdA_Callipepla_16__read;
  wire [1:0] tsignal_rdA_Callipepla_16__din;
  wire tsignal_rdA_Callipepla_16__full_n;
  wire tsignal_rdA_Callipepla_16__write;
  wire [1:0] tsignal_rdA_Callipepla_1__dout;
  wire tsignal_rdA_Callipepla_1__empty_n;
  wire tsignal_rdA_Callipepla_1__read;
  wire [1:0] tsignal_rdA_Callipepla_1__din;
  wire tsignal_rdA_Callipepla_1__full_n;
  wire tsignal_rdA_Callipepla_1__write;
  wire [1:0] tsignal_rdA_Callipepla_2__dout;
  wire tsignal_rdA_Callipepla_2__empty_n;
  wire tsignal_rdA_Callipepla_2__read;
  wire [1:0] tsignal_rdA_Callipepla_2__din;
  wire tsignal_rdA_Callipepla_2__full_n;
  wire tsignal_rdA_Callipepla_2__write;
  wire [1:0] tsignal_rdA_Callipepla_3__dout;
  wire tsignal_rdA_Callipepla_3__empty_n;
  wire tsignal_rdA_Callipepla_3__read;
  wire [1:0] tsignal_rdA_Callipepla_3__din;
  wire tsignal_rdA_Callipepla_3__full_n;
  wire tsignal_rdA_Callipepla_3__write;
  wire [1:0] tsignal_rdA_Callipepla_4__dout;
  wire tsignal_rdA_Callipepla_4__empty_n;
  wire tsignal_rdA_Callipepla_4__read;
  wire [1:0] tsignal_rdA_Callipepla_4__din;
  wire tsignal_rdA_Callipepla_4__full_n;
  wire tsignal_rdA_Callipepla_4__write;
  wire [1:0] tsignal_rdA_Callipepla_5__dout;
  wire tsignal_rdA_Callipepla_5__empty_n;
  wire tsignal_rdA_Callipepla_5__read;
  wire [1:0] tsignal_rdA_Callipepla_5__din;
  wire tsignal_rdA_Callipepla_5__full_n;
  wire tsignal_rdA_Callipepla_5__write;
  wire [1:0] tsignal_rdA_Callipepla_6__dout;
  wire tsignal_rdA_Callipepla_6__empty_n;
  wire tsignal_rdA_Callipepla_6__read;
  wire [1:0] tsignal_rdA_Callipepla_6__din;
  wire tsignal_rdA_Callipepla_6__full_n;
  wire tsignal_rdA_Callipepla_6__write;
  wire [1:0] tsignal_rdA_Callipepla_7__dout;
  wire tsignal_rdA_Callipepla_7__empty_n;
  wire tsignal_rdA_Callipepla_7__read;
  wire [1:0] tsignal_rdA_Callipepla_7__din;
  wire tsignal_rdA_Callipepla_7__full_n;
  wire tsignal_rdA_Callipepla_7__write;
  wire [1:0] tsignal_rdA_Callipepla_8__dout;
  wire tsignal_rdA_Callipepla_8__empty_n;
  wire tsignal_rdA_Callipepla_8__read;
  wire [1:0] tsignal_rdA_Callipepla_8__din;
  wire tsignal_rdA_Callipepla_8__full_n;
  wire tsignal_rdA_Callipepla_8__write;
  wire [1:0] tsignal_rdA_Callipepla_9__dout;
  wire tsignal_rdA_Callipepla_9__empty_n;
  wire tsignal_rdA_Callipepla_9__read;
  wire [1:0] tsignal_rdA_Callipepla_9__din;
  wire tsignal_rdA_Callipepla_9__full_n;
  wire tsignal_rdA_Callipepla_9__write;
  wire [1:0] tsignal_res_Callipepla__dout;
  wire tsignal_res_Callipepla__empty_n;
  wire tsignal_res_Callipepla__read;
  wire [1:0] tsignal_res_Callipepla__din;
  wire tsignal_res_Callipepla__full_n;
  wire tsignal_res_Callipepla__write;
  wire [1:0] tsignal_toM3_Callipepla__dout;
  wire tsignal_toM3_Callipepla__empty_n;
  wire tsignal_toM3_Callipepla__read;
  wire [1:0] tsignal_toM3_Callipepla__din;
  wire tsignal_toM3_Callipepla__full_n;
  wire tsignal_toM3_Callipepla__write;
  wire [1:0] tsignal_toM4_Callipepla__dout;
  wire tsignal_toM4_Callipepla__empty_n;
  wire tsignal_toM4_Callipepla__read;
  wire [1:0] tsignal_toM4_Callipepla__din;
  wire tsignal_toM4_Callipepla__full_n;
  wire tsignal_toM4_Callipepla__write;
  wire [1:0] tsignal_toM5_Callipepla__dout;
  wire tsignal_toM5_Callipepla__empty_n;
  wire tsignal_toM5_Callipepla__read;
  wire [1:0] tsignal_toM5_Callipepla__din;
  wire tsignal_toM5_Callipepla__full_n;
  wire tsignal_toM5_Callipepla__write;
  wire [1:0] tsignal_toM6_Callipepla__dout;
  wire tsignal_toM6_Callipepla__empty_n;
  wire tsignal_toM6_Callipepla__read;
  wire [1:0] tsignal_toM6_Callipepla__din;
  wire tsignal_toM6_Callipepla__full_n;
  wire tsignal_toM6_Callipepla__write;
  wire [1:0] tsignal_toM7_Callipepla__dout;
  wire tsignal_toM7_Callipepla__empty_n;
  wire tsignal_toM7_Callipepla__read;
  wire [1:0] tsignal_toM7_Callipepla__din;
  wire tsignal_toM7_Callipepla__full_n;
  wire tsignal_toM7_Callipepla__write;
  wire [31:0] Arbiter_Y_0___M__q0;
  wire [31:0] Arbiter_Y_0___rp_time__q0;
  wire Arbiter_Y_0__ap_start;
  wire Arbiter_Y_0__ap_ready;
  wire Arbiter_Y_0__ap_done;
  wire Arbiter_Y_0__ap_idle;
  wire [31:0] Arbiter_Y_1___M__q0;
  wire [31:0] Arbiter_Y_1___rp_time__q0;
  wire Arbiter_Y_1__ap_start;
  wire Arbiter_Y_1__ap_ready;
  wire Arbiter_Y_1__ap_done;
  wire Arbiter_Y_1__ap_idle;
  wire [31:0] Arbiter_Y_2___M__q0;
  wire [31:0] Arbiter_Y_2___rp_time__q0;
  wire Arbiter_Y_2__ap_start;
  wire Arbiter_Y_2__ap_ready;
  wire Arbiter_Y_2__ap_done;
  wire Arbiter_Y_2__ap_idle;
  wire [31:0] Arbiter_Y_3___M__q0;
  wire [31:0] Arbiter_Y_3___rp_time__q0;
  wire Arbiter_Y_3__ap_start;
  wire Arbiter_Y_3__ap_ready;
  wire Arbiter_Y_3__ap_done;
  wire Arbiter_Y_3__ap_idle;
  wire [31:0] Arbiter_Y_4___M__q0;
  wire [31:0] Arbiter_Y_4___rp_time__q0;
  wire Arbiter_Y_4__ap_start;
  wire Arbiter_Y_4__ap_ready;
  wire Arbiter_Y_4__ap_done;
  wire Arbiter_Y_4__ap_idle;
  wire [31:0] Arbiter_Y_5___M__q0;
  wire [31:0] Arbiter_Y_5___rp_time__q0;
  wire Arbiter_Y_5__ap_start;
  wire Arbiter_Y_5__ap_ready;
  wire Arbiter_Y_5__ap_done;
  wire Arbiter_Y_5__ap_idle;
  wire [31:0] Arbiter_Y_6___M__q0;
  wire [31:0] Arbiter_Y_6___rp_time__q0;
  wire Arbiter_Y_6__ap_start;
  wire Arbiter_Y_6__ap_ready;
  wire Arbiter_Y_6__ap_done;
  wire Arbiter_Y_6__ap_idle;
  wire [31:0] Arbiter_Y_7___M__q0;
  wire [31:0] Arbiter_Y_7___rp_time__q0;
  wire Arbiter_Y_7__ap_start;
  wire Arbiter_Y_7__ap_ready;
  wire Arbiter_Y_7__ap_done;
  wire Arbiter_Y_7__ap_idle;
  wire Merger_Y_0__ap_start;
  wire PEG_Xvec_0__ap_start;
  wire PEG_Xvec_0__ap_ready;
  wire PEG_Xvec_0__ap_done;
  wire PEG_Xvec_0__ap_idle;
  wire PEG_Xvec_1__ap_start;
  wire PEG_Xvec_1__ap_ready;
  wire PEG_Xvec_1__ap_done;
  wire PEG_Xvec_1__ap_idle;
  wire PEG_Xvec_2__ap_start;
  wire PEG_Xvec_2__ap_ready;
  wire PEG_Xvec_2__ap_done;
  wire PEG_Xvec_2__ap_idle;
  wire PEG_Xvec_3__ap_start;
  wire PEG_Xvec_3__ap_ready;
  wire PEG_Xvec_3__ap_done;
  wire PEG_Xvec_3__ap_idle;
  wire PEG_Xvec_4__ap_start;
  wire PEG_Xvec_4__ap_ready;
  wire PEG_Xvec_4__ap_done;
  wire PEG_Xvec_4__ap_idle;
  wire PEG_Xvec_5__ap_start;
  wire PEG_Xvec_5__ap_ready;
  wire PEG_Xvec_5__ap_done;
  wire PEG_Xvec_5__ap_idle;
  wire PEG_Xvec_6__ap_start;
  wire PEG_Xvec_6__ap_ready;
  wire PEG_Xvec_6__ap_done;
  wire PEG_Xvec_6__ap_idle;
  wire PEG_Xvec_7__ap_start;
  wire PEG_Xvec_7__ap_ready;
  wire PEG_Xvec_7__ap_done;
  wire PEG_Xvec_7__ap_idle;
  wire PEG_Xvec_8__ap_start;
  wire PEG_Xvec_8__ap_ready;
  wire PEG_Xvec_8__ap_done;
  wire PEG_Xvec_8__ap_idle;
  wire PEG_Xvec_9__ap_start;
  wire PEG_Xvec_9__ap_ready;
  wire PEG_Xvec_9__ap_done;
  wire PEG_Xvec_9__ap_idle;
  wire PEG_Xvec_10__ap_start;
  wire PEG_Xvec_10__ap_ready;
  wire PEG_Xvec_10__ap_done;
  wire PEG_Xvec_10__ap_idle;
  wire PEG_Xvec_11__ap_start;
  wire PEG_Xvec_11__ap_ready;
  wire PEG_Xvec_11__ap_done;
  wire PEG_Xvec_11__ap_idle;
  wire PEG_Xvec_12__ap_start;
  wire PEG_Xvec_12__ap_ready;
  wire PEG_Xvec_12__ap_done;
  wire PEG_Xvec_12__ap_idle;
  wire PEG_Xvec_13__ap_start;
  wire PEG_Xvec_13__ap_ready;
  wire PEG_Xvec_13__ap_done;
  wire PEG_Xvec_13__ap_idle;
  wire PEG_Xvec_14__ap_start;
  wire PEG_Xvec_14__ap_ready;
  wire PEG_Xvec_14__ap_done;
  wire PEG_Xvec_14__ap_idle;
  wire PEG_Xvec_15__ap_start;
  wire PEG_Xvec_15__ap_ready;
  wire PEG_Xvec_15__ap_done;
  wire PEG_Xvec_15__ap_idle;
  wire PEG_Yvec_0__ap_start;
  wire PEG_Yvec_0__ap_ready;
  wire PEG_Yvec_0__ap_done;
  wire PEG_Yvec_0__ap_idle;
  wire PEG_Yvec_1__ap_start;
  wire PEG_Yvec_1__ap_ready;
  wire PEG_Yvec_1__ap_done;
  wire PEG_Yvec_1__ap_idle;
  wire PEG_Yvec_2__ap_start;
  wire PEG_Yvec_2__ap_ready;
  wire PEG_Yvec_2__ap_done;
  wire PEG_Yvec_2__ap_idle;
  wire PEG_Yvec_3__ap_start;
  wire PEG_Yvec_3__ap_ready;
  wire PEG_Yvec_3__ap_done;
  wire PEG_Yvec_3__ap_idle;
  wire PEG_Yvec_4__ap_start;
  wire PEG_Yvec_4__ap_ready;
  wire PEG_Yvec_4__ap_done;
  wire PEG_Yvec_4__ap_idle;
  wire PEG_Yvec_5__ap_start;
  wire PEG_Yvec_5__ap_ready;
  wire PEG_Yvec_5__ap_done;
  wire PEG_Yvec_5__ap_idle;
  wire PEG_Yvec_6__ap_start;
  wire PEG_Yvec_6__ap_ready;
  wire PEG_Yvec_6__ap_done;
  wire PEG_Yvec_6__ap_idle;
  wire PEG_Yvec_7__ap_start;
  wire PEG_Yvec_7__ap_ready;
  wire PEG_Yvec_7__ap_done;
  wire PEG_Yvec_7__ap_idle;
  wire PEG_Yvec_8__ap_start;
  wire PEG_Yvec_8__ap_ready;
  wire PEG_Yvec_8__ap_done;
  wire PEG_Yvec_8__ap_idle;
  wire PEG_Yvec_9__ap_start;
  wire PEG_Yvec_9__ap_ready;
  wire PEG_Yvec_9__ap_done;
  wire PEG_Yvec_9__ap_idle;
  wire PEG_Yvec_10__ap_start;
  wire PEG_Yvec_10__ap_ready;
  wire PEG_Yvec_10__ap_done;
  wire PEG_Yvec_10__ap_idle;
  wire PEG_Yvec_11__ap_start;
  wire PEG_Yvec_11__ap_ready;
  wire PEG_Yvec_11__ap_done;
  wire PEG_Yvec_11__ap_idle;
  wire PEG_Yvec_12__ap_start;
  wire PEG_Yvec_12__ap_ready;
  wire PEG_Yvec_12__ap_done;
  wire PEG_Yvec_12__ap_idle;
  wire PEG_Yvec_13__ap_start;
  wire PEG_Yvec_13__ap_ready;
  wire PEG_Yvec_13__ap_done;
  wire PEG_Yvec_13__ap_idle;
  wire PEG_Yvec_14__ap_start;
  wire PEG_Yvec_14__ap_ready;
  wire PEG_Yvec_14__ap_done;
  wire PEG_Yvec_14__ap_idle;
  wire PEG_Yvec_15__ap_start;
  wire PEG_Yvec_15__ap_ready;
  wire PEG_Yvec_15__ap_done;
  wire PEG_Yvec_15__ap_idle;
  wire black_hole_bool_0__ap_start;
  wire black_hole_bool_1__ap_start;
  wire black_hole_double_v8_0__ap_start;
  wire black_hole_int_0__ap_start;
  wire [31:0] ctrl_AP_0___M__q0;
  wire [31:0] ctrl_AP_0___rp_time__q0;
  wire ctrl_AP_0__ap_start;
  wire ctrl_AP_0__ap_ready;
  wire ctrl_AP_0__ap_done;
  wire ctrl_AP_0__ap_idle;
  wire [31:0] ctrl_P_0___M__q0;
  wire [31:0] ctrl_P_0___rp_time__q0;
  wire ctrl_P_0__ap_start;
  wire ctrl_P_0__ap_ready;
  wire ctrl_P_0__ap_done;
  wire ctrl_P_0__ap_idle;
  wire [31:0] ctrl_R_0___M__q0;
  wire [31:0] ctrl_R_0___rp_time__q0;
  wire ctrl_R_0__ap_start;
  wire ctrl_R_0__ap_ready;
  wire ctrl_R_0__ap_done;
  wire ctrl_R_0__ap_idle;
  wire [31:0] ctrl_X_0___M__q0;
  wire [31:0] ctrl_X_0___rp_time__q0;
  wire ctrl_X_0__ap_start;
  wire ctrl_X_0__ap_ready;
  wire ctrl_X_0__ap_done;
  wire ctrl_X_0__ap_idle;
  wire [31:0] dot_alpha_0___M__q0;
  wire [31:0] dot_alpha_0___rp_time__q0;
  wire dot_alpha_0__ap_start;
  wire dot_alpha_0__ap_ready;
  wire dot_alpha_0__ap_done;
  wire dot_alpha_0__ap_idle;
  wire [31:0] dot_res_0___M__q0;
  wire [31:0] dot_res_0___rp_time__q0;
  wire [63:0] dot_res_0___th_termination__q0;
  wire dot_res_0__ap_start;
  wire dot_res_0__ap_ready;
  wire dot_res_0__ap_done;
  wire dot_res_0__ap_idle;
  wire [31:0] dot_rznew_0___M__q0;
  wire [31:0] dot_rznew_0___rp_time__q0;
  wire dot_rznew_0__ap_start;
  wire dot_rznew_0__ap_ready;
  wire dot_rznew_0__ap_done;
  wire dot_rznew_0__ap_idle;
  wire duplicator_0__ap_start;
  wire [31:0] left_div_0___M__q0;
  wire [31:0] left_div_0___rp_time__q0;
  wire left_div_0__ap_start;
  wire left_div_0__ap_ready;
  wire left_div_0__ap_done;
  wire left_div_0__ap_idle;
  wire [63:0] rdwr_vec_0___vec_p_0__q0;
  wire [63:0] vec_p_0_read_addr__din;
  wire vec_p_0_read_addr__full_n;
  wire vec_p_0_read_addr__write;
  wire [511:0] vec_p_0_read_data__dout;
  wire vec_p_0_read_data__empty_n;
  wire vec_p_0_read_data__read;
  wire [63:0] vec_p_0_write_addr__din;
  wire vec_p_0_write_addr__full_n;
  wire vec_p_0_write_addr__write;
  wire [511:0] vec_p_0_write_data__din;
  wire vec_p_0_write_data__full_n;
  wire vec_p_0_write_data__write;
  wire [7:0] vec_p_0_write_resp__dout;
  wire vec_p_0_write_resp__empty_n;
  wire vec_p_0_write_resp__read;
  wire rdwr_vec_0__ap_start;
  wire [63:0] rdwr_vec_1___vec_p_1__q0;
  wire [63:0] vec_p_1_read_addr__din;
  wire vec_p_1_read_addr__full_n;
  wire vec_p_1_read_addr__write;
  wire [511:0] vec_p_1_read_data__dout;
  wire vec_p_1_read_data__empty_n;
  wire vec_p_1_read_data__read;
  wire [63:0] vec_p_1_write_addr__din;
  wire vec_p_1_write_addr__full_n;
  wire vec_p_1_write_addr__write;
  wire [511:0] vec_p_1_write_data__din;
  wire vec_p_1_write_data__full_n;
  wire vec_p_1_write_data__write;
  wire [7:0] vec_p_1_write_resp__dout;
  wire vec_p_1_write_resp__empty_n;
  wire vec_p_1_write_resp__read;
  wire rdwr_vec_1__ap_start;
  wire [63:0] rdwr_vec_2___vec_r_0__q0;
  wire [63:0] vec_r_0_read_addr__din;
  wire vec_r_0_read_addr__full_n;
  wire vec_r_0_read_addr__write;
  wire [511:0] vec_r_0_read_data__dout;
  wire vec_r_0_read_data__empty_n;
  wire vec_r_0_read_data__read;
  wire [63:0] vec_r_0_write_addr__din;
  wire vec_r_0_write_addr__full_n;
  wire vec_r_0_write_addr__write;
  wire [511:0] vec_r_0_write_data__din;
  wire vec_r_0_write_data__full_n;
  wire vec_r_0_write_data__write;
  wire [7:0] vec_r_0_write_resp__dout;
  wire vec_r_0_write_resp__empty_n;
  wire vec_r_0_write_resp__read;
  wire rdwr_vec_2__ap_start;
  wire [63:0] rdwr_vec_3___vec_r_1__q0;
  wire [63:0] vec_r_1_read_addr__din;
  wire vec_r_1_read_addr__full_n;
  wire vec_r_1_read_addr__write;
  wire [511:0] vec_r_1_read_data__dout;
  wire vec_r_1_read_data__empty_n;
  wire vec_r_1_read_data__read;
  wire [63:0] vec_r_1_write_addr__din;
  wire vec_r_1_write_addr__full_n;
  wire vec_r_1_write_addr__write;
  wire [511:0] vec_r_1_write_data__din;
  wire vec_r_1_write_data__full_n;
  wire vec_r_1_write_data__write;
  wire [7:0] vec_r_1_write_resp__dout;
  wire vec_r_1_write_resp__empty_n;
  wire vec_r_1_write_resp__read;
  wire rdwr_vec_3__ap_start;
  wire [63:0] rdwr_vec_4___vec_x_0__q0;
  wire [63:0] vec_x_0_read_addr__din;
  wire vec_x_0_read_addr__full_n;
  wire vec_x_0_read_addr__write;
  wire [511:0] vec_x_0_read_data__dout;
  wire vec_x_0_read_data__empty_n;
  wire vec_x_0_read_data__read;
  wire [63:0] vec_x_0_write_addr__din;
  wire vec_x_0_write_addr__full_n;
  wire vec_x_0_write_addr__write;
  wire [511:0] vec_x_0_write_data__din;
  wire vec_x_0_write_data__full_n;
  wire vec_x_0_write_data__write;
  wire [7:0] vec_x_0_write_resp__dout;
  wire vec_x_0_write_resp__empty_n;
  wire vec_x_0_write_resp__read;
  wire rdwr_vec_4__ap_start;
  wire [63:0] rdwr_vec_5___vec_x_1__q0;
  wire [63:0] vec_x_1_read_addr__din;
  wire vec_x_1_read_addr__full_n;
  wire vec_x_1_read_addr__write;
  wire [511:0] vec_x_1_read_data__dout;
  wire vec_x_1_read_data__empty_n;
  wire vec_x_1_read_data__read;
  wire [63:0] vec_x_1_write_addr__din;
  wire vec_x_1_write_addr__full_n;
  wire vec_x_1_write_addr__write;
  wire [511:0] vec_x_1_write_data__din;
  wire vec_x_1_write_data__full_n;
  wire vec_x_1_write_data__write;
  wire [7:0] vec_x_1_write_resp__dout;
  wire vec_x_1_write_resp__empty_n;
  wire vec_x_1_write_resp__read;
  wire rdwr_vec_5__ap_start;
  wire [63:0] rdwr_vec_6___vec_Ap__q0;
  wire [63:0] vec_Ap_read_addr__din;
  wire vec_Ap_read_addr__full_n;
  wire vec_Ap_read_addr__write;
  wire [511:0] vec_Ap_read_data__dout;
  wire vec_Ap_read_data__empty_n;
  wire vec_Ap_read_data__read;
  wire [63:0] vec_Ap_write_addr__din;
  wire vec_Ap_write_addr__full_n;
  wire vec_Ap_write_addr__write;
  wire [511:0] vec_Ap_write_data__din;
  wire vec_Ap_write_data__full_n;
  wire vec_Ap_write_data__write;
  wire [7:0] vec_Ap_write_resp__dout;
  wire vec_Ap_write_resp__empty_n;
  wire vec_Ap_write_resp__read;
  wire rdwr_vec_6__ap_start;
  wire [31:0] read_A_0___NUM_A_LEN__q0;
  wire [63:0] read_A_0___edge_list_ch_0__q0;
  wire [63:0] edge_list_ch_0_read_addr__din;
  wire edge_list_ch_0_read_addr__full_n;
  wire edge_list_ch_0_read_addr__write;
  wire [511:0] edge_list_ch_0_read_data__dout;
  wire edge_list_ch_0_read_data__empty_n;
  wire edge_list_ch_0_read_data__read;
  wire [63:0] edge_list_ch_0_write_addr__din;
  wire edge_list_ch_0_write_addr__full_n;
  wire edge_list_ch_0_write_addr__write;
  wire [511:0] edge_list_ch_0_write_data__din;
  wire edge_list_ch_0_write_data__full_n;
  wire edge_list_ch_0_write_data__write;
  wire [7:0] edge_list_ch_0_write_resp__dout;
  wire edge_list_ch_0_write_resp__empty_n;
  wire edge_list_ch_0_write_resp__read;
  wire [31:0] read_A_0___rp_time__q0;
  wire read_A_0__ap_start;
  wire read_A_0__ap_ready;
  wire read_A_0__ap_done;
  wire read_A_0__ap_idle;
  wire [31:0] read_A_1___NUM_A_LEN__q0;
  wire [63:0] read_A_1___edge_list_ch_1__q0;
  wire [63:0] edge_list_ch_1_read_addr__din;
  wire edge_list_ch_1_read_addr__full_n;
  wire edge_list_ch_1_read_addr__write;
  wire [511:0] edge_list_ch_1_read_data__dout;
  wire edge_list_ch_1_read_data__empty_n;
  wire edge_list_ch_1_read_data__read;
  wire [63:0] edge_list_ch_1_write_addr__din;
  wire edge_list_ch_1_write_addr__full_n;
  wire edge_list_ch_1_write_addr__write;
  wire [511:0] edge_list_ch_1_write_data__din;
  wire edge_list_ch_1_write_data__full_n;
  wire edge_list_ch_1_write_data__write;
  wire [7:0] edge_list_ch_1_write_resp__dout;
  wire edge_list_ch_1_write_resp__empty_n;
  wire edge_list_ch_1_write_resp__read;
  wire [31:0] read_A_1___rp_time__q0;
  wire read_A_1__ap_start;
  wire read_A_1__ap_ready;
  wire read_A_1__ap_done;
  wire read_A_1__ap_idle;
  wire [31:0] read_A_2___NUM_A_LEN__q0;
  wire [63:0] read_A_2___edge_list_ch_2__q0;
  wire [63:0] edge_list_ch_2_read_addr__din;
  wire edge_list_ch_2_read_addr__full_n;
  wire edge_list_ch_2_read_addr__write;
  wire [511:0] edge_list_ch_2_read_data__dout;
  wire edge_list_ch_2_read_data__empty_n;
  wire edge_list_ch_2_read_data__read;
  wire [63:0] edge_list_ch_2_write_addr__din;
  wire edge_list_ch_2_write_addr__full_n;
  wire edge_list_ch_2_write_addr__write;
  wire [511:0] edge_list_ch_2_write_data__din;
  wire edge_list_ch_2_write_data__full_n;
  wire edge_list_ch_2_write_data__write;
  wire [7:0] edge_list_ch_2_write_resp__dout;
  wire edge_list_ch_2_write_resp__empty_n;
  wire edge_list_ch_2_write_resp__read;
  wire [31:0] read_A_2___rp_time__q0;
  wire read_A_2__ap_start;
  wire read_A_2__ap_ready;
  wire read_A_2__ap_done;
  wire read_A_2__ap_idle;
  wire [31:0] read_A_3___NUM_A_LEN__q0;
  wire [63:0] read_A_3___edge_list_ch_3__q0;
  wire [63:0] edge_list_ch_3_read_addr__din;
  wire edge_list_ch_3_read_addr__full_n;
  wire edge_list_ch_3_read_addr__write;
  wire [511:0] edge_list_ch_3_read_data__dout;
  wire edge_list_ch_3_read_data__empty_n;
  wire edge_list_ch_3_read_data__read;
  wire [63:0] edge_list_ch_3_write_addr__din;
  wire edge_list_ch_3_write_addr__full_n;
  wire edge_list_ch_3_write_addr__write;
  wire [511:0] edge_list_ch_3_write_data__din;
  wire edge_list_ch_3_write_data__full_n;
  wire edge_list_ch_3_write_data__write;
  wire [7:0] edge_list_ch_3_write_resp__dout;
  wire edge_list_ch_3_write_resp__empty_n;
  wire edge_list_ch_3_write_resp__read;
  wire [31:0] read_A_3___rp_time__q0;
  wire read_A_3__ap_start;
  wire read_A_3__ap_ready;
  wire read_A_3__ap_done;
  wire read_A_3__ap_idle;
  wire [31:0] read_A_4___NUM_A_LEN__q0;
  wire [63:0] read_A_4___edge_list_ch_4__q0;
  wire [63:0] edge_list_ch_4_read_addr__din;
  wire edge_list_ch_4_read_addr__full_n;
  wire edge_list_ch_4_read_addr__write;
  wire [511:0] edge_list_ch_4_read_data__dout;
  wire edge_list_ch_4_read_data__empty_n;
  wire edge_list_ch_4_read_data__read;
  wire [63:0] edge_list_ch_4_write_addr__din;
  wire edge_list_ch_4_write_addr__full_n;
  wire edge_list_ch_4_write_addr__write;
  wire [511:0] edge_list_ch_4_write_data__din;
  wire edge_list_ch_4_write_data__full_n;
  wire edge_list_ch_4_write_data__write;
  wire [7:0] edge_list_ch_4_write_resp__dout;
  wire edge_list_ch_4_write_resp__empty_n;
  wire edge_list_ch_4_write_resp__read;
  wire [31:0] read_A_4___rp_time__q0;
  wire read_A_4__ap_start;
  wire read_A_4__ap_ready;
  wire read_A_4__ap_done;
  wire read_A_4__ap_idle;
  wire [31:0] read_A_5___NUM_A_LEN__q0;
  wire [63:0] read_A_5___edge_list_ch_5__q0;
  wire [63:0] edge_list_ch_5_read_addr__din;
  wire edge_list_ch_5_read_addr__full_n;
  wire edge_list_ch_5_read_addr__write;
  wire [511:0] edge_list_ch_5_read_data__dout;
  wire edge_list_ch_5_read_data__empty_n;
  wire edge_list_ch_5_read_data__read;
  wire [63:0] edge_list_ch_5_write_addr__din;
  wire edge_list_ch_5_write_addr__full_n;
  wire edge_list_ch_5_write_addr__write;
  wire [511:0] edge_list_ch_5_write_data__din;
  wire edge_list_ch_5_write_data__full_n;
  wire edge_list_ch_5_write_data__write;
  wire [7:0] edge_list_ch_5_write_resp__dout;
  wire edge_list_ch_5_write_resp__empty_n;
  wire edge_list_ch_5_write_resp__read;
  wire [31:0] read_A_5___rp_time__q0;
  wire read_A_5__ap_start;
  wire read_A_5__ap_ready;
  wire read_A_5__ap_done;
  wire read_A_5__ap_idle;
  wire [31:0] read_A_6___NUM_A_LEN__q0;
  wire [63:0] read_A_6___edge_list_ch_6__q0;
  wire [63:0] edge_list_ch_6_read_addr__din;
  wire edge_list_ch_6_read_addr__full_n;
  wire edge_list_ch_6_read_addr__write;
  wire [511:0] edge_list_ch_6_read_data__dout;
  wire edge_list_ch_6_read_data__empty_n;
  wire edge_list_ch_6_read_data__read;
  wire [63:0] edge_list_ch_6_write_addr__din;
  wire edge_list_ch_6_write_addr__full_n;
  wire edge_list_ch_6_write_addr__write;
  wire [511:0] edge_list_ch_6_write_data__din;
  wire edge_list_ch_6_write_data__full_n;
  wire edge_list_ch_6_write_data__write;
  wire [7:0] edge_list_ch_6_write_resp__dout;
  wire edge_list_ch_6_write_resp__empty_n;
  wire edge_list_ch_6_write_resp__read;
  wire [31:0] read_A_6___rp_time__q0;
  wire read_A_6__ap_start;
  wire read_A_6__ap_ready;
  wire read_A_6__ap_done;
  wire read_A_6__ap_idle;
  wire [31:0] read_A_7___NUM_A_LEN__q0;
  wire [63:0] read_A_7___edge_list_ch_7__q0;
  wire [63:0] edge_list_ch_7_read_addr__din;
  wire edge_list_ch_7_read_addr__full_n;
  wire edge_list_ch_7_read_addr__write;
  wire [511:0] edge_list_ch_7_read_data__dout;
  wire edge_list_ch_7_read_data__empty_n;
  wire edge_list_ch_7_read_data__read;
  wire [63:0] edge_list_ch_7_write_addr__din;
  wire edge_list_ch_7_write_addr__full_n;
  wire edge_list_ch_7_write_addr__write;
  wire [511:0] edge_list_ch_7_write_data__din;
  wire edge_list_ch_7_write_data__full_n;
  wire edge_list_ch_7_write_data__write;
  wire [7:0] edge_list_ch_7_write_resp__dout;
  wire edge_list_ch_7_write_resp__empty_n;
  wire edge_list_ch_7_write_resp__read;
  wire [31:0] read_A_7___rp_time__q0;
  wire read_A_7__ap_start;
  wire read_A_7__ap_ready;
  wire read_A_7__ap_done;
  wire read_A_7__ap_idle;
  wire [31:0] read_A_8___NUM_A_LEN__q0;
  wire [63:0] read_A_8___edge_list_ch_8__q0;
  wire [63:0] edge_list_ch_8_read_addr__din;
  wire edge_list_ch_8_read_addr__full_n;
  wire edge_list_ch_8_read_addr__write;
  wire [511:0] edge_list_ch_8_read_data__dout;
  wire edge_list_ch_8_read_data__empty_n;
  wire edge_list_ch_8_read_data__read;
  wire [63:0] edge_list_ch_8_write_addr__din;
  wire edge_list_ch_8_write_addr__full_n;
  wire edge_list_ch_8_write_addr__write;
  wire [511:0] edge_list_ch_8_write_data__din;
  wire edge_list_ch_8_write_data__full_n;
  wire edge_list_ch_8_write_data__write;
  wire [7:0] edge_list_ch_8_write_resp__dout;
  wire edge_list_ch_8_write_resp__empty_n;
  wire edge_list_ch_8_write_resp__read;
  wire [31:0] read_A_8___rp_time__q0;
  wire read_A_8__ap_start;
  wire read_A_8__ap_ready;
  wire read_A_8__ap_done;
  wire read_A_8__ap_idle;
  wire [31:0] read_A_9___NUM_A_LEN__q0;
  wire [63:0] read_A_9___edge_list_ch_9__q0;
  wire [63:0] edge_list_ch_9_read_addr__din;
  wire edge_list_ch_9_read_addr__full_n;
  wire edge_list_ch_9_read_addr__write;
  wire [511:0] edge_list_ch_9_read_data__dout;
  wire edge_list_ch_9_read_data__empty_n;
  wire edge_list_ch_9_read_data__read;
  wire [63:0] edge_list_ch_9_write_addr__din;
  wire edge_list_ch_9_write_addr__full_n;
  wire edge_list_ch_9_write_addr__write;
  wire [511:0] edge_list_ch_9_write_data__din;
  wire edge_list_ch_9_write_data__full_n;
  wire edge_list_ch_9_write_data__write;
  wire [7:0] edge_list_ch_9_write_resp__dout;
  wire edge_list_ch_9_write_resp__empty_n;
  wire edge_list_ch_9_write_resp__read;
  wire [31:0] read_A_9___rp_time__q0;
  wire read_A_9__ap_start;
  wire read_A_9__ap_ready;
  wire read_A_9__ap_done;
  wire read_A_9__ap_idle;
  wire [31:0] read_A_10___NUM_A_LEN__q0;
  wire [63:0] read_A_10___edge_list_ch_10__q0;
  wire [63:0] edge_list_ch_10_read_addr__din;
  wire edge_list_ch_10_read_addr__full_n;
  wire edge_list_ch_10_read_addr__write;
  wire [511:0] edge_list_ch_10_read_data__dout;
  wire edge_list_ch_10_read_data__empty_n;
  wire edge_list_ch_10_read_data__read;
  wire [63:0] edge_list_ch_10_write_addr__din;
  wire edge_list_ch_10_write_addr__full_n;
  wire edge_list_ch_10_write_addr__write;
  wire [511:0] edge_list_ch_10_write_data__din;
  wire edge_list_ch_10_write_data__full_n;
  wire edge_list_ch_10_write_data__write;
  wire [7:0] edge_list_ch_10_write_resp__dout;
  wire edge_list_ch_10_write_resp__empty_n;
  wire edge_list_ch_10_write_resp__read;
  wire [31:0] read_A_10___rp_time__q0;
  wire read_A_10__ap_start;
  wire read_A_10__ap_ready;
  wire read_A_10__ap_done;
  wire read_A_10__ap_idle;
  wire [31:0] read_A_11___NUM_A_LEN__q0;
  wire [63:0] read_A_11___edge_list_ch_11__q0;
  wire [63:0] edge_list_ch_11_read_addr__din;
  wire edge_list_ch_11_read_addr__full_n;
  wire edge_list_ch_11_read_addr__write;
  wire [511:0] edge_list_ch_11_read_data__dout;
  wire edge_list_ch_11_read_data__empty_n;
  wire edge_list_ch_11_read_data__read;
  wire [63:0] edge_list_ch_11_write_addr__din;
  wire edge_list_ch_11_write_addr__full_n;
  wire edge_list_ch_11_write_addr__write;
  wire [511:0] edge_list_ch_11_write_data__din;
  wire edge_list_ch_11_write_data__full_n;
  wire edge_list_ch_11_write_data__write;
  wire [7:0] edge_list_ch_11_write_resp__dout;
  wire edge_list_ch_11_write_resp__empty_n;
  wire edge_list_ch_11_write_resp__read;
  wire [31:0] read_A_11___rp_time__q0;
  wire read_A_11__ap_start;
  wire read_A_11__ap_ready;
  wire read_A_11__ap_done;
  wire read_A_11__ap_idle;
  wire [31:0] read_A_12___NUM_A_LEN__q0;
  wire [63:0] read_A_12___edge_list_ch_12__q0;
  wire [63:0] edge_list_ch_12_read_addr__din;
  wire edge_list_ch_12_read_addr__full_n;
  wire edge_list_ch_12_read_addr__write;
  wire [511:0] edge_list_ch_12_read_data__dout;
  wire edge_list_ch_12_read_data__empty_n;
  wire edge_list_ch_12_read_data__read;
  wire [63:0] edge_list_ch_12_write_addr__din;
  wire edge_list_ch_12_write_addr__full_n;
  wire edge_list_ch_12_write_addr__write;
  wire [511:0] edge_list_ch_12_write_data__din;
  wire edge_list_ch_12_write_data__full_n;
  wire edge_list_ch_12_write_data__write;
  wire [7:0] edge_list_ch_12_write_resp__dout;
  wire edge_list_ch_12_write_resp__empty_n;
  wire edge_list_ch_12_write_resp__read;
  wire [31:0] read_A_12___rp_time__q0;
  wire read_A_12__ap_start;
  wire read_A_12__ap_ready;
  wire read_A_12__ap_done;
  wire read_A_12__ap_idle;
  wire [31:0] read_A_13___NUM_A_LEN__q0;
  wire [63:0] read_A_13___edge_list_ch_13__q0;
  wire [63:0] edge_list_ch_13_read_addr__din;
  wire edge_list_ch_13_read_addr__full_n;
  wire edge_list_ch_13_read_addr__write;
  wire [511:0] edge_list_ch_13_read_data__dout;
  wire edge_list_ch_13_read_data__empty_n;
  wire edge_list_ch_13_read_data__read;
  wire [63:0] edge_list_ch_13_write_addr__din;
  wire edge_list_ch_13_write_addr__full_n;
  wire edge_list_ch_13_write_addr__write;
  wire [511:0] edge_list_ch_13_write_data__din;
  wire edge_list_ch_13_write_data__full_n;
  wire edge_list_ch_13_write_data__write;
  wire [7:0] edge_list_ch_13_write_resp__dout;
  wire edge_list_ch_13_write_resp__empty_n;
  wire edge_list_ch_13_write_resp__read;
  wire [31:0] read_A_13___rp_time__q0;
  wire read_A_13__ap_start;
  wire read_A_13__ap_ready;
  wire read_A_13__ap_done;
  wire read_A_13__ap_idle;
  wire [31:0] read_A_14___NUM_A_LEN__q0;
  wire [63:0] read_A_14___edge_list_ch_14__q0;
  wire [63:0] edge_list_ch_14_read_addr__din;
  wire edge_list_ch_14_read_addr__full_n;
  wire edge_list_ch_14_read_addr__write;
  wire [511:0] edge_list_ch_14_read_data__dout;
  wire edge_list_ch_14_read_data__empty_n;
  wire edge_list_ch_14_read_data__read;
  wire [63:0] edge_list_ch_14_write_addr__din;
  wire edge_list_ch_14_write_addr__full_n;
  wire edge_list_ch_14_write_addr__write;
  wire [511:0] edge_list_ch_14_write_data__din;
  wire edge_list_ch_14_write_data__full_n;
  wire edge_list_ch_14_write_data__write;
  wire [7:0] edge_list_ch_14_write_resp__dout;
  wire edge_list_ch_14_write_resp__empty_n;
  wire edge_list_ch_14_write_resp__read;
  wire [31:0] read_A_14___rp_time__q0;
  wire read_A_14__ap_start;
  wire read_A_14__ap_ready;
  wire read_A_14__ap_done;
  wire read_A_14__ap_idle;
  wire [31:0] read_A_15___NUM_A_LEN__q0;
  wire [63:0] read_A_15___edge_list_ch_15__q0;
  wire [63:0] edge_list_ch_15_read_addr__din;
  wire edge_list_ch_15_read_addr__full_n;
  wire edge_list_ch_15_read_addr__write;
  wire [511:0] edge_list_ch_15_read_data__dout;
  wire edge_list_ch_15_read_data__empty_n;
  wire edge_list_ch_15_read_data__read;
  wire [63:0] edge_list_ch_15_write_addr__din;
  wire edge_list_ch_15_write_addr__full_n;
  wire edge_list_ch_15_write_addr__write;
  wire [511:0] edge_list_ch_15_write_data__din;
  wire edge_list_ch_15_write_data__full_n;
  wire edge_list_ch_15_write_data__write;
  wire [7:0] edge_list_ch_15_write_resp__dout;
  wire edge_list_ch_15_write_resp__empty_n;
  wire edge_list_ch_15_write_resp__read;
  wire [31:0] read_A_15___rp_time__q0;
  wire read_A_15__ap_start;
  wire read_A_15__ap_ready;
  wire read_A_15__ap_done;
  wire read_A_15__ap_idle;
  wire [31:0] read_digA_0___M__q0;
  wire [31:0] read_digA_0___rp_time__q0;
  wire [63:0] read_digA_0___vec_digA__q0;
  wire [63:0] vec_digA_read_addr__din;
  wire vec_digA_read_addr__full_n;
  wire vec_digA_read_addr__write;
  wire [511:0] vec_digA_read_data__dout;
  wire vec_digA_read_data__empty_n;
  wire vec_digA_read_data__read;
  wire [63:0] vec_digA_write_addr__din;
  wire vec_digA_write_addr__full_n;
  wire vec_digA_write_addr__write;
  wire [511:0] vec_digA_write_data__din;
  wire vec_digA_write_data__full_n;
  wire vec_digA_write_data__write;
  wire [7:0] vec_digA_write_resp__dout;
  wire vec_digA_write_resp__empty_n;
  wire vec_digA_write_resp__read;
  wire read_digA_0__ap_start;
  wire read_digA_0__ap_ready;
  wire read_digA_0__ap_done;
  wire read_digA_0__ap_idle;
  wire [31:0] read_edge_list_ptr_0___M__q0;
  wire [31:0] read_edge_list_ptr_0___NUM_ITE__q0;
  wire [63:0] read_edge_list_ptr_0___edge_list_ptr__q0;
  wire [63:0] edge_list_ptr_read_addr__din;
  wire edge_list_ptr_read_addr__full_n;
  wire edge_list_ptr_read_addr__write;
  wire [31:0] edge_list_ptr_read_data__dout;
  wire edge_list_ptr_read_data__empty_n;
  wire edge_list_ptr_read_data__read;
  wire [63:0] edge_list_ptr_write_addr__din;
  wire edge_list_ptr_write_addr__full_n;
  wire edge_list_ptr_write_addr__write;
  wire [31:0] edge_list_ptr_write_data__din;
  wire edge_list_ptr_write_data__full_n;
  wire edge_list_ptr_write_data__write;
  wire [7:0] edge_list_ptr_write_resp__dout;
  wire edge_list_ptr_write_resp__empty_n;
  wire edge_list_ptr_write_resp__read;
  wire [31:0] read_edge_list_ptr_0___rp_time__q0;
  wire read_edge_list_ptr_0__ap_start;
  wire read_edge_list_ptr_0__ap_ready;
  wire read_edge_list_ptr_0__ap_done;
  wire read_edge_list_ptr_0__ap_idle;
  wire term_signal_router_0__ap_start;
  wire [31:0] updt_p_0___M__q0;
  wire [31:0] updt_p_0___rp_time__q0;
  wire updt_p_0__ap_start;
  wire updt_p_0__ap_ready;
  wire updt_p_0__ap_done;
  wire updt_p_0__ap_idle;
  wire [31:0] updt_r_0___M__q0;
  wire [31:0] updt_r_0___rp_time__q0;
  wire updt_r_0__ap_start;
  wire updt_r_0__ap_ready;
  wire updt_r_0__ap_done;
  wire updt_r_0__ap_idle;
  wire [31:0] updt_x_0___M__q0;
  wire [31:0] updt_x_0___rp_time__q0;
  wire updt_x_0__ap_start;
  wire updt_x_0__ap_ready;
  wire updt_x_0__ap_done;
  wire updt_x_0__ap_idle;
  wire [31:0] vecp_mux_0___M__q0;
  wire [31:0] vecp_mux_0___rp_time__q0;
  wire vecp_mux_0__ap_start;
  wire vecp_mux_0__ap_ready;
  wire vecp_mux_0__ap_done;
  wire vecp_mux_0__ap_idle;
  wire [31:0] wr_r_0___rp_time__q0;
  wire [63:0] wr_r_0___vec_res__q0;
  wire [63:0] vec_res_read_addr__din;
  wire vec_res_read_addr__full_n;
  wire vec_res_read_addr__write;
  wire [63:0] vec_res_read_data__dout;
  wire vec_res_read_data__empty_n;
  wire vec_res_read_data__read;
  wire [63:0] vec_res_write_addr__din;
  wire vec_res_write_addr__full_n;
  wire vec_res_write_addr__write;
  wire [63:0] vec_res_write_data__din;
  wire vec_res_write_data__full_n;
  wire vec_res_write_data__write;
  wire [7:0] vec_res_write_resp__dout;
  wire vec_res_write_resp__empty_n;
  wire vec_res_write_resp__read;
  wire wr_r_0__ap_start;
  wire wr_r_0__ap_ready;
  wire wr_r_0__ap_done;
  wire wr_r_0__ap_idle;
  wire ap_rst_n_inv;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;

  Callipepla_control_s_axi
  #(
    .C_S_AXI_ADDR_WIDTH(C_S_AXI_CONTROL_ADDR_WIDTH),
    .C_S_AXI_DATA_WIDTH(C_S_AXI_CONTROL_DATA_WIDTH)
  )
  control_s_axi_U
  (
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .edge_list_ptr(edge_list_ptr),
    .edge_list_ch_0(edge_list_ch_0),
    .edge_list_ch_1(edge_list_ch_1),
    .edge_list_ch_2(edge_list_ch_2),
    .edge_list_ch_3(edge_list_ch_3),
    .edge_list_ch_4(edge_list_ch_4),
    .edge_list_ch_5(edge_list_ch_5),
    .edge_list_ch_6(edge_list_ch_6),
    .edge_list_ch_7(edge_list_ch_7),
    .edge_list_ch_8(edge_list_ch_8),
    .edge_list_ch_9(edge_list_ch_9),
    .edge_list_ch_10(edge_list_ch_10),
    .edge_list_ch_11(edge_list_ch_11),
    .edge_list_ch_12(edge_list_ch_12),
    .edge_list_ch_13(edge_list_ch_13),
    .edge_list_ch_14(edge_list_ch_14),
    .edge_list_ch_15(edge_list_ch_15),
    .vec_x_0(vec_x_0),
    .vec_x_1(vec_x_1),
    .vec_p_0(vec_p_0),
    .vec_p_1(vec_p_1),
    .vec_Ap(vec_Ap),
    .vec_r_0(vec_r_0),
    .vec_r_1(vec_r_1),
    .vec_digA(vec_digA),
    .vec_res(vec_res),
    .NUM_ITE(NUM_ITE),
    .NUM_A_LEN(NUM_A_LEN),
    .M(M),
    .rp_time(rp_time),
    .th_termination(th_termination),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_0__dout),
    .if_empty_n(PE_inst_Callipepla_0__empty_n),
    .if_read(PE_inst_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_0__din),
    .if_full_n(PE_inst_Callipepla_0__full_n),
    .if_write(PE_inst_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_10__dout),
    .if_empty_n(PE_inst_Callipepla_10__empty_n),
    .if_read(PE_inst_Callipepla_10__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_10__din),
    .if_full_n(PE_inst_Callipepla_10__full_n),
    .if_write(PE_inst_Callipepla_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_11__dout),
    .if_empty_n(PE_inst_Callipepla_11__empty_n),
    .if_read(PE_inst_Callipepla_11__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_11__din),
    .if_full_n(PE_inst_Callipepla_11__full_n),
    .if_write(PE_inst_Callipepla_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_12__dout),
    .if_empty_n(PE_inst_Callipepla_12__empty_n),
    .if_read(PE_inst_Callipepla_12__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_12__din),
    .if_full_n(PE_inst_Callipepla_12__full_n),
    .if_write(PE_inst_Callipepla_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_13__dout),
    .if_empty_n(PE_inst_Callipepla_13__empty_n),
    .if_read(PE_inst_Callipepla_13__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_13__din),
    .if_full_n(PE_inst_Callipepla_13__full_n),
    .if_write(PE_inst_Callipepla_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_14__dout),
    .if_empty_n(PE_inst_Callipepla_14__empty_n),
    .if_read(PE_inst_Callipepla_14__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_14__din),
    .if_full_n(PE_inst_Callipepla_14__full_n),
    .if_write(PE_inst_Callipepla_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_15__dout),
    .if_empty_n(PE_inst_Callipepla_15__empty_n),
    .if_read(PE_inst_Callipepla_15__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_15__din),
    .if_full_n(PE_inst_Callipepla_15__full_n),
    .if_write(PE_inst_Callipepla_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_16__dout),
    .if_empty_n(PE_inst_Callipepla_16__empty_n),
    .if_read(PE_inst_Callipepla_16__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_16__din),
    .if_full_n(PE_inst_Callipepla_16__full_n),
    .if_write(PE_inst_Callipepla_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_1__dout),
    .if_empty_n(PE_inst_Callipepla_1__empty_n),
    .if_read(PE_inst_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_1__din),
    .if_full_n(PE_inst_Callipepla_1__full_n),
    .if_write(PE_inst_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_2__dout),
    .if_empty_n(PE_inst_Callipepla_2__empty_n),
    .if_read(PE_inst_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_2__din),
    .if_full_n(PE_inst_Callipepla_2__full_n),
    .if_write(PE_inst_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_3__dout),
    .if_empty_n(PE_inst_Callipepla_3__empty_n),
    .if_read(PE_inst_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_3__din),
    .if_full_n(PE_inst_Callipepla_3__full_n),
    .if_write(PE_inst_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_4__dout),
    .if_empty_n(PE_inst_Callipepla_4__empty_n),
    .if_read(PE_inst_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_4__din),
    .if_full_n(PE_inst_Callipepla_4__full_n),
    .if_write(PE_inst_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_5__dout),
    .if_empty_n(PE_inst_Callipepla_5__empty_n),
    .if_read(PE_inst_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_5__din),
    .if_full_n(PE_inst_Callipepla_5__full_n),
    .if_write(PE_inst_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_6__dout),
    .if_empty_n(PE_inst_Callipepla_6__empty_n),
    .if_read(PE_inst_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_6__din),
    .if_full_n(PE_inst_Callipepla_6__full_n),
    .if_write(PE_inst_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_7__dout),
    .if_empty_n(PE_inst_Callipepla_7__empty_n),
    .if_read(PE_inst_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_7__din),
    .if_full_n(PE_inst_Callipepla_7__full_n),
    .if_write(PE_inst_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_8__dout),
    .if_empty_n(PE_inst_Callipepla_8__empty_n),
    .if_read(PE_inst_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_8__din),
    .if_full_n(PE_inst_Callipepla_8__full_n),
    .if_write(PE_inst_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Callipepla_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Callipepla_9__dout),
    .if_empty_n(PE_inst_Callipepla_9__empty_n),
    .if_read(PE_inst_Callipepla_9__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Callipepla_9__din),
    .if_full_n(PE_inst_Callipepla_9__full_n),
    .if_write(PE_inst_Callipepla_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_0__dout),
    .if_empty_n(Yvec_inst_Callipepla_0__empty_n),
    .if_read(Yvec_inst_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_0__din),
    .if_full_n(Yvec_inst_Callipepla_0__full_n),
    .if_write(Yvec_inst_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_10__dout),
    .if_empty_n(Yvec_inst_Callipepla_10__empty_n),
    .if_read(Yvec_inst_Callipepla_10__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_10__din),
    .if_full_n(Yvec_inst_Callipepla_10__full_n),
    .if_write(Yvec_inst_Callipepla_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_11__dout),
    .if_empty_n(Yvec_inst_Callipepla_11__empty_n),
    .if_read(Yvec_inst_Callipepla_11__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_11__din),
    .if_full_n(Yvec_inst_Callipepla_11__full_n),
    .if_write(Yvec_inst_Callipepla_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_12__dout),
    .if_empty_n(Yvec_inst_Callipepla_12__empty_n),
    .if_read(Yvec_inst_Callipepla_12__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_12__din),
    .if_full_n(Yvec_inst_Callipepla_12__full_n),
    .if_write(Yvec_inst_Callipepla_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_13__dout),
    .if_empty_n(Yvec_inst_Callipepla_13__empty_n),
    .if_read(Yvec_inst_Callipepla_13__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_13__din),
    .if_full_n(Yvec_inst_Callipepla_13__full_n),
    .if_write(Yvec_inst_Callipepla_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_14__dout),
    .if_empty_n(Yvec_inst_Callipepla_14__empty_n),
    .if_read(Yvec_inst_Callipepla_14__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_14__din),
    .if_full_n(Yvec_inst_Callipepla_14__full_n),
    .if_write(Yvec_inst_Callipepla_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_15__dout),
    .if_empty_n(Yvec_inst_Callipepla_15__empty_n),
    .if_read(Yvec_inst_Callipepla_15__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_15__din),
    .if_full_n(Yvec_inst_Callipepla_15__full_n),
    .if_write(Yvec_inst_Callipepla_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_1__dout),
    .if_empty_n(Yvec_inst_Callipepla_1__empty_n),
    .if_read(Yvec_inst_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_1__din),
    .if_full_n(Yvec_inst_Callipepla_1__full_n),
    .if_write(Yvec_inst_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_2__dout),
    .if_empty_n(Yvec_inst_Callipepla_2__empty_n),
    .if_read(Yvec_inst_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_2__din),
    .if_full_n(Yvec_inst_Callipepla_2__full_n),
    .if_write(Yvec_inst_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_3__dout),
    .if_empty_n(Yvec_inst_Callipepla_3__empty_n),
    .if_read(Yvec_inst_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_3__din),
    .if_full_n(Yvec_inst_Callipepla_3__full_n),
    .if_write(Yvec_inst_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_4__dout),
    .if_empty_n(Yvec_inst_Callipepla_4__empty_n),
    .if_read(Yvec_inst_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_4__din),
    .if_full_n(Yvec_inst_Callipepla_4__full_n),
    .if_write(Yvec_inst_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_5__dout),
    .if_empty_n(Yvec_inst_Callipepla_5__empty_n),
    .if_read(Yvec_inst_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_5__din),
    .if_full_n(Yvec_inst_Callipepla_5__full_n),
    .if_write(Yvec_inst_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_6__dout),
    .if_empty_n(Yvec_inst_Callipepla_6__empty_n),
    .if_read(Yvec_inst_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_6__din),
    .if_full_n(Yvec_inst_Callipepla_6__full_n),
    .if_write(Yvec_inst_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_7__dout),
    .if_empty_n(Yvec_inst_Callipepla_7__empty_n),
    .if_read(Yvec_inst_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_7__din),
    .if_full_n(Yvec_inst_Callipepla_7__full_n),
    .if_write(Yvec_inst_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_8__dout),
    .if_empty_n(Yvec_inst_Callipepla_8__empty_n),
    .if_read(Yvec_inst_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_8__din),
    .if_full_n(Yvec_inst_Callipepla_8__full_n),
    .if_write(Yvec_inst_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Callipepla_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Callipepla_9__dout),
    .if_empty_n(Yvec_inst_Callipepla_9__empty_n),
    .if_read(Yvec_inst_Callipepla_9__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Callipepla_9__din),
    .if_full_n(Yvec_inst_Callipepla_9__full_n),
    .if_write(Yvec_inst_Callipepla_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_AP_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_AP_Callipepla__dout),
    .if_empty_n(fifo_AP_Callipepla__empty_n),
    .if_read(fifo_AP_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_AP_Callipepla__din),
    .if_full_n(fifo_AP_Callipepla__full_n),
    .if_write(fifo_AP_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_AP_M1_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_AP_M1_Callipepla_0__dout),
    .if_empty_n(fifo_AP_M1_Callipepla_0__empty_n),
    .if_read(fifo_AP_M1_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_AP_M1_Callipepla_0__din),
    .if_full_n(fifo_AP_M1_Callipepla_0__full_n),
    .if_write(fifo_AP_M1_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_AP_M1_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_AP_M1_Callipepla_1__dout),
    .if_empty_n(fifo_AP_M1_Callipepla_1__empty_n),
    .if_read(fifo_AP_M1_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_AP_M1_Callipepla_1__din),
    .if_full_n(fifo_AP_M1_Callipepla_1__full_n),
    .if_write(fifo_AP_M1_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_0__dout),
    .if_empty_n(fifo_A_Callipepla_0__empty_n),
    .if_read(fifo_A_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_0__din),
    .if_full_n(fifo_A_Callipepla_0__full_n),
    .if_write(fifo_A_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_10__dout),
    .if_empty_n(fifo_A_Callipepla_10__empty_n),
    .if_read(fifo_A_Callipepla_10__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_10__din),
    .if_full_n(fifo_A_Callipepla_10__full_n),
    .if_write(fifo_A_Callipepla_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_11__dout),
    .if_empty_n(fifo_A_Callipepla_11__empty_n),
    .if_read(fifo_A_Callipepla_11__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_11__din),
    .if_full_n(fifo_A_Callipepla_11__full_n),
    .if_write(fifo_A_Callipepla_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_12__dout),
    .if_empty_n(fifo_A_Callipepla_12__empty_n),
    .if_read(fifo_A_Callipepla_12__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_12__din),
    .if_full_n(fifo_A_Callipepla_12__full_n),
    .if_write(fifo_A_Callipepla_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_13__dout),
    .if_empty_n(fifo_A_Callipepla_13__empty_n),
    .if_read(fifo_A_Callipepla_13__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_13__din),
    .if_full_n(fifo_A_Callipepla_13__full_n),
    .if_write(fifo_A_Callipepla_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_14__dout),
    .if_empty_n(fifo_A_Callipepla_14__empty_n),
    .if_read(fifo_A_Callipepla_14__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_14__din),
    .if_full_n(fifo_A_Callipepla_14__full_n),
    .if_write(fifo_A_Callipepla_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_15__dout),
    .if_empty_n(fifo_A_Callipepla_15__empty_n),
    .if_read(fifo_A_Callipepla_15__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_15__din),
    .if_full_n(fifo_A_Callipepla_15__full_n),
    .if_write(fifo_A_Callipepla_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_1__dout),
    .if_empty_n(fifo_A_Callipepla_1__empty_n),
    .if_read(fifo_A_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_1__din),
    .if_full_n(fifo_A_Callipepla_1__full_n),
    .if_write(fifo_A_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_2__dout),
    .if_empty_n(fifo_A_Callipepla_2__empty_n),
    .if_read(fifo_A_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_2__din),
    .if_full_n(fifo_A_Callipepla_2__full_n),
    .if_write(fifo_A_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_3__dout),
    .if_empty_n(fifo_A_Callipepla_3__empty_n),
    .if_read(fifo_A_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_3__din),
    .if_full_n(fifo_A_Callipepla_3__full_n),
    .if_write(fifo_A_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_4__dout),
    .if_empty_n(fifo_A_Callipepla_4__empty_n),
    .if_read(fifo_A_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_4__din),
    .if_full_n(fifo_A_Callipepla_4__full_n),
    .if_write(fifo_A_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_5__dout),
    .if_empty_n(fifo_A_Callipepla_5__empty_n),
    .if_read(fifo_A_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_5__din),
    .if_full_n(fifo_A_Callipepla_5__full_n),
    .if_write(fifo_A_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_6__dout),
    .if_empty_n(fifo_A_Callipepla_6__empty_n),
    .if_read(fifo_A_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_6__din),
    .if_full_n(fifo_A_Callipepla_6__full_n),
    .if_write(fifo_A_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_7__dout),
    .if_empty_n(fifo_A_Callipepla_7__empty_n),
    .if_read(fifo_A_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_7__din),
    .if_full_n(fifo_A_Callipepla_7__full_n),
    .if_write(fifo_A_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_8__dout),
    .if_empty_n(fifo_A_Callipepla_8__empty_n),
    .if_read(fifo_A_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_8__din),
    .if_full_n(fifo_A_Callipepla_8__full_n),
    .if_write(fifo_A_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Callipepla_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Callipepla_9__dout),
    .if_empty_n(fifo_A_Callipepla_9__empty_n),
    .if_read(fifo_A_Callipepla_9__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Callipepla_9__din),
    .if_full_n(fifo_A_Callipepla_9__full_n),
    .if_write(fifo_A_Callipepla_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_dot_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_dot_Callipepla__dout),
    .if_empty_n(fifo_P_dot_Callipepla__empty_n),
    .if_read(fifo_P_dot_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_dot_Callipepla__din),
    .if_full_n(fifo_P_dot_Callipepla__full_n),
    .if_write(fifo_P_dot_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_from_mem_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_from_mem_Callipepla__dout),
    .if_empty_n(fifo_P_from_mem_Callipepla__empty_n),
    .if_read(fifo_P_from_mem_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_from_mem_Callipepla__din),
    .if_full_n(fifo_P_from_mem_Callipepla__full_n),
    .if_write(fifo_P_from_mem_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_0__dout),
    .if_empty_n(fifo_P_pe_Callipepla_0__empty_n),
    .if_read(fifo_P_pe_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_0__din),
    .if_full_n(fifo_P_pe_Callipepla_0__full_n),
    .if_write(fifo_P_pe_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_10__dout),
    .if_empty_n(fifo_P_pe_Callipepla_10__empty_n),
    .if_read(fifo_P_pe_Callipepla_10__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_10__din),
    .if_full_n(fifo_P_pe_Callipepla_10__full_n),
    .if_write(fifo_P_pe_Callipepla_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_11__dout),
    .if_empty_n(fifo_P_pe_Callipepla_11__empty_n),
    .if_read(fifo_P_pe_Callipepla_11__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_11__din),
    .if_full_n(fifo_P_pe_Callipepla_11__full_n),
    .if_write(fifo_P_pe_Callipepla_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_12__dout),
    .if_empty_n(fifo_P_pe_Callipepla_12__empty_n),
    .if_read(fifo_P_pe_Callipepla_12__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_12__din),
    .if_full_n(fifo_P_pe_Callipepla_12__full_n),
    .if_write(fifo_P_pe_Callipepla_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_13__dout),
    .if_empty_n(fifo_P_pe_Callipepla_13__empty_n),
    .if_read(fifo_P_pe_Callipepla_13__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_13__din),
    .if_full_n(fifo_P_pe_Callipepla_13__full_n),
    .if_write(fifo_P_pe_Callipepla_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_14__dout),
    .if_empty_n(fifo_P_pe_Callipepla_14__empty_n),
    .if_read(fifo_P_pe_Callipepla_14__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_14__din),
    .if_full_n(fifo_P_pe_Callipepla_14__full_n),
    .if_write(fifo_P_pe_Callipepla_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_15__dout),
    .if_empty_n(fifo_P_pe_Callipepla_15__empty_n),
    .if_read(fifo_P_pe_Callipepla_15__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_15__din),
    .if_full_n(fifo_P_pe_Callipepla_15__full_n),
    .if_write(fifo_P_pe_Callipepla_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_16__dout),
    .if_empty_n(fifo_P_pe_Callipepla_16__empty_n),
    .if_read(fifo_P_pe_Callipepla_16__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_16__din),
    .if_full_n(fifo_P_pe_Callipepla_16__full_n),
    .if_write(fifo_P_pe_Callipepla_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_1__dout),
    .if_empty_n(fifo_P_pe_Callipepla_1__empty_n),
    .if_read(fifo_P_pe_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_1__din),
    .if_full_n(fifo_P_pe_Callipepla_1__full_n),
    .if_write(fifo_P_pe_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_2__dout),
    .if_empty_n(fifo_P_pe_Callipepla_2__empty_n),
    .if_read(fifo_P_pe_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_2__din),
    .if_full_n(fifo_P_pe_Callipepla_2__full_n),
    .if_write(fifo_P_pe_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_3__dout),
    .if_empty_n(fifo_P_pe_Callipepla_3__empty_n),
    .if_read(fifo_P_pe_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_3__din),
    .if_full_n(fifo_P_pe_Callipepla_3__full_n),
    .if_write(fifo_P_pe_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_4__dout),
    .if_empty_n(fifo_P_pe_Callipepla_4__empty_n),
    .if_read(fifo_P_pe_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_4__din),
    .if_full_n(fifo_P_pe_Callipepla_4__full_n),
    .if_write(fifo_P_pe_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_5__dout),
    .if_empty_n(fifo_P_pe_Callipepla_5__empty_n),
    .if_read(fifo_P_pe_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_5__din),
    .if_full_n(fifo_P_pe_Callipepla_5__full_n),
    .if_write(fifo_P_pe_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_6__dout),
    .if_empty_n(fifo_P_pe_Callipepla_6__empty_n),
    .if_read(fifo_P_pe_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_6__din),
    .if_full_n(fifo_P_pe_Callipepla_6__full_n),
    .if_write(fifo_P_pe_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_7__dout),
    .if_empty_n(fifo_P_pe_Callipepla_7__empty_n),
    .if_read(fifo_P_pe_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_7__din),
    .if_full_n(fifo_P_pe_Callipepla_7__full_n),
    .if_write(fifo_P_pe_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_8__dout),
    .if_empty_n(fifo_P_pe_Callipepla_8__empty_n),
    .if_read(fifo_P_pe_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_8__din),
    .if_full_n(fifo_P_pe_Callipepla_8__full_n),
    .if_write(fifo_P_pe_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_pe_Callipepla_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_pe_Callipepla_9__dout),
    .if_empty_n(fifo_P_pe_Callipepla_9__empty_n),
    .if_read(fifo_P_pe_Callipepla_9__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_pe_Callipepla_9__din),
    .if_full_n(fifo_P_pe_Callipepla_9__full_n),
    .if_write(fifo_P_pe_Callipepla_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_to_dup_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_to_dup_Callipepla__dout),
    .if_empty_n(fifo_P_to_dup_Callipepla__empty_n),
    .if_read(fifo_P_to_dup_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_to_dup_Callipepla__din),
    .if_full_n(fifo_P_to_dup_Callipepla__full_n),
    .if_write(fifo_P_to_dup_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_to_mux_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_to_mux_Callipepla__dout),
    .if_empty_n(fifo_P_to_mux_Callipepla__empty_n),
    .if_read(fifo_P_to_mux_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_to_mux_Callipepla__din),
    .if_full_n(fifo_P_to_mux_Callipepla__full_n),
    .if_write(fifo_P_to_mux_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_updated_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_updated_Callipepla__dout),
    .if_empty_n(fifo_P_updated_Callipepla__empty_n),
    .if_read(fifo_P_updated_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_updated_Callipepla__din),
    .if_full_n(fifo_P_updated_Callipepla__full_n),
    .if_write(fifo_P_updated_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_updtp_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_updtp_Callipepla__dout),
    .if_empty_n(fifo_P_updtp_Callipepla__empty_n),
    .if_read(fifo_P_updtp_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_updtp_Callipepla__din),
    .if_full_n(fifo_P_updtp_Callipepla__full_n),
    .if_write(fifo_P_updtp_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_P_updtx_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_P_updtx_Callipepla__dout),
    .if_empty_n(fifo_P_updtx_Callipepla__empty_n),
    .if_read(fifo_P_updtx_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_P_updtx_Callipepla__din),
    .if_full_n(fifo_P_updtx_Callipepla__full_n),
    .if_write(fifo_P_updtx_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(66),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_RR_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_RR_Callipepla__dout),
    .if_empty_n(fifo_RR_Callipepla__empty_n),
    .if_read(fifo_RR_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_RR_Callipepla__din),
    .if_full_n(fifo_RR_Callipepla__full_n),
    .if_write(fifo_RR_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_R_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_R_Callipepla__dout),
    .if_empty_n(fifo_R_Callipepla__empty_n),
    .if_read(fifo_R_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_R_Callipepla__din),
    .if_full_n(fifo_R_Callipepla__full_n),
    .if_write(fifo_R_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_R_tomem_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_R_tomem_Callipepla__dout),
    .if_empty_n(fifo_R_tomem_Callipepla__empty_n),
    .if_read(fifo_R_tomem_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_R_tomem_Callipepla__din),
    .if_full_n(fifo_R_tomem_Callipepla__full_n),
    .if_write(fifo_R_tomem_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_R_updtd_m5_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_R_updtd_m5_Callipepla__dout),
    .if_empty_n(fifo_R_updtd_m5_Callipepla__empty_n),
    .if_read(fifo_R_updtd_m5_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_R_updtd_m5_Callipepla__din),
    .if_full_n(fifo_R_updtd_m5_Callipepla__full_n),
    .if_write(fifo_R_updtd_m5_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(6),
    .DEPTH(50)
  )
  fifo_R_updtd_m6_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_R_updtd_m6_Callipepla__dout),
    .if_empty_n(fifo_R_updtd_m6_Callipepla__empty_n),
    .if_read(fifo_R_updtd_m6_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_R_updtd_m6_Callipepla__din),
    .if_full_n(fifo_R_updtd_m6_Callipepla__full_n),
    .if_write(fifo_R_updtd_m6_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_R_updtd_rr_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_R_updtd_rr_Callipepla__dout),
    .if_empty_n(fifo_R_updtd_rr_Callipepla__empty_n),
    .if_read(fifo_R_updtd_rr_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_R_updtd_rr_Callipepla__din),
    .if_full_n(fifo_R_updtd_rr_Callipepla__full_n),
    .if_write(fifo_R_updtd_rr_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_Callipepla__dout),
    .if_empty_n(fifo_X_Callipepla__empty_n),
    .if_read(fifo_X_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_Callipepla__din),
    .if_full_n(fifo_X_Callipepla__full_n),
    .if_write(fifo_X_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_updated_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_updated_Callipepla__dout),
    .if_empty_n(fifo_X_updated_Callipepla__empty_n),
    .if_read(fifo_X_updated_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_updated_Callipepla__din),
    .if_full_n(fifo_X_updated_Callipepla__full_n),
    .if_write(fifo_X_updated_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_0__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_0__empty_n),
    .if_read(fifo_Y_pe_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_0__din),
    .if_full_n(fifo_Y_pe_Callipepla_0__full_n),
    .if_write(fifo_Y_pe_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_10__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_10__empty_n),
    .if_read(fifo_Y_pe_Callipepla_10__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_10__din),
    .if_full_n(fifo_Y_pe_Callipepla_10__full_n),
    .if_write(fifo_Y_pe_Callipepla_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_11__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_11__empty_n),
    .if_read(fifo_Y_pe_Callipepla_11__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_11__din),
    .if_full_n(fifo_Y_pe_Callipepla_11__full_n),
    .if_write(fifo_Y_pe_Callipepla_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_12__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_12__empty_n),
    .if_read(fifo_Y_pe_Callipepla_12__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_12__din),
    .if_full_n(fifo_Y_pe_Callipepla_12__full_n),
    .if_write(fifo_Y_pe_Callipepla_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_13__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_13__empty_n),
    .if_read(fifo_Y_pe_Callipepla_13__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_13__din),
    .if_full_n(fifo_Y_pe_Callipepla_13__full_n),
    .if_write(fifo_Y_pe_Callipepla_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_14__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_14__empty_n),
    .if_read(fifo_Y_pe_Callipepla_14__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_14__din),
    .if_full_n(fifo_Y_pe_Callipepla_14__full_n),
    .if_write(fifo_Y_pe_Callipepla_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_15__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_15__empty_n),
    .if_read(fifo_Y_pe_Callipepla_15__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_15__din),
    .if_full_n(fifo_Y_pe_Callipepla_15__full_n),
    .if_write(fifo_Y_pe_Callipepla_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_1__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_1__empty_n),
    .if_read(fifo_Y_pe_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_1__din),
    .if_full_n(fifo_Y_pe_Callipepla_1__full_n),
    .if_write(fifo_Y_pe_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_2__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_2__empty_n),
    .if_read(fifo_Y_pe_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_2__din),
    .if_full_n(fifo_Y_pe_Callipepla_2__full_n),
    .if_write(fifo_Y_pe_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_3__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_3__empty_n),
    .if_read(fifo_Y_pe_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_3__din),
    .if_full_n(fifo_Y_pe_Callipepla_3__full_n),
    .if_write(fifo_Y_pe_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_4__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_4__empty_n),
    .if_read(fifo_Y_pe_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_4__din),
    .if_full_n(fifo_Y_pe_Callipepla_4__full_n),
    .if_write(fifo_Y_pe_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_5__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_5__empty_n),
    .if_read(fifo_Y_pe_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_5__din),
    .if_full_n(fifo_Y_pe_Callipepla_5__full_n),
    .if_write(fifo_Y_pe_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_6__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_6__empty_n),
    .if_read(fifo_Y_pe_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_6__din),
    .if_full_n(fifo_Y_pe_Callipepla_6__full_n),
    .if_write(fifo_Y_pe_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_7__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_7__empty_n),
    .if_read(fifo_Y_pe_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_7__din),
    .if_full_n(fifo_Y_pe_Callipepla_7__full_n),
    .if_write(fifo_Y_pe_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_8__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_8__empty_n),
    .if_read(fifo_Y_pe_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_8__din),
    .if_full_n(fifo_Y_pe_Callipepla_8__full_n),
    .if_write(fifo_Y_pe_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Callipepla_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Callipepla_9__dout),
    .if_empty_n(fifo_Y_pe_Callipepla_9__empty_n),
    .if_read(fifo_Y_pe_Callipepla_9__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Callipepla_9__din),
    .if_full_n(fifo_Y_pe_Callipepla_9__full_n),
    .if_write(fifo_Y_pe_Callipepla_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Callipepla_0__dout),
    .if_empty_n(fifo_Y_pe_abd_Callipepla_0__empty_n),
    .if_read(fifo_Y_pe_abd_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Callipepla_0__din),
    .if_full_n(fifo_Y_pe_abd_Callipepla_0__full_n),
    .if_write(fifo_Y_pe_abd_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Callipepla_1__dout),
    .if_empty_n(fifo_Y_pe_abd_Callipepla_1__empty_n),
    .if_read(fifo_Y_pe_abd_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Callipepla_1__din),
    .if_full_n(fifo_Y_pe_abd_Callipepla_1__full_n),
    .if_write(fifo_Y_pe_abd_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Callipepla_2__dout),
    .if_empty_n(fifo_Y_pe_abd_Callipepla_2__empty_n),
    .if_read(fifo_Y_pe_abd_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Callipepla_2__din),
    .if_full_n(fifo_Y_pe_abd_Callipepla_2__full_n),
    .if_write(fifo_Y_pe_abd_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Callipepla_3__dout),
    .if_empty_n(fifo_Y_pe_abd_Callipepla_3__empty_n),
    .if_read(fifo_Y_pe_abd_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Callipepla_3__din),
    .if_full_n(fifo_Y_pe_abd_Callipepla_3__full_n),
    .if_write(fifo_Y_pe_abd_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Callipepla_4__dout),
    .if_empty_n(fifo_Y_pe_abd_Callipepla_4__empty_n),
    .if_read(fifo_Y_pe_abd_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Callipepla_4__din),
    .if_full_n(fifo_Y_pe_abd_Callipepla_4__full_n),
    .if_write(fifo_Y_pe_abd_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Callipepla_5__dout),
    .if_empty_n(fifo_Y_pe_abd_Callipepla_5__empty_n),
    .if_read(fifo_Y_pe_abd_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Callipepla_5__din),
    .if_full_n(fifo_Y_pe_abd_Callipepla_5__full_n),
    .if_write(fifo_Y_pe_abd_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Callipepla_6__dout),
    .if_empty_n(fifo_Y_pe_abd_Callipepla_6__empty_n),
    .if_read(fifo_Y_pe_abd_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Callipepla_6__din),
    .if_full_n(fifo_Y_pe_abd_Callipepla_6__full_n),
    .if_write(fifo_Y_pe_abd_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Callipepla_7__dout),
    .if_empty_n(fifo_Y_pe_abd_Callipepla_7__empty_n),
    .if_read(fifo_Y_pe_abd_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Callipepla_7__din),
    .if_full_n(fifo_Y_pe_abd_Callipepla_7__full_n),
    .if_write(fifo_Y_pe_abd_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Z_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Z_Callipepla_0__dout),
    .if_empty_n(fifo_Z_Callipepla_0__empty_n),
    .if_read(fifo_Z_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Z_Callipepla_0__din),
    .if_full_n(fifo_Z_Callipepla_0__full_n),
    .if_write(fifo_Z_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Z_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Z_Callipepla_1__dout),
    .if_empty_n(fifo_Z_Callipepla_1__empty_n),
    .if_read(fifo_Z_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Z_Callipepla_1__din),
    .if_full_n(fifo_Z_Callipepla_1__full_n),
    .if_write(fifo_Z_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_0__dout),
    .if_empty_n(fifo_aXvec_Callipepla_0__empty_n),
    .if_read(fifo_aXvec_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_0__din),
    .if_full_n(fifo_aXvec_Callipepla_0__full_n),
    .if_write(fifo_aXvec_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_10__dout),
    .if_empty_n(fifo_aXvec_Callipepla_10__empty_n),
    .if_read(fifo_aXvec_Callipepla_10__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_10__din),
    .if_full_n(fifo_aXvec_Callipepla_10__full_n),
    .if_write(fifo_aXvec_Callipepla_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_11__dout),
    .if_empty_n(fifo_aXvec_Callipepla_11__empty_n),
    .if_read(fifo_aXvec_Callipepla_11__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_11__din),
    .if_full_n(fifo_aXvec_Callipepla_11__full_n),
    .if_write(fifo_aXvec_Callipepla_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_12__dout),
    .if_empty_n(fifo_aXvec_Callipepla_12__empty_n),
    .if_read(fifo_aXvec_Callipepla_12__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_12__din),
    .if_full_n(fifo_aXvec_Callipepla_12__full_n),
    .if_write(fifo_aXvec_Callipepla_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_13__dout),
    .if_empty_n(fifo_aXvec_Callipepla_13__empty_n),
    .if_read(fifo_aXvec_Callipepla_13__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_13__din),
    .if_full_n(fifo_aXvec_Callipepla_13__full_n),
    .if_write(fifo_aXvec_Callipepla_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_14__dout),
    .if_empty_n(fifo_aXvec_Callipepla_14__empty_n),
    .if_read(fifo_aXvec_Callipepla_14__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_14__din),
    .if_full_n(fifo_aXvec_Callipepla_14__full_n),
    .if_write(fifo_aXvec_Callipepla_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_15__dout),
    .if_empty_n(fifo_aXvec_Callipepla_15__empty_n),
    .if_read(fifo_aXvec_Callipepla_15__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_15__din),
    .if_full_n(fifo_aXvec_Callipepla_15__full_n),
    .if_write(fifo_aXvec_Callipepla_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_1__dout),
    .if_empty_n(fifo_aXvec_Callipepla_1__empty_n),
    .if_read(fifo_aXvec_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_1__din),
    .if_full_n(fifo_aXvec_Callipepla_1__full_n),
    .if_write(fifo_aXvec_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_2__dout),
    .if_empty_n(fifo_aXvec_Callipepla_2__empty_n),
    .if_read(fifo_aXvec_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_2__din),
    .if_full_n(fifo_aXvec_Callipepla_2__full_n),
    .if_write(fifo_aXvec_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_3__dout),
    .if_empty_n(fifo_aXvec_Callipepla_3__empty_n),
    .if_read(fifo_aXvec_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_3__din),
    .if_full_n(fifo_aXvec_Callipepla_3__full_n),
    .if_write(fifo_aXvec_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_4__dout),
    .if_empty_n(fifo_aXvec_Callipepla_4__empty_n),
    .if_read(fifo_aXvec_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_4__din),
    .if_full_n(fifo_aXvec_Callipepla_4__full_n),
    .if_write(fifo_aXvec_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_5__dout),
    .if_empty_n(fifo_aXvec_Callipepla_5__empty_n),
    .if_read(fifo_aXvec_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_5__din),
    .if_full_n(fifo_aXvec_Callipepla_5__full_n),
    .if_write(fifo_aXvec_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_6__dout),
    .if_empty_n(fifo_aXvec_Callipepla_6__empty_n),
    .if_read(fifo_aXvec_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_6__din),
    .if_full_n(fifo_aXvec_Callipepla_6__full_n),
    .if_write(fifo_aXvec_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_7__dout),
    .if_empty_n(fifo_aXvec_Callipepla_7__empty_n),
    .if_read(fifo_aXvec_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_7__din),
    .if_full_n(fifo_aXvec_Callipepla_7__full_n),
    .if_write(fifo_aXvec_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_8__dout),
    .if_empty_n(fifo_aXvec_Callipepla_8__empty_n),
    .if_read(fifo_aXvec_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_8__din),
    .if_full_n(fifo_aXvec_Callipepla_8__full_n),
    .if_write(fifo_aXvec_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(657),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Callipepla_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Callipepla_9__dout),
    .if_empty_n(fifo_aXvec_Callipepla_9__empty_n),
    .if_read(fifo_aXvec_Callipepla_9__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Callipepla_9__din),
    .if_full_n(fifo_aXvec_Callipepla_9__full_n),
    .if_write(fifo_aXvec_Callipepla_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_alpha_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_alpha_Callipepla_0__dout),
    .if_empty_n(fifo_alpha_Callipepla_0__empty_n),
    .if_read(fifo_alpha_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_alpha_Callipepla_0__din),
    .if_full_n(fifo_alpha_Callipepla_0__full_n),
    .if_write(fifo_alpha_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_alpha_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_alpha_Callipepla_1__dout),
    .if_empty_n(fifo_alpha_Callipepla_1__empty_n),
    .if_read(fifo_alpha_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_alpha_Callipepla_1__din),
    .if_full_n(fifo_alpha_Callipepla_1__full_n),
    .if_write(fifo_alpha_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_dA_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_dA_Callipepla__dout),
    .if_empty_n(fifo_dA_Callipepla__empty_n),
    .if_read(fifo_dA_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_dA_Callipepla__din),
    .if_full_n(fifo_dA_Callipepla__full_n),
    .if_write(fifo_dA_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_din_AP_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_din_AP_Callipepla__dout),
    .if_empty_n(fifo_din_AP_Callipepla__empty_n),
    .if_read(fifo_din_AP_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_din_AP_Callipepla__din),
    .if_full_n(fifo_din_AP_Callipepla__full_n),
    .if_write(fifo_din_AP_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_din_P_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_din_P_Callipepla_0__dout),
    .if_empty_n(fifo_din_P_Callipepla_0__empty_n),
    .if_read(fifo_din_P_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_din_P_Callipepla_0__din),
    .if_full_n(fifo_din_P_Callipepla_0__full_n),
    .if_write(fifo_din_P_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_din_P_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_din_P_Callipepla_1__dout),
    .if_empty_n(fifo_din_P_Callipepla_1__empty_n),
    .if_read(fifo_din_P_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_din_P_Callipepla_1__din),
    .if_full_n(fifo_din_P_Callipepla_1__full_n),
    .if_write(fifo_din_P_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_din_R_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_din_R_Callipepla_0__dout),
    .if_empty_n(fifo_din_R_Callipepla_0__empty_n),
    .if_read(fifo_din_R_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_din_R_Callipepla_0__din),
    .if_full_n(fifo_din_R_Callipepla_0__full_n),
    .if_write(fifo_din_R_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_din_R_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_din_R_Callipepla_1__dout),
    .if_empty_n(fifo_din_R_Callipepla_1__empty_n),
    .if_read(fifo_din_R_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_din_R_Callipepla_1__din),
    .if_full_n(fifo_din_R_Callipepla_1__full_n),
    .if_write(fifo_din_R_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_din_X_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_din_X_Callipepla_0__dout),
    .if_empty_n(fifo_din_X_Callipepla_0__empty_n),
    .if_read(fifo_din_X_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_din_X_Callipepla_0__din),
    .if_full_n(fifo_din_X_Callipepla_0__full_n),
    .if_write(fifo_din_X_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_din_X_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_din_X_Callipepla_1__dout),
    .if_empty_n(fifo_din_X_Callipepla_1__empty_n),
    .if_read(fifo_din_X_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_din_X_Callipepla_1__din),
    .if_full_n(fifo_din_X_Callipepla_1__full_n),
    .if_write(fifo_din_X_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_dout_AP_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_dout_AP_Callipepla__dout),
    .if_empty_n(fifo_dout_AP_Callipepla__empty_n),
    .if_read(fifo_dout_AP_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_dout_AP_Callipepla__din),
    .if_full_n(fifo_dout_AP_Callipepla__full_n),
    .if_write(fifo_dout_AP_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_dout_P_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_dout_P_Callipepla_0__dout),
    .if_empty_n(fifo_dout_P_Callipepla_0__empty_n),
    .if_read(fifo_dout_P_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_dout_P_Callipepla_0__din),
    .if_full_n(fifo_dout_P_Callipepla_0__full_n),
    .if_write(fifo_dout_P_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_dout_P_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_dout_P_Callipepla_1__dout),
    .if_empty_n(fifo_dout_P_Callipepla_1__empty_n),
    .if_read(fifo_dout_P_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_dout_P_Callipepla_1__din),
    .if_full_n(fifo_dout_P_Callipepla_1__full_n),
    .if_write(fifo_dout_P_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_dout_R_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_dout_R_Callipepla_0__dout),
    .if_empty_n(fifo_dout_R_Callipepla_0__empty_n),
    .if_read(fifo_dout_R_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_dout_R_Callipepla_0__din),
    .if_full_n(fifo_dout_R_Callipepla_0__full_n),
    .if_write(fifo_dout_R_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_dout_R_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_dout_R_Callipepla_1__dout),
    .if_empty_n(fifo_dout_R_Callipepla_1__empty_n),
    .if_read(fifo_dout_R_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_dout_R_Callipepla_1__din),
    .if_full_n(fifo_dout_R_Callipepla_1__full_n),
    .if_write(fifo_dout_R_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_dout_X_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_dout_X_Callipepla_0__dout),
    .if_empty_n(fifo_dout_X_Callipepla_0__empty_n),
    .if_read(fifo_dout_X_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_dout_X_Callipepla_0__din),
    .if_full_n(fifo_dout_X_Callipepla_0__full_n),
    .if_write(fifo_dout_X_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_dout_X_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_dout_X_Callipepla_1__dout),
    .if_empty_n(fifo_dout_X_Callipepla_1__empty_n),
    .if_read(fifo_dout_X_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_dout_X_Callipepla_1__din),
    .if_full_n(fifo_dout_X_Callipepla_1__full_n),
    .if_write(fifo_dout_X_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(67),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_mi_AP_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_mi_AP_Callipepla__dout),
    .if_empty_n(fifo_mi_AP_Callipepla__empty_n),
    .if_read(fifo_mi_AP_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_mi_AP_Callipepla__din),
    .if_full_n(fifo_mi_AP_Callipepla__full_n),
    .if_write(fifo_mi_AP_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(67),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_mi_P_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_mi_P_Callipepla_0__dout),
    .if_empty_n(fifo_mi_P_Callipepla_0__empty_n),
    .if_read(fifo_mi_P_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_mi_P_Callipepla_0__din),
    .if_full_n(fifo_mi_P_Callipepla_0__full_n),
    .if_write(fifo_mi_P_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(67),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_mi_P_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_mi_P_Callipepla_1__dout),
    .if_empty_n(fifo_mi_P_Callipepla_1__empty_n),
    .if_read(fifo_mi_P_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_mi_P_Callipepla_1__din),
    .if_full_n(fifo_mi_P_Callipepla_1__full_n),
    .if_write(fifo_mi_P_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(67),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_mi_R_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_mi_R_Callipepla_0__dout),
    .if_empty_n(fifo_mi_R_Callipepla_0__empty_n),
    .if_read(fifo_mi_R_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_mi_R_Callipepla_0__din),
    .if_full_n(fifo_mi_R_Callipepla_0__full_n),
    .if_write(fifo_mi_R_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(67),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_mi_R_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_mi_R_Callipepla_1__dout),
    .if_empty_n(fifo_mi_R_Callipepla_1__empty_n),
    .if_read(fifo_mi_R_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_mi_R_Callipepla_1__din),
    .if_full_n(fifo_mi_R_Callipepla_1__full_n),
    .if_write(fifo_mi_R_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(67),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_mi_X_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_mi_X_Callipepla_0__dout),
    .if_empty_n(fifo_mi_X_Callipepla_0__empty_n),
    .if_read(fifo_mi_X_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_mi_X_Callipepla_0__din),
    .if_full_n(fifo_mi_X_Callipepla_0__full_n),
    .if_write(fifo_mi_X_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(67),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_mi_X_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_mi_X_Callipepla_1__dout),
    .if_empty_n(fifo_mi_X_Callipepla_1__empty_n),
    .if_read(fifo_mi_X_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_mi_X_Callipepla_1__din),
    .if_full_n(fifo_mi_X_Callipepla_1__full_n),
    .if_write(fifo_mi_X_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_resp_AP_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_resp_AP_Callipepla__dout),
    .if_empty_n(fifo_resp_AP_Callipepla__empty_n),
    .if_read(fifo_resp_AP_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(fifo_resp_AP_Callipepla__din),
    .if_full_n(fifo_resp_AP_Callipepla__full_n),
    .if_write(fifo_resp_AP_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_resp_P_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_resp_P_Callipepla_0__dout),
    .if_empty_n(fifo_resp_P_Callipepla_0__empty_n),
    .if_read(fifo_resp_P_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_resp_P_Callipepla_0__din),
    .if_full_n(fifo_resp_P_Callipepla_0__full_n),
    .if_write(fifo_resp_P_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_resp_P_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_resp_P_Callipepla_1__dout),
    .if_empty_n(fifo_resp_P_Callipepla_1__empty_n),
    .if_read(fifo_resp_P_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_resp_P_Callipepla_1__din),
    .if_full_n(fifo_resp_P_Callipepla_1__full_n),
    .if_write(fifo_resp_P_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_resp_R_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_resp_R_Callipepla_0__dout),
    .if_empty_n(fifo_resp_R_Callipepla_0__empty_n),
    .if_read(fifo_resp_R_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_resp_R_Callipepla_0__din),
    .if_full_n(fifo_resp_R_Callipepla_0__full_n),
    .if_write(fifo_resp_R_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_resp_R_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_resp_R_Callipepla_1__dout),
    .if_empty_n(fifo_resp_R_Callipepla_1__empty_n),
    .if_read(fifo_resp_R_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_resp_R_Callipepla_1__din),
    .if_full_n(fifo_resp_R_Callipepla_1__full_n),
    .if_write(fifo_resp_R_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_resp_X_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_resp_X_Callipepla_0__dout),
    .if_empty_n(fifo_resp_X_Callipepla_0__empty_n),
    .if_read(fifo_resp_X_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_resp_X_Callipepla_0__din),
    .if_full_n(fifo_resp_X_Callipepla_0__full_n),
    .if_write(fifo_resp_X_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_resp_X_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_resp_X_Callipepla_1__dout),
    .if_empty_n(fifo_resp_X_Callipepla_1__empty_n),
    .if_read(fifo_resp_X_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_resp_X_Callipepla_1__din),
    .if_full_n(fifo_resp_X_Callipepla_1__full_n),
    .if_write(fifo_resp_X_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_rz_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_rz_Callipepla_0__dout),
    .if_empty_n(fifo_rz_Callipepla_0__empty_n),
    .if_read(fifo_rz_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_rz_Callipepla_0__din),
    .if_full_n(fifo_rz_Callipepla_0__full_n),
    .if_write(fifo_rz_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_rz_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_rz_Callipepla_1__dout),
    .if_empty_n(fifo_rz_Callipepla_1__empty_n),
    .if_read(fifo_rz_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_rz_Callipepla_1__din),
    .if_full_n(fifo_rz_Callipepla_1__full_n),
    .if_write(fifo_rz_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_0__dout),
    .if_empty_n(tsignal_Y_Callipepla_0__empty_n),
    .if_read(tsignal_Y_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_0__din),
    .if_full_n(tsignal_Y_Callipepla_0__full_n),
    .if_write(tsignal_Y_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_10__dout),
    .if_empty_n(tsignal_Y_Callipepla_10__empty_n),
    .if_read(tsignal_Y_Callipepla_10__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_10__din),
    .if_full_n(tsignal_Y_Callipepla_10__full_n),
    .if_write(tsignal_Y_Callipepla_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_11__dout),
    .if_empty_n(tsignal_Y_Callipepla_11__empty_n),
    .if_read(tsignal_Y_Callipepla_11__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_11__din),
    .if_full_n(tsignal_Y_Callipepla_11__full_n),
    .if_write(tsignal_Y_Callipepla_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_12__dout),
    .if_empty_n(tsignal_Y_Callipepla_12__empty_n),
    .if_read(tsignal_Y_Callipepla_12__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_12__din),
    .if_full_n(tsignal_Y_Callipepla_12__full_n),
    .if_write(tsignal_Y_Callipepla_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_13__dout),
    .if_empty_n(tsignal_Y_Callipepla_13__empty_n),
    .if_read(tsignal_Y_Callipepla_13__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_13__din),
    .if_full_n(tsignal_Y_Callipepla_13__full_n),
    .if_write(tsignal_Y_Callipepla_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_14__dout),
    .if_empty_n(tsignal_Y_Callipepla_14__empty_n),
    .if_read(tsignal_Y_Callipepla_14__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_14__din),
    .if_full_n(tsignal_Y_Callipepla_14__full_n),
    .if_write(tsignal_Y_Callipepla_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_15__dout),
    .if_empty_n(tsignal_Y_Callipepla_15__empty_n),
    .if_read(tsignal_Y_Callipepla_15__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_15__din),
    .if_full_n(tsignal_Y_Callipepla_15__full_n),
    .if_write(tsignal_Y_Callipepla_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_1__dout),
    .if_empty_n(tsignal_Y_Callipepla_1__empty_n),
    .if_read(tsignal_Y_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_1__din),
    .if_full_n(tsignal_Y_Callipepla_1__full_n),
    .if_write(tsignal_Y_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_2__dout),
    .if_empty_n(tsignal_Y_Callipepla_2__empty_n),
    .if_read(tsignal_Y_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_2__din),
    .if_full_n(tsignal_Y_Callipepla_2__full_n),
    .if_write(tsignal_Y_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_3__dout),
    .if_empty_n(tsignal_Y_Callipepla_3__empty_n),
    .if_read(tsignal_Y_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_3__din),
    .if_full_n(tsignal_Y_Callipepla_3__full_n),
    .if_write(tsignal_Y_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_4__dout),
    .if_empty_n(tsignal_Y_Callipepla_4__empty_n),
    .if_read(tsignal_Y_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_4__din),
    .if_full_n(tsignal_Y_Callipepla_4__full_n),
    .if_write(tsignal_Y_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_5__dout),
    .if_empty_n(tsignal_Y_Callipepla_5__empty_n),
    .if_read(tsignal_Y_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_5__din),
    .if_full_n(tsignal_Y_Callipepla_5__full_n),
    .if_write(tsignal_Y_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_6__dout),
    .if_empty_n(tsignal_Y_Callipepla_6__empty_n),
    .if_read(tsignal_Y_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_6__din),
    .if_full_n(tsignal_Y_Callipepla_6__full_n),
    .if_write(tsignal_Y_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_7__dout),
    .if_empty_n(tsignal_Y_Callipepla_7__empty_n),
    .if_read(tsignal_Y_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_7__din),
    .if_full_n(tsignal_Y_Callipepla_7__full_n),
    .if_write(tsignal_Y_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_8__dout),
    .if_empty_n(tsignal_Y_Callipepla_8__empty_n),
    .if_read(tsignal_Y_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_8__din),
    .if_full_n(tsignal_Y_Callipepla_8__full_n),
    .if_write(tsignal_Y_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_Y_Callipepla_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_Y_Callipepla_9__dout),
    .if_empty_n(tsignal_Y_Callipepla_9__empty_n),
    .if_read(tsignal_Y_Callipepla_9__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_Y_Callipepla_9__din),
    .if_full_n(tsignal_Y_Callipepla_9__full_n),
    .if_write(tsignal_Y_Callipepla_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_aby_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_aby_Callipepla_0__dout),
    .if_empty_n(tsignal_aby_Callipepla_0__empty_n),
    .if_read(tsignal_aby_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_aby_Callipepla_0__din),
    .if_full_n(tsignal_aby_Callipepla_0__full_n),
    .if_write(tsignal_aby_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_aby_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_aby_Callipepla_1__dout),
    .if_empty_n(tsignal_aby_Callipepla_1__empty_n),
    .if_read(tsignal_aby_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_aby_Callipepla_1__din),
    .if_full_n(tsignal_aby_Callipepla_1__full_n),
    .if_write(tsignal_aby_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_aby_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_aby_Callipepla_2__dout),
    .if_empty_n(tsignal_aby_Callipepla_2__empty_n),
    .if_read(tsignal_aby_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_aby_Callipepla_2__din),
    .if_full_n(tsignal_aby_Callipepla_2__full_n),
    .if_write(tsignal_aby_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_aby_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_aby_Callipepla_3__dout),
    .if_empty_n(tsignal_aby_Callipepla_3__empty_n),
    .if_read(tsignal_aby_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_aby_Callipepla_3__din),
    .if_full_n(tsignal_aby_Callipepla_3__full_n),
    .if_write(tsignal_aby_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_aby_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_aby_Callipepla_4__dout),
    .if_empty_n(tsignal_aby_Callipepla_4__empty_n),
    .if_read(tsignal_aby_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_aby_Callipepla_4__din),
    .if_full_n(tsignal_aby_Callipepla_4__full_n),
    .if_write(tsignal_aby_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_aby_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_aby_Callipepla_5__dout),
    .if_empty_n(tsignal_aby_Callipepla_5__empty_n),
    .if_read(tsignal_aby_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_aby_Callipepla_5__din),
    .if_full_n(tsignal_aby_Callipepla_5__full_n),
    .if_write(tsignal_aby_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_aby_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_aby_Callipepla_6__dout),
    .if_empty_n(tsignal_aby_Callipepla_6__empty_n),
    .if_read(tsignal_aby_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_aby_Callipepla_6__din),
    .if_full_n(tsignal_aby_Callipepla_6__full_n),
    .if_write(tsignal_aby_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_aby_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_aby_Callipepla_7__dout),
    .if_empty_n(tsignal_aby_Callipepla_7__empty_n),
    .if_read(tsignal_aby_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_aby_Callipepla_7__din),
    .if_full_n(tsignal_aby_Callipepla_7__full_n),
    .if_write(tsignal_aby_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_aby_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_aby_Callipepla_8__dout),
    .if_empty_n(tsignal_aby_Callipepla_8__empty_n),
    .if_read(tsignal_aby_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_aby_Callipepla_8__din),
    .if_full_n(tsignal_aby_Callipepla_8__full_n),
    .if_write(tsignal_aby_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_ctrlAP_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_ctrlAP_Callipepla__dout),
    .if_empty_n(tsignal_ctrlAP_Callipepla__empty_n),
    .if_read(tsignal_ctrlAP_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_ctrlAP_Callipepla__din),
    .if_full_n(tsignal_ctrlAP_Callipepla__full_n),
    .if_write(tsignal_ctrlAP_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_ctrlP_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_ctrlP_Callipepla__dout),
    .if_empty_n(tsignal_ctrlP_Callipepla__empty_n),
    .if_read(tsignal_ctrlP_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_ctrlP_Callipepla__din),
    .if_full_n(tsignal_ctrlP_Callipepla__full_n),
    .if_write(tsignal_ctrlP_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_ctrlR_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_ctrlR_Callipepla__dout),
    .if_empty_n(tsignal_ctrlR_Callipepla__empty_n),
    .if_read(tsignal_ctrlR_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_ctrlR_Callipepla__din),
    .if_full_n(tsignal_ctrlR_Callipepla__full_n),
    .if_write(tsignal_ctrlR_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_ctrlX_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_ctrlX_Callipepla__dout),
    .if_empty_n(tsignal_ctrlX_Callipepla__empty_n),
    .if_read(tsignal_ctrlX_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_ctrlX_Callipepla__din),
    .if_full_n(tsignal_ctrlX_Callipepla__full_n),
    .if_write(tsignal_ctrlX_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_ctrldigA_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_ctrldigA_Callipepla__dout),
    .if_empty_n(tsignal_ctrldigA_Callipepla__empty_n),
    .if_read(tsignal_ctrldigA_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_ctrldigA_Callipepla__din),
    .if_full_n(tsignal_ctrldigA_Callipepla__full_n),
    .if_write(tsignal_ctrldigA_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_0__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_0__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_0__din),
    .if_full_n(tsignal_edgepointer_Callipepla_0__full_n),
    .if_write(tsignal_edgepointer_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_10__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_10__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_10__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_10__din),
    .if_full_n(tsignal_edgepointer_Callipepla_10__full_n),
    .if_write(tsignal_edgepointer_Callipepla_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_11__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_11__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_11__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_11__din),
    .if_full_n(tsignal_edgepointer_Callipepla_11__full_n),
    .if_write(tsignal_edgepointer_Callipepla_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_12__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_12__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_12__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_12__din),
    .if_full_n(tsignal_edgepointer_Callipepla_12__full_n),
    .if_write(tsignal_edgepointer_Callipepla_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_13__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_13__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_13__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_13__din),
    .if_full_n(tsignal_edgepointer_Callipepla_13__full_n),
    .if_write(tsignal_edgepointer_Callipepla_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_14__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_14__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_14__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_14__din),
    .if_full_n(tsignal_edgepointer_Callipepla_14__full_n),
    .if_write(tsignal_edgepointer_Callipepla_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_15__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_15__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_15__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_15__din),
    .if_full_n(tsignal_edgepointer_Callipepla_15__full_n),
    .if_write(tsignal_edgepointer_Callipepla_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_16__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_16__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_16__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_16__din),
    .if_full_n(tsignal_edgepointer_Callipepla_16__full_n),
    .if_write(tsignal_edgepointer_Callipepla_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_17
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_17__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_17__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_17__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_17__din),
    .if_full_n(tsignal_edgepointer_Callipepla_17__full_n),
    .if_write(tsignal_edgepointer_Callipepla_17__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_1__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_1__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_1__din),
    .if_full_n(tsignal_edgepointer_Callipepla_1__full_n),
    .if_write(tsignal_edgepointer_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_2__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_2__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_2__din),
    .if_full_n(tsignal_edgepointer_Callipepla_2__full_n),
    .if_write(tsignal_edgepointer_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_3__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_3__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_3__din),
    .if_full_n(tsignal_edgepointer_Callipepla_3__full_n),
    .if_write(tsignal_edgepointer_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_4__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_4__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_4__din),
    .if_full_n(tsignal_edgepointer_Callipepla_4__full_n),
    .if_write(tsignal_edgepointer_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_5__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_5__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_5__din),
    .if_full_n(tsignal_edgepointer_Callipepla_5__full_n),
    .if_write(tsignal_edgepointer_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_6__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_6__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_6__din),
    .if_full_n(tsignal_edgepointer_Callipepla_6__full_n),
    .if_write(tsignal_edgepointer_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_7__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_7__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_7__din),
    .if_full_n(tsignal_edgepointer_Callipepla_7__full_n),
    .if_write(tsignal_edgepointer_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_8__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_8__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_8__din),
    .if_full_n(tsignal_edgepointer_Callipepla_8__full_n),
    .if_write(tsignal_edgepointer_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_edgepointer_Callipepla_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_edgepointer_Callipepla_9__dout),
    .if_empty_n(tsignal_edgepointer_Callipepla_9__empty_n),
    .if_read(tsignal_edgepointer_Callipepla_9__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_edgepointer_Callipepla_9__din),
    .if_full_n(tsignal_edgepointer_Callipepla_9__full_n),
    .if_write(tsignal_edgepointer_Callipepla_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_mux_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_mux_Callipepla__dout),
    .if_empty_n(tsignal_mux_Callipepla__empty_n),
    .if_read(tsignal_mux_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_mux_Callipepla__din),
    .if_full_n(tsignal_mux_Callipepla__full_n),
    .if_write(tsignal_mux_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_0__dout),
    .if_empty_n(tsignal_rdA_Callipepla_0__empty_n),
    .if_read(tsignal_rdA_Callipepla_0__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_0__din),
    .if_full_n(tsignal_rdA_Callipepla_0__full_n),
    .if_write(tsignal_rdA_Callipepla_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_10__dout),
    .if_empty_n(tsignal_rdA_Callipepla_10__empty_n),
    .if_read(tsignal_rdA_Callipepla_10__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_10__din),
    .if_full_n(tsignal_rdA_Callipepla_10__full_n),
    .if_write(tsignal_rdA_Callipepla_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_11__dout),
    .if_empty_n(tsignal_rdA_Callipepla_11__empty_n),
    .if_read(tsignal_rdA_Callipepla_11__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_11__din),
    .if_full_n(tsignal_rdA_Callipepla_11__full_n),
    .if_write(tsignal_rdA_Callipepla_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_12__dout),
    .if_empty_n(tsignal_rdA_Callipepla_12__empty_n),
    .if_read(tsignal_rdA_Callipepla_12__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_12__din),
    .if_full_n(tsignal_rdA_Callipepla_12__full_n),
    .if_write(tsignal_rdA_Callipepla_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_13__dout),
    .if_empty_n(tsignal_rdA_Callipepla_13__empty_n),
    .if_read(tsignal_rdA_Callipepla_13__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_13__din),
    .if_full_n(tsignal_rdA_Callipepla_13__full_n),
    .if_write(tsignal_rdA_Callipepla_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_14__dout),
    .if_empty_n(tsignal_rdA_Callipepla_14__empty_n),
    .if_read(tsignal_rdA_Callipepla_14__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_14__din),
    .if_full_n(tsignal_rdA_Callipepla_14__full_n),
    .if_write(tsignal_rdA_Callipepla_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_15__dout),
    .if_empty_n(tsignal_rdA_Callipepla_15__empty_n),
    .if_read(tsignal_rdA_Callipepla_15__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_15__din),
    .if_full_n(tsignal_rdA_Callipepla_15__full_n),
    .if_write(tsignal_rdA_Callipepla_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_16__dout),
    .if_empty_n(tsignal_rdA_Callipepla_16__empty_n),
    .if_read(tsignal_rdA_Callipepla_16__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_16__din),
    .if_full_n(tsignal_rdA_Callipepla_16__full_n),
    .if_write(tsignal_rdA_Callipepla_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_1__dout),
    .if_empty_n(tsignal_rdA_Callipepla_1__empty_n),
    .if_read(tsignal_rdA_Callipepla_1__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_1__din),
    .if_full_n(tsignal_rdA_Callipepla_1__full_n),
    .if_write(tsignal_rdA_Callipepla_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_2__dout),
    .if_empty_n(tsignal_rdA_Callipepla_2__empty_n),
    .if_read(tsignal_rdA_Callipepla_2__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_2__din),
    .if_full_n(tsignal_rdA_Callipepla_2__full_n),
    .if_write(tsignal_rdA_Callipepla_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_3__dout),
    .if_empty_n(tsignal_rdA_Callipepla_3__empty_n),
    .if_read(tsignal_rdA_Callipepla_3__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_3__din),
    .if_full_n(tsignal_rdA_Callipepla_3__full_n),
    .if_write(tsignal_rdA_Callipepla_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_4__dout),
    .if_empty_n(tsignal_rdA_Callipepla_4__empty_n),
    .if_read(tsignal_rdA_Callipepla_4__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_4__din),
    .if_full_n(tsignal_rdA_Callipepla_4__full_n),
    .if_write(tsignal_rdA_Callipepla_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_5__dout),
    .if_empty_n(tsignal_rdA_Callipepla_5__empty_n),
    .if_read(tsignal_rdA_Callipepla_5__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_5__din),
    .if_full_n(tsignal_rdA_Callipepla_5__full_n),
    .if_write(tsignal_rdA_Callipepla_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_6__dout),
    .if_empty_n(tsignal_rdA_Callipepla_6__empty_n),
    .if_read(tsignal_rdA_Callipepla_6__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_6__din),
    .if_full_n(tsignal_rdA_Callipepla_6__full_n),
    .if_write(tsignal_rdA_Callipepla_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_7__dout),
    .if_empty_n(tsignal_rdA_Callipepla_7__empty_n),
    .if_read(tsignal_rdA_Callipepla_7__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_7__din),
    .if_full_n(tsignal_rdA_Callipepla_7__full_n),
    .if_write(tsignal_rdA_Callipepla_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_8__dout),
    .if_empty_n(tsignal_rdA_Callipepla_8__empty_n),
    .if_read(tsignal_rdA_Callipepla_8__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_8__din),
    .if_full_n(tsignal_rdA_Callipepla_8__full_n),
    .if_write(tsignal_rdA_Callipepla_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_rdA_Callipepla_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_rdA_Callipepla_9__dout),
    .if_empty_n(tsignal_rdA_Callipepla_9__empty_n),
    .if_read(tsignal_rdA_Callipepla_9__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_rdA_Callipepla_9__din),
    .if_full_n(tsignal_rdA_Callipepla_9__full_n),
    .if_write(tsignal_rdA_Callipepla_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_res_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_res_Callipepla__dout),
    .if_empty_n(tsignal_res_Callipepla__empty_n),
    .if_read(tsignal_res_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_res_Callipepla__din),
    .if_full_n(tsignal_res_Callipepla__full_n),
    .if_write(tsignal_res_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_toM3_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_toM3_Callipepla__dout),
    .if_empty_n(tsignal_toM3_Callipepla__empty_n),
    .if_read(tsignal_toM3_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_toM3_Callipepla__din),
    .if_full_n(tsignal_toM3_Callipepla__full_n),
    .if_write(tsignal_toM3_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_toM4_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_toM4_Callipepla__dout),
    .if_empty_n(tsignal_toM4_Callipepla__empty_n),
    .if_read(tsignal_toM4_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_toM4_Callipepla__din),
    .if_full_n(tsignal_toM4_Callipepla__full_n),
    .if_write(tsignal_toM4_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_toM5_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_toM5_Callipepla__dout),
    .if_empty_n(tsignal_toM5_Callipepla__empty_n),
    .if_read(tsignal_toM5_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_toM5_Callipepla__din),
    .if_full_n(tsignal_toM5_Callipepla__full_n),
    .if_write(tsignal_toM5_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_toM6_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_toM6_Callipepla__dout),
    .if_empty_n(tsignal_toM6_Callipepla__empty_n),
    .if_read(tsignal_toM6_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_toM6_Callipepla__din),
    .if_full_n(tsignal_toM6_Callipepla__full_n),
    .if_write(tsignal_toM6_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(2),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  tsignal_toM7_Callipepla
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(tsignal_toM7_Callipepla__dout),
    .if_empty_n(tsignal_toM7_Callipepla__empty_n),
    .if_read(tsignal_toM7_Callipepla__read),
    .if_read_ce(1'b1),
    .if_din(tsignal_toM7_Callipepla__din),
    .if_full_n(tsignal_toM7_Callipepla__full_n),
    .if_write(tsignal_toM7_Callipepla__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) Arbiter_Y
  Arbiter_Y_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Arbiter_Y_0__ap_start),
    .ap_done(Arbiter_Y_0__ap_done),
    .ap_idle(Arbiter_Y_0__ap_idle),
    .ap_ready(Arbiter_Y_0__ap_ready),
    .M(Arbiter_Y_0___M__q0),
    .fifo_in_0_dout(fifo_Y_pe_Callipepla_0__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Callipepla_0__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Callipepla_0__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Callipepla_0__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Callipepla_0__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Callipepla_1__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Callipepla_1__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Callipepla_1__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Callipepla_1__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Callipepla_1__read),
    .fifo_in_peek_1_read(),
    .fifo_out_din(fifo_Y_pe_abd_Callipepla_0__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Callipepla_0__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Callipepla_0__write),
    .rp_time(Arbiter_Y_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_aby_Callipepla_0__dout),
    .q_gbc_peek_dout(tsignal_aby_Callipepla_0__dout),
    .q_gbc_s_empty_n(tsignal_aby_Callipepla_0__empty_n),
    .q_gbc_peek_empty_n(tsignal_aby_Callipepla_0__empty_n),
    .q_gbc_s_read(tsignal_aby_Callipepla_0__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_aby_Callipepla_1__din),
    .q_gbc_out_full_n(tsignal_aby_Callipepla_1__full_n),
    .q_gbc_out_write(tsignal_aby_Callipepla_1__write)
  );


  (* keep_hierarchy = "yes" *) Arbiter_Y
  Arbiter_Y_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Arbiter_Y_1__ap_start),
    .ap_done(Arbiter_Y_1__ap_done),
    .ap_idle(Arbiter_Y_1__ap_idle),
    .ap_ready(Arbiter_Y_1__ap_ready),
    .M(Arbiter_Y_1___M__q0),
    .fifo_in_0_dout(fifo_Y_pe_Callipepla_2__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Callipepla_2__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Callipepla_2__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Callipepla_2__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Callipepla_2__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Callipepla_3__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Callipepla_3__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Callipepla_3__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Callipepla_3__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Callipepla_3__read),
    .fifo_in_peek_1_read(),
    .fifo_out_din(fifo_Y_pe_abd_Callipepla_1__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Callipepla_1__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Callipepla_1__write),
    .rp_time(Arbiter_Y_1___rp_time__q0),
    .q_gbc_s_dout(tsignal_aby_Callipepla_1__dout),
    .q_gbc_peek_dout(tsignal_aby_Callipepla_1__dout),
    .q_gbc_s_empty_n(tsignal_aby_Callipepla_1__empty_n),
    .q_gbc_peek_empty_n(tsignal_aby_Callipepla_1__empty_n),
    .q_gbc_s_read(tsignal_aby_Callipepla_1__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_aby_Callipepla_2__din),
    .q_gbc_out_full_n(tsignal_aby_Callipepla_2__full_n),
    .q_gbc_out_write(tsignal_aby_Callipepla_2__write)
  );


  (* keep_hierarchy = "yes" *) Arbiter_Y
  Arbiter_Y_2
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Arbiter_Y_2__ap_start),
    .ap_done(Arbiter_Y_2__ap_done),
    .ap_idle(Arbiter_Y_2__ap_idle),
    .ap_ready(Arbiter_Y_2__ap_ready),
    .M(Arbiter_Y_2___M__q0),
    .fifo_in_0_dout(fifo_Y_pe_Callipepla_4__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Callipepla_4__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Callipepla_4__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Callipepla_4__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Callipepla_4__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Callipepla_5__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Callipepla_5__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Callipepla_5__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Callipepla_5__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Callipepla_5__read),
    .fifo_in_peek_1_read(),
    .fifo_out_din(fifo_Y_pe_abd_Callipepla_2__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Callipepla_2__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Callipepla_2__write),
    .rp_time(Arbiter_Y_2___rp_time__q0),
    .q_gbc_s_dout(tsignal_aby_Callipepla_2__dout),
    .q_gbc_peek_dout(tsignal_aby_Callipepla_2__dout),
    .q_gbc_s_empty_n(tsignal_aby_Callipepla_2__empty_n),
    .q_gbc_peek_empty_n(tsignal_aby_Callipepla_2__empty_n),
    .q_gbc_s_read(tsignal_aby_Callipepla_2__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_aby_Callipepla_3__din),
    .q_gbc_out_full_n(tsignal_aby_Callipepla_3__full_n),
    .q_gbc_out_write(tsignal_aby_Callipepla_3__write)
  );


  (* keep_hierarchy = "yes" *) Arbiter_Y
  Arbiter_Y_3
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Arbiter_Y_3__ap_start),
    .ap_done(Arbiter_Y_3__ap_done),
    .ap_idle(Arbiter_Y_3__ap_idle),
    .ap_ready(Arbiter_Y_3__ap_ready),
    .M(Arbiter_Y_3___M__q0),
    .fifo_in_0_dout(fifo_Y_pe_Callipepla_6__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Callipepla_6__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Callipepla_6__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Callipepla_6__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Callipepla_6__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Callipepla_7__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Callipepla_7__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Callipepla_7__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Callipepla_7__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Callipepla_7__read),
    .fifo_in_peek_1_read(),
    .fifo_out_din(fifo_Y_pe_abd_Callipepla_3__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Callipepla_3__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Callipepla_3__write),
    .rp_time(Arbiter_Y_3___rp_time__q0),
    .q_gbc_s_dout(tsignal_aby_Callipepla_3__dout),
    .q_gbc_peek_dout(tsignal_aby_Callipepla_3__dout),
    .q_gbc_s_empty_n(tsignal_aby_Callipepla_3__empty_n),
    .q_gbc_peek_empty_n(tsignal_aby_Callipepla_3__empty_n),
    .q_gbc_s_read(tsignal_aby_Callipepla_3__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_aby_Callipepla_4__din),
    .q_gbc_out_full_n(tsignal_aby_Callipepla_4__full_n),
    .q_gbc_out_write(tsignal_aby_Callipepla_4__write)
  );


  (* keep_hierarchy = "yes" *) Arbiter_Y
  Arbiter_Y_4
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Arbiter_Y_4__ap_start),
    .ap_done(Arbiter_Y_4__ap_done),
    .ap_idle(Arbiter_Y_4__ap_idle),
    .ap_ready(Arbiter_Y_4__ap_ready),
    .M(Arbiter_Y_4___M__q0),
    .fifo_in_0_dout(fifo_Y_pe_Callipepla_8__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Callipepla_8__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Callipepla_8__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Callipepla_8__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Callipepla_8__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Callipepla_9__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Callipepla_9__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Callipepla_9__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Callipepla_9__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Callipepla_9__read),
    .fifo_in_peek_1_read(),
    .fifo_out_din(fifo_Y_pe_abd_Callipepla_4__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Callipepla_4__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Callipepla_4__write),
    .rp_time(Arbiter_Y_4___rp_time__q0),
    .q_gbc_s_dout(tsignal_aby_Callipepla_4__dout),
    .q_gbc_peek_dout(tsignal_aby_Callipepla_4__dout),
    .q_gbc_s_empty_n(tsignal_aby_Callipepla_4__empty_n),
    .q_gbc_peek_empty_n(tsignal_aby_Callipepla_4__empty_n),
    .q_gbc_s_read(tsignal_aby_Callipepla_4__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_aby_Callipepla_5__din),
    .q_gbc_out_full_n(tsignal_aby_Callipepla_5__full_n),
    .q_gbc_out_write(tsignal_aby_Callipepla_5__write)
  );


  (* keep_hierarchy = "yes" *) Arbiter_Y
  Arbiter_Y_5
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Arbiter_Y_5__ap_start),
    .ap_done(Arbiter_Y_5__ap_done),
    .ap_idle(Arbiter_Y_5__ap_idle),
    .ap_ready(Arbiter_Y_5__ap_ready),
    .M(Arbiter_Y_5___M__q0),
    .fifo_in_0_dout(fifo_Y_pe_Callipepla_10__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Callipepla_10__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Callipepla_10__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Callipepla_10__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Callipepla_10__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Callipepla_11__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Callipepla_11__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Callipepla_11__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Callipepla_11__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Callipepla_11__read),
    .fifo_in_peek_1_read(),
    .fifo_out_din(fifo_Y_pe_abd_Callipepla_5__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Callipepla_5__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Callipepla_5__write),
    .rp_time(Arbiter_Y_5___rp_time__q0),
    .q_gbc_s_dout(tsignal_aby_Callipepla_5__dout),
    .q_gbc_peek_dout(tsignal_aby_Callipepla_5__dout),
    .q_gbc_s_empty_n(tsignal_aby_Callipepla_5__empty_n),
    .q_gbc_peek_empty_n(tsignal_aby_Callipepla_5__empty_n),
    .q_gbc_s_read(tsignal_aby_Callipepla_5__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_aby_Callipepla_6__din),
    .q_gbc_out_full_n(tsignal_aby_Callipepla_6__full_n),
    .q_gbc_out_write(tsignal_aby_Callipepla_6__write)
  );


  (* keep_hierarchy = "yes" *) Arbiter_Y
  Arbiter_Y_6
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Arbiter_Y_6__ap_start),
    .ap_done(Arbiter_Y_6__ap_done),
    .ap_idle(Arbiter_Y_6__ap_idle),
    .ap_ready(Arbiter_Y_6__ap_ready),
    .M(Arbiter_Y_6___M__q0),
    .fifo_in_0_dout(fifo_Y_pe_Callipepla_12__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Callipepla_12__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Callipepla_12__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Callipepla_12__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Callipepla_12__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Callipepla_13__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Callipepla_13__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Callipepla_13__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Callipepla_13__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Callipepla_13__read),
    .fifo_in_peek_1_read(),
    .fifo_out_din(fifo_Y_pe_abd_Callipepla_6__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Callipepla_6__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Callipepla_6__write),
    .rp_time(Arbiter_Y_6___rp_time__q0),
    .q_gbc_s_dout(tsignal_aby_Callipepla_6__dout),
    .q_gbc_peek_dout(tsignal_aby_Callipepla_6__dout),
    .q_gbc_s_empty_n(tsignal_aby_Callipepla_6__empty_n),
    .q_gbc_peek_empty_n(tsignal_aby_Callipepla_6__empty_n),
    .q_gbc_s_read(tsignal_aby_Callipepla_6__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_aby_Callipepla_7__din),
    .q_gbc_out_full_n(tsignal_aby_Callipepla_7__full_n),
    .q_gbc_out_write(tsignal_aby_Callipepla_7__write)
  );


  (* keep_hierarchy = "yes" *) Arbiter_Y
  Arbiter_Y_7
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Arbiter_Y_7__ap_start),
    .ap_done(Arbiter_Y_7__ap_done),
    .ap_idle(Arbiter_Y_7__ap_idle),
    .ap_ready(Arbiter_Y_7__ap_ready),
    .M(Arbiter_Y_7___M__q0),
    .fifo_in_0_dout(fifo_Y_pe_Callipepla_14__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Callipepla_14__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Callipepla_14__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Callipepla_14__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Callipepla_14__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Callipepla_15__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Callipepla_15__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Callipepla_15__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Callipepla_15__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Callipepla_15__read),
    .fifo_in_peek_1_read(),
    .fifo_out_din(fifo_Y_pe_abd_Callipepla_7__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Callipepla_7__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Callipepla_7__write),
    .rp_time(Arbiter_Y_7___rp_time__q0),
    .q_gbc_s_dout(tsignal_aby_Callipepla_7__dout),
    .q_gbc_peek_dout(tsignal_aby_Callipepla_7__dout),
    .q_gbc_s_empty_n(tsignal_aby_Callipepla_7__empty_n),
    .q_gbc_peek_empty_n(tsignal_aby_Callipepla_7__empty_n),
    .q_gbc_s_read(tsignal_aby_Callipepla_7__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_aby_Callipepla_8__din),
    .q_gbc_out_full_n(tsignal_aby_Callipepla_8__full_n),
    .q_gbc_out_write(tsignal_aby_Callipepla_8__write)
  );


  (* keep_hierarchy = "yes" *) Merger_Y
  Merger_Y_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Merger_Y_0__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .fifo_out_0_din(fifo_AP_M1_Callipepla_0__din),
    .fifo_out_0_full_n(fifo_AP_M1_Callipepla_0__full_n),
    .fifo_out_0_write(fifo_AP_M1_Callipepla_0__write),
    .fifo_out_1_din(fifo_AP_M1_Callipepla_1__din),
    .fifo_out_1_full_n(fifo_AP_M1_Callipepla_1__full_n),
    .fifo_out_1_write(fifo_AP_M1_Callipepla_1__write),
    .fifo_in_0_dout(fifo_Y_pe_abd_Callipepla_0__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_abd_Callipepla_0__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_abd_Callipepla_0__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_abd_Callipepla_0__empty_n),
    .fifo_in_0_read(fifo_Y_pe_abd_Callipepla_0__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_abd_Callipepla_1__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_abd_Callipepla_1__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_abd_Callipepla_1__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_abd_Callipepla_1__empty_n),
    .fifo_in_1_read(fifo_Y_pe_abd_Callipepla_1__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_abd_Callipepla_2__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_abd_Callipepla_2__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_abd_Callipepla_2__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_abd_Callipepla_2__empty_n),
    .fifo_in_2_read(fifo_Y_pe_abd_Callipepla_2__read),
    .fifo_in_peek_2_read(),
    .fifo_in_3_dout(fifo_Y_pe_abd_Callipepla_3__dout),
    .fifo_in_peek_3_dout(fifo_Y_pe_abd_Callipepla_3__dout),
    .fifo_in_3_empty_n(fifo_Y_pe_abd_Callipepla_3__empty_n),
    .fifo_in_peek_3_empty_n(fifo_Y_pe_abd_Callipepla_3__empty_n),
    .fifo_in_3_read(fifo_Y_pe_abd_Callipepla_3__read),
    .fifo_in_peek_3_read(),
    .fifo_in_4_dout(fifo_Y_pe_abd_Callipepla_4__dout),
    .fifo_in_peek_4_dout(fifo_Y_pe_abd_Callipepla_4__dout),
    .fifo_in_4_empty_n(fifo_Y_pe_abd_Callipepla_4__empty_n),
    .fifo_in_peek_4_empty_n(fifo_Y_pe_abd_Callipepla_4__empty_n),
    .fifo_in_4_read(fifo_Y_pe_abd_Callipepla_4__read),
    .fifo_in_peek_4_read(),
    .fifo_in_5_dout(fifo_Y_pe_abd_Callipepla_5__dout),
    .fifo_in_peek_5_dout(fifo_Y_pe_abd_Callipepla_5__dout),
    .fifo_in_5_empty_n(fifo_Y_pe_abd_Callipepla_5__empty_n),
    .fifo_in_peek_5_empty_n(fifo_Y_pe_abd_Callipepla_5__empty_n),
    .fifo_in_5_read(fifo_Y_pe_abd_Callipepla_5__read),
    .fifo_in_peek_5_read(),
    .fifo_in_6_dout(fifo_Y_pe_abd_Callipepla_6__dout),
    .fifo_in_peek_6_dout(fifo_Y_pe_abd_Callipepla_6__dout),
    .fifo_in_6_empty_n(fifo_Y_pe_abd_Callipepla_6__empty_n),
    .fifo_in_peek_6_empty_n(fifo_Y_pe_abd_Callipepla_6__empty_n),
    .fifo_in_6_read(fifo_Y_pe_abd_Callipepla_6__read),
    .fifo_in_peek_6_read(),
    .fifo_in_7_dout(fifo_Y_pe_abd_Callipepla_7__dout),
    .fifo_in_peek_7_dout(fifo_Y_pe_abd_Callipepla_7__dout),
    .fifo_in_7_empty_n(fifo_Y_pe_abd_Callipepla_7__empty_n),
    .fifo_in_peek_7_empty_n(fifo_Y_pe_abd_Callipepla_7__empty_n),
    .fifo_in_7_read(fifo_Y_pe_abd_Callipepla_7__read),
    .fifo_in_peek_7_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_0__ap_start),
    .ap_done(PEG_Xvec_0__ap_done),
    .ap_idle(PEG_Xvec_0__ap_idle),
    .ap_ready(PEG_Xvec_0__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_0__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_0__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_0__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_0__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_0__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_1__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_1__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_1__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_0__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_0__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_0__write),
    .fifo_A_s_dout(fifo_A_Callipepla_0__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_0__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_0__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_0__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_0__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_0__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_0__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_0__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_0__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_0__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_1__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_1__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_1__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_0__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_0__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_0__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_0__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_0__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_0__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_1__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_1__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_1__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_1__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_1__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_2__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_2__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_2__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_1__ap_start),
    .ap_done(PEG_Xvec_1__ap_done),
    .ap_idle(PEG_Xvec_1__ap_idle),
    .ap_ready(PEG_Xvec_1__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_1__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_1__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_1__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_1__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_1__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_2__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_2__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_2__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_1__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_1__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_1__write),
    .fifo_A_s_dout(fifo_A_Callipepla_1__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_1__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_1__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_1__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_1__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_1__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_1__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_1__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_1__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_1__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_2__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_2__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_2__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_1__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_1__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_1__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_1__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_1__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_1__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_2__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_2__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_2__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_2__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_2__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_3__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_3__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_3__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_2
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_2__ap_start),
    .ap_done(PEG_Xvec_2__ap_done),
    .ap_idle(PEG_Xvec_2__ap_idle),
    .ap_ready(PEG_Xvec_2__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_2__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_2__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_2__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_2__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_2__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_3__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_3__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_3__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_2__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_2__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_2__write),
    .fifo_A_s_dout(fifo_A_Callipepla_2__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_2__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_2__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_2__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_2__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_2__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_2__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_2__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_2__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_2__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_3__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_3__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_3__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_2__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_2__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_2__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_2__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_2__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_2__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_3__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_3__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_3__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_3__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_3__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_4__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_4__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_4__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_3
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_3__ap_start),
    .ap_done(PEG_Xvec_3__ap_done),
    .ap_idle(PEG_Xvec_3__ap_idle),
    .ap_ready(PEG_Xvec_3__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_3__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_3__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_3__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_3__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_3__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_4__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_4__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_4__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_3__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_3__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_3__write),
    .fifo_A_s_dout(fifo_A_Callipepla_3__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_3__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_3__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_3__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_3__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_3__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_3__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_3__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_3__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_3__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_4__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_4__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_4__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_3__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_3__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_3__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_3__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_3__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_3__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_4__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_4__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_4__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_4__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_4__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_5__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_5__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_5__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_4
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_4__ap_start),
    .ap_done(PEG_Xvec_4__ap_done),
    .ap_idle(PEG_Xvec_4__ap_idle),
    .ap_ready(PEG_Xvec_4__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_4__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_4__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_4__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_4__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_4__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_5__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_5__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_5__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_4__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_4__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_4__write),
    .fifo_A_s_dout(fifo_A_Callipepla_4__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_4__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_4__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_4__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_4__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_4__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_4__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_4__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_4__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_4__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_5__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_5__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_5__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_4__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_4__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_4__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_4__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_4__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_4__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_5__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_5__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_5__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_5__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_5__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_6__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_6__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_6__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_5
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_5__ap_start),
    .ap_done(PEG_Xvec_5__ap_done),
    .ap_idle(PEG_Xvec_5__ap_idle),
    .ap_ready(PEG_Xvec_5__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_5__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_5__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_5__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_5__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_5__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_6__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_6__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_6__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_5__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_5__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_5__write),
    .fifo_A_s_dout(fifo_A_Callipepla_5__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_5__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_5__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_5__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_5__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_5__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_5__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_5__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_5__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_5__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_6__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_6__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_6__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_5__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_5__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_5__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_5__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_5__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_5__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_6__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_6__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_6__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_6__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_6__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_7__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_7__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_7__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_6
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_6__ap_start),
    .ap_done(PEG_Xvec_6__ap_done),
    .ap_idle(PEG_Xvec_6__ap_idle),
    .ap_ready(PEG_Xvec_6__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_6__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_6__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_6__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_6__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_6__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_7__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_7__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_7__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_6__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_6__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_6__write),
    .fifo_A_s_dout(fifo_A_Callipepla_6__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_6__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_6__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_6__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_6__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_6__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_6__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_6__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_6__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_6__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_7__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_7__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_7__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_6__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_6__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_6__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_6__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_6__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_6__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_7__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_7__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_7__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_7__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_7__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_8__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_8__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_8__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_7
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_7__ap_start),
    .ap_done(PEG_Xvec_7__ap_done),
    .ap_idle(PEG_Xvec_7__ap_idle),
    .ap_ready(PEG_Xvec_7__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_7__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_7__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_7__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_7__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_7__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_8__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_8__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_8__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_7__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_7__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_7__write),
    .fifo_A_s_dout(fifo_A_Callipepla_7__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_7__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_7__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_7__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_7__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_7__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_7__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_7__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_7__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_7__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_8__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_8__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_8__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_7__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_7__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_7__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_7__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_7__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_7__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_8__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_8__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_8__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_8__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_8__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_9__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_9__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_9__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_8
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_8__ap_start),
    .ap_done(PEG_Xvec_8__ap_done),
    .ap_idle(PEG_Xvec_8__ap_idle),
    .ap_ready(PEG_Xvec_8__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_8__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_8__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_8__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_8__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_8__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_9__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_9__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_9__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_8__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_8__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_8__write),
    .fifo_A_s_dout(fifo_A_Callipepla_8__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_8__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_8__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_8__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_8__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_8__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_8__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_8__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_8__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_8__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_9__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_9__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_9__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_8__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_8__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_8__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_8__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_8__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_8__write),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_10__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_10__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_10__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_9__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_9__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_9__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_9__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_9__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_9
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_9__ap_start),
    .ap_done(PEG_Xvec_9__ap_done),
    .ap_idle(PEG_Xvec_9__ap_idle),
    .ap_ready(PEG_Xvec_9__ap_ready),
    .fifo_inst_out_din(PE_inst_Callipepla_10__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_10__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_10__write),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_9__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_9__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_9__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_9__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_9__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_9__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_9__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_9__write),
    .fifo_A_s_dout(fifo_A_Callipepla_9__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_9__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_9__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_9__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_9__read),
    .fifo_A_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_10__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_10__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_10__write),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_9__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_9__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_9__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_9__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_9__read),
    .fifo_X_in_peek_read(),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_9__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_9__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_9__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_9__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_9__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_9__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_10__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_10__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_10__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_10__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_10__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_11__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_11__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_11__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_10
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_10__ap_start),
    .ap_done(PEG_Xvec_10__ap_done),
    .ap_idle(PEG_Xvec_10__ap_idle),
    .ap_ready(PEG_Xvec_10__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_10__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_10__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_10__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_10__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_10__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_11__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_11__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_11__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_10__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_10__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_10__write),
    .fifo_A_s_dout(fifo_A_Callipepla_10__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_10__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_10__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_10__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_10__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_10__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_10__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_10__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_10__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_10__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_11__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_11__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_11__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_10__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_10__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_10__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_10__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_10__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_10__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_11__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_11__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_11__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_11__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_11__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_12__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_12__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_12__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_11
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_11__ap_start),
    .ap_done(PEG_Xvec_11__ap_done),
    .ap_idle(PEG_Xvec_11__ap_idle),
    .ap_ready(PEG_Xvec_11__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_11__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_11__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_11__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_11__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_11__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_12__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_12__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_12__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_11__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_11__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_11__write),
    .fifo_A_s_dout(fifo_A_Callipepla_11__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_11__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_11__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_11__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_11__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_11__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_11__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_11__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_11__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_11__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_12__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_12__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_12__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_11__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_11__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_11__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_11__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_11__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_11__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_12__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_12__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_12__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_12__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_12__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_13__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_13__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_13__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_12
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_12__ap_start),
    .ap_done(PEG_Xvec_12__ap_done),
    .ap_idle(PEG_Xvec_12__ap_idle),
    .ap_ready(PEG_Xvec_12__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_12__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_12__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_12__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_12__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_12__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_13__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_13__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_13__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_12__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_12__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_12__write),
    .fifo_A_s_dout(fifo_A_Callipepla_12__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_12__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_12__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_12__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_12__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_12__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_12__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_12__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_12__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_12__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_13__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_13__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_13__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_12__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_12__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_12__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_12__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_12__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_12__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_13__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_13__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_13__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_13__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_13__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_14__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_14__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_14__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_13
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_13__ap_start),
    .ap_done(PEG_Xvec_13__ap_done),
    .ap_idle(PEG_Xvec_13__ap_idle),
    .ap_ready(PEG_Xvec_13__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_13__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_13__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_13__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_13__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_13__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_14__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_14__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_14__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_13__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_13__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_13__write),
    .fifo_A_s_dout(fifo_A_Callipepla_13__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_13__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_13__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_13__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_13__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_13__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_13__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_13__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_13__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_13__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_14__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_14__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_14__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_13__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_13__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_13__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_13__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_13__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_13__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_14__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_14__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_14__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_14__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_14__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_15__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_15__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_15__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_14
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_14__ap_start),
    .ap_done(PEG_Xvec_14__ap_done),
    .ap_idle(PEG_Xvec_14__ap_idle),
    .ap_ready(PEG_Xvec_14__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_14__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_14__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_14__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_14__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_14__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_15__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_15__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_15__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_14__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_14__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_14__write),
    .fifo_A_s_dout(fifo_A_Callipepla_14__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_14__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_14__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_14__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_14__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_14__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_14__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_14__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_14__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_14__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_15__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_15__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_15__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_14__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_14__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_14__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_14__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_14__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_14__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_15__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_15__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_15__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_15__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_15__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_16__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_16__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_16__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_15
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_15__ap_start),
    .ap_done(PEG_Xvec_15__ap_done),
    .ap_idle(PEG_Xvec_15__ap_idle),
    .ap_ready(PEG_Xvec_15__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Callipepla_15__dout),
    .fifo_inst_in_peek_dout(PE_inst_Callipepla_15__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Callipepla_15__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Callipepla_15__empty_n),
    .fifo_inst_in_s_read(PE_inst_Callipepla_15__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Callipepla_16__din),
    .fifo_inst_out_full_n(PE_inst_Callipepla_16__full_n),
    .fifo_inst_out_write(PE_inst_Callipepla_16__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Callipepla_15__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Callipepla_15__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Callipepla_15__write),
    .fifo_A_s_dout(fifo_A_Callipepla_15__dout),
    .fifo_A_peek_dout(fifo_A_Callipepla_15__dout),
    .fifo_A_s_empty_n(fifo_A_Callipepla_15__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Callipepla_15__empty_n),
    .fifo_A_s_read(fifo_A_Callipepla_15__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_P_pe_Callipepla_15__dout),
    .fifo_X_in_peek_dout(fifo_P_pe_Callipepla_15__dout),
    .fifo_X_in_s_empty_n(fifo_P_pe_Callipepla_15__empty_n),
    .fifo_X_in_peek_empty_n(fifo_P_pe_Callipepla_15__empty_n),
    .fifo_X_in_s_read(fifo_P_pe_Callipepla_15__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_P_pe_Callipepla_16__din),
    .fifo_X_out_full_n(fifo_P_pe_Callipepla_16__full_n),
    .fifo_X_out_write(fifo_P_pe_Callipepla_16__write),
    .fifo_aXvec_din(fifo_aXvec_Callipepla_15__din),
    .fifo_aXvec_full_n(fifo_aXvec_Callipepla_15__full_n),
    .fifo_aXvec_write(fifo_aXvec_Callipepla_15__write),
    .q_gbc_out_Y_din(tsignal_Y_Callipepla_15__din),
    .q_gbc_out_Y_full_n(tsignal_Y_Callipepla_15__full_n),
    .q_gbc_out_Y_write(tsignal_Y_Callipepla_15__write),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_16__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_16__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_16__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_16__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_16__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_17__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_17__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_17__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_0__ap_start),
    .ap_done(PEG_Yvec_0__ap_done),
    .ap_idle(PEG_Yvec_0__ap_idle),
    .ap_ready(PEG_Yvec_0__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_0__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_0__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_0__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_0__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_0__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_0__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_0__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_0__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_0__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_0__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_0__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_0__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_0__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_0__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_0__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_0__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_0__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_0__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_1__ap_start),
    .ap_done(PEG_Yvec_1__ap_done),
    .ap_idle(PEG_Yvec_1__ap_idle),
    .ap_ready(PEG_Yvec_1__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_1__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_1__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_1__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_1__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_1__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_1__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_1__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_1__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_1__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_1__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_1__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_1__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_1__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_1__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_1__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_1__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_1__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_1__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_2
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_2__ap_start),
    .ap_done(PEG_Yvec_2__ap_done),
    .ap_idle(PEG_Yvec_2__ap_idle),
    .ap_ready(PEG_Yvec_2__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_2__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_2__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_2__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_2__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_2__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_2__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_2__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_2__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_2__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_2__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_2__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_2__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_2__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_2__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_2__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_2__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_2__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_2__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_3
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_3__ap_start),
    .ap_done(PEG_Yvec_3__ap_done),
    .ap_idle(PEG_Yvec_3__ap_idle),
    .ap_ready(PEG_Yvec_3__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_3__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_3__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_3__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_3__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_3__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_3__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_3__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_3__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_3__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_3__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_3__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_3__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_3__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_3__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_3__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_3__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_3__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_3__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_4
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_4__ap_start),
    .ap_done(PEG_Yvec_4__ap_done),
    .ap_idle(PEG_Yvec_4__ap_idle),
    .ap_ready(PEG_Yvec_4__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_4__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_4__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_4__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_4__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_4__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_4__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_4__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_4__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_4__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_4__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_4__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_4__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_4__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_4__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_4__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_4__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_4__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_4__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_5
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_5__ap_start),
    .ap_done(PEG_Yvec_5__ap_done),
    .ap_idle(PEG_Yvec_5__ap_idle),
    .ap_ready(PEG_Yvec_5__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_5__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_5__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_5__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_5__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_5__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_5__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_5__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_5__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_5__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_5__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_5__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_5__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_5__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_5__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_5__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_5__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_5__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_5__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_6
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_6__ap_start),
    .ap_done(PEG_Yvec_6__ap_done),
    .ap_idle(PEG_Yvec_6__ap_idle),
    .ap_ready(PEG_Yvec_6__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_6__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_6__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_6__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_6__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_6__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_6__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_6__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_6__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_6__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_6__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_6__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_6__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_6__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_6__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_6__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_6__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_6__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_6__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_7
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_7__ap_start),
    .ap_done(PEG_Yvec_7__ap_done),
    .ap_idle(PEG_Yvec_7__ap_idle),
    .ap_ready(PEG_Yvec_7__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_7__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_7__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_7__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_7__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_7__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_7__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_7__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_7__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_7__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_7__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_7__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_7__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_7__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_7__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_7__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_7__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_7__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_7__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_8
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_8__ap_start),
    .ap_done(PEG_Yvec_8__ap_done),
    .ap_idle(PEG_Yvec_8__ap_idle),
    .ap_ready(PEG_Yvec_8__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_8__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_8__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_8__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_8__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_8__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_8__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_8__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_8__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_8__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_8__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_8__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_8__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_8__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_8__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_8__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_8__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_8__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_8__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_9
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_9__ap_start),
    .ap_done(PEG_Yvec_9__ap_done),
    .ap_idle(PEG_Yvec_9__ap_idle),
    .ap_ready(PEG_Yvec_9__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_9__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_9__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_9__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_9__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_9__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_9__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_9__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_9__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_9__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_9__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_9__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_9__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_9__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_9__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_9__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_9__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_9__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_9__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_10
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_10__ap_start),
    .ap_done(PEG_Yvec_10__ap_done),
    .ap_idle(PEG_Yvec_10__ap_idle),
    .ap_ready(PEG_Yvec_10__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_10__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_10__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_10__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_10__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_10__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_10__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_10__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_10__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_10__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_10__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_10__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_10__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_10__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_10__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_10__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_10__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_10__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_10__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_11
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_11__ap_start),
    .ap_done(PEG_Yvec_11__ap_done),
    .ap_idle(PEG_Yvec_11__ap_idle),
    .ap_ready(PEG_Yvec_11__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_11__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_11__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_11__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_11__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_11__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_11__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_11__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_11__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_11__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_11__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_11__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_11__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_11__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_11__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_11__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_11__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_11__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_11__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_12
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_12__ap_start),
    .ap_done(PEG_Yvec_12__ap_done),
    .ap_idle(PEG_Yvec_12__ap_idle),
    .ap_ready(PEG_Yvec_12__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_12__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_12__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_12__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_12__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_12__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_12__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_12__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_12__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_12__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_12__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_12__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_12__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_12__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_12__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_12__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_12__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_12__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_12__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_13
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_13__ap_start),
    .ap_done(PEG_Yvec_13__ap_done),
    .ap_idle(PEG_Yvec_13__ap_idle),
    .ap_ready(PEG_Yvec_13__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_13__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_13__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_13__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_13__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_13__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_13__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_13__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_13__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_13__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_13__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_13__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_13__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_13__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_13__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_13__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_13__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_13__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_13__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_14
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_14__ap_start),
    .ap_done(PEG_Yvec_14__ap_done),
    .ap_idle(PEG_Yvec_14__ap_idle),
    .ap_ready(PEG_Yvec_14__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_14__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_14__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_14__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_14__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_14__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_14__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_14__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_14__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_14__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_14__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_14__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_14__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_14__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_14__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_14__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_14__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_14__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_14__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_15
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_15__ap_start),
    .ap_done(PEG_Yvec_15__ap_done),
    .ap_idle(PEG_Yvec_15__ap_idle),
    .ap_ready(PEG_Yvec_15__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Callipepla_15__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Callipepla_15__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Callipepla_15__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Callipepla_15__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Callipepla_15__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Callipepla_15__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Callipepla_15__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Callipepla_15__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Callipepla_15__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Callipepla_15__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Callipepla_15__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Callipepla_15__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Callipepla_15__read),
    .fifo_aXvec_peek_read(),
    .q_gbc_s_dout(tsignal_Y_Callipepla_15__dout),
    .q_gbc_peek_dout(tsignal_Y_Callipepla_15__dout),
    .q_gbc_s_empty_n(tsignal_Y_Callipepla_15__empty_n),
    .q_gbc_peek_empty_n(tsignal_Y_Callipepla_15__empty_n),
    .q_gbc_s_read(tsignal_Y_Callipepla_15__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) black_hole_bool
  black_hole_bool_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(black_hole_bool_0__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .fifo_in_s_dout(tsignal_rdA_Callipepla_16__dout),
    .fifo_in_peek_dout(tsignal_rdA_Callipepla_16__dout),
    .fifo_in_s_empty_n(tsignal_rdA_Callipepla_16__empty_n),
    .fifo_in_peek_empty_n(tsignal_rdA_Callipepla_16__empty_n),
    .fifo_in_s_read(tsignal_rdA_Callipepla_16__read),
    .fifo_in_peek_read()
  );


  (* keep_hierarchy = "yes" *) black_hole_bool
  black_hole_bool_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(black_hole_bool_1__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .fifo_in_s_dout(tsignal_edgepointer_Callipepla_17__dout),
    .fifo_in_peek_dout(tsignal_edgepointer_Callipepla_17__dout),
    .fifo_in_s_empty_n(tsignal_edgepointer_Callipepla_17__empty_n),
    .fifo_in_peek_empty_n(tsignal_edgepointer_Callipepla_17__empty_n),
    .fifo_in_s_read(tsignal_edgepointer_Callipepla_17__read),
    .fifo_in_peek_read()
  );


  (* keep_hierarchy = "yes" *) black_hole_double_v8
  black_hole_double_v8_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(black_hole_double_v8_0__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .fifo_in_s_dout(fifo_P_pe_Callipepla_16__dout),
    .fifo_in_peek_dout(fifo_P_pe_Callipepla_16__dout),
    .fifo_in_s_empty_n(fifo_P_pe_Callipepla_16__empty_n),
    .fifo_in_peek_empty_n(fifo_P_pe_Callipepla_16__empty_n),
    .fifo_in_s_read(fifo_P_pe_Callipepla_16__read),
    .fifo_in_peek_read()
  );


  (* keep_hierarchy = "yes" *) black_hole_int
  black_hole_int_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(black_hole_int_0__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .fifo_in_s_dout(PE_inst_Callipepla_16__dout),
    .fifo_in_peek_dout(PE_inst_Callipepla_16__dout),
    .fifo_in_s_empty_n(PE_inst_Callipepla_16__empty_n),
    .fifo_in_peek_empty_n(PE_inst_Callipepla_16__empty_n),
    .fifo_in_s_read(PE_inst_Callipepla_16__read),
    .fifo_in_peek_read()
  );


  (* keep_hierarchy = "yes" *) ctrl_AP
  ctrl_AP_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ctrl_AP_0__ap_start),
    .ap_done(ctrl_AP_0__ap_done),
    .ap_idle(ctrl_AP_0__ap_idle),
    .ap_ready(ctrl_AP_0__ap_ready),
    .M(ctrl_AP_0___M__q0),
    .q_updr_din(fifo_AP_Callipepla__din),
    .q_updr_full_n(fifo_AP_Callipepla__full_n),
    .q_updr_write(fifo_AP_Callipepla__write),
    .q_pe_s_dout(fifo_AP_M1_Callipepla_0__dout),
    .q_pe_peek_dout(fifo_AP_M1_Callipepla_0__dout),
    .q_pe_s_empty_n(fifo_AP_M1_Callipepla_0__empty_n),
    .q_pe_peek_empty_n(fifo_AP_M1_Callipepla_0__empty_n),
    .q_pe_s_read(fifo_AP_M1_Callipepla_0__read),
    .q_pe_peek_read(),
    .qm_din_s_dout(fifo_din_AP_Callipepla__dout),
    .qm_din_peek_dout(fifo_din_AP_Callipepla__dout),
    .qm_din_s_empty_n(fifo_din_AP_Callipepla__empty_n),
    .qm_din_peek_empty_n(fifo_din_AP_Callipepla__empty_n),
    .qm_din_s_read(fifo_din_AP_Callipepla__read),
    .qm_din_peek_read(),
    .qm_dout_din(fifo_dout_AP_Callipepla__din),
    .qm_dout_full_n(fifo_dout_AP_Callipepla__full_n),
    .qm_dout_write(fifo_dout_AP_Callipepla__write),
    .q_inst_din(fifo_mi_AP_Callipepla__din),
    .q_inst_full_n(fifo_mi_AP_Callipepla__full_n),
    .q_inst_write(fifo_mi_AP_Callipepla__write),
    .q_res_s_dout(fifo_resp_AP_Callipepla__dout),
    .q_res_peek_dout(fifo_resp_AP_Callipepla__dout),
    .q_res_s_empty_n(fifo_resp_AP_Callipepla__empty_n),
    .q_res_peek_empty_n(fifo_resp_AP_Callipepla__empty_n),
    .q_res_s_read(fifo_resp_AP_Callipepla__read),
    .q_res_peek_read(),
    .rp_time(ctrl_AP_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_ctrlAP_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_ctrlAP_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_ctrlAP_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_ctrlAP_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_ctrlAP_Callipepla__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_ctrldigA_Callipepla__din),
    .q_gbc_out_full_n(tsignal_ctrldigA_Callipepla__full_n),
    .q_gbc_out_write(tsignal_ctrldigA_Callipepla__write)
  );


  (* keep_hierarchy = "yes" *) ctrl_P
  ctrl_P_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ctrl_P_0__ap_start),
    .ap_done(ctrl_P_0__ap_done),
    .ap_idle(ctrl_P_0__ap_idle),
    .ap_ready(ctrl_P_0__ap_ready),
    .M(ctrl_P_0___M__q0),
    .q_dotp_din(fifo_P_dot_Callipepla__din),
    .q_dotp_full_n(fifo_P_dot_Callipepla__full_n),
    .q_dotp_write(fifo_P_dot_Callipepla__write),
    .q_spmv_din(fifo_P_from_mem_Callipepla__din),
    .q_spmv_full_n(fifo_P_from_mem_Callipepla__full_n),
    .q_spmv_write(fifo_P_from_mem_Callipepla__write),
    .q_updated_s_dout(fifo_P_updated_Callipepla__dout),
    .q_updated_peek_dout(fifo_P_updated_Callipepla__dout),
    .q_updated_s_empty_n(fifo_P_updated_Callipepla__empty_n),
    .q_updated_peek_empty_n(fifo_P_updated_Callipepla__empty_n),
    .q_updated_s_read(fifo_P_updated_Callipepla__read),
    .q_updated_peek_read(),
    .q_updtp_din(fifo_P_updtp_Callipepla__din),
    .q_updtp_full_n(fifo_P_updtp_Callipepla__full_n),
    .q_updtp_write(fifo_P_updtp_Callipepla__write),
    .qm_din_0_dout(fifo_din_P_Callipepla_0__dout),
    .qm_din_peek_0_dout(fifo_din_P_Callipepla_0__dout),
    .qm_din_0_empty_n(fifo_din_P_Callipepla_0__empty_n),
    .qm_din_peek_0_empty_n(fifo_din_P_Callipepla_0__empty_n),
    .qm_din_0_read(fifo_din_P_Callipepla_0__read),
    .qm_din_peek_0_read(),
    .qm_din_1_dout(fifo_din_P_Callipepla_1__dout),
    .qm_din_peek_1_dout(fifo_din_P_Callipepla_1__dout),
    .qm_din_1_empty_n(fifo_din_P_Callipepla_1__empty_n),
    .qm_din_peek_1_empty_n(fifo_din_P_Callipepla_1__empty_n),
    .qm_din_1_read(fifo_din_P_Callipepla_1__read),
    .qm_din_peek_1_read(),
    .qm_dout_0_din(fifo_dout_P_Callipepla_0__din),
    .qm_dout_0_full_n(fifo_dout_P_Callipepla_0__full_n),
    .qm_dout_0_write(fifo_dout_P_Callipepla_0__write),
    .qm_dout_1_din(fifo_dout_P_Callipepla_1__din),
    .qm_dout_1_full_n(fifo_dout_P_Callipepla_1__full_n),
    .qm_dout_1_write(fifo_dout_P_Callipepla_1__write),
    .q_inst_0_din(fifo_mi_P_Callipepla_0__din),
    .q_inst_0_full_n(fifo_mi_P_Callipepla_0__full_n),
    .q_inst_0_write(fifo_mi_P_Callipepla_0__write),
    .q_inst_1_din(fifo_mi_P_Callipepla_1__din),
    .q_inst_1_full_n(fifo_mi_P_Callipepla_1__full_n),
    .q_inst_1_write(fifo_mi_P_Callipepla_1__write),
    .q_res_0_dout(fifo_resp_P_Callipepla_0__dout),
    .q_res_peek_0_dout(fifo_resp_P_Callipepla_0__dout),
    .q_res_0_empty_n(fifo_resp_P_Callipepla_0__empty_n),
    .q_res_peek_0_empty_n(fifo_resp_P_Callipepla_0__empty_n),
    .q_res_0_read(fifo_resp_P_Callipepla_0__read),
    .q_res_peek_0_read(),
    .q_res_1_dout(fifo_resp_P_Callipepla_1__dout),
    .q_res_peek_1_dout(fifo_resp_P_Callipepla_1__dout),
    .q_res_1_empty_n(fifo_resp_P_Callipepla_1__empty_n),
    .q_res_peek_1_empty_n(fifo_resp_P_Callipepla_1__empty_n),
    .q_res_1_read(fifo_resp_P_Callipepla_1__read),
    .q_res_peek_1_read(),
    .rp_time(ctrl_P_0___rp_time__q0),
    .q_gbc_out_din(tsignal_ctrlAP_Callipepla__din),
    .q_gbc_out_full_n(tsignal_ctrlAP_Callipepla__full_n),
    .q_gbc_out_write(tsignal_ctrlAP_Callipepla__write),
    .q_gbc_s_dout(tsignal_ctrlP_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_ctrlP_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_ctrlP_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_ctrlP_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_ctrlP_Callipepla__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) ctrl_R
  ctrl_R_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ctrl_R_0__ap_start),
    .ap_done(ctrl_R_0__ap_done),
    .ap_idle(ctrl_R_0__ap_idle),
    .ap_ready(ctrl_R_0__ap_ready),
    .M(ctrl_R_0___M__q0),
    .qr_to_pe_din(fifo_R_Callipepla__din),
    .qr_to_pe_full_n(fifo_R_Callipepla__full_n),
    .qr_to_pe_write(fifo_R_Callipepla__write),
    .qr_from_pe_s_dout(fifo_R_tomem_Callipepla__dout),
    .qr_from_pe_peek_dout(fifo_R_tomem_Callipepla__dout),
    .qr_from_pe_s_empty_n(fifo_R_tomem_Callipepla__empty_n),
    .qr_from_pe_peek_empty_n(fifo_R_tomem_Callipepla__empty_n),
    .qr_from_pe_s_read(fifo_R_tomem_Callipepla__read),
    .qr_from_pe_peek_read(),
    .qm_din_0_dout(fifo_din_R_Callipepla_0__dout),
    .qm_din_peek_0_dout(fifo_din_R_Callipepla_0__dout),
    .qm_din_0_empty_n(fifo_din_R_Callipepla_0__empty_n),
    .qm_din_peek_0_empty_n(fifo_din_R_Callipepla_0__empty_n),
    .qm_din_0_read(fifo_din_R_Callipepla_0__read),
    .qm_din_peek_0_read(),
    .qm_din_1_dout(fifo_din_R_Callipepla_1__dout),
    .qm_din_peek_1_dout(fifo_din_R_Callipepla_1__dout),
    .qm_din_1_empty_n(fifo_din_R_Callipepla_1__empty_n),
    .qm_din_peek_1_empty_n(fifo_din_R_Callipepla_1__empty_n),
    .qm_din_1_read(fifo_din_R_Callipepla_1__read),
    .qm_din_peek_1_read(),
    .qm_dout_0_din(fifo_dout_R_Callipepla_0__din),
    .qm_dout_0_full_n(fifo_dout_R_Callipepla_0__full_n),
    .qm_dout_0_write(fifo_dout_R_Callipepla_0__write),
    .qm_dout_1_din(fifo_dout_R_Callipepla_1__din),
    .qm_dout_1_full_n(fifo_dout_R_Callipepla_1__full_n),
    .qm_dout_1_write(fifo_dout_R_Callipepla_1__write),
    .q_inst_0_din(fifo_mi_R_Callipepla_0__din),
    .q_inst_0_full_n(fifo_mi_R_Callipepla_0__full_n),
    .q_inst_0_write(fifo_mi_R_Callipepla_0__write),
    .q_inst_1_din(fifo_mi_R_Callipepla_1__din),
    .q_inst_1_full_n(fifo_mi_R_Callipepla_1__full_n),
    .q_inst_1_write(fifo_mi_R_Callipepla_1__write),
    .q_res_0_dout(fifo_resp_R_Callipepla_0__dout),
    .q_res_peek_0_dout(fifo_resp_R_Callipepla_0__dout),
    .q_res_0_empty_n(fifo_resp_R_Callipepla_0__empty_n),
    .q_res_peek_0_empty_n(fifo_resp_R_Callipepla_0__empty_n),
    .q_res_0_read(fifo_resp_R_Callipepla_0__read),
    .q_res_peek_0_read(),
    .q_res_1_dout(fifo_resp_R_Callipepla_1__dout),
    .q_res_peek_1_dout(fifo_resp_R_Callipepla_1__dout),
    .q_res_1_empty_n(fifo_resp_R_Callipepla_1__empty_n),
    .q_res_peek_1_empty_n(fifo_resp_R_Callipepla_1__empty_n),
    .q_res_1_read(fifo_resp_R_Callipepla_1__read),
    .q_res_peek_1_read(),
    .rp_time(ctrl_R_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_ctrlR_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_ctrlR_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_ctrlR_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_ctrlR_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_ctrlR_Callipepla__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_ctrlX_Callipepla__din),
    .q_gbc_out_full_n(tsignal_ctrlX_Callipepla__full_n),
    .q_gbc_out_write(tsignal_ctrlX_Callipepla__write)
  );


  (* keep_hierarchy = "yes" *) ctrl_X
  ctrl_X_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ctrl_X_0__ap_start),
    .ap_done(ctrl_X_0__ap_done),
    .ap_idle(ctrl_X_0__ap_idle),
    .ap_ready(ctrl_X_0__ap_ready),
    .M(ctrl_X_0___M__q0),
    .q_oldx_din(fifo_X_Callipepla__din),
    .q_oldx_full_n(fifo_X_Callipepla__full_n),
    .q_oldx_write(fifo_X_Callipepla__write),
    .q_newx_s_dout(fifo_X_updated_Callipepla__dout),
    .q_newx_peek_dout(fifo_X_updated_Callipepla__dout),
    .q_newx_s_empty_n(fifo_X_updated_Callipepla__empty_n),
    .q_newx_peek_empty_n(fifo_X_updated_Callipepla__empty_n),
    .q_newx_s_read(fifo_X_updated_Callipepla__read),
    .q_newx_peek_read(),
    .qm_din_0_dout(fifo_din_X_Callipepla_0__dout),
    .qm_din_peek_0_dout(fifo_din_X_Callipepla_0__dout),
    .qm_din_0_empty_n(fifo_din_X_Callipepla_0__empty_n),
    .qm_din_peek_0_empty_n(fifo_din_X_Callipepla_0__empty_n),
    .qm_din_0_read(fifo_din_X_Callipepla_0__read),
    .qm_din_peek_0_read(),
    .qm_din_1_dout(fifo_din_X_Callipepla_1__dout),
    .qm_din_peek_1_dout(fifo_din_X_Callipepla_1__dout),
    .qm_din_1_empty_n(fifo_din_X_Callipepla_1__empty_n),
    .qm_din_peek_1_empty_n(fifo_din_X_Callipepla_1__empty_n),
    .qm_din_1_read(fifo_din_X_Callipepla_1__read),
    .qm_din_peek_1_read(),
    .qm_dout_0_din(fifo_dout_X_Callipepla_0__din),
    .qm_dout_0_full_n(fifo_dout_X_Callipepla_0__full_n),
    .qm_dout_0_write(fifo_dout_X_Callipepla_0__write),
    .qm_dout_1_din(fifo_dout_X_Callipepla_1__din),
    .qm_dout_1_full_n(fifo_dout_X_Callipepla_1__full_n),
    .qm_dout_1_write(fifo_dout_X_Callipepla_1__write),
    .q_inst_0_din(fifo_mi_X_Callipepla_0__din),
    .q_inst_0_full_n(fifo_mi_X_Callipepla_0__full_n),
    .q_inst_0_write(fifo_mi_X_Callipepla_0__write),
    .q_inst_1_din(fifo_mi_X_Callipepla_1__din),
    .q_inst_1_full_n(fifo_mi_X_Callipepla_1__full_n),
    .q_inst_1_write(fifo_mi_X_Callipepla_1__write),
    .q_res_0_dout(fifo_resp_X_Callipepla_0__dout),
    .q_res_peek_0_dout(fifo_resp_X_Callipepla_0__dout),
    .q_res_0_empty_n(fifo_resp_X_Callipepla_0__empty_n),
    .q_res_peek_0_empty_n(fifo_resp_X_Callipepla_0__empty_n),
    .q_res_0_read(fifo_resp_X_Callipepla_0__read),
    .q_res_peek_0_read(),
    .q_res_1_dout(fifo_resp_X_Callipepla_1__dout),
    .q_res_peek_1_dout(fifo_resp_X_Callipepla_1__dout),
    .q_res_1_empty_n(fifo_resp_X_Callipepla_1__empty_n),
    .q_res_peek_1_empty_n(fifo_resp_X_Callipepla_1__empty_n),
    .q_res_1_read(fifo_resp_X_Callipepla_1__read),
    .q_res_peek_1_read(),
    .rp_time(ctrl_X_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_ctrlX_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_ctrlX_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_ctrlX_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_ctrlX_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_ctrlX_Callipepla__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) dot_alpha
  dot_alpha_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(dot_alpha_0__ap_start),
    .ap_done(dot_alpha_0__ap_done),
    .ap_idle(dot_alpha_0__ap_idle),
    .ap_ready(dot_alpha_0__ap_ready),
    .M(dot_alpha_0___M__q0),
    .q2_s_dout(fifo_AP_M1_Callipepla_1__dout),
    .q2_peek_dout(fifo_AP_M1_Callipepla_1__dout),
    .q2_s_empty_n(fifo_AP_M1_Callipepla_1__empty_n),
    .q2_peek_empty_n(fifo_AP_M1_Callipepla_1__empty_n),
    .q2_s_read(fifo_AP_M1_Callipepla_1__read),
    .q2_peek_read(),
    .q1_s_dout(fifo_P_dot_Callipepla__dout),
    .q1_peek_dout(fifo_P_dot_Callipepla__dout),
    .q1_s_empty_n(fifo_P_dot_Callipepla__empty_n),
    .q1_peek_empty_n(fifo_P_dot_Callipepla__empty_n),
    .q1_s_read(fifo_P_dot_Callipepla__read),
    .q1_peek_read(),
    .q3_0_din(fifo_alpha_Callipepla_0__din),
    .q3_0_full_n(fifo_alpha_Callipepla_0__full_n),
    .q3_0_write(fifo_alpha_Callipepla_0__write),
    .q3_1_din(fifo_alpha_Callipepla_1__din),
    .q3_1_full_n(fifo_alpha_Callipepla_1__full_n),
    .q3_1_write(fifo_alpha_Callipepla_1__write),
    .qrz_s_dout(fifo_rz_Callipepla_0__dout),
    .qrz_peek_dout(fifo_rz_Callipepla_0__dout),
    .qrz_s_empty_n(fifo_rz_Callipepla_0__empty_n),
    .qrz_peek_empty_n(fifo_rz_Callipepla_0__empty_n),
    .qrz_s_read(fifo_rz_Callipepla_0__read),
    .qrz_peek_read(),
    .rp_time(dot_alpha_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_aby_Callipepla_8__dout),
    .q_gbc_peek_dout(tsignal_aby_Callipepla_8__dout),
    .q_gbc_s_empty_n(tsignal_aby_Callipepla_8__empty_n),
    .q_gbc_peek_empty_n(tsignal_aby_Callipepla_8__empty_n),
    .q_gbc_s_read(tsignal_aby_Callipepla_8__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_toM4_Callipepla__din),
    .q_gbc_out_full_n(tsignal_toM4_Callipepla__full_n),
    .q_gbc_out_write(tsignal_toM4_Callipepla__write)
  );


  (* keep_hierarchy = "yes" *) dot_res
  dot_res_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(dot_res_0__ap_start),
    .ap_done(dot_res_0__ap_done),
    .ap_idle(dot_res_0__ap_idle),
    .ap_ready(dot_res_0__ap_ready),
    .M(dot_res_0___M__q0),
    .q2_din(fifo_RR_Callipepla__din),
    .q2_full_n(fifo_RR_Callipepla__full_n),
    .q2_write(fifo_RR_Callipepla__write),
    .q1_s_dout(fifo_R_updtd_rr_Callipepla__dout),
    .q1_peek_dout(fifo_R_updtd_rr_Callipepla__dout),
    .q1_s_empty_n(fifo_R_updtd_rr_Callipepla__empty_n),
    .q1_peek_empty_n(fifo_R_updtd_rr_Callipepla__empty_n),
    .q1_s_read(fifo_R_updtd_rr_Callipepla__read),
    .q1_peek_read(),
    .rp_time(dot_res_0___rp_time__q0),
    .th_termination(dot_res_0___th_termination__q0),
    .q_termination_din(tsignal_res_Callipepla__din),
    .q_termination_full_n(tsignal_res_Callipepla__full_n),
    .q_termination_write(tsignal_res_Callipepla__write)
  );


  (* keep_hierarchy = "yes" *) dot_rznew
  dot_rznew_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(dot_rznew_0__ap_start),
    .ap_done(dot_rznew_0__ap_done),
    .ap_idle(dot_rznew_0__ap_idle),
    .ap_ready(dot_rznew_0__ap_ready),
    .M(dot_rznew_0___M__q0),
    .qr_s_dout(fifo_R_updtd_m6_Callipepla__dout),
    .qr_peek_dout(fifo_R_updtd_m6_Callipepla__dout),
    .qr_s_empty_n(fifo_R_updtd_m6_Callipepla__empty_n),
    .qr_peek_empty_n(fifo_R_updtd_m6_Callipepla__empty_n),
    .qr_s_read(fifo_R_updtd_m6_Callipepla__read),
    .qr_peek_read(),
    .qr_out_din(fifo_R_updtd_rr_Callipepla__din),
    .qr_out_full_n(fifo_R_updtd_rr_Callipepla__full_n),
    .qr_out_write(fifo_R_updtd_rr_Callipepla__write),
    .qz_s_dout(fifo_Z_Callipepla_0__dout),
    .qz_peek_dout(fifo_Z_Callipepla_0__dout),
    .qz_s_empty_n(fifo_Z_Callipepla_0__empty_n),
    .qz_peek_empty_n(fifo_Z_Callipepla_0__empty_n),
    .qz_s_read(fifo_Z_Callipepla_0__read),
    .qz_peek_read(),
    .qrz_0_din(fifo_rz_Callipepla_0__din),
    .qrz_0_full_n(fifo_rz_Callipepla_0__full_n),
    .qrz_0_write(fifo_rz_Callipepla_0__write),
    .qrz_1_din(fifo_rz_Callipepla_1__din),
    .qrz_1_full_n(fifo_rz_Callipepla_1__full_n),
    .qrz_1_write(fifo_rz_Callipepla_1__write),
    .rp_time(dot_rznew_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_toM6_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_toM6_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_toM6_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_toM6_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_toM6_Callipepla__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_toM7_Callipepla__din),
    .q_gbc_out_full_n(tsignal_toM7_Callipepla__full_n),
    .q_gbc_out_write(tsignal_toM7_Callipepla__write)
  );


  (* keep_hierarchy = "yes" *) duplicator
  duplicator_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(duplicator_0__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .q_in_s_dout(fifo_P_to_dup_Callipepla__dout),
    .q_in_peek_dout(fifo_P_to_dup_Callipepla__dout),
    .q_in_s_empty_n(fifo_P_to_dup_Callipepla__empty_n),
    .q_in_peek_empty_n(fifo_P_to_dup_Callipepla__empty_n),
    .q_in_s_read(fifo_P_to_dup_Callipepla__read),
    .q_in_peek_read(),
    .q_out2_din(fifo_P_to_mux_Callipepla__din),
    .q_out2_full_n(fifo_P_to_mux_Callipepla__full_n),
    .q_out2_write(fifo_P_to_mux_Callipepla__write),
    .q_out1_din(fifo_P_updated_Callipepla__din),
    .q_out1_full_n(fifo_P_updated_Callipepla__full_n),
    .q_out1_write(fifo_P_updated_Callipepla__write)
  );


  (* keep_hierarchy = "yes" *) left_div
  left_div_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(left_div_0__ap_start),
    .ap_done(left_div_0__ap_done),
    .ap_idle(left_div_0__ap_idle),
    .ap_ready(left_div_0__ap_ready),
    .M(left_div_0___M__q0),
    .qrmem_din(fifo_R_tomem_Callipepla__din),
    .qrmem_full_n(fifo_R_tomem_Callipepla__full_n),
    .qrmem_write(fifo_R_tomem_Callipepla__write),
    .qr_s_dout(fifo_R_updtd_m5_Callipepla__dout),
    .qr_peek_dout(fifo_R_updtd_m5_Callipepla__dout),
    .qr_s_empty_n(fifo_R_updtd_m5_Callipepla__empty_n),
    .qr_peek_empty_n(fifo_R_updtd_m5_Callipepla__empty_n),
    .qr_s_read(fifo_R_updtd_m5_Callipepla__read),
    .qr_peek_read(),
    .qr_m6_din(fifo_R_updtd_m6_Callipepla__din),
    .qr_m6_full_n(fifo_R_updtd_m6_Callipepla__full_n),
    .qr_m6_write(fifo_R_updtd_m6_Callipepla__write),
    .qz_0_din(fifo_Z_Callipepla_0__din),
    .qz_0_full_n(fifo_Z_Callipepla_0__full_n),
    .qz_0_write(fifo_Z_Callipepla_0__write),
    .qz_1_din(fifo_Z_Callipepla_1__din),
    .qz_1_full_n(fifo_Z_Callipepla_1__full_n),
    .qz_1_write(fifo_Z_Callipepla_1__write),
    .qdiagA_s_dout(fifo_dA_Callipepla__dout),
    .qdiagA_peek_dout(fifo_dA_Callipepla__dout),
    .qdiagA_s_empty_n(fifo_dA_Callipepla__empty_n),
    .qdiagA_peek_empty_n(fifo_dA_Callipepla__empty_n),
    .qdiagA_s_read(fifo_dA_Callipepla__read),
    .qdiagA_peek_read(),
    .rp_time(left_div_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_toM5_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_toM5_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_toM5_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_toM5_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_toM5_Callipepla__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_toM6_Callipepla__din),
    .q_gbc_out_full_n(tsignal_toM6_Callipepla__full_n),
    .q_gbc_out_write(tsignal_toM6_Callipepla__write)
  );


  (* keep_hierarchy = "yes" *) rdwr_vec
  rdwr_vec_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(rdwr_vec_0__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .q_dout_din(fifo_din_P_Callipepla_0__din),
    .q_dout_full_n(fifo_din_P_Callipepla_0__full_n),
    .q_dout_write(fifo_din_P_Callipepla_0__write),
    .q_din_s_dout(fifo_dout_P_Callipepla_0__dout),
    .q_din_peek_dout(fifo_dout_P_Callipepla_0__dout),
    .q_din_s_empty_n(fifo_dout_P_Callipepla_0__empty_n),
    .q_din_peek_empty_n(fifo_dout_P_Callipepla_0__empty_n),
    .q_din_s_read(fifo_dout_P_Callipepla_0__read),
    .q_din_peek_read(),
    .q_inst_s_dout(fifo_mi_P_Callipepla_0__dout),
    .q_inst_peek_dout(fifo_mi_P_Callipepla_0__dout),
    .q_inst_s_empty_n(fifo_mi_P_Callipepla_0__empty_n),
    .q_inst_peek_empty_n(fifo_mi_P_Callipepla_0__empty_n),
    .q_inst_s_read(fifo_mi_P_Callipepla_0__read),
    .q_inst_peek_read(),
    .q_response_din(fifo_resp_P_Callipepla_0__din),
    .q_response_full_n(fifo_resp_P_Callipepla_0__full_n),
    .q_response_write(fifo_resp_P_Callipepla_0__write),
    .vec_p_read_addr_din(vec_p_0_read_addr__din),
    .vec_p_read_addr_full_n(vec_p_0_read_addr__full_n),
    .vec_p_read_addr_write(vec_p_0_read_addr__write),
    .vec_p_read_data_s_dout({1'b0, vec_p_0_read_data__dout}),
    .vec_p_read_data_peek_dout({1'b0, vec_p_0_read_data__dout}),
    .vec_p_read_data_s_empty_n(vec_p_0_read_data__empty_n),
    .vec_p_read_data_peek_empty_n(vec_p_0_read_data__empty_n),
    .vec_p_read_data_s_read(vec_p_0_read_data__read),
    .vec_p_read_data_peek_read(),
    .vec_p_write_addr_din(vec_p_0_write_addr__din),
    .vec_p_write_addr_full_n(vec_p_0_write_addr__full_n),
    .vec_p_write_addr_write(vec_p_0_write_addr__write),
    .vec_p_write_data_din(vec_p_0_write_data__din),
    .vec_p_write_data_full_n(vec_p_0_write_data__full_n),
    .vec_p_write_data_write(vec_p_0_write_data__write),
    .vec_p_write_resp_s_dout({1'b0, vec_p_0_write_resp__dout}),
    .vec_p_write_resp_peek_dout({1'b0, vec_p_0_write_resp__dout}),
    .vec_p_write_resp_s_empty_n(vec_p_0_write_resp__empty_n),
    .vec_p_write_resp_peek_empty_n(vec_p_0_write_resp__empty_n),
    .vec_p_write_resp_s_read(vec_p_0_write_resp__read),
    .vec_p_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) rdwr_vec
  rdwr_vec_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(rdwr_vec_1__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .q_dout_din(fifo_din_P_Callipepla_1__din),
    .q_dout_full_n(fifo_din_P_Callipepla_1__full_n),
    .q_dout_write(fifo_din_P_Callipepla_1__write),
    .q_din_s_dout(fifo_dout_P_Callipepla_1__dout),
    .q_din_peek_dout(fifo_dout_P_Callipepla_1__dout),
    .q_din_s_empty_n(fifo_dout_P_Callipepla_1__empty_n),
    .q_din_peek_empty_n(fifo_dout_P_Callipepla_1__empty_n),
    .q_din_s_read(fifo_dout_P_Callipepla_1__read),
    .q_din_peek_read(),
    .q_inst_s_dout(fifo_mi_P_Callipepla_1__dout),
    .q_inst_peek_dout(fifo_mi_P_Callipepla_1__dout),
    .q_inst_s_empty_n(fifo_mi_P_Callipepla_1__empty_n),
    .q_inst_peek_empty_n(fifo_mi_P_Callipepla_1__empty_n),
    .q_inst_s_read(fifo_mi_P_Callipepla_1__read),
    .q_inst_peek_read(),
    .q_response_din(fifo_resp_P_Callipepla_1__din),
    .q_response_full_n(fifo_resp_P_Callipepla_1__full_n),
    .q_response_write(fifo_resp_P_Callipepla_1__write),
    .vec_p_read_addr_din(vec_p_1_read_addr__din),
    .vec_p_read_addr_full_n(vec_p_1_read_addr__full_n),
    .vec_p_read_addr_write(vec_p_1_read_addr__write),
    .vec_p_read_data_s_dout({1'b0, vec_p_1_read_data__dout}),
    .vec_p_read_data_peek_dout({1'b0, vec_p_1_read_data__dout}),
    .vec_p_read_data_s_empty_n(vec_p_1_read_data__empty_n),
    .vec_p_read_data_peek_empty_n(vec_p_1_read_data__empty_n),
    .vec_p_read_data_s_read(vec_p_1_read_data__read),
    .vec_p_read_data_peek_read(),
    .vec_p_write_addr_din(vec_p_1_write_addr__din),
    .vec_p_write_addr_full_n(vec_p_1_write_addr__full_n),
    .vec_p_write_addr_write(vec_p_1_write_addr__write),
    .vec_p_write_data_din(vec_p_1_write_data__din),
    .vec_p_write_data_full_n(vec_p_1_write_data__full_n),
    .vec_p_write_data_write(vec_p_1_write_data__write),
    .vec_p_write_resp_s_dout({1'b0, vec_p_1_write_resp__dout}),
    .vec_p_write_resp_peek_dout({1'b0, vec_p_1_write_resp__dout}),
    .vec_p_write_resp_s_empty_n(vec_p_1_write_resp__empty_n),
    .vec_p_write_resp_peek_empty_n(vec_p_1_write_resp__empty_n),
    .vec_p_write_resp_s_read(vec_p_1_write_resp__read),
    .vec_p_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) rdwr_vec
  rdwr_vec_2
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(rdwr_vec_2__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .q_dout_din(fifo_din_R_Callipepla_0__din),
    .q_dout_full_n(fifo_din_R_Callipepla_0__full_n),
    .q_dout_write(fifo_din_R_Callipepla_0__write),
    .q_din_s_dout(fifo_dout_R_Callipepla_0__dout),
    .q_din_peek_dout(fifo_dout_R_Callipepla_0__dout),
    .q_din_s_empty_n(fifo_dout_R_Callipepla_0__empty_n),
    .q_din_peek_empty_n(fifo_dout_R_Callipepla_0__empty_n),
    .q_din_s_read(fifo_dout_R_Callipepla_0__read),
    .q_din_peek_read(),
    .q_inst_s_dout(fifo_mi_R_Callipepla_0__dout),
    .q_inst_peek_dout(fifo_mi_R_Callipepla_0__dout),
    .q_inst_s_empty_n(fifo_mi_R_Callipepla_0__empty_n),
    .q_inst_peek_empty_n(fifo_mi_R_Callipepla_0__empty_n),
    .q_inst_s_read(fifo_mi_R_Callipepla_0__read),
    .q_inst_peek_read(),
    .q_response_din(fifo_resp_R_Callipepla_0__din),
    .q_response_full_n(fifo_resp_R_Callipepla_0__full_n),
    .q_response_write(fifo_resp_R_Callipepla_0__write),
    .vec_p_read_addr_din(vec_r_0_read_addr__din),
    .vec_p_read_addr_full_n(vec_r_0_read_addr__full_n),
    .vec_p_read_addr_write(vec_r_0_read_addr__write),
    .vec_p_read_data_s_dout({1'b0, vec_r_0_read_data__dout}),
    .vec_p_read_data_peek_dout({1'b0, vec_r_0_read_data__dout}),
    .vec_p_read_data_s_empty_n(vec_r_0_read_data__empty_n),
    .vec_p_read_data_peek_empty_n(vec_r_0_read_data__empty_n),
    .vec_p_read_data_s_read(vec_r_0_read_data__read),
    .vec_p_read_data_peek_read(),
    .vec_p_write_addr_din(vec_r_0_write_addr__din),
    .vec_p_write_addr_full_n(vec_r_0_write_addr__full_n),
    .vec_p_write_addr_write(vec_r_0_write_addr__write),
    .vec_p_write_data_din(vec_r_0_write_data__din),
    .vec_p_write_data_full_n(vec_r_0_write_data__full_n),
    .vec_p_write_data_write(vec_r_0_write_data__write),
    .vec_p_write_resp_s_dout({1'b0, vec_r_0_write_resp__dout}),
    .vec_p_write_resp_peek_dout({1'b0, vec_r_0_write_resp__dout}),
    .vec_p_write_resp_s_empty_n(vec_r_0_write_resp__empty_n),
    .vec_p_write_resp_peek_empty_n(vec_r_0_write_resp__empty_n),
    .vec_p_write_resp_s_read(vec_r_0_write_resp__read),
    .vec_p_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) rdwr_vec
  rdwr_vec_3
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(rdwr_vec_3__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .q_dout_din(fifo_din_R_Callipepla_1__din),
    .q_dout_full_n(fifo_din_R_Callipepla_1__full_n),
    .q_dout_write(fifo_din_R_Callipepla_1__write),
    .q_din_s_dout(fifo_dout_R_Callipepla_1__dout),
    .q_din_peek_dout(fifo_dout_R_Callipepla_1__dout),
    .q_din_s_empty_n(fifo_dout_R_Callipepla_1__empty_n),
    .q_din_peek_empty_n(fifo_dout_R_Callipepla_1__empty_n),
    .q_din_s_read(fifo_dout_R_Callipepla_1__read),
    .q_din_peek_read(),
    .q_inst_s_dout(fifo_mi_R_Callipepla_1__dout),
    .q_inst_peek_dout(fifo_mi_R_Callipepla_1__dout),
    .q_inst_s_empty_n(fifo_mi_R_Callipepla_1__empty_n),
    .q_inst_peek_empty_n(fifo_mi_R_Callipepla_1__empty_n),
    .q_inst_s_read(fifo_mi_R_Callipepla_1__read),
    .q_inst_peek_read(),
    .q_response_din(fifo_resp_R_Callipepla_1__din),
    .q_response_full_n(fifo_resp_R_Callipepla_1__full_n),
    .q_response_write(fifo_resp_R_Callipepla_1__write),
    .vec_p_read_addr_din(vec_r_1_read_addr__din),
    .vec_p_read_addr_full_n(vec_r_1_read_addr__full_n),
    .vec_p_read_addr_write(vec_r_1_read_addr__write),
    .vec_p_read_data_s_dout({1'b0, vec_r_1_read_data__dout}),
    .vec_p_read_data_peek_dout({1'b0, vec_r_1_read_data__dout}),
    .vec_p_read_data_s_empty_n(vec_r_1_read_data__empty_n),
    .vec_p_read_data_peek_empty_n(vec_r_1_read_data__empty_n),
    .vec_p_read_data_s_read(vec_r_1_read_data__read),
    .vec_p_read_data_peek_read(),
    .vec_p_write_addr_din(vec_r_1_write_addr__din),
    .vec_p_write_addr_full_n(vec_r_1_write_addr__full_n),
    .vec_p_write_addr_write(vec_r_1_write_addr__write),
    .vec_p_write_data_din(vec_r_1_write_data__din),
    .vec_p_write_data_full_n(vec_r_1_write_data__full_n),
    .vec_p_write_data_write(vec_r_1_write_data__write),
    .vec_p_write_resp_s_dout({1'b0, vec_r_1_write_resp__dout}),
    .vec_p_write_resp_peek_dout({1'b0, vec_r_1_write_resp__dout}),
    .vec_p_write_resp_s_empty_n(vec_r_1_write_resp__empty_n),
    .vec_p_write_resp_peek_empty_n(vec_r_1_write_resp__empty_n),
    .vec_p_write_resp_s_read(vec_r_1_write_resp__read),
    .vec_p_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) rdwr_vec
  rdwr_vec_4
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(rdwr_vec_4__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .q_dout_din(fifo_din_X_Callipepla_0__din),
    .q_dout_full_n(fifo_din_X_Callipepla_0__full_n),
    .q_dout_write(fifo_din_X_Callipepla_0__write),
    .q_din_s_dout(fifo_dout_X_Callipepla_0__dout),
    .q_din_peek_dout(fifo_dout_X_Callipepla_0__dout),
    .q_din_s_empty_n(fifo_dout_X_Callipepla_0__empty_n),
    .q_din_peek_empty_n(fifo_dout_X_Callipepla_0__empty_n),
    .q_din_s_read(fifo_dout_X_Callipepla_0__read),
    .q_din_peek_read(),
    .q_inst_s_dout(fifo_mi_X_Callipepla_0__dout),
    .q_inst_peek_dout(fifo_mi_X_Callipepla_0__dout),
    .q_inst_s_empty_n(fifo_mi_X_Callipepla_0__empty_n),
    .q_inst_peek_empty_n(fifo_mi_X_Callipepla_0__empty_n),
    .q_inst_s_read(fifo_mi_X_Callipepla_0__read),
    .q_inst_peek_read(),
    .q_response_din(fifo_resp_X_Callipepla_0__din),
    .q_response_full_n(fifo_resp_X_Callipepla_0__full_n),
    .q_response_write(fifo_resp_X_Callipepla_0__write),
    .vec_p_read_addr_din(vec_x_0_read_addr__din),
    .vec_p_read_addr_full_n(vec_x_0_read_addr__full_n),
    .vec_p_read_addr_write(vec_x_0_read_addr__write),
    .vec_p_read_data_s_dout({1'b0, vec_x_0_read_data__dout}),
    .vec_p_read_data_peek_dout({1'b0, vec_x_0_read_data__dout}),
    .vec_p_read_data_s_empty_n(vec_x_0_read_data__empty_n),
    .vec_p_read_data_peek_empty_n(vec_x_0_read_data__empty_n),
    .vec_p_read_data_s_read(vec_x_0_read_data__read),
    .vec_p_read_data_peek_read(),
    .vec_p_write_addr_din(vec_x_0_write_addr__din),
    .vec_p_write_addr_full_n(vec_x_0_write_addr__full_n),
    .vec_p_write_addr_write(vec_x_0_write_addr__write),
    .vec_p_write_data_din(vec_x_0_write_data__din),
    .vec_p_write_data_full_n(vec_x_0_write_data__full_n),
    .vec_p_write_data_write(vec_x_0_write_data__write),
    .vec_p_write_resp_s_dout({1'b0, vec_x_0_write_resp__dout}),
    .vec_p_write_resp_peek_dout({1'b0, vec_x_0_write_resp__dout}),
    .vec_p_write_resp_s_empty_n(vec_x_0_write_resp__empty_n),
    .vec_p_write_resp_peek_empty_n(vec_x_0_write_resp__empty_n),
    .vec_p_write_resp_s_read(vec_x_0_write_resp__read),
    .vec_p_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) rdwr_vec
  rdwr_vec_5
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(rdwr_vec_5__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .q_dout_din(fifo_din_X_Callipepla_1__din),
    .q_dout_full_n(fifo_din_X_Callipepla_1__full_n),
    .q_dout_write(fifo_din_X_Callipepla_1__write),
    .q_din_s_dout(fifo_dout_X_Callipepla_1__dout),
    .q_din_peek_dout(fifo_dout_X_Callipepla_1__dout),
    .q_din_s_empty_n(fifo_dout_X_Callipepla_1__empty_n),
    .q_din_peek_empty_n(fifo_dout_X_Callipepla_1__empty_n),
    .q_din_s_read(fifo_dout_X_Callipepla_1__read),
    .q_din_peek_read(),
    .q_inst_s_dout(fifo_mi_X_Callipepla_1__dout),
    .q_inst_peek_dout(fifo_mi_X_Callipepla_1__dout),
    .q_inst_s_empty_n(fifo_mi_X_Callipepla_1__empty_n),
    .q_inst_peek_empty_n(fifo_mi_X_Callipepla_1__empty_n),
    .q_inst_s_read(fifo_mi_X_Callipepla_1__read),
    .q_inst_peek_read(),
    .q_response_din(fifo_resp_X_Callipepla_1__din),
    .q_response_full_n(fifo_resp_X_Callipepla_1__full_n),
    .q_response_write(fifo_resp_X_Callipepla_1__write),
    .vec_p_read_addr_din(vec_x_1_read_addr__din),
    .vec_p_read_addr_full_n(vec_x_1_read_addr__full_n),
    .vec_p_read_addr_write(vec_x_1_read_addr__write),
    .vec_p_read_data_s_dout({1'b0, vec_x_1_read_data__dout}),
    .vec_p_read_data_peek_dout({1'b0, vec_x_1_read_data__dout}),
    .vec_p_read_data_s_empty_n(vec_x_1_read_data__empty_n),
    .vec_p_read_data_peek_empty_n(vec_x_1_read_data__empty_n),
    .vec_p_read_data_s_read(vec_x_1_read_data__read),
    .vec_p_read_data_peek_read(),
    .vec_p_write_addr_din(vec_x_1_write_addr__din),
    .vec_p_write_addr_full_n(vec_x_1_write_addr__full_n),
    .vec_p_write_addr_write(vec_x_1_write_addr__write),
    .vec_p_write_data_din(vec_x_1_write_data__din),
    .vec_p_write_data_full_n(vec_x_1_write_data__full_n),
    .vec_p_write_data_write(vec_x_1_write_data__write),
    .vec_p_write_resp_s_dout({1'b0, vec_x_1_write_resp__dout}),
    .vec_p_write_resp_peek_dout({1'b0, vec_x_1_write_resp__dout}),
    .vec_p_write_resp_s_empty_n(vec_x_1_write_resp__empty_n),
    .vec_p_write_resp_peek_empty_n(vec_x_1_write_resp__empty_n),
    .vec_p_write_resp_s_read(vec_x_1_write_resp__read),
    .vec_p_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) rdwr_vec
  rdwr_vec_6
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(rdwr_vec_6__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .q_dout_din(fifo_din_AP_Callipepla__din),
    .q_dout_full_n(fifo_din_AP_Callipepla__full_n),
    .q_dout_write(fifo_din_AP_Callipepla__write),
    .q_din_s_dout(fifo_dout_AP_Callipepla__dout),
    .q_din_peek_dout(fifo_dout_AP_Callipepla__dout),
    .q_din_s_empty_n(fifo_dout_AP_Callipepla__empty_n),
    .q_din_peek_empty_n(fifo_dout_AP_Callipepla__empty_n),
    .q_din_s_read(fifo_dout_AP_Callipepla__read),
    .q_din_peek_read(),
    .q_inst_s_dout(fifo_mi_AP_Callipepla__dout),
    .q_inst_peek_dout(fifo_mi_AP_Callipepla__dout),
    .q_inst_s_empty_n(fifo_mi_AP_Callipepla__empty_n),
    .q_inst_peek_empty_n(fifo_mi_AP_Callipepla__empty_n),
    .q_inst_s_read(fifo_mi_AP_Callipepla__read),
    .q_inst_peek_read(),
    .q_response_din(fifo_resp_AP_Callipepla__din),
    .q_response_full_n(fifo_resp_AP_Callipepla__full_n),
    .q_response_write(fifo_resp_AP_Callipepla__write),
    .vec_p_read_addr_din(vec_Ap_read_addr__din),
    .vec_p_read_addr_full_n(vec_Ap_read_addr__full_n),
    .vec_p_read_addr_write(vec_Ap_read_addr__write),
    .vec_p_read_data_s_dout({1'b0, vec_Ap_read_data__dout}),
    .vec_p_read_data_peek_dout({1'b0, vec_Ap_read_data__dout}),
    .vec_p_read_data_s_empty_n(vec_Ap_read_data__empty_n),
    .vec_p_read_data_peek_empty_n(vec_Ap_read_data__empty_n),
    .vec_p_read_data_s_read(vec_Ap_read_data__read),
    .vec_p_read_data_peek_read(),
    .vec_p_write_addr_din(vec_Ap_write_addr__din),
    .vec_p_write_addr_full_n(vec_Ap_write_addr__full_n),
    .vec_p_write_addr_write(vec_Ap_write_addr__write),
    .vec_p_write_data_din(vec_Ap_write_data__din),
    .vec_p_write_data_full_n(vec_Ap_write_data__full_n),
    .vec_p_write_data_write(vec_Ap_write_data__write),
    .vec_p_write_resp_s_dout({1'b0, vec_Ap_write_resp__dout}),
    .vec_p_write_resp_peek_dout({1'b0, vec_Ap_write_resp__dout}),
    .vec_p_write_resp_s_empty_n(vec_Ap_write_resp__empty_n),
    .vec_p_write_resp_peek_empty_n(vec_Ap_write_resp__empty_n),
    .vec_p_write_resp_s_read(vec_Ap_write_resp__read),
    .vec_p_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_0__ap_start),
    .ap_done(read_A_0__ap_done),
    .ap_idle(read_A_0__ap_idle),
    .ap_ready(read_A_0__ap_ready),
    .A_len(read_A_0___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_0_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_0_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_0_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_0_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_0_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_0_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_0_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_0_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_0_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_0_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_0_write_addr__write),
    .A_write_data_din(edge_list_ch_0_write_data__din),
    .A_write_data_full_n(edge_list_ch_0_write_data__full_n),
    .A_write_data_write(edge_list_ch_0_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_0_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_0_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_0_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_0_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_0_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_0__din),
    .fifo_A_full_n(fifo_A_Callipepla_0__full_n),
    .fifo_A_write(fifo_A_Callipepla_0__write),
    .rp_time(read_A_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_0__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_0__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_0__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_0__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_0__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_1__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_1__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_1__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_1__ap_start),
    .ap_done(read_A_1__ap_done),
    .ap_idle(read_A_1__ap_idle),
    .ap_ready(read_A_1__ap_ready),
    .A_len(read_A_1___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_1_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_1_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_1_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_1_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_1_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_1_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_1_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_1_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_1_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_1_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_1_write_addr__write),
    .A_write_data_din(edge_list_ch_1_write_data__din),
    .A_write_data_full_n(edge_list_ch_1_write_data__full_n),
    .A_write_data_write(edge_list_ch_1_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_1_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_1_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_1_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_1_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_1_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_1__din),
    .fifo_A_full_n(fifo_A_Callipepla_1__full_n),
    .fifo_A_write(fifo_A_Callipepla_1__write),
    .rp_time(read_A_1___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_1__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_1__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_1__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_1__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_1__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_2__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_2__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_2__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_2
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_2__ap_start),
    .ap_done(read_A_2__ap_done),
    .ap_idle(read_A_2__ap_idle),
    .ap_ready(read_A_2__ap_ready),
    .A_len(read_A_2___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_2_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_2_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_2_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_2_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_2_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_2_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_2_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_2_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_2_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_2_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_2_write_addr__write),
    .A_write_data_din(edge_list_ch_2_write_data__din),
    .A_write_data_full_n(edge_list_ch_2_write_data__full_n),
    .A_write_data_write(edge_list_ch_2_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_2_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_2_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_2_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_2_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_2_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_2__din),
    .fifo_A_full_n(fifo_A_Callipepla_2__full_n),
    .fifo_A_write(fifo_A_Callipepla_2__write),
    .rp_time(read_A_2___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_2__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_2__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_2__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_2__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_2__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_3__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_3__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_3__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_3
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_3__ap_start),
    .ap_done(read_A_3__ap_done),
    .ap_idle(read_A_3__ap_idle),
    .ap_ready(read_A_3__ap_ready),
    .A_len(read_A_3___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_3_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_3_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_3_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_3_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_3_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_3_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_3_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_3_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_3_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_3_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_3_write_addr__write),
    .A_write_data_din(edge_list_ch_3_write_data__din),
    .A_write_data_full_n(edge_list_ch_3_write_data__full_n),
    .A_write_data_write(edge_list_ch_3_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_3_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_3_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_3_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_3_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_3_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_3__din),
    .fifo_A_full_n(fifo_A_Callipepla_3__full_n),
    .fifo_A_write(fifo_A_Callipepla_3__write),
    .rp_time(read_A_3___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_3__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_3__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_3__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_3__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_3__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_4__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_4__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_4__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_4
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_4__ap_start),
    .ap_done(read_A_4__ap_done),
    .ap_idle(read_A_4__ap_idle),
    .ap_ready(read_A_4__ap_ready),
    .A_len(read_A_4___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_4_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_4_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_4_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_4_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_4_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_4_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_4_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_4_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_4_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_4_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_4_write_addr__write),
    .A_write_data_din(edge_list_ch_4_write_data__din),
    .A_write_data_full_n(edge_list_ch_4_write_data__full_n),
    .A_write_data_write(edge_list_ch_4_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_4_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_4_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_4_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_4_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_4_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_4__din),
    .fifo_A_full_n(fifo_A_Callipepla_4__full_n),
    .fifo_A_write(fifo_A_Callipepla_4__write),
    .rp_time(read_A_4___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_4__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_4__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_4__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_4__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_4__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_5__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_5__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_5__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_5
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_5__ap_start),
    .ap_done(read_A_5__ap_done),
    .ap_idle(read_A_5__ap_idle),
    .ap_ready(read_A_5__ap_ready),
    .A_len(read_A_5___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_5_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_5_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_5_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_5_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_5_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_5_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_5_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_5_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_5_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_5_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_5_write_addr__write),
    .A_write_data_din(edge_list_ch_5_write_data__din),
    .A_write_data_full_n(edge_list_ch_5_write_data__full_n),
    .A_write_data_write(edge_list_ch_5_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_5_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_5_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_5_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_5_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_5_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_5__din),
    .fifo_A_full_n(fifo_A_Callipepla_5__full_n),
    .fifo_A_write(fifo_A_Callipepla_5__write),
    .rp_time(read_A_5___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_5__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_5__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_5__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_5__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_5__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_6__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_6__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_6__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_6
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_6__ap_start),
    .ap_done(read_A_6__ap_done),
    .ap_idle(read_A_6__ap_idle),
    .ap_ready(read_A_6__ap_ready),
    .A_len(read_A_6___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_6_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_6_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_6_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_6_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_6_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_6_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_6_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_6_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_6_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_6_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_6_write_addr__write),
    .A_write_data_din(edge_list_ch_6_write_data__din),
    .A_write_data_full_n(edge_list_ch_6_write_data__full_n),
    .A_write_data_write(edge_list_ch_6_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_6_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_6_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_6_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_6_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_6_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_6__din),
    .fifo_A_full_n(fifo_A_Callipepla_6__full_n),
    .fifo_A_write(fifo_A_Callipepla_6__write),
    .rp_time(read_A_6___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_6__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_6__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_6__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_6__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_6__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_7__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_7__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_7__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_7
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_7__ap_start),
    .ap_done(read_A_7__ap_done),
    .ap_idle(read_A_7__ap_idle),
    .ap_ready(read_A_7__ap_ready),
    .A_len(read_A_7___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_7_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_7_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_7_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_7_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_7_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_7_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_7_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_7_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_7_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_7_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_7_write_addr__write),
    .A_write_data_din(edge_list_ch_7_write_data__din),
    .A_write_data_full_n(edge_list_ch_7_write_data__full_n),
    .A_write_data_write(edge_list_ch_7_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_7_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_7_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_7_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_7_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_7_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_7__din),
    .fifo_A_full_n(fifo_A_Callipepla_7__full_n),
    .fifo_A_write(fifo_A_Callipepla_7__write),
    .rp_time(read_A_7___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_7__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_7__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_7__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_7__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_7__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_8__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_8__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_8__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_8
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_8__ap_start),
    .ap_done(read_A_8__ap_done),
    .ap_idle(read_A_8__ap_idle),
    .ap_ready(read_A_8__ap_ready),
    .A_len(read_A_8___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_8_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_8_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_8_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_8_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_8_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_8_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_8_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_8_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_8_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_8_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_8_write_addr__write),
    .A_write_data_din(edge_list_ch_8_write_data__din),
    .A_write_data_full_n(edge_list_ch_8_write_data__full_n),
    .A_write_data_write(edge_list_ch_8_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_8_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_8_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_8_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_8_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_8_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_8__din),
    .fifo_A_full_n(fifo_A_Callipepla_8__full_n),
    .fifo_A_write(fifo_A_Callipepla_8__write),
    .rp_time(read_A_8___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_8__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_8__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_8__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_8__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_8__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_9__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_9__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_9__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_9
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_9__ap_start),
    .ap_done(read_A_9__ap_done),
    .ap_idle(read_A_9__ap_idle),
    .ap_ready(read_A_9__ap_ready),
    .A_len(read_A_9___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_9_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_9_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_9_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_9_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_9_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_9_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_9_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_9_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_9_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_9_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_9_write_addr__write),
    .A_write_data_din(edge_list_ch_9_write_data__din),
    .A_write_data_full_n(edge_list_ch_9_write_data__full_n),
    .A_write_data_write(edge_list_ch_9_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_9_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_9_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_9_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_9_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_9_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_9__din),
    .fifo_A_full_n(fifo_A_Callipepla_9__full_n),
    .fifo_A_write(fifo_A_Callipepla_9__write),
    .rp_time(read_A_9___rp_time__q0),
    .q_gbc_out_din(tsignal_rdA_Callipepla_10__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_10__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_10__write),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_9__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_9__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_9__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_9__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_9__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_10
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_10__ap_start),
    .ap_done(read_A_10__ap_done),
    .ap_idle(read_A_10__ap_idle),
    .ap_ready(read_A_10__ap_ready),
    .A_len(read_A_10___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_10_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_10_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_10_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_10_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_10_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_10_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_10_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_10_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_10_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_10_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_10_write_addr__write),
    .A_write_data_din(edge_list_ch_10_write_data__din),
    .A_write_data_full_n(edge_list_ch_10_write_data__full_n),
    .A_write_data_write(edge_list_ch_10_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_10_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_10_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_10_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_10_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_10_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_10__din),
    .fifo_A_full_n(fifo_A_Callipepla_10__full_n),
    .fifo_A_write(fifo_A_Callipepla_10__write),
    .rp_time(read_A_10___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_10__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_10__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_10__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_10__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_10__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_11__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_11__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_11__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_11
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_11__ap_start),
    .ap_done(read_A_11__ap_done),
    .ap_idle(read_A_11__ap_idle),
    .ap_ready(read_A_11__ap_ready),
    .A_len(read_A_11___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_11_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_11_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_11_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_11_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_11_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_11_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_11_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_11_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_11_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_11_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_11_write_addr__write),
    .A_write_data_din(edge_list_ch_11_write_data__din),
    .A_write_data_full_n(edge_list_ch_11_write_data__full_n),
    .A_write_data_write(edge_list_ch_11_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_11_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_11_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_11_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_11_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_11_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_11__din),
    .fifo_A_full_n(fifo_A_Callipepla_11__full_n),
    .fifo_A_write(fifo_A_Callipepla_11__write),
    .rp_time(read_A_11___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_11__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_11__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_11__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_11__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_11__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_12__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_12__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_12__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_12
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_12__ap_start),
    .ap_done(read_A_12__ap_done),
    .ap_idle(read_A_12__ap_idle),
    .ap_ready(read_A_12__ap_ready),
    .A_len(read_A_12___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_12_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_12_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_12_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_12_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_12_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_12_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_12_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_12_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_12_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_12_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_12_write_addr__write),
    .A_write_data_din(edge_list_ch_12_write_data__din),
    .A_write_data_full_n(edge_list_ch_12_write_data__full_n),
    .A_write_data_write(edge_list_ch_12_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_12_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_12_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_12_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_12_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_12_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_12__din),
    .fifo_A_full_n(fifo_A_Callipepla_12__full_n),
    .fifo_A_write(fifo_A_Callipepla_12__write),
    .rp_time(read_A_12___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_12__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_12__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_12__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_12__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_12__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_13__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_13__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_13__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_13
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_13__ap_start),
    .ap_done(read_A_13__ap_done),
    .ap_idle(read_A_13__ap_idle),
    .ap_ready(read_A_13__ap_ready),
    .A_len(read_A_13___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_13_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_13_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_13_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_13_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_13_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_13_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_13_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_13_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_13_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_13_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_13_write_addr__write),
    .A_write_data_din(edge_list_ch_13_write_data__din),
    .A_write_data_full_n(edge_list_ch_13_write_data__full_n),
    .A_write_data_write(edge_list_ch_13_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_13_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_13_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_13_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_13_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_13_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_13__din),
    .fifo_A_full_n(fifo_A_Callipepla_13__full_n),
    .fifo_A_write(fifo_A_Callipepla_13__write),
    .rp_time(read_A_13___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_13__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_13__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_13__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_13__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_13__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_14__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_14__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_14__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_14
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_14__ap_start),
    .ap_done(read_A_14__ap_done),
    .ap_idle(read_A_14__ap_idle),
    .ap_ready(read_A_14__ap_ready),
    .A_len(read_A_14___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_14_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_14_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_14_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_14_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_14_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_14_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_14_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_14_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_14_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_14_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_14_write_addr__write),
    .A_write_data_din(edge_list_ch_14_write_data__din),
    .A_write_data_full_n(edge_list_ch_14_write_data__full_n),
    .A_write_data_write(edge_list_ch_14_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_14_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_14_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_14_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_14_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_14_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_14__din),
    .fifo_A_full_n(fifo_A_Callipepla_14__full_n),
    .fifo_A_write(fifo_A_Callipepla_14__write),
    .rp_time(read_A_14___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_14__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_14__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_14__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_14__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_14__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_15__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_15__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_15__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_15
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_15__ap_start),
    .ap_done(read_A_15__ap_done),
    .ap_idle(read_A_15__ap_idle),
    .ap_ready(read_A_15__ap_ready),
    .A_len(read_A_15___NUM_A_LEN__q0),
    .A_read_addr_din(edge_list_ch_15_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_15_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_15_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_15_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_15_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_15_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_15_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_15_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_15_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_15_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_15_write_addr__write),
    .A_write_data_din(edge_list_ch_15_write_data__din),
    .A_write_data_full_n(edge_list_ch_15_write_data__full_n),
    .A_write_data_write(edge_list_ch_15_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_15_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_15_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_15_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_15_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_15_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Callipepla_15__din),
    .fifo_A_full_n(fifo_A_Callipepla_15__full_n),
    .fifo_A_write(fifo_A_Callipepla_15__write),
    .rp_time(read_A_15___rp_time__q0),
    .q_gbc_s_dout(tsignal_rdA_Callipepla_15__dout),
    .q_gbc_peek_dout(tsignal_rdA_Callipepla_15__dout),
    .q_gbc_s_empty_n(tsignal_rdA_Callipepla_15__empty_n),
    .q_gbc_peek_empty_n(tsignal_rdA_Callipepla_15__empty_n),
    .q_gbc_s_read(tsignal_rdA_Callipepla_15__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_rdA_Callipepla_16__din),
    .q_gbc_out_full_n(tsignal_rdA_Callipepla_16__full_n),
    .q_gbc_out_write(tsignal_rdA_Callipepla_16__write)
  );


  (* keep_hierarchy = "yes" *) read_digA
  read_digA_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_digA_0__ap_start),
    .ap_done(read_digA_0__ap_done),
    .ap_idle(read_digA_0__ap_idle),
    .ap_ready(read_digA_0__ap_ready),
    .M(read_digA_0___M__q0),
    .q_dout_din(fifo_dA_Callipepla__din),
    .q_dout_full_n(fifo_dA_Callipepla__full_n),
    .q_dout_write(fifo_dA_Callipepla__write),
    .rp_time(read_digA_0___rp_time__q0),
    .q_gbc_out_din(tsignal_ctrlR_Callipepla__din),
    .q_gbc_out_full_n(tsignal_ctrlR_Callipepla__full_n),
    .q_gbc_out_write(tsignal_ctrlR_Callipepla__write),
    .q_gbc_s_dout(tsignal_ctrldigA_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_ctrldigA_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_ctrldigA_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_ctrldigA_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_ctrldigA_Callipepla__read),
    .q_gbc_peek_read(),
    .vec_mem_read_addr_din(vec_digA_read_addr__din),
    .vec_mem_read_addr_full_n(vec_digA_read_addr__full_n),
    .vec_mem_read_addr_write(vec_digA_read_addr__write),
    .vec_mem_read_data_s_dout({1'b0, vec_digA_read_data__dout}),
    .vec_mem_read_data_peek_dout({1'b0, vec_digA_read_data__dout}),
    .vec_mem_read_data_s_empty_n(vec_digA_read_data__empty_n),
    .vec_mem_read_data_peek_empty_n(vec_digA_read_data__empty_n),
    .vec_mem_read_data_s_read(vec_digA_read_data__read),
    .vec_mem_read_data_peek_read(),
    .vec_mem_write_addr_din(vec_digA_write_addr__din),
    .vec_mem_write_addr_full_n(vec_digA_write_addr__full_n),
    .vec_mem_write_addr_write(vec_digA_write_addr__write),
    .vec_mem_write_data_din(vec_digA_write_data__din),
    .vec_mem_write_data_full_n(vec_digA_write_data__full_n),
    .vec_mem_write_data_write(vec_digA_write_data__write),
    .vec_mem_write_resp_s_dout({1'b0, vec_digA_write_resp__dout}),
    .vec_mem_write_resp_peek_dout({1'b0, vec_digA_write_resp__dout}),
    .vec_mem_write_resp_s_empty_n(vec_digA_write_resp__empty_n),
    .vec_mem_write_resp_peek_empty_n(vec_digA_write_resp__empty_n),
    .vec_mem_write_resp_s_read(vec_digA_write_resp__read),
    .vec_mem_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) read_edge_list_ptr
  read_edge_list_ptr_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_edge_list_ptr_0__ap_start),
    .ap_done(read_edge_list_ptr_0__ap_done),
    .ap_idle(read_edge_list_ptr_0__ap_idle),
    .ap_ready(read_edge_list_ptr_0__ap_ready),
    .M(read_edge_list_ptr_0___M__q0),
    .num_ite(read_edge_list_ptr_0___NUM_ITE__q0),
    .PE_inst_din(PE_inst_Callipepla_0__din),
    .PE_inst_full_n(PE_inst_Callipepla_0__full_n),
    .PE_inst_write(PE_inst_Callipepla_0__write),
    .edge_list_ptr_read_addr_din(edge_list_ptr_read_addr__din),
    .edge_list_ptr_read_addr_full_n(edge_list_ptr_read_addr__full_n),
    .edge_list_ptr_read_addr_write(edge_list_ptr_read_addr__write),
    .edge_list_ptr_read_data_s_dout({1'b0, edge_list_ptr_read_data__dout}),
    .edge_list_ptr_read_data_peek_dout({1'b0, edge_list_ptr_read_data__dout}),
    .edge_list_ptr_read_data_s_empty_n(edge_list_ptr_read_data__empty_n),
    .edge_list_ptr_read_data_peek_empty_n(edge_list_ptr_read_data__empty_n),
    .edge_list_ptr_read_data_s_read(edge_list_ptr_read_data__read),
    .edge_list_ptr_read_data_peek_read(),
    .edge_list_ptr_write_addr_din(edge_list_ptr_write_addr__din),
    .edge_list_ptr_write_addr_full_n(edge_list_ptr_write_addr__full_n),
    .edge_list_ptr_write_addr_write(edge_list_ptr_write_addr__write),
    .edge_list_ptr_write_data_din(edge_list_ptr_write_data__din),
    .edge_list_ptr_write_data_full_n(edge_list_ptr_write_data__full_n),
    .edge_list_ptr_write_data_write(edge_list_ptr_write_data__write),
    .edge_list_ptr_write_resp_s_dout({1'b0, edge_list_ptr_write_resp__dout}),
    .edge_list_ptr_write_resp_peek_dout({1'b0, edge_list_ptr_write_resp__dout}),
    .edge_list_ptr_write_resp_s_empty_n(edge_list_ptr_write_resp__empty_n),
    .edge_list_ptr_write_resp_peek_empty_n(edge_list_ptr_write_resp__empty_n),
    .edge_list_ptr_write_resp_s_read(edge_list_ptr_write_resp__read),
    .edge_list_ptr_write_resp_peek_read(),
    .rp_time(read_edge_list_ptr_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_edgepointer_Callipepla_0__dout),
    .q_gbc_peek_dout(tsignal_edgepointer_Callipepla_0__dout),
    .q_gbc_s_empty_n(tsignal_edgepointer_Callipepla_0__empty_n),
    .q_gbc_peek_empty_n(tsignal_edgepointer_Callipepla_0__empty_n),
    .q_gbc_s_read(tsignal_edgepointer_Callipepla_0__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_edgepointer_Callipepla_1__din),
    .q_gbc_out_full_n(tsignal_edgepointer_Callipepla_1__full_n),
    .q_gbc_out_write(tsignal_edgepointer_Callipepla_1__write)
  );


  (* keep_hierarchy = "yes" *) term_signal_router
  term_signal_router_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(term_signal_router_0__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .q_to_abiter_din(tsignal_aby_Callipepla_0__din),
    .q_to_abiter_full_n(tsignal_aby_Callipepla_0__full_n),
    .q_to_abiter_write(tsignal_aby_Callipepla_0__write),
    .q_to_ctrlmem_din(tsignal_ctrlP_Callipepla__din),
    .q_to_ctrlmem_full_n(tsignal_ctrlP_Callipepla__full_n),
    .q_to_ctrlmem_write(tsignal_ctrlP_Callipepla__write),
    .q_to_edgepointer_din(tsignal_edgepointer_Callipepla_0__din),
    .q_to_edgepointer_full_n(tsignal_edgepointer_Callipepla_0__full_n),
    .q_to_edgepointer_write(tsignal_edgepointer_Callipepla_0__write),
    .q_to_mux_din(tsignal_mux_Callipepla__din),
    .q_to_mux_full_n(tsignal_mux_Callipepla__full_n),
    .q_to_mux_write(tsignal_mux_Callipepla__write),
    .q_to_rdA_din(tsignal_rdA_Callipepla_0__din),
    .q_to_rdA_full_n(tsignal_rdA_Callipepla_0__full_n),
    .q_to_rdA_write(tsignal_rdA_Callipepla_0__write),
    .q_gbc_s_dout(tsignal_res_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_res_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_res_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_res_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_res_Callipepla__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) updt_p
  updt_p_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(updt_p_0__ap_start),
    .ap_done(updt_p_0__ap_done),
    .ap_idle(updt_p_0__ap_idle),
    .ap_ready(updt_p_0__ap_ready),
    .M(updt_p_0___M__q0),
    .qout_din(fifo_P_to_dup_Callipepla__din),
    .qout_full_n(fifo_P_to_dup_Callipepla__full_n),
    .qout_write(fifo_P_to_dup_Callipepla__write),
    .qp_s_dout(fifo_P_updtp_Callipepla__dout),
    .qp_peek_dout(fifo_P_updtp_Callipepla__dout),
    .qp_s_empty_n(fifo_P_updtp_Callipepla__empty_n),
    .qp_peek_empty_n(fifo_P_updtp_Callipepla__empty_n),
    .qp_s_read(fifo_P_updtp_Callipepla__read),
    .qp_peek_read(),
    .qp2m3_din(fifo_P_updtx_Callipepla__din),
    .qp2m3_full_n(fifo_P_updtx_Callipepla__full_n),
    .qp2m3_write(fifo_P_updtx_Callipepla__write),
    .qz_s_dout(fifo_Z_Callipepla_1__dout),
    .qz_peek_dout(fifo_Z_Callipepla_1__dout),
    .qz_s_empty_n(fifo_Z_Callipepla_1__empty_n),
    .qz_peek_empty_n(fifo_Z_Callipepla_1__empty_n),
    .qz_s_read(fifo_Z_Callipepla_1__read),
    .qz_peek_read(),
    .qrznew_s_dout(fifo_rz_Callipepla_1__dout),
    .qrznew_peek_dout(fifo_rz_Callipepla_1__dout),
    .qrznew_s_empty_n(fifo_rz_Callipepla_1__empty_n),
    .qrznew_peek_empty_n(fifo_rz_Callipepla_1__empty_n),
    .qrznew_s_read(fifo_rz_Callipepla_1__read),
    .qrznew_peek_read(),
    .rp_time(updt_p_0___rp_time__q0),
    .q_gbc_out_din(tsignal_toM3_Callipepla__din),
    .q_gbc_out_full_n(tsignal_toM3_Callipepla__full_n),
    .q_gbc_out_write(tsignal_toM3_Callipepla__write),
    .q_gbc_s_dout(tsignal_toM7_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_toM7_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_toM7_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_toM7_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_toM7_Callipepla__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) updt_r
  updt_r_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(updt_r_0__ap_start),
    .ap_done(updt_r_0__ap_done),
    .ap_idle(updt_r_0__ap_idle),
    .ap_ready(updt_r_0__ap_ready),
    .M(updt_r_0___M__q0),
    .qap_s_dout(fifo_AP_Callipepla__dout),
    .qap_peek_dout(fifo_AP_Callipepla__dout),
    .qap_s_empty_n(fifo_AP_Callipepla__empty_n),
    .qap_peek_empty_n(fifo_AP_Callipepla__empty_n),
    .qap_s_read(fifo_AP_Callipepla__read),
    .qap_peek_read(),
    .qr_s_dout(fifo_R_Callipepla__dout),
    .qr_peek_dout(fifo_R_Callipepla__dout),
    .qr_s_empty_n(fifo_R_Callipepla__empty_n),
    .qr_peek_empty_n(fifo_R_Callipepla__empty_n),
    .qr_s_read(fifo_R_Callipepla__read),
    .qr_peek_read(),
    .qout_din(fifo_R_updtd_m5_Callipepla__din),
    .qout_full_n(fifo_R_updtd_m5_Callipepla__full_n),
    .qout_write(fifo_R_updtd_m5_Callipepla__write),
    .qalpha_s_dout(fifo_alpha_Callipepla_1__dout),
    .qalpha_peek_dout(fifo_alpha_Callipepla_1__dout),
    .qalpha_s_empty_n(fifo_alpha_Callipepla_1__empty_n),
    .qalpha_peek_empty_n(fifo_alpha_Callipepla_1__empty_n),
    .qalpha_s_read(fifo_alpha_Callipepla_1__read),
    .qalpha_peek_read(),
    .rp_time(updt_r_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_toM4_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_toM4_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_toM4_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_toM4_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_toM4_Callipepla__read),
    .q_gbc_peek_read(),
    .q_gbc_out_din(tsignal_toM5_Callipepla__din),
    .q_gbc_out_full_n(tsignal_toM5_Callipepla__full_n),
    .q_gbc_out_write(tsignal_toM5_Callipepla__write)
  );


  (* keep_hierarchy = "yes" *) updt_x
  updt_x_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(updt_x_0__ap_start),
    .ap_done(updt_x_0__ap_done),
    .ap_idle(updt_x_0__ap_idle),
    .ap_ready(updt_x_0__ap_ready),
    .M(updt_x_0___M__q0),
    .qp_s_dout(fifo_P_updtx_Callipepla__dout),
    .qp_peek_dout(fifo_P_updtx_Callipepla__dout),
    .qp_s_empty_n(fifo_P_updtx_Callipepla__empty_n),
    .qp_peek_empty_n(fifo_P_updtx_Callipepla__empty_n),
    .qp_s_read(fifo_P_updtx_Callipepla__read),
    .qp_peek_read(),
    .qx_s_dout(fifo_X_Callipepla__dout),
    .qx_peek_dout(fifo_X_Callipepla__dout),
    .qx_s_empty_n(fifo_X_Callipepla__empty_n),
    .qx_peek_empty_n(fifo_X_Callipepla__empty_n),
    .qx_s_read(fifo_X_Callipepla__read),
    .qx_peek_read(),
    .qout_din(fifo_X_updated_Callipepla__din),
    .qout_full_n(fifo_X_updated_Callipepla__full_n),
    .qout_write(fifo_X_updated_Callipepla__write),
    .qalpha_s_dout(fifo_alpha_Callipepla_0__dout),
    .qalpha_peek_dout(fifo_alpha_Callipepla_0__dout),
    .qalpha_s_empty_n(fifo_alpha_Callipepla_0__empty_n),
    .qalpha_peek_empty_n(fifo_alpha_Callipepla_0__empty_n),
    .qalpha_s_read(fifo_alpha_Callipepla_0__read),
    .qalpha_peek_read(),
    .rp_time(updt_x_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_toM3_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_toM3_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_toM3_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_toM3_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_toM3_Callipepla__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) vecp_mux
  vecp_mux_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(vecp_mux_0__ap_start),
    .ap_done(vecp_mux_0__ap_done),
    .ap_idle(vecp_mux_0__ap_idle),
    .ap_ready(vecp_mux_0__ap_ready),
    .M(vecp_mux_0___M__q0),
    .q_in1_s_dout(fifo_P_from_mem_Callipepla__dout),
    .q_in1_peek_dout(fifo_P_from_mem_Callipepla__dout),
    .q_in1_s_empty_n(fifo_P_from_mem_Callipepla__empty_n),
    .q_in1_peek_empty_n(fifo_P_from_mem_Callipepla__empty_n),
    .q_in1_s_read(fifo_P_from_mem_Callipepla__read),
    .q_in1_peek_read(),
    .q_out_din(fifo_P_pe_Callipepla_0__din),
    .q_out_full_n(fifo_P_pe_Callipepla_0__full_n),
    .q_out_write(fifo_P_pe_Callipepla_0__write),
    .q_in2_s_dout(fifo_P_to_mux_Callipepla__dout),
    .q_in2_peek_dout(fifo_P_to_mux_Callipepla__dout),
    .q_in2_s_empty_n(fifo_P_to_mux_Callipepla__empty_n),
    .q_in2_peek_empty_n(fifo_P_to_mux_Callipepla__empty_n),
    .q_in2_s_read(fifo_P_to_mux_Callipepla__read),
    .q_in2_peek_read(),
    .rp_time(vecp_mux_0___rp_time__q0),
    .q_gbc_s_dout(tsignal_mux_Callipepla__dout),
    .q_gbc_peek_dout(tsignal_mux_Callipepla__dout),
    .q_gbc_s_empty_n(tsignal_mux_Callipepla__empty_n),
    .q_gbc_peek_empty_n(tsignal_mux_Callipepla__empty_n),
    .q_gbc_s_read(tsignal_mux_Callipepla__read),
    .q_gbc_peek_read()
  );


  (* keep_hierarchy = "yes" *) wr_r
  wr_r_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(wr_r_0__ap_start),
    .ap_done(wr_r_0__ap_done),
    .ap_idle(wr_r_0__ap_idle),
    .ap_ready(wr_r_0__ap_ready),
    .q_din_s_dout(fifo_RR_Callipepla__dout),
    .q_din_peek_dout(fifo_RR_Callipepla__dout),
    .q_din_s_empty_n(fifo_RR_Callipepla__empty_n),
    .q_din_peek_empty_n(fifo_RR_Callipepla__empty_n),
    .q_din_s_read(fifo_RR_Callipepla__read),
    .q_din_peek_read(),
    .rp_time(wr_r_0___rp_time__q0),
    .vec_r_read_addr_din(vec_res_read_addr__din),
    .vec_r_read_addr_full_n(vec_res_read_addr__full_n),
    .vec_r_read_addr_write(vec_res_read_addr__write),
    .vec_r_read_data_s_dout({1'b0, vec_res_read_data__dout}),
    .vec_r_read_data_peek_dout({1'b0, vec_res_read_data__dout}),
    .vec_r_read_data_s_empty_n(vec_res_read_data__empty_n),
    .vec_r_read_data_peek_empty_n(vec_res_read_data__empty_n),
    .vec_r_read_data_s_read(vec_res_read_data__read),
    .vec_r_read_data_peek_read(),
    .vec_r_write_addr_din(vec_res_write_addr__din),
    .vec_r_write_addr_full_n(vec_res_write_addr__full_n),
    .vec_r_write_addr_write(vec_res_write_addr__write),
    .vec_r_write_data_din(vec_res_write_data__din),
    .vec_r_write_data_full_n(vec_res_write_data__full_n),
    .vec_r_write_data_write(vec_res_write_data__write),
    .vec_r_write_resp_s_dout({1'b0, vec_res_write_resp__dout}),
    .vec_r_write_resp_peek_dout({1'b0, vec_res_write_resp__dout}),
    .vec_r_write_resp_s_empty_n(vec_res_write_resp__empty_n),
    .vec_r_write_resp_peek_empty_n(vec_res_write_resp__empty_n),
    .vec_r_write_resp_s_read(vec_res_write_resp__read),
    .vec_r_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  vec_p_0__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(rdwr_vec_0___vec_p_0__q0),
    .m_axi_ARADDR(m_axi_vec_p_0_ARADDR),
    .m_axi_ARBURST(m_axi_vec_p_0_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_p_0_ARCACHE),
    .m_axi_ARID(m_axi_vec_p_0_ARID),
    .m_axi_ARLEN(m_axi_vec_p_0_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_p_0_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_p_0_ARPROT),
    .m_axi_ARQOS(m_axi_vec_p_0_ARQOS),
    .m_axi_ARREADY(m_axi_vec_p_0_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_p_0_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_p_0_ARVALID),
    .m_axi_AWADDR(m_axi_vec_p_0_AWADDR),
    .m_axi_AWBURST(m_axi_vec_p_0_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_p_0_AWCACHE),
    .m_axi_AWID(m_axi_vec_p_0_AWID),
    .m_axi_AWLEN(m_axi_vec_p_0_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_p_0_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_p_0_AWPROT),
    .m_axi_AWQOS(m_axi_vec_p_0_AWQOS),
    .m_axi_AWREADY(m_axi_vec_p_0_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_p_0_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_p_0_AWVALID),
    .m_axi_BID(m_axi_vec_p_0_BID),
    .m_axi_BREADY(m_axi_vec_p_0_BREADY),
    .m_axi_BRESP(m_axi_vec_p_0_BRESP),
    .m_axi_BVALID(m_axi_vec_p_0_BVALID),
    .m_axi_RDATA(m_axi_vec_p_0_RDATA),
    .m_axi_RID(m_axi_vec_p_0_RID),
    .m_axi_RLAST(m_axi_vec_p_0_RLAST),
    .m_axi_RREADY(m_axi_vec_p_0_RREADY),
    .m_axi_RRESP(m_axi_vec_p_0_RRESP),
    .m_axi_RVALID(m_axi_vec_p_0_RVALID),
    .m_axi_WDATA(m_axi_vec_p_0_WDATA),
    .m_axi_WLAST(m_axi_vec_p_0_WLAST),
    .m_axi_WREADY(m_axi_vec_p_0_WREADY),
    .m_axi_WSTRB(m_axi_vec_p_0_WSTRB),
    .m_axi_WVALID(m_axi_vec_p_0_WVALID),
    .read_addr_din(vec_p_0_read_addr__din),
    .read_addr_full_n(vec_p_0_read_addr__full_n),
    .read_addr_write(vec_p_0_read_addr__write),
    .read_data_dout(vec_p_0_read_data__dout),
    .read_data_empty_n(vec_p_0_read_data__empty_n),
    .read_data_read(vec_p_0_read_data__read),
    .write_addr_din(vec_p_0_write_addr__din),
    .write_addr_full_n(vec_p_0_write_addr__full_n),
    .write_addr_write(vec_p_0_write_addr__write),
    .write_data_din(vec_p_0_write_data__din),
    .write_data_full_n(vec_p_0_write_data__full_n),
    .write_data_write(vec_p_0_write_data__write),
    .write_resp_dout(vec_p_0_write_resp__dout),
    .write_resp_empty_n(vec_p_0_write_resp__empty_n),
    .write_resp_read(vec_p_0_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  vec_p_1__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(rdwr_vec_1___vec_p_1__q0),
    .m_axi_ARADDR(m_axi_vec_p_1_ARADDR),
    .m_axi_ARBURST(m_axi_vec_p_1_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_p_1_ARCACHE),
    .m_axi_ARID(m_axi_vec_p_1_ARID),
    .m_axi_ARLEN(m_axi_vec_p_1_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_p_1_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_p_1_ARPROT),
    .m_axi_ARQOS(m_axi_vec_p_1_ARQOS),
    .m_axi_ARREADY(m_axi_vec_p_1_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_p_1_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_p_1_ARVALID),
    .m_axi_AWADDR(m_axi_vec_p_1_AWADDR),
    .m_axi_AWBURST(m_axi_vec_p_1_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_p_1_AWCACHE),
    .m_axi_AWID(m_axi_vec_p_1_AWID),
    .m_axi_AWLEN(m_axi_vec_p_1_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_p_1_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_p_1_AWPROT),
    .m_axi_AWQOS(m_axi_vec_p_1_AWQOS),
    .m_axi_AWREADY(m_axi_vec_p_1_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_p_1_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_p_1_AWVALID),
    .m_axi_BID(m_axi_vec_p_1_BID),
    .m_axi_BREADY(m_axi_vec_p_1_BREADY),
    .m_axi_BRESP(m_axi_vec_p_1_BRESP),
    .m_axi_BVALID(m_axi_vec_p_1_BVALID),
    .m_axi_RDATA(m_axi_vec_p_1_RDATA),
    .m_axi_RID(m_axi_vec_p_1_RID),
    .m_axi_RLAST(m_axi_vec_p_1_RLAST),
    .m_axi_RREADY(m_axi_vec_p_1_RREADY),
    .m_axi_RRESP(m_axi_vec_p_1_RRESP),
    .m_axi_RVALID(m_axi_vec_p_1_RVALID),
    .m_axi_WDATA(m_axi_vec_p_1_WDATA),
    .m_axi_WLAST(m_axi_vec_p_1_WLAST),
    .m_axi_WREADY(m_axi_vec_p_1_WREADY),
    .m_axi_WSTRB(m_axi_vec_p_1_WSTRB),
    .m_axi_WVALID(m_axi_vec_p_1_WVALID),
    .read_addr_din(vec_p_1_read_addr__din),
    .read_addr_full_n(vec_p_1_read_addr__full_n),
    .read_addr_write(vec_p_1_read_addr__write),
    .read_data_dout(vec_p_1_read_data__dout),
    .read_data_empty_n(vec_p_1_read_data__empty_n),
    .read_data_read(vec_p_1_read_data__read),
    .write_addr_din(vec_p_1_write_addr__din),
    .write_addr_full_n(vec_p_1_write_addr__full_n),
    .write_addr_write(vec_p_1_write_addr__write),
    .write_data_din(vec_p_1_write_data__din),
    .write_data_full_n(vec_p_1_write_data__full_n),
    .write_data_write(vec_p_1_write_data__write),
    .write_resp_dout(vec_p_1_write_resp__dout),
    .write_resp_empty_n(vec_p_1_write_resp__empty_n),
    .write_resp_read(vec_p_1_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  vec_r_0__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(rdwr_vec_2___vec_r_0__q0),
    .m_axi_ARADDR(m_axi_vec_r_0_ARADDR),
    .m_axi_ARBURST(m_axi_vec_r_0_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_r_0_ARCACHE),
    .m_axi_ARID(m_axi_vec_r_0_ARID),
    .m_axi_ARLEN(m_axi_vec_r_0_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_r_0_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_r_0_ARPROT),
    .m_axi_ARQOS(m_axi_vec_r_0_ARQOS),
    .m_axi_ARREADY(m_axi_vec_r_0_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_r_0_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_r_0_ARVALID),
    .m_axi_AWADDR(m_axi_vec_r_0_AWADDR),
    .m_axi_AWBURST(m_axi_vec_r_0_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_r_0_AWCACHE),
    .m_axi_AWID(m_axi_vec_r_0_AWID),
    .m_axi_AWLEN(m_axi_vec_r_0_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_r_0_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_r_0_AWPROT),
    .m_axi_AWQOS(m_axi_vec_r_0_AWQOS),
    .m_axi_AWREADY(m_axi_vec_r_0_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_r_0_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_r_0_AWVALID),
    .m_axi_BID(m_axi_vec_r_0_BID),
    .m_axi_BREADY(m_axi_vec_r_0_BREADY),
    .m_axi_BRESP(m_axi_vec_r_0_BRESP),
    .m_axi_BVALID(m_axi_vec_r_0_BVALID),
    .m_axi_RDATA(m_axi_vec_r_0_RDATA),
    .m_axi_RID(m_axi_vec_r_0_RID),
    .m_axi_RLAST(m_axi_vec_r_0_RLAST),
    .m_axi_RREADY(m_axi_vec_r_0_RREADY),
    .m_axi_RRESP(m_axi_vec_r_0_RRESP),
    .m_axi_RVALID(m_axi_vec_r_0_RVALID),
    .m_axi_WDATA(m_axi_vec_r_0_WDATA),
    .m_axi_WLAST(m_axi_vec_r_0_WLAST),
    .m_axi_WREADY(m_axi_vec_r_0_WREADY),
    .m_axi_WSTRB(m_axi_vec_r_0_WSTRB),
    .m_axi_WVALID(m_axi_vec_r_0_WVALID),
    .read_addr_din(vec_r_0_read_addr__din),
    .read_addr_full_n(vec_r_0_read_addr__full_n),
    .read_addr_write(vec_r_0_read_addr__write),
    .read_data_dout(vec_r_0_read_data__dout),
    .read_data_empty_n(vec_r_0_read_data__empty_n),
    .read_data_read(vec_r_0_read_data__read),
    .write_addr_din(vec_r_0_write_addr__din),
    .write_addr_full_n(vec_r_0_write_addr__full_n),
    .write_addr_write(vec_r_0_write_addr__write),
    .write_data_din(vec_r_0_write_data__din),
    .write_data_full_n(vec_r_0_write_data__full_n),
    .write_data_write(vec_r_0_write_data__write),
    .write_resp_dout(vec_r_0_write_resp__dout),
    .write_resp_empty_n(vec_r_0_write_resp__empty_n),
    .write_resp_read(vec_r_0_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  vec_r_1__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(rdwr_vec_3___vec_r_1__q0),
    .m_axi_ARADDR(m_axi_vec_r_1_ARADDR),
    .m_axi_ARBURST(m_axi_vec_r_1_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_r_1_ARCACHE),
    .m_axi_ARID(m_axi_vec_r_1_ARID),
    .m_axi_ARLEN(m_axi_vec_r_1_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_r_1_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_r_1_ARPROT),
    .m_axi_ARQOS(m_axi_vec_r_1_ARQOS),
    .m_axi_ARREADY(m_axi_vec_r_1_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_r_1_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_r_1_ARVALID),
    .m_axi_AWADDR(m_axi_vec_r_1_AWADDR),
    .m_axi_AWBURST(m_axi_vec_r_1_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_r_1_AWCACHE),
    .m_axi_AWID(m_axi_vec_r_1_AWID),
    .m_axi_AWLEN(m_axi_vec_r_1_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_r_1_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_r_1_AWPROT),
    .m_axi_AWQOS(m_axi_vec_r_1_AWQOS),
    .m_axi_AWREADY(m_axi_vec_r_1_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_r_1_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_r_1_AWVALID),
    .m_axi_BID(m_axi_vec_r_1_BID),
    .m_axi_BREADY(m_axi_vec_r_1_BREADY),
    .m_axi_BRESP(m_axi_vec_r_1_BRESP),
    .m_axi_BVALID(m_axi_vec_r_1_BVALID),
    .m_axi_RDATA(m_axi_vec_r_1_RDATA),
    .m_axi_RID(m_axi_vec_r_1_RID),
    .m_axi_RLAST(m_axi_vec_r_1_RLAST),
    .m_axi_RREADY(m_axi_vec_r_1_RREADY),
    .m_axi_RRESP(m_axi_vec_r_1_RRESP),
    .m_axi_RVALID(m_axi_vec_r_1_RVALID),
    .m_axi_WDATA(m_axi_vec_r_1_WDATA),
    .m_axi_WLAST(m_axi_vec_r_1_WLAST),
    .m_axi_WREADY(m_axi_vec_r_1_WREADY),
    .m_axi_WSTRB(m_axi_vec_r_1_WSTRB),
    .m_axi_WVALID(m_axi_vec_r_1_WVALID),
    .read_addr_din(vec_r_1_read_addr__din),
    .read_addr_full_n(vec_r_1_read_addr__full_n),
    .read_addr_write(vec_r_1_read_addr__write),
    .read_data_dout(vec_r_1_read_data__dout),
    .read_data_empty_n(vec_r_1_read_data__empty_n),
    .read_data_read(vec_r_1_read_data__read),
    .write_addr_din(vec_r_1_write_addr__din),
    .write_addr_full_n(vec_r_1_write_addr__full_n),
    .write_addr_write(vec_r_1_write_addr__write),
    .write_data_din(vec_r_1_write_data__din),
    .write_data_full_n(vec_r_1_write_data__full_n),
    .write_data_write(vec_r_1_write_data__write),
    .write_resp_dout(vec_r_1_write_resp__dout),
    .write_resp_empty_n(vec_r_1_write_resp__empty_n),
    .write_resp_read(vec_r_1_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  vec_x_0__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(rdwr_vec_4___vec_x_0__q0),
    .m_axi_ARADDR(m_axi_vec_x_0_ARADDR),
    .m_axi_ARBURST(m_axi_vec_x_0_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_x_0_ARCACHE),
    .m_axi_ARID(m_axi_vec_x_0_ARID),
    .m_axi_ARLEN(m_axi_vec_x_0_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_x_0_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_x_0_ARPROT),
    .m_axi_ARQOS(m_axi_vec_x_0_ARQOS),
    .m_axi_ARREADY(m_axi_vec_x_0_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_x_0_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_x_0_ARVALID),
    .m_axi_AWADDR(m_axi_vec_x_0_AWADDR),
    .m_axi_AWBURST(m_axi_vec_x_0_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_x_0_AWCACHE),
    .m_axi_AWID(m_axi_vec_x_0_AWID),
    .m_axi_AWLEN(m_axi_vec_x_0_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_x_0_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_x_0_AWPROT),
    .m_axi_AWQOS(m_axi_vec_x_0_AWQOS),
    .m_axi_AWREADY(m_axi_vec_x_0_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_x_0_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_x_0_AWVALID),
    .m_axi_BID(m_axi_vec_x_0_BID),
    .m_axi_BREADY(m_axi_vec_x_0_BREADY),
    .m_axi_BRESP(m_axi_vec_x_0_BRESP),
    .m_axi_BVALID(m_axi_vec_x_0_BVALID),
    .m_axi_RDATA(m_axi_vec_x_0_RDATA),
    .m_axi_RID(m_axi_vec_x_0_RID),
    .m_axi_RLAST(m_axi_vec_x_0_RLAST),
    .m_axi_RREADY(m_axi_vec_x_0_RREADY),
    .m_axi_RRESP(m_axi_vec_x_0_RRESP),
    .m_axi_RVALID(m_axi_vec_x_0_RVALID),
    .m_axi_WDATA(m_axi_vec_x_0_WDATA),
    .m_axi_WLAST(m_axi_vec_x_0_WLAST),
    .m_axi_WREADY(m_axi_vec_x_0_WREADY),
    .m_axi_WSTRB(m_axi_vec_x_0_WSTRB),
    .m_axi_WVALID(m_axi_vec_x_0_WVALID),
    .read_addr_din(vec_x_0_read_addr__din),
    .read_addr_full_n(vec_x_0_read_addr__full_n),
    .read_addr_write(vec_x_0_read_addr__write),
    .read_data_dout(vec_x_0_read_data__dout),
    .read_data_empty_n(vec_x_0_read_data__empty_n),
    .read_data_read(vec_x_0_read_data__read),
    .write_addr_din(vec_x_0_write_addr__din),
    .write_addr_full_n(vec_x_0_write_addr__full_n),
    .write_addr_write(vec_x_0_write_addr__write),
    .write_data_din(vec_x_0_write_data__din),
    .write_data_full_n(vec_x_0_write_data__full_n),
    .write_data_write(vec_x_0_write_data__write),
    .write_resp_dout(vec_x_0_write_resp__dout),
    .write_resp_empty_n(vec_x_0_write_resp__empty_n),
    .write_resp_read(vec_x_0_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  vec_x_1__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(rdwr_vec_5___vec_x_1__q0),
    .m_axi_ARADDR(m_axi_vec_x_1_ARADDR),
    .m_axi_ARBURST(m_axi_vec_x_1_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_x_1_ARCACHE),
    .m_axi_ARID(m_axi_vec_x_1_ARID),
    .m_axi_ARLEN(m_axi_vec_x_1_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_x_1_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_x_1_ARPROT),
    .m_axi_ARQOS(m_axi_vec_x_1_ARQOS),
    .m_axi_ARREADY(m_axi_vec_x_1_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_x_1_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_x_1_ARVALID),
    .m_axi_AWADDR(m_axi_vec_x_1_AWADDR),
    .m_axi_AWBURST(m_axi_vec_x_1_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_x_1_AWCACHE),
    .m_axi_AWID(m_axi_vec_x_1_AWID),
    .m_axi_AWLEN(m_axi_vec_x_1_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_x_1_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_x_1_AWPROT),
    .m_axi_AWQOS(m_axi_vec_x_1_AWQOS),
    .m_axi_AWREADY(m_axi_vec_x_1_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_x_1_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_x_1_AWVALID),
    .m_axi_BID(m_axi_vec_x_1_BID),
    .m_axi_BREADY(m_axi_vec_x_1_BREADY),
    .m_axi_BRESP(m_axi_vec_x_1_BRESP),
    .m_axi_BVALID(m_axi_vec_x_1_BVALID),
    .m_axi_RDATA(m_axi_vec_x_1_RDATA),
    .m_axi_RID(m_axi_vec_x_1_RID),
    .m_axi_RLAST(m_axi_vec_x_1_RLAST),
    .m_axi_RREADY(m_axi_vec_x_1_RREADY),
    .m_axi_RRESP(m_axi_vec_x_1_RRESP),
    .m_axi_RVALID(m_axi_vec_x_1_RVALID),
    .m_axi_WDATA(m_axi_vec_x_1_WDATA),
    .m_axi_WLAST(m_axi_vec_x_1_WLAST),
    .m_axi_WREADY(m_axi_vec_x_1_WREADY),
    .m_axi_WSTRB(m_axi_vec_x_1_WSTRB),
    .m_axi_WVALID(m_axi_vec_x_1_WVALID),
    .read_addr_din(vec_x_1_read_addr__din),
    .read_addr_full_n(vec_x_1_read_addr__full_n),
    .read_addr_write(vec_x_1_read_addr__write),
    .read_data_dout(vec_x_1_read_data__dout),
    .read_data_empty_n(vec_x_1_read_data__empty_n),
    .read_data_read(vec_x_1_read_data__read),
    .write_addr_din(vec_x_1_write_addr__din),
    .write_addr_full_n(vec_x_1_write_addr__full_n),
    .write_addr_write(vec_x_1_write_addr__write),
    .write_data_din(vec_x_1_write_data__din),
    .write_data_full_n(vec_x_1_write_data__full_n),
    .write_data_write(vec_x_1_write_data__write),
    .write_resp_dout(vec_x_1_write_resp__dout),
    .write_resp_empty_n(vec_x_1_write_resp__empty_n),
    .write_resp_read(vec_x_1_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  vec_Ap__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(rdwr_vec_6___vec_Ap__q0),
    .m_axi_ARADDR(m_axi_vec_Ap_ARADDR),
    .m_axi_ARBURST(m_axi_vec_Ap_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_Ap_ARCACHE),
    .m_axi_ARID(m_axi_vec_Ap_ARID),
    .m_axi_ARLEN(m_axi_vec_Ap_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_Ap_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_Ap_ARPROT),
    .m_axi_ARQOS(m_axi_vec_Ap_ARQOS),
    .m_axi_ARREADY(m_axi_vec_Ap_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_Ap_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_Ap_ARVALID),
    .m_axi_AWADDR(m_axi_vec_Ap_AWADDR),
    .m_axi_AWBURST(m_axi_vec_Ap_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_Ap_AWCACHE),
    .m_axi_AWID(m_axi_vec_Ap_AWID),
    .m_axi_AWLEN(m_axi_vec_Ap_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_Ap_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_Ap_AWPROT),
    .m_axi_AWQOS(m_axi_vec_Ap_AWQOS),
    .m_axi_AWREADY(m_axi_vec_Ap_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_Ap_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_Ap_AWVALID),
    .m_axi_BID(m_axi_vec_Ap_BID),
    .m_axi_BREADY(m_axi_vec_Ap_BREADY),
    .m_axi_BRESP(m_axi_vec_Ap_BRESP),
    .m_axi_BVALID(m_axi_vec_Ap_BVALID),
    .m_axi_RDATA(m_axi_vec_Ap_RDATA),
    .m_axi_RID(m_axi_vec_Ap_RID),
    .m_axi_RLAST(m_axi_vec_Ap_RLAST),
    .m_axi_RREADY(m_axi_vec_Ap_RREADY),
    .m_axi_RRESP(m_axi_vec_Ap_RRESP),
    .m_axi_RVALID(m_axi_vec_Ap_RVALID),
    .m_axi_WDATA(m_axi_vec_Ap_WDATA),
    .m_axi_WLAST(m_axi_vec_Ap_WLAST),
    .m_axi_WREADY(m_axi_vec_Ap_WREADY),
    .m_axi_WSTRB(m_axi_vec_Ap_WSTRB),
    .m_axi_WVALID(m_axi_vec_Ap_WVALID),
    .read_addr_din(vec_Ap_read_addr__din),
    .read_addr_full_n(vec_Ap_read_addr__full_n),
    .read_addr_write(vec_Ap_read_addr__write),
    .read_data_dout(vec_Ap_read_data__dout),
    .read_data_empty_n(vec_Ap_read_data__empty_n),
    .read_data_read(vec_Ap_read_data__read),
    .write_addr_din(vec_Ap_write_addr__din),
    .write_addr_full_n(vec_Ap_write_addr__full_n),
    .write_addr_write(vec_Ap_write_addr__write),
    .write_data_din(vec_Ap_write_data__din),
    .write_data_full_n(vec_Ap_write_data__full_n),
    .write_data_write(vec_Ap_write_data__write),
    .write_resp_dout(vec_Ap_write_resp__dout),
    .write_resp_empty_n(vec_Ap_write_resp__empty_n),
    .write_resp_read(vec_Ap_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_0__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_0___edge_list_ch_0__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_0_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_0_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_0_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_0_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_0_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_0_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_0_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_0_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_0_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_0_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_0_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_0_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_0_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_0_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_0_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_0_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_0_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_0_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_0_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_0_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_0_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_0_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_0_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_0_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_0_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_0_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_0_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_0_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_0_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_0_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_0_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_0_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_0_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_0_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_0_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_0_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_0_WVALID),
    .read_addr_din(edge_list_ch_0_read_addr__din),
    .read_addr_full_n(edge_list_ch_0_read_addr__full_n),
    .read_addr_write(edge_list_ch_0_read_addr__write),
    .read_data_dout(edge_list_ch_0_read_data__dout),
    .read_data_empty_n(edge_list_ch_0_read_data__empty_n),
    .read_data_read(edge_list_ch_0_read_data__read),
    .write_addr_din(edge_list_ch_0_write_addr__din),
    .write_addr_full_n(edge_list_ch_0_write_addr__full_n),
    .write_addr_write(edge_list_ch_0_write_addr__write),
    .write_data_din(edge_list_ch_0_write_data__din),
    .write_data_full_n(edge_list_ch_0_write_data__full_n),
    .write_data_write(edge_list_ch_0_write_data__write),
    .write_resp_dout(edge_list_ch_0_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_0_write_resp__empty_n),
    .write_resp_read(edge_list_ch_0_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_1__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_1___edge_list_ch_1__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_1_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_1_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_1_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_1_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_1_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_1_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_1_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_1_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_1_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_1_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_1_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_1_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_1_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_1_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_1_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_1_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_1_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_1_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_1_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_1_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_1_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_1_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_1_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_1_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_1_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_1_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_1_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_1_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_1_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_1_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_1_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_1_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_1_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_1_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_1_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_1_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_1_WVALID),
    .read_addr_din(edge_list_ch_1_read_addr__din),
    .read_addr_full_n(edge_list_ch_1_read_addr__full_n),
    .read_addr_write(edge_list_ch_1_read_addr__write),
    .read_data_dout(edge_list_ch_1_read_data__dout),
    .read_data_empty_n(edge_list_ch_1_read_data__empty_n),
    .read_data_read(edge_list_ch_1_read_data__read),
    .write_addr_din(edge_list_ch_1_write_addr__din),
    .write_addr_full_n(edge_list_ch_1_write_addr__full_n),
    .write_addr_write(edge_list_ch_1_write_addr__write),
    .write_data_din(edge_list_ch_1_write_data__din),
    .write_data_full_n(edge_list_ch_1_write_data__full_n),
    .write_data_write(edge_list_ch_1_write_data__write),
    .write_resp_dout(edge_list_ch_1_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_1_write_resp__empty_n),
    .write_resp_read(edge_list_ch_1_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_2__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_2___edge_list_ch_2__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_2_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_2_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_2_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_2_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_2_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_2_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_2_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_2_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_2_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_2_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_2_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_2_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_2_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_2_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_2_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_2_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_2_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_2_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_2_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_2_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_2_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_2_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_2_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_2_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_2_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_2_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_2_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_2_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_2_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_2_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_2_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_2_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_2_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_2_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_2_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_2_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_2_WVALID),
    .read_addr_din(edge_list_ch_2_read_addr__din),
    .read_addr_full_n(edge_list_ch_2_read_addr__full_n),
    .read_addr_write(edge_list_ch_2_read_addr__write),
    .read_data_dout(edge_list_ch_2_read_data__dout),
    .read_data_empty_n(edge_list_ch_2_read_data__empty_n),
    .read_data_read(edge_list_ch_2_read_data__read),
    .write_addr_din(edge_list_ch_2_write_addr__din),
    .write_addr_full_n(edge_list_ch_2_write_addr__full_n),
    .write_addr_write(edge_list_ch_2_write_addr__write),
    .write_data_din(edge_list_ch_2_write_data__din),
    .write_data_full_n(edge_list_ch_2_write_data__full_n),
    .write_data_write(edge_list_ch_2_write_data__write),
    .write_resp_dout(edge_list_ch_2_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_2_write_resp__empty_n),
    .write_resp_read(edge_list_ch_2_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_3__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_3___edge_list_ch_3__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_3_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_3_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_3_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_3_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_3_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_3_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_3_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_3_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_3_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_3_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_3_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_3_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_3_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_3_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_3_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_3_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_3_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_3_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_3_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_3_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_3_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_3_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_3_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_3_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_3_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_3_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_3_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_3_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_3_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_3_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_3_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_3_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_3_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_3_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_3_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_3_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_3_WVALID),
    .read_addr_din(edge_list_ch_3_read_addr__din),
    .read_addr_full_n(edge_list_ch_3_read_addr__full_n),
    .read_addr_write(edge_list_ch_3_read_addr__write),
    .read_data_dout(edge_list_ch_3_read_data__dout),
    .read_data_empty_n(edge_list_ch_3_read_data__empty_n),
    .read_data_read(edge_list_ch_3_read_data__read),
    .write_addr_din(edge_list_ch_3_write_addr__din),
    .write_addr_full_n(edge_list_ch_3_write_addr__full_n),
    .write_addr_write(edge_list_ch_3_write_addr__write),
    .write_data_din(edge_list_ch_3_write_data__din),
    .write_data_full_n(edge_list_ch_3_write_data__full_n),
    .write_data_write(edge_list_ch_3_write_data__write),
    .write_resp_dout(edge_list_ch_3_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_3_write_resp__empty_n),
    .write_resp_read(edge_list_ch_3_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_4__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_4___edge_list_ch_4__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_4_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_4_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_4_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_4_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_4_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_4_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_4_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_4_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_4_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_4_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_4_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_4_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_4_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_4_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_4_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_4_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_4_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_4_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_4_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_4_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_4_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_4_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_4_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_4_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_4_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_4_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_4_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_4_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_4_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_4_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_4_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_4_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_4_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_4_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_4_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_4_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_4_WVALID),
    .read_addr_din(edge_list_ch_4_read_addr__din),
    .read_addr_full_n(edge_list_ch_4_read_addr__full_n),
    .read_addr_write(edge_list_ch_4_read_addr__write),
    .read_data_dout(edge_list_ch_4_read_data__dout),
    .read_data_empty_n(edge_list_ch_4_read_data__empty_n),
    .read_data_read(edge_list_ch_4_read_data__read),
    .write_addr_din(edge_list_ch_4_write_addr__din),
    .write_addr_full_n(edge_list_ch_4_write_addr__full_n),
    .write_addr_write(edge_list_ch_4_write_addr__write),
    .write_data_din(edge_list_ch_4_write_data__din),
    .write_data_full_n(edge_list_ch_4_write_data__full_n),
    .write_data_write(edge_list_ch_4_write_data__write),
    .write_resp_dout(edge_list_ch_4_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_4_write_resp__empty_n),
    .write_resp_read(edge_list_ch_4_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_5__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_5___edge_list_ch_5__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_5_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_5_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_5_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_5_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_5_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_5_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_5_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_5_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_5_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_5_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_5_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_5_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_5_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_5_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_5_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_5_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_5_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_5_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_5_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_5_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_5_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_5_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_5_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_5_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_5_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_5_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_5_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_5_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_5_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_5_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_5_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_5_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_5_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_5_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_5_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_5_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_5_WVALID),
    .read_addr_din(edge_list_ch_5_read_addr__din),
    .read_addr_full_n(edge_list_ch_5_read_addr__full_n),
    .read_addr_write(edge_list_ch_5_read_addr__write),
    .read_data_dout(edge_list_ch_5_read_data__dout),
    .read_data_empty_n(edge_list_ch_5_read_data__empty_n),
    .read_data_read(edge_list_ch_5_read_data__read),
    .write_addr_din(edge_list_ch_5_write_addr__din),
    .write_addr_full_n(edge_list_ch_5_write_addr__full_n),
    .write_addr_write(edge_list_ch_5_write_addr__write),
    .write_data_din(edge_list_ch_5_write_data__din),
    .write_data_full_n(edge_list_ch_5_write_data__full_n),
    .write_data_write(edge_list_ch_5_write_data__write),
    .write_resp_dout(edge_list_ch_5_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_5_write_resp__empty_n),
    .write_resp_read(edge_list_ch_5_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_6__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_6___edge_list_ch_6__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_6_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_6_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_6_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_6_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_6_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_6_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_6_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_6_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_6_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_6_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_6_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_6_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_6_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_6_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_6_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_6_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_6_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_6_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_6_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_6_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_6_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_6_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_6_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_6_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_6_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_6_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_6_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_6_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_6_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_6_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_6_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_6_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_6_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_6_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_6_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_6_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_6_WVALID),
    .read_addr_din(edge_list_ch_6_read_addr__din),
    .read_addr_full_n(edge_list_ch_6_read_addr__full_n),
    .read_addr_write(edge_list_ch_6_read_addr__write),
    .read_data_dout(edge_list_ch_6_read_data__dout),
    .read_data_empty_n(edge_list_ch_6_read_data__empty_n),
    .read_data_read(edge_list_ch_6_read_data__read),
    .write_addr_din(edge_list_ch_6_write_addr__din),
    .write_addr_full_n(edge_list_ch_6_write_addr__full_n),
    .write_addr_write(edge_list_ch_6_write_addr__write),
    .write_data_din(edge_list_ch_6_write_data__din),
    .write_data_full_n(edge_list_ch_6_write_data__full_n),
    .write_data_write(edge_list_ch_6_write_data__write),
    .write_resp_dout(edge_list_ch_6_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_6_write_resp__empty_n),
    .write_resp_read(edge_list_ch_6_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_7__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_7___edge_list_ch_7__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_7_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_7_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_7_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_7_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_7_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_7_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_7_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_7_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_7_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_7_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_7_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_7_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_7_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_7_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_7_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_7_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_7_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_7_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_7_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_7_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_7_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_7_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_7_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_7_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_7_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_7_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_7_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_7_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_7_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_7_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_7_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_7_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_7_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_7_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_7_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_7_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_7_WVALID),
    .read_addr_din(edge_list_ch_7_read_addr__din),
    .read_addr_full_n(edge_list_ch_7_read_addr__full_n),
    .read_addr_write(edge_list_ch_7_read_addr__write),
    .read_data_dout(edge_list_ch_7_read_data__dout),
    .read_data_empty_n(edge_list_ch_7_read_data__empty_n),
    .read_data_read(edge_list_ch_7_read_data__read),
    .write_addr_din(edge_list_ch_7_write_addr__din),
    .write_addr_full_n(edge_list_ch_7_write_addr__full_n),
    .write_addr_write(edge_list_ch_7_write_addr__write),
    .write_data_din(edge_list_ch_7_write_data__din),
    .write_data_full_n(edge_list_ch_7_write_data__full_n),
    .write_data_write(edge_list_ch_7_write_data__write),
    .write_resp_dout(edge_list_ch_7_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_7_write_resp__empty_n),
    .write_resp_read(edge_list_ch_7_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_8__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_8___edge_list_ch_8__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_8_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_8_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_8_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_8_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_8_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_8_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_8_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_8_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_8_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_8_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_8_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_8_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_8_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_8_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_8_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_8_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_8_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_8_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_8_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_8_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_8_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_8_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_8_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_8_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_8_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_8_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_8_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_8_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_8_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_8_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_8_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_8_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_8_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_8_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_8_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_8_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_8_WVALID),
    .read_addr_din(edge_list_ch_8_read_addr__din),
    .read_addr_full_n(edge_list_ch_8_read_addr__full_n),
    .read_addr_write(edge_list_ch_8_read_addr__write),
    .read_data_dout(edge_list_ch_8_read_data__dout),
    .read_data_empty_n(edge_list_ch_8_read_data__empty_n),
    .read_data_read(edge_list_ch_8_read_data__read),
    .write_addr_din(edge_list_ch_8_write_addr__din),
    .write_addr_full_n(edge_list_ch_8_write_addr__full_n),
    .write_addr_write(edge_list_ch_8_write_addr__write),
    .write_data_din(edge_list_ch_8_write_data__din),
    .write_data_full_n(edge_list_ch_8_write_data__full_n),
    .write_data_write(edge_list_ch_8_write_data__write),
    .write_resp_dout(edge_list_ch_8_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_8_write_resp__empty_n),
    .write_resp_read(edge_list_ch_8_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_9__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_9___edge_list_ch_9__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_9_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_9_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_9_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_9_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_9_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_9_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_9_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_9_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_9_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_9_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_9_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_9_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_9_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_9_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_9_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_9_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_9_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_9_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_9_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_9_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_9_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_9_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_9_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_9_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_9_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_9_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_9_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_9_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_9_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_9_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_9_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_9_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_9_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_9_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_9_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_9_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_9_WVALID),
    .read_addr_din(edge_list_ch_9_read_addr__din),
    .read_addr_full_n(edge_list_ch_9_read_addr__full_n),
    .read_addr_write(edge_list_ch_9_read_addr__write),
    .read_data_dout(edge_list_ch_9_read_data__dout),
    .read_data_empty_n(edge_list_ch_9_read_data__empty_n),
    .read_data_read(edge_list_ch_9_read_data__read),
    .write_addr_din(edge_list_ch_9_write_addr__din),
    .write_addr_full_n(edge_list_ch_9_write_addr__full_n),
    .write_addr_write(edge_list_ch_9_write_addr__write),
    .write_data_din(edge_list_ch_9_write_data__din),
    .write_data_full_n(edge_list_ch_9_write_data__full_n),
    .write_data_write(edge_list_ch_9_write_data__write),
    .write_resp_dout(edge_list_ch_9_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_9_write_resp__empty_n),
    .write_resp_read(edge_list_ch_9_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_10__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_10___edge_list_ch_10__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_10_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_10_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_10_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_10_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_10_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_10_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_10_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_10_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_10_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_10_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_10_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_10_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_10_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_10_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_10_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_10_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_10_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_10_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_10_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_10_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_10_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_10_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_10_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_10_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_10_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_10_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_10_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_10_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_10_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_10_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_10_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_10_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_10_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_10_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_10_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_10_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_10_WVALID),
    .read_addr_din(edge_list_ch_10_read_addr__din),
    .read_addr_full_n(edge_list_ch_10_read_addr__full_n),
    .read_addr_write(edge_list_ch_10_read_addr__write),
    .read_data_dout(edge_list_ch_10_read_data__dout),
    .read_data_empty_n(edge_list_ch_10_read_data__empty_n),
    .read_data_read(edge_list_ch_10_read_data__read),
    .write_addr_din(edge_list_ch_10_write_addr__din),
    .write_addr_full_n(edge_list_ch_10_write_addr__full_n),
    .write_addr_write(edge_list_ch_10_write_addr__write),
    .write_data_din(edge_list_ch_10_write_data__din),
    .write_data_full_n(edge_list_ch_10_write_data__full_n),
    .write_data_write(edge_list_ch_10_write_data__write),
    .write_resp_dout(edge_list_ch_10_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_10_write_resp__empty_n),
    .write_resp_read(edge_list_ch_10_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_11__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_11___edge_list_ch_11__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_11_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_11_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_11_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_11_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_11_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_11_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_11_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_11_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_11_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_11_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_11_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_11_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_11_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_11_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_11_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_11_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_11_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_11_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_11_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_11_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_11_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_11_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_11_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_11_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_11_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_11_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_11_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_11_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_11_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_11_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_11_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_11_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_11_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_11_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_11_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_11_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_11_WVALID),
    .read_addr_din(edge_list_ch_11_read_addr__din),
    .read_addr_full_n(edge_list_ch_11_read_addr__full_n),
    .read_addr_write(edge_list_ch_11_read_addr__write),
    .read_data_dout(edge_list_ch_11_read_data__dout),
    .read_data_empty_n(edge_list_ch_11_read_data__empty_n),
    .read_data_read(edge_list_ch_11_read_data__read),
    .write_addr_din(edge_list_ch_11_write_addr__din),
    .write_addr_full_n(edge_list_ch_11_write_addr__full_n),
    .write_addr_write(edge_list_ch_11_write_addr__write),
    .write_data_din(edge_list_ch_11_write_data__din),
    .write_data_full_n(edge_list_ch_11_write_data__full_n),
    .write_data_write(edge_list_ch_11_write_data__write),
    .write_resp_dout(edge_list_ch_11_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_11_write_resp__empty_n),
    .write_resp_read(edge_list_ch_11_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_12__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_12___edge_list_ch_12__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_12_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_12_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_12_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_12_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_12_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_12_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_12_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_12_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_12_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_12_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_12_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_12_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_12_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_12_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_12_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_12_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_12_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_12_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_12_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_12_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_12_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_12_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_12_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_12_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_12_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_12_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_12_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_12_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_12_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_12_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_12_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_12_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_12_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_12_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_12_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_12_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_12_WVALID),
    .read_addr_din(edge_list_ch_12_read_addr__din),
    .read_addr_full_n(edge_list_ch_12_read_addr__full_n),
    .read_addr_write(edge_list_ch_12_read_addr__write),
    .read_data_dout(edge_list_ch_12_read_data__dout),
    .read_data_empty_n(edge_list_ch_12_read_data__empty_n),
    .read_data_read(edge_list_ch_12_read_data__read),
    .write_addr_din(edge_list_ch_12_write_addr__din),
    .write_addr_full_n(edge_list_ch_12_write_addr__full_n),
    .write_addr_write(edge_list_ch_12_write_addr__write),
    .write_data_din(edge_list_ch_12_write_data__din),
    .write_data_full_n(edge_list_ch_12_write_data__full_n),
    .write_data_write(edge_list_ch_12_write_data__write),
    .write_resp_dout(edge_list_ch_12_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_12_write_resp__empty_n),
    .write_resp_read(edge_list_ch_12_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_13__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_13___edge_list_ch_13__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_13_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_13_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_13_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_13_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_13_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_13_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_13_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_13_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_13_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_13_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_13_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_13_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_13_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_13_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_13_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_13_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_13_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_13_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_13_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_13_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_13_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_13_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_13_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_13_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_13_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_13_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_13_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_13_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_13_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_13_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_13_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_13_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_13_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_13_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_13_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_13_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_13_WVALID),
    .read_addr_din(edge_list_ch_13_read_addr__din),
    .read_addr_full_n(edge_list_ch_13_read_addr__full_n),
    .read_addr_write(edge_list_ch_13_read_addr__write),
    .read_data_dout(edge_list_ch_13_read_data__dout),
    .read_data_empty_n(edge_list_ch_13_read_data__empty_n),
    .read_data_read(edge_list_ch_13_read_data__read),
    .write_addr_din(edge_list_ch_13_write_addr__din),
    .write_addr_full_n(edge_list_ch_13_write_addr__full_n),
    .write_addr_write(edge_list_ch_13_write_addr__write),
    .write_data_din(edge_list_ch_13_write_data__din),
    .write_data_full_n(edge_list_ch_13_write_data__full_n),
    .write_data_write(edge_list_ch_13_write_data__write),
    .write_resp_dout(edge_list_ch_13_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_13_write_resp__empty_n),
    .write_resp_read(edge_list_ch_13_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_14__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_14___edge_list_ch_14__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_14_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_14_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_14_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_14_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_14_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_14_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_14_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_14_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_14_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_14_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_14_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_14_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_14_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_14_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_14_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_14_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_14_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_14_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_14_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_14_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_14_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_14_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_14_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_14_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_14_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_14_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_14_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_14_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_14_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_14_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_14_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_14_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_14_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_14_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_14_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_14_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_14_WVALID),
    .read_addr_din(edge_list_ch_14_read_addr__din),
    .read_addr_full_n(edge_list_ch_14_read_addr__full_n),
    .read_addr_write(edge_list_ch_14_read_addr__write),
    .read_data_dout(edge_list_ch_14_read_data__dout),
    .read_data_empty_n(edge_list_ch_14_read_data__empty_n),
    .read_data_read(edge_list_ch_14_read_data__read),
    .write_addr_din(edge_list_ch_14_write_addr__din),
    .write_addr_full_n(edge_list_ch_14_write_addr__full_n),
    .write_addr_write(edge_list_ch_14_write_addr__write),
    .write_data_din(edge_list_ch_14_write_data__din),
    .write_data_full_n(edge_list_ch_14_write_data__full_n),
    .write_data_write(edge_list_ch_14_write_data__write),
    .write_resp_dout(edge_list_ch_14_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_14_write_resp__empty_n),
    .write_resp_read(edge_list_ch_14_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  edge_list_ch_15__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_15___edge_list_ch_15__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_15_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_15_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_15_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_15_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_15_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_15_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_15_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_15_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_15_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_15_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_15_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_15_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_15_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_15_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_15_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_15_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_15_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_15_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_15_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_15_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_15_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_15_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_15_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_15_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_15_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_15_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_15_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_15_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_15_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_15_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_15_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_15_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_15_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_15_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_15_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_15_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_15_WVALID),
    .read_addr_din(edge_list_ch_15_read_addr__din),
    .read_addr_full_n(edge_list_ch_15_read_addr__full_n),
    .read_addr_write(edge_list_ch_15_read_addr__write),
    .read_data_dout(edge_list_ch_15_read_data__dout),
    .read_data_empty_n(edge_list_ch_15_read_data__empty_n),
    .read_data_read(edge_list_ch_15_read_data__read),
    .write_addr_din(edge_list_ch_15_write_addr__din),
    .write_addr_full_n(edge_list_ch_15_write_addr__full_n),
    .write_addr_write(edge_list_ch_15_write_addr__write),
    .write_data_din(edge_list_ch_15_write_data__din),
    .write_data_full_n(edge_list_ch_15_write_data__full_n),
    .write_data_write(edge_list_ch_15_write_data__write),
    .write_resp_dout(edge_list_ch_15_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_15_write_resp__empty_n),
    .write_resp_read(edge_list_ch_15_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  vec_digA__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_digA_0___vec_digA__q0),
    .m_axi_ARADDR(m_axi_vec_digA_ARADDR),
    .m_axi_ARBURST(m_axi_vec_digA_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_digA_ARCACHE),
    .m_axi_ARID(m_axi_vec_digA_ARID),
    .m_axi_ARLEN(m_axi_vec_digA_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_digA_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_digA_ARPROT),
    .m_axi_ARQOS(m_axi_vec_digA_ARQOS),
    .m_axi_ARREADY(m_axi_vec_digA_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_digA_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_digA_ARVALID),
    .m_axi_AWADDR(m_axi_vec_digA_AWADDR),
    .m_axi_AWBURST(m_axi_vec_digA_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_digA_AWCACHE),
    .m_axi_AWID(m_axi_vec_digA_AWID),
    .m_axi_AWLEN(m_axi_vec_digA_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_digA_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_digA_AWPROT),
    .m_axi_AWQOS(m_axi_vec_digA_AWQOS),
    .m_axi_AWREADY(m_axi_vec_digA_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_digA_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_digA_AWVALID),
    .m_axi_BID(m_axi_vec_digA_BID),
    .m_axi_BREADY(m_axi_vec_digA_BREADY),
    .m_axi_BRESP(m_axi_vec_digA_BRESP),
    .m_axi_BVALID(m_axi_vec_digA_BVALID),
    .m_axi_RDATA(m_axi_vec_digA_RDATA),
    .m_axi_RID(m_axi_vec_digA_RID),
    .m_axi_RLAST(m_axi_vec_digA_RLAST),
    .m_axi_RREADY(m_axi_vec_digA_RREADY),
    .m_axi_RRESP(m_axi_vec_digA_RRESP),
    .m_axi_RVALID(m_axi_vec_digA_RVALID),
    .m_axi_WDATA(m_axi_vec_digA_WDATA),
    .m_axi_WLAST(m_axi_vec_digA_WLAST),
    .m_axi_WREADY(m_axi_vec_digA_WREADY),
    .m_axi_WSTRB(m_axi_vec_digA_WSTRB),
    .m_axi_WVALID(m_axi_vec_digA_WVALID),
    .read_addr_din(vec_digA_read_addr__din),
    .read_addr_full_n(vec_digA_read_addr__full_n),
    .read_addr_write(vec_digA_read_addr__write),
    .read_data_dout(vec_digA_read_data__dout),
    .read_data_empty_n(vec_digA_read_data__empty_n),
    .read_data_read(vec_digA_read_data__read),
    .write_addr_din(vec_digA_write_addr__din),
    .write_addr_full_n(vec_digA_write_addr__full_n),
    .write_addr_write(vec_digA_write_addr__write),
    .write_data_din(vec_digA_write_data__din),
    .write_data_full_n(vec_digA_write_data__full_n),
    .write_data_write(vec_digA_write_data__write),
    .write_resp_dout(vec_digA_write_resp__dout),
    .write_resp_empty_n(vec_digA_write_resp__empty_n),
    .write_resp_read(vec_digA_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(32),
    .DataWidthBytesLog(2),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(255)
  )
  edge_list_ptr__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_edge_list_ptr_0___edge_list_ptr__q0),
    .m_axi_ARADDR(m_axi_edge_list_ptr_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ptr_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ptr_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ptr_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ptr_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ptr_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ptr_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ptr_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ptr_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ptr_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ptr_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ptr_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ptr_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ptr_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ptr_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ptr_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ptr_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ptr_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ptr_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ptr_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ptr_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ptr_AWVALID),
    .m_axi_BID(m_axi_edge_list_ptr_BID),
    .m_axi_BREADY(m_axi_edge_list_ptr_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ptr_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ptr_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ptr_RDATA),
    .m_axi_RID(m_axi_edge_list_ptr_RID),
    .m_axi_RLAST(m_axi_edge_list_ptr_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ptr_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ptr_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ptr_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ptr_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ptr_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ptr_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ptr_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ptr_WVALID),
    .read_addr_din(edge_list_ptr_read_addr__din),
    .read_addr_full_n(edge_list_ptr_read_addr__full_n),
    .read_addr_write(edge_list_ptr_read_addr__write),
    .read_data_dout(edge_list_ptr_read_data__dout),
    .read_data_empty_n(edge_list_ptr_read_data__empty_n),
    .read_data_read(edge_list_ptr_read_data__read),
    .write_addr_din(edge_list_ptr_write_addr__din),
    .write_addr_full_n(edge_list_ptr_write_addr__full_n),
    .write_addr_write(edge_list_ptr_write_addr__write),
    .write_data_din(edge_list_ptr_write_data__din),
    .write_data_full_n(edge_list_ptr_write_data__full_n),
    .write_data_write(edge_list_ptr_write_data__write),
    .write_resp_dout(edge_list_ptr_write_resp__dout),
    .write_resp_empty_n(edge_list_ptr_write_resp__empty_n),
    .write_resp_read(edge_list_ptr_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) async_mmap
  #(
    .DataWidth(64),
    .DataWidthBytesLog(3),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(127)
  )
  vec_res__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(wr_r_0___vec_res__q0),
    .m_axi_ARADDR(m_axi_vec_res_ARADDR),
    .m_axi_ARBURST(m_axi_vec_res_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_res_ARCACHE),
    .m_axi_ARID(m_axi_vec_res_ARID),
    .m_axi_ARLEN(m_axi_vec_res_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_res_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_res_ARPROT),
    .m_axi_ARQOS(m_axi_vec_res_ARQOS),
    .m_axi_ARREADY(m_axi_vec_res_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_res_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_res_ARVALID),
    .m_axi_AWADDR(m_axi_vec_res_AWADDR),
    .m_axi_AWBURST(m_axi_vec_res_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_res_AWCACHE),
    .m_axi_AWID(m_axi_vec_res_AWID),
    .m_axi_AWLEN(m_axi_vec_res_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_res_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_res_AWPROT),
    .m_axi_AWQOS(m_axi_vec_res_AWQOS),
    .m_axi_AWREADY(m_axi_vec_res_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_res_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_res_AWVALID),
    .m_axi_BID(m_axi_vec_res_BID),
    .m_axi_BREADY(m_axi_vec_res_BREADY),
    .m_axi_BRESP(m_axi_vec_res_BRESP),
    .m_axi_BVALID(m_axi_vec_res_BVALID),
    .m_axi_RDATA(m_axi_vec_res_RDATA),
    .m_axi_RID(m_axi_vec_res_RID),
    .m_axi_RLAST(m_axi_vec_res_RLAST),
    .m_axi_RREADY(m_axi_vec_res_RREADY),
    .m_axi_RRESP(m_axi_vec_res_RRESP),
    .m_axi_RVALID(m_axi_vec_res_RVALID),
    .m_axi_WDATA(m_axi_vec_res_WDATA),
    .m_axi_WLAST(m_axi_vec_res_WLAST),
    .m_axi_WREADY(m_axi_vec_res_WREADY),
    .m_axi_WSTRB(m_axi_vec_res_WSTRB),
    .m_axi_WVALID(m_axi_vec_res_WVALID),
    .read_addr_din(vec_res_read_addr__din),
    .read_addr_full_n(vec_res_read_addr__full_n),
    .read_addr_write(vec_res_read_addr__write),
    .read_data_dout(vec_res_read_data__dout),
    .read_data_empty_n(vec_res_read_data__empty_n),
    .read_data_read(vec_res_read_data__read),
    .write_addr_din(vec_res_write_addr__din),
    .write_addr_full_n(vec_res_write_addr__full_n),
    .write_addr_write(vec_res_write_addr__write),
    .write_data_din(vec_res_write_data__din),
    .write_data_full_n(vec_res_write_data__full_n),
    .write_data_write(vec_res_write_data__write),
    .write_resp_dout(vec_res_write_resp__dout),
    .write_resp_empty_n(vec_res_write_resp__empty_n),
    .write_resp_read(vec_res_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) Callipepla_fsm
  __tapa_fsm_unit
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .Arbiter_Y_0__ap_start(Arbiter_Y_0__ap_start),
    .Arbiter_Y_0__ap_ready(Arbiter_Y_0__ap_ready),
    .Arbiter_Y_0__ap_done(Arbiter_Y_0__ap_done),
    .Arbiter_Y_0__ap_idle(Arbiter_Y_0__ap_idle),
    .Arbiter_Y_1__ap_start(Arbiter_Y_1__ap_start),
    .Arbiter_Y_1__ap_ready(Arbiter_Y_1__ap_ready),
    .Arbiter_Y_1__ap_done(Arbiter_Y_1__ap_done),
    .Arbiter_Y_1__ap_idle(Arbiter_Y_1__ap_idle),
    .Arbiter_Y_2__ap_start(Arbiter_Y_2__ap_start),
    .Arbiter_Y_2__ap_ready(Arbiter_Y_2__ap_ready),
    .Arbiter_Y_2__ap_done(Arbiter_Y_2__ap_done),
    .Arbiter_Y_2__ap_idle(Arbiter_Y_2__ap_idle),
    .Arbiter_Y_3__ap_start(Arbiter_Y_3__ap_start),
    .Arbiter_Y_3__ap_ready(Arbiter_Y_3__ap_ready),
    .Arbiter_Y_3__ap_done(Arbiter_Y_3__ap_done),
    .Arbiter_Y_3__ap_idle(Arbiter_Y_3__ap_idle),
    .Arbiter_Y_4__ap_start(Arbiter_Y_4__ap_start),
    .Arbiter_Y_4__ap_ready(Arbiter_Y_4__ap_ready),
    .Arbiter_Y_4__ap_done(Arbiter_Y_4__ap_done),
    .Arbiter_Y_4__ap_idle(Arbiter_Y_4__ap_idle),
    .Arbiter_Y_5__ap_start(Arbiter_Y_5__ap_start),
    .Arbiter_Y_5__ap_ready(Arbiter_Y_5__ap_ready),
    .Arbiter_Y_5__ap_done(Arbiter_Y_5__ap_done),
    .Arbiter_Y_5__ap_idle(Arbiter_Y_5__ap_idle),
    .Arbiter_Y_6__ap_start(Arbiter_Y_6__ap_start),
    .Arbiter_Y_6__ap_ready(Arbiter_Y_6__ap_ready),
    .Arbiter_Y_6__ap_done(Arbiter_Y_6__ap_done),
    .Arbiter_Y_6__ap_idle(Arbiter_Y_6__ap_idle),
    .Arbiter_Y_7__ap_start(Arbiter_Y_7__ap_start),
    .Arbiter_Y_7__ap_ready(Arbiter_Y_7__ap_ready),
    .Arbiter_Y_7__ap_done(Arbiter_Y_7__ap_done),
    .Arbiter_Y_7__ap_idle(Arbiter_Y_7__ap_idle),
    .Merger_Y_0__ap_start(Merger_Y_0__ap_start),
    .PEG_Xvec_0__ap_start(PEG_Xvec_0__ap_start),
    .PEG_Xvec_0__ap_ready(PEG_Xvec_0__ap_ready),
    .PEG_Xvec_0__ap_done(PEG_Xvec_0__ap_done),
    .PEG_Xvec_0__ap_idle(PEG_Xvec_0__ap_idle),
    .PEG_Xvec_1__ap_start(PEG_Xvec_1__ap_start),
    .PEG_Xvec_1__ap_ready(PEG_Xvec_1__ap_ready),
    .PEG_Xvec_1__ap_done(PEG_Xvec_1__ap_done),
    .PEG_Xvec_1__ap_idle(PEG_Xvec_1__ap_idle),
    .PEG_Xvec_2__ap_start(PEG_Xvec_2__ap_start),
    .PEG_Xvec_2__ap_ready(PEG_Xvec_2__ap_ready),
    .PEG_Xvec_2__ap_done(PEG_Xvec_2__ap_done),
    .PEG_Xvec_2__ap_idle(PEG_Xvec_2__ap_idle),
    .PEG_Xvec_3__ap_start(PEG_Xvec_3__ap_start),
    .PEG_Xvec_3__ap_ready(PEG_Xvec_3__ap_ready),
    .PEG_Xvec_3__ap_done(PEG_Xvec_3__ap_done),
    .PEG_Xvec_3__ap_idle(PEG_Xvec_3__ap_idle),
    .PEG_Xvec_4__ap_start(PEG_Xvec_4__ap_start),
    .PEG_Xvec_4__ap_ready(PEG_Xvec_4__ap_ready),
    .PEG_Xvec_4__ap_done(PEG_Xvec_4__ap_done),
    .PEG_Xvec_4__ap_idle(PEG_Xvec_4__ap_idle),
    .PEG_Xvec_5__ap_start(PEG_Xvec_5__ap_start),
    .PEG_Xvec_5__ap_ready(PEG_Xvec_5__ap_ready),
    .PEG_Xvec_5__ap_done(PEG_Xvec_5__ap_done),
    .PEG_Xvec_5__ap_idle(PEG_Xvec_5__ap_idle),
    .PEG_Xvec_6__ap_start(PEG_Xvec_6__ap_start),
    .PEG_Xvec_6__ap_ready(PEG_Xvec_6__ap_ready),
    .PEG_Xvec_6__ap_done(PEG_Xvec_6__ap_done),
    .PEG_Xvec_6__ap_idle(PEG_Xvec_6__ap_idle),
    .PEG_Xvec_7__ap_start(PEG_Xvec_7__ap_start),
    .PEG_Xvec_7__ap_ready(PEG_Xvec_7__ap_ready),
    .PEG_Xvec_7__ap_done(PEG_Xvec_7__ap_done),
    .PEG_Xvec_7__ap_idle(PEG_Xvec_7__ap_idle),
    .PEG_Xvec_8__ap_start(PEG_Xvec_8__ap_start),
    .PEG_Xvec_8__ap_ready(PEG_Xvec_8__ap_ready),
    .PEG_Xvec_8__ap_done(PEG_Xvec_8__ap_done),
    .PEG_Xvec_8__ap_idle(PEG_Xvec_8__ap_idle),
    .PEG_Xvec_9__ap_start(PEG_Xvec_9__ap_start),
    .PEG_Xvec_9__ap_ready(PEG_Xvec_9__ap_ready),
    .PEG_Xvec_9__ap_done(PEG_Xvec_9__ap_done),
    .PEG_Xvec_9__ap_idle(PEG_Xvec_9__ap_idle),
    .PEG_Xvec_10__ap_start(PEG_Xvec_10__ap_start),
    .PEG_Xvec_10__ap_ready(PEG_Xvec_10__ap_ready),
    .PEG_Xvec_10__ap_done(PEG_Xvec_10__ap_done),
    .PEG_Xvec_10__ap_idle(PEG_Xvec_10__ap_idle),
    .PEG_Xvec_11__ap_start(PEG_Xvec_11__ap_start),
    .PEG_Xvec_11__ap_ready(PEG_Xvec_11__ap_ready),
    .PEG_Xvec_11__ap_done(PEG_Xvec_11__ap_done),
    .PEG_Xvec_11__ap_idle(PEG_Xvec_11__ap_idle),
    .PEG_Xvec_12__ap_start(PEG_Xvec_12__ap_start),
    .PEG_Xvec_12__ap_ready(PEG_Xvec_12__ap_ready),
    .PEG_Xvec_12__ap_done(PEG_Xvec_12__ap_done),
    .PEG_Xvec_12__ap_idle(PEG_Xvec_12__ap_idle),
    .PEG_Xvec_13__ap_start(PEG_Xvec_13__ap_start),
    .PEG_Xvec_13__ap_ready(PEG_Xvec_13__ap_ready),
    .PEG_Xvec_13__ap_done(PEG_Xvec_13__ap_done),
    .PEG_Xvec_13__ap_idle(PEG_Xvec_13__ap_idle),
    .PEG_Xvec_14__ap_start(PEG_Xvec_14__ap_start),
    .PEG_Xvec_14__ap_ready(PEG_Xvec_14__ap_ready),
    .PEG_Xvec_14__ap_done(PEG_Xvec_14__ap_done),
    .PEG_Xvec_14__ap_idle(PEG_Xvec_14__ap_idle),
    .PEG_Xvec_15__ap_start(PEG_Xvec_15__ap_start),
    .PEG_Xvec_15__ap_ready(PEG_Xvec_15__ap_ready),
    .PEG_Xvec_15__ap_done(PEG_Xvec_15__ap_done),
    .PEG_Xvec_15__ap_idle(PEG_Xvec_15__ap_idle),
    .PEG_Yvec_0__ap_start(PEG_Yvec_0__ap_start),
    .PEG_Yvec_0__ap_ready(PEG_Yvec_0__ap_ready),
    .PEG_Yvec_0__ap_done(PEG_Yvec_0__ap_done),
    .PEG_Yvec_0__ap_idle(PEG_Yvec_0__ap_idle),
    .PEG_Yvec_1__ap_start(PEG_Yvec_1__ap_start),
    .PEG_Yvec_1__ap_ready(PEG_Yvec_1__ap_ready),
    .PEG_Yvec_1__ap_done(PEG_Yvec_1__ap_done),
    .PEG_Yvec_1__ap_idle(PEG_Yvec_1__ap_idle),
    .PEG_Yvec_2__ap_start(PEG_Yvec_2__ap_start),
    .PEG_Yvec_2__ap_ready(PEG_Yvec_2__ap_ready),
    .PEG_Yvec_2__ap_done(PEG_Yvec_2__ap_done),
    .PEG_Yvec_2__ap_idle(PEG_Yvec_2__ap_idle),
    .PEG_Yvec_3__ap_start(PEG_Yvec_3__ap_start),
    .PEG_Yvec_3__ap_ready(PEG_Yvec_3__ap_ready),
    .PEG_Yvec_3__ap_done(PEG_Yvec_3__ap_done),
    .PEG_Yvec_3__ap_idle(PEG_Yvec_3__ap_idle),
    .PEG_Yvec_4__ap_start(PEG_Yvec_4__ap_start),
    .PEG_Yvec_4__ap_ready(PEG_Yvec_4__ap_ready),
    .PEG_Yvec_4__ap_done(PEG_Yvec_4__ap_done),
    .PEG_Yvec_4__ap_idle(PEG_Yvec_4__ap_idle),
    .PEG_Yvec_5__ap_start(PEG_Yvec_5__ap_start),
    .PEG_Yvec_5__ap_ready(PEG_Yvec_5__ap_ready),
    .PEG_Yvec_5__ap_done(PEG_Yvec_5__ap_done),
    .PEG_Yvec_5__ap_idle(PEG_Yvec_5__ap_idle),
    .PEG_Yvec_6__ap_start(PEG_Yvec_6__ap_start),
    .PEG_Yvec_6__ap_ready(PEG_Yvec_6__ap_ready),
    .PEG_Yvec_6__ap_done(PEG_Yvec_6__ap_done),
    .PEG_Yvec_6__ap_idle(PEG_Yvec_6__ap_idle),
    .PEG_Yvec_7__ap_start(PEG_Yvec_7__ap_start),
    .PEG_Yvec_7__ap_ready(PEG_Yvec_7__ap_ready),
    .PEG_Yvec_7__ap_done(PEG_Yvec_7__ap_done),
    .PEG_Yvec_7__ap_idle(PEG_Yvec_7__ap_idle),
    .PEG_Yvec_8__ap_start(PEG_Yvec_8__ap_start),
    .PEG_Yvec_8__ap_ready(PEG_Yvec_8__ap_ready),
    .PEG_Yvec_8__ap_done(PEG_Yvec_8__ap_done),
    .PEG_Yvec_8__ap_idle(PEG_Yvec_8__ap_idle),
    .PEG_Yvec_9__ap_start(PEG_Yvec_9__ap_start),
    .PEG_Yvec_9__ap_ready(PEG_Yvec_9__ap_ready),
    .PEG_Yvec_9__ap_done(PEG_Yvec_9__ap_done),
    .PEG_Yvec_9__ap_idle(PEG_Yvec_9__ap_idle),
    .PEG_Yvec_10__ap_start(PEG_Yvec_10__ap_start),
    .PEG_Yvec_10__ap_ready(PEG_Yvec_10__ap_ready),
    .PEG_Yvec_10__ap_done(PEG_Yvec_10__ap_done),
    .PEG_Yvec_10__ap_idle(PEG_Yvec_10__ap_idle),
    .PEG_Yvec_11__ap_start(PEG_Yvec_11__ap_start),
    .PEG_Yvec_11__ap_ready(PEG_Yvec_11__ap_ready),
    .PEG_Yvec_11__ap_done(PEG_Yvec_11__ap_done),
    .PEG_Yvec_11__ap_idle(PEG_Yvec_11__ap_idle),
    .PEG_Yvec_12__ap_start(PEG_Yvec_12__ap_start),
    .PEG_Yvec_12__ap_ready(PEG_Yvec_12__ap_ready),
    .PEG_Yvec_12__ap_done(PEG_Yvec_12__ap_done),
    .PEG_Yvec_12__ap_idle(PEG_Yvec_12__ap_idle),
    .PEG_Yvec_13__ap_start(PEG_Yvec_13__ap_start),
    .PEG_Yvec_13__ap_ready(PEG_Yvec_13__ap_ready),
    .PEG_Yvec_13__ap_done(PEG_Yvec_13__ap_done),
    .PEG_Yvec_13__ap_idle(PEG_Yvec_13__ap_idle),
    .PEG_Yvec_14__ap_start(PEG_Yvec_14__ap_start),
    .PEG_Yvec_14__ap_ready(PEG_Yvec_14__ap_ready),
    .PEG_Yvec_14__ap_done(PEG_Yvec_14__ap_done),
    .PEG_Yvec_14__ap_idle(PEG_Yvec_14__ap_idle),
    .PEG_Yvec_15__ap_start(PEG_Yvec_15__ap_start),
    .PEG_Yvec_15__ap_ready(PEG_Yvec_15__ap_ready),
    .PEG_Yvec_15__ap_done(PEG_Yvec_15__ap_done),
    .PEG_Yvec_15__ap_idle(PEG_Yvec_15__ap_idle),
    .black_hole_bool_0__ap_start(black_hole_bool_0__ap_start),
    .black_hole_bool_1__ap_start(black_hole_bool_1__ap_start),
    .black_hole_double_v8_0__ap_start(black_hole_double_v8_0__ap_start),
    .black_hole_int_0__ap_start(black_hole_int_0__ap_start),
    .ctrl_AP_0__ap_start(ctrl_AP_0__ap_start),
    .ctrl_AP_0__ap_ready(ctrl_AP_0__ap_ready),
    .ctrl_AP_0__ap_done(ctrl_AP_0__ap_done),
    .ctrl_AP_0__ap_idle(ctrl_AP_0__ap_idle),
    .ctrl_P_0__ap_start(ctrl_P_0__ap_start),
    .ctrl_P_0__ap_ready(ctrl_P_0__ap_ready),
    .ctrl_P_0__ap_done(ctrl_P_0__ap_done),
    .ctrl_P_0__ap_idle(ctrl_P_0__ap_idle),
    .ctrl_R_0__ap_start(ctrl_R_0__ap_start),
    .ctrl_R_0__ap_ready(ctrl_R_0__ap_ready),
    .ctrl_R_0__ap_done(ctrl_R_0__ap_done),
    .ctrl_R_0__ap_idle(ctrl_R_0__ap_idle),
    .ctrl_X_0__ap_start(ctrl_X_0__ap_start),
    .ctrl_X_0__ap_ready(ctrl_X_0__ap_ready),
    .ctrl_X_0__ap_done(ctrl_X_0__ap_done),
    .ctrl_X_0__ap_idle(ctrl_X_0__ap_idle),
    .dot_alpha_0__ap_start(dot_alpha_0__ap_start),
    .dot_alpha_0__ap_ready(dot_alpha_0__ap_ready),
    .dot_alpha_0__ap_done(dot_alpha_0__ap_done),
    .dot_alpha_0__ap_idle(dot_alpha_0__ap_idle),
    .dot_res_0__ap_start(dot_res_0__ap_start),
    .dot_res_0__ap_ready(dot_res_0__ap_ready),
    .dot_res_0__ap_done(dot_res_0__ap_done),
    .dot_res_0__ap_idle(dot_res_0__ap_idle),
    .dot_rznew_0__ap_start(dot_rznew_0__ap_start),
    .dot_rznew_0__ap_ready(dot_rznew_0__ap_ready),
    .dot_rznew_0__ap_done(dot_rznew_0__ap_done),
    .dot_rznew_0__ap_idle(dot_rznew_0__ap_idle),
    .duplicator_0__ap_start(duplicator_0__ap_start),
    .left_div_0__ap_start(left_div_0__ap_start),
    .left_div_0__ap_ready(left_div_0__ap_ready),
    .left_div_0__ap_done(left_div_0__ap_done),
    .left_div_0__ap_idle(left_div_0__ap_idle),
    .rdwr_vec_0__ap_start(rdwr_vec_0__ap_start),
    .rdwr_vec_1__ap_start(rdwr_vec_1__ap_start),
    .rdwr_vec_2__ap_start(rdwr_vec_2__ap_start),
    .rdwr_vec_3__ap_start(rdwr_vec_3__ap_start),
    .rdwr_vec_4__ap_start(rdwr_vec_4__ap_start),
    .rdwr_vec_5__ap_start(rdwr_vec_5__ap_start),
    .rdwr_vec_6__ap_start(rdwr_vec_6__ap_start),
    .read_A_0__ap_start(read_A_0__ap_start),
    .read_A_0__ap_ready(read_A_0__ap_ready),
    .read_A_0__ap_done(read_A_0__ap_done),
    .read_A_0__ap_idle(read_A_0__ap_idle),
    .read_A_1__ap_start(read_A_1__ap_start),
    .read_A_1__ap_ready(read_A_1__ap_ready),
    .read_A_1__ap_done(read_A_1__ap_done),
    .read_A_1__ap_idle(read_A_1__ap_idle),
    .read_A_2__ap_start(read_A_2__ap_start),
    .read_A_2__ap_ready(read_A_2__ap_ready),
    .read_A_2__ap_done(read_A_2__ap_done),
    .read_A_2__ap_idle(read_A_2__ap_idle),
    .read_A_3__ap_start(read_A_3__ap_start),
    .read_A_3__ap_ready(read_A_3__ap_ready),
    .read_A_3__ap_done(read_A_3__ap_done),
    .read_A_3__ap_idle(read_A_3__ap_idle),
    .read_A_4__ap_start(read_A_4__ap_start),
    .read_A_4__ap_ready(read_A_4__ap_ready),
    .read_A_4__ap_done(read_A_4__ap_done),
    .read_A_4__ap_idle(read_A_4__ap_idle),
    .read_A_5__ap_start(read_A_5__ap_start),
    .read_A_5__ap_ready(read_A_5__ap_ready),
    .read_A_5__ap_done(read_A_5__ap_done),
    .read_A_5__ap_idle(read_A_5__ap_idle),
    .read_A_6__ap_start(read_A_6__ap_start),
    .read_A_6__ap_ready(read_A_6__ap_ready),
    .read_A_6__ap_done(read_A_6__ap_done),
    .read_A_6__ap_idle(read_A_6__ap_idle),
    .read_A_7__ap_start(read_A_7__ap_start),
    .read_A_7__ap_ready(read_A_7__ap_ready),
    .read_A_7__ap_done(read_A_7__ap_done),
    .read_A_7__ap_idle(read_A_7__ap_idle),
    .read_A_8__ap_start(read_A_8__ap_start),
    .read_A_8__ap_ready(read_A_8__ap_ready),
    .read_A_8__ap_done(read_A_8__ap_done),
    .read_A_8__ap_idle(read_A_8__ap_idle),
    .read_A_9__ap_start(read_A_9__ap_start),
    .read_A_9__ap_ready(read_A_9__ap_ready),
    .read_A_9__ap_done(read_A_9__ap_done),
    .read_A_9__ap_idle(read_A_9__ap_idle),
    .read_A_10__ap_start(read_A_10__ap_start),
    .read_A_10__ap_ready(read_A_10__ap_ready),
    .read_A_10__ap_done(read_A_10__ap_done),
    .read_A_10__ap_idle(read_A_10__ap_idle),
    .read_A_11__ap_start(read_A_11__ap_start),
    .read_A_11__ap_ready(read_A_11__ap_ready),
    .read_A_11__ap_done(read_A_11__ap_done),
    .read_A_11__ap_idle(read_A_11__ap_idle),
    .read_A_12__ap_start(read_A_12__ap_start),
    .read_A_12__ap_ready(read_A_12__ap_ready),
    .read_A_12__ap_done(read_A_12__ap_done),
    .read_A_12__ap_idle(read_A_12__ap_idle),
    .read_A_13__ap_start(read_A_13__ap_start),
    .read_A_13__ap_ready(read_A_13__ap_ready),
    .read_A_13__ap_done(read_A_13__ap_done),
    .read_A_13__ap_idle(read_A_13__ap_idle),
    .read_A_14__ap_start(read_A_14__ap_start),
    .read_A_14__ap_ready(read_A_14__ap_ready),
    .read_A_14__ap_done(read_A_14__ap_done),
    .read_A_14__ap_idle(read_A_14__ap_idle),
    .read_A_15__ap_start(read_A_15__ap_start),
    .read_A_15__ap_ready(read_A_15__ap_ready),
    .read_A_15__ap_done(read_A_15__ap_done),
    .read_A_15__ap_idle(read_A_15__ap_idle),
    .read_digA_0__ap_start(read_digA_0__ap_start),
    .read_digA_0__ap_ready(read_digA_0__ap_ready),
    .read_digA_0__ap_done(read_digA_0__ap_done),
    .read_digA_0__ap_idle(read_digA_0__ap_idle),
    .read_edge_list_ptr_0__ap_start(read_edge_list_ptr_0__ap_start),
    .read_edge_list_ptr_0__ap_ready(read_edge_list_ptr_0__ap_ready),
    .read_edge_list_ptr_0__ap_done(read_edge_list_ptr_0__ap_done),
    .read_edge_list_ptr_0__ap_idle(read_edge_list_ptr_0__ap_idle),
    .term_signal_router_0__ap_start(term_signal_router_0__ap_start),
    .updt_p_0__ap_start(updt_p_0__ap_start),
    .updt_p_0__ap_ready(updt_p_0__ap_ready),
    .updt_p_0__ap_done(updt_p_0__ap_done),
    .updt_p_0__ap_idle(updt_p_0__ap_idle),
    .updt_r_0__ap_start(updt_r_0__ap_start),
    .updt_r_0__ap_ready(updt_r_0__ap_ready),
    .updt_r_0__ap_done(updt_r_0__ap_done),
    .updt_r_0__ap_idle(updt_r_0__ap_idle),
    .updt_x_0__ap_start(updt_x_0__ap_start),
    .updt_x_0__ap_ready(updt_x_0__ap_ready),
    .updt_x_0__ap_done(updt_x_0__ap_done),
    .updt_x_0__ap_idle(updt_x_0__ap_idle),
    .vecp_mux_0__ap_start(vecp_mux_0__ap_start),
    .vecp_mux_0__ap_ready(vecp_mux_0__ap_ready),
    .vecp_mux_0__ap_done(vecp_mux_0__ap_done),
    .vecp_mux_0__ap_idle(vecp_mux_0__ap_idle),
    .wr_r_0__ap_start(wr_r_0__ap_start),
    .wr_r_0__ap_ready(wr_r_0__ap_ready),
    .wr_r_0__ap_done(wr_r_0__ap_done),
    .wr_r_0__ap_idle(wr_r_0__ap_idle)
  );

  assign ap_rst_n_inv = (~ap_rst_n);
  assign Arbiter_Y_0___M__q0 = M;
  assign Arbiter_Y_0___rp_time__q0 = rp_time;
  assign Arbiter_Y_1___M__q0 = M;
  assign Arbiter_Y_1___rp_time__q0 = rp_time;
  assign Arbiter_Y_2___M__q0 = M;
  assign Arbiter_Y_2___rp_time__q0 = rp_time;
  assign Arbiter_Y_3___M__q0 = M;
  assign Arbiter_Y_3___rp_time__q0 = rp_time;
  assign Arbiter_Y_4___M__q0 = M;
  assign Arbiter_Y_4___rp_time__q0 = rp_time;
  assign Arbiter_Y_5___M__q0 = M;
  assign Arbiter_Y_5___rp_time__q0 = rp_time;
  assign Arbiter_Y_6___M__q0 = M;
  assign Arbiter_Y_6___rp_time__q0 = rp_time;
  assign Arbiter_Y_7___M__q0 = M;
  assign Arbiter_Y_7___rp_time__q0 = rp_time;
  assign ctrl_AP_0___M__q0 = M;
  assign ctrl_AP_0___rp_time__q0 = rp_time;
  assign ctrl_P_0___M__q0 = M;
  assign ctrl_P_0___rp_time__q0 = rp_time;
  assign ctrl_R_0___M__q0 = M;
  assign ctrl_R_0___rp_time__q0 = rp_time;
  assign ctrl_X_0___M__q0 = M;
  assign ctrl_X_0___rp_time__q0 = rp_time;
  assign dot_alpha_0___M__q0 = M;
  assign dot_alpha_0___rp_time__q0 = rp_time;
  assign dot_res_0___M__q0 = M;
  assign dot_res_0___rp_time__q0 = rp_time;
  assign dot_res_0___th_termination__q0 = th_termination;
  assign dot_rznew_0___M__q0 = M;
  assign dot_rznew_0___rp_time__q0 = rp_time;
  assign left_div_0___M__q0 = M;
  assign left_div_0___rp_time__q0 = rp_time;
  assign rdwr_vec_0___vec_p_0__q0 = vec_p_0;
  assign rdwr_vec_1___vec_p_1__q0 = vec_p_1;
  assign rdwr_vec_2___vec_r_0__q0 = vec_r_0;
  assign rdwr_vec_3___vec_r_1__q0 = vec_r_1;
  assign rdwr_vec_4___vec_x_0__q0 = vec_x_0;
  assign rdwr_vec_5___vec_x_1__q0 = vec_x_1;
  assign rdwr_vec_6___vec_Ap__q0 = vec_Ap;
  assign read_A_0___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_0___edge_list_ch_0__q0 = edge_list_ch_0;
  assign read_A_0___rp_time__q0 = rp_time;
  assign read_A_1___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_1___edge_list_ch_1__q0 = edge_list_ch_1;
  assign read_A_1___rp_time__q0 = rp_time;
  assign read_A_2___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_2___edge_list_ch_2__q0 = edge_list_ch_2;
  assign read_A_2___rp_time__q0 = rp_time;
  assign read_A_3___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_3___edge_list_ch_3__q0 = edge_list_ch_3;
  assign read_A_3___rp_time__q0 = rp_time;
  assign read_A_4___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_4___edge_list_ch_4__q0 = edge_list_ch_4;
  assign read_A_4___rp_time__q0 = rp_time;
  assign read_A_5___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_5___edge_list_ch_5__q0 = edge_list_ch_5;
  assign read_A_5___rp_time__q0 = rp_time;
  assign read_A_6___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_6___edge_list_ch_6__q0 = edge_list_ch_6;
  assign read_A_6___rp_time__q0 = rp_time;
  assign read_A_7___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_7___edge_list_ch_7__q0 = edge_list_ch_7;
  assign read_A_7___rp_time__q0 = rp_time;
  assign read_A_8___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_8___edge_list_ch_8__q0 = edge_list_ch_8;
  assign read_A_8___rp_time__q0 = rp_time;
  assign read_A_9___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_9___edge_list_ch_9__q0 = edge_list_ch_9;
  assign read_A_9___rp_time__q0 = rp_time;
  assign read_A_10___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_10___edge_list_ch_10__q0 = edge_list_ch_10;
  assign read_A_10___rp_time__q0 = rp_time;
  assign read_A_11___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_11___edge_list_ch_11__q0 = edge_list_ch_11;
  assign read_A_11___rp_time__q0 = rp_time;
  assign read_A_12___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_12___edge_list_ch_12__q0 = edge_list_ch_12;
  assign read_A_12___rp_time__q0 = rp_time;
  assign read_A_13___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_13___edge_list_ch_13__q0 = edge_list_ch_13;
  assign read_A_13___rp_time__q0 = rp_time;
  assign read_A_14___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_14___edge_list_ch_14__q0 = edge_list_ch_14;
  assign read_A_14___rp_time__q0 = rp_time;
  assign read_A_15___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_15___edge_list_ch_15__q0 = edge_list_ch_15;
  assign read_A_15___rp_time__q0 = rp_time;
  assign read_digA_0___M__q0 = M;
  assign read_digA_0___rp_time__q0 = rp_time;
  assign read_digA_0___vec_digA__q0 = vec_digA;
  assign read_edge_list_ptr_0___M__q0 = M;
  assign read_edge_list_ptr_0___NUM_ITE__q0 = NUM_ITE;
  assign read_edge_list_ptr_0___edge_list_ptr__q0 = edge_list_ptr;
  assign read_edge_list_ptr_0___rp_time__q0 = rp_time;
  assign updt_p_0___M__q0 = M;
  assign updt_p_0___rp_time__q0 = rp_time;
  assign updt_r_0___M__q0 = M;
  assign updt_r_0___rp_time__q0 = rp_time;
  assign updt_x_0___M__q0 = M;
  assign updt_x_0___rp_time__q0 = rp_time;
  assign vecp_mux_0___M__q0 = M;
  assign vecp_mux_0___rp_time__q0 = rp_time;
  assign wr_r_0___rp_time__q0 = rp_time;
  assign wr_r_0___vec_res__q0 = vec_res;

endmodule
