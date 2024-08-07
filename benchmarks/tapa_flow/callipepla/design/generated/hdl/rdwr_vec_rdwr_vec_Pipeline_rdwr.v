// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module rdwr_vec_rdwr_vec_Pipeline_rdwr (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        inst_base_addr,
        rd_total,
        wr_total,
        vec_p_write_resp_s_dout,
        vec_p_write_resp_s_empty_n,
        vec_p_write_resp_s_read,
        wr_end_addr,
        q_din_s_dout,
        q_din_s_empty_n,
        q_din_s_read,
        vec_p_write_addr_din,
        vec_p_write_addr_full_n,
        vec_p_write_addr_write,
        vec_p_write_data_din,
        vec_p_write_data_full_n,
        vec_p_write_data_write,
        q_dout_din,
        q_dout_full_n,
        q_dout_write,
        vec_p_read_data_s_dout,
        vec_p_read_data_s_empty_n,
        vec_p_read_data_s_read,
        rd_end_addr,
        vec_p_read_addr_din,
        vec_p_read_addr_full_n,
        vec_p_read_addr_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] inst_base_addr;
input  [31:0] rd_total;
input  [31:0] wr_total;
input  [8:0] vec_p_write_resp_s_dout;
input   vec_p_write_resp_s_empty_n;
output   vec_p_write_resp_s_read;
input  [31:0] wr_end_addr;
input  [512:0] q_din_s_dout;
input   q_din_s_empty_n;
output   q_din_s_read;
output  [64:0] vec_p_write_addr_din;
input   vec_p_write_addr_full_n;
output   vec_p_write_addr_write;
output  [512:0] vec_p_write_data_din;
input   vec_p_write_data_full_n;
output   vec_p_write_data_write;
output  [512:0] q_dout_din;
input   q_dout_full_n;
output   q_dout_write;
input  [512:0] vec_p_read_data_s_dout;
input   vec_p_read_data_s_empty_n;
output   vec_p_read_data_s_read;
input  [31:0] rd_end_addr;
output  [64:0] vec_p_read_addr_din;
input   vec_p_read_addr_full_n;
output   vec_p_read_addr_write;

reg ap_idle;
reg vec_p_write_resp_s_read;
reg q_din_s_read;
reg vec_p_write_addr_write;
reg vec_p_write_data_write;
reg q_dout_write;
reg vec_p_read_data_s_read;
reg vec_p_read_addr_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] or_ln182_fu_362_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [63:0] ap_phi_mux_empty_16_phi_fu_243_p4;
wire   [63:0] ap_phi_reg_pp0_iter1_empty_16_reg_240;
wire   [0:0] and_ln191_fu_403_p2;
wire   [0:0] p_vld8_fu_409_p1;
reg   [63:0] ap_phi_mux_empty_17_phi_fu_253_p4;
wire   [63:0] ap_phi_reg_pp0_iter1_empty_17_reg_250;
reg   [63:0] ap_phi_mux_empty_18_phi_fu_263_p4;
wire   [63:0] ap_phi_reg_pp0_iter1_empty_18_reg_260;
reg   [63:0] ap_phi_mux_empty_19_phi_fu_273_p4;
wire   [63:0] ap_phi_reg_pp0_iter1_empty_19_reg_270;
reg   [63:0] ap_phi_mux_empty_21_phi_fu_283_p4;
wire   [63:0] ap_phi_reg_pp0_iter1_empty_21_reg_280;
wire   [0:0] and_ln200_fu_522_p2;
wire   [0:0] p_vld1_fu_541_p1;
reg   [63:0] ap_phi_mux_empty_22_phi_fu_293_p4;
wire   [63:0] ap_phi_reg_pp0_iter1_empty_22_reg_290;
reg   [63:0] ap_phi_mux_empty_23_phi_fu_303_p4;
wire   [63:0] ap_phi_reg_pp0_iter1_empty_23_reg_300;
reg   [63:0] ap_phi_mux_empty_24_phi_fu_313_p4;
wire   [63:0] ap_phi_reg_pp0_iter1_empty_24_reg_310;
reg   [31:0] wr_resp_fu_100;
wire   [31:0] wr_resp_2_fu_663_p2;
wire   [0:0] is_success_fu_637_p1;
wire    ap_loop_init;
wire    ap_block_pp0_stage0;
reg   [31:0] wr_req_fu_104;
wire   [31:0] wr_req_2_fu_626_p2;
reg   [31:0] rd_resp_fu_108;
wire   [31:0] rd_resp_2_fu_494_p2;
reg   [31:0] rd_req_fu_112;
wire   [31:0] rd_req_2_fu_392_p2;
wire   [0:0] and_ln186_fu_373_p2;
wire    ap_block_pp0_stage0_01001;
wire   [0:0] tmp_6_nbreadreq_fu_169_p3;
wire   [0:0] vec_p_read_data_s_read_nbread_fu_177_p2_0;
wire   [0:0] tmp_7_nbreadreq_fu_190_p3;
wire   [0:0] q_din_s_read_nbread_fu_221_p2_0;
wire   [0:0] vec_p_write_resp_s_read_nbread_fu_234_p2_0;
wire   [0:0] icmp_ln182_fu_352_p2;
wire   [0:0] icmp_ln182_1_fu_357_p2;
wire  signed [31:0] icmp_ln186_fu_368_p0;
wire   [0:0] icmp_ln186_fu_368_p2;
wire   [0:0] and_ln186_fu_373_p1;
wire  signed [31:0] sext_ln188_fu_379_p0;
wire  signed [63:0] sext_ln188_fu_379_p1;
wire  signed [31:0] rd_req_2_fu_392_p0;
wire   [0:0] and_ln191_fu_403_p0;
wire   [191:0] tmp_3_fu_465_p4;
wire   [63:0] elem_val_M_elems_fu_417_p1;
wire  signed [31:0] icmp_ln198_fu_505_p0;
wire   [0:0] and_ln200_2_fu_510_p0;
wire   [0:0] and_ln200_2_fu_510_p1;
wire   [0:0] and_ln200_2_fu_510_p2;
wire   [0:0] and_ln200_1_fu_516_p2;
wire   [0:0] icmp_ln198_fu_505_p2;
wire  signed [31:0] sext_ln202_fu_528_p0;
wire  signed [63:0] sext_ln202_fu_528_p1;
wire   [191:0] tmp_14_fu_597_p4;
wire   [63:0] elem_val_M_elems_1_fu_549_p1;
wire  signed [31:0] wr_req_2_fu_626_p0;
wire   [7:0] elem_val_fu_645_p1;
wire   [8:0] zext_ln210_fu_649_p1;
wire   [8:0] add_ln210_fu_653_p2;
wire   [31:0] zext_ln210_1_fu_659_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_456;
reg    ap_condition_459;
reg    ap_condition_462;
reg    ap_condition_465;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

rdwr_vec_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            rd_req_fu_112 <= inst_base_addr;
        end else if ((1'b1 == ap_condition_456)) begin
            rd_req_fu_112 <= rd_req_2_fu_392_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            rd_resp_fu_108 <= 32'd0;
        end else if ((1'b1 == ap_condition_459)) begin
            rd_resp_fu_108 <= rd_resp_2_fu_494_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            wr_req_fu_104 <= inst_base_addr;
        end else if ((1'b1 == ap_condition_462)) begin
            wr_req_fu_104 <= wr_req_2_fu_626_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            wr_resp_fu_100 <= 32'd0;
        end else if ((1'b1 == ap_condition_465)) begin
            wr_resp_fu_100 <= wr_resp_2_fu_663_p2;
        end
    end
end

always @ (*) begin
    if (((or_ln182_fu_362_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
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
    if (((or_ln182_fu_362_p2 == 1'd1) & (p_vld8_fu_409_p1 == 1'd1) & (1'd1 == and_ln191_fu_403_p2))) begin
        ap_phi_mux_empty_16_phi_fu_243_p4 = {{vec_p_read_data_s_dout[127:64]}};
    end else begin
        ap_phi_mux_empty_16_phi_fu_243_p4 = ap_phi_reg_pp0_iter1_empty_16_reg_240;
    end
end

always @ (*) begin
    if (((or_ln182_fu_362_p2 == 1'd1) & (p_vld8_fu_409_p1 == 1'd1) & (1'd1 == and_ln191_fu_403_p2))) begin
        ap_phi_mux_empty_17_phi_fu_253_p4 = {{vec_p_read_data_s_dout[191:128]}};
    end else begin
        ap_phi_mux_empty_17_phi_fu_253_p4 = ap_phi_reg_pp0_iter1_empty_17_reg_250;
    end
end

always @ (*) begin
    if (((or_ln182_fu_362_p2 == 1'd1) & (p_vld8_fu_409_p1 == 1'd1) & (1'd1 == and_ln191_fu_403_p2))) begin
        ap_phi_mux_empty_18_phi_fu_263_p4 = {{vec_p_read_data_s_dout[255:192]}};
    end else begin
        ap_phi_mux_empty_18_phi_fu_263_p4 = ap_phi_reg_pp0_iter1_empty_18_reg_260;
    end
end

always @ (*) begin
    if (((or_ln182_fu_362_p2 == 1'd1) & (p_vld8_fu_409_p1 == 1'd1) & (1'd1 == and_ln191_fu_403_p2))) begin
        ap_phi_mux_empty_19_phi_fu_273_p4 = {{vec_p_read_data_s_dout[319:256]}};
    end else begin
        ap_phi_mux_empty_19_phi_fu_273_p4 = ap_phi_reg_pp0_iter1_empty_19_reg_270;
    end
end

always @ (*) begin
    if (((or_ln182_fu_362_p2 == 1'd1) & (p_vld1_fu_541_p1 == 1'd1) & (1'd1 == and_ln200_fu_522_p2))) begin
        ap_phi_mux_empty_21_phi_fu_283_p4 = {{q_din_s_dout[319:256]}};
    end else begin
        ap_phi_mux_empty_21_phi_fu_283_p4 = ap_phi_reg_pp0_iter1_empty_21_reg_280;
    end
end

always @ (*) begin
    if (((or_ln182_fu_362_p2 == 1'd1) & (p_vld1_fu_541_p1 == 1'd1) & (1'd1 == and_ln200_fu_522_p2))) begin
        ap_phi_mux_empty_22_phi_fu_293_p4 = {{q_din_s_dout[255:192]}};
    end else begin
        ap_phi_mux_empty_22_phi_fu_293_p4 = ap_phi_reg_pp0_iter1_empty_22_reg_290;
    end
end

always @ (*) begin
    if (((or_ln182_fu_362_p2 == 1'd1) & (p_vld1_fu_541_p1 == 1'd1) & (1'd1 == and_ln200_fu_522_p2))) begin
        ap_phi_mux_empty_23_phi_fu_303_p4 = {{q_din_s_dout[191:128]}};
    end else begin
        ap_phi_mux_empty_23_phi_fu_303_p4 = ap_phi_reg_pp0_iter1_empty_23_reg_300;
    end
end

always @ (*) begin
    if (((or_ln182_fu_362_p2 == 1'd1) & (p_vld1_fu_541_p1 == 1'd1) & (1'd1 == and_ln200_fu_522_p2))) begin
        ap_phi_mux_empty_24_phi_fu_313_p4 = {{q_din_s_dout[127:64]}};
    end else begin
        ap_phi_mux_empty_24_phi_fu_313_p4 = ap_phi_reg_pp0_iter1_empty_24_reg_310;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((q_din_s_empty_n == 1'b1) & (or_ln182_fu_362_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'd1 == and_ln200_fu_522_p2))) begin
        q_din_s_read = 1'b1;
    end else begin
        q_din_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((q_dout_full_n == 1'b1) & (or_ln182_fu_362_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'd1 == and_ln191_fu_403_p2))) begin
        q_dout_write = 1'b1;
    end else begin
        q_dout_write = 1'b0;
    end
end

always @ (*) begin
    if (((vec_p_read_addr_full_n == 1'b1) & (or_ln182_fu_362_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'd1 == and_ln186_fu_373_p2))) begin
        vec_p_read_addr_write = 1'b1;
    end else begin
        vec_p_read_addr_write = 1'b0;
    end
end

always @ (*) begin
    if (((vec_p_read_data_s_empty_n == 1'b1) & (or_ln182_fu_362_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'd1 == and_ln191_fu_403_p2))) begin
        vec_p_read_data_s_read = 1'b1;
    end else begin
        vec_p_read_data_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((vec_p_write_addr_full_n == 1'b1) & (or_ln182_fu_362_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'd1 == and_ln200_fu_522_p2))) begin
        vec_p_write_addr_write = 1'b1;
    end else begin
        vec_p_write_addr_write = 1'b0;
    end
end

always @ (*) begin
    if (((vec_p_write_data_full_n == 1'b1) & (or_ln182_fu_362_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'd1 == and_ln200_fu_522_p2))) begin
        vec_p_write_data_write = 1'b1;
    end else begin
        vec_p_write_data_write = 1'b0;
    end
end

always @ (*) begin
    if (((vec_p_write_resp_s_empty_n == 1'b1) & (or_ln182_fu_362_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        vec_p_write_resp_s_read = 1'b1;
    end else begin
        vec_p_write_resp_s_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln210_fu_653_p2 = (zext_ln210_fu_649_p1 + 9'd1);

assign and_ln186_fu_373_p1 = vec_p_read_addr_full_n;

assign and_ln186_fu_373_p2 = (icmp_ln186_fu_368_p2 & and_ln186_fu_373_p1);

assign and_ln191_fu_403_p0 = q_dout_full_n;

assign and_ln191_fu_403_p2 = (tmp_6_nbreadreq_fu_169_p3 & and_ln191_fu_403_p0);

assign and_ln200_1_fu_516_p2 = (tmp_7_nbreadreq_fu_190_p3 & and_ln200_2_fu_510_p2);

assign and_ln200_2_fu_510_p0 = vec_p_write_addr_full_n;

assign and_ln200_2_fu_510_p1 = vec_p_write_data_full_n;

assign and_ln200_2_fu_510_p2 = (and_ln200_2_fu_510_p1 & and_ln200_2_fu_510_p0);

assign and_ln200_fu_522_p2 = (icmp_ln198_fu_505_p2 & and_ln200_1_fu_516_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_456 = ((or_ln182_fu_362_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'd1 == and_ln186_fu_373_p2));
end

always @ (*) begin
    ap_condition_459 = ((or_ln182_fu_362_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'd1 == and_ln191_fu_403_p2));
end

always @ (*) begin
    ap_condition_462 = ((or_ln182_fu_362_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'd1 == and_ln200_fu_522_p2));
end

always @ (*) begin
    ap_condition_465 = ((or_ln182_fu_362_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (is_success_fu_637_p1 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_phi_reg_pp0_iter1_empty_16_reg_240 = 'bx;

assign ap_phi_reg_pp0_iter1_empty_17_reg_250 = 'bx;

assign ap_phi_reg_pp0_iter1_empty_18_reg_260 = 'bx;

assign ap_phi_reg_pp0_iter1_empty_19_reg_270 = 'bx;

assign ap_phi_reg_pp0_iter1_empty_21_reg_280 = 'bx;

assign ap_phi_reg_pp0_iter1_empty_22_reg_290 = 'bx;

assign ap_phi_reg_pp0_iter1_empty_23_reg_300 = 'bx;

assign ap_phi_reg_pp0_iter1_empty_24_reg_310 = 'bx;

assign elem_val_M_elems_1_fu_549_p1 = q_din_s_dout[63:0];

assign elem_val_M_elems_fu_417_p1 = vec_p_read_data_s_dout[63:0];

assign elem_val_fu_645_p1 = vec_p_write_resp_s_dout[7:0];

assign icmp_ln182_1_fu_357_p2 = (($signed(wr_resp_fu_100) < $signed(wr_total)) ? 1'b1 : 1'b0);

assign icmp_ln182_fu_352_p2 = (($signed(rd_resp_fu_108) < $signed(rd_total)) ? 1'b1 : 1'b0);

assign icmp_ln186_fu_368_p0 = rd_req_fu_112;

assign icmp_ln186_fu_368_p2 = (($signed(icmp_ln186_fu_368_p0) < $signed(rd_end_addr)) ? 1'b1 : 1'b0);

assign icmp_ln198_fu_505_p0 = wr_req_fu_104;

assign icmp_ln198_fu_505_p2 = (($signed(icmp_ln198_fu_505_p0) < $signed(wr_end_addr)) ? 1'b1 : 1'b0);

assign is_success_fu_637_p1 = vec_p_write_resp_s_read_nbread_fu_234_p2_0;

assign or_ln182_fu_362_p2 = (icmp_ln182_fu_352_p2 | icmp_ln182_1_fu_357_p2);

assign p_vld1_fu_541_p1 = q_din_s_read_nbread_fu_221_p2_0;

assign p_vld8_fu_409_p1 = vec_p_read_data_s_read_nbread_fu_177_p2_0;

assign q_din_s_read_nbread_fu_221_p2_0 = q_din_s_empty_n;

assign q_dout_din = {{{{{{{{{{{{1'd0}, {tmp_3_fu_465_p4}}}, {ap_phi_mux_empty_19_phi_fu_273_p4}}}, {ap_phi_mux_empty_18_phi_fu_263_p4}}}, {ap_phi_mux_empty_17_phi_fu_253_p4}}}, {ap_phi_mux_empty_16_phi_fu_243_p4}}}, {elem_val_M_elems_fu_417_p1}};

assign rd_req_2_fu_392_p0 = rd_req_fu_112;

assign rd_req_2_fu_392_p2 = ($signed(rd_req_2_fu_392_p0) + $signed(32'd1));

assign rd_resp_2_fu_494_p2 = (rd_resp_fu_108 + 32'd1);

assign sext_ln188_fu_379_p0 = rd_req_fu_112;

assign sext_ln188_fu_379_p1 = sext_ln188_fu_379_p0;

assign sext_ln202_fu_528_p0 = wr_req_fu_104;

assign sext_ln202_fu_528_p1 = sext_ln202_fu_528_p0;

assign tmp_14_fu_597_p4 = {{q_din_s_dout[511:320]}};

assign tmp_3_fu_465_p4 = {{vec_p_read_data_s_dout[511:320]}};

assign tmp_6_nbreadreq_fu_169_p3 = vec_p_read_data_s_empty_n;

assign tmp_7_nbreadreq_fu_190_p3 = q_din_s_empty_n;

assign vec_p_read_addr_din = {{1'd0}, {sext_ln188_fu_379_p1}};

assign vec_p_read_data_s_read_nbread_fu_177_p2_0 = vec_p_read_data_s_empty_n;

assign vec_p_write_addr_din = {{1'd0}, {sext_ln202_fu_528_p1}};

assign vec_p_write_data_din = {{{{{{{{{{{{1'd0}, {tmp_14_fu_597_p4}}}, {ap_phi_mux_empty_21_phi_fu_283_p4}}}, {ap_phi_mux_empty_22_phi_fu_293_p4}}}, {ap_phi_mux_empty_23_phi_fu_303_p4}}}, {ap_phi_mux_empty_24_phi_fu_313_p4}}}, {elem_val_M_elems_1_fu_549_p1}};

assign vec_p_write_resp_s_read_nbread_fu_234_p2_0 = vec_p_write_resp_s_empty_n;

assign wr_req_2_fu_626_p0 = wr_req_fu_104;

assign wr_req_2_fu_626_p2 = ($signed(wr_req_2_fu_626_p0) + $signed(32'd1));

assign wr_resp_2_fu_663_p2 = (zext_ln210_1_fu_659_p1 + wr_resp_fu_100);

assign zext_ln210_1_fu_659_p1 = add_ln210_fu_653_p2;

assign zext_ln210_fu_649_p1 = elem_val_fu_645_p1;

endmodule //rdwr_vec_rdwr_vec_Pipeline_rdwr
