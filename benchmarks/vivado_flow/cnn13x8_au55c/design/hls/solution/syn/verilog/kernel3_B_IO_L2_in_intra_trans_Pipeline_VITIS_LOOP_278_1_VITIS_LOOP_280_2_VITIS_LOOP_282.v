// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module kernel3_B_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_278_1_VITIS_LOOP_280_2_VITIS_LOOP_282 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        fifo_B_PE_0_7239_din,
        fifo_B_PE_0_7239_num_data_valid,
        fifo_B_PE_0_7239_fifo_cap,
        fifo_B_PE_0_7239_full_n,
        fifo_B_PE_0_7239_write,
        local_B_address0,
        local_B_ce0,
        local_B_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [255:0] fifo_B_PE_0_7239_din;
input  [1:0] fifo_B_PE_0_7239_num_data_valid;
input  [1:0] fifo_B_PE_0_7239_fifo_cap;
input   fifo_B_PE_0_7239_full_n;
output   fifo_B_PE_0_7239_write;
output  [10:0] local_B_address0;
output   local_B_ce0;
input  [255:0] local_B_q0;

reg ap_idle;
reg fifo_B_PE_0_7239_write;
reg local_B_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
reg    ap_block_state5_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln1039_fu_140_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    fifo_B_PE_0_7239_blk_n;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln1039_reg_381;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln1039_209_fu_155_p2;
reg   [0:0] icmp_ln1039_209_reg_385;
wire   [10:0] select_ln1039_412_fu_292_p3;
reg   [10:0] select_ln1039_412_reg_394;
reg   [255:0] local_B_load_reg_404;
reg    ap_condition_exit_pp0_iter1_stage0;
wire   [63:0] select_ln1039_616_cast_fu_342_p1;
reg   [4:0] c7_V_fu_72;
wire   [4:0] c7_V_1_fu_319_p3;
wire    ap_loop_init;
reg   [6:0] c6_V_fu_76;
wire   [6:0] select_ln1039_413_fu_300_p3;
reg   [11:0] indvar_flatten_fu_80;
wire   [11:0] select_ln1039_414_fu_167_p3;
reg   [11:0] ap_sig_allocacmp_indvar_flatten_load;
reg   [5:0] c5_V_fu_84;
wire   [5:0] select_ln1039_410_fu_233_p3;
reg   [15:0] indvar_flatten18_fu_88;
wire   [15:0] add_ln1039_104_fu_146_p2;
reg   [15:0] ap_sig_allocacmp_indvar_flatten18_load;
reg    ap_block_pp0_stage0_01001;
wire   [11:0] add_ln1039_fu_161_p2;
wire   [5:0] trunc_ln1039_fu_191_p1;
wire   [10:0] tmp_fu_199_p3;
wire   [10:0] zext_ln278_fu_195_p1;
wire   [5:0] add_ln840_fu_216_p2;
wire   [10:0] zext_ln1039_fu_229_p1;
wire   [10:0] empty_fu_207_p2;
wire   [0:0] icmp_ln282_fu_256_p2;
wire   [0:0] xor_ln1039_fu_251_p2;
wire   [6:0] select_ln1039_fu_222_p3;
wire   [6:0] add_ln840_306_fu_268_p2;
wire   [5:0] empty_873_fu_274_p1;
wire   [10:0] tmp_s_fu_278_p3;
wire   [10:0] zext_ln280_fu_240_p1;
wire   [0:0] and_ln1039_fu_262_p2;
wire   [10:0] empty_874_fu_286_p2;
wire   [10:0] select_ln1039_411_fu_244_p3;
wire   [0:0] or_ln840_fu_314_p2;
wire   [4:0] add_ln840_307_fu_308_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_done_reg = 1'b0;
end

kernel3_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            c5_V_fu_84 <= 6'd0;
        end else if (((icmp_ln1039_reg_381 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            c5_V_fu_84 <= select_ln1039_410_fu_233_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            c6_V_fu_76 <= 7'd0;
        end else if (((icmp_ln1039_reg_381 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            c6_V_fu_76 <= select_ln1039_413_fu_300_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            c7_V_fu_72 <= 5'd0;
        end else if (((icmp_ln1039_reg_381 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            c7_V_fu_72 <= c7_V_1_fu_319_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln1039_fu_140_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten18_fu_88 <= add_ln1039_104_fu_146_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten18_fu_88 <= 16'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln1039_fu_140_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten_fu_80 <= select_ln1039_414_fu_167_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_80 <= 12'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln1039_reg_381 <= icmp_ln1039_fu_140_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        local_B_load_reg_404 <= local_B_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1039_fu_140_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln1039_209_reg_385 <= icmp_ln1039_209_fu_155_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1039_reg_381 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln1039_412_reg_394 <= select_ln1039_412_fu_292_p3;
    end
end

always @ (*) begin
    if (((icmp_ln1039_fu_140_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1039_reg_381 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten18_load = 16'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten18_load = indvar_flatten18_fu_88;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten_load = 12'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_80;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        fifo_B_PE_0_7239_blk_n = fifo_B_PE_0_7239_full_n;
    end else begin
        fifo_B_PE_0_7239_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        fifo_B_PE_0_7239_write = 1'b1;
    end else begin
        fifo_B_PE_0_7239_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        local_B_ce0 = 1'b1;
    end else begin
        local_B_ce0 = 1'b0;
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

assign add_ln1039_104_fu_146_p2 = (ap_sig_allocacmp_indvar_flatten18_load + 16'd1);

assign add_ln1039_fu_161_p2 = (ap_sig_allocacmp_indvar_flatten_load + 12'd1);

assign add_ln840_306_fu_268_p2 = (select_ln1039_fu_222_p3 + 7'd1);

assign add_ln840_307_fu_308_p2 = (c7_V_fu_72 + 5'd1);

assign add_ln840_fu_216_p2 = (c5_V_fu_84 + 6'd1);

assign and_ln1039_fu_262_p2 = (xor_ln1039_fu_251_p2 & icmp_ln282_fu_256_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((fifo_B_PE_0_7239_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((fifo_B_PE_0_7239_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((fifo_B_PE_0_7239_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_pp0_stage0_iter4 = (fifo_B_PE_0_7239_full_n == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign c7_V_1_fu_319_p3 = ((or_ln840_fu_314_p2[0:0] == 1'b1) ? 5'd1 : add_ln840_307_fu_308_p2);

assign empty_873_fu_274_p1 = add_ln840_306_fu_268_p2[5:0];

assign empty_874_fu_286_p2 = (tmp_s_fu_278_p3 + zext_ln280_fu_240_p1);

assign empty_fu_207_p2 = (tmp_fu_199_p3 + zext_ln278_fu_195_p1);

assign fifo_B_PE_0_7239_din = local_B_load_reg_404;

assign icmp_ln1039_209_fu_155_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 12'd1024) ? 1'b1 : 1'b0);

assign icmp_ln1039_fu_140_p2 = ((ap_sig_allocacmp_indvar_flatten18_load == 16'd32768) ? 1'b1 : 1'b0);

assign icmp_ln282_fu_256_p2 = ((c7_V_fu_72 == 5'd16) ? 1'b1 : 1'b0);

assign local_B_address0 = select_ln1039_616_cast_fu_342_p1;

assign or_ln840_fu_314_p2 = (icmp_ln1039_209_reg_385 | and_ln1039_fu_262_p2);

assign select_ln1039_410_fu_233_p3 = ((icmp_ln1039_209_reg_385[0:0] == 1'b1) ? add_ln840_fu_216_p2 : c5_V_fu_84);

assign select_ln1039_411_fu_244_p3 = ((icmp_ln1039_209_reg_385[0:0] == 1'b1) ? zext_ln1039_fu_229_p1 : empty_fu_207_p2);

assign select_ln1039_412_fu_292_p3 = ((and_ln1039_fu_262_p2[0:0] == 1'b1) ? empty_874_fu_286_p2 : select_ln1039_411_fu_244_p3);

assign select_ln1039_413_fu_300_p3 = ((and_ln1039_fu_262_p2[0:0] == 1'b1) ? add_ln840_306_fu_268_p2 : select_ln1039_fu_222_p3);

assign select_ln1039_414_fu_167_p3 = ((icmp_ln1039_209_fu_155_p2[0:0] == 1'b1) ? 12'd1 : add_ln1039_fu_161_p2);

assign select_ln1039_616_cast_fu_342_p1 = select_ln1039_412_reg_394;

assign select_ln1039_fu_222_p3 = ((icmp_ln1039_209_reg_385[0:0] == 1'b1) ? 7'd0 : c6_V_fu_76);

assign tmp_fu_199_p3 = {{trunc_ln1039_fu_191_p1}, {5'd0}};

assign tmp_s_fu_278_p3 = {{empty_873_fu_274_p1}, {5'd0}};

assign trunc_ln1039_fu_191_p1 = c6_V_fu_76[5:0];

assign xor_ln1039_fu_251_p2 = (icmp_ln1039_209_reg_385 ^ 1'd1);

assign zext_ln1039_fu_229_p1 = add_ln840_fu_216_p2;

assign zext_ln278_fu_195_p1 = c5_V_fu_84;

assign zext_ln280_fu_240_p1 = select_ln1039_410_fu_233_p3;

endmodule //kernel3_B_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_278_1_VITIS_LOOP_280_2_VITIS_LOOP_282