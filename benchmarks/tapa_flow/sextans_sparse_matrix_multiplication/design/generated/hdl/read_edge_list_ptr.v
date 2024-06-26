// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO="read_edge_list_ptr_read_edge_list_ptr,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.430900,HLS_SYN_LAT=3236,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=164,HLS_SYN_LUT=422,HLS_VERSION=2022_2}" *)

module read_edge_list_ptr (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        num_ite,
        M,
        P_N,
        K,
        edge_list_ptr_read_addr_din,
        edge_list_ptr_read_addr_full_n,
        edge_list_ptr_read_addr_write,
        edge_list_ptr_read_data_s_dout,
        edge_list_ptr_read_data_s_empty_n,
        edge_list_ptr_read_data_s_read,
        edge_list_ptr_read_data_peek_dout,
        edge_list_ptr_read_data_peek_empty_n,
        edge_list_ptr_read_data_peek_read,
        edge_list_ptr_write_addr_din,
        edge_list_ptr_write_addr_full_n,
        edge_list_ptr_write_addr_write,
        edge_list_ptr_write_data_din,
        edge_list_ptr_write_data_full_n,
        edge_list_ptr_write_data_write,
        edge_list_ptr_write_resp_s_dout,
        edge_list_ptr_write_resp_s_empty_n,
        edge_list_ptr_write_resp_s_read,
        edge_list_ptr_write_resp_peek_dout,
        edge_list_ptr_write_resp_peek_empty_n,
        edge_list_ptr_write_resp_peek_read,
        fifo_edge_list_ptr_din,
        fifo_edge_list_ptr_full_n,
        fifo_edge_list_ptr_write,
        PE_inst_din,
        PE_inst_full_n,
        PE_inst_write
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] num_ite;
input  [31:0] M;
input  [31:0] P_N;
input  [31:0] K;
output  [64:0] edge_list_ptr_read_addr_din;
input   edge_list_ptr_read_addr_full_n;
output   edge_list_ptr_read_addr_write;
input  [32:0] edge_list_ptr_read_data_s_dout;
input   edge_list_ptr_read_data_s_empty_n;
output   edge_list_ptr_read_data_s_read;
input  [32:0] edge_list_ptr_read_data_peek_dout;
input   edge_list_ptr_read_data_peek_empty_n;
output   edge_list_ptr_read_data_peek_read;
output  [64:0] edge_list_ptr_write_addr_din;
input   edge_list_ptr_write_addr_full_n;
output   edge_list_ptr_write_addr_write;
output  [32:0] edge_list_ptr_write_data_din;
input   edge_list_ptr_write_data_full_n;
output   edge_list_ptr_write_data_write;
input  [8:0] edge_list_ptr_write_resp_s_dout;
input   edge_list_ptr_write_resp_s_empty_n;
output   edge_list_ptr_write_resp_s_read;
input  [8:0] edge_list_ptr_write_resp_peek_dout;
input   edge_list_ptr_write_resp_peek_empty_n;
output   edge_list_ptr_write_resp_peek_read;
output  [32:0] fifo_edge_list_ptr_din;
input   fifo_edge_list_ptr_full_n;
output   fifo_edge_list_ptr_write;
output  [32:0] PE_inst_din;
input   PE_inst_full_n;
output   PE_inst_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg edge_list_ptr_read_addr_write;
reg edge_list_ptr_read_data_s_read;
reg fifo_edge_list_ptr_write;
reg[32:0] PE_inst_din;
reg PE_inst_write;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    PE_inst_blk_n;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire   [31:0] num_ite_plus1_fu_312_p2;
reg   [31:0] num_ite_plus1_reg_373;
wire  signed [29:0] grp_fu_340_p2;
reg  signed [29:0] rp_time_N_reg_378;
wire    grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_start;
wire    grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_done;
wire    grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_idle;
wire    grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_ready;
wire   [32:0] grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_fifo_edge_list_ptr_din;
wire    grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_fifo_edge_list_ptr_write;
wire    grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_edge_list_ptr_read_data_s_read;
wire   [64:0] grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_edge_list_ptr_read_addr_din;
wire    grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_edge_list_ptr_read_addr_write;
reg    grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_start_reg;
wire    ap_CS_fsm_state5;
wire   [0:0] icmp_ln105_fu_324_p2;
wire    ap_CS_fsm_state6;
reg   [27:0] rp_fu_98;
wire   [27:0] rp_2_fu_329_p2;
reg    ap_block_state1;
wire   [32:0] p_s_fu_220_p3;
wire   [32:0] p_2_fu_286_p3;
wire   [32:0] p_3_fu_295_p3;
wire   [32:0] p_0_fu_303_p3;
wire   [15:0] N_fu_216_p1;
wire   [15:0] N16_fu_233_p4;
wire   [0:0] icmp_ln101_fu_243_p2;
wire  signed [15:0] rp_time_fu_249_p3;
wire   [16:0] zext_ln99_fu_229_p1;
wire   [16:0] add_ln103_fu_261_p2;
wire   [13:0] lshr_ln_fu_267_p4;
wire   [29:0] zext_ln105_fu_320_p1;
wire   [13:0] grp_fu_340_p1;
reg    grp_fu_340_ce;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire   [29:0] grp_fu_340_p10;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_start_reg = 1'b0;
end

read_edge_list_ptr_read_edge_list_ptr_Pipeline_rd_ptr grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_start),
    .ap_done(grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_done),
    .ap_idle(grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_idle),
    .ap_ready(grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_ready),
    .num_ite_plus1(num_ite_plus1_reg_373),
    .fifo_edge_list_ptr_din(grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_fifo_edge_list_ptr_din),
    .fifo_edge_list_ptr_full_n(fifo_edge_list_ptr_full_n),
    .fifo_edge_list_ptr_write(grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_fifo_edge_list_ptr_write),
    .edge_list_ptr_read_data_s_dout(edge_list_ptr_read_data_s_dout),
    .edge_list_ptr_read_data_s_empty_n(edge_list_ptr_read_data_s_empty_n),
    .edge_list_ptr_read_data_s_read(grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_edge_list_ptr_read_data_s_read),
    .edge_list_ptr_read_addr_din(grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_edge_list_ptr_read_addr_din),
    .edge_list_ptr_read_addr_full_n(edge_list_ptr_read_addr_full_n),
    .edge_list_ptr_read_addr_write(grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_edge_list_ptr_read_addr_write)
);

read_edge_list_ptr_mul_mul_16s_14ns_30_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 30 ))
mul_mul_16s_14ns_30_4_1_U5(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(rp_time_fu_249_p3),
    .din1(grp_fu_340_p1),
    .ce(grp_fu_340_ce),
    .dout(grp_fu_340_p2)
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
        grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln105_fu_324_p2 == 1'd1))) begin
            grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_start_reg <= 1'b1;
        end else if ((grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_ready == 1'b1)) begin
            grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b0 == PE_inst_full_n) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        rp_fu_98 <= 28'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln105_fu_324_p2 == 1'd1))) begin
        rp_fu_98 <= rp_2_fu_329_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        num_ite_plus1_reg_373 <= num_ite_plus1_fu_312_p2;
        rp_time_N_reg_378 <= grp_fu_340_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        PE_inst_blk_n = PE_inst_full_n;
    end else begin
        PE_inst_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (1'b1 == PE_inst_full_n))) begin
        PE_inst_din = p_0_fu_303_p3;
    end else if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == PE_inst_full_n))) begin
        PE_inst_din = p_3_fu_295_p3;
    end else if (((1'b1 == ap_CS_fsm_state2) & (1'b1 == PE_inst_full_n))) begin
        PE_inst_din = p_2_fu_286_p3;
    end else if ((~((1'b0 == PE_inst_full_n) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        PE_inst_din = p_s_fu_220_p3;
    end else begin
        PE_inst_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (1'b1 == PE_inst_full_n)) | ((1'b1 == ap_CS_fsm_state3) & (1'b1 == PE_inst_full_n)) | ((1'b1 == ap_CS_fsm_state2) & (1'b1 == PE_inst_full_n)) | (~((1'b0 == PE_inst_full_n) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        PE_inst_write = 1'b1;
    end else begin
        PE_inst_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == PE_inst_full_n) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == PE_inst_full_n)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == PE_inst_full_n)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == PE_inst_full_n)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln105_fu_324_p2 == 1'd0))) begin
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
    if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln105_fu_324_p2 == 1'd0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        edge_list_ptr_read_addr_write = grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_edge_list_ptr_read_addr_write;
    end else begin
        edge_list_ptr_read_addr_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        edge_list_ptr_read_data_s_read = grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_edge_list_ptr_read_data_s_read;
    end else begin
        edge_list_ptr_read_data_s_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        fifo_edge_list_ptr_write = grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_fifo_edge_list_ptr_write;
    end else begin
        fifo_edge_list_ptr_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (1'b1 == PE_inst_full_n)) | ((1'b1 == ap_CS_fsm_state3) & (1'b1 == PE_inst_full_n)) | ((1'b1 == ap_CS_fsm_state2) & (1'b1 == PE_inst_full_n)) | (~((1'b0 == PE_inst_full_n) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        grp_fu_340_ce = 1'b1;
    end else begin
        grp_fu_340_ce = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b0 == PE_inst_full_n) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (1'b1 == PE_inst_full_n))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == PE_inst_full_n))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (1'b1 == PE_inst_full_n))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln105_fu_324_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign N16_fu_233_p4 = {{P_N[31:16]}};

assign N_fu_216_p1 = P_N[15:0];

assign add_ln103_fu_261_p2 = (zext_ln99_fu_229_p1 + 17'd7);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state1 = ((1'b0 == PE_inst_full_n) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign edge_list_ptr_read_addr_din = grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_edge_list_ptr_read_addr_din;

assign edge_list_ptr_read_data_peek_read = 1'b0;

assign edge_list_ptr_write_addr_din = 65'd0;

assign edge_list_ptr_write_addr_write = 1'b0;

assign edge_list_ptr_write_data_din = 33'd0;

assign edge_list_ptr_write_data_write = 1'b0;

assign edge_list_ptr_write_resp_peek_read = 1'b0;

assign edge_list_ptr_write_resp_s_read = 1'b0;

assign fifo_edge_list_ptr_din = grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_fifo_edge_list_ptr_din;

assign grp_fu_340_p1 = grp_fu_340_p10;

assign grp_fu_340_p10 = lshr_ln_fu_267_p4;

assign grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_start = grp_read_edge_list_ptr_Pipeline_rd_ptr_fu_205_ap_start_reg;

assign icmp_ln101_fu_243_p2 = ((N16_fu_233_p4 == 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln105_fu_324_p2 = (($signed(zext_ln105_fu_320_p1) < $signed(rp_time_N_reg_378)) ? 1'b1 : 1'b0);

assign lshr_ln_fu_267_p4 = {{add_ln103_fu_261_p2[16:3]}};

assign num_ite_plus1_fu_312_p2 = (num_ite + 32'd1);

assign p_0_fu_303_p3 = {{1'd0}, {K}};

assign p_2_fu_286_p3 = {{1'd0}, {M}};

assign p_3_fu_295_p3 = {{1'd0}, {P_N}};

assign p_s_fu_220_p3 = {{1'd0}, {num_ite}};

assign rp_2_fu_329_p2 = (rp_fu_98 + 28'd1);

assign rp_time_fu_249_p3 = ((icmp_ln101_fu_243_p2[0:0] == 1'b1) ? 16'd1 : N16_fu_233_p4);

assign zext_ln105_fu_320_p1 = rp_fu_98;

assign zext_ln99_fu_229_p1 = N_fu_216_p1;

endmodule //read_edge_list_ptr
