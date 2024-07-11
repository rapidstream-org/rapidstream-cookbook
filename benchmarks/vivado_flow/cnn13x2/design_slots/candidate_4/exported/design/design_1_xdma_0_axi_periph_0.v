`timescale 1 ns / 1 ps

module design_1_xdma_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [63:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [63:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [63:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [3:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input [0:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [63:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [3:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [3:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [63:0]S00_AXI_rdata;
  output [3:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [63:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [7:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire [63:0]s00_couplers_to_xdma_0_axi_periph_ARADDR;
  wire s00_couplers_to_xdma_0_axi_periph_ARREADY;
  wire s00_couplers_to_xdma_0_axi_periph_ARVALID;
  wire [63:0]s00_couplers_to_xdma_0_axi_periph_AWADDR;
  wire s00_couplers_to_xdma_0_axi_periph_AWREADY;
  wire s00_couplers_to_xdma_0_axi_periph_AWVALID;
  wire s00_couplers_to_xdma_0_axi_periph_BREADY;
  wire [1:0]s00_couplers_to_xdma_0_axi_periph_BRESP;
  wire s00_couplers_to_xdma_0_axi_periph_BVALID;
  wire [31:0]s00_couplers_to_xdma_0_axi_periph_RDATA;
  wire s00_couplers_to_xdma_0_axi_periph_RREADY;
  wire [1:0]s00_couplers_to_xdma_0_axi_periph_RRESP;
  wire s00_couplers_to_xdma_0_axi_periph_RVALID;
  wire [31:0]s00_couplers_to_xdma_0_axi_periph_WDATA;
  wire s00_couplers_to_xdma_0_axi_periph_WREADY;
  wire [3:0]s00_couplers_to_xdma_0_axi_periph_WSTRB;
  wire s00_couplers_to_xdma_0_axi_periph_WVALID;
  wire xdma_0_axi_periph_ACLK_net;
  wire xdma_0_axi_periph_ARESETN_net;
  wire [63:0]xdma_0_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]xdma_0_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]xdma_0_axi_periph_to_s00_couplers_ARCACHE;
  wire [3:0]xdma_0_axi_periph_to_s00_couplers_ARID;
  wire [7:0]xdma_0_axi_periph_to_s00_couplers_ARLEN;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]xdma_0_axi_periph_to_s00_couplers_ARPROT;
  wire xdma_0_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]xdma_0_axi_periph_to_s00_couplers_ARSIZE;
  wire xdma_0_axi_periph_to_s00_couplers_ARVALID;
  wire [63:0]xdma_0_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]xdma_0_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]xdma_0_axi_periph_to_s00_couplers_AWCACHE;
  wire [3:0]xdma_0_axi_periph_to_s00_couplers_AWID;
  wire [7:0]xdma_0_axi_periph_to_s00_couplers_AWLEN;
  wire [0:0]xdma_0_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]xdma_0_axi_periph_to_s00_couplers_AWPROT;
  wire xdma_0_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]xdma_0_axi_periph_to_s00_couplers_AWSIZE;
  wire xdma_0_axi_periph_to_s00_couplers_AWVALID;
  wire [3:0]xdma_0_axi_periph_to_s00_couplers_BID;
  wire xdma_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]xdma_0_axi_periph_to_s00_couplers_BRESP;
  wire xdma_0_axi_periph_to_s00_couplers_BVALID;
  wire [63:0]xdma_0_axi_periph_to_s00_couplers_RDATA;
  wire [3:0]xdma_0_axi_periph_to_s00_couplers_RID;
  wire xdma_0_axi_periph_to_s00_couplers_RLAST;
  wire xdma_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]xdma_0_axi_periph_to_s00_couplers_RRESP;
  wire xdma_0_axi_periph_to_s00_couplers_RVALID;
  wire [63:0]xdma_0_axi_periph_to_s00_couplers_WDATA;
  wire xdma_0_axi_periph_to_s00_couplers_WLAST;
  wire xdma_0_axi_periph_to_s00_couplers_WREADY;
  wire [7:0]xdma_0_axi_periph_to_s00_couplers_WSTRB;
  wire xdma_0_axi_periph_to_s00_couplers_WVALID;
  assign M00_AXI_araddr[63:0] = s00_couplers_to_xdma_0_axi_periph_ARADDR;
  assign M00_AXI_arvalid = s00_couplers_to_xdma_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[63:0] = s00_couplers_to_xdma_0_axi_periph_AWADDR;
  assign M00_AXI_awvalid = s00_couplers_to_xdma_0_axi_periph_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_xdma_0_axi_periph_BREADY;
  assign M00_AXI_rready = s00_couplers_to_xdma_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = s00_couplers_to_xdma_0_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = s00_couplers_to_xdma_0_axi_periph_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_xdma_0_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = xdma_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = xdma_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[3:0] = xdma_0_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = xdma_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = xdma_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[63:0] = xdma_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[3:0] = xdma_0_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = xdma_0_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = xdma_0_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = xdma_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = xdma_0_axi_periph_to_s00_couplers_WREADY;
  assign s00_couplers_to_xdma_0_axi_periph_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_xdma_0_axi_periph_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_xdma_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_xdma_0_axi_periph_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_xdma_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign s00_couplers_to_xdma_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_xdma_0_axi_periph_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_xdma_0_axi_periph_WREADY = M00_AXI_wready;
  assign xdma_0_axi_periph_ACLK_net = M00_ACLK;
  assign xdma_0_axi_periph_ARESETN_net = M00_ARESETN;
  assign xdma_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[63:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[3:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock[0];
  assign xdma_0_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign xdma_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[63:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[3:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock[0];
  assign xdma_0_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign xdma_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign xdma_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign xdma_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[63:0];
  assign xdma_0_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign xdma_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[7:0];
  assign xdma_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  s00_couplers_imp_4M2UOV s00_couplers
       (.M_ACLK(xdma_0_axi_periph_ACLK_net),
        .M_ARESETN(xdma_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xdma_0_axi_periph_ARADDR),
        .M_AXI_arready(s00_couplers_to_xdma_0_axi_periph_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xdma_0_axi_periph_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xdma_0_axi_periph_AWADDR),
        .M_AXI_awready(s00_couplers_to_xdma_0_axi_periph_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xdma_0_axi_periph_AWVALID),
        .M_AXI_bready(s00_couplers_to_xdma_0_axi_periph_BREADY),
        .M_AXI_bresp(s00_couplers_to_xdma_0_axi_periph_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xdma_0_axi_periph_BVALID),
        .M_AXI_rdata(s00_couplers_to_xdma_0_axi_periph_RDATA),
        .M_AXI_rready(s00_couplers_to_xdma_0_axi_periph_RREADY),
        .M_AXI_rresp(s00_couplers_to_xdma_0_axi_periph_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xdma_0_axi_periph_RVALID),
        .M_AXI_wdata(s00_couplers_to_xdma_0_axi_periph_WDATA),
        .M_AXI_wready(s00_couplers_to_xdma_0_axi_periph_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xdma_0_axi_periph_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xdma_0_axi_periph_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(xdma_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(xdma_0_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(xdma_0_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(xdma_0_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(xdma_0_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(xdma_0_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(xdma_0_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arready(xdma_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(xdma_0_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(xdma_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(xdma_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(xdma_0_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(xdma_0_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(xdma_0_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(xdma_0_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(xdma_0_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(xdma_0_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awready(xdma_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(xdma_0_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(xdma_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(xdma_0_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(xdma_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(xdma_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(xdma_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(xdma_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(xdma_0_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(xdma_0_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(xdma_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(xdma_0_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(xdma_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(xdma_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wlast(xdma_0_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(xdma_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(xdma_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(xdma_0_axi_periph_to_s00_couplers_WVALID));
endmodule
