// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="read_A_read_A,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.430900,HLS_SYN_LAT=40036,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=132,HLS_SYN_LUT=346,HLS_VERSION=2022_2}" *)

module read_A (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        A_read_addr_din,
        A_read_addr_full_n,
        A_read_addr_write,
        A_read_data_s_dout,
        A_read_data_s_empty_n,
        A_read_data_s_read,
        A_read_data_peek_dout,
        A_read_data_peek_empty_n,
        A_read_data_peek_read,
        A_write_addr_din,
        A_write_addr_full_n,
        A_write_addr_write,
        A_write_data_din,
        A_write_data_full_n,
        A_write_data_write,
        A_write_resp_s_dout,
        A_write_resp_s_empty_n,
        A_write_resp_s_read,
        A_write_resp_peek_dout,
        A_write_resp_peek_empty_n,
        A_write_resp_peek_read,
        fifo_A_din,
        fifo_A_full_n,
        fifo_A_write,
        A_len,
        P_N
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [64:0] A_read_addr_din;
input   A_read_addr_full_n;
output   A_read_addr_write;
input  [512:0] A_read_data_s_dout;
input   A_read_data_s_empty_n;
output   A_read_data_s_read;
input  [512:0] A_read_data_peek_dout;
input   A_read_data_peek_empty_n;
output   A_read_data_peek_read;
output  [64:0] A_write_addr_din;
input   A_write_addr_full_n;
output   A_write_addr_write;
output  [512:0] A_write_data_din;
input   A_write_data_full_n;
output   A_write_data_write;
input  [8:0] A_write_resp_s_dout;
input   A_write_resp_s_empty_n;
output   A_write_resp_s_read;
input  [8:0] A_write_resp_peek_dout;
input   A_write_resp_peek_empty_n;
output   A_write_resp_peek_read;
output  [512:0] fifo_A_din;
input   fifo_A_full_n;
output   fifo_A_write;
input  [31:0] A_len;
input  [31:0] P_N;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg A_read_addr_write;
reg A_read_data_s_read;
reg fifo_A_write;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state4;
wire  signed [29:0] grp_fu_261_p2;
reg  signed [29:0] rp_time_N_reg_289;
wire    grp_read_A_Pipeline_rd_A_fu_166_ap_start;
wire    grp_read_A_Pipeline_rd_A_fu_166_ap_done;
wire    grp_read_A_Pipeline_rd_A_fu_166_ap_idle;
wire    grp_read_A_Pipeline_rd_A_fu_166_ap_ready;
wire   [512:0] grp_read_A_Pipeline_rd_A_fu_166_fifo_A_din;
wire    grp_read_A_Pipeline_rd_A_fu_166_fifo_A_write;
wire    grp_read_A_Pipeline_rd_A_fu_166_A_read_data_s_read;
wire   [64:0] grp_read_A_Pipeline_rd_A_fu_166_A_read_addr_din;
wire    grp_read_A_Pipeline_rd_A_fu_166_A_read_addr_write;
reg    grp_read_A_Pipeline_rd_A_fu_166_ap_start_reg;
wire    ap_CS_fsm_state5;
wire   [0:0] icmp_ln97_fu_245_p2;
wire    ap_CS_fsm_state6;
reg   [27:0] rp_fu_86;
wire   [27:0] rp_2_fu_250_p2;
wire   [15:0] N16_fu_181_p4;
wire   [0:0] icmp_ln93_fu_191_p2;
wire  signed [15:0] rp_time_fu_197_p3;
wire   [15:0] N_fu_177_p1;
wire   [16:0] zext_ln94_fu_209_p1;
wire   [16:0] add_ln95_fu_213_p2;
wire   [13:0] lshr_ln_fu_219_p4;
wire   [29:0] zext_ln97_fu_241_p1;
wire   [13:0] grp_fu_261_p1;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire   [29:0] grp_fu_261_p10;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_read_A_Pipeline_rd_A_fu_166_ap_start_reg = 1'b0;
end

read_A_read_A_Pipeline_rd_A grp_read_A_Pipeline_rd_A_fu_166(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_read_A_Pipeline_rd_A_fu_166_ap_start),
    .ap_done(grp_read_A_Pipeline_rd_A_fu_166_ap_done),
    .ap_idle(grp_read_A_Pipeline_rd_A_fu_166_ap_idle),
    .ap_ready(grp_read_A_Pipeline_rd_A_fu_166_ap_ready),
    .A_len(A_len),
    .fifo_A_din(grp_read_A_Pipeline_rd_A_fu_166_fifo_A_din),
    .fifo_A_full_n(fifo_A_full_n),
    .fifo_A_write(grp_read_A_Pipeline_rd_A_fu_166_fifo_A_write),
    .A_read_data_s_dout(A_read_data_s_dout),
    .A_read_data_s_empty_n(A_read_data_s_empty_n),
    .A_read_data_s_read(grp_read_A_Pipeline_rd_A_fu_166_A_read_data_s_read),
    .A_read_addr_din(grp_read_A_Pipeline_rd_A_fu_166_A_read_addr_din),
    .A_read_addr_full_n(A_read_addr_full_n),
    .A_read_addr_write(grp_read_A_Pipeline_rd_A_fu_166_A_read_addr_write)
);

read_A_mul_mul_16s_14ns_30_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 30 ))
mul_mul_16s_14ns_30_4_1_U5(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(rp_time_fu_197_p3),
    .din1(grp_fu_261_p1),
    .ce(1'b1),
    .dout(grp_fu_261_p2)
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
        grp_read_A_Pipeline_rd_A_fu_166_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln97_fu_245_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
            grp_read_A_Pipeline_rd_A_fu_166_ap_start_reg <= 1'b1;
        end else if ((grp_read_A_Pipeline_rd_A_fu_166_ap_ready == 1'b1)) begin
            grp_read_A_Pipeline_rd_A_fu_166_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        rp_fu_86 <= 28'd0;
    end else if (((icmp_ln97_fu_245_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        rp_fu_86 <= rp_2_fu_250_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        rp_time_N_reg_289 <= grp_fu_261_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        A_read_addr_write = grp_read_A_Pipeline_rd_A_fu_166_A_read_addr_write;
    end else begin
        A_read_addr_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        A_read_data_s_read = grp_read_A_Pipeline_rd_A_fu_166_A_read_data_s_read;
    end else begin
        A_read_data_s_read = 1'b0;
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

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_read_A_Pipeline_rd_A_fu_166_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln97_fu_245_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state5))) begin
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
    if (((icmp_ln97_fu_245_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        fifo_A_write = grp_read_A_Pipeline_rd_A_fu_166_fifo_A_write;
    end else begin
        fifo_A_write = 1'b0;
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
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((icmp_ln97_fu_245_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((grp_read_A_Pipeline_rd_A_fu_166_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign A_read_addr_din = grp_read_A_Pipeline_rd_A_fu_166_A_read_addr_din;

assign A_read_data_peek_read = 1'b0;

assign A_write_addr_din = 65'd0;

assign A_write_addr_write = 1'b0;

assign A_write_data_din = 513'd0;

assign A_write_data_write = 1'b0;

assign A_write_resp_peek_read = 1'b0;

assign A_write_resp_s_read = 1'b0;

assign N16_fu_181_p4 = {{P_N[31:16]}};

assign N_fu_177_p1 = P_N[15:0];

assign add_ln95_fu_213_p2 = (zext_ln94_fu_209_p1 + 17'd7);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign fifo_A_din = grp_read_A_Pipeline_rd_A_fu_166_fifo_A_din;

assign grp_fu_261_p1 = grp_fu_261_p10;

assign grp_fu_261_p10 = lshr_ln_fu_219_p4;

assign grp_read_A_Pipeline_rd_A_fu_166_ap_start = grp_read_A_Pipeline_rd_A_fu_166_ap_start_reg;

assign icmp_ln93_fu_191_p2 = ((N16_fu_181_p4 == 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln97_fu_245_p2 = (($signed(zext_ln97_fu_241_p1) < $signed(rp_time_N_reg_289)) ? 1'b1 : 1'b0);

assign lshr_ln_fu_219_p4 = {{add_ln95_fu_213_p2[16:3]}};

assign rp_2_fu_250_p2 = (rp_fu_86 + 28'd1);

assign rp_time_fu_197_p3 = ((icmp_ln93_fu_191_p2[0:0] == 1'b1) ? 16'd1 : N16_fu_181_p4);

assign zext_ln94_fu_209_p1 = N_fu_177_p1;

assign zext_ln97_fu_241_p1 = rp_fu_86;

endmodule //read_A