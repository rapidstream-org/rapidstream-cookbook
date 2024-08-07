// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module data_redir_m_rasterization1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        triangle_2d_x0,
        triangle_2d_y0,
        triangle_2d_x1,
        triangle_2d_y1,
        triangle_2d_x2,
        triangle_2d_y2,
        triangle_2d_z,
        Output_1_V_TDATA,
        Output_1_V_TVALID,
        Output_1_V_TREADY,
        Output_2_V_TDATA,
        Output_2_V_TVALID,
        Output_2_V_TREADY
);

parameter    ap_ST_fsm_state1 = 16'd1;
parameter    ap_ST_fsm_state2 = 16'd2;
parameter    ap_ST_fsm_state3 = 16'd4;
parameter    ap_ST_fsm_state4 = 16'd8;
parameter    ap_ST_fsm_state5 = 16'd16;
parameter    ap_ST_fsm_state6 = 16'd32;
parameter    ap_ST_fsm_state7 = 16'd64;
parameter    ap_ST_fsm_state8 = 16'd128;
parameter    ap_ST_fsm_state9 = 16'd256;
parameter    ap_ST_fsm_state10 = 16'd512;
parameter    ap_ST_fsm_state11 = 16'd1024;
parameter    ap_ST_fsm_state12 = 16'd2048;
parameter    ap_ST_fsm_state13 = 16'd4096;
parameter    ap_ST_fsm_state14 = 16'd8192;
parameter    ap_ST_fsm_state15 = 16'd16384;
parameter    ap_ST_fsm_state16 = 16'd32768;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] triangle_2d_x0;
input  [7:0] triangle_2d_y0;
input  [7:0] triangle_2d_x1;
input  [7:0] triangle_2d_y1;
input  [7:0] triangle_2d_x2;
input  [7:0] triangle_2d_y2;
input  [7:0] triangle_2d_z;
output  [31:0] Output_1_V_TDATA;
output   Output_1_V_TVALID;
input   Output_1_V_TREADY;
output  [31:0] Output_2_V_TDATA;
output   Output_2_V_TVALID;
input   Output_2_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] Output_1_V_TDATA;
reg Output_1_V_TVALID;
reg[31:0] Output_2_V_TDATA;
reg Output_2_V_TVALID;

(* fsm_encoding = "none" *) reg   [15:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [0:0] parity;
reg   [15:0] max_index_V;
reg   [7:0] max_min_V_4;
reg   [7:0] max_min_V_3;
reg   [7:0] max_min_V_2;
reg   [7:0] max_min_V_1;
reg   [7:0] max_min_V;
reg    Output_1_V_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln153_fu_221_p2;
wire    ap_CS_fsm_state10;
wire    ap_CS_fsm_state11;
wire    ap_CS_fsm_state12;
wire    ap_CS_fsm_state3;
reg   [0:0] parity_load_reg_650;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
reg    Output_2_V_TDATA_blk_n;
wire    ap_CS_fsm_state13;
wire    ap_CS_fsm_state14;
wire    ap_CS_fsm_state15;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
wire   [17:0] ret_17_fu_177_p2;
reg   [17:0] ret_17_reg_630;
wire   [17:0] ret_20_fu_211_p2;
reg   [17:0] ret_20_reg_636;
wire   [7:0] triangle_2d_same_y1_V_fu_237_p3;
reg   [7:0] triangle_2d_same_y1_V_reg_654;
wire   [7:0] triangle_2d_same_x1_V_fu_243_p3;
reg   [7:0] triangle_2d_same_x1_V_reg_659;
wire   [7:0] triangle_2d_same_y0_V_fu_249_p3;
reg   [7:0] triangle_2d_same_y0_V_reg_664;
wire   [7:0] triangle_2d_same_x0_V_fu_255_p3;
reg   [7:0] triangle_2d_same_x0_V_reg_669;
wire   [7:0] rhs_5_fu_291_p3;
reg   [7:0] rhs_5_reg_674;
wire   [7:0] lhs_5_fu_335_p3;
reg   [7:0] lhs_5_reg_680;
wire   [7:0] rhs_6_fu_379_p3;
reg   [7:0] rhs_6_reg_686;
wire   [7:0] lhs_6_fu_423_p3;
reg   [7:0] lhs_6_reg_692;
wire   [31:0] p_Result_s_fu_449_p4;
reg   [31:0] p_Result_s_reg_698;
wire   [31:0] p_Result_1_fu_471_p5;
reg   [31:0] p_Result_1_reg_704;
wire   [31:0] p_Result_3_fu_548_p5;
reg   [31:0] p_Result_3_reg_710;
wire   [31:0] p_Result_4_fu_556_p4;
reg   [31:0] p_Result_4_reg_716;
wire   [31:0] p_Result_5_fu_564_p5;
reg   [31:0] p_Result_5_reg_722;
reg   [0:0] storemerge10_reg_122;
wire    ap_CS_fsm_state16;
wire   [15:0] mul_ln223_fu_525_p2;
reg    ap_block_state3;
reg    ap_block_state3_io;
reg    ap_predicate_op88_write_state2;
reg    ap_predicate_op89_write_state2;
reg    ap_block_state2;
reg    ap_block_state2_io;
wire   [7:0] trunc_ln223_fu_495_p1;
wire   [31:0] p_Result_2_fu_537_p5;
wire   [8:0] zext_ln225_fu_141_p1;
wire   [8:0] zext_ln1526_fu_145_p1;
wire   [8:0] zext_ln225_1_fu_155_p1;
wire   [8:0] zext_ln1526_1_fu_159_p1;
wire  signed [8:0] ret_15_fu_149_p2;
wire  signed [8:0] ret_16_fu_163_p2;
wire   [8:0] zext_ln1526_2_fu_183_p1;
wire   [8:0] zext_ln1526_3_fu_193_p1;
wire  signed [8:0] ret_18_fu_187_p2;
wire  signed [8:0] ret_19_fu_197_p2;
wire   [17:0] ret_fu_217_p2;
wire   [0:0] tmp_fu_229_p3;
wire   [0:0] icmp_ln1057_1_fu_267_p2;
wire   [0:0] icmp_ln1057_2_fu_279_p2;
wire   [0:0] icmp_ln1057_fu_261_p2;
wire   [7:0] select_ln41_fu_272_p3;
wire   [7:0] select_ln48_fu_284_p3;
wire   [0:0] icmp_ln1065_1_fu_311_p2;
wire   [0:0] icmp_ln1065_2_fu_323_p2;
wire   [0:0] icmp_ln1065_fu_305_p2;
wire   [7:0] select_ln61_fu_316_p3;
wire   [7:0] select_ln68_fu_328_p3;
wire   [0:0] icmp_ln1057_4_fu_355_p2;
wire   [0:0] icmp_ln1057_5_fu_367_p2;
wire   [0:0] icmp_ln1057_3_fu_349_p2;
wire   [7:0] select_ln41_1_fu_360_p3;
wire   [7:0] select_ln48_1_fu_372_p3;
wire   [0:0] icmp_ln1065_4_fu_399_p2;
wire   [0:0] icmp_ln1065_5_fu_411_p2;
wire   [0:0] icmp_ln1065_3_fu_393_p2;
wire   [7:0] select_ln61_1_fu_404_p3;
wire   [7:0] select_ln68_1_fu_416_p3;
wire   [8:0] zext_ln225_2_fu_483_p1;
wire   [8:0] zext_ln225_3_fu_486_p1;
wire  signed [8:0] ret_13_fu_489_p2;
wire   [8:0] zext_ln225_4_fu_505_p1;
wire   [8:0] zext_ln225_5_fu_508_p1;
wire  signed [8:0] ret_14_fu_511_p2;
reg   [15:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
reg    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
reg    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
reg    ap_ST_fsm_state11_blk;
reg    ap_ST_fsm_state12_blk;
reg    ap_ST_fsm_state13_blk;
reg    ap_ST_fsm_state14_blk;
reg    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 16'd1;
#0 parity = 1'd0;
#0 max_index_V = 16'd0;
#0 max_min_V_4 = 8'd0;
#0 max_min_V_3 = 8'd0;
#0 max_min_V_2 = 8'd0;
#0 max_min_V_1 = 8'd0;
#0 max_min_V = 8'd0;
end

data_redir_m_mul_9s_9s_18_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 9 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 18 ))
mul_9s_9s_18_1_1_U11(
    .din0(ret_15_fu_149_p2),
    .din1(ret_16_fu_163_p2),
    .dout(ret_17_fu_177_p2)
);

data_redir_m_mul_9s_9s_18_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 9 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 18 ))
mul_9s_9s_18_1_1_U12(
    .din0(ret_18_fu_187_p2),
    .din1(ret_19_fu_197_p2),
    .dout(ret_20_fu_211_p2)
);

data_redir_m_mul_9s_9s_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 9 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 16 ))
mul_9s_9s_16_1_1_U13(
    .din0(ret_13_fu_489_p2),
    .din1(ret_14_fu_511_p2),
    .dout(mul_ln223_fu_525_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b1 == ap_CS_fsm_state12) & (1'b1 == Output_1_V_TREADY)) | ((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state6)))) begin
        storemerge10_reg_122 <= 1'd1;
    end else if ((((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state9)) | ((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state15)))) begin
        storemerge10_reg_122 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln153_fu_221_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        lhs_5_reg_680 <= lhs_5_fu_335_p3;
        lhs_6_reg_692 <= lhs_6_fu_423_p3;
        rhs_5_reg_674 <= rhs_5_fu_291_p3;
        rhs_6_reg_686 <= rhs_6_fu_379_p3;
        triangle_2d_same_x0_V_reg_669 <= triangle_2d_same_x0_V_fu_255_p3;
        triangle_2d_same_x1_V_reg_659 <= triangle_2d_same_x1_V_fu_243_p3;
        triangle_2d_same_y0_V_reg_664 <= triangle_2d_same_y0_V_fu_249_p3;
        triangle_2d_same_y1_V_reg_654 <= triangle_2d_same_y1_V_fu_237_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state3_io) | ((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY))) & (1'b1 == ap_CS_fsm_state3))) begin
        max_index_V <= mul_ln223_fu_525_p2;
        max_min_V <= trunc_ln223_fu_495_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1))) & (icmp_ln153_fu_221_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        max_min_V_1 <= lhs_6_fu_423_p3;
        max_min_V_2 <= rhs_6_fu_379_p3;
        max_min_V_3 <= lhs_5_fu_335_p3;
        max_min_V_4 <= rhs_5_fu_291_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln153_fu_221_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        p_Result_1_reg_704[23 : 0] <= p_Result_1_fu_471_p5[23 : 0];
        p_Result_s_reg_698 <= p_Result_s_fu_449_p4;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        p_Result_3_reg_710 <= p_Result_3_fu_548_p5;
        p_Result_4_reg_716 <= p_Result_4_fu_556_p4;
        p_Result_5_reg_722[23 : 0] <= p_Result_5_fu_564_p5[23 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        parity <= storemerge10_reg_122;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        parity_load_reg_650 <= parity;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        ret_17_reg_630 <= ret_17_fu_177_p2;
        ret_20_reg_636 <= ret_20_fu_211_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state12) & (1'b1 == Output_1_V_TREADY))) begin
        Output_1_V_TDATA = p_Result_1_reg_704;
    end else if (((1'b1 == ap_CS_fsm_state11) & (1'b1 == Output_1_V_TREADY))) begin
        Output_1_V_TDATA = p_Result_s_reg_698;
    end else if (((1'b1 == ap_CS_fsm_state10) & (1'b1 == Output_1_V_TREADY))) begin
        Output_1_V_TDATA = 32'd0;
    end else if (((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state6))) begin
        Output_1_V_TDATA = p_Result_5_reg_722;
    end else if (((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state5))) begin
        Output_1_V_TDATA = p_Result_4_reg_716;
    end else if (((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state4))) begin
        Output_1_V_TDATA = p_Result_3_reg_710;
    end else if ((~(((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY))) & (parity_load_reg_650 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        Output_1_V_TDATA = p_Result_2_fu_537_p5;
    end else if ((~(((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1))) & (ap_predicate_op88_write_state2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        Output_1_V_TDATA = 32'd1;
    end else begin
        Output_1_V_TDATA = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | ((parity_load_reg_650 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) | ((parity == 1'd0) & (icmp_ln153_fu_221_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        Output_1_V_TDATA_blk_n = Output_1_V_TREADY;
    end else begin
        Output_1_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state12) & (1'b1 == Output_1_V_TREADY)) | ((1'b1 == ap_CS_fsm_state11) & (1'b1 == Output_1_V_TREADY)) | ((1'b1 == ap_CS_fsm_state10) & (1'b1 == Output_1_V_TREADY)) | (~((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1))) & (ap_predicate_op88_write_state2 == 1'b1) & (1'b1 == ap_CS_fsm_state2)) | (~((1'b1 == ap_block_state3_io) | ((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY))) & (parity_load_reg_650 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) | ((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state6)) | ((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state5)) | ((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state4)))) begin
        Output_1_V_TVALID = 1'b1;
    end else begin
        Output_1_V_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state15))) begin
        Output_2_V_TDATA = p_Result_1_reg_704;
    end else if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state14))) begin
        Output_2_V_TDATA = p_Result_s_reg_698;
    end else if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state13))) begin
        Output_2_V_TDATA = 32'd0;
    end else if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state9))) begin
        Output_2_V_TDATA = p_Result_5_reg_722;
    end else if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state8))) begin
        Output_2_V_TDATA = p_Result_4_reg_716;
    end else if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state7))) begin
        Output_2_V_TDATA = p_Result_3_reg_710;
    end else if ((~(((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY))) & (parity_load_reg_650 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        Output_2_V_TDATA = p_Result_2_fu_537_p5;
    end else if ((~(((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1))) & (ap_predicate_op89_write_state2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        Output_2_V_TDATA = 32'd1;
    end else begin
        Output_2_V_TDATA = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state15) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state13) | ((parity_load_reg_650 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) | ((parity == 1'd1) & (icmp_ln153_fu_221_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        Output_2_V_TDATA_blk_n = Output_2_V_TREADY;
    end else begin
        Output_2_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((~((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1))) & (ap_predicate_op89_write_state2 == 1'b1) & (1'b1 == ap_CS_fsm_state2)) | (~((1'b1 == ap_block_state3_io) | ((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY))) & (parity_load_reg_650 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) | ((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state9)) | ((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state8)) | ((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state7)) | ((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state15)) | ((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state14)) | ((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state13)))) begin
        Output_2_V_TVALID = 1'b1;
    end else begin
        Output_2_V_TVALID = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_V_TREADY)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_V_TREADY)) begin
        ap_ST_fsm_state11_blk = 1'b1;
    end else begin
        ap_ST_fsm_state11_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_V_TREADY)) begin
        ap_ST_fsm_state12_blk = 1'b1;
    end else begin
        ap_ST_fsm_state12_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_2_V_TREADY)) begin
        ap_ST_fsm_state13_blk = 1'b1;
    end else begin
        ap_ST_fsm_state13_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_2_V_TREADY)) begin
        ap_ST_fsm_state14_blk = 1'b1;
    end else begin
        ap_ST_fsm_state14_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_2_V_TREADY)) begin
        ap_ST_fsm_state15_blk = 1'b1;
    end else begin
        ap_ST_fsm_state15_blk = 1'b0;
    end
end

assign ap_ST_fsm_state16_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state3_io) | ((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY)))) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_V_TREADY)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_V_TREADY)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_V_TREADY)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_2_V_TREADY)) begin
        ap_ST_fsm_state7_blk = 1'b1;
    end else begin
        ap_ST_fsm_state7_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_2_V_TREADY)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_2_V_TREADY)) begin
        ap_ST_fsm_state9_blk = 1'b1;
    end else begin
        ap_ST_fsm_state9_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state16) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1))) & (parity == 1'd1) & (icmp_ln153_fu_221_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else if ((~((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1))) & (parity == 1'd0) & (icmp_ln153_fu_221_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else if ((~((1'b1 == ap_block_state2_io) | ((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1))) & (icmp_ln153_fu_221_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((1'b1 == ap_block_state3_io) | ((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY))) & (parity_load_reg_650 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else if ((~((1'b1 == ap_block_state3_io) | ((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY))) & (parity_load_reg_650 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == Output_1_V_TREADY) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (1'b1 == Output_1_V_TREADY))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((1'b1 == ap_CS_fsm_state11) & (1'b1 == Output_1_V_TREADY))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        ap_ST_fsm_state12 : begin
            if (((1'b1 == ap_CS_fsm_state12) & (1'b1 == Output_1_V_TREADY))) begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end
        end
        ap_ST_fsm_state13 : begin
            if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state13))) begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end
        end
        ap_ST_fsm_state14 : begin
            if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state14))) begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end
        end
        ap_ST_fsm_state15 : begin
            if (((1'b1 == Output_2_V_TREADY) & (1'b1 == ap_CS_fsm_state15))) begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state2 = (((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1)));
end

always @ (*) begin
    ap_block_state2_io = (((1'b0 == Output_1_V_TREADY) & (ap_predicate_op88_write_state2 == 1'b1)) | ((1'b0 == Output_2_V_TREADY) & (ap_predicate_op89_write_state2 == 1'b1)));
end

always @ (*) begin
    ap_block_state3 = (((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY)));
end

always @ (*) begin
    ap_block_state3_io = (((parity_load_reg_650 == 1'd0) & (1'b0 == Output_1_V_TREADY)) | ((parity_load_reg_650 == 1'd1) & (1'b0 == Output_2_V_TREADY)));
end

always @ (*) begin
    ap_predicate_op88_write_state2 = ((parity == 1'd0) & (icmp_ln153_fu_221_p2 == 1'd1));
end

always @ (*) begin
    ap_predicate_op89_write_state2 = ((parity == 1'd1) & (icmp_ln153_fu_221_p2 == 1'd1));
end

assign icmp_ln1057_1_fu_267_p2 = ((triangle_2d_same_x0_V_fu_255_p3 < triangle_2d_x2) ? 1'b1 : 1'b0);

assign icmp_ln1057_2_fu_279_p2 = ((triangle_2d_same_x1_V_fu_243_p3 < triangle_2d_x2) ? 1'b1 : 1'b0);

assign icmp_ln1057_3_fu_349_p2 = ((triangle_2d_same_y0_V_fu_249_p3 < triangle_2d_same_y1_V_fu_237_p3) ? 1'b1 : 1'b0);

assign icmp_ln1057_4_fu_355_p2 = ((triangle_2d_same_y0_V_fu_249_p3 < triangle_2d_y2) ? 1'b1 : 1'b0);

assign icmp_ln1057_5_fu_367_p2 = ((triangle_2d_same_y1_V_fu_237_p3 < triangle_2d_y2) ? 1'b1 : 1'b0);

assign icmp_ln1057_fu_261_p2 = ((triangle_2d_same_x0_V_fu_255_p3 < triangle_2d_same_x1_V_fu_243_p3) ? 1'b1 : 1'b0);

assign icmp_ln1065_1_fu_311_p2 = ((triangle_2d_same_x0_V_fu_255_p3 > triangle_2d_x2) ? 1'b1 : 1'b0);

assign icmp_ln1065_2_fu_323_p2 = ((triangle_2d_same_x1_V_fu_243_p3 > triangle_2d_x2) ? 1'b1 : 1'b0);

assign icmp_ln1065_3_fu_393_p2 = ((triangle_2d_same_y0_V_fu_249_p3 > triangle_2d_same_y1_V_fu_237_p3) ? 1'b1 : 1'b0);

assign icmp_ln1065_4_fu_399_p2 = ((triangle_2d_same_y0_V_fu_249_p3 > triangle_2d_y2) ? 1'b1 : 1'b0);

assign icmp_ln1065_5_fu_411_p2 = ((triangle_2d_same_y1_V_fu_237_p3 > triangle_2d_y2) ? 1'b1 : 1'b0);

assign icmp_ln1065_fu_305_p2 = ((triangle_2d_same_x0_V_fu_255_p3 > triangle_2d_same_x1_V_fu_243_p3) ? 1'b1 : 1'b0);

assign icmp_ln153_fu_221_p2 = ((ret_17_reg_630 == ret_20_reg_636) ? 1'b1 : 1'b0);

assign lhs_5_fu_335_p3 = ((icmp_ln1065_fu_305_p2[0:0] == 1'b1) ? select_ln61_fu_316_p3 : select_ln68_fu_328_p3);

assign lhs_6_fu_423_p3 = ((icmp_ln1065_3_fu_393_p2[0:0] == 1'b1) ? select_ln61_1_fu_404_p3 : select_ln68_1_fu_416_p3);

assign p_Result_1_fu_471_p5 = {{{{{{8'd0}, {max_min_V}}}, {max_min_V_1}}}, {max_min_V_2}};

assign p_Result_2_fu_537_p5 = {{{{triangle_2d_same_x1_V_reg_659}, {triangle_2d_same_y0_V_reg_664}}, {triangle_2d_same_x0_V_reg_669}}, {8'd0}};

assign p_Result_3_fu_548_p5 = {{{{triangle_2d_z}, {triangle_2d_y2}}, {triangle_2d_x2}}, {triangle_2d_same_y1_V_reg_654}};

assign p_Result_4_fu_556_p4 = {{{lhs_5_reg_680}, {rhs_5_reg_674}}, {mul_ln223_fu_525_p2}};

assign p_Result_5_fu_564_p5 = {{{{{{8'd0}, {trunc_ln223_fu_495_p1}}}, {lhs_6_reg_692}}}, {rhs_6_reg_686}};

assign p_Result_s_fu_449_p4 = {{{max_min_V_3}, {max_min_V_4}}, {max_index_V}};

assign ret_13_fu_489_p2 = (zext_ln225_2_fu_483_p1 - zext_ln225_3_fu_486_p1);

assign ret_14_fu_511_p2 = (zext_ln225_4_fu_505_p1 - zext_ln225_5_fu_508_p1);

assign ret_15_fu_149_p2 = (zext_ln225_fu_141_p1 - zext_ln1526_fu_145_p1);

assign ret_16_fu_163_p2 = (zext_ln225_1_fu_155_p1 - zext_ln1526_1_fu_159_p1);

assign ret_18_fu_187_p2 = (zext_ln1526_2_fu_183_p1 - zext_ln1526_1_fu_159_p1);

assign ret_19_fu_197_p2 = (zext_ln1526_3_fu_193_p1 - zext_ln1526_fu_145_p1);

assign ret_fu_217_p2 = (ret_17_reg_630 - ret_20_reg_636);

assign rhs_5_fu_291_p3 = ((icmp_ln1057_fu_261_p2[0:0] == 1'b1) ? select_ln41_fu_272_p3 : select_ln48_fu_284_p3);

assign rhs_6_fu_379_p3 = ((icmp_ln1057_3_fu_349_p2[0:0] == 1'b1) ? select_ln41_1_fu_360_p3 : select_ln48_1_fu_372_p3);

assign select_ln41_1_fu_360_p3 = ((icmp_ln1057_4_fu_355_p2[0:0] == 1'b1) ? triangle_2d_same_y0_V_fu_249_p3 : triangle_2d_y2);

assign select_ln41_fu_272_p3 = ((icmp_ln1057_1_fu_267_p2[0:0] == 1'b1) ? triangle_2d_same_x0_V_fu_255_p3 : triangle_2d_x2);

assign select_ln48_1_fu_372_p3 = ((icmp_ln1057_5_fu_367_p2[0:0] == 1'b1) ? triangle_2d_same_y1_V_fu_237_p3 : triangle_2d_y2);

assign select_ln48_fu_284_p3 = ((icmp_ln1057_2_fu_279_p2[0:0] == 1'b1) ? triangle_2d_same_x1_V_fu_243_p3 : triangle_2d_x2);

assign select_ln61_1_fu_404_p3 = ((icmp_ln1065_4_fu_399_p2[0:0] == 1'b1) ? triangle_2d_same_y0_V_fu_249_p3 : triangle_2d_y2);

assign select_ln61_fu_316_p3 = ((icmp_ln1065_1_fu_311_p2[0:0] == 1'b1) ? triangle_2d_same_x0_V_fu_255_p3 : triangle_2d_x2);

assign select_ln68_1_fu_416_p3 = ((icmp_ln1065_5_fu_411_p2[0:0] == 1'b1) ? triangle_2d_same_y1_V_fu_237_p3 : triangle_2d_y2);

assign select_ln68_fu_328_p3 = ((icmp_ln1065_2_fu_323_p2[0:0] == 1'b1) ? triangle_2d_same_x1_V_fu_243_p3 : triangle_2d_x2);

assign tmp_fu_229_p3 = ret_fu_217_p2[32'd17];

assign triangle_2d_same_x0_V_fu_255_p3 = ((tmp_fu_229_p3[0:0] == 1'b1) ? triangle_2d_x1 : triangle_2d_x0);

assign triangle_2d_same_x1_V_fu_243_p3 = ((tmp_fu_229_p3[0:0] == 1'b1) ? triangle_2d_x0 : triangle_2d_x1);

assign triangle_2d_same_y0_V_fu_249_p3 = ((tmp_fu_229_p3[0:0] == 1'b1) ? triangle_2d_y1 : triangle_2d_y0);

assign triangle_2d_same_y1_V_fu_237_p3 = ((tmp_fu_229_p3[0:0] == 1'b1) ? triangle_2d_y0 : triangle_2d_y1);

assign trunc_ln223_fu_495_p1 = ret_13_fu_489_p2[7:0];

assign zext_ln1526_1_fu_159_p1 = triangle_2d_y0;

assign zext_ln1526_2_fu_183_p1 = triangle_2d_y2;

assign zext_ln1526_3_fu_193_p1 = triangle_2d_x1;

assign zext_ln1526_fu_145_p1 = triangle_2d_x0;

assign zext_ln225_1_fu_155_p1 = triangle_2d_y1;

assign zext_ln225_2_fu_483_p1 = lhs_5_reg_680;

assign zext_ln225_3_fu_486_p1 = rhs_5_reg_674;

assign zext_ln225_4_fu_505_p1 = lhs_6_reg_692;

assign zext_ln225_5_fu_508_p1 = rhs_6_reg_686;

assign zext_ln225_fu_141_p1 = triangle_2d_x2;

always @ (posedge ap_clk) begin
    p_Result_1_reg_704[31:24] <= 8'b00000000;
    p_Result_5_reg_722[31:24] <= 8'b00000000;
end

endmodule //data_redir_m_rasterization1
