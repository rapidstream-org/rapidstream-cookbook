// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module rs_pipelined_kernel3_A_IO_L2_in_9_A_IO_L2_in_9_U0 #(
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
    output wire [255:0] fifo_A_A_IO_L2_in_1013_din,
    input wire  [  1:0] fifo_A_A_IO_L2_in_1013_fifo_cap,
    input wire          fifo_A_A_IO_L2_in_1013_full_n,
    input wire  [  1:0] fifo_A_A_IO_L2_in_1013_num_data_valid,
    output wire         fifo_A_A_IO_L2_in_1013_write,
    input wire  [255:0] fifo_A_A_IO_L2_in_912_dout,
    input wire          fifo_A_A_IO_L2_in_912_empty_n,
    input wire  [  1:0] fifo_A_A_IO_L2_in_912_fifo_cap,
    input wire  [  1:0] fifo_A_A_IO_L2_in_912_num_data_valid,
    output wire         fifo_A_A_IO_L2_in_912_read,
    output wire [255:0] fifo_A_PE_9_045_din,
    input wire  [  1:0] fifo_A_PE_9_045_fifo_cap,
    input wire          fifo_A_PE_9_045_full_n,
    input wire  [  1:0] fifo_A_PE_9_045_num_data_valid,
    output wire         fifo_A_PE_9_045_write
);

wire        rs_pipelined_ap_ready;
wire        rs_pipelined_ap_start;


kernel3_A_IO_L2_in_9 _ /**   design_1_i/kernel3_0/inst/A_IO_L2_in_9_U0   **/ (
    .ap_clk                                (ap_clk),
    .ap_continue                           (ap_continue),
    .ap_done                               (ap_done),
    .ap_idle                               (ap_idle),
    .ap_ready                              (rs_pipelined_ap_ready),
    .ap_rst                                (ap_rst),
    .ap_start                              (rs_pipelined_ap_start),
    .fifo_A_A_IO_L2_in_1013_din            (fifo_A_A_IO_L2_in_1013_din),
    .fifo_A_A_IO_L2_in_1013_fifo_cap       (fifo_A_A_IO_L2_in_1013_fifo_cap),
    .fifo_A_A_IO_L2_in_1013_full_n         (fifo_A_A_IO_L2_in_1013_full_n),
    .fifo_A_A_IO_L2_in_1013_num_data_valid (fifo_A_A_IO_L2_in_1013_num_data_valid),
    .fifo_A_A_IO_L2_in_1013_write          (fifo_A_A_IO_L2_in_1013_write),
    .fifo_A_A_IO_L2_in_912_dout            (fifo_A_A_IO_L2_in_912_dout),
    .fifo_A_A_IO_L2_in_912_empty_n         (fifo_A_A_IO_L2_in_912_empty_n),
    .fifo_A_A_IO_L2_in_912_fifo_cap        (fifo_A_A_IO_L2_in_912_fifo_cap),
    .fifo_A_A_IO_L2_in_912_num_data_valid  (fifo_A_A_IO_L2_in_912_num_data_valid),
    .fifo_A_A_IO_L2_in_912_read            (fifo_A_A_IO_L2_in_912_read),
    .fifo_A_PE_9_045_din                   (fifo_A_PE_9_045_din),
    .fifo_A_PE_9_045_fifo_cap              (fifo_A_PE_9_045_fifo_cap),
    .fifo_A_PE_9_045_full_n                (fifo_A_PE_9_045_full_n),
    .fifo_A_PE_9_045_num_data_valid        (fifo_A_PE_9_045_num_data_valid),
    .fifo_A_PE_9_045_write                 (fifo_A_PE_9_045_write)
);

__rs_ap_ctrl_pipeline #(
    .BODY_LEVEL      (0),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_1_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_2_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_3_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_4_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_5_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_6_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_7_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_8_REGION ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__HEAD_REGION   ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__TAIL_REGION   ("SLOT_X0Y1_TO_SLOT_X0Y1")
) ap_ctrl_no_data_ap_start_ap_ready /**   Generated by RapidStream   **/ (
    .clk        (ap_clk),
    .if_empty_n (rs_pipelined_ap_start),
    .if_full_n  (ap_ready),
    .if_read    (rs_pipelined_ap_ready),
    .if_write   (ap_start),
    .reset      (1'b0)
);

endmodule  // rs_pipelined_kernel3_A_IO_L2_in_9_A_IO_L2_in_9_U0