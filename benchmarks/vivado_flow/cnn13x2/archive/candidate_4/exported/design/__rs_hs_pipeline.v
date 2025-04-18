// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
module __rs_hs_pipeline #(
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
    input wire                       clk,
    input wire  [(DATA_WIDTH - 1):0] if_din,
    output wire [(DATA_WIDTH - 1):0] if_dout,
    output wire                      if_empty_n,
    output wire                      if_full_n,
    input wire                       if_read,
    input wire                       if_write,
    input wire                       reset
);

wire                      body_0_clk;
wire [(DATA_WIDTH - 1):0] body_0_if_din;
wire [(DATA_WIDTH - 1):0] body_0_if_dout;
wire                      body_0_if_empty_n;
wire                      body_0_if_full_n;
wire                      body_0_if_read;
wire                      body_0_if_write;
wire                      body_0_reset;
wire                      body_1_clk;
wire [(DATA_WIDTH - 1):0] body_1_if_din;
wire [(DATA_WIDTH - 1):0] body_1_if_dout;
wire                      body_1_if_empty_n;
wire                      body_1_if_full_n;
wire                      body_1_if_read;
wire                      body_1_if_write;
wire                      body_1_reset;
wire                      body_2_clk;
wire [(DATA_WIDTH - 1):0] body_2_if_din;
wire [(DATA_WIDTH - 1):0] body_2_if_dout;
wire                      body_2_if_empty_n;
wire                      body_2_if_full_n;
wire                      body_2_if_read;
wire                      body_2_if_write;
wire                      body_2_reset;
wire                      body_3_clk;
wire [(DATA_WIDTH - 1):0] body_3_if_din;
wire [(DATA_WIDTH - 1):0] body_3_if_dout;
wire                      body_3_if_empty_n;
wire                      body_3_if_full_n;
wire                      body_3_if_read;
wire                      body_3_if_write;
wire                      body_3_reset;
wire                      body_4_clk;
wire [(DATA_WIDTH - 1):0] body_4_if_din;
wire [(DATA_WIDTH - 1):0] body_4_if_dout;
wire                      body_4_if_empty_n;
wire                      body_4_if_full_n;
wire                      body_4_if_read;
wire                      body_4_if_write;
wire                      body_4_reset;
wire                      body_5_clk;
wire [(DATA_WIDTH - 1):0] body_5_if_din;
wire [(DATA_WIDTH - 1):0] body_5_if_dout;
wire                      body_5_if_empty_n;
wire                      body_5_if_full_n;
wire                      body_5_if_read;
wire                      body_5_if_write;
wire                      body_5_reset;
wire                      body_6_clk;
wire [(DATA_WIDTH - 1):0] body_6_if_din;
wire [(DATA_WIDTH - 1):0] body_6_if_dout;
wire                      body_6_if_empty_n;
wire                      body_6_if_full_n;
wire                      body_6_if_read;
wire                      body_6_if_write;
wire                      body_6_reset;
wire                      body_7_clk;
wire [(DATA_WIDTH - 1):0] body_7_if_din;
wire [(DATA_WIDTH - 1):0] body_7_if_dout;
wire                      body_7_if_empty_n;
wire                      body_7_if_full_n;
wire                      body_7_if_read;
wire                      body_7_if_write;
wire                      body_7_reset;
wire                      body_8_clk;
wire [(DATA_WIDTH - 1):0] body_8_if_din;
wire [(DATA_WIDTH - 1):0] body_8_if_dout;
wire                      body_8_if_empty_n;
wire                      body_8_if_full_n;
wire                      body_8_if_read;
wire                      body_8_if_write;
wire                      body_8_reset;
wire                      head_clk;
wire                      head_gate_clk;
wire [(DATA_WIDTH - 1):0] head_gate_if_din;
wire [(DATA_WIDTH - 1):0] head_gate_if_dout;
wire                      head_gate_if_empty_n;
wire                      head_gate_if_full_n;
wire                      head_gate_if_read;
wire                      head_gate_if_write;
wire                      head_gate_reset;
wire [(DATA_WIDTH - 1):0] head_if_din;
wire [(DATA_WIDTH - 1):0] head_if_dout;
wire                      head_if_empty_n;
wire                      head_if_full_n;
wire                      head_if_read;
wire                      head_if_write;
wire                      head_reset;
wire                      tail_clk;
wire [(DATA_WIDTH - 1):0] tail_if_din;
wire [(DATA_WIDTH - 1):0] tail_if_dout;
wire                      tail_if_empty_n;
wire                      tail_if_full_n;
wire                      tail_if_read;
wire                      tail_if_write;
wire                      tail_reset;


__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (PIPELINE_BODY_LEVEL - 0),
    .__REGION   (__BODY_0_REGION)
) body_0 (
    .clk        (clk),
    .if_din     (head_if_dout),
    .if_dout    (body_0_if_dout),
    .if_empty_n (body_0_if_empty_n),
    .if_full_n  (body_0_if_full_n),
    .if_read    (body_1_if_full_n),
    .if_write   (head_if_empty_n),
    .reset      (reset)
);

__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (PIPELINE_BODY_LEVEL - 1),
    .__REGION   (__BODY_1_REGION)
) body_1 (
    .clk        (clk),
    .if_din     (body_0_if_dout),
    .if_dout    (body_1_if_dout),
    .if_empty_n (body_1_if_empty_n),
    .if_full_n  (body_1_if_full_n),
    .if_read    (body_2_if_full_n),
    .if_write   (body_0_if_empty_n),
    .reset      (reset)
);

__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (PIPELINE_BODY_LEVEL - 2),
    .__REGION   (__BODY_2_REGION)
) body_2 (
    .clk        (clk),
    .if_din     (body_1_if_dout),
    .if_dout    (body_2_if_dout),
    .if_empty_n (body_2_if_empty_n),
    .if_full_n  (body_2_if_full_n),
    .if_read    (body_3_if_full_n),
    .if_write   (body_1_if_empty_n),
    .reset      (reset)
);

__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (PIPELINE_BODY_LEVEL - 3),
    .__REGION   (__BODY_3_REGION)
) body_3 (
    .clk        (clk),
    .if_din     (body_2_if_dout),
    .if_dout    (body_3_if_dout),
    .if_empty_n (body_3_if_empty_n),
    .if_full_n  (body_3_if_full_n),
    .if_read    (body_4_if_full_n),
    .if_write   (body_2_if_empty_n),
    .reset      (reset)
);

__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (PIPELINE_BODY_LEVEL - 4),
    .__REGION   (__BODY_4_REGION)
) body_4 (
    .clk        (clk),
    .if_din     (body_3_if_dout),
    .if_dout    (body_4_if_dout),
    .if_empty_n (body_4_if_empty_n),
    .if_full_n  (body_4_if_full_n),
    .if_read    (body_5_if_full_n),
    .if_write   (body_3_if_empty_n),
    .reset      (reset)
);

__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (PIPELINE_BODY_LEVEL - 5),
    .__REGION   (__BODY_5_REGION)
) body_5 (
    .clk        (clk),
    .if_din     (body_4_if_dout),
    .if_dout    (body_5_if_dout),
    .if_empty_n (body_5_if_empty_n),
    .if_full_n  (body_5_if_full_n),
    .if_read    (body_6_if_full_n),
    .if_write   (body_4_if_empty_n),
    .reset      (reset)
);

__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (PIPELINE_BODY_LEVEL - 6),
    .__REGION   (__BODY_6_REGION)
) body_6 (
    .clk        (clk),
    .if_din     (body_5_if_dout),
    .if_dout    (body_6_if_dout),
    .if_empty_n (body_6_if_empty_n),
    .if_full_n  (body_6_if_full_n),
    .if_read    (body_7_if_full_n),
    .if_write   (body_5_if_empty_n),
    .reset      (reset)
);

__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (PIPELINE_BODY_LEVEL - 7),
    .__REGION   (__BODY_7_REGION)
) body_7 (
    .clk        (clk),
    .if_din     (body_6_if_dout),
    .if_dout    (body_7_if_dout),
    .if_empty_n (body_7_if_empty_n),
    .if_full_n  (body_7_if_full_n),
    .if_read    (body_8_if_full_n),
    .if_write   (body_6_if_empty_n),
    .reset      (reset)
);

__rs_fifo_reg #(
    .DATA_WIDTH (DATA_WIDTH),
    .ENABLE_REG (PIPELINE_BODY_LEVEL - 8),
    .__REGION   (__BODY_8_REGION)
) body_8 (
    .clk        (clk),
    .if_din     (body_7_if_dout),
    .if_dout    (body_8_if_dout),
    .if_empty_n (body_8_if_empty_n),
    .if_full_n  (body_8_if_full_n),
    .if_read    (tail_if_full_n),
    .if_write   (body_7_if_empty_n),
    .reset      (reset)
);

__rs_hs_pipeline_head #(
    .DATA_WIDTH              (DATA_WIDTH),
    .PIPELINE_READY          (PIPELINE_READY_IN_HEAD),
    .PIPELINE_VALID_AND_DATA (PIPELINE_VALID_AND_DATA_IN_HEAD),
    .__REGION                (__HEAD_REGION)
) head (
    .clk        (clk),
    .if_din     (head_gate_if_dout),
    .if_dout    (head_if_dout),
    .if_empty_n (head_if_empty_n),
    .if_full_n  (head_if_full_n),
    .if_read    (body_0_if_full_n),
    .if_write   (head_gate_if_empty_n),
    .reset      (reset)
);

__rs_hs_pipeline_head_gate #(
    .DATA_WIDTH (DATA_WIDTH),
    .__REGION   (__HEAD_REGION)
) head_gate (
    .clk        (clk),
    .if_din     (if_din),
    .if_dout    (head_gate_if_dout),
    .if_empty_n (head_gate_if_empty_n),
    .if_full_n  (if_full_n),
    .if_read    (head_if_full_n),
    .if_write   (if_write),
    .reset      (reset)
);

__rs_hs_pipeline_tail #(
    .ADDR_WIDTH   (REAL_ADDR_WIDTH),
    .DATA_WIDTH   (DATA_WIDTH),
    .DEPTH        (REAL_DEPTH),
    .GRACE_PERIOD (GRACE_PERIOD),
    .MEM_STYLE    (MEM_STYLE),
    .__REGION     (__TAIL_REGION)
) tail (
    .clk        (clk),
    .if_din     (body_8_if_dout),
    .if_dout    (if_dout),
    .if_empty_n (if_empty_n),
    .if_full_n  (tail_if_full_n),
    .if_read    (if_read),
    .if_write   (body_8_if_empty_n),
    .reset      (reset)
);

endmodule  // __rs_hs_pipeline
