`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO = "vadd_bw_vadd_bw,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu50-fsvh2104-2-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2276,HLS_SYN_LUT=4136,HLS_VERSION=2022_2}" *)


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
  ap_idle,
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
  m_axi_rmem0_RDATA,
  m_axi_rmem0_RID,
  m_axi_rmem0_RLAST,
  m_axi_rmem0_RREADY,
  m_axi_rmem0_RRESP,
  m_axi_rmem0_RVALID,
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
  m_axi_rmem1_RDATA,
  m_axi_rmem1_RID,
  m_axi_rmem1_RLAST,
  m_axi_rmem1_RREADY,
  m_axi_rmem1_RRESP,
  m_axi_rmem1_RVALID,
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
  m_axi_rmem2_RDATA,
  m_axi_rmem2_RID,
  m_axi_rmem2_RLAST,
  m_axi_rmem2_RREADY,
  m_axi_rmem2_RRESP,
  m_axi_rmem2_RVALID,
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
  m_axi_rmem3_RDATA,
  m_axi_rmem3_RID,
  m_axi_rmem3_RLAST,
  m_axi_rmem3_RREADY,
  m_axi_rmem3_RRESP,
  m_axi_rmem3_RVALID,
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
  m_axi_rmem4_RDATA,
  m_axi_rmem4_RID,
  m_axi_rmem4_RLAST,
  m_axi_rmem4_RREADY,
  m_axi_rmem4_RRESP,
  m_axi_rmem4_RVALID,
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
  m_axi_rmem5_RDATA,
  m_axi_rmem5_RID,
  m_axi_rmem5_RLAST,
  m_axi_rmem5_RREADY,
  m_axi_rmem5_RRESP,
  m_axi_rmem5_RVALID,
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
  m_axi_rmem6_RDATA,
  m_axi_rmem6_RID,
  m_axi_rmem6_RLAST,
  m_axi_rmem6_RREADY,
  m_axi_rmem6_RRESP,
  m_axi_rmem6_RVALID,
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
  m_axi_rmem7_RDATA,
  m_axi_rmem7_RID,
  m_axi_rmem7_RLAST,
  m_axi_rmem7_RREADY,
  m_axi_rmem7_RRESP,
  m_axi_rmem7_RVALID,
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
  m_axi_rmem8_RDATA,
  m_axi_rmem8_RID,
  m_axi_rmem8_RLAST,
  m_axi_rmem8_RREADY,
  m_axi_rmem8_RRESP,
  m_axi_rmem8_RVALID,
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
  m_axi_rmem9_RDATA,
  m_axi_rmem9_RID,
  m_axi_rmem9_RLAST,
  m_axi_rmem9_RREADY,
  m_axi_rmem9_RRESP,
  m_axi_rmem9_RVALID,
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
  m_axi_rmem10_RDATA,
  m_axi_rmem10_RID,
  m_axi_rmem10_RLAST,
  m_axi_rmem10_RREADY,
  m_axi_rmem10_RRESP,
  m_axi_rmem10_RVALID,
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
  m_axi_rmem11_RDATA,
  m_axi_rmem11_RID,
  m_axi_rmem11_RLAST,
  m_axi_rmem11_RREADY,
  m_axi_rmem11_RRESP,
  m_axi_rmem11_RVALID,
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
  m_axi_rmem12_RDATA,
  m_axi_rmem12_RID,
  m_axi_rmem12_RLAST,
  m_axi_rmem12_RREADY,
  m_axi_rmem12_RRESP,
  m_axi_rmem12_RVALID,
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
  m_axi_rmem13_RDATA,
  m_axi_rmem13_RID,
  m_axi_rmem13_RLAST,
  m_axi_rmem13_RREADY,
  m_axi_rmem13_RRESP,
  m_axi_rmem13_RVALID,
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
  m_axi_rmem14_RDATA,
  m_axi_rmem14_RID,
  m_axi_rmem14_RLAST,
  m_axi_rmem14_RREADY,
  m_axi_rmem14_RRESP,
  m_axi_rmem14_RVALID,
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
  m_axi_rmem15_RDATA,
  m_axi_rmem15_RID,
  m_axi_rmem15_RLAST,
  m_axi_rmem15_RREADY,
  m_axi_rmem15_RRESP,
  m_axi_rmem15_RVALID,
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
  m_axi_rmem16_RDATA,
  m_axi_rmem16_RID,
  m_axi_rmem16_RLAST,
  m_axi_rmem16_RREADY,
  m_axi_rmem16_RRESP,
  m_axi_rmem16_RVALID,
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
  m_axi_rmem17_RDATA,
  m_axi_rmem17_RID,
  m_axi_rmem17_RLAST,
  m_axi_rmem17_RREADY,
  m_axi_rmem17_RRESP,
  m_axi_rmem17_RVALID,
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
  m_axi_rmem18_RDATA,
  m_axi_rmem18_RID,
  m_axi_rmem18_RLAST,
  m_axi_rmem18_RREADY,
  m_axi_rmem18_RRESP,
  m_axi_rmem18_RVALID,
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
  m_axi_rmem19_RDATA,
  m_axi_rmem19_RID,
  m_axi_rmem19_RLAST,
  m_axi_rmem19_RREADY,
  m_axi_rmem19_RRESP,
  m_axi_rmem19_RVALID,
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
  m_axi_rmem20_RDATA,
  m_axi_rmem20_RID,
  m_axi_rmem20_RLAST,
  m_axi_rmem20_RREADY,
  m_axi_rmem20_RRESP,
  m_axi_rmem20_RVALID,
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
  m_axi_rmem21_RDATA,
  m_axi_rmem21_RID,
  m_axi_rmem21_RLAST,
  m_axi_rmem21_RREADY,
  m_axi_rmem21_RRESP,
  m_axi_rmem21_RVALID,
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
  m_axi_rmem22_RDATA,
  m_axi_rmem22_RID,
  m_axi_rmem22_RLAST,
  m_axi_rmem22_RREADY,
  m_axi_rmem22_RRESP,
  m_axi_rmem22_RVALID,
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
  m_axi_rmem23_RDATA,
  m_axi_rmem23_RID,
  m_axi_rmem23_RLAST,
  m_axi_rmem23_RREADY,
  m_axi_rmem23_RRESP,
  m_axi_rmem23_RVALID,
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
  m_axi_rmem24_RDATA,
  m_axi_rmem24_RID,
  m_axi_rmem24_RLAST,
  m_axi_rmem24_RREADY,
  m_axi_rmem24_RRESP,
  m_axi_rmem24_RVALID,
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
  m_axi_rmem25_RDATA,
  m_axi_rmem25_RID,
  m_axi_rmem25_RLAST,
  m_axi_rmem25_RREADY,
  m_axi_rmem25_RRESP,
  m_axi_rmem25_RVALID,
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
  m_axi_rmem26_RDATA,
  m_axi_rmem26_RID,
  m_axi_rmem26_RLAST,
  m_axi_rmem26_RREADY,
  m_axi_rmem26_RRESP,
  m_axi_rmem26_RVALID,
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
  m_axi_rmem27_RDATA,
  m_axi_rmem27_RID,
  m_axi_rmem27_RLAST,
  m_axi_rmem27_RREADY,
  m_axi_rmem27_RRESP,
  m_axi_rmem27_RVALID,
  m_axi_rmem28_ARADDR,
  m_axi_rmem28_ARBURST,
  m_axi_rmem28_ARCACHE,
  m_axi_rmem28_ARID,
  m_axi_rmem28_ARLEN,
  m_axi_rmem28_ARLOCK,
  m_axi_rmem28_ARPROT,
  m_axi_rmem28_ARQOS,
  m_axi_rmem28_ARREADY,
  m_axi_rmem28_ARSIZE,
  m_axi_rmem28_ARVALID,
  m_axi_rmem28_RDATA,
  m_axi_rmem28_RID,
  m_axi_rmem28_RLAST,
  m_axi_rmem28_RREADY,
  m_axi_rmem28_RRESP,
  m_axi_rmem28_RVALID,
  m_axi_rmem29_ARADDR,
  m_axi_rmem29_ARBURST,
  m_axi_rmem29_ARCACHE,
  m_axi_rmem29_ARID,
  m_axi_rmem29_ARLEN,
  m_axi_rmem29_ARLOCK,
  m_axi_rmem29_ARPROT,
  m_axi_rmem29_ARQOS,
  m_axi_rmem29_ARREADY,
  m_axi_rmem29_ARSIZE,
  m_axi_rmem29_ARVALID,
  m_axi_rmem29_RDATA,
  m_axi_rmem29_RID,
  m_axi_rmem29_RLAST,
  m_axi_rmem29_RREADY,
  m_axi_rmem29_RRESP,
  m_axi_rmem29_RVALID,
  m_axi_wmem0_AWADDR,
  m_axi_wmem0_AWBURST,
  m_axi_wmem0_AWCACHE,
  m_axi_wmem0_AWID,
  m_axi_wmem0_AWLEN,
  m_axi_wmem0_AWLOCK,
  m_axi_wmem0_AWPROT,
  m_axi_wmem0_AWQOS,
  m_axi_wmem0_AWREADY,
  m_axi_wmem0_AWSIZE,
  m_axi_wmem0_AWVALID,
  m_axi_wmem0_BID,
  m_axi_wmem0_BREADY,
  m_axi_wmem0_BRESP,
  m_axi_wmem0_BVALID,
  m_axi_wmem0_WDATA,
  m_axi_wmem0_WLAST,
  m_axi_wmem0_WREADY,
  m_axi_wmem0_WSTRB,
  m_axi_wmem0_WVALID
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
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [0:0] m_axi_rmem0_ARID;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [7:0] m_axi_rmem0_ARLEN;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output m_axi_rmem0_ARLOCK;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [2:0] m_axi_rmem0_ARPROT;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [3:0] m_axi_rmem0_ARQOS;
  (* RS_HS = "m_axi_rmem0_AR.ready" *)input m_axi_rmem0_ARREADY;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [2:0] m_axi_rmem0_ARSIZE;
  (* RS_HS = "m_axi_rmem0_AR.valid" *)output m_axi_rmem0_ARVALID;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [511:0] m_axi_rmem0_RDATA;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [0:0] m_axi_rmem0_RID;
  (* RS_HS = "m_axi_rmem0_R.data" *)input m_axi_rmem0_RLAST;
  (* RS_HS = "m_axi_rmem0_R.ready" *)output m_axi_rmem0_RREADY;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [1:0] m_axi_rmem0_RRESP;
  (* RS_HS = "m_axi_rmem0_R.valid" *)input m_axi_rmem0_RVALID;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [63:0] m_axi_rmem1_ARADDR;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [1:0] m_axi_rmem1_ARBURST;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [3:0] m_axi_rmem1_ARCACHE;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [0:0] m_axi_rmem1_ARID;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [7:0] m_axi_rmem1_ARLEN;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output m_axi_rmem1_ARLOCK;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [2:0] m_axi_rmem1_ARPROT;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [3:0] m_axi_rmem1_ARQOS;
  (* RS_HS = "m_axi_rmem1_AR.ready" *)input m_axi_rmem1_ARREADY;
  (* RS_HS = "m_axi_rmem1_AR.data" *)output [2:0] m_axi_rmem1_ARSIZE;
  (* RS_HS = "m_axi_rmem1_AR.valid" *)output m_axi_rmem1_ARVALID;
  (* RS_HS = "m_axi_rmem1_R.data" *)input [511:0] m_axi_rmem1_RDATA;
  (* RS_HS = "m_axi_rmem1_R.data" *)input [0:0] m_axi_rmem1_RID;
  (* RS_HS = "m_axi_rmem1_R.data" *)input m_axi_rmem1_RLAST;
  (* RS_HS = "m_axi_rmem1_R.ready" *)output m_axi_rmem1_RREADY;
  (* RS_HS = "m_axi_rmem1_R.data" *)input [1:0] m_axi_rmem1_RRESP;
  (* RS_HS = "m_axi_rmem1_R.valid" *)input m_axi_rmem1_RVALID;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [63:0] m_axi_rmem2_ARADDR;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [1:0] m_axi_rmem2_ARBURST;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [3:0] m_axi_rmem2_ARCACHE;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [0:0] m_axi_rmem2_ARID;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [7:0] m_axi_rmem2_ARLEN;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output m_axi_rmem2_ARLOCK;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [2:0] m_axi_rmem2_ARPROT;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [3:0] m_axi_rmem2_ARQOS;
  (* RS_HS = "m_axi_rmem2_AR.ready" *)input m_axi_rmem2_ARREADY;
  (* RS_HS = "m_axi_rmem2_AR.data" *)output [2:0] m_axi_rmem2_ARSIZE;
  (* RS_HS = "m_axi_rmem2_AR.valid" *)output m_axi_rmem2_ARVALID;
  (* RS_HS = "m_axi_rmem2_R.data" *)input [511:0] m_axi_rmem2_RDATA;
  (* RS_HS = "m_axi_rmem2_R.data" *)input [0:0] m_axi_rmem2_RID;
  (* RS_HS = "m_axi_rmem2_R.data" *)input m_axi_rmem2_RLAST;
  (* RS_HS = "m_axi_rmem2_R.ready" *)output m_axi_rmem2_RREADY;
  (* RS_HS = "m_axi_rmem2_R.data" *)input [1:0] m_axi_rmem2_RRESP;
  (* RS_HS = "m_axi_rmem2_R.valid" *)input m_axi_rmem2_RVALID;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [63:0] m_axi_rmem3_ARADDR;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [1:0] m_axi_rmem3_ARBURST;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [3:0] m_axi_rmem3_ARCACHE;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [0:0] m_axi_rmem3_ARID;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [7:0] m_axi_rmem3_ARLEN;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output m_axi_rmem3_ARLOCK;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [2:0] m_axi_rmem3_ARPROT;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [3:0] m_axi_rmem3_ARQOS;
  (* RS_HS = "m_axi_rmem3_AR.ready" *)input m_axi_rmem3_ARREADY;
  (* RS_HS = "m_axi_rmem3_AR.data" *)output [2:0] m_axi_rmem3_ARSIZE;
  (* RS_HS = "m_axi_rmem3_AR.valid" *)output m_axi_rmem3_ARVALID;
  (* RS_HS = "m_axi_rmem3_R.data" *)input [511:0] m_axi_rmem3_RDATA;
  (* RS_HS = "m_axi_rmem3_R.data" *)input [0:0] m_axi_rmem3_RID;
  (* RS_HS = "m_axi_rmem3_R.data" *)input m_axi_rmem3_RLAST;
  (* RS_HS = "m_axi_rmem3_R.ready" *)output m_axi_rmem3_RREADY;
  (* RS_HS = "m_axi_rmem3_R.data" *)input [1:0] m_axi_rmem3_RRESP;
  (* RS_HS = "m_axi_rmem3_R.valid" *)input m_axi_rmem3_RVALID;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [63:0] m_axi_rmem4_ARADDR;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [1:0] m_axi_rmem4_ARBURST;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [3:0] m_axi_rmem4_ARCACHE;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [0:0] m_axi_rmem4_ARID;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [7:0] m_axi_rmem4_ARLEN;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output m_axi_rmem4_ARLOCK;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [2:0] m_axi_rmem4_ARPROT;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [3:0] m_axi_rmem4_ARQOS;
  (* RS_HS = "m_axi_rmem4_AR.ready" *)input m_axi_rmem4_ARREADY;
  (* RS_HS = "m_axi_rmem4_AR.data" *)output [2:0] m_axi_rmem4_ARSIZE;
  (* RS_HS = "m_axi_rmem4_AR.valid" *)output m_axi_rmem4_ARVALID;
  (* RS_HS = "m_axi_rmem4_R.data" *)input [511:0] m_axi_rmem4_RDATA;
  (* RS_HS = "m_axi_rmem4_R.data" *)input [0:0] m_axi_rmem4_RID;
  (* RS_HS = "m_axi_rmem4_R.data" *)input m_axi_rmem4_RLAST;
  (* RS_HS = "m_axi_rmem4_R.ready" *)output m_axi_rmem4_RREADY;
  (* RS_HS = "m_axi_rmem4_R.data" *)input [1:0] m_axi_rmem4_RRESP;
  (* RS_HS = "m_axi_rmem4_R.valid" *)input m_axi_rmem4_RVALID;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [63:0] m_axi_rmem5_ARADDR;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [1:0] m_axi_rmem5_ARBURST;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [3:0] m_axi_rmem5_ARCACHE;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [0:0] m_axi_rmem5_ARID;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [7:0] m_axi_rmem5_ARLEN;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output m_axi_rmem5_ARLOCK;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [2:0] m_axi_rmem5_ARPROT;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [3:0] m_axi_rmem5_ARQOS;
  (* RS_HS = "m_axi_rmem5_AR.ready" *)input m_axi_rmem5_ARREADY;
  (* RS_HS = "m_axi_rmem5_AR.data" *)output [2:0] m_axi_rmem5_ARSIZE;
  (* RS_HS = "m_axi_rmem5_AR.valid" *)output m_axi_rmem5_ARVALID;
  (* RS_HS = "m_axi_rmem5_R.data" *)input [511:0] m_axi_rmem5_RDATA;
  (* RS_HS = "m_axi_rmem5_R.data" *)input [0:0] m_axi_rmem5_RID;
  (* RS_HS = "m_axi_rmem5_R.data" *)input m_axi_rmem5_RLAST;
  (* RS_HS = "m_axi_rmem5_R.ready" *)output m_axi_rmem5_RREADY;
  (* RS_HS = "m_axi_rmem5_R.data" *)input [1:0] m_axi_rmem5_RRESP;
  (* RS_HS = "m_axi_rmem5_R.valid" *)input m_axi_rmem5_RVALID;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [63:0] m_axi_rmem6_ARADDR;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [1:0] m_axi_rmem6_ARBURST;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [3:0] m_axi_rmem6_ARCACHE;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [0:0] m_axi_rmem6_ARID;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [7:0] m_axi_rmem6_ARLEN;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output m_axi_rmem6_ARLOCK;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [2:0] m_axi_rmem6_ARPROT;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [3:0] m_axi_rmem6_ARQOS;
  (* RS_HS = "m_axi_rmem6_AR.ready" *)input m_axi_rmem6_ARREADY;
  (* RS_HS = "m_axi_rmem6_AR.data" *)output [2:0] m_axi_rmem6_ARSIZE;
  (* RS_HS = "m_axi_rmem6_AR.valid" *)output m_axi_rmem6_ARVALID;
  (* RS_HS = "m_axi_rmem6_R.data" *)input [511:0] m_axi_rmem6_RDATA;
  (* RS_HS = "m_axi_rmem6_R.data" *)input [0:0] m_axi_rmem6_RID;
  (* RS_HS = "m_axi_rmem6_R.data" *)input m_axi_rmem6_RLAST;
  (* RS_HS = "m_axi_rmem6_R.ready" *)output m_axi_rmem6_RREADY;
  (* RS_HS = "m_axi_rmem6_R.data" *)input [1:0] m_axi_rmem6_RRESP;
  (* RS_HS = "m_axi_rmem6_R.valid" *)input m_axi_rmem6_RVALID;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [63:0] m_axi_rmem7_ARADDR;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [1:0] m_axi_rmem7_ARBURST;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [3:0] m_axi_rmem7_ARCACHE;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [0:0] m_axi_rmem7_ARID;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [7:0] m_axi_rmem7_ARLEN;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output m_axi_rmem7_ARLOCK;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [2:0] m_axi_rmem7_ARPROT;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [3:0] m_axi_rmem7_ARQOS;
  (* RS_HS = "m_axi_rmem7_AR.ready" *)input m_axi_rmem7_ARREADY;
  (* RS_HS = "m_axi_rmem7_AR.data" *)output [2:0] m_axi_rmem7_ARSIZE;
  (* RS_HS = "m_axi_rmem7_AR.valid" *)output m_axi_rmem7_ARVALID;
  (* RS_HS = "m_axi_rmem7_R.data" *)input [511:0] m_axi_rmem7_RDATA;
  (* RS_HS = "m_axi_rmem7_R.data" *)input [0:0] m_axi_rmem7_RID;
  (* RS_HS = "m_axi_rmem7_R.data" *)input m_axi_rmem7_RLAST;
  (* RS_HS = "m_axi_rmem7_R.ready" *)output m_axi_rmem7_RREADY;
  (* RS_HS = "m_axi_rmem7_R.data" *)input [1:0] m_axi_rmem7_RRESP;
  (* RS_HS = "m_axi_rmem7_R.valid" *)input m_axi_rmem7_RVALID;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [63:0] m_axi_rmem8_ARADDR;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [1:0] m_axi_rmem8_ARBURST;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [3:0] m_axi_rmem8_ARCACHE;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [0:0] m_axi_rmem8_ARID;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [7:0] m_axi_rmem8_ARLEN;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output m_axi_rmem8_ARLOCK;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [2:0] m_axi_rmem8_ARPROT;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [3:0] m_axi_rmem8_ARQOS;
  (* RS_HS = "m_axi_rmem8_AR.ready" *)input m_axi_rmem8_ARREADY;
  (* RS_HS = "m_axi_rmem8_AR.data" *)output [2:0] m_axi_rmem8_ARSIZE;
  (* RS_HS = "m_axi_rmem8_AR.valid" *)output m_axi_rmem8_ARVALID;
  (* RS_HS = "m_axi_rmem8_R.data" *)input [511:0] m_axi_rmem8_RDATA;
  (* RS_HS = "m_axi_rmem8_R.data" *)input [0:0] m_axi_rmem8_RID;
  (* RS_HS = "m_axi_rmem8_R.data" *)input m_axi_rmem8_RLAST;
  (* RS_HS = "m_axi_rmem8_R.ready" *)output m_axi_rmem8_RREADY;
  (* RS_HS = "m_axi_rmem8_R.data" *)input [1:0] m_axi_rmem8_RRESP;
  (* RS_HS = "m_axi_rmem8_R.valid" *)input m_axi_rmem8_RVALID;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [63:0] m_axi_rmem9_ARADDR;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [1:0] m_axi_rmem9_ARBURST;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [3:0] m_axi_rmem9_ARCACHE;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [0:0] m_axi_rmem9_ARID;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [7:0] m_axi_rmem9_ARLEN;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output m_axi_rmem9_ARLOCK;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [2:0] m_axi_rmem9_ARPROT;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [3:0] m_axi_rmem9_ARQOS;
  (* RS_HS = "m_axi_rmem9_AR.ready" *)input m_axi_rmem9_ARREADY;
  (* RS_HS = "m_axi_rmem9_AR.data" *)output [2:0] m_axi_rmem9_ARSIZE;
  (* RS_HS = "m_axi_rmem9_AR.valid" *)output m_axi_rmem9_ARVALID;
  (* RS_HS = "m_axi_rmem9_R.data" *)input [511:0] m_axi_rmem9_RDATA;
  (* RS_HS = "m_axi_rmem9_R.data" *)input [0:0] m_axi_rmem9_RID;
  (* RS_HS = "m_axi_rmem9_R.data" *)input m_axi_rmem9_RLAST;
  (* RS_HS = "m_axi_rmem9_R.ready" *)output m_axi_rmem9_RREADY;
  (* RS_HS = "m_axi_rmem9_R.data" *)input [1:0] m_axi_rmem9_RRESP;
  (* RS_HS = "m_axi_rmem9_R.valid" *)input m_axi_rmem9_RVALID;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [63:0] m_axi_rmem10_ARADDR;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [1:0] m_axi_rmem10_ARBURST;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [3:0] m_axi_rmem10_ARCACHE;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [0:0] m_axi_rmem10_ARID;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [7:0] m_axi_rmem10_ARLEN;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output m_axi_rmem10_ARLOCK;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [2:0] m_axi_rmem10_ARPROT;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [3:0] m_axi_rmem10_ARQOS;
  (* RS_HS = "m_axi_rmem10_AR.ready" *)input m_axi_rmem10_ARREADY;
  (* RS_HS = "m_axi_rmem10_AR.data" *)output [2:0] m_axi_rmem10_ARSIZE;
  (* RS_HS = "m_axi_rmem10_AR.valid" *)output m_axi_rmem10_ARVALID;
  (* RS_HS = "m_axi_rmem10_R.data" *)input [511:0] m_axi_rmem10_RDATA;
  (* RS_HS = "m_axi_rmem10_R.data" *)input [0:0] m_axi_rmem10_RID;
  (* RS_HS = "m_axi_rmem10_R.data" *)input m_axi_rmem10_RLAST;
  (* RS_HS = "m_axi_rmem10_R.ready" *)output m_axi_rmem10_RREADY;
  (* RS_HS = "m_axi_rmem10_R.data" *)input [1:0] m_axi_rmem10_RRESP;
  (* RS_HS = "m_axi_rmem10_R.valid" *)input m_axi_rmem10_RVALID;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [63:0] m_axi_rmem11_ARADDR;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [1:0] m_axi_rmem11_ARBURST;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [3:0] m_axi_rmem11_ARCACHE;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [0:0] m_axi_rmem11_ARID;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [7:0] m_axi_rmem11_ARLEN;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output m_axi_rmem11_ARLOCK;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [2:0] m_axi_rmem11_ARPROT;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [3:0] m_axi_rmem11_ARQOS;
  (* RS_HS = "m_axi_rmem11_AR.ready" *)input m_axi_rmem11_ARREADY;
  (* RS_HS = "m_axi_rmem11_AR.data" *)output [2:0] m_axi_rmem11_ARSIZE;
  (* RS_HS = "m_axi_rmem11_AR.valid" *)output m_axi_rmem11_ARVALID;
  (* RS_HS = "m_axi_rmem11_R.data" *)input [511:0] m_axi_rmem11_RDATA;
  (* RS_HS = "m_axi_rmem11_R.data" *)input [0:0] m_axi_rmem11_RID;
  (* RS_HS = "m_axi_rmem11_R.data" *)input m_axi_rmem11_RLAST;
  (* RS_HS = "m_axi_rmem11_R.ready" *)output m_axi_rmem11_RREADY;
  (* RS_HS = "m_axi_rmem11_R.data" *)input [1:0] m_axi_rmem11_RRESP;
  (* RS_HS = "m_axi_rmem11_R.valid" *)input m_axi_rmem11_RVALID;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [63:0] m_axi_rmem12_ARADDR;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [1:0] m_axi_rmem12_ARBURST;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [3:0] m_axi_rmem12_ARCACHE;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [0:0] m_axi_rmem12_ARID;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [7:0] m_axi_rmem12_ARLEN;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output m_axi_rmem12_ARLOCK;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [2:0] m_axi_rmem12_ARPROT;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [3:0] m_axi_rmem12_ARQOS;
  (* RS_HS = "m_axi_rmem12_AR.ready" *)input m_axi_rmem12_ARREADY;
  (* RS_HS = "m_axi_rmem12_AR.data" *)output [2:0] m_axi_rmem12_ARSIZE;
  (* RS_HS = "m_axi_rmem12_AR.valid" *)output m_axi_rmem12_ARVALID;
  (* RS_HS = "m_axi_rmem12_R.data" *)input [511:0] m_axi_rmem12_RDATA;
  (* RS_HS = "m_axi_rmem12_R.data" *)input [0:0] m_axi_rmem12_RID;
  (* RS_HS = "m_axi_rmem12_R.data" *)input m_axi_rmem12_RLAST;
  (* RS_HS = "m_axi_rmem12_R.ready" *)output m_axi_rmem12_RREADY;
  (* RS_HS = "m_axi_rmem12_R.data" *)input [1:0] m_axi_rmem12_RRESP;
  (* RS_HS = "m_axi_rmem12_R.valid" *)input m_axi_rmem12_RVALID;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [63:0] m_axi_rmem13_ARADDR;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [1:0] m_axi_rmem13_ARBURST;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [3:0] m_axi_rmem13_ARCACHE;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [0:0] m_axi_rmem13_ARID;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [7:0] m_axi_rmem13_ARLEN;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output m_axi_rmem13_ARLOCK;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [2:0] m_axi_rmem13_ARPROT;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [3:0] m_axi_rmem13_ARQOS;
  (* RS_HS = "m_axi_rmem13_AR.ready" *)input m_axi_rmem13_ARREADY;
  (* RS_HS = "m_axi_rmem13_AR.data" *)output [2:0] m_axi_rmem13_ARSIZE;
  (* RS_HS = "m_axi_rmem13_AR.valid" *)output m_axi_rmem13_ARVALID;
  (* RS_HS = "m_axi_rmem13_R.data" *)input [511:0] m_axi_rmem13_RDATA;
  (* RS_HS = "m_axi_rmem13_R.data" *)input [0:0] m_axi_rmem13_RID;
  (* RS_HS = "m_axi_rmem13_R.data" *)input m_axi_rmem13_RLAST;
  (* RS_HS = "m_axi_rmem13_R.ready" *)output m_axi_rmem13_RREADY;
  (* RS_HS = "m_axi_rmem13_R.data" *)input [1:0] m_axi_rmem13_RRESP;
  (* RS_HS = "m_axi_rmem13_R.valid" *)input m_axi_rmem13_RVALID;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [63:0] m_axi_rmem14_ARADDR;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [1:0] m_axi_rmem14_ARBURST;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [3:0] m_axi_rmem14_ARCACHE;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [0:0] m_axi_rmem14_ARID;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [7:0] m_axi_rmem14_ARLEN;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output m_axi_rmem14_ARLOCK;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [2:0] m_axi_rmem14_ARPROT;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [3:0] m_axi_rmem14_ARQOS;
  (* RS_HS = "m_axi_rmem14_AR.ready" *)input m_axi_rmem14_ARREADY;
  (* RS_HS = "m_axi_rmem14_AR.data" *)output [2:0] m_axi_rmem14_ARSIZE;
  (* RS_HS = "m_axi_rmem14_AR.valid" *)output m_axi_rmem14_ARVALID;
  (* RS_HS = "m_axi_rmem14_R.data" *)input [511:0] m_axi_rmem14_RDATA;
  (* RS_HS = "m_axi_rmem14_R.data" *)input [0:0] m_axi_rmem14_RID;
  (* RS_HS = "m_axi_rmem14_R.data" *)input m_axi_rmem14_RLAST;
  (* RS_HS = "m_axi_rmem14_R.ready" *)output m_axi_rmem14_RREADY;
  (* RS_HS = "m_axi_rmem14_R.data" *)input [1:0] m_axi_rmem14_RRESP;
  (* RS_HS = "m_axi_rmem14_R.valid" *)input m_axi_rmem14_RVALID;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [63:0] m_axi_rmem15_ARADDR;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [1:0] m_axi_rmem15_ARBURST;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [3:0] m_axi_rmem15_ARCACHE;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [0:0] m_axi_rmem15_ARID;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [7:0] m_axi_rmem15_ARLEN;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output m_axi_rmem15_ARLOCK;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [2:0] m_axi_rmem15_ARPROT;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [3:0] m_axi_rmem15_ARQOS;
  (* RS_HS = "m_axi_rmem15_AR.ready" *)input m_axi_rmem15_ARREADY;
  (* RS_HS = "m_axi_rmem15_AR.data" *)output [2:0] m_axi_rmem15_ARSIZE;
  (* RS_HS = "m_axi_rmem15_AR.valid" *)output m_axi_rmem15_ARVALID;
  (* RS_HS = "m_axi_rmem15_R.data" *)input [511:0] m_axi_rmem15_RDATA;
  (* RS_HS = "m_axi_rmem15_R.data" *)input [0:0] m_axi_rmem15_RID;
  (* RS_HS = "m_axi_rmem15_R.data" *)input m_axi_rmem15_RLAST;
  (* RS_HS = "m_axi_rmem15_R.ready" *)output m_axi_rmem15_RREADY;
  (* RS_HS = "m_axi_rmem15_R.data" *)input [1:0] m_axi_rmem15_RRESP;
  (* RS_HS = "m_axi_rmem15_R.valid" *)input m_axi_rmem15_RVALID;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [63:0] m_axi_rmem16_ARADDR;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [1:0] m_axi_rmem16_ARBURST;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [3:0] m_axi_rmem16_ARCACHE;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [0:0] m_axi_rmem16_ARID;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [7:0] m_axi_rmem16_ARLEN;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output m_axi_rmem16_ARLOCK;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [2:0] m_axi_rmem16_ARPROT;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [3:0] m_axi_rmem16_ARQOS;
  (* RS_HS = "m_axi_rmem16_AR.ready" *)input m_axi_rmem16_ARREADY;
  (* RS_HS = "m_axi_rmem16_AR.data" *)output [2:0] m_axi_rmem16_ARSIZE;
  (* RS_HS = "m_axi_rmem16_AR.valid" *)output m_axi_rmem16_ARVALID;
  (* RS_HS = "m_axi_rmem16_R.data" *)input [511:0] m_axi_rmem16_RDATA;
  (* RS_HS = "m_axi_rmem16_R.data" *)input [0:0] m_axi_rmem16_RID;
  (* RS_HS = "m_axi_rmem16_R.data" *)input m_axi_rmem16_RLAST;
  (* RS_HS = "m_axi_rmem16_R.ready" *)output m_axi_rmem16_RREADY;
  (* RS_HS = "m_axi_rmem16_R.data" *)input [1:0] m_axi_rmem16_RRESP;
  (* RS_HS = "m_axi_rmem16_R.valid" *)input m_axi_rmem16_RVALID;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [63:0] m_axi_rmem17_ARADDR;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [1:0] m_axi_rmem17_ARBURST;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [3:0] m_axi_rmem17_ARCACHE;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [0:0] m_axi_rmem17_ARID;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [7:0] m_axi_rmem17_ARLEN;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output m_axi_rmem17_ARLOCK;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [2:0] m_axi_rmem17_ARPROT;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [3:0] m_axi_rmem17_ARQOS;
  (* RS_HS = "m_axi_rmem17_AR.ready" *)input m_axi_rmem17_ARREADY;
  (* RS_HS = "m_axi_rmem17_AR.data" *)output [2:0] m_axi_rmem17_ARSIZE;
  (* RS_HS = "m_axi_rmem17_AR.valid" *)output m_axi_rmem17_ARVALID;
  (* RS_HS = "m_axi_rmem17_R.data" *)input [511:0] m_axi_rmem17_RDATA;
  (* RS_HS = "m_axi_rmem17_R.data" *)input [0:0] m_axi_rmem17_RID;
  (* RS_HS = "m_axi_rmem17_R.data" *)input m_axi_rmem17_RLAST;
  (* RS_HS = "m_axi_rmem17_R.ready" *)output m_axi_rmem17_RREADY;
  (* RS_HS = "m_axi_rmem17_R.data" *)input [1:0] m_axi_rmem17_RRESP;
  (* RS_HS = "m_axi_rmem17_R.valid" *)input m_axi_rmem17_RVALID;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [63:0] m_axi_rmem18_ARADDR;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [1:0] m_axi_rmem18_ARBURST;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [3:0] m_axi_rmem18_ARCACHE;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [0:0] m_axi_rmem18_ARID;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [7:0] m_axi_rmem18_ARLEN;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output m_axi_rmem18_ARLOCK;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [2:0] m_axi_rmem18_ARPROT;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [3:0] m_axi_rmem18_ARQOS;
  (* RS_HS = "m_axi_rmem18_AR.ready" *)input m_axi_rmem18_ARREADY;
  (* RS_HS = "m_axi_rmem18_AR.data" *)output [2:0] m_axi_rmem18_ARSIZE;
  (* RS_HS = "m_axi_rmem18_AR.valid" *)output m_axi_rmem18_ARVALID;
  (* RS_HS = "m_axi_rmem18_R.data" *)input [511:0] m_axi_rmem18_RDATA;
  (* RS_HS = "m_axi_rmem18_R.data" *)input [0:0] m_axi_rmem18_RID;
  (* RS_HS = "m_axi_rmem18_R.data" *)input m_axi_rmem18_RLAST;
  (* RS_HS = "m_axi_rmem18_R.ready" *)output m_axi_rmem18_RREADY;
  (* RS_HS = "m_axi_rmem18_R.data" *)input [1:0] m_axi_rmem18_RRESP;
  (* RS_HS = "m_axi_rmem18_R.valid" *)input m_axi_rmem18_RVALID;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [63:0] m_axi_rmem19_ARADDR;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [1:0] m_axi_rmem19_ARBURST;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [3:0] m_axi_rmem19_ARCACHE;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [0:0] m_axi_rmem19_ARID;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [7:0] m_axi_rmem19_ARLEN;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output m_axi_rmem19_ARLOCK;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [2:0] m_axi_rmem19_ARPROT;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [3:0] m_axi_rmem19_ARQOS;
  (* RS_HS = "m_axi_rmem19_AR.ready" *)input m_axi_rmem19_ARREADY;
  (* RS_HS = "m_axi_rmem19_AR.data" *)output [2:0] m_axi_rmem19_ARSIZE;
  (* RS_HS = "m_axi_rmem19_AR.valid" *)output m_axi_rmem19_ARVALID;
  (* RS_HS = "m_axi_rmem19_R.data" *)input [511:0] m_axi_rmem19_RDATA;
  (* RS_HS = "m_axi_rmem19_R.data" *)input [0:0] m_axi_rmem19_RID;
  (* RS_HS = "m_axi_rmem19_R.data" *)input m_axi_rmem19_RLAST;
  (* RS_HS = "m_axi_rmem19_R.ready" *)output m_axi_rmem19_RREADY;
  (* RS_HS = "m_axi_rmem19_R.data" *)input [1:0] m_axi_rmem19_RRESP;
  (* RS_HS = "m_axi_rmem19_R.valid" *)input m_axi_rmem19_RVALID;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [63:0] m_axi_rmem20_ARADDR;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [1:0] m_axi_rmem20_ARBURST;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [3:0] m_axi_rmem20_ARCACHE;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [0:0] m_axi_rmem20_ARID;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [7:0] m_axi_rmem20_ARLEN;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output m_axi_rmem20_ARLOCK;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [2:0] m_axi_rmem20_ARPROT;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [3:0] m_axi_rmem20_ARQOS;
  (* RS_HS = "m_axi_rmem20_AR.ready" *)input m_axi_rmem20_ARREADY;
  (* RS_HS = "m_axi_rmem20_AR.data" *)output [2:0] m_axi_rmem20_ARSIZE;
  (* RS_HS = "m_axi_rmem20_AR.valid" *)output m_axi_rmem20_ARVALID;
  (* RS_HS = "m_axi_rmem20_R.data" *)input [511:0] m_axi_rmem20_RDATA;
  (* RS_HS = "m_axi_rmem20_R.data" *)input [0:0] m_axi_rmem20_RID;
  (* RS_HS = "m_axi_rmem20_R.data" *)input m_axi_rmem20_RLAST;
  (* RS_HS = "m_axi_rmem20_R.ready" *)output m_axi_rmem20_RREADY;
  (* RS_HS = "m_axi_rmem20_R.data" *)input [1:0] m_axi_rmem20_RRESP;
  (* RS_HS = "m_axi_rmem20_R.valid" *)input m_axi_rmem20_RVALID;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [63:0] m_axi_rmem21_ARADDR;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [1:0] m_axi_rmem21_ARBURST;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [3:0] m_axi_rmem21_ARCACHE;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [0:0] m_axi_rmem21_ARID;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [7:0] m_axi_rmem21_ARLEN;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output m_axi_rmem21_ARLOCK;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [2:0] m_axi_rmem21_ARPROT;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [3:0] m_axi_rmem21_ARQOS;
  (* RS_HS = "m_axi_rmem21_AR.ready" *)input m_axi_rmem21_ARREADY;
  (* RS_HS = "m_axi_rmem21_AR.data" *)output [2:0] m_axi_rmem21_ARSIZE;
  (* RS_HS = "m_axi_rmem21_AR.valid" *)output m_axi_rmem21_ARVALID;
  (* RS_HS = "m_axi_rmem21_R.data" *)input [511:0] m_axi_rmem21_RDATA;
  (* RS_HS = "m_axi_rmem21_R.data" *)input [0:0] m_axi_rmem21_RID;
  (* RS_HS = "m_axi_rmem21_R.data" *)input m_axi_rmem21_RLAST;
  (* RS_HS = "m_axi_rmem21_R.ready" *)output m_axi_rmem21_RREADY;
  (* RS_HS = "m_axi_rmem21_R.data" *)input [1:0] m_axi_rmem21_RRESP;
  (* RS_HS = "m_axi_rmem21_R.valid" *)input m_axi_rmem21_RVALID;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [63:0] m_axi_rmem22_ARADDR;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [1:0] m_axi_rmem22_ARBURST;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [3:0] m_axi_rmem22_ARCACHE;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [0:0] m_axi_rmem22_ARID;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [7:0] m_axi_rmem22_ARLEN;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output m_axi_rmem22_ARLOCK;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [2:0] m_axi_rmem22_ARPROT;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [3:0] m_axi_rmem22_ARQOS;
  (* RS_HS = "m_axi_rmem22_AR.ready" *)input m_axi_rmem22_ARREADY;
  (* RS_HS = "m_axi_rmem22_AR.data" *)output [2:0] m_axi_rmem22_ARSIZE;
  (* RS_HS = "m_axi_rmem22_AR.valid" *)output m_axi_rmem22_ARVALID;
  (* RS_HS = "m_axi_rmem22_R.data" *)input [511:0] m_axi_rmem22_RDATA;
  (* RS_HS = "m_axi_rmem22_R.data" *)input [0:0] m_axi_rmem22_RID;
  (* RS_HS = "m_axi_rmem22_R.data" *)input m_axi_rmem22_RLAST;
  (* RS_HS = "m_axi_rmem22_R.ready" *)output m_axi_rmem22_RREADY;
  (* RS_HS = "m_axi_rmem22_R.data" *)input [1:0] m_axi_rmem22_RRESP;
  (* RS_HS = "m_axi_rmem22_R.valid" *)input m_axi_rmem22_RVALID;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [63:0] m_axi_rmem23_ARADDR;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [1:0] m_axi_rmem23_ARBURST;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [3:0] m_axi_rmem23_ARCACHE;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [0:0] m_axi_rmem23_ARID;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [7:0] m_axi_rmem23_ARLEN;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output m_axi_rmem23_ARLOCK;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [2:0] m_axi_rmem23_ARPROT;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [3:0] m_axi_rmem23_ARQOS;
  (* RS_HS = "m_axi_rmem23_AR.ready" *)input m_axi_rmem23_ARREADY;
  (* RS_HS = "m_axi_rmem23_AR.data" *)output [2:0] m_axi_rmem23_ARSIZE;
  (* RS_HS = "m_axi_rmem23_AR.valid" *)output m_axi_rmem23_ARVALID;
  (* RS_HS = "m_axi_rmem23_R.data" *)input [511:0] m_axi_rmem23_RDATA;
  (* RS_HS = "m_axi_rmem23_R.data" *)input [0:0] m_axi_rmem23_RID;
  (* RS_HS = "m_axi_rmem23_R.data" *)input m_axi_rmem23_RLAST;
  (* RS_HS = "m_axi_rmem23_R.ready" *)output m_axi_rmem23_RREADY;
  (* RS_HS = "m_axi_rmem23_R.data" *)input [1:0] m_axi_rmem23_RRESP;
  (* RS_HS = "m_axi_rmem23_R.valid" *)input m_axi_rmem23_RVALID;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [63:0] m_axi_rmem24_ARADDR;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [1:0] m_axi_rmem24_ARBURST;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [3:0] m_axi_rmem24_ARCACHE;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [0:0] m_axi_rmem24_ARID;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [7:0] m_axi_rmem24_ARLEN;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output m_axi_rmem24_ARLOCK;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [2:0] m_axi_rmem24_ARPROT;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [3:0] m_axi_rmem24_ARQOS;
  (* RS_HS = "m_axi_rmem24_AR.ready" *)input m_axi_rmem24_ARREADY;
  (* RS_HS = "m_axi_rmem24_AR.data" *)output [2:0] m_axi_rmem24_ARSIZE;
  (* RS_HS = "m_axi_rmem24_AR.valid" *)output m_axi_rmem24_ARVALID;
  (* RS_HS = "m_axi_rmem24_R.data" *)input [511:0] m_axi_rmem24_RDATA;
  (* RS_HS = "m_axi_rmem24_R.data" *)input [0:0] m_axi_rmem24_RID;
  (* RS_HS = "m_axi_rmem24_R.data" *)input m_axi_rmem24_RLAST;
  (* RS_HS = "m_axi_rmem24_R.ready" *)output m_axi_rmem24_RREADY;
  (* RS_HS = "m_axi_rmem24_R.data" *)input [1:0] m_axi_rmem24_RRESP;
  (* RS_HS = "m_axi_rmem24_R.valid" *)input m_axi_rmem24_RVALID;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [63:0] m_axi_rmem25_ARADDR;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [1:0] m_axi_rmem25_ARBURST;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [3:0] m_axi_rmem25_ARCACHE;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [0:0] m_axi_rmem25_ARID;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [7:0] m_axi_rmem25_ARLEN;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output m_axi_rmem25_ARLOCK;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [2:0] m_axi_rmem25_ARPROT;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [3:0] m_axi_rmem25_ARQOS;
  (* RS_HS = "m_axi_rmem25_AR.ready" *)input m_axi_rmem25_ARREADY;
  (* RS_HS = "m_axi_rmem25_AR.data" *)output [2:0] m_axi_rmem25_ARSIZE;
  (* RS_HS = "m_axi_rmem25_AR.valid" *)output m_axi_rmem25_ARVALID;
  (* RS_HS = "m_axi_rmem25_R.data" *)input [511:0] m_axi_rmem25_RDATA;
  (* RS_HS = "m_axi_rmem25_R.data" *)input [0:0] m_axi_rmem25_RID;
  (* RS_HS = "m_axi_rmem25_R.data" *)input m_axi_rmem25_RLAST;
  (* RS_HS = "m_axi_rmem25_R.ready" *)output m_axi_rmem25_RREADY;
  (* RS_HS = "m_axi_rmem25_R.data" *)input [1:0] m_axi_rmem25_RRESP;
  (* RS_HS = "m_axi_rmem25_R.valid" *)input m_axi_rmem25_RVALID;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [63:0] m_axi_rmem26_ARADDR;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [1:0] m_axi_rmem26_ARBURST;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [3:0] m_axi_rmem26_ARCACHE;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [0:0] m_axi_rmem26_ARID;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [7:0] m_axi_rmem26_ARLEN;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output m_axi_rmem26_ARLOCK;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [2:0] m_axi_rmem26_ARPROT;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [3:0] m_axi_rmem26_ARQOS;
  (* RS_HS = "m_axi_rmem26_AR.ready" *)input m_axi_rmem26_ARREADY;
  (* RS_HS = "m_axi_rmem26_AR.data" *)output [2:0] m_axi_rmem26_ARSIZE;
  (* RS_HS = "m_axi_rmem26_AR.valid" *)output m_axi_rmem26_ARVALID;
  (* RS_HS = "m_axi_rmem26_R.data" *)input [511:0] m_axi_rmem26_RDATA;
  (* RS_HS = "m_axi_rmem26_R.data" *)input [0:0] m_axi_rmem26_RID;
  (* RS_HS = "m_axi_rmem26_R.data" *)input m_axi_rmem26_RLAST;
  (* RS_HS = "m_axi_rmem26_R.ready" *)output m_axi_rmem26_RREADY;
  (* RS_HS = "m_axi_rmem26_R.data" *)input [1:0] m_axi_rmem26_RRESP;
  (* RS_HS = "m_axi_rmem26_R.valid" *)input m_axi_rmem26_RVALID;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [63:0] m_axi_rmem27_ARADDR;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [1:0] m_axi_rmem27_ARBURST;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [3:0] m_axi_rmem27_ARCACHE;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [0:0] m_axi_rmem27_ARID;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [7:0] m_axi_rmem27_ARLEN;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output m_axi_rmem27_ARLOCK;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [2:0] m_axi_rmem27_ARPROT;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [3:0] m_axi_rmem27_ARQOS;
  (* RS_HS = "m_axi_rmem27_AR.ready" *)input m_axi_rmem27_ARREADY;
  (* RS_HS = "m_axi_rmem27_AR.data" *)output [2:0] m_axi_rmem27_ARSIZE;
  (* RS_HS = "m_axi_rmem27_AR.valid" *)output m_axi_rmem27_ARVALID;
  (* RS_HS = "m_axi_rmem27_R.data" *)input [511:0] m_axi_rmem27_RDATA;
  (* RS_HS = "m_axi_rmem27_R.data" *)input [0:0] m_axi_rmem27_RID;
  (* RS_HS = "m_axi_rmem27_R.data" *)input m_axi_rmem27_RLAST;
  (* RS_HS = "m_axi_rmem27_R.ready" *)output m_axi_rmem27_RREADY;
  (* RS_HS = "m_axi_rmem27_R.data" *)input [1:0] m_axi_rmem27_RRESP;
  (* RS_HS = "m_axi_rmem27_R.valid" *)input m_axi_rmem27_RVALID;
  (* RS_HS = "m_axi_rmem28_AR.data" *)output [63:0] m_axi_rmem28_ARADDR;
  (* RS_HS = "m_axi_rmem28_AR.data" *)output [1:0] m_axi_rmem28_ARBURST;
  (* RS_HS = "m_axi_rmem28_AR.data" *)output [3:0] m_axi_rmem28_ARCACHE;
  (* RS_HS = "m_axi_rmem28_AR.data" *)output [0:0] m_axi_rmem28_ARID;
  (* RS_HS = "m_axi_rmem28_AR.data" *)output [7:0] m_axi_rmem28_ARLEN;
  (* RS_HS = "m_axi_rmem28_AR.data" *)output m_axi_rmem28_ARLOCK;
  (* RS_HS = "m_axi_rmem28_AR.data" *)output [2:0] m_axi_rmem28_ARPROT;
  (* RS_HS = "m_axi_rmem28_AR.data" *)output [3:0] m_axi_rmem28_ARQOS;
  (* RS_HS = "m_axi_rmem28_AR.ready" *)input m_axi_rmem28_ARREADY;
  (* RS_HS = "m_axi_rmem28_AR.data" *)output [2:0] m_axi_rmem28_ARSIZE;
  (* RS_HS = "m_axi_rmem28_AR.valid" *)output m_axi_rmem28_ARVALID;
  (* RS_HS = "m_axi_rmem28_R.data" *)input [511:0] m_axi_rmem28_RDATA;
  (* RS_HS = "m_axi_rmem28_R.data" *)input [0:0] m_axi_rmem28_RID;
  (* RS_HS = "m_axi_rmem28_R.data" *)input m_axi_rmem28_RLAST;
  (* RS_HS = "m_axi_rmem28_R.ready" *)output m_axi_rmem28_RREADY;
  (* RS_HS = "m_axi_rmem28_R.data" *)input [1:0] m_axi_rmem28_RRESP;
  (* RS_HS = "m_axi_rmem28_R.valid" *)input m_axi_rmem28_RVALID;
  (* RS_HS = "m_axi_rmem29_AR.data" *)output [63:0] m_axi_rmem29_ARADDR;
  (* RS_HS = "m_axi_rmem29_AR.data" *)output [1:0] m_axi_rmem29_ARBURST;
  (* RS_HS = "m_axi_rmem29_AR.data" *)output [3:0] m_axi_rmem29_ARCACHE;
  (* RS_HS = "m_axi_rmem29_AR.data" *)output [0:0] m_axi_rmem29_ARID;
  (* RS_HS = "m_axi_rmem29_AR.data" *)output [7:0] m_axi_rmem29_ARLEN;
  (* RS_HS = "m_axi_rmem29_AR.data" *)output m_axi_rmem29_ARLOCK;
  (* RS_HS = "m_axi_rmem29_AR.data" *)output [2:0] m_axi_rmem29_ARPROT;
  (* RS_HS = "m_axi_rmem29_AR.data" *)output [3:0] m_axi_rmem29_ARQOS;
  (* RS_HS = "m_axi_rmem29_AR.ready" *)input m_axi_rmem29_ARREADY;
  (* RS_HS = "m_axi_rmem29_AR.data" *)output [2:0] m_axi_rmem29_ARSIZE;
  (* RS_HS = "m_axi_rmem29_AR.valid" *)output m_axi_rmem29_ARVALID;
  (* RS_HS = "m_axi_rmem29_R.data" *)input [511:0] m_axi_rmem29_RDATA;
  (* RS_HS = "m_axi_rmem29_R.data" *)input [0:0] m_axi_rmem29_RID;
  (* RS_HS = "m_axi_rmem29_R.data" *)input m_axi_rmem29_RLAST;
  (* RS_HS = "m_axi_rmem29_R.ready" *)output m_axi_rmem29_RREADY;
  (* RS_HS = "m_axi_rmem29_R.data" *)input [1:0] m_axi_rmem29_RRESP;
  (* RS_HS = "m_axi_rmem29_R.valid" *)input m_axi_rmem29_RVALID;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [63:0] m_axi_wmem0_AWADDR;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [1:0] m_axi_wmem0_AWBURST;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [3:0] m_axi_wmem0_AWCACHE;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [0:0] m_axi_wmem0_AWID;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [7:0] m_axi_wmem0_AWLEN;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output m_axi_wmem0_AWLOCK;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [2:0] m_axi_wmem0_AWPROT;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [3:0] m_axi_wmem0_AWQOS;
  (* RS_HS = "m_axi_wmem0_AW.ready" *)input m_axi_wmem0_AWREADY;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [2:0] m_axi_wmem0_AWSIZE;
  (* RS_HS = "m_axi_wmem0_AW.valid" *)output m_axi_wmem0_AWVALID;
  (* RS_HS = "m_axi_wmem0_B.data" *)input [0:0] m_axi_wmem0_BID;
  (* RS_HS = "m_axi_wmem0_B.ready" *)output m_axi_wmem0_BREADY;
  (* RS_HS = "m_axi_wmem0_B.data" *)input [1:0] m_axi_wmem0_BRESP;
  (* RS_HS = "m_axi_wmem0_B.valid" *)input m_axi_wmem0_BVALID;
  (* RS_HS = "m_axi_wmem0_W.data" *)output [511:0] m_axi_wmem0_WDATA;
  (* RS_HS = "m_axi_wmem0_W.data" *)output m_axi_wmem0_WLAST;
  (* RS_HS = "m_axi_wmem0_W.ready" *)input m_axi_wmem0_WREADY;
  (* RS_HS = "m_axi_wmem0_W.data" *)output [63:0] m_axi_wmem0_WSTRB;
  (* RS_HS = "m_axi_wmem0_W.valid" *)output m_axi_wmem0_WVALID;
  (* RS_RST = "ff" *)output ap_idle;
  endmodule
