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
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_kernel3_0_0 (
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
  m_axi_gmem_A_AWVALID,
  m_axi_gmem_A_AWREADY,
  m_axi_gmem_A_AWADDR,
  m_axi_gmem_A_AWID,
  m_axi_gmem_A_AWLEN,
  m_axi_gmem_A_AWSIZE,
  m_axi_gmem_A_AWBURST,
  m_axi_gmem_A_AWLOCK,
  m_axi_gmem_A_AWCACHE,
  m_axi_gmem_A_AWPROT,
  m_axi_gmem_A_AWQOS,
  m_axi_gmem_A_AWREGION,
  m_axi_gmem_A_AWUSER,
  m_axi_gmem_A_WVALID,
  m_axi_gmem_A_WREADY,
  m_axi_gmem_A_WDATA,
  m_axi_gmem_A_WSTRB,
  m_axi_gmem_A_WLAST,
  m_axi_gmem_A_WID,
  m_axi_gmem_A_WUSER,
  m_axi_gmem_A_ARVALID,
  m_axi_gmem_A_ARREADY,
  m_axi_gmem_A_ARADDR,
  m_axi_gmem_A_ARID,
  m_axi_gmem_A_ARLEN,
  m_axi_gmem_A_ARSIZE,
  m_axi_gmem_A_ARBURST,
  m_axi_gmem_A_ARLOCK,
  m_axi_gmem_A_ARCACHE,
  m_axi_gmem_A_ARPROT,
  m_axi_gmem_A_ARQOS,
  m_axi_gmem_A_ARREGION,
  m_axi_gmem_A_ARUSER,
  m_axi_gmem_A_RVALID,
  m_axi_gmem_A_RREADY,
  m_axi_gmem_A_RDATA,
  m_axi_gmem_A_RLAST,
  m_axi_gmem_A_RID,
  m_axi_gmem_A_RUSER,
  m_axi_gmem_A_RRESP,
  m_axi_gmem_A_BVALID,
  m_axi_gmem_A_BREADY,
  m_axi_gmem_A_BRESP,
  m_axi_gmem_A_BID,
  m_axi_gmem_A_BUSER,
  m_axi_gmem_B_AWVALID,
  m_axi_gmem_B_AWREADY,
  m_axi_gmem_B_AWADDR,
  m_axi_gmem_B_AWID,
  m_axi_gmem_B_AWLEN,
  m_axi_gmem_B_AWSIZE,
  m_axi_gmem_B_AWBURST,
  m_axi_gmem_B_AWLOCK,
  m_axi_gmem_B_AWCACHE,
  m_axi_gmem_B_AWPROT,
  m_axi_gmem_B_AWQOS,
  m_axi_gmem_B_AWREGION,
  m_axi_gmem_B_AWUSER,
  m_axi_gmem_B_WVALID,
  m_axi_gmem_B_WREADY,
  m_axi_gmem_B_WDATA,
  m_axi_gmem_B_WSTRB,
  m_axi_gmem_B_WLAST,
  m_axi_gmem_B_WID,
  m_axi_gmem_B_WUSER,
  m_axi_gmem_B_ARVALID,
  m_axi_gmem_B_ARREADY,
  m_axi_gmem_B_ARADDR,
  m_axi_gmem_B_ARID,
  m_axi_gmem_B_ARLEN,
  m_axi_gmem_B_ARSIZE,
  m_axi_gmem_B_ARBURST,
  m_axi_gmem_B_ARLOCK,
  m_axi_gmem_B_ARCACHE,
  m_axi_gmem_B_ARPROT,
  m_axi_gmem_B_ARQOS,
  m_axi_gmem_B_ARREGION,
  m_axi_gmem_B_ARUSER,
  m_axi_gmem_B_RVALID,
  m_axi_gmem_B_RREADY,
  m_axi_gmem_B_RDATA,
  m_axi_gmem_B_RLAST,
  m_axi_gmem_B_RID,
  m_axi_gmem_B_RUSER,
  m_axi_gmem_B_RRESP,
  m_axi_gmem_B_BVALID,
  m_axi_gmem_B_BREADY,
  m_axi_gmem_B_BRESP,
  m_axi_gmem_B_BID,
  m_axi_gmem_B_BUSER,
  m_axi_gmem_C_AWVALID,
  m_axi_gmem_C_AWREADY,
  m_axi_gmem_C_AWADDR,
  m_axi_gmem_C_AWID,
  m_axi_gmem_C_AWLEN,
  m_axi_gmem_C_AWSIZE,
  m_axi_gmem_C_AWBURST,
  m_axi_gmem_C_AWLOCK,
  m_axi_gmem_C_AWCACHE,
  m_axi_gmem_C_AWPROT,
  m_axi_gmem_C_AWQOS,
  m_axi_gmem_C_AWREGION,
  m_axi_gmem_C_AWUSER,
  m_axi_gmem_C_WVALID,
  m_axi_gmem_C_WREADY,
  m_axi_gmem_C_WDATA,
  m_axi_gmem_C_WSTRB,
  m_axi_gmem_C_WLAST,
  m_axi_gmem_C_WID,
  m_axi_gmem_C_WUSER,
  m_axi_gmem_C_ARVALID,
  m_axi_gmem_C_ARREADY,
  m_axi_gmem_C_ARADDR,
  m_axi_gmem_C_ARID,
  m_axi_gmem_C_ARLEN,
  m_axi_gmem_C_ARSIZE,
  m_axi_gmem_C_ARBURST,
  m_axi_gmem_C_ARLOCK,
  m_axi_gmem_C_ARCACHE,
  m_axi_gmem_C_ARPROT,
  m_axi_gmem_C_ARQOS,
  m_axi_gmem_C_ARREGION,
  m_axi_gmem_C_ARUSER,
  m_axi_gmem_C_RVALID,
  m_axi_gmem_C_RREADY,
  m_axi_gmem_C_RDATA,
  m_axi_gmem_C_RLAST,
  m_axi_gmem_C_RID,
  m_axi_gmem_C_RUSER,
  m_axi_gmem_C_RRESP,
  m_axi_gmem_C_BVALID,
  m_axi_gmem_C_BREADY,
  m_axi_gmem_C_BRESP,
  m_axi_gmem_C_BID,
  m_axi_gmem_C_BUSER
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *)
input wire s_axi_control_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *)
output wire s_axi_control_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *)
input wire [5 : 0] s_axi_control_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *)
input wire s_axi_control_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *)
output wire s_axi_control_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *)
input wire [31 : 0] s_axi_control_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *)
input wire [3 : 0] s_axi_control_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *)
input wire s_axi_control_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *)
output wire s_axi_control_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *)
input wire [5 : 0] s_axi_control_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *)
output wire s_axi_control_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *)
input wire s_axi_control_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *)
output wire [31 : 0] s_axi_control_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *)
output wire [1 : 0] s_axi_control_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *)
output wire s_axi_control_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *)
input wire s_axi_control_BREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 400000000, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, NUM_READ_THREADS 2, NUM_WRITE_THREADS 2, RUSER_BITS_PER_BYTE 0, \
WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *)
output wire [1 : 0] s_axi_control_BRESP;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 400000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_kernel_clk_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWVALID" *)
output wire m_axi_gmem_A_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWREADY" *)
input wire m_axi_gmem_A_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWADDR" *)
output wire [63 : 0] m_axi_gmem_A_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWID" *)
output wire [0 : 0] m_axi_gmem_A_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWLEN" *)
output wire [7 : 0] m_axi_gmem_A_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWSIZE" *)
output wire [2 : 0] m_axi_gmem_A_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWBURST" *)
output wire [1 : 0] m_axi_gmem_A_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWLOCK" *)
output wire [1 : 0] m_axi_gmem_A_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWCACHE" *)
output wire [3 : 0] m_axi_gmem_A_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWPROT" *)
output wire [2 : 0] m_axi_gmem_A_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWQOS" *)
output wire [3 : 0] m_axi_gmem_A_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWREGION" *)
output wire [3 : 0] m_axi_gmem_A_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A AWUSER" *)
output wire [0 : 0] m_axi_gmem_A_AWUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A WVALID" *)
output wire m_axi_gmem_A_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A WREADY" *)
input wire m_axi_gmem_A_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A WDATA" *)
output wire [511 : 0] m_axi_gmem_A_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A WSTRB" *)
output wire [63 : 0] m_axi_gmem_A_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A WLAST" *)
output wire m_axi_gmem_A_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A WID" *)
output wire [0 : 0] m_axi_gmem_A_WID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A WUSER" *)
output wire [0 : 0] m_axi_gmem_A_WUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARVALID" *)
output wire m_axi_gmem_A_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARREADY" *)
input wire m_axi_gmem_A_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARADDR" *)
output wire [63 : 0] m_axi_gmem_A_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARID" *)
output wire [0 : 0] m_axi_gmem_A_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARLEN" *)
output wire [7 : 0] m_axi_gmem_A_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARSIZE" *)
output wire [2 : 0] m_axi_gmem_A_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARBURST" *)
output wire [1 : 0] m_axi_gmem_A_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARLOCK" *)
output wire [1 : 0] m_axi_gmem_A_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARCACHE" *)
output wire [3 : 0] m_axi_gmem_A_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARPROT" *)
output wire [2 : 0] m_axi_gmem_A_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARQOS" *)
output wire [3 : 0] m_axi_gmem_A_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARREGION" *)
output wire [3 : 0] m_axi_gmem_A_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A ARUSER" *)
output wire [0 : 0] m_axi_gmem_A_ARUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A RVALID" *)
input wire m_axi_gmem_A_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A RREADY" *)
output wire m_axi_gmem_A_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A RDATA" *)
input wire [511 : 0] m_axi_gmem_A_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A RLAST" *)
input wire m_axi_gmem_A_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A RID" *)
input wire [0 : 0] m_axi_gmem_A_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A RUSER" *)
input wire [0 : 0] m_axi_gmem_A_RUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A RRESP" *)
input wire [1 : 0] m_axi_gmem_A_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A BVALID" *)
input wire m_axi_gmem_A_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A BREADY" *)
output wire m_axi_gmem_A_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A BRESP" *)
input wire [1 : 0] m_axi_gmem_A_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A BID" *)
input wire [0 : 0] m_axi_gmem_A_BID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_gmem_A, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 400000000, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, W\
USER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_A BUSER" *)
input wire [0 : 0] m_axi_gmem_A_BUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWVALID" *)
output wire m_axi_gmem_B_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWREADY" *)
input wire m_axi_gmem_B_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWADDR" *)
output wire [63 : 0] m_axi_gmem_B_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWID" *)
output wire [0 : 0] m_axi_gmem_B_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWLEN" *)
output wire [7 : 0] m_axi_gmem_B_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWSIZE" *)
output wire [2 : 0] m_axi_gmem_B_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWBURST" *)
output wire [1 : 0] m_axi_gmem_B_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWLOCK" *)
output wire [1 : 0] m_axi_gmem_B_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWCACHE" *)
output wire [3 : 0] m_axi_gmem_B_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWPROT" *)
output wire [2 : 0] m_axi_gmem_B_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWQOS" *)
output wire [3 : 0] m_axi_gmem_B_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWREGION" *)
output wire [3 : 0] m_axi_gmem_B_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B AWUSER" *)
output wire [0 : 0] m_axi_gmem_B_AWUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B WVALID" *)
output wire m_axi_gmem_B_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B WREADY" *)
input wire m_axi_gmem_B_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B WDATA" *)
output wire [511 : 0] m_axi_gmem_B_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B WSTRB" *)
output wire [63 : 0] m_axi_gmem_B_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B WLAST" *)
output wire m_axi_gmem_B_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B WID" *)
output wire [0 : 0] m_axi_gmem_B_WID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B WUSER" *)
output wire [0 : 0] m_axi_gmem_B_WUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARVALID" *)
output wire m_axi_gmem_B_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARREADY" *)
input wire m_axi_gmem_B_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARADDR" *)
output wire [63 : 0] m_axi_gmem_B_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARID" *)
output wire [0 : 0] m_axi_gmem_B_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARLEN" *)
output wire [7 : 0] m_axi_gmem_B_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARSIZE" *)
output wire [2 : 0] m_axi_gmem_B_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARBURST" *)
output wire [1 : 0] m_axi_gmem_B_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARLOCK" *)
output wire [1 : 0] m_axi_gmem_B_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARCACHE" *)
output wire [3 : 0] m_axi_gmem_B_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARPROT" *)
output wire [2 : 0] m_axi_gmem_B_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARQOS" *)
output wire [3 : 0] m_axi_gmem_B_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARREGION" *)
output wire [3 : 0] m_axi_gmem_B_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B ARUSER" *)
output wire [0 : 0] m_axi_gmem_B_ARUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B RVALID" *)
input wire m_axi_gmem_B_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B RREADY" *)
output wire m_axi_gmem_B_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B RDATA" *)
input wire [511 : 0] m_axi_gmem_B_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B RLAST" *)
input wire m_axi_gmem_B_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B RID" *)
input wire [0 : 0] m_axi_gmem_B_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B RUSER" *)
input wire [0 : 0] m_axi_gmem_B_RUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B RRESP" *)
input wire [1 : 0] m_axi_gmem_B_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B BVALID" *)
input wire m_axi_gmem_B_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B BREADY" *)
output wire m_axi_gmem_B_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B BRESP" *)
input wire [1 : 0] m_axi_gmem_B_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B BID" *)
input wire [0 : 0] m_axi_gmem_B_BID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_gmem_B, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 400000000, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, W\
USER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_B BUSER" *)
input wire [0 : 0] m_axi_gmem_B_BUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWVALID" *)
output wire m_axi_gmem_C_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWREADY" *)
input wire m_axi_gmem_C_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWADDR" *)
output wire [63 : 0] m_axi_gmem_C_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWID" *)
output wire [0 : 0] m_axi_gmem_C_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWLEN" *)
output wire [7 : 0] m_axi_gmem_C_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWSIZE" *)
output wire [2 : 0] m_axi_gmem_C_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWBURST" *)
output wire [1 : 0] m_axi_gmem_C_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWLOCK" *)
output wire [1 : 0] m_axi_gmem_C_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWCACHE" *)
output wire [3 : 0] m_axi_gmem_C_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWPROT" *)
output wire [2 : 0] m_axi_gmem_C_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWQOS" *)
output wire [3 : 0] m_axi_gmem_C_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWREGION" *)
output wire [3 : 0] m_axi_gmem_C_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C AWUSER" *)
output wire [0 : 0] m_axi_gmem_C_AWUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C WVALID" *)
output wire m_axi_gmem_C_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C WREADY" *)
input wire m_axi_gmem_C_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C WDATA" *)
output wire [511 : 0] m_axi_gmem_C_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C WSTRB" *)
output wire [63 : 0] m_axi_gmem_C_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C WLAST" *)
output wire m_axi_gmem_C_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C WID" *)
output wire [0 : 0] m_axi_gmem_C_WID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C WUSER" *)
output wire [0 : 0] m_axi_gmem_C_WUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARVALID" *)
output wire m_axi_gmem_C_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARREADY" *)
input wire m_axi_gmem_C_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARADDR" *)
output wire [63 : 0] m_axi_gmem_C_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARID" *)
output wire [0 : 0] m_axi_gmem_C_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARLEN" *)
output wire [7 : 0] m_axi_gmem_C_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARSIZE" *)
output wire [2 : 0] m_axi_gmem_C_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARBURST" *)
output wire [1 : 0] m_axi_gmem_C_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARLOCK" *)
output wire [1 : 0] m_axi_gmem_C_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARCACHE" *)
output wire [3 : 0] m_axi_gmem_C_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARPROT" *)
output wire [2 : 0] m_axi_gmem_C_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARQOS" *)
output wire [3 : 0] m_axi_gmem_C_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARREGION" *)
output wire [3 : 0] m_axi_gmem_C_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C ARUSER" *)
output wire [0 : 0] m_axi_gmem_C_ARUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C RVALID" *)
input wire m_axi_gmem_C_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C RREADY" *)
output wire m_axi_gmem_C_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C RDATA" *)
input wire [511 : 0] m_axi_gmem_C_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C RLAST" *)
input wire m_axi_gmem_C_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C RID" *)
input wire [0 : 0] m_axi_gmem_C_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C RUSER" *)
input wire [0 : 0] m_axi_gmem_C_RUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C RRESP" *)
input wire [1 : 0] m_axi_gmem_C_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C BVALID" *)
input wire m_axi_gmem_C_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C BREADY" *)
output wire m_axi_gmem_C_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C BRESP" *)
input wire [1 : 0] m_axi_gmem_C_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C BID" *)
input wire [0 : 0] m_axi_gmem_C_BID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_gmem_C, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 400000000, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, W\
USER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_gmem_C BUSER" *)
input wire [0 : 0] m_axi_gmem_C_BUSER;

  kernel3 #(
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_S_AXI_CONTROL_ADDR_WIDTH(6),
    .C_S_AXI_DATA_WIDTH(32),
    .C_M_AXI_GMEM_A_ID_WIDTH(1),
    .C_M_AXI_GMEM_A_ADDR_WIDTH(64),
    .C_M_AXI_GMEM_A_DATA_WIDTH(512),
    .C_M_AXI_GMEM_A_AWUSER_WIDTH(1),
    .C_M_AXI_GMEM_A_ARUSER_WIDTH(1),
    .C_M_AXI_GMEM_A_WUSER_WIDTH(1),
    .C_M_AXI_GMEM_A_RUSER_WIDTH(1),
    .C_M_AXI_GMEM_A_BUSER_WIDTH(1),
    .C_M_AXI_GMEM_A_USER_VALUE(0),
    .C_M_AXI_GMEM_A_PROT_VALUE(0),
    .C_M_AXI_GMEM_A_CACHE_VALUE(3),
    .C_M_AXI_DATA_WIDTH(32),
    .C_M_AXI_GMEM_B_ID_WIDTH(1),
    .C_M_AXI_GMEM_B_ADDR_WIDTH(64),
    .C_M_AXI_GMEM_B_DATA_WIDTH(512),
    .C_M_AXI_GMEM_B_AWUSER_WIDTH(1),
    .C_M_AXI_GMEM_B_ARUSER_WIDTH(1),
    .C_M_AXI_GMEM_B_WUSER_WIDTH(1),
    .C_M_AXI_GMEM_B_RUSER_WIDTH(1),
    .C_M_AXI_GMEM_B_BUSER_WIDTH(1),
    .C_M_AXI_GMEM_B_USER_VALUE(0),
    .C_M_AXI_GMEM_B_PROT_VALUE(0),
    .C_M_AXI_GMEM_B_CACHE_VALUE(3),
    .C_M_AXI_GMEM_C_ID_WIDTH(1),
    .C_M_AXI_GMEM_C_ADDR_WIDTH(64),
    .C_M_AXI_GMEM_C_DATA_WIDTH(512),
    .C_M_AXI_GMEM_C_AWUSER_WIDTH(1),
    .C_M_AXI_GMEM_C_ARUSER_WIDTH(1),
    .C_M_AXI_GMEM_C_WUSER_WIDTH(1),
    .C_M_AXI_GMEM_C_RUSER_WIDTH(1),
    .C_M_AXI_GMEM_C_BUSER_WIDTH(1),
    .C_M_AXI_GMEM_C_USER_VALUE(0),
    .C_M_AXI_GMEM_C_PROT_VALUE(0),
    .C_M_AXI_GMEM_C_CACHE_VALUE(3),
    .C_S_AXI_CONTROL_WSTRB_WIDTH(4),
    .C_S_AXI_WSTRB_WIDTH(4),
    .C_M_AXI_GMEM_A_WSTRB_WIDTH(64),
    .C_M_AXI_WSTRB_WIDTH(4),
    .C_M_AXI_GMEM_B_WSTRB_WIDTH(64),
    .C_M_AXI_GMEM_C_WSTRB_WIDTH(64)
  ) inst (
    .s_axi_control_AWVALID(s_axi_control_AWVALID),
    .s_axi_control_AWREADY(s_axi_control_AWREADY),
    .s_axi_control_AWADDR(s_axi_control_AWADDR),
    .s_axi_control_WVALID(s_axi_control_WVALID),
    .s_axi_control_WREADY(s_axi_control_WREADY),
    .s_axi_control_WDATA(s_axi_control_WDATA),
    .s_axi_control_WSTRB(s_axi_control_WSTRB),
    .s_axi_control_ARVALID(s_axi_control_ARVALID),
    .s_axi_control_ARREADY(s_axi_control_ARREADY),
    .s_axi_control_ARADDR(s_axi_control_ARADDR),
    .s_axi_control_RVALID(s_axi_control_RVALID),
    .s_axi_control_RREADY(s_axi_control_RREADY),
    .s_axi_control_RDATA(s_axi_control_RDATA),
    .s_axi_control_RRESP(s_axi_control_RRESP),
    .s_axi_control_BVALID(s_axi_control_BVALID),
    .s_axi_control_BREADY(s_axi_control_BREADY),
    .s_axi_control_BRESP(s_axi_control_BRESP),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .m_axi_gmem_A_AWVALID(m_axi_gmem_A_AWVALID),
    .m_axi_gmem_A_AWREADY(m_axi_gmem_A_AWREADY),
    .m_axi_gmem_A_AWADDR(m_axi_gmem_A_AWADDR),
    .m_axi_gmem_A_AWID(m_axi_gmem_A_AWID),
    .m_axi_gmem_A_AWLEN(m_axi_gmem_A_AWLEN),
    .m_axi_gmem_A_AWSIZE(m_axi_gmem_A_AWSIZE),
    .m_axi_gmem_A_AWBURST(m_axi_gmem_A_AWBURST),
    .m_axi_gmem_A_AWLOCK(m_axi_gmem_A_AWLOCK),
    .m_axi_gmem_A_AWCACHE(m_axi_gmem_A_AWCACHE),
    .m_axi_gmem_A_AWPROT(m_axi_gmem_A_AWPROT),
    .m_axi_gmem_A_AWQOS(m_axi_gmem_A_AWQOS),
    .m_axi_gmem_A_AWREGION(m_axi_gmem_A_AWREGION),
    .m_axi_gmem_A_AWUSER(m_axi_gmem_A_AWUSER),
    .m_axi_gmem_A_WVALID(m_axi_gmem_A_WVALID),
    .m_axi_gmem_A_WREADY(m_axi_gmem_A_WREADY),
    .m_axi_gmem_A_WDATA(m_axi_gmem_A_WDATA),
    .m_axi_gmem_A_WSTRB(m_axi_gmem_A_WSTRB),
    .m_axi_gmem_A_WLAST(m_axi_gmem_A_WLAST),
    .m_axi_gmem_A_WID(m_axi_gmem_A_WID),
    .m_axi_gmem_A_WUSER(m_axi_gmem_A_WUSER),
    .m_axi_gmem_A_ARVALID(m_axi_gmem_A_ARVALID),
    .m_axi_gmem_A_ARREADY(m_axi_gmem_A_ARREADY),
    .m_axi_gmem_A_ARADDR(m_axi_gmem_A_ARADDR),
    .m_axi_gmem_A_ARID(m_axi_gmem_A_ARID),
    .m_axi_gmem_A_ARLEN(m_axi_gmem_A_ARLEN),
    .m_axi_gmem_A_ARSIZE(m_axi_gmem_A_ARSIZE),
    .m_axi_gmem_A_ARBURST(m_axi_gmem_A_ARBURST),
    .m_axi_gmem_A_ARLOCK(m_axi_gmem_A_ARLOCK),
    .m_axi_gmem_A_ARCACHE(m_axi_gmem_A_ARCACHE),
    .m_axi_gmem_A_ARPROT(m_axi_gmem_A_ARPROT),
    .m_axi_gmem_A_ARQOS(m_axi_gmem_A_ARQOS),
    .m_axi_gmem_A_ARREGION(m_axi_gmem_A_ARREGION),
    .m_axi_gmem_A_ARUSER(m_axi_gmem_A_ARUSER),
    .m_axi_gmem_A_RVALID(m_axi_gmem_A_RVALID),
    .m_axi_gmem_A_RREADY(m_axi_gmem_A_RREADY),
    .m_axi_gmem_A_RDATA(m_axi_gmem_A_RDATA),
    .m_axi_gmem_A_RLAST(m_axi_gmem_A_RLAST),
    .m_axi_gmem_A_RID(m_axi_gmem_A_RID),
    .m_axi_gmem_A_RUSER(m_axi_gmem_A_RUSER),
    .m_axi_gmem_A_RRESP(m_axi_gmem_A_RRESP),
    .m_axi_gmem_A_BVALID(m_axi_gmem_A_BVALID),
    .m_axi_gmem_A_BREADY(m_axi_gmem_A_BREADY),
    .m_axi_gmem_A_BRESP(m_axi_gmem_A_BRESP),
    .m_axi_gmem_A_BID(m_axi_gmem_A_BID),
    .m_axi_gmem_A_BUSER(m_axi_gmem_A_BUSER),
    .m_axi_gmem_B_AWVALID(m_axi_gmem_B_AWVALID),
    .m_axi_gmem_B_AWREADY(m_axi_gmem_B_AWREADY),
    .m_axi_gmem_B_AWADDR(m_axi_gmem_B_AWADDR),
    .m_axi_gmem_B_AWID(m_axi_gmem_B_AWID),
    .m_axi_gmem_B_AWLEN(m_axi_gmem_B_AWLEN),
    .m_axi_gmem_B_AWSIZE(m_axi_gmem_B_AWSIZE),
    .m_axi_gmem_B_AWBURST(m_axi_gmem_B_AWBURST),
    .m_axi_gmem_B_AWLOCK(m_axi_gmem_B_AWLOCK),
    .m_axi_gmem_B_AWCACHE(m_axi_gmem_B_AWCACHE),
    .m_axi_gmem_B_AWPROT(m_axi_gmem_B_AWPROT),
    .m_axi_gmem_B_AWQOS(m_axi_gmem_B_AWQOS),
    .m_axi_gmem_B_AWREGION(m_axi_gmem_B_AWREGION),
    .m_axi_gmem_B_AWUSER(m_axi_gmem_B_AWUSER),
    .m_axi_gmem_B_WVALID(m_axi_gmem_B_WVALID),
    .m_axi_gmem_B_WREADY(m_axi_gmem_B_WREADY),
    .m_axi_gmem_B_WDATA(m_axi_gmem_B_WDATA),
    .m_axi_gmem_B_WSTRB(m_axi_gmem_B_WSTRB),
    .m_axi_gmem_B_WLAST(m_axi_gmem_B_WLAST),
    .m_axi_gmem_B_WID(m_axi_gmem_B_WID),
    .m_axi_gmem_B_WUSER(m_axi_gmem_B_WUSER),
    .m_axi_gmem_B_ARVALID(m_axi_gmem_B_ARVALID),
    .m_axi_gmem_B_ARREADY(m_axi_gmem_B_ARREADY),
    .m_axi_gmem_B_ARADDR(m_axi_gmem_B_ARADDR),
    .m_axi_gmem_B_ARID(m_axi_gmem_B_ARID),
    .m_axi_gmem_B_ARLEN(m_axi_gmem_B_ARLEN),
    .m_axi_gmem_B_ARSIZE(m_axi_gmem_B_ARSIZE),
    .m_axi_gmem_B_ARBURST(m_axi_gmem_B_ARBURST),
    .m_axi_gmem_B_ARLOCK(m_axi_gmem_B_ARLOCK),
    .m_axi_gmem_B_ARCACHE(m_axi_gmem_B_ARCACHE),
    .m_axi_gmem_B_ARPROT(m_axi_gmem_B_ARPROT),
    .m_axi_gmem_B_ARQOS(m_axi_gmem_B_ARQOS),
    .m_axi_gmem_B_ARREGION(m_axi_gmem_B_ARREGION),
    .m_axi_gmem_B_ARUSER(m_axi_gmem_B_ARUSER),
    .m_axi_gmem_B_RVALID(m_axi_gmem_B_RVALID),
    .m_axi_gmem_B_RREADY(m_axi_gmem_B_RREADY),
    .m_axi_gmem_B_RDATA(m_axi_gmem_B_RDATA),
    .m_axi_gmem_B_RLAST(m_axi_gmem_B_RLAST),
    .m_axi_gmem_B_RID(m_axi_gmem_B_RID),
    .m_axi_gmem_B_RUSER(m_axi_gmem_B_RUSER),
    .m_axi_gmem_B_RRESP(m_axi_gmem_B_RRESP),
    .m_axi_gmem_B_BVALID(m_axi_gmem_B_BVALID),
    .m_axi_gmem_B_BREADY(m_axi_gmem_B_BREADY),
    .m_axi_gmem_B_BRESP(m_axi_gmem_B_BRESP),
    .m_axi_gmem_B_BID(m_axi_gmem_B_BID),
    .m_axi_gmem_B_BUSER(m_axi_gmem_B_BUSER),
    .m_axi_gmem_C_AWVALID(m_axi_gmem_C_AWVALID),
    .m_axi_gmem_C_AWREADY(m_axi_gmem_C_AWREADY),
    .m_axi_gmem_C_AWADDR(m_axi_gmem_C_AWADDR),
    .m_axi_gmem_C_AWID(m_axi_gmem_C_AWID),
    .m_axi_gmem_C_AWLEN(m_axi_gmem_C_AWLEN),
    .m_axi_gmem_C_AWSIZE(m_axi_gmem_C_AWSIZE),
    .m_axi_gmem_C_AWBURST(m_axi_gmem_C_AWBURST),
    .m_axi_gmem_C_AWLOCK(m_axi_gmem_C_AWLOCK),
    .m_axi_gmem_C_AWCACHE(m_axi_gmem_C_AWCACHE),
    .m_axi_gmem_C_AWPROT(m_axi_gmem_C_AWPROT),
    .m_axi_gmem_C_AWQOS(m_axi_gmem_C_AWQOS),
    .m_axi_gmem_C_AWREGION(m_axi_gmem_C_AWREGION),
    .m_axi_gmem_C_AWUSER(m_axi_gmem_C_AWUSER),
    .m_axi_gmem_C_WVALID(m_axi_gmem_C_WVALID),
    .m_axi_gmem_C_WREADY(m_axi_gmem_C_WREADY),
    .m_axi_gmem_C_WDATA(m_axi_gmem_C_WDATA),
    .m_axi_gmem_C_WSTRB(m_axi_gmem_C_WSTRB),
    .m_axi_gmem_C_WLAST(m_axi_gmem_C_WLAST),
    .m_axi_gmem_C_WID(m_axi_gmem_C_WID),
    .m_axi_gmem_C_WUSER(m_axi_gmem_C_WUSER),
    .m_axi_gmem_C_ARVALID(m_axi_gmem_C_ARVALID),
    .m_axi_gmem_C_ARREADY(m_axi_gmem_C_ARREADY),
    .m_axi_gmem_C_ARADDR(m_axi_gmem_C_ARADDR),
    .m_axi_gmem_C_ARID(m_axi_gmem_C_ARID),
    .m_axi_gmem_C_ARLEN(m_axi_gmem_C_ARLEN),
    .m_axi_gmem_C_ARSIZE(m_axi_gmem_C_ARSIZE),
    .m_axi_gmem_C_ARBURST(m_axi_gmem_C_ARBURST),
    .m_axi_gmem_C_ARLOCK(m_axi_gmem_C_ARLOCK),
    .m_axi_gmem_C_ARCACHE(m_axi_gmem_C_ARCACHE),
    .m_axi_gmem_C_ARPROT(m_axi_gmem_C_ARPROT),
    .m_axi_gmem_C_ARQOS(m_axi_gmem_C_ARQOS),
    .m_axi_gmem_C_ARREGION(m_axi_gmem_C_ARREGION),
    .m_axi_gmem_C_ARUSER(m_axi_gmem_C_ARUSER),
    .m_axi_gmem_C_RVALID(m_axi_gmem_C_RVALID),
    .m_axi_gmem_C_RREADY(m_axi_gmem_C_RREADY),
    .m_axi_gmem_C_RDATA(m_axi_gmem_C_RDATA),
    .m_axi_gmem_C_RLAST(m_axi_gmem_C_RLAST),
    .m_axi_gmem_C_RID(m_axi_gmem_C_RID),
    .m_axi_gmem_C_RUSER(m_axi_gmem_C_RUSER),
    .m_axi_gmem_C_RRESP(m_axi_gmem_C_RRESP),
    .m_axi_gmem_C_BVALID(m_axi_gmem_C_BVALID),
    .m_axi_gmem_C_BREADY(m_axi_gmem_C_BREADY),
    .m_axi_gmem_C_BRESP(m_axi_gmem_C_BRESP),
    .m_axi_gmem_C_BID(m_axi_gmem_C_BID),
    .m_axi_gmem_C_BUSER(m_axi_gmem_C_BUSER)
  );
endmodule
