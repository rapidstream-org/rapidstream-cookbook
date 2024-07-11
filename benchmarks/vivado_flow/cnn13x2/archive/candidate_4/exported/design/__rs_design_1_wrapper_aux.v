`timescale 1 ns / 1 ps
module __rs_design_1_wrapper_aux (
    output wire HBM_CATTRIP,
    input wire  hbm_clk_clk_n,
    input wire  hbm_clk_clk_p,
    input wire  pci_express_x1_rxn,
    input wire  pci_express_x1_rxp,
    output wire pci_express_x1_txn,
    output wire pci_express_x1_txp,
    input wire  pcie_perstn,
    input wire  pcie_refclk_clk_n,
    input wire  pcie_refclk_clk_p,
    input wire  design_1_i_HBM_CATTRIP,
    output wire design_1_i_hbm_clk_clk_n,
    output wire design_1_i_hbm_clk_clk_p,
    output wire design_1_i_pci_express_x1_rxn,
    output wire design_1_i_pci_express_x1_rxp,
    input wire  design_1_i_pci_express_x1_txn,
    input wire  design_1_i_pci_express_x1_txp,
    output wire design_1_i_pcie_perstn,
    output wire design_1_i_pcie_refclk_clk_n,
    output wire design_1_i_pcie_refclk_clk_p
);
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
  assign HBM_CATTRIP = design_1_i_HBM_CATTRIP;
  assign design_1_i_hbm_clk_clk_n = hbm_clk_clk_n;
  assign design_1_i_hbm_clk_clk_p = hbm_clk_clk_p;
  assign design_1_i_pci_express_x1_rxn = pci_express_x1_rxn;
  assign design_1_i_pci_express_x1_rxp = pci_express_x1_rxp;
  assign pci_express_x1_txn = design_1_i_pci_express_x1_txn;
  assign pci_express_x1_txp = design_1_i_pci_express_x1_txp;
  assign design_1_i_pcie_perstn = pcie_perstn;
  assign design_1_i_pcie_refclk_clk_n = pcie_refclk_clk_n;
  assign design_1_i_pcie_refclk_clk_p = pcie_refclk_clk_p;
endmodule
