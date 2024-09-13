`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO = "vadd_bw_vadd_bw,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu50-fsvh2104-2-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2066,HLS_SYN_LUT=3752,HLS_VERSION=2022_2}" *)


module vadd_bw
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
  m_axi_rmem0_ARADDR,
  m_axi_rmem0_ARBURST,
  m_axi_rmem0_ARCACHE,
  m_axi_rmem0_ARID,
  m_axi_rmem0_ARLEN,
  m_axi_rmem0_ARLOCK,
  m_axi_rmem0_ARPROT,
  m_axi_rmem0_ARQOS,
  m_axi_rmem0_ARREADY,
  m_axi_rmem0_ARSIZE,
  m_axi_rmem0_ARVALID,
  m_axi_rmem0_AWADDR,
  m_axi_rmem0_AWBURST,
  m_axi_rmem0_AWCACHE,
  m_axi_rmem0_AWID,
  m_axi_rmem0_AWLEN,
  m_axi_rmem0_AWLOCK,
  m_axi_rmem0_AWPROT,
  m_axi_rmem0_AWQOS,
  m_axi_rmem0_AWREADY,
  m_axi_rmem0_AWSIZE,
  m_axi_rmem0_AWVALID,
  m_axi_rmem0_BID,
  m_axi_rmem0_BREADY,
  m_axi_rmem0_BRESP,
  m_axi_rmem0_BVALID,
  m_axi_rmem0_RDATA,
  m_axi_rmem0_RID,
  m_axi_rmem0_RLAST,
  m_axi_rmem0_RREADY,
  m_axi_rmem0_RRESP,
  m_axi_rmem0_RVALID,
  m_axi_rmem0_WDATA,
  m_axi_rmem0_WLAST,
  m_axi_rmem0_WREADY,
  m_axi_rmem0_WSTRB,
  m_axi_rmem0_WVALID,
  m_axi_rmem1_ARADDR,
  m_axi_rmem1_ARBURST,
  m_axi_rmem1_ARCACHE,
  m_axi_rmem1_ARID,
  m_axi_rmem1_ARLEN,
  m_axi_rmem1_ARLOCK,
  m_axi_rmem1_ARPROT,
  m_axi_rmem1_ARQOS,
  m_axi_rmem1_ARREADY,
  m_axi_rmem1_ARSIZE,
  m_axi_rmem1_ARVALID,
  m_axi_rmem1_AWADDR,
  m_axi_rmem1_AWBURST,
  m_axi_rmem1_AWCACHE,
  m_axi_rmem1_AWID,
  m_axi_rmem1_AWLEN,
  m_axi_rmem1_AWLOCK,
  m_axi_rmem1_AWPROT,
  m_axi_rmem1_AWQOS,
  m_axi_rmem1_AWREADY,
  m_axi_rmem1_AWSIZE,
  m_axi_rmem1_AWVALID,
  m_axi_rmem1_BID,
  m_axi_rmem1_BREADY,
  m_axi_rmem1_BRESP,
  m_axi_rmem1_BVALID,
  m_axi_rmem1_RDATA,
  m_axi_rmem1_RID,
  m_axi_rmem1_RLAST,
  m_axi_rmem1_RREADY,
  m_axi_rmem1_RRESP,
  m_axi_rmem1_RVALID,
  m_axi_rmem1_WDATA,
  m_axi_rmem1_WLAST,
  m_axi_rmem1_WREADY,
  m_axi_rmem1_WSTRB,
  m_axi_rmem1_WVALID,
  m_axi_rmem2_ARADDR,
  m_axi_rmem2_ARBURST,
  m_axi_rmem2_ARCACHE,
  m_axi_rmem2_ARID,
  m_axi_rmem2_ARLEN,
  m_axi_rmem2_ARLOCK,
  m_axi_rmem2_ARPROT,
  m_axi_rmem2_ARQOS,
  m_axi_rmem2_ARREADY,
  m_axi_rmem2_ARSIZE,
  m_axi_rmem2_ARVALID,
  m_axi_rmem2_AWADDR,
  m_axi_rmem2_AWBURST,
  m_axi_rmem2_AWCACHE,
  m_axi_rmem2_AWID,
  m_axi_rmem2_AWLEN,
  m_axi_rmem2_AWLOCK,
  m_axi_rmem2_AWPROT,
  m_axi_rmem2_AWQOS,
  m_axi_rmem2_AWREADY,
  m_axi_rmem2_AWSIZE,
  m_axi_rmem2_AWVALID,
  m_axi_rmem2_BID,
  m_axi_rmem2_BREADY,
  m_axi_rmem2_BRESP,
  m_axi_rmem2_BVALID,
  m_axi_rmem2_RDATA,
  m_axi_rmem2_RID,
  m_axi_rmem2_RLAST,
  m_axi_rmem2_RREADY,
  m_axi_rmem2_RRESP,
  m_axi_rmem2_RVALID,
  m_axi_rmem2_WDATA,
  m_axi_rmem2_WLAST,
  m_axi_rmem2_WREADY,
  m_axi_rmem2_WSTRB,
  m_axi_rmem2_WVALID,
  m_axi_rmem3_ARADDR,
  m_axi_rmem3_ARBURST,
  m_axi_rmem3_ARCACHE,
  m_axi_rmem3_ARID,
  m_axi_rmem3_ARLEN,
  m_axi_rmem3_ARLOCK,
  m_axi_rmem3_ARPROT,
  m_axi_rmem3_ARQOS,
  m_axi_rmem3_ARREADY,
  m_axi_rmem3_ARSIZE,
  m_axi_rmem3_ARVALID,
  m_axi_rmem3_AWADDR,
  m_axi_rmem3_AWBURST,
  m_axi_rmem3_AWCACHE,
  m_axi_rmem3_AWID,
  m_axi_rmem3_AWLEN,
  m_axi_rmem3_AWLOCK,
  m_axi_rmem3_AWPROT,
  m_axi_rmem3_AWQOS,
  m_axi_rmem3_AWREADY,
  m_axi_rmem3_AWSIZE,
  m_axi_rmem3_AWVALID,
  m_axi_rmem3_BID,
  m_axi_rmem3_BREADY,
  m_axi_rmem3_BRESP,
  m_axi_rmem3_BVALID,
  m_axi_rmem3_RDATA,
  m_axi_rmem3_RID,
  m_axi_rmem3_RLAST,
  m_axi_rmem3_RREADY,
  m_axi_rmem3_RRESP,
  m_axi_rmem3_RVALID,
  m_axi_rmem3_WDATA,
  m_axi_rmem3_WLAST,
  m_axi_rmem3_WREADY,
  m_axi_rmem3_WSTRB,
  m_axi_rmem3_WVALID,
  m_axi_rmem4_ARADDR,
  m_axi_rmem4_ARBURST,
  m_axi_rmem4_ARCACHE,
  m_axi_rmem4_ARID,
  m_axi_rmem4_ARLEN,
  m_axi_rmem4_ARLOCK,
  m_axi_rmem4_ARPROT,
  m_axi_rmem4_ARQOS,
  m_axi_rmem4_ARREADY,
  m_axi_rmem4_ARSIZE,
  m_axi_rmem4_ARVALID,
  m_axi_rmem4_AWADDR,
  m_axi_rmem4_AWBURST,
  m_axi_rmem4_AWCACHE,
  m_axi_rmem4_AWID,
  m_axi_rmem4_AWLEN,
  m_axi_rmem4_AWLOCK,
  m_axi_rmem4_AWPROT,
  m_axi_rmem4_AWQOS,
  m_axi_rmem4_AWREADY,
  m_axi_rmem4_AWSIZE,
  m_axi_rmem4_AWVALID,
  m_axi_rmem4_BID,
  m_axi_rmem4_BREADY,
  m_axi_rmem4_BRESP,
  m_axi_rmem4_BVALID,
  m_axi_rmem4_RDATA,
  m_axi_rmem4_RID,
  m_axi_rmem4_RLAST,
  m_axi_rmem4_RREADY,
  m_axi_rmem4_RRESP,
  m_axi_rmem4_RVALID,
  m_axi_rmem4_WDATA,
  m_axi_rmem4_WLAST,
  m_axi_rmem4_WREADY,
  m_axi_rmem4_WSTRB,
  m_axi_rmem4_WVALID,
  m_axi_rmem5_ARADDR,
  m_axi_rmem5_ARBURST,
  m_axi_rmem5_ARCACHE,
  m_axi_rmem5_ARID,
  m_axi_rmem5_ARLEN,
  m_axi_rmem5_ARLOCK,
  m_axi_rmem5_ARPROT,
  m_axi_rmem5_ARQOS,
  m_axi_rmem5_ARREADY,
  m_axi_rmem5_ARSIZE,
  m_axi_rmem5_ARVALID,
  m_axi_rmem5_AWADDR,
  m_axi_rmem5_AWBURST,
  m_axi_rmem5_AWCACHE,
  m_axi_rmem5_AWID,
  m_axi_rmem5_AWLEN,
  m_axi_rmem5_AWLOCK,
  m_axi_rmem5_AWPROT,
  m_axi_rmem5_AWQOS,
  m_axi_rmem5_AWREADY,
  m_axi_rmem5_AWSIZE,
  m_axi_rmem5_AWVALID,
  m_axi_rmem5_BID,
  m_axi_rmem5_BREADY,
  m_axi_rmem5_BRESP,
  m_axi_rmem5_BVALID,
  m_axi_rmem5_RDATA,
  m_axi_rmem5_RID,
  m_axi_rmem5_RLAST,
  m_axi_rmem5_RREADY,
  m_axi_rmem5_RRESP,
  m_axi_rmem5_RVALID,
  m_axi_rmem5_WDATA,
  m_axi_rmem5_WLAST,
  m_axi_rmem5_WREADY,
  m_axi_rmem5_WSTRB,
  m_axi_rmem5_WVALID,
  m_axi_rmem6_ARADDR,
  m_axi_rmem6_ARBURST,
  m_axi_rmem6_ARCACHE,
  m_axi_rmem6_ARID,
  m_axi_rmem6_ARLEN,
  m_axi_rmem6_ARLOCK,
  m_axi_rmem6_ARPROT,
  m_axi_rmem6_ARQOS,
  m_axi_rmem6_ARREADY,
  m_axi_rmem6_ARSIZE,
  m_axi_rmem6_ARVALID,
  m_axi_rmem6_AWADDR,
  m_axi_rmem6_AWBURST,
  m_axi_rmem6_AWCACHE,
  m_axi_rmem6_AWID,
  m_axi_rmem6_AWLEN,
  m_axi_rmem6_AWLOCK,
  m_axi_rmem6_AWPROT,
  m_axi_rmem6_AWQOS,
  m_axi_rmem6_AWREADY,
  m_axi_rmem6_AWSIZE,
  m_axi_rmem6_AWVALID,
  m_axi_rmem6_BID,
  m_axi_rmem6_BREADY,
  m_axi_rmem6_BRESP,
  m_axi_rmem6_BVALID,
  m_axi_rmem6_RDATA,
  m_axi_rmem6_RID,
  m_axi_rmem6_RLAST,
  m_axi_rmem6_RREADY,
  m_axi_rmem6_RRESP,
  m_axi_rmem6_RVALID,
  m_axi_rmem6_WDATA,
  m_axi_rmem6_WLAST,
  m_axi_rmem6_WREADY,
  m_axi_rmem6_WSTRB,
  m_axi_rmem6_WVALID,
  m_axi_rmem7_ARADDR,
  m_axi_rmem7_ARBURST,
  m_axi_rmem7_ARCACHE,
  m_axi_rmem7_ARID,
  m_axi_rmem7_ARLEN,
  m_axi_rmem7_ARLOCK,
  m_axi_rmem7_ARPROT,
  m_axi_rmem7_ARQOS,
  m_axi_rmem7_ARREADY,
  m_axi_rmem7_ARSIZE,
  m_axi_rmem7_ARVALID,
  m_axi_rmem7_AWADDR,
  m_axi_rmem7_AWBURST,
  m_axi_rmem7_AWCACHE,
  m_axi_rmem7_AWID,
  m_axi_rmem7_AWLEN,
  m_axi_rmem7_AWLOCK,
  m_axi_rmem7_AWPROT,
  m_axi_rmem7_AWQOS,
  m_axi_rmem7_AWREADY,
  m_axi_rmem7_AWSIZE,
  m_axi_rmem7_AWVALID,
  m_axi_rmem7_BID,
  m_axi_rmem7_BREADY,
  m_axi_rmem7_BRESP,
  m_axi_rmem7_BVALID,
  m_axi_rmem7_RDATA,
  m_axi_rmem7_RID,
  m_axi_rmem7_RLAST,
  m_axi_rmem7_RREADY,
  m_axi_rmem7_RRESP,
  m_axi_rmem7_RVALID,
  m_axi_rmem7_WDATA,
  m_axi_rmem7_WLAST,
  m_axi_rmem7_WREADY,
  m_axi_rmem7_WSTRB,
  m_axi_rmem7_WVALID,
  m_axi_rmem8_ARADDR,
  m_axi_rmem8_ARBURST,
  m_axi_rmem8_ARCACHE,
  m_axi_rmem8_ARID,
  m_axi_rmem8_ARLEN,
  m_axi_rmem8_ARLOCK,
  m_axi_rmem8_ARPROT,
  m_axi_rmem8_ARQOS,
  m_axi_rmem8_ARREADY,
  m_axi_rmem8_ARSIZE,
  m_axi_rmem8_ARVALID,
  m_axi_rmem8_AWADDR,
  m_axi_rmem8_AWBURST,
  m_axi_rmem8_AWCACHE,
  m_axi_rmem8_AWID,
  m_axi_rmem8_AWLEN,
  m_axi_rmem8_AWLOCK,
  m_axi_rmem8_AWPROT,
  m_axi_rmem8_AWQOS,
  m_axi_rmem8_AWREADY,
  m_axi_rmem8_AWSIZE,
  m_axi_rmem8_AWVALID,
  m_axi_rmem8_BID,
  m_axi_rmem8_BREADY,
  m_axi_rmem8_BRESP,
  m_axi_rmem8_BVALID,
  m_axi_rmem8_RDATA,
  m_axi_rmem8_RID,
  m_axi_rmem8_RLAST,
  m_axi_rmem8_RREADY,
  m_axi_rmem8_RRESP,
  m_axi_rmem8_RVALID,
  m_axi_rmem8_WDATA,
  m_axi_rmem8_WLAST,
  m_axi_rmem8_WREADY,
  m_axi_rmem8_WSTRB,
  m_axi_rmem8_WVALID,
  m_axi_rmem9_ARADDR,
  m_axi_rmem9_ARBURST,
  m_axi_rmem9_ARCACHE,
  m_axi_rmem9_ARID,
  m_axi_rmem9_ARLEN,
  m_axi_rmem9_ARLOCK,
  m_axi_rmem9_ARPROT,
  m_axi_rmem9_ARQOS,
  m_axi_rmem9_ARREADY,
  m_axi_rmem9_ARSIZE,
  m_axi_rmem9_ARVALID,
  m_axi_rmem9_AWADDR,
  m_axi_rmem9_AWBURST,
  m_axi_rmem9_AWCACHE,
  m_axi_rmem9_AWID,
  m_axi_rmem9_AWLEN,
  m_axi_rmem9_AWLOCK,
  m_axi_rmem9_AWPROT,
  m_axi_rmem9_AWQOS,
  m_axi_rmem9_AWREADY,
  m_axi_rmem9_AWSIZE,
  m_axi_rmem9_AWVALID,
  m_axi_rmem9_BID,
  m_axi_rmem9_BREADY,
  m_axi_rmem9_BRESP,
  m_axi_rmem9_BVALID,
  m_axi_rmem9_RDATA,
  m_axi_rmem9_RID,
  m_axi_rmem9_RLAST,
  m_axi_rmem9_RREADY,
  m_axi_rmem9_RRESP,
  m_axi_rmem9_RVALID,
  m_axi_rmem9_WDATA,
  m_axi_rmem9_WLAST,
  m_axi_rmem9_WREADY,
  m_axi_rmem9_WSTRB,
  m_axi_rmem9_WVALID,
  m_axi_rmem10_ARADDR,
  m_axi_rmem10_ARBURST,
  m_axi_rmem10_ARCACHE,
  m_axi_rmem10_ARID,
  m_axi_rmem10_ARLEN,
  m_axi_rmem10_ARLOCK,
  m_axi_rmem10_ARPROT,
  m_axi_rmem10_ARQOS,
  m_axi_rmem10_ARREADY,
  m_axi_rmem10_ARSIZE,
  m_axi_rmem10_ARVALID,
  m_axi_rmem10_AWADDR,
  m_axi_rmem10_AWBURST,
  m_axi_rmem10_AWCACHE,
  m_axi_rmem10_AWID,
  m_axi_rmem10_AWLEN,
  m_axi_rmem10_AWLOCK,
  m_axi_rmem10_AWPROT,
  m_axi_rmem10_AWQOS,
  m_axi_rmem10_AWREADY,
  m_axi_rmem10_AWSIZE,
  m_axi_rmem10_AWVALID,
  m_axi_rmem10_BID,
  m_axi_rmem10_BREADY,
  m_axi_rmem10_BRESP,
  m_axi_rmem10_BVALID,
  m_axi_rmem10_RDATA,
  m_axi_rmem10_RID,
  m_axi_rmem10_RLAST,
  m_axi_rmem10_RREADY,
  m_axi_rmem10_RRESP,
  m_axi_rmem10_RVALID,
  m_axi_rmem10_WDATA,
  m_axi_rmem10_WLAST,
  m_axi_rmem10_WREADY,
  m_axi_rmem10_WSTRB,
  m_axi_rmem10_WVALID,
  m_axi_rmem11_ARADDR,
  m_axi_rmem11_ARBURST,
  m_axi_rmem11_ARCACHE,
  m_axi_rmem11_ARID,
  m_axi_rmem11_ARLEN,
  m_axi_rmem11_ARLOCK,
  m_axi_rmem11_ARPROT,
  m_axi_rmem11_ARQOS,
  m_axi_rmem11_ARREADY,
  m_axi_rmem11_ARSIZE,
  m_axi_rmem11_ARVALID,
  m_axi_rmem11_AWADDR,
  m_axi_rmem11_AWBURST,
  m_axi_rmem11_AWCACHE,
  m_axi_rmem11_AWID,
  m_axi_rmem11_AWLEN,
  m_axi_rmem11_AWLOCK,
  m_axi_rmem11_AWPROT,
  m_axi_rmem11_AWQOS,
  m_axi_rmem11_AWREADY,
  m_axi_rmem11_AWSIZE,
  m_axi_rmem11_AWVALID,
  m_axi_rmem11_BID,
  m_axi_rmem11_BREADY,
  m_axi_rmem11_BRESP,
  m_axi_rmem11_BVALID,
  m_axi_rmem11_RDATA,
  m_axi_rmem11_RID,
  m_axi_rmem11_RLAST,
  m_axi_rmem11_RREADY,
  m_axi_rmem11_RRESP,
  m_axi_rmem11_RVALID,
  m_axi_rmem11_WDATA,
  m_axi_rmem11_WLAST,
  m_axi_rmem11_WREADY,
  m_axi_rmem11_WSTRB,
  m_axi_rmem11_WVALID,
  m_axi_rmem12_ARADDR,
  m_axi_rmem12_ARBURST,
  m_axi_rmem12_ARCACHE,
  m_axi_rmem12_ARID,
  m_axi_rmem12_ARLEN,
  m_axi_rmem12_ARLOCK,
  m_axi_rmem12_ARPROT,
  m_axi_rmem12_ARQOS,
  m_axi_rmem12_ARREADY,
  m_axi_rmem12_ARSIZE,
  m_axi_rmem12_ARVALID,
  m_axi_rmem12_AWADDR,
  m_axi_rmem12_AWBURST,
  m_axi_rmem12_AWCACHE,
  m_axi_rmem12_AWID,
  m_axi_rmem12_AWLEN,
  m_axi_rmem12_AWLOCK,
  m_axi_rmem12_AWPROT,
  m_axi_rmem12_AWQOS,
  m_axi_rmem12_AWREADY,
  m_axi_rmem12_AWSIZE,
  m_axi_rmem12_AWVALID,
  m_axi_rmem12_BID,
  m_axi_rmem12_BREADY,
  m_axi_rmem12_BRESP,
  m_axi_rmem12_BVALID,
  m_axi_rmem12_RDATA,
  m_axi_rmem12_RID,
  m_axi_rmem12_RLAST,
  m_axi_rmem12_RREADY,
  m_axi_rmem12_RRESP,
  m_axi_rmem12_RVALID,
  m_axi_rmem12_WDATA,
  m_axi_rmem12_WLAST,
  m_axi_rmem12_WREADY,
  m_axi_rmem12_WSTRB,
  m_axi_rmem12_WVALID,
  m_axi_rmem13_ARADDR,
  m_axi_rmem13_ARBURST,
  m_axi_rmem13_ARCACHE,
  m_axi_rmem13_ARID,
  m_axi_rmem13_ARLEN,
  m_axi_rmem13_ARLOCK,
  m_axi_rmem13_ARPROT,
  m_axi_rmem13_ARQOS,
  m_axi_rmem13_ARREADY,
  m_axi_rmem13_ARSIZE,
  m_axi_rmem13_ARVALID,
  m_axi_rmem13_AWADDR,
  m_axi_rmem13_AWBURST,
  m_axi_rmem13_AWCACHE,
  m_axi_rmem13_AWID,
  m_axi_rmem13_AWLEN,
  m_axi_rmem13_AWLOCK,
  m_axi_rmem13_AWPROT,
  m_axi_rmem13_AWQOS,
  m_axi_rmem13_AWREADY,
  m_axi_rmem13_AWSIZE,
  m_axi_rmem13_AWVALID,
  m_axi_rmem13_BID,
  m_axi_rmem13_BREADY,
  m_axi_rmem13_BRESP,
  m_axi_rmem13_BVALID,
  m_axi_rmem13_RDATA,
  m_axi_rmem13_RID,
  m_axi_rmem13_RLAST,
  m_axi_rmem13_RREADY,
  m_axi_rmem13_RRESP,
  m_axi_rmem13_RVALID,
  m_axi_rmem13_WDATA,
  m_axi_rmem13_WLAST,
  m_axi_rmem13_WREADY,
  m_axi_rmem13_WSTRB,
  m_axi_rmem13_WVALID,
  m_axi_rmem14_ARADDR,
  m_axi_rmem14_ARBURST,
  m_axi_rmem14_ARCACHE,
  m_axi_rmem14_ARID,
  m_axi_rmem14_ARLEN,
  m_axi_rmem14_ARLOCK,
  m_axi_rmem14_ARPROT,
  m_axi_rmem14_ARQOS,
  m_axi_rmem14_ARREADY,
  m_axi_rmem14_ARSIZE,
  m_axi_rmem14_ARVALID,
  m_axi_rmem14_AWADDR,
  m_axi_rmem14_AWBURST,
  m_axi_rmem14_AWCACHE,
  m_axi_rmem14_AWID,
  m_axi_rmem14_AWLEN,
  m_axi_rmem14_AWLOCK,
  m_axi_rmem14_AWPROT,
  m_axi_rmem14_AWQOS,
  m_axi_rmem14_AWREADY,
  m_axi_rmem14_AWSIZE,
  m_axi_rmem14_AWVALID,
  m_axi_rmem14_BID,
  m_axi_rmem14_BREADY,
  m_axi_rmem14_BRESP,
  m_axi_rmem14_BVALID,
  m_axi_rmem14_RDATA,
  m_axi_rmem14_RID,
  m_axi_rmem14_RLAST,
  m_axi_rmem14_RREADY,
  m_axi_rmem14_RRESP,
  m_axi_rmem14_RVALID,
  m_axi_rmem14_WDATA,
  m_axi_rmem14_WLAST,
  m_axi_rmem14_WREADY,
  m_axi_rmem14_WSTRB,
  m_axi_rmem14_WVALID,
  m_axi_rmem15_ARADDR,
  m_axi_rmem15_ARBURST,
  m_axi_rmem15_ARCACHE,
  m_axi_rmem15_ARID,
  m_axi_rmem15_ARLEN,
  m_axi_rmem15_ARLOCK,
  m_axi_rmem15_ARPROT,
  m_axi_rmem15_ARQOS,
  m_axi_rmem15_ARREADY,
  m_axi_rmem15_ARSIZE,
  m_axi_rmem15_ARVALID,
  m_axi_rmem15_AWADDR,
  m_axi_rmem15_AWBURST,
  m_axi_rmem15_AWCACHE,
  m_axi_rmem15_AWID,
  m_axi_rmem15_AWLEN,
  m_axi_rmem15_AWLOCK,
  m_axi_rmem15_AWPROT,
  m_axi_rmem15_AWQOS,
  m_axi_rmem15_AWREADY,
  m_axi_rmem15_AWSIZE,
  m_axi_rmem15_AWVALID,
  m_axi_rmem15_BID,
  m_axi_rmem15_BREADY,
  m_axi_rmem15_BRESP,
  m_axi_rmem15_BVALID,
  m_axi_rmem15_RDATA,
  m_axi_rmem15_RID,
  m_axi_rmem15_RLAST,
  m_axi_rmem15_RREADY,
  m_axi_rmem15_RRESP,
  m_axi_rmem15_RVALID,
  m_axi_rmem15_WDATA,
  m_axi_rmem15_WLAST,
  m_axi_rmem15_WREADY,
  m_axi_rmem15_WSTRB,
  m_axi_rmem15_WVALID,
  m_axi_rmem16_ARADDR,
  m_axi_rmem16_ARBURST,
  m_axi_rmem16_ARCACHE,
  m_axi_rmem16_ARID,
  m_axi_rmem16_ARLEN,
  m_axi_rmem16_ARLOCK,
  m_axi_rmem16_ARPROT,
  m_axi_rmem16_ARQOS,
  m_axi_rmem16_ARREADY,
  m_axi_rmem16_ARSIZE,
  m_axi_rmem16_ARVALID,
  m_axi_rmem16_AWADDR,
  m_axi_rmem16_AWBURST,
  m_axi_rmem16_AWCACHE,
  m_axi_rmem16_AWID,
  m_axi_rmem16_AWLEN,
  m_axi_rmem16_AWLOCK,
  m_axi_rmem16_AWPROT,
  m_axi_rmem16_AWQOS,
  m_axi_rmem16_AWREADY,
  m_axi_rmem16_AWSIZE,
  m_axi_rmem16_AWVALID,
  m_axi_rmem16_BID,
  m_axi_rmem16_BREADY,
  m_axi_rmem16_BRESP,
  m_axi_rmem16_BVALID,
  m_axi_rmem16_RDATA,
  m_axi_rmem16_RID,
  m_axi_rmem16_RLAST,
  m_axi_rmem16_RREADY,
  m_axi_rmem16_RRESP,
  m_axi_rmem16_RVALID,
  m_axi_rmem16_WDATA,
  m_axi_rmem16_WLAST,
  m_axi_rmem16_WREADY,
  m_axi_rmem16_WSTRB,
  m_axi_rmem16_WVALID,
  m_axi_rmem17_ARADDR,
  m_axi_rmem17_ARBURST,
  m_axi_rmem17_ARCACHE,
  m_axi_rmem17_ARID,
  m_axi_rmem17_ARLEN,
  m_axi_rmem17_ARLOCK,
  m_axi_rmem17_ARPROT,
  m_axi_rmem17_ARQOS,
  m_axi_rmem17_ARREADY,
  m_axi_rmem17_ARSIZE,
  m_axi_rmem17_ARVALID,
  m_axi_rmem17_AWADDR,
  m_axi_rmem17_AWBURST,
  m_axi_rmem17_AWCACHE,
  m_axi_rmem17_AWID,
  m_axi_rmem17_AWLEN,
  m_axi_rmem17_AWLOCK,
  m_axi_rmem17_AWPROT,
  m_axi_rmem17_AWQOS,
  m_axi_rmem17_AWREADY,
  m_axi_rmem17_AWSIZE,
  m_axi_rmem17_AWVALID,
  m_axi_rmem17_BID,
  m_axi_rmem17_BREADY,
  m_axi_rmem17_BRESP,
  m_axi_rmem17_BVALID,
  m_axi_rmem17_RDATA,
  m_axi_rmem17_RID,
  m_axi_rmem17_RLAST,
  m_axi_rmem17_RREADY,
  m_axi_rmem17_RRESP,
  m_axi_rmem17_RVALID,
  m_axi_rmem17_WDATA,
  m_axi_rmem17_WLAST,
  m_axi_rmem17_WREADY,
  m_axi_rmem17_WSTRB,
  m_axi_rmem17_WVALID,
  m_axi_rmem18_ARADDR,
  m_axi_rmem18_ARBURST,
  m_axi_rmem18_ARCACHE,
  m_axi_rmem18_ARID,
  m_axi_rmem18_ARLEN,
  m_axi_rmem18_ARLOCK,
  m_axi_rmem18_ARPROT,
  m_axi_rmem18_ARQOS,
  m_axi_rmem18_ARREADY,
  m_axi_rmem18_ARSIZE,
  m_axi_rmem18_ARVALID,
  m_axi_rmem18_AWADDR,
  m_axi_rmem18_AWBURST,
  m_axi_rmem18_AWCACHE,
  m_axi_rmem18_AWID,
  m_axi_rmem18_AWLEN,
  m_axi_rmem18_AWLOCK,
  m_axi_rmem18_AWPROT,
  m_axi_rmem18_AWQOS,
  m_axi_rmem18_AWREADY,
  m_axi_rmem18_AWSIZE,
  m_axi_rmem18_AWVALID,
  m_axi_rmem18_BID,
  m_axi_rmem18_BREADY,
  m_axi_rmem18_BRESP,
  m_axi_rmem18_BVALID,
  m_axi_rmem18_RDATA,
  m_axi_rmem18_RID,
  m_axi_rmem18_RLAST,
  m_axi_rmem18_RREADY,
  m_axi_rmem18_RRESP,
  m_axi_rmem18_RVALID,
  m_axi_rmem18_WDATA,
  m_axi_rmem18_WLAST,
  m_axi_rmem18_WREADY,
  m_axi_rmem18_WSTRB,
  m_axi_rmem18_WVALID,
  m_axi_rmem19_ARADDR,
  m_axi_rmem19_ARBURST,
  m_axi_rmem19_ARCACHE,
  m_axi_rmem19_ARID,
  m_axi_rmem19_ARLEN,
  m_axi_rmem19_ARLOCK,
  m_axi_rmem19_ARPROT,
  m_axi_rmem19_ARQOS,
  m_axi_rmem19_ARREADY,
  m_axi_rmem19_ARSIZE,
  m_axi_rmem19_ARVALID,
  m_axi_rmem19_AWADDR,
  m_axi_rmem19_AWBURST,
  m_axi_rmem19_AWCACHE,
  m_axi_rmem19_AWID,
  m_axi_rmem19_AWLEN,
  m_axi_rmem19_AWLOCK,
  m_axi_rmem19_AWPROT,
  m_axi_rmem19_AWQOS,
  m_axi_rmem19_AWREADY,
  m_axi_rmem19_AWSIZE,
  m_axi_rmem19_AWVALID,
  m_axi_rmem19_BID,
  m_axi_rmem19_BREADY,
  m_axi_rmem19_BRESP,
  m_axi_rmem19_BVALID,
  m_axi_rmem19_RDATA,
  m_axi_rmem19_RID,
  m_axi_rmem19_RLAST,
  m_axi_rmem19_RREADY,
  m_axi_rmem19_RRESP,
  m_axi_rmem19_RVALID,
  m_axi_rmem19_WDATA,
  m_axi_rmem19_WLAST,
  m_axi_rmem19_WREADY,
  m_axi_rmem19_WSTRB,
  m_axi_rmem19_WVALID,
  m_axi_rmem20_ARADDR,
  m_axi_rmem20_ARBURST,
  m_axi_rmem20_ARCACHE,
  m_axi_rmem20_ARID,
  m_axi_rmem20_ARLEN,
  m_axi_rmem20_ARLOCK,
  m_axi_rmem20_ARPROT,
  m_axi_rmem20_ARQOS,
  m_axi_rmem20_ARREADY,
  m_axi_rmem20_ARSIZE,
  m_axi_rmem20_ARVALID,
  m_axi_rmem20_AWADDR,
  m_axi_rmem20_AWBURST,
  m_axi_rmem20_AWCACHE,
  m_axi_rmem20_AWID,
  m_axi_rmem20_AWLEN,
  m_axi_rmem20_AWLOCK,
  m_axi_rmem20_AWPROT,
  m_axi_rmem20_AWQOS,
  m_axi_rmem20_AWREADY,
  m_axi_rmem20_AWSIZE,
  m_axi_rmem20_AWVALID,
  m_axi_rmem20_BID,
  m_axi_rmem20_BREADY,
  m_axi_rmem20_BRESP,
  m_axi_rmem20_BVALID,
  m_axi_rmem20_RDATA,
  m_axi_rmem20_RID,
  m_axi_rmem20_RLAST,
  m_axi_rmem20_RREADY,
  m_axi_rmem20_RRESP,
  m_axi_rmem20_RVALID,
  m_axi_rmem20_WDATA,
  m_axi_rmem20_WLAST,
  m_axi_rmem20_WREADY,
  m_axi_rmem20_WSTRB,
  m_axi_rmem20_WVALID,
  m_axi_rmem21_ARADDR,
  m_axi_rmem21_ARBURST,
  m_axi_rmem21_ARCACHE,
  m_axi_rmem21_ARID,
  m_axi_rmem21_ARLEN,
  m_axi_rmem21_ARLOCK,
  m_axi_rmem21_ARPROT,
  m_axi_rmem21_ARQOS,
  m_axi_rmem21_ARREADY,
  m_axi_rmem21_ARSIZE,
  m_axi_rmem21_ARVALID,
  m_axi_rmem21_AWADDR,
  m_axi_rmem21_AWBURST,
  m_axi_rmem21_AWCACHE,
  m_axi_rmem21_AWID,
  m_axi_rmem21_AWLEN,
  m_axi_rmem21_AWLOCK,
  m_axi_rmem21_AWPROT,
  m_axi_rmem21_AWQOS,
  m_axi_rmem21_AWREADY,
  m_axi_rmem21_AWSIZE,
  m_axi_rmem21_AWVALID,
  m_axi_rmem21_BID,
  m_axi_rmem21_BREADY,
  m_axi_rmem21_BRESP,
  m_axi_rmem21_BVALID,
  m_axi_rmem21_RDATA,
  m_axi_rmem21_RID,
  m_axi_rmem21_RLAST,
  m_axi_rmem21_RREADY,
  m_axi_rmem21_RRESP,
  m_axi_rmem21_RVALID,
  m_axi_rmem21_WDATA,
  m_axi_rmem21_WLAST,
  m_axi_rmem21_WREADY,
  m_axi_rmem21_WSTRB,
  m_axi_rmem21_WVALID,
  m_axi_rmem22_ARADDR,
  m_axi_rmem22_ARBURST,
  m_axi_rmem22_ARCACHE,
  m_axi_rmem22_ARID,
  m_axi_rmem22_ARLEN,
  m_axi_rmem22_ARLOCK,
  m_axi_rmem22_ARPROT,
  m_axi_rmem22_ARQOS,
  m_axi_rmem22_ARREADY,
  m_axi_rmem22_ARSIZE,
  m_axi_rmem22_ARVALID,
  m_axi_rmem22_AWADDR,
  m_axi_rmem22_AWBURST,
  m_axi_rmem22_AWCACHE,
  m_axi_rmem22_AWID,
  m_axi_rmem22_AWLEN,
  m_axi_rmem22_AWLOCK,
  m_axi_rmem22_AWPROT,
  m_axi_rmem22_AWQOS,
  m_axi_rmem22_AWREADY,
  m_axi_rmem22_AWSIZE,
  m_axi_rmem22_AWVALID,
  m_axi_rmem22_BID,
  m_axi_rmem22_BREADY,
  m_axi_rmem22_BRESP,
  m_axi_rmem22_BVALID,
  m_axi_rmem22_RDATA,
  m_axi_rmem22_RID,
  m_axi_rmem22_RLAST,
  m_axi_rmem22_RREADY,
  m_axi_rmem22_RRESP,
  m_axi_rmem22_RVALID,
  m_axi_rmem22_WDATA,
  m_axi_rmem22_WLAST,
  m_axi_rmem22_WREADY,
  m_axi_rmem22_WSTRB,
  m_axi_rmem22_WVALID,
  m_axi_rmem23_ARADDR,
  m_axi_rmem23_ARBURST,
  m_axi_rmem23_ARCACHE,
  m_axi_rmem23_ARID,
  m_axi_rmem23_ARLEN,
  m_axi_rmem23_ARLOCK,
  m_axi_rmem23_ARPROT,
  m_axi_rmem23_ARQOS,
  m_axi_rmem23_ARREADY,
  m_axi_rmem23_ARSIZE,
  m_axi_rmem23_ARVALID,
  m_axi_rmem23_AWADDR,
  m_axi_rmem23_AWBURST,
  m_axi_rmem23_AWCACHE,
  m_axi_rmem23_AWID,
  m_axi_rmem23_AWLEN,
  m_axi_rmem23_AWLOCK,
  m_axi_rmem23_AWPROT,
  m_axi_rmem23_AWQOS,
  m_axi_rmem23_AWREADY,
  m_axi_rmem23_AWSIZE,
  m_axi_rmem23_AWVALID,
  m_axi_rmem23_BID,
  m_axi_rmem23_BREADY,
  m_axi_rmem23_BRESP,
  m_axi_rmem23_BVALID,
  m_axi_rmem23_RDATA,
  m_axi_rmem23_RID,
  m_axi_rmem23_RLAST,
  m_axi_rmem23_RREADY,
  m_axi_rmem23_RRESP,
  m_axi_rmem23_RVALID,
  m_axi_rmem23_WDATA,
  m_axi_rmem23_WLAST,
  m_axi_rmem23_WREADY,
  m_axi_rmem23_WSTRB,
  m_axi_rmem23_WVALID,
  m_axi_rmem24_ARADDR,
  m_axi_rmem24_ARBURST,
  m_axi_rmem24_ARCACHE,
  m_axi_rmem24_ARID,
  m_axi_rmem24_ARLEN,
  m_axi_rmem24_ARLOCK,
  m_axi_rmem24_ARPROT,
  m_axi_rmem24_ARQOS,
  m_axi_rmem24_ARREADY,
  m_axi_rmem24_ARSIZE,
  m_axi_rmem24_ARVALID,
  m_axi_rmem24_AWADDR,
  m_axi_rmem24_AWBURST,
  m_axi_rmem24_AWCACHE,
  m_axi_rmem24_AWID,
  m_axi_rmem24_AWLEN,
  m_axi_rmem24_AWLOCK,
  m_axi_rmem24_AWPROT,
  m_axi_rmem24_AWQOS,
  m_axi_rmem24_AWREADY,
  m_axi_rmem24_AWSIZE,
  m_axi_rmem24_AWVALID,
  m_axi_rmem24_BID,
  m_axi_rmem24_BREADY,
  m_axi_rmem24_BRESP,
  m_axi_rmem24_BVALID,
  m_axi_rmem24_RDATA,
  m_axi_rmem24_RID,
  m_axi_rmem24_RLAST,
  m_axi_rmem24_RREADY,
  m_axi_rmem24_RRESP,
  m_axi_rmem24_RVALID,
  m_axi_rmem24_WDATA,
  m_axi_rmem24_WLAST,
  m_axi_rmem24_WREADY,
  m_axi_rmem24_WSTRB,
  m_axi_rmem24_WVALID,
  m_axi_rmem25_ARADDR,
  m_axi_rmem25_ARBURST,
  m_axi_rmem25_ARCACHE,
  m_axi_rmem25_ARID,
  m_axi_rmem25_ARLEN,
  m_axi_rmem25_ARLOCK,
  m_axi_rmem25_ARPROT,
  m_axi_rmem25_ARQOS,
  m_axi_rmem25_ARREADY,
  m_axi_rmem25_ARSIZE,
  m_axi_rmem25_ARVALID,
  m_axi_rmem25_AWADDR,
  m_axi_rmem25_AWBURST,
  m_axi_rmem25_AWCACHE,
  m_axi_rmem25_AWID,
  m_axi_rmem25_AWLEN,
  m_axi_rmem25_AWLOCK,
  m_axi_rmem25_AWPROT,
  m_axi_rmem25_AWQOS,
  m_axi_rmem25_AWREADY,
  m_axi_rmem25_AWSIZE,
  m_axi_rmem25_AWVALID,
  m_axi_rmem25_BID,
  m_axi_rmem25_BREADY,
  m_axi_rmem25_BRESP,
  m_axi_rmem25_BVALID,
  m_axi_rmem25_RDATA,
  m_axi_rmem25_RID,
  m_axi_rmem25_RLAST,
  m_axi_rmem25_RREADY,
  m_axi_rmem25_RRESP,
  m_axi_rmem25_RVALID,
  m_axi_rmem25_WDATA,
  m_axi_rmem25_WLAST,
  m_axi_rmem25_WREADY,
  m_axi_rmem25_WSTRB,
  m_axi_rmem25_WVALID,
  m_axi_rmem26_ARADDR,
  m_axi_rmem26_ARBURST,
  m_axi_rmem26_ARCACHE,
  m_axi_rmem26_ARID,
  m_axi_rmem26_ARLEN,
  m_axi_rmem26_ARLOCK,
  m_axi_rmem26_ARPROT,
  m_axi_rmem26_ARQOS,
  m_axi_rmem26_ARREADY,
  m_axi_rmem26_ARSIZE,
  m_axi_rmem26_ARVALID,
  m_axi_rmem26_AWADDR,
  m_axi_rmem26_AWBURST,
  m_axi_rmem26_AWCACHE,
  m_axi_rmem26_AWID,
  m_axi_rmem26_AWLEN,
  m_axi_rmem26_AWLOCK,
  m_axi_rmem26_AWPROT,
  m_axi_rmem26_AWQOS,
  m_axi_rmem26_AWREADY,
  m_axi_rmem26_AWSIZE,
  m_axi_rmem26_AWVALID,
  m_axi_rmem26_BID,
  m_axi_rmem26_BREADY,
  m_axi_rmem26_BRESP,
  m_axi_rmem26_BVALID,
  m_axi_rmem26_RDATA,
  m_axi_rmem26_RID,
  m_axi_rmem26_RLAST,
  m_axi_rmem26_RREADY,
  m_axi_rmem26_RRESP,
  m_axi_rmem26_RVALID,
  m_axi_rmem26_WDATA,
  m_axi_rmem26_WLAST,
  m_axi_rmem26_WREADY,
  m_axi_rmem26_WSTRB,
  m_axi_rmem26_WVALID,
  m_axi_rmem27_ARADDR,
  m_axi_rmem27_ARBURST,
  m_axi_rmem27_ARCACHE,
  m_axi_rmem27_ARID,
  m_axi_rmem27_ARLEN,
  m_axi_rmem27_ARLOCK,
  m_axi_rmem27_ARPROT,
  m_axi_rmem27_ARQOS,
  m_axi_rmem27_ARREADY,
  m_axi_rmem27_ARSIZE,
  m_axi_rmem27_ARVALID,
  m_axi_rmem27_AWADDR,
  m_axi_rmem27_AWBURST,
  m_axi_rmem27_AWCACHE,
  m_axi_rmem27_AWID,
  m_axi_rmem27_AWLEN,
  m_axi_rmem27_AWLOCK,
  m_axi_rmem27_AWPROT,
  m_axi_rmem27_AWQOS,
  m_axi_rmem27_AWREADY,
  m_axi_rmem27_AWSIZE,
  m_axi_rmem27_AWVALID,
  m_axi_rmem27_BID,
  m_axi_rmem27_BREADY,
  m_axi_rmem27_BRESP,
  m_axi_rmem27_BVALID,
  m_axi_rmem27_RDATA,
  m_axi_rmem27_RID,
  m_axi_rmem27_RLAST,
  m_axi_rmem27_RREADY,
  m_axi_rmem27_RRESP,
  m_axi_rmem27_RVALID,
  m_axi_rmem27_WDATA,
  m_axi_rmem27_WLAST,
  m_axi_rmem27_WREADY,
  m_axi_rmem27_WSTRB,
  m_axi_rmem27_WVALID
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
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [63:0] m_axi_rmem0_ARADDR;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [1:0] m_axi_rmem0_ARBURST;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [3:0] m_axi_rmem0_ARCACHE;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [1:0] m_axi_rmem0_ARID;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [7:0] m_axi_rmem0_ARLEN;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output m_axi_rmem0_ARLOCK;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [2:0] m_axi_rmem0_ARPROT;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [3:0] m_axi_rmem0_ARQOS;
  (* RS_HS = "m_axi_rmem0_AR.ready" *)input m_axi_rmem0_ARREADY;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [2:0] m_axi_rmem0_ARSIZE;
  (* RS_HS = "m_axi_rmem0_AR.valid" *)output m_axi_rmem0_ARVALID;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [63:0] m_axi_rmem0_AWADDR;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [1:0] m_axi_rmem0_AWBURST;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [3:0] m_axi_rmem0_AWCACHE;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [1:0] m_axi_rmem0_AWID;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [7:0] m_axi_rmem0_AWLEN;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output m_axi_rmem0_AWLOCK;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [2:0] m_axi_rmem0_AWPROT;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [3:0] m_axi_rmem0_AWQOS;
  (* RS_HS = "m_axi_rmem0_AW.ready" *)input m_axi_rmem0_AWREADY;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [2:0] m_axi_rmem0_AWSIZE;
  (* RS_HS = "m_axi_rmem0_AW.valid" *)output m_axi_rmem0_AWVALID;
  (* RS_HS = "m_axi_rmem0_B.data" *)input [1:0] m_axi_rmem0_BID;
  (* RS_HS = "m_axi_rmem0_B.ready" *)output m_axi_rmem0_BREADY;
  (* RS_HS = "m_axi_rmem0_B.data" *)input [1:0] m_axi_rmem0_BRESP;
  (* RS_HS = "m_axi_rmem0_B.valid" *)input m_axi_rmem0_BVALID;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [511:0] m_axi_rmem0_RDATA;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [1:0] m_axi_rmem0_RID;
  (* RS_HS = "m_axi_rmem0_R.data" *)input m_axi_rmem0_RLAST;
  (* RS_HS = "m_axi_rmem0_R.ready" *)output m_axi_rmem0_RREADY;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [1:0] m_axi_rmem0_RRESP;
  (* RS_HS = "m_axi_rmem0_R.valid" *)input m_axi_rmem0_RVALID;
  (* RS_HS = "m_axi_rmem0_W.data" *)output [511:0] m_axi_rmem0_WDATA;
  (* RS_HS = "m_axi_rmem0_W.data" *)output m_axi_rmem0_WLAST;
  (* RS_HS = "m_axi_rmem0_W.ready" *)input m_axi_rmem0_WREADY;
  (* RS_HS = "m_axi_rmem0_W.data" *)output [63:0] m_axi_rmem0_WSTRB;
  (* RS_HS = "m_axi_rmem0_W.valid" *)output m_axi_rmem0_WVALID;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [63:0] m_axi_rmem1_ARADDR;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [1:0] m_axi_rmem1_ARBURST;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [3:0] m_axi_rmem1_ARCACHE;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [1:0] m_axi_rmem1_ARID;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [7:0] m_axi_rmem1_ARLEN;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output m_axi_rmem1_ARLOCK;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [2:0] m_axi_rmem1_ARPROT;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [3:0] m_axi_rmem1_ARQOS;
  (* RS_HS = "m_axi_rmem1_AR.ready" *)input m_axi_rmem1_ARREADY;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [2:0] m_axi_rmem1_ARSIZE;
  (* RS_HS = "m_axi_rmem1_AR.valid" *)output m_axi_rmem1_ARVALID;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [63:0] m_axi_rmem1_AWADDR;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [1:0] m_axi_rmem1_AWBURST;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [3:0] m_axi_rmem1_AWCACHE;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [1:0] m_axi_rmem1_AWID;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [7:0] m_axi_rmem1_AWLEN;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output m_axi_rmem1_AWLOCK;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [2:0] m_axi_rmem1_AWPROT;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [3:0] m_axi_rmem1_AWQOS;
  (* RS_HS = "m_axi_rmem1_AW.ready" *)input m_axi_rmem1_AWREADY;
  (* RS_HS = "m_axi_rmem1_AW.data" *)output [2:0] m_axi_rmem1_AWSIZE;
  (* RS_HS = "m_axi_rmem1_AW.valid" *)output m_axi_rmem1_AWVALID;
  (* RS_HS = "m_axi_rmem1_B.data" *)input [1:0] m_axi_rmem1_BID;
  (* RS_HS = "m_axi_rmem1_B.ready" *)output m_axi_rmem1_BREADY;
  (* RS_HS = "m_axi_rmem1_B.data" *)input [1:0] m_axi_rmem1_BRESP;
  (* RS_HS = "m_axi_rmem1_B.valid" *)input m_axi_rmem1_BVALID;
  (* RS_HS = "m_axi_rmem1_R.data" *)input [511:0] m_axi_rmem1_RDATA;
  (* RS_HS = "m_axi_rmem1_R.data" *)input [1:0] m_axi_rmem1_RID;
  (* RS_HS = "m_axi_rmem1_R.data" *)input m_axi_rmem1_RLAST;
  (* RS_HS = "m_axi_rmem1_R.ready" *)output m_axi_rmem1_RREADY;
  (* RS_HS = "m_axi_rmem1_R.data" *)input [1:0] m_axi_rmem1_RRESP;
  (* RS_HS = "m_axi_rmem1_R.valid" *)input m_axi_rmem1_RVALID;
  (* RS_HS = "m_axi_rmem1_W.data" *)output [511:0] m_axi_rmem1_WDATA;
  (* RS_HS = "m_axi_rmem1_W.data" *)output m_axi_rmem1_WLAST;
  (* RS_HS = "m_axi_rmem1_W.ready" *)input m_axi_rmem1_WREADY;
  (* RS_HS = "m_axi_rmem1_W.data" *)output [63:0] m_axi_rmem1_WSTRB;
  (* RS_HS = "m_axi_rmem1_W.valid" *)output m_axi_rmem1_WVALID;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [63:0] m_axi_rmem2_ARADDR;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [1:0] m_axi_rmem2_ARBURST;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [3:0] m_axi_rmem2_ARCACHE;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [1:0] m_axi_rmem2_ARID;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [7:0] m_axi_rmem2_ARLEN;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output m_axi_rmem2_ARLOCK;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [2:0] m_axi_rmem2_ARPROT;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [3:0] m_axi_rmem2_ARQOS;
  (* RS_HS = "m_axi_rmem2_AR.ready" *)input m_axi_rmem2_ARREADY;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [2:0] m_axi_rmem2_ARSIZE;
  (* RS_HS = "m_axi_rmem2_AR.valid" *)output m_axi_rmem2_ARVALID;
  (* RS_HS = "m_axi_rmem2_AW.data" *)output [63:0] m_axi_rmem2_AWADDR;
  (* RS_HS = "m_axi_rmem2_AW.data" *)output [1:0] m_axi_rmem2_AWBURST;
  (* RS_HS = "m_axi_rmem2_AW.data" *)output [3:0] m_axi_rmem2_AWCACHE;
  (* RS_HS = "m_axi_rmem2_AW.data" *)output [1:0] m_axi_rmem2_AWID;
  (* RS_HS = "m_axi_rmem2_AW.data" *)output [7:0] m_axi_rmem2_AWLEN;
  (* RS_HS = "m_axi_rmem2_AW.data" *)output m_axi_rmem2_AWLOCK;
  (* RS_HS = "m_axi_rmem2_AW.data" *)output [2:0] m_axi_rmem2_AWPROT;
  (* RS_HS = "m_axi_rmem2_AW.data" *)output [3:0] m_axi_rmem2_AWQOS;
  (* RS_HS = "m_axi_rmem2_AW.ready" *)input m_axi_rmem2_AWREADY;
  (* RS_HS = "m_axi_rmem2_AW.data" *)output [2:0] m_axi_rmem2_AWSIZE;
  (* RS_HS = "m_axi_rmem2_AW.valid" *)output m_axi_rmem2_AWVALID;
  (* RS_HS = "m_axi_rmem2_B.data" *)input [1:0] m_axi_rmem2_BID;
  (* RS_HS = "m_axi_rmem2_B.ready" *)output m_axi_rmem2_BREADY;
  (* RS_HS = "m_axi_rmem2_B.data" *)input [1:0] m_axi_rmem2_BRESP;
  (* RS_HS = "m_axi_rmem2_B.valid" *)input m_axi_rmem2_BVALID;
  (* RS_HS = "m_axi_rmem2_R.data" *)input [511:0] m_axi_rmem2_RDATA;
  (* RS_HS = "m_axi_rmem2_R.data" *)input [1:0] m_axi_rmem2_RID;
  (* RS_HS = "m_axi_rmem2_R.data" *)input m_axi_rmem2_RLAST;
  (* RS_HS = "m_axi_rmem2_R.ready" *)output m_axi_rmem2_RREADY;
  (* RS_HS = "m_axi_rmem2_R.data" *)input [1:0] m_axi_rmem2_RRESP;
  (* RS_HS = "m_axi_rmem2_R.valid" *)input m_axi_rmem2_RVALID;
  (* RS_HS = "m_axi_rmem2_W.data" *)output [511:0] m_axi_rmem2_WDATA;
  (* RS_HS = "m_axi_rmem2_W.data" *)output m_axi_rmem2_WLAST;
  (* RS_HS = "m_axi_rmem2_W.ready" *)input m_axi_rmem2_WREADY;
  (* RS_HS = "m_axi_rmem2_W.data" *)output [63:0] m_axi_rmem2_WSTRB;
  (* RS_HS = "m_axi_rmem2_W.valid" *)output m_axi_rmem2_WVALID;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [63:0] m_axi_rmem3_ARADDR;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [1:0] m_axi_rmem3_ARBURST;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [3:0] m_axi_rmem3_ARCACHE;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [1:0] m_axi_rmem3_ARID;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [7:0] m_axi_rmem3_ARLEN;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output m_axi_rmem3_ARLOCK;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [2:0] m_axi_rmem3_ARPROT;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [3:0] m_axi_rmem3_ARQOS;
  (* RS_HS = "m_axi_rmem3_AR.ready" *)input m_axi_rmem3_ARREADY;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [2:0] m_axi_rmem3_ARSIZE;
  (* RS_HS = "m_axi_rmem3_AR.valid" *)output m_axi_rmem3_ARVALID;
  (* RS_HS = "m_axi_rmem3_AW.data" *)output [63:0] m_axi_rmem3_AWADDR;
  (* RS_HS = "m_axi_rmem3_AW.data" *)output [1:0] m_axi_rmem3_AWBURST;
  (* RS_HS = "m_axi_rmem3_AW.data" *)output [3:0] m_axi_rmem3_AWCACHE;
  (* RS_HS = "m_axi_rmem3_AW.data" *)output [1:0] m_axi_rmem3_AWID;
  (* RS_HS = "m_axi_rmem3_AW.data" *)output [7:0] m_axi_rmem3_AWLEN;
  (* RS_HS = "m_axi_rmem3_AW.data" *)output m_axi_rmem3_AWLOCK;
  (* RS_HS = "m_axi_rmem3_AW.data" *)output [2:0] m_axi_rmem3_AWPROT;
  (* RS_HS = "m_axi_rmem3_AW.data" *)output [3:0] m_axi_rmem3_AWQOS;
  (* RS_HS = "m_axi_rmem3_AW.ready" *)input m_axi_rmem3_AWREADY;
  (* RS_HS = "m_axi_rmem3_AW.data" *)output [2:0] m_axi_rmem3_AWSIZE;
  (* RS_HS = "m_axi_rmem3_AW.valid" *)output m_axi_rmem3_AWVALID;
  (* RS_HS = "m_axi_rmem3_B.data" *)input [1:0] m_axi_rmem3_BID;
  (* RS_HS = "m_axi_rmem3_B.ready" *)output m_axi_rmem3_BREADY;
  (* RS_HS = "m_axi_rmem3_B.data" *)input [1:0] m_axi_rmem3_BRESP;
  (* RS_HS = "m_axi_rmem3_B.valid" *)input m_axi_rmem3_BVALID;
  (* RS_HS = "m_axi_rmem3_R.data" *)input [511:0] m_axi_rmem3_RDATA;
  (* RS_HS = "m_axi_rmem3_R.data" *)input [1:0] m_axi_rmem3_RID;
  (* RS_HS = "m_axi_rmem3_R.data" *)input m_axi_rmem3_RLAST;
  (* RS_HS = "m_axi_rmem3_R.ready" *)output m_axi_rmem3_RREADY;
  (* RS_HS = "m_axi_rmem3_R.data" *)input [1:0] m_axi_rmem3_RRESP;
  (* RS_HS = "m_axi_rmem3_R.valid" *)input m_axi_rmem3_RVALID;
  (* RS_HS = "m_axi_rmem3_W.data" *)output [511:0] m_axi_rmem3_WDATA;
  (* RS_HS = "m_axi_rmem3_W.data" *)output m_axi_rmem3_WLAST;
  (* RS_HS = "m_axi_rmem3_W.ready" *)input m_axi_rmem3_WREADY;
  (* RS_HS = "m_axi_rmem3_W.data" *)output [63:0] m_axi_rmem3_WSTRB;
  (* RS_HS = "m_axi_rmem3_W.valid" *)output m_axi_rmem3_WVALID;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [63:0] m_axi_rmem4_ARADDR;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [1:0] m_axi_rmem4_ARBURST;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [3:0] m_axi_rmem4_ARCACHE;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [1:0] m_axi_rmem4_ARID;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [7:0] m_axi_rmem4_ARLEN;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output m_axi_rmem4_ARLOCK;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [2:0] m_axi_rmem4_ARPROT;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [3:0] m_axi_rmem4_ARQOS;
  (* RS_HS = "m_axi_rmem4_AR.ready" *)input m_axi_rmem4_ARREADY;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [2:0] m_axi_rmem4_ARSIZE;
  (* RS_HS = "m_axi_rmem4_AR.valid" *)output m_axi_rmem4_ARVALID;
  (* RS_HS = "m_axi_rmem4_AW.data" *)output [63:0] m_axi_rmem4_AWADDR;
  (* RS_HS = "m_axi_rmem4_AW.data" *)output [1:0] m_axi_rmem4_AWBURST;
  (* RS_HS = "m_axi_rmem4_AW.data" *)output [3:0] m_axi_rmem4_AWCACHE;
  (* RS_HS = "m_axi_rmem4_AW.data" *)output [1:0] m_axi_rmem4_AWID;
  (* RS_HS = "m_axi_rmem4_AW.data" *)output [7:0] m_axi_rmem4_AWLEN;
  (* RS_HS = "m_axi_rmem4_AW.data" *)output m_axi_rmem4_AWLOCK;
  (* RS_HS = "m_axi_rmem4_AW.data" *)output [2:0] m_axi_rmem4_AWPROT;
  (* RS_HS = "m_axi_rmem4_AW.data" *)output [3:0] m_axi_rmem4_AWQOS;
  (* RS_HS = "m_axi_rmem4_AW.ready" *)input m_axi_rmem4_AWREADY;
  (* RS_HS = "m_axi_rmem4_AW.data" *)output [2:0] m_axi_rmem4_AWSIZE;
  (* RS_HS = "m_axi_rmem4_AW.valid" *)output m_axi_rmem4_AWVALID;
  (* RS_HS = "m_axi_rmem4_B.data" *)input [1:0] m_axi_rmem4_BID;
  (* RS_HS = "m_axi_rmem4_B.ready" *)output m_axi_rmem4_BREADY;
  (* RS_HS = "m_axi_rmem4_B.data" *)input [1:0] m_axi_rmem4_BRESP;
  (* RS_HS = "m_axi_rmem4_B.valid" *)input m_axi_rmem4_BVALID;
  (* RS_HS = "m_axi_rmem4_R.data" *)input [511:0] m_axi_rmem4_RDATA;
  (* RS_HS = "m_axi_rmem4_R.data" *)input [1:0] m_axi_rmem4_RID;
  (* RS_HS = "m_axi_rmem4_R.data" *)input m_axi_rmem4_RLAST;
  (* RS_HS = "m_axi_rmem4_R.ready" *)output m_axi_rmem4_RREADY;
  (* RS_HS = "m_axi_rmem4_R.data" *)input [1:0] m_axi_rmem4_RRESP;
  (* RS_HS = "m_axi_rmem4_R.valid" *)input m_axi_rmem4_RVALID;
  (* RS_HS = "m_axi_rmem4_W.data" *)output [511:0] m_axi_rmem4_WDATA;
  (* RS_HS = "m_axi_rmem4_W.data" *)output m_axi_rmem4_WLAST;
  (* RS_HS = "m_axi_rmem4_W.ready" *)input m_axi_rmem4_WREADY;
  (* RS_HS = "m_axi_rmem4_W.data" *)output [63:0] m_axi_rmem4_WSTRB;
  (* RS_HS = "m_axi_rmem4_W.valid" *)output m_axi_rmem4_WVALID;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [63:0] m_axi_rmem5_ARADDR;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [1:0] m_axi_rmem5_ARBURST;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [3:0] m_axi_rmem5_ARCACHE;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [1:0] m_axi_rmem5_ARID;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [7:0] m_axi_rmem5_ARLEN;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output m_axi_rmem5_ARLOCK;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [2:0] m_axi_rmem5_ARPROT;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [3:0] m_axi_rmem5_ARQOS;
  (* RS_HS = "m_axi_rmem5_AR.ready" *)input m_axi_rmem5_ARREADY;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [2:0] m_axi_rmem5_ARSIZE;
  (* RS_HS = "m_axi_rmem5_AR.valid" *)output m_axi_rmem5_ARVALID;
  (* RS_HS = "m_axi_rmem5_AW.data" *)output [63:0] m_axi_rmem5_AWADDR;
  (* RS_HS = "m_axi_rmem5_AW.data" *)output [1:0] m_axi_rmem5_AWBURST;
  (* RS_HS = "m_axi_rmem5_AW.data" *)output [3:0] m_axi_rmem5_AWCACHE;
  (* RS_HS = "m_axi_rmem5_AW.data" *)output [1:0] m_axi_rmem5_AWID;
  (* RS_HS = "m_axi_rmem5_AW.data" *)output [7:0] m_axi_rmem5_AWLEN;
  (* RS_HS = "m_axi_rmem5_AW.data" *)output m_axi_rmem5_AWLOCK;
  (* RS_HS = "m_axi_rmem5_AW.data" *)output [2:0] m_axi_rmem5_AWPROT;
  (* RS_HS = "m_axi_rmem5_AW.data" *)output [3:0] m_axi_rmem5_AWQOS;
  (* RS_HS = "m_axi_rmem5_AW.ready" *)input m_axi_rmem5_AWREADY;
  (* RS_HS = "m_axi_rmem5_AW.data" *)output [2:0] m_axi_rmem5_AWSIZE;
  (* RS_HS = "m_axi_rmem5_AW.valid" *)output m_axi_rmem5_AWVALID;
  (* RS_HS = "m_axi_rmem5_B.data" *)input [1:0] m_axi_rmem5_BID;
  (* RS_HS = "m_axi_rmem5_B.ready" *)output m_axi_rmem5_BREADY;
  (* RS_HS = "m_axi_rmem5_B.data" *)input [1:0] m_axi_rmem5_BRESP;
  (* RS_HS = "m_axi_rmem5_B.valid" *)input m_axi_rmem5_BVALID;
  (* RS_HS = "m_axi_rmem5_R.data" *)input [511:0] m_axi_rmem5_RDATA;
  (* RS_HS = "m_axi_rmem5_R.data" *)input [1:0] m_axi_rmem5_RID;
  (* RS_HS = "m_axi_rmem5_R.data" *)input m_axi_rmem5_RLAST;
  (* RS_HS = "m_axi_rmem5_R.ready" *)output m_axi_rmem5_RREADY;
  (* RS_HS = "m_axi_rmem5_R.data" *)input [1:0] m_axi_rmem5_RRESP;
  (* RS_HS = "m_axi_rmem5_R.valid" *)input m_axi_rmem5_RVALID;
  (* RS_HS = "m_axi_rmem5_W.data" *)output [511:0] m_axi_rmem5_WDATA;
  (* RS_HS = "m_axi_rmem5_W.data" *)output m_axi_rmem5_WLAST;
  (* RS_HS = "m_axi_rmem5_W.ready" *)input m_axi_rmem5_WREADY;
  (* RS_HS = "m_axi_rmem5_W.data" *)output [63:0] m_axi_rmem5_WSTRB;
  (* RS_HS = "m_axi_rmem5_W.valid" *)output m_axi_rmem5_WVALID;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [63:0] m_axi_rmem6_ARADDR;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [1:0] m_axi_rmem6_ARBURST;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [3:0] m_axi_rmem6_ARCACHE;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [1:0] m_axi_rmem6_ARID;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [7:0] m_axi_rmem6_ARLEN;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output m_axi_rmem6_ARLOCK;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [2:0] m_axi_rmem6_ARPROT;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [3:0] m_axi_rmem6_ARQOS;
  (* RS_HS = "m_axi_rmem6_AR.ready" *)input m_axi_rmem6_ARREADY;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [2:0] m_axi_rmem6_ARSIZE;
  (* RS_HS = "m_axi_rmem6_AR.valid" *)output m_axi_rmem6_ARVALID;
  (* RS_HS = "m_axi_rmem6_AW.data" *)output [63:0] m_axi_rmem6_AWADDR;
  (* RS_HS = "m_axi_rmem6_AW.data" *)output [1:0] m_axi_rmem6_AWBURST;
  (* RS_HS = "m_axi_rmem6_AW.data" *)output [3:0] m_axi_rmem6_AWCACHE;
  (* RS_HS = "m_axi_rmem6_AW.data" *)output [1:0] m_axi_rmem6_AWID;
  (* RS_HS = "m_axi_rmem6_AW.data" *)output [7:0] m_axi_rmem6_AWLEN;
  (* RS_HS = "m_axi_rmem6_AW.data" *)output m_axi_rmem6_AWLOCK;
  (* RS_HS = "m_axi_rmem6_AW.data" *)output [2:0] m_axi_rmem6_AWPROT;
  (* RS_HS = "m_axi_rmem6_AW.data" *)output [3:0] m_axi_rmem6_AWQOS;
  (* RS_HS = "m_axi_rmem6_AW.ready" *)input m_axi_rmem6_AWREADY;
  (* RS_HS = "m_axi_rmem6_AW.data" *)output [2:0] m_axi_rmem6_AWSIZE;
  (* RS_HS = "m_axi_rmem6_AW.valid" *)output m_axi_rmem6_AWVALID;
  (* RS_HS = "m_axi_rmem6_B.data" *)input [1:0] m_axi_rmem6_BID;
  (* RS_HS = "m_axi_rmem6_B.ready" *)output m_axi_rmem6_BREADY;
  (* RS_HS = "m_axi_rmem6_B.data" *)input [1:0] m_axi_rmem6_BRESP;
  (* RS_HS = "m_axi_rmem6_B.valid" *)input m_axi_rmem6_BVALID;
  (* RS_HS = "m_axi_rmem6_R.data" *)input [511:0] m_axi_rmem6_RDATA;
  (* RS_HS = "m_axi_rmem6_R.data" *)input [1:0] m_axi_rmem6_RID;
  (* RS_HS = "m_axi_rmem6_R.data" *)input m_axi_rmem6_RLAST;
  (* RS_HS = "m_axi_rmem6_R.ready" *)output m_axi_rmem6_RREADY;
  (* RS_HS = "m_axi_rmem6_R.data" *)input [1:0] m_axi_rmem6_RRESP;
  (* RS_HS = "m_axi_rmem6_R.valid" *)input m_axi_rmem6_RVALID;
  (* RS_HS = "m_axi_rmem6_W.data" *)output [511:0] m_axi_rmem6_WDATA;
  (* RS_HS = "m_axi_rmem6_W.data" *)output m_axi_rmem6_WLAST;
  (* RS_HS = "m_axi_rmem6_W.ready" *)input m_axi_rmem6_WREADY;
  (* RS_HS = "m_axi_rmem6_W.data" *)output [63:0] m_axi_rmem6_WSTRB;
  (* RS_HS = "m_axi_rmem6_W.valid" *)output m_axi_rmem6_WVALID;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [63:0] m_axi_rmem7_ARADDR;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [1:0] m_axi_rmem7_ARBURST;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [3:0] m_axi_rmem7_ARCACHE;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [1:0] m_axi_rmem7_ARID;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [7:0] m_axi_rmem7_ARLEN;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output m_axi_rmem7_ARLOCK;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [2:0] m_axi_rmem7_ARPROT;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [3:0] m_axi_rmem7_ARQOS;
  (* RS_HS = "m_axi_rmem7_AR.ready" *)input m_axi_rmem7_ARREADY;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [2:0] m_axi_rmem7_ARSIZE;
  (* RS_HS = "m_axi_rmem7_AR.valid" *)output m_axi_rmem7_ARVALID;
  (* RS_HS = "m_axi_rmem7_AW.data" *)output [63:0] m_axi_rmem7_AWADDR;
  (* RS_HS = "m_axi_rmem7_AW.data" *)output [1:0] m_axi_rmem7_AWBURST;
  (* RS_HS = "m_axi_rmem7_AW.data" *)output [3:0] m_axi_rmem7_AWCACHE;
  (* RS_HS = "m_axi_rmem7_AW.data" *)output [1:0] m_axi_rmem7_AWID;
  (* RS_HS = "m_axi_rmem7_AW.data" *)output [7:0] m_axi_rmem7_AWLEN;
  (* RS_HS = "m_axi_rmem7_AW.data" *)output m_axi_rmem7_AWLOCK;
  (* RS_HS = "m_axi_rmem7_AW.data" *)output [2:0] m_axi_rmem7_AWPROT;
  (* RS_HS = "m_axi_rmem7_AW.data" *)output [3:0] m_axi_rmem7_AWQOS;
  (* RS_HS = "m_axi_rmem7_AW.ready" *)input m_axi_rmem7_AWREADY;
  (* RS_HS = "m_axi_rmem7_AW.data" *)output [2:0] m_axi_rmem7_AWSIZE;
  (* RS_HS = "m_axi_rmem7_AW.valid" *)output m_axi_rmem7_AWVALID;
  (* RS_HS = "m_axi_rmem7_B.data" *)input [1:0] m_axi_rmem7_BID;
  (* RS_HS = "m_axi_rmem7_B.ready" *)output m_axi_rmem7_BREADY;
  (* RS_HS = "m_axi_rmem7_B.data" *)input [1:0] m_axi_rmem7_BRESP;
  (* RS_HS = "m_axi_rmem7_B.valid" *)input m_axi_rmem7_BVALID;
  (* RS_HS = "m_axi_rmem7_R.data" *)input [511:0] m_axi_rmem7_RDATA;
  (* RS_HS = "m_axi_rmem7_R.data" *)input [1:0] m_axi_rmem7_RID;
  (* RS_HS = "m_axi_rmem7_R.data" *)input m_axi_rmem7_RLAST;
  (* RS_HS = "m_axi_rmem7_R.ready" *)output m_axi_rmem7_RREADY;
  (* RS_HS = "m_axi_rmem7_R.data" *)input [1:0] m_axi_rmem7_RRESP;
  (* RS_HS = "m_axi_rmem7_R.valid" *)input m_axi_rmem7_RVALID;
  (* RS_HS = "m_axi_rmem7_W.data" *)output [511:0] m_axi_rmem7_WDATA;
  (* RS_HS = "m_axi_rmem7_W.data" *)output m_axi_rmem7_WLAST;
  (* RS_HS = "m_axi_rmem7_W.ready" *)input m_axi_rmem7_WREADY;
  (* RS_HS = "m_axi_rmem7_W.data" *)output [63:0] m_axi_rmem7_WSTRB;
  (* RS_HS = "m_axi_rmem7_W.valid" *)output m_axi_rmem7_WVALID;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [63:0] m_axi_rmem8_ARADDR;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [1:0] m_axi_rmem8_ARBURST;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [3:0] m_axi_rmem8_ARCACHE;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [1:0] m_axi_rmem8_ARID;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [7:0] m_axi_rmem8_ARLEN;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output m_axi_rmem8_ARLOCK;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [2:0] m_axi_rmem8_ARPROT;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [3:0] m_axi_rmem8_ARQOS;
  (* RS_HS = "m_axi_rmem8_AR.ready" *)input m_axi_rmem8_ARREADY;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [2:0] m_axi_rmem8_ARSIZE;
  (* RS_HS = "m_axi_rmem8_AR.valid" *)output m_axi_rmem8_ARVALID;
  (* RS_HS = "m_axi_rmem8_AW.data" *)output [63:0] m_axi_rmem8_AWADDR;
  (* RS_HS = "m_axi_rmem8_AW.data" *)output [1:0] m_axi_rmem8_AWBURST;
  (* RS_HS = "m_axi_rmem8_AW.data" *)output [3:0] m_axi_rmem8_AWCACHE;
  (* RS_HS = "m_axi_rmem8_AW.data" *)output [1:0] m_axi_rmem8_AWID;
  (* RS_HS = "m_axi_rmem8_AW.data" *)output [7:0] m_axi_rmem8_AWLEN;
  (* RS_HS = "m_axi_rmem8_AW.data" *)output m_axi_rmem8_AWLOCK;
  (* RS_HS = "m_axi_rmem8_AW.data" *)output [2:0] m_axi_rmem8_AWPROT;
  (* RS_HS = "m_axi_rmem8_AW.data" *)output [3:0] m_axi_rmem8_AWQOS;
  (* RS_HS = "m_axi_rmem8_AW.ready" *)input m_axi_rmem8_AWREADY;
  (* RS_HS = "m_axi_rmem8_AW.data" *)output [2:0] m_axi_rmem8_AWSIZE;
  (* RS_HS = "m_axi_rmem8_AW.valid" *)output m_axi_rmem8_AWVALID;
  (* RS_HS = "m_axi_rmem8_B.data" *)input [1:0] m_axi_rmem8_BID;
  (* RS_HS = "m_axi_rmem8_B.ready" *)output m_axi_rmem8_BREADY;
  (* RS_HS = "m_axi_rmem8_B.data" *)input [1:0] m_axi_rmem8_BRESP;
  (* RS_HS = "m_axi_rmem8_B.valid" *)input m_axi_rmem8_BVALID;
  (* RS_HS = "m_axi_rmem8_R.data" *)input [511:0] m_axi_rmem8_RDATA;
  (* RS_HS = "m_axi_rmem8_R.data" *)input [1:0] m_axi_rmem8_RID;
  (* RS_HS = "m_axi_rmem8_R.data" *)input m_axi_rmem8_RLAST;
  (* RS_HS = "m_axi_rmem8_R.ready" *)output m_axi_rmem8_RREADY;
  (* RS_HS = "m_axi_rmem8_R.data" *)input [1:0] m_axi_rmem8_RRESP;
  (* RS_HS = "m_axi_rmem8_R.valid" *)input m_axi_rmem8_RVALID;
  (* RS_HS = "m_axi_rmem8_W.data" *)output [511:0] m_axi_rmem8_WDATA;
  (* RS_HS = "m_axi_rmem8_W.data" *)output m_axi_rmem8_WLAST;
  (* RS_HS = "m_axi_rmem8_W.ready" *)input m_axi_rmem8_WREADY;
  (* RS_HS = "m_axi_rmem8_W.data" *)output [63:0] m_axi_rmem8_WSTRB;
  (* RS_HS = "m_axi_rmem8_W.valid" *)output m_axi_rmem8_WVALID;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [63:0] m_axi_rmem9_ARADDR;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [1:0] m_axi_rmem9_ARBURST;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [3:0] m_axi_rmem9_ARCACHE;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [1:0] m_axi_rmem9_ARID;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [7:0] m_axi_rmem9_ARLEN;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output m_axi_rmem9_ARLOCK;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [2:0] m_axi_rmem9_ARPROT;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [3:0] m_axi_rmem9_ARQOS;
  (* RS_HS = "m_axi_rmem9_AR.ready" *)input m_axi_rmem9_ARREADY;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [2:0] m_axi_rmem9_ARSIZE;
  (* RS_HS = "m_axi_rmem9_AR.valid" *)output m_axi_rmem9_ARVALID;
  (* RS_HS = "m_axi_rmem9_AW.data" *)output [63:0] m_axi_rmem9_AWADDR;
  (* RS_HS = "m_axi_rmem9_AW.data" *)output [1:0] m_axi_rmem9_AWBURST;
  (* RS_HS = "m_axi_rmem9_AW.data" *)output [3:0] m_axi_rmem9_AWCACHE;
  (* RS_HS = "m_axi_rmem9_AW.data" *)output [1:0] m_axi_rmem9_AWID;
  (* RS_HS = "m_axi_rmem9_AW.data" *)output [7:0] m_axi_rmem9_AWLEN;
  (* RS_HS = "m_axi_rmem9_AW.data" *)output m_axi_rmem9_AWLOCK;
  (* RS_HS = "m_axi_rmem9_AW.data" *)output [2:0] m_axi_rmem9_AWPROT;
  (* RS_HS = "m_axi_rmem9_AW.data" *)output [3:0] m_axi_rmem9_AWQOS;
  (* RS_HS = "m_axi_rmem9_AW.ready" *)input m_axi_rmem9_AWREADY;
  (* RS_HS = "m_axi_rmem9_AW.data" *)output [2:0] m_axi_rmem9_AWSIZE;
  (* RS_HS = "m_axi_rmem9_AW.valid" *)output m_axi_rmem9_AWVALID;
  (* RS_HS = "m_axi_rmem9_B.data" *)input [1:0] m_axi_rmem9_BID;
  (* RS_HS = "m_axi_rmem9_B.ready" *)output m_axi_rmem9_BREADY;
  (* RS_HS = "m_axi_rmem9_B.data" *)input [1:0] m_axi_rmem9_BRESP;
  (* RS_HS = "m_axi_rmem9_B.valid" *)input m_axi_rmem9_BVALID;
  (* RS_HS = "m_axi_rmem9_R.data" *)input [511:0] m_axi_rmem9_RDATA;
  (* RS_HS = "m_axi_rmem9_R.data" *)input [1:0] m_axi_rmem9_RID;
  (* RS_HS = "m_axi_rmem9_R.data" *)input m_axi_rmem9_RLAST;
  (* RS_HS = "m_axi_rmem9_R.ready" *)output m_axi_rmem9_RREADY;
  (* RS_HS = "m_axi_rmem9_R.data" *)input [1:0] m_axi_rmem9_RRESP;
  (* RS_HS = "m_axi_rmem9_R.valid" *)input m_axi_rmem9_RVALID;
  (* RS_HS = "m_axi_rmem9_W.data" *)output [511:0] m_axi_rmem9_WDATA;
  (* RS_HS = "m_axi_rmem9_W.data" *)output m_axi_rmem9_WLAST;
  (* RS_HS = "m_axi_rmem9_W.ready" *)input m_axi_rmem9_WREADY;
  (* RS_HS = "m_axi_rmem9_W.data" *)output [63:0] m_axi_rmem9_WSTRB;
  (* RS_HS = "m_axi_rmem9_W.valid" *)output m_axi_rmem9_WVALID;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [63:0] m_axi_rmem10_ARADDR;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [1:0] m_axi_rmem10_ARBURST;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [3:0] m_axi_rmem10_ARCACHE;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [1:0] m_axi_rmem10_ARID;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [7:0] m_axi_rmem10_ARLEN;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output m_axi_rmem10_ARLOCK;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [2:0] m_axi_rmem10_ARPROT;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [3:0] m_axi_rmem10_ARQOS;
  (* RS_HS = "m_axi_rmem10_AR.ready" *)input m_axi_rmem10_ARREADY;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [2:0] m_axi_rmem10_ARSIZE;
  (* RS_HS = "m_axi_rmem10_AR.valid" *)output m_axi_rmem10_ARVALID;
  (* RS_HS = "m_axi_rmem10_AW.data" *)output [63:0] m_axi_rmem10_AWADDR;
  (* RS_HS = "m_axi_rmem10_AW.data" *)output [1:0] m_axi_rmem10_AWBURST;
  (* RS_HS = "m_axi_rmem10_AW.data" *)output [3:0] m_axi_rmem10_AWCACHE;
  (* RS_HS = "m_axi_rmem10_AW.data" *)output [1:0] m_axi_rmem10_AWID;
  (* RS_HS = "m_axi_rmem10_AW.data" *)output [7:0] m_axi_rmem10_AWLEN;
  (* RS_HS = "m_axi_rmem10_AW.data" *)output m_axi_rmem10_AWLOCK;
  (* RS_HS = "m_axi_rmem10_AW.data" *)output [2:0] m_axi_rmem10_AWPROT;
  (* RS_HS = "m_axi_rmem10_AW.data" *)output [3:0] m_axi_rmem10_AWQOS;
  (* RS_HS = "m_axi_rmem10_AW.ready" *)input m_axi_rmem10_AWREADY;
  (* RS_HS = "m_axi_rmem10_AW.data" *)output [2:0] m_axi_rmem10_AWSIZE;
  (* RS_HS = "m_axi_rmem10_AW.valid" *)output m_axi_rmem10_AWVALID;
  (* RS_HS = "m_axi_rmem10_B.data" *)input [1:0] m_axi_rmem10_BID;
  (* RS_HS = "m_axi_rmem10_B.ready" *)output m_axi_rmem10_BREADY;
  (* RS_HS = "m_axi_rmem10_B.data" *)input [1:0] m_axi_rmem10_BRESP;
  (* RS_HS = "m_axi_rmem10_B.valid" *)input m_axi_rmem10_BVALID;
  (* RS_HS = "m_axi_rmem10_R.data" *)input [511:0] m_axi_rmem10_RDATA;
  (* RS_HS = "m_axi_rmem10_R.data" *)input [1:0] m_axi_rmem10_RID;
  (* RS_HS = "m_axi_rmem10_R.data" *)input m_axi_rmem10_RLAST;
  (* RS_HS = "m_axi_rmem10_R.ready" *)output m_axi_rmem10_RREADY;
  (* RS_HS = "m_axi_rmem10_R.data" *)input [1:0] m_axi_rmem10_RRESP;
  (* RS_HS = "m_axi_rmem10_R.valid" *)input m_axi_rmem10_RVALID;
  (* RS_HS = "m_axi_rmem10_W.data" *)output [511:0] m_axi_rmem10_WDATA;
  (* RS_HS = "m_axi_rmem10_W.data" *)output m_axi_rmem10_WLAST;
  (* RS_HS = "m_axi_rmem10_W.ready" *)input m_axi_rmem10_WREADY;
  (* RS_HS = "m_axi_rmem10_W.data" *)output [63:0] m_axi_rmem10_WSTRB;
  (* RS_HS = "m_axi_rmem10_W.valid" *)output m_axi_rmem10_WVALID;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [63:0] m_axi_rmem11_ARADDR;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [1:0] m_axi_rmem11_ARBURST;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [3:0] m_axi_rmem11_ARCACHE;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [1:0] m_axi_rmem11_ARID;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [7:0] m_axi_rmem11_ARLEN;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output m_axi_rmem11_ARLOCK;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [2:0] m_axi_rmem11_ARPROT;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [3:0] m_axi_rmem11_ARQOS;
  (* RS_HS = "m_axi_rmem11_AR.ready" *)input m_axi_rmem11_ARREADY;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [2:0] m_axi_rmem11_ARSIZE;
  (* RS_HS = "m_axi_rmem11_AR.valid" *)output m_axi_rmem11_ARVALID;
  (* RS_HS = "m_axi_rmem11_AW.data" *)output [63:0] m_axi_rmem11_AWADDR;
  (* RS_HS = "m_axi_rmem11_AW.data" *)output [1:0] m_axi_rmem11_AWBURST;
  (* RS_HS = "m_axi_rmem11_AW.data" *)output [3:0] m_axi_rmem11_AWCACHE;
  (* RS_HS = "m_axi_rmem11_AW.data" *)output [1:0] m_axi_rmem11_AWID;
  (* RS_HS = "m_axi_rmem11_AW.data" *)output [7:0] m_axi_rmem11_AWLEN;
  (* RS_HS = "m_axi_rmem11_AW.data" *)output m_axi_rmem11_AWLOCK;
  (* RS_HS = "m_axi_rmem11_AW.data" *)output [2:0] m_axi_rmem11_AWPROT;
  (* RS_HS = "m_axi_rmem11_AW.data" *)output [3:0] m_axi_rmem11_AWQOS;
  (* RS_HS = "m_axi_rmem11_AW.ready" *)input m_axi_rmem11_AWREADY;
  (* RS_HS = "m_axi_rmem11_AW.data" *)output [2:0] m_axi_rmem11_AWSIZE;
  (* RS_HS = "m_axi_rmem11_AW.valid" *)output m_axi_rmem11_AWVALID;
  (* RS_HS = "m_axi_rmem11_B.data" *)input [1:0] m_axi_rmem11_BID;
  (* RS_HS = "m_axi_rmem11_B.ready" *)output m_axi_rmem11_BREADY;
  (* RS_HS = "m_axi_rmem11_B.data" *)input [1:0] m_axi_rmem11_BRESP;
  (* RS_HS = "m_axi_rmem11_B.valid" *)input m_axi_rmem11_BVALID;
  (* RS_HS = "m_axi_rmem11_R.data" *)input [511:0] m_axi_rmem11_RDATA;
  (* RS_HS = "m_axi_rmem11_R.data" *)input [1:0] m_axi_rmem11_RID;
  (* RS_HS = "m_axi_rmem11_R.data" *)input m_axi_rmem11_RLAST;
  (* RS_HS = "m_axi_rmem11_R.ready" *)output m_axi_rmem11_RREADY;
  (* RS_HS = "m_axi_rmem11_R.data" *)input [1:0] m_axi_rmem11_RRESP;
  (* RS_HS = "m_axi_rmem11_R.valid" *)input m_axi_rmem11_RVALID;
  (* RS_HS = "m_axi_rmem11_W.data" *)output [511:0] m_axi_rmem11_WDATA;
  (* RS_HS = "m_axi_rmem11_W.data" *)output m_axi_rmem11_WLAST;
  (* RS_HS = "m_axi_rmem11_W.ready" *)input m_axi_rmem11_WREADY;
  (* RS_HS = "m_axi_rmem11_W.data" *)output [63:0] m_axi_rmem11_WSTRB;
  (* RS_HS = "m_axi_rmem11_W.valid" *)output m_axi_rmem11_WVALID;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [63:0] m_axi_rmem12_ARADDR;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [1:0] m_axi_rmem12_ARBURST;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [3:0] m_axi_rmem12_ARCACHE;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [1:0] m_axi_rmem12_ARID;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [7:0] m_axi_rmem12_ARLEN;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output m_axi_rmem12_ARLOCK;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [2:0] m_axi_rmem12_ARPROT;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [3:0] m_axi_rmem12_ARQOS;
  (* RS_HS = "m_axi_rmem12_AR.ready" *)input m_axi_rmem12_ARREADY;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [2:0] m_axi_rmem12_ARSIZE;
  (* RS_HS = "m_axi_rmem12_AR.valid" *)output m_axi_rmem12_ARVALID;
  (* RS_HS = "m_axi_rmem12_AW.data" *)output [63:0] m_axi_rmem12_AWADDR;
  (* RS_HS = "m_axi_rmem12_AW.data" *)output [1:0] m_axi_rmem12_AWBURST;
  (* RS_HS = "m_axi_rmem12_AW.data" *)output [3:0] m_axi_rmem12_AWCACHE;
  (* RS_HS = "m_axi_rmem12_AW.data" *)output [1:0] m_axi_rmem12_AWID;
  (* RS_HS = "m_axi_rmem12_AW.data" *)output [7:0] m_axi_rmem12_AWLEN;
  (* RS_HS = "m_axi_rmem12_AW.data" *)output m_axi_rmem12_AWLOCK;
  (* RS_HS = "m_axi_rmem12_AW.data" *)output [2:0] m_axi_rmem12_AWPROT;
  (* RS_HS = "m_axi_rmem12_AW.data" *)output [3:0] m_axi_rmem12_AWQOS;
  (* RS_HS = "m_axi_rmem12_AW.ready" *)input m_axi_rmem12_AWREADY;
  (* RS_HS = "m_axi_rmem12_AW.data" *)output [2:0] m_axi_rmem12_AWSIZE;
  (* RS_HS = "m_axi_rmem12_AW.valid" *)output m_axi_rmem12_AWVALID;
  (* RS_HS = "m_axi_rmem12_B.data" *)input [1:0] m_axi_rmem12_BID;
  (* RS_HS = "m_axi_rmem12_B.ready" *)output m_axi_rmem12_BREADY;
  (* RS_HS = "m_axi_rmem12_B.data" *)input [1:0] m_axi_rmem12_BRESP;
  (* RS_HS = "m_axi_rmem12_B.valid" *)input m_axi_rmem12_BVALID;
  (* RS_HS = "m_axi_rmem12_R.data" *)input [511:0] m_axi_rmem12_RDATA;
  (* RS_HS = "m_axi_rmem12_R.data" *)input [1:0] m_axi_rmem12_RID;
  (* RS_HS = "m_axi_rmem12_R.data" *)input m_axi_rmem12_RLAST;
  (* RS_HS = "m_axi_rmem12_R.ready" *)output m_axi_rmem12_RREADY;
  (* RS_HS = "m_axi_rmem12_R.data" *)input [1:0] m_axi_rmem12_RRESP;
  (* RS_HS = "m_axi_rmem12_R.valid" *)input m_axi_rmem12_RVALID;
  (* RS_HS = "m_axi_rmem12_W.data" *)output [511:0] m_axi_rmem12_WDATA;
  (* RS_HS = "m_axi_rmem12_W.data" *)output m_axi_rmem12_WLAST;
  (* RS_HS = "m_axi_rmem12_W.ready" *)input m_axi_rmem12_WREADY;
  (* RS_HS = "m_axi_rmem12_W.data" *)output [63:0] m_axi_rmem12_WSTRB;
  (* RS_HS = "m_axi_rmem12_W.valid" *)output m_axi_rmem12_WVALID;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [63:0] m_axi_rmem13_ARADDR;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [1:0] m_axi_rmem13_ARBURST;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [3:0] m_axi_rmem13_ARCACHE;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [1:0] m_axi_rmem13_ARID;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [7:0] m_axi_rmem13_ARLEN;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output m_axi_rmem13_ARLOCK;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [2:0] m_axi_rmem13_ARPROT;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [3:0] m_axi_rmem13_ARQOS;
  (* RS_HS = "m_axi_rmem13_AR.ready" *)input m_axi_rmem13_ARREADY;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [2:0] m_axi_rmem13_ARSIZE;
  (* RS_HS = "m_axi_rmem13_AR.valid" *)output m_axi_rmem13_ARVALID;
  (* RS_HS = "m_axi_rmem13_AW.data" *)output [63:0] m_axi_rmem13_AWADDR;
  (* RS_HS = "m_axi_rmem13_AW.data" *)output [1:0] m_axi_rmem13_AWBURST;
  (* RS_HS = "m_axi_rmem13_AW.data" *)output [3:0] m_axi_rmem13_AWCACHE;
  (* RS_HS = "m_axi_rmem13_AW.data" *)output [1:0] m_axi_rmem13_AWID;
  (* RS_HS = "m_axi_rmem13_AW.data" *)output [7:0] m_axi_rmem13_AWLEN;
  (* RS_HS = "m_axi_rmem13_AW.data" *)output m_axi_rmem13_AWLOCK;
  (* RS_HS = "m_axi_rmem13_AW.data" *)output [2:0] m_axi_rmem13_AWPROT;
  (* RS_HS = "m_axi_rmem13_AW.data" *)output [3:0] m_axi_rmem13_AWQOS;
  (* RS_HS = "m_axi_rmem13_AW.ready" *)input m_axi_rmem13_AWREADY;
  (* RS_HS = "m_axi_rmem13_AW.data" *)output [2:0] m_axi_rmem13_AWSIZE;
  (* RS_HS = "m_axi_rmem13_AW.valid" *)output m_axi_rmem13_AWVALID;
  (* RS_HS = "m_axi_rmem13_B.data" *)input [1:0] m_axi_rmem13_BID;
  (* RS_HS = "m_axi_rmem13_B.ready" *)output m_axi_rmem13_BREADY;
  (* RS_HS = "m_axi_rmem13_B.data" *)input [1:0] m_axi_rmem13_BRESP;
  (* RS_HS = "m_axi_rmem13_B.valid" *)input m_axi_rmem13_BVALID;
  (* RS_HS = "m_axi_rmem13_R.data" *)input [511:0] m_axi_rmem13_RDATA;
  (* RS_HS = "m_axi_rmem13_R.data" *)input [1:0] m_axi_rmem13_RID;
  (* RS_HS = "m_axi_rmem13_R.data" *)input m_axi_rmem13_RLAST;
  (* RS_HS = "m_axi_rmem13_R.ready" *)output m_axi_rmem13_RREADY;
  (* RS_HS = "m_axi_rmem13_R.data" *)input [1:0] m_axi_rmem13_RRESP;
  (* RS_HS = "m_axi_rmem13_R.valid" *)input m_axi_rmem13_RVALID;
  (* RS_HS = "m_axi_rmem13_W.data" *)output [511:0] m_axi_rmem13_WDATA;
  (* RS_HS = "m_axi_rmem13_W.data" *)output m_axi_rmem13_WLAST;
  (* RS_HS = "m_axi_rmem13_W.ready" *)input m_axi_rmem13_WREADY;
  (* RS_HS = "m_axi_rmem13_W.data" *)output [63:0] m_axi_rmem13_WSTRB;
  (* RS_HS = "m_axi_rmem13_W.valid" *)output m_axi_rmem13_WVALID;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [63:0] m_axi_rmem14_ARADDR;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [1:0] m_axi_rmem14_ARBURST;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [3:0] m_axi_rmem14_ARCACHE;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [1:0] m_axi_rmem14_ARID;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [7:0] m_axi_rmem14_ARLEN;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output m_axi_rmem14_ARLOCK;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [2:0] m_axi_rmem14_ARPROT;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [3:0] m_axi_rmem14_ARQOS;
  (* RS_HS = "m_axi_rmem14_AR.ready" *)input m_axi_rmem14_ARREADY;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [2:0] m_axi_rmem14_ARSIZE;
  (* RS_HS = "m_axi_rmem14_AR.valid" *)output m_axi_rmem14_ARVALID;
  (* RS_HS = "m_axi_rmem14_AW.data" *)output [63:0] m_axi_rmem14_AWADDR;
  (* RS_HS = "m_axi_rmem14_AW.data" *)output [1:0] m_axi_rmem14_AWBURST;
  (* RS_HS = "m_axi_rmem14_AW.data" *)output [3:0] m_axi_rmem14_AWCACHE;
  (* RS_HS = "m_axi_rmem14_AW.data" *)output [1:0] m_axi_rmem14_AWID;
  (* RS_HS = "m_axi_rmem14_AW.data" *)output [7:0] m_axi_rmem14_AWLEN;
  (* RS_HS = "m_axi_rmem14_AW.data" *)output m_axi_rmem14_AWLOCK;
  (* RS_HS = "m_axi_rmem14_AW.data" *)output [2:0] m_axi_rmem14_AWPROT;
  (* RS_HS = "m_axi_rmem14_AW.data" *)output [3:0] m_axi_rmem14_AWQOS;
  (* RS_HS = "m_axi_rmem14_AW.ready" *)input m_axi_rmem14_AWREADY;
  (* RS_HS = "m_axi_rmem14_AW.data" *)output [2:0] m_axi_rmem14_AWSIZE;
  (* RS_HS = "m_axi_rmem14_AW.valid" *)output m_axi_rmem14_AWVALID;
  (* RS_HS = "m_axi_rmem14_B.data" *)input [1:0] m_axi_rmem14_BID;
  (* RS_HS = "m_axi_rmem14_B.ready" *)output m_axi_rmem14_BREADY;
  (* RS_HS = "m_axi_rmem14_B.data" *)input [1:0] m_axi_rmem14_BRESP;
  (* RS_HS = "m_axi_rmem14_B.valid" *)input m_axi_rmem14_BVALID;
  (* RS_HS = "m_axi_rmem14_R.data" *)input [511:0] m_axi_rmem14_RDATA;
  (* RS_HS = "m_axi_rmem14_R.data" *)input [1:0] m_axi_rmem14_RID;
  (* RS_HS = "m_axi_rmem14_R.data" *)input m_axi_rmem14_RLAST;
  (* RS_HS = "m_axi_rmem14_R.ready" *)output m_axi_rmem14_RREADY;
  (* RS_HS = "m_axi_rmem14_R.data" *)input [1:0] m_axi_rmem14_RRESP;
  (* RS_HS = "m_axi_rmem14_R.valid" *)input m_axi_rmem14_RVALID;
  (* RS_HS = "m_axi_rmem14_W.data" *)output [511:0] m_axi_rmem14_WDATA;
  (* RS_HS = "m_axi_rmem14_W.data" *)output m_axi_rmem14_WLAST;
  (* RS_HS = "m_axi_rmem14_W.ready" *)input m_axi_rmem14_WREADY;
  (* RS_HS = "m_axi_rmem14_W.data" *)output [63:0] m_axi_rmem14_WSTRB;
  (* RS_HS = "m_axi_rmem14_W.valid" *)output m_axi_rmem14_WVALID;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [63:0] m_axi_rmem15_ARADDR;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [1:0] m_axi_rmem15_ARBURST;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [3:0] m_axi_rmem15_ARCACHE;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [1:0] m_axi_rmem15_ARID;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [7:0] m_axi_rmem15_ARLEN;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output m_axi_rmem15_ARLOCK;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [2:0] m_axi_rmem15_ARPROT;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [3:0] m_axi_rmem15_ARQOS;
  (* RS_HS = "m_axi_rmem15_AR.ready" *)input m_axi_rmem15_ARREADY;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [2:0] m_axi_rmem15_ARSIZE;
  (* RS_HS = "m_axi_rmem15_AR.valid" *)output m_axi_rmem15_ARVALID;
  (* RS_HS = "m_axi_rmem15_AW.data" *)output [63:0] m_axi_rmem15_AWADDR;
  (* RS_HS = "m_axi_rmem15_AW.data" *)output [1:0] m_axi_rmem15_AWBURST;
  (* RS_HS = "m_axi_rmem15_AW.data" *)output [3:0] m_axi_rmem15_AWCACHE;
  (* RS_HS = "m_axi_rmem15_AW.data" *)output [1:0] m_axi_rmem15_AWID;
  (* RS_HS = "m_axi_rmem15_AW.data" *)output [7:0] m_axi_rmem15_AWLEN;
  (* RS_HS = "m_axi_rmem15_AW.data" *)output m_axi_rmem15_AWLOCK;
  (* RS_HS = "m_axi_rmem15_AW.data" *)output [2:0] m_axi_rmem15_AWPROT;
  (* RS_HS = "m_axi_rmem15_AW.data" *)output [3:0] m_axi_rmem15_AWQOS;
  (* RS_HS = "m_axi_rmem15_AW.ready" *)input m_axi_rmem15_AWREADY;
  (* RS_HS = "m_axi_rmem15_AW.data" *)output [2:0] m_axi_rmem15_AWSIZE;
  (* RS_HS = "m_axi_rmem15_AW.valid" *)output m_axi_rmem15_AWVALID;
  (* RS_HS = "m_axi_rmem15_B.data" *)input [1:0] m_axi_rmem15_BID;
  (* RS_HS = "m_axi_rmem15_B.ready" *)output m_axi_rmem15_BREADY;
  (* RS_HS = "m_axi_rmem15_B.data" *)input [1:0] m_axi_rmem15_BRESP;
  (* RS_HS = "m_axi_rmem15_B.valid" *)input m_axi_rmem15_BVALID;
  (* RS_HS = "m_axi_rmem15_R.data" *)input [511:0] m_axi_rmem15_RDATA;
  (* RS_HS = "m_axi_rmem15_R.data" *)input [1:0] m_axi_rmem15_RID;
  (* RS_HS = "m_axi_rmem15_R.data" *)input m_axi_rmem15_RLAST;
  (* RS_HS = "m_axi_rmem15_R.ready" *)output m_axi_rmem15_RREADY;
  (* RS_HS = "m_axi_rmem15_R.data" *)input [1:0] m_axi_rmem15_RRESP;
  (* RS_HS = "m_axi_rmem15_R.valid" *)input m_axi_rmem15_RVALID;
  (* RS_HS = "m_axi_rmem15_W.data" *)output [511:0] m_axi_rmem15_WDATA;
  (* RS_HS = "m_axi_rmem15_W.data" *)output m_axi_rmem15_WLAST;
  (* RS_HS = "m_axi_rmem15_W.ready" *)input m_axi_rmem15_WREADY;
  (* RS_HS = "m_axi_rmem15_W.data" *)output [63:0] m_axi_rmem15_WSTRB;
  (* RS_HS = "m_axi_rmem15_W.valid" *)output m_axi_rmem15_WVALID;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [63:0] m_axi_rmem16_ARADDR;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [1:0] m_axi_rmem16_ARBURST;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [3:0] m_axi_rmem16_ARCACHE;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [1:0] m_axi_rmem16_ARID;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [7:0] m_axi_rmem16_ARLEN;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output m_axi_rmem16_ARLOCK;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [2:0] m_axi_rmem16_ARPROT;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [3:0] m_axi_rmem16_ARQOS;
  (* RS_HS = "m_axi_rmem16_AR.ready" *)input m_axi_rmem16_ARREADY;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [2:0] m_axi_rmem16_ARSIZE;
  (* RS_HS = "m_axi_rmem16_AR.valid" *)output m_axi_rmem16_ARVALID;
  (* RS_HS = "m_axi_rmem16_AW.data" *)output [63:0] m_axi_rmem16_AWADDR;
  (* RS_HS = "m_axi_rmem16_AW.data" *)output [1:0] m_axi_rmem16_AWBURST;
  (* RS_HS = "m_axi_rmem16_AW.data" *)output [3:0] m_axi_rmem16_AWCACHE;
  (* RS_HS = "m_axi_rmem16_AW.data" *)output [1:0] m_axi_rmem16_AWID;
  (* RS_HS = "m_axi_rmem16_AW.data" *)output [7:0] m_axi_rmem16_AWLEN;
  (* RS_HS = "m_axi_rmem16_AW.data" *)output m_axi_rmem16_AWLOCK;
  (* RS_HS = "m_axi_rmem16_AW.data" *)output [2:0] m_axi_rmem16_AWPROT;
  (* RS_HS = "m_axi_rmem16_AW.data" *)output [3:0] m_axi_rmem16_AWQOS;
  (* RS_HS = "m_axi_rmem16_AW.ready" *)input m_axi_rmem16_AWREADY;
  (* RS_HS = "m_axi_rmem16_AW.data" *)output [2:0] m_axi_rmem16_AWSIZE;
  (* RS_HS = "m_axi_rmem16_AW.valid" *)output m_axi_rmem16_AWVALID;
  (* RS_HS = "m_axi_rmem16_B.data" *)input [1:0] m_axi_rmem16_BID;
  (* RS_HS = "m_axi_rmem16_B.ready" *)output m_axi_rmem16_BREADY;
  (* RS_HS = "m_axi_rmem16_B.data" *)input [1:0] m_axi_rmem16_BRESP;
  (* RS_HS = "m_axi_rmem16_B.valid" *)input m_axi_rmem16_BVALID;
  (* RS_HS = "m_axi_rmem16_R.data" *)input [511:0] m_axi_rmem16_RDATA;
  (* RS_HS = "m_axi_rmem16_R.data" *)input [1:0] m_axi_rmem16_RID;
  (* RS_HS = "m_axi_rmem16_R.data" *)input m_axi_rmem16_RLAST;
  (* RS_HS = "m_axi_rmem16_R.ready" *)output m_axi_rmem16_RREADY;
  (* RS_HS = "m_axi_rmem16_R.data" *)input [1:0] m_axi_rmem16_RRESP;
  (* RS_HS = "m_axi_rmem16_R.valid" *)input m_axi_rmem16_RVALID;
  (* RS_HS = "m_axi_rmem16_W.data" *)output [511:0] m_axi_rmem16_WDATA;
  (* RS_HS = "m_axi_rmem16_W.data" *)output m_axi_rmem16_WLAST;
  (* RS_HS = "m_axi_rmem16_W.ready" *)input m_axi_rmem16_WREADY;
  (* RS_HS = "m_axi_rmem16_W.data" *)output [63:0] m_axi_rmem16_WSTRB;
  (* RS_HS = "m_axi_rmem16_W.valid" *)output m_axi_rmem16_WVALID;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [63:0] m_axi_rmem17_ARADDR;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [1:0] m_axi_rmem17_ARBURST;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [3:0] m_axi_rmem17_ARCACHE;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [1:0] m_axi_rmem17_ARID;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [7:0] m_axi_rmem17_ARLEN;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output m_axi_rmem17_ARLOCK;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [2:0] m_axi_rmem17_ARPROT;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [3:0] m_axi_rmem17_ARQOS;
  (* RS_HS = "m_axi_rmem17_AR.ready" *)input m_axi_rmem17_ARREADY;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [2:0] m_axi_rmem17_ARSIZE;
  (* RS_HS = "m_axi_rmem17_AR.valid" *)output m_axi_rmem17_ARVALID;
  (* RS_HS = "m_axi_rmem17_AW.data" *)output [63:0] m_axi_rmem17_AWADDR;
  (* RS_HS = "m_axi_rmem17_AW.data" *)output [1:0] m_axi_rmem17_AWBURST;
  (* RS_HS = "m_axi_rmem17_AW.data" *)output [3:0] m_axi_rmem17_AWCACHE;
  (* RS_HS = "m_axi_rmem17_AW.data" *)output [1:0] m_axi_rmem17_AWID;
  (* RS_HS = "m_axi_rmem17_AW.data" *)output [7:0] m_axi_rmem17_AWLEN;
  (* RS_HS = "m_axi_rmem17_AW.data" *)output m_axi_rmem17_AWLOCK;
  (* RS_HS = "m_axi_rmem17_AW.data" *)output [2:0] m_axi_rmem17_AWPROT;
  (* RS_HS = "m_axi_rmem17_AW.data" *)output [3:0] m_axi_rmem17_AWQOS;
  (* RS_HS = "m_axi_rmem17_AW.ready" *)input m_axi_rmem17_AWREADY;
  (* RS_HS = "m_axi_rmem17_AW.data" *)output [2:0] m_axi_rmem17_AWSIZE;
  (* RS_HS = "m_axi_rmem17_AW.valid" *)output m_axi_rmem17_AWVALID;
  (* RS_HS = "m_axi_rmem17_B.data" *)input [1:0] m_axi_rmem17_BID;
  (* RS_HS = "m_axi_rmem17_B.ready" *)output m_axi_rmem17_BREADY;
  (* RS_HS = "m_axi_rmem17_B.data" *)input [1:0] m_axi_rmem17_BRESP;
  (* RS_HS = "m_axi_rmem17_B.valid" *)input m_axi_rmem17_BVALID;
  (* RS_HS = "m_axi_rmem17_R.data" *)input [511:0] m_axi_rmem17_RDATA;
  (* RS_HS = "m_axi_rmem17_R.data" *)input [1:0] m_axi_rmem17_RID;
  (* RS_HS = "m_axi_rmem17_R.data" *)input m_axi_rmem17_RLAST;
  (* RS_HS = "m_axi_rmem17_R.ready" *)output m_axi_rmem17_RREADY;
  (* RS_HS = "m_axi_rmem17_R.data" *)input [1:0] m_axi_rmem17_RRESP;
  (* RS_HS = "m_axi_rmem17_R.valid" *)input m_axi_rmem17_RVALID;
  (* RS_HS = "m_axi_rmem17_W.data" *)output [511:0] m_axi_rmem17_WDATA;
  (* RS_HS = "m_axi_rmem17_W.data" *)output m_axi_rmem17_WLAST;
  (* RS_HS = "m_axi_rmem17_W.ready" *)input m_axi_rmem17_WREADY;
  (* RS_HS = "m_axi_rmem17_W.data" *)output [63:0] m_axi_rmem17_WSTRB;
  (* RS_HS = "m_axi_rmem17_W.valid" *)output m_axi_rmem17_WVALID;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [63:0] m_axi_rmem18_ARADDR;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [1:0] m_axi_rmem18_ARBURST;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [3:0] m_axi_rmem18_ARCACHE;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [1:0] m_axi_rmem18_ARID;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [7:0] m_axi_rmem18_ARLEN;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output m_axi_rmem18_ARLOCK;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [2:0] m_axi_rmem18_ARPROT;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [3:0] m_axi_rmem18_ARQOS;
  (* RS_HS = "m_axi_rmem18_AR.ready" *)input m_axi_rmem18_ARREADY;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [2:0] m_axi_rmem18_ARSIZE;
  (* RS_HS = "m_axi_rmem18_AR.valid" *)output m_axi_rmem18_ARVALID;
  (* RS_HS = "m_axi_rmem18_AW.data" *)output [63:0] m_axi_rmem18_AWADDR;
  (* RS_HS = "m_axi_rmem18_AW.data" *)output [1:0] m_axi_rmem18_AWBURST;
  (* RS_HS = "m_axi_rmem18_AW.data" *)output [3:0] m_axi_rmem18_AWCACHE;
  (* RS_HS = "m_axi_rmem18_AW.data" *)output [1:0] m_axi_rmem18_AWID;
  (* RS_HS = "m_axi_rmem18_AW.data" *)output [7:0] m_axi_rmem18_AWLEN;
  (* RS_HS = "m_axi_rmem18_AW.data" *)output m_axi_rmem18_AWLOCK;
  (* RS_HS = "m_axi_rmem18_AW.data" *)output [2:0] m_axi_rmem18_AWPROT;
  (* RS_HS = "m_axi_rmem18_AW.data" *)output [3:0] m_axi_rmem18_AWQOS;
  (* RS_HS = "m_axi_rmem18_AW.ready" *)input m_axi_rmem18_AWREADY;
  (* RS_HS = "m_axi_rmem18_AW.data" *)output [2:0] m_axi_rmem18_AWSIZE;
  (* RS_HS = "m_axi_rmem18_AW.valid" *)output m_axi_rmem18_AWVALID;
  (* RS_HS = "m_axi_rmem18_B.data" *)input [1:0] m_axi_rmem18_BID;
  (* RS_HS = "m_axi_rmem18_B.ready" *)output m_axi_rmem18_BREADY;
  (* RS_HS = "m_axi_rmem18_B.data" *)input [1:0] m_axi_rmem18_BRESP;
  (* RS_HS = "m_axi_rmem18_B.valid" *)input m_axi_rmem18_BVALID;
  (* RS_HS = "m_axi_rmem18_R.data" *)input [511:0] m_axi_rmem18_RDATA;
  (* RS_HS = "m_axi_rmem18_R.data" *)input [1:0] m_axi_rmem18_RID;
  (* RS_HS = "m_axi_rmem18_R.data" *)input m_axi_rmem18_RLAST;
  (* RS_HS = "m_axi_rmem18_R.ready" *)output m_axi_rmem18_RREADY;
  (* RS_HS = "m_axi_rmem18_R.data" *)input [1:0] m_axi_rmem18_RRESP;
  (* RS_HS = "m_axi_rmem18_R.valid" *)input m_axi_rmem18_RVALID;
  (* RS_HS = "m_axi_rmem18_W.data" *)output [511:0] m_axi_rmem18_WDATA;
  (* RS_HS = "m_axi_rmem18_W.data" *)output m_axi_rmem18_WLAST;
  (* RS_HS = "m_axi_rmem18_W.ready" *)input m_axi_rmem18_WREADY;
  (* RS_HS = "m_axi_rmem18_W.data" *)output [63:0] m_axi_rmem18_WSTRB;
  (* RS_HS = "m_axi_rmem18_W.valid" *)output m_axi_rmem18_WVALID;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [63:0] m_axi_rmem19_ARADDR;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [1:0] m_axi_rmem19_ARBURST;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [3:0] m_axi_rmem19_ARCACHE;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [1:0] m_axi_rmem19_ARID;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [7:0] m_axi_rmem19_ARLEN;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output m_axi_rmem19_ARLOCK;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [2:0] m_axi_rmem19_ARPROT;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [3:0] m_axi_rmem19_ARQOS;
  (* RS_HS = "m_axi_rmem19_AR.ready" *)input m_axi_rmem19_ARREADY;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [2:0] m_axi_rmem19_ARSIZE;
  (* RS_HS = "m_axi_rmem19_AR.valid" *)output m_axi_rmem19_ARVALID;
  (* RS_HS = "m_axi_rmem19_AW.data" *)output [63:0] m_axi_rmem19_AWADDR;
  (* RS_HS = "m_axi_rmem19_AW.data" *)output [1:0] m_axi_rmem19_AWBURST;
  (* RS_HS = "m_axi_rmem19_AW.data" *)output [3:0] m_axi_rmem19_AWCACHE;
  (* RS_HS = "m_axi_rmem19_AW.data" *)output [1:0] m_axi_rmem19_AWID;
  (* RS_HS = "m_axi_rmem19_AW.data" *)output [7:0] m_axi_rmem19_AWLEN;
  (* RS_HS = "m_axi_rmem19_AW.data" *)output m_axi_rmem19_AWLOCK;
  (* RS_HS = "m_axi_rmem19_AW.data" *)output [2:0] m_axi_rmem19_AWPROT;
  (* RS_HS = "m_axi_rmem19_AW.data" *)output [3:0] m_axi_rmem19_AWQOS;
  (* RS_HS = "m_axi_rmem19_AW.ready" *)input m_axi_rmem19_AWREADY;
  (* RS_HS = "m_axi_rmem19_AW.data" *)output [2:0] m_axi_rmem19_AWSIZE;
  (* RS_HS = "m_axi_rmem19_AW.valid" *)output m_axi_rmem19_AWVALID;
  (* RS_HS = "m_axi_rmem19_B.data" *)input [1:0] m_axi_rmem19_BID;
  (* RS_HS = "m_axi_rmem19_B.ready" *)output m_axi_rmem19_BREADY;
  (* RS_HS = "m_axi_rmem19_B.data" *)input [1:0] m_axi_rmem19_BRESP;
  (* RS_HS = "m_axi_rmem19_B.valid" *)input m_axi_rmem19_BVALID;
  (* RS_HS = "m_axi_rmem19_R.data" *)input [511:0] m_axi_rmem19_RDATA;
  (* RS_HS = "m_axi_rmem19_R.data" *)input [1:0] m_axi_rmem19_RID;
  (* RS_HS = "m_axi_rmem19_R.data" *)input m_axi_rmem19_RLAST;
  (* RS_HS = "m_axi_rmem19_R.ready" *)output m_axi_rmem19_RREADY;
  (* RS_HS = "m_axi_rmem19_R.data" *)input [1:0] m_axi_rmem19_RRESP;
  (* RS_HS = "m_axi_rmem19_R.valid" *)input m_axi_rmem19_RVALID;
  (* RS_HS = "m_axi_rmem19_W.data" *)output [511:0] m_axi_rmem19_WDATA;
  (* RS_HS = "m_axi_rmem19_W.data" *)output m_axi_rmem19_WLAST;
  (* RS_HS = "m_axi_rmem19_W.ready" *)input m_axi_rmem19_WREADY;
  (* RS_HS = "m_axi_rmem19_W.data" *)output [63:0] m_axi_rmem19_WSTRB;
  (* RS_HS = "m_axi_rmem19_W.valid" *)output m_axi_rmem19_WVALID;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [63:0] m_axi_rmem20_ARADDR;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [1:0] m_axi_rmem20_ARBURST;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [3:0] m_axi_rmem20_ARCACHE;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [1:0] m_axi_rmem20_ARID;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [7:0] m_axi_rmem20_ARLEN;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output m_axi_rmem20_ARLOCK;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [2:0] m_axi_rmem20_ARPROT;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [3:0] m_axi_rmem20_ARQOS;
  (* RS_HS = "m_axi_rmem20_AR.ready" *)input m_axi_rmem20_ARREADY;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [2:0] m_axi_rmem20_ARSIZE;
  (* RS_HS = "m_axi_rmem20_AR.valid" *)output m_axi_rmem20_ARVALID;
  (* RS_HS = "m_axi_rmem20_AW.data" *)output [63:0] m_axi_rmem20_AWADDR;
  (* RS_HS = "m_axi_rmem20_AW.data" *)output [1:0] m_axi_rmem20_AWBURST;
  (* RS_HS = "m_axi_rmem20_AW.data" *)output [3:0] m_axi_rmem20_AWCACHE;
  (* RS_HS = "m_axi_rmem20_AW.data" *)output [1:0] m_axi_rmem20_AWID;
  (* RS_HS = "m_axi_rmem20_AW.data" *)output [7:0] m_axi_rmem20_AWLEN;
  (* RS_HS = "m_axi_rmem20_AW.data" *)output m_axi_rmem20_AWLOCK;
  (* RS_HS = "m_axi_rmem20_AW.data" *)output [2:0] m_axi_rmem20_AWPROT;
  (* RS_HS = "m_axi_rmem20_AW.data" *)output [3:0] m_axi_rmem20_AWQOS;
  (* RS_HS = "m_axi_rmem20_AW.ready" *)input m_axi_rmem20_AWREADY;
  (* RS_HS = "m_axi_rmem20_AW.data" *)output [2:0] m_axi_rmem20_AWSIZE;
  (* RS_HS = "m_axi_rmem20_AW.valid" *)output m_axi_rmem20_AWVALID;
  (* RS_HS = "m_axi_rmem20_B.data" *)input [1:0] m_axi_rmem20_BID;
  (* RS_HS = "m_axi_rmem20_B.ready" *)output m_axi_rmem20_BREADY;
  (* RS_HS = "m_axi_rmem20_B.data" *)input [1:0] m_axi_rmem20_BRESP;
  (* RS_HS = "m_axi_rmem20_B.valid" *)input m_axi_rmem20_BVALID;
  (* RS_HS = "m_axi_rmem20_R.data" *)input [511:0] m_axi_rmem20_RDATA;
  (* RS_HS = "m_axi_rmem20_R.data" *)input [1:0] m_axi_rmem20_RID;
  (* RS_HS = "m_axi_rmem20_R.data" *)input m_axi_rmem20_RLAST;
  (* RS_HS = "m_axi_rmem20_R.ready" *)output m_axi_rmem20_RREADY;
  (* RS_HS = "m_axi_rmem20_R.data" *)input [1:0] m_axi_rmem20_RRESP;
  (* RS_HS = "m_axi_rmem20_R.valid" *)input m_axi_rmem20_RVALID;
  (* RS_HS = "m_axi_rmem20_W.data" *)output [511:0] m_axi_rmem20_WDATA;
  (* RS_HS = "m_axi_rmem20_W.data" *)output m_axi_rmem20_WLAST;
  (* RS_HS = "m_axi_rmem20_W.ready" *)input m_axi_rmem20_WREADY;
  (* RS_HS = "m_axi_rmem20_W.data" *)output [63:0] m_axi_rmem20_WSTRB;
  (* RS_HS = "m_axi_rmem20_W.valid" *)output m_axi_rmem20_WVALID;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [63:0] m_axi_rmem21_ARADDR;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [1:0] m_axi_rmem21_ARBURST;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [3:0] m_axi_rmem21_ARCACHE;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [1:0] m_axi_rmem21_ARID;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [7:0] m_axi_rmem21_ARLEN;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output m_axi_rmem21_ARLOCK;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [2:0] m_axi_rmem21_ARPROT;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [3:0] m_axi_rmem21_ARQOS;
  (* RS_HS = "m_axi_rmem21_AR.ready" *)input m_axi_rmem21_ARREADY;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [2:0] m_axi_rmem21_ARSIZE;
  (* RS_HS = "m_axi_rmem21_AR.valid" *)output m_axi_rmem21_ARVALID;
  (* RS_HS = "m_axi_rmem21_AW.data" *)output [63:0] m_axi_rmem21_AWADDR;
  (* RS_HS = "m_axi_rmem21_AW.data" *)output [1:0] m_axi_rmem21_AWBURST;
  (* RS_HS = "m_axi_rmem21_AW.data" *)output [3:0] m_axi_rmem21_AWCACHE;
  (* RS_HS = "m_axi_rmem21_AW.data" *)output [1:0] m_axi_rmem21_AWID;
  (* RS_HS = "m_axi_rmem21_AW.data" *)output [7:0] m_axi_rmem21_AWLEN;
  (* RS_HS = "m_axi_rmem21_AW.data" *)output m_axi_rmem21_AWLOCK;
  (* RS_HS = "m_axi_rmem21_AW.data" *)output [2:0] m_axi_rmem21_AWPROT;
  (* RS_HS = "m_axi_rmem21_AW.data" *)output [3:0] m_axi_rmem21_AWQOS;
  (* RS_HS = "m_axi_rmem21_AW.ready" *)input m_axi_rmem21_AWREADY;
  (* RS_HS = "m_axi_rmem21_AW.data" *)output [2:0] m_axi_rmem21_AWSIZE;
  (* RS_HS = "m_axi_rmem21_AW.valid" *)output m_axi_rmem21_AWVALID;
  (* RS_HS = "m_axi_rmem21_B.data" *)input [1:0] m_axi_rmem21_BID;
  (* RS_HS = "m_axi_rmem21_B.ready" *)output m_axi_rmem21_BREADY;
  (* RS_HS = "m_axi_rmem21_B.data" *)input [1:0] m_axi_rmem21_BRESP;
  (* RS_HS = "m_axi_rmem21_B.valid" *)input m_axi_rmem21_BVALID;
  (* RS_HS = "m_axi_rmem21_R.data" *)input [511:0] m_axi_rmem21_RDATA;
  (* RS_HS = "m_axi_rmem21_R.data" *)input [1:0] m_axi_rmem21_RID;
  (* RS_HS = "m_axi_rmem21_R.data" *)input m_axi_rmem21_RLAST;
  (* RS_HS = "m_axi_rmem21_R.ready" *)output m_axi_rmem21_RREADY;
  (* RS_HS = "m_axi_rmem21_R.data" *)input [1:0] m_axi_rmem21_RRESP;
  (* RS_HS = "m_axi_rmem21_R.valid" *)input m_axi_rmem21_RVALID;
  (* RS_HS = "m_axi_rmem21_W.data" *)output [511:0] m_axi_rmem21_WDATA;
  (* RS_HS = "m_axi_rmem21_W.data" *)output m_axi_rmem21_WLAST;
  (* RS_HS = "m_axi_rmem21_W.ready" *)input m_axi_rmem21_WREADY;
  (* RS_HS = "m_axi_rmem21_W.data" *)output [63:0] m_axi_rmem21_WSTRB;
  (* RS_HS = "m_axi_rmem21_W.valid" *)output m_axi_rmem21_WVALID;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [63:0] m_axi_rmem22_ARADDR;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [1:0] m_axi_rmem22_ARBURST;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [3:0] m_axi_rmem22_ARCACHE;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [1:0] m_axi_rmem22_ARID;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [7:0] m_axi_rmem22_ARLEN;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output m_axi_rmem22_ARLOCK;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [2:0] m_axi_rmem22_ARPROT;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [3:0] m_axi_rmem22_ARQOS;
  (* RS_HS = "m_axi_rmem22_AR.ready" *)input m_axi_rmem22_ARREADY;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [2:0] m_axi_rmem22_ARSIZE;
  (* RS_HS = "m_axi_rmem22_AR.valid" *)output m_axi_rmem22_ARVALID;
  (* RS_HS = "m_axi_rmem22_AW.data" *)output [63:0] m_axi_rmem22_AWADDR;
  (* RS_HS = "m_axi_rmem22_AW.data" *)output [1:0] m_axi_rmem22_AWBURST;
  (* RS_HS = "m_axi_rmem22_AW.data" *)output [3:0] m_axi_rmem22_AWCACHE;
  (* RS_HS = "m_axi_rmem22_AW.data" *)output [1:0] m_axi_rmem22_AWID;
  (* RS_HS = "m_axi_rmem22_AW.data" *)output [7:0] m_axi_rmem22_AWLEN;
  (* RS_HS = "m_axi_rmem22_AW.data" *)output m_axi_rmem22_AWLOCK;
  (* RS_HS = "m_axi_rmem22_AW.data" *)output [2:0] m_axi_rmem22_AWPROT;
  (* RS_HS = "m_axi_rmem22_AW.data" *)output [3:0] m_axi_rmem22_AWQOS;
  (* RS_HS = "m_axi_rmem22_AW.ready" *)input m_axi_rmem22_AWREADY;
  (* RS_HS = "m_axi_rmem22_AW.data" *)output [2:0] m_axi_rmem22_AWSIZE;
  (* RS_HS = "m_axi_rmem22_AW.valid" *)output m_axi_rmem22_AWVALID;
  (* RS_HS = "m_axi_rmem22_B.data" *)input [1:0] m_axi_rmem22_BID;
  (* RS_HS = "m_axi_rmem22_B.ready" *)output m_axi_rmem22_BREADY;
  (* RS_HS = "m_axi_rmem22_B.data" *)input [1:0] m_axi_rmem22_BRESP;
  (* RS_HS = "m_axi_rmem22_B.valid" *)input m_axi_rmem22_BVALID;
  (* RS_HS = "m_axi_rmem22_R.data" *)input [511:0] m_axi_rmem22_RDATA;
  (* RS_HS = "m_axi_rmem22_R.data" *)input [1:0] m_axi_rmem22_RID;
  (* RS_HS = "m_axi_rmem22_R.data" *)input m_axi_rmem22_RLAST;
  (* RS_HS = "m_axi_rmem22_R.ready" *)output m_axi_rmem22_RREADY;
  (* RS_HS = "m_axi_rmem22_R.data" *)input [1:0] m_axi_rmem22_RRESP;
  (* RS_HS = "m_axi_rmem22_R.valid" *)input m_axi_rmem22_RVALID;
  (* RS_HS = "m_axi_rmem22_W.data" *)output [511:0] m_axi_rmem22_WDATA;
  (* RS_HS = "m_axi_rmem22_W.data" *)output m_axi_rmem22_WLAST;
  (* RS_HS = "m_axi_rmem22_W.ready" *)input m_axi_rmem22_WREADY;
  (* RS_HS = "m_axi_rmem22_W.data" *)output [63:0] m_axi_rmem22_WSTRB;
  (* RS_HS = "m_axi_rmem22_W.valid" *)output m_axi_rmem22_WVALID;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [63:0] m_axi_rmem23_ARADDR;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [1:0] m_axi_rmem23_ARBURST;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [3:0] m_axi_rmem23_ARCACHE;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [1:0] m_axi_rmem23_ARID;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [7:0] m_axi_rmem23_ARLEN;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output m_axi_rmem23_ARLOCK;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [2:0] m_axi_rmem23_ARPROT;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [3:0] m_axi_rmem23_ARQOS;
  (* RS_HS = "m_axi_rmem23_AR.ready" *)input m_axi_rmem23_ARREADY;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [2:0] m_axi_rmem23_ARSIZE;
  (* RS_HS = "m_axi_rmem23_AR.valid" *)output m_axi_rmem23_ARVALID;
  (* RS_HS = "m_axi_rmem23_AW.data" *)output [63:0] m_axi_rmem23_AWADDR;
  (* RS_HS = "m_axi_rmem23_AW.data" *)output [1:0] m_axi_rmem23_AWBURST;
  (* RS_HS = "m_axi_rmem23_AW.data" *)output [3:0] m_axi_rmem23_AWCACHE;
  (* RS_HS = "m_axi_rmem23_AW.data" *)output [1:0] m_axi_rmem23_AWID;
  (* RS_HS = "m_axi_rmem23_AW.data" *)output [7:0] m_axi_rmem23_AWLEN;
  (* RS_HS = "m_axi_rmem23_AW.data" *)output m_axi_rmem23_AWLOCK;
  (* RS_HS = "m_axi_rmem23_AW.data" *)output [2:0] m_axi_rmem23_AWPROT;
  (* RS_HS = "m_axi_rmem23_AW.data" *)output [3:0] m_axi_rmem23_AWQOS;
  (* RS_HS = "m_axi_rmem23_AW.ready" *)input m_axi_rmem23_AWREADY;
  (* RS_HS = "m_axi_rmem23_AW.data" *)output [2:0] m_axi_rmem23_AWSIZE;
  (* RS_HS = "m_axi_rmem23_AW.valid" *)output m_axi_rmem23_AWVALID;
  (* RS_HS = "m_axi_rmem23_B.data" *)input [1:0] m_axi_rmem23_BID;
  (* RS_HS = "m_axi_rmem23_B.ready" *)output m_axi_rmem23_BREADY;
  (* RS_HS = "m_axi_rmem23_B.data" *)input [1:0] m_axi_rmem23_BRESP;
  (* RS_HS = "m_axi_rmem23_B.valid" *)input m_axi_rmem23_BVALID;
  (* RS_HS = "m_axi_rmem23_R.data" *)input [511:0] m_axi_rmem23_RDATA;
  (* RS_HS = "m_axi_rmem23_R.data" *)input [1:0] m_axi_rmem23_RID;
  (* RS_HS = "m_axi_rmem23_R.data" *)input m_axi_rmem23_RLAST;
  (* RS_HS = "m_axi_rmem23_R.ready" *)output m_axi_rmem23_RREADY;
  (* RS_HS = "m_axi_rmem23_R.data" *)input [1:0] m_axi_rmem23_RRESP;
  (* RS_HS = "m_axi_rmem23_R.valid" *)input m_axi_rmem23_RVALID;
  (* RS_HS = "m_axi_rmem23_W.data" *)output [511:0] m_axi_rmem23_WDATA;
  (* RS_HS = "m_axi_rmem23_W.data" *)output m_axi_rmem23_WLAST;
  (* RS_HS = "m_axi_rmem23_W.ready" *)input m_axi_rmem23_WREADY;
  (* RS_HS = "m_axi_rmem23_W.data" *)output [63:0] m_axi_rmem23_WSTRB;
  (* RS_HS = "m_axi_rmem23_W.valid" *)output m_axi_rmem23_WVALID;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [63:0] m_axi_rmem24_ARADDR;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [1:0] m_axi_rmem24_ARBURST;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [3:0] m_axi_rmem24_ARCACHE;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [1:0] m_axi_rmem24_ARID;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [7:0] m_axi_rmem24_ARLEN;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output m_axi_rmem24_ARLOCK;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [2:0] m_axi_rmem24_ARPROT;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [3:0] m_axi_rmem24_ARQOS;
  (* RS_HS = "m_axi_rmem24_AR.ready" *)input m_axi_rmem24_ARREADY;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [2:0] m_axi_rmem24_ARSIZE;
  (* RS_HS = "m_axi_rmem24_AR.valid" *)output m_axi_rmem24_ARVALID;
  (* RS_HS = "m_axi_rmem24_AW.data" *)output [63:0] m_axi_rmem24_AWADDR;
  (* RS_HS = "m_axi_rmem24_AW.data" *)output [1:0] m_axi_rmem24_AWBURST;
  (* RS_HS = "m_axi_rmem24_AW.data" *)output [3:0] m_axi_rmem24_AWCACHE;
  (* RS_HS = "m_axi_rmem24_AW.data" *)output [1:0] m_axi_rmem24_AWID;
  (* RS_HS = "m_axi_rmem24_AW.data" *)output [7:0] m_axi_rmem24_AWLEN;
  (* RS_HS = "m_axi_rmem24_AW.data" *)output m_axi_rmem24_AWLOCK;
  (* RS_HS = "m_axi_rmem24_AW.data" *)output [2:0] m_axi_rmem24_AWPROT;
  (* RS_HS = "m_axi_rmem24_AW.data" *)output [3:0] m_axi_rmem24_AWQOS;
  (* RS_HS = "m_axi_rmem24_AW.ready" *)input m_axi_rmem24_AWREADY;
  (* RS_HS = "m_axi_rmem24_AW.data" *)output [2:0] m_axi_rmem24_AWSIZE;
  (* RS_HS = "m_axi_rmem24_AW.valid" *)output m_axi_rmem24_AWVALID;
  (* RS_HS = "m_axi_rmem24_B.data" *)input [1:0] m_axi_rmem24_BID;
  (* RS_HS = "m_axi_rmem24_B.ready" *)output m_axi_rmem24_BREADY;
  (* RS_HS = "m_axi_rmem24_B.data" *)input [1:0] m_axi_rmem24_BRESP;
  (* RS_HS = "m_axi_rmem24_B.valid" *)input m_axi_rmem24_BVALID;
  (* RS_HS = "m_axi_rmem24_R.data" *)input [511:0] m_axi_rmem24_RDATA;
  (* RS_HS = "m_axi_rmem24_R.data" *)input [1:0] m_axi_rmem24_RID;
  (* RS_HS = "m_axi_rmem24_R.data" *)input m_axi_rmem24_RLAST;
  (* RS_HS = "m_axi_rmem24_R.ready" *)output m_axi_rmem24_RREADY;
  (* RS_HS = "m_axi_rmem24_R.data" *)input [1:0] m_axi_rmem24_RRESP;
  (* RS_HS = "m_axi_rmem24_R.valid" *)input m_axi_rmem24_RVALID;
  (* RS_HS = "m_axi_rmem24_W.data" *)output [511:0] m_axi_rmem24_WDATA;
  (* RS_HS = "m_axi_rmem24_W.data" *)output m_axi_rmem24_WLAST;
  (* RS_HS = "m_axi_rmem24_W.ready" *)input m_axi_rmem24_WREADY;
  (* RS_HS = "m_axi_rmem24_W.data" *)output [63:0] m_axi_rmem24_WSTRB;
  (* RS_HS = "m_axi_rmem24_W.valid" *)output m_axi_rmem24_WVALID;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [63:0] m_axi_rmem25_ARADDR;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [1:0] m_axi_rmem25_ARBURST;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [3:0] m_axi_rmem25_ARCACHE;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [1:0] m_axi_rmem25_ARID;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [7:0] m_axi_rmem25_ARLEN;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output m_axi_rmem25_ARLOCK;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [2:0] m_axi_rmem25_ARPROT;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [3:0] m_axi_rmem25_ARQOS;
  (* RS_HS = "m_axi_rmem25_AR.ready" *)input m_axi_rmem25_ARREADY;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [2:0] m_axi_rmem25_ARSIZE;
  (* RS_HS = "m_axi_rmem25_AR.valid" *)output m_axi_rmem25_ARVALID;
  (* RS_HS = "m_axi_rmem25_AW.data" *)output [63:0] m_axi_rmem25_AWADDR;
  (* RS_HS = "m_axi_rmem25_AW.data" *)output [1:0] m_axi_rmem25_AWBURST;
  (* RS_HS = "m_axi_rmem25_AW.data" *)output [3:0] m_axi_rmem25_AWCACHE;
  (* RS_HS = "m_axi_rmem25_AW.data" *)output [1:0] m_axi_rmem25_AWID;
  (* RS_HS = "m_axi_rmem25_AW.data" *)output [7:0] m_axi_rmem25_AWLEN;
  (* RS_HS = "m_axi_rmem25_AW.data" *)output m_axi_rmem25_AWLOCK;
  (* RS_HS = "m_axi_rmem25_AW.data" *)output [2:0] m_axi_rmem25_AWPROT;
  (* RS_HS = "m_axi_rmem25_AW.data" *)output [3:0] m_axi_rmem25_AWQOS;
  (* RS_HS = "m_axi_rmem25_AW.ready" *)input m_axi_rmem25_AWREADY;
  (* RS_HS = "m_axi_rmem25_AW.data" *)output [2:0] m_axi_rmem25_AWSIZE;
  (* RS_HS = "m_axi_rmem25_AW.valid" *)output m_axi_rmem25_AWVALID;
  (* RS_HS = "m_axi_rmem25_B.data" *)input [1:0] m_axi_rmem25_BID;
  (* RS_HS = "m_axi_rmem25_B.ready" *)output m_axi_rmem25_BREADY;
  (* RS_HS = "m_axi_rmem25_B.data" *)input [1:0] m_axi_rmem25_BRESP;
  (* RS_HS = "m_axi_rmem25_B.valid" *)input m_axi_rmem25_BVALID;
  (* RS_HS = "m_axi_rmem25_R.data" *)input [511:0] m_axi_rmem25_RDATA;
  (* RS_HS = "m_axi_rmem25_R.data" *)input [1:0] m_axi_rmem25_RID;
  (* RS_HS = "m_axi_rmem25_R.data" *)input m_axi_rmem25_RLAST;
  (* RS_HS = "m_axi_rmem25_R.ready" *)output m_axi_rmem25_RREADY;
  (* RS_HS = "m_axi_rmem25_R.data" *)input [1:0] m_axi_rmem25_RRESP;
  (* RS_HS = "m_axi_rmem25_R.valid" *)input m_axi_rmem25_RVALID;
  (* RS_HS = "m_axi_rmem25_W.data" *)output [511:0] m_axi_rmem25_WDATA;
  (* RS_HS = "m_axi_rmem25_W.data" *)output m_axi_rmem25_WLAST;
  (* RS_HS = "m_axi_rmem25_W.ready" *)input m_axi_rmem25_WREADY;
  (* RS_HS = "m_axi_rmem25_W.data" *)output [63:0] m_axi_rmem25_WSTRB;
  (* RS_HS = "m_axi_rmem25_W.valid" *)output m_axi_rmem25_WVALID;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [63:0] m_axi_rmem26_ARADDR;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [1:0] m_axi_rmem26_ARBURST;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [3:0] m_axi_rmem26_ARCACHE;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [1:0] m_axi_rmem26_ARID;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [7:0] m_axi_rmem26_ARLEN;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output m_axi_rmem26_ARLOCK;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [2:0] m_axi_rmem26_ARPROT;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [3:0] m_axi_rmem26_ARQOS;
  (* RS_HS = "m_axi_rmem26_AR.ready" *)input m_axi_rmem26_ARREADY;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [2:0] m_axi_rmem26_ARSIZE;
  (* RS_HS = "m_axi_rmem26_AR.valid" *)output m_axi_rmem26_ARVALID;
  (* RS_HS = "m_axi_rmem26_AW.data" *)output [63:0] m_axi_rmem26_AWADDR;
  (* RS_HS = "m_axi_rmem26_AW.data" *)output [1:0] m_axi_rmem26_AWBURST;
  (* RS_HS = "m_axi_rmem26_AW.data" *)output [3:0] m_axi_rmem26_AWCACHE;
  (* RS_HS = "m_axi_rmem26_AW.data" *)output [1:0] m_axi_rmem26_AWID;
  (* RS_HS = "m_axi_rmem26_AW.data" *)output [7:0] m_axi_rmem26_AWLEN;
  (* RS_HS = "m_axi_rmem26_AW.data" *)output m_axi_rmem26_AWLOCK;
  (* RS_HS = "m_axi_rmem26_AW.data" *)output [2:0] m_axi_rmem26_AWPROT;
  (* RS_HS = "m_axi_rmem26_AW.data" *)output [3:0] m_axi_rmem26_AWQOS;
  (* RS_HS = "m_axi_rmem26_AW.ready" *)input m_axi_rmem26_AWREADY;
  (* RS_HS = "m_axi_rmem26_AW.data" *)output [2:0] m_axi_rmem26_AWSIZE;
  (* RS_HS = "m_axi_rmem26_AW.valid" *)output m_axi_rmem26_AWVALID;
  (* RS_HS = "m_axi_rmem26_B.data" *)input [1:0] m_axi_rmem26_BID;
  (* RS_HS = "m_axi_rmem26_B.ready" *)output m_axi_rmem26_BREADY;
  (* RS_HS = "m_axi_rmem26_B.data" *)input [1:0] m_axi_rmem26_BRESP;
  (* RS_HS = "m_axi_rmem26_B.valid" *)input m_axi_rmem26_BVALID;
  (* RS_HS = "m_axi_rmem26_R.data" *)input [511:0] m_axi_rmem26_RDATA;
  (* RS_HS = "m_axi_rmem26_R.data" *)input [1:0] m_axi_rmem26_RID;
  (* RS_HS = "m_axi_rmem26_R.data" *)input m_axi_rmem26_RLAST;
  (* RS_HS = "m_axi_rmem26_R.ready" *)output m_axi_rmem26_RREADY;
  (* RS_HS = "m_axi_rmem26_R.data" *)input [1:0] m_axi_rmem26_RRESP;
  (* RS_HS = "m_axi_rmem26_R.valid" *)input m_axi_rmem26_RVALID;
  (* RS_HS = "m_axi_rmem26_W.data" *)output [511:0] m_axi_rmem26_WDATA;
  (* RS_HS = "m_axi_rmem26_W.data" *)output m_axi_rmem26_WLAST;
  (* RS_HS = "m_axi_rmem26_W.ready" *)input m_axi_rmem26_WREADY;
  (* RS_HS = "m_axi_rmem26_W.data" *)output [63:0] m_axi_rmem26_WSTRB;
  (* RS_HS = "m_axi_rmem26_W.valid" *)output m_axi_rmem26_WVALID;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [63:0] m_axi_rmem27_ARADDR;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [1:0] m_axi_rmem27_ARBURST;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [3:0] m_axi_rmem27_ARCACHE;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [1:0] m_axi_rmem27_ARID;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [7:0] m_axi_rmem27_ARLEN;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output m_axi_rmem27_ARLOCK;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [2:0] m_axi_rmem27_ARPROT;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [3:0] m_axi_rmem27_ARQOS;
  (* RS_HS = "m_axi_rmem27_AR.ready" *)input m_axi_rmem27_ARREADY;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [2:0] m_axi_rmem27_ARSIZE;
  (* RS_HS = "m_axi_rmem27_AR.valid" *)output m_axi_rmem27_ARVALID;
  (* RS_HS = "m_axi_rmem27_AW.data" *)output [63:0] m_axi_rmem27_AWADDR;
  (* RS_HS = "m_axi_rmem27_AW.data" *)output [1:0] m_axi_rmem27_AWBURST;
  (* RS_HS = "m_axi_rmem27_AW.data" *)output [3:0] m_axi_rmem27_AWCACHE;
  (* RS_HS = "m_axi_rmem27_AW.data" *)output [1:0] m_axi_rmem27_AWID;
  (* RS_HS = "m_axi_rmem27_AW.data" *)output [7:0] m_axi_rmem27_AWLEN;
  (* RS_HS = "m_axi_rmem27_AW.data" *)output m_axi_rmem27_AWLOCK;
  (* RS_HS = "m_axi_rmem27_AW.data" *)output [2:0] m_axi_rmem27_AWPROT;
  (* RS_HS = "m_axi_rmem27_AW.data" *)output [3:0] m_axi_rmem27_AWQOS;
  (* RS_HS = "m_axi_rmem27_AW.ready" *)input m_axi_rmem27_AWREADY;
  (* RS_HS = "m_axi_rmem27_AW.data" *)output [2:0] m_axi_rmem27_AWSIZE;
  (* RS_HS = "m_axi_rmem27_AW.valid" *)output m_axi_rmem27_AWVALID;
  (* RS_HS = "m_axi_rmem27_B.data" *)input [1:0] m_axi_rmem27_BID;
  (* RS_HS = "m_axi_rmem27_B.ready" *)output m_axi_rmem27_BREADY;
  (* RS_HS = "m_axi_rmem27_B.data" *)input [1:0] m_axi_rmem27_BRESP;
  (* RS_HS = "m_axi_rmem27_B.valid" *)input m_axi_rmem27_BVALID;
  (* RS_HS = "m_axi_rmem27_R.data" *)input [511:0] m_axi_rmem27_RDATA;
  (* RS_HS = "m_axi_rmem27_R.data" *)input [1:0] m_axi_rmem27_RID;
  (* RS_HS = "m_axi_rmem27_R.data" *)input m_axi_rmem27_RLAST;
  (* RS_HS = "m_axi_rmem27_R.ready" *)output m_axi_rmem27_RREADY;
  (* RS_HS = "m_axi_rmem27_R.data" *)input [1:0] m_axi_rmem27_RRESP;
  (* RS_HS = "m_axi_rmem27_R.valid" *)input m_axi_rmem27_RVALID;
  (* RS_HS = "m_axi_rmem27_W.data" *)output [511:0] m_axi_rmem27_WDATA;
  (* RS_HS = "m_axi_rmem27_W.data" *)output m_axi_rmem27_WLAST;
  (* RS_HS = "m_axi_rmem27_W.ready" *)input m_axi_rmem27_WREADY;
  (* RS_HS = "m_axi_rmem27_W.data" *)output [63:0] m_axi_rmem27_WSTRB;
  (* RS_HS = "m_axi_rmem27_W.valid" *)output m_axi_rmem27_WVALID;

endmodule
