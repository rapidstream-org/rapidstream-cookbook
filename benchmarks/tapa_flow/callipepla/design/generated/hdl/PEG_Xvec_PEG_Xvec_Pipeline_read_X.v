// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module PEG_Xvec_PEG_Xvec_Pipeline_read_X (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        local_X_15_address0,
        local_X_15_ce0,
        local_X_15_we0,
        local_X_15_d0,
        local_X_15_address1,
        local_X_15_ce1,
        local_X_15_we1,
        local_X_15_d1,
        local_X_14_address0,
        local_X_14_ce0,
        local_X_14_we0,
        local_X_14_d0,
        local_X_14_address1,
        local_X_14_ce1,
        local_X_14_we1,
        local_X_14_d1,
        local_X_13_address0,
        local_X_13_ce0,
        local_X_13_we0,
        local_X_13_d0,
        local_X_13_address1,
        local_X_13_ce1,
        local_X_13_we1,
        local_X_13_d1,
        local_X_12_address0,
        local_X_12_ce0,
        local_X_12_we0,
        local_X_12_d0,
        local_X_12_address1,
        local_X_12_ce1,
        local_X_12_we1,
        local_X_12_d1,
        local_X_11_address0,
        local_X_11_ce0,
        local_X_11_we0,
        local_X_11_d0,
        local_X_11_address1,
        local_X_11_ce1,
        local_X_11_we1,
        local_X_11_d1,
        local_X_10_address0,
        local_X_10_ce0,
        local_X_10_we0,
        local_X_10_d0,
        local_X_10_address1,
        local_X_10_ce1,
        local_X_10_we1,
        local_X_10_d1,
        local_X_9_address0,
        local_X_9_ce0,
        local_X_9_we0,
        local_X_9_d0,
        local_X_9_address1,
        local_X_9_ce1,
        local_X_9_we1,
        local_X_9_d1,
        local_X_8_address0,
        local_X_8_ce0,
        local_X_8_we0,
        local_X_8_d0,
        local_X_8_address1,
        local_X_8_ce1,
        local_X_8_we1,
        local_X_8_d1,
        local_X_7_address0,
        local_X_7_ce0,
        local_X_7_we0,
        local_X_7_d0,
        local_X_7_address1,
        local_X_7_ce1,
        local_X_7_we1,
        local_X_7_d1,
        local_X_6_address0,
        local_X_6_ce0,
        local_X_6_we0,
        local_X_6_d0,
        local_X_6_address1,
        local_X_6_ce1,
        local_X_6_we1,
        local_X_6_d1,
        local_X_5_address0,
        local_X_5_ce0,
        local_X_5_we0,
        local_X_5_d0,
        local_X_5_address1,
        local_X_5_ce1,
        local_X_5_we1,
        local_X_5_d1,
        local_X_4_address0,
        local_X_4_ce0,
        local_X_4_we0,
        local_X_4_d0,
        local_X_4_address1,
        local_X_4_ce1,
        local_X_4_we1,
        local_X_4_d1,
        local_X_3_address0,
        local_X_3_ce0,
        local_X_3_we0,
        local_X_3_d0,
        local_X_3_address1,
        local_X_3_ce1,
        local_X_3_we1,
        local_X_3_d1,
        local_X_2_address0,
        local_X_2_ce0,
        local_X_2_we0,
        local_X_2_d0,
        local_X_2_address1,
        local_X_2_ce1,
        local_X_2_we1,
        local_X_2_d1,
        local_X_1_address0,
        local_X_1_ce0,
        local_X_1_we0,
        local_X_1_d0,
        local_X_1_address1,
        local_X_1_ce1,
        local_X_1_we1,
        local_X_1_d1,
        local_X_address0,
        local_X_ce0,
        local_X_we0,
        local_X_d0,
        local_X_address1,
        local_X_ce1,
        local_X_we1,
        local_X_d1,
        sub,
        fifo_X_in_s_dout,
        fifo_X_in_s_empty_n,
        fifo_X_in_s_read,
        fifo_X_out_din,
        fifo_X_out_full_n,
        fifo_X_out_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [9:0] local_X_15_address0;
output   local_X_15_ce0;
output   local_X_15_we0;
output  [63:0] local_X_15_d0;
output  [9:0] local_X_15_address1;
output   local_X_15_ce1;
output   local_X_15_we1;
output  [63:0] local_X_15_d1;
output  [9:0] local_X_14_address0;
output   local_X_14_ce0;
output   local_X_14_we0;
output  [63:0] local_X_14_d0;
output  [9:0] local_X_14_address1;
output   local_X_14_ce1;
output   local_X_14_we1;
output  [63:0] local_X_14_d1;
output  [9:0] local_X_13_address0;
output   local_X_13_ce0;
output   local_X_13_we0;
output  [63:0] local_X_13_d0;
output  [9:0] local_X_13_address1;
output   local_X_13_ce1;
output   local_X_13_we1;
output  [63:0] local_X_13_d1;
output  [9:0] local_X_12_address0;
output   local_X_12_ce0;
output   local_X_12_we0;
output  [63:0] local_X_12_d0;
output  [9:0] local_X_12_address1;
output   local_X_12_ce1;
output   local_X_12_we1;
output  [63:0] local_X_12_d1;
output  [9:0] local_X_11_address0;
output   local_X_11_ce0;
output   local_X_11_we0;
output  [63:0] local_X_11_d0;
output  [9:0] local_X_11_address1;
output   local_X_11_ce1;
output   local_X_11_we1;
output  [63:0] local_X_11_d1;
output  [9:0] local_X_10_address0;
output   local_X_10_ce0;
output   local_X_10_we0;
output  [63:0] local_X_10_d0;
output  [9:0] local_X_10_address1;
output   local_X_10_ce1;
output   local_X_10_we1;
output  [63:0] local_X_10_d1;
output  [9:0] local_X_9_address0;
output   local_X_9_ce0;
output   local_X_9_we0;
output  [63:0] local_X_9_d0;
output  [9:0] local_X_9_address1;
output   local_X_9_ce1;
output   local_X_9_we1;
output  [63:0] local_X_9_d1;
output  [9:0] local_X_8_address0;
output   local_X_8_ce0;
output   local_X_8_we0;
output  [63:0] local_X_8_d0;
output  [9:0] local_X_8_address1;
output   local_X_8_ce1;
output   local_X_8_we1;
output  [63:0] local_X_8_d1;
output  [9:0] local_X_7_address0;
output   local_X_7_ce0;
output   local_X_7_we0;
output  [63:0] local_X_7_d0;
output  [9:0] local_X_7_address1;
output   local_X_7_ce1;
output   local_X_7_we1;
output  [63:0] local_X_7_d1;
output  [9:0] local_X_6_address0;
output   local_X_6_ce0;
output   local_X_6_we0;
output  [63:0] local_X_6_d0;
output  [9:0] local_X_6_address1;
output   local_X_6_ce1;
output   local_X_6_we1;
output  [63:0] local_X_6_d1;
output  [9:0] local_X_5_address0;
output   local_X_5_ce0;
output   local_X_5_we0;
output  [63:0] local_X_5_d0;
output  [9:0] local_X_5_address1;
output   local_X_5_ce1;
output   local_X_5_we1;
output  [63:0] local_X_5_d1;
output  [9:0] local_X_4_address0;
output   local_X_4_ce0;
output   local_X_4_we0;
output  [63:0] local_X_4_d0;
output  [9:0] local_X_4_address1;
output   local_X_4_ce1;
output   local_X_4_we1;
output  [63:0] local_X_4_d1;
output  [9:0] local_X_3_address0;
output   local_X_3_ce0;
output   local_X_3_we0;
output  [63:0] local_X_3_d0;
output  [9:0] local_X_3_address1;
output   local_X_3_ce1;
output   local_X_3_we1;
output  [63:0] local_X_3_d1;
output  [9:0] local_X_2_address0;
output   local_X_2_ce0;
output   local_X_2_we0;
output  [63:0] local_X_2_d0;
output  [9:0] local_X_2_address1;
output   local_X_2_ce1;
output   local_X_2_we1;
output  [63:0] local_X_2_d1;
output  [9:0] local_X_1_address0;
output   local_X_1_ce0;
output   local_X_1_we0;
output  [63:0] local_X_1_d0;
output  [9:0] local_X_1_address1;
output   local_X_1_ce1;
output   local_X_1_we1;
output  [63:0] local_X_1_d1;
output  [9:0] local_X_address0;
output   local_X_ce0;
output   local_X_we0;
output  [63:0] local_X_d0;
output  [9:0] local_X_address1;
output   local_X_ce1;
output   local_X_we1;
output  [63:0] local_X_d1;
input  [31:0] sub;
input  [512:0] fifo_X_in_s_dout;
input   fifo_X_in_s_empty_n;
output   fifo_X_in_s_read;
output  [512:0] fifo_X_out_din;
input   fifo_X_out_full_n;
output   fifo_X_out_write;

reg ap_idle;
reg local_X_15_ce0;
reg local_X_15_we0;
reg local_X_15_ce1;
reg local_X_15_we1;
reg local_X_14_ce0;
reg local_X_14_we0;
reg local_X_14_ce1;
reg local_X_14_we1;
reg local_X_13_ce0;
reg local_X_13_we0;
reg local_X_13_ce1;
reg local_X_13_we1;
reg local_X_12_ce0;
reg local_X_12_we0;
reg local_X_12_ce1;
reg local_X_12_we1;
reg local_X_11_ce0;
reg local_X_11_we0;
reg local_X_11_ce1;
reg local_X_11_we1;
reg local_X_10_ce0;
reg local_X_10_we0;
reg local_X_10_ce1;
reg local_X_10_we1;
reg local_X_9_ce0;
reg local_X_9_we0;
reg local_X_9_ce1;
reg local_X_9_we1;
reg local_X_8_ce0;
reg local_X_8_we0;
reg local_X_8_ce1;
reg local_X_8_we1;
reg local_X_7_ce0;
reg local_X_7_we0;
reg local_X_7_ce1;
reg local_X_7_we1;
reg local_X_6_ce0;
reg local_X_6_we0;
reg local_X_6_ce1;
reg local_X_6_we1;
reg local_X_5_ce0;
reg local_X_5_we0;
reg local_X_5_ce1;
reg local_X_5_we1;
reg local_X_4_ce0;
reg local_X_4_we0;
reg local_X_4_ce1;
reg local_X_4_we1;
reg local_X_3_ce0;
reg local_X_3_we0;
reg local_X_3_ce1;
reg local_X_3_we1;
reg local_X_2_ce0;
reg local_X_2_we0;
reg local_X_2_ce1;
reg local_X_2_we1;
reg local_X_1_ce0;
reg local_X_1_we0;
reg local_X_1_ce1;
reg local_X_1_we1;
reg local_X_ce0;
reg local_X_we0;
reg local_X_ce1;
reg local_X_we1;
reg fifo_X_in_s_read;
reg fifo_X_out_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] and_ln343_fu_591_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [63:0] zext_ln351_fu_770_p1;
wire   [0:0] and_ln346_fu_597_p2;
wire   [63:0] zext_ln351_1_fu_796_p1;
reg   [31:0] j_fu_122;
wire   [31:0] j_2_fu_816_p2;
wire    ap_loop_init;
reg   [31:0] ap_sig_allocacmp_j_1;
wire   [0:0] tmp_s_nbreadreq_fu_132_p3;
wire   [63:0] elem_val_M_elems_fu_671_p1;
wire   [63:0] bitcast_ln78_3_fu_713_p1;
wire   [63:0] bitcast_ln78_fu_689_p1;
wire   [63:0] bitcast_ln78_4_fu_721_p1;
wire   [63:0] bitcast_ln78_1_fu_697_p1;
wire   [63:0] bitcast_ln78_5_fu_729_p1;
wire   [63:0] bitcast_ln78_2_fu_705_p1;
wire   [63:0] bitcast_ln78_6_fu_737_p1;
wire   [22:0] tmp_fu_569_p4;
wire   [0:0] icmp_ln343_fu_579_p2;
wire   [0:0] icmp_ln343_1_fu_585_p2;
wire   [0:0] and_ln346_fu_597_p1;
wire   [63:0] trunc_ln78_fu_607_p1;
wire   [63:0] tmp_6_fu_679_p4;
wire   [63:0] tmp_8_fu_611_p4;
wire   [63:0] tmp_1_fu_621_p4;
wire   [63:0] tmp_3_fu_631_p4;
wire   [63:0] tmp_4_fu_641_p4;
wire   [63:0] trunc_ln_fu_651_p4;
wire   [63:0] trunc_ln78_2_fu_661_p4;
wire   [511:0] trunc_ln146_fu_745_p1;
wire   [8:0] trunc_ln351_fu_758_p1;
wire   [9:0] shl_ln_fu_762_p3;
wire   [9:0] or_ln351_fu_790_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

PEG_Xvec_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        if (((1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2))) begin
            j_fu_122 <= j_2_fu_816_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_122 <= 32'd0;
        end
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd0 == and_ln343_fu_591_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_j_1 = 32'd0;
    end else begin
        ap_sig_allocacmp_j_1 = j_fu_122;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (fifo_X_in_s_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        fifo_X_in_s_read = 1'b1;
    end else begin
        fifo_X_in_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (fifo_X_out_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        fifo_X_out_write = 1'b1;
    end else begin
        fifo_X_out_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_10_ce0 = 1'b1;
    end else begin
        local_X_10_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_10_ce1 = 1'b1;
    end else begin
        local_X_10_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_10_we0 = 1'b1;
    end else begin
        local_X_10_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_10_we1 = 1'b1;
    end else begin
        local_X_10_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_11_ce0 = 1'b1;
    end else begin
        local_X_11_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_11_ce1 = 1'b1;
    end else begin
        local_X_11_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_11_we0 = 1'b1;
    end else begin
        local_X_11_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_11_we1 = 1'b1;
    end else begin
        local_X_11_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_12_ce0 = 1'b1;
    end else begin
        local_X_12_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_12_ce1 = 1'b1;
    end else begin
        local_X_12_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_12_we0 = 1'b1;
    end else begin
        local_X_12_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_12_we1 = 1'b1;
    end else begin
        local_X_12_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_13_ce0 = 1'b1;
    end else begin
        local_X_13_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_13_ce1 = 1'b1;
    end else begin
        local_X_13_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_13_we0 = 1'b1;
    end else begin
        local_X_13_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_13_we1 = 1'b1;
    end else begin
        local_X_13_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_14_ce0 = 1'b1;
    end else begin
        local_X_14_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_14_ce1 = 1'b1;
    end else begin
        local_X_14_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_14_we0 = 1'b1;
    end else begin
        local_X_14_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_14_we1 = 1'b1;
    end else begin
        local_X_14_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_15_ce0 = 1'b1;
    end else begin
        local_X_15_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_15_ce1 = 1'b1;
    end else begin
        local_X_15_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_15_we0 = 1'b1;
    end else begin
        local_X_15_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_15_we1 = 1'b1;
    end else begin
        local_X_15_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_1_ce0 = 1'b1;
    end else begin
        local_X_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_1_ce1 = 1'b1;
    end else begin
        local_X_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_1_we0 = 1'b1;
    end else begin
        local_X_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_1_we1 = 1'b1;
    end else begin
        local_X_1_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_2_ce0 = 1'b1;
    end else begin
        local_X_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_2_ce1 = 1'b1;
    end else begin
        local_X_2_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_2_we0 = 1'b1;
    end else begin
        local_X_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_2_we1 = 1'b1;
    end else begin
        local_X_2_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_3_ce0 = 1'b1;
    end else begin
        local_X_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_3_ce1 = 1'b1;
    end else begin
        local_X_3_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_3_we0 = 1'b1;
    end else begin
        local_X_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_3_we1 = 1'b1;
    end else begin
        local_X_3_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_4_ce0 = 1'b1;
    end else begin
        local_X_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_4_ce1 = 1'b1;
    end else begin
        local_X_4_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_4_we0 = 1'b1;
    end else begin
        local_X_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_4_we1 = 1'b1;
    end else begin
        local_X_4_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_5_ce0 = 1'b1;
    end else begin
        local_X_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_5_ce1 = 1'b1;
    end else begin
        local_X_5_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_5_we0 = 1'b1;
    end else begin
        local_X_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_5_we1 = 1'b1;
    end else begin
        local_X_5_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_6_ce0 = 1'b1;
    end else begin
        local_X_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_6_ce1 = 1'b1;
    end else begin
        local_X_6_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_6_we0 = 1'b1;
    end else begin
        local_X_6_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_6_we1 = 1'b1;
    end else begin
        local_X_6_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_7_ce0 = 1'b1;
    end else begin
        local_X_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_7_ce1 = 1'b1;
    end else begin
        local_X_7_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_7_we0 = 1'b1;
    end else begin
        local_X_7_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_7_we1 = 1'b1;
    end else begin
        local_X_7_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_8_ce0 = 1'b1;
    end else begin
        local_X_8_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_8_ce1 = 1'b1;
    end else begin
        local_X_8_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_8_we0 = 1'b1;
    end else begin
        local_X_8_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_8_we1 = 1'b1;
    end else begin
        local_X_8_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_9_ce0 = 1'b1;
    end else begin
        local_X_9_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_9_ce1 = 1'b1;
    end else begin
        local_X_9_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_9_we0 = 1'b1;
    end else begin
        local_X_9_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_9_we1 = 1'b1;
    end else begin
        local_X_9_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_ce0 = 1'b1;
    end else begin
        local_X_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_ce1 = 1'b1;
    end else begin
        local_X_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_we0 = 1'b1;
    end else begin
        local_X_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'd1 == and_ln343_fu_591_p2) & (1'd1 == and_ln346_fu_597_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        local_X_we1 = 1'b1;
    end else begin
        local_X_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln343_fu_591_p2 = (icmp_ln343_fu_579_p2 & icmp_ln343_1_fu_585_p2);

assign and_ln346_fu_597_p1 = fifo_X_out_full_n;

assign and_ln346_fu_597_p2 = (tmp_s_nbreadreq_fu_132_p3 & and_ln346_fu_597_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign bitcast_ln78_1_fu_697_p1 = tmp_8_fu_611_p4;

assign bitcast_ln78_2_fu_705_p1 = tmp_1_fu_621_p4;

assign bitcast_ln78_3_fu_713_p1 = tmp_3_fu_631_p4;

assign bitcast_ln78_4_fu_721_p1 = tmp_4_fu_641_p4;

assign bitcast_ln78_5_fu_729_p1 = trunc_ln_fu_651_p4;

assign bitcast_ln78_6_fu_737_p1 = trunc_ln78_2_fu_661_p4;

assign bitcast_ln78_fu_689_p1 = tmp_6_fu_679_p4;

assign elem_val_M_elems_fu_671_p1 = trunc_ln78_fu_607_p1;

assign fifo_X_out_din = {{1'd0}, {trunc_ln146_fu_745_p1}};

assign icmp_ln343_1_fu_585_p2 = (($signed(ap_sig_allocacmp_j_1) < $signed(sub)) ? 1'b1 : 1'b0);

assign icmp_ln343_fu_579_p2 = (($signed(tmp_fu_569_p4) < $signed(23'd1)) ? 1'b1 : 1'b0);

assign j_2_fu_816_p2 = (ap_sig_allocacmp_j_1 + 32'd1);

assign local_X_10_address0 = zext_ln351_1_fu_796_p1;

assign local_X_10_address1 = zext_ln351_fu_770_p1;

assign local_X_10_d0 = bitcast_ln78_5_fu_729_p1;

assign local_X_10_d1 = bitcast_ln78_1_fu_697_p1;

assign local_X_11_address0 = zext_ln351_1_fu_796_p1;

assign local_X_11_address1 = zext_ln351_fu_770_p1;

assign local_X_11_d0 = bitcast_ln78_6_fu_737_p1;

assign local_X_11_d1 = bitcast_ln78_2_fu_705_p1;

assign local_X_12_address0 = zext_ln351_1_fu_796_p1;

assign local_X_12_address1 = zext_ln351_fu_770_p1;

assign local_X_12_d0 = bitcast_ln78_3_fu_713_p1;

assign local_X_12_d1 = elem_val_M_elems_fu_671_p1;

assign local_X_13_address0 = zext_ln351_1_fu_796_p1;

assign local_X_13_address1 = zext_ln351_fu_770_p1;

assign local_X_13_d0 = bitcast_ln78_4_fu_721_p1;

assign local_X_13_d1 = bitcast_ln78_fu_689_p1;

assign local_X_14_address0 = zext_ln351_1_fu_796_p1;

assign local_X_14_address1 = zext_ln351_fu_770_p1;

assign local_X_14_d0 = bitcast_ln78_5_fu_729_p1;

assign local_X_14_d1 = bitcast_ln78_1_fu_697_p1;

assign local_X_15_address0 = zext_ln351_1_fu_796_p1;

assign local_X_15_address1 = zext_ln351_fu_770_p1;

assign local_X_15_d0 = bitcast_ln78_6_fu_737_p1;

assign local_X_15_d1 = bitcast_ln78_2_fu_705_p1;

assign local_X_1_address0 = zext_ln351_1_fu_796_p1;

assign local_X_1_address1 = zext_ln351_fu_770_p1;

assign local_X_1_d0 = bitcast_ln78_4_fu_721_p1;

assign local_X_1_d1 = bitcast_ln78_fu_689_p1;

assign local_X_2_address0 = zext_ln351_1_fu_796_p1;

assign local_X_2_address1 = zext_ln351_fu_770_p1;

assign local_X_2_d0 = bitcast_ln78_5_fu_729_p1;

assign local_X_2_d1 = bitcast_ln78_1_fu_697_p1;

assign local_X_3_address0 = zext_ln351_1_fu_796_p1;

assign local_X_3_address1 = zext_ln351_fu_770_p1;

assign local_X_3_d0 = bitcast_ln78_6_fu_737_p1;

assign local_X_3_d1 = bitcast_ln78_2_fu_705_p1;

assign local_X_4_address0 = zext_ln351_1_fu_796_p1;

assign local_X_4_address1 = zext_ln351_fu_770_p1;

assign local_X_4_d0 = bitcast_ln78_3_fu_713_p1;

assign local_X_4_d1 = elem_val_M_elems_fu_671_p1;

assign local_X_5_address0 = zext_ln351_1_fu_796_p1;

assign local_X_5_address1 = zext_ln351_fu_770_p1;

assign local_X_5_d0 = bitcast_ln78_4_fu_721_p1;

assign local_X_5_d1 = bitcast_ln78_fu_689_p1;

assign local_X_6_address0 = zext_ln351_1_fu_796_p1;

assign local_X_6_address1 = zext_ln351_fu_770_p1;

assign local_X_6_d0 = bitcast_ln78_5_fu_729_p1;

assign local_X_6_d1 = bitcast_ln78_1_fu_697_p1;

assign local_X_7_address0 = zext_ln351_1_fu_796_p1;

assign local_X_7_address1 = zext_ln351_fu_770_p1;

assign local_X_7_d0 = bitcast_ln78_6_fu_737_p1;

assign local_X_7_d1 = bitcast_ln78_2_fu_705_p1;

assign local_X_8_address0 = zext_ln351_1_fu_796_p1;

assign local_X_8_address1 = zext_ln351_fu_770_p1;

assign local_X_8_d0 = bitcast_ln78_3_fu_713_p1;

assign local_X_8_d1 = elem_val_M_elems_fu_671_p1;

assign local_X_9_address0 = zext_ln351_1_fu_796_p1;

assign local_X_9_address1 = zext_ln351_fu_770_p1;

assign local_X_9_d0 = bitcast_ln78_4_fu_721_p1;

assign local_X_9_d1 = bitcast_ln78_fu_689_p1;

assign local_X_address0 = zext_ln351_1_fu_796_p1;

assign local_X_address1 = zext_ln351_fu_770_p1;

assign local_X_d0 = bitcast_ln78_3_fu_713_p1;

assign local_X_d1 = elem_val_M_elems_fu_671_p1;

assign or_ln351_fu_790_p2 = (shl_ln_fu_762_p3 | 10'd1);

assign shl_ln_fu_762_p3 = {{trunc_ln351_fu_758_p1}, {1'd0}};

assign tmp_1_fu_621_p4 = {{fifo_X_in_s_dout[255:192]}};

assign tmp_3_fu_631_p4 = {{fifo_X_in_s_dout[319:256]}};

assign tmp_4_fu_641_p4 = {{fifo_X_in_s_dout[383:320]}};

assign tmp_6_fu_679_p4 = {{fifo_X_in_s_dout[127:64]}};

assign tmp_8_fu_611_p4 = {{fifo_X_in_s_dout[191:128]}};

assign tmp_fu_569_p4 = {{ap_sig_allocacmp_j_1[31:9]}};

assign tmp_s_nbreadreq_fu_132_p3 = fifo_X_in_s_empty_n;

assign trunc_ln146_fu_745_p1 = fifo_X_in_s_dout[511:0];

assign trunc_ln351_fu_758_p1 = ap_sig_allocacmp_j_1[8:0];

assign trunc_ln78_2_fu_661_p4 = {{fifo_X_in_s_dout[511:448]}};

assign trunc_ln78_fu_607_p1 = fifo_X_in_s_dout[63:0];

assign trunc_ln_fu_651_p4 = {{fifo_X_in_s_dout[447:384]}};

assign zext_ln351_1_fu_796_p1 = or_ln351_fu_790_p2;

assign zext_ln351_fu_770_p1 = shl_ln_fu_762_p3;

endmodule //PEG_Xvec_PEG_Xvec_Pipeline_read_X
