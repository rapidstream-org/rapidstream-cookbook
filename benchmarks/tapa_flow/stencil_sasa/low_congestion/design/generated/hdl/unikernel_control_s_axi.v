// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module unikernel_control_s_axi
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
    output wire [63:0]                   in_0,
    output wire [63:0]                   out_0,
    output wire [63:0]                   in_1,
    output wire [63:0]                   out_1,
    output wire [63:0]                   in_2,
    output wire [63:0]                   out_2,
    output wire [63:0]                   in_3,
    output wire [63:0]                   out_3,
    output wire [63:0]                   in_4,
    output wire [63:0]                   out_4,
    output wire [63:0]                   in_5,
    output wire [63:0]                   out_5,
    output wire [63:0]                   in_6,
    output wire [63:0]                   out_6,
    output wire [63:0]                   in_7,
    output wire [63:0]                   out_7,
    output wire [63:0]                   in_8,
    output wire [63:0]                   out_8,
    output wire [63:0]                   in_9,
    output wire [63:0]                   out_9,
    output wire [63:0]                   in_10,
    output wire [63:0]                   out_10,
    output wire [63:0]                   in_11,
    output wire [63:0]                   out_11,
    output wire [31:0]                   iters,
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
// 0x010 : Data signal of in_0
//         bit 31~0 - in_0[31:0] (Read/Write)
// 0x014 : Data signal of in_0
//         bit 31~0 - in_0[63:32] (Read/Write)
// 0x018 : reserved
// 0x01c : Data signal of out_0
//         bit 31~0 - out_0[31:0] (Read/Write)
// 0x020 : Data signal of out_0
//         bit 31~0 - out_0[63:32] (Read/Write)
// 0x024 : reserved
// 0x028 : Data signal of in_1
//         bit 31~0 - in_1[31:0] (Read/Write)
// 0x02c : Data signal of in_1
//         bit 31~0 - in_1[63:32] (Read/Write)
// 0x030 : reserved
// 0x034 : Data signal of out_1
//         bit 31~0 - out_1[31:0] (Read/Write)
// 0x038 : Data signal of out_1
//         bit 31~0 - out_1[63:32] (Read/Write)
// 0x03c : reserved
// 0x040 : Data signal of in_2
//         bit 31~0 - in_2[31:0] (Read/Write)
// 0x044 : Data signal of in_2
//         bit 31~0 - in_2[63:32] (Read/Write)
// 0x048 : reserved
// 0x04c : Data signal of out_2
//         bit 31~0 - out_2[31:0] (Read/Write)
// 0x050 : Data signal of out_2
//         bit 31~0 - out_2[63:32] (Read/Write)
// 0x054 : reserved
// 0x058 : Data signal of in_3
//         bit 31~0 - in_3[31:0] (Read/Write)
// 0x05c : Data signal of in_3
//         bit 31~0 - in_3[63:32] (Read/Write)
// 0x060 : reserved
// 0x064 : Data signal of out_3
//         bit 31~0 - out_3[31:0] (Read/Write)
// 0x068 : Data signal of out_3
//         bit 31~0 - out_3[63:32] (Read/Write)
// 0x06c : reserved
// 0x070 : Data signal of in_4
//         bit 31~0 - in_4[31:0] (Read/Write)
// 0x074 : Data signal of in_4
//         bit 31~0 - in_4[63:32] (Read/Write)
// 0x078 : reserved
// 0x07c : Data signal of out_4
//         bit 31~0 - out_4[31:0] (Read/Write)
// 0x080 : Data signal of out_4
//         bit 31~0 - out_4[63:32] (Read/Write)
// 0x084 : reserved
// 0x088 : Data signal of in_5
//         bit 31~0 - in_5[31:0] (Read/Write)
// 0x08c : Data signal of in_5
//         bit 31~0 - in_5[63:32] (Read/Write)
// 0x090 : reserved
// 0x094 : Data signal of out_5
//         bit 31~0 - out_5[31:0] (Read/Write)
// 0x098 : Data signal of out_5
//         bit 31~0 - out_5[63:32] (Read/Write)
// 0x09c : reserved
// 0x0a0 : Data signal of in_6
//         bit 31~0 - in_6[31:0] (Read/Write)
// 0x0a4 : Data signal of in_6
//         bit 31~0 - in_6[63:32] (Read/Write)
// 0x0a8 : reserved
// 0x0ac : Data signal of out_6
//         bit 31~0 - out_6[31:0] (Read/Write)
// 0x0b0 : Data signal of out_6
//         bit 31~0 - out_6[63:32] (Read/Write)
// 0x0b4 : reserved
// 0x0b8 : Data signal of in_7
//         bit 31~0 - in_7[31:0] (Read/Write)
// 0x0bc : Data signal of in_7
//         bit 31~0 - in_7[63:32] (Read/Write)
// 0x0c0 : reserved
// 0x0c4 : Data signal of out_7
//         bit 31~0 - out_7[31:0] (Read/Write)
// 0x0c8 : Data signal of out_7
//         bit 31~0 - out_7[63:32] (Read/Write)
// 0x0cc : reserved
// 0x0d0 : Data signal of in_8
//         bit 31~0 - in_8[31:0] (Read/Write)
// 0x0d4 : Data signal of in_8
//         bit 31~0 - in_8[63:32] (Read/Write)
// 0x0d8 : reserved
// 0x0dc : Data signal of out_8
//         bit 31~0 - out_8[31:0] (Read/Write)
// 0x0e0 : Data signal of out_8
//         bit 31~0 - out_8[63:32] (Read/Write)
// 0x0e4 : reserved
// 0x0e8 : Data signal of in_9
//         bit 31~0 - in_9[31:0] (Read/Write)
// 0x0ec : Data signal of in_9
//         bit 31~0 - in_9[63:32] (Read/Write)
// 0x0f0 : reserved
// 0x0f4 : Data signal of out_9
//         bit 31~0 - out_9[31:0] (Read/Write)
// 0x0f8 : Data signal of out_9
//         bit 31~0 - out_9[63:32] (Read/Write)
// 0x0fc : reserved
// 0x100 : Data signal of in_10
//         bit 31~0 - in_10[31:0] (Read/Write)
// 0x104 : Data signal of in_10
//         bit 31~0 - in_10[63:32] (Read/Write)
// 0x108 : reserved
// 0x10c : Data signal of out_10
//         bit 31~0 - out_10[31:0] (Read/Write)
// 0x110 : Data signal of out_10
//         bit 31~0 - out_10[63:32] (Read/Write)
// 0x114 : reserved
// 0x118 : Data signal of in_11
//         bit 31~0 - in_11[31:0] (Read/Write)
// 0x11c : Data signal of in_11
//         bit 31~0 - in_11[63:32] (Read/Write)
// 0x120 : reserved
// 0x124 : Data signal of out_11
//         bit 31~0 - out_11[31:0] (Read/Write)
// 0x128 : Data signal of out_11
//         bit 31~0 - out_11[63:32] (Read/Write)
// 0x12c : reserved
// 0x130 : Data signal of iters
//         bit 31~0 - iters[31:0] (Read/Write)
// 0x134 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL       = 9'h000,
    ADDR_GIE           = 9'h004,
    ADDR_IER           = 9'h008,
    ADDR_ISR           = 9'h00c,
    ADDR_IN_0_DATA_0   = 9'h010,
    ADDR_IN_0_DATA_1   = 9'h014,
    ADDR_IN_0_CTRL     = 9'h018,
    ADDR_OUT_0_DATA_0  = 9'h01c,
    ADDR_OUT_0_DATA_1  = 9'h020,
    ADDR_OUT_0_CTRL    = 9'h024,
    ADDR_IN_1_DATA_0   = 9'h028,
    ADDR_IN_1_DATA_1   = 9'h02c,
    ADDR_IN_1_CTRL     = 9'h030,
    ADDR_OUT_1_DATA_0  = 9'h034,
    ADDR_OUT_1_DATA_1  = 9'h038,
    ADDR_OUT_1_CTRL    = 9'h03c,
    ADDR_IN_2_DATA_0   = 9'h040,
    ADDR_IN_2_DATA_1   = 9'h044,
    ADDR_IN_2_CTRL     = 9'h048,
    ADDR_OUT_2_DATA_0  = 9'h04c,
    ADDR_OUT_2_DATA_1  = 9'h050,
    ADDR_OUT_2_CTRL    = 9'h054,
    ADDR_IN_3_DATA_0   = 9'h058,
    ADDR_IN_3_DATA_1   = 9'h05c,
    ADDR_IN_3_CTRL     = 9'h060,
    ADDR_OUT_3_DATA_0  = 9'h064,
    ADDR_OUT_3_DATA_1  = 9'h068,
    ADDR_OUT_3_CTRL    = 9'h06c,
    ADDR_IN_4_DATA_0   = 9'h070,
    ADDR_IN_4_DATA_1   = 9'h074,
    ADDR_IN_4_CTRL     = 9'h078,
    ADDR_OUT_4_DATA_0  = 9'h07c,
    ADDR_OUT_4_DATA_1  = 9'h080,
    ADDR_OUT_4_CTRL    = 9'h084,
    ADDR_IN_5_DATA_0   = 9'h088,
    ADDR_IN_5_DATA_1   = 9'h08c,
    ADDR_IN_5_CTRL     = 9'h090,
    ADDR_OUT_5_DATA_0  = 9'h094,
    ADDR_OUT_5_DATA_1  = 9'h098,
    ADDR_OUT_5_CTRL    = 9'h09c,
    ADDR_IN_6_DATA_0   = 9'h0a0,
    ADDR_IN_6_DATA_1   = 9'h0a4,
    ADDR_IN_6_CTRL     = 9'h0a8,
    ADDR_OUT_6_DATA_0  = 9'h0ac,
    ADDR_OUT_6_DATA_1  = 9'h0b0,
    ADDR_OUT_6_CTRL    = 9'h0b4,
    ADDR_IN_7_DATA_0   = 9'h0b8,
    ADDR_IN_7_DATA_1   = 9'h0bc,
    ADDR_IN_7_CTRL     = 9'h0c0,
    ADDR_OUT_7_DATA_0  = 9'h0c4,
    ADDR_OUT_7_DATA_1  = 9'h0c8,
    ADDR_OUT_7_CTRL    = 9'h0cc,
    ADDR_IN_8_DATA_0   = 9'h0d0,
    ADDR_IN_8_DATA_1   = 9'h0d4,
    ADDR_IN_8_CTRL     = 9'h0d8,
    ADDR_OUT_8_DATA_0  = 9'h0dc,
    ADDR_OUT_8_DATA_1  = 9'h0e0,
    ADDR_OUT_8_CTRL    = 9'h0e4,
    ADDR_IN_9_DATA_0   = 9'h0e8,
    ADDR_IN_9_DATA_1   = 9'h0ec,
    ADDR_IN_9_CTRL     = 9'h0f0,
    ADDR_OUT_9_DATA_0  = 9'h0f4,
    ADDR_OUT_9_DATA_1  = 9'h0f8,
    ADDR_OUT_9_CTRL    = 9'h0fc,
    ADDR_IN_10_DATA_0  = 9'h100,
    ADDR_IN_10_DATA_1  = 9'h104,
    ADDR_IN_10_CTRL    = 9'h108,
    ADDR_OUT_10_DATA_0 = 9'h10c,
    ADDR_OUT_10_DATA_1 = 9'h110,
    ADDR_OUT_10_CTRL   = 9'h114,
    ADDR_IN_11_DATA_0  = 9'h118,
    ADDR_IN_11_DATA_1  = 9'h11c,
    ADDR_IN_11_CTRL    = 9'h120,
    ADDR_OUT_11_DATA_0 = 9'h124,
    ADDR_OUT_11_DATA_1 = 9'h128,
    ADDR_OUT_11_CTRL   = 9'h12c,
    ADDR_ITERS_DATA_0  = 9'h130,
    ADDR_ITERS_CTRL    = 9'h134,
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
    reg  [63:0]                   int_in_0 = 'b0;
    reg  [63:0]                   int_out_0 = 'b0;
    reg  [63:0]                   int_in_1 = 'b0;
    reg  [63:0]                   int_out_1 = 'b0;
    reg  [63:0]                   int_in_2 = 'b0;
    reg  [63:0]                   int_out_2 = 'b0;
    reg  [63:0]                   int_in_3 = 'b0;
    reg  [63:0]                   int_out_3 = 'b0;
    reg  [63:0]                   int_in_4 = 'b0;
    reg  [63:0]                   int_out_4 = 'b0;
    reg  [63:0]                   int_in_5 = 'b0;
    reg  [63:0]                   int_out_5 = 'b0;
    reg  [63:0]                   int_in_6 = 'b0;
    reg  [63:0]                   int_out_6 = 'b0;
    reg  [63:0]                   int_in_7 = 'b0;
    reg  [63:0]                   int_out_7 = 'b0;
    reg  [63:0]                   int_in_8 = 'b0;
    reg  [63:0]                   int_out_8 = 'b0;
    reg  [63:0]                   int_in_9 = 'b0;
    reg  [63:0]                   int_out_9 = 'b0;
    reg  [63:0]                   int_in_10 = 'b0;
    reg  [63:0]                   int_out_10 = 'b0;
    reg  [63:0]                   int_in_11 = 'b0;
    reg  [63:0]                   int_out_11 = 'b0;
    reg  [31:0]                   int_iters = 'b0;

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
                ADDR_IN_0_DATA_0: begin
                    rdata <= int_in_0[31:0];
                end
                ADDR_IN_0_DATA_1: begin
                    rdata <= int_in_0[63:32];
                end
                ADDR_OUT_0_DATA_0: begin
                    rdata <= int_out_0[31:0];
                end
                ADDR_OUT_0_DATA_1: begin
                    rdata <= int_out_0[63:32];
                end
                ADDR_IN_1_DATA_0: begin
                    rdata <= int_in_1[31:0];
                end
                ADDR_IN_1_DATA_1: begin
                    rdata <= int_in_1[63:32];
                end
                ADDR_OUT_1_DATA_0: begin
                    rdata <= int_out_1[31:0];
                end
                ADDR_OUT_1_DATA_1: begin
                    rdata <= int_out_1[63:32];
                end
                ADDR_IN_2_DATA_0: begin
                    rdata <= int_in_2[31:0];
                end
                ADDR_IN_2_DATA_1: begin
                    rdata <= int_in_2[63:32];
                end
                ADDR_OUT_2_DATA_0: begin
                    rdata <= int_out_2[31:0];
                end
                ADDR_OUT_2_DATA_1: begin
                    rdata <= int_out_2[63:32];
                end
                ADDR_IN_3_DATA_0: begin
                    rdata <= int_in_3[31:0];
                end
                ADDR_IN_3_DATA_1: begin
                    rdata <= int_in_3[63:32];
                end
                ADDR_OUT_3_DATA_0: begin
                    rdata <= int_out_3[31:0];
                end
                ADDR_OUT_3_DATA_1: begin
                    rdata <= int_out_3[63:32];
                end
                ADDR_IN_4_DATA_0: begin
                    rdata <= int_in_4[31:0];
                end
                ADDR_IN_4_DATA_1: begin
                    rdata <= int_in_4[63:32];
                end
                ADDR_OUT_4_DATA_0: begin
                    rdata <= int_out_4[31:0];
                end
                ADDR_OUT_4_DATA_1: begin
                    rdata <= int_out_4[63:32];
                end
                ADDR_IN_5_DATA_0: begin
                    rdata <= int_in_5[31:0];
                end
                ADDR_IN_5_DATA_1: begin
                    rdata <= int_in_5[63:32];
                end
                ADDR_OUT_5_DATA_0: begin
                    rdata <= int_out_5[31:0];
                end
                ADDR_OUT_5_DATA_1: begin
                    rdata <= int_out_5[63:32];
                end
                ADDR_IN_6_DATA_0: begin
                    rdata <= int_in_6[31:0];
                end
                ADDR_IN_6_DATA_1: begin
                    rdata <= int_in_6[63:32];
                end
                ADDR_OUT_6_DATA_0: begin
                    rdata <= int_out_6[31:0];
                end
                ADDR_OUT_6_DATA_1: begin
                    rdata <= int_out_6[63:32];
                end
                ADDR_IN_7_DATA_0: begin
                    rdata <= int_in_7[31:0];
                end
                ADDR_IN_7_DATA_1: begin
                    rdata <= int_in_7[63:32];
                end
                ADDR_OUT_7_DATA_0: begin
                    rdata <= int_out_7[31:0];
                end
                ADDR_OUT_7_DATA_1: begin
                    rdata <= int_out_7[63:32];
                end
                ADDR_IN_8_DATA_0: begin
                    rdata <= int_in_8[31:0];
                end
                ADDR_IN_8_DATA_1: begin
                    rdata <= int_in_8[63:32];
                end
                ADDR_OUT_8_DATA_0: begin
                    rdata <= int_out_8[31:0];
                end
                ADDR_OUT_8_DATA_1: begin
                    rdata <= int_out_8[63:32];
                end
                ADDR_IN_9_DATA_0: begin
                    rdata <= int_in_9[31:0];
                end
                ADDR_IN_9_DATA_1: begin
                    rdata <= int_in_9[63:32];
                end
                ADDR_OUT_9_DATA_0: begin
                    rdata <= int_out_9[31:0];
                end
                ADDR_OUT_9_DATA_1: begin
                    rdata <= int_out_9[63:32];
                end
                ADDR_IN_10_DATA_0: begin
                    rdata <= int_in_10[31:0];
                end
                ADDR_IN_10_DATA_1: begin
                    rdata <= int_in_10[63:32];
                end
                ADDR_OUT_10_DATA_0: begin
                    rdata <= int_out_10[31:0];
                end
                ADDR_OUT_10_DATA_1: begin
                    rdata <= int_out_10[63:32];
                end
                ADDR_IN_11_DATA_0: begin
                    rdata <= int_in_11[31:0];
                end
                ADDR_IN_11_DATA_1: begin
                    rdata <= int_in_11[63:32];
                end
                ADDR_OUT_11_DATA_0: begin
                    rdata <= int_out_11[31:0];
                end
                ADDR_OUT_11_DATA_1: begin
                    rdata <= int_out_11[63:32];
                end
                ADDR_ITERS_DATA_0: begin
                    rdata <= int_iters[31:0];
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
assign in_0              = int_in_0;
assign out_0             = int_out_0;
assign in_1              = int_in_1;
assign out_1             = int_out_1;
assign in_2              = int_in_2;
assign out_2             = int_out_2;
assign in_3              = int_in_3;
assign out_3             = int_out_3;
assign in_4              = int_in_4;
assign out_4             = int_out_4;
assign in_5              = int_in_5;
assign out_5             = int_out_5;
assign in_6              = int_in_6;
assign out_6             = int_out_6;
assign in_7              = int_in_7;
assign out_7             = int_out_7;
assign in_8              = int_in_8;
assign out_8             = int_out_8;
assign in_9              = int_in_9;
assign out_9             = int_out_9;
assign in_10             = int_in_10;
assign out_10            = int_out_10;
assign in_11             = int_in_11;
assign out_11            = int_out_11;
assign iters             = int_iters;
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

// int_in_0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_0_DATA_0)
            int_in_0[31:0] <= (WDATA[31:0] & wmask) | (int_in_0[31:0] & ~wmask);
    end
end

// int_in_0[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_0[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_0_DATA_1)
            int_in_0[63:32] <= (WDATA[31:0] & wmask) | (int_in_0[63:32] & ~wmask);
    end
end

// int_out_0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_0_DATA_0)
            int_out_0[31:0] <= (WDATA[31:0] & wmask) | (int_out_0[31:0] & ~wmask);
    end
end

// int_out_0[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_0[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_0_DATA_1)
            int_out_0[63:32] <= (WDATA[31:0] & wmask) | (int_out_0[63:32] & ~wmask);
    end
end

// int_in_1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_1_DATA_0)
            int_in_1[31:0] <= (WDATA[31:0] & wmask) | (int_in_1[31:0] & ~wmask);
    end
end

// int_in_1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_1_DATA_1)
            int_in_1[63:32] <= (WDATA[31:0] & wmask) | (int_in_1[63:32] & ~wmask);
    end
end

// int_out_1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_1_DATA_0)
            int_out_1[31:0] <= (WDATA[31:0] & wmask) | (int_out_1[31:0] & ~wmask);
    end
end

// int_out_1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_1_DATA_1)
            int_out_1[63:32] <= (WDATA[31:0] & wmask) | (int_out_1[63:32] & ~wmask);
    end
end

// int_in_2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_2_DATA_0)
            int_in_2[31:0] <= (WDATA[31:0] & wmask) | (int_in_2[31:0] & ~wmask);
    end
end

// int_in_2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_2_DATA_1)
            int_in_2[63:32] <= (WDATA[31:0] & wmask) | (int_in_2[63:32] & ~wmask);
    end
end

// int_out_2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_2_DATA_0)
            int_out_2[31:0] <= (WDATA[31:0] & wmask) | (int_out_2[31:0] & ~wmask);
    end
end

// int_out_2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_2_DATA_1)
            int_out_2[63:32] <= (WDATA[31:0] & wmask) | (int_out_2[63:32] & ~wmask);
    end
end

// int_in_3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_3_DATA_0)
            int_in_3[31:0] <= (WDATA[31:0] & wmask) | (int_in_3[31:0] & ~wmask);
    end
end

// int_in_3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_3_DATA_1)
            int_in_3[63:32] <= (WDATA[31:0] & wmask) | (int_in_3[63:32] & ~wmask);
    end
end

// int_out_3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_3_DATA_0)
            int_out_3[31:0] <= (WDATA[31:0] & wmask) | (int_out_3[31:0] & ~wmask);
    end
end

// int_out_3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_3_DATA_1)
            int_out_3[63:32] <= (WDATA[31:0] & wmask) | (int_out_3[63:32] & ~wmask);
    end
end

// int_in_4[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_4[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_4_DATA_0)
            int_in_4[31:0] <= (WDATA[31:0] & wmask) | (int_in_4[31:0] & ~wmask);
    end
end

// int_in_4[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_4[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_4_DATA_1)
            int_in_4[63:32] <= (WDATA[31:0] & wmask) | (int_in_4[63:32] & ~wmask);
    end
end

// int_out_4[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_4[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_4_DATA_0)
            int_out_4[31:0] <= (WDATA[31:0] & wmask) | (int_out_4[31:0] & ~wmask);
    end
end

// int_out_4[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_4[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_4_DATA_1)
            int_out_4[63:32] <= (WDATA[31:0] & wmask) | (int_out_4[63:32] & ~wmask);
    end
end

// int_in_5[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_5[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_5_DATA_0)
            int_in_5[31:0] <= (WDATA[31:0] & wmask) | (int_in_5[31:0] & ~wmask);
    end
end

// int_in_5[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_5[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_5_DATA_1)
            int_in_5[63:32] <= (WDATA[31:0] & wmask) | (int_in_5[63:32] & ~wmask);
    end
end

// int_out_5[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_5[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_5_DATA_0)
            int_out_5[31:0] <= (WDATA[31:0] & wmask) | (int_out_5[31:0] & ~wmask);
    end
end

// int_out_5[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_5[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_5_DATA_1)
            int_out_5[63:32] <= (WDATA[31:0] & wmask) | (int_out_5[63:32] & ~wmask);
    end
end

// int_in_6[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_6[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_6_DATA_0)
            int_in_6[31:0] <= (WDATA[31:0] & wmask) | (int_in_6[31:0] & ~wmask);
    end
end

// int_in_6[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_6[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_6_DATA_1)
            int_in_6[63:32] <= (WDATA[31:0] & wmask) | (int_in_6[63:32] & ~wmask);
    end
end

// int_out_6[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_6[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_6_DATA_0)
            int_out_6[31:0] <= (WDATA[31:0] & wmask) | (int_out_6[31:0] & ~wmask);
    end
end

// int_out_6[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_6[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_6_DATA_1)
            int_out_6[63:32] <= (WDATA[31:0] & wmask) | (int_out_6[63:32] & ~wmask);
    end
end

// int_in_7[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_7[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_7_DATA_0)
            int_in_7[31:0] <= (WDATA[31:0] & wmask) | (int_in_7[31:0] & ~wmask);
    end
end

// int_in_7[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_7[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_7_DATA_1)
            int_in_7[63:32] <= (WDATA[31:0] & wmask) | (int_in_7[63:32] & ~wmask);
    end
end

// int_out_7[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_7[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_7_DATA_0)
            int_out_7[31:0] <= (WDATA[31:0] & wmask) | (int_out_7[31:0] & ~wmask);
    end
end

// int_out_7[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_7[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_7_DATA_1)
            int_out_7[63:32] <= (WDATA[31:0] & wmask) | (int_out_7[63:32] & ~wmask);
    end
end

// int_in_8[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_8[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_8_DATA_0)
            int_in_8[31:0] <= (WDATA[31:0] & wmask) | (int_in_8[31:0] & ~wmask);
    end
end

// int_in_8[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_8[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_8_DATA_1)
            int_in_8[63:32] <= (WDATA[31:0] & wmask) | (int_in_8[63:32] & ~wmask);
    end
end

// int_out_8[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_8[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_8_DATA_0)
            int_out_8[31:0] <= (WDATA[31:0] & wmask) | (int_out_8[31:0] & ~wmask);
    end
end

// int_out_8[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_8[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_8_DATA_1)
            int_out_8[63:32] <= (WDATA[31:0] & wmask) | (int_out_8[63:32] & ~wmask);
    end
end

// int_in_9[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_9[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_9_DATA_0)
            int_in_9[31:0] <= (WDATA[31:0] & wmask) | (int_in_9[31:0] & ~wmask);
    end
end

// int_in_9[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_9[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_9_DATA_1)
            int_in_9[63:32] <= (WDATA[31:0] & wmask) | (int_in_9[63:32] & ~wmask);
    end
end

// int_out_9[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_9[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_9_DATA_0)
            int_out_9[31:0] <= (WDATA[31:0] & wmask) | (int_out_9[31:0] & ~wmask);
    end
end

// int_out_9[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_9[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_9_DATA_1)
            int_out_9[63:32] <= (WDATA[31:0] & wmask) | (int_out_9[63:32] & ~wmask);
    end
end

// int_in_10[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_10[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_10_DATA_0)
            int_in_10[31:0] <= (WDATA[31:0] & wmask) | (int_in_10[31:0] & ~wmask);
    end
end

// int_in_10[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_10[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_10_DATA_1)
            int_in_10[63:32] <= (WDATA[31:0] & wmask) | (int_in_10[63:32] & ~wmask);
    end
end

// int_out_10[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_10[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_10_DATA_0)
            int_out_10[31:0] <= (WDATA[31:0] & wmask) | (int_out_10[31:0] & ~wmask);
    end
end

// int_out_10[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_10[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_10_DATA_1)
            int_out_10[63:32] <= (WDATA[31:0] & wmask) | (int_out_10[63:32] & ~wmask);
    end
end

// int_in_11[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_11[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_11_DATA_0)
            int_in_11[31:0] <= (WDATA[31:0] & wmask) | (int_in_11[31:0] & ~wmask);
    end
end

// int_in_11[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_11[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_11_DATA_1)
            int_in_11[63:32] <= (WDATA[31:0] & wmask) | (int_in_11[63:32] & ~wmask);
    end
end

// int_out_11[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_11[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_11_DATA_0)
            int_out_11[31:0] <= (WDATA[31:0] & wmask) | (int_out_11[31:0] & ~wmask);
    end
end

// int_out_11[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_out_11[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUT_11_DATA_1)
            int_out_11[63:32] <= (WDATA[31:0] & wmask) | (int_out_11[63:32] & ~wmask);
    end
end

// int_iters[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_iters[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ITERS_DATA_0)
            int_iters[31:0] <= (WDATA[31:0] & wmask) | (int_iters[31:0] & ~wmask);
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
