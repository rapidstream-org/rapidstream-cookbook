// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module rs_pipelined_kernel3_PE_wrapper_11_0_PE_wrapper_11_0_U0 #(
    parameter ap_ST_fsm_state1 = 2'd1,
    parameter ap_ST_fsm_state2 = 2'd2
) (
    input wire          ap_clk,
    input wire          ap_continue,
    output wire         ap_done,
    output wire         ap_idle,
    output wire         ap_ready,
    input wire          ap_rst,
    input wire          ap_start,
    input wire  [255:0] fifo_A_PE_11_051_dout,
    input wire          fifo_A_PE_11_051_empty_n,
    input wire  [  1:0] fifo_A_PE_11_051_fifo_cap,
    input wire  [  1:0] fifo_A_PE_11_051_num_data_valid,
    output wire         fifo_A_PE_11_051_read,
    output wire [255:0] fifo_A_PE_11_152_din,
    input wire  [  1:0] fifo_A_PE_11_152_fifo_cap,
    input wire          fifo_A_PE_11_152_full_n,
    input wire  [  1:0] fifo_A_PE_11_152_num_data_valid,
    output wire         fifo_A_PE_11_152_write,
    input wire  [255:0] fifo_B_PE_11_068_dout,
    input wire          fifo_B_PE_11_068_empty_n,
    input wire  [  1:0] fifo_B_PE_11_068_fifo_cap,
    input wire  [  1:0] fifo_B_PE_11_068_num_data_valid,
    output wire         fifo_B_PE_11_068_read,
    output wire [255:0] fifo_B_PE_12_069_din,
    input wire  [  1:0] fifo_B_PE_12_069_fifo_cap,
    input wire          fifo_B_PE_12_069_full_n,
    input wire  [  1:0] fifo_B_PE_12_069_num_data_valid,
    output wire         fifo_B_PE_12_069_write,
    output wire [ 31:0] fifo_C_drain_PE_11_096_din,
    input wire  [  1:0] fifo_C_drain_PE_11_096_fifo_cap,
    input wire          fifo_C_drain_PE_11_096_full_n,
    input wire  [  1:0] fifo_C_drain_PE_11_096_num_data_valid,
    output wire         fifo_C_drain_PE_11_096_write
);

wire        rs_pipelined_ap_ready;
wire        rs_pipelined_ap_start;


kernel3_PE_wrapper_11_0 _ /**   design_1_i/kernel3_0/inst/PE_wrapper_11_0_U0   **/ (
    .ap_clk                                (ap_clk),
    .ap_continue                           (ap_continue),
    .ap_done                               (ap_done),
    .ap_idle                               (ap_idle),
    .ap_ready                              (rs_pipelined_ap_ready),
    .ap_rst                                (ap_rst),
    .ap_start                              (rs_pipelined_ap_start),
    .fifo_A_PE_11_051_dout                 (fifo_A_PE_11_051_dout),
    .fifo_A_PE_11_051_empty_n              (fifo_A_PE_11_051_empty_n),
    .fifo_A_PE_11_051_fifo_cap             (fifo_A_PE_11_051_fifo_cap),
    .fifo_A_PE_11_051_num_data_valid       (fifo_A_PE_11_051_num_data_valid),
    .fifo_A_PE_11_051_read                 (fifo_A_PE_11_051_read),
    .fifo_A_PE_11_152_din                  (fifo_A_PE_11_152_din),
    .fifo_A_PE_11_152_fifo_cap             (fifo_A_PE_11_152_fifo_cap),
    .fifo_A_PE_11_152_full_n               (fifo_A_PE_11_152_full_n),
    .fifo_A_PE_11_152_num_data_valid       (fifo_A_PE_11_152_num_data_valid),
    .fifo_A_PE_11_152_write                (fifo_A_PE_11_152_write),
    .fifo_B_PE_11_068_dout                 (fifo_B_PE_11_068_dout),
    .fifo_B_PE_11_068_empty_n              (fifo_B_PE_11_068_empty_n),
    .fifo_B_PE_11_068_fifo_cap             (fifo_B_PE_11_068_fifo_cap),
    .fifo_B_PE_11_068_num_data_valid       (fifo_B_PE_11_068_num_data_valid),
    .fifo_B_PE_11_068_read                 (fifo_B_PE_11_068_read),
    .fifo_B_PE_12_069_din                  (fifo_B_PE_12_069_din),
    .fifo_B_PE_12_069_fifo_cap             (fifo_B_PE_12_069_fifo_cap),
    .fifo_B_PE_12_069_full_n               (fifo_B_PE_12_069_full_n),
    .fifo_B_PE_12_069_num_data_valid       (fifo_B_PE_12_069_num_data_valid),
    .fifo_B_PE_12_069_write                (fifo_B_PE_12_069_write),
    .fifo_C_drain_PE_11_096_din            (fifo_C_drain_PE_11_096_din),
    .fifo_C_drain_PE_11_096_fifo_cap       (fifo_C_drain_PE_11_096_fifo_cap),
    .fifo_C_drain_PE_11_096_full_n         (fifo_C_drain_PE_11_096_full_n),
    .fifo_C_drain_PE_11_096_num_data_valid (fifo_C_drain_PE_11_096_num_data_valid),
    .fifo_C_drain_PE_11_096_write          (fifo_C_drain_PE_11_096_write)
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

endmodule  // rs_pipelined_kernel3_PE_wrapper_11_0_PE_wrapper_11_0_U0