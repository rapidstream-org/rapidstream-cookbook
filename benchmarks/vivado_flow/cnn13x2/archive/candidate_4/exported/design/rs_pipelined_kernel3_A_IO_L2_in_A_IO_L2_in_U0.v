// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module rs_pipelined_kernel3_A_IO_L2_in_A_IO_L2_in_U0 #(
    parameter ap_ST_fsm_state1 = 4'd1,
    parameter ap_ST_fsm_state2 = 4'd2,
    parameter ap_ST_fsm_state3 = 4'd4,
    parameter ap_ST_fsm_state4 = 4'd8
) (
    input wire          ap_clk,
    input wire          ap_continue,
    output wire         ap_done,
    output wire         ap_idle,
    output wire         ap_ready,
    input wire          ap_rst,
    input wire          ap_start,
    input wire  [255:0] fifo_A_A_IO_L2_in_01_dout,
    input wire          fifo_A_A_IO_L2_in_01_empty_n,
    input wire  [  1:0] fifo_A_A_IO_L2_in_01_fifo_cap,
    input wire  [  1:0] fifo_A_A_IO_L2_in_01_num_data_valid,
    output wire         fifo_A_A_IO_L2_in_01_read,
    output wire [255:0] fifo_A_A_IO_L2_in_14_din,
    input wire  [  1:0] fifo_A_A_IO_L2_in_14_fifo_cap,
    input wire          fifo_A_A_IO_L2_in_14_full_n,
    input wire  [  1:0] fifo_A_A_IO_L2_in_14_num_data_valid,
    output wire         fifo_A_A_IO_L2_in_14_write,
    output wire [255:0] fifo_A_PE_0_018_din,
    input wire  [  1:0] fifo_A_PE_0_018_fifo_cap,
    input wire          fifo_A_PE_0_018_full_n,
    input wire  [  1:0] fifo_A_PE_0_018_num_data_valid,
    output wire         fifo_A_PE_0_018_write
);

wire        rs_pipelined_ap_rst;


kernel3_A_IO_L2_in _ /**   design_1_i/kernel3_0/inst/A_IO_L2_in_U0   **/ (
    .ap_clk                              (ap_clk),
    .ap_continue                         (ap_continue),
    .ap_done                             (ap_done),
    .ap_idle                             (ap_idle),
    .ap_ready                            (ap_ready),
    .ap_rst                              (rs_pipelined_ap_rst),
    .ap_start                            (ap_start),
    .fifo_A_A_IO_L2_in_01_dout           (fifo_A_A_IO_L2_in_01_dout),
    .fifo_A_A_IO_L2_in_01_empty_n        (fifo_A_A_IO_L2_in_01_empty_n),
    .fifo_A_A_IO_L2_in_01_fifo_cap       (fifo_A_A_IO_L2_in_01_fifo_cap),
    .fifo_A_A_IO_L2_in_01_num_data_valid (fifo_A_A_IO_L2_in_01_num_data_valid),
    .fifo_A_A_IO_L2_in_01_read           (fifo_A_A_IO_L2_in_01_read),
    .fifo_A_A_IO_L2_in_14_din            (fifo_A_A_IO_L2_in_14_din),
    .fifo_A_A_IO_L2_in_14_fifo_cap       (fifo_A_A_IO_L2_in_14_fifo_cap),
    .fifo_A_A_IO_L2_in_14_full_n         (fifo_A_A_IO_L2_in_14_full_n),
    .fifo_A_A_IO_L2_in_14_num_data_valid (fifo_A_A_IO_L2_in_14_num_data_valid),
    .fifo_A_A_IO_L2_in_14_write          (fifo_A_A_IO_L2_in_14_write),
    .fifo_A_PE_0_018_din                 (fifo_A_PE_0_018_din),
    .fifo_A_PE_0_018_fifo_cap            (fifo_A_PE_0_018_fifo_cap),
    .fifo_A_PE_0_018_full_n              (fifo_A_PE_0_018_full_n),
    .fifo_A_PE_0_018_num_data_valid      (fifo_A_PE_0_018_num_data_valid),
    .fifo_A_PE_0_018_write               (fifo_A_PE_0_018_write)
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
    .__HEAD_REGION   ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__TAIL_REGION   ("SLOT_X1Y1_TO_SLOT_X1Y1")
) ff_ap_rst /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ ap_rst }),
    .if_dout ({ rs_pipelined_ap_rst })
);

endmodule  // rs_pipelined_kernel3_A_IO_L2_in_A_IO_L2_in_U0