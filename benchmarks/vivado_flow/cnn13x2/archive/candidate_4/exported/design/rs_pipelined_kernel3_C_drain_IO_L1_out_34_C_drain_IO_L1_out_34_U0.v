// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module rs_pipelined_kernel3_C_drain_IO_L1_out_34_C_drain_IO_L1_out_34_U0 #(
    parameter ap_ST_fsm_state1 = 5'd1,
    parameter ap_ST_fsm_state2 = 5'd2,
    parameter ap_ST_fsm_state3 = 5'd4,
    parameter ap_ST_fsm_state4 = 5'd8,
    parameter ap_ST_fsm_state5 = 5'd16
) (
    input wire         ap_clk,
    input wire         ap_continue,
    output wire        ap_done,
    output wire        ap_idle,
    output wire        ap_ready,
    input wire         ap_rst,
    input wire         ap_start,
    output wire [63:0] fifo_C_drain_C_drain_IO_L1_out_0_1112_din,
    input wire  [ 1:0] fifo_C_drain_C_drain_IO_L1_out_0_1112_fifo_cap,
    input wire         fifo_C_drain_C_drain_IO_L1_out_0_1112_full_n,
    input wire  [ 1:0] fifo_C_drain_C_drain_IO_L1_out_0_1112_num_data_valid,
    output wire        fifo_C_drain_C_drain_IO_L1_out_0_1112_write,
    input wire  [63:0] fifo_C_drain_C_drain_IO_L1_out_0_2113_dout,
    input wire         fifo_C_drain_C_drain_IO_L1_out_0_2113_empty_n,
    input wire  [ 1:0] fifo_C_drain_C_drain_IO_L1_out_0_2113_fifo_cap,
    input wire  [ 1:0] fifo_C_drain_C_drain_IO_L1_out_0_2113_num_data_valid,
    output wire        fifo_C_drain_C_drain_IO_L1_out_0_2113_read,
    input wire  [31:0] fifo_C_drain_PE_1_086_dout,
    input wire         fifo_C_drain_PE_1_086_empty_n,
    input wire  [ 1:0] fifo_C_drain_PE_1_086_fifo_cap,
    input wire  [ 1:0] fifo_C_drain_PE_1_086_num_data_valid,
    output wire        fifo_C_drain_PE_1_086_read
);

wire        rs_pipelined_ap_rst;


kernel3_C_drain_IO_L1_out_34 _ /**   design_1_i/kernel3_0/inst/C_drain_IO_L1_out_34_U0   **/ (
    .ap_clk                                               (ap_clk),
    .ap_continue                                          (ap_continue),
    .ap_done                                              (ap_done),
    .ap_idle                                              (ap_idle),
    .ap_ready                                             (ap_ready),
    .ap_rst                                               (rs_pipelined_ap_rst),
    .ap_start                                             (ap_start),
    .fifo_C_drain_C_drain_IO_L1_out_0_1112_din            (fifo_C_drain_C_drain_IO_L1_out_0_1112_din),
    .fifo_C_drain_C_drain_IO_L1_out_0_1112_fifo_cap       (fifo_C_drain_C_drain_IO_L1_out_0_1112_fifo_cap),
    .fifo_C_drain_C_drain_IO_L1_out_0_1112_full_n         (fifo_C_drain_C_drain_IO_L1_out_0_1112_full_n),
    .fifo_C_drain_C_drain_IO_L1_out_0_1112_num_data_valid (fifo_C_drain_C_drain_IO_L1_out_0_1112_num_data_valid),
    .fifo_C_drain_C_drain_IO_L1_out_0_1112_write          (fifo_C_drain_C_drain_IO_L1_out_0_1112_write),
    .fifo_C_drain_C_drain_IO_L1_out_0_2113_dout           (fifo_C_drain_C_drain_IO_L1_out_0_2113_dout),
    .fifo_C_drain_C_drain_IO_L1_out_0_2113_empty_n        (fifo_C_drain_C_drain_IO_L1_out_0_2113_empty_n),
    .fifo_C_drain_C_drain_IO_L1_out_0_2113_fifo_cap       (fifo_C_drain_C_drain_IO_L1_out_0_2113_fifo_cap),
    .fifo_C_drain_C_drain_IO_L1_out_0_2113_num_data_valid (fifo_C_drain_C_drain_IO_L1_out_0_2113_num_data_valid),
    .fifo_C_drain_C_drain_IO_L1_out_0_2113_read           (fifo_C_drain_C_drain_IO_L1_out_0_2113_read),
    .fifo_C_drain_PE_1_086_dout                           (fifo_C_drain_PE_1_086_dout),
    .fifo_C_drain_PE_1_086_empty_n                        (fifo_C_drain_PE_1_086_empty_n),
    .fifo_C_drain_PE_1_086_fifo_cap                       (fifo_C_drain_PE_1_086_fifo_cap),
    .fifo_C_drain_PE_1_086_num_data_valid                 (fifo_C_drain_PE_1_086_num_data_valid),
    .fifo_C_drain_PE_1_086_read                           (fifo_C_drain_PE_1_086_read)
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

endmodule  // rs_pipelined_kernel3_C_drain_IO_L1_out_34_C_drain_IO_L1_out_34_U0