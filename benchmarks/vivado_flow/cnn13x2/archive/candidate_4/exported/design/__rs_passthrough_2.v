// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module __rs_passthrough_2 (
    output wire __rs_passthrough_hbm_clk_clk_p,
    input wire  hbm_clk_clk_p
);



__rs_pass_through #(
    .WIDTH (1)
) __rs_passthrough_hbm_clk_clk_p_inst /**   Generated by RapidStream   **/ (
    .din  (hbm_clk_clk_p),
    .dout (__rs_passthrough_hbm_clk_clk_p)
);

endmodule  // __rs_passthrough_2