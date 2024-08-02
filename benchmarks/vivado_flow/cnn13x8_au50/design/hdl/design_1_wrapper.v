//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Wed Jul 10 19:55:30 2024
//Host        : inglewood running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (HBM_CATTRIP,
    hbm_clk_clk_n,
    hbm_clk_clk_p,
    pci_express_x1_rxn,
    pci_express_x1_rxp,
    pci_express_x1_txn,
    pci_express_x1_txp,
    pcie_perstn,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p);
  output HBM_CATTRIP;
  input hbm_clk_clk_n;
  input hbm_clk_clk_p;
  input pci_express_x1_rxn;
  input pci_express_x1_rxp;
  output pci_express_x1_txn;
  output pci_express_x1_txp;
  input pcie_perstn;
  input pcie_refclk_clk_n;
  input pcie_refclk_clk_p;

  wire HBM_CATTRIP;
  wire hbm_clk_clk_n;
  wire hbm_clk_clk_p;
  wire pci_express_x1_rxn;
  wire pci_express_x1_rxp;
  wire pci_express_x1_txn;
  wire pci_express_x1_txp;
  wire pcie_perstn;
  wire pcie_refclk_clk_n;
  wire pcie_refclk_clk_p;

  design_1 design_1_i
       (.HBM_CATTRIP(HBM_CATTRIP),
        .hbm_clk_clk_n(hbm_clk_clk_n),
        .hbm_clk_clk_p(hbm_clk_clk_p),
        .pci_express_x1_rxn(pci_express_x1_rxn),
        .pci_express_x1_rxp(pci_express_x1_rxp),
        .pci_express_x1_txn(pci_express_x1_txn),
        .pci_express_x1_txp(pci_express_x1_txp),
        .pcie_perstn(pcie_perstn),
        .pcie_refclk_clk_n(pcie_refclk_clk_n),
        .pcie_refclk_clk_p(pcie_refclk_clk_p));
endmodule
