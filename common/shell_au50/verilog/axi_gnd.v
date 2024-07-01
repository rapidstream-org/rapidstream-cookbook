`timescale 1 ps / 1 ps

(* DONT_TOUCH = "yes" *) module axi_gnd
   (ARESETN_HBM,
    CLK_HBM,
    M_AXI_HBM_araddr,
    M_AXI_HBM_arburst,
    M_AXI_HBM_arcache,
    M_AXI_HBM_arlen,
    M_AXI_HBM_arlock,
    M_AXI_HBM_arprot,
    M_AXI_HBM_arqos,
    M_AXI_HBM_arready,
    M_AXI_HBM_arsize,
    M_AXI_HBM_arvalid,
    M_AXI_HBM_awaddr,
    M_AXI_HBM_awburst,
    M_AXI_HBM_awcache,
    M_AXI_HBM_awlen,
    M_AXI_HBM_awlock,
    M_AXI_HBM_awprot,
    M_AXI_HBM_awqos,
    M_AXI_HBM_awready,
    M_AXI_HBM_awsize,
    M_AXI_HBM_awvalid,
    M_AXI_HBM_bready,
    M_AXI_HBM_bresp,
    M_AXI_HBM_bvalid,
    M_AXI_HBM_rdata,
    M_AXI_HBM_rlast,
    M_AXI_HBM_rready,
    M_AXI_HBM_rresp,
    M_AXI_HBM_rvalid,
    M_AXI_HBM_wdata,
    M_AXI_HBM_wlast,
    M_AXI_HBM_wready,
    M_AXI_HBM_wstrb,
    M_AXI_HBM_wvalid);
  input ARESETN_HBM;
  input CLK_HBM;
  output [63:0] M_AXI_HBM_araddr;
  output [1:0]M_AXI_HBM_arburst;
  output [3:0]M_AXI_HBM_arcache;
  output [3:0]M_AXI_HBM_arlen;
  output [1:0]M_AXI_HBM_arlock;
  output [2:0]M_AXI_HBM_arprot;
  output [3:0]M_AXI_HBM_arqos;
  input M_AXI_HBM_arready;
  output [2:0]M_AXI_HBM_arsize;
  output M_AXI_HBM_arvalid;
  output [63:0]M_AXI_HBM_awaddr;
  output [1:0]M_AXI_HBM_awburst;
  output [3:0]M_AXI_HBM_awcache;
  output [3:0]M_AXI_HBM_awlen;
  output [1:0]M_AXI_HBM_awlock;
  output [2:0]M_AXI_HBM_awprot;
  output [3:0]M_AXI_HBM_awqos;
  input M_AXI_HBM_awready;
  output [2:0]M_AXI_HBM_awsize;
  output M_AXI_HBM_awvalid;
  output M_AXI_HBM_bready;
  input [1:0]M_AXI_HBM_bresp;
  input M_AXI_HBM_bvalid;
  input [255:0]M_AXI_HBM_rdata;
  input M_AXI_HBM_rlast;
  output M_AXI_HBM_rready;
  input [1:0]M_AXI_HBM_rresp;
  input M_AXI_HBM_rvalid;
  output [255:0]M_AXI_HBM_wdata;
  output M_AXI_HBM_wlast;
  input M_AXI_HBM_wready;
  output [31:0]M_AXI_HBM_wstrb;
  output M_AXI_HBM_wvalid;

  assign M_AXI_HBM_araddr = 0;
  assign M_AXI_HBM_arburst = 0;
  assign M_AXI_HBM_arcache = 0;
  assign M_AXI_HBM_arlen = 0;
  assign M_AXI_HBM_arlock = 0;
  assign M_AXI_HBM_arprot = 0;
  assign M_AXI_HBM_arqos = 0;
  assign M_AXI_HBM_arsize = 0;
  assign M_AXI_HBM_arvalid = 0;
  assign M_AXI_HBM_awaddr = 0;
  assign M_AXI_HBM_awburst = 0;
  assign M_AXI_HBM_awcache = 0;
  assign M_AXI_HBM_awlen = 0;
  assign M_AXI_HBM_awlock = 0;
  assign M_AXI_HBM_awprot = 0;
  assign M_AXI_HBM_awqos = 0;
  assign M_AXI_HBM_awsize = 0;
  assign M_AXI_HBM_awvalid = 0;
  assign M_AXI_HBM_bready = 0;
  assign M_AXI_HBM_rready = 0;
  assign M_AXI_HBM_wdata = 0;
  assign M_AXI_HBM_wlast = 0;
  assign M_AXI_HBM_wstrb = 0;
  assign M_AXI_HBM_wvalid = 0;





  endmodule
