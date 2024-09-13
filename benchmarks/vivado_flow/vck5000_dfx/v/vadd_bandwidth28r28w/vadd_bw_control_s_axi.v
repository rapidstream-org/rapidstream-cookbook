// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module vadd_bw_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 9,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [63:0]                   rmem0,
    output wire [63:0]                   rmem1,
    output wire [63:0]                   rmem2,
    output wire [63:0]                   rmem3,
    output wire [63:0]                   rmem4,
    output wire [63:0]                   rmem5,
    output wire [63:0]                   rmem6,
    output wire [63:0]                   rmem7,
    output wire [63:0]                   rmem8,
    output wire [63:0]                   rmem9,
    output wire [63:0]                   rmem10,
    output wire [63:0]                   rmem11,
    output wire [63:0]                   rmem12,
    output wire [63:0]                   rmem13,
    output wire [63:0]                   rmem14,
    output wire [63:0]                   rmem15,
    output wire [63:0]                   rmem16,
    output wire [63:0]                   rmem17,
    output wire [63:0]                   rmem18,
    output wire [63:0]                   rmem19,
    output wire [63:0]                   rmem20,
    output wire [63:0]                   rmem21,
    output wire [63:0]                   rmem22,
    output wire [63:0]                   rmem23,
    output wire [63:0]                   rmem24,
    output wire [63:0]                   rmem25,
    output wire [63:0]                   rmem26,
    output wire [63:0]                   rmem27,
    output wire [63:0]                   n,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/SC)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         bit 9  - interrupt (Read)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (Read/TOW)
//         others - reserved
// 0x010 : Data signal of rmem0
//         bit 31~0 - rmem0[31:0] (Read/Write)
// 0x014 : Data signal of rmem0
//         bit 31~0 - rmem0[63:32] (Read/Write)
// 0x018 : reserved
// 0x01c : Data signal of rmem1
//         bit 31~0 - rmem1[31:0] (Read/Write)
// 0x020 : Data signal of rmem1
//         bit 31~0 - rmem1[63:32] (Read/Write)
// 0x024 : reserved
// 0x028 : Data signal of rmem2
//         bit 31~0 - rmem2[31:0] (Read/Write)
// 0x02c : Data signal of rmem2
//         bit 31~0 - rmem2[63:32] (Read/Write)
// 0x030 : reserved
// 0x034 : Data signal of rmem3
//         bit 31~0 - rmem3[31:0] (Read/Write)
// 0x038 : Data signal of rmem3
//         bit 31~0 - rmem3[63:32] (Read/Write)
// 0x03c : reserved
// 0x040 : Data signal of rmem4
//         bit 31~0 - rmem4[31:0] (Read/Write)
// 0x044 : Data signal of rmem4
//         bit 31~0 - rmem4[63:32] (Read/Write)
// 0x048 : reserved
// 0x04c : Data signal of rmem5
//         bit 31~0 - rmem5[31:0] (Read/Write)
// 0x050 : Data signal of rmem5
//         bit 31~0 - rmem5[63:32] (Read/Write)
// 0x054 : reserved
// 0x058 : Data signal of rmem6
//         bit 31~0 - rmem6[31:0] (Read/Write)
// 0x05c : Data signal of rmem6
//         bit 31~0 - rmem6[63:32] (Read/Write)
// 0x060 : reserved
// 0x064 : Data signal of rmem7
//         bit 31~0 - rmem7[31:0] (Read/Write)
// 0x068 : Data signal of rmem7
//         bit 31~0 - rmem7[63:32] (Read/Write)
// 0x06c : reserved
// 0x070 : Data signal of rmem8
//         bit 31~0 - rmem8[31:0] (Read/Write)
// 0x074 : Data signal of rmem8
//         bit 31~0 - rmem8[63:32] (Read/Write)
// 0x078 : reserved
// 0x07c : Data signal of rmem9
//         bit 31~0 - rmem9[31:0] (Read/Write)
// 0x080 : Data signal of rmem9
//         bit 31~0 - rmem9[63:32] (Read/Write)
// 0x084 : reserved
// 0x088 : Data signal of rmem10
//         bit 31~0 - rmem10[31:0] (Read/Write)
// 0x08c : Data signal of rmem10
//         bit 31~0 - rmem10[63:32] (Read/Write)
// 0x090 : reserved
// 0x094 : Data signal of rmem11
//         bit 31~0 - rmem11[31:0] (Read/Write)
// 0x098 : Data signal of rmem11
//         bit 31~0 - rmem11[63:32] (Read/Write)
// 0x09c : reserved
// 0x0a0 : Data signal of rmem12
//         bit 31~0 - rmem12[31:0] (Read/Write)
// 0x0a4 : Data signal of rmem12
//         bit 31~0 - rmem12[63:32] (Read/Write)
// 0x0a8 : reserved
// 0x0ac : Data signal of rmem13
//         bit 31~0 - rmem13[31:0] (Read/Write)
// 0x0b0 : Data signal of rmem13
//         bit 31~0 - rmem13[63:32] (Read/Write)
// 0x0b4 : reserved
// 0x0b8 : Data signal of rmem14
//         bit 31~0 - rmem14[31:0] (Read/Write)
// 0x0bc : Data signal of rmem14
//         bit 31~0 - rmem14[63:32] (Read/Write)
// 0x0c0 : reserved
// 0x0c4 : Data signal of rmem15
//         bit 31~0 - rmem15[31:0] (Read/Write)
// 0x0c8 : Data signal of rmem15
//         bit 31~0 - rmem15[63:32] (Read/Write)
// 0x0cc : reserved
// 0x0d0 : Data signal of rmem16
//         bit 31~0 - rmem16[31:0] (Read/Write)
// 0x0d4 : Data signal of rmem16
//         bit 31~0 - rmem16[63:32] (Read/Write)
// 0x0d8 : reserved
// 0x0dc : Data signal of rmem17
//         bit 31~0 - rmem17[31:0] (Read/Write)
// 0x0e0 : Data signal of rmem17
//         bit 31~0 - rmem17[63:32] (Read/Write)
// 0x0e4 : reserved
// 0x0e8 : Data signal of rmem18
//         bit 31~0 - rmem18[31:0] (Read/Write)
// 0x0ec : Data signal of rmem18
//         bit 31~0 - rmem18[63:32] (Read/Write)
// 0x0f0 : reserved
// 0x0f4 : Data signal of rmem19
//         bit 31~0 - rmem19[31:0] (Read/Write)
// 0x0f8 : Data signal of rmem19
//         bit 31~0 - rmem19[63:32] (Read/Write)
// 0x0fc : reserved
// 0x100 : Data signal of rmem20
//         bit 31~0 - rmem20[31:0] (Read/Write)
// 0x104 : Data signal of rmem20
//         bit 31~0 - rmem20[63:32] (Read/Write)
// 0x108 : reserved
// 0x10c : Data signal of rmem21
//         bit 31~0 - rmem21[31:0] (Read/Write)
// 0x110 : Data signal of rmem21
//         bit 31~0 - rmem21[63:32] (Read/Write)
// 0x114 : reserved
// 0x118 : Data signal of rmem22
//         bit 31~0 - rmem22[31:0] (Read/Write)
// 0x11c : Data signal of rmem22
//         bit 31~0 - rmem22[63:32] (Read/Write)
// 0x120 : reserved
// 0x124 : Data signal of rmem23
//         bit 31~0 - rmem23[31:0] (Read/Write)
// 0x128 : Data signal of rmem23
//         bit 31~0 - rmem23[63:32] (Read/Write)
// 0x12c : reserved
// 0x130 : Data signal of rmem24
//         bit 31~0 - rmem24[31:0] (Read/Write)
// 0x134 : Data signal of rmem24
//         bit 31~0 - rmem24[63:32] (Read/Write)
// 0x138 : reserved
// 0x13c : Data signal of rmem25
//         bit 31~0 - rmem25[31:0] (Read/Write)
// 0x140 : Data signal of rmem25
//         bit 31~0 - rmem25[63:32] (Read/Write)
// 0x144 : reserved
// 0x148 : Data signal of rmem26
//         bit 31~0 - rmem26[31:0] (Read/Write)
// 0x14c : Data signal of rmem26
//         bit 31~0 - rmem26[63:32] (Read/Write)
// 0x150 : reserved
// 0x154 : Data signal of rmem27
//         bit 31~0 - rmem27[31:0] (Read/Write)
// 0x158 : Data signal of rmem27
//         bit 31~0 - rmem27[63:32] (Read/Write)
// 0x15c : reserved
// 0x160 : Data signal of n
//         bit 31~0 - n[31:0] (Read/Write)
// 0x164 : Data signal of n
//         bit 31~0 - n[63:32] (Read/Write)
// 0x168 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL       = 9'h000,
    ADDR_GIE           = 9'h004,
    ADDR_IER           = 9'h008,
    ADDR_ISR           = 9'h00c,
    ADDR_RMEM0_DATA_0  = 9'h010,
    ADDR_RMEM0_DATA_1  = 9'h014,
    ADDR_RMEM0_CTRL    = 9'h018,
    ADDR_RMEM1_DATA_0  = 9'h01c,
    ADDR_RMEM1_DATA_1  = 9'h020,
    ADDR_RMEM1_CTRL    = 9'h024,
    ADDR_RMEM2_DATA_0  = 9'h028,
    ADDR_RMEM2_DATA_1  = 9'h02c,
    ADDR_RMEM2_CTRL    = 9'h030,
    ADDR_RMEM3_DATA_0  = 9'h034,
    ADDR_RMEM3_DATA_1  = 9'h038,
    ADDR_RMEM3_CTRL    = 9'h03c,
    ADDR_RMEM4_DATA_0  = 9'h040,
    ADDR_RMEM4_DATA_1  = 9'h044,
    ADDR_RMEM4_CTRL    = 9'h048,
    ADDR_RMEM5_DATA_0  = 9'h04c,
    ADDR_RMEM5_DATA_1  = 9'h050,
    ADDR_RMEM5_CTRL    = 9'h054,
    ADDR_RMEM6_DATA_0  = 9'h058,
    ADDR_RMEM6_DATA_1  = 9'h05c,
    ADDR_RMEM6_CTRL    = 9'h060,
    ADDR_RMEM7_DATA_0  = 9'h064,
    ADDR_RMEM7_DATA_1  = 9'h068,
    ADDR_RMEM7_CTRL    = 9'h06c,
    ADDR_RMEM8_DATA_0  = 9'h070,
    ADDR_RMEM8_DATA_1  = 9'h074,
    ADDR_RMEM8_CTRL    = 9'h078,
    ADDR_RMEM9_DATA_0  = 9'h07c,
    ADDR_RMEM9_DATA_1  = 9'h080,
    ADDR_RMEM9_CTRL    = 9'h084,
    ADDR_RMEM10_DATA_0 = 9'h088,
    ADDR_RMEM10_DATA_1 = 9'h08c,
    ADDR_RMEM10_CTRL   = 9'h090,
    ADDR_RMEM11_DATA_0 = 9'h094,
    ADDR_RMEM11_DATA_1 = 9'h098,
    ADDR_RMEM11_CTRL   = 9'h09c,
    ADDR_RMEM12_DATA_0 = 9'h0a0,
    ADDR_RMEM12_DATA_1 = 9'h0a4,
    ADDR_RMEM12_CTRL   = 9'h0a8,
    ADDR_RMEM13_DATA_0 = 9'h0ac,
    ADDR_RMEM13_DATA_1 = 9'h0b0,
    ADDR_RMEM13_CTRL   = 9'h0b4,
    ADDR_RMEM14_DATA_0 = 9'h0b8,
    ADDR_RMEM14_DATA_1 = 9'h0bc,
    ADDR_RMEM14_CTRL   = 9'h0c0,
    ADDR_RMEM15_DATA_0 = 9'h0c4,
    ADDR_RMEM15_DATA_1 = 9'h0c8,
    ADDR_RMEM15_CTRL   = 9'h0cc,
    ADDR_RMEM16_DATA_0 = 9'h0d0,
    ADDR_RMEM16_DATA_1 = 9'h0d4,
    ADDR_RMEM16_CTRL   = 9'h0d8,
    ADDR_RMEM17_DATA_0 = 9'h0dc,
    ADDR_RMEM17_DATA_1 = 9'h0e0,
    ADDR_RMEM17_CTRL   = 9'h0e4,
    ADDR_RMEM18_DATA_0 = 9'h0e8,
    ADDR_RMEM18_DATA_1 = 9'h0ec,
    ADDR_RMEM18_CTRL   = 9'h0f0,
    ADDR_RMEM19_DATA_0 = 9'h0f4,
    ADDR_RMEM19_DATA_1 = 9'h0f8,
    ADDR_RMEM19_CTRL   = 9'h0fc,
    ADDR_RMEM20_DATA_0 = 9'h100,
    ADDR_RMEM20_DATA_1 = 9'h104,
    ADDR_RMEM20_CTRL   = 9'h108,
    ADDR_RMEM21_DATA_0 = 9'h10c,
    ADDR_RMEM21_DATA_1 = 9'h110,
    ADDR_RMEM21_CTRL   = 9'h114,
    ADDR_RMEM22_DATA_0 = 9'h118,
    ADDR_RMEM22_DATA_1 = 9'h11c,
    ADDR_RMEM22_CTRL   = 9'h120,
    ADDR_RMEM23_DATA_0 = 9'h124,
    ADDR_RMEM23_DATA_1 = 9'h128,
    ADDR_RMEM23_CTRL   = 9'h12c,
    ADDR_RMEM24_DATA_0 = 9'h130,
    ADDR_RMEM24_DATA_1 = 9'h134,
    ADDR_RMEM24_CTRL   = 9'h138,
    ADDR_RMEM25_DATA_0 = 9'h13c,
    ADDR_RMEM25_DATA_1 = 9'h140,
    ADDR_RMEM25_CTRL   = 9'h144,
    ADDR_RMEM26_DATA_0 = 9'h148,
    ADDR_RMEM26_DATA_1 = 9'h14c,
    ADDR_RMEM26_CTRL   = 9'h150,
    ADDR_RMEM27_DATA_0 = 9'h154,
    ADDR_RMEM27_DATA_1 = 9'h158,
    ADDR_RMEM27_CTRL   = 9'h15c,
    ADDR_N_DATA_0      = 9'h160,
    ADDR_N_DATA_1      = 9'h164,
    ADDR_N_CTRL        = 9'h168,
    WRIDLE             = 2'd0,
    WRDATA             = 2'd1,
    WRRESP             = 2'd2,
    WRRESET            = 2'd3,
    RDIDLE             = 2'd0,
    RDDATA             = 2'd1,
    RDRESET            = 2'd2,
    ADDR_BITS                = 9;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg                           int_ier = 1'b0;
    reg                           int_isr = 1'b0;
    reg  [63:0]                   int_rmem0 = 'b0;
    reg  [63:0]                   int_rmem1 = 'b0;
    reg  [63:0]                   int_rmem2 = 'b0;
    reg  [63:0]                   int_rmem3 = 'b0;
    reg  [63:0]                   int_rmem4 = 'b0;
    reg  [63:0]                   int_rmem5 = 'b0;
    reg  [63:0]                   int_rmem6 = 'b0;
    reg  [63:0]                   int_rmem7 = 'b0;
    reg  [63:0]                   int_rmem8 = 'b0;
    reg  [63:0]                   int_rmem9 = 'b0;
    reg  [63:0]                   int_rmem10 = 'b0;
    reg  [63:0]                   int_rmem11 = 'b0;
    reg  [63:0]                   int_rmem12 = 'b0;
    reg  [63:0]                   int_rmem13 = 'b0;
    reg  [63:0]                   int_rmem14 = 'b0;
    reg  [63:0]                   int_rmem15 = 'b0;
    reg  [63:0]                   int_rmem16 = 'b0;
    reg  [63:0]                   int_rmem17 = 'b0;
    reg  [63:0]                   int_rmem18 = 'b0;
    reg  [63:0]                   int_rmem19 = 'b0;
    reg  [63:0]                   int_rmem20 = 'b0;
    reg  [63:0]                   int_rmem21 = 'b0;
    reg  [63:0]                   int_rmem22 = 'b0;
    reg  [63:0]                   int_rmem23 = 'b0;
    reg  [63:0]                   int_rmem24 = 'b0;
    reg  [63:0]                   int_rmem25 = 'b0;
    reg  [63:0]                   int_rmem26 = 'b0;
    reg  [63:0]                   int_rmem27 = 'b0;
    reg  [63:0]                   int_n = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_RMEM0_DATA_0: begin
                    rdata <= int_rmem0[31:0];
                end
                ADDR_RMEM0_DATA_1: begin
                    rdata <= int_rmem0[63:32];
                end
                ADDR_RMEM1_DATA_0: begin
                    rdata <= int_rmem1[31:0];
                end
                ADDR_RMEM1_DATA_1: begin
                    rdata <= int_rmem1[63:32];
                end
                ADDR_RMEM2_DATA_0: begin
                    rdata <= int_rmem2[31:0];
                end
                ADDR_RMEM2_DATA_1: begin
                    rdata <= int_rmem2[63:32];
                end
                ADDR_RMEM3_DATA_0: begin
                    rdata <= int_rmem3[31:0];
                end
                ADDR_RMEM3_DATA_1: begin
                    rdata <= int_rmem3[63:32];
                end
                ADDR_RMEM4_DATA_0: begin
                    rdata <= int_rmem4[31:0];
                end
                ADDR_RMEM4_DATA_1: begin
                    rdata <= int_rmem4[63:32];
                end
                ADDR_RMEM5_DATA_0: begin
                    rdata <= int_rmem5[31:0];
                end
                ADDR_RMEM5_DATA_1: begin
                    rdata <= int_rmem5[63:32];
                end
                ADDR_RMEM6_DATA_0: begin
                    rdata <= int_rmem6[31:0];
                end
                ADDR_RMEM6_DATA_1: begin
                    rdata <= int_rmem6[63:32];
                end
                ADDR_RMEM7_DATA_0: begin
                    rdata <= int_rmem7[31:0];
                end
                ADDR_RMEM7_DATA_1: begin
                    rdata <= int_rmem7[63:32];
                end
                ADDR_RMEM8_DATA_0: begin
                    rdata <= int_rmem8[31:0];
                end
                ADDR_RMEM8_DATA_1: begin
                    rdata <= int_rmem8[63:32];
                end
                ADDR_RMEM9_DATA_0: begin
                    rdata <= int_rmem9[31:0];
                end
                ADDR_RMEM9_DATA_1: begin
                    rdata <= int_rmem9[63:32];
                end
                ADDR_RMEM10_DATA_0: begin
                    rdata <= int_rmem10[31:0];
                end
                ADDR_RMEM10_DATA_1: begin
                    rdata <= int_rmem10[63:32];
                end
                ADDR_RMEM11_DATA_0: begin
                    rdata <= int_rmem11[31:0];
                end
                ADDR_RMEM11_DATA_1: begin
                    rdata <= int_rmem11[63:32];
                end
                ADDR_RMEM12_DATA_0: begin
                    rdata <= int_rmem12[31:0];
                end
                ADDR_RMEM12_DATA_1: begin
                    rdata <= int_rmem12[63:32];
                end
                ADDR_RMEM13_DATA_0: begin
                    rdata <= int_rmem13[31:0];
                end
                ADDR_RMEM13_DATA_1: begin
                    rdata <= int_rmem13[63:32];
                end
                ADDR_RMEM14_DATA_0: begin
                    rdata <= int_rmem14[31:0];
                end
                ADDR_RMEM14_DATA_1: begin
                    rdata <= int_rmem14[63:32];
                end
                ADDR_RMEM15_DATA_0: begin
                    rdata <= int_rmem15[31:0];
                end
                ADDR_RMEM15_DATA_1: begin
                    rdata <= int_rmem15[63:32];
                end
                ADDR_RMEM16_DATA_0: begin
                    rdata <= int_rmem16[31:0];
                end
                ADDR_RMEM16_DATA_1: begin
                    rdata <= int_rmem16[63:32];
                end
                ADDR_RMEM17_DATA_0: begin
                    rdata <= int_rmem17[31:0];
                end
                ADDR_RMEM17_DATA_1: begin
                    rdata <= int_rmem17[63:32];
                end
                ADDR_RMEM18_DATA_0: begin
                    rdata <= int_rmem18[31:0];
                end
                ADDR_RMEM18_DATA_1: begin
                    rdata <= int_rmem18[63:32];
                end
                ADDR_RMEM19_DATA_0: begin
                    rdata <= int_rmem19[31:0];
                end
                ADDR_RMEM19_DATA_1: begin
                    rdata <= int_rmem19[63:32];
                end
                ADDR_RMEM20_DATA_0: begin
                    rdata <= int_rmem20[31:0];
                end
                ADDR_RMEM20_DATA_1: begin
                    rdata <= int_rmem20[63:32];
                end
                ADDR_RMEM21_DATA_0: begin
                    rdata <= int_rmem21[31:0];
                end
                ADDR_RMEM21_DATA_1: begin
                    rdata <= int_rmem21[63:32];
                end
                ADDR_RMEM22_DATA_0: begin
                    rdata <= int_rmem22[31:0];
                end
                ADDR_RMEM22_DATA_1: begin
                    rdata <= int_rmem22[63:32];
                end
                ADDR_RMEM23_DATA_0: begin
                    rdata <= int_rmem23[31:0];
                end
                ADDR_RMEM23_DATA_1: begin
                    rdata <= int_rmem23[63:32];
                end
                ADDR_RMEM24_DATA_0: begin
                    rdata <= int_rmem24[31:0];
                end
                ADDR_RMEM24_DATA_1: begin
                    rdata <= int_rmem24[63:32];
                end
                ADDR_RMEM25_DATA_0: begin
                    rdata <= int_rmem25[31:0];
                end
                ADDR_RMEM25_DATA_1: begin
                    rdata <= int_rmem25[63:32];
                end
                ADDR_RMEM26_DATA_0: begin
                    rdata <= int_rmem26[31:0];
                end
                ADDR_RMEM26_DATA_1: begin
                    rdata <= int_rmem26[63:32];
                end
                ADDR_RMEM27_DATA_0: begin
                    rdata <= int_rmem27[31:0];
                end
                ADDR_RMEM27_DATA_1: begin
                    rdata <= int_rmem27[63:32];
                end
                ADDR_N_DATA_0: begin
                    rdata <= int_n[31:0];
                end
                ADDR_N_DATA_1: begin
                    rdata <= int_n[63:32];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_interrupt;
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign rmem0             = int_rmem0;
assign rmem1             = int_rmem1;
assign rmem2             = int_rmem2;
assign rmem3             = int_rmem3;
assign rmem4             = int_rmem4;
assign rmem5             = int_rmem5;
assign rmem6             = int_rmem6;
assign rmem7             = int_rmem7;
assign rmem8             = int_rmem8;
assign rmem9             = int_rmem9;
assign rmem10            = int_rmem10;
assign rmem11            = int_rmem11;
assign rmem12            = int_rmem12;
assign rmem13            = int_rmem13;
assign rmem14            = int_rmem14;
assign rmem15            = int_rmem15;
assign rmem16            = int_rmem16;
assign rmem17            = int_rmem17;
assign rmem18            = int_rmem18;
assign rmem19            = int_rmem19;
assign rmem20            = int_rmem20;
assign rmem21            = int_rmem21;
assign rmem22            = int_rmem22;
assign rmem23            = int_rmem23;
assign rmem24            = int_rmem24;
assign rmem25            = int_rmem25;
assign rmem26            = int_rmem26;
assign rmem27            = int_rmem27;
assign n                 = int_n;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_done & int_auto_restart)
            int_ap_start <= 1'b1; // auto restart
        else
            int_ap_start <= 1'b0; // self clear
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[0];
    end
end

// int_isr
always @(posedge ACLK) begin
    if (ARESET)
        int_isr <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier & ap_done)
            int_isr <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr <= int_isr ^ WDATA[0]; // toggle on write
    end
end

// int_rmem0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM0_DATA_0)
            int_rmem0[31:0] <= (WDATA[31:0] & wmask) | (int_rmem0[31:0] & ~wmask);
    end
end

// int_rmem0[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem0[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM0_DATA_1)
            int_rmem0[63:32] <= (WDATA[31:0] & wmask) | (int_rmem0[63:32] & ~wmask);
    end
end

// int_rmem1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM1_DATA_0)
            int_rmem1[31:0] <= (WDATA[31:0] & wmask) | (int_rmem1[31:0] & ~wmask);
    end
end

// int_rmem1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM1_DATA_1)
            int_rmem1[63:32] <= (WDATA[31:0] & wmask) | (int_rmem1[63:32] & ~wmask);
    end
end

// int_rmem2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM2_DATA_0)
            int_rmem2[31:0] <= (WDATA[31:0] & wmask) | (int_rmem2[31:0] & ~wmask);
    end
end

// int_rmem2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM2_DATA_1)
            int_rmem2[63:32] <= (WDATA[31:0] & wmask) | (int_rmem2[63:32] & ~wmask);
    end
end

// int_rmem3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM3_DATA_0)
            int_rmem3[31:0] <= (WDATA[31:0] & wmask) | (int_rmem3[31:0] & ~wmask);
    end
end

// int_rmem3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM3_DATA_1)
            int_rmem3[63:32] <= (WDATA[31:0] & wmask) | (int_rmem3[63:32] & ~wmask);
    end
end

// int_rmem4[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem4[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM4_DATA_0)
            int_rmem4[31:0] <= (WDATA[31:0] & wmask) | (int_rmem4[31:0] & ~wmask);
    end
end

// int_rmem4[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem4[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM4_DATA_1)
            int_rmem4[63:32] <= (WDATA[31:0] & wmask) | (int_rmem4[63:32] & ~wmask);
    end
end

// int_rmem5[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem5[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM5_DATA_0)
            int_rmem5[31:0] <= (WDATA[31:0] & wmask) | (int_rmem5[31:0] & ~wmask);
    end
end

// int_rmem5[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem5[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM5_DATA_1)
            int_rmem5[63:32] <= (WDATA[31:0] & wmask) | (int_rmem5[63:32] & ~wmask);
    end
end

// int_rmem6[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem6[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM6_DATA_0)
            int_rmem6[31:0] <= (WDATA[31:0] & wmask) | (int_rmem6[31:0] & ~wmask);
    end
end

// int_rmem6[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem6[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM6_DATA_1)
            int_rmem6[63:32] <= (WDATA[31:0] & wmask) | (int_rmem6[63:32] & ~wmask);
    end
end

// int_rmem7[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem7[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM7_DATA_0)
            int_rmem7[31:0] <= (WDATA[31:0] & wmask) | (int_rmem7[31:0] & ~wmask);
    end
end

// int_rmem7[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem7[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM7_DATA_1)
            int_rmem7[63:32] <= (WDATA[31:0] & wmask) | (int_rmem7[63:32] & ~wmask);
    end
end

// int_rmem8[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem8[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM8_DATA_0)
            int_rmem8[31:0] <= (WDATA[31:0] & wmask) | (int_rmem8[31:0] & ~wmask);
    end
end

// int_rmem8[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem8[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM8_DATA_1)
            int_rmem8[63:32] <= (WDATA[31:0] & wmask) | (int_rmem8[63:32] & ~wmask);
    end
end

// int_rmem9[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem9[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM9_DATA_0)
            int_rmem9[31:0] <= (WDATA[31:0] & wmask) | (int_rmem9[31:0] & ~wmask);
    end
end

// int_rmem9[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem9[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM9_DATA_1)
            int_rmem9[63:32] <= (WDATA[31:0] & wmask) | (int_rmem9[63:32] & ~wmask);
    end
end

// int_rmem10[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem10[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM10_DATA_0)
            int_rmem10[31:0] <= (WDATA[31:0] & wmask) | (int_rmem10[31:0] & ~wmask);
    end
end

// int_rmem10[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem10[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM10_DATA_1)
            int_rmem10[63:32] <= (WDATA[31:0] & wmask) | (int_rmem10[63:32] & ~wmask);
    end
end

// int_rmem11[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem11[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM11_DATA_0)
            int_rmem11[31:0] <= (WDATA[31:0] & wmask) | (int_rmem11[31:0] & ~wmask);
    end
end

// int_rmem11[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem11[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM11_DATA_1)
            int_rmem11[63:32] <= (WDATA[31:0] & wmask) | (int_rmem11[63:32] & ~wmask);
    end
end

// int_rmem12[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem12[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM12_DATA_0)
            int_rmem12[31:0] <= (WDATA[31:0] & wmask) | (int_rmem12[31:0] & ~wmask);
    end
end

// int_rmem12[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem12[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM12_DATA_1)
            int_rmem12[63:32] <= (WDATA[31:0] & wmask) | (int_rmem12[63:32] & ~wmask);
    end
end

// int_rmem13[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem13[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM13_DATA_0)
            int_rmem13[31:0] <= (WDATA[31:0] & wmask) | (int_rmem13[31:0] & ~wmask);
    end
end

// int_rmem13[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem13[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM13_DATA_1)
            int_rmem13[63:32] <= (WDATA[31:0] & wmask) | (int_rmem13[63:32] & ~wmask);
    end
end

// int_rmem14[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem14[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM14_DATA_0)
            int_rmem14[31:0] <= (WDATA[31:0] & wmask) | (int_rmem14[31:0] & ~wmask);
    end
end

// int_rmem14[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem14[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM14_DATA_1)
            int_rmem14[63:32] <= (WDATA[31:0] & wmask) | (int_rmem14[63:32] & ~wmask);
    end
end

// int_rmem15[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem15[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM15_DATA_0)
            int_rmem15[31:0] <= (WDATA[31:0] & wmask) | (int_rmem15[31:0] & ~wmask);
    end
end

// int_rmem15[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem15[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM15_DATA_1)
            int_rmem15[63:32] <= (WDATA[31:0] & wmask) | (int_rmem15[63:32] & ~wmask);
    end
end

// int_rmem16[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem16[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM16_DATA_0)
            int_rmem16[31:0] <= (WDATA[31:0] & wmask) | (int_rmem16[31:0] & ~wmask);
    end
end

// int_rmem16[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem16[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM16_DATA_1)
            int_rmem16[63:32] <= (WDATA[31:0] & wmask) | (int_rmem16[63:32] & ~wmask);
    end
end

// int_rmem17[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem17[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM17_DATA_0)
            int_rmem17[31:0] <= (WDATA[31:0] & wmask) | (int_rmem17[31:0] & ~wmask);
    end
end

// int_rmem17[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem17[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM17_DATA_1)
            int_rmem17[63:32] <= (WDATA[31:0] & wmask) | (int_rmem17[63:32] & ~wmask);
    end
end

// int_rmem18[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem18[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM18_DATA_0)
            int_rmem18[31:0] <= (WDATA[31:0] & wmask) | (int_rmem18[31:0] & ~wmask);
    end
end

// int_rmem18[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem18[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM18_DATA_1)
            int_rmem18[63:32] <= (WDATA[31:0] & wmask) | (int_rmem18[63:32] & ~wmask);
    end
end

// int_rmem19[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem19[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM19_DATA_0)
            int_rmem19[31:0] <= (WDATA[31:0] & wmask) | (int_rmem19[31:0] & ~wmask);
    end
end

// int_rmem19[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem19[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM19_DATA_1)
            int_rmem19[63:32] <= (WDATA[31:0] & wmask) | (int_rmem19[63:32] & ~wmask);
    end
end

// int_rmem20[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem20[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM20_DATA_0)
            int_rmem20[31:0] <= (WDATA[31:0] & wmask) | (int_rmem20[31:0] & ~wmask);
    end
end

// int_rmem20[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem20[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM20_DATA_1)
            int_rmem20[63:32] <= (WDATA[31:0] & wmask) | (int_rmem20[63:32] & ~wmask);
    end
end

// int_rmem21[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem21[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM21_DATA_0)
            int_rmem21[31:0] <= (WDATA[31:0] & wmask) | (int_rmem21[31:0] & ~wmask);
    end
end

// int_rmem21[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem21[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM21_DATA_1)
            int_rmem21[63:32] <= (WDATA[31:0] & wmask) | (int_rmem21[63:32] & ~wmask);
    end
end

// int_rmem22[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem22[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM22_DATA_0)
            int_rmem22[31:0] <= (WDATA[31:0] & wmask) | (int_rmem22[31:0] & ~wmask);
    end
end

// int_rmem22[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem22[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM22_DATA_1)
            int_rmem22[63:32] <= (WDATA[31:0] & wmask) | (int_rmem22[63:32] & ~wmask);
    end
end

// int_rmem23[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem23[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM23_DATA_0)
            int_rmem23[31:0] <= (WDATA[31:0] & wmask) | (int_rmem23[31:0] & ~wmask);
    end
end

// int_rmem23[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem23[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM23_DATA_1)
            int_rmem23[63:32] <= (WDATA[31:0] & wmask) | (int_rmem23[63:32] & ~wmask);
    end
end

// int_rmem24[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem24[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM24_DATA_0)
            int_rmem24[31:0] <= (WDATA[31:0] & wmask) | (int_rmem24[31:0] & ~wmask);
    end
end

// int_rmem24[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem24[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM24_DATA_1)
            int_rmem24[63:32] <= (WDATA[31:0] & wmask) | (int_rmem24[63:32] & ~wmask);
    end
end

// int_rmem25[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem25[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM25_DATA_0)
            int_rmem25[31:0] <= (WDATA[31:0] & wmask) | (int_rmem25[31:0] & ~wmask);
    end
end

// int_rmem25[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem25[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM25_DATA_1)
            int_rmem25[63:32] <= (WDATA[31:0] & wmask) | (int_rmem25[63:32] & ~wmask);
    end
end

// int_rmem26[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem26[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM26_DATA_0)
            int_rmem26[31:0] <= (WDATA[31:0] & wmask) | (int_rmem26[31:0] & ~wmask);
    end
end

// int_rmem26[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem26[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM26_DATA_1)
            int_rmem26[63:32] <= (WDATA[31:0] & wmask) | (int_rmem26[63:32] & ~wmask);
    end
end

// int_rmem27[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem27[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM27_DATA_0)
            int_rmem27[31:0] <= (WDATA[31:0] & wmask) | (int_rmem27[31:0] & ~wmask);
    end
end

// int_rmem27[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rmem27[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RMEM27_DATA_1)
            int_rmem27[63:32] <= (WDATA[31:0] & wmask) | (int_rmem27[63:32] & ~wmask);
    end
end

// int_n[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_n[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_N_DATA_0)
            int_n[31:0] <= (WDATA[31:0] & wmask) | (int_n[31:0] & ~wmask);
    end
end

// int_n[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_n[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_N_DATA_1)
            int_n[63:32] <= (WDATA[31:0] & wmask) | (int_n[63:32] & ~wmask);
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr & int_ier & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------

endmodule
