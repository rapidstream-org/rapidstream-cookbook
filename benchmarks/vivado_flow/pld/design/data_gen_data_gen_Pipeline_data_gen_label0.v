// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module data_gen_data_gen_Pipeline_data_gen_label0 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Output_2_V_TREADY,
        Output_2_V_TDATA,
        Output_2_V_TVALID
);

parameter    ap_ST_fsm_pp0_stage0 = 3'd1;
parameter    ap_ST_fsm_pp0_stage1 = 3'd2;
parameter    ap_ST_fsm_pp0_stage2 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   Output_2_V_TREADY;
output  [511:0] Output_2_V_TDATA;
output   Output_2_V_TVALID;

reg ap_idle;
reg[511:0] Output_2_V_TDATA;
reg Output_2_V_TVALID;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state4_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln120_fu_211_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_pp0_stage2;
reg   [0:0] icmp_ln120_reg_326;
reg    ap_block_state3_pp0_stage2_iter0;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage2_subdone;
wire   [11:0] triangle_3ds_0_address0;
reg    triangle_3ds_0_ce0;
wire   [7:0] triangle_3ds_0_q0;
wire   [11:0] triangle_3ds_1_address0;
reg    triangle_3ds_1_ce0;
wire   [7:0] triangle_3ds_1_q0;
wire   [11:0] triangle_3ds_2_address0;
reg    triangle_3ds_2_ce0;
wire   [7:0] triangle_3ds_2_q0;
wire   [11:0] triangle_3ds_3_address0;
reg    triangle_3ds_3_ce0;
wire   [7:0] triangle_3ds_3_q0;
wire   [11:0] triangle_3ds_4_address0;
reg    triangle_3ds_4_ce0;
wire   [7:0] triangle_3ds_4_q0;
wire   [11:0] triangle_3ds_5_address0;
reg    triangle_3ds_5_ce0;
wire   [7:0] triangle_3ds_5_q0;
wire   [11:0] triangle_3ds_6_address0;
reg    triangle_3ds_6_ce0;
wire   [7:0] triangle_3ds_6_q0;
wire   [11:0] triangle_3ds_7_address0;
reg    triangle_3ds_7_ce0;
wire   [7:0] triangle_3ds_7_q0;
wire   [11:0] triangle_3ds_8_address0;
reg    triangle_3ds_8_ce0;
wire   [7:0] triangle_3ds_8_q0;
reg    Output_2_V_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1;
wire    ap_block_pp0_stage2;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
reg   [511:0] p_Val2_load_reg_375;
reg    ap_block_state2_pp0_stage1_iter0;
reg    ap_block_state2_io;
reg    ap_block_pp0_stage1_11001;
reg   [7:0] triangle_3ds_4_load_reg_381;
reg   [7:0] triangle_3ds_5_load_reg_386;
reg   [7:0] triangle_3ds_6_load_reg_391;
reg   [7:0] triangle_3ds_7_load_reg_396;
reg   [7:0] triangle_3ds_8_load_reg_401;
wire   [511:0] p_Result_2_fu_296_p5;
reg   [511:0] p_Result_2_reg_406;
reg    ap_block_pp0_stage2_11001;
reg    ap_enable_reg_pp0_iter0_reg;
wire   [63:0] zext_ln120_fu_223_p1;
reg   [511:0] p_Val2_s_fu_66;
wire    ap_loop_init;
reg   [11:0] i_fu_70;
reg   [11:0] ap_sig_allocacmp_i_1;
wire   [11:0] add_ln120_fu_217_p2;
wire   [511:0] p_Result_s_fu_256_p5;
reg    ap_block_pp0_stage1_01001;
wire   [511:0] p_Result_1_fu_277_p5;
reg    ap_block_pp0_stage2_01001;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] tmp_fu_244_p5;
wire   [31:0] tmp_1_fu_269_p5;
wire   [31:0] tmp_2_fu_289_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
reg    ap_block_pp0_stage1_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

data_gen_data_gen_Pipeline_data_gen_label0_triangle_3ds_0 #(
    .DataWidth( 8 ),
    .AddressRange( 3192 ),
    .AddressWidth( 12 ))
triangle_3ds_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(triangle_3ds_0_address0),
    .ce0(triangle_3ds_0_ce0),
    .q0(triangle_3ds_0_q0)
);

data_gen_data_gen_Pipeline_data_gen_label0_triangle_3ds_1 #(
    .DataWidth( 8 ),
    .AddressRange( 3192 ),
    .AddressWidth( 12 ))
triangle_3ds_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(triangle_3ds_1_address0),
    .ce0(triangle_3ds_1_ce0),
    .q0(triangle_3ds_1_q0)
);

data_gen_data_gen_Pipeline_data_gen_label0_triangle_3ds_2 #(
    .DataWidth( 8 ),
    .AddressRange( 3192 ),
    .AddressWidth( 12 ))
triangle_3ds_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(triangle_3ds_2_address0),
    .ce0(triangle_3ds_2_ce0),
    .q0(triangle_3ds_2_q0)
);

data_gen_data_gen_Pipeline_data_gen_label0_triangle_3ds_3 #(
    .DataWidth( 8 ),
    .AddressRange( 3192 ),
    .AddressWidth( 12 ))
triangle_3ds_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(triangle_3ds_3_address0),
    .ce0(triangle_3ds_3_ce0),
    .q0(triangle_3ds_3_q0)
);

data_gen_data_gen_Pipeline_data_gen_label0_triangle_3ds_4 #(
    .DataWidth( 8 ),
    .AddressRange( 3192 ),
    .AddressWidth( 12 ))
triangle_3ds_4_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(triangle_3ds_4_address0),
    .ce0(triangle_3ds_4_ce0),
    .q0(triangle_3ds_4_q0)
);

data_gen_data_gen_Pipeline_data_gen_label0_triangle_3ds_5 #(
    .DataWidth( 8 ),
    .AddressRange( 3192 ),
    .AddressWidth( 12 ))
triangle_3ds_5_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(triangle_3ds_5_address0),
    .ce0(triangle_3ds_5_ce0),
    .q0(triangle_3ds_5_q0)
);

data_gen_data_gen_Pipeline_data_gen_label0_triangle_3ds_6 #(
    .DataWidth( 8 ),
    .AddressRange( 3192 ),
    .AddressWidth( 12 ))
triangle_3ds_6_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(triangle_3ds_6_address0),
    .ce0(triangle_3ds_6_ce0),
    .q0(triangle_3ds_6_q0)
);

data_gen_data_gen_Pipeline_data_gen_label0_triangle_3ds_7 #(
    .DataWidth( 8 ),
    .AddressRange( 3192 ),
    .AddressWidth( 12 ))
triangle_3ds_7_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(triangle_3ds_7_address0),
    .ce0(triangle_3ds_7_ce0),
    .q0(triangle_3ds_7_q0)
);

data_gen_data_gen_Pipeline_data_gen_label0_triangle_3ds_8 #(
    .DataWidth( 8 ),
    .AddressRange( 3192 ),
    .AddressWidth( 12 ))
triangle_3ds_8_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(triangle_3ds_8_address0),
    .ce0(triangle_3ds_8_ce0),
    .q0(triangle_3ds_8_q0)
);

data_gen_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln120_fu_211_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_70 <= add_ln120_fu_217_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_70 <= 12'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_Val2_s_fu_66 <= 512'd0;
    end else if (((icmp_ln120_reg_326 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        p_Val2_s_fu_66 <= p_Result_2_fu_296_p5;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln120_reg_326 <= icmp_ln120_fu_211_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln120_reg_326 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        p_Result_2_reg_406 <= p_Result_2_fu_296_p5;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln120_reg_326 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        p_Val2_load_reg_375 <= p_Val2_s_fu_66;
        triangle_3ds_4_load_reg_381 <= triangle_3ds_4_q0;
        triangle_3ds_5_load_reg_386 <= triangle_3ds_5_q0;
        triangle_3ds_6_load_reg_391 <= triangle_3ds_6_q0;
        triangle_3ds_7_load_reg_396 <= triangle_3ds_7_q0;
        triangle_3ds_8_load_reg_401 <= triangle_3ds_8_q0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        Output_2_V_TDATA = p_Result_2_reg_406;
    end else if (((icmp_ln120_reg_326 == 1'd0) & (1'b0 == ap_block_pp0_stage2_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        Output_2_V_TDATA = p_Result_1_fu_277_p5;
    end else if (((icmp_ln120_reg_326 == 1'd0) & (1'b0 == ap_block_pp0_stage1_01001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        Output_2_V_TDATA = p_Result_s_fu_256_p5;
    end else begin
        Output_2_V_TDATA = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln120_reg_326 == 1'd0) & (1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        Output_2_V_TDATA_blk_n = Output_2_V_TREADY;
    end else begin
        Output_2_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((icmp_ln120_reg_326 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        Output_2_V_TVALID = 1'b1;
    end else begin
        Output_2_V_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln120_fu_211_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
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
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_1 = 12'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_70;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        triangle_3ds_0_ce0 = 1'b1;
    end else begin
        triangle_3ds_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        triangle_3ds_1_ce0 = 1'b1;
    end else begin
        triangle_3ds_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        triangle_3ds_2_ce0 = 1'b1;
    end else begin
        triangle_3ds_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        triangle_3ds_3_ce0 = 1'b1;
    end else begin
        triangle_3ds_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        triangle_3ds_4_ce0 = 1'b1;
    end else begin
        triangle_3ds_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        triangle_3ds_5_ce0 = 1'b1;
    end else begin
        triangle_3ds_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        triangle_3ds_6_ce0 = 1'b1;
    end else begin
        triangle_3ds_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        triangle_3ds_7_ce0 = 1'b1;
    end else begin
        triangle_3ds_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        triangle_3ds_8_ce0 = 1'b1;
    end else begin
        triangle_3ds_8_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln120_fu_217_p2 = (ap_sig_allocacmp_i_1 + 12'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((1'b0 == Output_2_V_TREADY) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((1'b0 == Output_2_V_TREADY) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((1'b0 == Output_2_V_TREADY) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_01001 = ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage1_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY))));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY))));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage2_01001 = ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage2_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY))));
end

always @ (*) begin
    ap_block_pp0_stage2_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY))));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_io = ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY));
end

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY));
end

always @ (*) begin
    ap_block_state3_io = ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY));
end

always @ (*) begin
    ap_block_state3_pp0_stage2_iter0 = ((icmp_ln120_reg_326 == 1'd0) & (1'b0 == Output_2_V_TREADY));
end

always @ (*) begin
    ap_block_state4_pp0_stage0_iter1 = (1'b0 == Output_2_V_TREADY);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln120_fu_211_p2 = ((ap_sig_allocacmp_i_1 == 12'd3192) ? 1'b1 : 1'b0);

assign p_Result_1_fu_277_p5 = {{p_Val2_load_reg_375[511:32]}, {tmp_1_fu_269_p5}};

assign p_Result_2_fu_296_p5 = {{p_Val2_load_reg_375[511:32]}, {tmp_2_fu_289_p3}};

assign p_Result_s_fu_256_p5 = {{p_Val2_s_fu_66[511:32]}, {tmp_fu_244_p5}};

assign tmp_1_fu_269_p5 = {{{{triangle_3ds_7_load_reg_396}, {triangle_3ds_6_load_reg_391}}, {triangle_3ds_5_load_reg_386}}, {triangle_3ds_4_load_reg_381}};

assign tmp_2_fu_289_p3 = {{24'd0}, {triangle_3ds_8_load_reg_401}};

assign tmp_fu_244_p5 = {{{{triangle_3ds_3_q0}, {triangle_3ds_2_q0}}, {triangle_3ds_1_q0}}, {triangle_3ds_0_q0}};

assign triangle_3ds_0_address0 = zext_ln120_fu_223_p1;

assign triangle_3ds_1_address0 = zext_ln120_fu_223_p1;

assign triangle_3ds_2_address0 = zext_ln120_fu_223_p1;

assign triangle_3ds_3_address0 = zext_ln120_fu_223_p1;

assign triangle_3ds_4_address0 = zext_ln120_fu_223_p1;

assign triangle_3ds_5_address0 = zext_ln120_fu_223_p1;

assign triangle_3ds_6_address0 = zext_ln120_fu_223_p1;

assign triangle_3ds_7_address0 = zext_ln120_fu_223_p1;

assign triangle_3ds_8_address0 = zext_ln120_fu_223_p1;

assign zext_ln120_fu_223_p1 = ap_sig_allocacmp_i_1;

endmodule //data_gen_data_gen_Pipeline_data_gen_label0
