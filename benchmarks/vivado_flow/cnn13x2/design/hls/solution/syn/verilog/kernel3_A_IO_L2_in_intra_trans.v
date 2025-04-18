// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module kernel3_A_IO_L2_in_intra_trans (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        local_A_address0,
        local_A_ce0,
        local_A_q0,
        fifo_A_PE_12_054_din,
        fifo_A_PE_12_054_num_data_valid,
        fifo_A_PE_12_054_fifo_cap,
        fifo_A_PE_12_054_full_n,
        fifo_A_PE_12_054_write,
        intra_trans_en_offset
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [8:0] local_A_address0;
output   local_A_ce0;
input  [255:0] local_A_q0;
output  [255:0] fifo_A_PE_12_054_din;
input  [1:0] fifo_A_PE_12_054_num_data_valid;
input  [1:0] fifo_A_PE_12_054_fifo_cap;
input   fifo_A_PE_12_054_full_n;
output   fifo_A_PE_12_054_write;
input  [0:0] intra_trans_en_offset;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg fifo_A_PE_12_054_write;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_start;
wire    grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_done;
wire    grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_idle;
wire    grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_ready;
wire   [255:0] grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_fifo_A_PE_12_054_din;
wire    grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_fifo_A_PE_12_054_write;
wire   [8:0] grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_local_A_address0;
wire    grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_local_A_ce0;
reg    grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_start_reg;
wire    ap_CS_fsm_state2;
reg    ap_block_state2_on_subcall_done;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_start_reg = 1'b0;
end

kernel3_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3 grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_start),
    .ap_done(grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_done),
    .ap_idle(grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_idle),
    .ap_ready(grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_ready),
    .fifo_A_PE_12_054_din(grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_fifo_A_PE_12_054_din),
    .fifo_A_PE_12_054_num_data_valid(2'd0),
    .fifo_A_PE_12_054_fifo_cap(2'd0),
    .fifo_A_PE_12_054_full_n(fifo_A_PE_12_054_full_n),
    .fifo_A_PE_12_054_write(grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_fifo_A_PE_12_054_write),
    .local_A_address0(grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_local_A_address0),
    .local_A_ce0(grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_local_A_ce0),
    .local_A_q0(local_A_q0)
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
        grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (intra_trans_en_offset == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_start_reg <= 1'b1;
        end else if ((grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_ready == 1'b1)) begin
            grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_start_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state2_on_subcall_done)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2)))) begin
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
    if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((intra_trans_en_offset == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        fifo_A_PE_12_054_write = grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_fifo_A_PE_12_054_write;
    end else begin
        fifo_A_PE_12_054_write = 1'b0;
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
            if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state2_on_subcall_done = ((grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_done == 1'b0) & (intra_trans_en_offset == 1'd1));
end

assign fifo_A_PE_12_054_din = grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_fifo_A_PE_12_054_din;

assign grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_start = grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_ap_start_reg;

assign local_A_address0 = grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_local_A_address0;

assign local_A_ce0 = grp_A_IO_L2_in_intra_trans_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2_VITIS_LOOP_55_3_fu_36_local_A_ce0;

endmodule //kernel3_A_IO_L2_in_intra_trans
