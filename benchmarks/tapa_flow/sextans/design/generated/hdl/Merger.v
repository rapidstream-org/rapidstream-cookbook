// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="Merger_Merger,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.430900,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=6,HLS_SYN_LUT=69,HLS_VERSION=2022_2}" *)

module Merger (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        fifo_in_0_dout,
        fifo_in_0_empty_n,
        fifo_in_0_read,
        fifo_in_1_dout,
        fifo_in_1_empty_n,
        fifo_in_1_read,
        fifo_in_peek_0_dout,
        fifo_in_peek_0_empty_n,
        fifo_in_peek_0_read,
        fifo_in_peek_1_dout,
        fifo_in_peek_1_empty_n,
        fifo_in_peek_1_read,
        fifo_out_din,
        fifo_out_full_n,
        fifo_out_write
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [256:0] fifo_in_0_dout;
input   fifo_in_0_empty_n;
output   fifo_in_0_read;
input  [256:0] fifo_in_1_dout;
input   fifo_in_1_empty_n;
output   fifo_in_1_read;
input  [256:0] fifo_in_peek_0_dout;
input   fifo_in_peek_0_empty_n;
output   fifo_in_peek_0_read;
input  [256:0] fifo_in_peek_1_dout;
input   fifo_in_peek_1_empty_n;
output   fifo_in_peek_1_read;
output  [512:0] fifo_out_din;
input   fifo_out_full_n;
output   fifo_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg fifo_in_0_read;
reg fifo_in_1_read;
reg fifo_out_write;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_start;
wire    grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_done;
wire    grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_idle;
wire    grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_ready;
wire   [512:0] grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_out_din;
wire    grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_out_write;
wire    grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_in_0_read;
wire    grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_in_1_read;
reg    grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_start_reg = 1'b0;
end

Merger_Merger_Pipeline_VITIS_LOOP_410_1 grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_start),
    .ap_done(grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_done),
    .ap_idle(grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_idle),
    .ap_ready(grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_ready),
    .fifo_out_din(grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_out_din),
    .fifo_out_full_n(fifo_out_full_n),
    .fifo_out_write(grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_out_write),
    .fifo_in_0_dout(fifo_in_0_dout),
    .fifo_in_0_empty_n(fifo_in_0_empty_n),
    .fifo_in_0_read(grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_in_0_read),
    .fifo_in_1_dout(fifo_in_1_dout),
    .fifo_in_1_empty_n(fifo_in_1_empty_n),
    .fifo_in_1_read(grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_in_1_read)
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
        grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_start_reg <= 1'b1;
        end else if ((grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_ready == 1'b1)) begin
            grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_start_reg <= 1'b0;
        end
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
    if ((grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
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
    if (((grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fifo_in_0_read = grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_in_0_read;
    end else begin
        fifo_in_0_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fifo_in_1_read = grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_in_1_read;
    end else begin
        fifo_in_1_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fifo_out_write = grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_out_write;
    end else begin
        fifo_out_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign fifo_in_peek_0_read = 1'b0;

assign fifo_in_peek_1_read = 1'b0;

assign fifo_out_din = grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_fifo_out_din;

assign grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_start = grp_Merger_Pipeline_VITIS_LOOP_410_1_fu_76_ap_start_reg;

endmodule //Merger