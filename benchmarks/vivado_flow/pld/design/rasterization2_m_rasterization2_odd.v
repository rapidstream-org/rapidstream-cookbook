// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module rasterization2_m_rasterization2_odd (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Input_1_V_TDATA,
        Input_1_V_TVALID,
        Input_1_V_TREADY,
        Output_1_V_TDATA,
        Output_1_V_TVALID,
        Output_1_V_TREADY,
        Output_2_V_TDATA,
        Output_2_V_TVALID,
        Output_2_V_TREADY
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] Input_1_V_TDATA;
input   Input_1_V_TVALID;
output   Input_1_V_TREADY;
output  [31:0] Output_1_V_TDATA;
output   Output_1_V_TVALID;
input   Output_1_V_TREADY;
output  [31:0] Output_2_V_TDATA;
output   Output_2_V_TVALID;
input   Output_2_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg Input_1_V_TREADY;
reg[31:0] Output_1_V_TDATA;
reg Output_1_V_TVALID;
reg[31:0] Output_2_V_TDATA;
reg Output_2_V_TVALID;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] in_cnt;
reg   [31:0] out1_cnt;
reg   [31:0] out2_cnt;
reg   [8:0] fragment_x_V_address0;
reg    fragment_x_V_ce0;
reg    fragment_x_V_we0;
wire   [7:0] fragment_x_V_q0;
reg   [8:0] fragment_y_V_address0;
reg    fragment_y_V_ce0;
reg    fragment_y_V_we0;
wire   [7:0] fragment_y_V_q0;
reg   [8:0] fragment_z_V_address0;
reg    fragment_z_V_ce0;
reg    fragment_z_V_we0;
wire   [7:0] fragment_z_V_q0;
reg   [8:0] fragment_color_V_address0;
reg    fragment_color_V_ce0;
reg    fragment_color_V_we0;
wire   [5:0] fragment_color_V_q0;
reg    Input_1_V_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    Output_1_V_TDATA_blk_n;
reg   [0:0] icmp_ln78_reg_381;
wire    ap_CS_fsm_state6;
reg    Output_2_V_TDATA_blk_n;
reg   [7:0] triangle_2d_same_x0_V_reg_363;
reg   [7:0] triangle_2d_same_y0_V_reg_369;
reg   [7:0] triangle_2d_same_x1_V_reg_375;
wire   [0:0] icmp_ln78_fu_212_p2;
wire   [7:0] triangle_2d_same_y1_V_fu_218_p1;
reg   [7:0] triangle_2d_same_y1_V_reg_385;
reg   [7:0] triangle_2d_same_x2_V_reg_391;
reg   [7:0] triangle_2d_same_y2_V_reg_397;
reg   [7:0] triangle_2d_same_z_V_reg_403;
wire   [15:0] trunc_ln674_fu_222_p1;
reg   [15:0] trunc_ln674_reg_408;
reg   [7:0] max_min_V_reg_413;
wire   [7:0] max_min_V_1_fu_226_p1;
reg   [7:0] max_min_V_1_reg_418;
reg   [7:0] max_min_V_2_reg_423;
reg   [31:0] out1_cnt_load_reg_428;
reg   [31:0] out2_cnt_load_reg_433;
wire   [8:0] ret_22_fu_259_p2;
reg   [8:0] ret_22_reg_438;
wire   [8:0] ret_25_fu_272_p2;
reg   [8:0] ret_25_reg_443;
wire   [8:0] ret_28_fu_282_p2;
reg   [8:0] ret_28_reg_448;
wire   [8:0] ret_31_fu_292_p2;
reg   [8:0] ret_31_reg_453;
wire   [8:0] ret_34_fu_299_p2;
reg   [8:0] ret_34_reg_458;
wire   [8:0] ret_37_fu_306_p2;
reg   [8:0] ret_37_reg_463;
wire   [31:0] grp_fu_182_p2;
reg   [31:0] add_ln117_reg_468;
wire   [31:0] grp_fu_187_p2;
reg   [31:0] add_ln120_reg_473;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_start;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_done;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_idle;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_ready;
wire   [15:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_bot_V_out;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_bot_V_out_ap_vld;
wire   [15:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_V_out;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_V_out_ap_vld;
wire   [15:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_top_V_out;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_top_V_out_ap_vld;
wire   [8:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_address0;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_ce0;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_we0;
wire   [7:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_d0;
wire   [8:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_address0;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_ce0;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_we0;
wire   [7:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_d0;
wire   [8:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_address0;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_ce0;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_we0;
wire   [7:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_d0;
wire   [8:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_address0;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_ce0;
wire    grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_we0;
wire   [5:0] grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_d0;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_start;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_done;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_idle;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_ready;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TREADY;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TREADY;
wire   [31:0] grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TDATA;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TVALID;
wire   [31:0] grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TDATA;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TVALID;
wire   [31:0] grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out1_cnt;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out1_cnt_ap_vld;
wire   [8:0] grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_x_V_address0;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_x_V_ce0;
wire   [8:0] grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_y_V_address0;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_y_V_ce0;
wire   [8:0] grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_z_V_address0;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_z_V_ce0;
wire   [8:0] grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_color_V_address0;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_color_V_ce0;
wire   [31:0] grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out2_cnt;
wire    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out2_cnt_ap_vld;
reg    grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_start_reg;
reg    ap_block_state4_ignore_call12;
reg    ap_block_state4_io;
wire    ap_CS_fsm_state5;
reg    grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_start_reg;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state8;
wire   [31:0] add_ln68_fu_200_p2;
reg    ap_block_state1;
reg    ap_block_state6;
reg    ap_block_state6_io;
reg    ap_block_state4;
wire   [31:0] zext_ln217_fu_319_p1;
wire   [31:0] zext_ln217_1_fu_330_p1;
reg   [31:0] grp_fu_182_p0;
reg   [31:0] grp_fu_187_p0;
wire   [1:0] flag_V_fu_192_p1;
wire   [8:0] triangle_2d_same_y1_V_cast_fu_253_p1;
wire   [8:0] triangle_2d_same_y0_V_cast_fu_256_p1;
wire   [8:0] triangle_2d_same_x1_V_cast_fu_266_p1;
wire   [8:0] triangle_2d_same_x0_V_cast_fu_269_p1;
wire   [8:0] triangle_2d_same_y2_V_cast_fu_279_p1;
wire   [8:0] triangle_2d_same_x2_V_cast_fu_289_p1;
reg    ap_block_state8_on_subcall_done;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 in_cnt = 32'd0;
#0 out1_cnt = 32'd0;
#0 out2_cnt = 32'd0;
#0 grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_start_reg = 1'b0;
#0 grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_start_reg = 1'b0;
end

rasterization2_m_rasterization2_odd_fragment_x_V #(
    .DataWidth( 8 ),
    .AddressRange( 500 ),
    .AddressWidth( 9 ))
fragment_x_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(fragment_x_V_address0),
    .ce0(fragment_x_V_ce0),
    .we0(fragment_x_V_we0),
    .d0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_d0),
    .q0(fragment_x_V_q0)
);

rasterization2_m_rasterization2_odd_fragment_x_V #(
    .DataWidth( 8 ),
    .AddressRange( 500 ),
    .AddressWidth( 9 ))
fragment_y_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(fragment_y_V_address0),
    .ce0(fragment_y_V_ce0),
    .we0(fragment_y_V_we0),
    .d0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_d0),
    .q0(fragment_y_V_q0)
);

rasterization2_m_rasterization2_odd_fragment_x_V #(
    .DataWidth( 8 ),
    .AddressRange( 500 ),
    .AddressWidth( 9 ))
fragment_z_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(fragment_z_V_address0),
    .ce0(fragment_z_V_ce0),
    .we0(fragment_z_V_we0),
    .d0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_d0),
    .q0(fragment_z_V_q0)
);

rasterization2_m_rasterization2_odd_fragment_color_V #(
    .DataWidth( 6 ),
    .AddressRange( 500 ),
    .AddressWidth( 9 ))
fragment_color_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(fragment_color_V_address0),
    .ce0(fragment_color_V_ce0),
    .we0(fragment_color_V_we0),
    .d0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_d0),
    .q0(fragment_color_V_q0)
);

rasterization2_m_rasterization2_odd_Pipeline_RAST2 grp_rasterization2_odd_Pipeline_RAST2_fu_96(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_start),
    .ap_done(grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_done),
    .ap_idle(grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_idle),
    .ap_ready(grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_ready),
    .p_Result_8(trunc_ln674_reg_408),
    .max_min_V_2_cast(max_min_V_2_reg_423),
    .max_min_V(max_min_V_reg_413),
    .max_min_V_1(max_min_V_1_reg_418),
    .triangle_2d_same_x0_V_cast(triangle_2d_same_x0_V_reg_363),
    .rhs(ret_22_reg_438),
    .triangle_2d_same_y0_V_cast(triangle_2d_same_y0_V_reg_369),
    .rhs_1(ret_25_reg_443),
    .triangle_2d_same_x1_V_cast(triangle_2d_same_x1_V_reg_375),
    .rhs_3(ret_28_reg_448),
    .triangle_2d_same_y1_V_cast(triangle_2d_same_y1_V_reg_385),
    .rhs_4(ret_31_reg_453),
    .triangle_2d_same_x2_V_cast(triangle_2d_same_x2_V_reg_391),
    .rhs_6(ret_34_reg_458),
    .triangle_2d_same_y2_V_cast(triangle_2d_same_y2_V_reg_397),
    .rhs_7(ret_37_reg_463),
    .triangle_2d_same_z_V(triangle_2d_same_z_V_reg_403),
    .i_bot_V_out(grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_bot_V_out),
    .i_bot_V_out_ap_vld(grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_bot_V_out_ap_vld),
    .i_V_out(grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_V_out),
    .i_V_out_ap_vld(grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_V_out_ap_vld),
    .i_top_V_out(grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_top_V_out),
    .i_top_V_out_ap_vld(grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_top_V_out_ap_vld),
    .fragment_x_V_address0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_address0),
    .fragment_x_V_ce0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_ce0),
    .fragment_x_V_we0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_we0),
    .fragment_x_V_d0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_d0),
    .fragment_y_V_address0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_address0),
    .fragment_y_V_ce0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_ce0),
    .fragment_y_V_we0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_we0),
    .fragment_y_V_d0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_d0),
    .fragment_z_V_address0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_address0),
    .fragment_z_V_ce0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_ce0),
    .fragment_z_V_we0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_we0),
    .fragment_z_V_d0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_d0),
    .fragment_color_V_address0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_address0),
    .fragment_color_V_ce0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_ce0),
    .fragment_color_V_we0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_we0),
    .fragment_color_V_d0(grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_d0)
);

rasterization2_m_rasterization2_odd_Pipeline_VITIS_LOOP_126_1 grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_start),
    .ap_done(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_done),
    .ap_idle(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_idle),
    .ap_ready(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_ready),
    .Output_2_V_TREADY(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TREADY),
    .Output_1_V_TREADY(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TREADY),
    .add_ln117(add_ln117_reg_468),
    .add_ln120(add_ln120_reg_473),
    .i_V_reload(grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_V_out),
    .Output_1_V_TDATA(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TDATA),
    .Output_1_V_TVALID(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TVALID),
    .Output_2_V_TDATA(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TDATA),
    .Output_2_V_TVALID(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TVALID),
    .out1_cnt(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out1_cnt),
    .out1_cnt_ap_vld(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out1_cnt_ap_vld),
    .fragment_x_V_address0(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_x_V_address0),
    .fragment_x_V_ce0(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_x_V_ce0),
    .fragment_x_V_q0(fragment_x_V_q0),
    .fragment_y_V_address0(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_y_V_address0),
    .fragment_y_V_ce0(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_y_V_ce0),
    .fragment_y_V_q0(fragment_y_V_q0),
    .fragment_z_V_address0(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_z_V_address0),
    .fragment_z_V_ce0(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_z_V_ce0),
    .fragment_z_V_q0(fragment_z_V_q0),
    .fragment_color_V_address0(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_color_V_address0),
    .fragment_color_V_ce0(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_color_V_ce0),
    .fragment_color_V_q0(fragment_color_V_q0),
    .out2_cnt(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out2_cnt),
    .out2_cnt_ap_vld(grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out2_cnt_ap_vld)
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
        grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_start_reg <= 1'b0;
    end else begin
        if ((~((1'b0 == Input_1_V_TVALID) | (1'b1 == ap_block_state4_io) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd1))) begin
            grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_start_reg <= 1'b1;
        end else if ((grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_ready == 1'b1)) begin
            grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_start_reg <= 1'b1;
        end else if ((grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_ready == 1'b1)) begin
            grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((~((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY) | (1'b1 == ap_block_state6_io)) & (1'b1 == ap_CS_fsm_state6)) | (~((1'b0 == Input_1_V_TVALID) | (1'b1 == ap_block_state4_io) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd0)))) begin
        out1_cnt <= grp_fu_182_p2;
    end else if (((grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out1_cnt_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        out1_cnt <= grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out1_cnt;
    end
end

always @ (posedge ap_clk) begin
    if (((~((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY) | (1'b1 == ap_block_state6_io)) & (1'b1 == ap_CS_fsm_state6)) | (~((1'b0 == Input_1_V_TVALID) | (1'b1 == ap_block_state4_io) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd0)))) begin
        out2_cnt <= grp_fu_187_p2;
    end else if (((grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out2_cnt_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        out2_cnt <= grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_out2_cnt;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        add_ln117_reg_468 <= grp_fu_182_p2;
        add_ln120_reg_473 <= grp_fu_187_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln78_reg_381 <= icmp_ln78_fu_212_p2;
        triangle_2d_same_x0_V_reg_363 <= {{Input_1_V_TDATA[15:8]}};
        triangle_2d_same_x1_V_reg_375 <= {{Input_1_V_TDATA[31:24]}};
        triangle_2d_same_y0_V_reg_369 <= {{Input_1_V_TDATA[23:16]}};
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b0 == Input_1_V_TVALID) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_cnt <= add_ln68_fu_200_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        max_min_V_1_reg_418 <= max_min_V_1_fu_226_p1;
        max_min_V_2_reg_423 <= {{Input_1_V_TDATA[23:16]}};
        out1_cnt_load_reg_428 <= out1_cnt;
        out2_cnt_load_reg_433 <= out2_cnt;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        max_min_V_reg_413 <= {{Input_1_V_TDATA[23:16]}};
        trunc_ln674_reg_408 <= trunc_ln674_fu_222_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd1))) begin
        ret_22_reg_438 <= ret_22_fu_259_p2;
        ret_25_reg_443 <= ret_25_fu_272_p2;
        ret_28_reg_448 <= ret_28_fu_282_p2;
        ret_31_reg_453 <= ret_31_fu_292_p2;
        ret_34_reg_458 <= ret_34_fu_299_p2;
        ret_37_reg_463 <= ret_37_fu_306_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        triangle_2d_same_x2_V_reg_391 <= {{Input_1_V_TDATA[15:8]}};
        triangle_2d_same_y1_V_reg_385 <= triangle_2d_same_y1_V_fu_218_p1;
        triangle_2d_same_y2_V_reg_397 <= {{Input_1_V_TDATA[23:16]}};
        triangle_2d_same_z_V_reg_403 <= {{Input_1_V_TDATA[31:24]}};
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        Input_1_V_TDATA_blk_n = Input_1_V_TVALID;
    end else begin
        Input_1_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state3) & (1'b1 == Input_1_V_TVALID)) | ((1'b1 == ap_CS_fsm_state2) & (1'b1 == Input_1_V_TVALID)) | (~((1'b0 == Input_1_V_TVALID) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)) | (~((1'b0 == Input_1_V_TVALID) | (1'b1 == ap_block_state4_io) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4)))) begin
        Input_1_V_TREADY = 1'b1;
    end else begin
        Input_1_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY)) & (1'b1 == ap_CS_fsm_state6))) begin
        Output_1_V_TDATA = zext_ln217_fu_319_p1;
    end else if ((~((1'b0 == Input_1_V_TVALID) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd0))) begin
        Output_1_V_TDATA = 32'd0;
    end else if (((grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TVALID == 1'b1) & (1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        Output_1_V_TDATA = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TDATA;
    end else begin
        Output_1_V_TDATA = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | ((1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd0)))) begin
        Output_1_V_TDATA_blk_n = Output_1_V_TREADY;
    end else begin
        Output_1_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((~((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY) | (1'b1 == ap_block_state6_io)) & (1'b1 == ap_CS_fsm_state6)) | (~((1'b0 == Input_1_V_TVALID) | (1'b1 == ap_block_state4_io) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd0)))) begin
        Output_1_V_TVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        Output_1_V_TVALID = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TVALID;
    end else begin
        Output_1_V_TVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY)) & (1'b1 == ap_CS_fsm_state6))) begin
        Output_2_V_TDATA = zext_ln217_1_fu_330_p1;
    end else if ((~((1'b0 == Input_1_V_TVALID) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd0))) begin
        Output_2_V_TDATA = 32'd0;
    end else if (((grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TVALID == 1'b1) & (1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        Output_2_V_TDATA = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TDATA;
    end else begin
        Output_2_V_TDATA = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | ((1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd0)))) begin
        Output_2_V_TDATA_blk_n = Output_2_V_TREADY;
    end else begin
        Output_2_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((~((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY) | (1'b1 == ap_block_state6_io)) & (1'b1 == ap_CS_fsm_state6)) | (~((1'b0 == Input_1_V_TVALID) | (1'b1 == ap_block_state4_io) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd0)))) begin
        Output_2_V_TVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        Output_2_V_TVALID = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TVALID;
    end else begin
        Output_2_V_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == Input_1_V_TVALID) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Input_1_V_TVALID)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Input_1_V_TVALID)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == Input_1_V_TVALID) | (1'b1 == ap_block_state4_io) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)))) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY) | (1'b1 == ap_block_state6_io))) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state8_on_subcall_done)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_state8_on_subcall_done) & (1'b1 == ap_CS_fsm_state8)) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state8_on_subcall_done) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        fragment_color_V_address0 = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_color_V_address0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_color_V_address0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_address0;
    end else begin
        fragment_color_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        fragment_color_V_ce0 = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_color_V_ce0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_color_V_ce0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_ce0;
    end else begin
        fragment_color_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_color_V_we0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_color_V_we0;
    end else begin
        fragment_color_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        fragment_x_V_address0 = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_x_V_address0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_x_V_address0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_address0;
    end else begin
        fragment_x_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        fragment_x_V_ce0 = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_x_V_ce0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_x_V_ce0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_ce0;
    end else begin
        fragment_x_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_x_V_we0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_x_V_we0;
    end else begin
        fragment_x_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        fragment_y_V_address0 = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_y_V_address0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_y_V_address0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_address0;
    end else begin
        fragment_y_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        fragment_y_V_ce0 = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_y_V_ce0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_y_V_ce0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_ce0;
    end else begin
        fragment_y_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_y_V_we0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_y_V_we0;
    end else begin
        fragment_y_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        fragment_z_V_address0 = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_z_V_address0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_z_V_address0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_address0;
    end else begin
        fragment_z_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln78_reg_381 == 1'd1))) begin
        fragment_z_V_ce0 = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_fragment_z_V_ce0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_z_V_ce0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_ce0;
    end else begin
        fragment_z_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        fragment_z_V_we0 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_fragment_z_V_we0;
    end else begin
        fragment_z_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_182_p0 = out1_cnt_load_reg_428;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_fu_182_p0 = out1_cnt;
    end else begin
        grp_fu_182_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_187_p0 = out2_cnt_load_reg_433;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_fu_187_p0 = out2_cnt;
    end else begin
        grp_fu_187_p0 = 'bx;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b0 == Input_1_V_TVALID) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (1'b1 == Input_1_V_TVALID))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == Input_1_V_TVALID))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if ((~((1'b0 == Input_1_V_TVALID) | (1'b1 == ap_block_state4_io) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else if ((~((1'b0 == Input_1_V_TVALID) | (1'b1 == ap_block_state4_io) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0))) & (1'b1 == ap_CS_fsm_state4) & (icmp_ln78_reg_381 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if ((~((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY) | (1'b1 == ap_block_state6_io)) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if (((1'b0 == ap_block_state8_on_subcall_done) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln68_fu_200_p2 = (in_cnt + 32'd4);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

always @ (*) begin
    ap_block_state1 = ((1'b0 == Input_1_V_TVALID) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state4 = ((1'b0 == Input_1_V_TVALID) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)));
end

always @ (*) begin
    ap_block_state4_ignore_call12 = ((1'b0 == Input_1_V_TVALID) | ((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)));
end

always @ (*) begin
    ap_block_state4_io = (((1'b0 == Output_2_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)) | ((1'b0 == Output_1_V_TREADY) & (icmp_ln78_reg_381 == 1'd0)));
end

always @ (*) begin
    ap_block_state6 = ((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY));
end

always @ (*) begin
    ap_block_state6_io = ((1'b0 == Output_2_V_TREADY) | (1'b0 == Output_1_V_TREADY));
end

always @ (*) begin
    ap_block_state8_on_subcall_done = ((grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_done == 1'b0) & (icmp_ln78_reg_381 == 1'd1));
end

assign flag_V_fu_192_p1 = Input_1_V_TDATA[1:0];

assign grp_fu_182_p2 = (grp_fu_182_p0 + 32'd1);

assign grp_fu_187_p2 = (grp_fu_187_p0 + 32'd1);

assign grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_start = grp_rasterization2_odd_Pipeline_RAST2_fu_96_ap_start_reg;

assign grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_1_V_TREADY = (ap_CS_fsm_state8 & Output_1_V_TREADY);

assign grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_Output_2_V_TREADY = (ap_CS_fsm_state8 & Output_2_V_TREADY);

assign grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_start = grp_rasterization2_odd_Pipeline_VITIS_LOOP_126_1_fu_128_ap_start_reg;

assign icmp_ln78_fu_212_p2 = ((flag_V_fu_192_p1 == 2'd0) ? 1'b1 : 1'b0);

assign max_min_V_1_fu_226_p1 = Input_1_V_TDATA[7:0];

assign ret_22_fu_259_p2 = (triangle_2d_same_y1_V_cast_fu_253_p1 - triangle_2d_same_y0_V_cast_fu_256_p1);

assign ret_25_fu_272_p2 = (triangle_2d_same_x1_V_cast_fu_266_p1 - triangle_2d_same_x0_V_cast_fu_269_p1);

assign ret_28_fu_282_p2 = (triangle_2d_same_y2_V_cast_fu_279_p1 - triangle_2d_same_y1_V_cast_fu_253_p1);

assign ret_31_fu_292_p2 = (triangle_2d_same_x2_V_cast_fu_289_p1 - triangle_2d_same_x1_V_cast_fu_266_p1);

assign ret_34_fu_299_p2 = (triangle_2d_same_y0_V_cast_fu_256_p1 - triangle_2d_same_y2_V_cast_fu_279_p1);

assign ret_37_fu_306_p2 = (triangle_2d_same_x0_V_cast_fu_269_p1 - triangle_2d_same_x2_V_cast_fu_289_p1);

assign triangle_2d_same_x0_V_cast_fu_269_p1 = triangle_2d_same_x0_V_reg_363;

assign triangle_2d_same_x1_V_cast_fu_266_p1 = triangle_2d_same_x1_V_reg_375;

assign triangle_2d_same_x2_V_cast_fu_289_p1 = triangle_2d_same_x2_V_reg_391;

assign triangle_2d_same_y0_V_cast_fu_256_p1 = triangle_2d_same_y0_V_reg_369;

assign triangle_2d_same_y1_V_cast_fu_253_p1 = triangle_2d_same_y1_V_reg_385;

assign triangle_2d_same_y1_V_fu_218_p1 = Input_1_V_TDATA[7:0];

assign triangle_2d_same_y2_V_cast_fu_279_p1 = triangle_2d_same_y2_V_reg_397;

assign trunc_ln674_fu_222_p1 = Input_1_V_TDATA[15:0];

assign zext_ln217_1_fu_330_p1 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_bot_V_out;

assign zext_ln217_fu_319_p1 = grp_rasterization2_odd_Pipeline_RAST2_fu_96_i_top_V_out;

endmodule //rasterization2_m_rasterization2_odd