// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="inter_kernel_inter_kernel,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.430900,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=384,HLS_SYN_LUT=846,HLS_VERSION=2022_2}" *)

module inter_kernel (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a_read_addr_din,
        a_read_addr_full_n,
        a_read_addr_write,
        a_read_data_s_dout,
        a_read_data_s_empty_n,
        a_read_data_s_read,
        a_read_data_peek_dout,
        a_read_data_peek_empty_n,
        a_read_data_peek_read,
        a_write_addr_din,
        a_write_addr_full_n,
        a_write_addr_write,
        a_write_data_din,
        a_write_data_full_n,
        a_write_data_write,
        a_write_resp_s_dout,
        a_write_resp_s_empty_n,
        a_write_resp_s_read,
        a_write_resp_peek_dout,
        a_write_resp_peek_empty_n,
        a_write_resp_peek_read,
        b_read_addr_din,
        b_read_addr_full_n,
        b_read_addr_write,
        b_read_data_s_dout,
        b_read_data_s_empty_n,
        b_read_data_s_read,
        b_read_data_peek_dout,
        b_read_data_peek_empty_n,
        b_read_data_peek_read,
        b_write_addr_din,
        b_write_addr_full_n,
        b_write_addr_write,
        b_write_data_din,
        b_write_data_full_n,
        b_write_data_write,
        b_write_resp_s_dout,
        b_write_resp_s_empty_n,
        b_write_resp_s_read,
        b_write_resp_peek_dout,
        b_write_resp_peek_empty_n,
        b_write_resp_peek_read,
        stream_out_din,
        stream_out_full_n,
        stream_out_write,
        stream_in_s_dout,
        stream_in_s_empty_n,
        stream_in_s_read,
        stream_in_peek_dout,
        stream_in_peek_empty_n,
        stream_in_peek_read,
        iters
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
output  [64:0] a_read_addr_din;
input   a_read_addr_full_n;
output   a_read_addr_write;
input  [512:0] a_read_data_s_dout;
input   a_read_data_s_empty_n;
output   a_read_data_s_read;
input  [512:0] a_read_data_peek_dout;
input   a_read_data_peek_empty_n;
output   a_read_data_peek_read;
output  [64:0] a_write_addr_din;
input   a_write_addr_full_n;
output   a_write_addr_write;
output  [512:0] a_write_data_din;
input   a_write_data_full_n;
output   a_write_data_write;
input  [8:0] a_write_resp_s_dout;
input   a_write_resp_s_empty_n;
output   a_write_resp_s_read;
input  [8:0] a_write_resp_peek_dout;
input   a_write_resp_peek_empty_n;
output   a_write_resp_peek_read;
output  [64:0] b_read_addr_din;
input   b_read_addr_full_n;
output   b_read_addr_write;
input  [512:0] b_read_data_s_dout;
input   b_read_data_s_empty_n;
output   b_read_data_s_read;
input  [512:0] b_read_data_peek_dout;
input   b_read_data_peek_empty_n;
output   b_read_data_peek_read;
output  [64:0] b_write_addr_din;
input   b_write_addr_full_n;
output   b_write_addr_write;
output  [512:0] b_write_data_din;
input   b_write_data_full_n;
output   b_write_data_write;
input  [8:0] b_write_resp_s_dout;
input   b_write_resp_s_empty_n;
output   b_write_resp_s_read;
input  [8:0] b_write_resp_peek_dout;
input   b_write_resp_peek_empty_n;
output   b_write_resp_peek_read;
output  [512:0] stream_out_din;
input   stream_out_full_n;
output   stream_out_write;
input  [512:0] stream_in_s_dout;
input   stream_in_s_empty_n;
output   stream_in_s_read;
input  [512:0] stream_in_peek_dout;
input   stream_in_peek_empty_n;
output   stream_in_peek_read;
input  [31:0] iters;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg a_read_addr_write;
reg a_read_data_s_read;
reg a_write_addr_write;
reg a_write_data_write;
reg a_write_resp_s_read;
reg b_read_addr_write;
reg b_read_data_s_read;
reg b_write_addr_write;
reg b_write_data_write;
reg b_write_resp_s_read;
reg stream_out_write;
reg stream_in_s_read;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] trunc_ln130_fu_250_p1;
reg   [0:0] trunc_ln130_reg_282;
wire    ap_CS_fsm_state2;
wire   [31:0] i_2_fu_259_p2;
reg   [31:0] i_2_reg_289;
wire    grp_load_fu_218_ap_start;
wire    grp_load_fu_218_ap_done;
wire    grp_load_fu_218_ap_idle;
wire    grp_load_fu_218_ap_ready;
wire   [64:0] grp_load_fu_218_b_read_addr_din;
reg    grp_load_fu_218_b_read_addr_full_n;
wire    grp_load_fu_218_b_read_addr_write;
reg   [512:0] grp_load_fu_218_b_read_data_s_dout;
reg    grp_load_fu_218_b_read_data_s_empty_n;
wire    grp_load_fu_218_b_read_data_s_read;
wire   [64:0] grp_load_fu_218_a_write_addr_din;
reg    grp_load_fu_218_a_write_addr_full_n;
wire    grp_load_fu_218_a_write_addr_write;
wire   [512:0] grp_load_fu_218_a_write_data_din;
reg    grp_load_fu_218_a_write_data_full_n;
wire    grp_load_fu_218_a_write_data_write;
reg   [8:0] grp_load_fu_218_a_write_resp_s_dout;
reg    grp_load_fu_218_a_write_resp_s_empty_n;
wire    grp_load_fu_218_a_write_resp_s_read;
wire   [512:0] grp_load_fu_218_stream_out_din;
wire    grp_load_fu_218_stream_out_write;
wire    grp_load_fu_218_stream_in_s_read;
reg    grp_load_fu_218_ap_start_reg;
wire   [0:0] icmp_ln130_fu_254_p2;
wire    ap_CS_fsm_state3;
reg   [31:0] i_fu_72;
reg    ap_block_state3_on_subcall_done;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 grp_load_fu_218_ap_start_reg = 1'b0;
end

inter_kernel_load grp_load_fu_218(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_load_fu_218_ap_start),
    .ap_done(grp_load_fu_218_ap_done),
    .ap_idle(grp_load_fu_218_ap_idle),
    .ap_ready(grp_load_fu_218_ap_ready),
    .b_read_addr_din(grp_load_fu_218_b_read_addr_din),
    .b_read_addr_full_n(grp_load_fu_218_b_read_addr_full_n),
    .b_read_addr_write(grp_load_fu_218_b_read_addr_write),
    .b_read_data_s_dout(grp_load_fu_218_b_read_data_s_dout),
    .b_read_data_s_empty_n(grp_load_fu_218_b_read_data_s_empty_n),
    .b_read_data_s_read(grp_load_fu_218_b_read_data_s_read),
    .a_write_addr_din(grp_load_fu_218_a_write_addr_din),
    .a_write_addr_full_n(grp_load_fu_218_a_write_addr_full_n),
    .a_write_addr_write(grp_load_fu_218_a_write_addr_write),
    .a_write_data_din(grp_load_fu_218_a_write_data_din),
    .a_write_data_full_n(grp_load_fu_218_a_write_data_full_n),
    .a_write_data_write(grp_load_fu_218_a_write_data_write),
    .a_write_resp_s_dout(grp_load_fu_218_a_write_resp_s_dout),
    .a_write_resp_s_empty_n(grp_load_fu_218_a_write_resp_s_empty_n),
    .a_write_resp_s_read(grp_load_fu_218_a_write_resp_s_read),
    .stream_out_din(grp_load_fu_218_stream_out_din),
    .stream_out_full_n(stream_out_full_n),
    .stream_out_write(grp_load_fu_218_stream_out_write),
    .stream_in_s_dout(stream_in_s_dout),
    .stream_in_s_empty_n(stream_in_s_empty_n),
    .stream_in_s_read(grp_load_fu_218_stream_in_s_read),
    .iters(iters)
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
        grp_load_fu_218_ap_start_reg <= 1'b0;
    end else begin
        if ((((trunc_ln130_fu_250_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln130_fu_254_p2 == 1'd0)) | ((trunc_ln130_fu_250_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln130_fu_254_p2 == 1'd0)))) begin
            grp_load_fu_218_ap_start_reg <= 1'b1;
        end else if ((grp_load_fu_218_ap_ready == 1'b1)) begin
            grp_load_fu_218_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_fu_72 <= 32'd0;
    end else if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
        i_fu_72 <= i_2_reg_289;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_2_reg_289 <= i_2_fu_259_p2;
        trunc_ln130_reg_282 <= trunc_ln130_fu_250_p1;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        a_read_addr_write = grp_load_fu_218_b_read_addr_write;
    end else begin
        a_read_addr_write = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        a_read_data_s_read = grp_load_fu_218_b_read_data_s_read;
    end else begin
        a_read_data_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        a_write_addr_write = grp_load_fu_218_a_write_addr_write;
    end else begin
        a_write_addr_write = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        a_write_data_write = grp_load_fu_218_a_write_data_write;
    end else begin
        a_write_data_write = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        a_write_resp_s_read = grp_load_fu_218_a_write_resp_s_read;
    end else begin
        a_write_resp_s_read = 1'b0;
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
    if ((1'b1 == ap_block_state3_on_subcall_done)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln130_fu_254_p2 == 1'd1))) begin
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
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln130_fu_254_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        b_read_addr_write = grp_load_fu_218_b_read_addr_write;
    end else begin
        b_read_addr_write = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        b_read_data_s_read = grp_load_fu_218_b_read_data_s_read;
    end else begin
        b_read_data_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        b_write_addr_write = grp_load_fu_218_a_write_addr_write;
    end else begin
        b_write_addr_write = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        b_write_data_write = grp_load_fu_218_a_write_data_write;
    end else begin
        b_write_data_write = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln130_reg_282 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        b_write_resp_s_read = grp_load_fu_218_a_write_resp_s_read;
    end else begin
        b_write_resp_s_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        if ((trunc_ln130_reg_282 == 1'd1)) begin
            grp_load_fu_218_a_write_addr_full_n = a_write_addr_full_n;
        end else if ((trunc_ln130_reg_282 == 1'd0)) begin
            grp_load_fu_218_a_write_addr_full_n = b_write_addr_full_n;
        end else begin
            grp_load_fu_218_a_write_addr_full_n = a_write_addr_full_n;
        end
    end else begin
        grp_load_fu_218_a_write_addr_full_n = a_write_addr_full_n;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        if ((trunc_ln130_reg_282 == 1'd1)) begin
            grp_load_fu_218_a_write_data_full_n = a_write_data_full_n;
        end else if ((trunc_ln130_reg_282 == 1'd0)) begin
            grp_load_fu_218_a_write_data_full_n = b_write_data_full_n;
        end else begin
            grp_load_fu_218_a_write_data_full_n = a_write_data_full_n;
        end
    end else begin
        grp_load_fu_218_a_write_data_full_n = a_write_data_full_n;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        if ((trunc_ln130_reg_282 == 1'd1)) begin
            grp_load_fu_218_a_write_resp_s_dout = a_write_resp_s_dout;
        end else if ((trunc_ln130_reg_282 == 1'd0)) begin
            grp_load_fu_218_a_write_resp_s_dout = b_write_resp_s_dout;
        end else begin
            grp_load_fu_218_a_write_resp_s_dout = a_write_resp_s_dout;
        end
    end else begin
        grp_load_fu_218_a_write_resp_s_dout = a_write_resp_s_dout;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        if ((trunc_ln130_reg_282 == 1'd1)) begin
            grp_load_fu_218_a_write_resp_s_empty_n = a_write_resp_s_empty_n;
        end else if ((trunc_ln130_reg_282 == 1'd0)) begin
            grp_load_fu_218_a_write_resp_s_empty_n = b_write_resp_s_empty_n;
        end else begin
            grp_load_fu_218_a_write_resp_s_empty_n = a_write_resp_s_empty_n;
        end
    end else begin
        grp_load_fu_218_a_write_resp_s_empty_n = a_write_resp_s_empty_n;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        if ((trunc_ln130_reg_282 == 1'd1)) begin
            grp_load_fu_218_b_read_addr_full_n = b_read_addr_full_n;
        end else if ((trunc_ln130_reg_282 == 1'd0)) begin
            grp_load_fu_218_b_read_addr_full_n = a_read_addr_full_n;
        end else begin
            grp_load_fu_218_b_read_addr_full_n = b_read_addr_full_n;
        end
    end else begin
        grp_load_fu_218_b_read_addr_full_n = b_read_addr_full_n;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        if ((trunc_ln130_reg_282 == 1'd1)) begin
            grp_load_fu_218_b_read_data_s_dout = b_read_data_s_dout;
        end else if ((trunc_ln130_reg_282 == 1'd0)) begin
            grp_load_fu_218_b_read_data_s_dout = a_read_data_s_dout;
        end else begin
            grp_load_fu_218_b_read_data_s_dout = b_read_data_s_dout;
        end
    end else begin
        grp_load_fu_218_b_read_data_s_dout = b_read_data_s_dout;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        if ((trunc_ln130_reg_282 == 1'd1)) begin
            grp_load_fu_218_b_read_data_s_empty_n = b_read_data_s_empty_n;
        end else if ((trunc_ln130_reg_282 == 1'd0)) begin
            grp_load_fu_218_b_read_data_s_empty_n = a_read_data_s_empty_n;
        end else begin
            grp_load_fu_218_b_read_data_s_empty_n = b_read_data_s_empty_n;
        end
    end else begin
        grp_load_fu_218_b_read_data_s_empty_n = b_read_data_s_empty_n;
    end
end

always @ (*) begin
    if ((((trunc_ln130_reg_282 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) | ((trunc_ln130_reg_282 == 1'd0) & (1'b1 == ap_CS_fsm_state3)))) begin
        stream_in_s_read = grp_load_fu_218_stream_in_s_read;
    end else begin
        stream_in_s_read = 1'b0;
    end
end

always @ (*) begin
    if ((((trunc_ln130_reg_282 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) | ((trunc_ln130_reg_282 == 1'd0) & (1'b1 == ap_CS_fsm_state3)))) begin
        stream_out_write = grp_load_fu_218_stream_out_write;
    end else begin
        stream_out_write = 1'b0;
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
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln130_fu_254_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b0 == ap_block_state3_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_read_addr_din = grp_load_fu_218_b_read_addr_din;

assign a_read_data_peek_read = 1'b0;

assign a_write_addr_din = grp_load_fu_218_a_write_addr_din;

assign a_write_data_din = grp_load_fu_218_a_write_data_din;

assign a_write_resp_peek_read = 1'b0;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state3_on_subcall_done = (((trunc_ln130_reg_282 == 1'd1) & (grp_load_fu_218_ap_done == 1'b0)) | ((trunc_ln130_reg_282 == 1'd0) & (grp_load_fu_218_ap_done == 1'b0)));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign b_read_addr_din = grp_load_fu_218_b_read_addr_din;

assign b_read_data_peek_read = 1'b0;

assign b_write_addr_din = grp_load_fu_218_a_write_addr_din;

assign b_write_data_din = grp_load_fu_218_a_write_data_din;

assign b_write_resp_peek_read = 1'b0;

assign grp_load_fu_218_ap_start = grp_load_fu_218_ap_start_reg;

assign i_2_fu_259_p2 = (i_fu_72 + 32'd1);

assign icmp_ln130_fu_254_p2 = ((i_fu_72 == iters) ? 1'b1 : 1'b0);

assign stream_in_peek_read = 1'b0;

assign stream_out_din = grp_load_fu_218_stream_out_din;

assign trunc_ln130_fu_250_p1 = i_fu_72[0:0];

endmodule //inter_kernel