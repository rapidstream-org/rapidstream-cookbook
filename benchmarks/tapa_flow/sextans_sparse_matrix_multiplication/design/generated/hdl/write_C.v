// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="write_C_write_C,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.414450,HLS_SYN_LAT=2000038,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=197,HLS_SYN_LUT=448,HLS_VERSION=2022_2}" *)

module write_C (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        wrC_inst_s_dout,
        wrC_inst_s_empty_n,
        wrC_inst_s_read,
        wrC_inst_peek_dout,
        wrC_inst_peek_empty_n,
        wrC_inst_peek_read,
        fifo_C_s_dout,
        fifo_C_s_empty_n,
        fifo_C_s_read,
        fifo_C_peek_dout,
        fifo_C_peek_empty_n,
        fifo_C_peek_read,
        C_out_read_addr_din,
        C_out_read_addr_full_n,
        C_out_read_addr_write,
        C_out_read_data_s_dout,
        C_out_read_data_s_empty_n,
        C_out_read_data_s_read,
        C_out_read_data_peek_dout,
        C_out_read_data_peek_empty_n,
        C_out_read_data_peek_read,
        C_out_write_addr_din,
        C_out_write_addr_full_n,
        C_out_write_addr_write,
        C_out_write_data_din,
        C_out_write_data_full_n,
        C_out_write_data_write,
        C_out_write_resp_s_dout,
        C_out_write_resp_s_empty_n,
        C_out_write_resp_s_read,
        C_out_write_resp_peek_dout,
        C_out_write_resp_peek_empty_n,
        C_out_write_resp_peek_read
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
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [32:0] wrC_inst_s_dout;
input   wrC_inst_s_empty_n;
output   wrC_inst_s_read;
input  [32:0] wrC_inst_peek_dout;
input   wrC_inst_peek_empty_n;
output   wrC_inst_peek_read;
input  [512:0] fifo_C_s_dout;
input   fifo_C_s_empty_n;
output   fifo_C_s_read;
input  [512:0] fifo_C_peek_dout;
input   fifo_C_peek_empty_n;
output   fifo_C_peek_read;
output  [64:0] C_out_read_addr_din;
input   C_out_read_addr_full_n;
output   C_out_read_addr_write;
input  [512:0] C_out_read_data_s_dout;
input   C_out_read_data_s_empty_n;
output   C_out_read_data_s_read;
input  [512:0] C_out_read_data_peek_dout;
input   C_out_read_data_peek_empty_n;
output   C_out_read_data_peek_read;
output  [64:0] C_out_write_addr_din;
input   C_out_write_addr_full_n;
output   C_out_write_addr_write;
output  [512:0] C_out_write_data_din;
input   C_out_write_data_full_n;
output   C_out_write_data_write;
input  [8:0] C_out_write_resp_s_dout;
input   C_out_write_resp_s_empty_n;
output   C_out_write_resp_s_read;
input  [8:0] C_out_write_resp_peek_dout;
input   C_out_write_resp_peek_empty_n;
output   C_out_write_resp_peek_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg wrC_inst_s_read;
reg fifo_C_s_read;
reg C_out_write_addr_write;
reg C_out_write_data_write;
reg C_out_write_resp_s_read;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    wrC_inst_s_blk_n;
wire    ap_CS_fsm_state2;
reg  signed [27:0] trunc_ln_reg_318;
reg   [15:0] N16_reg_323;
reg   [13:0] lshr_ln_reg_329;
wire    ap_CS_fsm_state3;
wire   [15:0] rp_time_fu_275_p3;
reg   [15:0] rp_time_reg_344;
wire    ap_CS_fsm_state6;
wire  signed [31:0] grp_fu_305_p2;
reg   [31:0] num_ite_C_reg_349;
wire    grp_write_C_Pipeline_wr_C_fu_192_ap_start;
wire    grp_write_C_Pipeline_wr_C_fu_192_ap_done;
wire    grp_write_C_Pipeline_wr_C_fu_192_ap_idle;
wire    grp_write_C_Pipeline_wr_C_fu_192_ap_ready;
wire    grp_write_C_Pipeline_wr_C_fu_192_C_out_write_resp_s_read;
wire    grp_write_C_Pipeline_wr_C_fu_192_fifo_C_s_read;
wire   [64:0] grp_write_C_Pipeline_wr_C_fu_192_C_out_write_addr_din;
wire    grp_write_C_Pipeline_wr_C_fu_192_C_out_write_addr_write;
wire   [512:0] grp_write_C_Pipeline_wr_C_fu_192_C_out_write_data_din;
wire    grp_write_C_Pipeline_wr_C_fu_192_C_out_write_data_write;
reg    grp_write_C_Pipeline_wr_C_fu_192_ap_start_reg;
wire    ap_CS_fsm_state7;
wire   [0:0] icmp_ln115_fu_289_p2;
wire    ap_CS_fsm_state8;
reg   [14:0] rp_fu_94;
wire   [14:0] rp_2_fu_294_p2;
reg    ap_block_state1;
wire   [31:0] M_fu_205_p1;
wire   [31:0] add_ln113_fu_209_p2;
wire   [15:0] N_fu_230_p1;
wire   [16:0] zext_ln112_fu_244_p1;
wire   [16:0] add_ln113_1_fu_248_p2;
wire   [0:0] icmp_ln111_fu_270_p2;
wire   [15:0] zext_ln115_fu_285_p1;
wire   [13:0] grp_fu_305_p0;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire   [31:0] grp_fu_305_p00;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 grp_write_C_Pipeline_wr_C_fu_192_ap_start_reg = 1'b0;
end

write_C_write_C_Pipeline_wr_C grp_write_C_Pipeline_wr_C_fu_192(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_write_C_Pipeline_wr_C_fu_192_ap_start),
    .ap_done(grp_write_C_Pipeline_wr_C_fu_192_ap_done),
    .ap_idle(grp_write_C_Pipeline_wr_C_fu_192_ap_idle),
    .ap_ready(grp_write_C_Pipeline_wr_C_fu_192_ap_ready),
    .num_ite_C(num_ite_C_reg_349),
    .C_out_write_resp_s_dout(C_out_write_resp_s_dout),
    .C_out_write_resp_s_empty_n(C_out_write_resp_s_empty_n),
    .C_out_write_resp_s_read(grp_write_C_Pipeline_wr_C_fu_192_C_out_write_resp_s_read),
    .fifo_C_s_dout(fifo_C_s_dout),
    .fifo_C_s_empty_n(fifo_C_s_empty_n),
    .fifo_C_s_read(grp_write_C_Pipeline_wr_C_fu_192_fifo_C_s_read),
    .C_out_write_addr_din(grp_write_C_Pipeline_wr_C_fu_192_C_out_write_addr_din),
    .C_out_write_addr_full_n(C_out_write_addr_full_n),
    .C_out_write_addr_write(grp_write_C_Pipeline_wr_C_fu_192_C_out_write_addr_write),
    .C_out_write_data_din(grp_write_C_Pipeline_wr_C_fu_192_C_out_write_data_din),
    .C_out_write_data_full_n(C_out_write_data_full_n),
    .C_out_write_data_write(grp_write_C_Pipeline_wr_C_fu_192_C_out_write_data_write)
);

write_C_mul_mul_14ns_28s_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 14 ),
    .din1_WIDTH( 28 ),
    .dout_WIDTH( 32 ))
mul_mul_14ns_28s_32_4_1_U6(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_305_p0),
    .din1(trunc_ln_reg_318),
    .ce(1'b1),
    .dout(grp_fu_305_p2)
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
        grp_write_C_Pipeline_wr_C_fu_192_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln115_fu_289_p2 == 1'd1))) begin
            grp_write_C_Pipeline_wr_C_fu_192_ap_start_reg <= 1'b1;
        end else if ((grp_write_C_Pipeline_wr_C_fu_192_ap_ready == 1'b1)) begin
            grp_write_C_Pipeline_wr_C_fu_192_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((wrC_inst_s_empty_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        rp_fu_94 <= 15'd0;
    end else if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln115_fu_289_p2 == 1'd1))) begin
        rp_fu_94 <= rp_2_fu_294_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        N16_reg_323 <= {{wrC_inst_s_dout[31:16]}};
        lshr_ln_reg_329 <= {{add_ln113_1_fu_248_p2[16:3]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        num_ite_C_reg_349 <= grp_fu_305_p2;
        rp_time_reg_344 <= rp_time_fu_275_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        trunc_ln_reg_318 <= {{add_ln113_fu_209_p2[31:4]}};
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        C_out_write_addr_write = grp_write_C_Pipeline_wr_C_fu_192_C_out_write_addr_write;
    end else begin
        C_out_write_addr_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        C_out_write_data_write = grp_write_C_Pipeline_wr_C_fu_192_C_out_write_data_write;
    end else begin
        C_out_write_data_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        C_out_write_resp_s_read = grp_write_C_Pipeline_wr_C_fu_192_C_out_write_resp_s_read;
    end else begin
        C_out_write_resp_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((wrC_inst_s_empty_n == 1'b0) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((wrC_inst_s_empty_n == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((grp_write_C_Pipeline_wr_C_fu_192_ap_done == 1'b0)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln115_fu_289_p2 == 1'd0))) begin
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
    if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln115_fu_289_p2 == 1'd0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        fifo_C_s_read = grp_write_C_Pipeline_wr_C_fu_192_fifo_C_s_read;
    end else begin
        fifo_C_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        wrC_inst_s_blk_n = wrC_inst_s_empty_n;
    end else begin
        wrC_inst_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((wrC_inst_s_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2)) | (~((wrC_inst_s_empty_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        wrC_inst_s_read = 1'b1;
    end else begin
        wrC_inst_s_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((wrC_inst_s_empty_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((wrC_inst_s_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln115_fu_289_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((1'b1 == ap_CS_fsm_state8) & (grp_write_C_Pipeline_wr_C_fu_192_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign C_out_read_addr_din = 65'd0;

assign C_out_read_addr_write = 1'b0;

assign C_out_read_data_peek_read = 1'b0;

assign C_out_read_data_s_read = 1'b0;

assign C_out_write_addr_din = grp_write_C_Pipeline_wr_C_fu_192_C_out_write_addr_din;

assign C_out_write_data_din = grp_write_C_Pipeline_wr_C_fu_192_C_out_write_data_din;

assign C_out_write_resp_peek_read = 1'b0;

assign M_fu_205_p1 = wrC_inst_s_dout[31:0];

assign N_fu_230_p1 = wrC_inst_s_dout[15:0];

assign add_ln113_1_fu_248_p2 = (zext_ln112_fu_244_p1 + 17'd7);

assign add_ln113_fu_209_p2 = (M_fu_205_p1 + 32'd15);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

always @ (*) begin
    ap_block_state1 = ((wrC_inst_s_empty_n == 1'b0) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign fifo_C_peek_read = 1'b0;

assign grp_fu_305_p0 = grp_fu_305_p00;

assign grp_fu_305_p00 = lshr_ln_reg_329;

assign grp_write_C_Pipeline_wr_C_fu_192_ap_start = grp_write_C_Pipeline_wr_C_fu_192_ap_start_reg;

assign icmp_ln111_fu_270_p2 = ((N16_reg_323 == 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln115_fu_289_p2 = (($signed(zext_ln115_fu_285_p1) < $signed(rp_time_reg_344)) ? 1'b1 : 1'b0);

assign rp_2_fu_294_p2 = (rp_fu_94 + 15'd1);

assign rp_time_fu_275_p3 = ((icmp_ln111_fu_270_p2[0:0] == 1'b1) ? 16'd1 : N16_reg_323);

assign wrC_inst_peek_read = 1'b0;

assign zext_ln112_fu_244_p1 = N_fu_230_p1;

assign zext_ln115_fu_285_p1 = rp_fu_94;

endmodule //write_C
