// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module duplicator_duplicator_Pipeline_cc (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        q_in_s_dout,
        q_in_s_empty_n,
        q_in_s_read,
        q_out1_din,
        q_out1_full_n,
        q_out1_write,
        q_out2_din,
        q_out2_full_n,
        q_out2_write
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [512:0] q_in_s_dout;
input   q_in_s_empty_n;
output   q_in_s_read;
output  [512:0] q_out1_din;
input   q_out1_full_n;
output   q_out1_write;
output  [512:0] q_out2_din;
input   q_out2_full_n;
output   q_out2_write;

reg ap_done;
reg ap_idle;
reg q_in_s_read;
reg q_out1_write;
reg q_out2_write;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [63:0] tmp_4_fu_170_p4;
wire    ap_CS_fsm_state2;
wire   [0:0] and_ln435_fu_152_p2;
wire   [63:0] tmp_5_fu_181_p4;
wire   [63:0] tmp_6_fu_192_p4;
wire   [63:0] tmp_7_fu_203_p4;
wire   [0:0] tmp_nbreadreq_fu_62_p3;
wire   [512:0] p_0_fu_224_p8;
wire   [0:0] and_ln435_1_fu_146_p0;
wire   [0:0] and_ln435_1_fu_146_p1;
wire   [0:0] and_ln435_1_fu_146_p2;
wire   [191:0] tmp_8_fu_214_p4;
wire   [63:0] elem_val_M_elems_fu_166_p1;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if (((1'd1 == and_ln435_fu_152_p2) & (q_in_s_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        q_in_s_read = 1'b1;
    end else begin
        q_in_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln435_fu_152_p2) & (q_out1_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        q_out1_write = 1'b1;
    end else begin
        q_out1_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln435_fu_152_p2) & (q_out2_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        q_out2_write = 1'b1;
    end else begin
        q_out2_write = 1'b0;
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
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln435_1_fu_146_p0 = q_out1_full_n;

assign and_ln435_1_fu_146_p1 = q_out2_full_n;

assign and_ln435_1_fu_146_p2 = (and_ln435_1_fu_146_p1 & and_ln435_1_fu_146_p0);

assign and_ln435_fu_152_p2 = (tmp_nbreadreq_fu_62_p3 & and_ln435_1_fu_146_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_ready = 1'b0;

assign elem_val_M_elems_fu_166_p1 = q_in_s_dout[63:0];

assign p_0_fu_224_p8 = {{{{{{{{{{{{1'd0}, {tmp_8_fu_214_p4}}}, {tmp_7_fu_203_p4}}}, {tmp_6_fu_192_p4}}}, {tmp_5_fu_181_p4}}}, {tmp_4_fu_170_p4}}}, {elem_val_M_elems_fu_166_p1}};

assign q_out1_din = p_0_fu_224_p8;

assign q_out2_din = p_0_fu_224_p8;

assign tmp_4_fu_170_p4 = {{q_in_s_dout[127:64]}};

assign tmp_5_fu_181_p4 = {{q_in_s_dout[191:128]}};

assign tmp_6_fu_192_p4 = {{q_in_s_dout[255:192]}};

assign tmp_7_fu_203_p4 = {{q_in_s_dout[319:256]}};

assign tmp_8_fu_214_p4 = {{q_in_s_dout[511:320]}};

assign tmp_nbreadreq_fu_62_p3 = q_in_s_empty_n;

endmodule //duplicator_duplicator_Pipeline_cc
