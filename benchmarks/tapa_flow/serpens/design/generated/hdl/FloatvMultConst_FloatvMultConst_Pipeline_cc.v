// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module FloatvMultConst_FloatvMultConst_Pipeline_cc (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        fifo_out_din,
        fifo_out_full_n,
        fifo_out_write,
        num_ite_Y,
        fifo_in_s_dout,
        fifo_in_s_empty_n,
        fifo_in_s_read,
        empty
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [512:0] fifo_out_din;
input   fifo_out_full_n;
output   fifo_out_write;
input  [31:0] num_ite_Y;
input  [512:0] fifo_in_s_dout;
input   fifo_in_s_empty_n;
output   fifo_in_s_read;
input  [31:0] empty;

reg ap_idle;
reg fifo_out_write;
reg fifo_in_s_read;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
reg   [0:0] p_vld_reg_562;
reg   [0:0] p_vld_reg_562_pp0_iter4_reg;
reg    ap_block_state6_pp0_stage0_iter5;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln149_fu_201_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    fifo_out_blk_n;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] p_vld_fu_207_p1;
reg   [0:0] p_vld_reg_562_pp0_iter1_reg;
reg   [0:0] p_vld_reg_562_pp0_iter2_reg;
reg   [0:0] p_vld_reg_562_pp0_iter3_reg;
wire   [31:0] trunc_ln78_fu_215_p1;
reg   [31:0] trunc_ln78_reg_566;
reg   [31:0] tmp_reg_571;
reg   [31:0] trunc_ln1_reg_576;
reg   [31:0] trunc_ln78_2_reg_581;
reg   [31:0] tmp_1_reg_586;
reg   [31:0] tmp_2_reg_591;
reg   [31:0] tmp_3_reg_596;
reg   [31:0] tmp_4_reg_601;
reg   [31:0] tmp_5_reg_606;
reg   [31:0] tmp_6_reg_611;
reg   [31:0] tmp_7_reg_616;
reg   [31:0] tmp_8_reg_621;
reg   [31:0] tmp_9_reg_626;
reg   [31:0] tmp_s_reg_631;
reg   [31:0] tmp_10_reg_636;
reg   [31:0] tmp_11_reg_641;
wire   [31:0] grp_fu_129_p2;
reg   [31:0] mul_i_reg_726;
wire   [31:0] grp_fu_133_p2;
reg   [31:0] mul_i_1_reg_731;
wire   [31:0] grp_fu_137_p2;
reg   [31:0] mul_i_2_reg_736;
wire   [31:0] grp_fu_141_p2;
reg   [31:0] mul_i_3_reg_741;
wire   [31:0] grp_fu_145_p2;
reg   [31:0] mul_i_4_reg_746;
wire   [31:0] grp_fu_149_p2;
reg   [31:0] mul_i_5_reg_751;
wire   [31:0] grp_fu_153_p2;
reg   [31:0] mul_i_6_reg_756;
wire   [31:0] grp_fu_157_p2;
reg   [31:0] mul_i_7_reg_761;
wire   [31:0] grp_fu_161_p2;
reg   [31:0] mul_i_8_reg_766;
wire   [31:0] grp_fu_165_p2;
reg   [31:0] mul_i_9_reg_771;
wire   [31:0] grp_fu_169_p2;
reg   [31:0] mul_i_s_reg_776;
wire   [31:0] grp_fu_173_p2;
reg   [31:0] mul_i_10_reg_781;
wire   [31:0] grp_fu_177_p2;
reg   [31:0] mul_i_11_reg_786;
wire   [31:0] grp_fu_181_p2;
reg   [31:0] mul_i_12_reg_791;
wire   [31:0] grp_fu_185_p2;
reg   [31:0] mul_i_13_reg_796;
wire   [31:0] grp_fu_189_p2;
reg   [31:0] mul_i_14_reg_801;
reg   [31:0] i_fu_100;
wire   [31:0] i_2_fu_369_p2;
wire    ap_loop_init;
reg   [31:0] ap_sig_allocacmp_i_1;
wire   [0:0] fifo_in_s_read_nbread_fu_116_p2_0;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] grp_fu_129_p0;
wire   [31:0] grp_fu_133_p0;
wire   [31:0] grp_fu_137_p0;
wire   [31:0] grp_fu_141_p0;
wire   [31:0] grp_fu_145_p0;
wire   [31:0] grp_fu_149_p0;
wire   [31:0] grp_fu_153_p0;
wire   [31:0] grp_fu_157_p0;
wire   [31:0] grp_fu_161_p0;
wire   [31:0] grp_fu_165_p0;
wire   [31:0] grp_fu_169_p0;
wire   [31:0] grp_fu_173_p0;
wire   [31:0] grp_fu_177_p0;
wire   [31:0] grp_fu_181_p0;
wire   [31:0] grp_fu_185_p0;
wire   [31:0] grp_fu_189_p0;
wire   [31:0] bitcast_ln151_15_fu_489_p1;
wire   [31:0] bitcast_ln151_14_fu_486_p1;
wire   [31:0] bitcast_ln151_13_fu_483_p1;
wire   [31:0] bitcast_ln151_12_fu_480_p1;
wire   [31:0] bitcast_ln151_11_fu_477_p1;
wire   [31:0] bitcast_ln151_10_fu_474_p1;
wire   [31:0] bitcast_ln151_9_fu_471_p1;
wire   [31:0] bitcast_ln151_8_fu_468_p1;
wire   [31:0] bitcast_ln151_7_fu_465_p1;
wire   [31:0] bitcast_ln151_6_fu_462_p1;
wire   [31:0] bitcast_ln151_5_fu_459_p1;
wire   [31:0] bitcast_ln151_4_fu_456_p1;
wire   [31:0] bitcast_ln151_3_fu_453_p1;
wire   [31:0] bitcast_ln151_2_fu_450_p1;
wire   [31:0] bitcast_ln151_1_fu_447_p1;
wire   [31:0] bitcast_ln151_fu_444_p1;
reg    grp_fu_129_ce;
reg    grp_fu_133_ce;
reg    grp_fu_137_ce;
reg    grp_fu_141_ce;
reg    grp_fu_145_ce;
reg    grp_fu_149_ce;
reg    grp_fu_153_ce;
reg    grp_fu_157_ce;
reg    grp_fu_161_ce;
reg    grp_fu_165_ce;
reg    grp_fu_169_ce;
reg    grp_fu_173_ce;
reg    grp_fu_177_ce;
reg    grp_fu_181_ce;
reg    grp_fu_185_ce;
reg    grp_fu_189_ce;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_622;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_done_reg = 1'b0;
end

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_129_p0),
    .din1(empty),
    .ce(grp_fu_129_ce),
    .dout(grp_fu_129_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U2(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_133_p0),
    .din1(empty),
    .ce(grp_fu_133_ce),
    .dout(grp_fu_133_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U3(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_137_p0),
    .din1(empty),
    .ce(grp_fu_137_ce),
    .dout(grp_fu_137_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U4(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_141_p0),
    .din1(empty),
    .ce(grp_fu_141_ce),
    .dout(grp_fu_141_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U5(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_145_p0),
    .din1(empty),
    .ce(grp_fu_145_ce),
    .dout(grp_fu_145_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U6(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_149_p0),
    .din1(empty),
    .ce(grp_fu_149_ce),
    .dout(grp_fu_149_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U7(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_153_p0),
    .din1(empty),
    .ce(grp_fu_153_ce),
    .dout(grp_fu_153_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U8(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_157_p0),
    .din1(empty),
    .ce(grp_fu_157_ce),
    .dout(grp_fu_157_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U9(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_161_p0),
    .din1(empty),
    .ce(grp_fu_161_ce),
    .dout(grp_fu_161_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U10(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_165_p0),
    .din1(empty),
    .ce(grp_fu_165_ce),
    .dout(grp_fu_165_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U11(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_169_p0),
    .din1(empty),
    .ce(grp_fu_169_ce),
    .dout(grp_fu_169_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U12(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_173_p0),
    .din1(empty),
    .ce(grp_fu_173_ce),
    .dout(grp_fu_173_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U13(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_177_p0),
    .din1(empty),
    .ce(grp_fu_177_ce),
    .dout(grp_fu_177_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U14(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_181_p0),
    .din1(empty),
    .ce(grp_fu_181_ce),
    .dout(grp_fu_181_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U15(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_185_p0),
    .din1(empty),
    .ce(grp_fu_185_ce),
    .dout(grp_fu_185_p2)
);

FloatvMultConst_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U16(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_189_p0),
    .din1(empty),
    .ce(grp_fu_189_ce),
    .dout(grp_fu_189_p2)
);

FloatvMultConst_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_622)) begin
            i_fu_100 <= i_2_fu_369_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_100 <= 32'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        p_vld_reg_562_pp0_iter1_reg <= p_vld_reg_562;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        p_vld_reg_562_pp0_iter2_reg <= p_vld_reg_562_pp0_iter1_reg;
        p_vld_reg_562_pp0_iter3_reg <= p_vld_reg_562_pp0_iter2_reg;
        p_vld_reg_562_pp0_iter4_reg <= p_vld_reg_562_pp0_iter3_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (p_vld_reg_562_pp0_iter3_reg == 1'd1))) begin
        mul_i_10_reg_781 <= grp_fu_173_p2;
        mul_i_11_reg_786 <= grp_fu_177_p2;
        mul_i_12_reg_791 <= grp_fu_181_p2;
        mul_i_13_reg_796 <= grp_fu_185_p2;
        mul_i_14_reg_801 <= grp_fu_189_p2;
        mul_i_1_reg_731 <= grp_fu_133_p2;
        mul_i_2_reg_736 <= grp_fu_137_p2;
        mul_i_3_reg_741 <= grp_fu_141_p2;
        mul_i_4_reg_746 <= grp_fu_145_p2;
        mul_i_5_reg_751 <= grp_fu_149_p2;
        mul_i_6_reg_756 <= grp_fu_153_p2;
        mul_i_7_reg_761 <= grp_fu_157_p2;
        mul_i_8_reg_766 <= grp_fu_161_p2;
        mul_i_9_reg_771 <= grp_fu_165_p2;
        mul_i_reg_726 <= grp_fu_129_p2;
        mul_i_s_reg_776 <= grp_fu_169_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln149_fu_201_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_vld_reg_562 <= fifo_in_s_read_nbread_fu_116_p2_0;
        tmp_reg_571 <= {{fifo_in_s_dout[447:416]}};
        trunc_ln1_reg_576 <= {{fifo_in_s_dout[479:448]}};
        trunc_ln78_2_reg_581 <= {{fifo_in_s_dout[511:480]}};
        trunc_ln78_reg_566 <= trunc_ln78_fu_215_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln149_fu_201_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (p_vld_fu_207_p1 == 1'd1))) begin
        tmp_10_reg_636 <= {{fifo_in_s_dout[383:352]}};
        tmp_11_reg_641 <= {{fifo_in_s_dout[415:384]}};
        tmp_1_reg_586 <= {{fifo_in_s_dout[63:32]}};
        tmp_2_reg_591 <= {{fifo_in_s_dout[95:64]}};
        tmp_3_reg_596 <= {{fifo_in_s_dout[127:96]}};
        tmp_4_reg_601 <= {{fifo_in_s_dout[159:128]}};
        tmp_5_reg_606 <= {{fifo_in_s_dout[191:160]}};
        tmp_6_reg_611 <= {{fifo_in_s_dout[223:192]}};
        tmp_7_reg_616 <= {{fifo_in_s_dout[255:224]}};
        tmp_8_reg_621 <= {{fifo_in_s_dout[287:256]}};
        tmp_9_reg_626 <= {{fifo_in_s_dout[319:288]}};
        tmp_s_reg_631 <= {{fifo_in_s_dout[351:320]}};
    end
end

always @ (*) begin
    if (((icmp_ln149_fu_201_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b1))) begin
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
    if (((ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_1 = 32'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_100;
    end
end

always @ (*) begin
    if (((fifo_in_s_empty_n == 1'b1) & (icmp_ln149_fu_201_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fifo_in_s_read = 1'b1;
    end else begin
        fifo_in_s_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (p_vld_reg_562_pp0_iter4_reg == 1'd1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        fifo_out_blk_n = fifo_out_full_n;
    end else begin
        fifo_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (p_vld_reg_562_pp0_iter4_reg == 1'd1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        fifo_out_write = 1'b1;
    end else begin
        fifo_out_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_129_ce = 1'b1;
    end else begin
        grp_fu_129_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_133_ce = 1'b1;
    end else begin
        grp_fu_133_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_137_ce = 1'b1;
    end else begin
        grp_fu_137_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_141_ce = 1'b1;
    end else begin
        grp_fu_141_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_145_ce = 1'b1;
    end else begin
        grp_fu_145_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_149_ce = 1'b1;
    end else begin
        grp_fu_149_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_153_ce = 1'b1;
    end else begin
        grp_fu_153_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_157_ce = 1'b1;
    end else begin
        grp_fu_157_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_161_ce = 1'b1;
    end else begin
        grp_fu_161_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_165_ce = 1'b1;
    end else begin
        grp_fu_165_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_169_ce = 1'b1;
    end else begin
        grp_fu_169_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_173_ce = 1'b1;
    end else begin
        grp_fu_173_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_177_ce = 1'b1;
    end else begin
        grp_fu_177_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_181_ce = 1'b1;
    end else begin
        grp_fu_181_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_185_ce = 1'b1;
    end else begin
        grp_fu_185_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_189_ce = 1'b1;
    end else begin
        grp_fu_189_ce = 1'b0;
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

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((p_vld_reg_562_pp0_iter4_reg == 1'd1) & (fifo_out_full_n == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((p_vld_reg_562_pp0_iter4_reg == 1'd1) & (fifo_out_full_n == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((p_vld_reg_562_pp0_iter4_reg == 1'd1) & (fifo_out_full_n == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state6_pp0_stage0_iter5 = ((p_vld_reg_562_pp0_iter4_reg == 1'd1) & (fifo_out_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_622 = ((icmp_ln149_fu_201_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (p_vld_fu_207_p1 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign bitcast_ln151_10_fu_474_p1 = mul_i_s_reg_776;

assign bitcast_ln151_11_fu_477_p1 = mul_i_10_reg_781;

assign bitcast_ln151_12_fu_480_p1 = mul_i_11_reg_786;

assign bitcast_ln151_13_fu_483_p1 = mul_i_12_reg_791;

assign bitcast_ln151_14_fu_486_p1 = mul_i_13_reg_796;

assign bitcast_ln151_15_fu_489_p1 = mul_i_14_reg_801;

assign bitcast_ln151_1_fu_447_p1 = mul_i_1_reg_731;

assign bitcast_ln151_2_fu_450_p1 = mul_i_2_reg_736;

assign bitcast_ln151_3_fu_453_p1 = mul_i_3_reg_741;

assign bitcast_ln151_4_fu_456_p1 = mul_i_4_reg_746;

assign bitcast_ln151_5_fu_459_p1 = mul_i_5_reg_751;

assign bitcast_ln151_6_fu_462_p1 = mul_i_6_reg_756;

assign bitcast_ln151_7_fu_465_p1 = mul_i_7_reg_761;

assign bitcast_ln151_8_fu_468_p1 = mul_i_8_reg_766;

assign bitcast_ln151_9_fu_471_p1 = mul_i_9_reg_771;

assign bitcast_ln151_fu_444_p1 = mul_i_reg_726;

assign fifo_in_s_read_nbread_fu_116_p2_0 = fifo_in_s_empty_n;

assign fifo_out_din = {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{1'd0}, {bitcast_ln151_15_fu_489_p1}}}, {bitcast_ln151_14_fu_486_p1}}}, {bitcast_ln151_13_fu_483_p1}}}, {bitcast_ln151_12_fu_480_p1}}}, {bitcast_ln151_11_fu_477_p1}}}, {bitcast_ln151_10_fu_474_p1}}}, {bitcast_ln151_9_fu_471_p1}}}, {bitcast_ln151_8_fu_468_p1}}}, {bitcast_ln151_7_fu_465_p1}}}, {bitcast_ln151_6_fu_462_p1}}}, {bitcast_ln151_5_fu_459_p1}}}, {bitcast_ln151_4_fu_456_p1}}}, {bitcast_ln151_3_fu_453_p1}}}, {bitcast_ln151_2_fu_450_p1}}}, {bitcast_ln151_1_fu_447_p1}}}, {bitcast_ln151_fu_444_p1}};

assign grp_fu_129_p0 = trunc_ln78_reg_566;

assign grp_fu_133_p0 = tmp_1_reg_586;

assign grp_fu_137_p0 = tmp_2_reg_591;

assign grp_fu_141_p0 = tmp_3_reg_596;

assign grp_fu_145_p0 = tmp_4_reg_601;

assign grp_fu_149_p0 = tmp_5_reg_606;

assign grp_fu_153_p0 = tmp_6_reg_611;

assign grp_fu_157_p0 = tmp_7_reg_616;

assign grp_fu_161_p0 = tmp_8_reg_621;

assign grp_fu_165_p0 = tmp_9_reg_626;

assign grp_fu_169_p0 = tmp_s_reg_631;

assign grp_fu_173_p0 = tmp_10_reg_636;

assign grp_fu_177_p0 = tmp_11_reg_641;

assign grp_fu_181_p0 = tmp_reg_571;

assign grp_fu_185_p0 = trunc_ln1_reg_576;

assign grp_fu_189_p0 = trunc_ln78_2_reg_581;

assign i_2_fu_369_p2 = (ap_sig_allocacmp_i_1 + 32'd1);

assign icmp_ln149_fu_201_p2 = (($signed(ap_sig_allocacmp_i_1) < $signed(num_ite_Y)) ? 1'b1 : 1'b0);

assign p_vld_fu_207_p1 = fifo_in_s_read_nbread_fu_116_p2_0;

assign trunc_ln78_fu_215_p1 = fifo_in_s_dout[31:0];

endmodule //FloatvMultConst_FloatvMultConst_Pipeline_cc
