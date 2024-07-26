//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Tue Jul 23 21:32:13 2024
//Host        : ny1 running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=30,numReposBlks=26,numNonXlnxBlks=0,numHierBlks=4,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (pci_express_x4_rxn,
    pci_express_x4_rxp,
    pci_express_x4_txn,
    pci_express_x4_txp,
    pcie_perstn,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    slr0_freerun_clk_clk_n,
    slr0_freerun_clk_clk_p);
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x4 rxn" *) input [3:0]pci_express_x4_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x4 rxp" *) input [3:0]pci_express_x4_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x4 txn" *) output [3:0]pci_express_x4_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x4 txp" *) output [3:0]pci_express_x4_txp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.PCIE_PERSTN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.PCIE_PERSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input pcie_perstn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie_refclk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcie_refclk, CAN_DEBUG false, FREQ_HZ 100000000" *) input [0:0]pcie_refclk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie_refclk CLK_P" *) input [0:0]pcie_refclk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 slr0_freerun_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME slr0_freerun_clk, CAN_DEBUG false, FREQ_HZ 100000000" *) input slr0_freerun_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 slr0_freerun_clk CLK_P" *) input slr0_freerun_clk_clk_p;

  wire [0:0]apb_sys_reset_peripheral_aresetn;
  wire [63:0]axi_mem_intercon_M00_AXI_ARADDR;
  wire [1:0]axi_mem_intercon_M00_AXI_ARBURST;
  wire [3:0]axi_mem_intercon_M00_AXI_ARCACHE;
  wire [3:0]axi_mem_intercon_M00_AXI_ARLEN;
  wire [1:0]axi_mem_intercon_M00_AXI_ARLOCK;
  wire [2:0]axi_mem_intercon_M00_AXI_ARPROT;
  wire [3:0]axi_mem_intercon_M00_AXI_ARQOS;
  wire axi_mem_intercon_M00_AXI_ARREADY;
  wire [2:0]axi_mem_intercon_M00_AXI_ARSIZE;
  wire axi_mem_intercon_M00_AXI_ARVALID;
  wire [63:0]axi_mem_intercon_M00_AXI_AWADDR;
  wire [1:0]axi_mem_intercon_M00_AXI_AWBURST;
  wire [3:0]axi_mem_intercon_M00_AXI_AWCACHE;
  wire [3:0]axi_mem_intercon_M00_AXI_AWLEN;
  wire [1:0]axi_mem_intercon_M00_AXI_AWLOCK;
  wire [2:0]axi_mem_intercon_M00_AXI_AWPROT;
  wire [3:0]axi_mem_intercon_M00_AXI_AWQOS;
  wire axi_mem_intercon_M00_AXI_AWREADY;
  wire [2:0]axi_mem_intercon_M00_AXI_AWSIZE;
  wire axi_mem_intercon_M00_AXI_AWVALID;
  wire axi_mem_intercon_M00_AXI_BREADY;
  wire [1:0]axi_mem_intercon_M00_AXI_BRESP;
  wire axi_mem_intercon_M00_AXI_BVALID;
  wire [255:0]axi_mem_intercon_M00_AXI_RDATA;
  wire axi_mem_intercon_M00_AXI_RLAST;
  wire axi_mem_intercon_M00_AXI_RREADY;
  wire [1:0]axi_mem_intercon_M00_AXI_RRESP;
  wire axi_mem_intercon_M00_AXI_RVALID;
  wire [255:0]axi_mem_intercon_M00_AXI_WDATA;
  wire axi_mem_intercon_M00_AXI_WLAST;
  wire axi_mem_intercon_M00_AXI_WREADY;
  wire [31:0]axi_mem_intercon_M00_AXI_WSTRB;
  wire axi_mem_intercon_M00_AXI_WVALID;
  wire [63:0]axi_register_slice_10_M_AXI_ARADDR;
  wire axi_register_slice_10_M_AXI_ARREADY;
  wire axi_register_slice_10_M_AXI_ARVALID;
  wire [63:0]axi_register_slice_10_M_AXI_AWADDR;
  wire axi_register_slice_10_M_AXI_AWREADY;
  wire axi_register_slice_10_M_AXI_AWVALID;
  wire axi_register_slice_10_M_AXI_BREADY;
  wire [1:0]axi_register_slice_10_M_AXI_BRESP;
  wire axi_register_slice_10_M_AXI_BVALID;
  wire [31:0]axi_register_slice_10_M_AXI_RDATA;
  wire axi_register_slice_10_M_AXI_RREADY;
  wire [1:0]axi_register_slice_10_M_AXI_RRESP;
  wire axi_register_slice_10_M_AXI_RVALID;
  wire [31:0]axi_register_slice_10_M_AXI_WDATA;
  wire axi_register_slice_10_M_AXI_WREADY;
  wire [3:0]axi_register_slice_10_M_AXI_WSTRB;
  wire axi_register_slice_10_M_AXI_WVALID;
  wire [63:0]axi_register_slice_1_M_AXI_ARADDR;
  wire [1:0]axi_register_slice_1_M_AXI_ARBURST;
  wire [3:0]axi_register_slice_1_M_AXI_ARCACHE;
  wire [3:0]axi_register_slice_1_M_AXI_ARID;
  wire [7:0]axi_register_slice_1_M_AXI_ARLEN;
  wire [0:0]axi_register_slice_1_M_AXI_ARLOCK;
  wire [2:0]axi_register_slice_1_M_AXI_ARPROT;
  wire [3:0]axi_register_slice_1_M_AXI_ARQOS;
  wire axi_register_slice_1_M_AXI_ARREADY;
  wire [3:0]axi_register_slice_1_M_AXI_ARREGION;
  wire [2:0]axi_register_slice_1_M_AXI_ARSIZE;
  wire axi_register_slice_1_M_AXI_ARVALID;
  wire [63:0]axi_register_slice_1_M_AXI_AWADDR;
  wire [1:0]axi_register_slice_1_M_AXI_AWBURST;
  wire [3:0]axi_register_slice_1_M_AXI_AWCACHE;
  wire [3:0]axi_register_slice_1_M_AXI_AWID;
  wire [7:0]axi_register_slice_1_M_AXI_AWLEN;
  wire [0:0]axi_register_slice_1_M_AXI_AWLOCK;
  wire [2:0]axi_register_slice_1_M_AXI_AWPROT;
  wire [3:0]axi_register_slice_1_M_AXI_AWQOS;
  wire axi_register_slice_1_M_AXI_AWREADY;
  wire [3:0]axi_register_slice_1_M_AXI_AWREGION;
  wire [2:0]axi_register_slice_1_M_AXI_AWSIZE;
  wire axi_register_slice_1_M_AXI_AWVALID;
  wire [3:0]axi_register_slice_1_M_AXI_BID;
  wire axi_register_slice_1_M_AXI_BREADY;
  wire [1:0]axi_register_slice_1_M_AXI_BRESP;
  wire axi_register_slice_1_M_AXI_BVALID;
  wire [127:0]axi_register_slice_1_M_AXI_RDATA;
  wire [3:0]axi_register_slice_1_M_AXI_RID;
  wire axi_register_slice_1_M_AXI_RLAST;
  wire axi_register_slice_1_M_AXI_RREADY;
  wire [1:0]axi_register_slice_1_M_AXI_RRESP;
  wire axi_register_slice_1_M_AXI_RVALID;
  wire [127:0]axi_register_slice_1_M_AXI_WDATA;
  wire axi_register_slice_1_M_AXI_WLAST;
  wire axi_register_slice_1_M_AXI_WREADY;
  wire [15:0]axi_register_slice_1_M_AXI_WSTRB;
  wire axi_register_slice_1_M_AXI_WVALID;
  wire [63:0]axi_register_slice_31_M_AXI_ARADDR;
  wire [1:0]axi_register_slice_31_M_AXI_ARBURST;
  wire [3:0]axi_register_slice_31_M_AXI_ARLEN;
  wire axi_register_slice_31_M_AXI_ARREADY;
  wire [2:0]axi_register_slice_31_M_AXI_ARSIZE;
  wire axi_register_slice_31_M_AXI_ARVALID;
  wire [63:0]axi_register_slice_31_M_AXI_AWADDR;
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
  wire [33:0]axi_register_slice_7_M_AXI_ARADDR;
  wire [1:0]axi_register_slice_7_M_AXI_ARBURST;
  wire [3:0]axi_register_slice_7_M_AXI_ARLEN;
  wire axi_register_slice_7_M_AXI_ARREADY;
  wire [2:0]axi_register_slice_7_M_AXI_ARSIZE;
  wire axi_register_slice_7_M_AXI_ARVALID;
  wire [33:0]axi_register_slice_7_M_AXI_AWADDR;
  wire [1:0]axi_register_slice_7_M_AXI_AWBURST;
  wire [3:0]axi_register_slice_7_M_AXI_AWLEN;
  wire axi_register_slice_7_M_AXI_AWREADY;
  wire [2:0]axi_register_slice_7_M_AXI_AWSIZE;
  wire axi_register_slice_7_M_AXI_AWVALID;
  wire axi_register_slice_7_M_AXI_BREADY;
  wire [1:0]axi_register_slice_7_M_AXI_BRESP;
  wire axi_register_slice_7_M_AXI_BVALID;
  wire [255:0]axi_register_slice_7_M_AXI_RDATA;
  wire axi_register_slice_7_M_AXI_RLAST;
  wire axi_register_slice_7_M_AXI_RREADY;
  wire [1:0]axi_register_slice_7_M_AXI_RRESP;
  wire axi_register_slice_7_M_AXI_RVALID;
  wire [255:0]axi_register_slice_7_M_AXI_WDATA;
  wire axi_register_slice_7_M_AXI_WLAST;
  wire axi_register_slice_7_M_AXI_WREADY;
  wire [31:0]axi_register_slice_7_M_AXI_WSTRB;
  wire axi_register_slice_7_M_AXI_WVALID;
  wire [33:0]axi_register_slice_8_M_AXI_ARADDR;
  wire [1:0]axi_register_slice_8_M_AXI_ARBURST;
  wire [3:0]axi_register_slice_8_M_AXI_ARLEN;
  wire axi_register_slice_8_M_AXI_ARREADY;
  wire [2:0]axi_register_slice_8_M_AXI_ARSIZE;
  wire axi_register_slice_8_M_AXI_ARVALID;
  wire [33:0]axi_register_slice_8_M_AXI_AWADDR;
  wire [1:0]axi_register_slice_8_M_AXI_AWBURST;
  wire [3:0]axi_register_slice_8_M_AXI_AWLEN;
  wire axi_register_slice_8_M_AXI_AWREADY;
  wire [2:0]axi_register_slice_8_M_AXI_AWSIZE;
  wire axi_register_slice_8_M_AXI_AWVALID;
  wire axi_register_slice_8_M_AXI_BREADY;
  wire [1:0]axi_register_slice_8_M_AXI_BRESP;
  wire axi_register_slice_8_M_AXI_BVALID;
  wire [255:0]axi_register_slice_8_M_AXI_RDATA;
  wire axi_register_slice_8_M_AXI_RLAST;
  wire axi_register_slice_8_M_AXI_RREADY;
  wire [1:0]axi_register_slice_8_M_AXI_RRESP;
  wire axi_register_slice_8_M_AXI_RVALID;
  wire [255:0]axi_register_slice_8_M_AXI_WDATA;
  wire axi_register_slice_8_M_AXI_WLAST;
  wire axi_register_slice_8_M_AXI_WREADY;
  wire [31:0]axi_register_slice_8_M_AXI_WSTRB;
  wire axi_register_slice_8_M_AXI_WVALID;
  wire [33:0]axi_register_slice_9_M_AXI_ARADDR;
  wire [1:0]axi_register_slice_9_M_AXI_ARBURST;
  wire [3:0]axi_register_slice_9_M_AXI_ARLEN;
  wire axi_register_slice_9_M_AXI_ARREADY;
  wire [2:0]axi_register_slice_9_M_AXI_ARSIZE;
  wire axi_register_slice_9_M_AXI_ARVALID;
  wire [33:0]axi_register_slice_9_M_AXI_AWADDR;
  wire [1:0]axi_register_slice_9_M_AXI_AWBURST;
  wire [3:0]axi_register_slice_9_M_AXI_AWLEN;
  wire axi_register_slice_9_M_AXI_AWREADY;
  wire [2:0]axi_register_slice_9_M_AXI_AWSIZE;
  wire axi_register_slice_9_M_AXI_AWVALID;
  wire axi_register_slice_9_M_AXI_BREADY;
  wire [1:0]axi_register_slice_9_M_AXI_BRESP;
  wire axi_register_slice_9_M_AXI_BVALID;
  wire [255:0]axi_register_slice_9_M_AXI_RDATA;
  wire axi_register_slice_9_M_AXI_RLAST;
  wire axi_register_slice_9_M_AXI_RREADY;
  wire [1:0]axi_register_slice_9_M_AXI_RRESP;
  wire axi_register_slice_9_M_AXI_RVALID;
  wire [255:0]axi_register_slice_9_M_AXI_WDATA;
  wire axi_register_slice_9_M_AXI_WLAST;
  wire axi_register_slice_9_M_AXI_WREADY;
  wire [31:0]axi_register_slice_9_M_AXI_WSTRB;
  wire axi_register_slice_9_M_AXI_WVALID;
  wire [0:0]dma_sys_reset_peripheral_aresetn;
  wire hbm_axi_clk_clk_out1;
  wire hbm_axi_clk_locked;
  wire [0:0]hbm_sys_reset_interconnect_aresetn;
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
  wire [0:0]kernel_sys_reset_interconnect_aresetn;
  wire [0:0]kernel_sys_reset_peripheral_aresetn;
  wire pcie_perstn_1;
  wire [0:0]pcie_refclk_1_CLK_N;
  wire [0:0]pcie_refclk_1_CLK_P;
  wire slr0_freerun_clk_1_CLK_N;
  wire slr0_freerun_clk_1_CLK_P;
  wire [33:0]smartconnect_7_M00_AXI_ARADDR;
  wire [1:0]smartconnect_7_M00_AXI_ARBURST;
  wire [3:0]smartconnect_7_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_7_M00_AXI_ARLEN;
  wire [1:0]smartconnect_7_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_7_M00_AXI_ARPROT;
  wire [3:0]smartconnect_7_M00_AXI_ARQOS;
  wire smartconnect_7_M00_AXI_ARREADY;
  wire [2:0]smartconnect_7_M00_AXI_ARSIZE;
  wire [0:0]smartconnect_7_M00_AXI_ARUSER;
  wire smartconnect_7_M00_AXI_ARVALID;
  wire [33:0]smartconnect_7_M00_AXI_AWADDR;
  wire [1:0]smartconnect_7_M00_AXI_AWBURST;
  wire [3:0]smartconnect_7_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_7_M00_AXI_AWLEN;
  wire [1:0]smartconnect_7_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_7_M00_AXI_AWPROT;
  wire [3:0]smartconnect_7_M00_AXI_AWQOS;
  wire smartconnect_7_M00_AXI_AWREADY;
  wire [2:0]smartconnect_7_M00_AXI_AWSIZE;
  wire [0:0]smartconnect_7_M00_AXI_AWUSER;
  wire smartconnect_7_M00_AXI_AWVALID;
  wire smartconnect_7_M00_AXI_BREADY;
  wire [1:0]smartconnect_7_M00_AXI_BRESP;
  wire [0:0]smartconnect_7_M00_AXI_BUSER;
  wire smartconnect_7_M00_AXI_BVALID;
  wire [255:0]smartconnect_7_M00_AXI_RDATA;
  wire smartconnect_7_M00_AXI_RLAST;
  wire smartconnect_7_M00_AXI_RREADY;
  wire [1:0]smartconnect_7_M00_AXI_RRESP;
  wire smartconnect_7_M00_AXI_RVALID;
  wire [255:0]smartconnect_7_M00_AXI_WDATA;
  wire smartconnect_7_M00_AXI_WLAST;
  wire smartconnect_7_M00_AXI_WREADY;
  wire [31:0]smartconnect_7_M00_AXI_WSTRB;
  wire smartconnect_7_M00_AXI_WVALID;
  wire [33:0]smartconnect_8_M00_AXI_ARADDR;
  wire [1:0]smartconnect_8_M00_AXI_ARBURST;
  wire [3:0]smartconnect_8_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_8_M00_AXI_ARLEN;
  wire [1:0]smartconnect_8_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_8_M00_AXI_ARPROT;
  wire [3:0]smartconnect_8_M00_AXI_ARQOS;
  wire smartconnect_8_M00_AXI_ARREADY;
  wire [2:0]smartconnect_8_M00_AXI_ARSIZE;
  wire [0:0]smartconnect_8_M00_AXI_ARUSER;
  wire smartconnect_8_M00_AXI_ARVALID;
  wire [33:0]smartconnect_8_M00_AXI_AWADDR;
  wire [1:0]smartconnect_8_M00_AXI_AWBURST;
  wire [3:0]smartconnect_8_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_8_M00_AXI_AWLEN;
  wire [1:0]smartconnect_8_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_8_M00_AXI_AWPROT;
  wire [3:0]smartconnect_8_M00_AXI_AWQOS;
  wire smartconnect_8_M00_AXI_AWREADY;
  wire [2:0]smartconnect_8_M00_AXI_AWSIZE;
  wire [0:0]smartconnect_8_M00_AXI_AWUSER;
  wire smartconnect_8_M00_AXI_AWVALID;
  wire smartconnect_8_M00_AXI_BREADY;
  wire [1:0]smartconnect_8_M00_AXI_BRESP;
  wire [0:0]smartconnect_8_M00_AXI_BUSER;
  wire smartconnect_8_M00_AXI_BVALID;
  wire [255:0]smartconnect_8_M00_AXI_RDATA;
  wire smartconnect_8_M00_AXI_RLAST;
  wire smartconnect_8_M00_AXI_RREADY;
  wire [1:0]smartconnect_8_M00_AXI_RRESP;
  wire smartconnect_8_M00_AXI_RVALID;
  wire [255:0]smartconnect_8_M00_AXI_WDATA;
  wire smartconnect_8_M00_AXI_WLAST;
  wire smartconnect_8_M00_AXI_WREADY;
  wire [31:0]smartconnect_8_M00_AXI_WSTRB;
  wire smartconnect_8_M00_AXI_WVALID;
  wire [33:0]smartconnect_9_M00_AXI_ARADDR;
  wire [1:0]smartconnect_9_M00_AXI_ARBURST;
  wire [3:0]smartconnect_9_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_9_M00_AXI_ARLEN;
  wire [1:0]smartconnect_9_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_9_M00_AXI_ARPROT;
  wire [3:0]smartconnect_9_M00_AXI_ARQOS;
  wire smartconnect_9_M00_AXI_ARREADY;
  wire [2:0]smartconnect_9_M00_AXI_ARSIZE;
  wire [0:0]smartconnect_9_M00_AXI_ARUSER;
  wire smartconnect_9_M00_AXI_ARVALID;
  wire [33:0]smartconnect_9_M00_AXI_AWADDR;
  wire [1:0]smartconnect_9_M00_AXI_AWBURST;
  wire [3:0]smartconnect_9_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_9_M00_AXI_AWLEN;
  wire [1:0]smartconnect_9_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_9_M00_AXI_AWPROT;
  wire [3:0]smartconnect_9_M00_AXI_AWQOS;
  wire smartconnect_9_M00_AXI_AWREADY;
  wire [2:0]smartconnect_9_M00_AXI_AWSIZE;
  wire [0:0]smartconnect_9_M00_AXI_AWUSER;
  wire smartconnect_9_M00_AXI_AWVALID;
  wire smartconnect_9_M00_AXI_BREADY;
  wire [1:0]smartconnect_9_M00_AXI_BRESP;
  wire [0:0]smartconnect_9_M00_AXI_BUSER;
  wire smartconnect_9_M00_AXI_BVALID;
  wire [255:0]smartconnect_9_M00_AXI_RDATA;
  wire smartconnect_9_M00_AXI_RLAST;
  wire smartconnect_9_M00_AXI_RREADY;
  wire [1:0]smartconnect_9_M00_AXI_RRESP;
  wire smartconnect_9_M00_AXI_RVALID;
  wire [255:0]smartconnect_9_M00_AXI_WDATA;
  wire smartconnect_9_M00_AXI_WLAST;
  wire smartconnect_9_M00_AXI_WREADY;
  wire [31:0]smartconnect_9_M00_AXI_WSTRB;
  wire smartconnect_9_M00_AXI_WVALID;
  wire [0:0]util_ds_buf_0_IBUF_OUT;
  wire [0:0]util_ds_buf_1_IBUF_OUT;
  wire [0:0]util_ds_buf_IBUF_DS_ODIV2;
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
  wire [127:0]xdma_0_M_AXI_BYPASS_RDATA;
  wire [3:0]xdma_0_M_AXI_BYPASS_RID;
  wire xdma_0_M_AXI_BYPASS_RLAST;
  wire xdma_0_M_AXI_BYPASS_RREADY;
  wire [1:0]xdma_0_M_AXI_BYPASS_RRESP;
  wire xdma_0_M_AXI_BYPASS_RVALID;
  wire [127:0]xdma_0_M_AXI_BYPASS_WDATA;
  wire xdma_0_M_AXI_BYPASS_WLAST;
  wire xdma_0_M_AXI_BYPASS_WREADY;
  wire [15:0]xdma_0_M_AXI_BYPASS_WSTRB;
  wire xdma_0_M_AXI_BYPASS_WVALID;
  wire [127:0]xdma_0_M_AXI_RDATA;
  wire [3:0]xdma_0_M_AXI_RID;
  wire xdma_0_M_AXI_RLAST;
  wire xdma_0_M_AXI_RREADY;
  wire [1:0]xdma_0_M_AXI_RRESP;
  wire xdma_0_M_AXI_RVALID;
  wire [127:0]xdma_0_M_AXI_WDATA;
  wire xdma_0_M_AXI_WLAST;
  wire xdma_0_M_AXI_WREADY;
  wire [15:0]xdma_0_M_AXI_WSTRB;
  wire xdma_0_M_AXI_WVALID;
  wire xdma_0_axi_aclk;
  wire xdma_0_axi_aresetn;
  wire [63:0]xdma_0_axi_periph_M00_AXI_ARADDR;
  wire [2:0]xdma_0_axi_periph_M00_AXI_ARPROT;
  wire xdma_0_axi_periph_M00_AXI_ARREADY;
  wire xdma_0_axi_periph_M00_AXI_ARVALID;
  wire [63:0]xdma_0_axi_periph_M00_AXI_AWADDR;
  wire [2:0]xdma_0_axi_periph_M00_AXI_AWPROT;
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
  wire [3:0]xdma_0_pcie_mgt_rxn;
  wire [3:0]xdma_0_pcie_mgt_rxp;
  wire [0:0]xdma_0_pcie_mgt_txn;
  wire [0:0]xdma_0_pcie_mgt_txp;

  assign pci_express_x4_txn[0] = xdma_0_pcie_mgt_txn;
  assign pci_express_x4_txp[0] = xdma_0_pcie_mgt_txp;
  assign pcie_perstn_1 = pcie_perstn;
  assign pcie_refclk_1_CLK_N = pcie_refclk_clk_n[0];
  assign pcie_refclk_1_CLK_P = pcie_refclk_clk_p[0];
  assign slr0_freerun_clk_1_CLK_N = slr0_freerun_clk_clk_n;
  assign slr0_freerun_clk_1_CLK_P = slr0_freerun_clk_clk_p;
  assign xdma_0_pcie_mgt_rxn = pci_express_x4_rxn[3:0];
  assign xdma_0_pcie_mgt_rxp = pci_express_x4_rxp[3:0];
  design_1_apb_sys_reset_0 apb_sys_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(xdma_0_axi_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(apb_sys_reset_peripheral_aresetn),
        .slowest_sync_clk(util_ds_buf_0_IBUF_OUT));
  design_1_axi_mem_intercon_0 axi_mem_intercon
       (.ACLK(xdma_0_axi_aclk),
        .ARESETN(xdma_0_axi_aresetn),
        .M00_ACLK(hbm_axi_clk_clk_out1),
        .M00_ARESETN(hbm_sys_reset_peripheral_aresetn),
        .M00_AXI_araddr(axi_mem_intercon_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_mem_intercon_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_mem_intercon_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_mem_intercon_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_mem_intercon_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_mem_intercon_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_mem_intercon_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_mem_intercon_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_mem_intercon_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_mem_intercon_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_mem_intercon_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_mem_intercon_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_mem_intercon_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_mem_intercon_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_mem_intercon_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_mem_intercon_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_mem_intercon_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_mem_intercon_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_mem_intercon_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_mem_intercon_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_mem_intercon_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_mem_intercon_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_mem_intercon_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_mem_intercon_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_mem_intercon_M00_AXI_RLAST),
        .M00_AXI_rready(axi_mem_intercon_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_mem_intercon_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_mem_intercon_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_mem_intercon_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_mem_intercon_M00_AXI_WLAST),
        .M00_AXI_wready(axi_mem_intercon_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_mem_intercon_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_mem_intercon_M00_AXI_WVALID),
        .S00_ACLK(xdma_0_axi_aclk),
        .S00_ARESETN(xdma_0_axi_aresetn),
        .S00_AXI_araddr(axi_register_slice_1_M_AXI_ARADDR),
        .S00_AXI_arburst(axi_register_slice_1_M_AXI_ARBURST),
        .S00_AXI_arcache(axi_register_slice_1_M_AXI_ARCACHE),
        .S00_AXI_arid(axi_register_slice_1_M_AXI_ARID),
        .S00_AXI_arlen(axi_register_slice_1_M_AXI_ARLEN),
        .S00_AXI_arlock(axi_register_slice_1_M_AXI_ARLOCK),
        .S00_AXI_arprot(axi_register_slice_1_M_AXI_ARPROT),
        .S00_AXI_arqos(axi_register_slice_1_M_AXI_ARQOS),
        .S00_AXI_arready(axi_register_slice_1_M_AXI_ARREADY),
        .S00_AXI_arregion(axi_register_slice_1_M_AXI_ARREGION),
        .S00_AXI_arsize(axi_register_slice_1_M_AXI_ARSIZE),
        .S00_AXI_arvalid(axi_register_slice_1_M_AXI_ARVALID),
        .S00_AXI_awaddr(axi_register_slice_1_M_AXI_AWADDR),
        .S00_AXI_awburst(axi_register_slice_1_M_AXI_AWBURST),
        .S00_AXI_awcache(axi_register_slice_1_M_AXI_AWCACHE),
        .S00_AXI_awid(axi_register_slice_1_M_AXI_AWID),
        .S00_AXI_awlen(axi_register_slice_1_M_AXI_AWLEN),
        .S00_AXI_awlock(axi_register_slice_1_M_AXI_AWLOCK),
        .S00_AXI_awprot(axi_register_slice_1_M_AXI_AWPROT),
        .S00_AXI_awqos(axi_register_slice_1_M_AXI_AWQOS),
        .S00_AXI_awready(axi_register_slice_1_M_AXI_AWREADY),
        .S00_AXI_awregion(axi_register_slice_1_M_AXI_AWREGION),
        .S00_AXI_awsize(axi_register_slice_1_M_AXI_AWSIZE),
        .S00_AXI_awvalid(axi_register_slice_1_M_AXI_AWVALID),
        .S00_AXI_bid(axi_register_slice_1_M_AXI_BID),
        .S00_AXI_bready(axi_register_slice_1_M_AXI_BREADY),
        .S00_AXI_bresp(axi_register_slice_1_M_AXI_BRESP),
        .S00_AXI_bvalid(axi_register_slice_1_M_AXI_BVALID),
        .S00_AXI_rdata(axi_register_slice_1_M_AXI_RDATA),
        .S00_AXI_rid(axi_register_slice_1_M_AXI_RID),
        .S00_AXI_rlast(axi_register_slice_1_M_AXI_RLAST),
        .S00_AXI_rready(axi_register_slice_1_M_AXI_RREADY),
        .S00_AXI_rresp(axi_register_slice_1_M_AXI_RRESP),
        .S00_AXI_rvalid(axi_register_slice_1_M_AXI_RVALID),
        .S00_AXI_wdata(axi_register_slice_1_M_AXI_WDATA),
        .S00_AXI_wlast(axi_register_slice_1_M_AXI_WLAST),
        .S00_AXI_wready(axi_register_slice_1_M_AXI_WREADY),
        .S00_AXI_wstrb(axi_register_slice_1_M_AXI_WSTRB),
        .S00_AXI_wvalid(axi_register_slice_1_M_AXI_WVALID));
  design_1_axi_register_slice_10_0 axi_register_slice_10
       (.aclk(kernel_clk_clk_out1),
        .aresetn(kernel_sys_reset_peripheral_aresetn),
        .m_axi_araddr(axi_register_slice_10_M_AXI_ARADDR),
        .m_axi_arready(axi_register_slice_10_M_AXI_ARREADY),
        .m_axi_arvalid(axi_register_slice_10_M_AXI_ARVALID),
        .m_axi_awaddr(axi_register_slice_10_M_AXI_AWADDR),
        .m_axi_awready(axi_register_slice_10_M_AXI_AWREADY),
        .m_axi_awvalid(axi_register_slice_10_M_AXI_AWVALID),
        .m_axi_bready(axi_register_slice_10_M_AXI_BREADY),
        .m_axi_bresp(axi_register_slice_10_M_AXI_BRESP),
        .m_axi_bvalid(axi_register_slice_10_M_AXI_BVALID),
        .m_axi_rdata(axi_register_slice_10_M_AXI_RDATA),
        .m_axi_rready(axi_register_slice_10_M_AXI_RREADY),
        .m_axi_rresp(axi_register_slice_10_M_AXI_RRESP),
        .m_axi_rvalid(axi_register_slice_10_M_AXI_RVALID),
        .m_axi_wdata(axi_register_slice_10_M_AXI_WDATA),
        .m_axi_wready(axi_register_slice_10_M_AXI_WREADY),
        .m_axi_wstrb(axi_register_slice_10_M_AXI_WSTRB),
        .m_axi_wvalid(axi_register_slice_10_M_AXI_WVALID),
        .s_axi_araddr(xdma_0_axi_periph_M00_AXI_ARADDR),
        .s_axi_arprot(xdma_0_axi_periph_M00_AXI_ARPROT),
        .s_axi_arready(xdma_0_axi_periph_M00_AXI_ARREADY),
        .s_axi_arvalid(xdma_0_axi_periph_M00_AXI_ARVALID),
        .s_axi_awaddr(xdma_0_axi_periph_M00_AXI_AWADDR),
        .s_axi_awprot(xdma_0_axi_periph_M00_AXI_AWPROT),
        .s_axi_awready(xdma_0_axi_periph_M00_AXI_AWREADY),
        .s_axi_awvalid(xdma_0_axi_periph_M00_AXI_AWVALID),
        .s_axi_bready(xdma_0_axi_periph_M00_AXI_BREADY),
        .s_axi_bresp(xdma_0_axi_periph_M00_AXI_BRESP),
        .s_axi_bvalid(xdma_0_axi_periph_M00_AXI_BVALID),
        .s_axi_rdata(xdma_0_axi_periph_M00_AXI_RDATA),
        .s_axi_rready(xdma_0_axi_periph_M00_AXI_RREADY),
        .s_axi_rresp(xdma_0_axi_periph_M00_AXI_RRESP),
        .s_axi_rvalid(xdma_0_axi_periph_M00_AXI_RVALID),
        .s_axi_wdata(xdma_0_axi_periph_M00_AXI_WDATA),
        .s_axi_wready(xdma_0_axi_periph_M00_AXI_WREADY),
        .s_axi_wstrb(xdma_0_axi_periph_M00_AXI_WSTRB),
        .s_axi_wvalid(xdma_0_axi_periph_M00_AXI_WVALID));
  design_1_axi_register_slice_31_0 axi_register_slice_31
       (.aclk(hbm_axi_clk_clk_out1),
        .aresetn(hbm_sys_reset_peripheral_aresetn),
        .m_axi_araddr(axi_register_slice_31_M_AXI_ARADDR),
        .m_axi_arburst(axi_register_slice_31_M_AXI_ARBURST),
        .m_axi_arlen(axi_register_slice_31_M_AXI_ARLEN),
        .m_axi_arready(axi_register_slice_31_M_AXI_ARREADY),
        .m_axi_arsize(axi_register_slice_31_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_register_slice_31_M_AXI_ARVALID),
        .m_axi_awaddr(axi_register_slice_31_M_AXI_AWADDR),
        .m_axi_awburst(axi_register_slice_31_M_AXI_AWBURST),
        .m_axi_awlen(axi_register_slice_31_M_AXI_AWLEN),
        .m_axi_awready(axi_register_slice_31_M_AXI_AWREADY),
        .m_axi_awsize(axi_register_slice_31_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_register_slice_31_M_AXI_AWVALID),
        .m_axi_bready(axi_register_slice_31_M_AXI_BREADY),
        .m_axi_bresp(axi_register_slice_31_M_AXI_BRESP),
        .m_axi_bvalid(axi_register_slice_31_M_AXI_BVALID),
        .m_axi_rdata(axi_register_slice_31_M_AXI_RDATA),
        .m_axi_rlast(axi_register_slice_31_M_AXI_RLAST),
        .m_axi_rready(axi_register_slice_31_M_AXI_RREADY),
        .m_axi_rresp(axi_register_slice_31_M_AXI_RRESP),
        .m_axi_rvalid(axi_register_slice_31_M_AXI_RVALID),
        .m_axi_wdata(axi_register_slice_31_M_AXI_WDATA),
        .m_axi_wlast(axi_register_slice_31_M_AXI_WLAST),
        .m_axi_wready(axi_register_slice_31_M_AXI_WREADY),
        .m_axi_wstrb(axi_register_slice_31_M_AXI_WSTRB),
        .m_axi_wvalid(axi_register_slice_31_M_AXI_WVALID),
        .s_axi_araddr(axi_mem_intercon_M00_AXI_ARADDR),
        .s_axi_arburst(axi_mem_intercon_M00_AXI_ARBURST),
        .s_axi_arcache(axi_mem_intercon_M00_AXI_ARCACHE),
        .s_axi_arlen(axi_mem_intercon_M00_AXI_ARLEN),
        .s_axi_arlock(axi_mem_intercon_M00_AXI_ARLOCK),
        .s_axi_arprot(axi_mem_intercon_M00_AXI_ARPROT),
        .s_axi_arqos(axi_mem_intercon_M00_AXI_ARQOS),
        .s_axi_arready(axi_mem_intercon_M00_AXI_ARREADY),
        .s_axi_arsize(axi_mem_intercon_M00_AXI_ARSIZE),
        .s_axi_arvalid(axi_mem_intercon_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_mem_intercon_M00_AXI_AWADDR),
        .s_axi_awburst(axi_mem_intercon_M00_AXI_AWBURST),
        .s_axi_awcache(axi_mem_intercon_M00_AXI_AWCACHE),
        .s_axi_awlen(axi_mem_intercon_M00_AXI_AWLEN),
        .s_axi_awlock(axi_mem_intercon_M00_AXI_AWLOCK),
        .s_axi_awprot(axi_mem_intercon_M00_AXI_AWPROT),
        .s_axi_awqos(axi_mem_intercon_M00_AXI_AWQOS),
        .s_axi_awready(axi_mem_intercon_M00_AXI_AWREADY),
        .s_axi_awsize(axi_mem_intercon_M00_AXI_AWSIZE),
        .s_axi_awvalid(axi_mem_intercon_M00_AXI_AWVALID),
        .s_axi_bready(axi_mem_intercon_M00_AXI_BREADY),
        .s_axi_bresp(axi_mem_intercon_M00_AXI_BRESP),
        .s_axi_bvalid(axi_mem_intercon_M00_AXI_BVALID),
        .s_axi_rdata(axi_mem_intercon_M00_AXI_RDATA),
        .s_axi_rlast(axi_mem_intercon_M00_AXI_RLAST),
        .s_axi_rready(axi_mem_intercon_M00_AXI_RREADY),
        .s_axi_rresp(axi_mem_intercon_M00_AXI_RRESP),
        .s_axi_rvalid(axi_mem_intercon_M00_AXI_RVALID),
        .s_axi_wdata(axi_mem_intercon_M00_AXI_WDATA),
        .s_axi_wlast(axi_mem_intercon_M00_AXI_WLAST),
        .s_axi_wready(axi_mem_intercon_M00_AXI_WREADY),
        .s_axi_wstrb(axi_mem_intercon_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_mem_intercon_M00_AXI_WVALID));
  design_1_axi_register_slice_32_0 axi_register_slice_32
       (.aclk(xdma_0_axi_aclk),
        .aresetn(dma_sys_reset_peripheral_aresetn),
        .m_axi_araddr(axi_register_slice_1_M_AXI_ARADDR),
        .m_axi_arburst(axi_register_slice_1_M_AXI_ARBURST),
        .m_axi_arcache(axi_register_slice_1_M_AXI_ARCACHE),
        .m_axi_arid(axi_register_slice_1_M_AXI_ARID),
        .m_axi_arlen(axi_register_slice_1_M_AXI_ARLEN),
        .m_axi_arlock(axi_register_slice_1_M_AXI_ARLOCK),
        .m_axi_arprot(axi_register_slice_1_M_AXI_ARPROT),
        .m_axi_arqos(axi_register_slice_1_M_AXI_ARQOS),
        .m_axi_arready(axi_register_slice_1_M_AXI_ARREADY),
        .m_axi_arregion(axi_register_slice_1_M_AXI_ARREGION),
        .m_axi_arsize(axi_register_slice_1_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_register_slice_1_M_AXI_ARVALID),
        .m_axi_awaddr(axi_register_slice_1_M_AXI_AWADDR),
        .m_axi_awburst(axi_register_slice_1_M_AXI_AWBURST),
        .m_axi_awcache(axi_register_slice_1_M_AXI_AWCACHE),
        .m_axi_awid(axi_register_slice_1_M_AXI_AWID),
        .m_axi_awlen(axi_register_slice_1_M_AXI_AWLEN),
        .m_axi_awlock(axi_register_slice_1_M_AXI_AWLOCK),
        .m_axi_awprot(axi_register_slice_1_M_AXI_AWPROT),
        .m_axi_awqos(axi_register_slice_1_M_AXI_AWQOS),
        .m_axi_awready(axi_register_slice_1_M_AXI_AWREADY),
        .m_axi_awregion(axi_register_slice_1_M_AXI_AWREGION),
        .m_axi_awsize(axi_register_slice_1_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_register_slice_1_M_AXI_AWVALID),
        .m_axi_bid(axi_register_slice_1_M_AXI_BID),
        .m_axi_bready(axi_register_slice_1_M_AXI_BREADY),
        .m_axi_bresp(axi_register_slice_1_M_AXI_BRESP),
        .m_axi_bvalid(axi_register_slice_1_M_AXI_BVALID),
        .m_axi_rdata(axi_register_slice_1_M_AXI_RDATA),
        .m_axi_rid(axi_register_slice_1_M_AXI_RID),
        .m_axi_rlast(axi_register_slice_1_M_AXI_RLAST),
        .m_axi_rready(axi_register_slice_1_M_AXI_RREADY),
        .m_axi_rresp(axi_register_slice_1_M_AXI_RRESP),
        .m_axi_rvalid(axi_register_slice_1_M_AXI_RVALID),
        .m_axi_wdata(axi_register_slice_1_M_AXI_WDATA),
        .m_axi_wlast(axi_register_slice_1_M_AXI_WLAST),
        .m_axi_wready(axi_register_slice_1_M_AXI_WREADY),
        .m_axi_wstrb(axi_register_slice_1_M_AXI_WSTRB),
        .m_axi_wvalid(axi_register_slice_1_M_AXI_WVALID),
        .s_axi_araddr(xdma_0_M_AXI_ARADDR),
        .s_axi_arburst(xdma_0_M_AXI_ARBURST),
        .s_axi_arcache(xdma_0_M_AXI_ARCACHE),
        .s_axi_arid(xdma_0_M_AXI_ARID),
        .s_axi_arlen(xdma_0_M_AXI_ARLEN),
        .s_axi_arlock(xdma_0_M_AXI_ARLOCK),
        .s_axi_arprot(xdma_0_M_AXI_ARPROT),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(xdma_0_M_AXI_ARREADY),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(xdma_0_M_AXI_ARSIZE),
        .s_axi_arvalid(xdma_0_M_AXI_ARVALID),
        .s_axi_awaddr(xdma_0_M_AXI_AWADDR),
        .s_axi_awburst(xdma_0_M_AXI_AWBURST),
        .s_axi_awcache(xdma_0_M_AXI_AWCACHE),
        .s_axi_awid(xdma_0_M_AXI_AWID),
        .s_axi_awlen(xdma_0_M_AXI_AWLEN),
        .s_axi_awlock(xdma_0_M_AXI_AWLOCK),
        .s_axi_awprot(xdma_0_M_AXI_AWPROT),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(xdma_0_M_AXI_AWREADY),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(xdma_0_M_AXI_AWSIZE),
        .s_axi_awvalid(xdma_0_M_AXI_AWVALID),
        .s_axi_bid(xdma_0_M_AXI_BID),
        .s_axi_bready(xdma_0_M_AXI_BREADY),
        .s_axi_bresp(xdma_0_M_AXI_BRESP),
        .s_axi_bvalid(xdma_0_M_AXI_BVALID),
        .s_axi_rdata(xdma_0_M_AXI_RDATA),
        .s_axi_rid(xdma_0_M_AXI_RID),
        .s_axi_rlast(xdma_0_M_AXI_RLAST),
        .s_axi_rready(xdma_0_M_AXI_RREADY),
        .s_axi_rresp(xdma_0_M_AXI_RRESP),
        .s_axi_rvalid(xdma_0_M_AXI_RVALID),
        .s_axi_wdata(xdma_0_M_AXI_WDATA),
        .s_axi_wlast(xdma_0_M_AXI_WLAST),
        .s_axi_wready(xdma_0_M_AXI_WREADY),
        .s_axi_wstrb(xdma_0_M_AXI_WSTRB),
        .s_axi_wvalid(xdma_0_M_AXI_WVALID));
  design_1_axi_register_slice_7_0 axi_register_slice_7
       (.aclk(hbm_axi_clk_clk_out1),
        .aresetn(hbm_sys_reset_interconnect_aresetn),
        .m_axi_araddr(axi_register_slice_7_M_AXI_ARADDR),
        .m_axi_arburst(axi_register_slice_7_M_AXI_ARBURST),
        .m_axi_arlen(axi_register_slice_7_M_AXI_ARLEN),
        .m_axi_arready(axi_register_slice_7_M_AXI_ARREADY),
        .m_axi_arsize(axi_register_slice_7_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_register_slice_7_M_AXI_ARVALID),
        .m_axi_awaddr(axi_register_slice_7_M_AXI_AWADDR),
        .m_axi_awburst(axi_register_slice_7_M_AXI_AWBURST),
        .m_axi_awlen(axi_register_slice_7_M_AXI_AWLEN),
        .m_axi_awready(axi_register_slice_7_M_AXI_AWREADY),
        .m_axi_awsize(axi_register_slice_7_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_register_slice_7_M_AXI_AWVALID),
        .m_axi_bready(axi_register_slice_7_M_AXI_BREADY),
        .m_axi_bresp(axi_register_slice_7_M_AXI_BRESP),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(axi_register_slice_7_M_AXI_BVALID),
        .m_axi_rdata(axi_register_slice_7_M_AXI_RDATA),
        .m_axi_rlast(axi_register_slice_7_M_AXI_RLAST),
        .m_axi_rready(axi_register_slice_7_M_AXI_RREADY),
        .m_axi_rresp(axi_register_slice_7_M_AXI_RRESP),
        .m_axi_rvalid(axi_register_slice_7_M_AXI_RVALID),
        .m_axi_wdata(axi_register_slice_7_M_AXI_WDATA),
        .m_axi_wlast(axi_register_slice_7_M_AXI_WLAST),
        .m_axi_wready(axi_register_slice_7_M_AXI_WREADY),
        .m_axi_wstrb(axi_register_slice_7_M_AXI_WSTRB),
        .m_axi_wvalid(axi_register_slice_7_M_AXI_WVALID),
        .s_axi_araddr(smartconnect_7_M00_AXI_ARADDR),
        .s_axi_arburst(smartconnect_7_M00_AXI_ARBURST),
        .s_axi_arcache(smartconnect_7_M00_AXI_ARCACHE),
        .s_axi_arlen(smartconnect_7_M00_AXI_ARLEN),
        .s_axi_arlock(smartconnect_7_M00_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_7_M00_AXI_ARPROT),
        .s_axi_arqos(smartconnect_7_M00_AXI_ARQOS),
        .s_axi_arready(smartconnect_7_M00_AXI_ARREADY),
        .s_axi_arsize(smartconnect_7_M00_AXI_ARSIZE),
        .s_axi_aruser(smartconnect_7_M00_AXI_ARUSER),
        .s_axi_arvalid(smartconnect_7_M00_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_7_M00_AXI_AWADDR),
        .s_axi_awburst(smartconnect_7_M00_AXI_AWBURST),
        .s_axi_awcache(smartconnect_7_M00_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_7_M00_AXI_AWLEN),
        .s_axi_awlock(smartconnect_7_M00_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_7_M00_AXI_AWPROT),
        .s_axi_awqos(smartconnect_7_M00_AXI_AWQOS),
        .s_axi_awready(smartconnect_7_M00_AXI_AWREADY),
        .s_axi_awsize(smartconnect_7_M00_AXI_AWSIZE),
        .s_axi_awuser(smartconnect_7_M00_AXI_AWUSER),
        .s_axi_awvalid(smartconnect_7_M00_AXI_AWVALID),
        .s_axi_bready(smartconnect_7_M00_AXI_BREADY),
        .s_axi_bresp(smartconnect_7_M00_AXI_BRESP),
        .s_axi_buser(smartconnect_7_M00_AXI_BUSER),
        .s_axi_bvalid(smartconnect_7_M00_AXI_BVALID),
        .s_axi_rdata(smartconnect_7_M00_AXI_RDATA),
        .s_axi_rlast(smartconnect_7_M00_AXI_RLAST),
        .s_axi_rready(smartconnect_7_M00_AXI_RREADY),
        .s_axi_rresp(smartconnect_7_M00_AXI_RRESP),
        .s_axi_rvalid(smartconnect_7_M00_AXI_RVALID),
        .s_axi_wdata(smartconnect_7_M00_AXI_WDATA),
        .s_axi_wlast(smartconnect_7_M00_AXI_WLAST),
        .s_axi_wready(smartconnect_7_M00_AXI_WREADY),
        .s_axi_wstrb(smartconnect_7_M00_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_7_M00_AXI_WVALID));
  design_1_axi_register_slice_8_0 axi_register_slice_8
       (.aclk(hbm_axi_clk_clk_out1),
        .aresetn(hbm_sys_reset_interconnect_aresetn),
        .m_axi_araddr(axi_register_slice_8_M_AXI_ARADDR),
        .m_axi_arburst(axi_register_slice_8_M_AXI_ARBURST),
        .m_axi_arlen(axi_register_slice_8_M_AXI_ARLEN),
        .m_axi_arready(axi_register_slice_8_M_AXI_ARREADY),
        .m_axi_arsize(axi_register_slice_8_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_register_slice_8_M_AXI_ARVALID),
        .m_axi_awaddr(axi_register_slice_8_M_AXI_AWADDR),
        .m_axi_awburst(axi_register_slice_8_M_AXI_AWBURST),
        .m_axi_awlen(axi_register_slice_8_M_AXI_AWLEN),
        .m_axi_awready(axi_register_slice_8_M_AXI_AWREADY),
        .m_axi_awsize(axi_register_slice_8_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_register_slice_8_M_AXI_AWVALID),
        .m_axi_bready(axi_register_slice_8_M_AXI_BREADY),
        .m_axi_bresp(axi_register_slice_8_M_AXI_BRESP),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(axi_register_slice_8_M_AXI_BVALID),
        .m_axi_rdata(axi_register_slice_8_M_AXI_RDATA),
        .m_axi_rlast(axi_register_slice_8_M_AXI_RLAST),
        .m_axi_rready(axi_register_slice_8_M_AXI_RREADY),
        .m_axi_rresp(axi_register_slice_8_M_AXI_RRESP),
        .m_axi_rvalid(axi_register_slice_8_M_AXI_RVALID),
        .m_axi_wdata(axi_register_slice_8_M_AXI_WDATA),
        .m_axi_wlast(axi_register_slice_8_M_AXI_WLAST),
        .m_axi_wready(axi_register_slice_8_M_AXI_WREADY),
        .m_axi_wstrb(axi_register_slice_8_M_AXI_WSTRB),
        .m_axi_wvalid(axi_register_slice_8_M_AXI_WVALID),
        .s_axi_araddr(smartconnect_8_M00_AXI_ARADDR),
        .s_axi_arburst(smartconnect_8_M00_AXI_ARBURST),
        .s_axi_arcache(smartconnect_8_M00_AXI_ARCACHE),
        .s_axi_arlen(smartconnect_8_M00_AXI_ARLEN),
        .s_axi_arlock(smartconnect_8_M00_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_8_M00_AXI_ARPROT),
        .s_axi_arqos(smartconnect_8_M00_AXI_ARQOS),
        .s_axi_arready(smartconnect_8_M00_AXI_ARREADY),
        .s_axi_arsize(smartconnect_8_M00_AXI_ARSIZE),
        .s_axi_aruser(smartconnect_8_M00_AXI_ARUSER),
        .s_axi_arvalid(smartconnect_8_M00_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_8_M00_AXI_AWADDR),
        .s_axi_awburst(smartconnect_8_M00_AXI_AWBURST),
        .s_axi_awcache(smartconnect_8_M00_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_8_M00_AXI_AWLEN),
        .s_axi_awlock(smartconnect_8_M00_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_8_M00_AXI_AWPROT),
        .s_axi_awqos(smartconnect_8_M00_AXI_AWQOS),
        .s_axi_awready(smartconnect_8_M00_AXI_AWREADY),
        .s_axi_awsize(smartconnect_8_M00_AXI_AWSIZE),
        .s_axi_awuser(smartconnect_8_M00_AXI_AWUSER),
        .s_axi_awvalid(smartconnect_8_M00_AXI_AWVALID),
        .s_axi_bready(smartconnect_8_M00_AXI_BREADY),
        .s_axi_bresp(smartconnect_8_M00_AXI_BRESP),
        .s_axi_buser(smartconnect_8_M00_AXI_BUSER),
        .s_axi_bvalid(smartconnect_8_M00_AXI_BVALID),
        .s_axi_rdata(smartconnect_8_M00_AXI_RDATA),
        .s_axi_rlast(smartconnect_8_M00_AXI_RLAST),
        .s_axi_rready(smartconnect_8_M00_AXI_RREADY),
        .s_axi_rresp(smartconnect_8_M00_AXI_RRESP),
        .s_axi_rvalid(smartconnect_8_M00_AXI_RVALID),
        .s_axi_wdata(smartconnect_8_M00_AXI_WDATA),
        .s_axi_wlast(smartconnect_8_M00_AXI_WLAST),
        .s_axi_wready(smartconnect_8_M00_AXI_WREADY),
        .s_axi_wstrb(smartconnect_8_M00_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_8_M00_AXI_WVALID));
  design_1_axi_register_slice_9_0 axi_register_slice_9
       (.aclk(hbm_axi_clk_clk_out1),
        .aresetn(hbm_sys_reset_interconnect_aresetn),
        .m_axi_araddr(axi_register_slice_9_M_AXI_ARADDR),
        .m_axi_arburst(axi_register_slice_9_M_AXI_ARBURST),
        .m_axi_arlen(axi_register_slice_9_M_AXI_ARLEN),
        .m_axi_arready(axi_register_slice_9_M_AXI_ARREADY),
        .m_axi_arsize(axi_register_slice_9_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_register_slice_9_M_AXI_ARVALID),
        .m_axi_awaddr(axi_register_slice_9_M_AXI_AWADDR),
        .m_axi_awburst(axi_register_slice_9_M_AXI_AWBURST),
        .m_axi_awlen(axi_register_slice_9_M_AXI_AWLEN),
        .m_axi_awready(axi_register_slice_9_M_AXI_AWREADY),
        .m_axi_awsize(axi_register_slice_9_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_register_slice_9_M_AXI_AWVALID),
        .m_axi_bready(axi_register_slice_9_M_AXI_BREADY),
        .m_axi_bresp(axi_register_slice_9_M_AXI_BRESP),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(axi_register_slice_9_M_AXI_BVALID),
        .m_axi_rdata(axi_register_slice_9_M_AXI_RDATA),
        .m_axi_rlast(axi_register_slice_9_M_AXI_RLAST),
        .m_axi_rready(axi_register_slice_9_M_AXI_RREADY),
        .m_axi_rresp(axi_register_slice_9_M_AXI_RRESP),
        .m_axi_rvalid(axi_register_slice_9_M_AXI_RVALID),
        .m_axi_wdata(axi_register_slice_9_M_AXI_WDATA),
        .m_axi_wlast(axi_register_slice_9_M_AXI_WLAST),
        .m_axi_wready(axi_register_slice_9_M_AXI_WREADY),
        .m_axi_wstrb(axi_register_slice_9_M_AXI_WSTRB),
        .m_axi_wvalid(axi_register_slice_9_M_AXI_WVALID),
        .s_axi_araddr(smartconnect_9_M00_AXI_ARADDR),
        .s_axi_arburst(smartconnect_9_M00_AXI_ARBURST),
        .s_axi_arcache(smartconnect_9_M00_AXI_ARCACHE),
        .s_axi_arlen(smartconnect_9_M00_AXI_ARLEN),
        .s_axi_arlock(smartconnect_9_M00_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_9_M00_AXI_ARPROT),
        .s_axi_arqos(smartconnect_9_M00_AXI_ARQOS),
        .s_axi_arready(smartconnect_9_M00_AXI_ARREADY),
        .s_axi_arsize(smartconnect_9_M00_AXI_ARSIZE),
        .s_axi_aruser(smartconnect_9_M00_AXI_ARUSER),
        .s_axi_arvalid(smartconnect_9_M00_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_9_M00_AXI_AWADDR),
        .s_axi_awburst(smartconnect_9_M00_AXI_AWBURST),
        .s_axi_awcache(smartconnect_9_M00_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_9_M00_AXI_AWLEN),
        .s_axi_awlock(smartconnect_9_M00_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_9_M00_AXI_AWPROT),
        .s_axi_awqos(smartconnect_9_M00_AXI_AWQOS),
        .s_axi_awready(smartconnect_9_M00_AXI_AWREADY),
        .s_axi_awsize(smartconnect_9_M00_AXI_AWSIZE),
        .s_axi_awuser(smartconnect_9_M00_AXI_AWUSER),
        .s_axi_awvalid(smartconnect_9_M00_AXI_AWVALID),
        .s_axi_bready(smartconnect_9_M00_AXI_BREADY),
        .s_axi_bresp(smartconnect_9_M00_AXI_BRESP),
        .s_axi_buser(smartconnect_9_M00_AXI_BUSER),
        .s_axi_bvalid(smartconnect_9_M00_AXI_BVALID),
        .s_axi_rdata(smartconnect_9_M00_AXI_RDATA),
        .s_axi_rlast(smartconnect_9_M00_AXI_RLAST),
        .s_axi_rready(smartconnect_9_M00_AXI_RREADY),
        .s_axi_rresp(smartconnect_9_M00_AXI_RRESP),
        .s_axi_rvalid(smartconnect_9_M00_AXI_RVALID),
        .s_axi_wdata(smartconnect_9_M00_AXI_WDATA),
        .s_axi_wlast(smartconnect_9_M00_AXI_WLAST),
        .s_axi_wready(smartconnect_9_M00_AXI_WREADY),
        .s_axi_wstrb(smartconnect_9_M00_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_9_M00_AXI_WVALID));
  design_1_dma_sys_reset_0 dma_sys_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(xdma_0_axi_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(dma_sys_reset_peripheral_aresetn),
        .slowest_sync_clk(xdma_0_axi_aclk));
  design_1_hbm_0_0 hbm_0
       (.APB_0_PCLK(util_ds_buf_0_IBUF_OUT),
        .APB_0_PRESET_N(apb_sys_reset_peripheral_aresetn),
        .AXI_02_ACLK(hbm_axi_clk_clk_out1),
        .AXI_02_ARADDR(axi_register_slice_9_M_AXI_ARADDR),
        .AXI_02_ARBURST(axi_register_slice_9_M_AXI_ARBURST),
        .AXI_02_ARESET_N(hbm_sys_reset_peripheral_aresetn),
        .AXI_02_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_02_ARLEN(axi_register_slice_9_M_AXI_ARLEN),
        .AXI_02_ARREADY(axi_register_slice_9_M_AXI_ARREADY),
        .AXI_02_ARSIZE(axi_register_slice_9_M_AXI_ARSIZE),
        .AXI_02_ARVALID(axi_register_slice_9_M_AXI_ARVALID),
        .AXI_02_AWADDR(axi_register_slice_9_M_AXI_AWADDR),
        .AXI_02_AWBURST(axi_register_slice_9_M_AXI_AWBURST),
        .AXI_02_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_02_AWLEN(axi_register_slice_9_M_AXI_AWLEN),
        .AXI_02_AWREADY(axi_register_slice_9_M_AXI_AWREADY),
        .AXI_02_AWSIZE(axi_register_slice_9_M_AXI_AWSIZE),
        .AXI_02_AWVALID(axi_register_slice_9_M_AXI_AWVALID),
        .AXI_02_BREADY(axi_register_slice_9_M_AXI_BREADY),
        .AXI_02_BRESP(axi_register_slice_9_M_AXI_BRESP),
        .AXI_02_BVALID(axi_register_slice_9_M_AXI_BVALID),
        .AXI_02_RDATA(axi_register_slice_9_M_AXI_RDATA),
        .AXI_02_RLAST(axi_register_slice_9_M_AXI_RLAST),
        .AXI_02_RREADY(axi_register_slice_9_M_AXI_RREADY),
        .AXI_02_RRESP(axi_register_slice_9_M_AXI_RRESP),
        .AXI_02_RVALID(axi_register_slice_9_M_AXI_RVALID),
        .AXI_02_WDATA(axi_register_slice_9_M_AXI_WDATA),
        .AXI_02_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_02_WLAST(axi_register_slice_9_M_AXI_WLAST),
        .AXI_02_WREADY(axi_register_slice_9_M_AXI_WREADY),
        .AXI_02_WSTRB(axi_register_slice_9_M_AXI_WSTRB),
        .AXI_02_WVALID(axi_register_slice_9_M_AXI_WVALID),
        .AXI_04_ACLK(hbm_axi_clk_clk_out1),
        .AXI_04_ARADDR(axi_register_slice_8_M_AXI_ARADDR),
        .AXI_04_ARBURST(axi_register_slice_8_M_AXI_ARBURST),
        .AXI_04_ARESET_N(hbm_sys_reset_peripheral_aresetn),
        .AXI_04_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_04_ARLEN(axi_register_slice_8_M_AXI_ARLEN),
        .AXI_04_ARREADY(axi_register_slice_8_M_AXI_ARREADY),
        .AXI_04_ARSIZE(axi_register_slice_8_M_AXI_ARSIZE),
        .AXI_04_ARVALID(axi_register_slice_8_M_AXI_ARVALID),
        .AXI_04_AWADDR(axi_register_slice_8_M_AXI_AWADDR),
        .AXI_04_AWBURST(axi_register_slice_8_M_AXI_AWBURST),
        .AXI_04_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_04_AWLEN(axi_register_slice_8_M_AXI_AWLEN),
        .AXI_04_AWREADY(axi_register_slice_8_M_AXI_AWREADY),
        .AXI_04_AWSIZE(axi_register_slice_8_M_AXI_AWSIZE),
        .AXI_04_AWVALID(axi_register_slice_8_M_AXI_AWVALID),
        .AXI_04_BREADY(axi_register_slice_8_M_AXI_BREADY),
        .AXI_04_BRESP(axi_register_slice_8_M_AXI_BRESP),
        .AXI_04_BVALID(axi_register_slice_8_M_AXI_BVALID),
        .AXI_04_RDATA(axi_register_slice_8_M_AXI_RDATA),
        .AXI_04_RLAST(axi_register_slice_8_M_AXI_RLAST),
        .AXI_04_RREADY(axi_register_slice_8_M_AXI_RREADY),
        .AXI_04_RRESP(axi_register_slice_8_M_AXI_RRESP),
        .AXI_04_RVALID(axi_register_slice_8_M_AXI_RVALID),
        .AXI_04_WDATA(axi_register_slice_8_M_AXI_WDATA),
        .AXI_04_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_04_WLAST(axi_register_slice_8_M_AXI_WLAST),
        .AXI_04_WREADY(axi_register_slice_8_M_AXI_WREADY),
        .AXI_04_WSTRB(axi_register_slice_8_M_AXI_WSTRB),
        .AXI_04_WVALID(axi_register_slice_8_M_AXI_WVALID),
        .AXI_10_ACLK(hbm_axi_clk_clk_out1),
        .AXI_10_ARADDR(axi_register_slice_7_M_AXI_ARADDR),
        .AXI_10_ARBURST(axi_register_slice_7_M_AXI_ARBURST),
        .AXI_10_ARESET_N(hbm_sys_reset_peripheral_aresetn),
        .AXI_10_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_10_ARLEN(axi_register_slice_7_M_AXI_ARLEN),
        .AXI_10_ARREADY(axi_register_slice_7_M_AXI_ARREADY),
        .AXI_10_ARSIZE(axi_register_slice_7_M_AXI_ARSIZE),
        .AXI_10_ARVALID(axi_register_slice_7_M_AXI_ARVALID),
        .AXI_10_AWADDR(axi_register_slice_7_M_AXI_AWADDR),
        .AXI_10_AWBURST(axi_register_slice_7_M_AXI_AWBURST),
        .AXI_10_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_10_AWLEN(axi_register_slice_7_M_AXI_AWLEN),
        .AXI_10_AWREADY(axi_register_slice_7_M_AXI_AWREADY),
        .AXI_10_AWSIZE(axi_register_slice_7_M_AXI_AWSIZE),
        .AXI_10_AWVALID(axi_register_slice_7_M_AXI_AWVALID),
        .AXI_10_BREADY(axi_register_slice_7_M_AXI_BREADY),
        .AXI_10_BRESP(axi_register_slice_7_M_AXI_BRESP),
        .AXI_10_BVALID(axi_register_slice_7_M_AXI_BVALID),
        .AXI_10_RDATA(axi_register_slice_7_M_AXI_RDATA),
        .AXI_10_RLAST(axi_register_slice_7_M_AXI_RLAST),
        .AXI_10_RREADY(axi_register_slice_7_M_AXI_RREADY),
        .AXI_10_RRESP(axi_register_slice_7_M_AXI_RRESP),
        .AXI_10_RVALID(axi_register_slice_7_M_AXI_RVALID),
        .AXI_10_WDATA(axi_register_slice_7_M_AXI_WDATA),
        .AXI_10_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_10_WLAST(axi_register_slice_7_M_AXI_WLAST),
        .AXI_10_WREADY(axi_register_slice_7_M_AXI_WREADY),
        .AXI_10_WSTRB(axi_register_slice_7_M_AXI_WSTRB),
        .AXI_10_WVALID(axi_register_slice_7_M_AXI_WVALID),
        .AXI_12_ACLK(hbm_axi_clk_clk_out1),
        .AXI_12_ARADDR(axi_register_slice_31_M_AXI_ARADDR[33:0]),
        .AXI_12_ARBURST(axi_register_slice_31_M_AXI_ARBURST),
        .AXI_12_ARESET_N(hbm_sys_reset_peripheral_aresetn),
        .AXI_12_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_12_ARLEN(axi_register_slice_31_M_AXI_ARLEN),
        .AXI_12_ARREADY(axi_register_slice_31_M_AXI_ARREADY),
        .AXI_12_ARSIZE(axi_register_slice_31_M_AXI_ARSIZE),
        .AXI_12_ARVALID(axi_register_slice_31_M_AXI_ARVALID),
        .AXI_12_AWADDR(axi_register_slice_31_M_AXI_AWADDR[33:0]),
        .AXI_12_AWBURST(axi_register_slice_31_M_AXI_AWBURST),
        .AXI_12_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_12_AWLEN(axi_register_slice_31_M_AXI_AWLEN),
        .AXI_12_AWREADY(axi_register_slice_31_M_AXI_AWREADY),
        .AXI_12_AWSIZE(axi_register_slice_31_M_AXI_AWSIZE),
        .AXI_12_AWVALID(axi_register_slice_31_M_AXI_AWVALID),
        .AXI_12_BREADY(axi_register_slice_31_M_AXI_BREADY),
        .AXI_12_BRESP(axi_register_slice_31_M_AXI_BRESP),
        .AXI_12_BVALID(axi_register_slice_31_M_AXI_BVALID),
        .AXI_12_RDATA(axi_register_slice_31_M_AXI_RDATA),
        .AXI_12_RLAST(axi_register_slice_31_M_AXI_RLAST),
        .AXI_12_RREADY(axi_register_slice_31_M_AXI_RREADY),
        .AXI_12_RRESP(axi_register_slice_31_M_AXI_RRESP),
        .AXI_12_RVALID(axi_register_slice_31_M_AXI_RVALID),
        .AXI_12_WDATA(axi_register_slice_31_M_AXI_WDATA),
        .AXI_12_WDATA_PARITY({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .AXI_12_WLAST(axi_register_slice_31_M_AXI_WLAST),
        .AXI_12_WREADY(axi_register_slice_31_M_AXI_WREADY),
        .AXI_12_WSTRB(axi_register_slice_31_M_AXI_WSTRB),
        .AXI_12_WVALID(axi_register_slice_31_M_AXI_WVALID),
        .HBM_REF_CLK_0(util_ds_buf_0_IBUF_OUT));
  design_1_hbm_axi_clk_0 hbm_axi_clk
       (.clk_in1(xdma_0_axi_aclk),
        .clk_out1(hbm_axi_clk_clk_out1),
        .locked(hbm_axi_clk_locked),
        .resetn(xdma_0_axi_aresetn));
  design_1_hbm_sys_reset_0 hbm_sys_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(hbm_axi_clk_locked),
        .ext_reset_in(xdma_0_axi_aresetn),
        .interconnect_aresetn(hbm_sys_reset_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(hbm_sys_reset_peripheral_aresetn),
        .slowest_sync_clk(hbm_axi_clk_clk_out1));
  design_1_kernel3_0_0 kernel3_0
       (.ap_clk(kernel_clk_clk_out1),
        .ap_rst_n(kernel_sys_reset_peripheral_aresetn),
        .m_axi_gmem_A_ARADDR(kernel3_0_m_axi_gmem_A_ARADDR),
        .m_axi_gmem_A_ARBURST(kernel3_0_m_axi_gmem_A_ARBURST),
        .m_axi_gmem_A_ARCACHE(kernel3_0_m_axi_gmem_A_ARCACHE),
        .m_axi_gmem_A_ARID(kernel3_0_m_axi_gmem_A_ARID),
        .m_axi_gmem_A_ARLEN(kernel3_0_m_axi_gmem_A_ARLEN),
        .m_axi_gmem_A_ARLOCK(kernel3_0_m_axi_gmem_A_ARLOCK),
        .m_axi_gmem_A_ARPROT(kernel3_0_m_axi_gmem_A_ARPROT),
        .m_axi_gmem_A_ARQOS(kernel3_0_m_axi_gmem_A_ARQOS),
        .m_axi_gmem_A_ARREADY(kernel3_0_m_axi_gmem_A_ARREADY),
        .m_axi_gmem_A_ARSIZE(kernel3_0_m_axi_gmem_A_ARSIZE),
        .m_axi_gmem_A_ARUSER(kernel3_0_m_axi_gmem_A_ARUSER),
        .m_axi_gmem_A_ARVALID(kernel3_0_m_axi_gmem_A_ARVALID),
        .m_axi_gmem_A_AWADDR(kernel3_0_m_axi_gmem_A_AWADDR),
        .m_axi_gmem_A_AWBURST(kernel3_0_m_axi_gmem_A_AWBURST),
        .m_axi_gmem_A_AWCACHE(kernel3_0_m_axi_gmem_A_AWCACHE),
        .m_axi_gmem_A_AWID(kernel3_0_m_axi_gmem_A_AWID),
        .m_axi_gmem_A_AWLEN(kernel3_0_m_axi_gmem_A_AWLEN),
        .m_axi_gmem_A_AWLOCK(kernel3_0_m_axi_gmem_A_AWLOCK),
        .m_axi_gmem_A_AWPROT(kernel3_0_m_axi_gmem_A_AWPROT),
        .m_axi_gmem_A_AWQOS(kernel3_0_m_axi_gmem_A_AWQOS),
        .m_axi_gmem_A_AWREADY(kernel3_0_m_axi_gmem_A_AWREADY),
        .m_axi_gmem_A_AWSIZE(kernel3_0_m_axi_gmem_A_AWSIZE),
        .m_axi_gmem_A_AWUSER(kernel3_0_m_axi_gmem_A_AWUSER),
        .m_axi_gmem_A_AWVALID(kernel3_0_m_axi_gmem_A_AWVALID),
        .m_axi_gmem_A_BID(kernel3_0_m_axi_gmem_A_BID),
        .m_axi_gmem_A_BREADY(kernel3_0_m_axi_gmem_A_BREADY),
        .m_axi_gmem_A_BRESP(kernel3_0_m_axi_gmem_A_BRESP),
        .m_axi_gmem_A_BUSER(kernel3_0_m_axi_gmem_A_BUSER),
        .m_axi_gmem_A_BVALID(kernel3_0_m_axi_gmem_A_BVALID),
        .m_axi_gmem_A_RDATA(kernel3_0_m_axi_gmem_A_RDATA),
        .m_axi_gmem_A_RID(kernel3_0_m_axi_gmem_A_RID),
        .m_axi_gmem_A_RLAST(kernel3_0_m_axi_gmem_A_RLAST),
        .m_axi_gmem_A_RREADY(kernel3_0_m_axi_gmem_A_RREADY),
        .m_axi_gmem_A_RRESP(kernel3_0_m_axi_gmem_A_RRESP),
        .m_axi_gmem_A_RUSER(1'b0),
        .m_axi_gmem_A_RVALID(kernel3_0_m_axi_gmem_A_RVALID),
        .m_axi_gmem_A_WDATA(kernel3_0_m_axi_gmem_A_WDATA),
        .m_axi_gmem_A_WLAST(kernel3_0_m_axi_gmem_A_WLAST),
        .m_axi_gmem_A_WREADY(kernel3_0_m_axi_gmem_A_WREADY),
        .m_axi_gmem_A_WSTRB(kernel3_0_m_axi_gmem_A_WSTRB),
        .m_axi_gmem_A_WVALID(kernel3_0_m_axi_gmem_A_WVALID),
        .m_axi_gmem_B_ARADDR(kernel3_0_m_axi_gmem_B_ARADDR),
        .m_axi_gmem_B_ARBURST(kernel3_0_m_axi_gmem_B_ARBURST),
        .m_axi_gmem_B_ARCACHE(kernel3_0_m_axi_gmem_B_ARCACHE),
        .m_axi_gmem_B_ARID(kernel3_0_m_axi_gmem_B_ARID),
        .m_axi_gmem_B_ARLEN(kernel3_0_m_axi_gmem_B_ARLEN),
        .m_axi_gmem_B_ARLOCK(kernel3_0_m_axi_gmem_B_ARLOCK),
        .m_axi_gmem_B_ARPROT(kernel3_0_m_axi_gmem_B_ARPROT),
        .m_axi_gmem_B_ARQOS(kernel3_0_m_axi_gmem_B_ARQOS),
        .m_axi_gmem_B_ARREADY(kernel3_0_m_axi_gmem_B_ARREADY),
        .m_axi_gmem_B_ARSIZE(kernel3_0_m_axi_gmem_B_ARSIZE),
        .m_axi_gmem_B_ARUSER(kernel3_0_m_axi_gmem_B_ARUSER),
        .m_axi_gmem_B_ARVALID(kernel3_0_m_axi_gmem_B_ARVALID),
        .m_axi_gmem_B_AWADDR(kernel3_0_m_axi_gmem_B_AWADDR),
        .m_axi_gmem_B_AWBURST(kernel3_0_m_axi_gmem_B_AWBURST),
        .m_axi_gmem_B_AWCACHE(kernel3_0_m_axi_gmem_B_AWCACHE),
        .m_axi_gmem_B_AWID(kernel3_0_m_axi_gmem_B_AWID),
        .m_axi_gmem_B_AWLEN(kernel3_0_m_axi_gmem_B_AWLEN),
        .m_axi_gmem_B_AWLOCK(kernel3_0_m_axi_gmem_B_AWLOCK),
        .m_axi_gmem_B_AWPROT(kernel3_0_m_axi_gmem_B_AWPROT),
        .m_axi_gmem_B_AWQOS(kernel3_0_m_axi_gmem_B_AWQOS),
        .m_axi_gmem_B_AWREADY(kernel3_0_m_axi_gmem_B_AWREADY),
        .m_axi_gmem_B_AWSIZE(kernel3_0_m_axi_gmem_B_AWSIZE),
        .m_axi_gmem_B_AWUSER(kernel3_0_m_axi_gmem_B_AWUSER),
        .m_axi_gmem_B_AWVALID(kernel3_0_m_axi_gmem_B_AWVALID),
        .m_axi_gmem_B_BID(kernel3_0_m_axi_gmem_B_BID),
        .m_axi_gmem_B_BREADY(kernel3_0_m_axi_gmem_B_BREADY),
        .m_axi_gmem_B_BRESP(kernel3_0_m_axi_gmem_B_BRESP),
        .m_axi_gmem_B_BUSER(kernel3_0_m_axi_gmem_B_BUSER),
        .m_axi_gmem_B_BVALID(kernel3_0_m_axi_gmem_B_BVALID),
        .m_axi_gmem_B_RDATA(kernel3_0_m_axi_gmem_B_RDATA),
        .m_axi_gmem_B_RID(kernel3_0_m_axi_gmem_B_RID),
        .m_axi_gmem_B_RLAST(kernel3_0_m_axi_gmem_B_RLAST),
        .m_axi_gmem_B_RREADY(kernel3_0_m_axi_gmem_B_RREADY),
        .m_axi_gmem_B_RRESP(kernel3_0_m_axi_gmem_B_RRESP),
        .m_axi_gmem_B_RUSER(1'b0),
        .m_axi_gmem_B_RVALID(kernel3_0_m_axi_gmem_B_RVALID),
        .m_axi_gmem_B_WDATA(kernel3_0_m_axi_gmem_B_WDATA),
        .m_axi_gmem_B_WLAST(kernel3_0_m_axi_gmem_B_WLAST),
        .m_axi_gmem_B_WREADY(kernel3_0_m_axi_gmem_B_WREADY),
        .m_axi_gmem_B_WSTRB(kernel3_0_m_axi_gmem_B_WSTRB),
        .m_axi_gmem_B_WVALID(kernel3_0_m_axi_gmem_B_WVALID),
        .m_axi_gmem_C_ARADDR(kernel3_0_m_axi_gmem_C_ARADDR),
        .m_axi_gmem_C_ARBURST(kernel3_0_m_axi_gmem_C_ARBURST),
        .m_axi_gmem_C_ARCACHE(kernel3_0_m_axi_gmem_C_ARCACHE),
        .m_axi_gmem_C_ARID(kernel3_0_m_axi_gmem_C_ARID),
        .m_axi_gmem_C_ARLEN(kernel3_0_m_axi_gmem_C_ARLEN),
        .m_axi_gmem_C_ARLOCK(kernel3_0_m_axi_gmem_C_ARLOCK),
        .m_axi_gmem_C_ARPROT(kernel3_0_m_axi_gmem_C_ARPROT),
        .m_axi_gmem_C_ARQOS(kernel3_0_m_axi_gmem_C_ARQOS),
        .m_axi_gmem_C_ARREADY(kernel3_0_m_axi_gmem_C_ARREADY),
        .m_axi_gmem_C_ARSIZE(kernel3_0_m_axi_gmem_C_ARSIZE),
        .m_axi_gmem_C_ARUSER(kernel3_0_m_axi_gmem_C_ARUSER),
        .m_axi_gmem_C_ARVALID(kernel3_0_m_axi_gmem_C_ARVALID),
        .m_axi_gmem_C_AWADDR(kernel3_0_m_axi_gmem_C_AWADDR),
        .m_axi_gmem_C_AWBURST(kernel3_0_m_axi_gmem_C_AWBURST),
        .m_axi_gmem_C_AWCACHE(kernel3_0_m_axi_gmem_C_AWCACHE),
        .m_axi_gmem_C_AWID(kernel3_0_m_axi_gmem_C_AWID),
        .m_axi_gmem_C_AWLEN(kernel3_0_m_axi_gmem_C_AWLEN),
        .m_axi_gmem_C_AWLOCK(kernel3_0_m_axi_gmem_C_AWLOCK),
        .m_axi_gmem_C_AWPROT(kernel3_0_m_axi_gmem_C_AWPROT),
        .m_axi_gmem_C_AWQOS(kernel3_0_m_axi_gmem_C_AWQOS),
        .m_axi_gmem_C_AWREADY(kernel3_0_m_axi_gmem_C_AWREADY),
        .m_axi_gmem_C_AWSIZE(kernel3_0_m_axi_gmem_C_AWSIZE),
        .m_axi_gmem_C_AWUSER(kernel3_0_m_axi_gmem_C_AWUSER),
        .m_axi_gmem_C_AWVALID(kernel3_0_m_axi_gmem_C_AWVALID),
        .m_axi_gmem_C_BID(kernel3_0_m_axi_gmem_C_BID),
        .m_axi_gmem_C_BREADY(kernel3_0_m_axi_gmem_C_BREADY),
        .m_axi_gmem_C_BRESP(kernel3_0_m_axi_gmem_C_BRESP),
        .m_axi_gmem_C_BUSER(kernel3_0_m_axi_gmem_C_BUSER),
        .m_axi_gmem_C_BVALID(kernel3_0_m_axi_gmem_C_BVALID),
        .m_axi_gmem_C_RDATA(kernel3_0_m_axi_gmem_C_RDATA),
        .m_axi_gmem_C_RID(kernel3_0_m_axi_gmem_C_RID),
        .m_axi_gmem_C_RLAST(kernel3_0_m_axi_gmem_C_RLAST),
        .m_axi_gmem_C_RREADY(kernel3_0_m_axi_gmem_C_RREADY),
        .m_axi_gmem_C_RRESP(kernel3_0_m_axi_gmem_C_RRESP),
        .m_axi_gmem_C_RUSER(1'b0),
        .m_axi_gmem_C_RVALID(kernel3_0_m_axi_gmem_C_RVALID),
        .m_axi_gmem_C_WDATA(kernel3_0_m_axi_gmem_C_WDATA),
        .m_axi_gmem_C_WLAST(kernel3_0_m_axi_gmem_C_WLAST),
        .m_axi_gmem_C_WREADY(kernel3_0_m_axi_gmem_C_WREADY),
        .m_axi_gmem_C_WSTRB(kernel3_0_m_axi_gmem_C_WSTRB),
        .m_axi_gmem_C_WVALID(kernel3_0_m_axi_gmem_C_WVALID),
        .s_axi_control_ARADDR(axi_register_slice_10_M_AXI_ARADDR[5:0]),
        .s_axi_control_ARREADY(axi_register_slice_10_M_AXI_ARREADY),
        .s_axi_control_ARVALID(axi_register_slice_10_M_AXI_ARVALID),
        .s_axi_control_AWADDR(axi_register_slice_10_M_AXI_AWADDR[5:0]),
        .s_axi_control_AWREADY(axi_register_slice_10_M_AXI_AWREADY),
        .s_axi_control_AWVALID(axi_register_slice_10_M_AXI_AWVALID),
        .s_axi_control_BREADY(axi_register_slice_10_M_AXI_BREADY),
        .s_axi_control_BRESP(axi_register_slice_10_M_AXI_BRESP),
        .s_axi_control_BVALID(axi_register_slice_10_M_AXI_BVALID),
        .s_axi_control_RDATA(axi_register_slice_10_M_AXI_RDATA),
        .s_axi_control_RREADY(axi_register_slice_10_M_AXI_RREADY),
        .s_axi_control_RRESP(axi_register_slice_10_M_AXI_RRESP),
        .s_axi_control_RVALID(axi_register_slice_10_M_AXI_RVALID),
        .s_axi_control_WDATA(axi_register_slice_10_M_AXI_WDATA),
        .s_axi_control_WREADY(axi_register_slice_10_M_AXI_WREADY),
        .s_axi_control_WSTRB(axi_register_slice_10_M_AXI_WSTRB),
        .s_axi_control_WVALID(axi_register_slice_10_M_AXI_WVALID));
  design_1_kernel_clk_0 kernel_clk
       (.clk_in1(xdma_0_axi_aclk),
        .clk_out1(kernel_clk_clk_out1),
        .locked(kernel_clk_locked),
        .resetn(xdma_0_axi_aresetn));
  design_1_kernel_sys_reset_0 kernel_sys_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(kernel_clk_locked),
        .ext_reset_in(xdma_0_axi_aresetn),
        .interconnect_aresetn(kernel_sys_reset_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(kernel_sys_reset_peripheral_aresetn),
        .slowest_sync_clk(kernel_clk_clk_out1));
  design_1_smartconnect_7_0 smartconnect_7
       (.M00_AXI_araddr(smartconnect_7_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_7_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_7_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_7_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_7_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_7_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_7_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_7_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_7_M00_AXI_ARSIZE),
        .M00_AXI_aruser(smartconnect_7_M00_AXI_ARUSER),
        .M00_AXI_arvalid(smartconnect_7_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_7_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_7_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_7_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_7_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_7_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_7_M00_AXI_AWPROT),
        .M00_AXI_awqos(smartconnect_7_M00_AXI_AWQOS),
        .M00_AXI_awready(smartconnect_7_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_7_M00_AXI_AWSIZE),
        .M00_AXI_awuser(smartconnect_7_M00_AXI_AWUSER),
        .M00_AXI_awvalid(smartconnect_7_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_7_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_7_M00_AXI_BRESP),
        .M00_AXI_buser(smartconnect_7_M00_AXI_BUSER),
        .M00_AXI_bvalid(smartconnect_7_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_7_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_7_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_7_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_7_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_7_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_7_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_7_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_7_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_7_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_7_M00_AXI_WVALID),
        .S00_AXI_araddr(kernel3_0_m_axi_gmem_C_ARADDR),
        .S00_AXI_arburst(kernel3_0_m_axi_gmem_C_ARBURST),
        .S00_AXI_arcache(kernel3_0_m_axi_gmem_C_ARCACHE),
        .S00_AXI_arid(kernel3_0_m_axi_gmem_C_ARID),
        .S00_AXI_arlen(kernel3_0_m_axi_gmem_C_ARLEN),
        .S00_AXI_arlock(kernel3_0_m_axi_gmem_C_ARLOCK[0]),
        .S00_AXI_arprot(kernel3_0_m_axi_gmem_C_ARPROT),
        .S00_AXI_arqos(kernel3_0_m_axi_gmem_C_ARQOS),
        .S00_AXI_arready(kernel3_0_m_axi_gmem_C_ARREADY),
        .S00_AXI_arsize(kernel3_0_m_axi_gmem_C_ARSIZE),
        .S00_AXI_aruser(kernel3_0_m_axi_gmem_C_ARUSER),
        .S00_AXI_arvalid(kernel3_0_m_axi_gmem_C_ARVALID),
        .S00_AXI_awaddr(kernel3_0_m_axi_gmem_C_AWADDR),
        .S00_AXI_awburst(kernel3_0_m_axi_gmem_C_AWBURST),
        .S00_AXI_awcache(kernel3_0_m_axi_gmem_C_AWCACHE),
        .S00_AXI_awid(kernel3_0_m_axi_gmem_C_AWID),
        .S00_AXI_awlen(kernel3_0_m_axi_gmem_C_AWLEN),
        .S00_AXI_awlock(kernel3_0_m_axi_gmem_C_AWLOCK[0]),
        .S00_AXI_awprot(kernel3_0_m_axi_gmem_C_AWPROT),
        .S00_AXI_awqos(kernel3_0_m_axi_gmem_C_AWQOS),
        .S00_AXI_awready(kernel3_0_m_axi_gmem_C_AWREADY),
        .S00_AXI_awsize(kernel3_0_m_axi_gmem_C_AWSIZE),
        .S00_AXI_awuser(kernel3_0_m_axi_gmem_C_AWUSER),
        .S00_AXI_awvalid(kernel3_0_m_axi_gmem_C_AWVALID),
        .S00_AXI_bid(kernel3_0_m_axi_gmem_C_BID),
        .S00_AXI_bready(kernel3_0_m_axi_gmem_C_BREADY),
        .S00_AXI_bresp(kernel3_0_m_axi_gmem_C_BRESP),
        .S00_AXI_buser(kernel3_0_m_axi_gmem_C_BUSER),
        .S00_AXI_bvalid(kernel3_0_m_axi_gmem_C_BVALID),
        .S00_AXI_rdata(kernel3_0_m_axi_gmem_C_RDATA),
        .S00_AXI_rid(kernel3_0_m_axi_gmem_C_RID),
        .S00_AXI_rlast(kernel3_0_m_axi_gmem_C_RLAST),
        .S00_AXI_rready(kernel3_0_m_axi_gmem_C_RREADY),
        .S00_AXI_rresp(kernel3_0_m_axi_gmem_C_RRESP),
        .S00_AXI_rvalid(kernel3_0_m_axi_gmem_C_RVALID),
        .S00_AXI_wdata(kernel3_0_m_axi_gmem_C_WDATA),
        .S00_AXI_wlast(kernel3_0_m_axi_gmem_C_WLAST),
        .S00_AXI_wready(kernel3_0_m_axi_gmem_C_WREADY),
        .S00_AXI_wstrb(kernel3_0_m_axi_gmem_C_WSTRB),
        .S00_AXI_wvalid(kernel3_0_m_axi_gmem_C_WVALID),
        .aclk(kernel_clk_clk_out1),
        .aclk1(hbm_axi_clk_clk_out1),
        .aresetn(kernel_sys_reset_peripheral_aresetn));
  design_1_smartconnect_8_0 smartconnect_8
       (.M00_AXI_araddr(smartconnect_8_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_8_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_8_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_8_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_8_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_8_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_8_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_8_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_8_M00_AXI_ARSIZE),
        .M00_AXI_aruser(smartconnect_8_M00_AXI_ARUSER),
        .M00_AXI_arvalid(smartconnect_8_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_8_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_8_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_8_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_8_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_8_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_8_M00_AXI_AWPROT),
        .M00_AXI_awqos(smartconnect_8_M00_AXI_AWQOS),
        .M00_AXI_awready(smartconnect_8_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_8_M00_AXI_AWSIZE),
        .M00_AXI_awuser(smartconnect_8_M00_AXI_AWUSER),
        .M00_AXI_awvalid(smartconnect_8_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_8_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_8_M00_AXI_BRESP),
        .M00_AXI_buser(smartconnect_8_M00_AXI_BUSER),
        .M00_AXI_bvalid(smartconnect_8_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_8_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_8_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_8_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_8_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_8_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_8_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_8_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_8_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_8_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_8_M00_AXI_WVALID),
        .S00_AXI_araddr(kernel3_0_m_axi_gmem_B_ARADDR),
        .S00_AXI_arburst(kernel3_0_m_axi_gmem_B_ARBURST),
        .S00_AXI_arcache(kernel3_0_m_axi_gmem_B_ARCACHE),
        .S00_AXI_arid(kernel3_0_m_axi_gmem_B_ARID),
        .S00_AXI_arlen(kernel3_0_m_axi_gmem_B_ARLEN),
        .S00_AXI_arlock(kernel3_0_m_axi_gmem_B_ARLOCK[0]),
        .S00_AXI_arprot(kernel3_0_m_axi_gmem_B_ARPROT),
        .S00_AXI_arqos(kernel3_0_m_axi_gmem_B_ARQOS),
        .S00_AXI_arready(kernel3_0_m_axi_gmem_B_ARREADY),
        .S00_AXI_arsize(kernel3_0_m_axi_gmem_B_ARSIZE),
        .S00_AXI_aruser(kernel3_0_m_axi_gmem_B_ARUSER),
        .S00_AXI_arvalid(kernel3_0_m_axi_gmem_B_ARVALID),
        .S00_AXI_awaddr(kernel3_0_m_axi_gmem_B_AWADDR),
        .S00_AXI_awburst(kernel3_0_m_axi_gmem_B_AWBURST),
        .S00_AXI_awcache(kernel3_0_m_axi_gmem_B_AWCACHE),
        .S00_AXI_awid(kernel3_0_m_axi_gmem_B_AWID),
        .S00_AXI_awlen(kernel3_0_m_axi_gmem_B_AWLEN),
        .S00_AXI_awlock(kernel3_0_m_axi_gmem_B_AWLOCK[0]),
        .S00_AXI_awprot(kernel3_0_m_axi_gmem_B_AWPROT),
        .S00_AXI_awqos(kernel3_0_m_axi_gmem_B_AWQOS),
        .S00_AXI_awready(kernel3_0_m_axi_gmem_B_AWREADY),
        .S00_AXI_awsize(kernel3_0_m_axi_gmem_B_AWSIZE),
        .S00_AXI_awuser(kernel3_0_m_axi_gmem_B_AWUSER),
        .S00_AXI_awvalid(kernel3_0_m_axi_gmem_B_AWVALID),
        .S00_AXI_bid(kernel3_0_m_axi_gmem_B_BID),
        .S00_AXI_bready(kernel3_0_m_axi_gmem_B_BREADY),
        .S00_AXI_bresp(kernel3_0_m_axi_gmem_B_BRESP),
        .S00_AXI_buser(kernel3_0_m_axi_gmem_B_BUSER),
        .S00_AXI_bvalid(kernel3_0_m_axi_gmem_B_BVALID),
        .S00_AXI_rdata(kernel3_0_m_axi_gmem_B_RDATA),
        .S00_AXI_rid(kernel3_0_m_axi_gmem_B_RID),
        .S00_AXI_rlast(kernel3_0_m_axi_gmem_B_RLAST),
        .S00_AXI_rready(kernel3_0_m_axi_gmem_B_RREADY),
        .S00_AXI_rresp(kernel3_0_m_axi_gmem_B_RRESP),
        .S00_AXI_rvalid(kernel3_0_m_axi_gmem_B_RVALID),
        .S00_AXI_wdata(kernel3_0_m_axi_gmem_B_WDATA),
        .S00_AXI_wlast(kernel3_0_m_axi_gmem_B_WLAST),
        .S00_AXI_wready(kernel3_0_m_axi_gmem_B_WREADY),
        .S00_AXI_wstrb(kernel3_0_m_axi_gmem_B_WSTRB),
        .S00_AXI_wvalid(kernel3_0_m_axi_gmem_B_WVALID),
        .aclk(kernel_clk_clk_out1),
        .aclk1(hbm_axi_clk_clk_out1),
        .aresetn(kernel_sys_reset_peripheral_aresetn));
  design_1_smartconnect_9_0 smartconnect_9
       (.M00_AXI_araddr(smartconnect_9_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_9_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_9_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_9_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_9_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_9_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_9_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_9_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_9_M00_AXI_ARSIZE),
        .M00_AXI_aruser(smartconnect_9_M00_AXI_ARUSER),
        .M00_AXI_arvalid(smartconnect_9_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_9_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_9_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_9_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_9_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_9_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_9_M00_AXI_AWPROT),
        .M00_AXI_awqos(smartconnect_9_M00_AXI_AWQOS),
        .M00_AXI_awready(smartconnect_9_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_9_M00_AXI_AWSIZE),
        .M00_AXI_awuser(smartconnect_9_M00_AXI_AWUSER),
        .M00_AXI_awvalid(smartconnect_9_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_9_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_9_M00_AXI_BRESP),
        .M00_AXI_buser(smartconnect_9_M00_AXI_BUSER),
        .M00_AXI_bvalid(smartconnect_9_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_9_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_9_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_9_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_9_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_9_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_9_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_9_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_9_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_9_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_9_M00_AXI_WVALID),
        .S00_AXI_araddr(kernel3_0_m_axi_gmem_A_ARADDR),
        .S00_AXI_arburst(kernel3_0_m_axi_gmem_A_ARBURST),
        .S00_AXI_arcache(kernel3_0_m_axi_gmem_A_ARCACHE),
        .S00_AXI_arid(kernel3_0_m_axi_gmem_A_ARID),
        .S00_AXI_arlen(kernel3_0_m_axi_gmem_A_ARLEN),
        .S00_AXI_arlock(kernel3_0_m_axi_gmem_A_ARLOCK[0]),
        .S00_AXI_arprot(kernel3_0_m_axi_gmem_A_ARPROT),
        .S00_AXI_arqos(kernel3_0_m_axi_gmem_A_ARQOS),
        .S00_AXI_arready(kernel3_0_m_axi_gmem_A_ARREADY),
        .S00_AXI_arsize(kernel3_0_m_axi_gmem_A_ARSIZE),
        .S00_AXI_aruser(kernel3_0_m_axi_gmem_A_ARUSER),
        .S00_AXI_arvalid(kernel3_0_m_axi_gmem_A_ARVALID),
        .S00_AXI_awaddr(kernel3_0_m_axi_gmem_A_AWADDR),
        .S00_AXI_awburst(kernel3_0_m_axi_gmem_A_AWBURST),
        .S00_AXI_awcache(kernel3_0_m_axi_gmem_A_AWCACHE),
        .S00_AXI_awid(kernel3_0_m_axi_gmem_A_AWID),
        .S00_AXI_awlen(kernel3_0_m_axi_gmem_A_AWLEN),
        .S00_AXI_awlock(kernel3_0_m_axi_gmem_A_AWLOCK[0]),
        .S00_AXI_awprot(kernel3_0_m_axi_gmem_A_AWPROT),
        .S00_AXI_awqos(kernel3_0_m_axi_gmem_A_AWQOS),
        .S00_AXI_awready(kernel3_0_m_axi_gmem_A_AWREADY),
        .S00_AXI_awsize(kernel3_0_m_axi_gmem_A_AWSIZE),
        .S00_AXI_awuser(kernel3_0_m_axi_gmem_A_AWUSER),
        .S00_AXI_awvalid(kernel3_0_m_axi_gmem_A_AWVALID),
        .S00_AXI_bid(kernel3_0_m_axi_gmem_A_BID),
        .S00_AXI_bready(kernel3_0_m_axi_gmem_A_BREADY),
        .S00_AXI_bresp(kernel3_0_m_axi_gmem_A_BRESP),
        .S00_AXI_buser(kernel3_0_m_axi_gmem_A_BUSER),
        .S00_AXI_bvalid(kernel3_0_m_axi_gmem_A_BVALID),
        .S00_AXI_rdata(kernel3_0_m_axi_gmem_A_RDATA),
        .S00_AXI_rid(kernel3_0_m_axi_gmem_A_RID),
        .S00_AXI_rlast(kernel3_0_m_axi_gmem_A_RLAST),
        .S00_AXI_rready(kernel3_0_m_axi_gmem_A_RREADY),
        .S00_AXI_rresp(kernel3_0_m_axi_gmem_A_RRESP),
        .S00_AXI_rvalid(kernel3_0_m_axi_gmem_A_RVALID),
        .S00_AXI_wdata(kernel3_0_m_axi_gmem_A_WDATA),
        .S00_AXI_wlast(kernel3_0_m_axi_gmem_A_WLAST),
        .S00_AXI_wready(kernel3_0_m_axi_gmem_A_WREADY),
        .S00_AXI_wstrb(kernel3_0_m_axi_gmem_A_WSTRB),
        .S00_AXI_wvalid(kernel3_0_m_axi_gmem_A_WVALID),
        .aclk(kernel_clk_clk_out1),
        .aclk1(hbm_axi_clk_clk_out1),
        .aresetn(kernel_sys_reset_peripheral_aresetn));
  design_1_util_ds_buf_0_0 util_ds_buf_0
       (.IBUF_DS_N(slr0_freerun_clk_1_CLK_N),
        .IBUF_DS_P(slr0_freerun_clk_1_CLK_P),
        .IBUF_OUT(util_ds_buf_0_IBUF_OUT));
  design_1_util_ds_buf_1_0 util_ds_buf_1
       (.IBUF_DS_N(pcie_refclk_1_CLK_N),
        .IBUF_DS_ODIV2(util_ds_buf_IBUF_DS_ODIV2),
        .IBUF_DS_P(pcie_refclk_1_CLK_P),
        .IBUF_OUT(util_ds_buf_1_IBUF_OUT));
  design_1_xdma_0_0 xdma_0
       (.axi_aclk(xdma_0_axi_aclk),
        .axi_aresetn(xdma_0_axi_aresetn),
        .cfg_mgmt_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .cfg_mgmt_byte_enable({1'b0,1'b0,1'b0,1'b0}),
        .cfg_mgmt_read(1'b0),
        .cfg_mgmt_write(1'b0),
        .cfg_mgmt_write_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_araddr(xdma_0_M_AXI_ARADDR),
        .m_axi_arburst(xdma_0_M_AXI_ARBURST),
        .m_axi_arcache(xdma_0_M_AXI_ARCACHE),
        .m_axi_arid(xdma_0_M_AXI_ARID),
        .m_axi_arlen(xdma_0_M_AXI_ARLEN),
        .m_axi_arlock(xdma_0_M_AXI_ARLOCK),
        .m_axi_arprot(xdma_0_M_AXI_ARPROT),
        .m_axi_arready(xdma_0_M_AXI_ARREADY),
        .m_axi_arsize(xdma_0_M_AXI_ARSIZE),
        .m_axi_arvalid(xdma_0_M_AXI_ARVALID),
        .m_axi_awaddr(xdma_0_M_AXI_AWADDR),
        .m_axi_awburst(xdma_0_M_AXI_AWBURST),
        .m_axi_awcache(xdma_0_M_AXI_AWCACHE),
        .m_axi_awid(xdma_0_M_AXI_AWID),
        .m_axi_awlen(xdma_0_M_AXI_AWLEN),
        .m_axi_awlock(xdma_0_M_AXI_AWLOCK),
        .m_axi_awprot(xdma_0_M_AXI_AWPROT),
        .m_axi_awready(xdma_0_M_AXI_AWREADY),
        .m_axi_awsize(xdma_0_M_AXI_AWSIZE),
        .m_axi_awvalid(xdma_0_M_AXI_AWVALID),
        .m_axi_bid(xdma_0_M_AXI_BID),
        .m_axi_bready(xdma_0_M_AXI_BREADY),
        .m_axi_bresp(xdma_0_M_AXI_BRESP),
        .m_axi_bvalid(xdma_0_M_AXI_BVALID),
        .m_axi_rdata(xdma_0_M_AXI_RDATA),
        .m_axi_rid(xdma_0_M_AXI_RID),
        .m_axi_rlast(xdma_0_M_AXI_RLAST),
        .m_axi_rready(xdma_0_M_AXI_RREADY),
        .m_axi_rresp(xdma_0_M_AXI_RRESP),
        .m_axi_rvalid(xdma_0_M_AXI_RVALID),
        .m_axi_wdata(xdma_0_M_AXI_WDATA),
        .m_axi_wlast(xdma_0_M_AXI_WLAST),
        .m_axi_wready(xdma_0_M_AXI_WREADY),
        .m_axi_wstrb(xdma_0_M_AXI_WSTRB),
        .m_axi_wvalid(xdma_0_M_AXI_WVALID),
        .m_axib_araddr(xdma_0_M_AXI_BYPASS_ARADDR),
        .m_axib_arburst(xdma_0_M_AXI_BYPASS_ARBURST),
        .m_axib_arcache(xdma_0_M_AXI_BYPASS_ARCACHE),
        .m_axib_arid(xdma_0_M_AXI_BYPASS_ARID),
        .m_axib_arlen(xdma_0_M_AXI_BYPASS_ARLEN),
        .m_axib_arlock(xdma_0_M_AXI_BYPASS_ARLOCK),
        .m_axib_arprot(xdma_0_M_AXI_BYPASS_ARPROT),
        .m_axib_arready(xdma_0_M_AXI_BYPASS_ARREADY),
        .m_axib_arsize(xdma_0_M_AXI_BYPASS_ARSIZE),
        .m_axib_arvalid(xdma_0_M_AXI_BYPASS_ARVALID),
        .m_axib_awaddr(xdma_0_M_AXI_BYPASS_AWADDR),
        .m_axib_awburst(xdma_0_M_AXI_BYPASS_AWBURST),
        .m_axib_awcache(xdma_0_M_AXI_BYPASS_AWCACHE),
        .m_axib_awid(xdma_0_M_AXI_BYPASS_AWID),
        .m_axib_awlen(xdma_0_M_AXI_BYPASS_AWLEN),
        .m_axib_awlock(xdma_0_M_AXI_BYPASS_AWLOCK),
        .m_axib_awprot(xdma_0_M_AXI_BYPASS_AWPROT),
        .m_axib_awready(xdma_0_M_AXI_BYPASS_AWREADY),
        .m_axib_awsize(xdma_0_M_AXI_BYPASS_AWSIZE),
        .m_axib_awvalid(xdma_0_M_AXI_BYPASS_AWVALID),
        .m_axib_bid(xdma_0_M_AXI_BYPASS_BID),
        .m_axib_bready(xdma_0_M_AXI_BYPASS_BREADY),
        .m_axib_bresp(xdma_0_M_AXI_BYPASS_BRESP),
        .m_axib_bvalid(xdma_0_M_AXI_BYPASS_BVALID),
        .m_axib_rdata(xdma_0_M_AXI_BYPASS_RDATA),
        .m_axib_rid(xdma_0_M_AXI_BYPASS_RID),
        .m_axib_rlast(xdma_0_M_AXI_BYPASS_RLAST),
        .m_axib_rready(xdma_0_M_AXI_BYPASS_RREADY),
        .m_axib_rresp(xdma_0_M_AXI_BYPASS_RRESP),
        .m_axib_rvalid(xdma_0_M_AXI_BYPASS_RVALID),
        .m_axib_wdata(xdma_0_M_AXI_BYPASS_WDATA),
        .m_axib_wlast(xdma_0_M_AXI_BYPASS_WLAST),
        .m_axib_wready(xdma_0_M_AXI_BYPASS_WREADY),
        .m_axib_wstrb(xdma_0_M_AXI_BYPASS_WSTRB),
        .m_axib_wvalid(xdma_0_M_AXI_BYPASS_WVALID),
        .pci_exp_rxn(xdma_0_pcie_mgt_rxn[0]),
        .pci_exp_rxp(xdma_0_pcie_mgt_rxp[0]),
        .pci_exp_txn(xdma_0_pcie_mgt_txn),
        .pci_exp_txp(xdma_0_pcie_mgt_txp),
        .sys_clk(util_ds_buf_IBUF_DS_ODIV2),
        .sys_clk_gt(util_ds_buf_1_IBUF_OUT),
        .sys_rst_n(pcie_perstn_1),
        .usr_irq_req(1'b0));
  design_1_xdma_0_axi_periph_0 xdma_0_axi_periph
       (.ACLK(xdma_0_axi_aclk),
        .ARESETN(xdma_0_axi_aresetn),
        .M00_ACLK(kernel_clk_clk_out1),
        .M00_ARESETN(kernel_sys_reset_interconnect_aresetn),
        .M00_AXI_araddr(xdma_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arprot(xdma_0_axi_periph_M00_AXI_ARPROT),
        .M00_AXI_arready(xdma_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(xdma_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(xdma_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awprot(xdma_0_axi_periph_M00_AXI_AWPROT),
        .M00_AXI_awready(xdma_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(xdma_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(xdma_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(xdma_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(xdma_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(xdma_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(xdma_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(xdma_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(xdma_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(xdma_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(xdma_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(xdma_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(xdma_0_axi_periph_M00_AXI_WVALID),
        .S00_ACLK(xdma_0_axi_aclk),
        .S00_ARESETN(xdma_0_axi_aresetn),
        .S00_AXI_araddr(xdma_0_M_AXI_BYPASS_ARADDR),
        .S00_AXI_arburst(xdma_0_M_AXI_BYPASS_ARBURST),
        .S00_AXI_arcache(xdma_0_M_AXI_BYPASS_ARCACHE),
        .S00_AXI_arid(xdma_0_M_AXI_BYPASS_ARID),
        .S00_AXI_arlen(xdma_0_M_AXI_BYPASS_ARLEN),
        .S00_AXI_arlock(xdma_0_M_AXI_BYPASS_ARLOCK),
        .S00_AXI_arprot(xdma_0_M_AXI_BYPASS_ARPROT),
        .S00_AXI_arready(xdma_0_M_AXI_BYPASS_ARREADY),
        .S00_AXI_arsize(xdma_0_M_AXI_BYPASS_ARSIZE),
        .S00_AXI_arvalid(xdma_0_M_AXI_BYPASS_ARVALID),
        .S00_AXI_awaddr(xdma_0_M_AXI_BYPASS_AWADDR),
        .S00_AXI_awburst(xdma_0_M_AXI_BYPASS_AWBURST),
        .S00_AXI_awcache(xdma_0_M_AXI_BYPASS_AWCACHE),
        .S00_AXI_awid(xdma_0_M_AXI_BYPASS_AWID),
        .S00_AXI_awlen(xdma_0_M_AXI_BYPASS_AWLEN),
        .S00_AXI_awlock(xdma_0_M_AXI_BYPASS_AWLOCK),
        .S00_AXI_awprot(xdma_0_M_AXI_BYPASS_AWPROT),
        .S00_AXI_awready(xdma_0_M_AXI_BYPASS_AWREADY),
        .S00_AXI_awsize(xdma_0_M_AXI_BYPASS_AWSIZE),
        .S00_AXI_awvalid(xdma_0_M_AXI_BYPASS_AWVALID),
        .S00_AXI_bid(xdma_0_M_AXI_BYPASS_BID),
        .S00_AXI_bready(xdma_0_M_AXI_BYPASS_BREADY),
        .S00_AXI_bresp(xdma_0_M_AXI_BYPASS_BRESP),
        .S00_AXI_bvalid(xdma_0_M_AXI_BYPASS_BVALID),
        .S00_AXI_rdata(xdma_0_M_AXI_BYPASS_RDATA),
        .S00_AXI_rid(xdma_0_M_AXI_BYPASS_RID),
        .S00_AXI_rlast(xdma_0_M_AXI_BYPASS_RLAST),
        .S00_AXI_rready(xdma_0_M_AXI_BYPASS_RREADY),
        .S00_AXI_rresp(xdma_0_M_AXI_BYPASS_RRESP),
        .S00_AXI_rvalid(xdma_0_M_AXI_BYPASS_RVALID),
        .S00_AXI_wdata(xdma_0_M_AXI_BYPASS_WDATA),
        .S00_AXI_wlast(xdma_0_M_AXI_BYPASS_WLAST),
        .S00_AXI_wready(xdma_0_M_AXI_BYPASS_WREADY),
        .S00_AXI_wstrb(xdma_0_M_AXI_BYPASS_WSTRB),
        .S00_AXI_wvalid(xdma_0_M_AXI_BYPASS_WVALID));
endmodule

module design_1_axi_mem_intercon_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
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
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arregion,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awregion,
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
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [63:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [255:0]M00_AXI_rdata;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [255:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [31:0]M00_AXI_wstrb;
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
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [3:0]S00_AXI_arregion;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [63:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [3:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [3:0]S00_AXI_awregion;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [3:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [127:0]S00_AXI_rdata;
  output [3:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [127:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [15:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_mem_intercon_ACLK_net;
  wire axi_mem_intercon_ARESETN_net;
  wire [63:0]axi_mem_intercon_to_s00_couplers_ARADDR;
  wire [1:0]axi_mem_intercon_to_s00_couplers_ARBURST;
  wire [3:0]axi_mem_intercon_to_s00_couplers_ARCACHE;
  wire [3:0]axi_mem_intercon_to_s00_couplers_ARID;
  wire [7:0]axi_mem_intercon_to_s00_couplers_ARLEN;
  wire [0:0]axi_mem_intercon_to_s00_couplers_ARLOCK;
  wire [2:0]axi_mem_intercon_to_s00_couplers_ARPROT;
  wire [3:0]axi_mem_intercon_to_s00_couplers_ARQOS;
  wire axi_mem_intercon_to_s00_couplers_ARREADY;
  wire [3:0]axi_mem_intercon_to_s00_couplers_ARREGION;
  wire [2:0]axi_mem_intercon_to_s00_couplers_ARSIZE;
  wire axi_mem_intercon_to_s00_couplers_ARVALID;
  wire [63:0]axi_mem_intercon_to_s00_couplers_AWADDR;
  wire [1:0]axi_mem_intercon_to_s00_couplers_AWBURST;
  wire [3:0]axi_mem_intercon_to_s00_couplers_AWCACHE;
  wire [3:0]axi_mem_intercon_to_s00_couplers_AWID;
  wire [7:0]axi_mem_intercon_to_s00_couplers_AWLEN;
  wire [0:0]axi_mem_intercon_to_s00_couplers_AWLOCK;
  wire [2:0]axi_mem_intercon_to_s00_couplers_AWPROT;
  wire [3:0]axi_mem_intercon_to_s00_couplers_AWQOS;
  wire axi_mem_intercon_to_s00_couplers_AWREADY;
  wire [3:0]axi_mem_intercon_to_s00_couplers_AWREGION;
  wire [2:0]axi_mem_intercon_to_s00_couplers_AWSIZE;
  wire axi_mem_intercon_to_s00_couplers_AWVALID;
  wire [3:0]axi_mem_intercon_to_s00_couplers_BID;
  wire axi_mem_intercon_to_s00_couplers_BREADY;
  wire [1:0]axi_mem_intercon_to_s00_couplers_BRESP;
  wire axi_mem_intercon_to_s00_couplers_BVALID;
  wire [127:0]axi_mem_intercon_to_s00_couplers_RDATA;
  wire [3:0]axi_mem_intercon_to_s00_couplers_RID;
  wire axi_mem_intercon_to_s00_couplers_RLAST;
  wire axi_mem_intercon_to_s00_couplers_RREADY;
  wire [1:0]axi_mem_intercon_to_s00_couplers_RRESP;
  wire axi_mem_intercon_to_s00_couplers_RVALID;
  wire [127:0]axi_mem_intercon_to_s00_couplers_WDATA;
  wire axi_mem_intercon_to_s00_couplers_WLAST;
  wire axi_mem_intercon_to_s00_couplers_WREADY;
  wire [15:0]axi_mem_intercon_to_s00_couplers_WSTRB;
  wire axi_mem_intercon_to_s00_couplers_WVALID;
  wire [63:0]s00_couplers_to_axi_mem_intercon_ARADDR;
  wire [1:0]s00_couplers_to_axi_mem_intercon_ARBURST;
  wire [3:0]s00_couplers_to_axi_mem_intercon_ARCACHE;
  wire [3:0]s00_couplers_to_axi_mem_intercon_ARLEN;
  wire [1:0]s00_couplers_to_axi_mem_intercon_ARLOCK;
  wire [2:0]s00_couplers_to_axi_mem_intercon_ARPROT;
  wire [3:0]s00_couplers_to_axi_mem_intercon_ARQOS;
  wire s00_couplers_to_axi_mem_intercon_ARREADY;
  wire [2:0]s00_couplers_to_axi_mem_intercon_ARSIZE;
  wire s00_couplers_to_axi_mem_intercon_ARVALID;
  wire [63:0]s00_couplers_to_axi_mem_intercon_AWADDR;
  wire [1:0]s00_couplers_to_axi_mem_intercon_AWBURST;
  wire [3:0]s00_couplers_to_axi_mem_intercon_AWCACHE;
  wire [3:0]s00_couplers_to_axi_mem_intercon_AWLEN;
  wire [1:0]s00_couplers_to_axi_mem_intercon_AWLOCK;
  wire [2:0]s00_couplers_to_axi_mem_intercon_AWPROT;
  wire [3:0]s00_couplers_to_axi_mem_intercon_AWQOS;
  wire s00_couplers_to_axi_mem_intercon_AWREADY;
  wire [2:0]s00_couplers_to_axi_mem_intercon_AWSIZE;
  wire s00_couplers_to_axi_mem_intercon_AWVALID;
  wire s00_couplers_to_axi_mem_intercon_BREADY;
  wire [1:0]s00_couplers_to_axi_mem_intercon_BRESP;
  wire s00_couplers_to_axi_mem_intercon_BVALID;
  wire [255:0]s00_couplers_to_axi_mem_intercon_RDATA;
  wire s00_couplers_to_axi_mem_intercon_RLAST;
  wire s00_couplers_to_axi_mem_intercon_RREADY;
  wire [1:0]s00_couplers_to_axi_mem_intercon_RRESP;
  wire s00_couplers_to_axi_mem_intercon_RVALID;
  wire [255:0]s00_couplers_to_axi_mem_intercon_WDATA;
  wire s00_couplers_to_axi_mem_intercon_WLAST;
  wire s00_couplers_to_axi_mem_intercon_WREADY;
  wire [31:0]s00_couplers_to_axi_mem_intercon_WSTRB;
  wire s00_couplers_to_axi_mem_intercon_WVALID;

  assign M00_AXI_araddr[63:0] = s00_couplers_to_axi_mem_intercon_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_axi_mem_intercon_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_axi_mem_intercon_ARCACHE;
  assign M00_AXI_arlen[3:0] = s00_couplers_to_axi_mem_intercon_ARLEN;
  assign M00_AXI_arlock[1:0] = s00_couplers_to_axi_mem_intercon_ARLOCK;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_axi_mem_intercon_ARPROT;
  assign M00_AXI_arqos[3:0] = s00_couplers_to_axi_mem_intercon_ARQOS;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_axi_mem_intercon_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_axi_mem_intercon_ARVALID;
  assign M00_AXI_awaddr[63:0] = s00_couplers_to_axi_mem_intercon_AWADDR;
  assign M00_AXI_awburst[1:0] = s00_couplers_to_axi_mem_intercon_AWBURST;
  assign M00_AXI_awcache[3:0] = s00_couplers_to_axi_mem_intercon_AWCACHE;
  assign M00_AXI_awlen[3:0] = s00_couplers_to_axi_mem_intercon_AWLEN;
  assign M00_AXI_awlock[1:0] = s00_couplers_to_axi_mem_intercon_AWLOCK;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_axi_mem_intercon_AWPROT;
  assign M00_AXI_awqos[3:0] = s00_couplers_to_axi_mem_intercon_AWQOS;
  assign M00_AXI_awsize[2:0] = s00_couplers_to_axi_mem_intercon_AWSIZE;
  assign M00_AXI_awvalid = s00_couplers_to_axi_mem_intercon_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_axi_mem_intercon_BREADY;
  assign M00_AXI_rready = s00_couplers_to_axi_mem_intercon_RREADY;
  assign M00_AXI_wdata[255:0] = s00_couplers_to_axi_mem_intercon_WDATA;
  assign M00_AXI_wlast = s00_couplers_to_axi_mem_intercon_WLAST;
  assign M00_AXI_wstrb[31:0] = s00_couplers_to_axi_mem_intercon_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_axi_mem_intercon_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_mem_intercon_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_mem_intercon_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[3:0] = axi_mem_intercon_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_mem_intercon_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_mem_intercon_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[127:0] = axi_mem_intercon_to_s00_couplers_RDATA;
  assign S00_AXI_rid[3:0] = axi_mem_intercon_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_mem_intercon_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_mem_intercon_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_mem_intercon_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_mem_intercon_to_s00_couplers_WREADY;
  assign axi_mem_intercon_ACLK_net = M00_ACLK;
  assign axi_mem_intercon_ARESETN_net = M00_ARESETN;
  assign axi_mem_intercon_to_s00_couplers_ARADDR = S00_AXI_araddr[63:0];
  assign axi_mem_intercon_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_mem_intercon_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_mem_intercon_to_s00_couplers_ARID = S00_AXI_arid[3:0];
  assign axi_mem_intercon_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_mem_intercon_to_s00_couplers_ARLOCK = S00_AXI_arlock[0];
  assign axi_mem_intercon_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_mem_intercon_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_mem_intercon_to_s00_couplers_ARREGION = S00_AXI_arregion[3:0];
  assign axi_mem_intercon_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_mem_intercon_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_mem_intercon_to_s00_couplers_AWADDR = S00_AXI_awaddr[63:0];
  assign axi_mem_intercon_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_mem_intercon_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_mem_intercon_to_s00_couplers_AWID = S00_AXI_awid[3:0];
  assign axi_mem_intercon_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign axi_mem_intercon_to_s00_couplers_AWLOCK = S00_AXI_awlock[0];
  assign axi_mem_intercon_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_mem_intercon_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_mem_intercon_to_s00_couplers_AWREGION = S00_AXI_awregion[3:0];
  assign axi_mem_intercon_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_mem_intercon_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_mem_intercon_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_mem_intercon_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_mem_intercon_to_s00_couplers_WDATA = S00_AXI_wdata[127:0];
  assign axi_mem_intercon_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_mem_intercon_to_s00_couplers_WSTRB = S00_AXI_wstrb[15:0];
  assign axi_mem_intercon_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_axi_mem_intercon_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_axi_mem_intercon_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_axi_mem_intercon_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_axi_mem_intercon_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_axi_mem_intercon_RDATA = M00_AXI_rdata[255:0];
  assign s00_couplers_to_axi_mem_intercon_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_axi_mem_intercon_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_axi_mem_intercon_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_axi_mem_intercon_WREADY = M00_AXI_wready;
  s00_couplers_imp_7HNO1D s00_couplers
       (.M_ACLK(axi_mem_intercon_ACLK_net),
        .M_ARESETN(axi_mem_intercon_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_axi_mem_intercon_ARADDR),
        .M_AXI_arburst(s00_couplers_to_axi_mem_intercon_ARBURST),
        .M_AXI_arcache(s00_couplers_to_axi_mem_intercon_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_axi_mem_intercon_ARLEN),
        .M_AXI_arlock(s00_couplers_to_axi_mem_intercon_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_axi_mem_intercon_ARPROT),
        .M_AXI_arqos(s00_couplers_to_axi_mem_intercon_ARQOS),
        .M_AXI_arready(s00_couplers_to_axi_mem_intercon_ARREADY),
        .M_AXI_arsize(s00_couplers_to_axi_mem_intercon_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_axi_mem_intercon_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_axi_mem_intercon_AWADDR),
        .M_AXI_awburst(s00_couplers_to_axi_mem_intercon_AWBURST),
        .M_AXI_awcache(s00_couplers_to_axi_mem_intercon_AWCACHE),
        .M_AXI_awlen(s00_couplers_to_axi_mem_intercon_AWLEN),
        .M_AXI_awlock(s00_couplers_to_axi_mem_intercon_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_axi_mem_intercon_AWPROT),
        .M_AXI_awqos(s00_couplers_to_axi_mem_intercon_AWQOS),
        .M_AXI_awready(s00_couplers_to_axi_mem_intercon_AWREADY),
        .M_AXI_awsize(s00_couplers_to_axi_mem_intercon_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_axi_mem_intercon_AWVALID),
        .M_AXI_bready(s00_couplers_to_axi_mem_intercon_BREADY),
        .M_AXI_bresp(s00_couplers_to_axi_mem_intercon_BRESP),
        .M_AXI_bvalid(s00_couplers_to_axi_mem_intercon_BVALID),
        .M_AXI_rdata(s00_couplers_to_axi_mem_intercon_RDATA),
        .M_AXI_rlast(s00_couplers_to_axi_mem_intercon_RLAST),
        .M_AXI_rready(s00_couplers_to_axi_mem_intercon_RREADY),
        .M_AXI_rresp(s00_couplers_to_axi_mem_intercon_RRESP),
        .M_AXI_rvalid(s00_couplers_to_axi_mem_intercon_RVALID),
        .M_AXI_wdata(s00_couplers_to_axi_mem_intercon_WDATA),
        .M_AXI_wlast(s00_couplers_to_axi_mem_intercon_WLAST),
        .M_AXI_wready(s00_couplers_to_axi_mem_intercon_WREADY),
        .M_AXI_wstrb(s00_couplers_to_axi_mem_intercon_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_axi_mem_intercon_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_mem_intercon_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_mem_intercon_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_mem_intercon_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_mem_intercon_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_mem_intercon_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_mem_intercon_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_mem_intercon_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_mem_intercon_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_mem_intercon_to_s00_couplers_ARREADY),
        .S_AXI_arregion(axi_mem_intercon_to_s00_couplers_ARREGION),
        .S_AXI_arsize(axi_mem_intercon_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_mem_intercon_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_mem_intercon_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_mem_intercon_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_mem_intercon_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_mem_intercon_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_mem_intercon_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_mem_intercon_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_mem_intercon_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_mem_intercon_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_mem_intercon_to_s00_couplers_AWREADY),
        .S_AXI_awregion(axi_mem_intercon_to_s00_couplers_AWREGION),
        .S_AXI_awsize(axi_mem_intercon_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_mem_intercon_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_mem_intercon_to_s00_couplers_BID),
        .S_AXI_bready(axi_mem_intercon_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_mem_intercon_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_mem_intercon_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_mem_intercon_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_mem_intercon_to_s00_couplers_RID),
        .S_AXI_rlast(axi_mem_intercon_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_mem_intercon_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_mem_intercon_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_mem_intercon_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_mem_intercon_to_s00_couplers_WDATA),
        .S_AXI_wlast(axi_mem_intercon_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_mem_intercon_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_mem_intercon_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_mem_intercon_to_s00_couplers_WVALID));
endmodule

module design_1_xdma_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
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
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [63:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
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
  output [127:0]S00_AXI_rdata;
  output [3:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [127:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [15:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire [63:0]s00_couplers_to_xdma_0_axi_periph_ARADDR;
  wire [2:0]s00_couplers_to_xdma_0_axi_periph_ARPROT;
  wire s00_couplers_to_xdma_0_axi_periph_ARREADY;
  wire s00_couplers_to_xdma_0_axi_periph_ARVALID;
  wire [63:0]s00_couplers_to_xdma_0_axi_periph_AWADDR;
  wire [2:0]s00_couplers_to_xdma_0_axi_periph_AWPROT;
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
  wire [127:0]xdma_0_axi_periph_to_s00_couplers_RDATA;
  wire [3:0]xdma_0_axi_periph_to_s00_couplers_RID;
  wire xdma_0_axi_periph_to_s00_couplers_RLAST;
  wire xdma_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]xdma_0_axi_periph_to_s00_couplers_RRESP;
  wire xdma_0_axi_periph_to_s00_couplers_RVALID;
  wire [127:0]xdma_0_axi_periph_to_s00_couplers_WDATA;
  wire xdma_0_axi_periph_to_s00_couplers_WLAST;
  wire xdma_0_axi_periph_to_s00_couplers_WREADY;
  wire [15:0]xdma_0_axi_periph_to_s00_couplers_WSTRB;
  wire xdma_0_axi_periph_to_s00_couplers_WVALID;

  assign M00_AXI_araddr[63:0] = s00_couplers_to_xdma_0_axi_periph_ARADDR;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_xdma_0_axi_periph_ARPROT;
  assign M00_AXI_arvalid = s00_couplers_to_xdma_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[63:0] = s00_couplers_to_xdma_0_axi_periph_AWADDR;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_xdma_0_axi_periph_AWPROT;
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
  assign S00_AXI_rdata[127:0] = xdma_0_axi_periph_to_s00_couplers_RDATA;
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
  assign xdma_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[127:0];
  assign xdma_0_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign xdma_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[15:0];
  assign xdma_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  s00_couplers_imp_4M2UOV s00_couplers
       (.M_ACLK(xdma_0_axi_periph_ACLK_net),
        .M_ARESETN(xdma_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xdma_0_axi_periph_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xdma_0_axi_periph_ARPROT),
        .M_AXI_arready(s00_couplers_to_xdma_0_axi_periph_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xdma_0_axi_periph_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xdma_0_axi_periph_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xdma_0_axi_periph_AWPROT),
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

module s00_couplers_imp_4M2UOV
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [63:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [63:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [63:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [3:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [63:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [3:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [3:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [127:0]S_AXI_rdata;
  output [3:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [127:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [15:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [63:0]auto_cc_to_auto_ds_ARADDR;
  wire [1:0]auto_cc_to_auto_ds_ARBURST;
  wire [3:0]auto_cc_to_auto_ds_ARCACHE;
  wire [3:0]auto_cc_to_auto_ds_ARID;
  wire [7:0]auto_cc_to_auto_ds_ARLEN;
  wire [0:0]auto_cc_to_auto_ds_ARLOCK;
  wire [2:0]auto_cc_to_auto_ds_ARPROT;
  wire [3:0]auto_cc_to_auto_ds_ARQOS;
  wire auto_cc_to_auto_ds_ARREADY;
  wire [3:0]auto_cc_to_auto_ds_ARREGION;
  wire [2:0]auto_cc_to_auto_ds_ARSIZE;
  wire auto_cc_to_auto_ds_ARVALID;
  wire [63:0]auto_cc_to_auto_ds_AWADDR;
  wire [1:0]auto_cc_to_auto_ds_AWBURST;
  wire [3:0]auto_cc_to_auto_ds_AWCACHE;
  wire [3:0]auto_cc_to_auto_ds_AWID;
  wire [7:0]auto_cc_to_auto_ds_AWLEN;
  wire [0:0]auto_cc_to_auto_ds_AWLOCK;
  wire [2:0]auto_cc_to_auto_ds_AWPROT;
  wire [3:0]auto_cc_to_auto_ds_AWQOS;
  wire auto_cc_to_auto_ds_AWREADY;
  wire [3:0]auto_cc_to_auto_ds_AWREGION;
  wire [2:0]auto_cc_to_auto_ds_AWSIZE;
  wire auto_cc_to_auto_ds_AWVALID;
  wire [3:0]auto_cc_to_auto_ds_BID;
  wire auto_cc_to_auto_ds_BREADY;
  wire [1:0]auto_cc_to_auto_ds_BRESP;
  wire auto_cc_to_auto_ds_BVALID;
  wire [127:0]auto_cc_to_auto_ds_RDATA;
  wire [3:0]auto_cc_to_auto_ds_RID;
  wire auto_cc_to_auto_ds_RLAST;
  wire auto_cc_to_auto_ds_RREADY;
  wire [1:0]auto_cc_to_auto_ds_RRESP;
  wire auto_cc_to_auto_ds_RVALID;
  wire [127:0]auto_cc_to_auto_ds_WDATA;
  wire auto_cc_to_auto_ds_WLAST;
  wire auto_cc_to_auto_ds_WREADY;
  wire [15:0]auto_cc_to_auto_ds_WSTRB;
  wire auto_cc_to_auto_ds_WVALID;
  wire [63:0]auto_ds_to_auto_pc_ARADDR;
  wire [1:0]auto_ds_to_auto_pc_ARBURST;
  wire [3:0]auto_ds_to_auto_pc_ARCACHE;
  wire [7:0]auto_ds_to_auto_pc_ARLEN;
  wire [0:0]auto_ds_to_auto_pc_ARLOCK;
  wire [2:0]auto_ds_to_auto_pc_ARPROT;
  wire [3:0]auto_ds_to_auto_pc_ARQOS;
  wire auto_ds_to_auto_pc_ARREADY;
  wire [3:0]auto_ds_to_auto_pc_ARREGION;
  wire [2:0]auto_ds_to_auto_pc_ARSIZE;
  wire auto_ds_to_auto_pc_ARVALID;
  wire [63:0]auto_ds_to_auto_pc_AWADDR;
  wire [1:0]auto_ds_to_auto_pc_AWBURST;
  wire [3:0]auto_ds_to_auto_pc_AWCACHE;
  wire [7:0]auto_ds_to_auto_pc_AWLEN;
  wire [0:0]auto_ds_to_auto_pc_AWLOCK;
  wire [2:0]auto_ds_to_auto_pc_AWPROT;
  wire [3:0]auto_ds_to_auto_pc_AWQOS;
  wire auto_ds_to_auto_pc_AWREADY;
  wire [3:0]auto_ds_to_auto_pc_AWREGION;
  wire [2:0]auto_ds_to_auto_pc_AWSIZE;
  wire auto_ds_to_auto_pc_AWVALID;
  wire auto_ds_to_auto_pc_BREADY;
  wire [1:0]auto_ds_to_auto_pc_BRESP;
  wire auto_ds_to_auto_pc_BVALID;
  wire [31:0]auto_ds_to_auto_pc_RDATA;
  wire auto_ds_to_auto_pc_RLAST;
  wire auto_ds_to_auto_pc_RREADY;
  wire [1:0]auto_ds_to_auto_pc_RRESP;
  wire auto_ds_to_auto_pc_RVALID;
  wire [31:0]auto_ds_to_auto_pc_WDATA;
  wire auto_ds_to_auto_pc_WLAST;
  wire auto_ds_to_auto_pc_WREADY;
  wire [3:0]auto_ds_to_auto_pc_WSTRB;
  wire auto_ds_to_auto_pc_WVALID;
  wire [63:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [63:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [63:0]s00_couplers_to_auto_cc_ARADDR;
  wire [1:0]s00_couplers_to_auto_cc_ARBURST;
  wire [3:0]s00_couplers_to_auto_cc_ARCACHE;
  wire [3:0]s00_couplers_to_auto_cc_ARID;
  wire [7:0]s00_couplers_to_auto_cc_ARLEN;
  wire [0:0]s00_couplers_to_auto_cc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_cc_ARPROT;
  wire s00_couplers_to_auto_cc_ARREADY;
  wire [2:0]s00_couplers_to_auto_cc_ARSIZE;
  wire s00_couplers_to_auto_cc_ARVALID;
  wire [63:0]s00_couplers_to_auto_cc_AWADDR;
  wire [1:0]s00_couplers_to_auto_cc_AWBURST;
  wire [3:0]s00_couplers_to_auto_cc_AWCACHE;
  wire [3:0]s00_couplers_to_auto_cc_AWID;
  wire [7:0]s00_couplers_to_auto_cc_AWLEN;
  wire [0:0]s00_couplers_to_auto_cc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_cc_AWPROT;
  wire s00_couplers_to_auto_cc_AWREADY;
  wire [2:0]s00_couplers_to_auto_cc_AWSIZE;
  wire s00_couplers_to_auto_cc_AWVALID;
  wire [3:0]s00_couplers_to_auto_cc_BID;
  wire s00_couplers_to_auto_cc_BREADY;
  wire [1:0]s00_couplers_to_auto_cc_BRESP;
  wire s00_couplers_to_auto_cc_BVALID;
  wire [127:0]s00_couplers_to_auto_cc_RDATA;
  wire [3:0]s00_couplers_to_auto_cc_RID;
  wire s00_couplers_to_auto_cc_RLAST;
  wire s00_couplers_to_auto_cc_RREADY;
  wire [1:0]s00_couplers_to_auto_cc_RRESP;
  wire s00_couplers_to_auto_cc_RVALID;
  wire [127:0]s00_couplers_to_auto_cc_WDATA;
  wire s00_couplers_to_auto_cc_WLAST;
  wire s00_couplers_to_auto_cc_WREADY;
  wire [15:0]s00_couplers_to_auto_cc_WSTRB;
  wire s00_couplers_to_auto_cc_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[63:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[63:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bid[3:0] = s00_couplers_to_auto_cc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_cc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[127:0] = s00_couplers_to_auto_cc_RDATA;
  assign S_AXI_rid[3:0] = s00_couplers_to_auto_cc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_cc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_cc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_cc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_cc_ARADDR = S_AXI_araddr[63:0];
  assign s00_couplers_to_auto_cc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_cc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_cc_ARID = S_AXI_arid[3:0];
  assign s00_couplers_to_auto_cc_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_cc_ARLOCK = S_AXI_arlock[0];
  assign s00_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_cc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[63:0];
  assign s00_couplers_to_auto_cc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_cc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_cc_AWID = S_AXI_awid[3:0];
  assign s00_couplers_to_auto_cc_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_auto_cc_AWLOCK = S_AXI_awlock[0];
  assign s00_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_cc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_cc_WDATA = S_AXI_wdata[127:0];
  assign s00_couplers_to_auto_cc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[15:0];
  assign s00_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  design_1_auto_cc_1 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_auto_ds_ARADDR),
        .m_axi_arburst(auto_cc_to_auto_ds_ARBURST),
        .m_axi_arcache(auto_cc_to_auto_ds_ARCACHE),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arid(auto_cc_to_auto_ds_ARID),
        .m_axi_arlen(auto_cc_to_auto_ds_ARLEN),
        .m_axi_arlock(auto_cc_to_auto_ds_ARLOCK),
        .m_axi_arprot(auto_cc_to_auto_ds_ARPROT),
        .m_axi_arqos(auto_cc_to_auto_ds_ARQOS),
        .m_axi_arready(auto_cc_to_auto_ds_ARREADY),
        .m_axi_arregion(auto_cc_to_auto_ds_ARREGION),
        .m_axi_arsize(auto_cc_to_auto_ds_ARSIZE),
        .m_axi_arvalid(auto_cc_to_auto_ds_ARVALID),
        .m_axi_awaddr(auto_cc_to_auto_ds_AWADDR),
        .m_axi_awburst(auto_cc_to_auto_ds_AWBURST),
        .m_axi_awcache(auto_cc_to_auto_ds_AWCACHE),
        .m_axi_awid(auto_cc_to_auto_ds_AWID),
        .m_axi_awlen(auto_cc_to_auto_ds_AWLEN),
        .m_axi_awlock(auto_cc_to_auto_ds_AWLOCK),
        .m_axi_awprot(auto_cc_to_auto_ds_AWPROT),
        .m_axi_awqos(auto_cc_to_auto_ds_AWQOS),
        .m_axi_awready(auto_cc_to_auto_ds_AWREADY),
        .m_axi_awregion(auto_cc_to_auto_ds_AWREGION),
        .m_axi_awsize(auto_cc_to_auto_ds_AWSIZE),
        .m_axi_awvalid(auto_cc_to_auto_ds_AWVALID),
        .m_axi_bid(auto_cc_to_auto_ds_BID),
        .m_axi_bready(auto_cc_to_auto_ds_BREADY),
        .m_axi_bresp(auto_cc_to_auto_ds_BRESP),
        .m_axi_bvalid(auto_cc_to_auto_ds_BVALID),
        .m_axi_rdata(auto_cc_to_auto_ds_RDATA),
        .m_axi_rid(auto_cc_to_auto_ds_RID),
        .m_axi_rlast(auto_cc_to_auto_ds_RLAST),
        .m_axi_rready(auto_cc_to_auto_ds_RREADY),
        .m_axi_rresp(auto_cc_to_auto_ds_RRESP),
        .m_axi_rvalid(auto_cc_to_auto_ds_RVALID),
        .m_axi_wdata(auto_cc_to_auto_ds_WDATA),
        .m_axi_wlast(auto_cc_to_auto_ds_WLAST),
        .m_axi_wready(auto_cc_to_auto_ds_WREADY),
        .m_axi_wstrb(auto_cc_to_auto_ds_WSTRB),
        .m_axi_wvalid(auto_cc_to_auto_ds_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(s00_couplers_to_auto_cc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_cc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_cc_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arid(s00_couplers_to_auto_cc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_cc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_cc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_cc_ARPROT),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_auto_cc_ARREADY),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s00_couplers_to_auto_cc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_cc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_cc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_cc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_cc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_cc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_cc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_cc_AWPROT),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(s00_couplers_to_auto_cc_AWREADY),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s00_couplers_to_auto_cc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_cc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_cc_BID),
        .s_axi_bready(s00_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_cc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_cc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_cc_RID),
        .s_axi_rlast(s00_couplers_to_auto_cc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_cc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_cc_WDATA),
        .s_axi_wlast(s00_couplers_to_auto_cc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_cc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_cc_WVALID));
  design_1_auto_ds_0 auto_ds
       (.m_axi_araddr(auto_ds_to_auto_pc_ARADDR),
        .m_axi_arburst(auto_ds_to_auto_pc_ARBURST),
        .m_axi_arcache(auto_ds_to_auto_pc_ARCACHE),
        .m_axi_arlen(auto_ds_to_auto_pc_ARLEN),
        .m_axi_arlock(auto_ds_to_auto_pc_ARLOCK),
        .m_axi_arprot(auto_ds_to_auto_pc_ARPROT),
        .m_axi_arqos(auto_ds_to_auto_pc_ARQOS),
        .m_axi_arready(auto_ds_to_auto_pc_ARREADY),
        .m_axi_arregion(auto_ds_to_auto_pc_ARREGION),
        .m_axi_arsize(auto_ds_to_auto_pc_ARSIZE),
        .m_axi_arvalid(auto_ds_to_auto_pc_ARVALID),
        .m_axi_awaddr(auto_ds_to_auto_pc_AWADDR),
        .m_axi_awburst(auto_ds_to_auto_pc_AWBURST),
        .m_axi_awcache(auto_ds_to_auto_pc_AWCACHE),
        .m_axi_awlen(auto_ds_to_auto_pc_AWLEN),
        .m_axi_awlock(auto_ds_to_auto_pc_AWLOCK),
        .m_axi_awprot(auto_ds_to_auto_pc_AWPROT),
        .m_axi_awqos(auto_ds_to_auto_pc_AWQOS),
        .m_axi_awready(auto_ds_to_auto_pc_AWREADY),
        .m_axi_awregion(auto_ds_to_auto_pc_AWREGION),
        .m_axi_awsize(auto_ds_to_auto_pc_AWSIZE),
        .m_axi_awvalid(auto_ds_to_auto_pc_AWVALID),
        .m_axi_bready(auto_ds_to_auto_pc_BREADY),
        .m_axi_bresp(auto_ds_to_auto_pc_BRESP),
        .m_axi_bvalid(auto_ds_to_auto_pc_BVALID),
        .m_axi_rdata(auto_ds_to_auto_pc_RDATA),
        .m_axi_rlast(auto_ds_to_auto_pc_RLAST),
        .m_axi_rready(auto_ds_to_auto_pc_RREADY),
        .m_axi_rresp(auto_ds_to_auto_pc_RRESP),
        .m_axi_rvalid(auto_ds_to_auto_pc_RVALID),
        .m_axi_wdata(auto_ds_to_auto_pc_WDATA),
        .m_axi_wlast(auto_ds_to_auto_pc_WLAST),
        .m_axi_wready(auto_ds_to_auto_pc_WREADY),
        .m_axi_wstrb(auto_ds_to_auto_pc_WSTRB),
        .m_axi_wvalid(auto_ds_to_auto_pc_WVALID),
        .s_axi_aclk(M_ACLK_1),
        .s_axi_araddr(auto_cc_to_auto_ds_ARADDR),
        .s_axi_arburst(auto_cc_to_auto_ds_ARBURST),
        .s_axi_arcache(auto_cc_to_auto_ds_ARCACHE),
        .s_axi_aresetn(M_ARESETN_1),
        .s_axi_arid(auto_cc_to_auto_ds_ARID),
        .s_axi_arlen(auto_cc_to_auto_ds_ARLEN),
        .s_axi_arlock(auto_cc_to_auto_ds_ARLOCK),
        .s_axi_arprot(auto_cc_to_auto_ds_ARPROT),
        .s_axi_arqos(auto_cc_to_auto_ds_ARQOS),
        .s_axi_arready(auto_cc_to_auto_ds_ARREADY),
        .s_axi_arregion(auto_cc_to_auto_ds_ARREGION),
        .s_axi_arsize(auto_cc_to_auto_ds_ARSIZE),
        .s_axi_arvalid(auto_cc_to_auto_ds_ARVALID),
        .s_axi_awaddr(auto_cc_to_auto_ds_AWADDR),
        .s_axi_awburst(auto_cc_to_auto_ds_AWBURST),
        .s_axi_awcache(auto_cc_to_auto_ds_AWCACHE),
        .s_axi_awid(auto_cc_to_auto_ds_AWID),
        .s_axi_awlen(auto_cc_to_auto_ds_AWLEN),
        .s_axi_awlock(auto_cc_to_auto_ds_AWLOCK),
        .s_axi_awprot(auto_cc_to_auto_ds_AWPROT),
        .s_axi_awqos(auto_cc_to_auto_ds_AWQOS),
        .s_axi_awready(auto_cc_to_auto_ds_AWREADY),
        .s_axi_awregion(auto_cc_to_auto_ds_AWREGION),
        .s_axi_awsize(auto_cc_to_auto_ds_AWSIZE),
        .s_axi_awvalid(auto_cc_to_auto_ds_AWVALID),
        .s_axi_bid(auto_cc_to_auto_ds_BID),
        .s_axi_bready(auto_cc_to_auto_ds_BREADY),
        .s_axi_bresp(auto_cc_to_auto_ds_BRESP),
        .s_axi_bvalid(auto_cc_to_auto_ds_BVALID),
        .s_axi_rdata(auto_cc_to_auto_ds_RDATA),
        .s_axi_rid(auto_cc_to_auto_ds_RID),
        .s_axi_rlast(auto_cc_to_auto_ds_RLAST),
        .s_axi_rready(auto_cc_to_auto_ds_RREADY),
        .s_axi_rresp(auto_cc_to_auto_ds_RRESP),
        .s_axi_rvalid(auto_cc_to_auto_ds_RVALID),
        .s_axi_wdata(auto_cc_to_auto_ds_WDATA),
        .s_axi_wlast(auto_cc_to_auto_ds_WLAST),
        .s_axi_wready(auto_cc_to_auto_ds_WREADY),
        .s_axi_wstrb(auto_cc_to_auto_ds_WSTRB),
        .s_axi_wvalid(auto_cc_to_auto_ds_WVALID));
  design_1_auto_pc_1 auto_pc
       (.aclk(M_ACLK_1),
        .aresetn(M_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(auto_ds_to_auto_pc_ARADDR),
        .s_axi_arburst(auto_ds_to_auto_pc_ARBURST),
        .s_axi_arcache(auto_ds_to_auto_pc_ARCACHE),
        .s_axi_arlen(auto_ds_to_auto_pc_ARLEN),
        .s_axi_arlock(auto_ds_to_auto_pc_ARLOCK),
        .s_axi_arprot(auto_ds_to_auto_pc_ARPROT),
        .s_axi_arqos(auto_ds_to_auto_pc_ARQOS),
        .s_axi_arready(auto_ds_to_auto_pc_ARREADY),
        .s_axi_arregion(auto_ds_to_auto_pc_ARREGION),
        .s_axi_arsize(auto_ds_to_auto_pc_ARSIZE),
        .s_axi_arvalid(auto_ds_to_auto_pc_ARVALID),
        .s_axi_awaddr(auto_ds_to_auto_pc_AWADDR),
        .s_axi_awburst(auto_ds_to_auto_pc_AWBURST),
        .s_axi_awcache(auto_ds_to_auto_pc_AWCACHE),
        .s_axi_awlen(auto_ds_to_auto_pc_AWLEN),
        .s_axi_awlock(auto_ds_to_auto_pc_AWLOCK),
        .s_axi_awprot(auto_ds_to_auto_pc_AWPROT),
        .s_axi_awqos(auto_ds_to_auto_pc_AWQOS),
        .s_axi_awready(auto_ds_to_auto_pc_AWREADY),
        .s_axi_awregion(auto_ds_to_auto_pc_AWREGION),
        .s_axi_awsize(auto_ds_to_auto_pc_AWSIZE),
        .s_axi_awvalid(auto_ds_to_auto_pc_AWVALID),
        .s_axi_bready(auto_ds_to_auto_pc_BREADY),
        .s_axi_bresp(auto_ds_to_auto_pc_BRESP),
        .s_axi_bvalid(auto_ds_to_auto_pc_BVALID),
        .s_axi_rdata(auto_ds_to_auto_pc_RDATA),
        .s_axi_rlast(auto_ds_to_auto_pc_RLAST),
        .s_axi_rready(auto_ds_to_auto_pc_RREADY),
        .s_axi_rresp(auto_ds_to_auto_pc_RRESP),
        .s_axi_rvalid(auto_ds_to_auto_pc_RVALID),
        .s_axi_wdata(auto_ds_to_auto_pc_WDATA),
        .s_axi_wlast(auto_ds_to_auto_pc_WLAST),
        .s_axi_wready(auto_ds_to_auto_pc_WREADY),
        .s_axi_wstrb(auto_ds_to_auto_pc_WSTRB),
        .s_axi_wvalid(auto_ds_to_auto_pc_WVALID));
endmodule

module s00_couplers_imp_7HNO1D
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [63:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [63:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [255:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [255:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [31:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [63:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [3:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [63:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [3:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [3:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [127:0]S_AXI_rdata;
  output [3:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [127:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [15:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [63:0]auto_cc_to_s00_couplers_ARADDR;
  wire [1:0]auto_cc_to_s00_couplers_ARBURST;
  wire [3:0]auto_cc_to_s00_couplers_ARCACHE;
  wire [3:0]auto_cc_to_s00_couplers_ARLEN;
  wire [1:0]auto_cc_to_s00_couplers_ARLOCK;
  wire [2:0]auto_cc_to_s00_couplers_ARPROT;
  wire [3:0]auto_cc_to_s00_couplers_ARQOS;
  wire auto_cc_to_s00_couplers_ARREADY;
  wire [2:0]auto_cc_to_s00_couplers_ARSIZE;
  wire auto_cc_to_s00_couplers_ARVALID;
  wire [63:0]auto_cc_to_s00_couplers_AWADDR;
  wire [1:0]auto_cc_to_s00_couplers_AWBURST;
  wire [3:0]auto_cc_to_s00_couplers_AWCACHE;
  wire [3:0]auto_cc_to_s00_couplers_AWLEN;
  wire [1:0]auto_cc_to_s00_couplers_AWLOCK;
  wire [2:0]auto_cc_to_s00_couplers_AWPROT;
  wire [3:0]auto_cc_to_s00_couplers_AWQOS;
  wire auto_cc_to_s00_couplers_AWREADY;
  wire [2:0]auto_cc_to_s00_couplers_AWSIZE;
  wire auto_cc_to_s00_couplers_AWVALID;
  wire auto_cc_to_s00_couplers_BREADY;
  wire [1:0]auto_cc_to_s00_couplers_BRESP;
  wire auto_cc_to_s00_couplers_BVALID;
  wire [255:0]auto_cc_to_s00_couplers_RDATA;
  wire auto_cc_to_s00_couplers_RLAST;
  wire auto_cc_to_s00_couplers_RREADY;
  wire [1:0]auto_cc_to_s00_couplers_RRESP;
  wire auto_cc_to_s00_couplers_RVALID;
  wire [255:0]auto_cc_to_s00_couplers_WDATA;
  wire auto_cc_to_s00_couplers_WLAST;
  wire auto_cc_to_s00_couplers_WREADY;
  wire [31:0]auto_cc_to_s00_couplers_WSTRB;
  wire auto_cc_to_s00_couplers_WVALID;
  wire [63:0]auto_pc_to_auto_us_ARADDR;
  wire [1:0]auto_pc_to_auto_us_ARBURST;
  wire [3:0]auto_pc_to_auto_us_ARCACHE;
  wire [3:0]auto_pc_to_auto_us_ARID;
  wire [3:0]auto_pc_to_auto_us_ARLEN;
  wire [1:0]auto_pc_to_auto_us_ARLOCK;
  wire [2:0]auto_pc_to_auto_us_ARPROT;
  wire [3:0]auto_pc_to_auto_us_ARQOS;
  wire auto_pc_to_auto_us_ARREADY;
  wire [2:0]auto_pc_to_auto_us_ARSIZE;
  wire auto_pc_to_auto_us_ARVALID;
  wire [63:0]auto_pc_to_auto_us_AWADDR;
  wire [1:0]auto_pc_to_auto_us_AWBURST;
  wire [3:0]auto_pc_to_auto_us_AWCACHE;
  wire [3:0]auto_pc_to_auto_us_AWID;
  wire [3:0]auto_pc_to_auto_us_AWLEN;
  wire [1:0]auto_pc_to_auto_us_AWLOCK;
  wire [2:0]auto_pc_to_auto_us_AWPROT;
  wire [3:0]auto_pc_to_auto_us_AWQOS;
  wire auto_pc_to_auto_us_AWREADY;
  wire [2:0]auto_pc_to_auto_us_AWSIZE;
  wire auto_pc_to_auto_us_AWVALID;
  wire [3:0]auto_pc_to_auto_us_BID;
  wire auto_pc_to_auto_us_BREADY;
  wire [1:0]auto_pc_to_auto_us_BRESP;
  wire auto_pc_to_auto_us_BVALID;
  wire [127:0]auto_pc_to_auto_us_RDATA;
  wire [3:0]auto_pc_to_auto_us_RID;
  wire auto_pc_to_auto_us_RLAST;
  wire auto_pc_to_auto_us_RREADY;
  wire [1:0]auto_pc_to_auto_us_RRESP;
  wire auto_pc_to_auto_us_RVALID;
  wire [127:0]auto_pc_to_auto_us_WDATA;
  wire auto_pc_to_auto_us_WLAST;
  wire auto_pc_to_auto_us_WREADY;
  wire [15:0]auto_pc_to_auto_us_WSTRB;
  wire auto_pc_to_auto_us_WVALID;
  wire [63:0]auto_us_to_auto_cc_ARADDR;
  wire [1:0]auto_us_to_auto_cc_ARBURST;
  wire [3:0]auto_us_to_auto_cc_ARCACHE;
  wire [3:0]auto_us_to_auto_cc_ARLEN;
  wire [1:0]auto_us_to_auto_cc_ARLOCK;
  wire [2:0]auto_us_to_auto_cc_ARPROT;
  wire [3:0]auto_us_to_auto_cc_ARQOS;
  wire auto_us_to_auto_cc_ARREADY;
  wire [2:0]auto_us_to_auto_cc_ARSIZE;
  wire auto_us_to_auto_cc_ARVALID;
  wire [63:0]auto_us_to_auto_cc_AWADDR;
  wire [1:0]auto_us_to_auto_cc_AWBURST;
  wire [3:0]auto_us_to_auto_cc_AWCACHE;
  wire [3:0]auto_us_to_auto_cc_AWLEN;
  wire [1:0]auto_us_to_auto_cc_AWLOCK;
  wire [2:0]auto_us_to_auto_cc_AWPROT;
  wire [3:0]auto_us_to_auto_cc_AWQOS;
  wire auto_us_to_auto_cc_AWREADY;
  wire [2:0]auto_us_to_auto_cc_AWSIZE;
  wire auto_us_to_auto_cc_AWVALID;
  wire auto_us_to_auto_cc_BREADY;
  wire [1:0]auto_us_to_auto_cc_BRESP;
  wire auto_us_to_auto_cc_BVALID;
  wire [255:0]auto_us_to_auto_cc_RDATA;
  wire auto_us_to_auto_cc_RLAST;
  wire auto_us_to_auto_cc_RREADY;
  wire [1:0]auto_us_to_auto_cc_RRESP;
  wire auto_us_to_auto_cc_RVALID;
  wire [255:0]auto_us_to_auto_cc_WDATA;
  wire auto_us_to_auto_cc_WLAST;
  wire auto_us_to_auto_cc_WREADY;
  wire [31:0]auto_us_to_auto_cc_WSTRB;
  wire auto_us_to_auto_cc_WVALID;
  wire [63:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [3:0]s00_couplers_to_auto_pc_ARID;
  wire [7:0]s00_couplers_to_auto_pc_ARLEN;
  wire [0:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [3:0]s00_couplers_to_auto_pc_ARREGION;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [63:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [3:0]s00_couplers_to_auto_pc_AWID;
  wire [7:0]s00_couplers_to_auto_pc_AWLEN;
  wire [0:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [3:0]s00_couplers_to_auto_pc_AWREGION;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [3:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [127:0]s00_couplers_to_auto_pc_RDATA;
  wire [3:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [127:0]s00_couplers_to_auto_pc_WDATA;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [15:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[63:0] = auto_cc_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_cc_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_cc_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[3:0] = auto_cc_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_cc_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_cc_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_cc_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_cc_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_cc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[63:0] = auto_cc_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_cc_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_cc_to_s00_couplers_AWCACHE;
  assign M_AXI_awlen[3:0] = auto_cc_to_s00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = auto_cc_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_cc_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_cc_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_cc_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_cc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_cc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_cc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[255:0] = auto_cc_to_s00_couplers_WDATA;
  assign M_AXI_wlast = auto_cc_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[31:0] = auto_cc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_cc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[3:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[127:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[3:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_cc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_cc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_cc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_cc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_cc_to_s00_couplers_RDATA = M_AXI_rdata[255:0];
  assign auto_cc_to_s00_couplers_RLAST = M_AXI_rlast;
  assign auto_cc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_cc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_cc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[63:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[3:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[63:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[3:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[127:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[15:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  design_1_auto_cc_0 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_s00_couplers_ARADDR),
        .m_axi_arburst(auto_cc_to_s00_couplers_ARBURST),
        .m_axi_arcache(auto_cc_to_s00_couplers_ARCACHE),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arlen(auto_cc_to_s00_couplers_ARLEN),
        .m_axi_arlock(auto_cc_to_s00_couplers_ARLOCK),
        .m_axi_arprot(auto_cc_to_s00_couplers_ARPROT),
        .m_axi_arqos(auto_cc_to_s00_couplers_ARQOS),
        .m_axi_arready(auto_cc_to_s00_couplers_ARREADY),
        .m_axi_arsize(auto_cc_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(auto_cc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_cc_to_s00_couplers_AWADDR),
        .m_axi_awburst(auto_cc_to_s00_couplers_AWBURST),
        .m_axi_awcache(auto_cc_to_s00_couplers_AWCACHE),
        .m_axi_awlen(auto_cc_to_s00_couplers_AWLEN),
        .m_axi_awlock(auto_cc_to_s00_couplers_AWLOCK),
        .m_axi_awprot(auto_cc_to_s00_couplers_AWPROT),
        .m_axi_awqos(auto_cc_to_s00_couplers_AWQOS),
        .m_axi_awready(auto_cc_to_s00_couplers_AWREADY),
        .m_axi_awsize(auto_cc_to_s00_couplers_AWSIZE),
        .m_axi_awvalid(auto_cc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_cc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_cc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_cc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_cc_to_s00_couplers_RDATA),
        .m_axi_rlast(auto_cc_to_s00_couplers_RLAST),
        .m_axi_rready(auto_cc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_cc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_cc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_cc_to_s00_couplers_WDATA),
        .m_axi_wlast(auto_cc_to_s00_couplers_WLAST),
        .m_axi_wready(auto_cc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_cc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_cc_to_s00_couplers_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(auto_us_to_auto_cc_ARADDR),
        .s_axi_arburst(auto_us_to_auto_cc_ARBURST),
        .s_axi_arcache(auto_us_to_auto_cc_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arlen(auto_us_to_auto_cc_ARLEN),
        .s_axi_arlock(auto_us_to_auto_cc_ARLOCK),
        .s_axi_arprot(auto_us_to_auto_cc_ARPROT),
        .s_axi_arqos(auto_us_to_auto_cc_ARQOS),
        .s_axi_arready(auto_us_to_auto_cc_ARREADY),
        .s_axi_arsize(auto_us_to_auto_cc_ARSIZE),
        .s_axi_arvalid(auto_us_to_auto_cc_ARVALID),
        .s_axi_awaddr(auto_us_to_auto_cc_AWADDR),
        .s_axi_awburst(auto_us_to_auto_cc_AWBURST),
        .s_axi_awcache(auto_us_to_auto_cc_AWCACHE),
        .s_axi_awlen(auto_us_to_auto_cc_AWLEN),
        .s_axi_awlock(auto_us_to_auto_cc_AWLOCK),
        .s_axi_awprot(auto_us_to_auto_cc_AWPROT),
        .s_axi_awqos(auto_us_to_auto_cc_AWQOS),
        .s_axi_awready(auto_us_to_auto_cc_AWREADY),
        .s_axi_awsize(auto_us_to_auto_cc_AWSIZE),
        .s_axi_awvalid(auto_us_to_auto_cc_AWVALID),
        .s_axi_bready(auto_us_to_auto_cc_BREADY),
        .s_axi_bresp(auto_us_to_auto_cc_BRESP),
        .s_axi_bvalid(auto_us_to_auto_cc_BVALID),
        .s_axi_rdata(auto_us_to_auto_cc_RDATA),
        .s_axi_rlast(auto_us_to_auto_cc_RLAST),
        .s_axi_rready(auto_us_to_auto_cc_RREADY),
        .s_axi_rresp(auto_us_to_auto_cc_RRESP),
        .s_axi_rvalid(auto_us_to_auto_cc_RVALID),
        .s_axi_wdata(auto_us_to_auto_cc_WDATA),
        .s_axi_wlast(auto_us_to_auto_cc_WLAST),
        .s_axi_wready(auto_us_to_auto_cc_WREADY),
        .s_axi_wstrb(auto_us_to_auto_cc_WSTRB),
        .s_axi_wvalid(auto_us_to_auto_cc_WVALID));
  design_1_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_auto_us_ARADDR),
        .m_axi_arburst(auto_pc_to_auto_us_ARBURST),
        .m_axi_arcache(auto_pc_to_auto_us_ARCACHE),
        .m_axi_arid(auto_pc_to_auto_us_ARID),
        .m_axi_arlen(auto_pc_to_auto_us_ARLEN),
        .m_axi_arlock(auto_pc_to_auto_us_ARLOCK),
        .m_axi_arprot(auto_pc_to_auto_us_ARPROT),
        .m_axi_arqos(auto_pc_to_auto_us_ARQOS),
        .m_axi_arready(auto_pc_to_auto_us_ARREADY),
        .m_axi_arsize(auto_pc_to_auto_us_ARSIZE),
        .m_axi_arvalid(auto_pc_to_auto_us_ARVALID),
        .m_axi_awaddr(auto_pc_to_auto_us_AWADDR),
        .m_axi_awburst(auto_pc_to_auto_us_AWBURST),
        .m_axi_awcache(auto_pc_to_auto_us_AWCACHE),
        .m_axi_awid(auto_pc_to_auto_us_AWID),
        .m_axi_awlen(auto_pc_to_auto_us_AWLEN),
        .m_axi_awlock(auto_pc_to_auto_us_AWLOCK),
        .m_axi_awprot(auto_pc_to_auto_us_AWPROT),
        .m_axi_awqos(auto_pc_to_auto_us_AWQOS),
        .m_axi_awready(auto_pc_to_auto_us_AWREADY),
        .m_axi_awsize(auto_pc_to_auto_us_AWSIZE),
        .m_axi_awvalid(auto_pc_to_auto_us_AWVALID),
        .m_axi_bid(auto_pc_to_auto_us_BID),
        .m_axi_bready(auto_pc_to_auto_us_BREADY),
        .m_axi_bresp(auto_pc_to_auto_us_BRESP),
        .m_axi_bvalid(auto_pc_to_auto_us_BVALID),
        .m_axi_rdata(auto_pc_to_auto_us_RDATA),
        .m_axi_rid(auto_pc_to_auto_us_RID),
        .m_axi_rlast(auto_pc_to_auto_us_RLAST),
        .m_axi_rready(auto_pc_to_auto_us_RREADY),
        .m_axi_rresp(auto_pc_to_auto_us_RRESP),
        .m_axi_rvalid(auto_pc_to_auto_us_RVALID),
        .m_axi_wdata(auto_pc_to_auto_us_WDATA),
        .m_axi_wlast(auto_pc_to_auto_us_WLAST),
        .m_axi_wready(auto_pc_to_auto_us_WREADY),
        .m_axi_wstrb(auto_pc_to_auto_us_WSTRB),
        .m_axi_wvalid(auto_pc_to_auto_us_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(s00_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(s00_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
  design_1_auto_us_0 auto_us
       (.m_axi_araddr(auto_us_to_auto_cc_ARADDR),
        .m_axi_arburst(auto_us_to_auto_cc_ARBURST),
        .m_axi_arcache(auto_us_to_auto_cc_ARCACHE),
        .m_axi_arlen(auto_us_to_auto_cc_ARLEN),
        .m_axi_arlock(auto_us_to_auto_cc_ARLOCK),
        .m_axi_arprot(auto_us_to_auto_cc_ARPROT),
        .m_axi_arqos(auto_us_to_auto_cc_ARQOS),
        .m_axi_arready(auto_us_to_auto_cc_ARREADY),
        .m_axi_arsize(auto_us_to_auto_cc_ARSIZE),
        .m_axi_arvalid(auto_us_to_auto_cc_ARVALID),
        .m_axi_awaddr(auto_us_to_auto_cc_AWADDR),
        .m_axi_awburst(auto_us_to_auto_cc_AWBURST),
        .m_axi_awcache(auto_us_to_auto_cc_AWCACHE),
        .m_axi_awlen(auto_us_to_auto_cc_AWLEN),
        .m_axi_awlock(auto_us_to_auto_cc_AWLOCK),
        .m_axi_awprot(auto_us_to_auto_cc_AWPROT),
        .m_axi_awqos(auto_us_to_auto_cc_AWQOS),
        .m_axi_awready(auto_us_to_auto_cc_AWREADY),
        .m_axi_awsize(auto_us_to_auto_cc_AWSIZE),
        .m_axi_awvalid(auto_us_to_auto_cc_AWVALID),
        .m_axi_bready(auto_us_to_auto_cc_BREADY),
        .m_axi_bresp(auto_us_to_auto_cc_BRESP),
        .m_axi_bvalid(auto_us_to_auto_cc_BVALID),
        .m_axi_rdata(auto_us_to_auto_cc_RDATA),
        .m_axi_rlast(auto_us_to_auto_cc_RLAST),
        .m_axi_rready(auto_us_to_auto_cc_RREADY),
        .m_axi_rresp(auto_us_to_auto_cc_RRESP),
        .m_axi_rvalid(auto_us_to_auto_cc_RVALID),
        .m_axi_wdata(auto_us_to_auto_cc_WDATA),
        .m_axi_wlast(auto_us_to_auto_cc_WLAST),
        .m_axi_wready(auto_us_to_auto_cc_WREADY),
        .m_axi_wstrb(auto_us_to_auto_cc_WSTRB),
        .m_axi_wvalid(auto_us_to_auto_cc_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(auto_pc_to_auto_us_ARADDR),
        .s_axi_arburst(auto_pc_to_auto_us_ARBURST),
        .s_axi_arcache(auto_pc_to_auto_us_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arid(auto_pc_to_auto_us_ARID),
        .s_axi_arlen(auto_pc_to_auto_us_ARLEN),
        .s_axi_arlock(auto_pc_to_auto_us_ARLOCK),
        .s_axi_arprot(auto_pc_to_auto_us_ARPROT),
        .s_axi_arqos(auto_pc_to_auto_us_ARQOS),
        .s_axi_arready(auto_pc_to_auto_us_ARREADY),
        .s_axi_arsize(auto_pc_to_auto_us_ARSIZE),
        .s_axi_arvalid(auto_pc_to_auto_us_ARVALID),
        .s_axi_awaddr(auto_pc_to_auto_us_AWADDR),
        .s_axi_awburst(auto_pc_to_auto_us_AWBURST),
        .s_axi_awcache(auto_pc_to_auto_us_AWCACHE),
        .s_axi_awid(auto_pc_to_auto_us_AWID),
        .s_axi_awlen(auto_pc_to_auto_us_AWLEN),
        .s_axi_awlock(auto_pc_to_auto_us_AWLOCK),
        .s_axi_awprot(auto_pc_to_auto_us_AWPROT),
        .s_axi_awqos(auto_pc_to_auto_us_AWQOS),
        .s_axi_awready(auto_pc_to_auto_us_AWREADY),
        .s_axi_awsize(auto_pc_to_auto_us_AWSIZE),
        .s_axi_awvalid(auto_pc_to_auto_us_AWVALID),
        .s_axi_bid(auto_pc_to_auto_us_BID),
        .s_axi_bready(auto_pc_to_auto_us_BREADY),
        .s_axi_bresp(auto_pc_to_auto_us_BRESP),
        .s_axi_bvalid(auto_pc_to_auto_us_BVALID),
        .s_axi_rdata(auto_pc_to_auto_us_RDATA),
        .s_axi_rid(auto_pc_to_auto_us_RID),
        .s_axi_rlast(auto_pc_to_auto_us_RLAST),
        .s_axi_rready(auto_pc_to_auto_us_RREADY),
        .s_axi_rresp(auto_pc_to_auto_us_RRESP),
        .s_axi_rvalid(auto_pc_to_auto_us_RVALID),
        .s_axi_wdata(auto_pc_to_auto_us_WDATA),
        .s_axi_wlast(auto_pc_to_auto_us_WLAST),
        .s_axi_wready(auto_pc_to_auto_us_WREADY),
        .s_axi_wstrb(auto_pc_to_auto_us_WSTRB),
        .s_axi_wvalid(auto_pc_to_auto_us_WVALID));
endmodule
