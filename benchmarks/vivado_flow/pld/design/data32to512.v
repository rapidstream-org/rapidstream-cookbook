// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="data32to512_data32to512,hls_ip_2021_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.882292,HLS_SYN_LAT=22,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=525,HLS_SYN_LUT=9761,HLS_VERSION=2021_1}" *)

module data32to512 (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        Input_1_V_TDATA,
        Input_1_V_TVALID,
        Input_1_V_TREADY,
        Output_1_V_TDATA,
        Output_1_V_TVALID,
        Output_1_V_TREADY
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] Input_1_V_TDATA;
input   Input_1_V_TVALID;
output   Input_1_V_TREADY;
output  [511:0] Output_1_V_TDATA;
output   Output_1_V_TVALID;
input   Output_1_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    Output_1_V_TDATA_blk_n;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_start;
wire    grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_done;
wire    grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_idle;
wire    grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_ready;
wire    grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_Input_1_V_TREADY;
wire   [511:0] grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_out_tmp_V_1_out;
wire    grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_out_tmp_V_1_out_ap_vld;
reg    grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    regslice_both_Output_1_V_U_apdone_blk;
reg    ap_block_state5;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    regslice_both_Input_1_V_U_apdone_blk;
wire   [31:0] Input_1_V_TDATA_int_regslice;
wire    Input_1_V_TVALID_int_regslice;
reg    Input_1_V_TREADY_int_regslice;
wire    regslice_both_Input_1_V_U_ack_in;
reg    Output_1_V_TVALID_int_regslice;
wire    Output_1_V_TREADY_int_regslice;
wire    regslice_both_Output_1_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_start_reg = 1'b0;
end

data32to512_data32to512_Pipeline_VITIS_LOOP_175_1 grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_start),
    .ap_done(grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_done),
    .ap_idle(grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_idle),
    .ap_ready(grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_ready),
    .Input_1_V_TVALID(Input_1_V_TVALID_int_regslice),
    .Input_1_V_TDATA(Input_1_V_TDATA_int_regslice),
    .Input_1_V_TREADY(grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_Input_1_V_TREADY),
    .out_tmp_V_1_out(grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_out_tmp_V_1_out),
    .out_tmp_V_1_out_ap_vld(grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_out_tmp_V_1_out_ap_vld)
);

data32to512_regslice_both #(
    .DataWidth( 32 ))
regslice_both_Input_1_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(Input_1_V_TDATA),
    .vld_in(Input_1_V_TVALID),
    .ack_in(regslice_both_Input_1_V_U_ack_in),
    .data_out(Input_1_V_TDATA_int_regslice),
    .vld_out(Input_1_V_TVALID_int_regslice),
    .ack_out(Input_1_V_TREADY_int_regslice),
    .apdone_blk(regslice_both_Input_1_V_U_apdone_blk)
);

data32to512_regslice_both #(
    .DataWidth( 512 ))
regslice_both_Output_1_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_out_tmp_V_1_out),
    .vld_in(Output_1_V_TVALID_int_regslice),
    .ack_in(Output_1_V_TREADY_int_regslice),
    .data_out(Output_1_V_TDATA),
    .vld_out(regslice_both_Output_1_V_U_vld_out),
    .ack_out(Output_1_V_TREADY),
    .apdone_blk(regslice_both_Output_1_V_U_apdone_blk)
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
        grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_start_reg <= 1'b1;
        end else if ((grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_ready == 1'b1)) begin
            grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_start_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        Input_1_V_TREADY_int_regslice = grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_Input_1_V_TREADY;
    end else begin
        Input_1_V_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        Output_1_V_TDATA_blk_n = Output_1_V_TREADY_int_regslice;
    end else begin
        Output_1_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (1'b1 == Output_1_V_TREADY_int_regslice))) begin
        Output_1_V_TVALID_int_regslice = 1'b1;
    end else begin
        Output_1_V_TVALID_int_regslice = 1'b0;
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
    if ((grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == Output_1_V_TREADY_int_regslice)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b0 == Output_1_V_TREADY_int_regslice))) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b0 == Output_1_V_TREADY_int_regslice)) & (1'b1 == ap_CS_fsm_state5))) begin
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
    if ((~((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b0 == Output_1_V_TREADY_int_regslice)) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (1'b1 == Output_1_V_TREADY_int_regslice))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if ((~((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b0 == Output_1_V_TREADY_int_regslice)) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Input_1_V_TREADY = regslice_both_Input_1_V_U_ack_in;

assign Output_1_V_TVALID = regslice_both_Output_1_V_U_vld_out;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state5 = ((regslice_both_Output_1_V_U_apdone_blk == 1'b1) | (1'b0 == Output_1_V_TREADY_int_regslice));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_start = grp_data32to512_Pipeline_VITIS_LOOP_175_1_fu_41_ap_start_reg;

endmodule //data32to512
