// ==================================================
// RTL generated by RapidStream
//
// Copyright 2024 RapidStream Design Automation, Inc.
// All Rights Reserved.
// ==================================================
`timescale 1 ns / 1 ps
/**   Generated by RapidStream   **/
module rs_pipelined_kernel3_C_drain_IO_L3_out_C_drain_IO_L3_out_U0 #(
    parameter [71:0] ap_ST_fsm_state1  = 72'd1,
    parameter [71:0] ap_ST_fsm_state2  = 72'd2,
    parameter [71:0] ap_ST_fsm_state3  = 72'd4,
    parameter [71:0] ap_ST_fsm_state4  = 72'd8,
    parameter [71:0] ap_ST_fsm_state5  = 72'd16,
    parameter [71:0] ap_ST_fsm_state6  = 72'd32,
    parameter [71:0] ap_ST_fsm_state7  = 72'd64,
    parameter [71:0] ap_ST_fsm_state8  = 72'd128,
    parameter [71:0] ap_ST_fsm_state9  = 72'd256,
    parameter [71:0] ap_ST_fsm_state10 = 72'd512,
    parameter [71:0] ap_ST_fsm_state11 = 72'd1024,
    parameter [71:0] ap_ST_fsm_state12 = 72'd2048,
    parameter [71:0] ap_ST_fsm_state13 = 72'd4096,
    parameter [71:0] ap_ST_fsm_state14 = 72'd8192,
    parameter [71:0] ap_ST_fsm_state15 = 72'd16384,
    parameter [71:0] ap_ST_fsm_state16 = 72'd32768,
    parameter [71:0] ap_ST_fsm_state17 = 72'd65536,
    parameter [71:0] ap_ST_fsm_state18 = 72'd131072,
    parameter [71:0] ap_ST_fsm_state19 = 72'd262144,
    parameter [71:0] ap_ST_fsm_state20 = 72'd524288,
    parameter [71:0] ap_ST_fsm_state21 = 72'd1048576,
    parameter [71:0] ap_ST_fsm_state22 = 72'd2097152,
    parameter [71:0] ap_ST_fsm_state23 = 72'd4194304,
    parameter [71:0] ap_ST_fsm_state24 = 72'd8388608,
    parameter [71:0] ap_ST_fsm_state25 = 72'd16777216,
    parameter [71:0] ap_ST_fsm_state26 = 72'd33554432,
    parameter [71:0] ap_ST_fsm_state27 = 72'd67108864,
    parameter [71:0] ap_ST_fsm_state28 = 72'd134217728,
    parameter [71:0] ap_ST_fsm_state29 = 72'd268435456,
    parameter [71:0] ap_ST_fsm_state30 = 72'd536870912,
    parameter [71:0] ap_ST_fsm_state31 = 72'd1073741824,
    parameter [71:0] ap_ST_fsm_state32 = 72'd2147483648,
    parameter [71:0] ap_ST_fsm_state33 = 72'd4294967296,
    parameter [71:0] ap_ST_fsm_state34 = 72'd8589934592,
    parameter [71:0] ap_ST_fsm_state35 = 72'd17179869184,
    parameter [71:0] ap_ST_fsm_state36 = 72'd34359738368,
    parameter [71:0] ap_ST_fsm_state37 = 72'd68719476736,
    parameter [71:0] ap_ST_fsm_state38 = 72'd137438953472,
    parameter [71:0] ap_ST_fsm_state39 = 72'd274877906944,
    parameter [71:0] ap_ST_fsm_state40 = 72'd549755813888,
    parameter [71:0] ap_ST_fsm_state41 = 72'd1099511627776,
    parameter [71:0] ap_ST_fsm_state42 = 72'd2199023255552,
    parameter [71:0] ap_ST_fsm_state43 = 72'd4398046511104,
    parameter [71:0] ap_ST_fsm_state44 = 72'd8796093022208,
    parameter [71:0] ap_ST_fsm_state45 = 72'd17592186044416,
    parameter [71:0] ap_ST_fsm_state46 = 72'd35184372088832,
    parameter [71:0] ap_ST_fsm_state47 = 72'd70368744177664,
    parameter [71:0] ap_ST_fsm_state48 = 72'd140737488355328,
    parameter [71:0] ap_ST_fsm_state49 = 72'd281474976710656,
    parameter [71:0] ap_ST_fsm_state50 = 72'd562949953421312,
    parameter [71:0] ap_ST_fsm_state51 = 72'd1125899906842624,
    parameter [71:0] ap_ST_fsm_state52 = 72'd2251799813685248,
    parameter [71:0] ap_ST_fsm_state53 = 72'd4503599627370496,
    parameter [71:0] ap_ST_fsm_state54 = 72'd9007199254740992,
    parameter [71:0] ap_ST_fsm_state55 = 72'd18014398509481984,
    parameter [71:0] ap_ST_fsm_state56 = 72'd36028797018963968,
    parameter [71:0] ap_ST_fsm_state57 = 72'd72057594037927936,
    parameter [71:0] ap_ST_fsm_state58 = 72'd144115188075855872,
    parameter [71:0] ap_ST_fsm_state59 = 72'd288230376151711744,
    parameter [71:0] ap_ST_fsm_state60 = 72'd576460752303423488,
    parameter [71:0] ap_ST_fsm_state61 = 72'd1152921504606846976,
    parameter [71:0] ap_ST_fsm_state62 = 72'd2305843009213693952,
    parameter [71:0] ap_ST_fsm_state63 = 72'd4611686018427387904,
    parameter [71:0] ap_ST_fsm_state64 = 72'd9223372036854775808,
    parameter [71:0] ap_ST_fsm_state65 = 72'd18446744073709551616,
    parameter [71:0] ap_ST_fsm_state66 = 72'd36893488147419103232,
    parameter [71:0] ap_ST_fsm_state67 = 72'd73786976294838206464,
    parameter [71:0] ap_ST_fsm_state68 = 72'd147573952589676412928,
    parameter [71:0] ap_ST_fsm_state69 = 72'd295147905179352825856,
    parameter [71:0] ap_ST_fsm_state70 = 72'd590295810358705651712,
    parameter [71:0] ap_ST_fsm_state71 = 72'd1180591620717411303424,
    parameter [71:0] ap_ST_fsm_state72 = 72'd2361183241434822606848
) (
    input wire  [ 63:0] C_dout,
    input wire          C_empty_n,
    input wire  [  6:0] C_fifo_cap,
    input wire  [  6:0] C_num_data_valid,
    output wire         C_read,
    input wire          ap_clk,
    input wire          ap_continue,
    output wire         ap_done,
    output wire         ap_idle,
    output wire         ap_ready,
    input wire          ap_rst,
    input wire          ap_start,
    input wire  [ 63:0] fifo_C_drain_C_drain_IO_L2_out_0137_dout,
    input wire          fifo_C_drain_C_drain_IO_L2_out_0137_empty_n,
    input wire  [  1:0] fifo_C_drain_C_drain_IO_L2_out_0137_fifo_cap,
    input wire  [  1:0] fifo_C_drain_C_drain_IO_L2_out_0137_num_data_valid,
    output wire         fifo_C_drain_C_drain_IO_L2_out_0137_read,
    output wire [ 63:0] m_axi_gmem_C_ARADDR,
    output wire [  1:0] m_axi_gmem_C_ARBURST,
    output wire [  3:0] m_axi_gmem_C_ARCACHE,
    output wire [  0:0] m_axi_gmem_C_ARID,
    output wire [ 31:0] m_axi_gmem_C_ARLEN,
    output wire [  1:0] m_axi_gmem_C_ARLOCK,
    output wire [  2:0] m_axi_gmem_C_ARPROT,
    output wire [  3:0] m_axi_gmem_C_ARQOS,
    input wire          m_axi_gmem_C_ARREADY,
    output wire [  3:0] m_axi_gmem_C_ARREGION,
    output wire [  2:0] m_axi_gmem_C_ARSIZE,
    output wire [  0:0] m_axi_gmem_C_ARUSER,
    output wire         m_axi_gmem_C_ARVALID,
    output wire [ 63:0] m_axi_gmem_C_AWADDR,
    output wire [  1:0] m_axi_gmem_C_AWBURST,
    output wire [  3:0] m_axi_gmem_C_AWCACHE,
    output wire [  0:0] m_axi_gmem_C_AWID,
    output wire [ 31:0] m_axi_gmem_C_AWLEN,
    output wire [  1:0] m_axi_gmem_C_AWLOCK,
    output wire [  2:0] m_axi_gmem_C_AWPROT,
    output wire [  3:0] m_axi_gmem_C_AWQOS,
    input wire          m_axi_gmem_C_AWREADY,
    output wire [  3:0] m_axi_gmem_C_AWREGION,
    output wire [  2:0] m_axi_gmem_C_AWSIZE,
    output wire [  0:0] m_axi_gmem_C_AWUSER,
    output wire         m_axi_gmem_C_AWVALID,
    input wire  [  0:0] m_axi_gmem_C_BID,
    output wire         m_axi_gmem_C_BREADY,
    input wire  [  1:0] m_axi_gmem_C_BRESP,
    input wire  [  0:0] m_axi_gmem_C_BUSER,
    input wire          m_axi_gmem_C_BVALID,
    input wire  [511:0] m_axi_gmem_C_RDATA,
    input wire  [  8:0] m_axi_gmem_C_RFIFONUM,
    input wire  [  0:0] m_axi_gmem_C_RID,
    input wire          m_axi_gmem_C_RLAST,
    output wire         m_axi_gmem_C_RREADY,
    input wire  [  1:0] m_axi_gmem_C_RRESP,
    input wire  [  0:0] m_axi_gmem_C_RUSER,
    input wire          m_axi_gmem_C_RVALID,
    output wire [511:0] m_axi_gmem_C_WDATA,
    output wire [  0:0] m_axi_gmem_C_WID,
    output wire         m_axi_gmem_C_WLAST,
    input wire          m_axi_gmem_C_WREADY,
    output wire [ 63:0] m_axi_gmem_C_WSTRB,
    output wire [  0:0] m_axi_gmem_C_WUSER,
    output wire         m_axi_gmem_C_WVALID
);

wire        rs_pipelined_ap_continue;
wire        rs_pipelined_ap_ready;
wire        rs_pipelined_ap_rst;
wire        rs_pipelined_ap_start;
wire [63:0] rs_pipelined_fifo_C_drain_C_drain_IO_L2_out_0137_dout;
wire        rs_pipelined_fifo_C_drain_C_drain_IO_L2_out_0137_empty_n;
wire        rs_pipelined_fifo_C_drain_C_drain_IO_L2_out_0137_read;


kernel3_C_drain_IO_L3_out _ /**   design_1_i/kernel3_0/inst/C_drain_IO_L3_out_U0   **/ (
    .C_dout                                             (C_dout),
    .C_empty_n                                          (C_empty_n),
    .C_fifo_cap                                         (C_fifo_cap),
    .C_num_data_valid                                   (C_num_data_valid),
    .C_read                                             (C_read),
    .ap_clk                                             (ap_clk),
    .ap_continue                                        (rs_pipelined_ap_continue),
    .ap_done                                            (ap_done),
    .ap_idle                                            (ap_idle),
    .ap_ready                                           (rs_pipelined_ap_ready),
    .ap_rst                                             (rs_pipelined_ap_rst),
    .ap_start                                           (rs_pipelined_ap_start),
    .fifo_C_drain_C_drain_IO_L2_out_0137_dout           (rs_pipelined_fifo_C_drain_C_drain_IO_L2_out_0137_dout),
    .fifo_C_drain_C_drain_IO_L2_out_0137_empty_n        (rs_pipelined_fifo_C_drain_C_drain_IO_L2_out_0137_empty_n),
    .fifo_C_drain_C_drain_IO_L2_out_0137_fifo_cap       (fifo_C_drain_C_drain_IO_L2_out_0137_fifo_cap),
    .fifo_C_drain_C_drain_IO_L2_out_0137_num_data_valid (fifo_C_drain_C_drain_IO_L2_out_0137_num_data_valid),
    .fifo_C_drain_C_drain_IO_L2_out_0137_read           (rs_pipelined_fifo_C_drain_C_drain_IO_L2_out_0137_read),
    .m_axi_gmem_C_ARADDR                                (m_axi_gmem_C_ARADDR),
    .m_axi_gmem_C_ARBURST                               (m_axi_gmem_C_ARBURST),
    .m_axi_gmem_C_ARCACHE                               (m_axi_gmem_C_ARCACHE),
    .m_axi_gmem_C_ARID                                  (m_axi_gmem_C_ARID),
    .m_axi_gmem_C_ARLEN                                 (m_axi_gmem_C_ARLEN),
    .m_axi_gmem_C_ARLOCK                                (m_axi_gmem_C_ARLOCK),
    .m_axi_gmem_C_ARPROT                                (m_axi_gmem_C_ARPROT),
    .m_axi_gmem_C_ARQOS                                 (m_axi_gmem_C_ARQOS),
    .m_axi_gmem_C_ARREADY                               (m_axi_gmem_C_ARREADY),
    .m_axi_gmem_C_ARREGION                              (m_axi_gmem_C_ARREGION),
    .m_axi_gmem_C_ARSIZE                                (m_axi_gmem_C_ARSIZE),
    .m_axi_gmem_C_ARUSER                                (m_axi_gmem_C_ARUSER),
    .m_axi_gmem_C_ARVALID                               (m_axi_gmem_C_ARVALID),
    .m_axi_gmem_C_AWADDR                                (m_axi_gmem_C_AWADDR),
    .m_axi_gmem_C_AWBURST                               (m_axi_gmem_C_AWBURST),
    .m_axi_gmem_C_AWCACHE                               (m_axi_gmem_C_AWCACHE),
    .m_axi_gmem_C_AWID                                  (m_axi_gmem_C_AWID),
    .m_axi_gmem_C_AWLEN                                 (m_axi_gmem_C_AWLEN),
    .m_axi_gmem_C_AWLOCK                                (m_axi_gmem_C_AWLOCK),
    .m_axi_gmem_C_AWPROT                                (m_axi_gmem_C_AWPROT),
    .m_axi_gmem_C_AWQOS                                 (m_axi_gmem_C_AWQOS),
    .m_axi_gmem_C_AWREADY                               (m_axi_gmem_C_AWREADY),
    .m_axi_gmem_C_AWREGION                              (m_axi_gmem_C_AWREGION),
    .m_axi_gmem_C_AWSIZE                                (m_axi_gmem_C_AWSIZE),
    .m_axi_gmem_C_AWUSER                                (m_axi_gmem_C_AWUSER),
    .m_axi_gmem_C_AWVALID                               (m_axi_gmem_C_AWVALID),
    .m_axi_gmem_C_BID                                   (m_axi_gmem_C_BID),
    .m_axi_gmem_C_BREADY                                (m_axi_gmem_C_BREADY),
    .m_axi_gmem_C_BRESP                                 (m_axi_gmem_C_BRESP),
    .m_axi_gmem_C_BUSER                                 (m_axi_gmem_C_BUSER),
    .m_axi_gmem_C_BVALID                                (m_axi_gmem_C_BVALID),
    .m_axi_gmem_C_RDATA                                 (m_axi_gmem_C_RDATA),
    .m_axi_gmem_C_RFIFONUM                              (m_axi_gmem_C_RFIFONUM),
    .m_axi_gmem_C_RID                                   (m_axi_gmem_C_RID),
    .m_axi_gmem_C_RLAST                                 (m_axi_gmem_C_RLAST),
    .m_axi_gmem_C_RREADY                                (m_axi_gmem_C_RREADY),
    .m_axi_gmem_C_RRESP                                 (m_axi_gmem_C_RRESP),
    .m_axi_gmem_C_RUSER                                 (m_axi_gmem_C_RUSER),
    .m_axi_gmem_C_RVALID                                (m_axi_gmem_C_RVALID),
    .m_axi_gmem_C_WDATA                                 (m_axi_gmem_C_WDATA),
    .m_axi_gmem_C_WID                                   (m_axi_gmem_C_WID),
    .m_axi_gmem_C_WLAST                                 (m_axi_gmem_C_WLAST),
    .m_axi_gmem_C_WREADY                                (m_axi_gmem_C_WREADY),
    .m_axi_gmem_C_WSTRB                                 (m_axi_gmem_C_WSTRB),
    .m_axi_gmem_C_WUSER                                 (m_axi_gmem_C_WUSER),
    .m_axi_gmem_C_WVALID                                (m_axi_gmem_C_WVALID)
);

__rs_ap_ctrl_pipeline #(
    .BODY_LEVEL      (0),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_1_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_2_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_3_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_4_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_5_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_6_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_7_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_8_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__HEAD_REGION   ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__TAIL_REGION   ("SLOT_X1Y0_TO_SLOT_X1Y0")
) ap_ctrl_no_data_ap_start_ap_ready /**   Generated by RapidStream   **/ (
    .clk        (ap_clk),
    .if_empty_n (rs_pipelined_ap_start),
    .if_full_n  (ap_ready),
    .if_read    (rs_pipelined_ap_ready),
    .if_write   (ap_start),
    .reset      (1'b0)
);

__rs_ff_pipeline #(
    .BODY_LEVEL      (0),
    .DATA_WIDTH      (1),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_1_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_2_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_3_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_4_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_5_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_6_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_7_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_8_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__HEAD_REGION   ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__TAIL_REGION   ("SLOT_X1Y0_TO_SLOT_X1Y0")
) ff_ap_continue /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ ap_continue }),
    .if_dout ({ rs_pipelined_ap_continue })
);

__rs_ff_pipeline #(
    .BODY_LEVEL      (1),
    .DATA_WIDTH      (1),
    .HEAD_LEVEL      (1),
    .TAIL_LEVEL      (1),
    .__BODY_0_REGION ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__BODY_1_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_2_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_3_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_4_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_5_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_6_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_7_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_8_REGION ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__HEAD_REGION   ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__TAIL_REGION   ("SLOT_X1Y0_TO_SLOT_X1Y0")
) ff_ap_rst /**   Generated by RapidStream   **/ (
    .clk     (ap_clk),
    .if_din  ({ ap_rst }),
    .if_dout ({ rs_pipelined_ap_rst })
);

__rs_hs_pipeline #(
    .DATA_WIDTH                      (64),
    .DEPTH                           (24),
    .PIPELINE_BODY_LEVEL             (2),
    .PIPELINE_READY_IN_HEAD          (1),
    .PIPELINE_VALID_AND_DATA_IN_HEAD (1),
    .__BODY_0_REGION                 ("SLOT_X0Y1_TO_SLOT_X0Y1"),
    .__BODY_1_REGION                 ("SLOT_X0Y0_TO_SLOT_X0Y0"),
    .__BODY_2_REGION                 ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_3_REGION                 ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_4_REGION                 ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_5_REGION                 ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_6_REGION                 ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_7_REGION                 ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__BODY_8_REGION                 ("SLOT_X1Y0_TO_SLOT_X1Y0"),
    .__HEAD_REGION                   ("SLOT_X1Y1_TO_SLOT_X1Y1"),
    .__TAIL_REGION                   ("SLOT_X1Y0_TO_SLOT_X1Y0")
) hs_fifo_C_drain_C_drain_IO_L2_out_0137_dout /**   Generated by RapidStream   **/ (
    .clk        (ap_clk),
    .if_din     ({ fifo_C_drain_C_drain_IO_L2_out_0137_dout }),
    .if_dout    ({ rs_pipelined_fifo_C_drain_C_drain_IO_L2_out_0137_dout }),
    .if_empty_n (rs_pipelined_fifo_C_drain_C_drain_IO_L2_out_0137_empty_n),
    .if_full_n  (fifo_C_drain_C_drain_IO_L2_out_0137_read),
    .if_read    (rs_pipelined_fifo_C_drain_C_drain_IO_L2_out_0137_read),
    .if_write   (fifo_C_drain_C_drain_IO_L2_out_0137_empty_n),
    .reset      (1'b0)
);

endmodule  // rs_pipelined_kernel3_C_drain_IO_L3_out_C_drain_IO_L3_out_U0
