// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module inter_kernel_load_Pipeline_VITIS_LOOP_42_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a_write_resp_s_dout,
        a_write_resp_s_empty_n,
        a_write_resp_s_read,
        loop_bound,
        b_read_addr_din,
        b_read_addr_full_n,
        b_read_addr_write,
        b_read_data_s_dout,
        b_read_data_s_empty_n,
        b_read_data_s_read,
        stream_out_din,
        stream_out_full_n,
        stream_out_write,
        a_write_addr_din,
        a_write_addr_full_n,
        a_write_addr_write,
        a_write_data_din,
        a_write_data_full_n,
        a_write_data_write,
        stream_in_s_dout,
        stream_in_s_empty_n,
        stream_in_s_read
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [8:0] a_write_resp_s_dout;
input   a_write_resp_s_empty_n;
output   a_write_resp_s_read;
input  [31:0] loop_bound;
output  [64:0] b_read_addr_din;
input   b_read_addr_full_n;
output   b_read_addr_write;
input  [512:0] b_read_data_s_dout;
input   b_read_data_s_empty_n;
output   b_read_data_s_read;
output  [512:0] stream_out_din;
input   stream_out_full_n;
output   stream_out_write;
output  [64:0] a_write_addr_din;
input   a_write_addr_full_n;
output   a_write_addr_write;
output  [512:0] a_write_data_din;
input   a_write_data_full_n;
output   a_write_data_write;
input  [512:0] stream_in_s_dout;
input   stream_in_s_empty_n;
output   stream_in_s_read;

reg ap_idle;
reg a_write_resp_s_read;
reg b_read_addr_write;
reg b_read_data_s_read;
reg stream_out_write;
reg a_write_addr_write;
reg a_write_data_write;
reg stream_in_s_read;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire   [0:0] or_ln42_fu_226_p2;
wire   [0:0] tmp_1_nbreadreq_fu_137_p3;
reg    ap_predicate_op53_read_state2;
reg    ap_block_state2_pp0_stage1_iter0;
reg    ap_block_pp0_stage1_subdone;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    a_write_resp_s_blk_n;
wire    ap_block_pp0_stage1;
reg    stream_out_blk_n;
wire    ap_block_pp0_stage0;
reg   [0:0] or_ln42_reg_418;
reg   [0:0] icmp_ln42_reg_414;
reg   [0:0] tmp_3_reg_431;
reg   [0:0] tmp_4_reg_435;
reg    a_write_addr_blk_n;
reg   [0:0] icmp_ln53_reg_439;
reg   [0:0] tmp_s_reg_443;
reg   [0:0] tmp_5_reg_447;
reg   [0:0] tmp_6_reg_451;
reg    a_write_data_blk_n;
reg    stream_in_s_blk_n;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_predicate_op62_write_state3;
reg    ap_predicate_op68_write_state3;
reg    ap_predicate_op69_read_state3;
reg    ap_predicate_op72_write_state3;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg  signed [31:0] k_wr_req_1_reg_398;
reg    ap_block_pp0_stage1_11001;
reg   [31:0] k_rd_resp_1_reg_404;
reg   [31:0] k_wr_resp_1_reg_409;
wire   [0:0] icmp_ln42_fu_216_p2;
wire   [0:0] icmp_ln44_fu_232_p2;
reg   [0:0] icmp_ln44_reg_422;
wire   [31:0] select_ln44_fu_256_p3;
reg   [31:0] select_ln44_reg_426;
wire   [0:0] tmp_3_nbreadreq_fu_97_p3;
wire   [0:0] icmp_ln53_fu_264_p2;
wire   [0:0] tmp_s_nbwritereq_fu_113_p3;
wire   [0:0] tmp_5_nbwritereq_fu_121_p3;
wire   [0:0] tmp_6_nbreadreq_fu_129_p3;
reg   [0:0] tmp_1_reg_455;
wire   [7:0] trunc_ln85_1_fu_269_p1;
reg   [7:0] trunc_ln85_1_reg_459;
reg    ap_enable_reg_pp0_iter0_reg;
reg    ap_block_pp0_stage0_subdone;
reg   [31:0] k_wr_req_fu_68;
wire   [31:0] k_wr_req_2_fu_329_p2;
wire    ap_loop_init;
reg   [31:0] k_rd_resp_fu_72;
wire   [31:0] k_rd_resp_2_fu_294_p2;
reg   [31:0] k_rd_req_fu_76;
reg   [31:0] k_wr_resp_fu_80;
wire   [31:0] k_wr_resp_2_fu_352_p2;
reg    ap_block_pp0_stage1_01001;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln42_1_fu_221_p2;
wire  signed [31:0] icmp_ln44_fu_232_p0;
wire  signed [31:0] sext_ln44_fu_237_p0;
wire  signed [63:0] sext_ln44_fu_237_p1;
wire  signed [31:0] add_ln45_fu_250_p0;
wire   [0:0] select_ln44_fu_256_p0;
wire   [31:0] add_ln45_fu_250_p2;
wire  signed [31:0] select_ln44_fu_256_p2;
wire  signed [31:0] icmp_ln53_fu_264_p0;
wire   [511:0] trunc_ln104_fu_281_p1;
wire  signed [63:0] sext_ln54_fu_304_p1;
wire   [511:0] trunc_ln85_fu_316_p1;
wire   [8:0] zext_ln59_fu_339_p1;
wire   [8:0] add_ln59_fu_342_p2;
wire   [31:0] zext_ln59_1_fu_348_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_400;
reg    ap_condition_406;
reg    ap_condition_413;
reg    ap_condition_417;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

inter_kernel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_exit_pp0_iter0_stage1) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            k_rd_req_fu_76 <= 32'd0;
        end else if ((1'b1 == ap_condition_400)) begin
            k_rd_req_fu_76 <= select_ln44_reg_426;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            k_rd_resp_fu_72 <= 32'd0;
        end else if ((1'b1 == ap_condition_406)) begin
            k_rd_resp_fu_72 <= k_rd_resp_2_fu_294_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            k_wr_req_fu_68 <= 32'd513;
        end else if ((1'b1 == ap_condition_413)) begin
            k_wr_req_fu_68 <= k_wr_req_2_fu_329_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            k_wr_resp_fu_80 <= 32'd513;
        end else if ((1'b1 == ap_condition_417)) begin
            k_wr_resp_fu_80 <= k_wr_resp_2_fu_352_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        icmp_ln42_reg_414 <= icmp_ln42_fu_216_p2;
        k_rd_resp_1_reg_404 <= k_rd_resp_fu_72;
        k_wr_req_1_reg_398 <= k_wr_req_fu_68;
        k_wr_resp_1_reg_409 <= k_wr_resp_fu_80;
        or_ln42_reg_418 <= or_ln42_fu_226_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (or_ln42_fu_226_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        icmp_ln44_reg_422 <= icmp_ln44_fu_232_p2;
        icmp_ln53_reg_439 <= icmp_ln53_fu_264_p2;
        tmp_1_reg_455 <= tmp_1_nbreadreq_fu_137_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (or_ln42_fu_226_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln44_fu_232_p2 == 1'd1))) begin
        select_ln44_reg_426 <= select_ln44_fu_256_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (or_ln42_fu_226_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln42_fu_216_p2 == 1'd1))) begin
        tmp_3_reg_431 <= tmp_3_nbreadreq_fu_97_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (or_ln42_fu_226_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (tmp_3_nbreadreq_fu_97_p3 == 1'd1) & (icmp_ln42_fu_216_p2 == 1'd1))) begin
        tmp_4_reg_435 <= stream_out_full_n;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (or_ln42_fu_226_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (tmp_s_nbwritereq_fu_113_p3 == 1'd1) & (icmp_ln53_fu_264_p2 == 1'd1))) begin
        tmp_5_reg_447 <= a_write_data_full_n;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (or_ln42_fu_226_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (tmp_5_nbwritereq_fu_121_p3 == 1'd1) & (tmp_s_nbwritereq_fu_113_p3 == 1'd1) & (icmp_ln53_fu_264_p2 == 1'd1))) begin
        tmp_6_reg_451 <= tmp_6_nbreadreq_fu_129_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (or_ln42_fu_226_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln53_fu_264_p2 == 1'd1))) begin
        tmp_s_reg_443 <= a_write_addr_full_n;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (tmp_1_nbreadreq_fu_137_p3 == 1'd1) & (or_ln42_fu_226_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        trunc_ln85_1_reg_459 <= trunc_ln85_1_fu_269_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_6_reg_451 == 1'd1) & (tmp_5_reg_447 == 1'd1) & (tmp_s_reg_443 == 1'd1) & (icmp_ln53_reg_439 == 1'd1) & (or_ln42_reg_418 == 1'd1))) begin
        a_write_addr_blk_n = a_write_addr_full_n;
    end else begin
        a_write_addr_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op68_write_state3 == 1'b1))) begin
        a_write_addr_write = 1'b1;
    end else begin
        a_write_addr_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_6_reg_451 == 1'd1) & (tmp_5_reg_447 == 1'd1) & (tmp_s_reg_443 == 1'd1) & (icmp_ln53_reg_439 == 1'd1) & (or_ln42_reg_418 == 1'd1))) begin
        a_write_data_blk_n = a_write_data_full_n;
    end else begin
        a_write_data_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op72_write_state3 == 1'b1))) begin
        a_write_data_write = 1'b1;
    end else begin
        a_write_data_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (ap_predicate_op53_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        a_write_resp_s_blk_n = a_write_resp_s_empty_n;
    end else begin
        a_write_resp_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_predicate_op53_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        a_write_resp_s_read = 1'b1;
    end else begin
        a_write_resp_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (or_ln42_fu_226_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((b_read_addr_full_n == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (or_ln42_fu_226_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln44_fu_232_p2 == 1'd1))) begin
        b_read_addr_write = 1'b1;
    end else begin
        b_read_addr_write = 1'b0;
    end
end

always @ (*) begin
    if (((b_read_data_s_empty_n == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_4_reg_435 == 1'd1) & (tmp_3_reg_431 == 1'd1) & (icmp_ln42_reg_414 == 1'd1) & (or_ln42_reg_418 == 1'd1))) begin
        b_read_data_s_read = 1'b1;
    end else begin
        b_read_data_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_6_reg_451 == 1'd1) & (tmp_5_reg_447 == 1'd1) & (tmp_s_reg_443 == 1'd1) & (icmp_ln53_reg_439 == 1'd1) & (or_ln42_reg_418 == 1'd1))) begin
        stream_in_s_blk_n = stream_in_s_empty_n;
    end else begin
        stream_in_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op69_read_state3 == 1'b1))) begin
        stream_in_s_read = 1'b1;
    end else begin
        stream_in_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_4_reg_435 == 1'd1) & (tmp_3_reg_431 == 1'd1) & (icmp_ln42_reg_414 == 1'd1) & (or_ln42_reg_418 == 1'd1))) begin
        stream_out_blk_n = stream_out_full_n;
    end else begin
        stream_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op62_write_state3 == 1'b1))) begin
        stream_out_write = 1'b1;
    end else begin
        stream_out_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_write_addr_din = {{1'd0}, {sext_ln54_fu_304_p1}};

assign a_write_data_din = {{1'd0}, {trunc_ln85_fu_316_p1}};

assign add_ln45_fu_250_p0 = k_rd_req_fu_76;

assign add_ln45_fu_250_p2 = ($signed(add_ln45_fu_250_p0) + $signed(32'd1));

assign add_ln59_fu_342_p2 = (zext_ln59_fu_339_p1 + 9'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((1'b0 == a_write_data_full_n) & (ap_predicate_op72_write_state3 == 1'b1)) | ((stream_in_s_empty_n == 1'b0) & (ap_predicate_op69_read_state3 == 1'b1)) | ((1'b0 == a_write_addr_full_n) & (ap_predicate_op68_write_state3 == 1'b1)) | ((stream_out_full_n == 1'b0) & (ap_predicate_op62_write_state3 == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((1'b0 == a_write_data_full_n) & (ap_predicate_op72_write_state3 == 1'b1)) | ((stream_in_s_empty_n == 1'b0) & (ap_predicate_op69_read_state3 == 1'b1)) | ((1'b0 == a_write_addr_full_n) & (ap_predicate_op68_write_state3 == 1'b1)) | ((stream_out_full_n == 1'b0) & (ap_predicate_op62_write_state3 == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((1'b0 == a_write_data_full_n) & (ap_predicate_op72_write_state3 == 1'b1)) | ((stream_in_s_empty_n == 1'b0) & (ap_predicate_op69_read_state3 == 1'b1)) | ((1'b0 == a_write_addr_full_n) & (ap_predicate_op68_write_state3 == 1'b1)) | ((stream_out_full_n == 1'b0) & (ap_predicate_op62_write_state3 == 1'b1))));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_01001 = ((ap_predicate_op53_read_state2 == 1'b1) & (1'b0 == a_write_resp_s_empty_n) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage1_11001 = ((ap_predicate_op53_read_state2 == 1'b1) & (1'b0 == a_write_resp_s_empty_n) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = ((ap_predicate_op53_read_state2 == 1'b1) & (1'b0 == a_write_resp_s_empty_n) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = ((ap_predicate_op53_read_state2 == 1'b1) & (1'b0 == a_write_resp_s_empty_n));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (((1'b0 == a_write_data_full_n) & (ap_predicate_op72_write_state3 == 1'b1)) | ((stream_in_s_empty_n == 1'b0) & (ap_predicate_op69_read_state3 == 1'b1)) | ((1'b0 == a_write_addr_full_n) & (ap_predicate_op68_write_state3 == 1'b1)) | ((stream_out_full_n == 1'b0) & (ap_predicate_op62_write_state3 == 1'b1)));
end

always @ (*) begin
    ap_condition_400 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln44_reg_422 == 1'd1) & (or_ln42_reg_418 == 1'd1));
end

always @ (*) begin
    ap_condition_406 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_4_reg_435 == 1'd1) & (tmp_3_reg_431 == 1'd1) & (icmp_ln42_reg_414 == 1'd1) & (or_ln42_reg_418 == 1'd1));
end

always @ (*) begin
    ap_condition_413 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_6_reg_451 == 1'd1) & (tmp_5_reg_447 == 1'd1) & (tmp_s_reg_443 == 1'd1) & (icmp_ln53_reg_439 == 1'd1) & (or_ln42_reg_418 == 1'd1));
end

always @ (*) begin
    ap_condition_417 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_1_reg_455 == 1'd1) & (or_ln42_reg_418 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

always @ (*) begin
    ap_predicate_op53_read_state2 = ((tmp_1_nbreadreq_fu_137_p3 == 1'd1) & (or_ln42_fu_226_p2 == 1'd1));
end

always @ (*) begin
    ap_predicate_op62_write_state3 = ((tmp_4_reg_435 == 1'd1) & (tmp_3_reg_431 == 1'd1) & (icmp_ln42_reg_414 == 1'd1) & (or_ln42_reg_418 == 1'd1));
end

always @ (*) begin
    ap_predicate_op68_write_state3 = ((tmp_6_reg_451 == 1'd1) & (tmp_5_reg_447 == 1'd1) & (tmp_s_reg_443 == 1'd1) & (icmp_ln53_reg_439 == 1'd1) & (or_ln42_reg_418 == 1'd1));
end

always @ (*) begin
    ap_predicate_op69_read_state3 = ((tmp_6_reg_451 == 1'd1) & (tmp_5_reg_447 == 1'd1) & (tmp_s_reg_443 == 1'd1) & (icmp_ln53_reg_439 == 1'd1) & (or_ln42_reg_418 == 1'd1));
end

always @ (*) begin
    ap_predicate_op72_write_state3 = ((tmp_6_reg_451 == 1'd1) & (tmp_5_reg_447 == 1'd1) & (tmp_s_reg_443 == 1'd1) & (icmp_ln53_reg_439 == 1'd1) & (or_ln42_reg_418 == 1'd1));
end

assign b_read_addr_din = {{1'd0}, {sext_ln44_fu_237_p1}};

assign icmp_ln42_1_fu_221_p2 = ((k_wr_resp_fu_80 < loop_bound) ? 1'b1 : 1'b0);

assign icmp_ln42_fu_216_p2 = ((k_rd_resp_fu_72 < loop_bound) ? 1'b1 : 1'b0);

assign icmp_ln44_fu_232_p0 = k_rd_req_fu_76;

assign icmp_ln44_fu_232_p2 = ((icmp_ln44_fu_232_p0 < loop_bound) ? 1'b1 : 1'b0);

assign icmp_ln53_fu_264_p0 = k_wr_req_fu_68;

assign icmp_ln53_fu_264_p2 = ((icmp_ln53_fu_264_p0 < loop_bound) ? 1'b1 : 1'b0);

assign k_rd_resp_2_fu_294_p2 = (k_rd_resp_1_reg_404 + 32'd1);

assign k_wr_req_2_fu_329_p2 = ($signed(k_wr_req_1_reg_398) + $signed(32'd1));

assign k_wr_resp_2_fu_352_p2 = (zext_ln59_1_fu_348_p1 + k_wr_resp_1_reg_409);

assign or_ln42_fu_226_p2 = (icmp_ln42_fu_216_p2 | icmp_ln42_1_fu_221_p2);

assign select_ln44_fu_256_p0 = b_read_addr_full_n;

assign select_ln44_fu_256_p2 = k_rd_req_fu_76;

assign select_ln44_fu_256_p3 = ((select_ln44_fu_256_p0[0:0] == 1'b1) ? add_ln45_fu_250_p2 : select_ln44_fu_256_p2);

assign sext_ln44_fu_237_p0 = k_rd_req_fu_76;

assign sext_ln44_fu_237_p1 = sext_ln44_fu_237_p0;

assign sext_ln54_fu_304_p1 = k_wr_req_1_reg_398;

assign stream_out_din = {{1'd0}, {trunc_ln104_fu_281_p1}};

assign tmp_1_nbreadreq_fu_137_p3 = a_write_resp_s_empty_n;

assign tmp_3_nbreadreq_fu_97_p3 = b_read_data_s_empty_n;

assign tmp_5_nbwritereq_fu_121_p3 = a_write_data_full_n;

assign tmp_6_nbreadreq_fu_129_p3 = stream_in_s_empty_n;

assign tmp_s_nbwritereq_fu_113_p3 = a_write_addr_full_n;

assign trunc_ln104_fu_281_p1 = b_read_data_s_dout[511:0];

assign trunc_ln85_1_fu_269_p1 = a_write_resp_s_dout[7:0];

assign trunc_ln85_fu_316_p1 = stream_in_s_dout[511:0];

assign zext_ln59_1_fu_348_p1 = add_ln59_fu_342_p2;

assign zext_ln59_fu_339_p1 = trunc_ln85_1_reg_459;

endmodule //inter_kernel_load_Pipeline_VITIS_LOOP_42_1