// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module read_C_read_C_Pipeline_rd_C (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        num_ite_C,
        fifo_C_din,
        fifo_C_full_n,
        fifo_C_write,
        C_read_data_s_dout,
        C_read_data_s_empty_n,
        C_read_data_s_read,
        C_read_addr_din,
        C_read_addr_full_n,
        C_read_addr_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] num_ite_C;
output  [512:0] fifo_C_din;
input   fifo_C_full_n;
output   fifo_C_write;
input  [512:0] C_read_data_s_dout;
input   C_read_data_s_empty_n;
output   C_read_data_s_read;
output  [64:0] C_read_addr_din;
input   C_read_addr_full_n;
output   C_read_addr_write;

reg ap_idle;
reg fifo_C_write;
reg C_read_data_s_read;
reg C_read_addr_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln111_fu_128_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [31:0] i_resp_fu_54;
wire   [31:0] i_resp_2_fu_191_p2;
wire   [0:0] and_ln47_fu_168_p2;
wire    ap_loop_init;
wire    ap_block_pp0_stage0;
reg   [31:0] i_req_fu_58;
wire   [31:0] i_req_2_fu_157_p2;
wire   [0:0] and_ln43_fu_138_p2;
wire    ap_block_pp0_stage0_01001;
wire   [0:0] tmp_8_nbreadreq_fu_91_p3;
wire  signed [31:0] icmp_ln43_fu_133_p0;
wire   [0:0] icmp_ln43_fu_133_p2;
wire   [0:0] and_ln43_fu_138_p1;
wire  signed [31:0] sext_ln44_fu_144_p0;
wire  signed [63:0] sext_ln44_fu_144_p1;
wire  signed [31:0] i_req_2_fu_157_p0;
wire   [0:0] and_ln47_fu_168_p0;
wire   [511:0] trunc_ln146_fu_178_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_190;
reg    ap_condition_193;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

read_C_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
            i_req_fu_58 <= 32'd0;
        end else if ((1'b1 == ap_condition_190)) begin
            i_req_fu_58 <= i_req_2_fu_157_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_resp_fu_54 <= 32'd0;
        end else if ((1'b1 == ap_condition_193)) begin
            i_resp_fu_54 <= i_resp_2_fu_191_p2;
        end
    end
end

always @ (*) begin
    if (((1'd1 == and_ln43_fu_138_p2) & (icmp_ln111_fu_128_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == C_read_addr_full_n) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        C_read_addr_write = 1'b1;
    end else begin
        C_read_addr_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln47_fu_168_p2) & (icmp_ln111_fu_128_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == C_read_data_s_empty_n) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        C_read_data_s_read = 1'b1;
    end else begin
        C_read_data_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln111_fu_128_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln47_fu_168_p2) & (fifo_C_full_n == 1'b1) & (icmp_ln111_fu_128_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fifo_C_write = 1'b1;
    end else begin
        fifo_C_write = 1'b0;
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

assign C_read_addr_din = {{1'd0}, {sext_ln44_fu_144_p1}};

assign and_ln43_fu_138_p1 = C_read_addr_full_n;

assign and_ln43_fu_138_p2 = (icmp_ln43_fu_133_p2 & and_ln43_fu_138_p1);

assign and_ln47_fu_168_p0 = fifo_C_full_n;

assign and_ln47_fu_168_p2 = (tmp_8_nbreadreq_fu_91_p3 & and_ln47_fu_168_p0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_190 = ((1'd1 == and_ln43_fu_138_p2) & (icmp_ln111_fu_128_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_193 = ((1'd1 == and_ln47_fu_168_p2) & (icmp_ln111_fu_128_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign fifo_C_din = {{1'd0}, {trunc_ln146_fu_178_p1}};

assign i_req_2_fu_157_p0 = i_req_fu_58;

assign i_req_2_fu_157_p2 = ($signed(i_req_2_fu_157_p0) + $signed(32'd1));

assign i_resp_2_fu_191_p2 = (i_resp_fu_54 + 32'd1);

assign icmp_ln111_fu_128_p2 = (($signed(i_resp_fu_54) < $signed(num_ite_C)) ? 1'b1 : 1'b0);

assign icmp_ln43_fu_133_p0 = i_req_fu_58;

assign icmp_ln43_fu_133_p2 = (($signed(icmp_ln43_fu_133_p0) < $signed(num_ite_C)) ? 1'b1 : 1'b0);

assign sext_ln44_fu_144_p0 = i_req_fu_58;

assign sext_ln44_fu_144_p1 = sext_ln44_fu_144_p0;

assign tmp_8_nbreadreq_fu_91_p3 = C_read_data_s_empty_n;

assign trunc_ln146_fu_178_p1 = C_read_data_s_dout[511:0];

endmodule //read_C_read_C_Pipeline_rd_C