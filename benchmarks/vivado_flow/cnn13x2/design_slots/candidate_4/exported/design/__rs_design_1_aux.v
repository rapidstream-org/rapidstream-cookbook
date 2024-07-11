`timescale 1 ns / 1 ps
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Wed Jul 10 19:55:29 2024
//Host        : inglewood running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=24,numReposBlks=22,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *)module __rs_design_1_aux (
    output wire         HBM_CATTRIP,
    input wire          hbm_clk_clk_n,
    input wire          hbm_clk_clk_p,
    input wire          pci_express_x1_rxn,
    input wire          pci_express_x1_rxp,
    output wire         pci_express_x1_txn,
    output wire         pci_express_x1_txp,
    input wire          pcie_perstn,
    input wire          pcie_refclk_clk_n,
    input wire          pcie_refclk_clk_p,
    output wire         apb_sys_reset_aux_reset_in,
    input wire  [  0:0] apb_sys_reset_bus_struct_reset,
    output wire         apb_sys_reset_dcm_locked,
    output wire         apb_sys_reset_ext_reset_in,
    input wire  [  0:0] apb_sys_reset_interconnect_aresetn,
    output wire         apb_sys_reset_mb_debug_sys_rst,
    input wire          apb_sys_reset_mb_reset,
    input wire  [  0:0] apb_sys_reset_peripheral_aresetn_1,
    input wire  [  0:0] apb_sys_reset_peripheral_reset,
    output wire         apb_sys_reset_slowest_sync_clk,
    output wire         axi_register_slice_28_aclk,
    output wire         axi_register_slice_28_aresetn,
    input wire  [ 32:0] axi_register_slice_28_m_axi_araddr,
    input wire  [  1:0] axi_register_slice_28_m_axi_arburst,
    input wire  [  3:0] axi_register_slice_28_m_axi_arcache,
    input wire  [  3:0] axi_register_slice_28_m_axi_arlen,
    input wire  [  1:0] axi_register_slice_28_m_axi_arlock,
    input wire  [  2:0] axi_register_slice_28_m_axi_arprot,
    input wire  [  3:0] axi_register_slice_28_m_axi_arqos,
    output wire         axi_register_slice_28_m_axi_arready,
    input wire  [  2:0] axi_register_slice_28_m_axi_arsize,
    input wire  [  0:0] axi_register_slice_28_m_axi_aruser,
    input wire          axi_register_slice_28_m_axi_arvalid,
    input wire  [ 32:0] axi_register_slice_28_m_axi_awaddr,
    input wire  [  1:0] axi_register_slice_28_m_axi_awburst,
    input wire  [  3:0] axi_register_slice_28_m_axi_awcache,
    input wire  [  3:0] axi_register_slice_28_m_axi_awlen,
    input wire  [  1:0] axi_register_slice_28_m_axi_awlock,
    input wire  [  2:0] axi_register_slice_28_m_axi_awprot,
    input wire  [  3:0] axi_register_slice_28_m_axi_awqos,
    output wire         axi_register_slice_28_m_axi_awready,
    input wire  [  2:0] axi_register_slice_28_m_axi_awsize,
    input wire  [  0:0] axi_register_slice_28_m_axi_awuser,
    input wire          axi_register_slice_28_m_axi_awvalid,
    input wire          axi_register_slice_28_m_axi_bready,
    output wire [  1:0] axi_register_slice_28_m_axi_bresp,
    output wire [  0:0] axi_register_slice_28_m_axi_buser,
    output wire         axi_register_slice_28_m_axi_bvalid,
    output wire [255:0] axi_register_slice_28_m_axi_rdata,
    output wire         axi_register_slice_28_m_axi_rlast,
    input wire          axi_register_slice_28_m_axi_rready,
    output wire [  1:0] axi_register_slice_28_m_axi_rresp,
    output wire         axi_register_slice_28_m_axi_rvalid,
    input wire  [255:0] axi_register_slice_28_m_axi_wdata,
    input wire          axi_register_slice_28_m_axi_wlast,
    output wire         axi_register_slice_28_m_axi_wready,
    input wire  [ 31:0] axi_register_slice_28_m_axi_wstrb,
    input wire          axi_register_slice_28_m_axi_wvalid,
    output wire [ 32:0] axi_register_slice_28_s_axi_araddr,
    output wire [  1:0] axi_register_slice_28_s_axi_arburst,
    output wire [  3:0] axi_register_slice_28_s_axi_arcache,
    output wire [  3:0] axi_register_slice_28_s_axi_arlen,
    output wire [  1:0] axi_register_slice_28_s_axi_arlock,
    output wire [  2:0] axi_register_slice_28_s_axi_arprot,
    output wire [  3:0] axi_register_slice_28_s_axi_arqos,
    input wire          axi_register_slice_28_s_axi_arready,
    output wire [  2:0] axi_register_slice_28_s_axi_arsize,
    output wire [  0:0] axi_register_slice_28_s_axi_aruser,
    output wire         axi_register_slice_28_s_axi_arvalid,
    output wire [ 32:0] axi_register_slice_28_s_axi_awaddr,
    output wire [  1:0] axi_register_slice_28_s_axi_awburst,
    output wire [  3:0] axi_register_slice_28_s_axi_awcache,
    output wire [  3:0] axi_register_slice_28_s_axi_awlen,
    output wire [  1:0] axi_register_slice_28_s_axi_awlock,
    output wire [  2:0] axi_register_slice_28_s_axi_awprot,
    output wire [  3:0] axi_register_slice_28_s_axi_awqos,
    input wire          axi_register_slice_28_s_axi_awready,
    output wire [  2:0] axi_register_slice_28_s_axi_awsize,
    output wire [  0:0] axi_register_slice_28_s_axi_awuser,
    output wire         axi_register_slice_28_s_axi_awvalid,
    output wire         axi_register_slice_28_s_axi_bready,
    input wire  [  1:0] axi_register_slice_28_s_axi_bresp,
    input wire  [  0:0] axi_register_slice_28_s_axi_buser,
    input wire          axi_register_slice_28_s_axi_bvalid,
    input wire  [255:0] axi_register_slice_28_s_axi_rdata,
    input wire          axi_register_slice_28_s_axi_rlast,
    output wire         axi_register_slice_28_s_axi_rready,
    input wire  [  1:0] axi_register_slice_28_s_axi_rresp,
    input wire          axi_register_slice_28_s_axi_rvalid,
    output wire [255:0] axi_register_slice_28_s_axi_wdata,
    output wire         axi_register_slice_28_s_axi_wlast,
    input wire          axi_register_slice_28_s_axi_wready,
    output wire [ 31:0] axi_register_slice_28_s_axi_wstrb,
    output wire         axi_register_slice_28_s_axi_wvalid,
    output wire         axi_register_slice_29_aclk,
    output wire         axi_register_slice_29_aresetn,
    input wire  [ 32:0] axi_register_slice_29_m_axi_araddr,
    input wire  [  1:0] axi_register_slice_29_m_axi_arburst,
    input wire  [  3:0] axi_register_slice_29_m_axi_arcache,
    input wire  [  3:0] axi_register_slice_29_m_axi_arlen,
    input wire  [  1:0] axi_register_slice_29_m_axi_arlock,
    input wire  [  2:0] axi_register_slice_29_m_axi_arprot,
    input wire  [  3:0] axi_register_slice_29_m_axi_arqos,
    output wire         axi_register_slice_29_m_axi_arready,
    input wire  [  2:0] axi_register_slice_29_m_axi_arsize,
    input wire  [  0:0] axi_register_slice_29_m_axi_aruser,
    input wire          axi_register_slice_29_m_axi_arvalid,
    input wire  [ 32:0] axi_register_slice_29_m_axi_awaddr,
    input wire  [  1:0] axi_register_slice_29_m_axi_awburst,
    input wire  [  3:0] axi_register_slice_29_m_axi_awcache,
    input wire  [  3:0] axi_register_slice_29_m_axi_awlen,
    input wire  [  1:0] axi_register_slice_29_m_axi_awlock,
    input wire  [  2:0] axi_register_slice_29_m_axi_awprot,
    input wire  [  3:0] axi_register_slice_29_m_axi_awqos,
    output wire         axi_register_slice_29_m_axi_awready,
    input wire  [  2:0] axi_register_slice_29_m_axi_awsize,
    input wire  [  0:0] axi_register_slice_29_m_axi_awuser,
    input wire          axi_register_slice_29_m_axi_awvalid,
    input wire          axi_register_slice_29_m_axi_bready,
    output wire [  1:0] axi_register_slice_29_m_axi_bresp,
    output wire [  0:0] axi_register_slice_29_m_axi_buser,
    output wire         axi_register_slice_29_m_axi_bvalid,
    output wire [255:0] axi_register_slice_29_m_axi_rdata,
    output wire         axi_register_slice_29_m_axi_rlast,
    input wire          axi_register_slice_29_m_axi_rready,
    output wire [  1:0] axi_register_slice_29_m_axi_rresp,
    output wire         axi_register_slice_29_m_axi_rvalid,
    input wire  [255:0] axi_register_slice_29_m_axi_wdata,
    input wire          axi_register_slice_29_m_axi_wlast,
    output wire         axi_register_slice_29_m_axi_wready,
    input wire  [ 31:0] axi_register_slice_29_m_axi_wstrb,
    input wire          axi_register_slice_29_m_axi_wvalid,
    output wire [ 32:0] axi_register_slice_29_s_axi_araddr,
    output wire [  1:0] axi_register_slice_29_s_axi_arburst,
    output wire [  3:0] axi_register_slice_29_s_axi_arcache,
    output wire [  3:0] axi_register_slice_29_s_axi_arlen,
    output wire [  1:0] axi_register_slice_29_s_axi_arlock,
    output wire [  2:0] axi_register_slice_29_s_axi_arprot,
    output wire [  3:0] axi_register_slice_29_s_axi_arqos,
    input wire          axi_register_slice_29_s_axi_arready,
    output wire [  2:0] axi_register_slice_29_s_axi_arsize,
    output wire [  0:0] axi_register_slice_29_s_axi_aruser,
    output wire         axi_register_slice_29_s_axi_arvalid,
    output wire [ 32:0] axi_register_slice_29_s_axi_awaddr,
    output wire [  1:0] axi_register_slice_29_s_axi_awburst,
    output wire [  3:0] axi_register_slice_29_s_axi_awcache,
    output wire [  3:0] axi_register_slice_29_s_axi_awlen,
    output wire [  1:0] axi_register_slice_29_s_axi_awlock,
    output wire [  2:0] axi_register_slice_29_s_axi_awprot,
    output wire [  3:0] axi_register_slice_29_s_axi_awqos,
    input wire          axi_register_slice_29_s_axi_awready,
    output wire [  2:0] axi_register_slice_29_s_axi_awsize,
    output wire [  0:0] axi_register_slice_29_s_axi_awuser,
    output wire         axi_register_slice_29_s_axi_awvalid,
    output wire         axi_register_slice_29_s_axi_bready,
    input wire  [  1:0] axi_register_slice_29_s_axi_bresp,
    input wire  [  0:0] axi_register_slice_29_s_axi_buser,
    input wire          axi_register_slice_29_s_axi_bvalid,
    input wire  [255:0] axi_register_slice_29_s_axi_rdata,
    input wire          axi_register_slice_29_s_axi_rlast,
    output wire         axi_register_slice_29_s_axi_rready,
    input wire  [  1:0] axi_register_slice_29_s_axi_rresp,
    input wire          axi_register_slice_29_s_axi_rvalid,
    output wire [255:0] axi_register_slice_29_s_axi_wdata,
    output wire         axi_register_slice_29_s_axi_wlast,
    input wire          axi_register_slice_29_s_axi_wready,
    output wire [ 31:0] axi_register_slice_29_s_axi_wstrb,
    output wire         axi_register_slice_29_s_axi_wvalid,
    output wire         axi_register_slice_30_aclk,
    output wire         axi_register_slice_30_aresetn,
    input wire  [ 32:0] axi_register_slice_30_m_axi_araddr,
    input wire  [  1:0] axi_register_slice_30_m_axi_arburst,
    input wire  [  3:0] axi_register_slice_30_m_axi_arcache,
    input wire  [  3:0] axi_register_slice_30_m_axi_arlen,
    input wire  [  1:0] axi_register_slice_30_m_axi_arlock,
    input wire  [  2:0] axi_register_slice_30_m_axi_arprot,
    input wire  [  3:0] axi_register_slice_30_m_axi_arqos,
    output wire         axi_register_slice_30_m_axi_arready,
    input wire  [  2:0] axi_register_slice_30_m_axi_arsize,
    input wire  [  0:0] axi_register_slice_30_m_axi_aruser,
    input wire          axi_register_slice_30_m_axi_arvalid,
    input wire  [ 32:0] axi_register_slice_30_m_axi_awaddr,
    input wire  [  1:0] axi_register_slice_30_m_axi_awburst,
    input wire  [  3:0] axi_register_slice_30_m_axi_awcache,
    input wire  [  3:0] axi_register_slice_30_m_axi_awlen,
    input wire  [  1:0] axi_register_slice_30_m_axi_awlock,
    input wire  [  2:0] axi_register_slice_30_m_axi_awprot,
    input wire  [  3:0] axi_register_slice_30_m_axi_awqos,
    output wire         axi_register_slice_30_m_axi_awready,
    input wire  [  2:0] axi_register_slice_30_m_axi_awsize,
    input wire  [  0:0] axi_register_slice_30_m_axi_awuser,
    input wire          axi_register_slice_30_m_axi_awvalid,
    input wire          axi_register_slice_30_m_axi_bready,
    output wire [  1:0] axi_register_slice_30_m_axi_bresp,
    output wire [  0:0] axi_register_slice_30_m_axi_buser,
    output wire         axi_register_slice_30_m_axi_bvalid,
    output wire [255:0] axi_register_slice_30_m_axi_rdata,
    output wire         axi_register_slice_30_m_axi_rlast,
    input wire          axi_register_slice_30_m_axi_rready,
    output wire [  1:0] axi_register_slice_30_m_axi_rresp,
    output wire         axi_register_slice_30_m_axi_rvalid,
    input wire  [255:0] axi_register_slice_30_m_axi_wdata,
    input wire          axi_register_slice_30_m_axi_wlast,
    output wire         axi_register_slice_30_m_axi_wready,
    input wire  [ 31:0] axi_register_slice_30_m_axi_wstrb,
    input wire          axi_register_slice_30_m_axi_wvalid,
    output wire [ 32:0] axi_register_slice_30_s_axi_araddr,
    output wire [  1:0] axi_register_slice_30_s_axi_arburst,
    output wire [  3:0] axi_register_slice_30_s_axi_arcache,
    output wire [  3:0] axi_register_slice_30_s_axi_arlen,
    output wire [  1:0] axi_register_slice_30_s_axi_arlock,
    output wire [  2:0] axi_register_slice_30_s_axi_arprot,
    output wire [  3:0] axi_register_slice_30_s_axi_arqos,
    input wire          axi_register_slice_30_s_axi_arready,
    output wire [  2:0] axi_register_slice_30_s_axi_arsize,
    output wire [  0:0] axi_register_slice_30_s_axi_aruser,
    output wire         axi_register_slice_30_s_axi_arvalid,
    output wire [ 32:0] axi_register_slice_30_s_axi_awaddr,
    output wire [  1:0] axi_register_slice_30_s_axi_awburst,
    output wire [  3:0] axi_register_slice_30_s_axi_awcache,
    output wire [  3:0] axi_register_slice_30_s_axi_awlen,
    output wire [  1:0] axi_register_slice_30_s_axi_awlock,
    output wire [  2:0] axi_register_slice_30_s_axi_awprot,
    output wire [  3:0] axi_register_slice_30_s_axi_awqos,
    input wire          axi_register_slice_30_s_axi_awready,
    output wire [  2:0] axi_register_slice_30_s_axi_awsize,
    output wire [  0:0] axi_register_slice_30_s_axi_awuser,
    output wire         axi_register_slice_30_s_axi_awvalid,
    output wire         axi_register_slice_30_s_axi_bready,
    input wire  [  1:0] axi_register_slice_30_s_axi_bresp,
    input wire  [  0:0] axi_register_slice_30_s_axi_buser,
    input wire          axi_register_slice_30_s_axi_bvalid,
    input wire  [255:0] axi_register_slice_30_s_axi_rdata,
    input wire          axi_register_slice_30_s_axi_rlast,
    output wire         axi_register_slice_30_s_axi_rready,
    input wire  [  1:0] axi_register_slice_30_s_axi_rresp,
    input wire          axi_register_slice_30_s_axi_rvalid,
    output wire [255:0] axi_register_slice_30_s_axi_wdata,
    output wire         axi_register_slice_30_s_axi_wlast,
    input wire          axi_register_slice_30_s_axi_wready,
    output wire [ 31:0] axi_register_slice_30_s_axi_wstrb,
    output wire         axi_register_slice_30_s_axi_wvalid,
    output wire         axi_register_slice_31_aclk,
    output wire         axi_register_slice_31_aresetn,
    input wire  [ 32:0] axi_register_slice_31_m_axi_araddr,
    input wire  [  1:0] axi_register_slice_31_m_axi_arburst,
    input wire  [  3:0] axi_register_slice_31_m_axi_arcache,
    input wire  [  3:0] axi_register_slice_31_m_axi_arlen,
    input wire  [  1:0] axi_register_slice_31_m_axi_arlock,
    input wire  [  2:0] axi_register_slice_31_m_axi_arprot,
    input wire  [  3:0] axi_register_slice_31_m_axi_arqos,
    output wire         axi_register_slice_31_m_axi_arready,
    input wire  [  2:0] axi_register_slice_31_m_axi_arsize,
    input wire          axi_register_slice_31_m_axi_arvalid,
    input wire  [ 32:0] axi_register_slice_31_m_axi_awaddr,
    input wire  [  1:0] axi_register_slice_31_m_axi_awburst,
    input wire  [  3:0] axi_register_slice_31_m_axi_awcache,
    input wire  [  3:0] axi_register_slice_31_m_axi_awlen,
    input wire  [  1:0] axi_register_slice_31_m_axi_awlock,
    input wire  [  2:0] axi_register_slice_31_m_axi_awprot,
    input wire  [  3:0] axi_register_slice_31_m_axi_awqos,
    output wire         axi_register_slice_31_m_axi_awready,
    input wire  [  2:0] axi_register_slice_31_m_axi_awsize,
    input wire          axi_register_slice_31_m_axi_awvalid,
    input wire          axi_register_slice_31_m_axi_bready,
    output wire [  1:0] axi_register_slice_31_m_axi_bresp,
    output wire         axi_register_slice_31_m_axi_bvalid,
    output wire [255:0] axi_register_slice_31_m_axi_rdata,
    output wire         axi_register_slice_31_m_axi_rlast,
    input wire          axi_register_slice_31_m_axi_rready,
    output wire [  1:0] axi_register_slice_31_m_axi_rresp,
    output wire         axi_register_slice_31_m_axi_rvalid,
    input wire  [255:0] axi_register_slice_31_m_axi_wdata,
    input wire          axi_register_slice_31_m_axi_wlast,
    output wire         axi_register_slice_31_m_axi_wready,
    input wire  [ 31:0] axi_register_slice_31_m_axi_wstrb,
    input wire          axi_register_slice_31_m_axi_wvalid,
    output wire [ 32:0] axi_register_slice_31_s_axi_araddr,
    output wire [  1:0] axi_register_slice_31_s_axi_arburst,
    output wire [  3:0] axi_register_slice_31_s_axi_arcache,
    output wire [  3:0] axi_register_slice_31_s_axi_arlen,
    output wire [  1:0] axi_register_slice_31_s_axi_arlock,
    output wire [  2:0] axi_register_slice_31_s_axi_arprot,
    output wire [  3:0] axi_register_slice_31_s_axi_arqos,
    input wire          axi_register_slice_31_s_axi_arready,
    output wire [  2:0] axi_register_slice_31_s_axi_arsize,
    output wire         axi_register_slice_31_s_axi_arvalid,
    output wire [ 32:0] axi_register_slice_31_s_axi_awaddr,
    output wire [  1:0] axi_register_slice_31_s_axi_awburst,
    output wire [  3:0] axi_register_slice_31_s_axi_awcache,
    output wire [  3:0] axi_register_slice_31_s_axi_awlen,
    output wire [  1:0] axi_register_slice_31_s_axi_awlock,
    output wire [  2:0] axi_register_slice_31_s_axi_awprot,
    output wire [  3:0] axi_register_slice_31_s_axi_awqos,
    input wire          axi_register_slice_31_s_axi_awready,
    output wire [  2:0] axi_register_slice_31_s_axi_awsize,
    output wire         axi_register_slice_31_s_axi_awvalid,
    output wire         axi_register_slice_31_s_axi_bready,
    input wire  [  1:0] axi_register_slice_31_s_axi_bresp,
    input wire          axi_register_slice_31_s_axi_bvalid,
    input wire  [255:0] axi_register_slice_31_s_axi_rdata,
    input wire          axi_register_slice_31_s_axi_rlast,
    output wire         axi_register_slice_31_s_axi_rready,
    input wire  [  1:0] axi_register_slice_31_s_axi_rresp,
    input wire          axi_register_slice_31_s_axi_rvalid,
    output wire [255:0] axi_register_slice_31_s_axi_wdata,
    output wire         axi_register_slice_31_s_axi_wlast,
    input wire          axi_register_slice_31_s_axi_wready,
    output wire [ 31:0] axi_register_slice_31_s_axi_wstrb,
    output wire         axi_register_slice_31_s_axi_wvalid,
    output wire         gnd_driver_0_clk,
    input wire          gnd_driver_0_dout_1,
    output wire         gnd_driver_0_rst_n,
    output wire         hbm_0_APB_0_PCLK,
    output wire         hbm_0_APB_0_PRESET_N,
    output wire         hbm_0_AXI_12_ACLK,
    output wire [ 32:0] hbm_0_AXI_12_ARADDR,
    output wire [  1:0] hbm_0_AXI_12_ARBURST,
    output wire         hbm_0_AXI_12_ARESET_N,
    output wire [  5:0] hbm_0_AXI_12_ARID,
    output wire [  3:0] hbm_0_AXI_12_ARLEN,
    input wire          hbm_0_AXI_12_ARREADY,
    output wire [  2:0] hbm_0_AXI_12_ARSIZE,
    output wire         hbm_0_AXI_12_ARVALID,
    output wire [ 32:0] hbm_0_AXI_12_AWADDR,
    output wire [  1:0] hbm_0_AXI_12_AWBURST,
    output wire [  5:0] hbm_0_AXI_12_AWID,
    output wire [  3:0] hbm_0_AXI_12_AWLEN,
    input wire          hbm_0_AXI_12_AWREADY,
    output wire [  2:0] hbm_0_AXI_12_AWSIZE,
    output wire         hbm_0_AXI_12_AWVALID,
    input wire  [  5:0] hbm_0_AXI_12_BID,
    output wire         hbm_0_AXI_12_BREADY,
    input wire  [  1:0] hbm_0_AXI_12_BRESP,
    input wire          hbm_0_AXI_12_BVALID,
    input wire  [255:0] hbm_0_AXI_12_RDATA,
    input wire  [ 31:0] hbm_0_AXI_12_RDATA_PARITY,
    input wire  [  5:0] hbm_0_AXI_12_RID,
    input wire          hbm_0_AXI_12_RLAST,
    output wire         hbm_0_AXI_12_RREADY,
    input wire  [  1:0] hbm_0_AXI_12_RRESP,
    input wire          hbm_0_AXI_12_RVALID,
    output wire [255:0] hbm_0_AXI_12_WDATA,
    output wire [ 31:0] hbm_0_AXI_12_WDATA_PARITY,
    output wire         hbm_0_AXI_12_WLAST,
    input wire          hbm_0_AXI_12_WREADY,
    output wire [ 31:0] hbm_0_AXI_12_WSTRB,
    output wire         hbm_0_AXI_12_WVALID,
    output wire         hbm_0_AXI_13_ACLK,
    output wire [ 32:0] hbm_0_AXI_13_ARADDR,
    output wire [  1:0] hbm_0_AXI_13_ARBURST,
    output wire         hbm_0_AXI_13_ARESET_N,
    output wire [  5:0] hbm_0_AXI_13_ARID,
    output wire [  3:0] hbm_0_AXI_13_ARLEN,
    input wire          hbm_0_AXI_13_ARREADY,
    output wire [  2:0] hbm_0_AXI_13_ARSIZE,
    output wire         hbm_0_AXI_13_ARVALID,
    output wire [ 32:0] hbm_0_AXI_13_AWADDR,
    output wire [  1:0] hbm_0_AXI_13_AWBURST,
    output wire [  5:0] hbm_0_AXI_13_AWID,
    output wire [  3:0] hbm_0_AXI_13_AWLEN,
    input wire          hbm_0_AXI_13_AWREADY,
    output wire [  2:0] hbm_0_AXI_13_AWSIZE,
    output wire         hbm_0_AXI_13_AWVALID,
    input wire  [  5:0] hbm_0_AXI_13_BID,
    output wire         hbm_0_AXI_13_BREADY,
    input wire  [  1:0] hbm_0_AXI_13_BRESP,
    input wire          hbm_0_AXI_13_BVALID,
    input wire  [255:0] hbm_0_AXI_13_RDATA,
    input wire  [ 31:0] hbm_0_AXI_13_RDATA_PARITY,
    input wire  [  5:0] hbm_0_AXI_13_RID,
    input wire          hbm_0_AXI_13_RLAST,
    output wire         hbm_0_AXI_13_RREADY,
    input wire  [  1:0] hbm_0_AXI_13_RRESP,
    input wire          hbm_0_AXI_13_RVALID,
    output wire [255:0] hbm_0_AXI_13_WDATA,
    output wire [ 31:0] hbm_0_AXI_13_WDATA_PARITY,
    output wire         hbm_0_AXI_13_WLAST,
    input wire          hbm_0_AXI_13_WREADY,
    output wire [ 31:0] hbm_0_AXI_13_WSTRB,
    output wire         hbm_0_AXI_13_WVALID,
    output wire         hbm_0_AXI_14_ACLK,
    output wire [ 32:0] hbm_0_AXI_14_ARADDR,
    output wire [  1:0] hbm_0_AXI_14_ARBURST,
    output wire         hbm_0_AXI_14_ARESET_N,
    output wire [  5:0] hbm_0_AXI_14_ARID,
    output wire [  3:0] hbm_0_AXI_14_ARLEN,
    input wire          hbm_0_AXI_14_ARREADY,
    output wire [  2:0] hbm_0_AXI_14_ARSIZE,
    output wire         hbm_0_AXI_14_ARVALID,
    output wire [ 32:0] hbm_0_AXI_14_AWADDR,
    output wire [  1:0] hbm_0_AXI_14_AWBURST,
    output wire [  5:0] hbm_0_AXI_14_AWID,
    output wire [  3:0] hbm_0_AXI_14_AWLEN,
    input wire          hbm_0_AXI_14_AWREADY,
    output wire [  2:0] hbm_0_AXI_14_AWSIZE,
    output wire         hbm_0_AXI_14_AWVALID,
    input wire  [  5:0] hbm_0_AXI_14_BID,
    output wire         hbm_0_AXI_14_BREADY,
    input wire  [  1:0] hbm_0_AXI_14_BRESP,
    input wire          hbm_0_AXI_14_BVALID,
    input wire  [255:0] hbm_0_AXI_14_RDATA,
    input wire  [ 31:0] hbm_0_AXI_14_RDATA_PARITY,
    input wire  [  5:0] hbm_0_AXI_14_RID,
    input wire          hbm_0_AXI_14_RLAST,
    output wire         hbm_0_AXI_14_RREADY,
    input wire  [  1:0] hbm_0_AXI_14_RRESP,
    input wire          hbm_0_AXI_14_RVALID,
    output wire [255:0] hbm_0_AXI_14_WDATA,
    output wire [ 31:0] hbm_0_AXI_14_WDATA_PARITY,
    output wire         hbm_0_AXI_14_WLAST,
    input wire          hbm_0_AXI_14_WREADY,
    output wire [ 31:0] hbm_0_AXI_14_WSTRB,
    output wire         hbm_0_AXI_14_WVALID,
    output wire         hbm_0_AXI_15_ACLK,
    output wire [ 32:0] hbm_0_AXI_15_ARADDR,
    output wire [  1:0] hbm_0_AXI_15_ARBURST,
    output wire         hbm_0_AXI_15_ARESET_N,
    output wire [  5:0] hbm_0_AXI_15_ARID,
    output wire [  3:0] hbm_0_AXI_15_ARLEN,
    input wire          hbm_0_AXI_15_ARREADY,
    output wire [  2:0] hbm_0_AXI_15_ARSIZE,
    output wire         hbm_0_AXI_15_ARVALID,
    output wire [ 32:0] hbm_0_AXI_15_AWADDR,
    output wire [  1:0] hbm_0_AXI_15_AWBURST,
    output wire [  5:0] hbm_0_AXI_15_AWID,
    output wire [  3:0] hbm_0_AXI_15_AWLEN,
    input wire          hbm_0_AXI_15_AWREADY,
    output wire [  2:0] hbm_0_AXI_15_AWSIZE,
    output wire         hbm_0_AXI_15_AWVALID,
    input wire  [  5:0] hbm_0_AXI_15_BID,
    output wire         hbm_0_AXI_15_BREADY,
    input wire  [  1:0] hbm_0_AXI_15_BRESP,
    input wire          hbm_0_AXI_15_BVALID,
    input wire  [255:0] hbm_0_AXI_15_RDATA,
    input wire  [ 31:0] hbm_0_AXI_15_RDATA_PARITY,
    input wire  [  5:0] hbm_0_AXI_15_RID,
    input wire          hbm_0_AXI_15_RLAST,
    output wire         hbm_0_AXI_15_RREADY,
    input wire  [  1:0] hbm_0_AXI_15_RRESP,
    input wire          hbm_0_AXI_15_RVALID,
    output wire [255:0] hbm_0_AXI_15_WDATA,
    output wire [ 31:0] hbm_0_AXI_15_WDATA_PARITY,
    output wire         hbm_0_AXI_15_WLAST,
    input wire          hbm_0_AXI_15_WREADY,
    output wire [ 31:0] hbm_0_AXI_15_WSTRB,
    output wire         hbm_0_AXI_15_WVALID,
    input wire          hbm_0_DRAM_0_STAT_CATTRIP,
    input wire  [  6:0] hbm_0_DRAM_0_STAT_TEMP,
    output wire         hbm_0_HBM_REF_CLK_0,
    input wire          hbm_0_apb_complete_0,
    output wire         hbm_axi_clk_clk_in1,
    input wire          hbm_axi_clk_clk_out1_1,
    input wire          hbm_axi_clk_locked_1,
    output wire         hbm_axi_clk_resetn,
    output wire         hbm_sys_reset_aux_reset_in,
    input wire  [  0:0] hbm_sys_reset_bus_struct_reset,
    output wire         hbm_sys_reset_dcm_locked,
    output wire         hbm_sys_reset_ext_reset_in,
    input wire  [  0:0] hbm_sys_reset_interconnect_aresetn,
    output wire         hbm_sys_reset_mb_debug_sys_rst,
    input wire          hbm_sys_reset_mb_reset,
    input wire  [  0:0] hbm_sys_reset_peripheral_aresetn_1,
    input wire  [  0:0] hbm_sys_reset_peripheral_reset,
    output wire         hbm_sys_reset_slowest_sync_clk,
    output wire         kernel3_0_ap_clk,
    output wire         kernel3_0_ap_rst_n,
    input wire          kernel3_0_interrupt,
    input wire  [ 63:0] kernel3_0_m_axi_gmem_A_ARADDR_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_A_ARBURST_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_A_ARCACHE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_A_ARID_1,
    input wire  [  7:0] kernel3_0_m_axi_gmem_A_ARLEN_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_A_ARLOCK_1,
    input wire  [  2:0] kernel3_0_m_axi_gmem_A_ARPROT_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_A_ARQOS_1,
    output wire         kernel3_0_m_axi_gmem_A_ARREADY_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_A_ARREGION,
    input wire  [  2:0] kernel3_0_m_axi_gmem_A_ARSIZE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_A_ARUSER_1,
    input wire          kernel3_0_m_axi_gmem_A_ARVALID_1,
    input wire  [ 63:0] kernel3_0_m_axi_gmem_A_AWADDR_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_A_AWBURST_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_A_AWCACHE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_A_AWID_1,
    input wire  [  7:0] kernel3_0_m_axi_gmem_A_AWLEN_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_A_AWLOCK_1,
    input wire  [  2:0] kernel3_0_m_axi_gmem_A_AWPROT_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_A_AWQOS_1,
    output wire         kernel3_0_m_axi_gmem_A_AWREADY_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_A_AWREGION,
    input wire  [  2:0] kernel3_0_m_axi_gmem_A_AWSIZE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_A_AWUSER_1,
    input wire          kernel3_0_m_axi_gmem_A_AWVALID_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_A_BID_1,
    input wire          kernel3_0_m_axi_gmem_A_BREADY_1,
    output wire [  1:0] kernel3_0_m_axi_gmem_A_BRESP_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_A_BUSER_1,
    output wire         kernel3_0_m_axi_gmem_A_BVALID_1,
    output wire [511:0] kernel3_0_m_axi_gmem_A_RDATA_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_A_RID_1,
    output wire         kernel3_0_m_axi_gmem_A_RLAST_1,
    input wire          kernel3_0_m_axi_gmem_A_RREADY_1,
    output wire [  1:0] kernel3_0_m_axi_gmem_A_RRESP_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_A_RUSER,
    output wire         kernel3_0_m_axi_gmem_A_RVALID_1,
    input wire  [511:0] kernel3_0_m_axi_gmem_A_WDATA_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_A_WID,
    input wire          kernel3_0_m_axi_gmem_A_WLAST_1,
    output wire         kernel3_0_m_axi_gmem_A_WREADY_1,
    input wire  [ 63:0] kernel3_0_m_axi_gmem_A_WSTRB_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_A_WUSER,
    input wire          kernel3_0_m_axi_gmem_A_WVALID_1,
    input wire  [ 63:0] kernel3_0_m_axi_gmem_B_ARADDR_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_B_ARBURST_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_B_ARCACHE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_B_ARID_1,
    input wire  [  7:0] kernel3_0_m_axi_gmem_B_ARLEN_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_B_ARLOCK_1,
    input wire  [  2:0] kernel3_0_m_axi_gmem_B_ARPROT_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_B_ARQOS_1,
    output wire         kernel3_0_m_axi_gmem_B_ARREADY_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_B_ARREGION,
    input wire  [  2:0] kernel3_0_m_axi_gmem_B_ARSIZE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_B_ARUSER_1,
    input wire          kernel3_0_m_axi_gmem_B_ARVALID_1,
    input wire  [ 63:0] kernel3_0_m_axi_gmem_B_AWADDR_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_B_AWBURST_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_B_AWCACHE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_B_AWID_1,
    input wire  [  7:0] kernel3_0_m_axi_gmem_B_AWLEN_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_B_AWLOCK_1,
    input wire  [  2:0] kernel3_0_m_axi_gmem_B_AWPROT_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_B_AWQOS_1,
    output wire         kernel3_0_m_axi_gmem_B_AWREADY_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_B_AWREGION,
    input wire  [  2:0] kernel3_0_m_axi_gmem_B_AWSIZE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_B_AWUSER_1,
    input wire          kernel3_0_m_axi_gmem_B_AWVALID_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_B_BID_1,
    input wire          kernel3_0_m_axi_gmem_B_BREADY_1,
    output wire [  1:0] kernel3_0_m_axi_gmem_B_BRESP_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_B_BUSER_1,
    output wire         kernel3_0_m_axi_gmem_B_BVALID_1,
    output wire [511:0] kernel3_0_m_axi_gmem_B_RDATA_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_B_RID_1,
    output wire         kernel3_0_m_axi_gmem_B_RLAST_1,
    input wire          kernel3_0_m_axi_gmem_B_RREADY_1,
    output wire [  1:0] kernel3_0_m_axi_gmem_B_RRESP_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_B_RUSER,
    output wire         kernel3_0_m_axi_gmem_B_RVALID_1,
    input wire  [511:0] kernel3_0_m_axi_gmem_B_WDATA_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_B_WID,
    input wire          kernel3_0_m_axi_gmem_B_WLAST_1,
    output wire         kernel3_0_m_axi_gmem_B_WREADY_1,
    input wire  [ 63:0] kernel3_0_m_axi_gmem_B_WSTRB_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_B_WUSER,
    input wire          kernel3_0_m_axi_gmem_B_WVALID_1,
    input wire  [ 63:0] kernel3_0_m_axi_gmem_C_ARADDR_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_C_ARBURST_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_C_ARCACHE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_C_ARID_1,
    input wire  [  7:0] kernel3_0_m_axi_gmem_C_ARLEN_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_C_ARLOCK_1,
    input wire  [  2:0] kernel3_0_m_axi_gmem_C_ARPROT_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_C_ARQOS_1,
    output wire         kernel3_0_m_axi_gmem_C_ARREADY_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_C_ARREGION,
    input wire  [  2:0] kernel3_0_m_axi_gmem_C_ARSIZE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_C_ARUSER_1,
    input wire          kernel3_0_m_axi_gmem_C_ARVALID_1,
    input wire  [ 63:0] kernel3_0_m_axi_gmem_C_AWADDR_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_C_AWBURST_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_C_AWCACHE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_C_AWID_1,
    input wire  [  7:0] kernel3_0_m_axi_gmem_C_AWLEN_1,
    input wire  [  1:0] kernel3_0_m_axi_gmem_C_AWLOCK_1,
    input wire  [  2:0] kernel3_0_m_axi_gmem_C_AWPROT_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_C_AWQOS_1,
    output wire         kernel3_0_m_axi_gmem_C_AWREADY_1,
    input wire  [  3:0] kernel3_0_m_axi_gmem_C_AWREGION,
    input wire  [  2:0] kernel3_0_m_axi_gmem_C_AWSIZE_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_C_AWUSER_1,
    input wire          kernel3_0_m_axi_gmem_C_AWVALID_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_C_BID_1,
    input wire          kernel3_0_m_axi_gmem_C_BREADY_1,
    output wire [  1:0] kernel3_0_m_axi_gmem_C_BRESP_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_C_BUSER_1,
    output wire         kernel3_0_m_axi_gmem_C_BVALID_1,
    output wire [511:0] kernel3_0_m_axi_gmem_C_RDATA_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_C_RID_1,
    output wire         kernel3_0_m_axi_gmem_C_RLAST_1,
    input wire          kernel3_0_m_axi_gmem_C_RREADY_1,
    output wire [  1:0] kernel3_0_m_axi_gmem_C_RRESP_1,
    output wire [  0:0] kernel3_0_m_axi_gmem_C_RUSER,
    output wire         kernel3_0_m_axi_gmem_C_RVALID_1,
    input wire  [511:0] kernel3_0_m_axi_gmem_C_WDATA_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_C_WID,
    input wire          kernel3_0_m_axi_gmem_C_WLAST_1,
    output wire         kernel3_0_m_axi_gmem_C_WREADY_1,
    input wire  [ 63:0] kernel3_0_m_axi_gmem_C_WSTRB_1,
    input wire  [  0:0] kernel3_0_m_axi_gmem_C_WUSER,
    input wire          kernel3_0_m_axi_gmem_C_WVALID_1,
    output wire [  5:0] kernel3_0_s_axi_control_ARADDR,
    input wire          kernel3_0_s_axi_control_ARREADY,
    output wire         kernel3_0_s_axi_control_ARVALID,
    output wire [  5:0] kernel3_0_s_axi_control_AWADDR,
    input wire          kernel3_0_s_axi_control_AWREADY,
    output wire         kernel3_0_s_axi_control_AWVALID,
    output wire         kernel3_0_s_axi_control_BREADY,
    input wire  [  1:0] kernel3_0_s_axi_control_BRESP,
    input wire          kernel3_0_s_axi_control_BVALID,
    input wire  [ 31:0] kernel3_0_s_axi_control_RDATA,
    output wire         kernel3_0_s_axi_control_RREADY,
    input wire  [  1:0] kernel3_0_s_axi_control_RRESP,
    input wire          kernel3_0_s_axi_control_RVALID,
    output wire [ 31:0] kernel3_0_s_axi_control_WDATA,
    input wire          kernel3_0_s_axi_control_WREADY,
    output wire [  3:0] kernel3_0_s_axi_control_WSTRB,
    output wire         kernel3_0_s_axi_control_WVALID,
    output wire         kernel_clk_clk_in1,
    input wire          kernel_clk_clk_out1_1,
    input wire          kernel_clk_locked_1,
    output wire         kernel_clk_resetn,
    output wire         kernel_sys_reset_aux_reset_in,
    input wire  [  0:0] kernel_sys_reset_bus_struct_reset,
    output wire         kernel_sys_reset_dcm_locked,
    output wire         kernel_sys_reset_ext_reset_in,
    input wire  [  0:0] kernel_sys_reset_interconnect_aresetn,
    output wire         kernel_sys_reset_mb_debug_sys_rst,
    input wire          kernel_sys_reset_mb_reset,
    input wire  [  0:0] kernel_sys_reset_peripheral_aresetn_1,
    input wire  [  0:0] kernel_sys_reset_peripheral_reset,
    output wire         kernel_sys_reset_slowest_sync_clk,
    input wire  [ 32:0] smartconnect_28_M00_AXI_araddr,
    input wire  [  1:0] smartconnect_28_M00_AXI_arburst,
    input wire  [  3:0] smartconnect_28_M00_AXI_arcache,
    input wire  [  3:0] smartconnect_28_M00_AXI_arlen,
    input wire  [  1:0] smartconnect_28_M00_AXI_arlock,
    input wire  [  2:0] smartconnect_28_M00_AXI_arprot,
    input wire  [  3:0] smartconnect_28_M00_AXI_arqos,
    output wire         smartconnect_28_M00_AXI_arready,
    input wire  [  2:0] smartconnect_28_M00_AXI_arsize,
    input wire  [  0:0] smartconnect_28_M00_AXI_aruser,
    input wire          smartconnect_28_M00_AXI_arvalid,
    input wire  [ 32:0] smartconnect_28_M00_AXI_awaddr,
    input wire  [  1:0] smartconnect_28_M00_AXI_awburst,
    input wire  [  3:0] smartconnect_28_M00_AXI_awcache,
    input wire  [  3:0] smartconnect_28_M00_AXI_awlen,
    input wire  [  1:0] smartconnect_28_M00_AXI_awlock,
    input wire  [  2:0] smartconnect_28_M00_AXI_awprot,
    input wire  [  3:0] smartconnect_28_M00_AXI_awqos,
    output wire         smartconnect_28_M00_AXI_awready,
    input wire  [  2:0] smartconnect_28_M00_AXI_awsize,
    input wire  [  0:0] smartconnect_28_M00_AXI_awuser,
    input wire          smartconnect_28_M00_AXI_awvalid,
    input wire          smartconnect_28_M00_AXI_bready,
    output wire [  1:0] smartconnect_28_M00_AXI_bresp,
    output wire [  0:0] smartconnect_28_M00_AXI_buser,
    output wire         smartconnect_28_M00_AXI_bvalid,
    output wire [255:0] smartconnect_28_M00_AXI_rdata,
    output wire         smartconnect_28_M00_AXI_rlast,
    input wire          smartconnect_28_M00_AXI_rready,
    output wire [  1:0] smartconnect_28_M00_AXI_rresp,
    output wire         smartconnect_28_M00_AXI_rvalid,
    input wire  [255:0] smartconnect_28_M00_AXI_wdata,
    input wire          smartconnect_28_M00_AXI_wlast,
    output wire         smartconnect_28_M00_AXI_wready,
    input wire  [ 31:0] smartconnect_28_M00_AXI_wstrb,
    input wire          smartconnect_28_M00_AXI_wvalid,
    output wire [ 63:0] smartconnect_28_S00_AXI_araddr,
    output wire [  1:0] smartconnect_28_S00_AXI_arburst,
    output wire [  3:0] smartconnect_28_S00_AXI_arcache,
    output wire [  0:0] smartconnect_28_S00_AXI_arid,
    output wire [  7:0] smartconnect_28_S00_AXI_arlen,
    output wire [  0:0] smartconnect_28_S00_AXI_arlock,
    output wire [  2:0] smartconnect_28_S00_AXI_arprot,
    output wire [  3:0] smartconnect_28_S00_AXI_arqos,
    input wire          smartconnect_28_S00_AXI_arready,
    output wire [  2:0] smartconnect_28_S00_AXI_arsize,
    output wire [  0:0] smartconnect_28_S00_AXI_aruser,
    output wire         smartconnect_28_S00_AXI_arvalid,
    output wire [ 63:0] smartconnect_28_S00_AXI_awaddr,
    output wire [  1:0] smartconnect_28_S00_AXI_awburst,
    output wire [  3:0] smartconnect_28_S00_AXI_awcache,
    output wire [  0:0] smartconnect_28_S00_AXI_awid,
    output wire [  7:0] smartconnect_28_S00_AXI_awlen,
    output wire [  0:0] smartconnect_28_S00_AXI_awlock,
    output wire [  2:0] smartconnect_28_S00_AXI_awprot,
    output wire [  3:0] smartconnect_28_S00_AXI_awqos,
    input wire          smartconnect_28_S00_AXI_awready,
    output wire [  2:0] smartconnect_28_S00_AXI_awsize,
    output wire [  0:0] smartconnect_28_S00_AXI_awuser,
    output wire         smartconnect_28_S00_AXI_awvalid,
    input wire  [  0:0] smartconnect_28_S00_AXI_bid,
    output wire         smartconnect_28_S00_AXI_bready,
    input wire  [  1:0] smartconnect_28_S00_AXI_bresp,
    input wire  [  0:0] smartconnect_28_S00_AXI_buser,
    input wire          smartconnect_28_S00_AXI_bvalid,
    input wire  [511:0] smartconnect_28_S00_AXI_rdata,
    input wire  [  0:0] smartconnect_28_S00_AXI_rid,
    input wire          smartconnect_28_S00_AXI_rlast,
    output wire         smartconnect_28_S00_AXI_rready,
    input wire  [  1:0] smartconnect_28_S00_AXI_rresp,
    input wire          smartconnect_28_S00_AXI_rvalid,
    output wire [511:0] smartconnect_28_S00_AXI_wdata,
    output wire         smartconnect_28_S00_AXI_wlast,
    input wire          smartconnect_28_S00_AXI_wready,
    output wire [ 63:0] smartconnect_28_S00_AXI_wstrb,
    output wire         smartconnect_28_S00_AXI_wvalid,
    output wire         smartconnect_28_aclk,
    output wire         smartconnect_28_aclk1,
    output wire         smartconnect_28_aresetn,
    input wire  [ 32:0] smartconnect_29_M00_AXI_araddr,
    input wire  [  1:0] smartconnect_29_M00_AXI_arburst,
    input wire  [  3:0] smartconnect_29_M00_AXI_arcache,
    input wire  [  3:0] smartconnect_29_M00_AXI_arlen,
    input wire  [  1:0] smartconnect_29_M00_AXI_arlock,
    input wire  [  2:0] smartconnect_29_M00_AXI_arprot,
    input wire  [  3:0] smartconnect_29_M00_AXI_arqos,
    output wire         smartconnect_29_M00_AXI_arready,
    input wire  [  2:0] smartconnect_29_M00_AXI_arsize,
    input wire  [  0:0] smartconnect_29_M00_AXI_aruser,
    input wire          smartconnect_29_M00_AXI_arvalid,
    input wire  [ 32:0] smartconnect_29_M00_AXI_awaddr,
    input wire  [  1:0] smartconnect_29_M00_AXI_awburst,
    input wire  [  3:0] smartconnect_29_M00_AXI_awcache,
    input wire  [  3:0] smartconnect_29_M00_AXI_awlen,
    input wire  [  1:0] smartconnect_29_M00_AXI_awlock,
    input wire  [  2:0] smartconnect_29_M00_AXI_awprot,
    input wire  [  3:0] smartconnect_29_M00_AXI_awqos,
    output wire         smartconnect_29_M00_AXI_awready,
    input wire  [  2:0] smartconnect_29_M00_AXI_awsize,
    input wire  [  0:0] smartconnect_29_M00_AXI_awuser,
    input wire          smartconnect_29_M00_AXI_awvalid,
    input wire          smartconnect_29_M00_AXI_bready,
    output wire [  1:0] smartconnect_29_M00_AXI_bresp,
    output wire [  0:0] smartconnect_29_M00_AXI_buser,
    output wire         smartconnect_29_M00_AXI_bvalid,
    output wire [255:0] smartconnect_29_M00_AXI_rdata,
    output wire         smartconnect_29_M00_AXI_rlast,
    input wire          smartconnect_29_M00_AXI_rready,
    output wire [  1:0] smartconnect_29_M00_AXI_rresp,
    output wire         smartconnect_29_M00_AXI_rvalid,
    input wire  [255:0] smartconnect_29_M00_AXI_wdata,
    input wire          smartconnect_29_M00_AXI_wlast,
    output wire         smartconnect_29_M00_AXI_wready,
    input wire  [ 31:0] smartconnect_29_M00_AXI_wstrb,
    input wire          smartconnect_29_M00_AXI_wvalid,
    output wire [ 63:0] smartconnect_29_S00_AXI_araddr,
    output wire [  1:0] smartconnect_29_S00_AXI_arburst,
    output wire [  3:0] smartconnect_29_S00_AXI_arcache,
    output wire [  0:0] smartconnect_29_S00_AXI_arid,
    output wire [  7:0] smartconnect_29_S00_AXI_arlen,
    output wire [  0:0] smartconnect_29_S00_AXI_arlock,
    output wire [  2:0] smartconnect_29_S00_AXI_arprot,
    output wire [  3:0] smartconnect_29_S00_AXI_arqos,
    input wire          smartconnect_29_S00_AXI_arready,
    output wire [  2:0] smartconnect_29_S00_AXI_arsize,
    output wire [  0:0] smartconnect_29_S00_AXI_aruser,
    output wire         smartconnect_29_S00_AXI_arvalid,
    output wire [ 63:0] smartconnect_29_S00_AXI_awaddr,
    output wire [  1:0] smartconnect_29_S00_AXI_awburst,
    output wire [  3:0] smartconnect_29_S00_AXI_awcache,
    output wire [  0:0] smartconnect_29_S00_AXI_awid,
    output wire [  7:0] smartconnect_29_S00_AXI_awlen,
    output wire [  0:0] smartconnect_29_S00_AXI_awlock,
    output wire [  2:0] smartconnect_29_S00_AXI_awprot,
    output wire [  3:0] smartconnect_29_S00_AXI_awqos,
    input wire          smartconnect_29_S00_AXI_awready,
    output wire [  2:0] smartconnect_29_S00_AXI_awsize,
    output wire [  0:0] smartconnect_29_S00_AXI_awuser,
    output wire         smartconnect_29_S00_AXI_awvalid,
    input wire  [  0:0] smartconnect_29_S00_AXI_bid,
    output wire         smartconnect_29_S00_AXI_bready,
    input wire  [  1:0] smartconnect_29_S00_AXI_bresp,
    input wire  [  0:0] smartconnect_29_S00_AXI_buser,
    input wire          smartconnect_29_S00_AXI_bvalid,
    input wire  [511:0] smartconnect_29_S00_AXI_rdata,
    input wire  [  0:0] smartconnect_29_S00_AXI_rid,
    input wire          smartconnect_29_S00_AXI_rlast,
    output wire         smartconnect_29_S00_AXI_rready,
    input wire  [  1:0] smartconnect_29_S00_AXI_rresp,
    input wire          smartconnect_29_S00_AXI_rvalid,
    output wire [511:0] smartconnect_29_S00_AXI_wdata,
    output wire         smartconnect_29_S00_AXI_wlast,
    input wire          smartconnect_29_S00_AXI_wready,
    output wire [ 63:0] smartconnect_29_S00_AXI_wstrb,
    output wire         smartconnect_29_S00_AXI_wvalid,
    output wire         smartconnect_29_aclk,
    output wire         smartconnect_29_aclk1,
    output wire         smartconnect_29_aresetn,
    input wire  [ 32:0] smartconnect_30_M00_AXI_araddr,
    input wire  [  1:0] smartconnect_30_M00_AXI_arburst,
    input wire  [  3:0] smartconnect_30_M00_AXI_arcache,
    input wire  [  3:0] smartconnect_30_M00_AXI_arlen,
    input wire  [  1:0] smartconnect_30_M00_AXI_arlock,
    input wire  [  2:0] smartconnect_30_M00_AXI_arprot,
    input wire  [  3:0] smartconnect_30_M00_AXI_arqos,
    output wire         smartconnect_30_M00_AXI_arready,
    input wire  [  2:0] smartconnect_30_M00_AXI_arsize,
    input wire  [  0:0] smartconnect_30_M00_AXI_aruser,
    input wire          smartconnect_30_M00_AXI_arvalid,
    input wire  [ 32:0] smartconnect_30_M00_AXI_awaddr,
    input wire  [  1:0] smartconnect_30_M00_AXI_awburst,
    input wire  [  3:0] smartconnect_30_M00_AXI_awcache,
    input wire  [  3:0] smartconnect_30_M00_AXI_awlen,
    input wire  [  1:0] smartconnect_30_M00_AXI_awlock,
    input wire  [  2:0] smartconnect_30_M00_AXI_awprot,
    input wire  [  3:0] smartconnect_30_M00_AXI_awqos,
    output wire         smartconnect_30_M00_AXI_awready,
    input wire  [  2:0] smartconnect_30_M00_AXI_awsize,
    input wire  [  0:0] smartconnect_30_M00_AXI_awuser,
    input wire          smartconnect_30_M00_AXI_awvalid,
    input wire          smartconnect_30_M00_AXI_bready,
    output wire [  1:0] smartconnect_30_M00_AXI_bresp,
    output wire [  0:0] smartconnect_30_M00_AXI_buser,
    output wire         smartconnect_30_M00_AXI_bvalid,
    output wire [255:0] smartconnect_30_M00_AXI_rdata,
    output wire         smartconnect_30_M00_AXI_rlast,
    input wire          smartconnect_30_M00_AXI_rready,
    output wire [  1:0] smartconnect_30_M00_AXI_rresp,
    output wire         smartconnect_30_M00_AXI_rvalid,
    input wire  [255:0] smartconnect_30_M00_AXI_wdata,
    input wire          smartconnect_30_M00_AXI_wlast,
    output wire         smartconnect_30_M00_AXI_wready,
    input wire  [ 31:0] smartconnect_30_M00_AXI_wstrb,
    input wire          smartconnect_30_M00_AXI_wvalid,
    output wire [ 63:0] smartconnect_30_S00_AXI_araddr,
    output wire [  1:0] smartconnect_30_S00_AXI_arburst,
    output wire [  3:0] smartconnect_30_S00_AXI_arcache,
    output wire [  0:0] smartconnect_30_S00_AXI_arid,
    output wire [  7:0] smartconnect_30_S00_AXI_arlen,
    output wire [  0:0] smartconnect_30_S00_AXI_arlock,
    output wire [  2:0] smartconnect_30_S00_AXI_arprot,
    output wire [  3:0] smartconnect_30_S00_AXI_arqos,
    input wire          smartconnect_30_S00_AXI_arready,
    output wire [  2:0] smartconnect_30_S00_AXI_arsize,
    output wire [  0:0] smartconnect_30_S00_AXI_aruser,
    output wire         smartconnect_30_S00_AXI_arvalid,
    output wire [ 63:0] smartconnect_30_S00_AXI_awaddr,
    output wire [  1:0] smartconnect_30_S00_AXI_awburst,
    output wire [  3:0] smartconnect_30_S00_AXI_awcache,
    output wire [  0:0] smartconnect_30_S00_AXI_awid,
    output wire [  7:0] smartconnect_30_S00_AXI_awlen,
    output wire [  0:0] smartconnect_30_S00_AXI_awlock,
    output wire [  2:0] smartconnect_30_S00_AXI_awprot,
    output wire [  3:0] smartconnect_30_S00_AXI_awqos,
    input wire          smartconnect_30_S00_AXI_awready,
    output wire [  2:0] smartconnect_30_S00_AXI_awsize,
    output wire [  0:0] smartconnect_30_S00_AXI_awuser,
    output wire         smartconnect_30_S00_AXI_awvalid,
    input wire  [  0:0] smartconnect_30_S00_AXI_bid,
    output wire         smartconnect_30_S00_AXI_bready,
    input wire  [  1:0] smartconnect_30_S00_AXI_bresp,
    input wire  [  0:0] smartconnect_30_S00_AXI_buser,
    input wire          smartconnect_30_S00_AXI_bvalid,
    input wire  [511:0] smartconnect_30_S00_AXI_rdata,
    input wire  [  0:0] smartconnect_30_S00_AXI_rid,
    input wire          smartconnect_30_S00_AXI_rlast,
    output wire         smartconnect_30_S00_AXI_rready,
    input wire  [  1:0] smartconnect_30_S00_AXI_rresp,
    input wire          smartconnect_30_S00_AXI_rvalid,
    output wire [511:0] smartconnect_30_S00_AXI_wdata,
    output wire         smartconnect_30_S00_AXI_wlast,
    input wire          smartconnect_30_S00_AXI_wready,
    output wire [ 63:0] smartconnect_30_S00_AXI_wstrb,
    output wire         smartconnect_30_S00_AXI_wvalid,
    output wire         smartconnect_30_aclk,
    output wire         smartconnect_30_aclk1,
    output wire         smartconnect_30_aresetn,
    input wire  [ 32:0] smartconnect_31_M00_AXI_araddr,
    input wire  [  1:0] smartconnect_31_M00_AXI_arburst,
    input wire  [  3:0] smartconnect_31_M00_AXI_arcache,
    input wire  [  3:0] smartconnect_31_M00_AXI_arlen,
    input wire  [  1:0] smartconnect_31_M00_AXI_arlock,
    input wire  [  2:0] smartconnect_31_M00_AXI_arprot,
    input wire  [  3:0] smartconnect_31_M00_AXI_arqos,
    output wire         smartconnect_31_M00_AXI_arready,
    input wire  [  2:0] smartconnect_31_M00_AXI_arsize,
    input wire          smartconnect_31_M00_AXI_arvalid,
    input wire  [ 32:0] smartconnect_31_M00_AXI_awaddr,
    input wire  [  1:0] smartconnect_31_M00_AXI_awburst,
    input wire  [  3:0] smartconnect_31_M00_AXI_awcache,
    input wire  [  3:0] smartconnect_31_M00_AXI_awlen,
    input wire  [  1:0] smartconnect_31_M00_AXI_awlock,
    input wire  [  2:0] smartconnect_31_M00_AXI_awprot,
    input wire  [  3:0] smartconnect_31_M00_AXI_awqos,
    output wire         smartconnect_31_M00_AXI_awready,
    input wire  [  2:0] smartconnect_31_M00_AXI_awsize,
    input wire          smartconnect_31_M00_AXI_awvalid,
    input wire          smartconnect_31_M00_AXI_bready,
    output wire [  1:0] smartconnect_31_M00_AXI_bresp,
    output wire         smartconnect_31_M00_AXI_bvalid,
    output wire [255:0] smartconnect_31_M00_AXI_rdata,
    output wire         smartconnect_31_M00_AXI_rlast,
    input wire          smartconnect_31_M00_AXI_rready,
    output wire [  1:0] smartconnect_31_M00_AXI_rresp,
    output wire         smartconnect_31_M00_AXI_rvalid,
    input wire  [255:0] smartconnect_31_M00_AXI_wdata,
    input wire          smartconnect_31_M00_AXI_wlast,
    output wire         smartconnect_31_M00_AXI_wready,
    input wire  [ 31:0] smartconnect_31_M00_AXI_wstrb,
    input wire          smartconnect_31_M00_AXI_wvalid,
    output wire [ 63:0] smartconnect_31_S00_AXI_araddr,
    output wire [  1:0] smartconnect_31_S00_AXI_arburst,
    output wire [  3:0] smartconnect_31_S00_AXI_arcache,
    output wire [  3:0] smartconnect_31_S00_AXI_arid,
    output wire [  7:0] smartconnect_31_S00_AXI_arlen,
    output wire [  0:0] smartconnect_31_S00_AXI_arlock,
    output wire [  2:0] smartconnect_31_S00_AXI_arprot,
    output wire [  3:0] smartconnect_31_S00_AXI_arqos,
    input wire          smartconnect_31_S00_AXI_arready,
    output wire [  2:0] smartconnect_31_S00_AXI_arsize,
    output wire         smartconnect_31_S00_AXI_arvalid,
    output wire [ 63:0] smartconnect_31_S00_AXI_awaddr,
    output wire [  1:0] smartconnect_31_S00_AXI_awburst,
    output wire [  3:0] smartconnect_31_S00_AXI_awcache,
    output wire [  3:0] smartconnect_31_S00_AXI_awid,
    output wire [  7:0] smartconnect_31_S00_AXI_awlen,
    output wire [  0:0] smartconnect_31_S00_AXI_awlock,
    output wire [  2:0] smartconnect_31_S00_AXI_awprot,
    output wire [  3:0] smartconnect_31_S00_AXI_awqos,
    input wire          smartconnect_31_S00_AXI_awready,
    output wire [  2:0] smartconnect_31_S00_AXI_awsize,
    output wire         smartconnect_31_S00_AXI_awvalid,
    input wire  [  3:0] smartconnect_31_S00_AXI_bid,
    output wire         smartconnect_31_S00_AXI_bready,
    input wire  [  1:0] smartconnect_31_S00_AXI_bresp,
    input wire          smartconnect_31_S00_AXI_bvalid,
    input wire  [ 63:0] smartconnect_31_S00_AXI_rdata,
    input wire  [  3:0] smartconnect_31_S00_AXI_rid,
    input wire          smartconnect_31_S00_AXI_rlast,
    output wire         smartconnect_31_S00_AXI_rready,
    input wire  [  1:0] smartconnect_31_S00_AXI_rresp,
    input wire          smartconnect_31_S00_AXI_rvalid,
    output wire [ 63:0] smartconnect_31_S00_AXI_wdata,
    output wire         smartconnect_31_S00_AXI_wlast,
    input wire          smartconnect_31_S00_AXI_wready,
    output wire [  7:0] smartconnect_31_S00_AXI_wstrb,
    output wire         smartconnect_31_S00_AXI_wvalid,
    output wire         smartconnect_31_aclk,
    output wire         smartconnect_31_aclk1,
    output wire         smartconnect_31_aresetn,
    output wire [  0:0] util_ds_buf_IBUF_DS_N,
    input wire  [  0:0] util_ds_buf_IBUF_DS_ODIV2_1,
    output wire [  0:0] util_ds_buf_IBUF_DS_P,
    input wire  [  0:0] util_ds_buf_IBUF_OUT_1,
    output wire [  0:0] util_ds_buf_0_IBUF_DS_N,
    output wire [  0:0] util_ds_buf_0_IBUF_DS_P,
    input wire  [  0:0] util_ds_buf_0_IBUF_OUT_1,
    input wire          xdma_0_axi_aclk_1,
    input wire          xdma_0_axi_aresetn_1,
    input wire  [ 63:0] xdma_0_m_axi_araddr,
    input wire  [  1:0] xdma_0_m_axi_arburst,
    input wire  [  3:0] xdma_0_m_axi_arcache,
    input wire  [  3:0] xdma_0_m_axi_arid,
    input wire  [  7:0] xdma_0_m_axi_arlen,
    input wire          xdma_0_m_axi_arlock,
    input wire  [  2:0] xdma_0_m_axi_arprot,
    output wire         xdma_0_m_axi_arready,
    input wire  [  2:0] xdma_0_m_axi_arsize,
    input wire          xdma_0_m_axi_arvalid,
    input wire  [ 63:0] xdma_0_m_axi_awaddr,
    input wire  [  1:0] xdma_0_m_axi_awburst,
    input wire  [  3:0] xdma_0_m_axi_awcache,
    input wire  [  3:0] xdma_0_m_axi_awid,
    input wire  [  7:0] xdma_0_m_axi_awlen,
    input wire          xdma_0_m_axi_awlock,
    input wire  [  2:0] xdma_0_m_axi_awprot,
    output wire         xdma_0_m_axi_awready,
    input wire  [  2:0] xdma_0_m_axi_awsize,
    input wire          xdma_0_m_axi_awvalid,
    output wire [  3:0] xdma_0_m_axi_bid,
    input wire          xdma_0_m_axi_bready,
    output wire [  1:0] xdma_0_m_axi_bresp,
    output wire         xdma_0_m_axi_bvalid,
    output wire [ 63:0] xdma_0_m_axi_rdata,
    output wire [  3:0] xdma_0_m_axi_rid,
    output wire         xdma_0_m_axi_rlast,
    input wire          xdma_0_m_axi_rready,
    output wire [  1:0] xdma_0_m_axi_rresp,
    output wire         xdma_0_m_axi_rvalid,
    input wire  [ 63:0] xdma_0_m_axi_wdata,
    input wire          xdma_0_m_axi_wlast,
    output wire         xdma_0_m_axi_wready,
    input wire  [  7:0] xdma_0_m_axi_wstrb,
    input wire          xdma_0_m_axi_wvalid,
    input wire  [ 63:0] xdma_0_m_axib_araddr,
    input wire  [  1:0] xdma_0_m_axib_arburst,
    input wire  [  3:0] xdma_0_m_axib_arcache,
    input wire  [  3:0] xdma_0_m_axib_arid,
    input wire  [  7:0] xdma_0_m_axib_arlen,
    input wire          xdma_0_m_axib_arlock,
    input wire  [  2:0] xdma_0_m_axib_arprot,
    output wire         xdma_0_m_axib_arready,
    input wire  [  2:0] xdma_0_m_axib_arsize,
    input wire          xdma_0_m_axib_arvalid,
    input wire  [ 63:0] xdma_0_m_axib_awaddr,
    input wire  [  1:0] xdma_0_m_axib_awburst,
    input wire  [  3:0] xdma_0_m_axib_awcache,
    input wire  [  3:0] xdma_0_m_axib_awid,
    input wire  [  7:0] xdma_0_m_axib_awlen,
    input wire          xdma_0_m_axib_awlock,
    input wire  [  2:0] xdma_0_m_axib_awprot,
    output wire         xdma_0_m_axib_awready,
    input wire  [  2:0] xdma_0_m_axib_awsize,
    input wire          xdma_0_m_axib_awvalid,
    output wire [  3:0] xdma_0_m_axib_bid,
    input wire          xdma_0_m_axib_bready,
    output wire [  1:0] xdma_0_m_axib_bresp,
    output wire         xdma_0_m_axib_bvalid,
    output wire [ 63:0] xdma_0_m_axib_rdata,
    output wire [  3:0] xdma_0_m_axib_rid,
    output wire         xdma_0_m_axib_rlast,
    input wire          xdma_0_m_axib_rready,
    output wire [  1:0] xdma_0_m_axib_rresp,
    output wire         xdma_0_m_axib_rvalid,
    input wire  [ 63:0] xdma_0_m_axib_wdata,
    input wire          xdma_0_m_axib_wlast,
    output wire         xdma_0_m_axib_wready,
    input wire  [  7:0] xdma_0_m_axib_wstrb,
    input wire          xdma_0_m_axib_wvalid,
    input wire          xdma_0_msix_enable,
    output wire [  0:0] xdma_0_pci_exp_rxn,
    output wire [  0:0] xdma_0_pci_exp_rxp,
    input wire  [  0:0] xdma_0_pci_exp_txn,
    input wire  [  0:0] xdma_0_pci_exp_txp,
    output wire         xdma_0_sys_clk,
    output wire         xdma_0_sys_clk_gt,
    output wire         xdma_0_sys_rst_n,
    input wire          xdma_0_user_lnk_up,
    input wire  [  0:0] xdma_0_usr_irq_ack,
    output wire [  0:0] xdma_0_usr_irq_req,
    output wire         xdma_0_axi_periph_ACLK,
    output wire         xdma_0_axi_periph_ARESETN,
    output wire         xdma_0_axi_periph_M00_ACLK,
    output wire         xdma_0_axi_periph_M00_ARESETN,
    input wire  [ 63:0] xdma_0_axi_periph_M00_AXI_araddr,
    output wire         xdma_0_axi_periph_M00_AXI_arready,
    input wire          xdma_0_axi_periph_M00_AXI_arvalid,
    input wire  [ 63:0] xdma_0_axi_periph_M00_AXI_awaddr,
    output wire         xdma_0_axi_periph_M00_AXI_awready,
    input wire          xdma_0_axi_periph_M00_AXI_awvalid,
    input wire          xdma_0_axi_periph_M00_AXI_bready,
    output wire [  1:0] xdma_0_axi_periph_M00_AXI_bresp,
    output wire         xdma_0_axi_periph_M00_AXI_bvalid,
    output wire [ 31:0] xdma_0_axi_periph_M00_AXI_rdata,
    input wire          xdma_0_axi_periph_M00_AXI_rready,
    output wire [  1:0] xdma_0_axi_periph_M00_AXI_rresp,
    output wire         xdma_0_axi_periph_M00_AXI_rvalid,
    input wire  [ 31:0] xdma_0_axi_periph_M00_AXI_wdata,
    output wire         xdma_0_axi_periph_M00_AXI_wready,
    input wire  [  3:0] xdma_0_axi_periph_M00_AXI_wstrb,
    input wire          xdma_0_axi_periph_M00_AXI_wvalid,
    output wire         xdma_0_axi_periph_S00_ACLK,
    output wire         xdma_0_axi_periph_S00_ARESETN,
    output wire [ 63:0] xdma_0_axi_periph_S00_AXI_araddr,
    output wire [  1:0] xdma_0_axi_periph_S00_AXI_arburst,
    output wire [  3:0] xdma_0_axi_periph_S00_AXI_arcache,
    output wire [  3:0] xdma_0_axi_periph_S00_AXI_arid,
    output wire [  7:0] xdma_0_axi_periph_S00_AXI_arlen,
    output wire [  0:0] xdma_0_axi_periph_S00_AXI_arlock,
    output wire [  2:0] xdma_0_axi_periph_S00_AXI_arprot,
    input wire          xdma_0_axi_periph_S00_AXI_arready,
    output wire [  2:0] xdma_0_axi_periph_S00_AXI_arsize,
    output wire         xdma_0_axi_periph_S00_AXI_arvalid,
    output wire [ 63:0] xdma_0_axi_periph_S00_AXI_awaddr,
    output wire [  1:0] xdma_0_axi_periph_S00_AXI_awburst,
    output wire [  3:0] xdma_0_axi_periph_S00_AXI_awcache,
    output wire [  3:0] xdma_0_axi_periph_S00_AXI_awid,
    output wire [  7:0] xdma_0_axi_periph_S00_AXI_awlen,
    output wire [  0:0] xdma_0_axi_periph_S00_AXI_awlock,
    output wire [  2:0] xdma_0_axi_periph_S00_AXI_awprot,
    input wire          xdma_0_axi_periph_S00_AXI_awready,
    output wire [  2:0] xdma_0_axi_periph_S00_AXI_awsize,
    output wire         xdma_0_axi_periph_S00_AXI_awvalid,
    input wire  [  3:0] xdma_0_axi_periph_S00_AXI_bid,
    output wire         xdma_0_axi_periph_S00_AXI_bready,
    input wire  [  1:0] xdma_0_axi_periph_S00_AXI_bresp,
    input wire          xdma_0_axi_periph_S00_AXI_bvalid,
    input wire  [ 63:0] xdma_0_axi_periph_S00_AXI_rdata,
    input wire  [  3:0] xdma_0_axi_periph_S00_AXI_rid,
    input wire          xdma_0_axi_periph_S00_AXI_rlast,
    output wire         xdma_0_axi_periph_S00_AXI_rready,
    input wire  [  1:0] xdma_0_axi_periph_S00_AXI_rresp,
    input wire          xdma_0_axi_periph_S00_AXI_rvalid,
    output wire [ 63:0] xdma_0_axi_periph_S00_AXI_wdata,
    output wire         xdma_0_axi_periph_S00_AXI_wlast,
    input wire          xdma_0_axi_periph_S00_AXI_wready,
    output wire [  7:0] xdma_0_axi_periph_S00_AXI_wstrb,
    output wire         xdma_0_axi_periph_S00_AXI_wvalid
);
  wire [0:0]apb_sys_reset_peripheral_aresetn;
  wire [32:0]axi_register_slice_28_M_AXI_ARADDR;
  wire [1:0]axi_register_slice_28_M_AXI_ARBURST;
  wire [3:0]axi_register_slice_28_M_AXI_ARLEN;
  wire axi_register_slice_28_M_AXI_ARREADY;
  wire [2:0]axi_register_slice_28_M_AXI_ARSIZE;
  wire axi_register_slice_28_M_AXI_ARVALID;
  wire [32:0]axi_register_slice_28_M_AXI_AWADDR;
  wire [1:0]axi_register_slice_28_M_AXI_AWBURST;
  wire [3:0]axi_register_slice_28_M_AXI_AWLEN;
  wire axi_register_slice_28_M_AXI_AWREADY;
  wire [2:0]axi_register_slice_28_M_AXI_AWSIZE;
  wire axi_register_slice_28_M_AXI_AWVALID;
  wire axi_register_slice_28_M_AXI_BREADY;
  wire [1:0]axi_register_slice_28_M_AXI_BRESP;
  wire axi_register_slice_28_M_AXI_BVALID;
  wire [255:0]axi_register_slice_28_M_AXI_RDATA;
  wire axi_register_slice_28_M_AXI_RLAST;
  wire axi_register_slice_28_M_AXI_RREADY;
  wire [1:0]axi_register_slice_28_M_AXI_RRESP;
  wire axi_register_slice_28_M_AXI_RVALID;
  wire [255:0]axi_register_slice_28_M_AXI_WDATA;
  wire axi_register_slice_28_M_AXI_WLAST;
  wire axi_register_slice_28_M_AXI_WREADY;
  wire [31:0]axi_register_slice_28_M_AXI_WSTRB;
  wire axi_register_slice_28_M_AXI_WVALID;
  wire [32:0]axi_register_slice_29_M_AXI_ARADDR;
  wire [1:0]axi_register_slice_29_M_AXI_ARBURST;
  wire [3:0]axi_register_slice_29_M_AXI_ARLEN;
  wire axi_register_slice_29_M_AXI_ARREADY;
  wire [2:0]axi_register_slice_29_M_AXI_ARSIZE;
  wire axi_register_slice_29_M_AXI_ARVALID;
  wire [32:0]axi_register_slice_29_M_AXI_AWADDR;
  wire [1:0]axi_register_slice_29_M_AXI_AWBURST;
  wire [3:0]axi_register_slice_29_M_AXI_AWLEN;
  wire axi_register_slice_29_M_AXI_AWREADY;
  wire [2:0]axi_register_slice_29_M_AXI_AWSIZE;
  wire axi_register_slice_29_M_AXI_AWVALID;
  wire axi_register_slice_29_M_AXI_BREADY;
  wire [1:0]axi_register_slice_29_M_AXI_BRESP;
  wire axi_register_slice_29_M_AXI_BVALID;
  wire [255:0]axi_register_slice_29_M_AXI_RDATA;
  wire axi_register_slice_29_M_AXI_RLAST;
  wire axi_register_slice_29_M_AXI_RREADY;
  wire [1:0]axi_register_slice_29_M_AXI_RRESP;
  wire axi_register_slice_29_M_AXI_RVALID;
  wire [255:0]axi_register_slice_29_M_AXI_WDATA;
  wire axi_register_slice_29_M_AXI_WLAST;
  wire axi_register_slice_29_M_AXI_WREADY;
  wire [31:0]axi_register_slice_29_M_AXI_WSTRB;
  wire axi_register_slice_29_M_AXI_WVALID;
  wire [32:0]axi_register_slice_30_M_AXI_ARADDR;
  wire [1:0]axi_register_slice_30_M_AXI_ARBURST;
  wire [3:0]axi_register_slice_30_M_AXI_ARLEN;
  wire axi_register_slice_30_M_AXI_ARREADY;
  wire [2:0]axi_register_slice_30_M_AXI_ARSIZE;
  wire axi_register_slice_30_M_AXI_ARVALID;
  wire [32:0]axi_register_slice_30_M_AXI_AWADDR;
  wire [1:0]axi_register_slice_30_M_AXI_AWBURST;
  wire [3:0]axi_register_slice_30_M_AXI_AWLEN;
  wire axi_register_slice_30_M_AXI_AWREADY;
  wire [2:0]axi_register_slice_30_M_AXI_AWSIZE;
  wire axi_register_slice_30_M_AXI_AWVALID;
  wire axi_register_slice_30_M_AXI_BREADY;
  wire [1:0]axi_register_slice_30_M_AXI_BRESP;
  wire axi_register_slice_30_M_AXI_BVALID;
  wire [255:0]axi_register_slice_30_M_AXI_RDATA;
  wire axi_register_slice_30_M_AXI_RLAST;
  wire axi_register_slice_30_M_AXI_RREADY;
  wire [1:0]axi_register_slice_30_M_AXI_RRESP;
  wire axi_register_slice_30_M_AXI_RVALID;
  wire [255:0]axi_register_slice_30_M_AXI_WDATA;
  wire axi_register_slice_30_M_AXI_WLAST;
  wire axi_register_slice_30_M_AXI_WREADY;
  wire [31:0]axi_register_slice_30_M_AXI_WSTRB;
  wire axi_register_slice_30_M_AXI_WVALID;
  wire [32:0]axi_register_slice_31_M_AXI_ARADDR;
  wire [1:0]axi_register_slice_31_M_AXI_ARBURST;
  wire [3:0]axi_register_slice_31_M_AXI_ARLEN;
  wire axi_register_slice_31_M_AXI_ARREADY;
  wire [2:0]axi_register_slice_31_M_AXI_ARSIZE;
  wire axi_register_slice_31_M_AXI_ARVALID;
  wire [32:0]axi_register_slice_31_M_AXI_AWADDR;
  wire [1:0]axi_register_slice_31_M_AXI_AWBURST;
  wire [3:0]axi_register_slice_31_M_AXI_AWLEN;
  wire axi_register_slice_31_M_AXI_AWREADY;
  wire [2:0]axi_register_slice_31_M_AXI_AWSIZE;
  wire axi_register_slice_31_M_AXI_AWVALID;
  wire axi_register_slice_31_M_AXI_BREADY;
  wire [1:0]axi_register_slice_31_M_AXI_BRESP;
  wire axi_register_slice_31_M_AXI_BVALID;
  wire [255:0]axi_register_slice_31_M_AXI_RDATA;
  wire axi_register_slice_31_M_AXI_RLAST;
  wire axi_register_slice_31_M_AXI_RREADY;
  wire [1:0]axi_register_slice_31_M_AXI_RRESP;
  wire axi_register_slice_31_M_AXI_RVALID;
  wire [255:0]axi_register_slice_31_M_AXI_WDATA;
  wire axi_register_slice_31_M_AXI_WLAST;
  wire axi_register_slice_31_M_AXI_WREADY;
  wire [31:0]axi_register_slice_31_M_AXI_WSTRB;
  wire axi_register_slice_31_M_AXI_WVALID;
  wire gnd_driver_0_dout;
  wire hbm_axi_clk_clk_out1;
  wire hbm_axi_clk_locked;
  wire hbm_clk_1_CLK_N;
  wire hbm_clk_1_CLK_P;
  wire [0:0]hbm_sys_reset_peripheral_aresetn;
  wire [63:0]kernel3_0_m_axi_gmem_A_ARADDR;
  wire [1:0]kernel3_0_m_axi_gmem_A_ARBURST;
  wire [3:0]kernel3_0_m_axi_gmem_A_ARCACHE;
  wire [0:0]kernel3_0_m_axi_gmem_A_ARID;
  wire [7:0]kernel3_0_m_axi_gmem_A_ARLEN;
  wire [1:0]kernel3_0_m_axi_gmem_A_ARLOCK;
  wire [2:0]kernel3_0_m_axi_gmem_A_ARPROT;
  wire [3:0]kernel3_0_m_axi_gmem_A_ARQOS;
  wire kernel3_0_m_axi_gmem_A_ARREADY;
  wire [2:0]kernel3_0_m_axi_gmem_A_ARSIZE;
  wire [0:0]kernel3_0_m_axi_gmem_A_ARUSER;
  wire kernel3_0_m_axi_gmem_A_ARVALID;
  wire [63:0]kernel3_0_m_axi_gmem_A_AWADDR;
  wire [1:0]kernel3_0_m_axi_gmem_A_AWBURST;
  wire [3:0]kernel3_0_m_axi_gmem_A_AWCACHE;
  wire [0:0]kernel3_0_m_axi_gmem_A_AWID;
  wire [7:0]kernel3_0_m_axi_gmem_A_AWLEN;
  wire [1:0]kernel3_0_m_axi_gmem_A_AWLOCK;
  wire [2:0]kernel3_0_m_axi_gmem_A_AWPROT;
  wire [3:0]kernel3_0_m_axi_gmem_A_AWQOS;
  wire kernel3_0_m_axi_gmem_A_AWREADY;
  wire [2:0]kernel3_0_m_axi_gmem_A_AWSIZE;
  wire [0:0]kernel3_0_m_axi_gmem_A_AWUSER;
  wire kernel3_0_m_axi_gmem_A_AWVALID;
  wire [0:0]kernel3_0_m_axi_gmem_A_BID;
  wire kernel3_0_m_axi_gmem_A_BREADY;
  wire [1:0]kernel3_0_m_axi_gmem_A_BRESP;
  wire [0:0]kernel3_0_m_axi_gmem_A_BUSER;
  wire kernel3_0_m_axi_gmem_A_BVALID;
  wire [511:0]kernel3_0_m_axi_gmem_A_RDATA;
  wire [0:0]kernel3_0_m_axi_gmem_A_RID;
  wire kernel3_0_m_axi_gmem_A_RLAST;
  wire kernel3_0_m_axi_gmem_A_RREADY;
  wire [1:0]kernel3_0_m_axi_gmem_A_RRESP;
  wire kernel3_0_m_axi_gmem_A_RVALID;
  wire [511:0]kernel3_0_m_axi_gmem_A_WDATA;
  wire kernel3_0_m_axi_gmem_A_WLAST;
  wire kernel3_0_m_axi_gmem_A_WREADY;
  wire [63:0]kernel3_0_m_axi_gmem_A_WSTRB;
  wire kernel3_0_m_axi_gmem_A_WVALID;
  wire [63:0]kernel3_0_m_axi_gmem_B_ARADDR;
  wire [1:0]kernel3_0_m_axi_gmem_B_ARBURST;
  wire [3:0]kernel3_0_m_axi_gmem_B_ARCACHE;
  wire [0:0]kernel3_0_m_axi_gmem_B_ARID;
  wire [7:0]kernel3_0_m_axi_gmem_B_ARLEN;
  wire [1:0]kernel3_0_m_axi_gmem_B_ARLOCK;
  wire [2:0]kernel3_0_m_axi_gmem_B_ARPROT;
  wire [3:0]kernel3_0_m_axi_gmem_B_ARQOS;
  wire kernel3_0_m_axi_gmem_B_ARREADY;
  wire [2:0]kernel3_0_m_axi_gmem_B_ARSIZE;
  wire [0:0]kernel3_0_m_axi_gmem_B_ARUSER;
  wire kernel3_0_m_axi_gmem_B_ARVALID;
  wire [63:0]kernel3_0_m_axi_gmem_B_AWADDR;
  wire [1:0]kernel3_0_m_axi_gmem_B_AWBURST;
  wire [3:0]kernel3_0_m_axi_gmem_B_AWCACHE;
  wire [0:0]kernel3_0_m_axi_gmem_B_AWID;
  wire [7:0]kernel3_0_m_axi_gmem_B_AWLEN;
  wire [1:0]kernel3_0_m_axi_gmem_B_AWLOCK;
  wire [2:0]kernel3_0_m_axi_gmem_B_AWPROT;
  wire [3:0]kernel3_0_m_axi_gmem_B_AWQOS;
  wire kernel3_0_m_axi_gmem_B_AWREADY;
  wire [2:0]kernel3_0_m_axi_gmem_B_AWSIZE;
  wire [0:0]kernel3_0_m_axi_gmem_B_AWUSER;
  wire kernel3_0_m_axi_gmem_B_AWVALID;
  wire [0:0]kernel3_0_m_axi_gmem_B_BID;
  wire kernel3_0_m_axi_gmem_B_BREADY;
  wire [1:0]kernel3_0_m_axi_gmem_B_BRESP;
  wire [0:0]kernel3_0_m_axi_gmem_B_BUSER;
  wire kernel3_0_m_axi_gmem_B_BVALID;
  wire [511:0]kernel3_0_m_axi_gmem_B_RDATA;
  wire [0:0]kernel3_0_m_axi_gmem_B_RID;
  wire kernel3_0_m_axi_gmem_B_RLAST;
  wire kernel3_0_m_axi_gmem_B_RREADY;
  wire [1:0]kernel3_0_m_axi_gmem_B_RRESP;
  wire kernel3_0_m_axi_gmem_B_RVALID;
  wire [511:0]kernel3_0_m_axi_gmem_B_WDATA;
  wire kernel3_0_m_axi_gmem_B_WLAST;
  wire kernel3_0_m_axi_gmem_B_WREADY;
  wire [63:0]kernel3_0_m_axi_gmem_B_WSTRB;
  wire kernel3_0_m_axi_gmem_B_WVALID;
  wire [63:0]kernel3_0_m_axi_gmem_C_ARADDR;
  wire [1:0]kernel3_0_m_axi_gmem_C_ARBURST;
  wire [3:0]kernel3_0_m_axi_gmem_C_ARCACHE;
  wire [0:0]kernel3_0_m_axi_gmem_C_ARID;
  wire [7:0]kernel3_0_m_axi_gmem_C_ARLEN;
  wire [1:0]kernel3_0_m_axi_gmem_C_ARLOCK;
  wire [2:0]kernel3_0_m_axi_gmem_C_ARPROT;
  wire [3:0]kernel3_0_m_axi_gmem_C_ARQOS;
  wire kernel3_0_m_axi_gmem_C_ARREADY;
  wire [2:0]kernel3_0_m_axi_gmem_C_ARSIZE;
  wire [0:0]kernel3_0_m_axi_gmem_C_ARUSER;
  wire kernel3_0_m_axi_gmem_C_ARVALID;
  wire [63:0]kernel3_0_m_axi_gmem_C_AWADDR;
  wire [1:0]kernel3_0_m_axi_gmem_C_AWBURST;
  wire [3:0]kernel3_0_m_axi_gmem_C_AWCACHE;
  wire [0:0]kernel3_0_m_axi_gmem_C_AWID;
  wire [7:0]kernel3_0_m_axi_gmem_C_AWLEN;
  wire [1:0]kernel3_0_m_axi_gmem_C_AWLOCK;
  wire [2:0]kernel3_0_m_axi_gmem_C_AWPROT;
  wire [3:0]kernel3_0_m_axi_gmem_C_AWQOS;
  wire kernel3_0_m_axi_gmem_C_AWREADY;
  wire [2:0]kernel3_0_m_axi_gmem_C_AWSIZE;
  wire [0:0]kernel3_0_m_axi_gmem_C_AWUSER;
  wire kernel3_0_m_axi_gmem_C_AWVALID;
  wire [0:0]kernel3_0_m_axi_gmem_C_BID;
  wire kernel3_0_m_axi_gmem_C_BREADY;
  wire [1:0]kernel3_0_m_axi_gmem_C_BRESP;
  wire [0:0]kernel3_0_m_axi_gmem_C_BUSER;
  wire kernel3_0_m_axi_gmem_C_BVALID;
  wire [511:0]kernel3_0_m_axi_gmem_C_RDATA;
  wire [0:0]kernel3_0_m_axi_gmem_C_RID;
  wire kernel3_0_m_axi_gmem_C_RLAST;
  wire kernel3_0_m_axi_gmem_C_RREADY;
  wire [1:0]kernel3_0_m_axi_gmem_C_RRESP;
  wire kernel3_0_m_axi_gmem_C_RVALID;
  wire [511:0]kernel3_0_m_axi_gmem_C_WDATA;
  wire kernel3_0_m_axi_gmem_C_WLAST;
  wire kernel3_0_m_axi_gmem_C_WREADY;
  wire [63:0]kernel3_0_m_axi_gmem_C_WSTRB;
  wire kernel3_0_m_axi_gmem_C_WVALID;
  wire kernel_clk_clk_out1;
  wire kernel_clk_locked;
  wire [0:0]kernel_sys_reset_peripheral_aresetn;
  wire pcie_perstn_1;
  wire pcie_refclk_1_CLK_N;
  wire pcie_refclk_1_CLK_P;
  wire [32:0]smartconnect_28_M00_AXI_ARADDR;
  wire [1:0]smartconnect_28_M00_AXI_ARBURST;
  wire [3:0]smartconnect_28_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_28_M00_AXI_ARLEN;
  wire [1:0]smartconnect_28_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_28_M00_AXI_ARPROT;
  wire [3:0]smartconnect_28_M00_AXI_ARQOS;
  wire smartconnect_28_M00_AXI_ARREADY;
  wire [2:0]smartconnect_28_M00_AXI_ARSIZE;
  wire [0:0]smartconnect_28_M00_AXI_ARUSER;
  wire smartconnect_28_M00_AXI_ARVALID;
  wire [32:0]smartconnect_28_M00_AXI_AWADDR;
  wire [1:0]smartconnect_28_M00_AXI_AWBURST;
  wire [3:0]smartconnect_28_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_28_M00_AXI_AWLEN;
  wire [1:0]smartconnect_28_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_28_M00_AXI_AWPROT;
  wire [3:0]smartconnect_28_M00_AXI_AWQOS;
  wire smartconnect_28_M00_AXI_AWREADY;
  wire [2:0]smartconnect_28_M00_AXI_AWSIZE;
  wire [0:0]smartconnect_28_M00_AXI_AWUSER;
  wire smartconnect_28_M00_AXI_AWVALID;
  wire smartconnect_28_M00_AXI_BREADY;
  wire [1:0]smartconnect_28_M00_AXI_BRESP;
  wire [0:0]smartconnect_28_M00_AXI_BUSER;
  wire smartconnect_28_M00_AXI_BVALID;
  wire [255:0]smartconnect_28_M00_AXI_RDATA;
  wire smartconnect_28_M00_AXI_RLAST;
  wire smartconnect_28_M00_AXI_RREADY;
  wire [1:0]smartconnect_28_M00_AXI_RRESP;
  wire smartconnect_28_M00_AXI_RVALID;
  wire [255:0]smartconnect_28_M00_AXI_WDATA;
  wire smartconnect_28_M00_AXI_WLAST;
  wire smartconnect_28_M00_AXI_WREADY;
  wire [31:0]smartconnect_28_M00_AXI_WSTRB;
  wire smartconnect_28_M00_AXI_WVALID;
  wire [32:0]smartconnect_29_M00_AXI_ARADDR;
  wire [1:0]smartconnect_29_M00_AXI_ARBURST;
  wire [3:0]smartconnect_29_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_29_M00_AXI_ARLEN;
  wire [1:0]smartconnect_29_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_29_M00_AXI_ARPROT;
  wire [3:0]smartconnect_29_M00_AXI_ARQOS;
  wire smartconnect_29_M00_AXI_ARREADY;
  wire [2:0]smartconnect_29_M00_AXI_ARSIZE;
  wire [0:0]smartconnect_29_M00_AXI_ARUSER;
  wire smartconnect_29_M00_AXI_ARVALID;
  wire [32:0]smartconnect_29_M00_AXI_AWADDR;
  wire [1:0]smartconnect_29_M00_AXI_AWBURST;
  wire [3:0]smartconnect_29_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_29_M00_AXI_AWLEN;
  wire [1:0]smartconnect_29_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_29_M00_AXI_AWPROT;
  wire [3:0]smartconnect_29_M00_AXI_AWQOS;
  wire smartconnect_29_M00_AXI_AWREADY;
  wire [2:0]smartconnect_29_M00_AXI_AWSIZE;
  wire [0:0]smartconnect_29_M00_AXI_AWUSER;
  wire smartconnect_29_M00_AXI_AWVALID;
  wire smartconnect_29_M00_AXI_BREADY;
  wire [1:0]smartconnect_29_M00_AXI_BRESP;
  wire [0:0]smartconnect_29_M00_AXI_BUSER;
  wire smartconnect_29_M00_AXI_BVALID;
  wire [255:0]smartconnect_29_M00_AXI_RDATA;
  wire smartconnect_29_M00_AXI_RLAST;
  wire smartconnect_29_M00_AXI_RREADY;
  wire [1:0]smartconnect_29_M00_AXI_RRESP;
  wire smartconnect_29_M00_AXI_RVALID;
  wire [255:0]smartconnect_29_M00_AXI_WDATA;
  wire smartconnect_29_M00_AXI_WLAST;
  wire smartconnect_29_M00_AXI_WREADY;
  wire [31:0]smartconnect_29_M00_AXI_WSTRB;
  wire smartconnect_29_M00_AXI_WVALID;
  wire [32:0]smartconnect_30_M00_AXI_ARADDR;
  wire [1:0]smartconnect_30_M00_AXI_ARBURST;
  wire [3:0]smartconnect_30_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_30_M00_AXI_ARLEN;
  wire [1:0]smartconnect_30_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_30_M00_AXI_ARPROT;
  wire [3:0]smartconnect_30_M00_AXI_ARQOS;
  wire smartconnect_30_M00_AXI_ARREADY;
  wire [2:0]smartconnect_30_M00_AXI_ARSIZE;
  wire [0:0]smartconnect_30_M00_AXI_ARUSER;
  wire smartconnect_30_M00_AXI_ARVALID;
  wire [32:0]smartconnect_30_M00_AXI_AWADDR;
  wire [1:0]smartconnect_30_M00_AXI_AWBURST;
  wire [3:0]smartconnect_30_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_30_M00_AXI_AWLEN;
  wire [1:0]smartconnect_30_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_30_M00_AXI_AWPROT;
  wire [3:0]smartconnect_30_M00_AXI_AWQOS;
  wire smartconnect_30_M00_AXI_AWREADY;
  wire [2:0]smartconnect_30_M00_AXI_AWSIZE;
  wire [0:0]smartconnect_30_M00_AXI_AWUSER;
  wire smartconnect_30_M00_AXI_AWVALID;
  wire smartconnect_30_M00_AXI_BREADY;
  wire [1:0]smartconnect_30_M00_AXI_BRESP;
  wire [0:0]smartconnect_30_M00_AXI_BUSER;
  wire smartconnect_30_M00_AXI_BVALID;
  wire [255:0]smartconnect_30_M00_AXI_RDATA;
  wire smartconnect_30_M00_AXI_RLAST;
  wire smartconnect_30_M00_AXI_RREADY;
  wire [1:0]smartconnect_30_M00_AXI_RRESP;
  wire smartconnect_30_M00_AXI_RVALID;
  wire [255:0]smartconnect_30_M00_AXI_WDATA;
  wire smartconnect_30_M00_AXI_WLAST;
  wire smartconnect_30_M00_AXI_WREADY;
  wire [31:0]smartconnect_30_M00_AXI_WSTRB;
  wire smartconnect_30_M00_AXI_WVALID;
  wire [32:0]smartconnect_31_M00_AXI_ARADDR;
  wire [1:0]smartconnect_31_M00_AXI_ARBURST;
  wire [3:0]smartconnect_31_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_31_M00_AXI_ARLEN;
  wire [1:0]smartconnect_31_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_31_M00_AXI_ARPROT;
  wire [3:0]smartconnect_31_M00_AXI_ARQOS;
  wire smartconnect_31_M00_AXI_ARREADY;
  wire [2:0]smartconnect_31_M00_AXI_ARSIZE;
  wire smartconnect_31_M00_AXI_ARVALID;
  wire [32:0]smartconnect_31_M00_AXI_AWADDR;
  wire [1:0]smartconnect_31_M00_AXI_AWBURST;
  wire [3:0]smartconnect_31_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_31_M00_AXI_AWLEN;
  wire [1:0]smartconnect_31_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_31_M00_AXI_AWPROT;
  wire [3:0]smartconnect_31_M00_AXI_AWQOS;
  wire smartconnect_31_M00_AXI_AWREADY;
  wire [2:0]smartconnect_31_M00_AXI_AWSIZE;
  wire smartconnect_31_M00_AXI_AWVALID;
  wire smartconnect_31_M00_AXI_BREADY;
  wire [1:0]smartconnect_31_M00_AXI_BRESP;
  wire smartconnect_31_M00_AXI_BVALID;
  wire [255:0]smartconnect_31_M00_AXI_RDATA;
  wire smartconnect_31_M00_AXI_RLAST;
  wire smartconnect_31_M00_AXI_RREADY;
  wire [1:0]smartconnect_31_M00_AXI_RRESP;
  wire smartconnect_31_M00_AXI_RVALID;
  wire [255:0]smartconnect_31_M00_AXI_WDATA;
  wire smartconnect_31_M00_AXI_WLAST;
  wire smartconnect_31_M00_AXI_WREADY;
  wire [31:0]smartconnect_31_M00_AXI_WSTRB;
  wire smartconnect_31_M00_AXI_WVALID;
  wire [0:0]util_ds_buf_0_IBUF_OUT;
  wire [0:0]util_ds_buf_IBUF_DS_ODIV2;
  wire [0:0]util_ds_buf_IBUF_OUT;
  wire [63:0]xdma_0_M_AXI_ARADDR;
  wire [1:0]xdma_0_M_AXI_ARBURST;
  wire [3:0]xdma_0_M_AXI_ARCACHE;
  wire [3:0]xdma_0_M_AXI_ARID;
  wire [7:0]xdma_0_M_AXI_ARLEN;
  wire xdma_0_M_AXI_ARLOCK;
  wire [2:0]xdma_0_M_AXI_ARPROT;
  wire xdma_0_M_AXI_ARREADY;
  wire [2:0]xdma_0_M_AXI_ARSIZE;
  wire xdma_0_M_AXI_ARVALID;
  wire [63:0]xdma_0_M_AXI_AWADDR;
  wire [1:0]xdma_0_M_AXI_AWBURST;
  wire [3:0]xdma_0_M_AXI_AWCACHE;
  wire [3:0]xdma_0_M_AXI_AWID;
  wire [7:0]xdma_0_M_AXI_AWLEN;
  wire xdma_0_M_AXI_AWLOCK;
  wire [2:0]xdma_0_M_AXI_AWPROT;
  wire xdma_0_M_AXI_AWREADY;
  wire [2:0]xdma_0_M_AXI_AWSIZE;
  wire xdma_0_M_AXI_AWVALID;
  wire [3:0]xdma_0_M_AXI_BID;
  wire xdma_0_M_AXI_BREADY;
  wire [1:0]xdma_0_M_AXI_BRESP;
  wire xdma_0_M_AXI_BVALID;
  wire [63:0]xdma_0_M_AXI_BYPASS_ARADDR;
  wire [1:0]xdma_0_M_AXI_BYPASS_ARBURST;
  wire [3:0]xdma_0_M_AXI_BYPASS_ARCACHE;
  wire [3:0]xdma_0_M_AXI_BYPASS_ARID;
  wire [7:0]xdma_0_M_AXI_BYPASS_ARLEN;
  wire xdma_0_M_AXI_BYPASS_ARLOCK;
  wire [2:0]xdma_0_M_AXI_BYPASS_ARPROT;
  wire xdma_0_M_AXI_BYPASS_ARREADY;
  wire [2:0]xdma_0_M_AXI_BYPASS_ARSIZE;
  wire xdma_0_M_AXI_BYPASS_ARVALID;
  wire [63:0]xdma_0_M_AXI_BYPASS_AWADDR;
  wire [1:0]xdma_0_M_AXI_BYPASS_AWBURST;
  wire [3:0]xdma_0_M_AXI_BYPASS_AWCACHE;
  wire [3:0]xdma_0_M_AXI_BYPASS_AWID;
  wire [7:0]xdma_0_M_AXI_BYPASS_AWLEN;
  wire xdma_0_M_AXI_BYPASS_AWLOCK;
  wire [2:0]xdma_0_M_AXI_BYPASS_AWPROT;
  wire xdma_0_M_AXI_BYPASS_AWREADY;
  wire [2:0]xdma_0_M_AXI_BYPASS_AWSIZE;
  wire xdma_0_M_AXI_BYPASS_AWVALID;
  wire [3:0]xdma_0_M_AXI_BYPASS_BID;
  wire xdma_0_M_AXI_BYPASS_BREADY;
  wire [1:0]xdma_0_M_AXI_BYPASS_BRESP;
  wire xdma_0_M_AXI_BYPASS_BVALID;
  wire [63:0]xdma_0_M_AXI_BYPASS_RDATA;
  wire [3:0]xdma_0_M_AXI_BYPASS_RID;
  wire xdma_0_M_AXI_BYPASS_RLAST;
  wire xdma_0_M_AXI_BYPASS_RREADY;
  wire [1:0]xdma_0_M_AXI_BYPASS_RRESP;
  wire xdma_0_M_AXI_BYPASS_RVALID;
  wire [63:0]xdma_0_M_AXI_BYPASS_WDATA;
  wire xdma_0_M_AXI_BYPASS_WLAST;
  wire xdma_0_M_AXI_BYPASS_WREADY;
  wire [7:0]xdma_0_M_AXI_BYPASS_WSTRB;
  wire xdma_0_M_AXI_BYPASS_WVALID;
  wire [63:0]xdma_0_M_AXI_RDATA;
  wire [3:0]xdma_0_M_AXI_RID;
  wire xdma_0_M_AXI_RLAST;
  wire xdma_0_M_AXI_RREADY;
  wire [1:0]xdma_0_M_AXI_RRESP;
  wire xdma_0_M_AXI_RVALID;
  wire [63:0]xdma_0_M_AXI_WDATA;
  wire xdma_0_M_AXI_WLAST;
  wire xdma_0_M_AXI_WREADY;
  wire [7:0]xdma_0_M_AXI_WSTRB;
  wire xdma_0_M_AXI_WVALID;
  wire xdma_0_axi_aclk;
  wire xdma_0_axi_aresetn;
  wire [63:0]xdma_0_axi_periph_M00_AXI_ARADDR;
  wire xdma_0_axi_periph_M00_AXI_ARREADY;
  wire xdma_0_axi_periph_M00_AXI_ARVALID;
  wire [63:0]xdma_0_axi_periph_M00_AXI_AWADDR;
  wire xdma_0_axi_periph_M00_AXI_AWREADY;
  wire xdma_0_axi_periph_M00_AXI_AWVALID;
  wire xdma_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]xdma_0_axi_periph_M00_AXI_BRESP;
  wire xdma_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]xdma_0_axi_periph_M00_AXI_RDATA;
  wire xdma_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]xdma_0_axi_periph_M00_AXI_RRESP;
  wire xdma_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]xdma_0_axi_periph_M00_AXI_WDATA;
  wire xdma_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]xdma_0_axi_periph_M00_AXI_WSTRB;
  wire xdma_0_axi_periph_M00_AXI_WVALID;
  wire xdma_0_pcie_mgt_rxn;
  wire xdma_0_pcie_mgt_rxp;
  wire [0:0]xdma_0_pcie_mgt_txn;
  wire [0:0]xdma_0_pcie_mgt_txp;
  assign HBM_CATTRIP = gnd_driver_0_dout;
  assign hbm_clk_1_CLK_N = hbm_clk_clk_n;
  assign hbm_clk_1_CLK_P = hbm_clk_clk_p;
  assign pci_express_x1_txn = xdma_0_pcie_mgt_txn;
  assign pci_express_x1_txp = xdma_0_pcie_mgt_txp;
  assign pcie_perstn_1 = pcie_perstn;
  assign pcie_refclk_1_CLK_N = pcie_refclk_clk_n;
  assign pcie_refclk_1_CLK_P = pcie_refclk_clk_p;
  assign xdma_0_pcie_mgt_rxn = pci_express_x1_rxn;
  assign xdma_0_pcie_mgt_rxp = pci_express_x1_rxp;
  assign apb_sys_reset_aux_reset_in = 1'b1;
  assign apb_sys_reset_dcm_locked = 1'b1;
  assign apb_sys_reset_ext_reset_in = xdma_0_axi_aresetn;
  assign apb_sys_reset_mb_debug_sys_rst = 1'b0;
  assign apb_sys_reset_peripheral_aresetn = apb_sys_reset_peripheral_aresetn_1;
  assign apb_sys_reset_slowest_sync_clk = util_ds_buf_0_IBUF_OUT;
  assign axi_register_slice_28_aclk = hbm_axi_clk_clk_out1;
  assign axi_register_slice_28_aresetn = hbm_sys_reset_peripheral_aresetn;
  assign axi_register_slice_28_M_AXI_ARADDR = axi_register_slice_28_m_axi_araddr;
  assign axi_register_slice_28_M_AXI_ARBURST = axi_register_slice_28_m_axi_arburst;
  assign axi_register_slice_28_M_AXI_ARLEN = axi_register_slice_28_m_axi_arlen;
  assign axi_register_slice_28_m_axi_arready = axi_register_slice_28_M_AXI_ARREADY;
  assign axi_register_slice_28_M_AXI_ARSIZE = axi_register_slice_28_m_axi_arsize;
  assign axi_register_slice_28_M_AXI_ARVALID = axi_register_slice_28_m_axi_arvalid;
  assign axi_register_slice_28_M_AXI_AWADDR = axi_register_slice_28_m_axi_awaddr;
  assign axi_register_slice_28_M_AXI_AWBURST = axi_register_slice_28_m_axi_awburst;
  assign axi_register_slice_28_M_AXI_AWLEN = axi_register_slice_28_m_axi_awlen;
  assign axi_register_slice_28_m_axi_awready = axi_register_slice_28_M_AXI_AWREADY;
  assign axi_register_slice_28_M_AXI_AWSIZE = axi_register_slice_28_m_axi_awsize;
  assign axi_register_slice_28_M_AXI_AWVALID = axi_register_slice_28_m_axi_awvalid;
  assign axi_register_slice_28_M_AXI_BREADY = axi_register_slice_28_m_axi_bready;
  assign axi_register_slice_28_m_axi_bresp = axi_register_slice_28_M_AXI_BRESP;
  assign axi_register_slice_28_m_axi_buser = 1'b0;
  assign axi_register_slice_28_m_axi_bvalid = axi_register_slice_28_M_AXI_BVALID;
  assign axi_register_slice_28_m_axi_rdata = axi_register_slice_28_M_AXI_RDATA;
  assign axi_register_slice_28_m_axi_rlast = axi_register_slice_28_M_AXI_RLAST;
  assign axi_register_slice_28_M_AXI_RREADY = axi_register_slice_28_m_axi_rready;
  assign axi_register_slice_28_m_axi_rresp = axi_register_slice_28_M_AXI_RRESP;
  assign axi_register_slice_28_m_axi_rvalid = axi_register_slice_28_M_AXI_RVALID;
  assign axi_register_slice_28_M_AXI_WDATA = axi_register_slice_28_m_axi_wdata;
  assign axi_register_slice_28_M_AXI_WLAST = axi_register_slice_28_m_axi_wlast;
  assign axi_register_slice_28_m_axi_wready = axi_register_slice_28_M_AXI_WREADY;
  assign axi_register_slice_28_M_AXI_WSTRB = axi_register_slice_28_m_axi_wstrb;
  assign axi_register_slice_28_M_AXI_WVALID = axi_register_slice_28_m_axi_wvalid;
  assign axi_register_slice_28_s_axi_araddr = smartconnect_28_M00_AXI_ARADDR;
  assign axi_register_slice_28_s_axi_arburst = smartconnect_28_M00_AXI_ARBURST;
  assign axi_register_slice_28_s_axi_arcache = smartconnect_28_M00_AXI_ARCACHE;
  assign axi_register_slice_28_s_axi_arlen = smartconnect_28_M00_AXI_ARLEN;
  assign axi_register_slice_28_s_axi_arlock = smartconnect_28_M00_AXI_ARLOCK;
  assign axi_register_slice_28_s_axi_arprot = smartconnect_28_M00_AXI_ARPROT;
  assign axi_register_slice_28_s_axi_arqos = smartconnect_28_M00_AXI_ARQOS;
  assign smartconnect_28_M00_AXI_ARREADY = axi_register_slice_28_s_axi_arready;
  assign axi_register_slice_28_s_axi_arsize = smartconnect_28_M00_AXI_ARSIZE;
  assign axi_register_slice_28_s_axi_aruser = smartconnect_28_M00_AXI_ARUSER;
  assign axi_register_slice_28_s_axi_arvalid = smartconnect_28_M00_AXI_ARVALID;
  assign axi_register_slice_28_s_axi_awaddr = smartconnect_28_M00_AXI_AWADDR;
  assign axi_register_slice_28_s_axi_awburst = smartconnect_28_M00_AXI_AWBURST;
  assign axi_register_slice_28_s_axi_awcache = smartconnect_28_M00_AXI_AWCACHE;
  assign axi_register_slice_28_s_axi_awlen = smartconnect_28_M00_AXI_AWLEN;
  assign axi_register_slice_28_s_axi_awlock = smartconnect_28_M00_AXI_AWLOCK;
  assign axi_register_slice_28_s_axi_awprot = smartconnect_28_M00_AXI_AWPROT;
  assign axi_register_slice_28_s_axi_awqos = smartconnect_28_M00_AXI_AWQOS;
  assign smartconnect_28_M00_AXI_AWREADY = axi_register_slice_28_s_axi_awready;
  assign axi_register_slice_28_s_axi_awsize = smartconnect_28_M00_AXI_AWSIZE;
  assign axi_register_slice_28_s_axi_awuser = smartconnect_28_M00_AXI_AWUSER;
  assign axi_register_slice_28_s_axi_awvalid = smartconnect_28_M00_AXI_AWVALID;
  assign axi_register_slice_28_s_axi_bready = smartconnect_28_M00_AXI_BREADY;
  assign smartconnect_28_M00_AXI_BRESP = axi_register_slice_28_s_axi_bresp;
  assign smartconnect_28_M00_AXI_BUSER = axi_register_slice_28_s_axi_buser;
  assign smartconnect_28_M00_AXI_BVALID = axi_register_slice_28_s_axi_bvalid;
  assign smartconnect_28_M00_AXI_RDATA = axi_register_slice_28_s_axi_rdata;
  assign smartconnect_28_M00_AXI_RLAST = axi_register_slice_28_s_axi_rlast;
  assign axi_register_slice_28_s_axi_rready = smartconnect_28_M00_AXI_RREADY;
  assign smartconnect_28_M00_AXI_RRESP = axi_register_slice_28_s_axi_rresp;
  assign smartconnect_28_M00_AXI_RVALID = axi_register_slice_28_s_axi_rvalid;
  assign axi_register_slice_28_s_axi_wdata = smartconnect_28_M00_AXI_WDATA;
  assign axi_register_slice_28_s_axi_wlast = smartconnect_28_M00_AXI_WLAST;
  assign smartconnect_28_M00_AXI_WREADY = axi_register_slice_28_s_axi_wready;
  assign axi_register_slice_28_s_axi_wstrb = smartconnect_28_M00_AXI_WSTRB;
  assign axi_register_slice_28_s_axi_wvalid = smartconnect_28_M00_AXI_WVALID;
  assign axi_register_slice_29_aclk = hbm_axi_clk_clk_out1;
  assign axi_register_slice_29_aresetn = hbm_sys_reset_peripheral_aresetn;
  assign axi_register_slice_29_M_AXI_ARADDR = axi_register_slice_29_m_axi_araddr;
  assign axi_register_slice_29_M_AXI_ARBURST = axi_register_slice_29_m_axi_arburst;
  assign axi_register_slice_29_M_AXI_ARLEN = axi_register_slice_29_m_axi_arlen;
  assign axi_register_slice_29_m_axi_arready = axi_register_slice_29_M_AXI_ARREADY;
  assign axi_register_slice_29_M_AXI_ARSIZE = axi_register_slice_29_m_axi_arsize;
  assign axi_register_slice_29_M_AXI_ARVALID = axi_register_slice_29_m_axi_arvalid;
  assign axi_register_slice_29_M_AXI_AWADDR = axi_register_slice_29_m_axi_awaddr;
  assign axi_register_slice_29_M_AXI_AWBURST = axi_register_slice_29_m_axi_awburst;
  assign axi_register_slice_29_M_AXI_AWLEN = axi_register_slice_29_m_axi_awlen;
  assign axi_register_slice_29_m_axi_awready = axi_register_slice_29_M_AXI_AWREADY;
  assign axi_register_slice_29_M_AXI_AWSIZE = axi_register_slice_29_m_axi_awsize;
  assign axi_register_slice_29_M_AXI_AWVALID = axi_register_slice_29_m_axi_awvalid;
  assign axi_register_slice_29_M_AXI_BREADY = axi_register_slice_29_m_axi_bready;
  assign axi_register_slice_29_m_axi_bresp = axi_register_slice_29_M_AXI_BRESP;
  assign axi_register_slice_29_m_axi_buser = 1'b0;
  assign axi_register_slice_29_m_axi_bvalid = axi_register_slice_29_M_AXI_BVALID;
  assign axi_register_slice_29_m_axi_rdata = axi_register_slice_29_M_AXI_RDATA;
  assign axi_register_slice_29_m_axi_rlast = axi_register_slice_29_M_AXI_RLAST;
  assign axi_register_slice_29_M_AXI_RREADY = axi_register_slice_29_m_axi_rready;
  assign axi_register_slice_29_m_axi_rresp = axi_register_slice_29_M_AXI_RRESP;
  assign axi_register_slice_29_m_axi_rvalid = axi_register_slice_29_M_AXI_RVALID;
  assign axi_register_slice_29_M_AXI_WDATA = axi_register_slice_29_m_axi_wdata;
  assign axi_register_slice_29_M_AXI_WLAST = axi_register_slice_29_m_axi_wlast;
  assign axi_register_slice_29_m_axi_wready = axi_register_slice_29_M_AXI_WREADY;
  assign axi_register_slice_29_M_AXI_WSTRB = axi_register_slice_29_m_axi_wstrb;
  assign axi_register_slice_29_M_AXI_WVALID = axi_register_slice_29_m_axi_wvalid;
  assign axi_register_slice_29_s_axi_araddr = smartconnect_29_M00_AXI_ARADDR;
  assign axi_register_slice_29_s_axi_arburst = smartconnect_29_M00_AXI_ARBURST;
  assign axi_register_slice_29_s_axi_arcache = smartconnect_29_M00_AXI_ARCACHE;
  assign axi_register_slice_29_s_axi_arlen = smartconnect_29_M00_AXI_ARLEN;
  assign axi_register_slice_29_s_axi_arlock = smartconnect_29_M00_AXI_ARLOCK;
  assign axi_register_slice_29_s_axi_arprot = smartconnect_29_M00_AXI_ARPROT;
  assign axi_register_slice_29_s_axi_arqos = smartconnect_29_M00_AXI_ARQOS;
  assign smartconnect_29_M00_AXI_ARREADY = axi_register_slice_29_s_axi_arready;
  assign axi_register_slice_29_s_axi_arsize = smartconnect_29_M00_AXI_ARSIZE;
  assign axi_register_slice_29_s_axi_aruser = smartconnect_29_M00_AXI_ARUSER;
  assign axi_register_slice_29_s_axi_arvalid = smartconnect_29_M00_AXI_ARVALID;
  assign axi_register_slice_29_s_axi_awaddr = smartconnect_29_M00_AXI_AWADDR;
  assign axi_register_slice_29_s_axi_awburst = smartconnect_29_M00_AXI_AWBURST;
  assign axi_register_slice_29_s_axi_awcache = smartconnect_29_M00_AXI_AWCACHE;
  assign axi_register_slice_29_s_axi_awlen = smartconnect_29_M00_AXI_AWLEN;
  assign axi_register_slice_29_s_axi_awlock = smartconnect_29_M00_AXI_AWLOCK;
  assign axi_register_slice_29_s_axi_awprot = smartconnect_29_M00_AXI_AWPROT;
  assign axi_register_slice_29_s_axi_awqos = smartconnect_29_M00_AXI_AWQOS;
  assign smartconnect_29_M00_AXI_AWREADY = axi_register_slice_29_s_axi_awready;
  assign axi_register_slice_29_s_axi_awsize = smartconnect_29_M00_AXI_AWSIZE;
  assign axi_register_slice_29_s_axi_awuser = smartconnect_29_M00_AXI_AWUSER;
  assign axi_register_slice_29_s_axi_awvalid = smartconnect_29_M00_AXI_AWVALID;
  assign axi_register_slice_29_s_axi_bready = smartconnect_29_M00_AXI_BREADY;
  assign smartconnect_29_M00_AXI_BRESP = axi_register_slice_29_s_axi_bresp;
  assign smartconnect_29_M00_AXI_BUSER = axi_register_slice_29_s_axi_buser;
  assign smartconnect_29_M00_AXI_BVALID = axi_register_slice_29_s_axi_bvalid;
  assign smartconnect_29_M00_AXI_RDATA = axi_register_slice_29_s_axi_rdata;
  assign smartconnect_29_M00_AXI_RLAST = axi_register_slice_29_s_axi_rlast;
  assign axi_register_slice_29_s_axi_rready = smartconnect_29_M00_AXI_RREADY;
  assign smartconnect_29_M00_AXI_RRESP = axi_register_slice_29_s_axi_rresp;
  assign smartconnect_29_M00_AXI_RVALID = axi_register_slice_29_s_axi_rvalid;
  assign axi_register_slice_29_s_axi_wdata = smartconnect_29_M00_AXI_WDATA;
  assign axi_register_slice_29_s_axi_wlast = smartconnect_29_M00_AXI_WLAST;
  assign smartconnect_29_M00_AXI_WREADY = axi_register_slice_29_s_axi_wready;
  assign axi_register_slice_29_s_axi_wstrb = smartconnect_29_M00_AXI_WSTRB;
  assign axi_register_slice_29_s_axi_wvalid = smartconnect_29_M00_AXI_WVALID;
  assign axi_register_slice_30_aclk = hbm_axi_clk_clk_out1;
  assign axi_register_slice_30_aresetn = hbm_sys_reset_peripheral_aresetn;
  assign axi_register_slice_30_M_AXI_ARADDR = axi_register_slice_30_m_axi_araddr;
  assign axi_register_slice_30_M_AXI_ARBURST = axi_register_slice_30_m_axi_arburst;
  assign axi_register_slice_30_M_AXI_ARLEN = axi_register_slice_30_m_axi_arlen;
  assign axi_register_slice_30_m_axi_arready = axi_register_slice_30_M_AXI_ARREADY;
  assign axi_register_slice_30_M_AXI_ARSIZE = axi_register_slice_30_m_axi_arsize;
  assign axi_register_slice_30_M_AXI_ARVALID = axi_register_slice_30_m_axi_arvalid;
  assign axi_register_slice_30_M_AXI_AWADDR = axi_register_slice_30_m_axi_awaddr;
  assign axi_register_slice_30_M_AXI_AWBURST = axi_register_slice_30_m_axi_awburst;
  assign axi_register_slice_30_M_AXI_AWLEN = axi_register_slice_30_m_axi_awlen;
  assign axi_register_slice_30_m_axi_awready = axi_register_slice_30_M_AXI_AWREADY;
  assign axi_register_slice_30_M_AXI_AWSIZE = axi_register_slice_30_m_axi_awsize;
  assign axi_register_slice_30_M_AXI_AWVALID = axi_register_slice_30_m_axi_awvalid;
  assign axi_register_slice_30_M_AXI_BREADY = axi_register_slice_30_m_axi_bready;
  assign axi_register_slice_30_m_axi_bresp = axi_register_slice_30_M_AXI_BRESP;
  assign axi_register_slice_30_m_axi_buser = 1'b0;
  assign axi_register_slice_30_m_axi_bvalid = axi_register_slice_30_M_AXI_BVALID;
  assign axi_register_slice_30_m_axi_rdata = axi_register_slice_30_M_AXI_RDATA;
  assign axi_register_slice_30_m_axi_rlast = axi_register_slice_30_M_AXI_RLAST;
  assign axi_register_slice_30_M_AXI_RREADY = axi_register_slice_30_m_axi_rready;
  assign axi_register_slice_30_m_axi_rresp = axi_register_slice_30_M_AXI_RRESP;
  assign axi_register_slice_30_m_axi_rvalid = axi_register_slice_30_M_AXI_RVALID;
  assign axi_register_slice_30_M_AXI_WDATA = axi_register_slice_30_m_axi_wdata;
  assign axi_register_slice_30_M_AXI_WLAST = axi_register_slice_30_m_axi_wlast;
  assign axi_register_slice_30_m_axi_wready = axi_register_slice_30_M_AXI_WREADY;
  assign axi_register_slice_30_M_AXI_WSTRB = axi_register_slice_30_m_axi_wstrb;
  assign axi_register_slice_30_M_AXI_WVALID = axi_register_slice_30_m_axi_wvalid;
  assign axi_register_slice_30_s_axi_araddr = smartconnect_30_M00_AXI_ARADDR;
  assign axi_register_slice_30_s_axi_arburst = smartconnect_30_M00_AXI_ARBURST;
  assign axi_register_slice_30_s_axi_arcache = smartconnect_30_M00_AXI_ARCACHE;
  assign axi_register_slice_30_s_axi_arlen = smartconnect_30_M00_AXI_ARLEN;
  assign axi_register_slice_30_s_axi_arlock = smartconnect_30_M00_AXI_ARLOCK;
  assign axi_register_slice_30_s_axi_arprot = smartconnect_30_M00_AXI_ARPROT;
  assign axi_register_slice_30_s_axi_arqos = smartconnect_30_M00_AXI_ARQOS;
  assign smartconnect_30_M00_AXI_ARREADY = axi_register_slice_30_s_axi_arready;
  assign axi_register_slice_30_s_axi_arsize = smartconnect_30_M00_AXI_ARSIZE;
  assign axi_register_slice_30_s_axi_aruser = smartconnect_30_M00_AXI_ARUSER;
  assign axi_register_slice_30_s_axi_arvalid = smartconnect_30_M00_AXI_ARVALID;
  assign axi_register_slice_30_s_axi_awaddr = smartconnect_30_M00_AXI_AWADDR;
  assign axi_register_slice_30_s_axi_awburst = smartconnect_30_M00_AXI_AWBURST;
  assign axi_register_slice_30_s_axi_awcache = smartconnect_30_M00_AXI_AWCACHE;
  assign axi_register_slice_30_s_axi_awlen = smartconnect_30_M00_AXI_AWLEN;
  assign axi_register_slice_30_s_axi_awlock = smartconnect_30_M00_AXI_AWLOCK;
  assign axi_register_slice_30_s_axi_awprot = smartconnect_30_M00_AXI_AWPROT;
  assign axi_register_slice_30_s_axi_awqos = smartconnect_30_M00_AXI_AWQOS;
  assign smartconnect_30_M00_AXI_AWREADY = axi_register_slice_30_s_axi_awready;
  assign axi_register_slice_30_s_axi_awsize = smartconnect_30_M00_AXI_AWSIZE;
  assign axi_register_slice_30_s_axi_awuser = smartconnect_30_M00_AXI_AWUSER;
  assign axi_register_slice_30_s_axi_awvalid = smartconnect_30_M00_AXI_AWVALID;
  assign axi_register_slice_30_s_axi_bready = smartconnect_30_M00_AXI_BREADY;
  assign smartconnect_30_M00_AXI_BRESP = axi_register_slice_30_s_axi_bresp;
  assign smartconnect_30_M00_AXI_BUSER = axi_register_slice_30_s_axi_buser;
  assign smartconnect_30_M00_AXI_BVALID = axi_register_slice_30_s_axi_bvalid;
  assign smartconnect_30_M00_AXI_RDATA = axi_register_slice_30_s_axi_rdata;
  assign smartconnect_30_M00_AXI_RLAST = axi_register_slice_30_s_axi_rlast;
  assign axi_register_slice_30_s_axi_rready = smartconnect_30_M00_AXI_RREADY;
  assign smartconnect_30_M00_AXI_RRESP = axi_register_slice_30_s_axi_rresp;
  assign smartconnect_30_M00_AXI_RVALID = axi_register_slice_30_s_axi_rvalid;
  assign axi_register_slice_30_s_axi_wdata = smartconnect_30_M00_AXI_WDATA;
  assign axi_register_slice_30_s_axi_wlast = smartconnect_30_M00_AXI_WLAST;
  assign smartconnect_30_M00_AXI_WREADY = axi_register_slice_30_s_axi_wready;
  assign axi_register_slice_30_s_axi_wstrb = smartconnect_30_M00_AXI_WSTRB;
  assign axi_register_slice_30_s_axi_wvalid = smartconnect_30_M00_AXI_WVALID;
  assign axi_register_slice_31_aclk = hbm_axi_clk_clk_out1;
  assign axi_register_slice_31_aresetn = hbm_sys_reset_peripheral_aresetn;
  assign axi_register_slice_31_M_AXI_ARADDR = axi_register_slice_31_m_axi_araddr;
  assign axi_register_slice_31_M_AXI_ARBURST = axi_register_slice_31_m_axi_arburst;
  assign axi_register_slice_31_M_AXI_ARLEN = axi_register_slice_31_m_axi_arlen;
  assign axi_register_slice_31_m_axi_arready = axi_register_slice_31_M_AXI_ARREADY;
  assign axi_register_slice_31_M_AXI_ARSIZE = axi_register_slice_31_m_axi_arsize;
  assign axi_register_slice_31_M_AXI_ARVALID = axi_register_slice_31_m_axi_arvalid;
  assign axi_register_slice_31_M_AXI_AWADDR = axi_register_slice_31_m_axi_awaddr;
  assign axi_register_slice_31_M_AXI_AWBURST = axi_register_slice_31_m_axi_awburst;
  assign axi_register_slice_31_M_AXI_AWLEN = axi_register_slice_31_m_axi_awlen;
  assign axi_register_slice_31_m_axi_awready = axi_register_slice_31_M_AXI_AWREADY;
  assign axi_register_slice_31_M_AXI_AWSIZE = axi_register_slice_31_m_axi_awsize;
  assign axi_register_slice_31_M_AXI_AWVALID = axi_register_slice_31_m_axi_awvalid;
  assign axi_register_slice_31_M_AXI_BREADY = axi_register_slice_31_m_axi_bready;
  assign axi_register_slice_31_m_axi_bresp = axi_register_slice_31_M_AXI_BRESP;
  assign axi_register_slice_31_m_axi_bvalid = axi_register_slice_31_M_AXI_BVALID;
  assign axi_register_slice_31_m_axi_rdata = axi_register_slice_31_M_AXI_RDATA;
  assign axi_register_slice_31_m_axi_rlast = axi_register_slice_31_M_AXI_RLAST;
  assign axi_register_slice_31_M_AXI_RREADY = axi_register_slice_31_m_axi_rready;
  assign axi_register_slice_31_m_axi_rresp = axi_register_slice_31_M_AXI_RRESP;
  assign axi_register_slice_31_m_axi_rvalid = axi_register_slice_31_M_AXI_RVALID;
  assign axi_register_slice_31_M_AXI_WDATA = axi_register_slice_31_m_axi_wdata;
  assign axi_register_slice_31_M_AXI_WLAST = axi_register_slice_31_m_axi_wlast;
  assign axi_register_slice_31_m_axi_wready = axi_register_slice_31_M_AXI_WREADY;
  assign axi_register_slice_31_M_AXI_WSTRB = axi_register_slice_31_m_axi_wstrb;
  assign axi_register_slice_31_M_AXI_WVALID = axi_register_slice_31_m_axi_wvalid;
  assign axi_register_slice_31_s_axi_araddr = smartconnect_31_M00_AXI_ARADDR;
  assign axi_register_slice_31_s_axi_arburst = smartconnect_31_M00_AXI_ARBURST;
  assign axi_register_slice_31_s_axi_arcache = smartconnect_31_M00_AXI_ARCACHE;
  assign axi_register_slice_31_s_axi_arlen = smartconnect_31_M00_AXI_ARLEN;
  assign axi_register_slice_31_s_axi_arlock = smartconnect_31_M00_AXI_ARLOCK;
  assign axi_register_slice_31_s_axi_arprot = smartconnect_31_M00_AXI_ARPROT;
  assign axi_register_slice_31_s_axi_arqos = smartconnect_31_M00_AXI_ARQOS;
  assign smartconnect_31_M00_AXI_ARREADY = axi_register_slice_31_s_axi_arready;
  assign axi_register_slice_31_s_axi_arsize = smartconnect_31_M00_AXI_ARSIZE;
  assign axi_register_slice_31_s_axi_arvalid = smartconnect_31_M00_AXI_ARVALID;
  assign axi_register_slice_31_s_axi_awaddr = smartconnect_31_M00_AXI_AWADDR;
  assign axi_register_slice_31_s_axi_awburst = smartconnect_31_M00_AXI_AWBURST;
  assign axi_register_slice_31_s_axi_awcache = smartconnect_31_M00_AXI_AWCACHE;
  assign axi_register_slice_31_s_axi_awlen = smartconnect_31_M00_AXI_AWLEN;
  assign axi_register_slice_31_s_axi_awlock = smartconnect_31_M00_AXI_AWLOCK;
  assign axi_register_slice_31_s_axi_awprot = smartconnect_31_M00_AXI_AWPROT;
  assign axi_register_slice_31_s_axi_awqos = smartconnect_31_M00_AXI_AWQOS;
  assign smartconnect_31_M00_AXI_AWREADY = axi_register_slice_31_s_axi_awready;
  assign axi_register_slice_31_s_axi_awsize = smartconnect_31_M00_AXI_AWSIZE;
  assign axi_register_slice_31_s_axi_awvalid = smartconnect_31_M00_AXI_AWVALID;
  assign axi_register_slice_31_s_axi_bready = smartconnect_31_M00_AXI_BREADY;
  assign smartconnect_31_M00_AXI_BRESP = axi_register_slice_31_s_axi_bresp;
  assign smartconnect_31_M00_AXI_BVALID = axi_register_slice_31_s_axi_bvalid;
  assign smartconnect_31_M00_AXI_RDATA = axi_register_slice_31_s_axi_rdata;
  assign smartconnect_31_M00_AXI_RLAST = axi_register_slice_31_s_axi_rlast;
  assign axi_register_slice_31_s_axi_rready = smartconnect_31_M00_AXI_RREADY;
  assign smartconnect_31_M00_AXI_RRESP = axi_register_slice_31_s_axi_rresp;
  assign smartconnect_31_M00_AXI_RVALID = axi_register_slice_31_s_axi_rvalid;
  assign axi_register_slice_31_s_axi_wdata = smartconnect_31_M00_AXI_WDATA;
  assign axi_register_slice_31_s_axi_wlast = smartconnect_31_M00_AXI_WLAST;
  assign smartconnect_31_M00_AXI_WREADY = axi_register_slice_31_s_axi_wready;
  assign axi_register_slice_31_s_axi_wstrb = smartconnect_31_M00_AXI_WSTRB;
  assign axi_register_slice_31_s_axi_wvalid = smartconnect_31_M00_AXI_WVALID;
  assign gnd_driver_0_clk = xdma_0_axi_aclk;
  assign gnd_driver_0_dout = gnd_driver_0_dout_1;
  assign gnd_driver_0_rst_n = xdma_0_axi_aresetn;
  assign hbm_0_APB_0_PCLK = util_ds_buf_0_IBUF_OUT;
  assign hbm_0_APB_0_PRESET_N = apb_sys_reset_peripheral_aresetn;
  assign hbm_0_AXI_12_ACLK = hbm_axi_clk_clk_out1;
  assign hbm_0_AXI_12_ARADDR = axi_register_slice_28_M_AXI_ARADDR;
  assign hbm_0_AXI_12_ARBURST = axi_register_slice_28_M_AXI_ARBURST;
  assign hbm_0_AXI_12_ARESET_N = hbm_sys_reset_peripheral_aresetn;
  assign hbm_0_AXI_12_ARID = 0;
  assign hbm_0_AXI_12_ARLEN = axi_register_slice_28_M_AXI_ARLEN;
  assign axi_register_slice_28_M_AXI_ARREADY = hbm_0_AXI_12_ARREADY;
  assign hbm_0_AXI_12_ARSIZE = axi_register_slice_28_M_AXI_ARSIZE;
  assign hbm_0_AXI_12_ARVALID = axi_register_slice_28_M_AXI_ARVALID;
  assign hbm_0_AXI_12_AWADDR = axi_register_slice_28_M_AXI_AWADDR;
  assign hbm_0_AXI_12_AWBURST = axi_register_slice_28_M_AXI_AWBURST;
  assign hbm_0_AXI_12_AWID = 0;
  assign hbm_0_AXI_12_AWLEN = axi_register_slice_28_M_AXI_AWLEN;
  assign axi_register_slice_28_M_AXI_AWREADY = hbm_0_AXI_12_AWREADY;
  assign hbm_0_AXI_12_AWSIZE = axi_register_slice_28_M_AXI_AWSIZE;
  assign hbm_0_AXI_12_AWVALID = axi_register_slice_28_M_AXI_AWVALID;
  assign hbm_0_AXI_12_BREADY = axi_register_slice_28_M_AXI_BREADY;
  assign axi_register_slice_28_M_AXI_BRESP = hbm_0_AXI_12_BRESP;
  assign axi_register_slice_28_M_AXI_BVALID = hbm_0_AXI_12_BVALID;
  assign axi_register_slice_28_M_AXI_RDATA = hbm_0_AXI_12_RDATA;
  assign axi_register_slice_28_M_AXI_RLAST = hbm_0_AXI_12_RLAST;
  assign hbm_0_AXI_12_RREADY = axi_register_slice_28_M_AXI_RREADY;
  assign axi_register_slice_28_M_AXI_RRESP = hbm_0_AXI_12_RRESP;
  assign axi_register_slice_28_M_AXI_RVALID = hbm_0_AXI_12_RVALID;
  assign hbm_0_AXI_12_WDATA = axi_register_slice_28_M_AXI_WDATA;
  assign hbm_0_AXI_12_WDATA_PARITY = 0;
  assign hbm_0_AXI_12_WLAST = axi_register_slice_28_M_AXI_WLAST;
  assign axi_register_slice_28_M_AXI_WREADY = hbm_0_AXI_12_WREADY;
  assign hbm_0_AXI_12_WSTRB = axi_register_slice_28_M_AXI_WSTRB;
  assign hbm_0_AXI_12_WVALID = axi_register_slice_28_M_AXI_WVALID;
  assign hbm_0_AXI_13_ACLK = hbm_axi_clk_clk_out1;
  assign hbm_0_AXI_13_ARADDR = axi_register_slice_29_M_AXI_ARADDR;
  assign hbm_0_AXI_13_ARBURST = axi_register_slice_29_M_AXI_ARBURST;
  assign hbm_0_AXI_13_ARESET_N = hbm_sys_reset_peripheral_aresetn;
  assign hbm_0_AXI_13_ARID = 0;
  assign hbm_0_AXI_13_ARLEN = axi_register_slice_29_M_AXI_ARLEN;
  assign axi_register_slice_29_M_AXI_ARREADY = hbm_0_AXI_13_ARREADY;
  assign hbm_0_AXI_13_ARSIZE = axi_register_slice_29_M_AXI_ARSIZE;
  assign hbm_0_AXI_13_ARVALID = axi_register_slice_29_M_AXI_ARVALID;
  assign hbm_0_AXI_13_AWADDR = axi_register_slice_29_M_AXI_AWADDR;
  assign hbm_0_AXI_13_AWBURST = axi_register_slice_29_M_AXI_AWBURST;
  assign hbm_0_AXI_13_AWID = 0;
  assign hbm_0_AXI_13_AWLEN = axi_register_slice_29_M_AXI_AWLEN;
  assign axi_register_slice_29_M_AXI_AWREADY = hbm_0_AXI_13_AWREADY;
  assign hbm_0_AXI_13_AWSIZE = axi_register_slice_29_M_AXI_AWSIZE;
  assign hbm_0_AXI_13_AWVALID = axi_register_slice_29_M_AXI_AWVALID;
  assign hbm_0_AXI_13_BREADY = axi_register_slice_29_M_AXI_BREADY;
  assign axi_register_slice_29_M_AXI_BRESP = hbm_0_AXI_13_BRESP;
  assign axi_register_slice_29_M_AXI_BVALID = hbm_0_AXI_13_BVALID;
  assign axi_register_slice_29_M_AXI_RDATA = hbm_0_AXI_13_RDATA;
  assign axi_register_slice_29_M_AXI_RLAST = hbm_0_AXI_13_RLAST;
  assign hbm_0_AXI_13_RREADY = axi_register_slice_29_M_AXI_RREADY;
  assign axi_register_slice_29_M_AXI_RRESP = hbm_0_AXI_13_RRESP;
  assign axi_register_slice_29_M_AXI_RVALID = hbm_0_AXI_13_RVALID;
  assign hbm_0_AXI_13_WDATA = axi_register_slice_29_M_AXI_WDATA;
  assign hbm_0_AXI_13_WDATA_PARITY = 0;
  assign hbm_0_AXI_13_WLAST = axi_register_slice_29_M_AXI_WLAST;
  assign axi_register_slice_29_M_AXI_WREADY = hbm_0_AXI_13_WREADY;
  assign hbm_0_AXI_13_WSTRB = axi_register_slice_29_M_AXI_WSTRB;
  assign hbm_0_AXI_13_WVALID = axi_register_slice_29_M_AXI_WVALID;
  assign hbm_0_AXI_14_ACLK = hbm_axi_clk_clk_out1;
  assign hbm_0_AXI_14_ARADDR = axi_register_slice_30_M_AXI_ARADDR;
  assign hbm_0_AXI_14_ARBURST = axi_register_slice_30_M_AXI_ARBURST;
  assign hbm_0_AXI_14_ARESET_N = hbm_sys_reset_peripheral_aresetn;
  assign hbm_0_AXI_14_ARID = 0;
  assign hbm_0_AXI_14_ARLEN = axi_register_slice_30_M_AXI_ARLEN;
  assign axi_register_slice_30_M_AXI_ARREADY = hbm_0_AXI_14_ARREADY;
  assign hbm_0_AXI_14_ARSIZE = axi_register_slice_30_M_AXI_ARSIZE;
  assign hbm_0_AXI_14_ARVALID = axi_register_slice_30_M_AXI_ARVALID;
  assign hbm_0_AXI_14_AWADDR = axi_register_slice_30_M_AXI_AWADDR;
  assign hbm_0_AXI_14_AWBURST = axi_register_slice_30_M_AXI_AWBURST;
  assign hbm_0_AXI_14_AWID = 0;
  assign hbm_0_AXI_14_AWLEN = axi_register_slice_30_M_AXI_AWLEN;
  assign axi_register_slice_30_M_AXI_AWREADY = hbm_0_AXI_14_AWREADY;
  assign hbm_0_AXI_14_AWSIZE = axi_register_slice_30_M_AXI_AWSIZE;
  assign hbm_0_AXI_14_AWVALID = axi_register_slice_30_M_AXI_AWVALID;
  assign hbm_0_AXI_14_BREADY = axi_register_slice_30_M_AXI_BREADY;
  assign axi_register_slice_30_M_AXI_BRESP = hbm_0_AXI_14_BRESP;
  assign axi_register_slice_30_M_AXI_BVALID = hbm_0_AXI_14_BVALID;
  assign axi_register_slice_30_M_AXI_RDATA = hbm_0_AXI_14_RDATA;
  assign axi_register_slice_30_M_AXI_RLAST = hbm_0_AXI_14_RLAST;
  assign hbm_0_AXI_14_RREADY = axi_register_slice_30_M_AXI_RREADY;
  assign axi_register_slice_30_M_AXI_RRESP = hbm_0_AXI_14_RRESP;
  assign axi_register_slice_30_M_AXI_RVALID = hbm_0_AXI_14_RVALID;
  assign hbm_0_AXI_14_WDATA = axi_register_slice_30_M_AXI_WDATA;
  assign hbm_0_AXI_14_WDATA_PARITY = 0;
  assign hbm_0_AXI_14_WLAST = axi_register_slice_30_M_AXI_WLAST;
  assign axi_register_slice_30_M_AXI_WREADY = hbm_0_AXI_14_WREADY;
  assign hbm_0_AXI_14_WSTRB = axi_register_slice_30_M_AXI_WSTRB;
  assign hbm_0_AXI_14_WVALID = axi_register_slice_30_M_AXI_WVALID;
  assign hbm_0_AXI_15_ACLK = hbm_axi_clk_clk_out1;
  assign hbm_0_AXI_15_ARADDR = axi_register_slice_31_M_AXI_ARADDR;
  assign hbm_0_AXI_15_ARBURST = axi_register_slice_31_M_AXI_ARBURST;
  assign hbm_0_AXI_15_ARESET_N = hbm_sys_reset_peripheral_aresetn;
  assign hbm_0_AXI_15_ARID = 0;
  assign hbm_0_AXI_15_ARLEN = axi_register_slice_31_M_AXI_ARLEN;
  assign axi_register_slice_31_M_AXI_ARREADY = hbm_0_AXI_15_ARREADY;
  assign hbm_0_AXI_15_ARSIZE = axi_register_slice_31_M_AXI_ARSIZE;
  assign hbm_0_AXI_15_ARVALID = axi_register_slice_31_M_AXI_ARVALID;
  assign hbm_0_AXI_15_AWADDR = axi_register_slice_31_M_AXI_AWADDR;
  assign hbm_0_AXI_15_AWBURST = axi_register_slice_31_M_AXI_AWBURST;
  assign hbm_0_AXI_15_AWID = 0;
  assign hbm_0_AXI_15_AWLEN = axi_register_slice_31_M_AXI_AWLEN;
  assign axi_register_slice_31_M_AXI_AWREADY = hbm_0_AXI_15_AWREADY;
  assign hbm_0_AXI_15_AWSIZE = axi_register_slice_31_M_AXI_AWSIZE;
  assign hbm_0_AXI_15_AWVALID = axi_register_slice_31_M_AXI_AWVALID;
  assign hbm_0_AXI_15_BREADY = axi_register_slice_31_M_AXI_BREADY;
  assign axi_register_slice_31_M_AXI_BRESP = hbm_0_AXI_15_BRESP;
  assign axi_register_slice_31_M_AXI_BVALID = hbm_0_AXI_15_BVALID;
  assign axi_register_slice_31_M_AXI_RDATA = hbm_0_AXI_15_RDATA;
  assign axi_register_slice_31_M_AXI_RLAST = hbm_0_AXI_15_RLAST;
  assign hbm_0_AXI_15_RREADY = axi_register_slice_31_M_AXI_RREADY;
  assign axi_register_slice_31_M_AXI_RRESP = hbm_0_AXI_15_RRESP;
  assign axi_register_slice_31_M_AXI_RVALID = hbm_0_AXI_15_RVALID;
  assign hbm_0_AXI_15_WDATA = axi_register_slice_31_M_AXI_WDATA;
  assign hbm_0_AXI_15_WDATA_PARITY = 0;
  assign hbm_0_AXI_15_WLAST = axi_register_slice_31_M_AXI_WLAST;
  assign axi_register_slice_31_M_AXI_WREADY = hbm_0_AXI_15_WREADY;
  assign hbm_0_AXI_15_WSTRB = axi_register_slice_31_M_AXI_WSTRB;
  assign hbm_0_AXI_15_WVALID = axi_register_slice_31_M_AXI_WVALID;
  assign hbm_0_HBM_REF_CLK_0 = util_ds_buf_0_IBUF_OUT;
  assign hbm_axi_clk_clk_in1 = xdma_0_axi_aclk;
  assign hbm_axi_clk_clk_out1 = hbm_axi_clk_clk_out1_1;
  assign hbm_axi_clk_locked = hbm_axi_clk_locked_1;
  assign hbm_axi_clk_resetn = xdma_0_axi_aresetn;
  assign hbm_sys_reset_aux_reset_in = 1'b1;
  assign hbm_sys_reset_dcm_locked = hbm_axi_clk_locked;
  assign hbm_sys_reset_ext_reset_in = xdma_0_axi_aresetn;
  assign hbm_sys_reset_mb_debug_sys_rst = 1'b0;
  assign hbm_sys_reset_peripheral_aresetn = hbm_sys_reset_peripheral_aresetn_1;
  assign hbm_sys_reset_slowest_sync_clk = hbm_axi_clk_clk_out1;
  assign kernel3_0_ap_clk = kernel_clk_clk_out1;
  assign kernel3_0_ap_rst_n = kernel_sys_reset_peripheral_aresetn;
  assign kernel3_0_m_axi_gmem_A_ARADDR = kernel3_0_m_axi_gmem_A_ARADDR_1;
  assign kernel3_0_m_axi_gmem_A_ARBURST = kernel3_0_m_axi_gmem_A_ARBURST_1;
  assign kernel3_0_m_axi_gmem_A_ARCACHE = kernel3_0_m_axi_gmem_A_ARCACHE_1;
  assign kernel3_0_m_axi_gmem_A_ARID = kernel3_0_m_axi_gmem_A_ARID_1;
  assign kernel3_0_m_axi_gmem_A_ARLEN = kernel3_0_m_axi_gmem_A_ARLEN_1;
  assign kernel3_0_m_axi_gmem_A_ARLOCK = kernel3_0_m_axi_gmem_A_ARLOCK_1;
  assign kernel3_0_m_axi_gmem_A_ARPROT = kernel3_0_m_axi_gmem_A_ARPROT_1;
  assign kernel3_0_m_axi_gmem_A_ARQOS = kernel3_0_m_axi_gmem_A_ARQOS_1;
  assign kernel3_0_m_axi_gmem_A_ARREADY_1 = kernel3_0_m_axi_gmem_A_ARREADY;
  assign kernel3_0_m_axi_gmem_A_ARSIZE = kernel3_0_m_axi_gmem_A_ARSIZE_1;
  assign kernel3_0_m_axi_gmem_A_ARUSER = kernel3_0_m_axi_gmem_A_ARUSER_1;
  assign kernel3_0_m_axi_gmem_A_ARVALID = kernel3_0_m_axi_gmem_A_ARVALID_1;
  assign kernel3_0_m_axi_gmem_A_AWADDR = kernel3_0_m_axi_gmem_A_AWADDR_1;
  assign kernel3_0_m_axi_gmem_A_AWBURST = kernel3_0_m_axi_gmem_A_AWBURST_1;
  assign kernel3_0_m_axi_gmem_A_AWCACHE = kernel3_0_m_axi_gmem_A_AWCACHE_1;
  assign kernel3_0_m_axi_gmem_A_AWID = kernel3_0_m_axi_gmem_A_AWID_1;
  assign kernel3_0_m_axi_gmem_A_AWLEN = kernel3_0_m_axi_gmem_A_AWLEN_1;
  assign kernel3_0_m_axi_gmem_A_AWLOCK = kernel3_0_m_axi_gmem_A_AWLOCK_1;
  assign kernel3_0_m_axi_gmem_A_AWPROT = kernel3_0_m_axi_gmem_A_AWPROT_1;
  assign kernel3_0_m_axi_gmem_A_AWQOS = kernel3_0_m_axi_gmem_A_AWQOS_1;
  assign kernel3_0_m_axi_gmem_A_AWREADY_1 = kernel3_0_m_axi_gmem_A_AWREADY;
  assign kernel3_0_m_axi_gmem_A_AWSIZE = kernel3_0_m_axi_gmem_A_AWSIZE_1;
  assign kernel3_0_m_axi_gmem_A_AWUSER = kernel3_0_m_axi_gmem_A_AWUSER_1;
  assign kernel3_0_m_axi_gmem_A_AWVALID = kernel3_0_m_axi_gmem_A_AWVALID_1;
  assign kernel3_0_m_axi_gmem_A_BID_1 = kernel3_0_m_axi_gmem_A_BID;
  assign kernel3_0_m_axi_gmem_A_BREADY = kernel3_0_m_axi_gmem_A_BREADY_1;
  assign kernel3_0_m_axi_gmem_A_BRESP_1 = kernel3_0_m_axi_gmem_A_BRESP;
  assign kernel3_0_m_axi_gmem_A_BUSER_1 = kernel3_0_m_axi_gmem_A_BUSER;
  assign kernel3_0_m_axi_gmem_A_BVALID_1 = kernel3_0_m_axi_gmem_A_BVALID;
  assign kernel3_0_m_axi_gmem_A_RDATA_1 = kernel3_0_m_axi_gmem_A_RDATA;
  assign kernel3_0_m_axi_gmem_A_RID_1 = kernel3_0_m_axi_gmem_A_RID;
  assign kernel3_0_m_axi_gmem_A_RLAST_1 = kernel3_0_m_axi_gmem_A_RLAST;
  assign kernel3_0_m_axi_gmem_A_RREADY = kernel3_0_m_axi_gmem_A_RREADY_1;
  assign kernel3_0_m_axi_gmem_A_RRESP_1 = kernel3_0_m_axi_gmem_A_RRESP;
  assign kernel3_0_m_axi_gmem_A_RUSER = 1'b0;
  assign kernel3_0_m_axi_gmem_A_RVALID_1 = kernel3_0_m_axi_gmem_A_RVALID;
  assign kernel3_0_m_axi_gmem_A_WDATA = kernel3_0_m_axi_gmem_A_WDATA_1;
  assign kernel3_0_m_axi_gmem_A_WLAST = kernel3_0_m_axi_gmem_A_WLAST_1;
  assign kernel3_0_m_axi_gmem_A_WREADY_1 = kernel3_0_m_axi_gmem_A_WREADY;
  assign kernel3_0_m_axi_gmem_A_WSTRB = kernel3_0_m_axi_gmem_A_WSTRB_1;
  assign kernel3_0_m_axi_gmem_A_WVALID = kernel3_0_m_axi_gmem_A_WVALID_1;
  assign kernel3_0_m_axi_gmem_B_ARADDR = kernel3_0_m_axi_gmem_B_ARADDR_1;
  assign kernel3_0_m_axi_gmem_B_ARBURST = kernel3_0_m_axi_gmem_B_ARBURST_1;
  assign kernel3_0_m_axi_gmem_B_ARCACHE = kernel3_0_m_axi_gmem_B_ARCACHE_1;
  assign kernel3_0_m_axi_gmem_B_ARID = kernel3_0_m_axi_gmem_B_ARID_1;
  assign kernel3_0_m_axi_gmem_B_ARLEN = kernel3_0_m_axi_gmem_B_ARLEN_1;
  assign kernel3_0_m_axi_gmem_B_ARLOCK = kernel3_0_m_axi_gmem_B_ARLOCK_1;
  assign kernel3_0_m_axi_gmem_B_ARPROT = kernel3_0_m_axi_gmem_B_ARPROT_1;
  assign kernel3_0_m_axi_gmem_B_ARQOS = kernel3_0_m_axi_gmem_B_ARQOS_1;
  assign kernel3_0_m_axi_gmem_B_ARREADY_1 = kernel3_0_m_axi_gmem_B_ARREADY;
  assign kernel3_0_m_axi_gmem_B_ARSIZE = kernel3_0_m_axi_gmem_B_ARSIZE_1;
  assign kernel3_0_m_axi_gmem_B_ARUSER = kernel3_0_m_axi_gmem_B_ARUSER_1;
  assign kernel3_0_m_axi_gmem_B_ARVALID = kernel3_0_m_axi_gmem_B_ARVALID_1;
  assign kernel3_0_m_axi_gmem_B_AWADDR = kernel3_0_m_axi_gmem_B_AWADDR_1;
  assign kernel3_0_m_axi_gmem_B_AWBURST = kernel3_0_m_axi_gmem_B_AWBURST_1;
  assign kernel3_0_m_axi_gmem_B_AWCACHE = kernel3_0_m_axi_gmem_B_AWCACHE_1;
  assign kernel3_0_m_axi_gmem_B_AWID = kernel3_0_m_axi_gmem_B_AWID_1;
  assign kernel3_0_m_axi_gmem_B_AWLEN = kernel3_0_m_axi_gmem_B_AWLEN_1;
  assign kernel3_0_m_axi_gmem_B_AWLOCK = kernel3_0_m_axi_gmem_B_AWLOCK_1;
  assign kernel3_0_m_axi_gmem_B_AWPROT = kernel3_0_m_axi_gmem_B_AWPROT_1;
  assign kernel3_0_m_axi_gmem_B_AWQOS = kernel3_0_m_axi_gmem_B_AWQOS_1;
  assign kernel3_0_m_axi_gmem_B_AWREADY_1 = kernel3_0_m_axi_gmem_B_AWREADY;
  assign kernel3_0_m_axi_gmem_B_AWSIZE = kernel3_0_m_axi_gmem_B_AWSIZE_1;
  assign kernel3_0_m_axi_gmem_B_AWUSER = kernel3_0_m_axi_gmem_B_AWUSER_1;
  assign kernel3_0_m_axi_gmem_B_AWVALID = kernel3_0_m_axi_gmem_B_AWVALID_1;
  assign kernel3_0_m_axi_gmem_B_BID_1 = kernel3_0_m_axi_gmem_B_BID;
  assign kernel3_0_m_axi_gmem_B_BREADY = kernel3_0_m_axi_gmem_B_BREADY_1;
  assign kernel3_0_m_axi_gmem_B_BRESP_1 = kernel3_0_m_axi_gmem_B_BRESP;
  assign kernel3_0_m_axi_gmem_B_BUSER_1 = kernel3_0_m_axi_gmem_B_BUSER;
  assign kernel3_0_m_axi_gmem_B_BVALID_1 = kernel3_0_m_axi_gmem_B_BVALID;
  assign kernel3_0_m_axi_gmem_B_RDATA_1 = kernel3_0_m_axi_gmem_B_RDATA;
  assign kernel3_0_m_axi_gmem_B_RID_1 = kernel3_0_m_axi_gmem_B_RID;
  assign kernel3_0_m_axi_gmem_B_RLAST_1 = kernel3_0_m_axi_gmem_B_RLAST;
  assign kernel3_0_m_axi_gmem_B_RREADY = kernel3_0_m_axi_gmem_B_RREADY_1;
  assign kernel3_0_m_axi_gmem_B_RRESP_1 = kernel3_0_m_axi_gmem_B_RRESP;
  assign kernel3_0_m_axi_gmem_B_RUSER = 1'b0;
  assign kernel3_0_m_axi_gmem_B_RVALID_1 = kernel3_0_m_axi_gmem_B_RVALID;
  assign kernel3_0_m_axi_gmem_B_WDATA = kernel3_0_m_axi_gmem_B_WDATA_1;
  assign kernel3_0_m_axi_gmem_B_WLAST = kernel3_0_m_axi_gmem_B_WLAST_1;
  assign kernel3_0_m_axi_gmem_B_WREADY_1 = kernel3_0_m_axi_gmem_B_WREADY;
  assign kernel3_0_m_axi_gmem_B_WSTRB = kernel3_0_m_axi_gmem_B_WSTRB_1;
  assign kernel3_0_m_axi_gmem_B_WVALID = kernel3_0_m_axi_gmem_B_WVALID_1;
  assign kernel3_0_m_axi_gmem_C_ARADDR = kernel3_0_m_axi_gmem_C_ARADDR_1;
  assign kernel3_0_m_axi_gmem_C_ARBURST = kernel3_0_m_axi_gmem_C_ARBURST_1;
  assign kernel3_0_m_axi_gmem_C_ARCACHE = kernel3_0_m_axi_gmem_C_ARCACHE_1;
  assign kernel3_0_m_axi_gmem_C_ARID = kernel3_0_m_axi_gmem_C_ARID_1;
  assign kernel3_0_m_axi_gmem_C_ARLEN = kernel3_0_m_axi_gmem_C_ARLEN_1;
  assign kernel3_0_m_axi_gmem_C_ARLOCK = kernel3_0_m_axi_gmem_C_ARLOCK_1;
  assign kernel3_0_m_axi_gmem_C_ARPROT = kernel3_0_m_axi_gmem_C_ARPROT_1;
  assign kernel3_0_m_axi_gmem_C_ARQOS = kernel3_0_m_axi_gmem_C_ARQOS_1;
  assign kernel3_0_m_axi_gmem_C_ARREADY_1 = kernel3_0_m_axi_gmem_C_ARREADY;
  assign kernel3_0_m_axi_gmem_C_ARSIZE = kernel3_0_m_axi_gmem_C_ARSIZE_1;
  assign kernel3_0_m_axi_gmem_C_ARUSER = kernel3_0_m_axi_gmem_C_ARUSER_1;
  assign kernel3_0_m_axi_gmem_C_ARVALID = kernel3_0_m_axi_gmem_C_ARVALID_1;
  assign kernel3_0_m_axi_gmem_C_AWADDR = kernel3_0_m_axi_gmem_C_AWADDR_1;
  assign kernel3_0_m_axi_gmem_C_AWBURST = kernel3_0_m_axi_gmem_C_AWBURST_1;
  assign kernel3_0_m_axi_gmem_C_AWCACHE = kernel3_0_m_axi_gmem_C_AWCACHE_1;
  assign kernel3_0_m_axi_gmem_C_AWID = kernel3_0_m_axi_gmem_C_AWID_1;
  assign kernel3_0_m_axi_gmem_C_AWLEN = kernel3_0_m_axi_gmem_C_AWLEN_1;
  assign kernel3_0_m_axi_gmem_C_AWLOCK = kernel3_0_m_axi_gmem_C_AWLOCK_1;
  assign kernel3_0_m_axi_gmem_C_AWPROT = kernel3_0_m_axi_gmem_C_AWPROT_1;
  assign kernel3_0_m_axi_gmem_C_AWQOS = kernel3_0_m_axi_gmem_C_AWQOS_1;
  assign kernel3_0_m_axi_gmem_C_AWREADY_1 = kernel3_0_m_axi_gmem_C_AWREADY;
  assign kernel3_0_m_axi_gmem_C_AWSIZE = kernel3_0_m_axi_gmem_C_AWSIZE_1;
  assign kernel3_0_m_axi_gmem_C_AWUSER = kernel3_0_m_axi_gmem_C_AWUSER_1;
  assign kernel3_0_m_axi_gmem_C_AWVALID = kernel3_0_m_axi_gmem_C_AWVALID_1;
  assign kernel3_0_m_axi_gmem_C_BID_1 = kernel3_0_m_axi_gmem_C_BID;
  assign kernel3_0_m_axi_gmem_C_BREADY = kernel3_0_m_axi_gmem_C_BREADY_1;
  assign kernel3_0_m_axi_gmem_C_BRESP_1 = kernel3_0_m_axi_gmem_C_BRESP;
  assign kernel3_0_m_axi_gmem_C_BUSER_1 = kernel3_0_m_axi_gmem_C_BUSER;
  assign kernel3_0_m_axi_gmem_C_BVALID_1 = kernel3_0_m_axi_gmem_C_BVALID;
  assign kernel3_0_m_axi_gmem_C_RDATA_1 = kernel3_0_m_axi_gmem_C_RDATA;
  assign kernel3_0_m_axi_gmem_C_RID_1 = kernel3_0_m_axi_gmem_C_RID;
  assign kernel3_0_m_axi_gmem_C_RLAST_1 = kernel3_0_m_axi_gmem_C_RLAST;
  assign kernel3_0_m_axi_gmem_C_RREADY = kernel3_0_m_axi_gmem_C_RREADY_1;
  assign kernel3_0_m_axi_gmem_C_RRESP_1 = kernel3_0_m_axi_gmem_C_RRESP;
  assign kernel3_0_m_axi_gmem_C_RUSER = 1'b0;
  assign kernel3_0_m_axi_gmem_C_RVALID_1 = kernel3_0_m_axi_gmem_C_RVALID;
  assign kernel3_0_m_axi_gmem_C_WDATA = kernel3_0_m_axi_gmem_C_WDATA_1;
  assign kernel3_0_m_axi_gmem_C_WLAST = kernel3_0_m_axi_gmem_C_WLAST_1;
  assign kernel3_0_m_axi_gmem_C_WREADY_1 = kernel3_0_m_axi_gmem_C_WREADY;
  assign kernel3_0_m_axi_gmem_C_WSTRB = kernel3_0_m_axi_gmem_C_WSTRB_1;
  assign kernel3_0_m_axi_gmem_C_WVALID = kernel3_0_m_axi_gmem_C_WVALID_1;
  assign kernel3_0_s_axi_control_ARADDR = xdma_0_axi_periph_M00_AXI_ARADDR [ 5 : 0 ];
  assign xdma_0_axi_periph_M00_AXI_ARREADY = kernel3_0_s_axi_control_ARREADY;
  assign kernel3_0_s_axi_control_ARVALID = xdma_0_axi_periph_M00_AXI_ARVALID;
  assign kernel3_0_s_axi_control_AWADDR = xdma_0_axi_periph_M00_AXI_AWADDR [ 5 : 0 ];
  assign xdma_0_axi_periph_M00_AXI_AWREADY = kernel3_0_s_axi_control_AWREADY;
  assign kernel3_0_s_axi_control_AWVALID = xdma_0_axi_periph_M00_AXI_AWVALID;
  assign kernel3_0_s_axi_control_BREADY = xdma_0_axi_periph_M00_AXI_BREADY;
  assign xdma_0_axi_periph_M00_AXI_BRESP = kernel3_0_s_axi_control_BRESP;
  assign xdma_0_axi_periph_M00_AXI_BVALID = kernel3_0_s_axi_control_BVALID;
  assign xdma_0_axi_periph_M00_AXI_RDATA = kernel3_0_s_axi_control_RDATA;
  assign kernel3_0_s_axi_control_RREADY = xdma_0_axi_periph_M00_AXI_RREADY;
  assign xdma_0_axi_periph_M00_AXI_RRESP = kernel3_0_s_axi_control_RRESP;
  assign xdma_0_axi_periph_M00_AXI_RVALID = kernel3_0_s_axi_control_RVALID;
  assign kernel3_0_s_axi_control_WDATA = xdma_0_axi_periph_M00_AXI_WDATA;
  assign xdma_0_axi_periph_M00_AXI_WREADY = kernel3_0_s_axi_control_WREADY;
  assign kernel3_0_s_axi_control_WSTRB = xdma_0_axi_periph_M00_AXI_WSTRB;
  assign kernel3_0_s_axi_control_WVALID = xdma_0_axi_periph_M00_AXI_WVALID;
  assign kernel_clk_clk_in1 = xdma_0_axi_aclk;
  assign kernel_clk_clk_out1 = kernel_clk_clk_out1_1;
  assign kernel_clk_locked = kernel_clk_locked_1;
  assign kernel_clk_resetn = xdma_0_axi_aresetn;
  assign kernel_sys_reset_aux_reset_in = 1'b1;
  assign kernel_sys_reset_dcm_locked = kernel_clk_locked;
  assign kernel_sys_reset_ext_reset_in = xdma_0_axi_aresetn;
  assign kernel_sys_reset_mb_debug_sys_rst = 1'b0;
  assign kernel_sys_reset_peripheral_aresetn = kernel_sys_reset_peripheral_aresetn_1;
  assign kernel_sys_reset_slowest_sync_clk = kernel_clk_clk_out1;
  assign smartconnect_28_M00_AXI_ARADDR = smartconnect_28_M00_AXI_araddr;
  assign smartconnect_28_M00_AXI_ARBURST = smartconnect_28_M00_AXI_arburst;
  assign smartconnect_28_M00_AXI_ARCACHE = smartconnect_28_M00_AXI_arcache;
  assign smartconnect_28_M00_AXI_ARLEN = smartconnect_28_M00_AXI_arlen;
  assign smartconnect_28_M00_AXI_ARLOCK = smartconnect_28_M00_AXI_arlock;
  assign smartconnect_28_M00_AXI_ARPROT = smartconnect_28_M00_AXI_arprot;
  assign smartconnect_28_M00_AXI_ARQOS = smartconnect_28_M00_AXI_arqos;
  assign smartconnect_28_M00_AXI_arready = smartconnect_28_M00_AXI_ARREADY;
  assign smartconnect_28_M00_AXI_ARSIZE = smartconnect_28_M00_AXI_arsize;
  assign smartconnect_28_M00_AXI_ARUSER = smartconnect_28_M00_AXI_aruser;
  assign smartconnect_28_M00_AXI_ARVALID = smartconnect_28_M00_AXI_arvalid;
  assign smartconnect_28_M00_AXI_AWADDR = smartconnect_28_M00_AXI_awaddr;
  assign smartconnect_28_M00_AXI_AWBURST = smartconnect_28_M00_AXI_awburst;
  assign smartconnect_28_M00_AXI_AWCACHE = smartconnect_28_M00_AXI_awcache;
  assign smartconnect_28_M00_AXI_AWLEN = smartconnect_28_M00_AXI_awlen;
  assign smartconnect_28_M00_AXI_AWLOCK = smartconnect_28_M00_AXI_awlock;
  assign smartconnect_28_M00_AXI_AWPROT = smartconnect_28_M00_AXI_awprot;
  assign smartconnect_28_M00_AXI_AWQOS = smartconnect_28_M00_AXI_awqos;
  assign smartconnect_28_M00_AXI_awready = smartconnect_28_M00_AXI_AWREADY;
  assign smartconnect_28_M00_AXI_AWSIZE = smartconnect_28_M00_AXI_awsize;
  assign smartconnect_28_M00_AXI_AWUSER = smartconnect_28_M00_AXI_awuser;
  assign smartconnect_28_M00_AXI_AWVALID = smartconnect_28_M00_AXI_awvalid;
  assign smartconnect_28_M00_AXI_BREADY = smartconnect_28_M00_AXI_bready;
  assign smartconnect_28_M00_AXI_bresp = smartconnect_28_M00_AXI_BRESP;
  assign smartconnect_28_M00_AXI_buser = smartconnect_28_M00_AXI_BUSER;
  assign smartconnect_28_M00_AXI_bvalid = smartconnect_28_M00_AXI_BVALID;
  assign smartconnect_28_M00_AXI_rdata = smartconnect_28_M00_AXI_RDATA;
  assign smartconnect_28_M00_AXI_rlast = smartconnect_28_M00_AXI_RLAST;
  assign smartconnect_28_M00_AXI_RREADY = smartconnect_28_M00_AXI_rready;
  assign smartconnect_28_M00_AXI_rresp = smartconnect_28_M00_AXI_RRESP;
  assign smartconnect_28_M00_AXI_rvalid = smartconnect_28_M00_AXI_RVALID;
  assign smartconnect_28_M00_AXI_WDATA = smartconnect_28_M00_AXI_wdata;
  assign smartconnect_28_M00_AXI_WLAST = smartconnect_28_M00_AXI_wlast;
  assign smartconnect_28_M00_AXI_wready = smartconnect_28_M00_AXI_WREADY;
  assign smartconnect_28_M00_AXI_WSTRB = smartconnect_28_M00_AXI_wstrb;
  assign smartconnect_28_M00_AXI_WVALID = smartconnect_28_M00_AXI_wvalid;
  assign smartconnect_28_S00_AXI_araddr = kernel3_0_m_axi_gmem_A_ARADDR;
  assign smartconnect_28_S00_AXI_arburst = kernel3_0_m_axi_gmem_A_ARBURST;
  assign smartconnect_28_S00_AXI_arcache = kernel3_0_m_axi_gmem_A_ARCACHE;
  assign smartconnect_28_S00_AXI_arid = kernel3_0_m_axi_gmem_A_ARID;
  assign smartconnect_28_S00_AXI_arlen = kernel3_0_m_axi_gmem_A_ARLEN;
  assign smartconnect_28_S00_AXI_arlock = kernel3_0_m_axi_gmem_A_ARLOCK [ 0 ];
  assign smartconnect_28_S00_AXI_arprot = kernel3_0_m_axi_gmem_A_ARPROT;
  assign smartconnect_28_S00_AXI_arqos = kernel3_0_m_axi_gmem_A_ARQOS;
  assign kernel3_0_m_axi_gmem_A_ARREADY = smartconnect_28_S00_AXI_arready;
  assign smartconnect_28_S00_AXI_arsize = kernel3_0_m_axi_gmem_A_ARSIZE;
  assign smartconnect_28_S00_AXI_aruser = kernel3_0_m_axi_gmem_A_ARUSER;
  assign smartconnect_28_S00_AXI_arvalid = kernel3_0_m_axi_gmem_A_ARVALID;
  assign smartconnect_28_S00_AXI_awaddr = kernel3_0_m_axi_gmem_A_AWADDR;
  assign smartconnect_28_S00_AXI_awburst = kernel3_0_m_axi_gmem_A_AWBURST;
  assign smartconnect_28_S00_AXI_awcache = kernel3_0_m_axi_gmem_A_AWCACHE;
  assign smartconnect_28_S00_AXI_awid = kernel3_0_m_axi_gmem_A_AWID;
  assign smartconnect_28_S00_AXI_awlen = kernel3_0_m_axi_gmem_A_AWLEN;
  assign smartconnect_28_S00_AXI_awlock = kernel3_0_m_axi_gmem_A_AWLOCK [ 0 ];
  assign smartconnect_28_S00_AXI_awprot = kernel3_0_m_axi_gmem_A_AWPROT;
  assign smartconnect_28_S00_AXI_awqos = kernel3_0_m_axi_gmem_A_AWQOS;
  assign kernel3_0_m_axi_gmem_A_AWREADY = smartconnect_28_S00_AXI_awready;
  assign smartconnect_28_S00_AXI_awsize = kernel3_0_m_axi_gmem_A_AWSIZE;
  assign smartconnect_28_S00_AXI_awuser = kernel3_0_m_axi_gmem_A_AWUSER;
  assign smartconnect_28_S00_AXI_awvalid = kernel3_0_m_axi_gmem_A_AWVALID;
  assign kernel3_0_m_axi_gmem_A_BID = smartconnect_28_S00_AXI_bid;
  assign smartconnect_28_S00_AXI_bready = kernel3_0_m_axi_gmem_A_BREADY;
  assign kernel3_0_m_axi_gmem_A_BRESP = smartconnect_28_S00_AXI_bresp;
  assign kernel3_0_m_axi_gmem_A_BUSER = smartconnect_28_S00_AXI_buser;
  assign kernel3_0_m_axi_gmem_A_BVALID = smartconnect_28_S00_AXI_bvalid;
  assign kernel3_0_m_axi_gmem_A_RDATA = smartconnect_28_S00_AXI_rdata;
  assign kernel3_0_m_axi_gmem_A_RID = smartconnect_28_S00_AXI_rid;
  assign kernel3_0_m_axi_gmem_A_RLAST = smartconnect_28_S00_AXI_rlast;
  assign smartconnect_28_S00_AXI_rready = kernel3_0_m_axi_gmem_A_RREADY;
  assign kernel3_0_m_axi_gmem_A_RRESP = smartconnect_28_S00_AXI_rresp;
  assign kernel3_0_m_axi_gmem_A_RVALID = smartconnect_28_S00_AXI_rvalid;
  assign smartconnect_28_S00_AXI_wdata = kernel3_0_m_axi_gmem_A_WDATA;
  assign smartconnect_28_S00_AXI_wlast = kernel3_0_m_axi_gmem_A_WLAST;
  assign kernel3_0_m_axi_gmem_A_WREADY = smartconnect_28_S00_AXI_wready;
  assign smartconnect_28_S00_AXI_wstrb = kernel3_0_m_axi_gmem_A_WSTRB;
  assign smartconnect_28_S00_AXI_wvalid = kernel3_0_m_axi_gmem_A_WVALID;
  assign smartconnect_28_aclk = kernel_clk_clk_out1;
  assign smartconnect_28_aclk1 = hbm_axi_clk_clk_out1;
  assign smartconnect_28_aresetn = kernel_sys_reset_peripheral_aresetn;
  assign smartconnect_29_M00_AXI_ARADDR = smartconnect_29_M00_AXI_araddr;
  assign smartconnect_29_M00_AXI_ARBURST = smartconnect_29_M00_AXI_arburst;
  assign smartconnect_29_M00_AXI_ARCACHE = smartconnect_29_M00_AXI_arcache;
  assign smartconnect_29_M00_AXI_ARLEN = smartconnect_29_M00_AXI_arlen;
  assign smartconnect_29_M00_AXI_ARLOCK = smartconnect_29_M00_AXI_arlock;
  assign smartconnect_29_M00_AXI_ARPROT = smartconnect_29_M00_AXI_arprot;
  assign smartconnect_29_M00_AXI_ARQOS = smartconnect_29_M00_AXI_arqos;
  assign smartconnect_29_M00_AXI_arready = smartconnect_29_M00_AXI_ARREADY;
  assign smartconnect_29_M00_AXI_ARSIZE = smartconnect_29_M00_AXI_arsize;
  assign smartconnect_29_M00_AXI_ARUSER = smartconnect_29_M00_AXI_aruser;
  assign smartconnect_29_M00_AXI_ARVALID = smartconnect_29_M00_AXI_arvalid;
  assign smartconnect_29_M00_AXI_AWADDR = smartconnect_29_M00_AXI_awaddr;
  assign smartconnect_29_M00_AXI_AWBURST = smartconnect_29_M00_AXI_awburst;
  assign smartconnect_29_M00_AXI_AWCACHE = smartconnect_29_M00_AXI_awcache;
  assign smartconnect_29_M00_AXI_AWLEN = smartconnect_29_M00_AXI_awlen;
  assign smartconnect_29_M00_AXI_AWLOCK = smartconnect_29_M00_AXI_awlock;
  assign smartconnect_29_M00_AXI_AWPROT = smartconnect_29_M00_AXI_awprot;
  assign smartconnect_29_M00_AXI_AWQOS = smartconnect_29_M00_AXI_awqos;
  assign smartconnect_29_M00_AXI_awready = smartconnect_29_M00_AXI_AWREADY;
  assign smartconnect_29_M00_AXI_AWSIZE = smartconnect_29_M00_AXI_awsize;
  assign smartconnect_29_M00_AXI_AWUSER = smartconnect_29_M00_AXI_awuser;
  assign smartconnect_29_M00_AXI_AWVALID = smartconnect_29_M00_AXI_awvalid;
  assign smartconnect_29_M00_AXI_BREADY = smartconnect_29_M00_AXI_bready;
  assign smartconnect_29_M00_AXI_bresp = smartconnect_29_M00_AXI_BRESP;
  assign smartconnect_29_M00_AXI_buser = smartconnect_29_M00_AXI_BUSER;
  assign smartconnect_29_M00_AXI_bvalid = smartconnect_29_M00_AXI_BVALID;
  assign smartconnect_29_M00_AXI_rdata = smartconnect_29_M00_AXI_RDATA;
  assign smartconnect_29_M00_AXI_rlast = smartconnect_29_M00_AXI_RLAST;
  assign smartconnect_29_M00_AXI_RREADY = smartconnect_29_M00_AXI_rready;
  assign smartconnect_29_M00_AXI_rresp = smartconnect_29_M00_AXI_RRESP;
  assign smartconnect_29_M00_AXI_rvalid = smartconnect_29_M00_AXI_RVALID;
  assign smartconnect_29_M00_AXI_WDATA = smartconnect_29_M00_AXI_wdata;
  assign smartconnect_29_M00_AXI_WLAST = smartconnect_29_M00_AXI_wlast;
  assign smartconnect_29_M00_AXI_wready = smartconnect_29_M00_AXI_WREADY;
  assign smartconnect_29_M00_AXI_WSTRB = smartconnect_29_M00_AXI_wstrb;
  assign smartconnect_29_M00_AXI_WVALID = smartconnect_29_M00_AXI_wvalid;
  assign smartconnect_29_S00_AXI_araddr = kernel3_0_m_axi_gmem_B_ARADDR;
  assign smartconnect_29_S00_AXI_arburst = kernel3_0_m_axi_gmem_B_ARBURST;
  assign smartconnect_29_S00_AXI_arcache = kernel3_0_m_axi_gmem_B_ARCACHE;
  assign smartconnect_29_S00_AXI_arid = kernel3_0_m_axi_gmem_B_ARID;
  assign smartconnect_29_S00_AXI_arlen = kernel3_0_m_axi_gmem_B_ARLEN;
  assign smartconnect_29_S00_AXI_arlock = kernel3_0_m_axi_gmem_B_ARLOCK [ 0 ];
  assign smartconnect_29_S00_AXI_arprot = kernel3_0_m_axi_gmem_B_ARPROT;
  assign smartconnect_29_S00_AXI_arqos = kernel3_0_m_axi_gmem_B_ARQOS;
  assign kernel3_0_m_axi_gmem_B_ARREADY = smartconnect_29_S00_AXI_arready;
  assign smartconnect_29_S00_AXI_arsize = kernel3_0_m_axi_gmem_B_ARSIZE;
  assign smartconnect_29_S00_AXI_aruser = kernel3_0_m_axi_gmem_B_ARUSER;
  assign smartconnect_29_S00_AXI_arvalid = kernel3_0_m_axi_gmem_B_ARVALID;
  assign smartconnect_29_S00_AXI_awaddr = kernel3_0_m_axi_gmem_B_AWADDR;
  assign smartconnect_29_S00_AXI_awburst = kernel3_0_m_axi_gmem_B_AWBURST;
  assign smartconnect_29_S00_AXI_awcache = kernel3_0_m_axi_gmem_B_AWCACHE;
  assign smartconnect_29_S00_AXI_awid = kernel3_0_m_axi_gmem_B_AWID;
  assign smartconnect_29_S00_AXI_awlen = kernel3_0_m_axi_gmem_B_AWLEN;
  assign smartconnect_29_S00_AXI_awlock = kernel3_0_m_axi_gmem_B_AWLOCK [ 0 ];
  assign smartconnect_29_S00_AXI_awprot = kernel3_0_m_axi_gmem_B_AWPROT;
  assign smartconnect_29_S00_AXI_awqos = kernel3_0_m_axi_gmem_B_AWQOS;
  assign kernel3_0_m_axi_gmem_B_AWREADY = smartconnect_29_S00_AXI_awready;
  assign smartconnect_29_S00_AXI_awsize = kernel3_0_m_axi_gmem_B_AWSIZE;
  assign smartconnect_29_S00_AXI_awuser = kernel3_0_m_axi_gmem_B_AWUSER;
  assign smartconnect_29_S00_AXI_awvalid = kernel3_0_m_axi_gmem_B_AWVALID;
  assign kernel3_0_m_axi_gmem_B_BID = smartconnect_29_S00_AXI_bid;
  assign smartconnect_29_S00_AXI_bready = kernel3_0_m_axi_gmem_B_BREADY;
  assign kernel3_0_m_axi_gmem_B_BRESP = smartconnect_29_S00_AXI_bresp;
  assign kernel3_0_m_axi_gmem_B_BUSER = smartconnect_29_S00_AXI_buser;
  assign kernel3_0_m_axi_gmem_B_BVALID = smartconnect_29_S00_AXI_bvalid;
  assign kernel3_0_m_axi_gmem_B_RDATA = smartconnect_29_S00_AXI_rdata;
  assign kernel3_0_m_axi_gmem_B_RID = smartconnect_29_S00_AXI_rid;
  assign kernel3_0_m_axi_gmem_B_RLAST = smartconnect_29_S00_AXI_rlast;
  assign smartconnect_29_S00_AXI_rready = kernel3_0_m_axi_gmem_B_RREADY;
  assign kernel3_0_m_axi_gmem_B_RRESP = smartconnect_29_S00_AXI_rresp;
  assign kernel3_0_m_axi_gmem_B_RVALID = smartconnect_29_S00_AXI_rvalid;
  assign smartconnect_29_S00_AXI_wdata = kernel3_0_m_axi_gmem_B_WDATA;
  assign smartconnect_29_S00_AXI_wlast = kernel3_0_m_axi_gmem_B_WLAST;
  assign kernel3_0_m_axi_gmem_B_WREADY = smartconnect_29_S00_AXI_wready;
  assign smartconnect_29_S00_AXI_wstrb = kernel3_0_m_axi_gmem_B_WSTRB;
  assign smartconnect_29_S00_AXI_wvalid = kernel3_0_m_axi_gmem_B_WVALID;
  assign smartconnect_29_aclk = kernel_clk_clk_out1;
  assign smartconnect_29_aclk1 = hbm_axi_clk_clk_out1;
  assign smartconnect_29_aresetn = kernel_sys_reset_peripheral_aresetn;
  assign smartconnect_30_M00_AXI_ARADDR = smartconnect_30_M00_AXI_araddr;
  assign smartconnect_30_M00_AXI_ARBURST = smartconnect_30_M00_AXI_arburst;
  assign smartconnect_30_M00_AXI_ARCACHE = smartconnect_30_M00_AXI_arcache;
  assign smartconnect_30_M00_AXI_ARLEN = smartconnect_30_M00_AXI_arlen;
  assign smartconnect_30_M00_AXI_ARLOCK = smartconnect_30_M00_AXI_arlock;
  assign smartconnect_30_M00_AXI_ARPROT = smartconnect_30_M00_AXI_arprot;
  assign smartconnect_30_M00_AXI_ARQOS = smartconnect_30_M00_AXI_arqos;
  assign smartconnect_30_M00_AXI_arready = smartconnect_30_M00_AXI_ARREADY;
  assign smartconnect_30_M00_AXI_ARSIZE = smartconnect_30_M00_AXI_arsize;
  assign smartconnect_30_M00_AXI_ARUSER = smartconnect_30_M00_AXI_aruser;
  assign smartconnect_30_M00_AXI_ARVALID = smartconnect_30_M00_AXI_arvalid;
  assign smartconnect_30_M00_AXI_AWADDR = smartconnect_30_M00_AXI_awaddr;
  assign smartconnect_30_M00_AXI_AWBURST = smartconnect_30_M00_AXI_awburst;
  assign smartconnect_30_M00_AXI_AWCACHE = smartconnect_30_M00_AXI_awcache;
  assign smartconnect_30_M00_AXI_AWLEN = smartconnect_30_M00_AXI_awlen;
  assign smartconnect_30_M00_AXI_AWLOCK = smartconnect_30_M00_AXI_awlock;
  assign smartconnect_30_M00_AXI_AWPROT = smartconnect_30_M00_AXI_awprot;
  assign smartconnect_30_M00_AXI_AWQOS = smartconnect_30_M00_AXI_awqos;
  assign smartconnect_30_M00_AXI_awready = smartconnect_30_M00_AXI_AWREADY;
  assign smartconnect_30_M00_AXI_AWSIZE = smartconnect_30_M00_AXI_awsize;
  assign smartconnect_30_M00_AXI_AWUSER = smartconnect_30_M00_AXI_awuser;
  assign smartconnect_30_M00_AXI_AWVALID = smartconnect_30_M00_AXI_awvalid;
  assign smartconnect_30_M00_AXI_BREADY = smartconnect_30_M00_AXI_bready;
  assign smartconnect_30_M00_AXI_bresp = smartconnect_30_M00_AXI_BRESP;
  assign smartconnect_30_M00_AXI_buser = smartconnect_30_M00_AXI_BUSER;
  assign smartconnect_30_M00_AXI_bvalid = smartconnect_30_M00_AXI_BVALID;
  assign smartconnect_30_M00_AXI_rdata = smartconnect_30_M00_AXI_RDATA;
  assign smartconnect_30_M00_AXI_rlast = smartconnect_30_M00_AXI_RLAST;
  assign smartconnect_30_M00_AXI_RREADY = smartconnect_30_M00_AXI_rready;
  assign smartconnect_30_M00_AXI_rresp = smartconnect_30_M00_AXI_RRESP;
  assign smartconnect_30_M00_AXI_rvalid = smartconnect_30_M00_AXI_RVALID;
  assign smartconnect_30_M00_AXI_WDATA = smartconnect_30_M00_AXI_wdata;
  assign smartconnect_30_M00_AXI_WLAST = smartconnect_30_M00_AXI_wlast;
  assign smartconnect_30_M00_AXI_wready = smartconnect_30_M00_AXI_WREADY;
  assign smartconnect_30_M00_AXI_WSTRB = smartconnect_30_M00_AXI_wstrb;
  assign smartconnect_30_M00_AXI_WVALID = smartconnect_30_M00_AXI_wvalid;
  assign smartconnect_30_S00_AXI_araddr = kernel3_0_m_axi_gmem_C_ARADDR;
  assign smartconnect_30_S00_AXI_arburst = kernel3_0_m_axi_gmem_C_ARBURST;
  assign smartconnect_30_S00_AXI_arcache = kernel3_0_m_axi_gmem_C_ARCACHE;
  assign smartconnect_30_S00_AXI_arid = kernel3_0_m_axi_gmem_C_ARID;
  assign smartconnect_30_S00_AXI_arlen = kernel3_0_m_axi_gmem_C_ARLEN;
  assign smartconnect_30_S00_AXI_arlock = kernel3_0_m_axi_gmem_C_ARLOCK [ 0 ];
  assign smartconnect_30_S00_AXI_arprot = kernel3_0_m_axi_gmem_C_ARPROT;
  assign smartconnect_30_S00_AXI_arqos = kernel3_0_m_axi_gmem_C_ARQOS;
  assign kernel3_0_m_axi_gmem_C_ARREADY = smartconnect_30_S00_AXI_arready;
  assign smartconnect_30_S00_AXI_arsize = kernel3_0_m_axi_gmem_C_ARSIZE;
  assign smartconnect_30_S00_AXI_aruser = kernel3_0_m_axi_gmem_C_ARUSER;
  assign smartconnect_30_S00_AXI_arvalid = kernel3_0_m_axi_gmem_C_ARVALID;
  assign smartconnect_30_S00_AXI_awaddr = kernel3_0_m_axi_gmem_C_AWADDR;
  assign smartconnect_30_S00_AXI_awburst = kernel3_0_m_axi_gmem_C_AWBURST;
  assign smartconnect_30_S00_AXI_awcache = kernel3_0_m_axi_gmem_C_AWCACHE;
  assign smartconnect_30_S00_AXI_awid = kernel3_0_m_axi_gmem_C_AWID;
  assign smartconnect_30_S00_AXI_awlen = kernel3_0_m_axi_gmem_C_AWLEN;
  assign smartconnect_30_S00_AXI_awlock = kernel3_0_m_axi_gmem_C_AWLOCK [ 0 ];
  assign smartconnect_30_S00_AXI_awprot = kernel3_0_m_axi_gmem_C_AWPROT;
  assign smartconnect_30_S00_AXI_awqos = kernel3_0_m_axi_gmem_C_AWQOS;
  assign kernel3_0_m_axi_gmem_C_AWREADY = smartconnect_30_S00_AXI_awready;
  assign smartconnect_30_S00_AXI_awsize = kernel3_0_m_axi_gmem_C_AWSIZE;
  assign smartconnect_30_S00_AXI_awuser = kernel3_0_m_axi_gmem_C_AWUSER;
  assign smartconnect_30_S00_AXI_awvalid = kernel3_0_m_axi_gmem_C_AWVALID;
  assign kernel3_0_m_axi_gmem_C_BID = smartconnect_30_S00_AXI_bid;
  assign smartconnect_30_S00_AXI_bready = kernel3_0_m_axi_gmem_C_BREADY;
  assign kernel3_0_m_axi_gmem_C_BRESP = smartconnect_30_S00_AXI_bresp;
  assign kernel3_0_m_axi_gmem_C_BUSER = smartconnect_30_S00_AXI_buser;
  assign kernel3_0_m_axi_gmem_C_BVALID = smartconnect_30_S00_AXI_bvalid;
  assign kernel3_0_m_axi_gmem_C_RDATA = smartconnect_30_S00_AXI_rdata;
  assign kernel3_0_m_axi_gmem_C_RID = smartconnect_30_S00_AXI_rid;
  assign kernel3_0_m_axi_gmem_C_RLAST = smartconnect_30_S00_AXI_rlast;
  assign smartconnect_30_S00_AXI_rready = kernel3_0_m_axi_gmem_C_RREADY;
  assign kernel3_0_m_axi_gmem_C_RRESP = smartconnect_30_S00_AXI_rresp;
  assign kernel3_0_m_axi_gmem_C_RVALID = smartconnect_30_S00_AXI_rvalid;
  assign smartconnect_30_S00_AXI_wdata = kernel3_0_m_axi_gmem_C_WDATA;
  assign smartconnect_30_S00_AXI_wlast = kernel3_0_m_axi_gmem_C_WLAST;
  assign kernel3_0_m_axi_gmem_C_WREADY = smartconnect_30_S00_AXI_wready;
  assign smartconnect_30_S00_AXI_wstrb = kernel3_0_m_axi_gmem_C_WSTRB;
  assign smartconnect_30_S00_AXI_wvalid = kernel3_0_m_axi_gmem_C_WVALID;
  assign smartconnect_30_aclk = kernel_clk_clk_out1;
  assign smartconnect_30_aclk1 = hbm_axi_clk_clk_out1;
  assign smartconnect_30_aresetn = kernel_sys_reset_peripheral_aresetn;
  assign smartconnect_31_M00_AXI_ARADDR = smartconnect_31_M00_AXI_araddr;
  assign smartconnect_31_M00_AXI_ARBURST = smartconnect_31_M00_AXI_arburst;
  assign smartconnect_31_M00_AXI_ARCACHE = smartconnect_31_M00_AXI_arcache;
  assign smartconnect_31_M00_AXI_ARLEN = smartconnect_31_M00_AXI_arlen;
  assign smartconnect_31_M00_AXI_ARLOCK = smartconnect_31_M00_AXI_arlock;
  assign smartconnect_31_M00_AXI_ARPROT = smartconnect_31_M00_AXI_arprot;
  assign smartconnect_31_M00_AXI_ARQOS = smartconnect_31_M00_AXI_arqos;
  assign smartconnect_31_M00_AXI_arready = smartconnect_31_M00_AXI_ARREADY;
  assign smartconnect_31_M00_AXI_ARSIZE = smartconnect_31_M00_AXI_arsize;
  assign smartconnect_31_M00_AXI_ARVALID = smartconnect_31_M00_AXI_arvalid;
  assign smartconnect_31_M00_AXI_AWADDR = smartconnect_31_M00_AXI_awaddr;
  assign smartconnect_31_M00_AXI_AWBURST = smartconnect_31_M00_AXI_awburst;
  assign smartconnect_31_M00_AXI_AWCACHE = smartconnect_31_M00_AXI_awcache;
  assign smartconnect_31_M00_AXI_AWLEN = smartconnect_31_M00_AXI_awlen;
  assign smartconnect_31_M00_AXI_AWLOCK = smartconnect_31_M00_AXI_awlock;
  assign smartconnect_31_M00_AXI_AWPROT = smartconnect_31_M00_AXI_awprot;
  assign smartconnect_31_M00_AXI_AWQOS = smartconnect_31_M00_AXI_awqos;
  assign smartconnect_31_M00_AXI_awready = smartconnect_31_M00_AXI_AWREADY;
  assign smartconnect_31_M00_AXI_AWSIZE = smartconnect_31_M00_AXI_awsize;
  assign smartconnect_31_M00_AXI_AWVALID = smartconnect_31_M00_AXI_awvalid;
  assign smartconnect_31_M00_AXI_BREADY = smartconnect_31_M00_AXI_bready;
  assign smartconnect_31_M00_AXI_bresp = smartconnect_31_M00_AXI_BRESP;
  assign smartconnect_31_M00_AXI_bvalid = smartconnect_31_M00_AXI_BVALID;
  assign smartconnect_31_M00_AXI_rdata = smartconnect_31_M00_AXI_RDATA;
  assign smartconnect_31_M00_AXI_rlast = smartconnect_31_M00_AXI_RLAST;
  assign smartconnect_31_M00_AXI_RREADY = smartconnect_31_M00_AXI_rready;
  assign smartconnect_31_M00_AXI_rresp = smartconnect_31_M00_AXI_RRESP;
  assign smartconnect_31_M00_AXI_rvalid = smartconnect_31_M00_AXI_RVALID;
  assign smartconnect_31_M00_AXI_WDATA = smartconnect_31_M00_AXI_wdata;
  assign smartconnect_31_M00_AXI_WLAST = smartconnect_31_M00_AXI_wlast;
  assign smartconnect_31_M00_AXI_wready = smartconnect_31_M00_AXI_WREADY;
  assign smartconnect_31_M00_AXI_WSTRB = smartconnect_31_M00_AXI_wstrb;
  assign smartconnect_31_M00_AXI_WVALID = smartconnect_31_M00_AXI_wvalid;
  assign smartconnect_31_S00_AXI_araddr = xdma_0_M_AXI_ARADDR;
  assign smartconnect_31_S00_AXI_arburst = xdma_0_M_AXI_ARBURST;
  assign smartconnect_31_S00_AXI_arcache = xdma_0_M_AXI_ARCACHE;
  assign smartconnect_31_S00_AXI_arid = xdma_0_M_AXI_ARID;
  assign smartconnect_31_S00_AXI_arlen = xdma_0_M_AXI_ARLEN;
  assign smartconnect_31_S00_AXI_arlock = xdma_0_M_AXI_ARLOCK;
  assign smartconnect_31_S00_AXI_arprot = xdma_0_M_AXI_ARPROT;
  assign smartconnect_31_S00_AXI_arqos = 0;
  assign xdma_0_M_AXI_ARREADY = smartconnect_31_S00_AXI_arready;
  assign smartconnect_31_S00_AXI_arsize = xdma_0_M_AXI_ARSIZE;
  assign smartconnect_31_S00_AXI_arvalid = xdma_0_M_AXI_ARVALID;
  assign smartconnect_31_S00_AXI_awaddr = xdma_0_M_AXI_AWADDR;
  assign smartconnect_31_S00_AXI_awburst = xdma_0_M_AXI_AWBURST;
  assign smartconnect_31_S00_AXI_awcache = xdma_0_M_AXI_AWCACHE;
  assign smartconnect_31_S00_AXI_awid = xdma_0_M_AXI_AWID;
  assign smartconnect_31_S00_AXI_awlen = xdma_0_M_AXI_AWLEN;
  assign smartconnect_31_S00_AXI_awlock = xdma_0_M_AXI_AWLOCK;
  assign smartconnect_31_S00_AXI_awprot = xdma_0_M_AXI_AWPROT;
  assign smartconnect_31_S00_AXI_awqos = 0;
  assign xdma_0_M_AXI_AWREADY = smartconnect_31_S00_AXI_awready;
  assign smartconnect_31_S00_AXI_awsize = xdma_0_M_AXI_AWSIZE;
  assign smartconnect_31_S00_AXI_awvalid = xdma_0_M_AXI_AWVALID;
  assign xdma_0_M_AXI_BID = smartconnect_31_S00_AXI_bid;
  assign smartconnect_31_S00_AXI_bready = xdma_0_M_AXI_BREADY;
  assign xdma_0_M_AXI_BRESP = smartconnect_31_S00_AXI_bresp;
  assign xdma_0_M_AXI_BVALID = smartconnect_31_S00_AXI_bvalid;
  assign xdma_0_M_AXI_RDATA = smartconnect_31_S00_AXI_rdata;
  assign xdma_0_M_AXI_RID = smartconnect_31_S00_AXI_rid;
  assign xdma_0_M_AXI_RLAST = smartconnect_31_S00_AXI_rlast;
  assign smartconnect_31_S00_AXI_rready = xdma_0_M_AXI_RREADY;
  assign xdma_0_M_AXI_RRESP = smartconnect_31_S00_AXI_rresp;
  assign xdma_0_M_AXI_RVALID = smartconnect_31_S00_AXI_rvalid;
  assign smartconnect_31_S00_AXI_wdata = xdma_0_M_AXI_WDATA;
  assign smartconnect_31_S00_AXI_wlast = xdma_0_M_AXI_WLAST;
  assign xdma_0_M_AXI_WREADY = smartconnect_31_S00_AXI_wready;
  assign smartconnect_31_S00_AXI_wstrb = xdma_0_M_AXI_WSTRB;
  assign smartconnect_31_S00_AXI_wvalid = xdma_0_M_AXI_WVALID;
  assign smartconnect_31_aclk = xdma_0_axi_aclk;
  assign smartconnect_31_aclk1 = hbm_axi_clk_clk_out1;
  assign smartconnect_31_aresetn = xdma_0_axi_aresetn;
  assign util_ds_buf_IBUF_DS_N = pcie_refclk_1_CLK_N;
  assign util_ds_buf_IBUF_DS_ODIV2 = util_ds_buf_IBUF_DS_ODIV2_1;
  assign util_ds_buf_IBUF_DS_P = pcie_refclk_1_CLK_P;
  assign util_ds_buf_IBUF_OUT = util_ds_buf_IBUF_OUT_1;
  assign util_ds_buf_0_IBUF_DS_N = hbm_clk_1_CLK_N;
  assign util_ds_buf_0_IBUF_DS_P = hbm_clk_1_CLK_P;
  assign util_ds_buf_0_IBUF_OUT = util_ds_buf_0_IBUF_OUT_1;
  assign xdma_0_axi_aclk = xdma_0_axi_aclk_1;
  assign xdma_0_axi_aresetn = xdma_0_axi_aresetn_1;
  assign xdma_0_M_AXI_ARADDR = xdma_0_m_axi_araddr;
  assign xdma_0_M_AXI_ARBURST = xdma_0_m_axi_arburst;
  assign xdma_0_M_AXI_ARCACHE = xdma_0_m_axi_arcache;
  assign xdma_0_M_AXI_ARID = xdma_0_m_axi_arid;
  assign xdma_0_M_AXI_ARLEN = xdma_0_m_axi_arlen;
  assign xdma_0_M_AXI_ARLOCK = xdma_0_m_axi_arlock;
  assign xdma_0_M_AXI_ARPROT = xdma_0_m_axi_arprot;
  assign xdma_0_m_axi_arready = xdma_0_M_AXI_ARREADY;
  assign xdma_0_M_AXI_ARSIZE = xdma_0_m_axi_arsize;
  assign xdma_0_M_AXI_ARVALID = xdma_0_m_axi_arvalid;
  assign xdma_0_M_AXI_AWADDR = xdma_0_m_axi_awaddr;
  assign xdma_0_M_AXI_AWBURST = xdma_0_m_axi_awburst;
  assign xdma_0_M_AXI_AWCACHE = xdma_0_m_axi_awcache;
  assign xdma_0_M_AXI_AWID = xdma_0_m_axi_awid;
  assign xdma_0_M_AXI_AWLEN = xdma_0_m_axi_awlen;
  assign xdma_0_M_AXI_AWLOCK = xdma_0_m_axi_awlock;
  assign xdma_0_M_AXI_AWPROT = xdma_0_m_axi_awprot;
  assign xdma_0_m_axi_awready = xdma_0_M_AXI_AWREADY;
  assign xdma_0_M_AXI_AWSIZE = xdma_0_m_axi_awsize;
  assign xdma_0_M_AXI_AWVALID = xdma_0_m_axi_awvalid;
  assign xdma_0_m_axi_bid = xdma_0_M_AXI_BID;
  assign xdma_0_M_AXI_BREADY = xdma_0_m_axi_bready;
  assign xdma_0_m_axi_bresp = xdma_0_M_AXI_BRESP;
  assign xdma_0_m_axi_bvalid = xdma_0_M_AXI_BVALID;
  assign xdma_0_m_axi_rdata = xdma_0_M_AXI_RDATA;
  assign xdma_0_m_axi_rid = xdma_0_M_AXI_RID;
  assign xdma_0_m_axi_rlast = xdma_0_M_AXI_RLAST;
  assign xdma_0_M_AXI_RREADY = xdma_0_m_axi_rready;
  assign xdma_0_m_axi_rresp = xdma_0_M_AXI_RRESP;
  assign xdma_0_m_axi_rvalid = xdma_0_M_AXI_RVALID;
  assign xdma_0_M_AXI_WDATA = xdma_0_m_axi_wdata;
  assign xdma_0_M_AXI_WLAST = xdma_0_m_axi_wlast;
  assign xdma_0_m_axi_wready = xdma_0_M_AXI_WREADY;
  assign xdma_0_M_AXI_WSTRB = xdma_0_m_axi_wstrb;
  assign xdma_0_M_AXI_WVALID = xdma_0_m_axi_wvalid;
  assign xdma_0_M_AXI_BYPASS_ARADDR = xdma_0_m_axib_araddr;
  assign xdma_0_M_AXI_BYPASS_ARBURST = xdma_0_m_axib_arburst;
  assign xdma_0_M_AXI_BYPASS_ARCACHE = xdma_0_m_axib_arcache;
  assign xdma_0_M_AXI_BYPASS_ARID = xdma_0_m_axib_arid;
  assign xdma_0_M_AXI_BYPASS_ARLEN = xdma_0_m_axib_arlen;
  assign xdma_0_M_AXI_BYPASS_ARLOCK = xdma_0_m_axib_arlock;
  assign xdma_0_M_AXI_BYPASS_ARPROT = xdma_0_m_axib_arprot;
  assign xdma_0_m_axib_arready = xdma_0_M_AXI_BYPASS_ARREADY;
  assign xdma_0_M_AXI_BYPASS_ARSIZE = xdma_0_m_axib_arsize;
  assign xdma_0_M_AXI_BYPASS_ARVALID = xdma_0_m_axib_arvalid;
  assign xdma_0_M_AXI_BYPASS_AWADDR = xdma_0_m_axib_awaddr;
  assign xdma_0_M_AXI_BYPASS_AWBURST = xdma_0_m_axib_awburst;
  assign xdma_0_M_AXI_BYPASS_AWCACHE = xdma_0_m_axib_awcache;
  assign xdma_0_M_AXI_BYPASS_AWID = xdma_0_m_axib_awid;
  assign xdma_0_M_AXI_BYPASS_AWLEN = xdma_0_m_axib_awlen;
  assign xdma_0_M_AXI_BYPASS_AWLOCK = xdma_0_m_axib_awlock;
  assign xdma_0_M_AXI_BYPASS_AWPROT = xdma_0_m_axib_awprot;
  assign xdma_0_m_axib_awready = xdma_0_M_AXI_BYPASS_AWREADY;
  assign xdma_0_M_AXI_BYPASS_AWSIZE = xdma_0_m_axib_awsize;
  assign xdma_0_M_AXI_BYPASS_AWVALID = xdma_0_m_axib_awvalid;
  assign xdma_0_m_axib_bid = xdma_0_M_AXI_BYPASS_BID;
  assign xdma_0_M_AXI_BYPASS_BREADY = xdma_0_m_axib_bready;
  assign xdma_0_m_axib_bresp = xdma_0_M_AXI_BYPASS_BRESP;
  assign xdma_0_m_axib_bvalid = xdma_0_M_AXI_BYPASS_BVALID;
  assign xdma_0_m_axib_rdata = xdma_0_M_AXI_BYPASS_RDATA;
  assign xdma_0_m_axib_rid = xdma_0_M_AXI_BYPASS_RID;
  assign xdma_0_m_axib_rlast = xdma_0_M_AXI_BYPASS_RLAST;
  assign xdma_0_M_AXI_BYPASS_RREADY = xdma_0_m_axib_rready;
  assign xdma_0_m_axib_rresp = xdma_0_M_AXI_BYPASS_RRESP;
  assign xdma_0_m_axib_rvalid = xdma_0_M_AXI_BYPASS_RVALID;
  assign xdma_0_M_AXI_BYPASS_WDATA = xdma_0_m_axib_wdata;
  assign xdma_0_M_AXI_BYPASS_WLAST = xdma_0_m_axib_wlast;
  assign xdma_0_m_axib_wready = xdma_0_M_AXI_BYPASS_WREADY;
  assign xdma_0_M_AXI_BYPASS_WSTRB = xdma_0_m_axib_wstrb;
  assign xdma_0_M_AXI_BYPASS_WVALID = xdma_0_m_axib_wvalid;
  assign xdma_0_pci_exp_rxn = xdma_0_pcie_mgt_rxn;
  assign xdma_0_pci_exp_rxp = xdma_0_pcie_mgt_rxp;
  assign xdma_0_pcie_mgt_txn = xdma_0_pci_exp_txn;
  assign xdma_0_pcie_mgt_txp = xdma_0_pci_exp_txp;
  assign xdma_0_sys_clk = util_ds_buf_IBUF_DS_ODIV2;
  assign xdma_0_sys_clk_gt = util_ds_buf_IBUF_OUT;
  assign xdma_0_sys_rst_n = pcie_perstn_1;
  assign xdma_0_usr_irq_req = 1'b0;
  assign xdma_0_axi_periph_ACLK = xdma_0_axi_aclk;
  assign xdma_0_axi_periph_ARESETN = xdma_0_axi_aresetn;
  assign xdma_0_axi_periph_M00_ACLK = kernel_clk_clk_out1;
  assign xdma_0_axi_periph_M00_ARESETN = kernel_sys_reset_peripheral_aresetn;
  assign xdma_0_axi_periph_M00_AXI_ARADDR = xdma_0_axi_periph_M00_AXI_araddr;
  assign xdma_0_axi_periph_M00_AXI_arready = xdma_0_axi_periph_M00_AXI_ARREADY;
  assign xdma_0_axi_periph_M00_AXI_ARVALID = xdma_0_axi_periph_M00_AXI_arvalid;
  assign xdma_0_axi_periph_M00_AXI_AWADDR = xdma_0_axi_periph_M00_AXI_awaddr;
  assign xdma_0_axi_periph_M00_AXI_awready = xdma_0_axi_periph_M00_AXI_AWREADY;
  assign xdma_0_axi_periph_M00_AXI_AWVALID = xdma_0_axi_periph_M00_AXI_awvalid;
  assign xdma_0_axi_periph_M00_AXI_BREADY = xdma_0_axi_periph_M00_AXI_bready;
  assign xdma_0_axi_periph_M00_AXI_bresp = xdma_0_axi_periph_M00_AXI_BRESP;
  assign xdma_0_axi_periph_M00_AXI_bvalid = xdma_0_axi_periph_M00_AXI_BVALID;
  assign xdma_0_axi_periph_M00_AXI_rdata = xdma_0_axi_periph_M00_AXI_RDATA;
  assign xdma_0_axi_periph_M00_AXI_RREADY = xdma_0_axi_periph_M00_AXI_rready;
  assign xdma_0_axi_periph_M00_AXI_rresp = xdma_0_axi_periph_M00_AXI_RRESP;
  assign xdma_0_axi_periph_M00_AXI_rvalid = xdma_0_axi_periph_M00_AXI_RVALID;
  assign xdma_0_axi_periph_M00_AXI_WDATA = xdma_0_axi_periph_M00_AXI_wdata;
  assign xdma_0_axi_periph_M00_AXI_wready = xdma_0_axi_periph_M00_AXI_WREADY;
  assign xdma_0_axi_periph_M00_AXI_WSTRB = xdma_0_axi_periph_M00_AXI_wstrb;
  assign xdma_0_axi_periph_M00_AXI_WVALID = xdma_0_axi_periph_M00_AXI_wvalid;
  assign xdma_0_axi_periph_S00_ACLK = xdma_0_axi_aclk;
  assign xdma_0_axi_periph_S00_ARESETN = xdma_0_axi_aresetn;
  assign xdma_0_axi_periph_S00_AXI_araddr = xdma_0_M_AXI_BYPASS_ARADDR;
  assign xdma_0_axi_periph_S00_AXI_arburst = xdma_0_M_AXI_BYPASS_ARBURST;
  assign xdma_0_axi_periph_S00_AXI_arcache = xdma_0_M_AXI_BYPASS_ARCACHE;
  assign xdma_0_axi_periph_S00_AXI_arid = xdma_0_M_AXI_BYPASS_ARID;
  assign xdma_0_axi_periph_S00_AXI_arlen = xdma_0_M_AXI_BYPASS_ARLEN;
  assign xdma_0_axi_periph_S00_AXI_arlock = xdma_0_M_AXI_BYPASS_ARLOCK;
  assign xdma_0_axi_periph_S00_AXI_arprot = xdma_0_M_AXI_BYPASS_ARPROT;
  assign xdma_0_M_AXI_BYPASS_ARREADY = xdma_0_axi_periph_S00_AXI_arready;
  assign xdma_0_axi_periph_S00_AXI_arsize = xdma_0_M_AXI_BYPASS_ARSIZE;
  assign xdma_0_axi_periph_S00_AXI_arvalid = xdma_0_M_AXI_BYPASS_ARVALID;
  assign xdma_0_axi_periph_S00_AXI_awaddr = xdma_0_M_AXI_BYPASS_AWADDR;
  assign xdma_0_axi_periph_S00_AXI_awburst = xdma_0_M_AXI_BYPASS_AWBURST;
  assign xdma_0_axi_periph_S00_AXI_awcache = xdma_0_M_AXI_BYPASS_AWCACHE;
  assign xdma_0_axi_periph_S00_AXI_awid = xdma_0_M_AXI_BYPASS_AWID;
  assign xdma_0_axi_periph_S00_AXI_awlen = xdma_0_M_AXI_BYPASS_AWLEN;
  assign xdma_0_axi_periph_S00_AXI_awlock = xdma_0_M_AXI_BYPASS_AWLOCK;
  assign xdma_0_axi_periph_S00_AXI_awprot = xdma_0_M_AXI_BYPASS_AWPROT;
  assign xdma_0_M_AXI_BYPASS_AWREADY = xdma_0_axi_periph_S00_AXI_awready;
  assign xdma_0_axi_periph_S00_AXI_awsize = xdma_0_M_AXI_BYPASS_AWSIZE;
  assign xdma_0_axi_periph_S00_AXI_awvalid = xdma_0_M_AXI_BYPASS_AWVALID;
  assign xdma_0_M_AXI_BYPASS_BID = xdma_0_axi_periph_S00_AXI_bid;
  assign xdma_0_axi_periph_S00_AXI_bready = xdma_0_M_AXI_BYPASS_BREADY;
  assign xdma_0_M_AXI_BYPASS_BRESP = xdma_0_axi_periph_S00_AXI_bresp;
  assign xdma_0_M_AXI_BYPASS_BVALID = xdma_0_axi_periph_S00_AXI_bvalid;
  assign xdma_0_M_AXI_BYPASS_RDATA = xdma_0_axi_periph_S00_AXI_rdata;
  assign xdma_0_M_AXI_BYPASS_RID = xdma_0_axi_periph_S00_AXI_rid;
  assign xdma_0_M_AXI_BYPASS_RLAST = xdma_0_axi_periph_S00_AXI_rlast;
  assign xdma_0_axi_periph_S00_AXI_rready = xdma_0_M_AXI_BYPASS_RREADY;
  assign xdma_0_M_AXI_BYPASS_RRESP = xdma_0_axi_periph_S00_AXI_rresp;
  assign xdma_0_M_AXI_BYPASS_RVALID = xdma_0_axi_periph_S00_AXI_rvalid;
  assign xdma_0_axi_periph_S00_AXI_wdata = xdma_0_M_AXI_BYPASS_WDATA;
  assign xdma_0_axi_periph_S00_AXI_wlast = xdma_0_M_AXI_BYPASS_WLAST;
  assign xdma_0_M_AXI_BYPASS_WREADY = xdma_0_axi_periph_S00_AXI_wready;
  assign xdma_0_axi_periph_S00_AXI_wstrb = xdma_0_M_AXI_BYPASS_WSTRB;
  assign xdma_0_axi_periph_S00_AXI_wvalid = xdma_0_M_AXI_BYPASS_WVALID;
endmodule
