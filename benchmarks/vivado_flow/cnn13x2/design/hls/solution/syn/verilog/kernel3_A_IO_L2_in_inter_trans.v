// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module kernel3_A_IO_L2_in_inter_trans (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        idx_offset,
        local_A_address1,
        local_A_ce1,
        local_A_we1,
        local_A_d1,
        fifo_A_A_IO_L2_in_111411_dout,
        fifo_A_A_IO_L2_in_111411_num_data_valid,
        fifo_A_A_IO_L2_in_111411_fifo_cap,
        fifo_A_A_IO_L2_in_111411_empty_n,
        fifo_A_A_IO_L2_in_111411_read,
        fifo_A_A_IO_L2_in_1215_din,
        fifo_A_A_IO_L2_in_1215_num_data_valid,
        fifo_A_A_IO_L2_in_1215_fifo_cap,
        fifo_A_A_IO_L2_in_1215_full_n,
        fifo_A_A_IO_L2_in_1215_write
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [3:0] idx_offset;
output  [8:0] local_A_address1;
output   local_A_ce1;
output   local_A_we1;
output  [255:0] local_A_d1;
input  [255:0] fifo_A_A_IO_L2_in_111411_dout;
input  [1:0] fifo_A_A_IO_L2_in_111411_num_data_valid;
input  [1:0] fifo_A_A_IO_L2_in_111411_fifo_cap;
input   fifo_A_A_IO_L2_in_111411_empty_n;
output   fifo_A_A_IO_L2_in_111411_read;
output  [255:0] fifo_A_A_IO_L2_in_1215_din;
input  [1:0] fifo_A_A_IO_L2_in_1215_num_data_valid;
input  [1:0] fifo_A_A_IO_L2_in_1215_fifo_cap;
input   fifo_A_A_IO_L2_in_1215_full_n;
output   fifo_A_A_IO_L2_in_1215_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg fifo_A_A_IO_L2_in_111411_read;
reg fifo_A_A_IO_L2_in_1215_write;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] sub_ln77_fu_70_p2;
reg   [3:0] sub_ln77_reg_89;
wire   [12:0] tmp_fu_76_p3;
reg   [12:0] tmp_reg_94;
wire    ap_CS_fsm_state2;
wire    grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_start;
wire    grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_done;
wire    grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_idle;
wire    grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_ready;
wire    grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_fifo_A_A_IO_L2_in_111411_read;
wire   [255:0] grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_fifo_A_A_IO_L2_in_1215_din;
wire    grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_fifo_A_A_IO_L2_in_1215_write;
wire   [8:0] grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_address1;
wire    grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_ce1;
wire    grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_we1;
wire   [255:0] grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_d1;
reg    grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_start_reg;
wire    ap_CS_fsm_state3;
wire   [0:0] empty_fu_56_p2;
wire   [3:0] umax2_fu_62_p3;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_start_reg = 1'b0;
end

kernel3_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3 grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_start),
    .ap_done(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_done),
    .ap_idle(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_idle),
    .ap_ready(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_ready),
    .fifo_A_A_IO_L2_in_111411_dout(fifo_A_A_IO_L2_in_111411_dout),
    .fifo_A_A_IO_L2_in_111411_num_data_valid(2'd0),
    .fifo_A_A_IO_L2_in_111411_fifo_cap(2'd0),
    .fifo_A_A_IO_L2_in_111411_empty_n(fifo_A_A_IO_L2_in_111411_empty_n),
    .fifo_A_A_IO_L2_in_111411_read(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_fifo_A_A_IO_L2_in_111411_read),
    .fifo_A_A_IO_L2_in_1215_din(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_fifo_A_A_IO_L2_in_1215_din),
    .fifo_A_A_IO_L2_in_1215_num_data_valid(2'd0),
    .fifo_A_A_IO_L2_in_1215_fifo_cap(2'd0),
    .fifo_A_A_IO_L2_in_1215_full_n(fifo_A_A_IO_L2_in_1215_full_n),
    .fifo_A_A_IO_L2_in_1215_write(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_fifo_A_A_IO_L2_in_1215_write),
    .idx_offset(idx_offset),
    .bound5(tmp_reg_94),
    .local_A_address1(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_address1),
    .local_A_ce1(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_ce1),
    .local_A_we1(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_we1),
    .local_A_d1(grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_d1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_start_reg <= 1'b1;
        end else if ((grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_ready == 1'b1)) begin
            grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sub_ln77_reg_89 <= sub_ln77_fu_70_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        tmp_reg_94[12 : 9] <= tmp_fu_76_p3[12 : 9];
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

always @ (*) begin
    if ((grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3)))) begin
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
    if (((grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fifo_A_A_IO_L2_in_111411_read = grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_fifo_A_A_IO_L2_in_111411_read;
    end else begin
        fifo_A_A_IO_L2_in_111411_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fifo_A_A_IO_L2_in_1215_write = grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_fifo_A_A_IO_L2_in_1215_write;
    end else begin
        fifo_A_A_IO_L2_in_1215_write = 1'b0;
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
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign empty_fu_56_p2 = ((idx_offset > 4'd13) ? 1'b1 : 1'b0);

assign fifo_A_A_IO_L2_in_1215_din = grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_fifo_A_A_IO_L2_in_1215_din;

assign grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_start = grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_ap_start_reg;

assign local_A_address1 = grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_address1;

assign local_A_ce1 = grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_ce1;

assign local_A_d1 = grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_d1;

assign local_A_we1 = grp_A_IO_L2_in_inter_trans_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_79_2_VITIS_LOOP_81_3_fu_44_local_A_we1;

assign sub_ln77_fu_70_p2 = (umax2_fu_62_p3 - idx_offset);

assign tmp_fu_76_p3 = {{sub_ln77_reg_89}, {9'd0}};

assign umax2_fu_62_p3 = ((empty_fu_56_p2[0:0] == 1'b1) ? idx_offset : 4'd13);

always @ (posedge ap_clk) begin
    tmp_reg_94[8:0] <= 9'b000000000;
end

endmodule //kernel3_A_IO_L2_in_inter_trans