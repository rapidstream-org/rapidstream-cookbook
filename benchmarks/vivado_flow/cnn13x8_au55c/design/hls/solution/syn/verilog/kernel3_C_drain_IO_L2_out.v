// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module kernel3_C_drain_IO_L2_out (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        fifo_C_drain_C_drain_IO_L2_out_7468_dout,
        fifo_C_drain_C_drain_IO_L2_out_7468_num_data_valid,
        fifo_C_drain_C_drain_IO_L2_out_7468_fifo_cap,
        fifo_C_drain_C_drain_IO_L2_out_7468_empty_n,
        fifo_C_drain_C_drain_IO_L2_out_7468_read,
        fifo_C_drain_C_drain_IO_L1_out_6_0435_dout,
        fifo_C_drain_C_drain_IO_L1_out_6_0435_num_data_valid,
        fifo_C_drain_C_drain_IO_L1_out_6_0435_fifo_cap,
        fifo_C_drain_C_drain_IO_L1_out_6_0435_empty_n,
        fifo_C_drain_C_drain_IO_L1_out_6_0435_read,
        fifo_C_drain_C_drain_IO_L2_out_6467_din,
        fifo_C_drain_C_drain_IO_L2_out_6467_num_data_valid,
        fifo_C_drain_C_drain_IO_L2_out_6467_fifo_cap,
        fifo_C_drain_C_drain_IO_L2_out_6467_full_n,
        fifo_C_drain_C_drain_IO_L2_out_6467_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [63:0] fifo_C_drain_C_drain_IO_L2_out_7468_dout;
input  [1:0] fifo_C_drain_C_drain_IO_L2_out_7468_num_data_valid;
input  [1:0] fifo_C_drain_C_drain_IO_L2_out_7468_fifo_cap;
input   fifo_C_drain_C_drain_IO_L2_out_7468_empty_n;
output   fifo_C_drain_C_drain_IO_L2_out_7468_read;
input  [63:0] fifo_C_drain_C_drain_IO_L1_out_6_0435_dout;
input  [1:0] fifo_C_drain_C_drain_IO_L1_out_6_0435_num_data_valid;
input  [1:0] fifo_C_drain_C_drain_IO_L1_out_6_0435_fifo_cap;
input   fifo_C_drain_C_drain_IO_L1_out_6_0435_empty_n;
output   fifo_C_drain_C_drain_IO_L1_out_6_0435_read;
output  [63:0] fifo_C_drain_C_drain_IO_L2_out_6467_din;
input  [1:0] fifo_C_drain_C_drain_IO_L2_out_6467_num_data_valid;
input  [1:0] fifo_C_drain_C_drain_IO_L2_out_6467_fifo_cap;
input   fifo_C_drain_C_drain_IO_L2_out_6467_full_n;
output   fifo_C_drain_C_drain_IO_L2_out_6467_write;

reg ap_idle;
reg fifo_C_drain_C_drain_IO_L2_out_7468_read;
reg fifo_C_drain_C_drain_IO_L1_out_6_0435_read;
reg fifo_C_drain_C_drain_IO_L2_out_6467_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] icmp_ln1039_reg_217;
reg   [0:0] select_ln801_reg_221;
reg    ap_predicate_op40_read_state2;
reg    ap_predicate_op42_read_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1039_fu_112_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    fifo_C_drain_C_drain_IO_L2_out_7468_blk_n;
wire    ap_block_pp0_stage0;
reg    fifo_C_drain_C_drain_IO_L2_out_6467_blk_n;
reg    fifo_C_drain_C_drain_IO_L1_out_6_0435_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] select_ln801_fu_151_p3;
wire   [63:0] ap_phi_reg_pp0_iter0_fifo_data_28_reg_81;
reg   [63:0] ap_phi_reg_pp0_iter1_fifo_data_28_reg_81;
reg   [63:0] ap_phi_reg_pp0_iter2_fifo_data_28_reg_81;
reg   [13:0] indvar_flatten11_fu_50;
wire   [13:0] select_ln1039_9_fu_173_p3;
wire    ap_loop_init;
reg   [13:0] ap_sig_allocacmp_indvar_flatten11_load;
reg   [3:0] c3_V_fu_54;
wire   [3:0] select_ln1039_fu_159_p3;
reg   [3:0] ap_sig_allocacmp_c3_V_load;
reg   [13:0] indvar_flatten31_fu_58;
wire   [13:0] add_ln1039_7_fu_118_p2;
reg   [13:0] ap_sig_allocacmp_indvar_flatten31_load;
reg    ap_block_pp0_stage0_01001;
wire   [3:0] add_ln840_fu_127_p2;
wire   [0:0] icmp_ln1039_8_fu_145_p2;
wire   [0:0] cmp_i_i_mid1_fu_133_p2;
wire   [0:0] cmp_i_i35_fu_139_p2;
wire   [13:0] add_ln1039_fu_167_p2;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_133;
reg    ap_condition_131;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

kernel3_flow_control_loop_pipe flow_control_loop_pipe_U(
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
    .ap_done_int(ap_done_int),
    .ap_continue(ap_continue)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_133)) begin
        if (((select_ln801_reg_221 == 1'd0) & (icmp_ln1039_reg_217 == 1'd0))) begin
            ap_phi_reg_pp0_iter2_fifo_data_28_reg_81 <= fifo_C_drain_C_drain_IO_L2_out_7468_dout;
        end else if (((select_ln801_reg_221 == 1'd1) & (icmp_ln1039_reg_217 == 1'd0))) begin
            ap_phi_reg_pp0_iter2_fifo_data_28_reg_81 <= fifo_C_drain_C_drain_IO_L1_out_6_0435_dout;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter2_fifo_data_28_reg_81 <= ap_phi_reg_pp0_iter1_fifo_data_28_reg_81;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_131)) begin
        if ((icmp_ln1039_fu_112_p2 == 1'd0)) begin
            c3_V_fu_54 <= select_ln1039_fu_159_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            c3_V_fu_54 <= 4'd6;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_131)) begin
        if ((icmp_ln1039_fu_112_p2 == 1'd0)) begin
            indvar_flatten11_fu_50 <= select_ln1039_9_fu_173_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten11_fu_50 <= 14'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_131)) begin
        if ((icmp_ln1039_fu_112_p2 == 1'd0)) begin
            indvar_flatten31_fu_58 <= add_ln1039_7_fu_118_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten31_fu_58 <= 14'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        icmp_ln1039_reg_217 <= icmp_ln1039_fu_112_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter1_fifo_data_28_reg_81 <= ap_phi_reg_pp0_iter0_fifo_data_28_reg_81;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1039_fu_112_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln801_reg_221 <= select_ln801_fu_151_p3;
    end
end

always @ (*) begin
    if (((icmp_ln1039_fu_112_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_c3_V_load = 4'd6;
    end else begin
        ap_sig_allocacmp_c3_V_load = c3_V_fu_54;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten11_load = 14'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten11_load = indvar_flatten11_fu_50;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten31_load = 14'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten31_load = indvar_flatten31_fu_58;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op42_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fifo_C_drain_C_drain_IO_L1_out_6_0435_blk_n = fifo_C_drain_C_drain_IO_L1_out_6_0435_empty_n;
    end else begin
        fifo_C_drain_C_drain_IO_L1_out_6_0435_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op42_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fifo_C_drain_C_drain_IO_L1_out_6_0435_read = 1'b1;
    end else begin
        fifo_C_drain_C_drain_IO_L1_out_6_0435_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        fifo_C_drain_C_drain_IO_L2_out_6467_blk_n = fifo_C_drain_C_drain_IO_L2_out_6467_full_n;
    end else begin
        fifo_C_drain_C_drain_IO_L2_out_6467_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        fifo_C_drain_C_drain_IO_L2_out_6467_write = 1'b1;
    end else begin
        fifo_C_drain_C_drain_IO_L2_out_6467_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op40_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fifo_C_drain_C_drain_IO_L2_out_7468_blk_n = fifo_C_drain_C_drain_IO_L2_out_7468_empty_n;
    end else begin
        fifo_C_drain_C_drain_IO_L2_out_7468_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op40_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fifo_C_drain_C_drain_IO_L2_out_7468_read = 1'b1;
    end else begin
        fifo_C_drain_C_drain_IO_L2_out_7468_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln1039_7_fu_118_p2 = (ap_sig_allocacmp_indvar_flatten31_load + 14'd1);

assign add_ln1039_fu_167_p2 = (ap_sig_allocacmp_indvar_flatten11_load + 14'd1);

assign add_ln840_fu_127_p2 = (ap_sig_allocacmp_c3_V_load + 4'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((fifo_C_drain_C_drain_IO_L2_out_6467_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op42_read_state2 == 1'b1) & (fifo_C_drain_C_drain_IO_L1_out_6_0435_empty_n == 1'b0)) | ((ap_predicate_op40_read_state2 == 1'b1) & (fifo_C_drain_C_drain_IO_L2_out_7468_empty_n == 1'b0)))) | ((ap_done_reg == 1'b1) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((fifo_C_drain_C_drain_IO_L2_out_6467_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op42_read_state2 == 1'b1) & (fifo_C_drain_C_drain_IO_L1_out_6_0435_empty_n == 1'b0)) | ((ap_predicate_op40_read_state2 == 1'b1) & (fifo_C_drain_C_drain_IO_L2_out_7468_empty_n == 1'b0)))) | ((ap_done_reg == 1'b1) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((fifo_C_drain_C_drain_IO_L2_out_6467_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op42_read_state2 == 1'b1) & (fifo_C_drain_C_drain_IO_L1_out_6_0435_empty_n == 1'b0)) | ((ap_predicate_op40_read_state2 == 1'b1) & (fifo_C_drain_C_drain_IO_L2_out_7468_empty_n == 1'b0)))) | ((ap_done_reg == 1'b1) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_done_reg == 1'b1);
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op42_read_state2 == 1'b1) & (fifo_C_drain_C_drain_IO_L1_out_6_0435_empty_n == 1'b0)) | ((ap_predicate_op40_read_state2 == 1'b1) & (fifo_C_drain_C_drain_IO_L2_out_7468_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (fifo_C_drain_C_drain_IO_L2_out_6467_full_n == 1'b0);
end

always @ (*) begin
    ap_condition_131 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_133 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_phi_reg_pp0_iter0_fifo_data_28_reg_81 = 'bx;

always @ (*) begin
    ap_predicate_op40_read_state2 = ((select_ln801_reg_221 == 1'd0) & (icmp_ln1039_reg_217 == 1'd0));
end

always @ (*) begin
    ap_predicate_op42_read_state2 = ((select_ln801_reg_221 == 1'd1) & (icmp_ln1039_reg_217 == 1'd0));
end

assign cmp_i_i35_fu_139_p2 = ((ap_sig_allocacmp_c3_V_load == 4'd6) ? 1'b1 : 1'b0);

assign cmp_i_i_mid1_fu_133_p2 = ((add_ln840_fu_127_p2 == 4'd6) ? 1'b1 : 1'b0);

assign fifo_C_drain_C_drain_IO_L2_out_6467_din = ap_phi_reg_pp0_iter2_fifo_data_28_reg_81;

assign icmp_ln1039_8_fu_145_p2 = ((ap_sig_allocacmp_indvar_flatten11_load == 14'd6656) ? 1'b1 : 1'b0);

assign icmp_ln1039_fu_112_p2 = ((ap_sig_allocacmp_indvar_flatten31_load == 14'd13312) ? 1'b1 : 1'b0);

assign select_ln1039_9_fu_173_p3 = ((icmp_ln1039_8_fu_145_p2[0:0] == 1'b1) ? 14'd1 : add_ln1039_fu_167_p2);

assign select_ln1039_fu_159_p3 = ((icmp_ln1039_8_fu_145_p2[0:0] == 1'b1) ? add_ln840_fu_127_p2 : ap_sig_allocacmp_c3_V_load);

assign select_ln801_fu_151_p3 = ((icmp_ln1039_8_fu_145_p2[0:0] == 1'b1) ? cmp_i_i_mid1_fu_133_p2 : cmp_i_i35_fu_139_p2);

endmodule //kernel3_C_drain_IO_L2_out