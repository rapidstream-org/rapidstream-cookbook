// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="coloringFB_top_m_coloringFB_top_m,hls_ip_2021_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.382000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=16,HLS_SYN_DSP=0,HLS_SYN_FF=265,HLS_SYN_LUT=2457,HLS_VERSION=2021_1}" *)

module coloringFB_top_m (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Input_1_V_TDATA,
        Input_1_V_TVALID,
        Input_1_V_TREADY,
        Input_2_V_TDATA,
        Input_2_V_TVALID,
        Input_2_V_TREADY,
        Output_1_V_TDATA,
        Output_1_V_TVALID,
        Output_1_V_TREADY
);

parameter    ap_ST_fsm_state1 = 15'd1;
parameter    ap_ST_fsm_state2 = 15'd2;
parameter    ap_ST_fsm_state3 = 15'd4;
parameter    ap_ST_fsm_state4 = 15'd8;
parameter    ap_ST_fsm_state5 = 15'd16;
parameter    ap_ST_fsm_state6 = 15'd32;
parameter    ap_ST_fsm_state7 = 15'd64;
parameter    ap_ST_fsm_state8 = 15'd128;
parameter    ap_ST_fsm_state9 = 15'd256;
parameter    ap_ST_fsm_state10 = 15'd512;
parameter    ap_ST_fsm_state11 = 15'd1024;
parameter    ap_ST_fsm_state12 = 15'd2048;
parameter    ap_ST_fsm_state13 = 15'd4096;
parameter    ap_ST_fsm_state14 = 15'd8192;
parameter    ap_ST_fsm_state15 = 15'd16384;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] Input_1_V_TDATA;
input   Input_1_V_TVALID;
output   Input_1_V_TREADY;
input  [31:0] Input_2_V_TDATA;
input   Input_2_V_TVALID;
output   Input_2_V_TREADY;
output  [31:0] Output_1_V_TDATA;
output   Output_1_V_TVALID;
input   Output_1_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [14:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] counter_V;
reg   [13:0] frame_buffer_V_0_address0;
reg    frame_buffer_V_0_ce0;
reg    frame_buffer_V_0_we0;
reg   [7:0] frame_buffer_V_0_d0;
wire   [7:0] frame_buffer_V_0_q0;
reg   [13:0] frame_buffer_V_0_address1;
reg    frame_buffer_V_0_ce1;
reg    frame_buffer_V_0_we1;
wire   [7:0] frame_buffer_V_0_q1;
reg   [13:0] frame_buffer_V_1_address0;
reg    frame_buffer_V_1_ce0;
reg    frame_buffer_V_1_we0;
reg   [7:0] frame_buffer_V_1_d0;
wire   [7:0] frame_buffer_V_1_q0;
reg   [13:0] frame_buffer_V_1_address1;
reg    frame_buffer_V_1_ce1;
reg    frame_buffer_V_1_we1;
wire   [7:0] frame_buffer_V_1_q1;
reg    Input_1_V_TDATA_blk_n;
reg   [31:0] tmp_V_reg_185;
wire   [0:0] icmp_ln1049_fu_126_p2;
reg   [0:0] icmp_ln1049_reg_193;
wire   [15:0] empty_fu_132_p1;
reg   [15:0] empty_reg_197;
wire    ap_CS_fsm_state2;
wire   [15:0] add_ln870_fu_135_p2;
wire    ap_CS_fsm_state5;
wire   [7:0] trunc_ln56_fu_154_p1;
reg   [7:0] trunc_ln56_reg_217;
wire    ap_CS_fsm_state6;
wire   [0:0] trunc_ln225_fu_170_p1;
reg   [0:0] trunc_ln225_reg_225;
wire   [0:0] icmp_ln56_fu_158_p2;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_start;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_done;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_idle;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_ready;
wire   [13:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_address0;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_ce0;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_we0;
wire   [7:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_d0;
wire   [13:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_address1;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_ce1;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_we1;
wire   [7:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_d1;
wire   [13:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_address0;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_ce0;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_we0;
wire   [7:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_d0;
wire   [13:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_address1;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_ce1;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_we1;
wire   [7:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_d1;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_start;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_done;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_idle;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_ready;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_Input_1_V_TREADY;
wire   [13:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_address0;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_ce0;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_we0;
wire   [7:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_d0;
wire   [13:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_address0;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_ce0;
wire    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_we0;
wire   [7:0] grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_d0;
wire    grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_start;
wire    grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_done;
wire    grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_idle;
wire    grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_ready;
wire    grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TREADY;
wire    grp_coloringFB_top_m_Pipeline_RECV_fu_102_Input_2_V_TREADY;
wire   [31:0] grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TDATA;
wire    grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TVALID;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_start;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_done;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_idle;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_ready;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TREADY;
wire   [31:0] grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TDATA;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TVALID;
wire   [13:0] grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_address0;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_ce0;
wire   [13:0] grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_address1;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_ce1;
wire   [13:0] grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_address0;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_ce0;
wire   [13:0] grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_address1;
wire    grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_ce1;
reg   [15:0] counter_V_new_0_reg_72;
wire   [0:0] icmp_ln1049_1_fu_140_p2;
reg    grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_start_reg;
reg    ap_block_state1_ignore_call0;
reg    grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_start_reg;
wire    ap_CS_fsm_state7;
reg    grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_start_reg;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state10;
wire    ap_CS_fsm_state11;
reg   [8:0] i_fu_62;
wire   [8:0] add_ln56_fu_164_p2;
reg    ap_block_state1;
wire    ap_CS_fsm_state15;
wire    regslice_both_Output_1_V_U_apdone_blk;
reg   [14:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_block_state2_on_subcall_done;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
reg    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
reg    ap_ST_fsm_state15_blk;
wire    regslice_both_Input_1_V_U_apdone_blk;
wire   [31:0] Input_1_V_TDATA_int_regslice;
wire    Input_1_V_TVALID_int_regslice;
reg    Input_1_V_TREADY_int_regslice;
wire    regslice_both_Input_1_V_U_ack_in;
wire    regslice_both_Input_2_V_U_apdone_blk;
wire   [31:0] Input_2_V_TDATA_int_regslice;
wire    Input_2_V_TVALID_int_regslice;
reg    Input_2_V_TREADY_int_regslice;
wire    regslice_both_Input_2_V_U_ack_in;
reg   [31:0] Output_1_V_TDATA_int_regslice;
reg    Output_1_V_TVALID_int_regslice;
wire    Output_1_V_TREADY_int_regslice;
wire    regslice_both_Output_1_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 15'd1;
#0 counter_V = 16'd0;
#0 grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_start_reg = 1'b0;
#0 grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_start_reg = 1'b0;
#0 grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_start_reg = 1'b0;
#0 grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_start_reg = 1'b0;
end

coloringFB_top_m_frame_buffer_V_0 #(
    .DataWidth( 8 ),
    .AddressRange( 16384 ),
    .AddressWidth( 14 ))
frame_buffer_V_0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(frame_buffer_V_0_address0),
    .ce0(frame_buffer_V_0_ce0),
    .we0(frame_buffer_V_0_we0),
    .d0(frame_buffer_V_0_d0),
    .q0(frame_buffer_V_0_q0),
    .address1(frame_buffer_V_0_address1),
    .ce1(frame_buffer_V_0_ce1),
    .we1(frame_buffer_V_0_we1),
    .d1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_d1),
    .q1(frame_buffer_V_0_q1)
);

coloringFB_top_m_frame_buffer_V_0 #(
    .DataWidth( 8 ),
    .AddressRange( 16384 ),
    .AddressWidth( 14 ))
frame_buffer_V_1_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(frame_buffer_V_1_address0),
    .ce0(frame_buffer_V_1_ce0),
    .we0(frame_buffer_V_1_we0),
    .d0(frame_buffer_V_1_d0),
    .q0(frame_buffer_V_1_q0),
    .address1(frame_buffer_V_1_address1),
    .ce1(frame_buffer_V_1_ce1),
    .we1(frame_buffer_V_1_we1),
    .d1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_d1),
    .q1(frame_buffer_V_1_q1)
);

coloringFB_top_m_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_start),
    .ap_done(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_done),
    .ap_idle(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_idle),
    .ap_ready(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_ready),
    .frame_buffer_V_0_address0(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_address0),
    .frame_buffer_V_0_ce0(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_ce0),
    .frame_buffer_V_0_we0(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_we0),
    .frame_buffer_V_0_d0(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_d0),
    .frame_buffer_V_0_address1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_address1),
    .frame_buffer_V_0_ce1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_ce1),
    .frame_buffer_V_0_we1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_we1),
    .frame_buffer_V_0_d1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_d1),
    .frame_buffer_V_1_address0(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_address0),
    .frame_buffer_V_1_ce0(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_ce0),
    .frame_buffer_V_1_we0(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_we0),
    .frame_buffer_V_1_d0(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_d0),
    .frame_buffer_V_1_address1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_address1),
    .frame_buffer_V_1_ce1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_ce1),
    .frame_buffer_V_1_we1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_we1),
    .frame_buffer_V_1_d1(grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_d1)
);

coloringFB_top_m_coloringFB_top_m_Pipeline_COLORING_FB grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_start),
    .ap_done(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_done),
    .ap_idle(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_idle),
    .ap_ready(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_ready),
    .Input_1_V_TVALID(Input_1_V_TVALID_int_regslice),
    .tmp_V_cast(empty_reg_197),
    .Input_1_V_TDATA(Input_1_V_TDATA_int_regslice),
    .Input_1_V_TREADY(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_Input_1_V_TREADY),
    .frame_buffer_V_0_address0(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_address0),
    .frame_buffer_V_0_ce0(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_ce0),
    .frame_buffer_V_0_we0(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_we0),
    .frame_buffer_V_0_d0(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_d0),
    .frame_buffer_V_1_address0(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_address0),
    .frame_buffer_V_1_ce0(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_ce0),
    .frame_buffer_V_1_we0(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_we0),
    .frame_buffer_V_1_d0(grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_d0)
);

coloringFB_top_m_coloringFB_top_m_Pipeline_RECV grp_coloringFB_top_m_Pipeline_RECV_fu_102(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_start),
    .ap_done(grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_done),
    .ap_idle(grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_idle),
    .ap_ready(grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_ready),
    .Input_2_V_TVALID(Input_2_V_TVALID_int_regslice),
    .Output_1_V_TREADY(grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TREADY),
    .Input_2_V_TDATA(Input_2_V_TDATA_int_regslice),
    .Input_2_V_TREADY(grp_coloringFB_top_m_Pipeline_RECV_fu_102_Input_2_V_TREADY),
    .Output_1_V_TDATA(grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TDATA),
    .Output_1_V_TVALID(grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TVALID)
);

coloringFB_top_m_coloringFB_top_m_Pipeline_SEND grp_coloringFB_top_m_Pipeline_SEND_fu_110(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_start),
    .ap_done(grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_done),
    .ap_idle(grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_idle),
    .ap_ready(grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_ready),
    .Output_1_V_TREADY(grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TREADY),
    .i(trunc_ln56_reg_217),
    .trunc_ln225_1(trunc_ln225_reg_225),
    .Output_1_V_TDATA(grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TDATA),
    .Output_1_V_TVALID(grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TVALID),
    .frame_buffer_V_0_address0(grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_address0),
    .frame_buffer_V_0_ce0(grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_ce0),
    .frame_buffer_V_0_q0(frame_buffer_V_0_q0),
    .frame_buffer_V_0_address1(grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_address1),
    .frame_buffer_V_0_ce1(grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_ce1),
    .frame_buffer_V_0_q1(frame_buffer_V_0_q1),
    .frame_buffer_V_1_address0(grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_address0),
    .frame_buffer_V_1_ce0(grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_ce0),
    .frame_buffer_V_1_q0(frame_buffer_V_1_q0),
    .frame_buffer_V_1_address1(grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_address1),
    .frame_buffer_V_1_ce1(grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_ce1),
    .frame_buffer_V_1_q1(frame_buffer_V_1_q1)
);

coloringFB_top_m_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Input_1_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_1_V_TDATA),
    .vld_in(Input_1_V_TVALID),
    .ack_in(regslice_both_Input_1_V_U_ack_in),
    .data_out(Input_1_V_TDATA_int_regslice),
    .vld_out(Input_1_V_TVALID_int_regslice),
    .ack_out(Input_1_V_TREADY_int_regslice),
    .apdone_blk(regslice_both_Input_1_V_U_apdone_blk)
);

coloringFB_top_m_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Input_2_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_2_V_TDATA),
    .vld_in(Input_2_V_TVALID),
    .ack_in(regslice_both_Input_2_V_U_ack_in),
    .data_out(Input_2_V_TDATA_int_regslice),
    .vld_out(Input_2_V_TVALID_int_regslice),
    .ack_out(Input_2_V_TREADY_int_regslice),
    .apdone_blk(regslice_both_Input_2_V_U_apdone_blk)
);

coloringFB_top_m_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Output_1_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Output_1_V_TDATA_int_regslice),
    .vld_in(Output_1_V_TVALID_int_regslice),
    .ack_in(Output_1_V_TREADY_int_regslice),
    .data_out(Output_1_V_TDATA),
    .vld_out(regslice_both_Output_1_V_U_vld_out),
    .ack_out(Output_1_V_TREADY),
    .apdone_blk(regslice_both_Output_1_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_start_reg <= 1'b0;
    end else begin
        if ((~((1'b0 == Input_1_V_TVALID_int_regslice) | (ap_start == 1'b0)) & (icmp_ln1049_fu_126_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_start_reg <= 1'b1;
        end else if ((grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_ready == 1'b1)) begin
            grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_start_reg <= 1'b1;
        end else if ((grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_ready == 1'b1)) begin
            grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln56_fu_158_p2 == 1'd0))) begin
            grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_start_reg <= 1'b1;
        end else if ((grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_ready == 1'b1)) begin
            grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state9)) begin
            grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_start_reg <= 1'b1;
        end else if ((grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_ready == 1'b1)) begin
            grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln56_fu_158_p2 == 1'd1))) begin
        counter_V_new_0_reg_72 <= 16'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln1049_1_fu_140_p2 == 1'd0))) begin
        counter_V_new_0_reg_72 <= add_ln870_fu_135_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln1049_1_fu_140_p2 == 1'd1))) begin
        i_fu_62 <= 9'd0;
    end else if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln56_fu_158_p2 == 1'd0))) begin
        i_fu_62 <= add_ln56_fu_164_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        counter_V <= counter_V_new_0_reg_72;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        empty_reg_197 <= empty_fu_132_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln1049_reg_193 <= icmp_ln1049_fu_126_p2;
        tmp_V_reg_185 <= Input_1_V_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln56_fu_158_p2 == 1'd0))) begin
        trunc_ln225_reg_225 <= trunc_ln225_fu_170_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        trunc_ln56_reg_217 <= trunc_ln56_fu_154_p1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        Input_1_V_TDATA_blk_n = Input_1_V_TVALID_int_regslice;
    end else begin
        Input_1_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b0 == Input_1_V_TVALID_int_regslice) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        Input_1_V_TREADY_int_regslice = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        Input_1_V_TREADY_int_regslice = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_Input_1_V_TREADY;
    end else begin
        Input_1_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        Input_2_V_TREADY_int_regslice = grp_coloringFB_top_m_Pipeline_RECV_fu_102_Input_2_V_TREADY;
    end else begin
        Input_2_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) & (grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TVALID == 1'b1))) begin
        Output_1_V_TDATA_int_regslice = grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TDATA;
    end else if (((1'b1 == ap_CS_fsm_state7) & (grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TVALID == 1'b1))) begin
        Output_1_V_TDATA_int_regslice = grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TDATA;
    end else begin
        Output_1_V_TDATA_int_regslice = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        Output_1_V_TVALID_int_regslice = grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TVALID;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        Output_1_V_TVALID_int_regslice = grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TVALID;
    end else begin
        Output_1_V_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_done == 1'b0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

always @ (*) begin
    if ((regslice_both_Output_1_V_U_apdone_blk == 1'b1)) begin
        ap_ST_fsm_state15_blk = 1'b1;
    end else begin
        ap_ST_fsm_state15_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == Input_1_V_TVALID_int_regslice) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state2_on_subcall_done)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

always @ (*) begin
    if ((grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_done == 1'b0)) begin
        ap_ST_fsm_state7_blk = 1'b1;
    end else begin
        ap_ST_fsm_state7_blk = 1'b0;
    end
end

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((regslice_both_Output_1_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state15))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_Output_1_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state15))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        frame_buffer_V_0_address0 = grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        frame_buffer_V_0_address0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_address0;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_0_address0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_address0;
    end else begin
        frame_buffer_V_0_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        frame_buffer_V_0_address1 = grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_address1;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_0_address1 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_address1;
    end else begin
        frame_buffer_V_0_address1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        frame_buffer_V_0_ce0 = grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        frame_buffer_V_0_ce0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_ce0;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_0_ce0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_ce0;
    end else begin
        frame_buffer_V_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        frame_buffer_V_0_ce1 = grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_0_ce1;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_0_ce1 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_ce1;
    end else begin
        frame_buffer_V_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        frame_buffer_V_0_d0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_d0;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_0_d0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_d0;
    end else begin
        frame_buffer_V_0_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        frame_buffer_V_0_we0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_0_we0;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_0_we0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_we0;
    end else begin
        frame_buffer_V_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_0_we1 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_0_we1;
    end else begin
        frame_buffer_V_0_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        frame_buffer_V_1_address0 = grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        frame_buffer_V_1_address0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_address0;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_1_address0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_address0;
    end else begin
        frame_buffer_V_1_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        frame_buffer_V_1_address1 = grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_address1;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_1_address1 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_address1;
    end else begin
        frame_buffer_V_1_address1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        frame_buffer_V_1_ce0 = grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        frame_buffer_V_1_ce0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_ce0;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_1_ce0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_ce0;
    end else begin
        frame_buffer_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        frame_buffer_V_1_ce1 = grp_coloringFB_top_m_Pipeline_SEND_fu_110_frame_buffer_V_1_ce1;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_1_ce1 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_ce1;
    end else begin
        frame_buffer_V_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        frame_buffer_V_1_d0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_d0;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_1_d0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_d0;
    end else begin
        frame_buffer_V_1_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        frame_buffer_V_1_we0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_frame_buffer_V_1_we0;
    end else if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_1_we0 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_we0;
    end else begin
        frame_buffer_V_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1049_reg_193 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        frame_buffer_V_1_we1 = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_frame_buffer_V_1_we1;
    end else begin
        frame_buffer_V_1_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b0 == Input_1_V_TVALID_int_regslice) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln1049_1_fu_140_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln56_fu_158_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            if (((regslice_both_Output_1_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state15))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Input_1_V_TREADY = regslice_both_Input_1_V_U_ack_in;

assign Input_2_V_TREADY = regslice_both_Input_2_V_U_ack_in;

assign Output_1_V_TVALID = regslice_both_Output_1_V_U_vld_out;

assign add_ln56_fu_164_p2 = (i_fu_62 + 9'd1);

assign add_ln870_fu_135_p2 = (counter_V + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((1'b0 == Input_1_V_TVALID_int_regslice) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state1_ignore_call0 = ((1'b0 == Input_1_V_TVALID_int_regslice) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state2_on_subcall_done = ((icmp_ln1049_reg_193 == 1'd1) & (grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_done == 1'b0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign empty_fu_132_p1 = tmp_V_reg_185[15:0];

assign grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_start = grp_coloringFB_top_m_Pipeline_COLORING_FB_INIT_ROW_fu_83_ap_start_reg;

assign grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_start = grp_coloringFB_top_m_Pipeline_COLORING_FB_fu_91_ap_start_reg;

assign grp_coloringFB_top_m_Pipeline_RECV_fu_102_Output_1_V_TREADY = (ap_CS_fsm_state7 & Output_1_V_TREADY_int_regslice);

assign grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_start = grp_coloringFB_top_m_Pipeline_RECV_fu_102_ap_start_reg;

assign grp_coloringFB_top_m_Pipeline_SEND_fu_110_Output_1_V_TREADY = (ap_CS_fsm_state10 & Output_1_V_TREADY_int_regslice);

assign grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_start = grp_coloringFB_top_m_Pipeline_SEND_fu_110_ap_start_reg;

assign icmp_ln1049_1_fu_140_p2 = ((add_ln870_fu_135_p2 == 16'd3192) ? 1'b1 : 1'b0);

assign icmp_ln1049_fu_126_p2 = ((counter_V == 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln56_fu_158_p2 = ((i_fu_62 == 9'd256) ? 1'b1 : 1'b0);

assign trunc_ln225_fu_170_p1 = i_fu_62[0:0];

assign trunc_ln56_fu_154_p1 = i_fu_62[7:0];

endmodule //coloringFB_top_m