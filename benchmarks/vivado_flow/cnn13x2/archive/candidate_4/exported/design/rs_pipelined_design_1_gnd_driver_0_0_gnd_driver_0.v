// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module rs_pipelined_design_1_gnd_driver_0_0_gnd_driver_0 (
    input wire  clk,
    output wire dout,
    input wire  rst_n
);

wire        rs_pipelined_rst_n;


design_1_gnd_driver_0_0 _ /**   design_1_i/gnd_driver_0   **/ (
    .clk   (clk),
    .dout  (dout),
    .rst_n (rs_pipelined_rst_n)
);

__rs_ff_pipeline #(
    .BODY_LEVEL      (0),
    .DATA_WIDTH      (1),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_1_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_2_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_3_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_4_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_5_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_6_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_7_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_8_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__HEAD_REGION   ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__TAIL_REGION   ("SLOT_X1Y1_TO_SLOT_X1Y1")
) ff_rst_n /**   Generated by RapidStream   **/ (
    .clk     (clk),
    .if_din  ({ rst_n }),
    .if_dout ({ rs_pipelined_rst_n })
);

endmodule  // rs_pipelined_design_1_gnd_driver_0_0_gnd_driver_0
