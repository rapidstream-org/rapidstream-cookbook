// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module rasterization2_m_rasterization2_even_Pipeline_VITIS_LOOP_269_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Output_4_V_TREADY,
        Output_3_V_TREADY,
        add_ln260,
        add_ln263,
        i_V_reload,
        Output_3_V_TDATA,
        Output_3_V_TVALID,
        Output_4_V_TDATA,
        Output_4_V_TVALID,
        out3_cnt,
        out3_cnt_ap_vld,
        fragment_x_V_1_address0,
        fragment_x_V_1_ce0,
        fragment_x_V_1_q0,
        fragment_y_V_1_address0,
        fragment_y_V_1_ce0,
        fragment_y_V_1_q0,
        fragment_z_V_1_address0,
        fragment_z_V_1_ce0,
        fragment_z_V_1_q0,
        fragment_color_V_1_address0,
        fragment_color_V_1_ce0,
        fragment_color_V_1_q0,
        out4_cnt,
        out4_cnt_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   Output_4_V_TREADY;
input   Output_3_V_TREADY;
input  [31:0] add_ln260;
input  [31:0] add_ln263;
input  [15:0] i_V_reload;
output  [31:0] Output_3_V_TDATA;
output   Output_3_V_TVALID;
output  [31:0] Output_4_V_TDATA;
output   Output_4_V_TVALID;
output  [31:0] out3_cnt;
output   out3_cnt_ap_vld;
output  [8:0] fragment_x_V_1_address0;
output   fragment_x_V_1_ce0;
input  [7:0] fragment_x_V_1_q0;
output  [8:0] fragment_y_V_1_address0;
output   fragment_y_V_1_ce0;
input  [7:0] fragment_y_V_1_q0;
output  [8:0] fragment_z_V_1_address0;
output   fragment_z_V_1_ce0;
input  [7:0] fragment_z_V_1_q0;
output  [8:0] fragment_color_V_1_address0;
output   fragment_color_V_1_ce0;
input  [5:0] fragment_color_V_1_q0;
output  [31:0] out4_cnt;
output   out4_cnt_ap_vld;

reg ap_idle;
reg Output_3_V_TVALID;
reg Output_4_V_TVALID;
reg out3_cnt_ap_vld;
reg fragment_x_V_1_ce0;
reg fragment_y_V_1_ce0;
reg fragment_z_V_1_ce0;
reg fragment_color_V_1_ce0;
reg out4_cnt_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] tmp_reg_324;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1057_fu_176_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    Output_3_V_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    Output_4_V_TDATA_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln1057_fu_188_p1;
reg   [63:0] zext_ln1057_reg_292;
reg   [7:0] fragment_y_V_1_load_reg_309;
reg   [15:0] j_fu_62;
wire    ap_loop_init;
reg   [15:0] ap_sig_allocacmp_j_2;
wire   [15:0] add_ln269_fu_182_p2;
reg   [31:0] empty_fu_66;
wire   [31:0] add_ln288_fu_230_p2;
reg   [31:0] empty_13_fu_70;
wire   [31:0] add_ln279_fu_250_p2;
wire   [31:0] zext_ln414_fu_221_p1;
reg    ap_block_pp0_stage0_01001;
wire   [29:0] out_tmp_V_fu_206_p5;
wire  signed [30:0] sext_ln414_fu_217_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

rasterization2_m_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_13_fu_70 <= add_ln260;
        end else if (((tmp_reg_324 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            empty_13_fu_70 <= add_ln279_fu_250_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_fu_66 <= add_ln263;
        end else if (((tmp_reg_324 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            empty_fu_66 <= add_ln288_fu_230_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln1057_fu_176_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            j_fu_62 <= add_ln269_fu_182_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_62 <= 16'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        fragment_y_V_1_load_reg_309 <= fragment_y_V_1_q0;
        tmp_reg_324 <= fragment_y_V_1_q0[32'd7];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1057_fu_176_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        zext_ln1057_reg_292[15 : 0] <= zext_ln1057_fu_188_p1[15 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (tmp_reg_324 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        Output_3_V_TDATA_blk_n = Output_3_V_TREADY;
    end else begin
        Output_3_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_324 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        Output_3_V_TVALID = 1'b1;
    end else begin
        Output_3_V_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (tmp_reg_324 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        Output_4_V_TDATA_blk_n = Output_4_V_TREADY;
    end else begin
        Output_4_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_324 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        Output_4_V_TVALID = 1'b1;
    end else begin
        Output_4_V_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1057_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_j_2 = 16'd0;
    end else begin
        ap_sig_allocacmp_j_2 = j_fu_62;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fragment_color_V_1_ce0 = 1'b1;
    end else begin
        fragment_color_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fragment_x_V_1_ce0 = 1'b1;
    end else begin
        fragment_x_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fragment_y_V_1_ce0 = 1'b1;
    end else begin
        fragment_y_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fragment_z_V_1_ce0 = 1'b1;
    end else begin
        fragment_z_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_324 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        out3_cnt_ap_vld = 1'b1;
    end else begin
        out3_cnt_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_324 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        out4_cnt_ap_vld = 1'b1;
    end else begin
        out4_cnt_ap_vld = 1'b0;
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

assign Output_3_V_TDATA = zext_ln414_fu_221_p1;

assign Output_4_V_TDATA = zext_ln414_fu_221_p1;

assign add_ln269_fu_182_p2 = (ap_sig_allocacmp_j_2 + 16'd1);

assign add_ln279_fu_250_p2 = (empty_13_fu_70 + 32'd1);

assign add_ln288_fu_230_p2 = (empty_fu_66 + 32'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (((tmp_reg_324 == 1'd1) & (1'b0 == Output_3_V_TREADY)) | ((tmp_reg_324 == 1'd0) & (1'b0 == Output_4_V_TREADY))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((tmp_reg_324 == 1'd1) & (1'b0 == Output_3_V_TREADY)) | ((tmp_reg_324 == 1'd0) & (1'b0 == Output_4_V_TREADY))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((tmp_reg_324 == 1'd1) & (1'b0 == Output_3_V_TREADY)) | ((tmp_reg_324 == 1'd0) & (1'b0 == Output_4_V_TREADY))));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = (((tmp_reg_324 == 1'd1) & (1'b0 == Output_3_V_TREADY)) | ((tmp_reg_324 == 1'd0) & (1'b0 == Output_4_V_TREADY)));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (((tmp_reg_324 == 1'd1) & (1'b0 == Output_3_V_TREADY)) | ((tmp_reg_324 == 1'd0) & (1'b0 == Output_4_V_TREADY)));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign fragment_color_V_1_address0 = zext_ln1057_reg_292;

assign fragment_x_V_1_address0 = zext_ln1057_reg_292;

assign fragment_y_V_1_address0 = zext_ln1057_fu_188_p1;

assign fragment_z_V_1_address0 = zext_ln1057_reg_292;

assign icmp_ln1057_fu_176_p2 = ((ap_sig_allocacmp_j_2 == i_V_reload) ? 1'b1 : 1'b0);

assign out3_cnt = (empty_13_fu_70 + 32'd1);

assign out4_cnt = (empty_fu_66 + 32'd1);

assign out_tmp_V_fu_206_p5 = {{{{fragment_color_V_1_q0}, {fragment_z_V_1_q0}}, {fragment_y_V_1_load_reg_309}}, {fragment_x_V_1_q0}};

assign sext_ln414_fu_217_p1 = $signed(out_tmp_V_fu_206_p5);

assign zext_ln1057_fu_188_p1 = ap_sig_allocacmp_j_2;

assign zext_ln414_fu_221_p1 = $unsigned(sext_ln414_fu_217_p1);

always @ (posedge ap_clk) begin
    zext_ln1057_reg_292[63:16] <= 48'b000000000000000000000000000000000000000000000000;
end

endmodule //rasterization2_m_rasterization2_even_Pipeline_VITIS_LOOP_269_1
