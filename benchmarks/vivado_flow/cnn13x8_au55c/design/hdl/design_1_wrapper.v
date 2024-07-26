//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Tue Jul 23 21:32:14 2024
//Host        : ny1 running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (pci_express_x4_rxn,
    pci_express_x4_rxp,
    pci_express_x4_txn,
    pci_express_x4_txp,
    pcie_perstn,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    slr0_freerun_clk_clk_n,
    slr0_freerun_clk_clk_p);
  input [3:0]pci_express_x4_rxn;
  input [3:0]pci_express_x4_rxp;
  output [3:0]pci_express_x4_txn;
  output [3:0]pci_express_x4_txp;
  input pcie_perstn;
  input [0:0]pcie_refclk_clk_n;
  input [0:0]pcie_refclk_clk_p;
  input slr0_freerun_clk_clk_n;
  input slr0_freerun_clk_clk_p;

  wire [3:0]pci_express_x4_rxn;
  wire [3:0]pci_express_x4_rxp;
  wire [3:0]pci_express_x4_txn;
  wire [3:0]pci_express_x4_txp;
  wire pcie_perstn;
  wire [0:0]pcie_refclk_clk_n;
  wire [0:0]pcie_refclk_clk_p;
  wire slr0_freerun_clk_clk_n;
  wire slr0_freerun_clk_clk_p;

  design_1 design_1_i
       (.pci_express_x4_rxn(pci_express_x4_rxn),
        .pci_express_x4_rxp(pci_express_x4_rxp),
        .pci_express_x4_txn(pci_express_x4_txn),
        .pci_express_x4_txp(pci_express_x4_txp),
        .pcie_perstn(pcie_perstn),
        .pcie_refclk_clk_n(pcie_refclk_clk_n),
        .pcie_refclk_clk_p(pcie_refclk_clk_p),
        .slr0_freerun_clk_clk_n(slr0_freerun_clk_clk_n),
        .slr0_freerun_clk_clk_p(slr0_freerun_clk_clk_p));
endmodule
