`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO = "Serpens_Serpens,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2262,HLS_SYN_LUT=4072,HLS_VERSION=2022_2}" *)


module Serpens
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
  m_axi_edge_list_ch_16_ARADDR,
  m_axi_edge_list_ch_16_ARBURST,
  m_axi_edge_list_ch_16_ARCACHE,
  m_axi_edge_list_ch_16_ARID,
  m_axi_edge_list_ch_16_ARLEN,
  m_axi_edge_list_ch_16_ARLOCK,
  m_axi_edge_list_ch_16_ARPROT,
  m_axi_edge_list_ch_16_ARQOS,
  m_axi_edge_list_ch_16_ARREADY,
  m_axi_edge_list_ch_16_ARSIZE,
  m_axi_edge_list_ch_16_ARVALID,
  m_axi_edge_list_ch_16_AWADDR,
  m_axi_edge_list_ch_16_AWBURST,
  m_axi_edge_list_ch_16_AWCACHE,
  m_axi_edge_list_ch_16_AWID,
  m_axi_edge_list_ch_16_AWLEN,
  m_axi_edge_list_ch_16_AWLOCK,
  m_axi_edge_list_ch_16_AWPROT,
  m_axi_edge_list_ch_16_AWQOS,
  m_axi_edge_list_ch_16_AWREADY,
  m_axi_edge_list_ch_16_AWSIZE,
  m_axi_edge_list_ch_16_AWVALID,
  m_axi_edge_list_ch_16_BID,
  m_axi_edge_list_ch_16_BREADY,
  m_axi_edge_list_ch_16_BRESP,
  m_axi_edge_list_ch_16_BVALID,
  m_axi_edge_list_ch_16_RDATA,
  m_axi_edge_list_ch_16_RID,
  m_axi_edge_list_ch_16_RLAST,
  m_axi_edge_list_ch_16_RREADY,
  m_axi_edge_list_ch_16_RRESP,
  m_axi_edge_list_ch_16_RVALID,
  m_axi_edge_list_ch_16_WDATA,
  m_axi_edge_list_ch_16_WLAST,
  m_axi_edge_list_ch_16_WREADY,
  m_axi_edge_list_ch_16_WSTRB,
  m_axi_edge_list_ch_16_WVALID,
  m_axi_edge_list_ch_17_ARADDR,
  m_axi_edge_list_ch_17_ARBURST,
  m_axi_edge_list_ch_17_ARCACHE,
  m_axi_edge_list_ch_17_ARID,
  m_axi_edge_list_ch_17_ARLEN,
  m_axi_edge_list_ch_17_ARLOCK,
  m_axi_edge_list_ch_17_ARPROT,
  m_axi_edge_list_ch_17_ARQOS,
  m_axi_edge_list_ch_17_ARREADY,
  m_axi_edge_list_ch_17_ARSIZE,
  m_axi_edge_list_ch_17_ARVALID,
  m_axi_edge_list_ch_17_AWADDR,
  m_axi_edge_list_ch_17_AWBURST,
  m_axi_edge_list_ch_17_AWCACHE,
  m_axi_edge_list_ch_17_AWID,
  m_axi_edge_list_ch_17_AWLEN,
  m_axi_edge_list_ch_17_AWLOCK,
  m_axi_edge_list_ch_17_AWPROT,
  m_axi_edge_list_ch_17_AWQOS,
  m_axi_edge_list_ch_17_AWREADY,
  m_axi_edge_list_ch_17_AWSIZE,
  m_axi_edge_list_ch_17_AWVALID,
  m_axi_edge_list_ch_17_BID,
  m_axi_edge_list_ch_17_BREADY,
  m_axi_edge_list_ch_17_BRESP,
  m_axi_edge_list_ch_17_BVALID,
  m_axi_edge_list_ch_17_RDATA,
  m_axi_edge_list_ch_17_RID,
  m_axi_edge_list_ch_17_RLAST,
  m_axi_edge_list_ch_17_RREADY,
  m_axi_edge_list_ch_17_RRESP,
  m_axi_edge_list_ch_17_RVALID,
  m_axi_edge_list_ch_17_WDATA,
  m_axi_edge_list_ch_17_WLAST,
  m_axi_edge_list_ch_17_WREADY,
  m_axi_edge_list_ch_17_WSTRB,
  m_axi_edge_list_ch_17_WVALID,
  m_axi_edge_list_ch_18_ARADDR,
  m_axi_edge_list_ch_18_ARBURST,
  m_axi_edge_list_ch_18_ARCACHE,
  m_axi_edge_list_ch_18_ARID,
  m_axi_edge_list_ch_18_ARLEN,
  m_axi_edge_list_ch_18_ARLOCK,
  m_axi_edge_list_ch_18_ARPROT,
  m_axi_edge_list_ch_18_ARQOS,
  m_axi_edge_list_ch_18_ARREADY,
  m_axi_edge_list_ch_18_ARSIZE,
  m_axi_edge_list_ch_18_ARVALID,
  m_axi_edge_list_ch_18_AWADDR,
  m_axi_edge_list_ch_18_AWBURST,
  m_axi_edge_list_ch_18_AWCACHE,
  m_axi_edge_list_ch_18_AWID,
  m_axi_edge_list_ch_18_AWLEN,
  m_axi_edge_list_ch_18_AWLOCK,
  m_axi_edge_list_ch_18_AWPROT,
  m_axi_edge_list_ch_18_AWQOS,
  m_axi_edge_list_ch_18_AWREADY,
  m_axi_edge_list_ch_18_AWSIZE,
  m_axi_edge_list_ch_18_AWVALID,
  m_axi_edge_list_ch_18_BID,
  m_axi_edge_list_ch_18_BREADY,
  m_axi_edge_list_ch_18_BRESP,
  m_axi_edge_list_ch_18_BVALID,
  m_axi_edge_list_ch_18_RDATA,
  m_axi_edge_list_ch_18_RID,
  m_axi_edge_list_ch_18_RLAST,
  m_axi_edge_list_ch_18_RREADY,
  m_axi_edge_list_ch_18_RRESP,
  m_axi_edge_list_ch_18_RVALID,
  m_axi_edge_list_ch_18_WDATA,
  m_axi_edge_list_ch_18_WLAST,
  m_axi_edge_list_ch_18_WREADY,
  m_axi_edge_list_ch_18_WSTRB,
  m_axi_edge_list_ch_18_WVALID,
  m_axi_edge_list_ch_19_ARADDR,
  m_axi_edge_list_ch_19_ARBURST,
  m_axi_edge_list_ch_19_ARCACHE,
  m_axi_edge_list_ch_19_ARID,
  m_axi_edge_list_ch_19_ARLEN,
  m_axi_edge_list_ch_19_ARLOCK,
  m_axi_edge_list_ch_19_ARPROT,
  m_axi_edge_list_ch_19_ARQOS,
  m_axi_edge_list_ch_19_ARREADY,
  m_axi_edge_list_ch_19_ARSIZE,
  m_axi_edge_list_ch_19_ARVALID,
  m_axi_edge_list_ch_19_AWADDR,
  m_axi_edge_list_ch_19_AWBURST,
  m_axi_edge_list_ch_19_AWCACHE,
  m_axi_edge_list_ch_19_AWID,
  m_axi_edge_list_ch_19_AWLEN,
  m_axi_edge_list_ch_19_AWLOCK,
  m_axi_edge_list_ch_19_AWPROT,
  m_axi_edge_list_ch_19_AWQOS,
  m_axi_edge_list_ch_19_AWREADY,
  m_axi_edge_list_ch_19_AWSIZE,
  m_axi_edge_list_ch_19_AWVALID,
  m_axi_edge_list_ch_19_BID,
  m_axi_edge_list_ch_19_BREADY,
  m_axi_edge_list_ch_19_BRESP,
  m_axi_edge_list_ch_19_BVALID,
  m_axi_edge_list_ch_19_RDATA,
  m_axi_edge_list_ch_19_RID,
  m_axi_edge_list_ch_19_RLAST,
  m_axi_edge_list_ch_19_RREADY,
  m_axi_edge_list_ch_19_RRESP,
  m_axi_edge_list_ch_19_RVALID,
  m_axi_edge_list_ch_19_WDATA,
  m_axi_edge_list_ch_19_WLAST,
  m_axi_edge_list_ch_19_WREADY,
  m_axi_edge_list_ch_19_WSTRB,
  m_axi_edge_list_ch_19_WVALID,
  m_axi_edge_list_ch_20_ARADDR,
  m_axi_edge_list_ch_20_ARBURST,
  m_axi_edge_list_ch_20_ARCACHE,
  m_axi_edge_list_ch_20_ARID,
  m_axi_edge_list_ch_20_ARLEN,
  m_axi_edge_list_ch_20_ARLOCK,
  m_axi_edge_list_ch_20_ARPROT,
  m_axi_edge_list_ch_20_ARQOS,
  m_axi_edge_list_ch_20_ARREADY,
  m_axi_edge_list_ch_20_ARSIZE,
  m_axi_edge_list_ch_20_ARVALID,
  m_axi_edge_list_ch_20_AWADDR,
  m_axi_edge_list_ch_20_AWBURST,
  m_axi_edge_list_ch_20_AWCACHE,
  m_axi_edge_list_ch_20_AWID,
  m_axi_edge_list_ch_20_AWLEN,
  m_axi_edge_list_ch_20_AWLOCK,
  m_axi_edge_list_ch_20_AWPROT,
  m_axi_edge_list_ch_20_AWQOS,
  m_axi_edge_list_ch_20_AWREADY,
  m_axi_edge_list_ch_20_AWSIZE,
  m_axi_edge_list_ch_20_AWVALID,
  m_axi_edge_list_ch_20_BID,
  m_axi_edge_list_ch_20_BREADY,
  m_axi_edge_list_ch_20_BRESP,
  m_axi_edge_list_ch_20_BVALID,
  m_axi_edge_list_ch_20_RDATA,
  m_axi_edge_list_ch_20_RID,
  m_axi_edge_list_ch_20_RLAST,
  m_axi_edge_list_ch_20_RREADY,
  m_axi_edge_list_ch_20_RRESP,
  m_axi_edge_list_ch_20_RVALID,
  m_axi_edge_list_ch_20_WDATA,
  m_axi_edge_list_ch_20_WLAST,
  m_axi_edge_list_ch_20_WREADY,
  m_axi_edge_list_ch_20_WSTRB,
  m_axi_edge_list_ch_20_WVALID,
  m_axi_edge_list_ch_21_ARADDR,
  m_axi_edge_list_ch_21_ARBURST,
  m_axi_edge_list_ch_21_ARCACHE,
  m_axi_edge_list_ch_21_ARID,
  m_axi_edge_list_ch_21_ARLEN,
  m_axi_edge_list_ch_21_ARLOCK,
  m_axi_edge_list_ch_21_ARPROT,
  m_axi_edge_list_ch_21_ARQOS,
  m_axi_edge_list_ch_21_ARREADY,
  m_axi_edge_list_ch_21_ARSIZE,
  m_axi_edge_list_ch_21_ARVALID,
  m_axi_edge_list_ch_21_AWADDR,
  m_axi_edge_list_ch_21_AWBURST,
  m_axi_edge_list_ch_21_AWCACHE,
  m_axi_edge_list_ch_21_AWID,
  m_axi_edge_list_ch_21_AWLEN,
  m_axi_edge_list_ch_21_AWLOCK,
  m_axi_edge_list_ch_21_AWPROT,
  m_axi_edge_list_ch_21_AWQOS,
  m_axi_edge_list_ch_21_AWREADY,
  m_axi_edge_list_ch_21_AWSIZE,
  m_axi_edge_list_ch_21_AWVALID,
  m_axi_edge_list_ch_21_BID,
  m_axi_edge_list_ch_21_BREADY,
  m_axi_edge_list_ch_21_BRESP,
  m_axi_edge_list_ch_21_BVALID,
  m_axi_edge_list_ch_21_RDATA,
  m_axi_edge_list_ch_21_RID,
  m_axi_edge_list_ch_21_RLAST,
  m_axi_edge_list_ch_21_RREADY,
  m_axi_edge_list_ch_21_RRESP,
  m_axi_edge_list_ch_21_RVALID,
  m_axi_edge_list_ch_21_WDATA,
  m_axi_edge_list_ch_21_WLAST,
  m_axi_edge_list_ch_21_WREADY,
  m_axi_edge_list_ch_21_WSTRB,
  m_axi_edge_list_ch_21_WVALID,
  m_axi_edge_list_ch_22_ARADDR,
  m_axi_edge_list_ch_22_ARBURST,
  m_axi_edge_list_ch_22_ARCACHE,
  m_axi_edge_list_ch_22_ARID,
  m_axi_edge_list_ch_22_ARLEN,
  m_axi_edge_list_ch_22_ARLOCK,
  m_axi_edge_list_ch_22_ARPROT,
  m_axi_edge_list_ch_22_ARQOS,
  m_axi_edge_list_ch_22_ARREADY,
  m_axi_edge_list_ch_22_ARSIZE,
  m_axi_edge_list_ch_22_ARVALID,
  m_axi_edge_list_ch_22_AWADDR,
  m_axi_edge_list_ch_22_AWBURST,
  m_axi_edge_list_ch_22_AWCACHE,
  m_axi_edge_list_ch_22_AWID,
  m_axi_edge_list_ch_22_AWLEN,
  m_axi_edge_list_ch_22_AWLOCK,
  m_axi_edge_list_ch_22_AWPROT,
  m_axi_edge_list_ch_22_AWQOS,
  m_axi_edge_list_ch_22_AWREADY,
  m_axi_edge_list_ch_22_AWSIZE,
  m_axi_edge_list_ch_22_AWVALID,
  m_axi_edge_list_ch_22_BID,
  m_axi_edge_list_ch_22_BREADY,
  m_axi_edge_list_ch_22_BRESP,
  m_axi_edge_list_ch_22_BVALID,
  m_axi_edge_list_ch_22_RDATA,
  m_axi_edge_list_ch_22_RID,
  m_axi_edge_list_ch_22_RLAST,
  m_axi_edge_list_ch_22_RREADY,
  m_axi_edge_list_ch_22_RRESP,
  m_axi_edge_list_ch_22_RVALID,
  m_axi_edge_list_ch_22_WDATA,
  m_axi_edge_list_ch_22_WLAST,
  m_axi_edge_list_ch_22_WREADY,
  m_axi_edge_list_ch_22_WSTRB,
  m_axi_edge_list_ch_22_WVALID,
  m_axi_edge_list_ch_23_ARADDR,
  m_axi_edge_list_ch_23_ARBURST,
  m_axi_edge_list_ch_23_ARCACHE,
  m_axi_edge_list_ch_23_ARID,
  m_axi_edge_list_ch_23_ARLEN,
  m_axi_edge_list_ch_23_ARLOCK,
  m_axi_edge_list_ch_23_ARPROT,
  m_axi_edge_list_ch_23_ARQOS,
  m_axi_edge_list_ch_23_ARREADY,
  m_axi_edge_list_ch_23_ARSIZE,
  m_axi_edge_list_ch_23_ARVALID,
  m_axi_edge_list_ch_23_AWADDR,
  m_axi_edge_list_ch_23_AWBURST,
  m_axi_edge_list_ch_23_AWCACHE,
  m_axi_edge_list_ch_23_AWID,
  m_axi_edge_list_ch_23_AWLEN,
  m_axi_edge_list_ch_23_AWLOCK,
  m_axi_edge_list_ch_23_AWPROT,
  m_axi_edge_list_ch_23_AWQOS,
  m_axi_edge_list_ch_23_AWREADY,
  m_axi_edge_list_ch_23_AWSIZE,
  m_axi_edge_list_ch_23_AWVALID,
  m_axi_edge_list_ch_23_BID,
  m_axi_edge_list_ch_23_BREADY,
  m_axi_edge_list_ch_23_BRESP,
  m_axi_edge_list_ch_23_BVALID,
  m_axi_edge_list_ch_23_RDATA,
  m_axi_edge_list_ch_23_RID,
  m_axi_edge_list_ch_23_RLAST,
  m_axi_edge_list_ch_23_RREADY,
  m_axi_edge_list_ch_23_RRESP,
  m_axi_edge_list_ch_23_RVALID,
  m_axi_edge_list_ch_23_WDATA,
  m_axi_edge_list_ch_23_WLAST,
  m_axi_edge_list_ch_23_WREADY,
  m_axi_edge_list_ch_23_WSTRB,
  m_axi_edge_list_ch_23_WVALID,
  m_axi_vec_X_ARADDR,
  m_axi_vec_X_ARBURST,
  m_axi_vec_X_ARCACHE,
  m_axi_vec_X_ARID,
  m_axi_vec_X_ARLEN,
  m_axi_vec_X_ARLOCK,
  m_axi_vec_X_ARPROT,
  m_axi_vec_X_ARQOS,
  m_axi_vec_X_ARREADY,
  m_axi_vec_X_ARSIZE,
  m_axi_vec_X_ARVALID,
  m_axi_vec_X_AWADDR,
  m_axi_vec_X_AWBURST,
  m_axi_vec_X_AWCACHE,
  m_axi_vec_X_AWID,
  m_axi_vec_X_AWLEN,
  m_axi_vec_X_AWLOCK,
  m_axi_vec_X_AWPROT,
  m_axi_vec_X_AWQOS,
  m_axi_vec_X_AWREADY,
  m_axi_vec_X_AWSIZE,
  m_axi_vec_X_AWVALID,
  m_axi_vec_X_BID,
  m_axi_vec_X_BREADY,
  m_axi_vec_X_BRESP,
  m_axi_vec_X_BVALID,
  m_axi_vec_X_RDATA,
  m_axi_vec_X_RID,
  m_axi_vec_X_RLAST,
  m_axi_vec_X_RREADY,
  m_axi_vec_X_RRESP,
  m_axi_vec_X_RVALID,
  m_axi_vec_X_WDATA,
  m_axi_vec_X_WLAST,
  m_axi_vec_X_WREADY,
  m_axi_vec_X_WSTRB,
  m_axi_vec_X_WVALID,
  m_axi_vec_Y_ARADDR,
  m_axi_vec_Y_ARBURST,
  m_axi_vec_Y_ARCACHE,
  m_axi_vec_Y_ARID,
  m_axi_vec_Y_ARLEN,
  m_axi_vec_Y_ARLOCK,
  m_axi_vec_Y_ARPROT,
  m_axi_vec_Y_ARQOS,
  m_axi_vec_Y_ARREADY,
  m_axi_vec_Y_ARSIZE,
  m_axi_vec_Y_ARVALID,
  m_axi_vec_Y_AWADDR,
  m_axi_vec_Y_AWBURST,
  m_axi_vec_Y_AWCACHE,
  m_axi_vec_Y_AWID,
  m_axi_vec_Y_AWLEN,
  m_axi_vec_Y_AWLOCK,
  m_axi_vec_Y_AWPROT,
  m_axi_vec_Y_AWQOS,
  m_axi_vec_Y_AWREADY,
  m_axi_vec_Y_AWSIZE,
  m_axi_vec_Y_AWVALID,
  m_axi_vec_Y_BID,
  m_axi_vec_Y_BREADY,
  m_axi_vec_Y_BRESP,
  m_axi_vec_Y_BVALID,
  m_axi_vec_Y_RDATA,
  m_axi_vec_Y_RID,
  m_axi_vec_Y_RLAST,
  m_axi_vec_Y_RREADY,
  m_axi_vec_Y_RRESP,
  m_axi_vec_Y_RVALID,
  m_axi_vec_Y_WDATA,
  m_axi_vec_Y_WLAST,
  m_axi_vec_Y_WREADY,
  m_axi_vec_Y_WSTRB,
  m_axi_vec_Y_WVALID,
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
  m_axi_vec_Y_out_ARADDR,
  m_axi_vec_Y_out_ARBURST,
  m_axi_vec_Y_out_ARCACHE,
  m_axi_vec_Y_out_ARID,
  m_axi_vec_Y_out_ARLEN,
  m_axi_vec_Y_out_ARLOCK,
  m_axi_vec_Y_out_ARPROT,
  m_axi_vec_Y_out_ARQOS,
  m_axi_vec_Y_out_ARREADY,
  m_axi_vec_Y_out_ARSIZE,
  m_axi_vec_Y_out_ARVALID,
  m_axi_vec_Y_out_AWADDR,
  m_axi_vec_Y_out_AWBURST,
  m_axi_vec_Y_out_AWCACHE,
  m_axi_vec_Y_out_AWID,
  m_axi_vec_Y_out_AWLEN,
  m_axi_vec_Y_out_AWLOCK,
  m_axi_vec_Y_out_AWPROT,
  m_axi_vec_Y_out_AWQOS,
  m_axi_vec_Y_out_AWREADY,
  m_axi_vec_Y_out_AWSIZE,
  m_axi_vec_Y_out_AWVALID,
  m_axi_vec_Y_out_BID,
  m_axi_vec_Y_out_BREADY,
  m_axi_vec_Y_out_BRESP,
  m_axi_vec_Y_out_BVALID,
  m_axi_vec_Y_out_RDATA,
  m_axi_vec_Y_out_RID,
  m_axi_vec_Y_out_RLAST,
  m_axi_vec_Y_out_RREADY,
  m_axi_vec_Y_out_RRESP,
  m_axi_vec_Y_out_RVALID,
  m_axi_vec_Y_out_WDATA,
  m_axi_vec_Y_out_WLAST,
  m_axi_vec_Y_out_WREADY,
  m_axi_vec_Y_out_WSTRB,
  m_axi_vec_Y_out_WVALID
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
  (* RS_HS = "m_axi_edge_list_ch_16_AR.data" *)output [63:0] m_axi_edge_list_ch_16_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.data" *)output [1:0] m_axi_edge_list_ch_16_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.data" *)output [3:0] m_axi_edge_list_ch_16_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.data" *)output [0:0] m_axi_edge_list_ch_16_ARID;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.data" *)output [7:0] m_axi_edge_list_ch_16_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.data" *)output m_axi_edge_list_ch_16_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.data" *)output [2:0] m_axi_edge_list_ch_16_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.data" *)output [3:0] m_axi_edge_list_ch_16_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.ready" *)input m_axi_edge_list_ch_16_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.data" *)output [2:0] m_axi_edge_list_ch_16_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_16_AR.valid" *)output m_axi_edge_list_ch_16_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.data" *)output [63:0] m_axi_edge_list_ch_16_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.data" *)output [1:0] m_axi_edge_list_ch_16_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.data" *)output [3:0] m_axi_edge_list_ch_16_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.data" *)output [0:0] m_axi_edge_list_ch_16_AWID;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.data" *)output [7:0] m_axi_edge_list_ch_16_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.data" *)output m_axi_edge_list_ch_16_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.data" *)output [2:0] m_axi_edge_list_ch_16_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.data" *)output [3:0] m_axi_edge_list_ch_16_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.ready" *)input m_axi_edge_list_ch_16_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.data" *)output [2:0] m_axi_edge_list_ch_16_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_16_AW.valid" *)output m_axi_edge_list_ch_16_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_16_B.data" *)input [0:0] m_axi_edge_list_ch_16_BID;
  (* RS_HS = "m_axi_edge_list_ch_16_B.ready" *)output m_axi_edge_list_ch_16_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_16_B.data" *)input [1:0] m_axi_edge_list_ch_16_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_16_B.valid" *)input m_axi_edge_list_ch_16_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_16_R.data" *)input [511:0] m_axi_edge_list_ch_16_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_16_R.data" *)input [0:0] m_axi_edge_list_ch_16_RID;
  (* RS_HS = "m_axi_edge_list_ch_16_R.data" *)input m_axi_edge_list_ch_16_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_16_R.ready" *)output m_axi_edge_list_ch_16_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_16_R.data" *)input [1:0] m_axi_edge_list_ch_16_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_16_R.valid" *)input m_axi_edge_list_ch_16_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_16_W.data" *)output [511:0] m_axi_edge_list_ch_16_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_16_W.data" *)output m_axi_edge_list_ch_16_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_16_W.ready" *)input m_axi_edge_list_ch_16_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_16_W.data" *)output [63:0] m_axi_edge_list_ch_16_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_16_W.valid" *)output m_axi_edge_list_ch_16_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.data" *)output [63:0] m_axi_edge_list_ch_17_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.data" *)output [1:0] m_axi_edge_list_ch_17_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.data" *)output [3:0] m_axi_edge_list_ch_17_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.data" *)output [0:0] m_axi_edge_list_ch_17_ARID;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.data" *)output [7:0] m_axi_edge_list_ch_17_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.data" *)output m_axi_edge_list_ch_17_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.data" *)output [2:0] m_axi_edge_list_ch_17_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.data" *)output [3:0] m_axi_edge_list_ch_17_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.ready" *)input m_axi_edge_list_ch_17_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.data" *)output [2:0] m_axi_edge_list_ch_17_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_17_AR.valid" *)output m_axi_edge_list_ch_17_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.data" *)output [63:0] m_axi_edge_list_ch_17_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.data" *)output [1:0] m_axi_edge_list_ch_17_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.data" *)output [3:0] m_axi_edge_list_ch_17_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.data" *)output [0:0] m_axi_edge_list_ch_17_AWID;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.data" *)output [7:0] m_axi_edge_list_ch_17_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.data" *)output m_axi_edge_list_ch_17_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.data" *)output [2:0] m_axi_edge_list_ch_17_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.data" *)output [3:0] m_axi_edge_list_ch_17_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.ready" *)input m_axi_edge_list_ch_17_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.data" *)output [2:0] m_axi_edge_list_ch_17_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_17_AW.valid" *)output m_axi_edge_list_ch_17_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_17_B.data" *)input [0:0] m_axi_edge_list_ch_17_BID;
  (* RS_HS = "m_axi_edge_list_ch_17_B.ready" *)output m_axi_edge_list_ch_17_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_17_B.data" *)input [1:0] m_axi_edge_list_ch_17_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_17_B.valid" *)input m_axi_edge_list_ch_17_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_17_R.data" *)input [511:0] m_axi_edge_list_ch_17_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_17_R.data" *)input [0:0] m_axi_edge_list_ch_17_RID;
  (* RS_HS = "m_axi_edge_list_ch_17_R.data" *)input m_axi_edge_list_ch_17_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_17_R.ready" *)output m_axi_edge_list_ch_17_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_17_R.data" *)input [1:0] m_axi_edge_list_ch_17_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_17_R.valid" *)input m_axi_edge_list_ch_17_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_17_W.data" *)output [511:0] m_axi_edge_list_ch_17_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_17_W.data" *)output m_axi_edge_list_ch_17_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_17_W.ready" *)input m_axi_edge_list_ch_17_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_17_W.data" *)output [63:0] m_axi_edge_list_ch_17_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_17_W.valid" *)output m_axi_edge_list_ch_17_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.data" *)output [63:0] m_axi_edge_list_ch_18_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.data" *)output [1:0] m_axi_edge_list_ch_18_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.data" *)output [3:0] m_axi_edge_list_ch_18_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.data" *)output [0:0] m_axi_edge_list_ch_18_ARID;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.data" *)output [7:0] m_axi_edge_list_ch_18_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.data" *)output m_axi_edge_list_ch_18_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.data" *)output [2:0] m_axi_edge_list_ch_18_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.data" *)output [3:0] m_axi_edge_list_ch_18_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.ready" *)input m_axi_edge_list_ch_18_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.data" *)output [2:0] m_axi_edge_list_ch_18_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_18_AR.valid" *)output m_axi_edge_list_ch_18_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.data" *)output [63:0] m_axi_edge_list_ch_18_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.data" *)output [1:0] m_axi_edge_list_ch_18_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.data" *)output [3:0] m_axi_edge_list_ch_18_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.data" *)output [0:0] m_axi_edge_list_ch_18_AWID;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.data" *)output [7:0] m_axi_edge_list_ch_18_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.data" *)output m_axi_edge_list_ch_18_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.data" *)output [2:0] m_axi_edge_list_ch_18_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.data" *)output [3:0] m_axi_edge_list_ch_18_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.ready" *)input m_axi_edge_list_ch_18_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.data" *)output [2:0] m_axi_edge_list_ch_18_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_18_AW.valid" *)output m_axi_edge_list_ch_18_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_18_B.data" *)input [0:0] m_axi_edge_list_ch_18_BID;
  (* RS_HS = "m_axi_edge_list_ch_18_B.ready" *)output m_axi_edge_list_ch_18_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_18_B.data" *)input [1:0] m_axi_edge_list_ch_18_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_18_B.valid" *)input m_axi_edge_list_ch_18_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_18_R.data" *)input [511:0] m_axi_edge_list_ch_18_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_18_R.data" *)input [0:0] m_axi_edge_list_ch_18_RID;
  (* RS_HS = "m_axi_edge_list_ch_18_R.data" *)input m_axi_edge_list_ch_18_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_18_R.ready" *)output m_axi_edge_list_ch_18_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_18_R.data" *)input [1:0] m_axi_edge_list_ch_18_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_18_R.valid" *)input m_axi_edge_list_ch_18_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_18_W.data" *)output [511:0] m_axi_edge_list_ch_18_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_18_W.data" *)output m_axi_edge_list_ch_18_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_18_W.ready" *)input m_axi_edge_list_ch_18_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_18_W.data" *)output [63:0] m_axi_edge_list_ch_18_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_18_W.valid" *)output m_axi_edge_list_ch_18_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.data" *)output [63:0] m_axi_edge_list_ch_19_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.data" *)output [1:0] m_axi_edge_list_ch_19_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.data" *)output [3:0] m_axi_edge_list_ch_19_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.data" *)output [0:0] m_axi_edge_list_ch_19_ARID;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.data" *)output [7:0] m_axi_edge_list_ch_19_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.data" *)output m_axi_edge_list_ch_19_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.data" *)output [2:0] m_axi_edge_list_ch_19_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.data" *)output [3:0] m_axi_edge_list_ch_19_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.ready" *)input m_axi_edge_list_ch_19_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.data" *)output [2:0] m_axi_edge_list_ch_19_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_19_AR.valid" *)output m_axi_edge_list_ch_19_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.data" *)output [63:0] m_axi_edge_list_ch_19_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.data" *)output [1:0] m_axi_edge_list_ch_19_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.data" *)output [3:0] m_axi_edge_list_ch_19_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.data" *)output [0:0] m_axi_edge_list_ch_19_AWID;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.data" *)output [7:0] m_axi_edge_list_ch_19_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.data" *)output m_axi_edge_list_ch_19_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.data" *)output [2:0] m_axi_edge_list_ch_19_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.data" *)output [3:0] m_axi_edge_list_ch_19_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.ready" *)input m_axi_edge_list_ch_19_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.data" *)output [2:0] m_axi_edge_list_ch_19_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_19_AW.valid" *)output m_axi_edge_list_ch_19_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_19_B.data" *)input [0:0] m_axi_edge_list_ch_19_BID;
  (* RS_HS = "m_axi_edge_list_ch_19_B.ready" *)output m_axi_edge_list_ch_19_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_19_B.data" *)input [1:0] m_axi_edge_list_ch_19_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_19_B.valid" *)input m_axi_edge_list_ch_19_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_19_R.data" *)input [511:0] m_axi_edge_list_ch_19_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_19_R.data" *)input [0:0] m_axi_edge_list_ch_19_RID;
  (* RS_HS = "m_axi_edge_list_ch_19_R.data" *)input m_axi_edge_list_ch_19_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_19_R.ready" *)output m_axi_edge_list_ch_19_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_19_R.data" *)input [1:0] m_axi_edge_list_ch_19_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_19_R.valid" *)input m_axi_edge_list_ch_19_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_19_W.data" *)output [511:0] m_axi_edge_list_ch_19_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_19_W.data" *)output m_axi_edge_list_ch_19_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_19_W.ready" *)input m_axi_edge_list_ch_19_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_19_W.data" *)output [63:0] m_axi_edge_list_ch_19_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_19_W.valid" *)output m_axi_edge_list_ch_19_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.data" *)output [63:0] m_axi_edge_list_ch_20_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.data" *)output [1:0] m_axi_edge_list_ch_20_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.data" *)output [3:0] m_axi_edge_list_ch_20_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.data" *)output [0:0] m_axi_edge_list_ch_20_ARID;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.data" *)output [7:0] m_axi_edge_list_ch_20_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.data" *)output m_axi_edge_list_ch_20_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.data" *)output [2:0] m_axi_edge_list_ch_20_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.data" *)output [3:0] m_axi_edge_list_ch_20_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.ready" *)input m_axi_edge_list_ch_20_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.data" *)output [2:0] m_axi_edge_list_ch_20_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_20_AR.valid" *)output m_axi_edge_list_ch_20_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.data" *)output [63:0] m_axi_edge_list_ch_20_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.data" *)output [1:0] m_axi_edge_list_ch_20_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.data" *)output [3:0] m_axi_edge_list_ch_20_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.data" *)output [0:0] m_axi_edge_list_ch_20_AWID;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.data" *)output [7:0] m_axi_edge_list_ch_20_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.data" *)output m_axi_edge_list_ch_20_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.data" *)output [2:0] m_axi_edge_list_ch_20_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.data" *)output [3:0] m_axi_edge_list_ch_20_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.ready" *)input m_axi_edge_list_ch_20_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.data" *)output [2:0] m_axi_edge_list_ch_20_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_20_AW.valid" *)output m_axi_edge_list_ch_20_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_20_B.data" *)input [0:0] m_axi_edge_list_ch_20_BID;
  (* RS_HS = "m_axi_edge_list_ch_20_B.ready" *)output m_axi_edge_list_ch_20_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_20_B.data" *)input [1:0] m_axi_edge_list_ch_20_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_20_B.valid" *)input m_axi_edge_list_ch_20_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_20_R.data" *)input [511:0] m_axi_edge_list_ch_20_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_20_R.data" *)input [0:0] m_axi_edge_list_ch_20_RID;
  (* RS_HS = "m_axi_edge_list_ch_20_R.data" *)input m_axi_edge_list_ch_20_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_20_R.ready" *)output m_axi_edge_list_ch_20_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_20_R.data" *)input [1:0] m_axi_edge_list_ch_20_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_20_R.valid" *)input m_axi_edge_list_ch_20_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_20_W.data" *)output [511:0] m_axi_edge_list_ch_20_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_20_W.data" *)output m_axi_edge_list_ch_20_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_20_W.ready" *)input m_axi_edge_list_ch_20_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_20_W.data" *)output [63:0] m_axi_edge_list_ch_20_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_20_W.valid" *)output m_axi_edge_list_ch_20_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.data" *)output [63:0] m_axi_edge_list_ch_21_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.data" *)output [1:0] m_axi_edge_list_ch_21_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.data" *)output [3:0] m_axi_edge_list_ch_21_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.data" *)output [0:0] m_axi_edge_list_ch_21_ARID;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.data" *)output [7:0] m_axi_edge_list_ch_21_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.data" *)output m_axi_edge_list_ch_21_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.data" *)output [2:0] m_axi_edge_list_ch_21_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.data" *)output [3:0] m_axi_edge_list_ch_21_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.ready" *)input m_axi_edge_list_ch_21_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.data" *)output [2:0] m_axi_edge_list_ch_21_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_21_AR.valid" *)output m_axi_edge_list_ch_21_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.data" *)output [63:0] m_axi_edge_list_ch_21_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.data" *)output [1:0] m_axi_edge_list_ch_21_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.data" *)output [3:0] m_axi_edge_list_ch_21_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.data" *)output [0:0] m_axi_edge_list_ch_21_AWID;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.data" *)output [7:0] m_axi_edge_list_ch_21_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.data" *)output m_axi_edge_list_ch_21_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.data" *)output [2:0] m_axi_edge_list_ch_21_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.data" *)output [3:0] m_axi_edge_list_ch_21_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.ready" *)input m_axi_edge_list_ch_21_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.data" *)output [2:0] m_axi_edge_list_ch_21_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_21_AW.valid" *)output m_axi_edge_list_ch_21_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_21_B.data" *)input [0:0] m_axi_edge_list_ch_21_BID;
  (* RS_HS = "m_axi_edge_list_ch_21_B.ready" *)output m_axi_edge_list_ch_21_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_21_B.data" *)input [1:0] m_axi_edge_list_ch_21_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_21_B.valid" *)input m_axi_edge_list_ch_21_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_21_R.data" *)input [511:0] m_axi_edge_list_ch_21_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_21_R.data" *)input [0:0] m_axi_edge_list_ch_21_RID;
  (* RS_HS = "m_axi_edge_list_ch_21_R.data" *)input m_axi_edge_list_ch_21_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_21_R.ready" *)output m_axi_edge_list_ch_21_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_21_R.data" *)input [1:0] m_axi_edge_list_ch_21_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_21_R.valid" *)input m_axi_edge_list_ch_21_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_21_W.data" *)output [511:0] m_axi_edge_list_ch_21_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_21_W.data" *)output m_axi_edge_list_ch_21_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_21_W.ready" *)input m_axi_edge_list_ch_21_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_21_W.data" *)output [63:0] m_axi_edge_list_ch_21_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_21_W.valid" *)output m_axi_edge_list_ch_21_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.data" *)output [63:0] m_axi_edge_list_ch_22_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.data" *)output [1:0] m_axi_edge_list_ch_22_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.data" *)output [3:0] m_axi_edge_list_ch_22_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.data" *)output [0:0] m_axi_edge_list_ch_22_ARID;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.data" *)output [7:0] m_axi_edge_list_ch_22_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.data" *)output m_axi_edge_list_ch_22_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.data" *)output [2:0] m_axi_edge_list_ch_22_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.data" *)output [3:0] m_axi_edge_list_ch_22_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.ready" *)input m_axi_edge_list_ch_22_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.data" *)output [2:0] m_axi_edge_list_ch_22_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_22_AR.valid" *)output m_axi_edge_list_ch_22_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.data" *)output [63:0] m_axi_edge_list_ch_22_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.data" *)output [1:0] m_axi_edge_list_ch_22_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.data" *)output [3:0] m_axi_edge_list_ch_22_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.data" *)output [0:0] m_axi_edge_list_ch_22_AWID;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.data" *)output [7:0] m_axi_edge_list_ch_22_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.data" *)output m_axi_edge_list_ch_22_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.data" *)output [2:0] m_axi_edge_list_ch_22_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.data" *)output [3:0] m_axi_edge_list_ch_22_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.ready" *)input m_axi_edge_list_ch_22_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.data" *)output [2:0] m_axi_edge_list_ch_22_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_22_AW.valid" *)output m_axi_edge_list_ch_22_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_22_B.data" *)input [0:0] m_axi_edge_list_ch_22_BID;
  (* RS_HS = "m_axi_edge_list_ch_22_B.ready" *)output m_axi_edge_list_ch_22_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_22_B.data" *)input [1:0] m_axi_edge_list_ch_22_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_22_B.valid" *)input m_axi_edge_list_ch_22_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_22_R.data" *)input [511:0] m_axi_edge_list_ch_22_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_22_R.data" *)input [0:0] m_axi_edge_list_ch_22_RID;
  (* RS_HS = "m_axi_edge_list_ch_22_R.data" *)input m_axi_edge_list_ch_22_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_22_R.ready" *)output m_axi_edge_list_ch_22_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_22_R.data" *)input [1:0] m_axi_edge_list_ch_22_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_22_R.valid" *)input m_axi_edge_list_ch_22_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_22_W.data" *)output [511:0] m_axi_edge_list_ch_22_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_22_W.data" *)output m_axi_edge_list_ch_22_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_22_W.ready" *)input m_axi_edge_list_ch_22_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_22_W.data" *)output [63:0] m_axi_edge_list_ch_22_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_22_W.valid" *)output m_axi_edge_list_ch_22_WVALID;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.data" *)output [63:0] m_axi_edge_list_ch_23_ARADDR;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.data" *)output [1:0] m_axi_edge_list_ch_23_ARBURST;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.data" *)output [3:0] m_axi_edge_list_ch_23_ARCACHE;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.data" *)output [0:0] m_axi_edge_list_ch_23_ARID;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.data" *)output [7:0] m_axi_edge_list_ch_23_ARLEN;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.data" *)output m_axi_edge_list_ch_23_ARLOCK;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.data" *)output [2:0] m_axi_edge_list_ch_23_ARPROT;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.data" *)output [3:0] m_axi_edge_list_ch_23_ARQOS;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.ready" *)input m_axi_edge_list_ch_23_ARREADY;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.data" *)output [2:0] m_axi_edge_list_ch_23_ARSIZE;
  (* RS_HS = "m_axi_edge_list_ch_23_AR.valid" *)output m_axi_edge_list_ch_23_ARVALID;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.data" *)output [63:0] m_axi_edge_list_ch_23_AWADDR;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.data" *)output [1:0] m_axi_edge_list_ch_23_AWBURST;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.data" *)output [3:0] m_axi_edge_list_ch_23_AWCACHE;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.data" *)output [0:0] m_axi_edge_list_ch_23_AWID;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.data" *)output [7:0] m_axi_edge_list_ch_23_AWLEN;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.data" *)output m_axi_edge_list_ch_23_AWLOCK;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.data" *)output [2:0] m_axi_edge_list_ch_23_AWPROT;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.data" *)output [3:0] m_axi_edge_list_ch_23_AWQOS;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.ready" *)input m_axi_edge_list_ch_23_AWREADY;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.data" *)output [2:0] m_axi_edge_list_ch_23_AWSIZE;
  (* RS_HS = "m_axi_edge_list_ch_23_AW.valid" *)output m_axi_edge_list_ch_23_AWVALID;
  (* RS_HS = "m_axi_edge_list_ch_23_B.data" *)input [0:0] m_axi_edge_list_ch_23_BID;
  (* RS_HS = "m_axi_edge_list_ch_23_B.ready" *)output m_axi_edge_list_ch_23_BREADY;
  (* RS_HS = "m_axi_edge_list_ch_23_B.data" *)input [1:0] m_axi_edge_list_ch_23_BRESP;
  (* RS_HS = "m_axi_edge_list_ch_23_B.valid" *)input m_axi_edge_list_ch_23_BVALID;
  (* RS_HS = "m_axi_edge_list_ch_23_R.data" *)input [511:0] m_axi_edge_list_ch_23_RDATA;
  (* RS_HS = "m_axi_edge_list_ch_23_R.data" *)input [0:0] m_axi_edge_list_ch_23_RID;
  (* RS_HS = "m_axi_edge_list_ch_23_R.data" *)input m_axi_edge_list_ch_23_RLAST;
  (* RS_HS = "m_axi_edge_list_ch_23_R.ready" *)output m_axi_edge_list_ch_23_RREADY;
  (* RS_HS = "m_axi_edge_list_ch_23_R.data" *)input [1:0] m_axi_edge_list_ch_23_RRESP;
  (* RS_HS = "m_axi_edge_list_ch_23_R.valid" *)input m_axi_edge_list_ch_23_RVALID;
  (* RS_HS = "m_axi_edge_list_ch_23_W.data" *)output [511:0] m_axi_edge_list_ch_23_WDATA;
  (* RS_HS = "m_axi_edge_list_ch_23_W.data" *)output m_axi_edge_list_ch_23_WLAST;
  (* RS_HS = "m_axi_edge_list_ch_23_W.ready" *)input m_axi_edge_list_ch_23_WREADY;
  (* RS_HS = "m_axi_edge_list_ch_23_W.data" *)output [63:0] m_axi_edge_list_ch_23_WSTRB;
  (* RS_HS = "m_axi_edge_list_ch_23_W.valid" *)output m_axi_edge_list_ch_23_WVALID;
  (* RS_HS = "m_axi_vec_X_AR.data" *)output [63:0] m_axi_vec_X_ARADDR;
  (* RS_HS = "m_axi_vec_X_AR.data" *)output [1:0] m_axi_vec_X_ARBURST;
  (* RS_HS = "m_axi_vec_X_AR.data" *)output [3:0] m_axi_vec_X_ARCACHE;
  (* RS_HS = "m_axi_vec_X_AR.data" *)output [0:0] m_axi_vec_X_ARID;
  (* RS_HS = "m_axi_vec_X_AR.data" *)output [7:0] m_axi_vec_X_ARLEN;
  (* RS_HS = "m_axi_vec_X_AR.data" *)output m_axi_vec_X_ARLOCK;
  (* RS_HS = "m_axi_vec_X_AR.data" *)output [2:0] m_axi_vec_X_ARPROT;
  (* RS_HS = "m_axi_vec_X_AR.data" *)output [3:0] m_axi_vec_X_ARQOS;
  (* RS_HS = "m_axi_vec_X_AR.ready" *)input m_axi_vec_X_ARREADY;
  (* RS_HS = "m_axi_vec_X_AR.data" *)output [2:0] m_axi_vec_X_ARSIZE;
  (* RS_HS = "m_axi_vec_X_AR.valid" *)output m_axi_vec_X_ARVALID;
  (* RS_HS = "m_axi_vec_X_AW.data" *)output [63:0] m_axi_vec_X_AWADDR;
  (* RS_HS = "m_axi_vec_X_AW.data" *)output [1:0] m_axi_vec_X_AWBURST;
  (* RS_HS = "m_axi_vec_X_AW.data" *)output [3:0] m_axi_vec_X_AWCACHE;
  (* RS_HS = "m_axi_vec_X_AW.data" *)output [0:0] m_axi_vec_X_AWID;
  (* RS_HS = "m_axi_vec_X_AW.data" *)output [7:0] m_axi_vec_X_AWLEN;
  (* RS_HS = "m_axi_vec_X_AW.data" *)output m_axi_vec_X_AWLOCK;
  (* RS_HS = "m_axi_vec_X_AW.data" *)output [2:0] m_axi_vec_X_AWPROT;
  (* RS_HS = "m_axi_vec_X_AW.data" *)output [3:0] m_axi_vec_X_AWQOS;
  (* RS_HS = "m_axi_vec_X_AW.ready" *)input m_axi_vec_X_AWREADY;
  (* RS_HS = "m_axi_vec_X_AW.data" *)output [2:0] m_axi_vec_X_AWSIZE;
  (* RS_HS = "m_axi_vec_X_AW.valid" *)output m_axi_vec_X_AWVALID;
  (* RS_HS = "m_axi_vec_X_B.data" *)input [0:0] m_axi_vec_X_BID;
  (* RS_HS = "m_axi_vec_X_B.ready" *)output m_axi_vec_X_BREADY;
  (* RS_HS = "m_axi_vec_X_B.data" *)input [1:0] m_axi_vec_X_BRESP;
  (* RS_HS = "m_axi_vec_X_B.valid" *)input m_axi_vec_X_BVALID;
  (* RS_HS = "m_axi_vec_X_R.data" *)input [511:0] m_axi_vec_X_RDATA;
  (* RS_HS = "m_axi_vec_X_R.data" *)input [0:0] m_axi_vec_X_RID;
  (* RS_HS = "m_axi_vec_X_R.data" *)input m_axi_vec_X_RLAST;
  (* RS_HS = "m_axi_vec_X_R.ready" *)output m_axi_vec_X_RREADY;
  (* RS_HS = "m_axi_vec_X_R.data" *)input [1:0] m_axi_vec_X_RRESP;
  (* RS_HS = "m_axi_vec_X_R.valid" *)input m_axi_vec_X_RVALID;
  (* RS_HS = "m_axi_vec_X_W.data" *)output [511:0] m_axi_vec_X_WDATA;
  (* RS_HS = "m_axi_vec_X_W.data" *)output m_axi_vec_X_WLAST;
  (* RS_HS = "m_axi_vec_X_W.ready" *)input m_axi_vec_X_WREADY;
  (* RS_HS = "m_axi_vec_X_W.data" *)output [63:0] m_axi_vec_X_WSTRB;
  (* RS_HS = "m_axi_vec_X_W.valid" *)output m_axi_vec_X_WVALID;
  (* RS_HS = "m_axi_vec_Y_AR.data" *)output [63:0] m_axi_vec_Y_ARADDR;
  (* RS_HS = "m_axi_vec_Y_AR.data" *)output [1:0] m_axi_vec_Y_ARBURST;
  (* RS_HS = "m_axi_vec_Y_AR.data" *)output [3:0] m_axi_vec_Y_ARCACHE;
  (* RS_HS = "m_axi_vec_Y_AR.data" *)output [0:0] m_axi_vec_Y_ARID;
  (* RS_HS = "m_axi_vec_Y_AR.data" *)output [7:0] m_axi_vec_Y_ARLEN;
  (* RS_HS = "m_axi_vec_Y_AR.data" *)output m_axi_vec_Y_ARLOCK;
  (* RS_HS = "m_axi_vec_Y_AR.data" *)output [2:0] m_axi_vec_Y_ARPROT;
  (* RS_HS = "m_axi_vec_Y_AR.data" *)output [3:0] m_axi_vec_Y_ARQOS;
  (* RS_HS = "m_axi_vec_Y_AR.ready" *)input m_axi_vec_Y_ARREADY;
  (* RS_HS = "m_axi_vec_Y_AR.data" *)output [2:0] m_axi_vec_Y_ARSIZE;
  (* RS_HS = "m_axi_vec_Y_AR.valid" *)output m_axi_vec_Y_ARVALID;
  (* RS_HS = "m_axi_vec_Y_AW.data" *)output [63:0] m_axi_vec_Y_AWADDR;
  (* RS_HS = "m_axi_vec_Y_AW.data" *)output [1:0] m_axi_vec_Y_AWBURST;
  (* RS_HS = "m_axi_vec_Y_AW.data" *)output [3:0] m_axi_vec_Y_AWCACHE;
  (* RS_HS = "m_axi_vec_Y_AW.data" *)output [0:0] m_axi_vec_Y_AWID;
  (* RS_HS = "m_axi_vec_Y_AW.data" *)output [7:0] m_axi_vec_Y_AWLEN;
  (* RS_HS = "m_axi_vec_Y_AW.data" *)output m_axi_vec_Y_AWLOCK;
  (* RS_HS = "m_axi_vec_Y_AW.data" *)output [2:0] m_axi_vec_Y_AWPROT;
  (* RS_HS = "m_axi_vec_Y_AW.data" *)output [3:0] m_axi_vec_Y_AWQOS;
  (* RS_HS = "m_axi_vec_Y_AW.ready" *)input m_axi_vec_Y_AWREADY;
  (* RS_HS = "m_axi_vec_Y_AW.data" *)output [2:0] m_axi_vec_Y_AWSIZE;
  (* RS_HS = "m_axi_vec_Y_AW.valid" *)output m_axi_vec_Y_AWVALID;
  (* RS_HS = "m_axi_vec_Y_B.data" *)input [0:0] m_axi_vec_Y_BID;
  (* RS_HS = "m_axi_vec_Y_B.ready" *)output m_axi_vec_Y_BREADY;
  (* RS_HS = "m_axi_vec_Y_B.data" *)input [1:0] m_axi_vec_Y_BRESP;
  (* RS_HS = "m_axi_vec_Y_B.valid" *)input m_axi_vec_Y_BVALID;
  (* RS_HS = "m_axi_vec_Y_R.data" *)input [511:0] m_axi_vec_Y_RDATA;
  (* RS_HS = "m_axi_vec_Y_R.data" *)input [0:0] m_axi_vec_Y_RID;
  (* RS_HS = "m_axi_vec_Y_R.data" *)input m_axi_vec_Y_RLAST;
  (* RS_HS = "m_axi_vec_Y_R.ready" *)output m_axi_vec_Y_RREADY;
  (* RS_HS = "m_axi_vec_Y_R.data" *)input [1:0] m_axi_vec_Y_RRESP;
  (* RS_HS = "m_axi_vec_Y_R.valid" *)input m_axi_vec_Y_RVALID;
  (* RS_HS = "m_axi_vec_Y_W.data" *)output [511:0] m_axi_vec_Y_WDATA;
  (* RS_HS = "m_axi_vec_Y_W.data" *)output m_axi_vec_Y_WLAST;
  (* RS_HS = "m_axi_vec_Y_W.ready" *)input m_axi_vec_Y_WREADY;
  (* RS_HS = "m_axi_vec_Y_W.data" *)output [63:0] m_axi_vec_Y_WSTRB;
  (* RS_HS = "m_axi_vec_Y_W.valid" *)output m_axi_vec_Y_WVALID;
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
  (* RS_HS = "m_axi_vec_Y_out_AR.data" *)output [63:0] m_axi_vec_Y_out_ARADDR;
  (* RS_HS = "m_axi_vec_Y_out_AR.data" *)output [1:0] m_axi_vec_Y_out_ARBURST;
  (* RS_HS = "m_axi_vec_Y_out_AR.data" *)output [3:0] m_axi_vec_Y_out_ARCACHE;
  (* RS_HS = "m_axi_vec_Y_out_AR.data" *)output [0:0] m_axi_vec_Y_out_ARID;
  (* RS_HS = "m_axi_vec_Y_out_AR.data" *)output [7:0] m_axi_vec_Y_out_ARLEN;
  (* RS_HS = "m_axi_vec_Y_out_AR.data" *)output m_axi_vec_Y_out_ARLOCK;
  (* RS_HS = "m_axi_vec_Y_out_AR.data" *)output [2:0] m_axi_vec_Y_out_ARPROT;
  (* RS_HS = "m_axi_vec_Y_out_AR.data" *)output [3:0] m_axi_vec_Y_out_ARQOS;
  (* RS_HS = "m_axi_vec_Y_out_AR.ready" *)input m_axi_vec_Y_out_ARREADY;
  (* RS_HS = "m_axi_vec_Y_out_AR.data" *)output [2:0] m_axi_vec_Y_out_ARSIZE;
  (* RS_HS = "m_axi_vec_Y_out_AR.valid" *)output m_axi_vec_Y_out_ARVALID;
  (* RS_HS = "m_axi_vec_Y_out_AW.data" *)output [63:0] m_axi_vec_Y_out_AWADDR;
  (* RS_HS = "m_axi_vec_Y_out_AW.data" *)output [1:0] m_axi_vec_Y_out_AWBURST;
  (* RS_HS = "m_axi_vec_Y_out_AW.data" *)output [3:0] m_axi_vec_Y_out_AWCACHE;
  (* RS_HS = "m_axi_vec_Y_out_AW.data" *)output [0:0] m_axi_vec_Y_out_AWID;
  (* RS_HS = "m_axi_vec_Y_out_AW.data" *)output [7:0] m_axi_vec_Y_out_AWLEN;
  (* RS_HS = "m_axi_vec_Y_out_AW.data" *)output m_axi_vec_Y_out_AWLOCK;
  (* RS_HS = "m_axi_vec_Y_out_AW.data" *)output [2:0] m_axi_vec_Y_out_AWPROT;
  (* RS_HS = "m_axi_vec_Y_out_AW.data" *)output [3:0] m_axi_vec_Y_out_AWQOS;
  (* RS_HS = "m_axi_vec_Y_out_AW.ready" *)input m_axi_vec_Y_out_AWREADY;
  (* RS_HS = "m_axi_vec_Y_out_AW.data" *)output [2:0] m_axi_vec_Y_out_AWSIZE;
  (* RS_HS = "m_axi_vec_Y_out_AW.valid" *)output m_axi_vec_Y_out_AWVALID;
  (* RS_HS = "m_axi_vec_Y_out_B.data" *)input [0:0] m_axi_vec_Y_out_BID;
  (* RS_HS = "m_axi_vec_Y_out_B.ready" *)output m_axi_vec_Y_out_BREADY;
  (* RS_HS = "m_axi_vec_Y_out_B.data" *)input [1:0] m_axi_vec_Y_out_BRESP;
  (* RS_HS = "m_axi_vec_Y_out_B.valid" *)input m_axi_vec_Y_out_BVALID;
  (* RS_HS = "m_axi_vec_Y_out_R.data" *)input [511:0] m_axi_vec_Y_out_RDATA;
  (* RS_HS = "m_axi_vec_Y_out_R.data" *)input [0:0] m_axi_vec_Y_out_RID;
  (* RS_HS = "m_axi_vec_Y_out_R.data" *)input m_axi_vec_Y_out_RLAST;
  (* RS_HS = "m_axi_vec_Y_out_R.ready" *)output m_axi_vec_Y_out_RREADY;
  (* RS_HS = "m_axi_vec_Y_out_R.data" *)input [1:0] m_axi_vec_Y_out_RRESP;
  (* RS_HS = "m_axi_vec_Y_out_R.valid" *)input m_axi_vec_Y_out_RVALID;
  (* RS_HS = "m_axi_vec_Y_out_W.data" *)output [511:0] m_axi_vec_Y_out_WDATA;
  (* RS_HS = "m_axi_vec_Y_out_W.data" *)output m_axi_vec_Y_out_WLAST;
  (* RS_HS = "m_axi_vec_Y_out_W.ready" *)input m_axi_vec_Y_out_WREADY;
  (* RS_HS = "m_axi_vec_Y_out_W.data" *)output [63:0] m_axi_vec_Y_out_WSTRB;
  (* RS_HS = "m_axi_vec_Y_out_W.valid" *)output m_axi_vec_Y_out_WVALID;
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
  wire [63:0] edge_list_ch_16;
  wire [63:0] edge_list_ch_17;
  wire [63:0] edge_list_ch_18;
  wire [63:0] edge_list_ch_19;
  wire [63:0] edge_list_ch_20;
  wire [63:0] edge_list_ch_21;
  wire [63:0] edge_list_ch_22;
  wire [63:0] edge_list_ch_23;
  wire [63:0] vec_X;
  wire [63:0] vec_Y;
  wire [63:0] vec_Y_out;
  wire [31:0] NUM_ITE;
  wire [31:0] NUM_A_LEN;
  wire [31:0] M;
  wire [31:0] K;
  wire [31:0] P_N;
  wire [31:0] alpha_u;
  wire [31:0] beta_u;
  wire [32:0] PE_inst_Serpens_0__dout;
  wire PE_inst_Serpens_0__empty_n;
  wire PE_inst_Serpens_0__read;
  wire [32:0] PE_inst_Serpens_0__din;
  wire PE_inst_Serpens_0__full_n;
  wire PE_inst_Serpens_0__write;
  wire [32:0] PE_inst_Serpens_10__dout;
  wire PE_inst_Serpens_10__empty_n;
  wire PE_inst_Serpens_10__read;
  wire [32:0] PE_inst_Serpens_10__din;
  wire PE_inst_Serpens_10__full_n;
  wire PE_inst_Serpens_10__write;
  wire [32:0] PE_inst_Serpens_11__dout;
  wire PE_inst_Serpens_11__empty_n;
  wire PE_inst_Serpens_11__read;
  wire [32:0] PE_inst_Serpens_11__din;
  wire PE_inst_Serpens_11__full_n;
  wire PE_inst_Serpens_11__write;
  wire [32:0] PE_inst_Serpens_12__dout;
  wire PE_inst_Serpens_12__empty_n;
  wire PE_inst_Serpens_12__read;
  wire [32:0] PE_inst_Serpens_12__din;
  wire PE_inst_Serpens_12__full_n;
  wire PE_inst_Serpens_12__write;
  wire [32:0] PE_inst_Serpens_13__dout;
  wire PE_inst_Serpens_13__empty_n;
  wire PE_inst_Serpens_13__read;
  wire [32:0] PE_inst_Serpens_13__din;
  wire PE_inst_Serpens_13__full_n;
  wire PE_inst_Serpens_13__write;
  wire [32:0] PE_inst_Serpens_14__dout;
  wire PE_inst_Serpens_14__empty_n;
  wire PE_inst_Serpens_14__read;
  wire [32:0] PE_inst_Serpens_14__din;
  wire PE_inst_Serpens_14__full_n;
  wire PE_inst_Serpens_14__write;
  wire [32:0] PE_inst_Serpens_15__dout;
  wire PE_inst_Serpens_15__empty_n;
  wire PE_inst_Serpens_15__read;
  wire [32:0] PE_inst_Serpens_15__din;
  wire PE_inst_Serpens_15__full_n;
  wire PE_inst_Serpens_15__write;
  wire [32:0] PE_inst_Serpens_16__dout;
  wire PE_inst_Serpens_16__empty_n;
  wire PE_inst_Serpens_16__read;
  wire [32:0] PE_inst_Serpens_16__din;
  wire PE_inst_Serpens_16__full_n;
  wire PE_inst_Serpens_16__write;
  wire [32:0] PE_inst_Serpens_17__dout;
  wire PE_inst_Serpens_17__empty_n;
  wire PE_inst_Serpens_17__read;
  wire [32:0] PE_inst_Serpens_17__din;
  wire PE_inst_Serpens_17__full_n;
  wire PE_inst_Serpens_17__write;
  wire [32:0] PE_inst_Serpens_18__dout;
  wire PE_inst_Serpens_18__empty_n;
  wire PE_inst_Serpens_18__read;
  wire [32:0] PE_inst_Serpens_18__din;
  wire PE_inst_Serpens_18__full_n;
  wire PE_inst_Serpens_18__write;
  wire [32:0] PE_inst_Serpens_19__dout;
  wire PE_inst_Serpens_19__empty_n;
  wire PE_inst_Serpens_19__read;
  wire [32:0] PE_inst_Serpens_19__din;
  wire PE_inst_Serpens_19__full_n;
  wire PE_inst_Serpens_19__write;
  wire [32:0] PE_inst_Serpens_1__dout;
  wire PE_inst_Serpens_1__empty_n;
  wire PE_inst_Serpens_1__read;
  wire [32:0] PE_inst_Serpens_1__din;
  wire PE_inst_Serpens_1__full_n;
  wire PE_inst_Serpens_1__write;
  wire [32:0] PE_inst_Serpens_20__dout;
  wire PE_inst_Serpens_20__empty_n;
  wire PE_inst_Serpens_20__read;
  wire [32:0] PE_inst_Serpens_20__din;
  wire PE_inst_Serpens_20__full_n;
  wire PE_inst_Serpens_20__write;
  wire [32:0] PE_inst_Serpens_21__dout;
  wire PE_inst_Serpens_21__empty_n;
  wire PE_inst_Serpens_21__read;
  wire [32:0] PE_inst_Serpens_21__din;
  wire PE_inst_Serpens_21__full_n;
  wire PE_inst_Serpens_21__write;
  wire [32:0] PE_inst_Serpens_22__dout;
  wire PE_inst_Serpens_22__empty_n;
  wire PE_inst_Serpens_22__read;
  wire [32:0] PE_inst_Serpens_22__din;
  wire PE_inst_Serpens_22__full_n;
  wire PE_inst_Serpens_22__write;
  wire [32:0] PE_inst_Serpens_23__dout;
  wire PE_inst_Serpens_23__empty_n;
  wire PE_inst_Serpens_23__read;
  wire [32:0] PE_inst_Serpens_23__din;
  wire PE_inst_Serpens_23__full_n;
  wire PE_inst_Serpens_23__write;
  wire [32:0] PE_inst_Serpens_24__dout;
  wire PE_inst_Serpens_24__empty_n;
  wire PE_inst_Serpens_24__read;
  wire [32:0] PE_inst_Serpens_24__din;
  wire PE_inst_Serpens_24__full_n;
  wire PE_inst_Serpens_24__write;
  wire [32:0] PE_inst_Serpens_2__dout;
  wire PE_inst_Serpens_2__empty_n;
  wire PE_inst_Serpens_2__read;
  wire [32:0] PE_inst_Serpens_2__din;
  wire PE_inst_Serpens_2__full_n;
  wire PE_inst_Serpens_2__write;
  wire [32:0] PE_inst_Serpens_3__dout;
  wire PE_inst_Serpens_3__empty_n;
  wire PE_inst_Serpens_3__read;
  wire [32:0] PE_inst_Serpens_3__din;
  wire PE_inst_Serpens_3__full_n;
  wire PE_inst_Serpens_3__write;
  wire [32:0] PE_inst_Serpens_4__dout;
  wire PE_inst_Serpens_4__empty_n;
  wire PE_inst_Serpens_4__read;
  wire [32:0] PE_inst_Serpens_4__din;
  wire PE_inst_Serpens_4__full_n;
  wire PE_inst_Serpens_4__write;
  wire [32:0] PE_inst_Serpens_5__dout;
  wire PE_inst_Serpens_5__empty_n;
  wire PE_inst_Serpens_5__read;
  wire [32:0] PE_inst_Serpens_5__din;
  wire PE_inst_Serpens_5__full_n;
  wire PE_inst_Serpens_5__write;
  wire [32:0] PE_inst_Serpens_6__dout;
  wire PE_inst_Serpens_6__empty_n;
  wire PE_inst_Serpens_6__read;
  wire [32:0] PE_inst_Serpens_6__din;
  wire PE_inst_Serpens_6__full_n;
  wire PE_inst_Serpens_6__write;
  wire [32:0] PE_inst_Serpens_7__dout;
  wire PE_inst_Serpens_7__empty_n;
  wire PE_inst_Serpens_7__read;
  wire [32:0] PE_inst_Serpens_7__din;
  wire PE_inst_Serpens_7__full_n;
  wire PE_inst_Serpens_7__write;
  wire [32:0] PE_inst_Serpens_8__dout;
  wire PE_inst_Serpens_8__empty_n;
  wire PE_inst_Serpens_8__read;
  wire [32:0] PE_inst_Serpens_8__din;
  wire PE_inst_Serpens_8__full_n;
  wire PE_inst_Serpens_8__write;
  wire [32:0] PE_inst_Serpens_9__dout;
  wire PE_inst_Serpens_9__empty_n;
  wire PE_inst_Serpens_9__read;
  wire [32:0] PE_inst_Serpens_9__din;
  wire PE_inst_Serpens_9__full_n;
  wire PE_inst_Serpens_9__write;
  wire [32:0] Yvec_inst_Serpens_0__dout;
  wire Yvec_inst_Serpens_0__empty_n;
  wire Yvec_inst_Serpens_0__read;
  wire [32:0] Yvec_inst_Serpens_0__din;
  wire Yvec_inst_Serpens_0__full_n;
  wire Yvec_inst_Serpens_0__write;
  wire [32:0] Yvec_inst_Serpens_10__dout;
  wire Yvec_inst_Serpens_10__empty_n;
  wire Yvec_inst_Serpens_10__read;
  wire [32:0] Yvec_inst_Serpens_10__din;
  wire Yvec_inst_Serpens_10__full_n;
  wire Yvec_inst_Serpens_10__write;
  wire [32:0] Yvec_inst_Serpens_11__dout;
  wire Yvec_inst_Serpens_11__empty_n;
  wire Yvec_inst_Serpens_11__read;
  wire [32:0] Yvec_inst_Serpens_11__din;
  wire Yvec_inst_Serpens_11__full_n;
  wire Yvec_inst_Serpens_11__write;
  wire [32:0] Yvec_inst_Serpens_12__dout;
  wire Yvec_inst_Serpens_12__empty_n;
  wire Yvec_inst_Serpens_12__read;
  wire [32:0] Yvec_inst_Serpens_12__din;
  wire Yvec_inst_Serpens_12__full_n;
  wire Yvec_inst_Serpens_12__write;
  wire [32:0] Yvec_inst_Serpens_13__dout;
  wire Yvec_inst_Serpens_13__empty_n;
  wire Yvec_inst_Serpens_13__read;
  wire [32:0] Yvec_inst_Serpens_13__din;
  wire Yvec_inst_Serpens_13__full_n;
  wire Yvec_inst_Serpens_13__write;
  wire [32:0] Yvec_inst_Serpens_14__dout;
  wire Yvec_inst_Serpens_14__empty_n;
  wire Yvec_inst_Serpens_14__read;
  wire [32:0] Yvec_inst_Serpens_14__din;
  wire Yvec_inst_Serpens_14__full_n;
  wire Yvec_inst_Serpens_14__write;
  wire [32:0] Yvec_inst_Serpens_15__dout;
  wire Yvec_inst_Serpens_15__empty_n;
  wire Yvec_inst_Serpens_15__read;
  wire [32:0] Yvec_inst_Serpens_15__din;
  wire Yvec_inst_Serpens_15__full_n;
  wire Yvec_inst_Serpens_15__write;
  wire [32:0] Yvec_inst_Serpens_16__dout;
  wire Yvec_inst_Serpens_16__empty_n;
  wire Yvec_inst_Serpens_16__read;
  wire [32:0] Yvec_inst_Serpens_16__din;
  wire Yvec_inst_Serpens_16__full_n;
  wire Yvec_inst_Serpens_16__write;
  wire [32:0] Yvec_inst_Serpens_17__dout;
  wire Yvec_inst_Serpens_17__empty_n;
  wire Yvec_inst_Serpens_17__read;
  wire [32:0] Yvec_inst_Serpens_17__din;
  wire Yvec_inst_Serpens_17__full_n;
  wire Yvec_inst_Serpens_17__write;
  wire [32:0] Yvec_inst_Serpens_18__dout;
  wire Yvec_inst_Serpens_18__empty_n;
  wire Yvec_inst_Serpens_18__read;
  wire [32:0] Yvec_inst_Serpens_18__din;
  wire Yvec_inst_Serpens_18__full_n;
  wire Yvec_inst_Serpens_18__write;
  wire [32:0] Yvec_inst_Serpens_19__dout;
  wire Yvec_inst_Serpens_19__empty_n;
  wire Yvec_inst_Serpens_19__read;
  wire [32:0] Yvec_inst_Serpens_19__din;
  wire Yvec_inst_Serpens_19__full_n;
  wire Yvec_inst_Serpens_19__write;
  wire [32:0] Yvec_inst_Serpens_1__dout;
  wire Yvec_inst_Serpens_1__empty_n;
  wire Yvec_inst_Serpens_1__read;
  wire [32:0] Yvec_inst_Serpens_1__din;
  wire Yvec_inst_Serpens_1__full_n;
  wire Yvec_inst_Serpens_1__write;
  wire [32:0] Yvec_inst_Serpens_20__dout;
  wire Yvec_inst_Serpens_20__empty_n;
  wire Yvec_inst_Serpens_20__read;
  wire [32:0] Yvec_inst_Serpens_20__din;
  wire Yvec_inst_Serpens_20__full_n;
  wire Yvec_inst_Serpens_20__write;
  wire [32:0] Yvec_inst_Serpens_21__dout;
  wire Yvec_inst_Serpens_21__empty_n;
  wire Yvec_inst_Serpens_21__read;
  wire [32:0] Yvec_inst_Serpens_21__din;
  wire Yvec_inst_Serpens_21__full_n;
  wire Yvec_inst_Serpens_21__write;
  wire [32:0] Yvec_inst_Serpens_22__dout;
  wire Yvec_inst_Serpens_22__empty_n;
  wire Yvec_inst_Serpens_22__read;
  wire [32:0] Yvec_inst_Serpens_22__din;
  wire Yvec_inst_Serpens_22__full_n;
  wire Yvec_inst_Serpens_22__write;
  wire [32:0] Yvec_inst_Serpens_23__dout;
  wire Yvec_inst_Serpens_23__empty_n;
  wire Yvec_inst_Serpens_23__read;
  wire [32:0] Yvec_inst_Serpens_23__din;
  wire Yvec_inst_Serpens_23__full_n;
  wire Yvec_inst_Serpens_23__write;
  wire [32:0] Yvec_inst_Serpens_2__dout;
  wire Yvec_inst_Serpens_2__empty_n;
  wire Yvec_inst_Serpens_2__read;
  wire [32:0] Yvec_inst_Serpens_2__din;
  wire Yvec_inst_Serpens_2__full_n;
  wire Yvec_inst_Serpens_2__write;
  wire [32:0] Yvec_inst_Serpens_3__dout;
  wire Yvec_inst_Serpens_3__empty_n;
  wire Yvec_inst_Serpens_3__read;
  wire [32:0] Yvec_inst_Serpens_3__din;
  wire Yvec_inst_Serpens_3__full_n;
  wire Yvec_inst_Serpens_3__write;
  wire [32:0] Yvec_inst_Serpens_4__dout;
  wire Yvec_inst_Serpens_4__empty_n;
  wire Yvec_inst_Serpens_4__read;
  wire [32:0] Yvec_inst_Serpens_4__din;
  wire Yvec_inst_Serpens_4__full_n;
  wire Yvec_inst_Serpens_4__write;
  wire [32:0] Yvec_inst_Serpens_5__dout;
  wire Yvec_inst_Serpens_5__empty_n;
  wire Yvec_inst_Serpens_5__read;
  wire [32:0] Yvec_inst_Serpens_5__din;
  wire Yvec_inst_Serpens_5__full_n;
  wire Yvec_inst_Serpens_5__write;
  wire [32:0] Yvec_inst_Serpens_6__dout;
  wire Yvec_inst_Serpens_6__empty_n;
  wire Yvec_inst_Serpens_6__read;
  wire [32:0] Yvec_inst_Serpens_6__din;
  wire Yvec_inst_Serpens_6__full_n;
  wire Yvec_inst_Serpens_6__write;
  wire [32:0] Yvec_inst_Serpens_7__dout;
  wire Yvec_inst_Serpens_7__empty_n;
  wire Yvec_inst_Serpens_7__read;
  wire [32:0] Yvec_inst_Serpens_7__din;
  wire Yvec_inst_Serpens_7__full_n;
  wire Yvec_inst_Serpens_7__write;
  wire [32:0] Yvec_inst_Serpens_8__dout;
  wire Yvec_inst_Serpens_8__empty_n;
  wire Yvec_inst_Serpens_8__read;
  wire [32:0] Yvec_inst_Serpens_8__din;
  wire Yvec_inst_Serpens_8__full_n;
  wire Yvec_inst_Serpens_8__write;
  wire [32:0] Yvec_inst_Serpens_9__dout;
  wire Yvec_inst_Serpens_9__empty_n;
  wire Yvec_inst_Serpens_9__read;
  wire [32:0] Yvec_inst_Serpens_9__din;
  wire Yvec_inst_Serpens_9__full_n;
  wire Yvec_inst_Serpens_9__write;
  wire [512:0] fifo_A_Serpens_0__dout;
  wire fifo_A_Serpens_0__empty_n;
  wire fifo_A_Serpens_0__read;
  wire [512:0] fifo_A_Serpens_0__din;
  wire fifo_A_Serpens_0__full_n;
  wire fifo_A_Serpens_0__write;
  wire [512:0] fifo_A_Serpens_10__dout;
  wire fifo_A_Serpens_10__empty_n;
  wire fifo_A_Serpens_10__read;
  wire [512:0] fifo_A_Serpens_10__din;
  wire fifo_A_Serpens_10__full_n;
  wire fifo_A_Serpens_10__write;
  wire [512:0] fifo_A_Serpens_11__dout;
  wire fifo_A_Serpens_11__empty_n;
  wire fifo_A_Serpens_11__read;
  wire [512:0] fifo_A_Serpens_11__din;
  wire fifo_A_Serpens_11__full_n;
  wire fifo_A_Serpens_11__write;
  wire [512:0] fifo_A_Serpens_12__dout;
  wire fifo_A_Serpens_12__empty_n;
  wire fifo_A_Serpens_12__read;
  wire [512:0] fifo_A_Serpens_12__din;
  wire fifo_A_Serpens_12__full_n;
  wire fifo_A_Serpens_12__write;
  wire [512:0] fifo_A_Serpens_13__dout;
  wire fifo_A_Serpens_13__empty_n;
  wire fifo_A_Serpens_13__read;
  wire [512:0] fifo_A_Serpens_13__din;
  wire fifo_A_Serpens_13__full_n;
  wire fifo_A_Serpens_13__write;
  wire [512:0] fifo_A_Serpens_14__dout;
  wire fifo_A_Serpens_14__empty_n;
  wire fifo_A_Serpens_14__read;
  wire [512:0] fifo_A_Serpens_14__din;
  wire fifo_A_Serpens_14__full_n;
  wire fifo_A_Serpens_14__write;
  wire [512:0] fifo_A_Serpens_15__dout;
  wire fifo_A_Serpens_15__empty_n;
  wire fifo_A_Serpens_15__read;
  wire [512:0] fifo_A_Serpens_15__din;
  wire fifo_A_Serpens_15__full_n;
  wire fifo_A_Serpens_15__write;
  wire [512:0] fifo_A_Serpens_16__dout;
  wire fifo_A_Serpens_16__empty_n;
  wire fifo_A_Serpens_16__read;
  wire [512:0] fifo_A_Serpens_16__din;
  wire fifo_A_Serpens_16__full_n;
  wire fifo_A_Serpens_16__write;
  wire [512:0] fifo_A_Serpens_17__dout;
  wire fifo_A_Serpens_17__empty_n;
  wire fifo_A_Serpens_17__read;
  wire [512:0] fifo_A_Serpens_17__din;
  wire fifo_A_Serpens_17__full_n;
  wire fifo_A_Serpens_17__write;
  wire [512:0] fifo_A_Serpens_18__dout;
  wire fifo_A_Serpens_18__empty_n;
  wire fifo_A_Serpens_18__read;
  wire [512:0] fifo_A_Serpens_18__din;
  wire fifo_A_Serpens_18__full_n;
  wire fifo_A_Serpens_18__write;
  wire [512:0] fifo_A_Serpens_19__dout;
  wire fifo_A_Serpens_19__empty_n;
  wire fifo_A_Serpens_19__read;
  wire [512:0] fifo_A_Serpens_19__din;
  wire fifo_A_Serpens_19__full_n;
  wire fifo_A_Serpens_19__write;
  wire [512:0] fifo_A_Serpens_1__dout;
  wire fifo_A_Serpens_1__empty_n;
  wire fifo_A_Serpens_1__read;
  wire [512:0] fifo_A_Serpens_1__din;
  wire fifo_A_Serpens_1__full_n;
  wire fifo_A_Serpens_1__write;
  wire [512:0] fifo_A_Serpens_20__dout;
  wire fifo_A_Serpens_20__empty_n;
  wire fifo_A_Serpens_20__read;
  wire [512:0] fifo_A_Serpens_20__din;
  wire fifo_A_Serpens_20__full_n;
  wire fifo_A_Serpens_20__write;
  wire [512:0] fifo_A_Serpens_21__dout;
  wire fifo_A_Serpens_21__empty_n;
  wire fifo_A_Serpens_21__read;
  wire [512:0] fifo_A_Serpens_21__din;
  wire fifo_A_Serpens_21__full_n;
  wire fifo_A_Serpens_21__write;
  wire [512:0] fifo_A_Serpens_22__dout;
  wire fifo_A_Serpens_22__empty_n;
  wire fifo_A_Serpens_22__read;
  wire [512:0] fifo_A_Serpens_22__din;
  wire fifo_A_Serpens_22__full_n;
  wire fifo_A_Serpens_22__write;
  wire [512:0] fifo_A_Serpens_23__dout;
  wire fifo_A_Serpens_23__empty_n;
  wire fifo_A_Serpens_23__read;
  wire [512:0] fifo_A_Serpens_23__din;
  wire fifo_A_Serpens_23__full_n;
  wire fifo_A_Serpens_23__write;
  wire [512:0] fifo_A_Serpens_2__dout;
  wire fifo_A_Serpens_2__empty_n;
  wire fifo_A_Serpens_2__read;
  wire [512:0] fifo_A_Serpens_2__din;
  wire fifo_A_Serpens_2__full_n;
  wire fifo_A_Serpens_2__write;
  wire [512:0] fifo_A_Serpens_3__dout;
  wire fifo_A_Serpens_3__empty_n;
  wire fifo_A_Serpens_3__read;
  wire [512:0] fifo_A_Serpens_3__din;
  wire fifo_A_Serpens_3__full_n;
  wire fifo_A_Serpens_3__write;
  wire [512:0] fifo_A_Serpens_4__dout;
  wire fifo_A_Serpens_4__empty_n;
  wire fifo_A_Serpens_4__read;
  wire [512:0] fifo_A_Serpens_4__din;
  wire fifo_A_Serpens_4__full_n;
  wire fifo_A_Serpens_4__write;
  wire [512:0] fifo_A_Serpens_5__dout;
  wire fifo_A_Serpens_5__empty_n;
  wire fifo_A_Serpens_5__read;
  wire [512:0] fifo_A_Serpens_5__din;
  wire fifo_A_Serpens_5__full_n;
  wire fifo_A_Serpens_5__write;
  wire [512:0] fifo_A_Serpens_6__dout;
  wire fifo_A_Serpens_6__empty_n;
  wire fifo_A_Serpens_6__read;
  wire [512:0] fifo_A_Serpens_6__din;
  wire fifo_A_Serpens_6__full_n;
  wire fifo_A_Serpens_6__write;
  wire [512:0] fifo_A_Serpens_7__dout;
  wire fifo_A_Serpens_7__empty_n;
  wire fifo_A_Serpens_7__read;
  wire [512:0] fifo_A_Serpens_7__din;
  wire fifo_A_Serpens_7__full_n;
  wire fifo_A_Serpens_7__write;
  wire [512:0] fifo_A_Serpens_8__dout;
  wire fifo_A_Serpens_8__empty_n;
  wire fifo_A_Serpens_8__read;
  wire [512:0] fifo_A_Serpens_8__din;
  wire fifo_A_Serpens_8__full_n;
  wire fifo_A_Serpens_8__write;
  wire [512:0] fifo_A_Serpens_9__dout;
  wire fifo_A_Serpens_9__empty_n;
  wire fifo_A_Serpens_9__read;
  wire [512:0] fifo_A_Serpens_9__din;
  wire fifo_A_Serpens_9__full_n;
  wire fifo_A_Serpens_9__write;
  wire [512:0] fifo_X_pe_Serpens_0__dout;
  wire fifo_X_pe_Serpens_0__empty_n;
  wire fifo_X_pe_Serpens_0__read;
  wire [512:0] fifo_X_pe_Serpens_0__din;
  wire fifo_X_pe_Serpens_0__full_n;
  wire fifo_X_pe_Serpens_0__write;
  wire [512:0] fifo_X_pe_Serpens_10__dout;
  wire fifo_X_pe_Serpens_10__empty_n;
  wire fifo_X_pe_Serpens_10__read;
  wire [512:0] fifo_X_pe_Serpens_10__din;
  wire fifo_X_pe_Serpens_10__full_n;
  wire fifo_X_pe_Serpens_10__write;
  wire [512:0] fifo_X_pe_Serpens_11__dout;
  wire fifo_X_pe_Serpens_11__empty_n;
  wire fifo_X_pe_Serpens_11__read;
  wire [512:0] fifo_X_pe_Serpens_11__din;
  wire fifo_X_pe_Serpens_11__full_n;
  wire fifo_X_pe_Serpens_11__write;
  wire [512:0] fifo_X_pe_Serpens_12__dout;
  wire fifo_X_pe_Serpens_12__empty_n;
  wire fifo_X_pe_Serpens_12__read;
  wire [512:0] fifo_X_pe_Serpens_12__din;
  wire fifo_X_pe_Serpens_12__full_n;
  wire fifo_X_pe_Serpens_12__write;
  wire [512:0] fifo_X_pe_Serpens_13__dout;
  wire fifo_X_pe_Serpens_13__empty_n;
  wire fifo_X_pe_Serpens_13__read;
  wire [512:0] fifo_X_pe_Serpens_13__din;
  wire fifo_X_pe_Serpens_13__full_n;
  wire fifo_X_pe_Serpens_13__write;
  wire [512:0] fifo_X_pe_Serpens_14__dout;
  wire fifo_X_pe_Serpens_14__empty_n;
  wire fifo_X_pe_Serpens_14__read;
  wire [512:0] fifo_X_pe_Serpens_14__din;
  wire fifo_X_pe_Serpens_14__full_n;
  wire fifo_X_pe_Serpens_14__write;
  wire [512:0] fifo_X_pe_Serpens_15__dout;
  wire fifo_X_pe_Serpens_15__empty_n;
  wire fifo_X_pe_Serpens_15__read;
  wire [512:0] fifo_X_pe_Serpens_15__din;
  wire fifo_X_pe_Serpens_15__full_n;
  wire fifo_X_pe_Serpens_15__write;
  wire [512:0] fifo_X_pe_Serpens_16__dout;
  wire fifo_X_pe_Serpens_16__empty_n;
  wire fifo_X_pe_Serpens_16__read;
  wire [512:0] fifo_X_pe_Serpens_16__din;
  wire fifo_X_pe_Serpens_16__full_n;
  wire fifo_X_pe_Serpens_16__write;
  wire [512:0] fifo_X_pe_Serpens_17__dout;
  wire fifo_X_pe_Serpens_17__empty_n;
  wire fifo_X_pe_Serpens_17__read;
  wire [512:0] fifo_X_pe_Serpens_17__din;
  wire fifo_X_pe_Serpens_17__full_n;
  wire fifo_X_pe_Serpens_17__write;
  wire [512:0] fifo_X_pe_Serpens_18__dout;
  wire fifo_X_pe_Serpens_18__empty_n;
  wire fifo_X_pe_Serpens_18__read;
  wire [512:0] fifo_X_pe_Serpens_18__din;
  wire fifo_X_pe_Serpens_18__full_n;
  wire fifo_X_pe_Serpens_18__write;
  wire [512:0] fifo_X_pe_Serpens_19__dout;
  wire fifo_X_pe_Serpens_19__empty_n;
  wire fifo_X_pe_Serpens_19__read;
  wire [512:0] fifo_X_pe_Serpens_19__din;
  wire fifo_X_pe_Serpens_19__full_n;
  wire fifo_X_pe_Serpens_19__write;
  wire [512:0] fifo_X_pe_Serpens_1__dout;
  wire fifo_X_pe_Serpens_1__empty_n;
  wire fifo_X_pe_Serpens_1__read;
  wire [512:0] fifo_X_pe_Serpens_1__din;
  wire fifo_X_pe_Serpens_1__full_n;
  wire fifo_X_pe_Serpens_1__write;
  wire [512:0] fifo_X_pe_Serpens_20__dout;
  wire fifo_X_pe_Serpens_20__empty_n;
  wire fifo_X_pe_Serpens_20__read;
  wire [512:0] fifo_X_pe_Serpens_20__din;
  wire fifo_X_pe_Serpens_20__full_n;
  wire fifo_X_pe_Serpens_20__write;
  wire [512:0] fifo_X_pe_Serpens_21__dout;
  wire fifo_X_pe_Serpens_21__empty_n;
  wire fifo_X_pe_Serpens_21__read;
  wire [512:0] fifo_X_pe_Serpens_21__din;
  wire fifo_X_pe_Serpens_21__full_n;
  wire fifo_X_pe_Serpens_21__write;
  wire [512:0] fifo_X_pe_Serpens_22__dout;
  wire fifo_X_pe_Serpens_22__empty_n;
  wire fifo_X_pe_Serpens_22__read;
  wire [512:0] fifo_X_pe_Serpens_22__din;
  wire fifo_X_pe_Serpens_22__full_n;
  wire fifo_X_pe_Serpens_22__write;
  wire [512:0] fifo_X_pe_Serpens_23__dout;
  wire fifo_X_pe_Serpens_23__empty_n;
  wire fifo_X_pe_Serpens_23__read;
  wire [512:0] fifo_X_pe_Serpens_23__din;
  wire fifo_X_pe_Serpens_23__full_n;
  wire fifo_X_pe_Serpens_23__write;
  wire [512:0] fifo_X_pe_Serpens_24__dout;
  wire fifo_X_pe_Serpens_24__empty_n;
  wire fifo_X_pe_Serpens_24__read;
  wire [512:0] fifo_X_pe_Serpens_24__din;
  wire fifo_X_pe_Serpens_24__full_n;
  wire fifo_X_pe_Serpens_24__write;
  wire [512:0] fifo_X_pe_Serpens_2__dout;
  wire fifo_X_pe_Serpens_2__empty_n;
  wire fifo_X_pe_Serpens_2__read;
  wire [512:0] fifo_X_pe_Serpens_2__din;
  wire fifo_X_pe_Serpens_2__full_n;
  wire fifo_X_pe_Serpens_2__write;
  wire [512:0] fifo_X_pe_Serpens_3__dout;
  wire fifo_X_pe_Serpens_3__empty_n;
  wire fifo_X_pe_Serpens_3__read;
  wire [512:0] fifo_X_pe_Serpens_3__din;
  wire fifo_X_pe_Serpens_3__full_n;
  wire fifo_X_pe_Serpens_3__write;
  wire [512:0] fifo_X_pe_Serpens_4__dout;
  wire fifo_X_pe_Serpens_4__empty_n;
  wire fifo_X_pe_Serpens_4__read;
  wire [512:0] fifo_X_pe_Serpens_4__din;
  wire fifo_X_pe_Serpens_4__full_n;
  wire fifo_X_pe_Serpens_4__write;
  wire [512:0] fifo_X_pe_Serpens_5__dout;
  wire fifo_X_pe_Serpens_5__empty_n;
  wire fifo_X_pe_Serpens_5__read;
  wire [512:0] fifo_X_pe_Serpens_5__din;
  wire fifo_X_pe_Serpens_5__full_n;
  wire fifo_X_pe_Serpens_5__write;
  wire [512:0] fifo_X_pe_Serpens_6__dout;
  wire fifo_X_pe_Serpens_6__empty_n;
  wire fifo_X_pe_Serpens_6__read;
  wire [512:0] fifo_X_pe_Serpens_6__din;
  wire fifo_X_pe_Serpens_6__full_n;
  wire fifo_X_pe_Serpens_6__write;
  wire [512:0] fifo_X_pe_Serpens_7__dout;
  wire fifo_X_pe_Serpens_7__empty_n;
  wire fifo_X_pe_Serpens_7__read;
  wire [512:0] fifo_X_pe_Serpens_7__din;
  wire fifo_X_pe_Serpens_7__full_n;
  wire fifo_X_pe_Serpens_7__write;
  wire [512:0] fifo_X_pe_Serpens_8__dout;
  wire fifo_X_pe_Serpens_8__empty_n;
  wire fifo_X_pe_Serpens_8__read;
  wire [512:0] fifo_X_pe_Serpens_8__din;
  wire fifo_X_pe_Serpens_8__full_n;
  wire fifo_X_pe_Serpens_8__write;
  wire [512:0] fifo_X_pe_Serpens_9__dout;
  wire fifo_X_pe_Serpens_9__empty_n;
  wire fifo_X_pe_Serpens_9__read;
  wire [512:0] fifo_X_pe_Serpens_9__din;
  wire fifo_X_pe_Serpens_9__full_n;
  wire fifo_X_pe_Serpens_9__write;
  wire [512:0] fifo_Y_AX_Serpens__dout;
  wire fifo_Y_AX_Serpens__empty_n;
  wire fifo_Y_AX_Serpens__read;
  wire [512:0] fifo_Y_AX_Serpens__din;
  wire fifo_Y_AX_Serpens__full_n;
  wire fifo_Y_AX_Serpens__write;
  wire [512:0] fifo_Y_alpha_AX_Serpens__dout;
  wire fifo_Y_alpha_AX_Serpens__empty_n;
  wire fifo_Y_alpha_AX_Serpens__read;
  wire [512:0] fifo_Y_alpha_AX_Serpens__din;
  wire fifo_Y_alpha_AX_Serpens__full_n;
  wire fifo_Y_alpha_AX_Serpens__write;
  wire [512:0] fifo_Y_in_Serpens__dout;
  wire fifo_Y_in_Serpens__empty_n;
  wire fifo_Y_in_Serpens__read;
  wire [512:0] fifo_Y_in_Serpens__din;
  wire fifo_Y_in_Serpens__full_n;
  wire fifo_Y_in_Serpens__write;
  wire [512:0] fifo_Y_in_beta_Serpens__dout;
  wire fifo_Y_in_beta_Serpens__empty_n;
  wire fifo_Y_in_beta_Serpens__read;
  wire [512:0] fifo_Y_in_beta_Serpens__din;
  wire fifo_Y_in_beta_Serpens__full_n;
  wire fifo_Y_in_beta_Serpens__write;
  wire [512:0] fifo_Y_out_Serpens__dout;
  wire fifo_Y_out_Serpens__empty_n;
  wire fifo_Y_out_Serpens__read;
  wire [512:0] fifo_Y_out_Serpens__din;
  wire fifo_Y_out_Serpens__full_n;
  wire fifo_Y_out_Serpens__write;
  wire [64:0] fifo_Y_pe_Serpens_0__dout;
  wire fifo_Y_pe_Serpens_0__empty_n;
  wire fifo_Y_pe_Serpens_0__read;
  wire [64:0] fifo_Y_pe_Serpens_0__din;
  wire fifo_Y_pe_Serpens_0__full_n;
  wire fifo_Y_pe_Serpens_0__write;
  wire [64:0] fifo_Y_pe_Serpens_10__dout;
  wire fifo_Y_pe_Serpens_10__empty_n;
  wire fifo_Y_pe_Serpens_10__read;
  wire [64:0] fifo_Y_pe_Serpens_10__din;
  wire fifo_Y_pe_Serpens_10__full_n;
  wire fifo_Y_pe_Serpens_10__write;
  wire [64:0] fifo_Y_pe_Serpens_11__dout;
  wire fifo_Y_pe_Serpens_11__empty_n;
  wire fifo_Y_pe_Serpens_11__read;
  wire [64:0] fifo_Y_pe_Serpens_11__din;
  wire fifo_Y_pe_Serpens_11__full_n;
  wire fifo_Y_pe_Serpens_11__write;
  wire [64:0] fifo_Y_pe_Serpens_12__dout;
  wire fifo_Y_pe_Serpens_12__empty_n;
  wire fifo_Y_pe_Serpens_12__read;
  wire [64:0] fifo_Y_pe_Serpens_12__din;
  wire fifo_Y_pe_Serpens_12__full_n;
  wire fifo_Y_pe_Serpens_12__write;
  wire [64:0] fifo_Y_pe_Serpens_13__dout;
  wire fifo_Y_pe_Serpens_13__empty_n;
  wire fifo_Y_pe_Serpens_13__read;
  wire [64:0] fifo_Y_pe_Serpens_13__din;
  wire fifo_Y_pe_Serpens_13__full_n;
  wire fifo_Y_pe_Serpens_13__write;
  wire [64:0] fifo_Y_pe_Serpens_14__dout;
  wire fifo_Y_pe_Serpens_14__empty_n;
  wire fifo_Y_pe_Serpens_14__read;
  wire [64:0] fifo_Y_pe_Serpens_14__din;
  wire fifo_Y_pe_Serpens_14__full_n;
  wire fifo_Y_pe_Serpens_14__write;
  wire [64:0] fifo_Y_pe_Serpens_15__dout;
  wire fifo_Y_pe_Serpens_15__empty_n;
  wire fifo_Y_pe_Serpens_15__read;
  wire [64:0] fifo_Y_pe_Serpens_15__din;
  wire fifo_Y_pe_Serpens_15__full_n;
  wire fifo_Y_pe_Serpens_15__write;
  wire [64:0] fifo_Y_pe_Serpens_16__dout;
  wire fifo_Y_pe_Serpens_16__empty_n;
  wire fifo_Y_pe_Serpens_16__read;
  wire [64:0] fifo_Y_pe_Serpens_16__din;
  wire fifo_Y_pe_Serpens_16__full_n;
  wire fifo_Y_pe_Serpens_16__write;
  wire [64:0] fifo_Y_pe_Serpens_17__dout;
  wire fifo_Y_pe_Serpens_17__empty_n;
  wire fifo_Y_pe_Serpens_17__read;
  wire [64:0] fifo_Y_pe_Serpens_17__din;
  wire fifo_Y_pe_Serpens_17__full_n;
  wire fifo_Y_pe_Serpens_17__write;
  wire [64:0] fifo_Y_pe_Serpens_18__dout;
  wire fifo_Y_pe_Serpens_18__empty_n;
  wire fifo_Y_pe_Serpens_18__read;
  wire [64:0] fifo_Y_pe_Serpens_18__din;
  wire fifo_Y_pe_Serpens_18__full_n;
  wire fifo_Y_pe_Serpens_18__write;
  wire [64:0] fifo_Y_pe_Serpens_19__dout;
  wire fifo_Y_pe_Serpens_19__empty_n;
  wire fifo_Y_pe_Serpens_19__read;
  wire [64:0] fifo_Y_pe_Serpens_19__din;
  wire fifo_Y_pe_Serpens_19__full_n;
  wire fifo_Y_pe_Serpens_19__write;
  wire [64:0] fifo_Y_pe_Serpens_1__dout;
  wire fifo_Y_pe_Serpens_1__empty_n;
  wire fifo_Y_pe_Serpens_1__read;
  wire [64:0] fifo_Y_pe_Serpens_1__din;
  wire fifo_Y_pe_Serpens_1__full_n;
  wire fifo_Y_pe_Serpens_1__write;
  wire [64:0] fifo_Y_pe_Serpens_20__dout;
  wire fifo_Y_pe_Serpens_20__empty_n;
  wire fifo_Y_pe_Serpens_20__read;
  wire [64:0] fifo_Y_pe_Serpens_20__din;
  wire fifo_Y_pe_Serpens_20__full_n;
  wire fifo_Y_pe_Serpens_20__write;
  wire [64:0] fifo_Y_pe_Serpens_21__dout;
  wire fifo_Y_pe_Serpens_21__empty_n;
  wire fifo_Y_pe_Serpens_21__read;
  wire [64:0] fifo_Y_pe_Serpens_21__din;
  wire fifo_Y_pe_Serpens_21__full_n;
  wire fifo_Y_pe_Serpens_21__write;
  wire [64:0] fifo_Y_pe_Serpens_22__dout;
  wire fifo_Y_pe_Serpens_22__empty_n;
  wire fifo_Y_pe_Serpens_22__read;
  wire [64:0] fifo_Y_pe_Serpens_22__din;
  wire fifo_Y_pe_Serpens_22__full_n;
  wire fifo_Y_pe_Serpens_22__write;
  wire [64:0] fifo_Y_pe_Serpens_23__dout;
  wire fifo_Y_pe_Serpens_23__empty_n;
  wire fifo_Y_pe_Serpens_23__read;
  wire [64:0] fifo_Y_pe_Serpens_23__din;
  wire fifo_Y_pe_Serpens_23__full_n;
  wire fifo_Y_pe_Serpens_23__write;
  wire [64:0] fifo_Y_pe_Serpens_2__dout;
  wire fifo_Y_pe_Serpens_2__empty_n;
  wire fifo_Y_pe_Serpens_2__read;
  wire [64:0] fifo_Y_pe_Serpens_2__din;
  wire fifo_Y_pe_Serpens_2__full_n;
  wire fifo_Y_pe_Serpens_2__write;
  wire [64:0] fifo_Y_pe_Serpens_3__dout;
  wire fifo_Y_pe_Serpens_3__empty_n;
  wire fifo_Y_pe_Serpens_3__read;
  wire [64:0] fifo_Y_pe_Serpens_3__din;
  wire fifo_Y_pe_Serpens_3__full_n;
  wire fifo_Y_pe_Serpens_3__write;
  wire [64:0] fifo_Y_pe_Serpens_4__dout;
  wire fifo_Y_pe_Serpens_4__empty_n;
  wire fifo_Y_pe_Serpens_4__read;
  wire [64:0] fifo_Y_pe_Serpens_4__din;
  wire fifo_Y_pe_Serpens_4__full_n;
  wire fifo_Y_pe_Serpens_4__write;
  wire [64:0] fifo_Y_pe_Serpens_5__dout;
  wire fifo_Y_pe_Serpens_5__empty_n;
  wire fifo_Y_pe_Serpens_5__read;
  wire [64:0] fifo_Y_pe_Serpens_5__din;
  wire fifo_Y_pe_Serpens_5__full_n;
  wire fifo_Y_pe_Serpens_5__write;
  wire [64:0] fifo_Y_pe_Serpens_6__dout;
  wire fifo_Y_pe_Serpens_6__empty_n;
  wire fifo_Y_pe_Serpens_6__read;
  wire [64:0] fifo_Y_pe_Serpens_6__din;
  wire fifo_Y_pe_Serpens_6__full_n;
  wire fifo_Y_pe_Serpens_6__write;
  wire [64:0] fifo_Y_pe_Serpens_7__dout;
  wire fifo_Y_pe_Serpens_7__empty_n;
  wire fifo_Y_pe_Serpens_7__read;
  wire [64:0] fifo_Y_pe_Serpens_7__din;
  wire fifo_Y_pe_Serpens_7__full_n;
  wire fifo_Y_pe_Serpens_7__write;
  wire [64:0] fifo_Y_pe_Serpens_8__dout;
  wire fifo_Y_pe_Serpens_8__empty_n;
  wire fifo_Y_pe_Serpens_8__read;
  wire [64:0] fifo_Y_pe_Serpens_8__din;
  wire fifo_Y_pe_Serpens_8__full_n;
  wire fifo_Y_pe_Serpens_8__write;
  wire [64:0] fifo_Y_pe_Serpens_9__dout;
  wire fifo_Y_pe_Serpens_9__empty_n;
  wire fifo_Y_pe_Serpens_9__read;
  wire [64:0] fifo_Y_pe_Serpens_9__din;
  wire fifo_Y_pe_Serpens_9__full_n;
  wire fifo_Y_pe_Serpens_9__write;
  wire [64:0] fifo_Y_pe_abd_Serpens_0__dout;
  wire fifo_Y_pe_abd_Serpens_0__empty_n;
  wire fifo_Y_pe_abd_Serpens_0__read;
  wire [64:0] fifo_Y_pe_abd_Serpens_0__din;
  wire fifo_Y_pe_abd_Serpens_0__full_n;
  wire fifo_Y_pe_abd_Serpens_0__write;
  wire [64:0] fifo_Y_pe_abd_Serpens_1__dout;
  wire fifo_Y_pe_abd_Serpens_1__empty_n;
  wire fifo_Y_pe_abd_Serpens_1__read;
  wire [64:0] fifo_Y_pe_abd_Serpens_1__din;
  wire fifo_Y_pe_abd_Serpens_1__full_n;
  wire fifo_Y_pe_abd_Serpens_1__write;
  wire [64:0] fifo_Y_pe_abd_Serpens_2__dout;
  wire fifo_Y_pe_abd_Serpens_2__empty_n;
  wire fifo_Y_pe_abd_Serpens_2__read;
  wire [64:0] fifo_Y_pe_abd_Serpens_2__din;
  wire fifo_Y_pe_abd_Serpens_2__full_n;
  wire fifo_Y_pe_abd_Serpens_2__write;
  wire [64:0] fifo_Y_pe_abd_Serpens_3__dout;
  wire fifo_Y_pe_abd_Serpens_3__empty_n;
  wire fifo_Y_pe_abd_Serpens_3__read;
  wire [64:0] fifo_Y_pe_abd_Serpens_3__din;
  wire fifo_Y_pe_abd_Serpens_3__full_n;
  wire fifo_Y_pe_abd_Serpens_3__write;
  wire [64:0] fifo_Y_pe_abd_Serpens_4__dout;
  wire fifo_Y_pe_abd_Serpens_4__empty_n;
  wire fifo_Y_pe_abd_Serpens_4__read;
  wire [64:0] fifo_Y_pe_abd_Serpens_4__din;
  wire fifo_Y_pe_abd_Serpens_4__full_n;
  wire fifo_Y_pe_abd_Serpens_4__write;
  wire [64:0] fifo_Y_pe_abd_Serpens_5__dout;
  wire fifo_Y_pe_abd_Serpens_5__empty_n;
  wire fifo_Y_pe_abd_Serpens_5__read;
  wire [64:0] fifo_Y_pe_abd_Serpens_5__din;
  wire fifo_Y_pe_abd_Serpens_5__full_n;
  wire fifo_Y_pe_abd_Serpens_5__write;
  wire [64:0] fifo_Y_pe_abd_Serpens_6__dout;
  wire fifo_Y_pe_abd_Serpens_6__empty_n;
  wire fifo_Y_pe_abd_Serpens_6__read;
  wire [64:0] fifo_Y_pe_abd_Serpens_6__din;
  wire fifo_Y_pe_abd_Serpens_6__full_n;
  wire fifo_Y_pe_abd_Serpens_6__write;
  wire [64:0] fifo_Y_pe_abd_Serpens_7__dout;
  wire fifo_Y_pe_abd_Serpens_7__empty_n;
  wire fifo_Y_pe_abd_Serpens_7__read;
  wire [64:0] fifo_Y_pe_abd_Serpens_7__din;
  wire fifo_Y_pe_abd_Serpens_7__full_n;
  wire fifo_Y_pe_abd_Serpens_7__write;
  wire [400:0] fifo_aXvec_Serpens_0__dout;
  wire fifo_aXvec_Serpens_0__empty_n;
  wire fifo_aXvec_Serpens_0__read;
  wire [400:0] fifo_aXvec_Serpens_0__din;
  wire fifo_aXvec_Serpens_0__full_n;
  wire fifo_aXvec_Serpens_0__write;
  wire [400:0] fifo_aXvec_Serpens_10__dout;
  wire fifo_aXvec_Serpens_10__empty_n;
  wire fifo_aXvec_Serpens_10__read;
  wire [400:0] fifo_aXvec_Serpens_10__din;
  wire fifo_aXvec_Serpens_10__full_n;
  wire fifo_aXvec_Serpens_10__write;
  wire [400:0] fifo_aXvec_Serpens_11__dout;
  wire fifo_aXvec_Serpens_11__empty_n;
  wire fifo_aXvec_Serpens_11__read;
  wire [400:0] fifo_aXvec_Serpens_11__din;
  wire fifo_aXvec_Serpens_11__full_n;
  wire fifo_aXvec_Serpens_11__write;
  wire [400:0] fifo_aXvec_Serpens_12__dout;
  wire fifo_aXvec_Serpens_12__empty_n;
  wire fifo_aXvec_Serpens_12__read;
  wire [400:0] fifo_aXvec_Serpens_12__din;
  wire fifo_aXvec_Serpens_12__full_n;
  wire fifo_aXvec_Serpens_12__write;
  wire [400:0] fifo_aXvec_Serpens_13__dout;
  wire fifo_aXvec_Serpens_13__empty_n;
  wire fifo_aXvec_Serpens_13__read;
  wire [400:0] fifo_aXvec_Serpens_13__din;
  wire fifo_aXvec_Serpens_13__full_n;
  wire fifo_aXvec_Serpens_13__write;
  wire [400:0] fifo_aXvec_Serpens_14__dout;
  wire fifo_aXvec_Serpens_14__empty_n;
  wire fifo_aXvec_Serpens_14__read;
  wire [400:0] fifo_aXvec_Serpens_14__din;
  wire fifo_aXvec_Serpens_14__full_n;
  wire fifo_aXvec_Serpens_14__write;
  wire [400:0] fifo_aXvec_Serpens_15__dout;
  wire fifo_aXvec_Serpens_15__empty_n;
  wire fifo_aXvec_Serpens_15__read;
  wire [400:0] fifo_aXvec_Serpens_15__din;
  wire fifo_aXvec_Serpens_15__full_n;
  wire fifo_aXvec_Serpens_15__write;
  wire [400:0] fifo_aXvec_Serpens_16__dout;
  wire fifo_aXvec_Serpens_16__empty_n;
  wire fifo_aXvec_Serpens_16__read;
  wire [400:0] fifo_aXvec_Serpens_16__din;
  wire fifo_aXvec_Serpens_16__full_n;
  wire fifo_aXvec_Serpens_16__write;
  wire [400:0] fifo_aXvec_Serpens_17__dout;
  wire fifo_aXvec_Serpens_17__empty_n;
  wire fifo_aXvec_Serpens_17__read;
  wire [400:0] fifo_aXvec_Serpens_17__din;
  wire fifo_aXvec_Serpens_17__full_n;
  wire fifo_aXvec_Serpens_17__write;
  wire [400:0] fifo_aXvec_Serpens_18__dout;
  wire fifo_aXvec_Serpens_18__empty_n;
  wire fifo_aXvec_Serpens_18__read;
  wire [400:0] fifo_aXvec_Serpens_18__din;
  wire fifo_aXvec_Serpens_18__full_n;
  wire fifo_aXvec_Serpens_18__write;
  wire [400:0] fifo_aXvec_Serpens_19__dout;
  wire fifo_aXvec_Serpens_19__empty_n;
  wire fifo_aXvec_Serpens_19__read;
  wire [400:0] fifo_aXvec_Serpens_19__din;
  wire fifo_aXvec_Serpens_19__full_n;
  wire fifo_aXvec_Serpens_19__write;
  wire [400:0] fifo_aXvec_Serpens_1__dout;
  wire fifo_aXvec_Serpens_1__empty_n;
  wire fifo_aXvec_Serpens_1__read;
  wire [400:0] fifo_aXvec_Serpens_1__din;
  wire fifo_aXvec_Serpens_1__full_n;
  wire fifo_aXvec_Serpens_1__write;
  wire [400:0] fifo_aXvec_Serpens_20__dout;
  wire fifo_aXvec_Serpens_20__empty_n;
  wire fifo_aXvec_Serpens_20__read;
  wire [400:0] fifo_aXvec_Serpens_20__din;
  wire fifo_aXvec_Serpens_20__full_n;
  wire fifo_aXvec_Serpens_20__write;
  wire [400:0] fifo_aXvec_Serpens_21__dout;
  wire fifo_aXvec_Serpens_21__empty_n;
  wire fifo_aXvec_Serpens_21__read;
  wire [400:0] fifo_aXvec_Serpens_21__din;
  wire fifo_aXvec_Serpens_21__full_n;
  wire fifo_aXvec_Serpens_21__write;
  wire [400:0] fifo_aXvec_Serpens_22__dout;
  wire fifo_aXvec_Serpens_22__empty_n;
  wire fifo_aXvec_Serpens_22__read;
  wire [400:0] fifo_aXvec_Serpens_22__din;
  wire fifo_aXvec_Serpens_22__full_n;
  wire fifo_aXvec_Serpens_22__write;
  wire [400:0] fifo_aXvec_Serpens_23__dout;
  wire fifo_aXvec_Serpens_23__empty_n;
  wire fifo_aXvec_Serpens_23__read;
  wire [400:0] fifo_aXvec_Serpens_23__din;
  wire fifo_aXvec_Serpens_23__full_n;
  wire fifo_aXvec_Serpens_23__write;
  wire [400:0] fifo_aXvec_Serpens_2__dout;
  wire fifo_aXvec_Serpens_2__empty_n;
  wire fifo_aXvec_Serpens_2__read;
  wire [400:0] fifo_aXvec_Serpens_2__din;
  wire fifo_aXvec_Serpens_2__full_n;
  wire fifo_aXvec_Serpens_2__write;
  wire [400:0] fifo_aXvec_Serpens_3__dout;
  wire fifo_aXvec_Serpens_3__empty_n;
  wire fifo_aXvec_Serpens_3__read;
  wire [400:0] fifo_aXvec_Serpens_3__din;
  wire fifo_aXvec_Serpens_3__full_n;
  wire fifo_aXvec_Serpens_3__write;
  wire [400:0] fifo_aXvec_Serpens_4__dout;
  wire fifo_aXvec_Serpens_4__empty_n;
  wire fifo_aXvec_Serpens_4__read;
  wire [400:0] fifo_aXvec_Serpens_4__din;
  wire fifo_aXvec_Serpens_4__full_n;
  wire fifo_aXvec_Serpens_4__write;
  wire [400:0] fifo_aXvec_Serpens_5__dout;
  wire fifo_aXvec_Serpens_5__empty_n;
  wire fifo_aXvec_Serpens_5__read;
  wire [400:0] fifo_aXvec_Serpens_5__din;
  wire fifo_aXvec_Serpens_5__full_n;
  wire fifo_aXvec_Serpens_5__write;
  wire [400:0] fifo_aXvec_Serpens_6__dout;
  wire fifo_aXvec_Serpens_6__empty_n;
  wire fifo_aXvec_Serpens_6__read;
  wire [400:0] fifo_aXvec_Serpens_6__din;
  wire fifo_aXvec_Serpens_6__full_n;
  wire fifo_aXvec_Serpens_6__write;
  wire [400:0] fifo_aXvec_Serpens_7__dout;
  wire fifo_aXvec_Serpens_7__empty_n;
  wire fifo_aXvec_Serpens_7__read;
  wire [400:0] fifo_aXvec_Serpens_7__din;
  wire fifo_aXvec_Serpens_7__full_n;
  wire fifo_aXvec_Serpens_7__write;
  wire [400:0] fifo_aXvec_Serpens_8__dout;
  wire fifo_aXvec_Serpens_8__empty_n;
  wire fifo_aXvec_Serpens_8__read;
  wire [400:0] fifo_aXvec_Serpens_8__din;
  wire fifo_aXvec_Serpens_8__full_n;
  wire fifo_aXvec_Serpens_8__write;
  wire [400:0] fifo_aXvec_Serpens_9__dout;
  wire fifo_aXvec_Serpens_9__empty_n;
  wire fifo_aXvec_Serpens_9__read;
  wire [400:0] fifo_aXvec_Serpens_9__din;
  wire fifo_aXvec_Serpens_9__full_n;
  wire fifo_aXvec_Serpens_9__write;
  wire [31:0] Arbiter_Y_0___M__q0;
  wire [31:0] Arbiter_Y_0___P_N__q0;
  wire Arbiter_Y_0__ap_start;
  wire Arbiter_Y_0__ap_ready;
  wire Arbiter_Y_0__ap_done;
  wire Arbiter_Y_0__ap_idle;
  wire [31:0] Arbiter_Y_1___M__q0;
  wire [31:0] Arbiter_Y_1___P_N__q0;
  wire Arbiter_Y_1__ap_start;
  wire Arbiter_Y_1__ap_ready;
  wire Arbiter_Y_1__ap_done;
  wire Arbiter_Y_1__ap_idle;
  wire [31:0] Arbiter_Y_2___M__q0;
  wire [31:0] Arbiter_Y_2___P_N__q0;
  wire Arbiter_Y_2__ap_start;
  wire Arbiter_Y_2__ap_ready;
  wire Arbiter_Y_2__ap_done;
  wire Arbiter_Y_2__ap_idle;
  wire [31:0] Arbiter_Y_3___M__q0;
  wire [31:0] Arbiter_Y_3___P_N__q0;
  wire Arbiter_Y_3__ap_start;
  wire Arbiter_Y_3__ap_ready;
  wire Arbiter_Y_3__ap_done;
  wire Arbiter_Y_3__ap_idle;
  wire [31:0] Arbiter_Y_4___M__q0;
  wire [31:0] Arbiter_Y_4___P_N__q0;
  wire Arbiter_Y_4__ap_start;
  wire Arbiter_Y_4__ap_ready;
  wire Arbiter_Y_4__ap_done;
  wire Arbiter_Y_4__ap_idle;
  wire [31:0] Arbiter_Y_5___M__q0;
  wire [31:0] Arbiter_Y_5___P_N__q0;
  wire Arbiter_Y_5__ap_start;
  wire Arbiter_Y_5__ap_ready;
  wire Arbiter_Y_5__ap_done;
  wire Arbiter_Y_5__ap_idle;
  wire [31:0] Arbiter_Y_6___M__q0;
  wire [31:0] Arbiter_Y_6___P_N__q0;
  wire Arbiter_Y_6__ap_start;
  wire Arbiter_Y_6__ap_ready;
  wire Arbiter_Y_6__ap_done;
  wire Arbiter_Y_6__ap_idle;
  wire [31:0] Arbiter_Y_7___M__q0;
  wire [31:0] Arbiter_Y_7___P_N__q0;
  wire Arbiter_Y_7__ap_start;
  wire Arbiter_Y_7__ap_ready;
  wire Arbiter_Y_7__ap_done;
  wire Arbiter_Y_7__ap_idle;
  wire FloatvAddFloatv_0__ap_start;
  wire [31:0] FloatvMultConst_0___M__q0;
  wire [31:0] FloatvMultConst_0___P_N__q0;
  wire [31:0] FloatvMultConst_0___alpha_u__q0;
  wire FloatvMultConst_0__ap_start;
  wire FloatvMultConst_0__ap_ready;
  wire FloatvMultConst_0__ap_done;
  wire FloatvMultConst_0__ap_idle;
  wire [31:0] FloatvMultConst_1___M__q0;
  wire [31:0] FloatvMultConst_1___P_N__q0;
  wire [31:0] FloatvMultConst_1___beta_u__q0;
  wire FloatvMultConst_1__ap_start;
  wire FloatvMultConst_1__ap_ready;
  wire FloatvMultConst_1__ap_done;
  wire FloatvMultConst_1__ap_idle;
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
  wire PEG_Xvec_16__ap_start;
  wire PEG_Xvec_16__ap_ready;
  wire PEG_Xvec_16__ap_done;
  wire PEG_Xvec_16__ap_idle;
  wire PEG_Xvec_17__ap_start;
  wire PEG_Xvec_17__ap_ready;
  wire PEG_Xvec_17__ap_done;
  wire PEG_Xvec_17__ap_idle;
  wire PEG_Xvec_18__ap_start;
  wire PEG_Xvec_18__ap_ready;
  wire PEG_Xvec_18__ap_done;
  wire PEG_Xvec_18__ap_idle;
  wire PEG_Xvec_19__ap_start;
  wire PEG_Xvec_19__ap_ready;
  wire PEG_Xvec_19__ap_done;
  wire PEG_Xvec_19__ap_idle;
  wire PEG_Xvec_20__ap_start;
  wire PEG_Xvec_20__ap_ready;
  wire PEG_Xvec_20__ap_done;
  wire PEG_Xvec_20__ap_idle;
  wire PEG_Xvec_21__ap_start;
  wire PEG_Xvec_21__ap_ready;
  wire PEG_Xvec_21__ap_done;
  wire PEG_Xvec_21__ap_idle;
  wire PEG_Xvec_22__ap_start;
  wire PEG_Xvec_22__ap_ready;
  wire PEG_Xvec_22__ap_done;
  wire PEG_Xvec_22__ap_idle;
  wire PEG_Xvec_23__ap_start;
  wire PEG_Xvec_23__ap_ready;
  wire PEG_Xvec_23__ap_done;
  wire PEG_Xvec_23__ap_idle;
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
  wire PEG_Yvec_16__ap_start;
  wire PEG_Yvec_16__ap_ready;
  wire PEG_Yvec_16__ap_done;
  wire PEG_Yvec_16__ap_idle;
  wire PEG_Yvec_17__ap_start;
  wire PEG_Yvec_17__ap_ready;
  wire PEG_Yvec_17__ap_done;
  wire PEG_Yvec_17__ap_idle;
  wire PEG_Yvec_18__ap_start;
  wire PEG_Yvec_18__ap_ready;
  wire PEG_Yvec_18__ap_done;
  wire PEG_Yvec_18__ap_idle;
  wire PEG_Yvec_19__ap_start;
  wire PEG_Yvec_19__ap_ready;
  wire PEG_Yvec_19__ap_done;
  wire PEG_Yvec_19__ap_idle;
  wire PEG_Yvec_20__ap_start;
  wire PEG_Yvec_20__ap_ready;
  wire PEG_Yvec_20__ap_done;
  wire PEG_Yvec_20__ap_idle;
  wire PEG_Yvec_21__ap_start;
  wire PEG_Yvec_21__ap_ready;
  wire PEG_Yvec_21__ap_done;
  wire PEG_Yvec_21__ap_idle;
  wire PEG_Yvec_22__ap_start;
  wire PEG_Yvec_22__ap_ready;
  wire PEG_Yvec_22__ap_done;
  wire PEG_Yvec_22__ap_idle;
  wire PEG_Yvec_23__ap_start;
  wire PEG_Yvec_23__ap_ready;
  wire PEG_Yvec_23__ap_done;
  wire PEG_Yvec_23__ap_idle;
  wire black_hole_float_v16_0__ap_start;
  wire black_hole_int_0__ap_start;
  wire [31:0] read_A_0___NUM_A_LEN__q0;
  wire [31:0] read_A_0___P_N__q0;
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
  wire read_A_0__ap_start;
  wire read_A_0__ap_ready;
  wire read_A_0__ap_done;
  wire read_A_0__ap_idle;
  wire [31:0] read_A_1___NUM_A_LEN__q0;
  wire [31:0] read_A_1___P_N__q0;
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
  wire read_A_1__ap_start;
  wire read_A_1__ap_ready;
  wire read_A_1__ap_done;
  wire read_A_1__ap_idle;
  wire [31:0] read_A_2___NUM_A_LEN__q0;
  wire [31:0] read_A_2___P_N__q0;
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
  wire read_A_2__ap_start;
  wire read_A_2__ap_ready;
  wire read_A_2__ap_done;
  wire read_A_2__ap_idle;
  wire [31:0] read_A_3___NUM_A_LEN__q0;
  wire [31:0] read_A_3___P_N__q0;
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
  wire read_A_3__ap_start;
  wire read_A_3__ap_ready;
  wire read_A_3__ap_done;
  wire read_A_3__ap_idle;
  wire [31:0] read_A_4___NUM_A_LEN__q0;
  wire [31:0] read_A_4___P_N__q0;
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
  wire read_A_4__ap_start;
  wire read_A_4__ap_ready;
  wire read_A_4__ap_done;
  wire read_A_4__ap_idle;
  wire [31:0] read_A_5___NUM_A_LEN__q0;
  wire [31:0] read_A_5___P_N__q0;
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
  wire read_A_5__ap_start;
  wire read_A_5__ap_ready;
  wire read_A_5__ap_done;
  wire read_A_5__ap_idle;
  wire [31:0] read_A_6___NUM_A_LEN__q0;
  wire [31:0] read_A_6___P_N__q0;
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
  wire read_A_6__ap_start;
  wire read_A_6__ap_ready;
  wire read_A_6__ap_done;
  wire read_A_6__ap_idle;
  wire [31:0] read_A_7___NUM_A_LEN__q0;
  wire [31:0] read_A_7___P_N__q0;
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
  wire read_A_7__ap_start;
  wire read_A_7__ap_ready;
  wire read_A_7__ap_done;
  wire read_A_7__ap_idle;
  wire [31:0] read_A_8___NUM_A_LEN__q0;
  wire [31:0] read_A_8___P_N__q0;
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
  wire read_A_8__ap_start;
  wire read_A_8__ap_ready;
  wire read_A_8__ap_done;
  wire read_A_8__ap_idle;
  wire [31:0] read_A_9___NUM_A_LEN__q0;
  wire [31:0] read_A_9___P_N__q0;
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
  wire read_A_9__ap_start;
  wire read_A_9__ap_ready;
  wire read_A_9__ap_done;
  wire read_A_9__ap_idle;
  wire [31:0] read_A_10___NUM_A_LEN__q0;
  wire [31:0] read_A_10___P_N__q0;
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
  wire read_A_10__ap_start;
  wire read_A_10__ap_ready;
  wire read_A_10__ap_done;
  wire read_A_10__ap_idle;
  wire [31:0] read_A_11___NUM_A_LEN__q0;
  wire [31:0] read_A_11___P_N__q0;
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
  wire read_A_11__ap_start;
  wire read_A_11__ap_ready;
  wire read_A_11__ap_done;
  wire read_A_11__ap_idle;
  wire [31:0] read_A_12___NUM_A_LEN__q0;
  wire [31:0] read_A_12___P_N__q0;
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
  wire read_A_12__ap_start;
  wire read_A_12__ap_ready;
  wire read_A_12__ap_done;
  wire read_A_12__ap_idle;
  wire [31:0] read_A_13___NUM_A_LEN__q0;
  wire [31:0] read_A_13___P_N__q0;
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
  wire read_A_13__ap_start;
  wire read_A_13__ap_ready;
  wire read_A_13__ap_done;
  wire read_A_13__ap_idle;
  wire [31:0] read_A_14___NUM_A_LEN__q0;
  wire [31:0] read_A_14___P_N__q0;
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
  wire read_A_14__ap_start;
  wire read_A_14__ap_ready;
  wire read_A_14__ap_done;
  wire read_A_14__ap_idle;
  wire [31:0] read_A_15___NUM_A_LEN__q0;
  wire [31:0] read_A_15___P_N__q0;
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
  wire read_A_15__ap_start;
  wire read_A_15__ap_ready;
  wire read_A_15__ap_done;
  wire read_A_15__ap_idle;
  wire [31:0] read_A_16___NUM_A_LEN__q0;
  wire [31:0] read_A_16___P_N__q0;
  wire [63:0] read_A_16___edge_list_ch_16__q0;
  wire [63:0] edge_list_ch_16_read_addr__din;
  wire edge_list_ch_16_read_addr__full_n;
  wire edge_list_ch_16_read_addr__write;
  wire [511:0] edge_list_ch_16_read_data__dout;
  wire edge_list_ch_16_read_data__empty_n;
  wire edge_list_ch_16_read_data__read;
  wire [63:0] edge_list_ch_16_write_addr__din;
  wire edge_list_ch_16_write_addr__full_n;
  wire edge_list_ch_16_write_addr__write;
  wire [511:0] edge_list_ch_16_write_data__din;
  wire edge_list_ch_16_write_data__full_n;
  wire edge_list_ch_16_write_data__write;
  wire [7:0] edge_list_ch_16_write_resp__dout;
  wire edge_list_ch_16_write_resp__empty_n;
  wire edge_list_ch_16_write_resp__read;
  wire read_A_16__ap_start;
  wire read_A_16__ap_ready;
  wire read_A_16__ap_done;
  wire read_A_16__ap_idle;
  wire [31:0] read_A_17___NUM_A_LEN__q0;
  wire [31:0] read_A_17___P_N__q0;
  wire [63:0] read_A_17___edge_list_ch_17__q0;
  wire [63:0] edge_list_ch_17_read_addr__din;
  wire edge_list_ch_17_read_addr__full_n;
  wire edge_list_ch_17_read_addr__write;
  wire [511:0] edge_list_ch_17_read_data__dout;
  wire edge_list_ch_17_read_data__empty_n;
  wire edge_list_ch_17_read_data__read;
  wire [63:0] edge_list_ch_17_write_addr__din;
  wire edge_list_ch_17_write_addr__full_n;
  wire edge_list_ch_17_write_addr__write;
  wire [511:0] edge_list_ch_17_write_data__din;
  wire edge_list_ch_17_write_data__full_n;
  wire edge_list_ch_17_write_data__write;
  wire [7:0] edge_list_ch_17_write_resp__dout;
  wire edge_list_ch_17_write_resp__empty_n;
  wire edge_list_ch_17_write_resp__read;
  wire read_A_17__ap_start;
  wire read_A_17__ap_ready;
  wire read_A_17__ap_done;
  wire read_A_17__ap_idle;
  wire [31:0] read_A_18___NUM_A_LEN__q0;
  wire [31:0] read_A_18___P_N__q0;
  wire [63:0] read_A_18___edge_list_ch_18__q0;
  wire [63:0] edge_list_ch_18_read_addr__din;
  wire edge_list_ch_18_read_addr__full_n;
  wire edge_list_ch_18_read_addr__write;
  wire [511:0] edge_list_ch_18_read_data__dout;
  wire edge_list_ch_18_read_data__empty_n;
  wire edge_list_ch_18_read_data__read;
  wire [63:0] edge_list_ch_18_write_addr__din;
  wire edge_list_ch_18_write_addr__full_n;
  wire edge_list_ch_18_write_addr__write;
  wire [511:0] edge_list_ch_18_write_data__din;
  wire edge_list_ch_18_write_data__full_n;
  wire edge_list_ch_18_write_data__write;
  wire [7:0] edge_list_ch_18_write_resp__dout;
  wire edge_list_ch_18_write_resp__empty_n;
  wire edge_list_ch_18_write_resp__read;
  wire read_A_18__ap_start;
  wire read_A_18__ap_ready;
  wire read_A_18__ap_done;
  wire read_A_18__ap_idle;
  wire [31:0] read_A_19___NUM_A_LEN__q0;
  wire [31:0] read_A_19___P_N__q0;
  wire [63:0] read_A_19___edge_list_ch_19__q0;
  wire [63:0] edge_list_ch_19_read_addr__din;
  wire edge_list_ch_19_read_addr__full_n;
  wire edge_list_ch_19_read_addr__write;
  wire [511:0] edge_list_ch_19_read_data__dout;
  wire edge_list_ch_19_read_data__empty_n;
  wire edge_list_ch_19_read_data__read;
  wire [63:0] edge_list_ch_19_write_addr__din;
  wire edge_list_ch_19_write_addr__full_n;
  wire edge_list_ch_19_write_addr__write;
  wire [511:0] edge_list_ch_19_write_data__din;
  wire edge_list_ch_19_write_data__full_n;
  wire edge_list_ch_19_write_data__write;
  wire [7:0] edge_list_ch_19_write_resp__dout;
  wire edge_list_ch_19_write_resp__empty_n;
  wire edge_list_ch_19_write_resp__read;
  wire read_A_19__ap_start;
  wire read_A_19__ap_ready;
  wire read_A_19__ap_done;
  wire read_A_19__ap_idle;
  wire [31:0] read_A_20___NUM_A_LEN__q0;
  wire [31:0] read_A_20___P_N__q0;
  wire [63:0] read_A_20___edge_list_ch_20__q0;
  wire [63:0] edge_list_ch_20_read_addr__din;
  wire edge_list_ch_20_read_addr__full_n;
  wire edge_list_ch_20_read_addr__write;
  wire [511:0] edge_list_ch_20_read_data__dout;
  wire edge_list_ch_20_read_data__empty_n;
  wire edge_list_ch_20_read_data__read;
  wire [63:0] edge_list_ch_20_write_addr__din;
  wire edge_list_ch_20_write_addr__full_n;
  wire edge_list_ch_20_write_addr__write;
  wire [511:0] edge_list_ch_20_write_data__din;
  wire edge_list_ch_20_write_data__full_n;
  wire edge_list_ch_20_write_data__write;
  wire [7:0] edge_list_ch_20_write_resp__dout;
  wire edge_list_ch_20_write_resp__empty_n;
  wire edge_list_ch_20_write_resp__read;
  wire read_A_20__ap_start;
  wire read_A_20__ap_ready;
  wire read_A_20__ap_done;
  wire read_A_20__ap_idle;
  wire [31:0] read_A_21___NUM_A_LEN__q0;
  wire [31:0] read_A_21___P_N__q0;
  wire [63:0] read_A_21___edge_list_ch_21__q0;
  wire [63:0] edge_list_ch_21_read_addr__din;
  wire edge_list_ch_21_read_addr__full_n;
  wire edge_list_ch_21_read_addr__write;
  wire [511:0] edge_list_ch_21_read_data__dout;
  wire edge_list_ch_21_read_data__empty_n;
  wire edge_list_ch_21_read_data__read;
  wire [63:0] edge_list_ch_21_write_addr__din;
  wire edge_list_ch_21_write_addr__full_n;
  wire edge_list_ch_21_write_addr__write;
  wire [511:0] edge_list_ch_21_write_data__din;
  wire edge_list_ch_21_write_data__full_n;
  wire edge_list_ch_21_write_data__write;
  wire [7:0] edge_list_ch_21_write_resp__dout;
  wire edge_list_ch_21_write_resp__empty_n;
  wire edge_list_ch_21_write_resp__read;
  wire read_A_21__ap_start;
  wire read_A_21__ap_ready;
  wire read_A_21__ap_done;
  wire read_A_21__ap_idle;
  wire [31:0] read_A_22___NUM_A_LEN__q0;
  wire [31:0] read_A_22___P_N__q0;
  wire [63:0] read_A_22___edge_list_ch_22__q0;
  wire [63:0] edge_list_ch_22_read_addr__din;
  wire edge_list_ch_22_read_addr__full_n;
  wire edge_list_ch_22_read_addr__write;
  wire [511:0] edge_list_ch_22_read_data__dout;
  wire edge_list_ch_22_read_data__empty_n;
  wire edge_list_ch_22_read_data__read;
  wire [63:0] edge_list_ch_22_write_addr__din;
  wire edge_list_ch_22_write_addr__full_n;
  wire edge_list_ch_22_write_addr__write;
  wire [511:0] edge_list_ch_22_write_data__din;
  wire edge_list_ch_22_write_data__full_n;
  wire edge_list_ch_22_write_data__write;
  wire [7:0] edge_list_ch_22_write_resp__dout;
  wire edge_list_ch_22_write_resp__empty_n;
  wire edge_list_ch_22_write_resp__read;
  wire read_A_22__ap_start;
  wire read_A_22__ap_ready;
  wire read_A_22__ap_done;
  wire read_A_22__ap_idle;
  wire [31:0] read_A_23___NUM_A_LEN__q0;
  wire [31:0] read_A_23___P_N__q0;
  wire [63:0] read_A_23___edge_list_ch_23__q0;
  wire [63:0] edge_list_ch_23_read_addr__din;
  wire edge_list_ch_23_read_addr__full_n;
  wire edge_list_ch_23_read_addr__write;
  wire [511:0] edge_list_ch_23_read_data__dout;
  wire edge_list_ch_23_read_data__empty_n;
  wire edge_list_ch_23_read_data__read;
  wire [63:0] edge_list_ch_23_write_addr__din;
  wire edge_list_ch_23_write_addr__full_n;
  wire edge_list_ch_23_write_addr__write;
  wire [511:0] edge_list_ch_23_write_data__din;
  wire edge_list_ch_23_write_data__full_n;
  wire edge_list_ch_23_write_data__write;
  wire [7:0] edge_list_ch_23_write_resp__dout;
  wire edge_list_ch_23_write_resp__empty_n;
  wire edge_list_ch_23_write_resp__read;
  wire read_A_23__ap_start;
  wire read_A_23__ap_ready;
  wire read_A_23__ap_done;
  wire read_A_23__ap_idle;
  wire [31:0] read_X_0___K__q0;
  wire [31:0] read_X_0___P_N__q0;
  wire [63:0] read_X_0___vec_X__q0;
  wire [63:0] vec_X_read_addr__din;
  wire vec_X_read_addr__full_n;
  wire vec_X_read_addr__write;
  wire [511:0] vec_X_read_data__dout;
  wire vec_X_read_data__empty_n;
  wire vec_X_read_data__read;
  wire [63:0] vec_X_write_addr__din;
  wire vec_X_write_addr__full_n;
  wire vec_X_write_addr__write;
  wire [511:0] vec_X_write_data__din;
  wire vec_X_write_data__full_n;
  wire vec_X_write_data__write;
  wire [7:0] vec_X_write_resp__dout;
  wire vec_X_write_resp__empty_n;
  wire vec_X_write_resp__read;
  wire read_X_0__ap_start;
  wire read_X_0__ap_ready;
  wire read_X_0__ap_done;
  wire read_X_0__ap_idle;
  wire [31:0] read_Y_0___M__q0;
  wire [31:0] read_Y_0___P_N__q0;
  wire [63:0] read_Y_0___vec_Y__q0;
  wire [63:0] vec_Y_read_addr__din;
  wire vec_Y_read_addr__full_n;
  wire vec_Y_read_addr__write;
  wire [511:0] vec_Y_read_data__dout;
  wire vec_Y_read_data__empty_n;
  wire vec_Y_read_data__read;
  wire [63:0] vec_Y_write_addr__din;
  wire vec_Y_write_addr__full_n;
  wire vec_Y_write_addr__write;
  wire [511:0] vec_Y_write_data__din;
  wire vec_Y_write_data__full_n;
  wire vec_Y_write_data__write;
  wire [7:0] vec_Y_write_resp__dout;
  wire vec_Y_write_resp__empty_n;
  wire vec_Y_write_resp__read;
  wire read_Y_0__ap_start;
  wire read_Y_0__ap_ready;
  wire read_Y_0__ap_done;
  wire read_Y_0__ap_idle;
  wire [31:0] read_edge_list_ptr_0___K__q0;
  wire [31:0] read_edge_list_ptr_0___M__q0;
  wire [31:0] read_edge_list_ptr_0___NUM_ITE__q0;
  wire [31:0] read_edge_list_ptr_0___P_N__q0;
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
  wire read_edge_list_ptr_0__ap_start;
  wire read_edge_list_ptr_0__ap_ready;
  wire read_edge_list_ptr_0__ap_done;
  wire read_edge_list_ptr_0__ap_idle;
  wire [31:0] write_Y_0___M__q0;
  wire [31:0] write_Y_0___P_N__q0;
  wire [63:0] write_Y_0___vec_Y_out__q0;
  wire [63:0] vec_Y_out_read_addr__din;
  wire vec_Y_out_read_addr__full_n;
  wire vec_Y_out_read_addr__write;
  wire [511:0] vec_Y_out_read_data__dout;
  wire vec_Y_out_read_data__empty_n;
  wire vec_Y_out_read_data__read;
  wire [63:0] vec_Y_out_write_addr__din;
  wire vec_Y_out_write_addr__full_n;
  wire vec_Y_out_write_addr__write;
  wire [511:0] vec_Y_out_write_data__din;
  wire vec_Y_out_write_data__full_n;
  wire vec_Y_out_write_data__write;
  wire [7:0] vec_Y_out_write_resp__dout;
  wire vec_Y_out_write_resp__empty_n;
  wire vec_Y_out_write_resp__read;
  wire write_Y_0__ap_start;
  wire write_Y_0__ap_ready;
  wire write_Y_0__ap_done;
  wire write_Y_0__ap_idle;
  wire ap_rst_n_inv;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;

  Serpens_control_s_axi
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
    .edge_list_ch_16(edge_list_ch_16),
    .edge_list_ch_17(edge_list_ch_17),
    .edge_list_ch_18(edge_list_ch_18),
    .edge_list_ch_19(edge_list_ch_19),
    .edge_list_ch_20(edge_list_ch_20),
    .edge_list_ch_21(edge_list_ch_21),
    .edge_list_ch_22(edge_list_ch_22),
    .edge_list_ch_23(edge_list_ch_23),
    .vec_X(vec_X),
    .vec_Y(vec_Y),
    .vec_Y_out(vec_Y_out),
    .NUM_ITE(NUM_ITE),
    .NUM_A_LEN(NUM_A_LEN),
    .M(M),
    .K(K),
    .P_N(P_N),
    .alpha_u(alpha_u),
    .beta_u(beta_u),
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
  PE_inst_Serpens_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_0__dout),
    .if_empty_n(PE_inst_Serpens_0__empty_n),
    .if_read(PE_inst_Serpens_0__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_0__din),
    .if_full_n(PE_inst_Serpens_0__full_n),
    .if_write(PE_inst_Serpens_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_10__dout),
    .if_empty_n(PE_inst_Serpens_10__empty_n),
    .if_read(PE_inst_Serpens_10__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_10__din),
    .if_full_n(PE_inst_Serpens_10__full_n),
    .if_write(PE_inst_Serpens_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_11__dout),
    .if_empty_n(PE_inst_Serpens_11__empty_n),
    .if_read(PE_inst_Serpens_11__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_11__din),
    .if_full_n(PE_inst_Serpens_11__full_n),
    .if_write(PE_inst_Serpens_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_12__dout),
    .if_empty_n(PE_inst_Serpens_12__empty_n),
    .if_read(PE_inst_Serpens_12__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_12__din),
    .if_full_n(PE_inst_Serpens_12__full_n),
    .if_write(PE_inst_Serpens_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_13__dout),
    .if_empty_n(PE_inst_Serpens_13__empty_n),
    .if_read(PE_inst_Serpens_13__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_13__din),
    .if_full_n(PE_inst_Serpens_13__full_n),
    .if_write(PE_inst_Serpens_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_14__dout),
    .if_empty_n(PE_inst_Serpens_14__empty_n),
    .if_read(PE_inst_Serpens_14__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_14__din),
    .if_full_n(PE_inst_Serpens_14__full_n),
    .if_write(PE_inst_Serpens_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_15__dout),
    .if_empty_n(PE_inst_Serpens_15__empty_n),
    .if_read(PE_inst_Serpens_15__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_15__din),
    .if_full_n(PE_inst_Serpens_15__full_n),
    .if_write(PE_inst_Serpens_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_16__dout),
    .if_empty_n(PE_inst_Serpens_16__empty_n),
    .if_read(PE_inst_Serpens_16__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_16__din),
    .if_full_n(PE_inst_Serpens_16__full_n),
    .if_write(PE_inst_Serpens_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_17
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_17__dout),
    .if_empty_n(PE_inst_Serpens_17__empty_n),
    .if_read(PE_inst_Serpens_17__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_17__din),
    .if_full_n(PE_inst_Serpens_17__full_n),
    .if_write(PE_inst_Serpens_17__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_18
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_18__dout),
    .if_empty_n(PE_inst_Serpens_18__empty_n),
    .if_read(PE_inst_Serpens_18__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_18__din),
    .if_full_n(PE_inst_Serpens_18__full_n),
    .if_write(PE_inst_Serpens_18__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_19
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_19__dout),
    .if_empty_n(PE_inst_Serpens_19__empty_n),
    .if_read(PE_inst_Serpens_19__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_19__din),
    .if_full_n(PE_inst_Serpens_19__full_n),
    .if_write(PE_inst_Serpens_19__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_1__dout),
    .if_empty_n(PE_inst_Serpens_1__empty_n),
    .if_read(PE_inst_Serpens_1__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_1__din),
    .if_full_n(PE_inst_Serpens_1__full_n),
    .if_write(PE_inst_Serpens_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_20
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_20__dout),
    .if_empty_n(PE_inst_Serpens_20__empty_n),
    .if_read(PE_inst_Serpens_20__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_20__din),
    .if_full_n(PE_inst_Serpens_20__full_n),
    .if_write(PE_inst_Serpens_20__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_21
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_21__dout),
    .if_empty_n(PE_inst_Serpens_21__empty_n),
    .if_read(PE_inst_Serpens_21__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_21__din),
    .if_full_n(PE_inst_Serpens_21__full_n),
    .if_write(PE_inst_Serpens_21__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_22
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_22__dout),
    .if_empty_n(PE_inst_Serpens_22__empty_n),
    .if_read(PE_inst_Serpens_22__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_22__din),
    .if_full_n(PE_inst_Serpens_22__full_n),
    .if_write(PE_inst_Serpens_22__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_23
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_23__dout),
    .if_empty_n(PE_inst_Serpens_23__empty_n),
    .if_read(PE_inst_Serpens_23__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_23__din),
    .if_full_n(PE_inst_Serpens_23__full_n),
    .if_write(PE_inst_Serpens_23__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_24
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_24__dout),
    .if_empty_n(PE_inst_Serpens_24__empty_n),
    .if_read(PE_inst_Serpens_24__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_24__din),
    .if_full_n(PE_inst_Serpens_24__full_n),
    .if_write(PE_inst_Serpens_24__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_2__dout),
    .if_empty_n(PE_inst_Serpens_2__empty_n),
    .if_read(PE_inst_Serpens_2__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_2__din),
    .if_full_n(PE_inst_Serpens_2__full_n),
    .if_write(PE_inst_Serpens_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_3__dout),
    .if_empty_n(PE_inst_Serpens_3__empty_n),
    .if_read(PE_inst_Serpens_3__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_3__din),
    .if_full_n(PE_inst_Serpens_3__full_n),
    .if_write(PE_inst_Serpens_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_4__dout),
    .if_empty_n(PE_inst_Serpens_4__empty_n),
    .if_read(PE_inst_Serpens_4__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_4__din),
    .if_full_n(PE_inst_Serpens_4__full_n),
    .if_write(PE_inst_Serpens_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_5__dout),
    .if_empty_n(PE_inst_Serpens_5__empty_n),
    .if_read(PE_inst_Serpens_5__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_5__din),
    .if_full_n(PE_inst_Serpens_5__full_n),
    .if_write(PE_inst_Serpens_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_6__dout),
    .if_empty_n(PE_inst_Serpens_6__empty_n),
    .if_read(PE_inst_Serpens_6__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_6__din),
    .if_full_n(PE_inst_Serpens_6__full_n),
    .if_write(PE_inst_Serpens_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_7__dout),
    .if_empty_n(PE_inst_Serpens_7__empty_n),
    .if_read(PE_inst_Serpens_7__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_7__din),
    .if_full_n(PE_inst_Serpens_7__full_n),
    .if_write(PE_inst_Serpens_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_8__dout),
    .if_empty_n(PE_inst_Serpens_8__empty_n),
    .if_read(PE_inst_Serpens_8__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_8__din),
    .if_full_n(PE_inst_Serpens_8__full_n),
    .if_write(PE_inst_Serpens_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  PE_inst_Serpens_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(PE_inst_Serpens_9__dout),
    .if_empty_n(PE_inst_Serpens_9__empty_n),
    .if_read(PE_inst_Serpens_9__read),
    .if_read_ce(1'b1),
    .if_din(PE_inst_Serpens_9__din),
    .if_full_n(PE_inst_Serpens_9__full_n),
    .if_write(PE_inst_Serpens_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_0__dout),
    .if_empty_n(Yvec_inst_Serpens_0__empty_n),
    .if_read(Yvec_inst_Serpens_0__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_0__din),
    .if_full_n(Yvec_inst_Serpens_0__full_n),
    .if_write(Yvec_inst_Serpens_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_10__dout),
    .if_empty_n(Yvec_inst_Serpens_10__empty_n),
    .if_read(Yvec_inst_Serpens_10__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_10__din),
    .if_full_n(Yvec_inst_Serpens_10__full_n),
    .if_write(Yvec_inst_Serpens_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_11__dout),
    .if_empty_n(Yvec_inst_Serpens_11__empty_n),
    .if_read(Yvec_inst_Serpens_11__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_11__din),
    .if_full_n(Yvec_inst_Serpens_11__full_n),
    .if_write(Yvec_inst_Serpens_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_12__dout),
    .if_empty_n(Yvec_inst_Serpens_12__empty_n),
    .if_read(Yvec_inst_Serpens_12__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_12__din),
    .if_full_n(Yvec_inst_Serpens_12__full_n),
    .if_write(Yvec_inst_Serpens_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_13__dout),
    .if_empty_n(Yvec_inst_Serpens_13__empty_n),
    .if_read(Yvec_inst_Serpens_13__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_13__din),
    .if_full_n(Yvec_inst_Serpens_13__full_n),
    .if_write(Yvec_inst_Serpens_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_14__dout),
    .if_empty_n(Yvec_inst_Serpens_14__empty_n),
    .if_read(Yvec_inst_Serpens_14__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_14__din),
    .if_full_n(Yvec_inst_Serpens_14__full_n),
    .if_write(Yvec_inst_Serpens_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_15__dout),
    .if_empty_n(Yvec_inst_Serpens_15__empty_n),
    .if_read(Yvec_inst_Serpens_15__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_15__din),
    .if_full_n(Yvec_inst_Serpens_15__full_n),
    .if_write(Yvec_inst_Serpens_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_16__dout),
    .if_empty_n(Yvec_inst_Serpens_16__empty_n),
    .if_read(Yvec_inst_Serpens_16__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_16__din),
    .if_full_n(Yvec_inst_Serpens_16__full_n),
    .if_write(Yvec_inst_Serpens_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_17
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_17__dout),
    .if_empty_n(Yvec_inst_Serpens_17__empty_n),
    .if_read(Yvec_inst_Serpens_17__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_17__din),
    .if_full_n(Yvec_inst_Serpens_17__full_n),
    .if_write(Yvec_inst_Serpens_17__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_18
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_18__dout),
    .if_empty_n(Yvec_inst_Serpens_18__empty_n),
    .if_read(Yvec_inst_Serpens_18__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_18__din),
    .if_full_n(Yvec_inst_Serpens_18__full_n),
    .if_write(Yvec_inst_Serpens_18__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_19
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_19__dout),
    .if_empty_n(Yvec_inst_Serpens_19__empty_n),
    .if_read(Yvec_inst_Serpens_19__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_19__din),
    .if_full_n(Yvec_inst_Serpens_19__full_n),
    .if_write(Yvec_inst_Serpens_19__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_1__dout),
    .if_empty_n(Yvec_inst_Serpens_1__empty_n),
    .if_read(Yvec_inst_Serpens_1__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_1__din),
    .if_full_n(Yvec_inst_Serpens_1__full_n),
    .if_write(Yvec_inst_Serpens_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_20
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_20__dout),
    .if_empty_n(Yvec_inst_Serpens_20__empty_n),
    .if_read(Yvec_inst_Serpens_20__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_20__din),
    .if_full_n(Yvec_inst_Serpens_20__full_n),
    .if_write(Yvec_inst_Serpens_20__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_21
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_21__dout),
    .if_empty_n(Yvec_inst_Serpens_21__empty_n),
    .if_read(Yvec_inst_Serpens_21__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_21__din),
    .if_full_n(Yvec_inst_Serpens_21__full_n),
    .if_write(Yvec_inst_Serpens_21__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_22
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_22__dout),
    .if_empty_n(Yvec_inst_Serpens_22__empty_n),
    .if_read(Yvec_inst_Serpens_22__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_22__din),
    .if_full_n(Yvec_inst_Serpens_22__full_n),
    .if_write(Yvec_inst_Serpens_22__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_23
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_23__dout),
    .if_empty_n(Yvec_inst_Serpens_23__empty_n),
    .if_read(Yvec_inst_Serpens_23__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_23__din),
    .if_full_n(Yvec_inst_Serpens_23__full_n),
    .if_write(Yvec_inst_Serpens_23__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_2__dout),
    .if_empty_n(Yvec_inst_Serpens_2__empty_n),
    .if_read(Yvec_inst_Serpens_2__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_2__din),
    .if_full_n(Yvec_inst_Serpens_2__full_n),
    .if_write(Yvec_inst_Serpens_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_3__dout),
    .if_empty_n(Yvec_inst_Serpens_3__empty_n),
    .if_read(Yvec_inst_Serpens_3__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_3__din),
    .if_full_n(Yvec_inst_Serpens_3__full_n),
    .if_write(Yvec_inst_Serpens_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_4__dout),
    .if_empty_n(Yvec_inst_Serpens_4__empty_n),
    .if_read(Yvec_inst_Serpens_4__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_4__din),
    .if_full_n(Yvec_inst_Serpens_4__full_n),
    .if_write(Yvec_inst_Serpens_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_5__dout),
    .if_empty_n(Yvec_inst_Serpens_5__empty_n),
    .if_read(Yvec_inst_Serpens_5__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_5__din),
    .if_full_n(Yvec_inst_Serpens_5__full_n),
    .if_write(Yvec_inst_Serpens_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_6__dout),
    .if_empty_n(Yvec_inst_Serpens_6__empty_n),
    .if_read(Yvec_inst_Serpens_6__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_6__din),
    .if_full_n(Yvec_inst_Serpens_6__full_n),
    .if_write(Yvec_inst_Serpens_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_7__dout),
    .if_empty_n(Yvec_inst_Serpens_7__empty_n),
    .if_read(Yvec_inst_Serpens_7__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_7__din),
    .if_full_n(Yvec_inst_Serpens_7__full_n),
    .if_write(Yvec_inst_Serpens_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_8__dout),
    .if_empty_n(Yvec_inst_Serpens_8__empty_n),
    .if_read(Yvec_inst_Serpens_8__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_8__din),
    .if_full_n(Yvec_inst_Serpens_8__full_n),
    .if_write(Yvec_inst_Serpens_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  Yvec_inst_Serpens_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(Yvec_inst_Serpens_9__dout),
    .if_empty_n(Yvec_inst_Serpens_9__empty_n),
    .if_read(Yvec_inst_Serpens_9__read),
    .if_read_ce(1'b1),
    .if_din(Yvec_inst_Serpens_9__din),
    .if_full_n(Yvec_inst_Serpens_9__full_n),
    .if_write(Yvec_inst_Serpens_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_0__dout),
    .if_empty_n(fifo_A_Serpens_0__empty_n),
    .if_read(fifo_A_Serpens_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_0__din),
    .if_full_n(fifo_A_Serpens_0__full_n),
    .if_write(fifo_A_Serpens_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_10__dout),
    .if_empty_n(fifo_A_Serpens_10__empty_n),
    .if_read(fifo_A_Serpens_10__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_10__din),
    .if_full_n(fifo_A_Serpens_10__full_n),
    .if_write(fifo_A_Serpens_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_11__dout),
    .if_empty_n(fifo_A_Serpens_11__empty_n),
    .if_read(fifo_A_Serpens_11__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_11__din),
    .if_full_n(fifo_A_Serpens_11__full_n),
    .if_write(fifo_A_Serpens_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_12__dout),
    .if_empty_n(fifo_A_Serpens_12__empty_n),
    .if_read(fifo_A_Serpens_12__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_12__din),
    .if_full_n(fifo_A_Serpens_12__full_n),
    .if_write(fifo_A_Serpens_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_13__dout),
    .if_empty_n(fifo_A_Serpens_13__empty_n),
    .if_read(fifo_A_Serpens_13__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_13__din),
    .if_full_n(fifo_A_Serpens_13__full_n),
    .if_write(fifo_A_Serpens_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_14__dout),
    .if_empty_n(fifo_A_Serpens_14__empty_n),
    .if_read(fifo_A_Serpens_14__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_14__din),
    .if_full_n(fifo_A_Serpens_14__full_n),
    .if_write(fifo_A_Serpens_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_15__dout),
    .if_empty_n(fifo_A_Serpens_15__empty_n),
    .if_read(fifo_A_Serpens_15__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_15__din),
    .if_full_n(fifo_A_Serpens_15__full_n),
    .if_write(fifo_A_Serpens_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_16__dout),
    .if_empty_n(fifo_A_Serpens_16__empty_n),
    .if_read(fifo_A_Serpens_16__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_16__din),
    .if_full_n(fifo_A_Serpens_16__full_n),
    .if_write(fifo_A_Serpens_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_17
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_17__dout),
    .if_empty_n(fifo_A_Serpens_17__empty_n),
    .if_read(fifo_A_Serpens_17__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_17__din),
    .if_full_n(fifo_A_Serpens_17__full_n),
    .if_write(fifo_A_Serpens_17__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_18
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_18__dout),
    .if_empty_n(fifo_A_Serpens_18__empty_n),
    .if_read(fifo_A_Serpens_18__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_18__din),
    .if_full_n(fifo_A_Serpens_18__full_n),
    .if_write(fifo_A_Serpens_18__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_19
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_19__dout),
    .if_empty_n(fifo_A_Serpens_19__empty_n),
    .if_read(fifo_A_Serpens_19__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_19__din),
    .if_full_n(fifo_A_Serpens_19__full_n),
    .if_write(fifo_A_Serpens_19__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_1__dout),
    .if_empty_n(fifo_A_Serpens_1__empty_n),
    .if_read(fifo_A_Serpens_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_1__din),
    .if_full_n(fifo_A_Serpens_1__full_n),
    .if_write(fifo_A_Serpens_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_20
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_20__dout),
    .if_empty_n(fifo_A_Serpens_20__empty_n),
    .if_read(fifo_A_Serpens_20__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_20__din),
    .if_full_n(fifo_A_Serpens_20__full_n),
    .if_write(fifo_A_Serpens_20__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_21
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_21__dout),
    .if_empty_n(fifo_A_Serpens_21__empty_n),
    .if_read(fifo_A_Serpens_21__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_21__din),
    .if_full_n(fifo_A_Serpens_21__full_n),
    .if_write(fifo_A_Serpens_21__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_22
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_22__dout),
    .if_empty_n(fifo_A_Serpens_22__empty_n),
    .if_read(fifo_A_Serpens_22__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_22__din),
    .if_full_n(fifo_A_Serpens_22__full_n),
    .if_write(fifo_A_Serpens_22__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_23
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_23__dout),
    .if_empty_n(fifo_A_Serpens_23__empty_n),
    .if_read(fifo_A_Serpens_23__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_23__din),
    .if_full_n(fifo_A_Serpens_23__full_n),
    .if_write(fifo_A_Serpens_23__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_2__dout),
    .if_empty_n(fifo_A_Serpens_2__empty_n),
    .if_read(fifo_A_Serpens_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_2__din),
    .if_full_n(fifo_A_Serpens_2__full_n),
    .if_write(fifo_A_Serpens_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_3__dout),
    .if_empty_n(fifo_A_Serpens_3__empty_n),
    .if_read(fifo_A_Serpens_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_3__din),
    .if_full_n(fifo_A_Serpens_3__full_n),
    .if_write(fifo_A_Serpens_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_4__dout),
    .if_empty_n(fifo_A_Serpens_4__empty_n),
    .if_read(fifo_A_Serpens_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_4__din),
    .if_full_n(fifo_A_Serpens_4__full_n),
    .if_write(fifo_A_Serpens_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_5__dout),
    .if_empty_n(fifo_A_Serpens_5__empty_n),
    .if_read(fifo_A_Serpens_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_5__din),
    .if_full_n(fifo_A_Serpens_5__full_n),
    .if_write(fifo_A_Serpens_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_6__dout),
    .if_empty_n(fifo_A_Serpens_6__empty_n),
    .if_read(fifo_A_Serpens_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_6__din),
    .if_full_n(fifo_A_Serpens_6__full_n),
    .if_write(fifo_A_Serpens_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_7__dout),
    .if_empty_n(fifo_A_Serpens_7__empty_n),
    .if_read(fifo_A_Serpens_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_7__din),
    .if_full_n(fifo_A_Serpens_7__full_n),
    .if_write(fifo_A_Serpens_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_8__dout),
    .if_empty_n(fifo_A_Serpens_8__empty_n),
    .if_read(fifo_A_Serpens_8__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_8__din),
    .if_full_n(fifo_A_Serpens_8__full_n),
    .if_write(fifo_A_Serpens_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_A_Serpens_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_A_Serpens_9__dout),
    .if_empty_n(fifo_A_Serpens_9__empty_n),
    .if_read(fifo_A_Serpens_9__read),
    .if_read_ce(1'b1),
    .if_din(fifo_A_Serpens_9__din),
    .if_full_n(fifo_A_Serpens_9__full_n),
    .if_write(fifo_A_Serpens_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_0__dout),
    .if_empty_n(fifo_X_pe_Serpens_0__empty_n),
    .if_read(fifo_X_pe_Serpens_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_0__din),
    .if_full_n(fifo_X_pe_Serpens_0__full_n),
    .if_write(fifo_X_pe_Serpens_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_10__dout),
    .if_empty_n(fifo_X_pe_Serpens_10__empty_n),
    .if_read(fifo_X_pe_Serpens_10__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_10__din),
    .if_full_n(fifo_X_pe_Serpens_10__full_n),
    .if_write(fifo_X_pe_Serpens_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_11__dout),
    .if_empty_n(fifo_X_pe_Serpens_11__empty_n),
    .if_read(fifo_X_pe_Serpens_11__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_11__din),
    .if_full_n(fifo_X_pe_Serpens_11__full_n),
    .if_write(fifo_X_pe_Serpens_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_12__dout),
    .if_empty_n(fifo_X_pe_Serpens_12__empty_n),
    .if_read(fifo_X_pe_Serpens_12__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_12__din),
    .if_full_n(fifo_X_pe_Serpens_12__full_n),
    .if_write(fifo_X_pe_Serpens_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_13__dout),
    .if_empty_n(fifo_X_pe_Serpens_13__empty_n),
    .if_read(fifo_X_pe_Serpens_13__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_13__din),
    .if_full_n(fifo_X_pe_Serpens_13__full_n),
    .if_write(fifo_X_pe_Serpens_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_14__dout),
    .if_empty_n(fifo_X_pe_Serpens_14__empty_n),
    .if_read(fifo_X_pe_Serpens_14__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_14__din),
    .if_full_n(fifo_X_pe_Serpens_14__full_n),
    .if_write(fifo_X_pe_Serpens_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_15__dout),
    .if_empty_n(fifo_X_pe_Serpens_15__empty_n),
    .if_read(fifo_X_pe_Serpens_15__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_15__din),
    .if_full_n(fifo_X_pe_Serpens_15__full_n),
    .if_write(fifo_X_pe_Serpens_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_16__dout),
    .if_empty_n(fifo_X_pe_Serpens_16__empty_n),
    .if_read(fifo_X_pe_Serpens_16__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_16__din),
    .if_full_n(fifo_X_pe_Serpens_16__full_n),
    .if_write(fifo_X_pe_Serpens_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_17
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_17__dout),
    .if_empty_n(fifo_X_pe_Serpens_17__empty_n),
    .if_read(fifo_X_pe_Serpens_17__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_17__din),
    .if_full_n(fifo_X_pe_Serpens_17__full_n),
    .if_write(fifo_X_pe_Serpens_17__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_18
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_18__dout),
    .if_empty_n(fifo_X_pe_Serpens_18__empty_n),
    .if_read(fifo_X_pe_Serpens_18__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_18__din),
    .if_full_n(fifo_X_pe_Serpens_18__full_n),
    .if_write(fifo_X_pe_Serpens_18__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_19
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_19__dout),
    .if_empty_n(fifo_X_pe_Serpens_19__empty_n),
    .if_read(fifo_X_pe_Serpens_19__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_19__din),
    .if_full_n(fifo_X_pe_Serpens_19__full_n),
    .if_write(fifo_X_pe_Serpens_19__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_1__dout),
    .if_empty_n(fifo_X_pe_Serpens_1__empty_n),
    .if_read(fifo_X_pe_Serpens_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_1__din),
    .if_full_n(fifo_X_pe_Serpens_1__full_n),
    .if_write(fifo_X_pe_Serpens_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_20
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_20__dout),
    .if_empty_n(fifo_X_pe_Serpens_20__empty_n),
    .if_read(fifo_X_pe_Serpens_20__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_20__din),
    .if_full_n(fifo_X_pe_Serpens_20__full_n),
    .if_write(fifo_X_pe_Serpens_20__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_21
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_21__dout),
    .if_empty_n(fifo_X_pe_Serpens_21__empty_n),
    .if_read(fifo_X_pe_Serpens_21__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_21__din),
    .if_full_n(fifo_X_pe_Serpens_21__full_n),
    .if_write(fifo_X_pe_Serpens_21__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_22
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_22__dout),
    .if_empty_n(fifo_X_pe_Serpens_22__empty_n),
    .if_read(fifo_X_pe_Serpens_22__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_22__din),
    .if_full_n(fifo_X_pe_Serpens_22__full_n),
    .if_write(fifo_X_pe_Serpens_22__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_23
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_23__dout),
    .if_empty_n(fifo_X_pe_Serpens_23__empty_n),
    .if_read(fifo_X_pe_Serpens_23__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_23__din),
    .if_full_n(fifo_X_pe_Serpens_23__full_n),
    .if_write(fifo_X_pe_Serpens_23__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_24
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_24__dout),
    .if_empty_n(fifo_X_pe_Serpens_24__empty_n),
    .if_read(fifo_X_pe_Serpens_24__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_24__din),
    .if_full_n(fifo_X_pe_Serpens_24__full_n),
    .if_write(fifo_X_pe_Serpens_24__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_2__dout),
    .if_empty_n(fifo_X_pe_Serpens_2__empty_n),
    .if_read(fifo_X_pe_Serpens_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_2__din),
    .if_full_n(fifo_X_pe_Serpens_2__full_n),
    .if_write(fifo_X_pe_Serpens_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_3__dout),
    .if_empty_n(fifo_X_pe_Serpens_3__empty_n),
    .if_read(fifo_X_pe_Serpens_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_3__din),
    .if_full_n(fifo_X_pe_Serpens_3__full_n),
    .if_write(fifo_X_pe_Serpens_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_4__dout),
    .if_empty_n(fifo_X_pe_Serpens_4__empty_n),
    .if_read(fifo_X_pe_Serpens_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_4__din),
    .if_full_n(fifo_X_pe_Serpens_4__full_n),
    .if_write(fifo_X_pe_Serpens_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_5__dout),
    .if_empty_n(fifo_X_pe_Serpens_5__empty_n),
    .if_read(fifo_X_pe_Serpens_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_5__din),
    .if_full_n(fifo_X_pe_Serpens_5__full_n),
    .if_write(fifo_X_pe_Serpens_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_6__dout),
    .if_empty_n(fifo_X_pe_Serpens_6__empty_n),
    .if_read(fifo_X_pe_Serpens_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_6__din),
    .if_full_n(fifo_X_pe_Serpens_6__full_n),
    .if_write(fifo_X_pe_Serpens_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_7__dout),
    .if_empty_n(fifo_X_pe_Serpens_7__empty_n),
    .if_read(fifo_X_pe_Serpens_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_7__din),
    .if_full_n(fifo_X_pe_Serpens_7__full_n),
    .if_write(fifo_X_pe_Serpens_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_8__dout),
    .if_empty_n(fifo_X_pe_Serpens_8__empty_n),
    .if_read(fifo_X_pe_Serpens_8__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_8__din),
    .if_full_n(fifo_X_pe_Serpens_8__full_n),
    .if_write(fifo_X_pe_Serpens_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_X_pe_Serpens_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_X_pe_Serpens_9__dout),
    .if_empty_n(fifo_X_pe_Serpens_9__empty_n),
    .if_read(fifo_X_pe_Serpens_9__read),
    .if_read_ce(1'b1),
    .if_din(fifo_X_pe_Serpens_9__din),
    .if_full_n(fifo_X_pe_Serpens_9__full_n),
    .if_write(fifo_X_pe_Serpens_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_AX_Serpens
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_AX_Serpens__dout),
    .if_empty_n(fifo_Y_AX_Serpens__empty_n),
    .if_read(fifo_Y_AX_Serpens__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_AX_Serpens__din),
    .if_full_n(fifo_Y_AX_Serpens__full_n),
    .if_write(fifo_Y_AX_Serpens__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_alpha_AX_Serpens
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_alpha_AX_Serpens__dout),
    .if_empty_n(fifo_Y_alpha_AX_Serpens__empty_n),
    .if_read(fifo_Y_alpha_AX_Serpens__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_alpha_AX_Serpens__din),
    .if_full_n(fifo_Y_alpha_AX_Serpens__full_n),
    .if_write(fifo_Y_alpha_AX_Serpens__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_in_Serpens
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_in_Serpens__dout),
    .if_empty_n(fifo_Y_in_Serpens__empty_n),
    .if_read(fifo_Y_in_Serpens__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_in_Serpens__din),
    .if_full_n(fifo_Y_in_Serpens__full_n),
    .if_write(fifo_Y_in_Serpens__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_in_beta_Serpens
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_in_beta_Serpens__dout),
    .if_empty_n(fifo_Y_in_beta_Serpens__empty_n),
    .if_read(fifo_Y_in_beta_Serpens__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_in_beta_Serpens__din),
    .if_full_n(fifo_Y_in_beta_Serpens__full_n),
    .if_write(fifo_Y_in_beta_Serpens__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(513),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_out_Serpens
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_out_Serpens__dout),
    .if_empty_n(fifo_Y_out_Serpens__empty_n),
    .if_read(fifo_Y_out_Serpens__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_out_Serpens__din),
    .if_full_n(fifo_Y_out_Serpens__full_n),
    .if_write(fifo_Y_out_Serpens__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_0__dout),
    .if_empty_n(fifo_Y_pe_Serpens_0__empty_n),
    .if_read(fifo_Y_pe_Serpens_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_0__din),
    .if_full_n(fifo_Y_pe_Serpens_0__full_n),
    .if_write(fifo_Y_pe_Serpens_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_10__dout),
    .if_empty_n(fifo_Y_pe_Serpens_10__empty_n),
    .if_read(fifo_Y_pe_Serpens_10__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_10__din),
    .if_full_n(fifo_Y_pe_Serpens_10__full_n),
    .if_write(fifo_Y_pe_Serpens_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_11__dout),
    .if_empty_n(fifo_Y_pe_Serpens_11__empty_n),
    .if_read(fifo_Y_pe_Serpens_11__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_11__din),
    .if_full_n(fifo_Y_pe_Serpens_11__full_n),
    .if_write(fifo_Y_pe_Serpens_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_12__dout),
    .if_empty_n(fifo_Y_pe_Serpens_12__empty_n),
    .if_read(fifo_Y_pe_Serpens_12__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_12__din),
    .if_full_n(fifo_Y_pe_Serpens_12__full_n),
    .if_write(fifo_Y_pe_Serpens_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_13__dout),
    .if_empty_n(fifo_Y_pe_Serpens_13__empty_n),
    .if_read(fifo_Y_pe_Serpens_13__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_13__din),
    .if_full_n(fifo_Y_pe_Serpens_13__full_n),
    .if_write(fifo_Y_pe_Serpens_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_14__dout),
    .if_empty_n(fifo_Y_pe_Serpens_14__empty_n),
    .if_read(fifo_Y_pe_Serpens_14__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_14__din),
    .if_full_n(fifo_Y_pe_Serpens_14__full_n),
    .if_write(fifo_Y_pe_Serpens_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_15__dout),
    .if_empty_n(fifo_Y_pe_Serpens_15__empty_n),
    .if_read(fifo_Y_pe_Serpens_15__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_15__din),
    .if_full_n(fifo_Y_pe_Serpens_15__full_n),
    .if_write(fifo_Y_pe_Serpens_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_16__dout),
    .if_empty_n(fifo_Y_pe_Serpens_16__empty_n),
    .if_read(fifo_Y_pe_Serpens_16__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_16__din),
    .if_full_n(fifo_Y_pe_Serpens_16__full_n),
    .if_write(fifo_Y_pe_Serpens_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_17
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_17__dout),
    .if_empty_n(fifo_Y_pe_Serpens_17__empty_n),
    .if_read(fifo_Y_pe_Serpens_17__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_17__din),
    .if_full_n(fifo_Y_pe_Serpens_17__full_n),
    .if_write(fifo_Y_pe_Serpens_17__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_18
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_18__dout),
    .if_empty_n(fifo_Y_pe_Serpens_18__empty_n),
    .if_read(fifo_Y_pe_Serpens_18__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_18__din),
    .if_full_n(fifo_Y_pe_Serpens_18__full_n),
    .if_write(fifo_Y_pe_Serpens_18__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_19
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_19__dout),
    .if_empty_n(fifo_Y_pe_Serpens_19__empty_n),
    .if_read(fifo_Y_pe_Serpens_19__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_19__din),
    .if_full_n(fifo_Y_pe_Serpens_19__full_n),
    .if_write(fifo_Y_pe_Serpens_19__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_1__dout),
    .if_empty_n(fifo_Y_pe_Serpens_1__empty_n),
    .if_read(fifo_Y_pe_Serpens_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_1__din),
    .if_full_n(fifo_Y_pe_Serpens_1__full_n),
    .if_write(fifo_Y_pe_Serpens_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_20
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_20__dout),
    .if_empty_n(fifo_Y_pe_Serpens_20__empty_n),
    .if_read(fifo_Y_pe_Serpens_20__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_20__din),
    .if_full_n(fifo_Y_pe_Serpens_20__full_n),
    .if_write(fifo_Y_pe_Serpens_20__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_21
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_21__dout),
    .if_empty_n(fifo_Y_pe_Serpens_21__empty_n),
    .if_read(fifo_Y_pe_Serpens_21__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_21__din),
    .if_full_n(fifo_Y_pe_Serpens_21__full_n),
    .if_write(fifo_Y_pe_Serpens_21__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_22
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_22__dout),
    .if_empty_n(fifo_Y_pe_Serpens_22__empty_n),
    .if_read(fifo_Y_pe_Serpens_22__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_22__din),
    .if_full_n(fifo_Y_pe_Serpens_22__full_n),
    .if_write(fifo_Y_pe_Serpens_22__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_23
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_23__dout),
    .if_empty_n(fifo_Y_pe_Serpens_23__empty_n),
    .if_read(fifo_Y_pe_Serpens_23__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_23__din),
    .if_full_n(fifo_Y_pe_Serpens_23__full_n),
    .if_write(fifo_Y_pe_Serpens_23__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_2__dout),
    .if_empty_n(fifo_Y_pe_Serpens_2__empty_n),
    .if_read(fifo_Y_pe_Serpens_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_2__din),
    .if_full_n(fifo_Y_pe_Serpens_2__full_n),
    .if_write(fifo_Y_pe_Serpens_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_3__dout),
    .if_empty_n(fifo_Y_pe_Serpens_3__empty_n),
    .if_read(fifo_Y_pe_Serpens_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_3__din),
    .if_full_n(fifo_Y_pe_Serpens_3__full_n),
    .if_write(fifo_Y_pe_Serpens_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_4__dout),
    .if_empty_n(fifo_Y_pe_Serpens_4__empty_n),
    .if_read(fifo_Y_pe_Serpens_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_4__din),
    .if_full_n(fifo_Y_pe_Serpens_4__full_n),
    .if_write(fifo_Y_pe_Serpens_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_5__dout),
    .if_empty_n(fifo_Y_pe_Serpens_5__empty_n),
    .if_read(fifo_Y_pe_Serpens_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_5__din),
    .if_full_n(fifo_Y_pe_Serpens_5__full_n),
    .if_write(fifo_Y_pe_Serpens_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_6__dout),
    .if_empty_n(fifo_Y_pe_Serpens_6__empty_n),
    .if_read(fifo_Y_pe_Serpens_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_6__din),
    .if_full_n(fifo_Y_pe_Serpens_6__full_n),
    .if_write(fifo_Y_pe_Serpens_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_7__dout),
    .if_empty_n(fifo_Y_pe_Serpens_7__empty_n),
    .if_read(fifo_Y_pe_Serpens_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_7__din),
    .if_full_n(fifo_Y_pe_Serpens_7__full_n),
    .if_write(fifo_Y_pe_Serpens_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_8__dout),
    .if_empty_n(fifo_Y_pe_Serpens_8__empty_n),
    .if_read(fifo_Y_pe_Serpens_8__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_8__din),
    .if_full_n(fifo_Y_pe_Serpens_8__full_n),
    .if_write(fifo_Y_pe_Serpens_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_Serpens_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_Serpens_9__dout),
    .if_empty_n(fifo_Y_pe_Serpens_9__empty_n),
    .if_read(fifo_Y_pe_Serpens_9__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_Serpens_9__din),
    .if_full_n(fifo_Y_pe_Serpens_9__full_n),
    .if_write(fifo_Y_pe_Serpens_9__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Serpens_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Serpens_0__dout),
    .if_empty_n(fifo_Y_pe_abd_Serpens_0__empty_n),
    .if_read(fifo_Y_pe_abd_Serpens_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Serpens_0__din),
    .if_full_n(fifo_Y_pe_abd_Serpens_0__full_n),
    .if_write(fifo_Y_pe_abd_Serpens_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Serpens_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Serpens_1__dout),
    .if_empty_n(fifo_Y_pe_abd_Serpens_1__empty_n),
    .if_read(fifo_Y_pe_abd_Serpens_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Serpens_1__din),
    .if_full_n(fifo_Y_pe_abd_Serpens_1__full_n),
    .if_write(fifo_Y_pe_abd_Serpens_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Serpens_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Serpens_2__dout),
    .if_empty_n(fifo_Y_pe_abd_Serpens_2__empty_n),
    .if_read(fifo_Y_pe_abd_Serpens_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Serpens_2__din),
    .if_full_n(fifo_Y_pe_abd_Serpens_2__full_n),
    .if_write(fifo_Y_pe_abd_Serpens_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Serpens_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Serpens_3__dout),
    .if_empty_n(fifo_Y_pe_abd_Serpens_3__empty_n),
    .if_read(fifo_Y_pe_abd_Serpens_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Serpens_3__din),
    .if_full_n(fifo_Y_pe_abd_Serpens_3__full_n),
    .if_write(fifo_Y_pe_abd_Serpens_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Serpens_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Serpens_4__dout),
    .if_empty_n(fifo_Y_pe_abd_Serpens_4__empty_n),
    .if_read(fifo_Y_pe_abd_Serpens_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Serpens_4__din),
    .if_full_n(fifo_Y_pe_abd_Serpens_4__full_n),
    .if_write(fifo_Y_pe_abd_Serpens_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Serpens_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Serpens_5__dout),
    .if_empty_n(fifo_Y_pe_abd_Serpens_5__empty_n),
    .if_read(fifo_Y_pe_abd_Serpens_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Serpens_5__din),
    .if_full_n(fifo_Y_pe_abd_Serpens_5__full_n),
    .if_write(fifo_Y_pe_abd_Serpens_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Serpens_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Serpens_6__dout),
    .if_empty_n(fifo_Y_pe_abd_Serpens_6__empty_n),
    .if_read(fifo_Y_pe_abd_Serpens_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Serpens_6__din),
    .if_full_n(fifo_Y_pe_abd_Serpens_6__full_n),
    .if_write(fifo_Y_pe_abd_Serpens_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(65),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_Y_pe_abd_Serpens_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_Y_pe_abd_Serpens_7__dout),
    .if_empty_n(fifo_Y_pe_abd_Serpens_7__empty_n),
    .if_read(fifo_Y_pe_abd_Serpens_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_Y_pe_abd_Serpens_7__din),
    .if_full_n(fifo_Y_pe_abd_Serpens_7__full_n),
    .if_write(fifo_Y_pe_abd_Serpens_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_0
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_0__dout),
    .if_empty_n(fifo_aXvec_Serpens_0__empty_n),
    .if_read(fifo_aXvec_Serpens_0__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_0__din),
    .if_full_n(fifo_aXvec_Serpens_0__full_n),
    .if_write(fifo_aXvec_Serpens_0__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_10
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_10__dout),
    .if_empty_n(fifo_aXvec_Serpens_10__empty_n),
    .if_read(fifo_aXvec_Serpens_10__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_10__din),
    .if_full_n(fifo_aXvec_Serpens_10__full_n),
    .if_write(fifo_aXvec_Serpens_10__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_11
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_11__dout),
    .if_empty_n(fifo_aXvec_Serpens_11__empty_n),
    .if_read(fifo_aXvec_Serpens_11__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_11__din),
    .if_full_n(fifo_aXvec_Serpens_11__full_n),
    .if_write(fifo_aXvec_Serpens_11__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_12
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_12__dout),
    .if_empty_n(fifo_aXvec_Serpens_12__empty_n),
    .if_read(fifo_aXvec_Serpens_12__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_12__din),
    .if_full_n(fifo_aXvec_Serpens_12__full_n),
    .if_write(fifo_aXvec_Serpens_12__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_13
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_13__dout),
    .if_empty_n(fifo_aXvec_Serpens_13__empty_n),
    .if_read(fifo_aXvec_Serpens_13__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_13__din),
    .if_full_n(fifo_aXvec_Serpens_13__full_n),
    .if_write(fifo_aXvec_Serpens_13__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_14
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_14__dout),
    .if_empty_n(fifo_aXvec_Serpens_14__empty_n),
    .if_read(fifo_aXvec_Serpens_14__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_14__din),
    .if_full_n(fifo_aXvec_Serpens_14__full_n),
    .if_write(fifo_aXvec_Serpens_14__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_15
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_15__dout),
    .if_empty_n(fifo_aXvec_Serpens_15__empty_n),
    .if_read(fifo_aXvec_Serpens_15__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_15__din),
    .if_full_n(fifo_aXvec_Serpens_15__full_n),
    .if_write(fifo_aXvec_Serpens_15__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_16
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_16__dout),
    .if_empty_n(fifo_aXvec_Serpens_16__empty_n),
    .if_read(fifo_aXvec_Serpens_16__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_16__din),
    .if_full_n(fifo_aXvec_Serpens_16__full_n),
    .if_write(fifo_aXvec_Serpens_16__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_17
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_17__dout),
    .if_empty_n(fifo_aXvec_Serpens_17__empty_n),
    .if_read(fifo_aXvec_Serpens_17__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_17__din),
    .if_full_n(fifo_aXvec_Serpens_17__full_n),
    .if_write(fifo_aXvec_Serpens_17__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_18
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_18__dout),
    .if_empty_n(fifo_aXvec_Serpens_18__empty_n),
    .if_read(fifo_aXvec_Serpens_18__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_18__din),
    .if_full_n(fifo_aXvec_Serpens_18__full_n),
    .if_write(fifo_aXvec_Serpens_18__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_19
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_19__dout),
    .if_empty_n(fifo_aXvec_Serpens_19__empty_n),
    .if_read(fifo_aXvec_Serpens_19__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_19__din),
    .if_full_n(fifo_aXvec_Serpens_19__full_n),
    .if_write(fifo_aXvec_Serpens_19__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_1
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_1__dout),
    .if_empty_n(fifo_aXvec_Serpens_1__empty_n),
    .if_read(fifo_aXvec_Serpens_1__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_1__din),
    .if_full_n(fifo_aXvec_Serpens_1__full_n),
    .if_write(fifo_aXvec_Serpens_1__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_20
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_20__dout),
    .if_empty_n(fifo_aXvec_Serpens_20__empty_n),
    .if_read(fifo_aXvec_Serpens_20__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_20__din),
    .if_full_n(fifo_aXvec_Serpens_20__full_n),
    .if_write(fifo_aXvec_Serpens_20__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_21
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_21__dout),
    .if_empty_n(fifo_aXvec_Serpens_21__empty_n),
    .if_read(fifo_aXvec_Serpens_21__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_21__din),
    .if_full_n(fifo_aXvec_Serpens_21__full_n),
    .if_write(fifo_aXvec_Serpens_21__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_22
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_22__dout),
    .if_empty_n(fifo_aXvec_Serpens_22__empty_n),
    .if_read(fifo_aXvec_Serpens_22__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_22__din),
    .if_full_n(fifo_aXvec_Serpens_22__full_n),
    .if_write(fifo_aXvec_Serpens_22__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_23
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_23__dout),
    .if_empty_n(fifo_aXvec_Serpens_23__empty_n),
    .if_read(fifo_aXvec_Serpens_23__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_23__din),
    .if_full_n(fifo_aXvec_Serpens_23__full_n),
    .if_write(fifo_aXvec_Serpens_23__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_2
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_2__dout),
    .if_empty_n(fifo_aXvec_Serpens_2__empty_n),
    .if_read(fifo_aXvec_Serpens_2__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_2__din),
    .if_full_n(fifo_aXvec_Serpens_2__full_n),
    .if_write(fifo_aXvec_Serpens_2__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_3
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_3__dout),
    .if_empty_n(fifo_aXvec_Serpens_3__empty_n),
    .if_read(fifo_aXvec_Serpens_3__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_3__din),
    .if_full_n(fifo_aXvec_Serpens_3__full_n),
    .if_write(fifo_aXvec_Serpens_3__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_4
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_4__dout),
    .if_empty_n(fifo_aXvec_Serpens_4__empty_n),
    .if_read(fifo_aXvec_Serpens_4__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_4__din),
    .if_full_n(fifo_aXvec_Serpens_4__full_n),
    .if_write(fifo_aXvec_Serpens_4__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_5
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_5__dout),
    .if_empty_n(fifo_aXvec_Serpens_5__empty_n),
    .if_read(fifo_aXvec_Serpens_5__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_5__din),
    .if_full_n(fifo_aXvec_Serpens_5__full_n),
    .if_write(fifo_aXvec_Serpens_5__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_6
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_6__dout),
    .if_empty_n(fifo_aXvec_Serpens_6__empty_n),
    .if_read(fifo_aXvec_Serpens_6__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_6__din),
    .if_full_n(fifo_aXvec_Serpens_6__full_n),
    .if_write(fifo_aXvec_Serpens_6__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_7
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_7__dout),
    .if_empty_n(fifo_aXvec_Serpens_7__empty_n),
    .if_read(fifo_aXvec_Serpens_7__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_7__din),
    .if_full_n(fifo_aXvec_Serpens_7__full_n),
    .if_write(fifo_aXvec_Serpens_7__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_8
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_8__dout),
    .if_empty_n(fifo_aXvec_Serpens_8__empty_n),
    .if_read(fifo_aXvec_Serpens_8__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_8__din),
    .if_full_n(fifo_aXvec_Serpens_8__full_n),
    .if_write(fifo_aXvec_Serpens_8__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(401),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  fifo_aXvec_Serpens_9
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(fifo_aXvec_Serpens_9__dout),
    .if_empty_n(fifo_aXvec_Serpens_9__empty_n),
    .if_read(fifo_aXvec_Serpens_9__read),
    .if_read_ce(1'b1),
    .if_din(fifo_aXvec_Serpens_9__din),
    .if_full_n(fifo_aXvec_Serpens_9__full_n),
    .if_write(fifo_aXvec_Serpens_9__write),
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
    .P_N(Arbiter_Y_0___P_N__q0),
    .fifo_in_0_dout(fifo_Y_pe_Serpens_0__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Serpens_0__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Serpens_0__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Serpens_0__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Serpens_0__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Serpens_1__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Serpens_1__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Serpens_1__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Serpens_1__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Serpens_1__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_Serpens_2__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_Serpens_2__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_Serpens_2__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_Serpens_2__empty_n),
    .fifo_in_2_read(fifo_Y_pe_Serpens_2__read),
    .fifo_in_peek_2_read(),
    .fifo_out_din(fifo_Y_pe_abd_Serpens_0__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Serpens_0__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Serpens_0__write)
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
    .P_N(Arbiter_Y_1___P_N__q0),
    .fifo_in_0_dout(fifo_Y_pe_Serpens_3__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Serpens_3__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Serpens_3__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Serpens_3__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Serpens_3__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Serpens_4__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Serpens_4__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Serpens_4__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Serpens_4__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Serpens_4__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_Serpens_5__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_Serpens_5__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_Serpens_5__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_Serpens_5__empty_n),
    .fifo_in_2_read(fifo_Y_pe_Serpens_5__read),
    .fifo_in_peek_2_read(),
    .fifo_out_din(fifo_Y_pe_abd_Serpens_1__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Serpens_1__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Serpens_1__write)
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
    .P_N(Arbiter_Y_2___P_N__q0),
    .fifo_in_0_dout(fifo_Y_pe_Serpens_6__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Serpens_6__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Serpens_6__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Serpens_6__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Serpens_6__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Serpens_7__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Serpens_7__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Serpens_7__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Serpens_7__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Serpens_7__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_Serpens_8__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_Serpens_8__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_Serpens_8__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_Serpens_8__empty_n),
    .fifo_in_2_read(fifo_Y_pe_Serpens_8__read),
    .fifo_in_peek_2_read(),
    .fifo_out_din(fifo_Y_pe_abd_Serpens_2__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Serpens_2__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Serpens_2__write)
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
    .P_N(Arbiter_Y_3___P_N__q0),
    .fifo_in_1_dout(fifo_Y_pe_Serpens_10__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Serpens_10__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Serpens_10__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Serpens_10__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Serpens_10__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_Serpens_11__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_Serpens_11__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_Serpens_11__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_Serpens_11__empty_n),
    .fifo_in_2_read(fifo_Y_pe_Serpens_11__read),
    .fifo_in_peek_2_read(),
    .fifo_in_0_dout(fifo_Y_pe_Serpens_9__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Serpens_9__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Serpens_9__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Serpens_9__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Serpens_9__read),
    .fifo_in_peek_0_read(),
    .fifo_out_din(fifo_Y_pe_abd_Serpens_3__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Serpens_3__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Serpens_3__write)
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
    .P_N(Arbiter_Y_4___P_N__q0),
    .fifo_in_0_dout(fifo_Y_pe_Serpens_12__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Serpens_12__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Serpens_12__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Serpens_12__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Serpens_12__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Serpens_13__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Serpens_13__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Serpens_13__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Serpens_13__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Serpens_13__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_Serpens_14__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_Serpens_14__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_Serpens_14__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_Serpens_14__empty_n),
    .fifo_in_2_read(fifo_Y_pe_Serpens_14__read),
    .fifo_in_peek_2_read(),
    .fifo_out_din(fifo_Y_pe_abd_Serpens_4__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Serpens_4__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Serpens_4__write)
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
    .P_N(Arbiter_Y_5___P_N__q0),
    .fifo_in_0_dout(fifo_Y_pe_Serpens_15__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Serpens_15__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Serpens_15__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Serpens_15__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Serpens_15__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Serpens_16__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Serpens_16__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Serpens_16__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Serpens_16__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Serpens_16__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_Serpens_17__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_Serpens_17__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_Serpens_17__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_Serpens_17__empty_n),
    .fifo_in_2_read(fifo_Y_pe_Serpens_17__read),
    .fifo_in_peek_2_read(),
    .fifo_out_din(fifo_Y_pe_abd_Serpens_5__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Serpens_5__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Serpens_5__write)
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
    .P_N(Arbiter_Y_6___P_N__q0),
    .fifo_in_0_dout(fifo_Y_pe_Serpens_18__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Serpens_18__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Serpens_18__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Serpens_18__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Serpens_18__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Serpens_19__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Serpens_19__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Serpens_19__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Serpens_19__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Serpens_19__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_Serpens_20__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_Serpens_20__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_Serpens_20__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_Serpens_20__empty_n),
    .fifo_in_2_read(fifo_Y_pe_Serpens_20__read),
    .fifo_in_peek_2_read(),
    .fifo_out_din(fifo_Y_pe_abd_Serpens_6__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Serpens_6__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Serpens_6__write)
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
    .P_N(Arbiter_Y_7___P_N__q0),
    .fifo_in_0_dout(fifo_Y_pe_Serpens_21__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_Serpens_21__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_Serpens_21__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_Serpens_21__empty_n),
    .fifo_in_0_read(fifo_Y_pe_Serpens_21__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_Serpens_22__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_Serpens_22__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_Serpens_22__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_Serpens_22__empty_n),
    .fifo_in_1_read(fifo_Y_pe_Serpens_22__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_Serpens_23__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_Serpens_23__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_Serpens_23__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_Serpens_23__empty_n),
    .fifo_in_2_read(fifo_Y_pe_Serpens_23__read),
    .fifo_in_peek_2_read(),
    .fifo_out_din(fifo_Y_pe_abd_Serpens_7__din),
    .fifo_out_full_n(fifo_Y_pe_abd_Serpens_7__full_n),
    .fifo_out_write(fifo_Y_pe_abd_Serpens_7__write)
  );


  (* keep_hierarchy = "yes" *) FloatvAddFloatv
  FloatvAddFloatv_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(FloatvAddFloatv_0__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .fifo_in0_s_dout(fifo_Y_alpha_AX_Serpens__dout),
    .fifo_in0_peek_dout(fifo_Y_alpha_AX_Serpens__dout),
    .fifo_in0_s_empty_n(fifo_Y_alpha_AX_Serpens__empty_n),
    .fifo_in0_peek_empty_n(fifo_Y_alpha_AX_Serpens__empty_n),
    .fifo_in0_s_read(fifo_Y_alpha_AX_Serpens__read),
    .fifo_in0_peek_read(),
    .fifo_in1_s_dout(fifo_Y_in_beta_Serpens__dout),
    .fifo_in1_peek_dout(fifo_Y_in_beta_Serpens__dout),
    .fifo_in1_s_empty_n(fifo_Y_in_beta_Serpens__empty_n),
    .fifo_in1_peek_empty_n(fifo_Y_in_beta_Serpens__empty_n),
    .fifo_in1_s_read(fifo_Y_in_beta_Serpens__read),
    .fifo_in1_peek_read(),
    .fifo_out_din(fifo_Y_out_Serpens__din),
    .fifo_out_full_n(fifo_Y_out_Serpens__full_n),
    .fifo_out_write(fifo_Y_out_Serpens__write)
  );


  (* keep_hierarchy = "yes" *) FloatvMultConst
  FloatvMultConst_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(FloatvMultConst_0__ap_start),
    .ap_done(FloatvMultConst_0__ap_done),
    .ap_idle(FloatvMultConst_0__ap_idle),
    .ap_ready(FloatvMultConst_0__ap_ready),
    .M(FloatvMultConst_0___M__q0),
    .P_N(FloatvMultConst_0___P_N__q0),
    .alpha_u(FloatvMultConst_0___alpha_u__q0),
    .fifo_in_s_dout(fifo_Y_AX_Serpens__dout),
    .fifo_in_peek_dout(fifo_Y_AX_Serpens__dout),
    .fifo_in_s_empty_n(fifo_Y_AX_Serpens__empty_n),
    .fifo_in_peek_empty_n(fifo_Y_AX_Serpens__empty_n),
    .fifo_in_s_read(fifo_Y_AX_Serpens__read),
    .fifo_in_peek_read(),
    .fifo_out_din(fifo_Y_alpha_AX_Serpens__din),
    .fifo_out_full_n(fifo_Y_alpha_AX_Serpens__full_n),
    .fifo_out_write(fifo_Y_alpha_AX_Serpens__write)
  );


  (* keep_hierarchy = "yes" *) FloatvMultConst
  FloatvMultConst_1
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(FloatvMultConst_1__ap_start),
    .ap_done(FloatvMultConst_1__ap_done),
    .ap_idle(FloatvMultConst_1__ap_idle),
    .ap_ready(FloatvMultConst_1__ap_ready),
    .M(FloatvMultConst_1___M__q0),
    .P_N(FloatvMultConst_1___P_N__q0),
    .alpha_u(FloatvMultConst_1___beta_u__q0),
    .fifo_in_s_dout(fifo_Y_in_Serpens__dout),
    .fifo_in_peek_dout(fifo_Y_in_Serpens__dout),
    .fifo_in_s_empty_n(fifo_Y_in_Serpens__empty_n),
    .fifo_in_peek_empty_n(fifo_Y_in_Serpens__empty_n),
    .fifo_in_s_read(fifo_Y_in_Serpens__read),
    .fifo_in_peek_read(),
    .fifo_out_din(fifo_Y_in_beta_Serpens__din),
    .fifo_out_full_n(fifo_Y_in_beta_Serpens__full_n),
    .fifo_out_write(fifo_Y_in_beta_Serpens__write)
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
    .fifo_out_din(fifo_Y_AX_Serpens__din),
    .fifo_out_full_n(fifo_Y_AX_Serpens__full_n),
    .fifo_out_write(fifo_Y_AX_Serpens__write),
    .fifo_in_0_dout(fifo_Y_pe_abd_Serpens_0__dout),
    .fifo_in_peek_0_dout(fifo_Y_pe_abd_Serpens_0__dout),
    .fifo_in_0_empty_n(fifo_Y_pe_abd_Serpens_0__empty_n),
    .fifo_in_peek_0_empty_n(fifo_Y_pe_abd_Serpens_0__empty_n),
    .fifo_in_0_read(fifo_Y_pe_abd_Serpens_0__read),
    .fifo_in_peek_0_read(),
    .fifo_in_1_dout(fifo_Y_pe_abd_Serpens_1__dout),
    .fifo_in_peek_1_dout(fifo_Y_pe_abd_Serpens_1__dout),
    .fifo_in_1_empty_n(fifo_Y_pe_abd_Serpens_1__empty_n),
    .fifo_in_peek_1_empty_n(fifo_Y_pe_abd_Serpens_1__empty_n),
    .fifo_in_1_read(fifo_Y_pe_abd_Serpens_1__read),
    .fifo_in_peek_1_read(),
    .fifo_in_2_dout(fifo_Y_pe_abd_Serpens_2__dout),
    .fifo_in_peek_2_dout(fifo_Y_pe_abd_Serpens_2__dout),
    .fifo_in_2_empty_n(fifo_Y_pe_abd_Serpens_2__empty_n),
    .fifo_in_peek_2_empty_n(fifo_Y_pe_abd_Serpens_2__empty_n),
    .fifo_in_2_read(fifo_Y_pe_abd_Serpens_2__read),
    .fifo_in_peek_2_read(),
    .fifo_in_3_dout(fifo_Y_pe_abd_Serpens_3__dout),
    .fifo_in_peek_3_dout(fifo_Y_pe_abd_Serpens_3__dout),
    .fifo_in_3_empty_n(fifo_Y_pe_abd_Serpens_3__empty_n),
    .fifo_in_peek_3_empty_n(fifo_Y_pe_abd_Serpens_3__empty_n),
    .fifo_in_3_read(fifo_Y_pe_abd_Serpens_3__read),
    .fifo_in_peek_3_read(),
    .fifo_in_4_dout(fifo_Y_pe_abd_Serpens_4__dout),
    .fifo_in_peek_4_dout(fifo_Y_pe_abd_Serpens_4__dout),
    .fifo_in_4_empty_n(fifo_Y_pe_abd_Serpens_4__empty_n),
    .fifo_in_peek_4_empty_n(fifo_Y_pe_abd_Serpens_4__empty_n),
    .fifo_in_4_read(fifo_Y_pe_abd_Serpens_4__read),
    .fifo_in_peek_4_read(),
    .fifo_in_5_dout(fifo_Y_pe_abd_Serpens_5__dout),
    .fifo_in_peek_5_dout(fifo_Y_pe_abd_Serpens_5__dout),
    .fifo_in_5_empty_n(fifo_Y_pe_abd_Serpens_5__empty_n),
    .fifo_in_peek_5_empty_n(fifo_Y_pe_abd_Serpens_5__empty_n),
    .fifo_in_5_read(fifo_Y_pe_abd_Serpens_5__read),
    .fifo_in_peek_5_read(),
    .fifo_in_6_dout(fifo_Y_pe_abd_Serpens_6__dout),
    .fifo_in_peek_6_dout(fifo_Y_pe_abd_Serpens_6__dout),
    .fifo_in_6_empty_n(fifo_Y_pe_abd_Serpens_6__empty_n),
    .fifo_in_peek_6_empty_n(fifo_Y_pe_abd_Serpens_6__empty_n),
    .fifo_in_6_read(fifo_Y_pe_abd_Serpens_6__read),
    .fifo_in_peek_6_read(),
    .fifo_in_7_dout(fifo_Y_pe_abd_Serpens_7__dout),
    .fifo_in_peek_7_dout(fifo_Y_pe_abd_Serpens_7__dout),
    .fifo_in_7_empty_n(fifo_Y_pe_abd_Serpens_7__empty_n),
    .fifo_in_peek_7_empty_n(fifo_Y_pe_abd_Serpens_7__empty_n),
    .fifo_in_7_read(fifo_Y_pe_abd_Serpens_7__read),
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_0__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_0__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_0__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_0__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_0__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_1__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_1__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_1__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_0__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_0__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_0__write),
    .fifo_A_s_dout(fifo_A_Serpens_0__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_0__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_0__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_0__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_0__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_0__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_0__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_0__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_0__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_0__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_1__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_1__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_1__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_0__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_0__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_0__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_1__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_1__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_1__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_1__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_1__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_2__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_2__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_2__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_1__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_1__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_1__write),
    .fifo_A_s_dout(fifo_A_Serpens_1__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_1__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_1__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_1__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_1__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_1__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_1__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_1__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_1__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_1__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_2__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_2__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_2__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_1__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_1__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_1__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_2__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_2__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_2__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_2__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_2__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_3__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_3__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_3__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_2__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_2__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_2__write),
    .fifo_A_s_dout(fifo_A_Serpens_2__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_2__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_2__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_2__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_2__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_2__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_2__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_2__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_2__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_2__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_3__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_3__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_3__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_2__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_2__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_2__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_3__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_3__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_3__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_3__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_3__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_4__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_4__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_4__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_3__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_3__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_3__write),
    .fifo_A_s_dout(fifo_A_Serpens_3__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_3__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_3__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_3__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_3__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_3__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_3__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_3__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_3__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_3__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_4__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_4__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_4__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_3__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_3__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_3__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_4__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_4__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_4__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_4__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_4__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_5__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_5__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_5__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_4__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_4__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_4__write),
    .fifo_A_s_dout(fifo_A_Serpens_4__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_4__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_4__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_4__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_4__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_4__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_4__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_4__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_4__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_4__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_5__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_5__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_5__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_4__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_4__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_4__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_5__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_5__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_5__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_5__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_5__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_6__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_6__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_6__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_5__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_5__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_5__write),
    .fifo_A_s_dout(fifo_A_Serpens_5__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_5__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_5__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_5__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_5__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_5__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_5__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_5__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_5__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_5__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_6__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_6__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_6__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_5__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_5__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_5__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_6__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_6__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_6__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_6__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_6__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_7__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_7__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_7__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_6__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_6__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_6__write),
    .fifo_A_s_dout(fifo_A_Serpens_6__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_6__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_6__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_6__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_6__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_6__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_6__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_6__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_6__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_6__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_7__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_7__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_7__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_6__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_6__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_6__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_7__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_7__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_7__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_7__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_7__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_8__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_8__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_8__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_7__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_7__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_7__write),
    .fifo_A_s_dout(fifo_A_Serpens_7__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_7__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_7__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_7__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_7__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_7__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_7__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_7__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_7__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_7__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_8__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_8__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_8__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_7__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_7__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_7__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_8__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_8__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_8__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_8__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_8__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_9__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_9__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_9__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_8__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_8__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_8__write),
    .fifo_A_s_dout(fifo_A_Serpens_8__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_8__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_8__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_8__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_8__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_8__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_8__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_8__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_8__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_8__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_9__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_9__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_9__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_8__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_8__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_8__write)
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
    .fifo_inst_out_din(PE_inst_Serpens_10__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_10__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_10__write),
    .fifo_inst_in_s_dout(PE_inst_Serpens_9__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_9__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_9__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_9__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_9__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_9__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_9__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_9__write),
    .fifo_A_s_dout(fifo_A_Serpens_9__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_9__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_9__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_9__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_9__read),
    .fifo_A_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_10__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_10__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_10__write),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_9__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_9__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_9__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_9__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_9__read),
    .fifo_X_in_peek_read(),
    .fifo_aXvec_din(fifo_aXvec_Serpens_9__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_9__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_9__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_10__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_10__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_10__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_10__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_10__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_11__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_11__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_11__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_10__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_10__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_10__write),
    .fifo_A_s_dout(fifo_A_Serpens_10__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_10__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_10__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_10__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_10__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_10__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_10__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_10__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_10__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_10__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_11__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_11__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_11__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_10__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_10__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_10__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_11__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_11__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_11__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_11__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_11__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_12__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_12__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_12__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_11__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_11__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_11__write),
    .fifo_A_s_dout(fifo_A_Serpens_11__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_11__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_11__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_11__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_11__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_11__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_11__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_11__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_11__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_11__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_12__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_12__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_12__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_11__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_11__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_11__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_12__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_12__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_12__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_12__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_12__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_13__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_13__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_13__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_12__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_12__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_12__write),
    .fifo_A_s_dout(fifo_A_Serpens_12__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_12__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_12__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_12__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_12__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_12__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_12__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_12__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_12__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_12__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_13__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_13__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_13__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_12__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_12__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_12__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_13__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_13__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_13__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_13__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_13__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_14__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_14__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_14__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_13__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_13__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_13__write),
    .fifo_A_s_dout(fifo_A_Serpens_13__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_13__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_13__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_13__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_13__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_13__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_13__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_13__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_13__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_13__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_14__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_14__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_14__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_13__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_13__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_13__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_14__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_14__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_14__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_14__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_14__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_15__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_15__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_15__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_14__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_14__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_14__write),
    .fifo_A_s_dout(fifo_A_Serpens_14__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_14__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_14__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_14__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_14__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_14__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_14__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_14__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_14__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_14__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_15__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_15__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_15__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_14__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_14__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_14__write)
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
    .fifo_inst_in_s_dout(PE_inst_Serpens_15__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_15__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_15__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_15__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_15__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_16__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_16__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_16__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_15__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_15__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_15__write),
    .fifo_A_s_dout(fifo_A_Serpens_15__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_15__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_15__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_15__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_15__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_15__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_15__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_15__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_15__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_15__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_16__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_16__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_16__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_15__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_15__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_15__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_16
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_16__ap_start),
    .ap_done(PEG_Xvec_16__ap_done),
    .ap_idle(PEG_Xvec_16__ap_idle),
    .ap_ready(PEG_Xvec_16__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Serpens_16__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_16__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_16__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_16__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_16__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_17__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_17__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_17__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_16__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_16__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_16__write),
    .fifo_A_s_dout(fifo_A_Serpens_16__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_16__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_16__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_16__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_16__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_16__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_16__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_16__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_16__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_16__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_17__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_17__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_17__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_16__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_16__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_16__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_17
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_17__ap_start),
    .ap_done(PEG_Xvec_17__ap_done),
    .ap_idle(PEG_Xvec_17__ap_idle),
    .ap_ready(PEG_Xvec_17__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Serpens_17__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_17__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_17__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_17__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_17__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_18__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_18__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_18__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_17__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_17__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_17__write),
    .fifo_A_s_dout(fifo_A_Serpens_17__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_17__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_17__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_17__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_17__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_17__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_17__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_17__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_17__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_17__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_18__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_18__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_18__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_17__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_17__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_17__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_18
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_18__ap_start),
    .ap_done(PEG_Xvec_18__ap_done),
    .ap_idle(PEG_Xvec_18__ap_idle),
    .ap_ready(PEG_Xvec_18__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Serpens_18__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_18__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_18__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_18__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_18__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_19__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_19__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_19__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_18__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_18__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_18__write),
    .fifo_A_s_dout(fifo_A_Serpens_18__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_18__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_18__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_18__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_18__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_18__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_18__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_18__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_18__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_18__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_19__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_19__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_19__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_18__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_18__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_18__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_19
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_19__ap_start),
    .ap_done(PEG_Xvec_19__ap_done),
    .ap_idle(PEG_Xvec_19__ap_idle),
    .ap_ready(PEG_Xvec_19__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Serpens_19__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_19__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_19__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_19__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_19__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_20__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_20__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_20__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_19__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_19__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_19__write),
    .fifo_A_s_dout(fifo_A_Serpens_19__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_19__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_19__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_19__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_19__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_19__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_19__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_19__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_19__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_19__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_20__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_20__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_20__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_19__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_19__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_19__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_20
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_20__ap_start),
    .ap_done(PEG_Xvec_20__ap_done),
    .ap_idle(PEG_Xvec_20__ap_idle),
    .ap_ready(PEG_Xvec_20__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Serpens_20__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_20__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_20__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_20__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_20__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_21__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_21__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_21__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_20__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_20__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_20__write),
    .fifo_A_s_dout(fifo_A_Serpens_20__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_20__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_20__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_20__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_20__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_20__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_20__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_20__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_20__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_20__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_21__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_21__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_21__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_20__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_20__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_20__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_21
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_21__ap_start),
    .ap_done(PEG_Xvec_21__ap_done),
    .ap_idle(PEG_Xvec_21__ap_idle),
    .ap_ready(PEG_Xvec_21__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Serpens_21__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_21__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_21__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_21__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_21__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_22__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_22__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_22__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_21__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_21__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_21__write),
    .fifo_A_s_dout(fifo_A_Serpens_21__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_21__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_21__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_21__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_21__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_21__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_21__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_21__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_21__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_21__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_22__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_22__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_22__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_21__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_21__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_21__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_22
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_22__ap_start),
    .ap_done(PEG_Xvec_22__ap_done),
    .ap_idle(PEG_Xvec_22__ap_idle),
    .ap_ready(PEG_Xvec_22__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Serpens_22__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_22__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_22__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_22__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_22__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_23__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_23__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_23__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_22__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_22__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_22__write),
    .fifo_A_s_dout(fifo_A_Serpens_22__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_22__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_22__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_22__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_22__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_22__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_22__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_22__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_22__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_22__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_23__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_23__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_23__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_22__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_22__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_22__write)
  );


  (* keep_hierarchy = "yes" *) PEG_Xvec
  PEG_Xvec_23
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Xvec_23__ap_start),
    .ap_done(PEG_Xvec_23__ap_done),
    .ap_idle(PEG_Xvec_23__ap_idle),
    .ap_ready(PEG_Xvec_23__ap_ready),
    .fifo_inst_in_s_dout(PE_inst_Serpens_23__dout),
    .fifo_inst_in_peek_dout(PE_inst_Serpens_23__dout),
    .fifo_inst_in_s_empty_n(PE_inst_Serpens_23__empty_n),
    .fifo_inst_in_peek_empty_n(PE_inst_Serpens_23__empty_n),
    .fifo_inst_in_s_read(PE_inst_Serpens_23__read),
    .fifo_inst_in_peek_read(),
    .fifo_inst_out_din(PE_inst_Serpens_24__din),
    .fifo_inst_out_full_n(PE_inst_Serpens_24__full_n),
    .fifo_inst_out_write(PE_inst_Serpens_24__write),
    .fifo_inst_out_to_Yvec_din(Yvec_inst_Serpens_23__din),
    .fifo_inst_out_to_Yvec_full_n(Yvec_inst_Serpens_23__full_n),
    .fifo_inst_out_to_Yvec_write(Yvec_inst_Serpens_23__write),
    .fifo_A_s_dout(fifo_A_Serpens_23__dout),
    .fifo_A_peek_dout(fifo_A_Serpens_23__dout),
    .fifo_A_s_empty_n(fifo_A_Serpens_23__empty_n),
    .fifo_A_peek_empty_n(fifo_A_Serpens_23__empty_n),
    .fifo_A_s_read(fifo_A_Serpens_23__read),
    .fifo_A_peek_read(),
    .fifo_X_in_s_dout(fifo_X_pe_Serpens_23__dout),
    .fifo_X_in_peek_dout(fifo_X_pe_Serpens_23__dout),
    .fifo_X_in_s_empty_n(fifo_X_pe_Serpens_23__empty_n),
    .fifo_X_in_peek_empty_n(fifo_X_pe_Serpens_23__empty_n),
    .fifo_X_in_s_read(fifo_X_pe_Serpens_23__read),
    .fifo_X_in_peek_read(),
    .fifo_X_out_din(fifo_X_pe_Serpens_24__din),
    .fifo_X_out_full_n(fifo_X_pe_Serpens_24__full_n),
    .fifo_X_out_write(fifo_X_pe_Serpens_24__write),
    .fifo_aXvec_din(fifo_aXvec_Serpens_23__din),
    .fifo_aXvec_full_n(fifo_aXvec_Serpens_23__full_n),
    .fifo_aXvec_write(fifo_aXvec_Serpens_23__write)
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_0__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_0__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_0__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_0__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_0__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_0__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_0__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_0__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_0__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_0__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_0__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_0__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_0__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_1__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_1__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_1__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_1__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_1__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_1__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_1__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_1__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_1__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_1__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_1__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_1__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_1__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_2__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_2__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_2__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_2__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_2__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_2__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_2__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_2__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_2__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_2__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_2__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_2__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_2__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_3__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_3__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_3__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_3__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_3__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_3__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_3__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_3__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_3__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_3__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_3__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_3__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_3__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_4__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_4__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_4__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_4__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_4__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_4__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_4__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_4__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_4__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_4__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_4__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_4__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_4__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_5__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_5__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_5__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_5__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_5__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_5__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_5__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_5__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_5__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_5__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_5__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_5__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_5__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_6__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_6__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_6__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_6__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_6__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_6__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_6__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_6__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_6__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_6__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_6__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_6__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_6__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_7__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_7__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_7__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_7__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_7__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_7__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_7__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_7__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_7__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_7__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_7__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_7__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_7__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_8__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_8__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_8__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_8__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_8__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_8__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_8__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_8__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_8__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_8__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_8__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_8__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_8__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_9__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_9__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_9__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_9__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_9__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_9__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_9__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_9__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_9__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_9__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_9__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_9__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_9__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_10__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_10__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_10__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_10__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_10__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_10__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_10__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_10__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_10__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_10__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_10__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_10__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_10__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_11__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_11__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_11__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_11__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_11__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_11__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_11__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_11__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_11__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_11__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_11__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_11__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_11__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_12__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_12__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_12__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_12__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_12__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_12__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_12__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_12__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_12__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_12__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_12__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_12__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_12__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_13__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_13__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_13__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_13__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_13__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_13__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_13__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_13__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_13__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_13__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_13__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_13__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_13__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_14__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_14__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_14__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_14__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_14__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_14__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_14__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_14__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_14__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_14__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_14__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_14__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_14__read),
    .fifo_aXvec_peek_read()
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
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_15__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_15__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_15__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_15__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_15__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_15__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_15__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_15__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_15__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_15__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_15__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_15__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_15__read),
    .fifo_aXvec_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_16
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_16__ap_start),
    .ap_done(PEG_Yvec_16__ap_done),
    .ap_idle(PEG_Yvec_16__ap_idle),
    .ap_ready(PEG_Yvec_16__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_16__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_16__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_16__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_16__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_16__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_16__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_16__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_16__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_16__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_16__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_16__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_16__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_16__read),
    .fifo_aXvec_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_17
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_17__ap_start),
    .ap_done(PEG_Yvec_17__ap_done),
    .ap_idle(PEG_Yvec_17__ap_idle),
    .ap_ready(PEG_Yvec_17__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_17__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_17__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_17__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_17__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_17__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_17__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_17__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_17__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_17__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_17__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_17__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_17__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_17__read),
    .fifo_aXvec_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_18
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_18__ap_start),
    .ap_done(PEG_Yvec_18__ap_done),
    .ap_idle(PEG_Yvec_18__ap_idle),
    .ap_ready(PEG_Yvec_18__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_18__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_18__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_18__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_18__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_18__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_18__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_18__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_18__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_18__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_18__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_18__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_18__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_18__read),
    .fifo_aXvec_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_19
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_19__ap_start),
    .ap_done(PEG_Yvec_19__ap_done),
    .ap_idle(PEG_Yvec_19__ap_idle),
    .ap_ready(PEG_Yvec_19__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_19__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_19__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_19__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_19__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_19__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_19__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_19__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_19__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_19__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_19__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_19__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_19__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_19__read),
    .fifo_aXvec_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_20
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_20__ap_start),
    .ap_done(PEG_Yvec_20__ap_done),
    .ap_idle(PEG_Yvec_20__ap_idle),
    .ap_ready(PEG_Yvec_20__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_20__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_20__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_20__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_20__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_20__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_20__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_20__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_20__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_20__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_20__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_20__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_20__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_20__read),
    .fifo_aXvec_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_21
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_21__ap_start),
    .ap_done(PEG_Yvec_21__ap_done),
    .ap_idle(PEG_Yvec_21__ap_idle),
    .ap_ready(PEG_Yvec_21__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_21__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_21__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_21__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_21__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_21__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_21__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_21__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_21__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_21__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_21__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_21__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_21__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_21__read),
    .fifo_aXvec_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_22
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_22__ap_start),
    .ap_done(PEG_Yvec_22__ap_done),
    .ap_idle(PEG_Yvec_22__ap_idle),
    .ap_ready(PEG_Yvec_22__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_22__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_22__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_22__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_22__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_22__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_22__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_22__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_22__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_22__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_22__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_22__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_22__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_22__read),
    .fifo_aXvec_peek_read()
  );


  (* keep_hierarchy = "yes" *) PEG_Yvec
  PEG_Yvec_23
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(PEG_Yvec_23__ap_start),
    .ap_done(PEG_Yvec_23__ap_done),
    .ap_idle(PEG_Yvec_23__ap_idle),
    .ap_ready(PEG_Yvec_23__ap_ready),
    .fifo_inst_in_s_dout(Yvec_inst_Serpens_23__dout),
    .fifo_inst_in_peek_dout(Yvec_inst_Serpens_23__dout),
    .fifo_inst_in_s_empty_n(Yvec_inst_Serpens_23__empty_n),
    .fifo_inst_in_peek_empty_n(Yvec_inst_Serpens_23__empty_n),
    .fifo_inst_in_s_read(Yvec_inst_Serpens_23__read),
    .fifo_inst_in_peek_read(),
    .fifo_Y_out_din(fifo_Y_pe_Serpens_23__din),
    .fifo_Y_out_full_n(fifo_Y_pe_Serpens_23__full_n),
    .fifo_Y_out_write(fifo_Y_pe_Serpens_23__write),
    .fifo_aXvec_s_dout(fifo_aXvec_Serpens_23__dout),
    .fifo_aXvec_peek_dout(fifo_aXvec_Serpens_23__dout),
    .fifo_aXvec_s_empty_n(fifo_aXvec_Serpens_23__empty_n),
    .fifo_aXvec_peek_empty_n(fifo_aXvec_Serpens_23__empty_n),
    .fifo_aXvec_s_read(fifo_aXvec_Serpens_23__read),
    .fifo_aXvec_peek_read()
  );


  (* keep_hierarchy = "yes" *) black_hole_float_v16
  black_hole_float_v16_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(black_hole_float_v16_0__ap_start),
    .ap_done(),
    .ap_idle(),
    .ap_ready(),
    .fifo_in_s_dout(fifo_X_pe_Serpens_24__dout),
    .fifo_in_peek_dout(fifo_X_pe_Serpens_24__dout),
    .fifo_in_s_empty_n(fifo_X_pe_Serpens_24__empty_n),
    .fifo_in_peek_empty_n(fifo_X_pe_Serpens_24__empty_n),
    .fifo_in_s_read(fifo_X_pe_Serpens_24__read),
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
    .fifo_in_s_dout(PE_inst_Serpens_24__dout),
    .fifo_in_peek_dout(PE_inst_Serpens_24__dout),
    .fifo_in_s_empty_n(PE_inst_Serpens_24__empty_n),
    .fifo_in_peek_empty_n(PE_inst_Serpens_24__empty_n),
    .fifo_in_s_read(PE_inst_Serpens_24__read),
    .fifo_in_peek_read()
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
    .P_N(read_A_0___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_0__din),
    .fifo_A_full_n(fifo_A_Serpens_0__full_n),
    .fifo_A_write(fifo_A_Serpens_0__write)
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
    .P_N(read_A_1___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_1__din),
    .fifo_A_full_n(fifo_A_Serpens_1__full_n),
    .fifo_A_write(fifo_A_Serpens_1__write)
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
    .P_N(read_A_2___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_2__din),
    .fifo_A_full_n(fifo_A_Serpens_2__full_n),
    .fifo_A_write(fifo_A_Serpens_2__write)
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
    .P_N(read_A_3___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_3__din),
    .fifo_A_full_n(fifo_A_Serpens_3__full_n),
    .fifo_A_write(fifo_A_Serpens_3__write)
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
    .P_N(read_A_4___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_4__din),
    .fifo_A_full_n(fifo_A_Serpens_4__full_n),
    .fifo_A_write(fifo_A_Serpens_4__write)
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
    .P_N(read_A_5___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_5__din),
    .fifo_A_full_n(fifo_A_Serpens_5__full_n),
    .fifo_A_write(fifo_A_Serpens_5__write)
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
    .P_N(read_A_6___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_6__din),
    .fifo_A_full_n(fifo_A_Serpens_6__full_n),
    .fifo_A_write(fifo_A_Serpens_6__write)
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
    .P_N(read_A_7___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_7__din),
    .fifo_A_full_n(fifo_A_Serpens_7__full_n),
    .fifo_A_write(fifo_A_Serpens_7__write)
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
    .P_N(read_A_8___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_8__din),
    .fifo_A_full_n(fifo_A_Serpens_8__full_n),
    .fifo_A_write(fifo_A_Serpens_8__write)
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
    .P_N(read_A_9___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_9__din),
    .fifo_A_full_n(fifo_A_Serpens_9__full_n),
    .fifo_A_write(fifo_A_Serpens_9__write)
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
    .P_N(read_A_10___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_10__din),
    .fifo_A_full_n(fifo_A_Serpens_10__full_n),
    .fifo_A_write(fifo_A_Serpens_10__write)
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
    .P_N(read_A_11___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_11__din),
    .fifo_A_full_n(fifo_A_Serpens_11__full_n),
    .fifo_A_write(fifo_A_Serpens_11__write)
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
    .P_N(read_A_12___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_12__din),
    .fifo_A_full_n(fifo_A_Serpens_12__full_n),
    .fifo_A_write(fifo_A_Serpens_12__write)
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
    .P_N(read_A_13___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_13__din),
    .fifo_A_full_n(fifo_A_Serpens_13__full_n),
    .fifo_A_write(fifo_A_Serpens_13__write)
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
    .P_N(read_A_14___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_14__din),
    .fifo_A_full_n(fifo_A_Serpens_14__full_n),
    .fifo_A_write(fifo_A_Serpens_14__write)
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
    .P_N(read_A_15___P_N__q0),
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
    .fifo_A_din(fifo_A_Serpens_15__din),
    .fifo_A_full_n(fifo_A_Serpens_15__full_n),
    .fifo_A_write(fifo_A_Serpens_15__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_16
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_16__ap_start),
    .ap_done(read_A_16__ap_done),
    .ap_idle(read_A_16__ap_idle),
    .ap_ready(read_A_16__ap_ready),
    .A_len(read_A_16___NUM_A_LEN__q0),
    .P_N(read_A_16___P_N__q0),
    .A_read_addr_din(edge_list_ch_16_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_16_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_16_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_16_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_16_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_16_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_16_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_16_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_16_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_16_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_16_write_addr__write),
    .A_write_data_din(edge_list_ch_16_write_data__din),
    .A_write_data_full_n(edge_list_ch_16_write_data__full_n),
    .A_write_data_write(edge_list_ch_16_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_16_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_16_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_16_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_16_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_16_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Serpens_16__din),
    .fifo_A_full_n(fifo_A_Serpens_16__full_n),
    .fifo_A_write(fifo_A_Serpens_16__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_17
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_17__ap_start),
    .ap_done(read_A_17__ap_done),
    .ap_idle(read_A_17__ap_idle),
    .ap_ready(read_A_17__ap_ready),
    .A_len(read_A_17___NUM_A_LEN__q0),
    .P_N(read_A_17___P_N__q0),
    .A_read_addr_din(edge_list_ch_17_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_17_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_17_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_17_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_17_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_17_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_17_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_17_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_17_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_17_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_17_write_addr__write),
    .A_write_data_din(edge_list_ch_17_write_data__din),
    .A_write_data_full_n(edge_list_ch_17_write_data__full_n),
    .A_write_data_write(edge_list_ch_17_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_17_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_17_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_17_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_17_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_17_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Serpens_17__din),
    .fifo_A_full_n(fifo_A_Serpens_17__full_n),
    .fifo_A_write(fifo_A_Serpens_17__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_18
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_18__ap_start),
    .ap_done(read_A_18__ap_done),
    .ap_idle(read_A_18__ap_idle),
    .ap_ready(read_A_18__ap_ready),
    .A_len(read_A_18___NUM_A_LEN__q0),
    .P_N(read_A_18___P_N__q0),
    .A_read_addr_din(edge_list_ch_18_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_18_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_18_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_18_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_18_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_18_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_18_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_18_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_18_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_18_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_18_write_addr__write),
    .A_write_data_din(edge_list_ch_18_write_data__din),
    .A_write_data_full_n(edge_list_ch_18_write_data__full_n),
    .A_write_data_write(edge_list_ch_18_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_18_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_18_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_18_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_18_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_18_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Serpens_18__din),
    .fifo_A_full_n(fifo_A_Serpens_18__full_n),
    .fifo_A_write(fifo_A_Serpens_18__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_19
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_19__ap_start),
    .ap_done(read_A_19__ap_done),
    .ap_idle(read_A_19__ap_idle),
    .ap_ready(read_A_19__ap_ready),
    .A_len(read_A_19___NUM_A_LEN__q0),
    .P_N(read_A_19___P_N__q0),
    .A_read_addr_din(edge_list_ch_19_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_19_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_19_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_19_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_19_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_19_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_19_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_19_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_19_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_19_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_19_write_addr__write),
    .A_write_data_din(edge_list_ch_19_write_data__din),
    .A_write_data_full_n(edge_list_ch_19_write_data__full_n),
    .A_write_data_write(edge_list_ch_19_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_19_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_19_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_19_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_19_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_19_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Serpens_19__din),
    .fifo_A_full_n(fifo_A_Serpens_19__full_n),
    .fifo_A_write(fifo_A_Serpens_19__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_20
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_20__ap_start),
    .ap_done(read_A_20__ap_done),
    .ap_idle(read_A_20__ap_idle),
    .ap_ready(read_A_20__ap_ready),
    .A_len(read_A_20___NUM_A_LEN__q0),
    .P_N(read_A_20___P_N__q0),
    .A_read_addr_din(edge_list_ch_20_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_20_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_20_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_20_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_20_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_20_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_20_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_20_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_20_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_20_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_20_write_addr__write),
    .A_write_data_din(edge_list_ch_20_write_data__din),
    .A_write_data_full_n(edge_list_ch_20_write_data__full_n),
    .A_write_data_write(edge_list_ch_20_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_20_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_20_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_20_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_20_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_20_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Serpens_20__din),
    .fifo_A_full_n(fifo_A_Serpens_20__full_n),
    .fifo_A_write(fifo_A_Serpens_20__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_21
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_21__ap_start),
    .ap_done(read_A_21__ap_done),
    .ap_idle(read_A_21__ap_idle),
    .ap_ready(read_A_21__ap_ready),
    .A_len(read_A_21___NUM_A_LEN__q0),
    .P_N(read_A_21___P_N__q0),
    .A_read_addr_din(edge_list_ch_21_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_21_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_21_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_21_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_21_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_21_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_21_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_21_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_21_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_21_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_21_write_addr__write),
    .A_write_data_din(edge_list_ch_21_write_data__din),
    .A_write_data_full_n(edge_list_ch_21_write_data__full_n),
    .A_write_data_write(edge_list_ch_21_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_21_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_21_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_21_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_21_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_21_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Serpens_21__din),
    .fifo_A_full_n(fifo_A_Serpens_21__full_n),
    .fifo_A_write(fifo_A_Serpens_21__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_22
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_22__ap_start),
    .ap_done(read_A_22__ap_done),
    .ap_idle(read_A_22__ap_idle),
    .ap_ready(read_A_22__ap_ready),
    .A_len(read_A_22___NUM_A_LEN__q0),
    .P_N(read_A_22___P_N__q0),
    .A_read_addr_din(edge_list_ch_22_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_22_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_22_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_22_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_22_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_22_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_22_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_22_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_22_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_22_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_22_write_addr__write),
    .A_write_data_din(edge_list_ch_22_write_data__din),
    .A_write_data_full_n(edge_list_ch_22_write_data__full_n),
    .A_write_data_write(edge_list_ch_22_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_22_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_22_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_22_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_22_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_22_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Serpens_22__din),
    .fifo_A_full_n(fifo_A_Serpens_22__full_n),
    .fifo_A_write(fifo_A_Serpens_22__write)
  );


  (* keep_hierarchy = "yes" *) read_A
  read_A_23
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_A_23__ap_start),
    .ap_done(read_A_23__ap_done),
    .ap_idle(read_A_23__ap_idle),
    .ap_ready(read_A_23__ap_ready),
    .A_len(read_A_23___NUM_A_LEN__q0),
    .P_N(read_A_23___P_N__q0),
    .A_read_addr_din(edge_list_ch_23_read_addr__din),
    .A_read_addr_full_n(edge_list_ch_23_read_addr__full_n),
    .A_read_addr_write(edge_list_ch_23_read_addr__write),
    .A_read_data_s_dout({1'b0, edge_list_ch_23_read_data__dout}),
    .A_read_data_peek_dout({1'b0, edge_list_ch_23_read_data__dout}),
    .A_read_data_s_empty_n(edge_list_ch_23_read_data__empty_n),
    .A_read_data_peek_empty_n(edge_list_ch_23_read_data__empty_n),
    .A_read_data_s_read(edge_list_ch_23_read_data__read),
    .A_read_data_peek_read(),
    .A_write_addr_din(edge_list_ch_23_write_addr__din),
    .A_write_addr_full_n(edge_list_ch_23_write_addr__full_n),
    .A_write_addr_write(edge_list_ch_23_write_addr__write),
    .A_write_data_din(edge_list_ch_23_write_data__din),
    .A_write_data_full_n(edge_list_ch_23_write_data__full_n),
    .A_write_data_write(edge_list_ch_23_write_data__write),
    .A_write_resp_s_dout({1'b0, edge_list_ch_23_write_resp__dout}),
    .A_write_resp_peek_dout({1'b0, edge_list_ch_23_write_resp__dout}),
    .A_write_resp_s_empty_n(edge_list_ch_23_write_resp__empty_n),
    .A_write_resp_peek_empty_n(edge_list_ch_23_write_resp__empty_n),
    .A_write_resp_s_read(edge_list_ch_23_write_resp__read),
    .A_write_resp_peek_read(),
    .fifo_A_din(fifo_A_Serpens_23__din),
    .fifo_A_full_n(fifo_A_Serpens_23__full_n),
    .fifo_A_write(fifo_A_Serpens_23__write)
  );


  (* keep_hierarchy = "yes" *) read_X
  read_X_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_X_0__ap_start),
    .ap_done(read_X_0__ap_done),
    .ap_idle(read_X_0__ap_idle),
    .ap_ready(read_X_0__ap_ready),
    .K(read_X_0___K__q0),
    .P_N(read_X_0___P_N__q0),
    .fifo_X_din(fifo_X_pe_Serpens_0__din),
    .fifo_X_full_n(fifo_X_pe_Serpens_0__full_n),
    .fifo_X_write(fifo_X_pe_Serpens_0__write),
    .vec_X_read_addr_din(vec_X_read_addr__din),
    .vec_X_read_addr_full_n(vec_X_read_addr__full_n),
    .vec_X_read_addr_write(vec_X_read_addr__write),
    .vec_X_read_data_s_dout({1'b0, vec_X_read_data__dout}),
    .vec_X_read_data_peek_dout({1'b0, vec_X_read_data__dout}),
    .vec_X_read_data_s_empty_n(vec_X_read_data__empty_n),
    .vec_X_read_data_peek_empty_n(vec_X_read_data__empty_n),
    .vec_X_read_data_s_read(vec_X_read_data__read),
    .vec_X_read_data_peek_read(),
    .vec_X_write_addr_din(vec_X_write_addr__din),
    .vec_X_write_addr_full_n(vec_X_write_addr__full_n),
    .vec_X_write_addr_write(vec_X_write_addr__write),
    .vec_X_write_data_din(vec_X_write_data__din),
    .vec_X_write_data_full_n(vec_X_write_data__full_n),
    .vec_X_write_data_write(vec_X_write_data__write),
    .vec_X_write_resp_s_dout({1'b0, vec_X_write_resp__dout}),
    .vec_X_write_resp_peek_dout({1'b0, vec_X_write_resp__dout}),
    .vec_X_write_resp_s_empty_n(vec_X_write_resp__empty_n),
    .vec_X_write_resp_peek_empty_n(vec_X_write_resp__empty_n),
    .vec_X_write_resp_s_read(vec_X_write_resp__read),
    .vec_X_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) read_Y
  read_Y_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(read_Y_0__ap_start),
    .ap_done(read_Y_0__ap_done),
    .ap_idle(read_Y_0__ap_idle),
    .ap_ready(read_Y_0__ap_ready),
    .M(read_Y_0___M__q0),
    .P_N(read_Y_0___P_N__q0),
    .fifo_Y_din(fifo_Y_in_Serpens__din),
    .fifo_Y_full_n(fifo_Y_in_Serpens__full_n),
    .fifo_Y_write(fifo_Y_in_Serpens__write),
    .Y_read_addr_din(vec_Y_read_addr__din),
    .Y_read_addr_full_n(vec_Y_read_addr__full_n),
    .Y_read_addr_write(vec_Y_read_addr__write),
    .Y_read_data_s_dout({1'b0, vec_Y_read_data__dout}),
    .Y_read_data_peek_dout({1'b0, vec_Y_read_data__dout}),
    .Y_read_data_s_empty_n(vec_Y_read_data__empty_n),
    .Y_read_data_peek_empty_n(vec_Y_read_data__empty_n),
    .Y_read_data_s_read(vec_Y_read_data__read),
    .Y_read_data_peek_read(),
    .Y_write_addr_din(vec_Y_write_addr__din),
    .Y_write_addr_full_n(vec_Y_write_addr__full_n),
    .Y_write_addr_write(vec_Y_write_addr__write),
    .Y_write_data_din(vec_Y_write_data__din),
    .Y_write_data_full_n(vec_Y_write_data__full_n),
    .Y_write_data_write(vec_Y_write_data__write),
    .Y_write_resp_s_dout({1'b0, vec_Y_write_resp__dout}),
    .Y_write_resp_peek_dout({1'b0, vec_Y_write_resp__dout}),
    .Y_write_resp_s_empty_n(vec_Y_write_resp__empty_n),
    .Y_write_resp_peek_empty_n(vec_Y_write_resp__empty_n),
    .Y_write_resp_s_read(vec_Y_write_resp__read),
    .Y_write_resp_peek_read()
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
    .K(read_edge_list_ptr_0___K__q0),
    .M(read_edge_list_ptr_0___M__q0),
    .num_ite(read_edge_list_ptr_0___NUM_ITE__q0),
    .PE_inst_din(PE_inst_Serpens_0__din),
    .PE_inst_full_n(PE_inst_Serpens_0__full_n),
    .PE_inst_write(PE_inst_Serpens_0__write),
    .P_N(read_edge_list_ptr_0___P_N__q0),
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
    .edge_list_ptr_write_resp_peek_read()
  );


  (* keep_hierarchy = "yes" *) write_Y
  write_Y_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(write_Y_0__ap_start),
    .ap_done(write_Y_0__ap_done),
    .ap_idle(write_Y_0__ap_idle),
    .ap_ready(write_Y_0__ap_ready),
    .M(write_Y_0___M__q0),
    .P_N(write_Y_0___P_N__q0),
    .fifo_Y_s_dout(fifo_Y_out_Serpens__dout),
    .fifo_Y_peek_dout(fifo_Y_out_Serpens__dout),
    .fifo_Y_s_empty_n(fifo_Y_out_Serpens__empty_n),
    .fifo_Y_peek_empty_n(fifo_Y_out_Serpens__empty_n),
    .fifo_Y_s_read(fifo_Y_out_Serpens__read),
    .fifo_Y_peek_read(),
    .Y_out_read_addr_din(vec_Y_out_read_addr__din),
    .Y_out_read_addr_full_n(vec_Y_out_read_addr__full_n),
    .Y_out_read_addr_write(vec_Y_out_read_addr__write),
    .Y_out_read_data_s_dout({1'b0, vec_Y_out_read_data__dout}),
    .Y_out_read_data_peek_dout({1'b0, vec_Y_out_read_data__dout}),
    .Y_out_read_data_s_empty_n(vec_Y_out_read_data__empty_n),
    .Y_out_read_data_peek_empty_n(vec_Y_out_read_data__empty_n),
    .Y_out_read_data_s_read(vec_Y_out_read_data__read),
    .Y_out_read_data_peek_read(),
    .Y_out_write_addr_din(vec_Y_out_write_addr__din),
    .Y_out_write_addr_full_n(vec_Y_out_write_addr__full_n),
    .Y_out_write_addr_write(vec_Y_out_write_addr__write),
    .Y_out_write_data_din(vec_Y_out_write_data__din),
    .Y_out_write_data_full_n(vec_Y_out_write_data__full_n),
    .Y_out_write_data_write(vec_Y_out_write_data__write),
    .Y_out_write_resp_s_dout({1'b0, vec_Y_out_write_resp__dout}),
    .Y_out_write_resp_peek_dout({1'b0, vec_Y_out_write_resp__dout}),
    .Y_out_write_resp_s_empty_n(vec_Y_out_write_resp__empty_n),
    .Y_out_write_resp_peek_empty_n(vec_Y_out_write_resp__empty_n),
    .Y_out_write_resp_s_read(vec_Y_out_write_resp__read),
    .Y_out_write_resp_peek_read()
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
  edge_list_ch_16__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_16___edge_list_ch_16__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_16_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_16_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_16_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_16_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_16_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_16_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_16_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_16_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_16_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_16_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_16_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_16_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_16_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_16_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_16_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_16_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_16_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_16_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_16_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_16_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_16_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_16_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_16_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_16_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_16_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_16_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_16_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_16_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_16_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_16_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_16_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_16_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_16_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_16_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_16_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_16_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_16_WVALID),
    .read_addr_din(edge_list_ch_16_read_addr__din),
    .read_addr_full_n(edge_list_ch_16_read_addr__full_n),
    .read_addr_write(edge_list_ch_16_read_addr__write),
    .read_data_dout(edge_list_ch_16_read_data__dout),
    .read_data_empty_n(edge_list_ch_16_read_data__empty_n),
    .read_data_read(edge_list_ch_16_read_data__read),
    .write_addr_din(edge_list_ch_16_write_addr__din),
    .write_addr_full_n(edge_list_ch_16_write_addr__full_n),
    .write_addr_write(edge_list_ch_16_write_addr__write),
    .write_data_din(edge_list_ch_16_write_data__din),
    .write_data_full_n(edge_list_ch_16_write_data__full_n),
    .write_data_write(edge_list_ch_16_write_data__write),
    .write_resp_dout(edge_list_ch_16_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_16_write_resp__empty_n),
    .write_resp_read(edge_list_ch_16_write_resp__read)
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
  edge_list_ch_17__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_17___edge_list_ch_17__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_17_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_17_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_17_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_17_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_17_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_17_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_17_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_17_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_17_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_17_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_17_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_17_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_17_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_17_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_17_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_17_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_17_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_17_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_17_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_17_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_17_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_17_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_17_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_17_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_17_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_17_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_17_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_17_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_17_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_17_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_17_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_17_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_17_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_17_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_17_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_17_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_17_WVALID),
    .read_addr_din(edge_list_ch_17_read_addr__din),
    .read_addr_full_n(edge_list_ch_17_read_addr__full_n),
    .read_addr_write(edge_list_ch_17_read_addr__write),
    .read_data_dout(edge_list_ch_17_read_data__dout),
    .read_data_empty_n(edge_list_ch_17_read_data__empty_n),
    .read_data_read(edge_list_ch_17_read_data__read),
    .write_addr_din(edge_list_ch_17_write_addr__din),
    .write_addr_full_n(edge_list_ch_17_write_addr__full_n),
    .write_addr_write(edge_list_ch_17_write_addr__write),
    .write_data_din(edge_list_ch_17_write_data__din),
    .write_data_full_n(edge_list_ch_17_write_data__full_n),
    .write_data_write(edge_list_ch_17_write_data__write),
    .write_resp_dout(edge_list_ch_17_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_17_write_resp__empty_n),
    .write_resp_read(edge_list_ch_17_write_resp__read)
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
  edge_list_ch_18__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_18___edge_list_ch_18__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_18_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_18_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_18_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_18_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_18_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_18_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_18_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_18_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_18_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_18_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_18_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_18_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_18_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_18_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_18_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_18_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_18_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_18_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_18_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_18_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_18_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_18_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_18_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_18_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_18_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_18_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_18_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_18_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_18_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_18_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_18_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_18_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_18_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_18_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_18_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_18_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_18_WVALID),
    .read_addr_din(edge_list_ch_18_read_addr__din),
    .read_addr_full_n(edge_list_ch_18_read_addr__full_n),
    .read_addr_write(edge_list_ch_18_read_addr__write),
    .read_data_dout(edge_list_ch_18_read_data__dout),
    .read_data_empty_n(edge_list_ch_18_read_data__empty_n),
    .read_data_read(edge_list_ch_18_read_data__read),
    .write_addr_din(edge_list_ch_18_write_addr__din),
    .write_addr_full_n(edge_list_ch_18_write_addr__full_n),
    .write_addr_write(edge_list_ch_18_write_addr__write),
    .write_data_din(edge_list_ch_18_write_data__din),
    .write_data_full_n(edge_list_ch_18_write_data__full_n),
    .write_data_write(edge_list_ch_18_write_data__write),
    .write_resp_dout(edge_list_ch_18_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_18_write_resp__empty_n),
    .write_resp_read(edge_list_ch_18_write_resp__read)
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
  edge_list_ch_19__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_19___edge_list_ch_19__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_19_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_19_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_19_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_19_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_19_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_19_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_19_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_19_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_19_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_19_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_19_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_19_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_19_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_19_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_19_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_19_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_19_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_19_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_19_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_19_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_19_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_19_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_19_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_19_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_19_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_19_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_19_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_19_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_19_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_19_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_19_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_19_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_19_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_19_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_19_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_19_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_19_WVALID),
    .read_addr_din(edge_list_ch_19_read_addr__din),
    .read_addr_full_n(edge_list_ch_19_read_addr__full_n),
    .read_addr_write(edge_list_ch_19_read_addr__write),
    .read_data_dout(edge_list_ch_19_read_data__dout),
    .read_data_empty_n(edge_list_ch_19_read_data__empty_n),
    .read_data_read(edge_list_ch_19_read_data__read),
    .write_addr_din(edge_list_ch_19_write_addr__din),
    .write_addr_full_n(edge_list_ch_19_write_addr__full_n),
    .write_addr_write(edge_list_ch_19_write_addr__write),
    .write_data_din(edge_list_ch_19_write_data__din),
    .write_data_full_n(edge_list_ch_19_write_data__full_n),
    .write_data_write(edge_list_ch_19_write_data__write),
    .write_resp_dout(edge_list_ch_19_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_19_write_resp__empty_n),
    .write_resp_read(edge_list_ch_19_write_resp__read)
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
  edge_list_ch_20__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_20___edge_list_ch_20__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_20_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_20_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_20_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_20_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_20_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_20_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_20_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_20_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_20_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_20_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_20_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_20_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_20_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_20_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_20_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_20_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_20_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_20_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_20_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_20_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_20_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_20_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_20_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_20_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_20_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_20_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_20_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_20_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_20_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_20_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_20_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_20_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_20_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_20_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_20_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_20_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_20_WVALID),
    .read_addr_din(edge_list_ch_20_read_addr__din),
    .read_addr_full_n(edge_list_ch_20_read_addr__full_n),
    .read_addr_write(edge_list_ch_20_read_addr__write),
    .read_data_dout(edge_list_ch_20_read_data__dout),
    .read_data_empty_n(edge_list_ch_20_read_data__empty_n),
    .read_data_read(edge_list_ch_20_read_data__read),
    .write_addr_din(edge_list_ch_20_write_addr__din),
    .write_addr_full_n(edge_list_ch_20_write_addr__full_n),
    .write_addr_write(edge_list_ch_20_write_addr__write),
    .write_data_din(edge_list_ch_20_write_data__din),
    .write_data_full_n(edge_list_ch_20_write_data__full_n),
    .write_data_write(edge_list_ch_20_write_data__write),
    .write_resp_dout(edge_list_ch_20_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_20_write_resp__empty_n),
    .write_resp_read(edge_list_ch_20_write_resp__read)
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
  edge_list_ch_21__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_21___edge_list_ch_21__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_21_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_21_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_21_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_21_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_21_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_21_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_21_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_21_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_21_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_21_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_21_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_21_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_21_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_21_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_21_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_21_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_21_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_21_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_21_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_21_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_21_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_21_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_21_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_21_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_21_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_21_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_21_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_21_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_21_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_21_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_21_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_21_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_21_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_21_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_21_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_21_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_21_WVALID),
    .read_addr_din(edge_list_ch_21_read_addr__din),
    .read_addr_full_n(edge_list_ch_21_read_addr__full_n),
    .read_addr_write(edge_list_ch_21_read_addr__write),
    .read_data_dout(edge_list_ch_21_read_data__dout),
    .read_data_empty_n(edge_list_ch_21_read_data__empty_n),
    .read_data_read(edge_list_ch_21_read_data__read),
    .write_addr_din(edge_list_ch_21_write_addr__din),
    .write_addr_full_n(edge_list_ch_21_write_addr__full_n),
    .write_addr_write(edge_list_ch_21_write_addr__write),
    .write_data_din(edge_list_ch_21_write_data__din),
    .write_data_full_n(edge_list_ch_21_write_data__full_n),
    .write_data_write(edge_list_ch_21_write_data__write),
    .write_resp_dout(edge_list_ch_21_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_21_write_resp__empty_n),
    .write_resp_read(edge_list_ch_21_write_resp__read)
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
  edge_list_ch_22__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_22___edge_list_ch_22__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_22_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_22_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_22_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_22_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_22_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_22_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_22_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_22_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_22_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_22_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_22_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_22_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_22_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_22_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_22_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_22_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_22_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_22_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_22_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_22_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_22_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_22_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_22_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_22_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_22_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_22_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_22_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_22_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_22_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_22_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_22_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_22_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_22_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_22_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_22_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_22_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_22_WVALID),
    .read_addr_din(edge_list_ch_22_read_addr__din),
    .read_addr_full_n(edge_list_ch_22_read_addr__full_n),
    .read_addr_write(edge_list_ch_22_read_addr__write),
    .read_data_dout(edge_list_ch_22_read_data__dout),
    .read_data_empty_n(edge_list_ch_22_read_data__empty_n),
    .read_data_read(edge_list_ch_22_read_data__read),
    .write_addr_din(edge_list_ch_22_write_addr__din),
    .write_addr_full_n(edge_list_ch_22_write_addr__full_n),
    .write_addr_write(edge_list_ch_22_write_addr__write),
    .write_data_din(edge_list_ch_22_write_data__din),
    .write_data_full_n(edge_list_ch_22_write_data__full_n),
    .write_data_write(edge_list_ch_22_write_data__write),
    .write_resp_dout(edge_list_ch_22_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_22_write_resp__empty_n),
    .write_resp_read(edge_list_ch_22_write_resp__read)
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
  edge_list_ch_23__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_A_23___edge_list_ch_23__q0),
    .m_axi_ARADDR(m_axi_edge_list_ch_23_ARADDR),
    .m_axi_ARBURST(m_axi_edge_list_ch_23_ARBURST),
    .m_axi_ARCACHE(m_axi_edge_list_ch_23_ARCACHE),
    .m_axi_ARID(m_axi_edge_list_ch_23_ARID),
    .m_axi_ARLEN(m_axi_edge_list_ch_23_ARLEN),
    .m_axi_ARLOCK(m_axi_edge_list_ch_23_ARLOCK),
    .m_axi_ARPROT(m_axi_edge_list_ch_23_ARPROT),
    .m_axi_ARQOS(m_axi_edge_list_ch_23_ARQOS),
    .m_axi_ARREADY(m_axi_edge_list_ch_23_ARREADY),
    .m_axi_ARSIZE(m_axi_edge_list_ch_23_ARSIZE),
    .m_axi_ARVALID(m_axi_edge_list_ch_23_ARVALID),
    .m_axi_AWADDR(m_axi_edge_list_ch_23_AWADDR),
    .m_axi_AWBURST(m_axi_edge_list_ch_23_AWBURST),
    .m_axi_AWCACHE(m_axi_edge_list_ch_23_AWCACHE),
    .m_axi_AWID(m_axi_edge_list_ch_23_AWID),
    .m_axi_AWLEN(m_axi_edge_list_ch_23_AWLEN),
    .m_axi_AWLOCK(m_axi_edge_list_ch_23_AWLOCK),
    .m_axi_AWPROT(m_axi_edge_list_ch_23_AWPROT),
    .m_axi_AWQOS(m_axi_edge_list_ch_23_AWQOS),
    .m_axi_AWREADY(m_axi_edge_list_ch_23_AWREADY),
    .m_axi_AWSIZE(m_axi_edge_list_ch_23_AWSIZE),
    .m_axi_AWVALID(m_axi_edge_list_ch_23_AWVALID),
    .m_axi_BID(m_axi_edge_list_ch_23_BID),
    .m_axi_BREADY(m_axi_edge_list_ch_23_BREADY),
    .m_axi_BRESP(m_axi_edge_list_ch_23_BRESP),
    .m_axi_BVALID(m_axi_edge_list_ch_23_BVALID),
    .m_axi_RDATA(m_axi_edge_list_ch_23_RDATA),
    .m_axi_RID(m_axi_edge_list_ch_23_RID),
    .m_axi_RLAST(m_axi_edge_list_ch_23_RLAST),
    .m_axi_RREADY(m_axi_edge_list_ch_23_RREADY),
    .m_axi_RRESP(m_axi_edge_list_ch_23_RRESP),
    .m_axi_RVALID(m_axi_edge_list_ch_23_RVALID),
    .m_axi_WDATA(m_axi_edge_list_ch_23_WDATA),
    .m_axi_WLAST(m_axi_edge_list_ch_23_WLAST),
    .m_axi_WREADY(m_axi_edge_list_ch_23_WREADY),
    .m_axi_WSTRB(m_axi_edge_list_ch_23_WSTRB),
    .m_axi_WVALID(m_axi_edge_list_ch_23_WVALID),
    .read_addr_din(edge_list_ch_23_read_addr__din),
    .read_addr_full_n(edge_list_ch_23_read_addr__full_n),
    .read_addr_write(edge_list_ch_23_read_addr__write),
    .read_data_dout(edge_list_ch_23_read_data__dout),
    .read_data_empty_n(edge_list_ch_23_read_data__empty_n),
    .read_data_read(edge_list_ch_23_read_data__read),
    .write_addr_din(edge_list_ch_23_write_addr__din),
    .write_addr_full_n(edge_list_ch_23_write_addr__full_n),
    .write_addr_write(edge_list_ch_23_write_addr__write),
    .write_data_din(edge_list_ch_23_write_data__din),
    .write_data_full_n(edge_list_ch_23_write_data__full_n),
    .write_data_write(edge_list_ch_23_write_data__write),
    .write_resp_dout(edge_list_ch_23_write_resp__dout),
    .write_resp_empty_n(edge_list_ch_23_write_resp__empty_n),
    .write_resp_read(edge_list_ch_23_write_resp__read)
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
  vec_X__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_X_0___vec_X__q0),
    .m_axi_ARADDR(m_axi_vec_X_ARADDR),
    .m_axi_ARBURST(m_axi_vec_X_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_X_ARCACHE),
    .m_axi_ARID(m_axi_vec_X_ARID),
    .m_axi_ARLEN(m_axi_vec_X_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_X_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_X_ARPROT),
    .m_axi_ARQOS(m_axi_vec_X_ARQOS),
    .m_axi_ARREADY(m_axi_vec_X_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_X_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_X_ARVALID),
    .m_axi_AWADDR(m_axi_vec_X_AWADDR),
    .m_axi_AWBURST(m_axi_vec_X_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_X_AWCACHE),
    .m_axi_AWID(m_axi_vec_X_AWID),
    .m_axi_AWLEN(m_axi_vec_X_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_X_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_X_AWPROT),
    .m_axi_AWQOS(m_axi_vec_X_AWQOS),
    .m_axi_AWREADY(m_axi_vec_X_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_X_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_X_AWVALID),
    .m_axi_BID(m_axi_vec_X_BID),
    .m_axi_BREADY(m_axi_vec_X_BREADY),
    .m_axi_BRESP(m_axi_vec_X_BRESP),
    .m_axi_BVALID(m_axi_vec_X_BVALID),
    .m_axi_RDATA(m_axi_vec_X_RDATA),
    .m_axi_RID(m_axi_vec_X_RID),
    .m_axi_RLAST(m_axi_vec_X_RLAST),
    .m_axi_RREADY(m_axi_vec_X_RREADY),
    .m_axi_RRESP(m_axi_vec_X_RRESP),
    .m_axi_RVALID(m_axi_vec_X_RVALID),
    .m_axi_WDATA(m_axi_vec_X_WDATA),
    .m_axi_WLAST(m_axi_vec_X_WLAST),
    .m_axi_WREADY(m_axi_vec_X_WREADY),
    .m_axi_WSTRB(m_axi_vec_X_WSTRB),
    .m_axi_WVALID(m_axi_vec_X_WVALID),
    .read_addr_din(vec_X_read_addr__din),
    .read_addr_full_n(vec_X_read_addr__full_n),
    .read_addr_write(vec_X_read_addr__write),
    .read_data_dout(vec_X_read_data__dout),
    .read_data_empty_n(vec_X_read_data__empty_n),
    .read_data_read(vec_X_read_data__read),
    .write_addr_din(vec_X_write_addr__din),
    .write_addr_full_n(vec_X_write_addr__full_n),
    .write_addr_write(vec_X_write_addr__write),
    .write_data_din(vec_X_write_data__din),
    .write_data_full_n(vec_X_write_data__full_n),
    .write_data_write(vec_X_write_data__write),
    .write_resp_dout(vec_X_write_resp__dout),
    .write_resp_empty_n(vec_X_write_resp__empty_n),
    .write_resp_read(vec_X_write_resp__read)
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
  vec_Y__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(read_Y_0___vec_Y__q0),
    .m_axi_ARADDR(m_axi_vec_Y_ARADDR),
    .m_axi_ARBURST(m_axi_vec_Y_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_Y_ARCACHE),
    .m_axi_ARID(m_axi_vec_Y_ARID),
    .m_axi_ARLEN(m_axi_vec_Y_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_Y_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_Y_ARPROT),
    .m_axi_ARQOS(m_axi_vec_Y_ARQOS),
    .m_axi_ARREADY(m_axi_vec_Y_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_Y_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_Y_ARVALID),
    .m_axi_AWADDR(m_axi_vec_Y_AWADDR),
    .m_axi_AWBURST(m_axi_vec_Y_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_Y_AWCACHE),
    .m_axi_AWID(m_axi_vec_Y_AWID),
    .m_axi_AWLEN(m_axi_vec_Y_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_Y_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_Y_AWPROT),
    .m_axi_AWQOS(m_axi_vec_Y_AWQOS),
    .m_axi_AWREADY(m_axi_vec_Y_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_Y_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_Y_AWVALID),
    .m_axi_BID(m_axi_vec_Y_BID),
    .m_axi_BREADY(m_axi_vec_Y_BREADY),
    .m_axi_BRESP(m_axi_vec_Y_BRESP),
    .m_axi_BVALID(m_axi_vec_Y_BVALID),
    .m_axi_RDATA(m_axi_vec_Y_RDATA),
    .m_axi_RID(m_axi_vec_Y_RID),
    .m_axi_RLAST(m_axi_vec_Y_RLAST),
    .m_axi_RREADY(m_axi_vec_Y_RREADY),
    .m_axi_RRESP(m_axi_vec_Y_RRESP),
    .m_axi_RVALID(m_axi_vec_Y_RVALID),
    .m_axi_WDATA(m_axi_vec_Y_WDATA),
    .m_axi_WLAST(m_axi_vec_Y_WLAST),
    .m_axi_WREADY(m_axi_vec_Y_WREADY),
    .m_axi_WSTRB(m_axi_vec_Y_WSTRB),
    .m_axi_WVALID(m_axi_vec_Y_WVALID),
    .read_addr_din(vec_Y_read_addr__din),
    .read_addr_full_n(vec_Y_read_addr__full_n),
    .read_addr_write(vec_Y_read_addr__write),
    .read_data_dout(vec_Y_read_data__dout),
    .read_data_empty_n(vec_Y_read_data__empty_n),
    .read_data_read(vec_Y_read_data__read),
    .write_addr_din(vec_Y_write_addr__din),
    .write_addr_full_n(vec_Y_write_addr__full_n),
    .write_addr_write(vec_Y_write_addr__write),
    .write_data_din(vec_Y_write_data__din),
    .write_data_full_n(vec_Y_write_data__full_n),
    .write_data_write(vec_Y_write_data__write),
    .write_resp_dout(vec_Y_write_resp__dout),
    .write_resp_empty_n(vec_Y_write_resp__empty_n),
    .write_resp_read(vec_Y_write_resp__read)
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
    .DataWidth(512),
    .DataWidthBytesLog(6),
    .AddrWidth(64),
    .WaitTimeWidth(2),
    .MaxWaitTime(3),
    .BurstLenWidth(9),
    .MaxBurstLen(15)
  )
  vec_Y_out__m_axi
  (
    .clk(ap_clk),
    .rst(~ap_rst_n),
    .offset(write_Y_0___vec_Y_out__q0),
    .m_axi_ARADDR(m_axi_vec_Y_out_ARADDR),
    .m_axi_ARBURST(m_axi_vec_Y_out_ARBURST),
    .m_axi_ARCACHE(m_axi_vec_Y_out_ARCACHE),
    .m_axi_ARID(m_axi_vec_Y_out_ARID),
    .m_axi_ARLEN(m_axi_vec_Y_out_ARLEN),
    .m_axi_ARLOCK(m_axi_vec_Y_out_ARLOCK),
    .m_axi_ARPROT(m_axi_vec_Y_out_ARPROT),
    .m_axi_ARQOS(m_axi_vec_Y_out_ARQOS),
    .m_axi_ARREADY(m_axi_vec_Y_out_ARREADY),
    .m_axi_ARSIZE(m_axi_vec_Y_out_ARSIZE),
    .m_axi_ARVALID(m_axi_vec_Y_out_ARVALID),
    .m_axi_AWADDR(m_axi_vec_Y_out_AWADDR),
    .m_axi_AWBURST(m_axi_vec_Y_out_AWBURST),
    .m_axi_AWCACHE(m_axi_vec_Y_out_AWCACHE),
    .m_axi_AWID(m_axi_vec_Y_out_AWID),
    .m_axi_AWLEN(m_axi_vec_Y_out_AWLEN),
    .m_axi_AWLOCK(m_axi_vec_Y_out_AWLOCK),
    .m_axi_AWPROT(m_axi_vec_Y_out_AWPROT),
    .m_axi_AWQOS(m_axi_vec_Y_out_AWQOS),
    .m_axi_AWREADY(m_axi_vec_Y_out_AWREADY),
    .m_axi_AWSIZE(m_axi_vec_Y_out_AWSIZE),
    .m_axi_AWVALID(m_axi_vec_Y_out_AWVALID),
    .m_axi_BID(m_axi_vec_Y_out_BID),
    .m_axi_BREADY(m_axi_vec_Y_out_BREADY),
    .m_axi_BRESP(m_axi_vec_Y_out_BRESP),
    .m_axi_BVALID(m_axi_vec_Y_out_BVALID),
    .m_axi_RDATA(m_axi_vec_Y_out_RDATA),
    .m_axi_RID(m_axi_vec_Y_out_RID),
    .m_axi_RLAST(m_axi_vec_Y_out_RLAST),
    .m_axi_RREADY(m_axi_vec_Y_out_RREADY),
    .m_axi_RRESP(m_axi_vec_Y_out_RRESP),
    .m_axi_RVALID(m_axi_vec_Y_out_RVALID),
    .m_axi_WDATA(m_axi_vec_Y_out_WDATA),
    .m_axi_WLAST(m_axi_vec_Y_out_WLAST),
    .m_axi_WREADY(m_axi_vec_Y_out_WREADY),
    .m_axi_WSTRB(m_axi_vec_Y_out_WSTRB),
    .m_axi_WVALID(m_axi_vec_Y_out_WVALID),
    .read_addr_din(vec_Y_out_read_addr__din),
    .read_addr_full_n(vec_Y_out_read_addr__full_n),
    .read_addr_write(vec_Y_out_read_addr__write),
    .read_data_dout(vec_Y_out_read_data__dout),
    .read_data_empty_n(vec_Y_out_read_data__empty_n),
    .read_data_read(vec_Y_out_read_data__read),
    .write_addr_din(vec_Y_out_write_addr__din),
    .write_addr_full_n(vec_Y_out_write_addr__full_n),
    .write_addr_write(vec_Y_out_write_addr__write),
    .write_data_din(vec_Y_out_write_data__din),
    .write_data_full_n(vec_Y_out_write_data__full_n),
    .write_data_write(vec_Y_out_write_data__write),
    .write_resp_dout(vec_Y_out_write_resp__dout),
    .write_resp_empty_n(vec_Y_out_write_resp__empty_n),
    .write_resp_read(vec_Y_out_write_resp__read)
  );


  (* keep_hierarchy = "yes" *) Serpens_fsm
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
    .FloatvAddFloatv_0__ap_start(FloatvAddFloatv_0__ap_start),
    .FloatvMultConst_0__ap_start(FloatvMultConst_0__ap_start),
    .FloatvMultConst_0__ap_ready(FloatvMultConst_0__ap_ready),
    .FloatvMultConst_0__ap_done(FloatvMultConst_0__ap_done),
    .FloatvMultConst_0__ap_idle(FloatvMultConst_0__ap_idle),
    .FloatvMultConst_1__ap_start(FloatvMultConst_1__ap_start),
    .FloatvMultConst_1__ap_ready(FloatvMultConst_1__ap_ready),
    .FloatvMultConst_1__ap_done(FloatvMultConst_1__ap_done),
    .FloatvMultConst_1__ap_idle(FloatvMultConst_1__ap_idle),
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
    .PEG_Xvec_16__ap_start(PEG_Xvec_16__ap_start),
    .PEG_Xvec_16__ap_ready(PEG_Xvec_16__ap_ready),
    .PEG_Xvec_16__ap_done(PEG_Xvec_16__ap_done),
    .PEG_Xvec_16__ap_idle(PEG_Xvec_16__ap_idle),
    .PEG_Xvec_17__ap_start(PEG_Xvec_17__ap_start),
    .PEG_Xvec_17__ap_ready(PEG_Xvec_17__ap_ready),
    .PEG_Xvec_17__ap_done(PEG_Xvec_17__ap_done),
    .PEG_Xvec_17__ap_idle(PEG_Xvec_17__ap_idle),
    .PEG_Xvec_18__ap_start(PEG_Xvec_18__ap_start),
    .PEG_Xvec_18__ap_ready(PEG_Xvec_18__ap_ready),
    .PEG_Xvec_18__ap_done(PEG_Xvec_18__ap_done),
    .PEG_Xvec_18__ap_idle(PEG_Xvec_18__ap_idle),
    .PEG_Xvec_19__ap_start(PEG_Xvec_19__ap_start),
    .PEG_Xvec_19__ap_ready(PEG_Xvec_19__ap_ready),
    .PEG_Xvec_19__ap_done(PEG_Xvec_19__ap_done),
    .PEG_Xvec_19__ap_idle(PEG_Xvec_19__ap_idle),
    .PEG_Xvec_20__ap_start(PEG_Xvec_20__ap_start),
    .PEG_Xvec_20__ap_ready(PEG_Xvec_20__ap_ready),
    .PEG_Xvec_20__ap_done(PEG_Xvec_20__ap_done),
    .PEG_Xvec_20__ap_idle(PEG_Xvec_20__ap_idle),
    .PEG_Xvec_21__ap_start(PEG_Xvec_21__ap_start),
    .PEG_Xvec_21__ap_ready(PEG_Xvec_21__ap_ready),
    .PEG_Xvec_21__ap_done(PEG_Xvec_21__ap_done),
    .PEG_Xvec_21__ap_idle(PEG_Xvec_21__ap_idle),
    .PEG_Xvec_22__ap_start(PEG_Xvec_22__ap_start),
    .PEG_Xvec_22__ap_ready(PEG_Xvec_22__ap_ready),
    .PEG_Xvec_22__ap_done(PEG_Xvec_22__ap_done),
    .PEG_Xvec_22__ap_idle(PEG_Xvec_22__ap_idle),
    .PEG_Xvec_23__ap_start(PEG_Xvec_23__ap_start),
    .PEG_Xvec_23__ap_ready(PEG_Xvec_23__ap_ready),
    .PEG_Xvec_23__ap_done(PEG_Xvec_23__ap_done),
    .PEG_Xvec_23__ap_idle(PEG_Xvec_23__ap_idle),
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
    .PEG_Yvec_16__ap_start(PEG_Yvec_16__ap_start),
    .PEG_Yvec_16__ap_ready(PEG_Yvec_16__ap_ready),
    .PEG_Yvec_16__ap_done(PEG_Yvec_16__ap_done),
    .PEG_Yvec_16__ap_idle(PEG_Yvec_16__ap_idle),
    .PEG_Yvec_17__ap_start(PEG_Yvec_17__ap_start),
    .PEG_Yvec_17__ap_ready(PEG_Yvec_17__ap_ready),
    .PEG_Yvec_17__ap_done(PEG_Yvec_17__ap_done),
    .PEG_Yvec_17__ap_idle(PEG_Yvec_17__ap_idle),
    .PEG_Yvec_18__ap_start(PEG_Yvec_18__ap_start),
    .PEG_Yvec_18__ap_ready(PEG_Yvec_18__ap_ready),
    .PEG_Yvec_18__ap_done(PEG_Yvec_18__ap_done),
    .PEG_Yvec_18__ap_idle(PEG_Yvec_18__ap_idle),
    .PEG_Yvec_19__ap_start(PEG_Yvec_19__ap_start),
    .PEG_Yvec_19__ap_ready(PEG_Yvec_19__ap_ready),
    .PEG_Yvec_19__ap_done(PEG_Yvec_19__ap_done),
    .PEG_Yvec_19__ap_idle(PEG_Yvec_19__ap_idle),
    .PEG_Yvec_20__ap_start(PEG_Yvec_20__ap_start),
    .PEG_Yvec_20__ap_ready(PEG_Yvec_20__ap_ready),
    .PEG_Yvec_20__ap_done(PEG_Yvec_20__ap_done),
    .PEG_Yvec_20__ap_idle(PEG_Yvec_20__ap_idle),
    .PEG_Yvec_21__ap_start(PEG_Yvec_21__ap_start),
    .PEG_Yvec_21__ap_ready(PEG_Yvec_21__ap_ready),
    .PEG_Yvec_21__ap_done(PEG_Yvec_21__ap_done),
    .PEG_Yvec_21__ap_idle(PEG_Yvec_21__ap_idle),
    .PEG_Yvec_22__ap_start(PEG_Yvec_22__ap_start),
    .PEG_Yvec_22__ap_ready(PEG_Yvec_22__ap_ready),
    .PEG_Yvec_22__ap_done(PEG_Yvec_22__ap_done),
    .PEG_Yvec_22__ap_idle(PEG_Yvec_22__ap_idle),
    .PEG_Yvec_23__ap_start(PEG_Yvec_23__ap_start),
    .PEG_Yvec_23__ap_ready(PEG_Yvec_23__ap_ready),
    .PEG_Yvec_23__ap_done(PEG_Yvec_23__ap_done),
    .PEG_Yvec_23__ap_idle(PEG_Yvec_23__ap_idle),
    .black_hole_float_v16_0__ap_start(black_hole_float_v16_0__ap_start),
    .black_hole_int_0__ap_start(black_hole_int_0__ap_start),
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
    .read_A_16__ap_start(read_A_16__ap_start),
    .read_A_16__ap_ready(read_A_16__ap_ready),
    .read_A_16__ap_done(read_A_16__ap_done),
    .read_A_16__ap_idle(read_A_16__ap_idle),
    .read_A_17__ap_start(read_A_17__ap_start),
    .read_A_17__ap_ready(read_A_17__ap_ready),
    .read_A_17__ap_done(read_A_17__ap_done),
    .read_A_17__ap_idle(read_A_17__ap_idle),
    .read_A_18__ap_start(read_A_18__ap_start),
    .read_A_18__ap_ready(read_A_18__ap_ready),
    .read_A_18__ap_done(read_A_18__ap_done),
    .read_A_18__ap_idle(read_A_18__ap_idle),
    .read_A_19__ap_start(read_A_19__ap_start),
    .read_A_19__ap_ready(read_A_19__ap_ready),
    .read_A_19__ap_done(read_A_19__ap_done),
    .read_A_19__ap_idle(read_A_19__ap_idle),
    .read_A_20__ap_start(read_A_20__ap_start),
    .read_A_20__ap_ready(read_A_20__ap_ready),
    .read_A_20__ap_done(read_A_20__ap_done),
    .read_A_20__ap_idle(read_A_20__ap_idle),
    .read_A_21__ap_start(read_A_21__ap_start),
    .read_A_21__ap_ready(read_A_21__ap_ready),
    .read_A_21__ap_done(read_A_21__ap_done),
    .read_A_21__ap_idle(read_A_21__ap_idle),
    .read_A_22__ap_start(read_A_22__ap_start),
    .read_A_22__ap_ready(read_A_22__ap_ready),
    .read_A_22__ap_done(read_A_22__ap_done),
    .read_A_22__ap_idle(read_A_22__ap_idle),
    .read_A_23__ap_start(read_A_23__ap_start),
    .read_A_23__ap_ready(read_A_23__ap_ready),
    .read_A_23__ap_done(read_A_23__ap_done),
    .read_A_23__ap_idle(read_A_23__ap_idle),
    .read_X_0__ap_start(read_X_0__ap_start),
    .read_X_0__ap_ready(read_X_0__ap_ready),
    .read_X_0__ap_done(read_X_0__ap_done),
    .read_X_0__ap_idle(read_X_0__ap_idle),
    .read_Y_0__ap_start(read_Y_0__ap_start),
    .read_Y_0__ap_ready(read_Y_0__ap_ready),
    .read_Y_0__ap_done(read_Y_0__ap_done),
    .read_Y_0__ap_idle(read_Y_0__ap_idle),
    .read_edge_list_ptr_0__ap_start(read_edge_list_ptr_0__ap_start),
    .read_edge_list_ptr_0__ap_ready(read_edge_list_ptr_0__ap_ready),
    .read_edge_list_ptr_0__ap_done(read_edge_list_ptr_0__ap_done),
    .read_edge_list_ptr_0__ap_idle(read_edge_list_ptr_0__ap_idle),
    .write_Y_0__ap_start(write_Y_0__ap_start),
    .write_Y_0__ap_ready(write_Y_0__ap_ready),
    .write_Y_0__ap_done(write_Y_0__ap_done),
    .write_Y_0__ap_idle(write_Y_0__ap_idle)
  );

  assign ap_rst_n_inv = (~ap_rst_n);
  assign Arbiter_Y_0___M__q0 = M;
  assign Arbiter_Y_0___P_N__q0 = P_N;
  assign Arbiter_Y_1___M__q0 = M;
  assign Arbiter_Y_1___P_N__q0 = P_N;
  assign Arbiter_Y_2___M__q0 = M;
  assign Arbiter_Y_2___P_N__q0 = P_N;
  assign Arbiter_Y_3___M__q0 = M;
  assign Arbiter_Y_3___P_N__q0 = P_N;
  assign Arbiter_Y_4___M__q0 = M;
  assign Arbiter_Y_4___P_N__q0 = P_N;
  assign Arbiter_Y_5___M__q0 = M;
  assign Arbiter_Y_5___P_N__q0 = P_N;
  assign Arbiter_Y_6___M__q0 = M;
  assign Arbiter_Y_6___P_N__q0 = P_N;
  assign Arbiter_Y_7___M__q0 = M;
  assign Arbiter_Y_7___P_N__q0 = P_N;
  assign FloatvMultConst_0___M__q0 = M;
  assign FloatvMultConst_0___P_N__q0 = P_N;
  assign FloatvMultConst_0___alpha_u__q0 = alpha_u;
  assign FloatvMultConst_1___M__q0 = M;
  assign FloatvMultConst_1___P_N__q0 = P_N;
  assign FloatvMultConst_1___beta_u__q0 = beta_u;
  assign read_A_0___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_0___P_N__q0 = P_N;
  assign read_A_0___edge_list_ch_0__q0 = edge_list_ch_0;
  assign read_A_1___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_1___P_N__q0 = P_N;
  assign read_A_1___edge_list_ch_1__q0 = edge_list_ch_1;
  assign read_A_2___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_2___P_N__q0 = P_N;
  assign read_A_2___edge_list_ch_2__q0 = edge_list_ch_2;
  assign read_A_3___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_3___P_N__q0 = P_N;
  assign read_A_3___edge_list_ch_3__q0 = edge_list_ch_3;
  assign read_A_4___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_4___P_N__q0 = P_N;
  assign read_A_4___edge_list_ch_4__q0 = edge_list_ch_4;
  assign read_A_5___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_5___P_N__q0 = P_N;
  assign read_A_5___edge_list_ch_5__q0 = edge_list_ch_5;
  assign read_A_6___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_6___P_N__q0 = P_N;
  assign read_A_6___edge_list_ch_6__q0 = edge_list_ch_6;
  assign read_A_7___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_7___P_N__q0 = P_N;
  assign read_A_7___edge_list_ch_7__q0 = edge_list_ch_7;
  assign read_A_8___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_8___P_N__q0 = P_N;
  assign read_A_8___edge_list_ch_8__q0 = edge_list_ch_8;
  assign read_A_9___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_9___P_N__q0 = P_N;
  assign read_A_9___edge_list_ch_9__q0 = edge_list_ch_9;
  assign read_A_10___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_10___P_N__q0 = P_N;
  assign read_A_10___edge_list_ch_10__q0 = edge_list_ch_10;
  assign read_A_11___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_11___P_N__q0 = P_N;
  assign read_A_11___edge_list_ch_11__q0 = edge_list_ch_11;
  assign read_A_12___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_12___P_N__q0 = P_N;
  assign read_A_12___edge_list_ch_12__q0 = edge_list_ch_12;
  assign read_A_13___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_13___P_N__q0 = P_N;
  assign read_A_13___edge_list_ch_13__q0 = edge_list_ch_13;
  assign read_A_14___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_14___P_N__q0 = P_N;
  assign read_A_14___edge_list_ch_14__q0 = edge_list_ch_14;
  assign read_A_15___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_15___P_N__q0 = P_N;
  assign read_A_15___edge_list_ch_15__q0 = edge_list_ch_15;
  assign read_A_16___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_16___P_N__q0 = P_N;
  assign read_A_16___edge_list_ch_16__q0 = edge_list_ch_16;
  assign read_A_17___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_17___P_N__q0 = P_N;
  assign read_A_17___edge_list_ch_17__q0 = edge_list_ch_17;
  assign read_A_18___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_18___P_N__q0 = P_N;
  assign read_A_18___edge_list_ch_18__q0 = edge_list_ch_18;
  assign read_A_19___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_19___P_N__q0 = P_N;
  assign read_A_19___edge_list_ch_19__q0 = edge_list_ch_19;
  assign read_A_20___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_20___P_N__q0 = P_N;
  assign read_A_20___edge_list_ch_20__q0 = edge_list_ch_20;
  assign read_A_21___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_21___P_N__q0 = P_N;
  assign read_A_21___edge_list_ch_21__q0 = edge_list_ch_21;
  assign read_A_22___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_22___P_N__q0 = P_N;
  assign read_A_22___edge_list_ch_22__q0 = edge_list_ch_22;
  assign read_A_23___NUM_A_LEN__q0 = NUM_A_LEN;
  assign read_A_23___P_N__q0 = P_N;
  assign read_A_23___edge_list_ch_23__q0 = edge_list_ch_23;
  assign read_X_0___K__q0 = K;
  assign read_X_0___P_N__q0 = P_N;
  assign read_X_0___vec_X__q0 = vec_X;
  assign read_Y_0___M__q0 = M;
  assign read_Y_0___P_N__q0 = P_N;
  assign read_Y_0___vec_Y__q0 = vec_Y;
  assign read_edge_list_ptr_0___K__q0 = K;
  assign read_edge_list_ptr_0___M__q0 = M;
  assign read_edge_list_ptr_0___NUM_ITE__q0 = NUM_ITE;
  assign read_edge_list_ptr_0___P_N__q0 = P_N;
  assign read_edge_list_ptr_0___edge_list_ptr__q0 = edge_list_ptr;
  assign write_Y_0___M__q0 = M;
  assign write_Y_0___P_N__q0 = P_N;
  assign write_Y_0___vec_Y_out__q0 = vec_Y_out;

endmodule
