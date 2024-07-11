`timescale 1 ns / 1 ps
// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.
// IP VLNV: xilinx.com:module_ref:kernel3:1.0
// IP Revision: 1
(* X_CORE_INFO = "kernel3,Vivado 2022.2" *)
(* CHECK_LICENSE_TYPE = "design_1_kernel3_0_0,kernel3,{}" *)
(* CORE_GENERATION_INFO = "design_1_kernel3_0_0,kernel3,{x_ipProduct=Vivado 2022.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=kernel3,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_CONTROL_DATA_WIDTH=32,C_S_AXI_CONTROL_ADDR_WIDTH=6,C_S_AXI_DATA_WIDTH=32,C_M_AXI_GMEM_A_ID_WIDTH=1,C_M_AXI_GMEM_A_ADDR_WIDTH=64,C_M_AXI_GMEM_A_DATA_WIDTH=512,C_M_AXI_GMEM_A_AWUSER_WIDTH=1,C_M_AXI_GMEM_A_ARUSER_WIDTH=1,C_M_AXI_GMEM_A_WUSER_WIDTH=1,C_M_AXI_GMEM_A_RUSER_WIDTH=1,C_M_AXI_GMEM_A_BUSER\
_WIDTH=1,C_M_AXI_GMEM_A_USER_VALUE=0,C_M_AXI_GMEM_A_PROT_VALUE=0,C_M_AXI_GMEM_A_CACHE_VALUE=3,C_M_AXI_DATA_WIDTH=32,C_M_AXI_GMEM_B_ID_WIDTH=1,C_M_AXI_GMEM_B_ADDR_WIDTH=64,C_M_AXI_GMEM_B_DATA_WIDTH=512,C_M_AXI_GMEM_B_AWUSER_WIDTH=1,C_M_AXI_GMEM_B_ARUSER_WIDTH=1,C_M_AXI_GMEM_B_WUSER_WIDTH=1,C_M_AXI_GMEM_B_RUSER_WIDTH=1,C_M_AXI_GMEM_B_BUSER_WIDTH=1,C_M_AXI_GMEM_B_USER_VALUE=0,C_M_AXI_GMEM_B_PROT_VALUE=0,C_M_AXI_GMEM_B_CACHE_VALUE=3,C_M_AXI_GMEM_C_ID_WIDTH=1,C_M_AXI_GMEM_C_ADDR_WIDTH=64,C_M_AXI_GMEM\
_C_DATA_WIDTH=512,C_M_AXI_GMEM_C_AWUSER_WIDTH=1,C_M_AXI_GMEM_C_ARUSER_WIDTH=1,C_M_AXI_GMEM_C_WUSER_WIDTH=1,C_M_AXI_GMEM_C_RUSER_WIDTH=1,C_M_AXI_GMEM_C_BUSER_WIDTH=1,C_M_AXI_GMEM_C_USER_VALUE=0,C_M_AXI_GMEM_C_PROT_VALUE=0,C_M_AXI_GMEM_C_CACHE_VALUE=3,C_S_AXI_CONTROL_WSTRB_WIDTH=4,C_S_AXI_WSTRB_WIDTH=4,C_M_AXI_GMEM_A_WSTRB_WIDTH=64,C_M_AXI_WSTRB_WIDTH=4,C_M_AXI_GMEM_B_WSTRB_WIDTH=64,C_M_AXI_GMEM_C_WSTRB_WIDTH=64}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)module __rs_design_1_kernel3_0_0_aux (
    input wire          s_axi_control_AWVALID,
    output wire         s_axi_control_AWREADY,
    input wire  [  5:0] s_axi_control_AWADDR,
    input wire          s_axi_control_WVALID,
    output wire         s_axi_control_WREADY,
    input wire  [ 31:0] s_axi_control_WDATA,
    input wire  [  3:0] s_axi_control_WSTRB,
    input wire          s_axi_control_ARVALID,
    output wire         s_axi_control_ARREADY,
    input wire  [  5:0] s_axi_control_ARADDR,
    output wire         s_axi_control_RVALID,
    input wire          s_axi_control_RREADY,
    output wire [ 31:0] s_axi_control_RDATA,
    output wire [  1:0] s_axi_control_RRESP,
    output wire         s_axi_control_BVALID,
    input wire          s_axi_control_BREADY,
    output wire [  1:0] s_axi_control_BRESP,
    input wire          ap_clk,
    input wire          ap_rst_n,
    output wire         interrupt,
    output wire         m_axi_gmem_A_AWVALID,
    input wire          m_axi_gmem_A_AWREADY,
    output wire [ 63:0] m_axi_gmem_A_AWADDR,
    output wire [  0:0] m_axi_gmem_A_AWID,
    output wire [  7:0] m_axi_gmem_A_AWLEN,
    output wire [  2:0] m_axi_gmem_A_AWSIZE,
    output wire [  1:0] m_axi_gmem_A_AWBURST,
    output wire [  1:0] m_axi_gmem_A_AWLOCK,
    output wire [  3:0] m_axi_gmem_A_AWCACHE,
    output wire [  2:0] m_axi_gmem_A_AWPROT,
    output wire [  3:0] m_axi_gmem_A_AWQOS,
    output wire [  3:0] m_axi_gmem_A_AWREGION,
    output wire [  0:0] m_axi_gmem_A_AWUSER,
    output wire         m_axi_gmem_A_WVALID,
    input wire          m_axi_gmem_A_WREADY,
    output wire [511:0] m_axi_gmem_A_WDATA,
    output wire [ 63:0] m_axi_gmem_A_WSTRB,
    output wire         m_axi_gmem_A_WLAST,
    output wire [  0:0] m_axi_gmem_A_WID,
    output wire [  0:0] m_axi_gmem_A_WUSER,
    output wire         m_axi_gmem_A_ARVALID,
    input wire          m_axi_gmem_A_ARREADY,
    output wire [ 63:0] m_axi_gmem_A_ARADDR,
    output wire [  0:0] m_axi_gmem_A_ARID,
    output wire [  7:0] m_axi_gmem_A_ARLEN,
    output wire [  2:0] m_axi_gmem_A_ARSIZE,
    output wire [  1:0] m_axi_gmem_A_ARBURST,
    output wire [  1:0] m_axi_gmem_A_ARLOCK,
    output wire [  3:0] m_axi_gmem_A_ARCACHE,
    output wire [  2:0] m_axi_gmem_A_ARPROT,
    output wire [  3:0] m_axi_gmem_A_ARQOS,
    output wire [  3:0] m_axi_gmem_A_ARREGION,
    output wire [  0:0] m_axi_gmem_A_ARUSER,
    input wire          m_axi_gmem_A_RVALID,
    output wire         m_axi_gmem_A_RREADY,
    input wire  [511:0] m_axi_gmem_A_RDATA,
    input wire          m_axi_gmem_A_RLAST,
    input wire  [  0:0] m_axi_gmem_A_RID,
    input wire  [  0:0] m_axi_gmem_A_RUSER,
    input wire  [  1:0] m_axi_gmem_A_RRESP,
    input wire          m_axi_gmem_A_BVALID,
    output wire         m_axi_gmem_A_BREADY,
    input wire  [  1:0] m_axi_gmem_A_BRESP,
    input wire  [  0:0] m_axi_gmem_A_BID,
    input wire  [  0:0] m_axi_gmem_A_BUSER,
    output wire         m_axi_gmem_B_AWVALID,
    input wire          m_axi_gmem_B_AWREADY,
    output wire [ 63:0] m_axi_gmem_B_AWADDR,
    output wire [  0:0] m_axi_gmem_B_AWID,
    output wire [  7:0] m_axi_gmem_B_AWLEN,
    output wire [  2:0] m_axi_gmem_B_AWSIZE,
    output wire [  1:0] m_axi_gmem_B_AWBURST,
    output wire [  1:0] m_axi_gmem_B_AWLOCK,
    output wire [  3:0] m_axi_gmem_B_AWCACHE,
    output wire [  2:0] m_axi_gmem_B_AWPROT,
    output wire [  3:0] m_axi_gmem_B_AWQOS,
    output wire [  3:0] m_axi_gmem_B_AWREGION,
    output wire [  0:0] m_axi_gmem_B_AWUSER,
    output wire         m_axi_gmem_B_WVALID,
    input wire          m_axi_gmem_B_WREADY,
    output wire [511:0] m_axi_gmem_B_WDATA,
    output wire [ 63:0] m_axi_gmem_B_WSTRB,
    output wire         m_axi_gmem_B_WLAST,
    output wire [  0:0] m_axi_gmem_B_WID,
    output wire [  0:0] m_axi_gmem_B_WUSER,
    output wire         m_axi_gmem_B_ARVALID,
    input wire          m_axi_gmem_B_ARREADY,
    output wire [ 63:0] m_axi_gmem_B_ARADDR,
    output wire [  0:0] m_axi_gmem_B_ARID,
    output wire [  7:0] m_axi_gmem_B_ARLEN,
    output wire [  2:0] m_axi_gmem_B_ARSIZE,
    output wire [  1:0] m_axi_gmem_B_ARBURST,
    output wire [  1:0] m_axi_gmem_B_ARLOCK,
    output wire [  3:0] m_axi_gmem_B_ARCACHE,
    output wire [  2:0] m_axi_gmem_B_ARPROT,
    output wire [  3:0] m_axi_gmem_B_ARQOS,
    output wire [  3:0] m_axi_gmem_B_ARREGION,
    output wire [  0:0] m_axi_gmem_B_ARUSER,
    input wire          m_axi_gmem_B_RVALID,
    output wire         m_axi_gmem_B_RREADY,
    input wire  [511:0] m_axi_gmem_B_RDATA,
    input wire          m_axi_gmem_B_RLAST,
    input wire  [  0:0] m_axi_gmem_B_RID,
    input wire  [  0:0] m_axi_gmem_B_RUSER,
    input wire  [  1:0] m_axi_gmem_B_RRESP,
    input wire          m_axi_gmem_B_BVALID,
    output wire         m_axi_gmem_B_BREADY,
    input wire  [  1:0] m_axi_gmem_B_BRESP,
    input wire  [  0:0] m_axi_gmem_B_BID,
    input wire  [  0:0] m_axi_gmem_B_BUSER,
    output wire         m_axi_gmem_C_AWVALID,
    input wire          m_axi_gmem_C_AWREADY,
    output wire [ 63:0] m_axi_gmem_C_AWADDR,
    output wire [  0:0] m_axi_gmem_C_AWID,
    output wire [  7:0] m_axi_gmem_C_AWLEN,
    output wire [  2:0] m_axi_gmem_C_AWSIZE,
    output wire [  1:0] m_axi_gmem_C_AWBURST,
    output wire [  1:0] m_axi_gmem_C_AWLOCK,
    output wire [  3:0] m_axi_gmem_C_AWCACHE,
    output wire [  2:0] m_axi_gmem_C_AWPROT,
    output wire [  3:0] m_axi_gmem_C_AWQOS,
    output wire [  3:0] m_axi_gmem_C_AWREGION,
    output wire [  0:0] m_axi_gmem_C_AWUSER,
    output wire         m_axi_gmem_C_WVALID,
    input wire          m_axi_gmem_C_WREADY,
    output wire [511:0] m_axi_gmem_C_WDATA,
    output wire [ 63:0] m_axi_gmem_C_WSTRB,
    output wire         m_axi_gmem_C_WLAST,
    output wire [  0:0] m_axi_gmem_C_WID,
    output wire [  0:0] m_axi_gmem_C_WUSER,
    output wire         m_axi_gmem_C_ARVALID,
    input wire          m_axi_gmem_C_ARREADY,
    output wire [ 63:0] m_axi_gmem_C_ARADDR,
    output wire [  0:0] m_axi_gmem_C_ARID,
    output wire [  7:0] m_axi_gmem_C_ARLEN,
    output wire [  2:0] m_axi_gmem_C_ARSIZE,
    output wire [  1:0] m_axi_gmem_C_ARBURST,
    output wire [  1:0] m_axi_gmem_C_ARLOCK,
    output wire [  3:0] m_axi_gmem_C_ARCACHE,
    output wire [  2:0] m_axi_gmem_C_ARPROT,
    output wire [  3:0] m_axi_gmem_C_ARQOS,
    output wire [  3:0] m_axi_gmem_C_ARREGION,
    output wire [  0:0] m_axi_gmem_C_ARUSER,
    input wire          m_axi_gmem_C_RVALID,
    output wire         m_axi_gmem_C_RREADY,
    input wire  [511:0] m_axi_gmem_C_RDATA,
    input wire          m_axi_gmem_C_RLAST,
    input wire  [  0:0] m_axi_gmem_C_RID,
    input wire  [  0:0] m_axi_gmem_C_RUSER,
    input wire  [  1:0] m_axi_gmem_C_RRESP,
    input wire          m_axi_gmem_C_BVALID,
    output wire         m_axi_gmem_C_BREADY,
    input wire  [  1:0] m_axi_gmem_C_BRESP,
    input wire  [  0:0] m_axi_gmem_C_BID,
    input wire  [  0:0] m_axi_gmem_C_BUSER,
    output wire         inst_ap_clk,
    output wire         inst_ap_rst_n,
    input wire          inst_interrupt,
    input wire  [ 63:0] inst_m_axi_gmem_A_ARADDR,
    input wire  [  1:0] inst_m_axi_gmem_A_ARBURST,
    input wire  [  3:0] inst_m_axi_gmem_A_ARCACHE,
    input wire  [  0:0] inst_m_axi_gmem_A_ARID,
    input wire  [  7:0] inst_m_axi_gmem_A_ARLEN,
    input wire  [  1:0] inst_m_axi_gmem_A_ARLOCK,
    input wire  [  2:0] inst_m_axi_gmem_A_ARPROT,
    input wire  [  3:0] inst_m_axi_gmem_A_ARQOS,
    output wire         inst_m_axi_gmem_A_ARREADY,
    input wire  [  3:0] inst_m_axi_gmem_A_ARREGION,
    input wire  [  2:0] inst_m_axi_gmem_A_ARSIZE,
    input wire  [  0:0] inst_m_axi_gmem_A_ARUSER,
    input wire          inst_m_axi_gmem_A_ARVALID,
    input wire  [ 63:0] inst_m_axi_gmem_A_AWADDR,
    input wire  [  1:0] inst_m_axi_gmem_A_AWBURST,
    input wire  [  3:0] inst_m_axi_gmem_A_AWCACHE,
    input wire  [  0:0] inst_m_axi_gmem_A_AWID,
    input wire  [  7:0] inst_m_axi_gmem_A_AWLEN,
    input wire  [  1:0] inst_m_axi_gmem_A_AWLOCK,
    input wire  [  2:0] inst_m_axi_gmem_A_AWPROT,
    input wire  [  3:0] inst_m_axi_gmem_A_AWQOS,
    output wire         inst_m_axi_gmem_A_AWREADY,
    input wire  [  3:0] inst_m_axi_gmem_A_AWREGION,
    input wire  [  2:0] inst_m_axi_gmem_A_AWSIZE,
    input wire  [  0:0] inst_m_axi_gmem_A_AWUSER,
    input wire          inst_m_axi_gmem_A_AWVALID,
    output wire [  0:0] inst_m_axi_gmem_A_BID,
    input wire          inst_m_axi_gmem_A_BREADY,
    output wire [  1:0] inst_m_axi_gmem_A_BRESP,
    output wire [  0:0] inst_m_axi_gmem_A_BUSER,
    output wire         inst_m_axi_gmem_A_BVALID,
    output wire [511:0] inst_m_axi_gmem_A_RDATA,
    output wire [  0:0] inst_m_axi_gmem_A_RID,
    output wire         inst_m_axi_gmem_A_RLAST,
    input wire          inst_m_axi_gmem_A_RREADY,
    output wire [  1:0] inst_m_axi_gmem_A_RRESP,
    output wire [  0:0] inst_m_axi_gmem_A_RUSER,
    output wire         inst_m_axi_gmem_A_RVALID,
    input wire  [511:0] inst_m_axi_gmem_A_WDATA,
    input wire  [  0:0] inst_m_axi_gmem_A_WID,
    input wire          inst_m_axi_gmem_A_WLAST,
    output wire         inst_m_axi_gmem_A_WREADY,
    input wire  [ 63:0] inst_m_axi_gmem_A_WSTRB,
    input wire  [  0:0] inst_m_axi_gmem_A_WUSER,
    input wire          inst_m_axi_gmem_A_WVALID,
    input wire  [ 63:0] inst_m_axi_gmem_B_ARADDR,
    input wire  [  1:0] inst_m_axi_gmem_B_ARBURST,
    input wire  [  3:0] inst_m_axi_gmem_B_ARCACHE,
    input wire  [  0:0] inst_m_axi_gmem_B_ARID,
    input wire  [  7:0] inst_m_axi_gmem_B_ARLEN,
    input wire  [  1:0] inst_m_axi_gmem_B_ARLOCK,
    input wire  [  2:0] inst_m_axi_gmem_B_ARPROT,
    input wire  [  3:0] inst_m_axi_gmem_B_ARQOS,
    output wire         inst_m_axi_gmem_B_ARREADY,
    input wire  [  3:0] inst_m_axi_gmem_B_ARREGION,
    input wire  [  2:0] inst_m_axi_gmem_B_ARSIZE,
    input wire  [  0:0] inst_m_axi_gmem_B_ARUSER,
    input wire          inst_m_axi_gmem_B_ARVALID,
    input wire  [ 63:0] inst_m_axi_gmem_B_AWADDR,
    input wire  [  1:0] inst_m_axi_gmem_B_AWBURST,
    input wire  [  3:0] inst_m_axi_gmem_B_AWCACHE,
    input wire  [  0:0] inst_m_axi_gmem_B_AWID,
    input wire  [  7:0] inst_m_axi_gmem_B_AWLEN,
    input wire  [  1:0] inst_m_axi_gmem_B_AWLOCK,
    input wire  [  2:0] inst_m_axi_gmem_B_AWPROT,
    input wire  [  3:0] inst_m_axi_gmem_B_AWQOS,
    output wire         inst_m_axi_gmem_B_AWREADY,
    input wire  [  3:0] inst_m_axi_gmem_B_AWREGION,
    input wire  [  2:0] inst_m_axi_gmem_B_AWSIZE,
    input wire  [  0:0] inst_m_axi_gmem_B_AWUSER,
    input wire          inst_m_axi_gmem_B_AWVALID,
    output wire [  0:0] inst_m_axi_gmem_B_BID,
    input wire          inst_m_axi_gmem_B_BREADY,
    output wire [  1:0] inst_m_axi_gmem_B_BRESP,
    output wire [  0:0] inst_m_axi_gmem_B_BUSER,
    output wire         inst_m_axi_gmem_B_BVALID,
    output wire [511:0] inst_m_axi_gmem_B_RDATA,
    output wire [  0:0] inst_m_axi_gmem_B_RID,
    output wire         inst_m_axi_gmem_B_RLAST,
    input wire          inst_m_axi_gmem_B_RREADY,
    output wire [  1:0] inst_m_axi_gmem_B_RRESP,
    output wire [  0:0] inst_m_axi_gmem_B_RUSER,
    output wire         inst_m_axi_gmem_B_RVALID,
    input wire  [511:0] inst_m_axi_gmem_B_WDATA,
    input wire  [  0:0] inst_m_axi_gmem_B_WID,
    input wire          inst_m_axi_gmem_B_WLAST,
    output wire         inst_m_axi_gmem_B_WREADY,
    input wire  [ 63:0] inst_m_axi_gmem_B_WSTRB,
    input wire  [  0:0] inst_m_axi_gmem_B_WUSER,
    input wire          inst_m_axi_gmem_B_WVALID,
    input wire  [ 63:0] inst_m_axi_gmem_C_ARADDR,
    input wire  [  1:0] inst_m_axi_gmem_C_ARBURST,
    input wire  [  3:0] inst_m_axi_gmem_C_ARCACHE,
    input wire  [  0:0] inst_m_axi_gmem_C_ARID,
    input wire  [  7:0] inst_m_axi_gmem_C_ARLEN,
    input wire  [  1:0] inst_m_axi_gmem_C_ARLOCK,
    input wire  [  2:0] inst_m_axi_gmem_C_ARPROT,
    input wire  [  3:0] inst_m_axi_gmem_C_ARQOS,
    output wire         inst_m_axi_gmem_C_ARREADY,
    input wire  [  3:0] inst_m_axi_gmem_C_ARREGION,
    input wire  [  2:0] inst_m_axi_gmem_C_ARSIZE,
    input wire  [  0:0] inst_m_axi_gmem_C_ARUSER,
    input wire          inst_m_axi_gmem_C_ARVALID,
    input wire  [ 63:0] inst_m_axi_gmem_C_AWADDR,
    input wire  [  1:0] inst_m_axi_gmem_C_AWBURST,
    input wire  [  3:0] inst_m_axi_gmem_C_AWCACHE,
    input wire  [  0:0] inst_m_axi_gmem_C_AWID,
    input wire  [  7:0] inst_m_axi_gmem_C_AWLEN,
    input wire  [  1:0] inst_m_axi_gmem_C_AWLOCK,
    input wire  [  2:0] inst_m_axi_gmem_C_AWPROT,
    input wire  [  3:0] inst_m_axi_gmem_C_AWQOS,
    output wire         inst_m_axi_gmem_C_AWREADY,
    input wire  [  3:0] inst_m_axi_gmem_C_AWREGION,
    input wire  [  2:0] inst_m_axi_gmem_C_AWSIZE,
    input wire  [  0:0] inst_m_axi_gmem_C_AWUSER,
    input wire          inst_m_axi_gmem_C_AWVALID,
    output wire [  0:0] inst_m_axi_gmem_C_BID,
    input wire          inst_m_axi_gmem_C_BREADY,
    output wire [  1:0] inst_m_axi_gmem_C_BRESP,
    output wire [  0:0] inst_m_axi_gmem_C_BUSER,
    output wire         inst_m_axi_gmem_C_BVALID,
    output wire [511:0] inst_m_axi_gmem_C_RDATA,
    output wire [  0:0] inst_m_axi_gmem_C_RID,
    output wire         inst_m_axi_gmem_C_RLAST,
    input wire          inst_m_axi_gmem_C_RREADY,
    output wire [  1:0] inst_m_axi_gmem_C_RRESP,
    output wire [  0:0] inst_m_axi_gmem_C_RUSER,
    output wire         inst_m_axi_gmem_C_RVALID,
    input wire  [511:0] inst_m_axi_gmem_C_WDATA,
    input wire  [  0:0] inst_m_axi_gmem_C_WID,
    input wire          inst_m_axi_gmem_C_WLAST,
    output wire         inst_m_axi_gmem_C_WREADY,
    input wire  [ 63:0] inst_m_axi_gmem_C_WSTRB,
    input wire  [  0:0] inst_m_axi_gmem_C_WUSER,
    input wire          inst_m_axi_gmem_C_WVALID,
    output wire [  5:0] inst_s_axi_control_ARADDR,
    input wire          inst_s_axi_control_ARREADY,
    output wire         inst_s_axi_control_ARVALID,
    output wire [  5:0] inst_s_axi_control_AWADDR,
    input wire          inst_s_axi_control_AWREADY,
    output wire         inst_s_axi_control_AWVALID,
    output wire         inst_s_axi_control_BREADY,
    input wire  [  1:0] inst_s_axi_control_BRESP,
    input wire          inst_s_axi_control_BVALID,
    input wire  [ 31:0] inst_s_axi_control_RDATA,
    output wire         inst_s_axi_control_RREADY,
    input wire  [  1:0] inst_s_axi_control_RRESP,
    input wire          inst_s_axi_control_RVALID,
    output wire [ 31:0] inst_s_axi_control_WDATA,
    input wire          inst_s_axi_control_WREADY,
    output wire [  3:0] inst_s_axi_control_WSTRB,
    output wire         inst_s_axi_control_WVALID
);
  assign inst_ap_clk = ap_clk;
  assign inst_ap_rst_n = ap_rst_n;
  assign interrupt = inst_interrupt;
  assign m_axi_gmem_A_ARADDR = inst_m_axi_gmem_A_ARADDR;
  assign m_axi_gmem_A_ARBURST = inst_m_axi_gmem_A_ARBURST;
  assign m_axi_gmem_A_ARCACHE = inst_m_axi_gmem_A_ARCACHE;
  assign m_axi_gmem_A_ARID = inst_m_axi_gmem_A_ARID;
  assign m_axi_gmem_A_ARLEN = inst_m_axi_gmem_A_ARLEN;
  assign m_axi_gmem_A_ARLOCK = inst_m_axi_gmem_A_ARLOCK;
  assign m_axi_gmem_A_ARPROT = inst_m_axi_gmem_A_ARPROT;
  assign m_axi_gmem_A_ARQOS = inst_m_axi_gmem_A_ARQOS;
  assign inst_m_axi_gmem_A_ARREADY = m_axi_gmem_A_ARREADY;
  assign m_axi_gmem_A_ARREGION = inst_m_axi_gmem_A_ARREGION;
  assign m_axi_gmem_A_ARSIZE = inst_m_axi_gmem_A_ARSIZE;
  assign m_axi_gmem_A_ARUSER = inst_m_axi_gmem_A_ARUSER;
  assign m_axi_gmem_A_ARVALID = inst_m_axi_gmem_A_ARVALID;
  assign m_axi_gmem_A_AWADDR = inst_m_axi_gmem_A_AWADDR;
  assign m_axi_gmem_A_AWBURST = inst_m_axi_gmem_A_AWBURST;
  assign m_axi_gmem_A_AWCACHE = inst_m_axi_gmem_A_AWCACHE;
  assign m_axi_gmem_A_AWID = inst_m_axi_gmem_A_AWID;
  assign m_axi_gmem_A_AWLEN = inst_m_axi_gmem_A_AWLEN;
  assign m_axi_gmem_A_AWLOCK = inst_m_axi_gmem_A_AWLOCK;
  assign m_axi_gmem_A_AWPROT = inst_m_axi_gmem_A_AWPROT;
  assign m_axi_gmem_A_AWQOS = inst_m_axi_gmem_A_AWQOS;
  assign inst_m_axi_gmem_A_AWREADY = m_axi_gmem_A_AWREADY;
  assign m_axi_gmem_A_AWREGION = inst_m_axi_gmem_A_AWREGION;
  assign m_axi_gmem_A_AWSIZE = inst_m_axi_gmem_A_AWSIZE;
  assign m_axi_gmem_A_AWUSER = inst_m_axi_gmem_A_AWUSER;
  assign m_axi_gmem_A_AWVALID = inst_m_axi_gmem_A_AWVALID;
  assign inst_m_axi_gmem_A_BID = m_axi_gmem_A_BID;
  assign m_axi_gmem_A_BREADY = inst_m_axi_gmem_A_BREADY;
  assign inst_m_axi_gmem_A_BRESP = m_axi_gmem_A_BRESP;
  assign inst_m_axi_gmem_A_BUSER = m_axi_gmem_A_BUSER;
  assign inst_m_axi_gmem_A_BVALID = m_axi_gmem_A_BVALID;
  assign inst_m_axi_gmem_A_RDATA = m_axi_gmem_A_RDATA;
  assign inst_m_axi_gmem_A_RID = m_axi_gmem_A_RID;
  assign inst_m_axi_gmem_A_RLAST = m_axi_gmem_A_RLAST;
  assign m_axi_gmem_A_RREADY = inst_m_axi_gmem_A_RREADY;
  assign inst_m_axi_gmem_A_RRESP = m_axi_gmem_A_RRESP;
  assign inst_m_axi_gmem_A_RUSER = m_axi_gmem_A_RUSER;
  assign inst_m_axi_gmem_A_RVALID = m_axi_gmem_A_RVALID;
  assign m_axi_gmem_A_WDATA = inst_m_axi_gmem_A_WDATA;
  assign m_axi_gmem_A_WID = inst_m_axi_gmem_A_WID;
  assign m_axi_gmem_A_WLAST = inst_m_axi_gmem_A_WLAST;
  assign inst_m_axi_gmem_A_WREADY = m_axi_gmem_A_WREADY;
  assign m_axi_gmem_A_WSTRB = inst_m_axi_gmem_A_WSTRB;
  assign m_axi_gmem_A_WUSER = inst_m_axi_gmem_A_WUSER;
  assign m_axi_gmem_A_WVALID = inst_m_axi_gmem_A_WVALID;
  assign m_axi_gmem_B_ARADDR = inst_m_axi_gmem_B_ARADDR;
  assign m_axi_gmem_B_ARBURST = inst_m_axi_gmem_B_ARBURST;
  assign m_axi_gmem_B_ARCACHE = inst_m_axi_gmem_B_ARCACHE;
  assign m_axi_gmem_B_ARID = inst_m_axi_gmem_B_ARID;
  assign m_axi_gmem_B_ARLEN = inst_m_axi_gmem_B_ARLEN;
  assign m_axi_gmem_B_ARLOCK = inst_m_axi_gmem_B_ARLOCK;
  assign m_axi_gmem_B_ARPROT = inst_m_axi_gmem_B_ARPROT;
  assign m_axi_gmem_B_ARQOS = inst_m_axi_gmem_B_ARQOS;
  assign inst_m_axi_gmem_B_ARREADY = m_axi_gmem_B_ARREADY;
  assign m_axi_gmem_B_ARREGION = inst_m_axi_gmem_B_ARREGION;
  assign m_axi_gmem_B_ARSIZE = inst_m_axi_gmem_B_ARSIZE;
  assign m_axi_gmem_B_ARUSER = inst_m_axi_gmem_B_ARUSER;
  assign m_axi_gmem_B_ARVALID = inst_m_axi_gmem_B_ARVALID;
  assign m_axi_gmem_B_AWADDR = inst_m_axi_gmem_B_AWADDR;
  assign m_axi_gmem_B_AWBURST = inst_m_axi_gmem_B_AWBURST;
  assign m_axi_gmem_B_AWCACHE = inst_m_axi_gmem_B_AWCACHE;
  assign m_axi_gmem_B_AWID = inst_m_axi_gmem_B_AWID;
  assign m_axi_gmem_B_AWLEN = inst_m_axi_gmem_B_AWLEN;
  assign m_axi_gmem_B_AWLOCK = inst_m_axi_gmem_B_AWLOCK;
  assign m_axi_gmem_B_AWPROT = inst_m_axi_gmem_B_AWPROT;
  assign m_axi_gmem_B_AWQOS = inst_m_axi_gmem_B_AWQOS;
  assign inst_m_axi_gmem_B_AWREADY = m_axi_gmem_B_AWREADY;
  assign m_axi_gmem_B_AWREGION = inst_m_axi_gmem_B_AWREGION;
  assign m_axi_gmem_B_AWSIZE = inst_m_axi_gmem_B_AWSIZE;
  assign m_axi_gmem_B_AWUSER = inst_m_axi_gmem_B_AWUSER;
  assign m_axi_gmem_B_AWVALID = inst_m_axi_gmem_B_AWVALID;
  assign inst_m_axi_gmem_B_BID = m_axi_gmem_B_BID;
  assign m_axi_gmem_B_BREADY = inst_m_axi_gmem_B_BREADY;
  assign inst_m_axi_gmem_B_BRESP = m_axi_gmem_B_BRESP;
  assign inst_m_axi_gmem_B_BUSER = m_axi_gmem_B_BUSER;
  assign inst_m_axi_gmem_B_BVALID = m_axi_gmem_B_BVALID;
  assign inst_m_axi_gmem_B_RDATA = m_axi_gmem_B_RDATA;
  assign inst_m_axi_gmem_B_RID = m_axi_gmem_B_RID;
  assign inst_m_axi_gmem_B_RLAST = m_axi_gmem_B_RLAST;
  assign m_axi_gmem_B_RREADY = inst_m_axi_gmem_B_RREADY;
  assign inst_m_axi_gmem_B_RRESP = m_axi_gmem_B_RRESP;
  assign inst_m_axi_gmem_B_RUSER = m_axi_gmem_B_RUSER;
  assign inst_m_axi_gmem_B_RVALID = m_axi_gmem_B_RVALID;
  assign m_axi_gmem_B_WDATA = inst_m_axi_gmem_B_WDATA;
  assign m_axi_gmem_B_WID = inst_m_axi_gmem_B_WID;
  assign m_axi_gmem_B_WLAST = inst_m_axi_gmem_B_WLAST;
  assign inst_m_axi_gmem_B_WREADY = m_axi_gmem_B_WREADY;
  assign m_axi_gmem_B_WSTRB = inst_m_axi_gmem_B_WSTRB;
  assign m_axi_gmem_B_WUSER = inst_m_axi_gmem_B_WUSER;
  assign m_axi_gmem_B_WVALID = inst_m_axi_gmem_B_WVALID;
  assign m_axi_gmem_C_ARADDR = inst_m_axi_gmem_C_ARADDR;
  assign m_axi_gmem_C_ARBURST = inst_m_axi_gmem_C_ARBURST;
  assign m_axi_gmem_C_ARCACHE = inst_m_axi_gmem_C_ARCACHE;
  assign m_axi_gmem_C_ARID = inst_m_axi_gmem_C_ARID;
  assign m_axi_gmem_C_ARLEN = inst_m_axi_gmem_C_ARLEN;
  assign m_axi_gmem_C_ARLOCK = inst_m_axi_gmem_C_ARLOCK;
  assign m_axi_gmem_C_ARPROT = inst_m_axi_gmem_C_ARPROT;
  assign m_axi_gmem_C_ARQOS = inst_m_axi_gmem_C_ARQOS;
  assign inst_m_axi_gmem_C_ARREADY = m_axi_gmem_C_ARREADY;
  assign m_axi_gmem_C_ARREGION = inst_m_axi_gmem_C_ARREGION;
  assign m_axi_gmem_C_ARSIZE = inst_m_axi_gmem_C_ARSIZE;
  assign m_axi_gmem_C_ARUSER = inst_m_axi_gmem_C_ARUSER;
  assign m_axi_gmem_C_ARVALID = inst_m_axi_gmem_C_ARVALID;
  assign m_axi_gmem_C_AWADDR = inst_m_axi_gmem_C_AWADDR;
  assign m_axi_gmem_C_AWBURST = inst_m_axi_gmem_C_AWBURST;
  assign m_axi_gmem_C_AWCACHE = inst_m_axi_gmem_C_AWCACHE;
  assign m_axi_gmem_C_AWID = inst_m_axi_gmem_C_AWID;
  assign m_axi_gmem_C_AWLEN = inst_m_axi_gmem_C_AWLEN;
  assign m_axi_gmem_C_AWLOCK = inst_m_axi_gmem_C_AWLOCK;
  assign m_axi_gmem_C_AWPROT = inst_m_axi_gmem_C_AWPROT;
  assign m_axi_gmem_C_AWQOS = inst_m_axi_gmem_C_AWQOS;
  assign inst_m_axi_gmem_C_AWREADY = m_axi_gmem_C_AWREADY;
  assign m_axi_gmem_C_AWREGION = inst_m_axi_gmem_C_AWREGION;
  assign m_axi_gmem_C_AWSIZE = inst_m_axi_gmem_C_AWSIZE;
  assign m_axi_gmem_C_AWUSER = inst_m_axi_gmem_C_AWUSER;
  assign m_axi_gmem_C_AWVALID = inst_m_axi_gmem_C_AWVALID;
  assign inst_m_axi_gmem_C_BID = m_axi_gmem_C_BID;
  assign m_axi_gmem_C_BREADY = inst_m_axi_gmem_C_BREADY;
  assign inst_m_axi_gmem_C_BRESP = m_axi_gmem_C_BRESP;
  assign inst_m_axi_gmem_C_BUSER = m_axi_gmem_C_BUSER;
  assign inst_m_axi_gmem_C_BVALID = m_axi_gmem_C_BVALID;
  assign inst_m_axi_gmem_C_RDATA = m_axi_gmem_C_RDATA;
  assign inst_m_axi_gmem_C_RID = m_axi_gmem_C_RID;
  assign inst_m_axi_gmem_C_RLAST = m_axi_gmem_C_RLAST;
  assign m_axi_gmem_C_RREADY = inst_m_axi_gmem_C_RREADY;
  assign inst_m_axi_gmem_C_RRESP = m_axi_gmem_C_RRESP;
  assign inst_m_axi_gmem_C_RUSER = m_axi_gmem_C_RUSER;
  assign inst_m_axi_gmem_C_RVALID = m_axi_gmem_C_RVALID;
  assign m_axi_gmem_C_WDATA = inst_m_axi_gmem_C_WDATA;
  assign m_axi_gmem_C_WID = inst_m_axi_gmem_C_WID;
  assign m_axi_gmem_C_WLAST = inst_m_axi_gmem_C_WLAST;
  assign inst_m_axi_gmem_C_WREADY = m_axi_gmem_C_WREADY;
  assign m_axi_gmem_C_WSTRB = inst_m_axi_gmem_C_WSTRB;
  assign m_axi_gmem_C_WUSER = inst_m_axi_gmem_C_WUSER;
  assign m_axi_gmem_C_WVALID = inst_m_axi_gmem_C_WVALID;
  assign inst_s_axi_control_ARADDR = s_axi_control_ARADDR;
  assign s_axi_control_ARREADY = inst_s_axi_control_ARREADY;
  assign inst_s_axi_control_ARVALID = s_axi_control_ARVALID;
  assign inst_s_axi_control_AWADDR = s_axi_control_AWADDR;
  assign s_axi_control_AWREADY = inst_s_axi_control_AWREADY;
  assign inst_s_axi_control_AWVALID = s_axi_control_AWVALID;
  assign inst_s_axi_control_BREADY = s_axi_control_BREADY;
  assign s_axi_control_BRESP = inst_s_axi_control_BRESP;
  assign s_axi_control_BVALID = inst_s_axi_control_BVALID;
  assign s_axi_control_RDATA = inst_s_axi_control_RDATA;
  assign inst_s_axi_control_RREADY = s_axi_control_RREADY;
  assign s_axi_control_RRESP = inst_s_axi_control_RRESP;
  assign s_axi_control_RVALID = inst_s_axi_control_RVALID;
  assign inst_s_axi_control_WDATA = s_axi_control_WDATA;
  assign s_axi_control_WREADY = inst_s_axi_control_WREADY;
  assign inst_s_axi_control_WSTRB = s_axi_control_WSTRB;
  assign inst_s_axi_control_WVALID = s_axi_control_WVALID;
endmodule
