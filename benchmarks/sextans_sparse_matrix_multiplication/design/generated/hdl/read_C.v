// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="read_C_read_C,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.430900,HLS_SYN_LAT=2000036,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=153,HLS_SYN_LUT=391,HLS_VERSION=2022_2}" *)

module read_C (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        C_read_addr_din,
        C_read_addr_full_n,
        C_read_addr_write,
        C_read_data_s_dout,
        C_read_data_s_empty_n,
        C_read_data_s_read,
        C_read_data_peek_dout,
        C_read_data_peek_empty_n,
        C_read_data_peek_read,
        C_write_addr_din,
        C_write_addr_full_n,
        C_write_addr_write,
        C_write_data_din,
        C_write_data_full_n,
        C_write_data_write,
        C_write_resp_s_dout,
        C_write_resp_s_empty_n,
        C_write_resp_s_read,
        C_write_resp_peek_dout,
        C_write_resp_peek_empty_n,
        C_write_resp_peek_read,
        fifo_C_din,
        fifo_C_full_n,
        fifo_C_write,
        M,
        P_N,
        wrC_inst_din,
        wrC_inst_full_n,
        wrC_inst_write
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
output  [64:0] C_read_addr_din;
input   C_read_addr_full_n;
output   C_read_addr_write;
input  [512:0] C_read_data_s_dout;
input   C_read_data_s_empty_n;
output   C_read_data_s_read;
input  [512:0] C_read_data_peek_dout;
input   C_read_data_peek_empty_n;
output   C_read_data_peek_read;
output  [64:0] C_write_addr_din;
input   C_write_addr_full_n;
output   C_write_addr_write;
output  [512:0] C_write_data_din;
input   C_write_data_full_n;
output   C_write_data_write;
input  [8:0] C_write_resp_s_dout;
input   C_write_resp_s_empty_n;
output   C_write_resp_s_read;
input  [8:0] C_write_resp_peek_dout;
input   C_write_resp_peek_empty_n;
output   C_write_resp_peek_read;
output  [512:0] fifo_C_din;
input   fifo_C_full_n;
output   fifo_C_write;
input  [31:0] M;
input  [31:0] P_N;
output  [32:0] wrC_inst_din;
input   wrC_inst_full_n;
output   wrC_inst_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg C_read_addr_write;
reg C_read_data_s_read;
reg fifo_C_write;
reg[32:0] wrC_inst_din;
reg wrC_inst_write;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    wrC_inst_blk_n;
wire    ap_CS_fsm_state2;
reg   [15:0] N16_reg_341;
wire   [15:0] rp_time_fu_293_p3;
reg   [15:0] rp_time_reg_357;
wire    ap_CS_fsm_state4;
wire  signed [31:0] grp_fu_323_p2;
reg   [31:0] num_ite_C_reg_362;
wire    grp_read_C_Pipeline_rd_C_fu_197_ap_start;
wire    grp_read_C_Pipeline_rd_C_fu_197_ap_done;
wire    grp_read_C_Pipeline_rd_C_fu_197_ap_idle;
wire    grp_read_C_Pipeline_rd_C_fu_197_ap_ready;
wire   [512:0] grp_read_C_Pipeline_rd_C_fu_197_fifo_C_din;
wire    grp_read_C_Pipeline_rd_C_fu_197_fifo_C_write;
wire    grp_read_C_Pipeline_rd_C_fu_197_C_read_data_s_read;
wire   [64:0] grp_read_C_Pipeline_rd_C_fu_197_C_read_addr_din;
wire    grp_read_C_Pipeline_rd_C_fu_197_C_read_addr_write;
reg    grp_read_C_Pipeline_rd_C_fu_197_ap_start_reg;
wire    ap_CS_fsm_state5;
wire   [0:0] icmp_ln107_fu_307_p2;
wire    ap_CS_fsm_state6;
reg   [14:0] rp_fu_102;
wire   [14:0] rp_2_fu_312_p2;
reg    ap_block_state1;
wire   [32:0] p_s_fu_212_p3;
wire   [32:0] p_0_fu_280_p3;
wire   [15:0] N_fu_208_p1;
wire   [31:0] add_ln105_fu_235_p2;
wire  signed [27:0] trunc_ln_fu_241_p4;
wire   [16:0] zext_ln104_fu_231_p1;
wire   [16:0] add_ln105_1_fu_255_p2;
wire   [13:0] lshr_ln_fu_261_p4;
wire   [0:0] icmp_ln103_fu_288_p2;
wire   [15:0] zext_ln107_fu_303_p1;
wire   [13:0] grp_fu_323_p0;
reg    grp_fu_323_ce;
wire    ap_CS_fsm_state3;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire   [31:0] grp_fu_323_p00;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_read_C_Pipeline_rd_C_fu_197_ap_start_reg = 1'b0;
end

read_C_read_C_Pipeline_rd_C grp_read_C_Pipeline_rd_C_fu_197(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_read_C_Pipeline_rd_C_fu_197_ap_start),
    .ap_done(grp_read_C_Pipeline_rd_C_fu_197_ap_done),
    .ap_idle(grp_read_C_Pipeline_rd_C_fu_197_ap_idle),
    .ap_ready(grp_read_C_Pipeline_rd_C_fu_197_ap_ready),
    .num_ite_C(num_ite_C_reg_362),
    .fifo_C_din(grp_read_C_Pipeline_rd_C_fu_197_fifo_C_din),
    .fifo_C_full_n(fifo_C_full_n),
    .fifo_C_write(grp_read_C_Pipeline_rd_C_fu_197_fifo_C_write),
    .C_read_data_s_dout(C_read_data_s_dout),
    .C_read_data_s_empty_n(C_read_data_s_empty_n),
    .C_read_data_s_read(grp_read_C_Pipeline_rd_C_fu_197_C_read_data_s_read),
    .C_read_addr_din(grp_read_C_Pipeline_rd_C_fu_197_C_read_addr_din),
    .C_read_addr_full_n(C_read_addr_full_n),
    .C_read_addr_write(grp_read_C_Pipeline_rd_C_fu_197_C_read_addr_write)
);

read_C_mul_mul_14ns_28s_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 14 ),
    .din1_WIDTH( 28 ),
    .dout_WIDTH( 32 ))
mul_mul_14ns_28s_32_4_1_U5(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_323_p0),
    .din1(trunc_ln_fu_241_p4),
    .ce(grp_fu_323_ce),
    .dout(grp_fu_323_p2)
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
        grp_read_C_Pipeline_rd_C_fu_197_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln107_fu_307_p2 == 1'd1))) begin
            grp_read_C_Pipeline_rd_C_fu_197_ap_start_reg <= 1'b1;
        end else if ((grp_read_C_Pipeline_rd_C_fu_197_ap_ready == 1'b1)) begin
            grp_read_C_Pipeline_rd_C_fu_197_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((wrC_inst_full_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        rp_fu_102 <= 15'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln107_fu_307_p2 == 1'd1))) begin
        rp_fu_102 <= rp_2_fu_312_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        N16_reg_341 <= {{P_N[31:16]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        num_ite_C_reg_362 <= grp_fu_323_p2;
        rp_time_reg_357 <= rp_time_fu_293_p3;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        C_read_addr_write = grp_read_C_Pipeline_rd_C_fu_197_C_read_addr_write;
    end else begin
        C_read_addr_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        C_read_data_s_read = grp_read_C_Pipeline_rd_C_fu_197_C_read_data_s_read;
    end else begin
        C_read_data_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((wrC_inst_full_n == 1'b0) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((wrC_inst_full_n == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_read_C_Pipeline_rd_C_fu_197_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln107_fu_307_p2 == 1'd0))) begin
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
    if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln107_fu_307_p2 == 1'd0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        fifo_C_write = grp_read_C_Pipeline_rd_C_fu_197_fifo_C_write;
    end else begin
        fifo_C_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | ((wrC_inst_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state2)) | (~((wrC_inst_full_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        grp_fu_323_ce = 1'b1;
    end else begin
        grp_fu_323_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        wrC_inst_blk_n = wrC_inst_full_n;
    end else begin
        wrC_inst_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((wrC_inst_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        wrC_inst_din = p_0_fu_280_p3;
    end else if ((~((wrC_inst_full_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        wrC_inst_din = p_s_fu_212_p3;
    end else begin
        wrC_inst_din = 'bx;
    end
end

always @ (*) begin
    if ((((wrC_inst_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state2)) | (~((wrC_inst_full_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        wrC_inst_write = 1'b1;
    end else begin
        wrC_inst_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((wrC_inst_full_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((wrC_inst_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln107_fu_307_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((grp_read_C_Pipeline_rd_C_fu_197_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
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

assign C_read_addr_din = grp_read_C_Pipeline_rd_C_fu_197_C_read_addr_din;

assign C_read_data_peek_read = 1'b0;

assign C_write_addr_din = 65'd0;

assign C_write_addr_write = 1'b0;

assign C_write_data_din = 513'd0;

assign C_write_data_write = 1'b0;

assign C_write_resp_peek_read = 1'b0;

assign C_write_resp_s_read = 1'b0;

assign N_fu_208_p1 = P_N[15:0];

assign add_ln105_1_fu_255_p2 = (zext_ln104_fu_231_p1 + 17'd7);

assign add_ln105_fu_235_p2 = (M + 32'd15);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state1 = ((wrC_inst_full_n == 1'b0) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign fifo_C_din = grp_read_C_Pipeline_rd_C_fu_197_fifo_C_din;

assign grp_fu_323_p0 = grp_fu_323_p00;

assign grp_fu_323_p00 = lshr_ln_fu_261_p4;

assign grp_read_C_Pipeline_rd_C_fu_197_ap_start = grp_read_C_Pipeline_rd_C_fu_197_ap_start_reg;

assign icmp_ln103_fu_288_p2 = ((N16_reg_341 == 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln107_fu_307_p2 = (($signed(zext_ln107_fu_303_p1) < $signed(rp_time_reg_357)) ? 1'b1 : 1'b0);

assign lshr_ln_fu_261_p4 = {{add_ln105_1_fu_255_p2[16:3]}};

assign p_0_fu_280_p3 = {{1'd0}, {P_N}};

assign p_s_fu_212_p3 = {{1'd0}, {M}};

assign rp_2_fu_312_p2 = (rp_fu_102 + 15'd1);

assign rp_time_fu_293_p3 = ((icmp_ln103_fu_288_p2[0:0] == 1'b1) ? 16'd1 : N16_reg_341);

assign trunc_ln_fu_241_p4 = {{add_ln105_fu_235_p2[31:4]}};

assign zext_ln104_fu_231_p1 = N_fu_208_p1;

assign zext_ln107_fu_303_p1 = rp_fu_102;

endmodule //read_C