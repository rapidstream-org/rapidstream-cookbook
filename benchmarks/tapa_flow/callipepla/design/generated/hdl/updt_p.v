// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="updt_p_updt_p,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=4.300000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.837000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=9615,HLS_SYN_LUT=7372,HLS_VERSION=2022_2}" *)

module updt_p (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        rp_time,
        M,
        qrznew_s_dout,
        qrznew_s_empty_n,
        qrznew_s_read,
        qrznew_peek_dout,
        qrznew_peek_empty_n,
        qrznew_peek_read,
        qz_s_dout,
        qz_s_empty_n,
        qz_s_read,
        qz_peek_dout,
        qz_peek_empty_n,
        qz_peek_read,
        qp_s_dout,
        qp_s_empty_n,
        qp_s_read,
        qp_peek_dout,
        qp_peek_empty_n,
        qp_peek_read,
        qp2m3_din,
        qp2m3_full_n,
        qp2m3_write,
        qout_din,
        qout_full_n,
        qout_write,
        q_gbc_s_dout,
        q_gbc_s_empty_n,
        q_gbc_s_read,
        q_gbc_peek_dout,
        q_gbc_peek_empty_n,
        q_gbc_peek_read,
        q_gbc_out_din,
        q_gbc_out_full_n,
        q_gbc_out_write
);

parameter    ap_ST_fsm_state1 = 37'd1;
parameter    ap_ST_fsm_state2 = 37'd2;
parameter    ap_ST_fsm_state3 = 37'd4;
parameter    ap_ST_fsm_state4 = 37'd8;
parameter    ap_ST_fsm_state5 = 37'd16;
parameter    ap_ST_fsm_state6 = 37'd32;
parameter    ap_ST_fsm_state7 = 37'd64;
parameter    ap_ST_fsm_state8 = 37'd128;
parameter    ap_ST_fsm_state9 = 37'd256;
parameter    ap_ST_fsm_state10 = 37'd512;
parameter    ap_ST_fsm_state11 = 37'd1024;
parameter    ap_ST_fsm_state12 = 37'd2048;
parameter    ap_ST_fsm_state13 = 37'd4096;
parameter    ap_ST_fsm_state14 = 37'd8192;
parameter    ap_ST_fsm_state15 = 37'd16384;
parameter    ap_ST_fsm_state16 = 37'd32768;
parameter    ap_ST_fsm_state17 = 37'd65536;
parameter    ap_ST_fsm_state18 = 37'd131072;
parameter    ap_ST_fsm_state19 = 37'd262144;
parameter    ap_ST_fsm_state20 = 37'd524288;
parameter    ap_ST_fsm_state21 = 37'd1048576;
parameter    ap_ST_fsm_state22 = 37'd2097152;
parameter    ap_ST_fsm_state23 = 37'd4194304;
parameter    ap_ST_fsm_state24 = 37'd8388608;
parameter    ap_ST_fsm_state25 = 37'd16777216;
parameter    ap_ST_fsm_state26 = 37'd33554432;
parameter    ap_ST_fsm_state27 = 37'd67108864;
parameter    ap_ST_fsm_state28 = 37'd134217728;
parameter    ap_ST_fsm_state29 = 37'd268435456;
parameter    ap_ST_fsm_state30 = 37'd536870912;
parameter    ap_ST_fsm_state31 = 37'd1073741824;
parameter    ap_ST_fsm_state32 = 37'd2147483648;
parameter    ap_ST_fsm_state33 = 37'd4294967296;
parameter    ap_ST_fsm_state34 = 37'd8589934592;
parameter    ap_ST_fsm_state35 = 37'd17179869184;
parameter    ap_ST_fsm_state36 = 37'd34359738368;
parameter    ap_ST_fsm_state37 = 37'd68719476736;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] rp_time;
input  [31:0] M;
input  [64:0] qrznew_s_dout;
input   qrznew_s_empty_n;
output   qrznew_s_read;
input  [64:0] qrznew_peek_dout;
input   qrznew_peek_empty_n;
output   qrznew_peek_read;
input  [512:0] qz_s_dout;
input   qz_s_empty_n;
output   qz_s_read;
input  [512:0] qz_peek_dout;
input   qz_peek_empty_n;
output   qz_peek_read;
input  [512:0] qp_s_dout;
input   qp_s_empty_n;
output   qp_s_read;
input  [512:0] qp_peek_dout;
input   qp_peek_empty_n;
output   qp_peek_read;
output  [512:0] qp2m3_din;
input   qp2m3_full_n;
output   qp2m3_write;
output  [512:0] qout_din;
input   qout_full_n;
output   qout_write;
input  [1:0] q_gbc_s_dout;
input   q_gbc_s_empty_n;
output   q_gbc_s_read;
input  [1:0] q_gbc_peek_dout;
input   q_gbc_peek_empty_n;
output   q_gbc_peek_read;
output  [1:0] q_gbc_out_din;
input   q_gbc_out_full_n;
output   q_gbc_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg qrznew_s_read;
reg qz_s_read;
reg qp_s_read;
reg qp2m3_write;
reg qout_write;
reg q_gbc_s_read;
reg q_gbc_out_write;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [36:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    qrznew_s_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] and_ln438_fu_282_p2;
reg    q_gbc_s_blk_n;
wire    ap_CS_fsm_state37;
reg    q_gbc_out_blk_n;
reg   [28:0] num_ite_reg_369;
wire   [63:0] trunc_ln85_fu_288_p1;
reg   [63:0] trunc_ln85_reg_377;
reg   [0:0] tmp_reg_382;
wire    ap_CS_fsm_state3;
wire   [63:0] rznew_fu_315_p1;
wire   [63:0] rzndo_1_fu_324_p3;
reg   [63:0] rzndo_1_reg_397;
wire    ap_CS_fsm_state33;
wire   [0:0] xor_ln438_fu_344_p2;
wire    grp_updt_p_Pipeline_cc_fu_230_ap_start;
wire    grp_updt_p_Pipeline_cc_fu_230_ap_done;
wire    grp_updt_p_Pipeline_cc_fu_230_ap_idle;
wire    grp_updt_p_Pipeline_cc_fu_230_ap_ready;
wire   [512:0] grp_updt_p_Pipeline_cc_fu_230_qout_din;
wire    grp_updt_p_Pipeline_cc_fu_230_qout_write;
wire    grp_updt_p_Pipeline_cc_fu_230_qz_s_read;
wire    grp_updt_p_Pipeline_cc_fu_230_qp_s_read;
wire   [512:0] grp_updt_p_Pipeline_cc_fu_230_qp2m3_din;
wire    grp_updt_p_Pipeline_cc_fu_230_qp2m3_write;
reg   [0:0] phi_ln438_reg_219;
reg    ap_block_state37;
reg    grp_updt_p_Pipeline_cc_fu_230_ap_start_reg;
wire    ap_CS_fsm_state34;
wire    ap_CS_fsm_state35;
reg   [31:0] rp_fu_92;
wire   [31:0] rp_3_fu_300_p2;
reg    ap_block_state2;
reg   [63:0] rzold_fu_96;
wire   [63:0] grp_fu_244_p0;
wire   [31:0] add_ln434_fu_248_p2;
wire   [0:0] icmp_ln438_fu_277_p2;
wire   [63:0] grp_fu_244_p2;
wire   [0:0] term_flag_fu_331_p1;
reg   [36:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
wire    ap_ST_fsm_state20_blk;
wire    ap_ST_fsm_state21_blk;
wire    ap_ST_fsm_state22_blk;
wire    ap_ST_fsm_state23_blk;
wire    ap_ST_fsm_state24_blk;
wire    ap_ST_fsm_state25_blk;
wire    ap_ST_fsm_state26_blk;
wire    ap_ST_fsm_state27_blk;
wire    ap_ST_fsm_state28_blk;
wire    ap_ST_fsm_state29_blk;
wire    ap_ST_fsm_state30_blk;
wire    ap_ST_fsm_state31_blk;
wire    ap_ST_fsm_state32_blk;
wire    ap_ST_fsm_state33_blk;
wire    ap_ST_fsm_state34_blk;
reg    ap_ST_fsm_state35_blk;
wire    ap_ST_fsm_state36_blk;
reg    ap_ST_fsm_state37_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 37'd1;
#0 grp_updt_p_Pipeline_cc_fu_230_ap_start_reg = 1'b0;
end

updt_p_updt_p_Pipeline_cc grp_updt_p_Pipeline_cc_fu_230(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_updt_p_Pipeline_cc_fu_230_ap_start),
    .ap_done(grp_updt_p_Pipeline_cc_fu_230_ap_done),
    .ap_idle(grp_updt_p_Pipeline_cc_fu_230_ap_idle),
    .ap_ready(grp_updt_p_Pipeline_cc_fu_230_ap_ready),
    .qout_din(grp_updt_p_Pipeline_cc_fu_230_qout_din),
    .qout_full_n(qout_full_n),
    .qout_write(grp_updt_p_Pipeline_cc_fu_230_qout_write),
    .sext_ln434(num_ite_reg_369),
    .qz_s_dout(qz_s_dout),
    .qz_s_empty_n(qz_s_empty_n),
    .qz_s_read(grp_updt_p_Pipeline_cc_fu_230_qz_s_read),
    .qp_s_dout(qp_s_dout),
    .qp_s_empty_n(qp_s_empty_n),
    .qp_s_read(grp_updt_p_Pipeline_cc_fu_230_qp_s_read),
    .qp2m3_din(grp_updt_p_Pipeline_cc_fu_230_qp2m3_din),
    .qp2m3_full_n(qp2m3_full_n),
    .qp2m3_write(grp_updt_p_Pipeline_cc_fu_230_qp2m3_write),
    .rzndo_1(rzndo_1_reg_397)
);

updt_p_ddiv_64ns_64ns_64_31_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 31 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
ddiv_64ns_64ns_64_31_no_dsp_1_U25(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_244_p0),
    .din1(rzold_fu_96),
    .ce(1'b1),
    .dout(grp_fu_244_p2)
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
        grp_updt_p_Pipeline_cc_fu_230_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state34)) begin
            grp_updt_p_Pipeline_cc_fu_230_ap_start_reg <= 1'b1;
        end else if ((grp_updt_p_Pipeline_cc_fu_230_ap_ready == 1'b1)) begin
            grp_updt_p_Pipeline_cc_fu_230_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((q_gbc_s_empty_n == 1'b0) | (q_gbc_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state37))) begin
        phi_ln438_reg_219 <= xor_ln438_fu_344_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        phi_ln438_reg_219 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        rp_fu_92 <= 32'd4294967295;
    end else if ((~((qrznew_s_empty_n == 1'b0) & (1'd1 == and_ln438_fu_282_p2)) & (1'b1 == ap_CS_fsm_state2) & (1'd1 == and_ln438_fu_282_p2))) begin
        rp_fu_92 <= rp_3_fu_300_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        rzold_fu_96 <= 64'd4607182418800017408;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        rzold_fu_96 <= rznew_fu_315_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        num_ite_reg_369 <= {{add_ln434_fu_248_p2[31:3]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state33)) begin
        rzndo_1_reg_397 <= rzndo_1_fu_324_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (1'd1 == and_ln438_fu_282_p2))) begin
        tmp_reg_382 <= rp_fu_92[32'd31];
        trunc_ln85_reg_377 <= trunc_ln85_fu_288_p1;
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state20_blk = 1'b0;

assign ap_ST_fsm_state21_blk = 1'b0;

assign ap_ST_fsm_state22_blk = 1'b0;

assign ap_ST_fsm_state23_blk = 1'b0;

assign ap_ST_fsm_state24_blk = 1'b0;

assign ap_ST_fsm_state25_blk = 1'b0;

assign ap_ST_fsm_state26_blk = 1'b0;

assign ap_ST_fsm_state27_blk = 1'b0;

assign ap_ST_fsm_state28_blk = 1'b0;

assign ap_ST_fsm_state29_blk = 1'b0;

always @ (*) begin
    if (((qrznew_s_empty_n == 1'b0) & (1'd1 == and_ln438_fu_282_p2))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state30_blk = 1'b0;

assign ap_ST_fsm_state31_blk = 1'b0;

assign ap_ST_fsm_state32_blk = 1'b0;

assign ap_ST_fsm_state33_blk = 1'b0;

assign ap_ST_fsm_state34_blk = 1'b0;

always @ (*) begin
    if ((grp_updt_p_Pipeline_cc_fu_230_ap_done == 1'b0)) begin
        ap_ST_fsm_state35_blk = 1'b1;
    end else begin
        ap_ST_fsm_state35_blk = 1'b0;
    end
end

assign ap_ST_fsm_state36_blk = 1'b0;

always @ (*) begin
    if (((q_gbc_s_empty_n == 1'b0) | (q_gbc_out_full_n == 1'b0))) begin
        ap_ST_fsm_state37_blk = 1'b1;
    end else begin
        ap_ST_fsm_state37_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((~((qrznew_s_empty_n == 1'b0) & (1'd1 == and_ln438_fu_282_p2)) & (1'b1 == ap_CS_fsm_state2) & (1'd0 == and_ln438_fu_282_p2))) begin
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
    if ((~((qrznew_s_empty_n == 1'b0) & (1'd1 == and_ln438_fu_282_p2)) & (1'b1 == ap_CS_fsm_state2) & (1'd0 == and_ln438_fu_282_p2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state37)) begin
        q_gbc_out_blk_n = q_gbc_out_full_n;
    end else begin
        q_gbc_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((q_gbc_s_empty_n == 1'b0) | (q_gbc_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state37))) begin
        q_gbc_out_write = 1'b1;
    end else begin
        q_gbc_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state37)) begin
        q_gbc_s_blk_n = q_gbc_s_empty_n;
    end else begin
        q_gbc_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((q_gbc_s_empty_n == 1'b0) | (q_gbc_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state37))) begin
        q_gbc_s_read = 1'b1;
    end else begin
        q_gbc_s_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state35)) begin
        qout_write = grp_updt_p_Pipeline_cc_fu_230_qout_write;
    end else begin
        qout_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state35)) begin
        qp2m3_write = grp_updt_p_Pipeline_cc_fu_230_qp2m3_write;
    end else begin
        qp2m3_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state35)) begin
        qp_s_read = grp_updt_p_Pipeline_cc_fu_230_qp_s_read;
    end else begin
        qp_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (1'd1 == and_ln438_fu_282_p2))) begin
        qrznew_s_blk_n = qrznew_s_empty_n;
    end else begin
        qrznew_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((qrznew_s_empty_n == 1'b0) & (1'd1 == and_ln438_fu_282_p2)) & (1'b1 == ap_CS_fsm_state2) & (1'd1 == and_ln438_fu_282_p2))) begin
        qrznew_s_read = 1'b1;
    end else begin
        qrznew_s_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state35)) begin
        qz_s_read = grp_updt_p_Pipeline_cc_fu_230_qz_s_read;
    end else begin
        qz_s_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((qrznew_s_empty_n == 1'b0) & (1'd1 == and_ln438_fu_282_p2)) & (1'b1 == ap_CS_fsm_state2) & (1'd0 == and_ln438_fu_282_p2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((qrznew_s_empty_n == 1'b0) & (1'd1 == and_ln438_fu_282_p2)) & (1'b1 == ap_CS_fsm_state2) & (1'd1 == and_ln438_fu_282_p2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
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
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state30;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state32;
        end
        ap_ST_fsm_state32 : begin
            ap_NS_fsm = ap_ST_fsm_state33;
        end
        ap_ST_fsm_state33 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state34 : begin
            ap_NS_fsm = ap_ST_fsm_state35;
        end
        ap_ST_fsm_state35 : begin
            if (((1'b1 == ap_CS_fsm_state35) & (grp_updt_p_Pipeline_cc_fu_230_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state36;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state35;
            end
        end
        ap_ST_fsm_state36 : begin
            ap_NS_fsm = ap_ST_fsm_state37;
        end
        ap_ST_fsm_state37 : begin
            if ((~((q_gbc_s_empty_n == 1'b0) | (q_gbc_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state37))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state37;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln434_fu_248_p2 = (M + 32'd7);

assign and_ln438_fu_282_p2 = (phi_ln438_reg_219 & icmp_ln438_fu_277_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state33 = ap_CS_fsm[32'd32];

assign ap_CS_fsm_state34 = ap_CS_fsm[32'd33];

assign ap_CS_fsm_state35 = ap_CS_fsm[32'd34];

assign ap_CS_fsm_state37 = ap_CS_fsm[32'd36];

always @ (*) begin
    ap_block_state2 = ((qrznew_s_empty_n == 1'b0) & (1'd1 == and_ln438_fu_282_p2));
end

always @ (*) begin
    ap_block_state37 = ((q_gbc_s_empty_n == 1'b0) | (q_gbc_out_full_n == 1'b0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_fu_244_p0 = trunc_ln85_reg_377;

assign grp_updt_p_Pipeline_cc_fu_230_ap_start = grp_updt_p_Pipeline_cc_fu_230_ap_start_reg;

assign icmp_ln438_fu_277_p2 = (($signed(rp_fu_92) < $signed(rp_time)) ? 1'b1 : 1'b0);

assign q_gbc_out_din = {{1'd0}, {term_flag_fu_331_p1}};

assign q_gbc_peek_read = 1'b0;

assign qout_din = grp_updt_p_Pipeline_cc_fu_230_qout_din;

assign qp2m3_din = grp_updt_p_Pipeline_cc_fu_230_qp2m3_din;

assign qp_peek_read = 1'b0;

assign qrznew_peek_read = 1'b0;

assign qz_peek_read = 1'b0;

assign rp_3_fu_300_p2 = (rp_fu_92 + 32'd1);

assign rzndo_1_fu_324_p3 = ((tmp_reg_382[0:0] == 1'b1) ? 64'd0 : grp_fu_244_p2);

assign rznew_fu_315_p1 = trunc_ln85_reg_377;

assign term_flag_fu_331_p1 = q_gbc_s_dout[0:0];

assign trunc_ln85_fu_288_p1 = qrznew_s_dout[63:0];

assign xor_ln438_fu_344_p2 = (term_flag_fu_331_p1 ^ 1'd1);

endmodule //updt_p