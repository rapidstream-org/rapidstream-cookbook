// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_passthrough_8 (
    output wire __rs_passthrough_pcie_refclk_clk_n,
    input wire  pcie_refclk_clk_n
);



__rs_pass_through #(
    .WIDTH (1)
) __rs_passthrough_pcie_refclk_clk_n_inst /**   Generated by RapidStream   **/ (
    .din  (pcie_refclk_clk_n),
    .dout (__rs_passthrough_pcie_refclk_clk_n)
);

endmodule  // __rs_passthrough_8