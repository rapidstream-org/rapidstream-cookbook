// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs___rs_hs_pipeline_aux_split_aux_0 #(
    parameter DATA_WIDTH                      = 32,
    parameter DEPTH                           = 24,
    parameter PIPELINE_READY_IN_HEAD          = 1,
    parameter PIPELINE_VALID_AND_DATA_IN_HEAD = 0,
    parameter PIPELINE_BODY_LEVEL             = 2,
    parameter MEM_STYLE                       = 0,
    parameter __HEAD_REGION                   = "",
    parameter __BODY_0_REGION                 = "",
    parameter __BODY_1_REGION                 = "",
    parameter __BODY_2_REGION                 = "",
    parameter __BODY_3_REGION                 = "",
    parameter __BODY_4_REGION                 = "",
    parameter __BODY_5_REGION                 = "",
    parameter __BODY_6_REGION                 = "",
    parameter __BODY_7_REGION                 = "",
    parameter __BODY_8_REGION                 = "",
    parameter __TAIL_REGION                   = "",
    parameter GRACE_PERIOD                    = PIPELINE_BODY_LEVEL * 2 + PIPELINE_READY_IN_HEAD + PIPELINE_VALID_AND_DATA_IN_HEAD,
    parameter REAL_DEPTH                      = GRACE_PERIOD + DEPTH + 4,
    parameter REAL_ADDR_WIDTH                 = $clog2 ( REAL_DEPTH )
) (
    output wire body_0_clk,
    output wire body_1_clk,
    output wire body_2_clk,
    output wire body_3_clk,
    output wire body_4_clk,
    output wire body_5_clk,
    output wire body_6_clk,
    output wire body_7_clk,
    output wire body_8_clk,
    input wire  clk,
    output wire head_clk,
    output wire head_gate_clk,
    output wire tail_clk
);
assign body_0_clk = clk;
assign body_1_clk = clk;
assign body_2_clk = clk;
assign body_3_clk = clk;
assign body_4_clk = clk;
assign body_5_clk = clk;
assign body_6_clk = clk;
assign body_7_clk = clk;
assign body_8_clk = clk;
assign head_clk = clk;
assign head_gate_clk = clk;
assign tail_clk = clk;
endmodule
