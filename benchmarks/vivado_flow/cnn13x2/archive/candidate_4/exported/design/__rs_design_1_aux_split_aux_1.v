// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs_design_1_aux_split_aux_1 (
    output wire        apb_sys_reset_ext_reset_in,
    output wire        gnd_driver_0_clk,
    output wire        gnd_driver_0_rst_n,
    output wire        hbm_axi_clk_clk_in1,
    output wire        hbm_axi_clk_resetn,
    output wire        hbm_sys_reset_ext_reset_in,
    output wire        kernel3_0_ap_clk,
    output wire        kernel3_0_ap_rst_n,
    output wire [ 5:0] kernel3_0_s_axi_control_ARADDR,
    input wire         kernel3_0_s_axi_control_ARREADY,
    output wire        kernel3_0_s_axi_control_ARVALID,
    output wire [ 5:0] kernel3_0_s_axi_control_AWADDR,
    input wire         kernel3_0_s_axi_control_AWREADY,
    output wire        kernel3_0_s_axi_control_AWVALID,
    output wire        kernel3_0_s_axi_control_BREADY,
    input wire  [ 1:0] kernel3_0_s_axi_control_BRESP,
    input wire         kernel3_0_s_axi_control_BVALID,
    input wire  [31:0] kernel3_0_s_axi_control_RDATA,
    output wire        kernel3_0_s_axi_control_RREADY,
    input wire  [ 1:0] kernel3_0_s_axi_control_RRESP,
    input wire         kernel3_0_s_axi_control_RVALID,
    output wire [31:0] kernel3_0_s_axi_control_WDATA,
    input wire         kernel3_0_s_axi_control_WREADY,
    output wire [ 3:0] kernel3_0_s_axi_control_WSTRB,
    output wire        kernel3_0_s_axi_control_WVALID,
    output wire        kernel_clk_clk_in1,
    input wire         kernel_clk_clk_out1_1,
    output wire        kernel_clk_resetn,
    output wire        kernel_sys_reset_ext_reset_in,
    input wire  [ 0:0] kernel_sys_reset_peripheral_aresetn_1,
    output wire        kernel_sys_reset_slowest_sync_clk,
    output wire        smartconnect_28_aclk,
    output wire        smartconnect_28_aresetn,
    output wire        smartconnect_29_aclk,
    output wire        smartconnect_29_aresetn,
    output wire        smartconnect_30_aclk,
    output wire        smartconnect_30_aresetn,
    output wire        smartconnect_31_aclk,
    output wire        smartconnect_31_aresetn,
    input wire         xdma_0_axi_aclk_1,
    input wire         xdma_0_axi_aresetn_1,
    output wire        xdma_0_axi_periph_ACLK,
    output wire        xdma_0_axi_periph_ARESETN,
    output wire        xdma_0_axi_periph_M00_ACLK,
    output wire        xdma_0_axi_periph_M00_ARESETN,
    input wire  [63:0] xdma_0_axi_periph_M00_AXI_araddr,
    output wire        xdma_0_axi_periph_M00_AXI_arready,
    input wire         xdma_0_axi_periph_M00_AXI_arvalid,
    input wire  [63:0] xdma_0_axi_periph_M00_AXI_awaddr,
    output wire        xdma_0_axi_periph_M00_AXI_awready,
    input wire         xdma_0_axi_periph_M00_AXI_awvalid,
    input wire         xdma_0_axi_periph_M00_AXI_bready,
    output wire [ 1:0] xdma_0_axi_periph_M00_AXI_bresp,
    output wire        xdma_0_axi_periph_M00_AXI_bvalid,
    output wire [31:0] xdma_0_axi_periph_M00_AXI_rdata,
    input wire         xdma_0_axi_periph_M00_AXI_rready,
    output wire [ 1:0] xdma_0_axi_periph_M00_AXI_rresp,
    output wire        xdma_0_axi_periph_M00_AXI_rvalid,
    input wire  [31:0] xdma_0_axi_periph_M00_AXI_wdata,
    output wire        xdma_0_axi_periph_M00_AXI_wready,
    input wire  [ 3:0] xdma_0_axi_periph_M00_AXI_wstrb,
    input wire         xdma_0_axi_periph_M00_AXI_wvalid,
    output wire        xdma_0_axi_periph_S00_ACLK,
    output wire        xdma_0_axi_periph_S00_ARESETN,
    output wire [63:0] xdma_0_axi_periph_S00_AXI_araddr,
    output wire [ 1:0] xdma_0_axi_periph_S00_AXI_arburst,
    output wire [ 3:0] xdma_0_axi_periph_S00_AXI_arcache,
    output wire [ 3:0] xdma_0_axi_periph_S00_AXI_arid,
    output wire [ 7:0] xdma_0_axi_periph_S00_AXI_arlen,
    output wire [ 0:0] xdma_0_axi_periph_S00_AXI_arlock,
    output wire [ 2:0] xdma_0_axi_periph_S00_AXI_arprot,
    input wire         xdma_0_axi_periph_S00_AXI_arready,
    output wire [ 2:0] xdma_0_axi_periph_S00_AXI_arsize,
    output wire        xdma_0_axi_periph_S00_AXI_arvalid,
    output wire [63:0] xdma_0_axi_periph_S00_AXI_awaddr,
    output wire [ 1:0] xdma_0_axi_periph_S00_AXI_awburst,
    output wire [ 3:0] xdma_0_axi_periph_S00_AXI_awcache,
    output wire [ 3:0] xdma_0_axi_periph_S00_AXI_awid,
    output wire [ 7:0] xdma_0_axi_periph_S00_AXI_awlen,
    output wire [ 0:0] xdma_0_axi_periph_S00_AXI_awlock,
    output wire [ 2:0] xdma_0_axi_periph_S00_AXI_awprot,
    input wire         xdma_0_axi_periph_S00_AXI_awready,
    output wire [ 2:0] xdma_0_axi_periph_S00_AXI_awsize,
    output wire        xdma_0_axi_periph_S00_AXI_awvalid,
    input wire  [ 3:0] xdma_0_axi_periph_S00_AXI_bid,
    output wire        xdma_0_axi_periph_S00_AXI_bready,
    input wire  [ 1:0] xdma_0_axi_periph_S00_AXI_bresp,
    input wire         xdma_0_axi_periph_S00_AXI_bvalid,
    input wire  [63:0] xdma_0_axi_periph_S00_AXI_rdata,
    input wire  [ 3:0] xdma_0_axi_periph_S00_AXI_rid,
    input wire         xdma_0_axi_periph_S00_AXI_rlast,
    output wire        xdma_0_axi_periph_S00_AXI_rready,
    input wire  [ 1:0] xdma_0_axi_periph_S00_AXI_rresp,
    input wire         xdma_0_axi_periph_S00_AXI_rvalid,
    output wire [63:0] xdma_0_axi_periph_S00_AXI_wdata,
    output wire        xdma_0_axi_periph_S00_AXI_wlast,
    input wire         xdma_0_axi_periph_S00_AXI_wready,
    output wire [ 7:0] xdma_0_axi_periph_S00_AXI_wstrb,
    output wire        xdma_0_axi_periph_S00_AXI_wvalid,
    input wire  [63:0] xdma_0_m_axib_araddr,
    input wire  [ 1:0] xdma_0_m_axib_arburst,
    input wire  [ 3:0] xdma_0_m_axib_arcache,
    input wire  [ 3:0] xdma_0_m_axib_arid,
    input wire  [ 7:0] xdma_0_m_axib_arlen,
    input wire         xdma_0_m_axib_arlock,
    input wire  [ 2:0] xdma_0_m_axib_arprot,
    output wire        xdma_0_m_axib_arready,
    input wire  [ 2:0] xdma_0_m_axib_arsize,
    input wire         xdma_0_m_axib_arvalid,
    input wire  [63:0] xdma_0_m_axib_awaddr,
    input wire  [ 1:0] xdma_0_m_axib_awburst,
    input wire  [ 3:0] xdma_0_m_axib_awcache,
    input wire  [ 3:0] xdma_0_m_axib_awid,
    input wire  [ 7:0] xdma_0_m_axib_awlen,
    input wire         xdma_0_m_axib_awlock,
    input wire  [ 2:0] xdma_0_m_axib_awprot,
    output wire        xdma_0_m_axib_awready,
    input wire  [ 2:0] xdma_0_m_axib_awsize,
    input wire         xdma_0_m_axib_awvalid,
    output wire [ 3:0] xdma_0_m_axib_bid,
    input wire         xdma_0_m_axib_bready,
    output wire [ 1:0] xdma_0_m_axib_bresp,
    output wire        xdma_0_m_axib_bvalid,
    output wire [63:0] xdma_0_m_axib_rdata,
    output wire [ 3:0] xdma_0_m_axib_rid,
    output wire        xdma_0_m_axib_rlast,
    input wire         xdma_0_m_axib_rready,
    output wire [ 1:0] xdma_0_m_axib_rresp,
    output wire        xdma_0_m_axib_rvalid,
    input wire  [63:0] xdma_0_m_axib_wdata,
    input wire         xdma_0_m_axib_wlast,
    output wire        xdma_0_m_axib_wready,
    input wire  [ 7:0] xdma_0_m_axib_wstrb,
    input wire         xdma_0_m_axib_wvalid
);
assign apb_sys_reset_ext_reset_in = xdma_0_axi_aresetn_1;
assign gnd_driver_0_clk = xdma_0_axi_aclk_1;
assign gnd_driver_0_rst_n = xdma_0_axi_aresetn_1;
assign hbm_axi_clk_clk_in1 = xdma_0_axi_aclk_1;
assign hbm_axi_clk_resetn = xdma_0_axi_aresetn_1;
assign hbm_sys_reset_ext_reset_in = xdma_0_axi_aresetn_1;
assign kernel3_0_ap_clk = kernel_clk_clk_out1_1;
assign kernel3_0_ap_rst_n = kernel_sys_reset_peripheral_aresetn_1;
assign kernel3_0_s_axi_control_ARADDR = xdma_0_axi_periph_M00_AXI_araddr;
assign kernel3_0_s_axi_control_ARVALID = xdma_0_axi_periph_M00_AXI_arvalid;
assign kernel3_0_s_axi_control_AWADDR = xdma_0_axi_periph_M00_AXI_awaddr;
assign kernel3_0_s_axi_control_AWVALID = xdma_0_axi_periph_M00_AXI_awvalid;
assign kernel3_0_s_axi_control_BREADY = xdma_0_axi_periph_M00_AXI_bready;
assign kernel3_0_s_axi_control_RREADY = xdma_0_axi_periph_M00_AXI_rready;
assign kernel3_0_s_axi_control_WDATA = xdma_0_axi_periph_M00_AXI_wdata;
assign kernel3_0_s_axi_control_WSTRB = xdma_0_axi_periph_M00_AXI_wstrb;
assign kernel3_0_s_axi_control_WVALID = xdma_0_axi_periph_M00_AXI_wvalid;
assign kernel_clk_clk_in1 = xdma_0_axi_aclk_1;
assign kernel_clk_resetn = xdma_0_axi_aresetn_1;
assign kernel_sys_reset_ext_reset_in = xdma_0_axi_aresetn_1;
assign kernel_sys_reset_slowest_sync_clk = kernel_clk_clk_out1_1;
assign smartconnect_28_aclk = kernel_clk_clk_out1_1;
assign smartconnect_28_aresetn = kernel_sys_reset_peripheral_aresetn_1;
assign smartconnect_29_aclk = kernel_clk_clk_out1_1;
assign smartconnect_29_aresetn = kernel_sys_reset_peripheral_aresetn_1;
assign smartconnect_30_aclk = kernel_clk_clk_out1_1;
assign smartconnect_30_aresetn = kernel_sys_reset_peripheral_aresetn_1;
assign smartconnect_31_aclk = xdma_0_axi_aclk_1;
assign smartconnect_31_aresetn = xdma_0_axi_aresetn_1;
assign xdma_0_axi_periph_ACLK = xdma_0_axi_aclk_1;
assign xdma_0_axi_periph_ARESETN = xdma_0_axi_aresetn_1;
assign xdma_0_axi_periph_M00_ACLK = kernel_clk_clk_out1_1;
assign xdma_0_axi_periph_M00_ARESETN = kernel_sys_reset_peripheral_aresetn_1;
assign xdma_0_axi_periph_M00_AXI_arready = kernel3_0_s_axi_control_ARREADY;
assign xdma_0_axi_periph_M00_AXI_awready = kernel3_0_s_axi_control_AWREADY;
assign xdma_0_axi_periph_M00_AXI_bresp = kernel3_0_s_axi_control_BRESP;
assign xdma_0_axi_periph_M00_AXI_bvalid = kernel3_0_s_axi_control_BVALID;
assign xdma_0_axi_periph_M00_AXI_rdata = kernel3_0_s_axi_control_RDATA;
assign xdma_0_axi_periph_M00_AXI_rresp = kernel3_0_s_axi_control_RRESP;
assign xdma_0_axi_periph_M00_AXI_rvalid = kernel3_0_s_axi_control_RVALID;
assign xdma_0_axi_periph_M00_AXI_wready = kernel3_0_s_axi_control_WREADY;
assign xdma_0_axi_periph_S00_ACLK = xdma_0_axi_aclk_1;
assign xdma_0_axi_periph_S00_ARESETN = xdma_0_axi_aresetn_1;
assign xdma_0_axi_periph_S00_AXI_araddr = xdma_0_m_axib_araddr;
assign xdma_0_axi_periph_S00_AXI_arburst = xdma_0_m_axib_arburst;
assign xdma_0_axi_periph_S00_AXI_arcache = xdma_0_m_axib_arcache;
assign xdma_0_axi_periph_S00_AXI_arid = xdma_0_m_axib_arid;
assign xdma_0_axi_periph_S00_AXI_arlen = xdma_0_m_axib_arlen;
assign xdma_0_axi_periph_S00_AXI_arlock = xdma_0_m_axib_arlock;
assign xdma_0_axi_periph_S00_AXI_arprot = xdma_0_m_axib_arprot;
assign xdma_0_axi_periph_S00_AXI_arsize = xdma_0_m_axib_arsize;
assign xdma_0_axi_periph_S00_AXI_arvalid = xdma_0_m_axib_arvalid;
assign xdma_0_axi_periph_S00_AXI_awaddr = xdma_0_m_axib_awaddr;
assign xdma_0_axi_periph_S00_AXI_awburst = xdma_0_m_axib_awburst;
assign xdma_0_axi_periph_S00_AXI_awcache = xdma_0_m_axib_awcache;
assign xdma_0_axi_periph_S00_AXI_awid = xdma_0_m_axib_awid;
assign xdma_0_axi_periph_S00_AXI_awlen = xdma_0_m_axib_awlen;
assign xdma_0_axi_periph_S00_AXI_awlock = xdma_0_m_axib_awlock;
assign xdma_0_axi_periph_S00_AXI_awprot = xdma_0_m_axib_awprot;
assign xdma_0_axi_periph_S00_AXI_awsize = xdma_0_m_axib_awsize;
assign xdma_0_axi_periph_S00_AXI_awvalid = xdma_0_m_axib_awvalid;
assign xdma_0_axi_periph_S00_AXI_bready = xdma_0_m_axib_bready;
assign xdma_0_axi_periph_S00_AXI_rready = xdma_0_m_axib_rready;
assign xdma_0_axi_periph_S00_AXI_wdata = xdma_0_m_axib_wdata;
assign xdma_0_axi_periph_S00_AXI_wlast = xdma_0_m_axib_wlast;
assign xdma_0_axi_periph_S00_AXI_wstrb = xdma_0_m_axib_wstrb;
assign xdma_0_axi_periph_S00_AXI_wvalid = xdma_0_m_axib_wvalid;
assign xdma_0_m_axib_arready = xdma_0_axi_periph_S00_AXI_arready;
assign xdma_0_m_axib_awready = xdma_0_axi_periph_S00_AXI_awready;
assign xdma_0_m_axib_bid = xdma_0_axi_periph_S00_AXI_bid;
assign xdma_0_m_axib_bresp = xdma_0_axi_periph_S00_AXI_bresp;
assign xdma_0_m_axib_bvalid = xdma_0_axi_periph_S00_AXI_bvalid;
assign xdma_0_m_axib_rdata = xdma_0_axi_periph_S00_AXI_rdata;
assign xdma_0_m_axib_rid = xdma_0_axi_periph_S00_AXI_rid;
assign xdma_0_m_axib_rlast = xdma_0_axi_periph_S00_AXI_rlast;
assign xdma_0_m_axib_rresp = xdma_0_axi_periph_S00_AXI_rresp;
assign xdma_0_m_axib_rvalid = xdma_0_axi_periph_S00_AXI_rvalid;
assign xdma_0_m_axib_wready = xdma_0_axi_periph_S00_AXI_wready;
endmodule