`timescale 1 ps / 1 ps

module VecAddMix
   (ap_clk,
    m_axi_gmem00_araddr,
    m_axi_gmem00_arburst,
    m_axi_gmem00_arcache,
    m_axi_gmem00_arid,
    m_axi_gmem00_arlen,
    m_axi_gmem00_arlock,
    m_axi_gmem00_arprot,
    m_axi_gmem00_arqos,
    m_axi_gmem00_arready,
    m_axi_gmem00_arregion,
    m_axi_gmem00_arsize,
    m_axi_gmem00_aruser,
    m_axi_gmem00_arvalid,
    m_axi_gmem00_awaddr,
    m_axi_gmem00_awburst,
    m_axi_gmem00_awcache,
    m_axi_gmem00_awid,
    m_axi_gmem00_awlen,
    m_axi_gmem00_awlock,
    m_axi_gmem00_awprot,
    m_axi_gmem00_awqos,
    m_axi_gmem00_awready,
    m_axi_gmem00_awregion,
    m_axi_gmem00_awsize,
    m_axi_gmem00_awuser,
    m_axi_gmem00_awvalid,
    m_axi_gmem00_bid,
    m_axi_gmem00_bready,
    m_axi_gmem00_bresp,
    m_axi_gmem00_buser,
    m_axi_gmem00_bvalid,
    m_axi_gmem00_rdata,
    m_axi_gmem00_rid,
    m_axi_gmem00_rlast,
    m_axi_gmem00_rready,
    m_axi_gmem00_rresp,
    m_axi_gmem00_ruser,
    m_axi_gmem00_rvalid,
    m_axi_gmem00_wdata,
    m_axi_gmem00_wid,
    m_axi_gmem00_wlast,
    m_axi_gmem00_wready,
    m_axi_gmem00_wstrb,
    m_axi_gmem00_wuser,
    m_axi_gmem00_wvalid,
    m_axi_gmem01_araddr,
    m_axi_gmem01_arburst,
    m_axi_gmem01_arcache,
    m_axi_gmem01_arid,
    m_axi_gmem01_arlen,
    m_axi_gmem01_arlock,
    m_axi_gmem01_arprot,
    m_axi_gmem01_arqos,
    m_axi_gmem01_arready,
    m_axi_gmem01_arregion,
    m_axi_gmem01_arsize,
    m_axi_gmem01_aruser,
    m_axi_gmem01_arvalid,
    m_axi_gmem01_awaddr,
    m_axi_gmem01_awburst,
    m_axi_gmem01_awcache,
    m_axi_gmem01_awid,
    m_axi_gmem01_awlen,
    m_axi_gmem01_awlock,
    m_axi_gmem01_awprot,
    m_axi_gmem01_awqos,
    m_axi_gmem01_awready,
    m_axi_gmem01_awregion,
    m_axi_gmem01_awsize,
    m_axi_gmem01_awuser,
    m_axi_gmem01_awvalid,
    m_axi_gmem01_bid,
    m_axi_gmem01_bready,
    m_axi_gmem01_bresp,
    m_axi_gmem01_buser,
    m_axi_gmem01_bvalid,
    m_axi_gmem01_rdata,
    m_axi_gmem01_rid,
    m_axi_gmem01_rlast,
    m_axi_gmem01_rready,
    m_axi_gmem01_rresp,
    m_axi_gmem01_ruser,
    m_axi_gmem01_rvalid,
    m_axi_gmem01_wdata,
    m_axi_gmem01_wid,
    m_axi_gmem01_wlast,
    m_axi_gmem01_wready,
    m_axi_gmem01_wstrb,
    m_axi_gmem01_wuser,
    m_axi_gmem01_wvalid,
    m_axi_gmem1_araddr,
    m_axi_gmem1_arburst,
    m_axi_gmem1_arcache,
    m_axi_gmem1_arid,
    m_axi_gmem1_arlen,
    m_axi_gmem1_arlock,
    m_axi_gmem1_arprot,
    m_axi_gmem1_arqos,
    m_axi_gmem1_arready,
    m_axi_gmem1_arregion,
    m_axi_gmem1_arsize,
    m_axi_gmem1_aruser,
    m_axi_gmem1_arvalid,
    m_axi_gmem1_awaddr,
    m_axi_gmem1_awburst,
    m_axi_gmem1_awcache,
    m_axi_gmem1_awid,
    m_axi_gmem1_awlen,
    m_axi_gmem1_awlock,
    m_axi_gmem1_awprot,
    m_axi_gmem1_awqos,
    m_axi_gmem1_awready,
    m_axi_gmem1_awregion,
    m_axi_gmem1_awsize,
    m_axi_gmem1_awuser,
    m_axi_gmem1_awvalid,
    m_axi_gmem1_bid,
    m_axi_gmem1_bready,
    m_axi_gmem1_bresp,
    m_axi_gmem1_buser,
    m_axi_gmem1_bvalid,
    m_axi_gmem1_rdata,
    m_axi_gmem1_rid,
    m_axi_gmem1_rlast,
    m_axi_gmem1_rready,
    m_axi_gmem1_rresp,
    m_axi_gmem1_ruser,
    m_axi_gmem1_rvalid,
    m_axi_gmem1_wdata,
    m_axi_gmem1_wid,
    m_axi_gmem1_wlast,
    m_axi_gmem1_wready,
    m_axi_gmem1_wstrb,
    m_axi_gmem1_wuser,
    m_axi_gmem1_wvalid,
    resetn,
    s_axi_control_0_araddr,
    s_axi_control_0_arready,
    s_axi_control_0_arvalid,
    s_axi_control_0_awaddr,
    s_axi_control_0_awready,
    s_axi_control_0_awvalid,
    s_axi_control_0_bready,
    s_axi_control_0_bresp,
    s_axi_control_0_bvalid,
    s_axi_control_0_rdata,
    s_axi_control_0_rready,
    s_axi_control_0_rresp,
    s_axi_control_0_rvalid,
    s_axi_control_0_wdata,
    s_axi_control_0_wready,
    s_axi_control_0_wstrb,
    s_axi_control_0_wvalid,
    s_axi_control_1_araddr,
    s_axi_control_1_arready,
    s_axi_control_1_arvalid,
    s_axi_control_1_awaddr,
    s_axi_control_1_awready,
    s_axi_control_1_awvalid,
    s_axi_control_1_bready,
    s_axi_control_1_bresp,
    s_axi_control_1_bvalid,
    s_axi_control_1_rdata,
    s_axi_control_1_rready,
    s_axi_control_1_rresp,
    s_axi_control_1_rvalid,
    s_axi_control_1_wdata,
    s_axi_control_1_wready,
    s_axi_control_1_wstrb,
    s_axi_control_1_wvalid,
    s_axi_control_2_araddr,
    s_axi_control_2_arready,
    s_axi_control_2_arvalid,
    s_axi_control_2_awaddr,
    s_axi_control_2_awready,
    s_axi_control_2_awvalid,
    s_axi_control_2_bready,
    s_axi_control_2_bresp,
    s_axi_control_2_bvalid,
    s_axi_control_2_rdata,
    s_axi_control_2_rready,
    s_axi_control_2_rresp,
    s_axi_control_2_rvalid,
    s_axi_control_2_wdata,
    s_axi_control_2_wready,
    s_axi_control_2_wstrb,
    s_axi_control_2_wvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, CLK_DOMAIN design_1_ap_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_gmem00, ADDR_WIDTH 64, ARUSER_WIDTH 1, AWUSER_WIDTH 1, BUSER_WIDTH 1, DATA_WIDTH 512, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 1, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 1" *) output [63:0]m_axi_gmem00_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARBURST" *) output [1:0]m_axi_gmem00_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARCACHE" *) output [3:0]m_axi_gmem00_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARID" *) output [0:0]m_axi_gmem00_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARLEN" *) output [7:0]m_axi_gmem00_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARLOCK" *) output [1:0]m_axi_gmem00_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARPROT" *) output [2:0]m_axi_gmem00_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARQOS" *) output [3:0]m_axi_gmem00_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARREADY" *) input m_axi_gmem00_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARREGION" *) output [3:0]m_axi_gmem00_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARSIZE" *) output [2:0]m_axi_gmem00_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARUSER" *) output [0:0]m_axi_gmem00_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 ARVALID" *) output m_axi_gmem00_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWADDR" *) output [63:0]m_axi_gmem00_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWBURST" *) output [1:0]m_axi_gmem00_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWCACHE" *) output [3:0]m_axi_gmem00_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWID" *) output [0:0]m_axi_gmem00_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWLEN" *) output [7:0]m_axi_gmem00_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWLOCK" *) output [1:0]m_axi_gmem00_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWPROT" *) output [2:0]m_axi_gmem00_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWQOS" *) output [3:0]m_axi_gmem00_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWREADY" *) input m_axi_gmem00_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWREGION" *) output [3:0]m_axi_gmem00_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWSIZE" *) output [2:0]m_axi_gmem00_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWUSER" *) output [0:0]m_axi_gmem00_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 AWVALID" *) output m_axi_gmem00_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 BID" *) input [0:0]m_axi_gmem00_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 BREADY" *) output m_axi_gmem00_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 BRESP" *) input [1:0]m_axi_gmem00_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 BUSER" *) input [0:0]m_axi_gmem00_buser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 BVALID" *) input m_axi_gmem00_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 RDATA" *) input [511:0]m_axi_gmem00_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 RID" *) input [0:0]m_axi_gmem00_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 RLAST" *) input m_axi_gmem00_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 RREADY" *) output m_axi_gmem00_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 RRESP" *) input [1:0]m_axi_gmem00_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 RUSER" *) input [0:0]m_axi_gmem00_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 RVALID" *) input m_axi_gmem00_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 WDATA" *) output [511:0]m_axi_gmem00_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 WID" *) output [0:0]m_axi_gmem00_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 WLAST" *) output m_axi_gmem00_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 WREADY" *) input m_axi_gmem00_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 WSTRB" *) output [63:0]m_axi_gmem00_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 WUSER" *) output [0:0]m_axi_gmem00_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem00 WVALID" *) output m_axi_gmem00_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_gmem01, ADDR_WIDTH 64, ARUSER_WIDTH 1, AWUSER_WIDTH 1, BUSER_WIDTH 1, DATA_WIDTH 512, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 1, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 1" *) output [63:0]m_axi_gmem01_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARBURST" *) output [1:0]m_axi_gmem01_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARCACHE" *) output [3:0]m_axi_gmem01_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARID" *) output [0:0]m_axi_gmem01_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARLEN" *) output [7:0]m_axi_gmem01_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARLOCK" *) output [1:0]m_axi_gmem01_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARPROT" *) output [2:0]m_axi_gmem01_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARQOS" *) output [3:0]m_axi_gmem01_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARREADY" *) input m_axi_gmem01_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARREGION" *) output [3:0]m_axi_gmem01_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARSIZE" *) output [2:0]m_axi_gmem01_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARUSER" *) output [0:0]m_axi_gmem01_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 ARVALID" *) output m_axi_gmem01_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWADDR" *) output [63:0]m_axi_gmem01_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWBURST" *) output [1:0]m_axi_gmem01_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWCACHE" *) output [3:0]m_axi_gmem01_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWID" *) output [0:0]m_axi_gmem01_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWLEN" *) output [7:0]m_axi_gmem01_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWLOCK" *) output [1:0]m_axi_gmem01_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWPROT" *) output [2:0]m_axi_gmem01_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWQOS" *) output [3:0]m_axi_gmem01_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWREADY" *) input m_axi_gmem01_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWREGION" *) output [3:0]m_axi_gmem01_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWSIZE" *) output [2:0]m_axi_gmem01_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWUSER" *) output [0:0]m_axi_gmem01_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 AWVALID" *) output m_axi_gmem01_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 BID" *) input [0:0]m_axi_gmem01_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 BREADY" *) output m_axi_gmem01_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 BRESP" *) input [1:0]m_axi_gmem01_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 BUSER" *) input [0:0]m_axi_gmem01_buser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 BVALID" *) input m_axi_gmem01_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 RDATA" *) input [511:0]m_axi_gmem01_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 RID" *) input [0:0]m_axi_gmem01_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 RLAST" *) input m_axi_gmem01_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 RREADY" *) output m_axi_gmem01_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 RRESP" *) input [1:0]m_axi_gmem01_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 RUSER" *) input [0:0]m_axi_gmem01_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 RVALID" *) input m_axi_gmem01_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 WDATA" *) output [511:0]m_axi_gmem01_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 WID" *) output [0:0]m_axi_gmem01_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 WLAST" *) output m_axi_gmem01_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 WREADY" *) input m_axi_gmem01_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 WSTRB" *) output [63:0]m_axi_gmem01_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 WUSER" *) output [0:0]m_axi_gmem01_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem01 WVALID" *) output m_axi_gmem01_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_gmem1, ADDR_WIDTH 64, ARUSER_WIDTH 1, AWUSER_WIDTH 1, BUSER_WIDTH 1, DATA_WIDTH 512, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 1, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 1" *) output [63:0]m_axi_gmem1_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARBURST" *) output [1:0]m_axi_gmem1_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARCACHE" *) output [3:0]m_axi_gmem1_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARID" *) output [0:0]m_axi_gmem1_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARLEN" *) output [7:0]m_axi_gmem1_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARLOCK" *) output [1:0]m_axi_gmem1_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARPROT" *) output [2:0]m_axi_gmem1_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARQOS" *) output [3:0]m_axi_gmem1_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARREADY" *) input m_axi_gmem1_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARREGION" *) output [3:0]m_axi_gmem1_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARSIZE" *) output [2:0]m_axi_gmem1_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARUSER" *) output [0:0]m_axi_gmem1_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARVALID" *) output m_axi_gmem1_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWADDR" *) output [63:0]m_axi_gmem1_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWBURST" *) output [1:0]m_axi_gmem1_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWCACHE" *) output [3:0]m_axi_gmem1_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWID" *) output [0:0]m_axi_gmem1_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWLEN" *) output [7:0]m_axi_gmem1_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWLOCK" *) output [1:0]m_axi_gmem1_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWPROT" *) output [2:0]m_axi_gmem1_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWQOS" *) output [3:0]m_axi_gmem1_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWREADY" *) input m_axi_gmem1_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWREGION" *) output [3:0]m_axi_gmem1_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWSIZE" *) output [2:0]m_axi_gmem1_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWUSER" *) output [0:0]m_axi_gmem1_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWVALID" *) output m_axi_gmem1_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 BID" *) input [0:0]m_axi_gmem1_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 BREADY" *) output m_axi_gmem1_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 BRESP" *) input [1:0]m_axi_gmem1_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 BUSER" *) input [0:0]m_axi_gmem1_buser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 BVALID" *) input m_axi_gmem1_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RDATA" *) input [511:0]m_axi_gmem1_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RID" *) input [0:0]m_axi_gmem1_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RLAST" *) input m_axi_gmem1_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RREADY" *) output m_axi_gmem1_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RRESP" *) input [1:0]m_axi_gmem1_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RUSER" *) input [0:0]m_axi_gmem1_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RVALID" *) input m_axi_gmem1_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WDATA" *) output [511:0]m_axi_gmem1_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WID" *) output [0:0]m_axi_gmem1_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WLAST" *) output m_axi_gmem1_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WREADY" *) input m_axi_gmem1_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WSTRB" *) output [63:0]m_axi_gmem1_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WUSER" *) output [0:0]m_axi_gmem1_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WVALID" *) output m_axi_gmem1_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control_0, ADDR_WIDTH 5, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [4:0]s_axi_control_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 ARREADY" *) output s_axi_control_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 ARVALID" *) input s_axi_control_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 AWADDR" *) input [4:0]s_axi_control_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 AWREADY" *) output s_axi_control_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 AWVALID" *) input s_axi_control_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 BREADY" *) input s_axi_control_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 BRESP" *) output [1:0]s_axi_control_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 BVALID" *) output s_axi_control_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 RDATA" *) output [31:0]s_axi_control_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 RREADY" *) input s_axi_control_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 RRESP" *) output [1:0]s_axi_control_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 RVALID" *) output s_axi_control_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 WDATA" *) input [31:0]s_axi_control_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 WREADY" *) output s_axi_control_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 WSTRB" *) input [3:0]s_axi_control_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_0 WVALID" *) input s_axi_control_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control_1, ADDR_WIDTH 5, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [4:0]s_axi_control_1_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 ARREADY" *) output s_axi_control_1_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 ARVALID" *) input s_axi_control_1_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 AWADDR" *) input [4:0]s_axi_control_1_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 AWREADY" *) output s_axi_control_1_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 AWVALID" *) input s_axi_control_1_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 BREADY" *) input s_axi_control_1_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 BRESP" *) output [1:0]s_axi_control_1_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 BVALID" *) output s_axi_control_1_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 RDATA" *) output [31:0]s_axi_control_1_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 RREADY" *) input s_axi_control_1_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 RRESP" *) output [1:0]s_axi_control_1_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 RVALID" *) output s_axi_control_1_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 WDATA" *) input [31:0]s_axi_control_1_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 WREADY" *) output s_axi_control_1_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 WSTRB" *) input [3:0]s_axi_control_1_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_1 WVALID" *) input s_axi_control_1_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control_2, ADDR_WIDTH 5, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [4:0]s_axi_control_2_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 ARREADY" *) output s_axi_control_2_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 ARVALID" *) input s_axi_control_2_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 AWADDR" *) input [4:0]s_axi_control_2_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 AWREADY" *) output s_axi_control_2_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 AWVALID" *) input s_axi_control_2_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 BREADY" *) input s_axi_control_2_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 BRESP" *) output [1:0]s_axi_control_2_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 BVALID" *) output s_axi_control_2_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 RDATA" *) output [31:0]s_axi_control_2_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 RREADY" *) input s_axi_control_2_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 RRESP" *) output [1:0]s_axi_control_2_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 RVALID" *) output s_axi_control_2_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 WDATA" *) input [31:0]s_axi_control_2_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 WREADY" *) output s_axi_control_2_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 WSTRB" *) input [3:0]s_axi_control_2_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control_2 WVALID" *) input s_axi_control_2_wvalid;

  wire ap_clk_1;
  wire [31:0]fifo_0_dout_TDATA;
  wire fifo_0_dout_TREADY;
  wire fifo_0_dout_TVALID;
  wire [31:0]fifo_1_dout_TDATA;
  wire fifo_1_dout_TREADY;
  wire fifo_1_dout_TVALID;
  wire [31:0]fifo_2_dout_TDATA;
  wire fifo_2_dout_TREADY;
  wire fifo_2_dout_TVALID;
  wire [31:0]kernel_add_0_stream_out_TDATA;
  wire kernel_add_0_stream_out_TREADY;
  wire kernel_add_0_stream_out_TVALID;
  wire [63:0]read_mem_0_m_axi_gmem0_ARADDR;
  wire [1:0]read_mem_0_m_axi_gmem0_ARBURST;
  wire [3:0]read_mem_0_m_axi_gmem0_ARCACHE;
  wire [0:0]read_mem_0_m_axi_gmem0_ARID;
  wire [7:0]read_mem_0_m_axi_gmem0_ARLEN;
  wire [1:0]read_mem_0_m_axi_gmem0_ARLOCK;
  wire [2:0]read_mem_0_m_axi_gmem0_ARPROT;
  wire [3:0]read_mem_0_m_axi_gmem0_ARQOS;
  wire read_mem_0_m_axi_gmem0_ARREADY;
  wire [3:0]read_mem_0_m_axi_gmem0_ARREGION;
  wire [2:0]read_mem_0_m_axi_gmem0_ARSIZE;
  wire [0:0]read_mem_0_m_axi_gmem0_ARUSER;
  wire read_mem_0_m_axi_gmem0_ARVALID;
  wire [63:0]read_mem_0_m_axi_gmem0_AWADDR;
  wire [1:0]read_mem_0_m_axi_gmem0_AWBURST;
  wire [3:0]read_mem_0_m_axi_gmem0_AWCACHE;
  wire [0:0]read_mem_0_m_axi_gmem0_AWID;
  wire [7:0]read_mem_0_m_axi_gmem0_AWLEN;
  wire [1:0]read_mem_0_m_axi_gmem0_AWLOCK;
  wire [2:0]read_mem_0_m_axi_gmem0_AWPROT;
  wire [3:0]read_mem_0_m_axi_gmem0_AWQOS;
  wire read_mem_0_m_axi_gmem0_AWREADY;
  wire [3:0]read_mem_0_m_axi_gmem0_AWREGION;
  wire [2:0]read_mem_0_m_axi_gmem0_AWSIZE;
  wire [0:0]read_mem_0_m_axi_gmem0_AWUSER;
  wire read_mem_0_m_axi_gmem0_AWVALID;
  wire [0:0]read_mem_0_m_axi_gmem0_BID;
  wire read_mem_0_m_axi_gmem0_BREADY;
  wire [1:0]read_mem_0_m_axi_gmem0_BRESP;
  wire [0:0]read_mem_0_m_axi_gmem0_BUSER;
  wire read_mem_0_m_axi_gmem0_BVALID;
  wire [511:0]read_mem_0_m_axi_gmem0_RDATA;
  wire [0:0]read_mem_0_m_axi_gmem0_RID;
  wire read_mem_0_m_axi_gmem0_RLAST;
  wire read_mem_0_m_axi_gmem0_RREADY;
  wire [1:0]read_mem_0_m_axi_gmem0_RRESP;
  wire [0:0]read_mem_0_m_axi_gmem0_RUSER;
  wire read_mem_0_m_axi_gmem0_RVALID;
  wire [511:0]read_mem_0_m_axi_gmem0_WDATA;
  wire [0:0]read_mem_0_m_axi_gmem0_WID;
  wire read_mem_0_m_axi_gmem0_WLAST;
  wire read_mem_0_m_axi_gmem0_WREADY;
  wire [63:0]read_mem_0_m_axi_gmem0_WSTRB;
  wire [0:0]read_mem_0_m_axi_gmem0_WUSER;
  wire read_mem_0_m_axi_gmem0_WVALID;
  wire [31:0]read_mem_0_stream_out_TDATA;
  wire read_mem_0_stream_out_TREADY;
  wire read_mem_0_stream_out_TVALID;
  wire [63:0]read_mem_1_m_axi_gmem0_ARADDR;
  wire [1:0]read_mem_1_m_axi_gmem0_ARBURST;
  wire [3:0]read_mem_1_m_axi_gmem0_ARCACHE;
  wire [0:0]read_mem_1_m_axi_gmem0_ARID;
  wire [7:0]read_mem_1_m_axi_gmem0_ARLEN;
  wire [1:0]read_mem_1_m_axi_gmem0_ARLOCK;
  wire [2:0]read_mem_1_m_axi_gmem0_ARPROT;
  wire [3:0]read_mem_1_m_axi_gmem0_ARQOS;
  wire read_mem_1_m_axi_gmem0_ARREADY;
  wire [3:0]read_mem_1_m_axi_gmem0_ARREGION;
  wire [2:0]read_mem_1_m_axi_gmem0_ARSIZE;
  wire [0:0]read_mem_1_m_axi_gmem0_ARUSER;
  wire read_mem_1_m_axi_gmem0_ARVALID;
  wire [63:0]read_mem_1_m_axi_gmem0_AWADDR;
  wire [1:0]read_mem_1_m_axi_gmem0_AWBURST;
  wire [3:0]read_mem_1_m_axi_gmem0_AWCACHE;
  wire [0:0]read_mem_1_m_axi_gmem0_AWID;
  wire [7:0]read_mem_1_m_axi_gmem0_AWLEN;
  wire [1:0]read_mem_1_m_axi_gmem0_AWLOCK;
  wire [2:0]read_mem_1_m_axi_gmem0_AWPROT;
  wire [3:0]read_mem_1_m_axi_gmem0_AWQOS;
  wire read_mem_1_m_axi_gmem0_AWREADY;
  wire [3:0]read_mem_1_m_axi_gmem0_AWREGION;
  wire [2:0]read_mem_1_m_axi_gmem0_AWSIZE;
  wire [0:0]read_mem_1_m_axi_gmem0_AWUSER;
  wire read_mem_1_m_axi_gmem0_AWVALID;
  wire [0:0]read_mem_1_m_axi_gmem0_BID;
  wire read_mem_1_m_axi_gmem0_BREADY;
  wire [1:0]read_mem_1_m_axi_gmem0_BRESP;
  wire [0:0]read_mem_1_m_axi_gmem0_BUSER;
  wire read_mem_1_m_axi_gmem0_BVALID;
  wire [511:0]read_mem_1_m_axi_gmem0_RDATA;
  wire [0:0]read_mem_1_m_axi_gmem0_RID;
  wire read_mem_1_m_axi_gmem0_RLAST;
  wire read_mem_1_m_axi_gmem0_RREADY;
  wire [1:0]read_mem_1_m_axi_gmem0_RRESP;
  wire [0:0]read_mem_1_m_axi_gmem0_RUSER;
  wire read_mem_1_m_axi_gmem0_RVALID;
  wire [511:0]read_mem_1_m_axi_gmem0_WDATA;
  wire [0:0]read_mem_1_m_axi_gmem0_WID;
  wire read_mem_1_m_axi_gmem0_WLAST;
  wire read_mem_1_m_axi_gmem0_WREADY;
  wire [63:0]read_mem_1_m_axi_gmem0_WSTRB;
  wire [0:0]read_mem_1_m_axi_gmem0_WUSER;
  wire read_mem_1_m_axi_gmem0_WVALID;
  wire [31:0]read_mem_1_stream_out_TDATA;
  wire read_mem_1_stream_out_TREADY;
  wire read_mem_1_stream_out_TVALID;
  wire [0:0]resetn_1;
  wire resetn_2;
  wire [4:0]s_axi_control_0_1_ARADDR;
  wire s_axi_control_0_1_ARREADY;
  wire s_axi_control_0_1_ARVALID;
  wire [4:0]s_axi_control_0_1_AWADDR;
  wire s_axi_control_0_1_AWREADY;
  wire s_axi_control_0_1_AWVALID;
  wire s_axi_control_0_1_BREADY;
  wire [1:0]s_axi_control_0_1_BRESP;
  wire s_axi_control_0_1_BVALID;
  wire [31:0]s_axi_control_0_1_RDATA;
  wire s_axi_control_0_1_RREADY;
  wire [1:0]s_axi_control_0_1_RRESP;
  wire s_axi_control_0_1_RVALID;
  wire [31:0]s_axi_control_0_1_WDATA;
  wire s_axi_control_0_1_WREADY;
  wire [3:0]s_axi_control_0_1_WSTRB;
  wire s_axi_control_0_1_WVALID;
  wire [4:0]s_axi_control_1_1_ARADDR;
  wire s_axi_control_1_1_ARREADY;
  wire s_axi_control_1_1_ARVALID;
  wire [4:0]s_axi_control_1_1_AWADDR;
  wire s_axi_control_1_1_AWREADY;
  wire s_axi_control_1_1_AWVALID;
  wire s_axi_control_1_1_BREADY;
  wire [1:0]s_axi_control_1_1_BRESP;
  wire s_axi_control_1_1_BVALID;
  wire [31:0]s_axi_control_1_1_RDATA;
  wire s_axi_control_1_1_RREADY;
  wire [1:0]s_axi_control_1_1_RRESP;
  wire s_axi_control_1_1_RVALID;
  wire [31:0]s_axi_control_1_1_WDATA;
  wire s_axi_control_1_1_WREADY;
  wire [3:0]s_axi_control_1_1_WSTRB;
  wire s_axi_control_1_1_WVALID;
  wire [4:0]s_axi_control_2_1_ARADDR;
  wire s_axi_control_2_1_ARREADY;
  wire s_axi_control_2_1_ARVALID;
  wire [4:0]s_axi_control_2_1_AWADDR;
  wire s_axi_control_2_1_AWREADY;
  wire s_axi_control_2_1_AWVALID;
  wire s_axi_control_2_1_BREADY;
  wire [1:0]s_axi_control_2_1_BRESP;
  wire s_axi_control_2_1_BVALID;
  wire [31:0]s_axi_control_2_1_RDATA;
  wire s_axi_control_2_1_RREADY;
  wire [1:0]s_axi_control_2_1_RRESP;
  wire s_axi_control_2_1_RVALID;
  wire [31:0]s_axi_control_2_1_WDATA;
  wire s_axi_control_2_1_WREADY;
  wire [3:0]s_axi_control_2_1_WSTRB;
  wire s_axi_control_2_1_WVALID;
  wire [63:0]write_mem_0_m_axi_gmem1_ARADDR;
  wire [1:0]write_mem_0_m_axi_gmem1_ARBURST;
  wire [3:0]write_mem_0_m_axi_gmem1_ARCACHE;
  wire [0:0]write_mem_0_m_axi_gmem1_ARID;
  wire [7:0]write_mem_0_m_axi_gmem1_ARLEN;
  wire [1:0]write_mem_0_m_axi_gmem1_ARLOCK;
  wire [2:0]write_mem_0_m_axi_gmem1_ARPROT;
  wire [3:0]write_mem_0_m_axi_gmem1_ARQOS;
  wire write_mem_0_m_axi_gmem1_ARREADY;
  wire [3:0]write_mem_0_m_axi_gmem1_ARREGION;
  wire [2:0]write_mem_0_m_axi_gmem1_ARSIZE;
  wire [0:0]write_mem_0_m_axi_gmem1_ARUSER;
  wire write_mem_0_m_axi_gmem1_ARVALID;
  wire [63:0]write_mem_0_m_axi_gmem1_AWADDR;
  wire [1:0]write_mem_0_m_axi_gmem1_AWBURST;
  wire [3:0]write_mem_0_m_axi_gmem1_AWCACHE;
  wire [0:0]write_mem_0_m_axi_gmem1_AWID;
  wire [7:0]write_mem_0_m_axi_gmem1_AWLEN;
  wire [1:0]write_mem_0_m_axi_gmem1_AWLOCK;
  wire [2:0]write_mem_0_m_axi_gmem1_AWPROT;
  wire [3:0]write_mem_0_m_axi_gmem1_AWQOS;
  wire write_mem_0_m_axi_gmem1_AWREADY;
  wire [3:0]write_mem_0_m_axi_gmem1_AWREGION;
  wire [2:0]write_mem_0_m_axi_gmem1_AWSIZE;
  wire [0:0]write_mem_0_m_axi_gmem1_AWUSER;
  wire write_mem_0_m_axi_gmem1_AWVALID;
  wire [0:0]write_mem_0_m_axi_gmem1_BID;
  wire write_mem_0_m_axi_gmem1_BREADY;
  wire [1:0]write_mem_0_m_axi_gmem1_BRESP;
  wire [0:0]write_mem_0_m_axi_gmem1_BUSER;
  wire write_mem_0_m_axi_gmem1_BVALID;
  wire [511:0]write_mem_0_m_axi_gmem1_RDATA;
  wire [0:0]write_mem_0_m_axi_gmem1_RID;
  wire write_mem_0_m_axi_gmem1_RLAST;
  wire write_mem_0_m_axi_gmem1_RREADY;
  wire [1:0]write_mem_0_m_axi_gmem1_RRESP;
  wire [0:0]write_mem_0_m_axi_gmem1_RUSER;
  wire write_mem_0_m_axi_gmem1_RVALID;
  wire [511:0]write_mem_0_m_axi_gmem1_WDATA;
  wire [0:0]write_mem_0_m_axi_gmem1_WID;
  wire write_mem_0_m_axi_gmem1_WLAST;
  wire write_mem_0_m_axi_gmem1_WREADY;
  wire [63:0]write_mem_0_m_axi_gmem1_WSTRB;
  wire [0:0]write_mem_0_m_axi_gmem1_WUSER;
  wire write_mem_0_m_axi_gmem1_WVALID;

  assign ap_clk_1 = ap_clk;
  assign m_axi_gmem00_araddr[63:0] = read_mem_0_m_axi_gmem0_ARADDR;
  assign m_axi_gmem00_arburst[1:0] = read_mem_0_m_axi_gmem0_ARBURST;
  assign m_axi_gmem00_arcache[3:0] = read_mem_0_m_axi_gmem0_ARCACHE;
  assign m_axi_gmem00_arid[0] = read_mem_0_m_axi_gmem0_ARID;
  assign m_axi_gmem00_arlen[7:0] = read_mem_0_m_axi_gmem0_ARLEN;
  assign m_axi_gmem00_arlock[1:0] = read_mem_0_m_axi_gmem0_ARLOCK;
  assign m_axi_gmem00_arprot[2:0] = read_mem_0_m_axi_gmem0_ARPROT;
  assign m_axi_gmem00_arqos[3:0] = read_mem_0_m_axi_gmem0_ARQOS;
  assign m_axi_gmem00_arregion[3:0] = read_mem_0_m_axi_gmem0_ARREGION;
  assign m_axi_gmem00_arsize[2:0] = read_mem_0_m_axi_gmem0_ARSIZE;
  assign m_axi_gmem00_aruser[0] = read_mem_0_m_axi_gmem0_ARUSER;
  assign m_axi_gmem00_arvalid = read_mem_0_m_axi_gmem0_ARVALID;
  assign m_axi_gmem00_awaddr[63:0] = read_mem_0_m_axi_gmem0_AWADDR;
  assign m_axi_gmem00_awburst[1:0] = read_mem_0_m_axi_gmem0_AWBURST;
  assign m_axi_gmem00_awcache[3:0] = read_mem_0_m_axi_gmem0_AWCACHE;
  assign m_axi_gmem00_awid[0] = read_mem_0_m_axi_gmem0_AWID;
  assign m_axi_gmem00_awlen[7:0] = read_mem_0_m_axi_gmem0_AWLEN;
  assign m_axi_gmem00_awlock[1:0] = read_mem_0_m_axi_gmem0_AWLOCK;
  assign m_axi_gmem00_awprot[2:0] = read_mem_0_m_axi_gmem0_AWPROT;
  assign m_axi_gmem00_awqos[3:0] = read_mem_0_m_axi_gmem0_AWQOS;
  assign m_axi_gmem00_awregion[3:0] = read_mem_0_m_axi_gmem0_AWREGION;
  assign m_axi_gmem00_awsize[2:0] = read_mem_0_m_axi_gmem0_AWSIZE;
  assign m_axi_gmem00_awuser[0] = read_mem_0_m_axi_gmem0_AWUSER;
  assign m_axi_gmem00_awvalid = read_mem_0_m_axi_gmem0_AWVALID;
  assign m_axi_gmem00_bready = read_mem_0_m_axi_gmem0_BREADY;
  assign m_axi_gmem00_rready = read_mem_0_m_axi_gmem0_RREADY;
  assign m_axi_gmem00_wdata[511:0] = read_mem_0_m_axi_gmem0_WDATA;
  assign m_axi_gmem00_wid[0] = read_mem_0_m_axi_gmem0_WID;
  assign m_axi_gmem00_wlast = read_mem_0_m_axi_gmem0_WLAST;
  assign m_axi_gmem00_wstrb[63:0] = read_mem_0_m_axi_gmem0_WSTRB;
  assign m_axi_gmem00_wuser[0] = read_mem_0_m_axi_gmem0_WUSER;
  assign m_axi_gmem00_wvalid = read_mem_0_m_axi_gmem0_WVALID;
  assign m_axi_gmem01_araddr[63:0] = read_mem_1_m_axi_gmem0_ARADDR;
  assign m_axi_gmem01_arburst[1:0] = read_mem_1_m_axi_gmem0_ARBURST;
  assign m_axi_gmem01_arcache[3:0] = read_mem_1_m_axi_gmem0_ARCACHE;
  assign m_axi_gmem01_arid[0] = read_mem_1_m_axi_gmem0_ARID;
  assign m_axi_gmem01_arlen[7:0] = read_mem_1_m_axi_gmem0_ARLEN;
  assign m_axi_gmem01_arlock[1:0] = read_mem_1_m_axi_gmem0_ARLOCK;
  assign m_axi_gmem01_arprot[2:0] = read_mem_1_m_axi_gmem0_ARPROT;
  assign m_axi_gmem01_arqos[3:0] = read_mem_1_m_axi_gmem0_ARQOS;
  assign m_axi_gmem01_arregion[3:0] = read_mem_1_m_axi_gmem0_ARREGION;
  assign m_axi_gmem01_arsize[2:0] = read_mem_1_m_axi_gmem0_ARSIZE;
  assign m_axi_gmem01_aruser[0] = read_mem_1_m_axi_gmem0_ARUSER;
  assign m_axi_gmem01_arvalid = read_mem_1_m_axi_gmem0_ARVALID;
  assign m_axi_gmem01_awaddr[63:0] = read_mem_1_m_axi_gmem0_AWADDR;
  assign m_axi_gmem01_awburst[1:0] = read_mem_1_m_axi_gmem0_AWBURST;
  assign m_axi_gmem01_awcache[3:0] = read_mem_1_m_axi_gmem0_AWCACHE;
  assign m_axi_gmem01_awid[0] = read_mem_1_m_axi_gmem0_AWID;
  assign m_axi_gmem01_awlen[7:0] = read_mem_1_m_axi_gmem0_AWLEN;
  assign m_axi_gmem01_awlock[1:0] = read_mem_1_m_axi_gmem0_AWLOCK;
  assign m_axi_gmem01_awprot[2:0] = read_mem_1_m_axi_gmem0_AWPROT;
  assign m_axi_gmem01_awqos[3:0] = read_mem_1_m_axi_gmem0_AWQOS;
  assign m_axi_gmem01_awregion[3:0] = read_mem_1_m_axi_gmem0_AWREGION;
  assign m_axi_gmem01_awsize[2:0] = read_mem_1_m_axi_gmem0_AWSIZE;
  assign m_axi_gmem01_awuser[0] = read_mem_1_m_axi_gmem0_AWUSER;
  assign m_axi_gmem01_awvalid = read_mem_1_m_axi_gmem0_AWVALID;
  assign m_axi_gmem01_bready = read_mem_1_m_axi_gmem0_BREADY;
  assign m_axi_gmem01_rready = read_mem_1_m_axi_gmem0_RREADY;
  assign m_axi_gmem01_wdata[511:0] = read_mem_1_m_axi_gmem0_WDATA;
  assign m_axi_gmem01_wid[0] = read_mem_1_m_axi_gmem0_WID;
  assign m_axi_gmem01_wlast = read_mem_1_m_axi_gmem0_WLAST;
  assign m_axi_gmem01_wstrb[63:0] = read_mem_1_m_axi_gmem0_WSTRB;
  assign m_axi_gmem01_wuser[0] = read_mem_1_m_axi_gmem0_WUSER;
  assign m_axi_gmem01_wvalid = read_mem_1_m_axi_gmem0_WVALID;
  assign m_axi_gmem1_araddr[63:0] = write_mem_0_m_axi_gmem1_ARADDR;
  assign m_axi_gmem1_arburst[1:0] = write_mem_0_m_axi_gmem1_ARBURST;
  assign m_axi_gmem1_arcache[3:0] = write_mem_0_m_axi_gmem1_ARCACHE;
  assign m_axi_gmem1_arid[0] = write_mem_0_m_axi_gmem1_ARID;
  assign m_axi_gmem1_arlen[7:0] = write_mem_0_m_axi_gmem1_ARLEN;
  assign m_axi_gmem1_arlock[1:0] = write_mem_0_m_axi_gmem1_ARLOCK;
  assign m_axi_gmem1_arprot[2:0] = write_mem_0_m_axi_gmem1_ARPROT;
  assign m_axi_gmem1_arqos[3:0] = write_mem_0_m_axi_gmem1_ARQOS;
  assign m_axi_gmem1_arregion[3:0] = write_mem_0_m_axi_gmem1_ARREGION;
  assign m_axi_gmem1_arsize[2:0] = write_mem_0_m_axi_gmem1_ARSIZE;
  assign m_axi_gmem1_aruser[0] = write_mem_0_m_axi_gmem1_ARUSER;
  assign m_axi_gmem1_arvalid = write_mem_0_m_axi_gmem1_ARVALID;
  assign m_axi_gmem1_awaddr[63:0] = write_mem_0_m_axi_gmem1_AWADDR;
  assign m_axi_gmem1_awburst[1:0] = write_mem_0_m_axi_gmem1_AWBURST;
  assign m_axi_gmem1_awcache[3:0] = write_mem_0_m_axi_gmem1_AWCACHE;
  assign m_axi_gmem1_awid[0] = write_mem_0_m_axi_gmem1_AWID;
  assign m_axi_gmem1_awlen[7:0] = write_mem_0_m_axi_gmem1_AWLEN;
  assign m_axi_gmem1_awlock[1:0] = write_mem_0_m_axi_gmem1_AWLOCK;
  assign m_axi_gmem1_awprot[2:0] = write_mem_0_m_axi_gmem1_AWPROT;
  assign m_axi_gmem1_awqos[3:0] = write_mem_0_m_axi_gmem1_AWQOS;
  assign m_axi_gmem1_awregion[3:0] = write_mem_0_m_axi_gmem1_AWREGION;
  assign m_axi_gmem1_awsize[2:0] = write_mem_0_m_axi_gmem1_AWSIZE;
  assign m_axi_gmem1_awuser[0] = write_mem_0_m_axi_gmem1_AWUSER;
  assign m_axi_gmem1_awvalid = write_mem_0_m_axi_gmem1_AWVALID;
  assign m_axi_gmem1_bready = write_mem_0_m_axi_gmem1_BREADY;
  assign m_axi_gmem1_rready = write_mem_0_m_axi_gmem1_RREADY;
  assign m_axi_gmem1_wdata[511:0] = write_mem_0_m_axi_gmem1_WDATA;
  assign m_axi_gmem1_wid[0] = write_mem_0_m_axi_gmem1_WID;
  assign m_axi_gmem1_wlast = write_mem_0_m_axi_gmem1_WLAST;
  assign m_axi_gmem1_wstrb[63:0] = write_mem_0_m_axi_gmem1_WSTRB;
  assign m_axi_gmem1_wuser[0] = write_mem_0_m_axi_gmem1_WUSER;
  assign m_axi_gmem1_wvalid = write_mem_0_m_axi_gmem1_WVALID;
  assign read_mem_0_m_axi_gmem0_ARREADY = m_axi_gmem00_arready;
  assign read_mem_0_m_axi_gmem0_AWREADY = m_axi_gmem00_awready;
  assign read_mem_0_m_axi_gmem0_BID = m_axi_gmem00_bid[0];
  assign read_mem_0_m_axi_gmem0_BRESP = m_axi_gmem00_bresp[1:0];
  assign read_mem_0_m_axi_gmem0_BUSER = m_axi_gmem00_buser[0];
  assign read_mem_0_m_axi_gmem0_BVALID = m_axi_gmem00_bvalid;
  assign read_mem_0_m_axi_gmem0_RDATA = m_axi_gmem00_rdata[511:0];
  assign read_mem_0_m_axi_gmem0_RID = m_axi_gmem00_rid[0];
  assign read_mem_0_m_axi_gmem0_RLAST = m_axi_gmem00_rlast;
  assign read_mem_0_m_axi_gmem0_RRESP = m_axi_gmem00_rresp[1:0];
  assign read_mem_0_m_axi_gmem0_RUSER = m_axi_gmem00_ruser[0];
  assign read_mem_0_m_axi_gmem0_RVALID = m_axi_gmem00_rvalid;
  assign read_mem_0_m_axi_gmem0_WREADY = m_axi_gmem00_wready;
  assign read_mem_1_m_axi_gmem0_ARREADY = m_axi_gmem01_arready;
  assign read_mem_1_m_axi_gmem0_AWREADY = m_axi_gmem01_awready;
  assign read_mem_1_m_axi_gmem0_BID = m_axi_gmem01_bid[0];
  assign read_mem_1_m_axi_gmem0_BRESP = m_axi_gmem01_bresp[1:0];
  assign read_mem_1_m_axi_gmem0_BUSER = m_axi_gmem01_buser[0];
  assign read_mem_1_m_axi_gmem0_BVALID = m_axi_gmem01_bvalid;
  assign read_mem_1_m_axi_gmem0_RDATA = m_axi_gmem01_rdata[511:0];
  assign read_mem_1_m_axi_gmem0_RID = m_axi_gmem01_rid[0];
  assign read_mem_1_m_axi_gmem0_RLAST = m_axi_gmem01_rlast;
  assign read_mem_1_m_axi_gmem0_RRESP = m_axi_gmem01_rresp[1:0];
  assign read_mem_1_m_axi_gmem0_RUSER = m_axi_gmem01_ruser[0];
  assign read_mem_1_m_axi_gmem0_RVALID = m_axi_gmem01_rvalid;
  assign read_mem_1_m_axi_gmem0_WREADY = m_axi_gmem01_wready;
  assign resetn_2 = resetn;
  assign s_axi_control_0_1_ARADDR = s_axi_control_0_araddr[4:0];
  assign s_axi_control_0_1_ARVALID = s_axi_control_0_arvalid;
  assign s_axi_control_0_1_AWADDR = s_axi_control_0_awaddr[4:0];
  assign s_axi_control_0_1_AWVALID = s_axi_control_0_awvalid;
  assign s_axi_control_0_1_BREADY = s_axi_control_0_bready;
  assign s_axi_control_0_1_RREADY = s_axi_control_0_rready;
  assign s_axi_control_0_1_WDATA = s_axi_control_0_wdata[31:0];
  assign s_axi_control_0_1_WSTRB = s_axi_control_0_wstrb[3:0];
  assign s_axi_control_0_1_WVALID = s_axi_control_0_wvalid;
  assign s_axi_control_0_arready = s_axi_control_0_1_ARREADY;
  assign s_axi_control_0_awready = s_axi_control_0_1_AWREADY;
  assign s_axi_control_0_bresp[1:0] = s_axi_control_0_1_BRESP;
  assign s_axi_control_0_bvalid = s_axi_control_0_1_BVALID;
  assign s_axi_control_0_rdata[31:0] = s_axi_control_0_1_RDATA;
  assign s_axi_control_0_rresp[1:0] = s_axi_control_0_1_RRESP;
  assign s_axi_control_0_rvalid = s_axi_control_0_1_RVALID;
  assign s_axi_control_0_wready = s_axi_control_0_1_WREADY;
  assign s_axi_control_1_1_ARADDR = s_axi_control_1_araddr[4:0];
  assign s_axi_control_1_1_ARVALID = s_axi_control_1_arvalid;
  assign s_axi_control_1_1_AWADDR = s_axi_control_1_awaddr[4:0];
  assign s_axi_control_1_1_AWVALID = s_axi_control_1_awvalid;
  assign s_axi_control_1_1_BREADY = s_axi_control_1_bready;
  assign s_axi_control_1_1_RREADY = s_axi_control_1_rready;
  assign s_axi_control_1_1_WDATA = s_axi_control_1_wdata[31:0];
  assign s_axi_control_1_1_WSTRB = s_axi_control_1_wstrb[3:0];
  assign s_axi_control_1_1_WVALID = s_axi_control_1_wvalid;
  assign s_axi_control_1_arready = s_axi_control_1_1_ARREADY;
  assign s_axi_control_1_awready = s_axi_control_1_1_AWREADY;
  assign s_axi_control_1_bresp[1:0] = s_axi_control_1_1_BRESP;
  assign s_axi_control_1_bvalid = s_axi_control_1_1_BVALID;
  assign s_axi_control_1_rdata[31:0] = s_axi_control_1_1_RDATA;
  assign s_axi_control_1_rresp[1:0] = s_axi_control_1_1_RRESP;
  assign s_axi_control_1_rvalid = s_axi_control_1_1_RVALID;
  assign s_axi_control_1_wready = s_axi_control_1_1_WREADY;
  assign s_axi_control_2_1_ARADDR = s_axi_control_2_araddr[4:0];
  assign s_axi_control_2_1_ARVALID = s_axi_control_2_arvalid;
  assign s_axi_control_2_1_AWADDR = s_axi_control_2_awaddr[4:0];
  assign s_axi_control_2_1_AWVALID = s_axi_control_2_awvalid;
  assign s_axi_control_2_1_BREADY = s_axi_control_2_bready;
  assign s_axi_control_2_1_RREADY = s_axi_control_2_rready;
  assign s_axi_control_2_1_WDATA = s_axi_control_2_wdata[31:0];
  assign s_axi_control_2_1_WSTRB = s_axi_control_2_wstrb[3:0];
  assign s_axi_control_2_1_WVALID = s_axi_control_2_wvalid;
  assign s_axi_control_2_arready = s_axi_control_2_1_ARREADY;
  assign s_axi_control_2_awready = s_axi_control_2_1_AWREADY;
  assign s_axi_control_2_bresp[1:0] = s_axi_control_2_1_BRESP;
  assign s_axi_control_2_bvalid = s_axi_control_2_1_BVALID;
  assign s_axi_control_2_rdata[31:0] = s_axi_control_2_1_RDATA;
  assign s_axi_control_2_rresp[1:0] = s_axi_control_2_1_RRESP;
  assign s_axi_control_2_rvalid = s_axi_control_2_1_RVALID;
  assign s_axi_control_2_wready = s_axi_control_2_1_WREADY;
  assign write_mem_0_m_axi_gmem1_ARREADY = m_axi_gmem1_arready;
  assign write_mem_0_m_axi_gmem1_AWREADY = m_axi_gmem1_awready;
  assign write_mem_0_m_axi_gmem1_BID = m_axi_gmem1_bid[0];
  assign write_mem_0_m_axi_gmem1_BRESP = m_axi_gmem1_bresp[1:0];
  assign write_mem_0_m_axi_gmem1_BUSER = m_axi_gmem1_buser[0];
  assign write_mem_0_m_axi_gmem1_BVALID = m_axi_gmem1_bvalid;
  assign write_mem_0_m_axi_gmem1_RDATA = m_axi_gmem1_rdata[511:0];
  assign write_mem_0_m_axi_gmem1_RID = m_axi_gmem1_rid[0];
  assign write_mem_0_m_axi_gmem1_RLAST = m_axi_gmem1_rlast;
  assign write_mem_0_m_axi_gmem1_RRESP = m_axi_gmem1_rresp[1:0];
  assign write_mem_0_m_axi_gmem1_RUSER = m_axi_gmem1_ruser[0];
  assign write_mem_0_m_axi_gmem1_RVALID = m_axi_gmem1_rvalid;
  assign write_mem_0_m_axi_gmem1_WREADY = m_axi_gmem1_wready;

  sync_fifo #(
    .DSIZE(32),
    .ASIZE(9)
  ) fifo_read2kernel0
       (.clk(ap_clk_1),
        .din_TDATA(read_mem_0_stream_out_TDATA),
        .din_TREADY(read_mem_0_stream_out_TREADY),
        .din_TVALID(read_mem_0_stream_out_TVALID),
        .dout_TDATA(fifo_0_dout_TDATA),
        .dout_TREADY(fifo_0_dout_TREADY),
        .dout_TVALID(fifo_0_dout_TVALID),
        .rst_n(resetn_1));

  sync_fifo #(
    .DSIZE(32),
    .ASIZE(9)
  ) fifo_read2kernel1
       (.clk(ap_clk_1),
        .din_TDATA(read_mem_1_stream_out_TDATA),
        .din_TREADY(read_mem_1_stream_out_TREADY),
        .din_TVALID(read_mem_1_stream_out_TVALID),
        .dout_TDATA(fifo_1_dout_TDATA),
        .dout_TREADY(fifo_1_dout_TREADY),
        .dout_TVALID(fifo_1_dout_TVALID),
        .rst_n(resetn_1));

  sync_fifo #(
    .DSIZE(32),
    .ASIZE(9)
  ) fifo_kernel2write
       (.clk(ap_clk_1),
        .din_TDATA(kernel_add_0_stream_out_TDATA),
        .din_TREADY(kernel_add_0_stream_out_TREADY),
        .din_TVALID(kernel_add_0_stream_out_TVALID),
        .dout_TDATA(fifo_2_dout_TDATA),
        .dout_TREADY(fifo_2_dout_TREADY),
        .dout_TVALID(fifo_2_dout_TVALID),
        .rst_n(resetn_1));

  kernel_add #(
    .ap_ST_fsm_pp0_stage0(1'B1)
  ) kernel_add_0
       (.ap_clk(ap_clk_1),
        .ap_rst_n(resetn_1),
        .stream_in1_TDATA(fifo_0_dout_TDATA),
        .stream_in1_TREADY(fifo_0_dout_TREADY),
        .stream_in1_TVALID(fifo_0_dout_TVALID),
        .stream_in2_TDATA(fifo_1_dout_TDATA),
        .stream_in2_TREADY(fifo_1_dout_TREADY),
        .stream_in2_TVALID(fifo_1_dout_TVALID),
        .stream_out_TDATA(kernel_add_0_stream_out_TDATA),
        .stream_out_TREADY(kernel_add_0_stream_out_TREADY),
        .stream_out_TVALID(kernel_add_0_stream_out_TVALID));

  read_mem #(
    .ap_ST_fsm_state1(3'B001),
    .ap_ST_fsm_pp0_stage0(3'B010),
    .ap_ST_fsm_state77(3'B100),
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_S_AXI_CONTROL_ADDR_WIDTH(5),
    .C_S_AXI_DATA_WIDTH(32),
    .C_M_AXI_GMEM0_ID_WIDTH(1),
    .C_M_AXI_GMEM0_ADDR_WIDTH(64),
    .C_M_AXI_GMEM0_DATA_WIDTH(512),
    .C_M_AXI_GMEM0_AWUSER_WIDTH(1),
    .C_M_AXI_GMEM0_ARUSER_WIDTH(1),
    .C_M_AXI_GMEM0_WUSER_WIDTH(1),
    .C_M_AXI_GMEM0_RUSER_WIDTH(1),
    .C_M_AXI_GMEM0_BUSER_WIDTH(1),
    .C_M_AXI_GMEM0_USER_VALUE(0),
    .C_M_AXI_GMEM0_PROT_VALUE(0),
    .C_M_AXI_GMEM0_CACHE_VALUE(3),
    .C_M_AXI_DATA_WIDTH(32),
    .C_S_AXI_CONTROL_WSTRB_WIDTH(4),
    .C_S_AXI_WSTRB_WIDTH(4),
    .C_M_AXI_GMEM0_WSTRB_WIDTH(64),
    .C_M_AXI_WSTRB_WIDTH(4)
  ) read_mem_0
       (.ap_clk(ap_clk_1),
        .ap_rst_n(resetn_1),
        .m_axi_gmem0_ARADDR(read_mem_0_m_axi_gmem0_ARADDR),
        .m_axi_gmem0_ARBURST(read_mem_0_m_axi_gmem0_ARBURST),
        .m_axi_gmem0_ARCACHE(read_mem_0_m_axi_gmem0_ARCACHE),
        .m_axi_gmem0_ARID(read_mem_0_m_axi_gmem0_ARID),
        .m_axi_gmem0_ARLEN(read_mem_0_m_axi_gmem0_ARLEN),
        .m_axi_gmem0_ARLOCK(read_mem_0_m_axi_gmem0_ARLOCK),
        .m_axi_gmem0_ARPROT(read_mem_0_m_axi_gmem0_ARPROT),
        .m_axi_gmem0_ARQOS(read_mem_0_m_axi_gmem0_ARQOS),
        .m_axi_gmem0_ARREADY(read_mem_0_m_axi_gmem0_ARREADY),
        .m_axi_gmem0_ARREGION(read_mem_0_m_axi_gmem0_ARREGION),
        .m_axi_gmem0_ARSIZE(read_mem_0_m_axi_gmem0_ARSIZE),
        .m_axi_gmem0_ARUSER(read_mem_0_m_axi_gmem0_ARUSER),
        .m_axi_gmem0_ARVALID(read_mem_0_m_axi_gmem0_ARVALID),
        .m_axi_gmem0_AWADDR(read_mem_0_m_axi_gmem0_AWADDR),
        .m_axi_gmem0_AWBURST(read_mem_0_m_axi_gmem0_AWBURST),
        .m_axi_gmem0_AWCACHE(read_mem_0_m_axi_gmem0_AWCACHE),
        .m_axi_gmem0_AWID(read_mem_0_m_axi_gmem0_AWID),
        .m_axi_gmem0_AWLEN(read_mem_0_m_axi_gmem0_AWLEN),
        .m_axi_gmem0_AWLOCK(read_mem_0_m_axi_gmem0_AWLOCK),
        .m_axi_gmem0_AWPROT(read_mem_0_m_axi_gmem0_AWPROT),
        .m_axi_gmem0_AWQOS(read_mem_0_m_axi_gmem0_AWQOS),
        .m_axi_gmem0_AWREADY(read_mem_0_m_axi_gmem0_AWREADY),
        .m_axi_gmem0_AWREGION(read_mem_0_m_axi_gmem0_AWREGION),
        .m_axi_gmem0_AWSIZE(read_mem_0_m_axi_gmem0_AWSIZE),
        .m_axi_gmem0_AWUSER(read_mem_0_m_axi_gmem0_AWUSER),
        .m_axi_gmem0_AWVALID(read_mem_0_m_axi_gmem0_AWVALID),
        .m_axi_gmem0_BID(read_mem_0_m_axi_gmem0_BID),
        .m_axi_gmem0_BREADY(read_mem_0_m_axi_gmem0_BREADY),
        .m_axi_gmem0_BRESP(read_mem_0_m_axi_gmem0_BRESP),
        .m_axi_gmem0_BUSER(read_mem_0_m_axi_gmem0_BUSER),
        .m_axi_gmem0_BVALID(read_mem_0_m_axi_gmem0_BVALID),
        .m_axi_gmem0_RDATA(read_mem_0_m_axi_gmem0_RDATA),
        .m_axi_gmem0_RID(read_mem_0_m_axi_gmem0_RID),
        .m_axi_gmem0_RLAST(read_mem_0_m_axi_gmem0_RLAST),
        .m_axi_gmem0_RREADY(read_mem_0_m_axi_gmem0_RREADY),
        .m_axi_gmem0_RRESP(read_mem_0_m_axi_gmem0_RRESP),
        .m_axi_gmem0_RUSER(read_mem_0_m_axi_gmem0_RUSER),
        .m_axi_gmem0_RVALID(read_mem_0_m_axi_gmem0_RVALID),
        .m_axi_gmem0_WDATA(read_mem_0_m_axi_gmem0_WDATA),
        .m_axi_gmem0_WID(read_mem_0_m_axi_gmem0_WID),
        .m_axi_gmem0_WLAST(read_mem_0_m_axi_gmem0_WLAST),
        .m_axi_gmem0_WREADY(read_mem_0_m_axi_gmem0_WREADY),
        .m_axi_gmem0_WSTRB(read_mem_0_m_axi_gmem0_WSTRB),
        .m_axi_gmem0_WUSER(read_mem_0_m_axi_gmem0_WUSER),
        .m_axi_gmem0_WVALID(read_mem_0_m_axi_gmem0_WVALID),
        .s_axi_control_ARADDR(s_axi_control_0_1_ARADDR),
        .s_axi_control_ARREADY(s_axi_control_0_1_ARREADY),
        .s_axi_control_ARVALID(s_axi_control_0_1_ARVALID),
        .s_axi_control_AWADDR(s_axi_control_0_1_AWADDR),
        .s_axi_control_AWREADY(s_axi_control_0_1_AWREADY),
        .s_axi_control_AWVALID(s_axi_control_0_1_AWVALID),
        .s_axi_control_BREADY(s_axi_control_0_1_BREADY),
        .s_axi_control_BRESP(s_axi_control_0_1_BRESP),
        .s_axi_control_BVALID(s_axi_control_0_1_BVALID),
        .s_axi_control_RDATA(s_axi_control_0_1_RDATA),
        .s_axi_control_RREADY(s_axi_control_0_1_RREADY),
        .s_axi_control_RRESP(s_axi_control_0_1_RRESP),
        .s_axi_control_RVALID(s_axi_control_0_1_RVALID),
        .s_axi_control_WDATA(s_axi_control_0_1_WDATA),
        .s_axi_control_WREADY(s_axi_control_0_1_WREADY),
        .s_axi_control_WSTRB(s_axi_control_0_1_WSTRB),
        .s_axi_control_WVALID(s_axi_control_0_1_WVALID),
        .stream_out_TDATA(read_mem_0_stream_out_TDATA),
        .stream_out_TREADY(read_mem_0_stream_out_TREADY),
        .stream_out_TVALID(read_mem_0_stream_out_TVALID));

  read_mem #(
    .ap_ST_fsm_state1(3'B001),
    .ap_ST_fsm_pp0_stage0(3'B010),
    .ap_ST_fsm_state77(3'B100),
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_S_AXI_CONTROL_ADDR_WIDTH(5),
    .C_S_AXI_DATA_WIDTH(32),
    .C_M_AXI_GMEM0_ID_WIDTH(1),
    .C_M_AXI_GMEM0_ADDR_WIDTH(64),
    .C_M_AXI_GMEM0_DATA_WIDTH(512),
    .C_M_AXI_GMEM0_AWUSER_WIDTH(1),
    .C_M_AXI_GMEM0_ARUSER_WIDTH(1),
    .C_M_AXI_GMEM0_WUSER_WIDTH(1),
    .C_M_AXI_GMEM0_RUSER_WIDTH(1),
    .C_M_AXI_GMEM0_BUSER_WIDTH(1),
    .C_M_AXI_GMEM0_USER_VALUE(0),
    .C_M_AXI_GMEM0_PROT_VALUE(0),
    .C_M_AXI_GMEM0_CACHE_VALUE(3),
    .C_M_AXI_DATA_WIDTH(32),
    .C_S_AXI_CONTROL_WSTRB_WIDTH(4),
    .C_S_AXI_WSTRB_WIDTH(4),
    .C_M_AXI_GMEM0_WSTRB_WIDTH(64),
    .C_M_AXI_WSTRB_WIDTH(4)
  ) read_mem_1
       (.ap_clk(ap_clk_1),
        .ap_rst_n(resetn_1),
        .m_axi_gmem0_ARADDR(read_mem_1_m_axi_gmem0_ARADDR),
        .m_axi_gmem0_ARBURST(read_mem_1_m_axi_gmem0_ARBURST),
        .m_axi_gmem0_ARCACHE(read_mem_1_m_axi_gmem0_ARCACHE),
        .m_axi_gmem0_ARID(read_mem_1_m_axi_gmem0_ARID),
        .m_axi_gmem0_ARLEN(read_mem_1_m_axi_gmem0_ARLEN),
        .m_axi_gmem0_ARLOCK(read_mem_1_m_axi_gmem0_ARLOCK),
        .m_axi_gmem0_ARPROT(read_mem_1_m_axi_gmem0_ARPROT),
        .m_axi_gmem0_ARQOS(read_mem_1_m_axi_gmem0_ARQOS),
        .m_axi_gmem0_ARREADY(read_mem_1_m_axi_gmem0_ARREADY),
        .m_axi_gmem0_ARREGION(read_mem_1_m_axi_gmem0_ARREGION),
        .m_axi_gmem0_ARSIZE(read_mem_1_m_axi_gmem0_ARSIZE),
        .m_axi_gmem0_ARUSER(read_mem_1_m_axi_gmem0_ARUSER),
        .m_axi_gmem0_ARVALID(read_mem_1_m_axi_gmem0_ARVALID),
        .m_axi_gmem0_AWADDR(read_mem_1_m_axi_gmem0_AWADDR),
        .m_axi_gmem0_AWBURST(read_mem_1_m_axi_gmem0_AWBURST),
        .m_axi_gmem0_AWCACHE(read_mem_1_m_axi_gmem0_AWCACHE),
        .m_axi_gmem0_AWID(read_mem_1_m_axi_gmem0_AWID),
        .m_axi_gmem0_AWLEN(read_mem_1_m_axi_gmem0_AWLEN),
        .m_axi_gmem0_AWLOCK(read_mem_1_m_axi_gmem0_AWLOCK),
        .m_axi_gmem0_AWPROT(read_mem_1_m_axi_gmem0_AWPROT),
        .m_axi_gmem0_AWQOS(read_mem_1_m_axi_gmem0_AWQOS),
        .m_axi_gmem0_AWREADY(read_mem_1_m_axi_gmem0_AWREADY),
        .m_axi_gmem0_AWREGION(read_mem_1_m_axi_gmem0_AWREGION),
        .m_axi_gmem0_AWSIZE(read_mem_1_m_axi_gmem0_AWSIZE),
        .m_axi_gmem0_AWUSER(read_mem_1_m_axi_gmem0_AWUSER),
        .m_axi_gmem0_AWVALID(read_mem_1_m_axi_gmem0_AWVALID),
        .m_axi_gmem0_BID(read_mem_1_m_axi_gmem0_BID),
        .m_axi_gmem0_BREADY(read_mem_1_m_axi_gmem0_BREADY),
        .m_axi_gmem0_BRESP(read_mem_1_m_axi_gmem0_BRESP),
        .m_axi_gmem0_BUSER(read_mem_1_m_axi_gmem0_BUSER),
        .m_axi_gmem0_BVALID(read_mem_1_m_axi_gmem0_BVALID),
        .m_axi_gmem0_RDATA(read_mem_1_m_axi_gmem0_RDATA),
        .m_axi_gmem0_RID(read_mem_1_m_axi_gmem0_RID),
        .m_axi_gmem0_RLAST(read_mem_1_m_axi_gmem0_RLAST),
        .m_axi_gmem0_RREADY(read_mem_1_m_axi_gmem0_RREADY),
        .m_axi_gmem0_RRESP(read_mem_1_m_axi_gmem0_RRESP),
        .m_axi_gmem0_RUSER(read_mem_1_m_axi_gmem0_RUSER),
        .m_axi_gmem0_RVALID(read_mem_1_m_axi_gmem0_RVALID),
        .m_axi_gmem0_WDATA(read_mem_1_m_axi_gmem0_WDATA),
        .m_axi_gmem0_WID(read_mem_1_m_axi_gmem0_WID),
        .m_axi_gmem0_WLAST(read_mem_1_m_axi_gmem0_WLAST),
        .m_axi_gmem0_WREADY(read_mem_1_m_axi_gmem0_WREADY),
        .m_axi_gmem0_WSTRB(read_mem_1_m_axi_gmem0_WSTRB),
        .m_axi_gmem0_WUSER(read_mem_1_m_axi_gmem0_WUSER),
        .m_axi_gmem0_WVALID(read_mem_1_m_axi_gmem0_WVALID),
        .s_axi_control_ARADDR(s_axi_control_1_1_ARADDR),
        .s_axi_control_ARREADY(s_axi_control_1_1_ARREADY),
        .s_axi_control_ARVALID(s_axi_control_1_1_ARVALID),
        .s_axi_control_AWADDR(s_axi_control_1_1_AWADDR),
        .s_axi_control_AWREADY(s_axi_control_1_1_AWREADY),
        .s_axi_control_AWVALID(s_axi_control_1_1_AWVALID),
        .s_axi_control_BREADY(s_axi_control_1_1_BREADY),
        .s_axi_control_BRESP(s_axi_control_1_1_BRESP),
        .s_axi_control_BVALID(s_axi_control_1_1_BVALID),
        .s_axi_control_RDATA(s_axi_control_1_1_RDATA),
        .s_axi_control_RREADY(s_axi_control_1_1_RREADY),
        .s_axi_control_RRESP(s_axi_control_1_1_RRESP),
        .s_axi_control_RVALID(s_axi_control_1_1_RVALID),
        .s_axi_control_WDATA(s_axi_control_1_1_WDATA),
        .s_axi_control_WREADY(s_axi_control_1_1_WREADY),
        .s_axi_control_WSTRB(s_axi_control_1_1_WSTRB),
        .s_axi_control_WVALID(s_axi_control_1_1_WVALID),
        .stream_out_TDATA(read_mem_1_stream_out_TDATA),
        .stream_out_TREADY(read_mem_1_stream_out_TREADY),
        .stream_out_TVALID(read_mem_1_stream_out_TVALID));

  design_1_proc_sys_reset_0_0 reset_syncer
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(resetn_2),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(resetn_1),
        .slowest_sync_clk(ap_clk_1));

  write_mem #(
    .ap_ST_fsm_state1(3'B001),
    .ap_ST_fsm_pp0_stage0(3'B010),
    .ap_ST_fsm_state73(3'B100),
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_S_AXI_CONTROL_ADDR_WIDTH(5),
    .C_S_AXI_DATA_WIDTH(32),
    .C_M_AXI_GMEM1_ID_WIDTH(1),
    .C_M_AXI_GMEM1_ADDR_WIDTH(64),
    .C_M_AXI_GMEM1_DATA_WIDTH(512),
    .C_M_AXI_GMEM1_AWUSER_WIDTH(1),
    .C_M_AXI_GMEM1_ARUSER_WIDTH(1),
    .C_M_AXI_GMEM1_WUSER_WIDTH(1),
    .C_M_AXI_GMEM1_RUSER_WIDTH(1),
    .C_M_AXI_GMEM1_BUSER_WIDTH(1),
    .C_M_AXI_GMEM1_USER_VALUE(0),
    .C_M_AXI_GMEM1_PROT_VALUE(0),
    .C_M_AXI_GMEM1_CACHE_VALUE(3),
    .C_M_AXI_DATA_WIDTH(32),
    .C_S_AXI_CONTROL_WSTRB_WIDTH(4),
    .C_S_AXI_WSTRB_WIDTH(4),
    .C_M_AXI_GMEM1_WSTRB_WIDTH(64),
    .C_M_AXI_WSTRB_WIDTH(4)
  ) write_mem_0
       (.ap_clk(ap_clk_1),
        .ap_rst_n(resetn_1),
        .m_axi_gmem1_ARADDR(write_mem_0_m_axi_gmem1_ARADDR),
        .m_axi_gmem1_ARBURST(write_mem_0_m_axi_gmem1_ARBURST),
        .m_axi_gmem1_ARCACHE(write_mem_0_m_axi_gmem1_ARCACHE),
        .m_axi_gmem1_ARID(write_mem_0_m_axi_gmem1_ARID),
        .m_axi_gmem1_ARLEN(write_mem_0_m_axi_gmem1_ARLEN),
        .m_axi_gmem1_ARLOCK(write_mem_0_m_axi_gmem1_ARLOCK),
        .m_axi_gmem1_ARPROT(write_mem_0_m_axi_gmem1_ARPROT),
        .m_axi_gmem1_ARQOS(write_mem_0_m_axi_gmem1_ARQOS),
        .m_axi_gmem1_ARREADY(write_mem_0_m_axi_gmem1_ARREADY),
        .m_axi_gmem1_ARREGION(write_mem_0_m_axi_gmem1_ARREGION),
        .m_axi_gmem1_ARSIZE(write_mem_0_m_axi_gmem1_ARSIZE),
        .m_axi_gmem1_ARUSER(write_mem_0_m_axi_gmem1_ARUSER),
        .m_axi_gmem1_ARVALID(write_mem_0_m_axi_gmem1_ARVALID),
        .m_axi_gmem1_AWADDR(write_mem_0_m_axi_gmem1_AWADDR),
        .m_axi_gmem1_AWBURST(write_mem_0_m_axi_gmem1_AWBURST),
        .m_axi_gmem1_AWCACHE(write_mem_0_m_axi_gmem1_AWCACHE),
        .m_axi_gmem1_AWID(write_mem_0_m_axi_gmem1_AWID),
        .m_axi_gmem1_AWLEN(write_mem_0_m_axi_gmem1_AWLEN),
        .m_axi_gmem1_AWLOCK(write_mem_0_m_axi_gmem1_AWLOCK),
        .m_axi_gmem1_AWPROT(write_mem_0_m_axi_gmem1_AWPROT),
        .m_axi_gmem1_AWQOS(write_mem_0_m_axi_gmem1_AWQOS),
        .m_axi_gmem1_AWREADY(write_mem_0_m_axi_gmem1_AWREADY),
        .m_axi_gmem1_AWREGION(write_mem_0_m_axi_gmem1_AWREGION),
        .m_axi_gmem1_AWSIZE(write_mem_0_m_axi_gmem1_AWSIZE),
        .m_axi_gmem1_AWUSER(write_mem_0_m_axi_gmem1_AWUSER),
        .m_axi_gmem1_AWVALID(write_mem_0_m_axi_gmem1_AWVALID),
        .m_axi_gmem1_BID(write_mem_0_m_axi_gmem1_BID),
        .m_axi_gmem1_BREADY(write_mem_0_m_axi_gmem1_BREADY),
        .m_axi_gmem1_BRESP(write_mem_0_m_axi_gmem1_BRESP),
        .m_axi_gmem1_BUSER(write_mem_0_m_axi_gmem1_BUSER),
        .m_axi_gmem1_BVALID(write_mem_0_m_axi_gmem1_BVALID),
        .m_axi_gmem1_RDATA(write_mem_0_m_axi_gmem1_RDATA),
        .m_axi_gmem1_RID(write_mem_0_m_axi_gmem1_RID),
        .m_axi_gmem1_RLAST(write_mem_0_m_axi_gmem1_RLAST),
        .m_axi_gmem1_RREADY(write_mem_0_m_axi_gmem1_RREADY),
        .m_axi_gmem1_RRESP(write_mem_0_m_axi_gmem1_RRESP),
        .m_axi_gmem1_RUSER(write_mem_0_m_axi_gmem1_RUSER),
        .m_axi_gmem1_RVALID(write_mem_0_m_axi_gmem1_RVALID),
        .m_axi_gmem1_WDATA(write_mem_0_m_axi_gmem1_WDATA),
        .m_axi_gmem1_WID(write_mem_0_m_axi_gmem1_WID),
        .m_axi_gmem1_WLAST(write_mem_0_m_axi_gmem1_WLAST),
        .m_axi_gmem1_WREADY(write_mem_0_m_axi_gmem1_WREADY),
        .m_axi_gmem1_WSTRB(write_mem_0_m_axi_gmem1_WSTRB),
        .m_axi_gmem1_WUSER(write_mem_0_m_axi_gmem1_WUSER),
        .m_axi_gmem1_WVALID(write_mem_0_m_axi_gmem1_WVALID),
        .s_axi_control_ARADDR(s_axi_control_2_1_ARADDR),
        .s_axi_control_ARREADY(s_axi_control_2_1_ARREADY),
        .s_axi_control_ARVALID(s_axi_control_2_1_ARVALID),
        .s_axi_control_AWADDR(s_axi_control_2_1_AWADDR),
        .s_axi_control_AWREADY(s_axi_control_2_1_AWREADY),
        .s_axi_control_AWVALID(s_axi_control_2_1_AWVALID),
        .s_axi_control_BREADY(s_axi_control_2_1_BREADY),
        .s_axi_control_BRESP(s_axi_control_2_1_BRESP),
        .s_axi_control_BVALID(s_axi_control_2_1_BVALID),
        .s_axi_control_RDATA(s_axi_control_2_1_RDATA),
        .s_axi_control_RREADY(s_axi_control_2_1_RREADY),
        .s_axi_control_RRESP(s_axi_control_2_1_RRESP),
        .s_axi_control_RVALID(s_axi_control_2_1_RVALID),
        .s_axi_control_WDATA(s_axi_control_2_1_WDATA),
        .s_axi_control_WREADY(s_axi_control_2_1_WREADY),
        .s_axi_control_WSTRB(s_axi_control_2_1_WSTRB),
        .s_axi_control_WVALID(s_axi_control_2_1_WVALID),
        .stream_in_TDATA(fifo_2_dout_TDATA),
        .stream_in_TREADY(fifo_2_dout_TREADY),
        .stream_in_TVALID(fifo_2_dout_TVALID));
endmodule
