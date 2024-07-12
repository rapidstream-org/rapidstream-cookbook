// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module Serpens_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 10,
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
    output wire [63:0]                   edge_list_ptr,
    output wire [63:0]                   edge_list_ch_0,
    output wire [63:0]                   edge_list_ch_1,
    output wire [63:0]                   edge_list_ch_2,
    output wire [63:0]                   edge_list_ch_3,
    output wire [63:0]                   edge_list_ch_4,
    output wire [63:0]                   edge_list_ch_5,
    output wire [63:0]                   edge_list_ch_6,
    output wire [63:0]                   edge_list_ch_7,
    output wire [63:0]                   edge_list_ch_8,
    output wire [63:0]                   edge_list_ch_9,
    output wire [63:0]                   edge_list_ch_10,
    output wire [63:0]                   edge_list_ch_11,
    output wire [63:0]                   edge_list_ch_12,
    output wire [63:0]                   edge_list_ch_13,
    output wire [63:0]                   edge_list_ch_14,
    output wire [63:0]                   edge_list_ch_15,
    output wire [63:0]                   edge_list_ch_16,
    output wire [63:0]                   edge_list_ch_17,
    output wire [63:0]                   edge_list_ch_18,
    output wire [63:0]                   edge_list_ch_19,
    output wire [63:0]                   edge_list_ch_20,
    output wire [63:0]                   edge_list_ch_21,
    output wire [63:0]                   edge_list_ch_22,
    output wire [63:0]                   edge_list_ch_23,
    output wire [63:0]                   edge_list_ch_24,
    output wire [63:0]                   edge_list_ch_25,
    output wire [63:0]                   edge_list_ch_26,
    output wire [63:0]                   edge_list_ch_27,
    output wire [63:0]                   edge_list_ch_28,
    output wire [63:0]                   edge_list_ch_29,
    output wire [63:0]                   edge_list_ch_30,
    output wire [63:0]                   edge_list_ch_31,
    output wire [63:0]                   edge_list_ch_32,
    output wire [63:0]                   edge_list_ch_33,
    output wire [63:0]                   edge_list_ch_34,
    output wire [63:0]                   edge_list_ch_35,
    output wire [63:0]                   edge_list_ch_36,
    output wire [63:0]                   edge_list_ch_37,
    output wire [63:0]                   edge_list_ch_38,
    output wire [63:0]                   edge_list_ch_39,
    output wire [63:0]                   edge_list_ch_40,
    output wire [63:0]                   edge_list_ch_41,
    output wire [63:0]                   edge_list_ch_42,
    output wire [63:0]                   edge_list_ch_43,
    output wire [63:0]                   edge_list_ch_44,
    output wire [63:0]                   edge_list_ch_45,
    output wire [63:0]                   edge_list_ch_46,
    output wire [63:0]                   edge_list_ch_47,
    output wire [63:0]                   edge_list_ch_48,
    output wire [63:0]                   edge_list_ch_49,
    output wire [63:0]                   edge_list_ch_50,
    output wire [63:0]                   edge_list_ch_51,
    output wire [63:0]                   edge_list_ch_52,
    output wire [63:0]                   edge_list_ch_53,
    output wire [63:0]                   edge_list_ch_54,
    output wire [63:0]                   edge_list_ch_55,
    output wire [63:0]                   vec_X,
    output wire [63:0]                   vec_Y,
    output wire [63:0]                   vec_Y_out,
    output wire [31:0]                   NUM_ITE,
    output wire [31:0]                   NUM_A_LEN,
    output wire [31:0]                   M,
    output wire [31:0]                   K,
    output wire [31:0]                   P_N,
    output wire [31:0]                   alpha_u,
    output wire [31:0]                   beta_u,
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
// 0x010 : Data signal of edge_list_ptr
//         bit 31~0 - edge_list_ptr[31:0] (Read/Write)
// 0x014 : Data signal of edge_list_ptr
//         bit 31~0 - edge_list_ptr[63:32] (Read/Write)
// 0x018 : reserved
// 0x01c : Data signal of edge_list_ch_0
//         bit 31~0 - edge_list_ch_0[31:0] (Read/Write)
// 0x020 : Data signal of edge_list_ch_0
//         bit 31~0 - edge_list_ch_0[63:32] (Read/Write)
// 0x024 : reserved
// 0x028 : Data signal of edge_list_ch_1
//         bit 31~0 - edge_list_ch_1[31:0] (Read/Write)
// 0x02c : Data signal of edge_list_ch_1
//         bit 31~0 - edge_list_ch_1[63:32] (Read/Write)
// 0x030 : reserved
// 0x034 : Data signal of edge_list_ch_2
//         bit 31~0 - edge_list_ch_2[31:0] (Read/Write)
// 0x038 : Data signal of edge_list_ch_2
//         bit 31~0 - edge_list_ch_2[63:32] (Read/Write)
// 0x03c : reserved
// 0x040 : Data signal of edge_list_ch_3
//         bit 31~0 - edge_list_ch_3[31:0] (Read/Write)
// 0x044 : Data signal of edge_list_ch_3
//         bit 31~0 - edge_list_ch_3[63:32] (Read/Write)
// 0x048 : reserved
// 0x04c : Data signal of edge_list_ch_4
//         bit 31~0 - edge_list_ch_4[31:0] (Read/Write)
// 0x050 : Data signal of edge_list_ch_4
//         bit 31~0 - edge_list_ch_4[63:32] (Read/Write)
// 0x054 : reserved
// 0x058 : Data signal of edge_list_ch_5
//         bit 31~0 - edge_list_ch_5[31:0] (Read/Write)
// 0x05c : Data signal of edge_list_ch_5
//         bit 31~0 - edge_list_ch_5[63:32] (Read/Write)
// 0x060 : reserved
// 0x064 : Data signal of edge_list_ch_6
//         bit 31~0 - edge_list_ch_6[31:0] (Read/Write)
// 0x068 : Data signal of edge_list_ch_6
//         bit 31~0 - edge_list_ch_6[63:32] (Read/Write)
// 0x06c : reserved
// 0x070 : Data signal of edge_list_ch_7
//         bit 31~0 - edge_list_ch_7[31:0] (Read/Write)
// 0x074 : Data signal of edge_list_ch_7
//         bit 31~0 - edge_list_ch_7[63:32] (Read/Write)
// 0x078 : reserved
// 0x07c : Data signal of edge_list_ch_8
//         bit 31~0 - edge_list_ch_8[31:0] (Read/Write)
// 0x080 : Data signal of edge_list_ch_8
//         bit 31~0 - edge_list_ch_8[63:32] (Read/Write)
// 0x084 : reserved
// 0x088 : Data signal of edge_list_ch_9
//         bit 31~0 - edge_list_ch_9[31:0] (Read/Write)
// 0x08c : Data signal of edge_list_ch_9
//         bit 31~0 - edge_list_ch_9[63:32] (Read/Write)
// 0x090 : reserved
// 0x094 : Data signal of edge_list_ch_10
//         bit 31~0 - edge_list_ch_10[31:0] (Read/Write)
// 0x098 : Data signal of edge_list_ch_10
//         bit 31~0 - edge_list_ch_10[63:32] (Read/Write)
// 0x09c : reserved
// 0x0a0 : Data signal of edge_list_ch_11
//         bit 31~0 - edge_list_ch_11[31:0] (Read/Write)
// 0x0a4 : Data signal of edge_list_ch_11
//         bit 31~0 - edge_list_ch_11[63:32] (Read/Write)
// 0x0a8 : reserved
// 0x0ac : Data signal of edge_list_ch_12
//         bit 31~0 - edge_list_ch_12[31:0] (Read/Write)
// 0x0b0 : Data signal of edge_list_ch_12
//         bit 31~0 - edge_list_ch_12[63:32] (Read/Write)
// 0x0b4 : reserved
// 0x0b8 : Data signal of edge_list_ch_13
//         bit 31~0 - edge_list_ch_13[31:0] (Read/Write)
// 0x0bc : Data signal of edge_list_ch_13
//         bit 31~0 - edge_list_ch_13[63:32] (Read/Write)
// 0x0c0 : reserved
// 0x0c4 : Data signal of edge_list_ch_14
//         bit 31~0 - edge_list_ch_14[31:0] (Read/Write)
// 0x0c8 : Data signal of edge_list_ch_14
//         bit 31~0 - edge_list_ch_14[63:32] (Read/Write)
// 0x0cc : reserved
// 0x0d0 : Data signal of edge_list_ch_15
//         bit 31~0 - edge_list_ch_15[31:0] (Read/Write)
// 0x0d4 : Data signal of edge_list_ch_15
//         bit 31~0 - edge_list_ch_15[63:32] (Read/Write)
// 0x0d8 : reserved
// 0x0dc : Data signal of edge_list_ch_16
//         bit 31~0 - edge_list_ch_16[31:0] (Read/Write)
// 0x0e0 : Data signal of edge_list_ch_16
//         bit 31~0 - edge_list_ch_16[63:32] (Read/Write)
// 0x0e4 : reserved
// 0x0e8 : Data signal of edge_list_ch_17
//         bit 31~0 - edge_list_ch_17[31:0] (Read/Write)
// 0x0ec : Data signal of edge_list_ch_17
//         bit 31~0 - edge_list_ch_17[63:32] (Read/Write)
// 0x0f0 : reserved
// 0x0f4 : Data signal of edge_list_ch_18
//         bit 31~0 - edge_list_ch_18[31:0] (Read/Write)
// 0x0f8 : Data signal of edge_list_ch_18
//         bit 31~0 - edge_list_ch_18[63:32] (Read/Write)
// 0x0fc : reserved
// 0x100 : Data signal of edge_list_ch_19
//         bit 31~0 - edge_list_ch_19[31:0] (Read/Write)
// 0x104 : Data signal of edge_list_ch_19
//         bit 31~0 - edge_list_ch_19[63:32] (Read/Write)
// 0x108 : reserved
// 0x10c : Data signal of edge_list_ch_20
//         bit 31~0 - edge_list_ch_20[31:0] (Read/Write)
// 0x110 : Data signal of edge_list_ch_20
//         bit 31~0 - edge_list_ch_20[63:32] (Read/Write)
// 0x114 : reserved
// 0x118 : Data signal of edge_list_ch_21
//         bit 31~0 - edge_list_ch_21[31:0] (Read/Write)
// 0x11c : Data signal of edge_list_ch_21
//         bit 31~0 - edge_list_ch_21[63:32] (Read/Write)
// 0x120 : reserved
// 0x124 : Data signal of edge_list_ch_22
//         bit 31~0 - edge_list_ch_22[31:0] (Read/Write)
// 0x128 : Data signal of edge_list_ch_22
//         bit 31~0 - edge_list_ch_22[63:32] (Read/Write)
// 0x12c : reserved
// 0x130 : Data signal of edge_list_ch_23
//         bit 31~0 - edge_list_ch_23[31:0] (Read/Write)
// 0x134 : Data signal of edge_list_ch_23
//         bit 31~0 - edge_list_ch_23[63:32] (Read/Write)
// 0x138 : reserved
// 0x13c : Data signal of edge_list_ch_24
//         bit 31~0 - edge_list_ch_24[31:0] (Read/Write)
// 0x140 : Data signal of edge_list_ch_24
//         bit 31~0 - edge_list_ch_24[63:32] (Read/Write)
// 0x144 : reserved
// 0x148 : Data signal of edge_list_ch_25
//         bit 31~0 - edge_list_ch_25[31:0] (Read/Write)
// 0x14c : Data signal of edge_list_ch_25
//         bit 31~0 - edge_list_ch_25[63:32] (Read/Write)
// 0x150 : reserved
// 0x154 : Data signal of edge_list_ch_26
//         bit 31~0 - edge_list_ch_26[31:0] (Read/Write)
// 0x158 : Data signal of edge_list_ch_26
//         bit 31~0 - edge_list_ch_26[63:32] (Read/Write)
// 0x15c : reserved
// 0x160 : Data signal of edge_list_ch_27
//         bit 31~0 - edge_list_ch_27[31:0] (Read/Write)
// 0x164 : Data signal of edge_list_ch_27
//         bit 31~0 - edge_list_ch_27[63:32] (Read/Write)
// 0x168 : reserved
// 0x16c : Data signal of edge_list_ch_28
//         bit 31~0 - edge_list_ch_28[31:0] (Read/Write)
// 0x170 : Data signal of edge_list_ch_28
//         bit 31~0 - edge_list_ch_28[63:32] (Read/Write)
// 0x174 : reserved
// 0x178 : Data signal of edge_list_ch_29
//         bit 31~0 - edge_list_ch_29[31:0] (Read/Write)
// 0x17c : Data signal of edge_list_ch_29
//         bit 31~0 - edge_list_ch_29[63:32] (Read/Write)
// 0x180 : reserved
// 0x184 : Data signal of edge_list_ch_30
//         bit 31~0 - edge_list_ch_30[31:0] (Read/Write)
// 0x188 : Data signal of edge_list_ch_30
//         bit 31~0 - edge_list_ch_30[63:32] (Read/Write)
// 0x18c : reserved
// 0x190 : Data signal of edge_list_ch_31
//         bit 31~0 - edge_list_ch_31[31:0] (Read/Write)
// 0x194 : Data signal of edge_list_ch_31
//         bit 31~0 - edge_list_ch_31[63:32] (Read/Write)
// 0x198 : reserved
// 0x19c : Data signal of edge_list_ch_32
//         bit 31~0 - edge_list_ch_32[31:0] (Read/Write)
// 0x1a0 : Data signal of edge_list_ch_32
//         bit 31~0 - edge_list_ch_32[63:32] (Read/Write)
// 0x1a4 : reserved
// 0x1a8 : Data signal of edge_list_ch_33
//         bit 31~0 - edge_list_ch_33[31:0] (Read/Write)
// 0x1ac : Data signal of edge_list_ch_33
//         bit 31~0 - edge_list_ch_33[63:32] (Read/Write)
// 0x1b0 : reserved
// 0x1b4 : Data signal of edge_list_ch_34
//         bit 31~0 - edge_list_ch_34[31:0] (Read/Write)
// 0x1b8 : Data signal of edge_list_ch_34
//         bit 31~0 - edge_list_ch_34[63:32] (Read/Write)
// 0x1bc : reserved
// 0x1c0 : Data signal of edge_list_ch_35
//         bit 31~0 - edge_list_ch_35[31:0] (Read/Write)
// 0x1c4 : Data signal of edge_list_ch_35
//         bit 31~0 - edge_list_ch_35[63:32] (Read/Write)
// 0x1c8 : reserved
// 0x1cc : Data signal of edge_list_ch_36
//         bit 31~0 - edge_list_ch_36[31:0] (Read/Write)
// 0x1d0 : Data signal of edge_list_ch_36
//         bit 31~0 - edge_list_ch_36[63:32] (Read/Write)
// 0x1d4 : reserved
// 0x1d8 : Data signal of edge_list_ch_37
//         bit 31~0 - edge_list_ch_37[31:0] (Read/Write)
// 0x1dc : Data signal of edge_list_ch_37
//         bit 31~0 - edge_list_ch_37[63:32] (Read/Write)
// 0x1e0 : reserved
// 0x1e4 : Data signal of edge_list_ch_38
//         bit 31~0 - edge_list_ch_38[31:0] (Read/Write)
// 0x1e8 : Data signal of edge_list_ch_38
//         bit 31~0 - edge_list_ch_38[63:32] (Read/Write)
// 0x1ec : reserved
// 0x1f0 : Data signal of edge_list_ch_39
//         bit 31~0 - edge_list_ch_39[31:0] (Read/Write)
// 0x1f4 : Data signal of edge_list_ch_39
//         bit 31~0 - edge_list_ch_39[63:32] (Read/Write)
// 0x1f8 : reserved
// 0x1fc : Data signal of edge_list_ch_40
//         bit 31~0 - edge_list_ch_40[31:0] (Read/Write)
// 0x200 : Data signal of edge_list_ch_40
//         bit 31~0 - edge_list_ch_40[63:32] (Read/Write)
// 0x204 : reserved
// 0x208 : Data signal of edge_list_ch_41
//         bit 31~0 - edge_list_ch_41[31:0] (Read/Write)
// 0x20c : Data signal of edge_list_ch_41
//         bit 31~0 - edge_list_ch_41[63:32] (Read/Write)
// 0x210 : reserved
// 0x214 : Data signal of edge_list_ch_42
//         bit 31~0 - edge_list_ch_42[31:0] (Read/Write)
// 0x218 : Data signal of edge_list_ch_42
//         bit 31~0 - edge_list_ch_42[63:32] (Read/Write)
// 0x21c : reserved
// 0x220 : Data signal of edge_list_ch_43
//         bit 31~0 - edge_list_ch_43[31:0] (Read/Write)
// 0x224 : Data signal of edge_list_ch_43
//         bit 31~0 - edge_list_ch_43[63:32] (Read/Write)
// 0x228 : reserved
// 0x22c : Data signal of edge_list_ch_44
//         bit 31~0 - edge_list_ch_44[31:0] (Read/Write)
// 0x230 : Data signal of edge_list_ch_44
//         bit 31~0 - edge_list_ch_44[63:32] (Read/Write)
// 0x234 : reserved
// 0x238 : Data signal of edge_list_ch_45
//         bit 31~0 - edge_list_ch_45[31:0] (Read/Write)
// 0x23c : Data signal of edge_list_ch_45
//         bit 31~0 - edge_list_ch_45[63:32] (Read/Write)
// 0x240 : reserved
// 0x244 : Data signal of edge_list_ch_46
//         bit 31~0 - edge_list_ch_46[31:0] (Read/Write)
// 0x248 : Data signal of edge_list_ch_46
//         bit 31~0 - edge_list_ch_46[63:32] (Read/Write)
// 0x24c : reserved
// 0x250 : Data signal of edge_list_ch_47
//         bit 31~0 - edge_list_ch_47[31:0] (Read/Write)
// 0x254 : Data signal of edge_list_ch_47
//         bit 31~0 - edge_list_ch_47[63:32] (Read/Write)
// 0x258 : reserved
// 0x25c : Data signal of edge_list_ch_48
//         bit 31~0 - edge_list_ch_48[31:0] (Read/Write)
// 0x260 : Data signal of edge_list_ch_48
//         bit 31~0 - edge_list_ch_48[63:32] (Read/Write)
// 0x264 : reserved
// 0x268 : Data signal of edge_list_ch_49
//         bit 31~0 - edge_list_ch_49[31:0] (Read/Write)
// 0x26c : Data signal of edge_list_ch_49
//         bit 31~0 - edge_list_ch_49[63:32] (Read/Write)
// 0x270 : reserved
// 0x274 : Data signal of edge_list_ch_50
//         bit 31~0 - edge_list_ch_50[31:0] (Read/Write)
// 0x278 : Data signal of edge_list_ch_50
//         bit 31~0 - edge_list_ch_50[63:32] (Read/Write)
// 0x27c : reserved
// 0x280 : Data signal of edge_list_ch_51
//         bit 31~0 - edge_list_ch_51[31:0] (Read/Write)
// 0x284 : Data signal of edge_list_ch_51
//         bit 31~0 - edge_list_ch_51[63:32] (Read/Write)
// 0x288 : reserved
// 0x28c : Data signal of edge_list_ch_52
//         bit 31~0 - edge_list_ch_52[31:0] (Read/Write)
// 0x290 : Data signal of edge_list_ch_52
//         bit 31~0 - edge_list_ch_52[63:32] (Read/Write)
// 0x294 : reserved
// 0x298 : Data signal of edge_list_ch_53
//         bit 31~0 - edge_list_ch_53[31:0] (Read/Write)
// 0x29c : Data signal of edge_list_ch_53
//         bit 31~0 - edge_list_ch_53[63:32] (Read/Write)
// 0x2a0 : reserved
// 0x2a4 : Data signal of edge_list_ch_54
//         bit 31~0 - edge_list_ch_54[31:0] (Read/Write)
// 0x2a8 : Data signal of edge_list_ch_54
//         bit 31~0 - edge_list_ch_54[63:32] (Read/Write)
// 0x2ac : reserved
// 0x2b0 : Data signal of edge_list_ch_55
//         bit 31~0 - edge_list_ch_55[31:0] (Read/Write)
// 0x2b4 : Data signal of edge_list_ch_55
//         bit 31~0 - edge_list_ch_55[63:32] (Read/Write)
// 0x2b8 : reserved
// 0x2bc : Data signal of vec_X
//         bit 31~0 - vec_X[31:0] (Read/Write)
// 0x2c0 : Data signal of vec_X
//         bit 31~0 - vec_X[63:32] (Read/Write)
// 0x2c4 : reserved
// 0x2c8 : Data signal of vec_Y
//         bit 31~0 - vec_Y[31:0] (Read/Write)
// 0x2cc : Data signal of vec_Y
//         bit 31~0 - vec_Y[63:32] (Read/Write)
// 0x2d0 : reserved
// 0x2d4 : Data signal of vec_Y_out
//         bit 31~0 - vec_Y_out[31:0] (Read/Write)
// 0x2d8 : Data signal of vec_Y_out
//         bit 31~0 - vec_Y_out[63:32] (Read/Write)
// 0x2dc : reserved
// 0x2e0 : Data signal of NUM_ITE
//         bit 31~0 - NUM_ITE[31:0] (Read/Write)
// 0x2e4 : reserved
// 0x2e8 : Data signal of NUM_A_LEN
//         bit 31~0 - NUM_A_LEN[31:0] (Read/Write)
// 0x2ec : reserved
// 0x2f0 : Data signal of M
//         bit 31~0 - M[31:0] (Read/Write)
// 0x2f4 : reserved
// 0x2f8 : Data signal of K
//         bit 31~0 - K[31:0] (Read/Write)
// 0x2fc : reserved
// 0x300 : Data signal of P_N
//         bit 31~0 - P_N[31:0] (Read/Write)
// 0x304 : reserved
// 0x308 : Data signal of alpha_u
//         bit 31~0 - alpha_u[31:0] (Read/Write)
// 0x30c : reserved
// 0x310 : Data signal of beta_u
//         bit 31~0 - beta_u[31:0] (Read/Write)
// 0x314 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL                = 10'h000,
    ADDR_GIE                    = 10'h004,
    ADDR_IER                    = 10'h008,
    ADDR_ISR                    = 10'h00c,
    ADDR_EDGE_LIST_PTR_DATA_0   = 10'h010,
    ADDR_EDGE_LIST_PTR_DATA_1   = 10'h014,
    ADDR_EDGE_LIST_PTR_CTRL     = 10'h018,
    ADDR_EDGE_LIST_CH_0_DATA_0  = 10'h01c,
    ADDR_EDGE_LIST_CH_0_DATA_1  = 10'h020,
    ADDR_EDGE_LIST_CH_0_CTRL    = 10'h024,
    ADDR_EDGE_LIST_CH_1_DATA_0  = 10'h028,
    ADDR_EDGE_LIST_CH_1_DATA_1  = 10'h02c,
    ADDR_EDGE_LIST_CH_1_CTRL    = 10'h030,
    ADDR_EDGE_LIST_CH_2_DATA_0  = 10'h034,
    ADDR_EDGE_LIST_CH_2_DATA_1  = 10'h038,
    ADDR_EDGE_LIST_CH_2_CTRL    = 10'h03c,
    ADDR_EDGE_LIST_CH_3_DATA_0  = 10'h040,
    ADDR_EDGE_LIST_CH_3_DATA_1  = 10'h044,
    ADDR_EDGE_LIST_CH_3_CTRL    = 10'h048,
    ADDR_EDGE_LIST_CH_4_DATA_0  = 10'h04c,
    ADDR_EDGE_LIST_CH_4_DATA_1  = 10'h050,
    ADDR_EDGE_LIST_CH_4_CTRL    = 10'h054,
    ADDR_EDGE_LIST_CH_5_DATA_0  = 10'h058,
    ADDR_EDGE_LIST_CH_5_DATA_1  = 10'h05c,
    ADDR_EDGE_LIST_CH_5_CTRL    = 10'h060,
    ADDR_EDGE_LIST_CH_6_DATA_0  = 10'h064,
    ADDR_EDGE_LIST_CH_6_DATA_1  = 10'h068,
    ADDR_EDGE_LIST_CH_6_CTRL    = 10'h06c,
    ADDR_EDGE_LIST_CH_7_DATA_0  = 10'h070,
    ADDR_EDGE_LIST_CH_7_DATA_1  = 10'h074,
    ADDR_EDGE_LIST_CH_7_CTRL    = 10'h078,
    ADDR_EDGE_LIST_CH_8_DATA_0  = 10'h07c,
    ADDR_EDGE_LIST_CH_8_DATA_1  = 10'h080,
    ADDR_EDGE_LIST_CH_8_CTRL    = 10'h084,
    ADDR_EDGE_LIST_CH_9_DATA_0  = 10'h088,
    ADDR_EDGE_LIST_CH_9_DATA_1  = 10'h08c,
    ADDR_EDGE_LIST_CH_9_CTRL    = 10'h090,
    ADDR_EDGE_LIST_CH_10_DATA_0 = 10'h094,
    ADDR_EDGE_LIST_CH_10_DATA_1 = 10'h098,
    ADDR_EDGE_LIST_CH_10_CTRL   = 10'h09c,
    ADDR_EDGE_LIST_CH_11_DATA_0 = 10'h0a0,
    ADDR_EDGE_LIST_CH_11_DATA_1 = 10'h0a4,
    ADDR_EDGE_LIST_CH_11_CTRL   = 10'h0a8,
    ADDR_EDGE_LIST_CH_12_DATA_0 = 10'h0ac,
    ADDR_EDGE_LIST_CH_12_DATA_1 = 10'h0b0,
    ADDR_EDGE_LIST_CH_12_CTRL   = 10'h0b4,
    ADDR_EDGE_LIST_CH_13_DATA_0 = 10'h0b8,
    ADDR_EDGE_LIST_CH_13_DATA_1 = 10'h0bc,
    ADDR_EDGE_LIST_CH_13_CTRL   = 10'h0c0,
    ADDR_EDGE_LIST_CH_14_DATA_0 = 10'h0c4,
    ADDR_EDGE_LIST_CH_14_DATA_1 = 10'h0c8,
    ADDR_EDGE_LIST_CH_14_CTRL   = 10'h0cc,
    ADDR_EDGE_LIST_CH_15_DATA_0 = 10'h0d0,
    ADDR_EDGE_LIST_CH_15_DATA_1 = 10'h0d4,
    ADDR_EDGE_LIST_CH_15_CTRL   = 10'h0d8,
    ADDR_EDGE_LIST_CH_16_DATA_0 = 10'h0dc,
    ADDR_EDGE_LIST_CH_16_DATA_1 = 10'h0e0,
    ADDR_EDGE_LIST_CH_16_CTRL   = 10'h0e4,
    ADDR_EDGE_LIST_CH_17_DATA_0 = 10'h0e8,
    ADDR_EDGE_LIST_CH_17_DATA_1 = 10'h0ec,
    ADDR_EDGE_LIST_CH_17_CTRL   = 10'h0f0,
    ADDR_EDGE_LIST_CH_18_DATA_0 = 10'h0f4,
    ADDR_EDGE_LIST_CH_18_DATA_1 = 10'h0f8,
    ADDR_EDGE_LIST_CH_18_CTRL   = 10'h0fc,
    ADDR_EDGE_LIST_CH_19_DATA_0 = 10'h100,
    ADDR_EDGE_LIST_CH_19_DATA_1 = 10'h104,
    ADDR_EDGE_LIST_CH_19_CTRL   = 10'h108,
    ADDR_EDGE_LIST_CH_20_DATA_0 = 10'h10c,
    ADDR_EDGE_LIST_CH_20_DATA_1 = 10'h110,
    ADDR_EDGE_LIST_CH_20_CTRL   = 10'h114,
    ADDR_EDGE_LIST_CH_21_DATA_0 = 10'h118,
    ADDR_EDGE_LIST_CH_21_DATA_1 = 10'h11c,
    ADDR_EDGE_LIST_CH_21_CTRL   = 10'h120,
    ADDR_EDGE_LIST_CH_22_DATA_0 = 10'h124,
    ADDR_EDGE_LIST_CH_22_DATA_1 = 10'h128,
    ADDR_EDGE_LIST_CH_22_CTRL   = 10'h12c,
    ADDR_EDGE_LIST_CH_23_DATA_0 = 10'h130,
    ADDR_EDGE_LIST_CH_23_DATA_1 = 10'h134,
    ADDR_EDGE_LIST_CH_23_CTRL   = 10'h138,
    ADDR_EDGE_LIST_CH_24_DATA_0 = 10'h13c,
    ADDR_EDGE_LIST_CH_24_DATA_1 = 10'h140,
    ADDR_EDGE_LIST_CH_24_CTRL   = 10'h144,
    ADDR_EDGE_LIST_CH_25_DATA_0 = 10'h148,
    ADDR_EDGE_LIST_CH_25_DATA_1 = 10'h14c,
    ADDR_EDGE_LIST_CH_25_CTRL   = 10'h150,
    ADDR_EDGE_LIST_CH_26_DATA_0 = 10'h154,
    ADDR_EDGE_LIST_CH_26_DATA_1 = 10'h158,
    ADDR_EDGE_LIST_CH_26_CTRL   = 10'h15c,
    ADDR_EDGE_LIST_CH_27_DATA_0 = 10'h160,
    ADDR_EDGE_LIST_CH_27_DATA_1 = 10'h164,
    ADDR_EDGE_LIST_CH_27_CTRL   = 10'h168,
    ADDR_EDGE_LIST_CH_28_DATA_0 = 10'h16c,
    ADDR_EDGE_LIST_CH_28_DATA_1 = 10'h170,
    ADDR_EDGE_LIST_CH_28_CTRL   = 10'h174,
    ADDR_EDGE_LIST_CH_29_DATA_0 = 10'h178,
    ADDR_EDGE_LIST_CH_29_DATA_1 = 10'h17c,
    ADDR_EDGE_LIST_CH_29_CTRL   = 10'h180,
    ADDR_EDGE_LIST_CH_30_DATA_0 = 10'h184,
    ADDR_EDGE_LIST_CH_30_DATA_1 = 10'h188,
    ADDR_EDGE_LIST_CH_30_CTRL   = 10'h18c,
    ADDR_EDGE_LIST_CH_31_DATA_0 = 10'h190,
    ADDR_EDGE_LIST_CH_31_DATA_1 = 10'h194,
    ADDR_EDGE_LIST_CH_31_CTRL   = 10'h198,
    ADDR_EDGE_LIST_CH_32_DATA_0 = 10'h19c,
    ADDR_EDGE_LIST_CH_32_DATA_1 = 10'h1a0,
    ADDR_EDGE_LIST_CH_32_CTRL   = 10'h1a4,
    ADDR_EDGE_LIST_CH_33_DATA_0 = 10'h1a8,
    ADDR_EDGE_LIST_CH_33_DATA_1 = 10'h1ac,
    ADDR_EDGE_LIST_CH_33_CTRL   = 10'h1b0,
    ADDR_EDGE_LIST_CH_34_DATA_0 = 10'h1b4,
    ADDR_EDGE_LIST_CH_34_DATA_1 = 10'h1b8,
    ADDR_EDGE_LIST_CH_34_CTRL   = 10'h1bc,
    ADDR_EDGE_LIST_CH_35_DATA_0 = 10'h1c0,
    ADDR_EDGE_LIST_CH_35_DATA_1 = 10'h1c4,
    ADDR_EDGE_LIST_CH_35_CTRL   = 10'h1c8,
    ADDR_EDGE_LIST_CH_36_DATA_0 = 10'h1cc,
    ADDR_EDGE_LIST_CH_36_DATA_1 = 10'h1d0,
    ADDR_EDGE_LIST_CH_36_CTRL   = 10'h1d4,
    ADDR_EDGE_LIST_CH_37_DATA_0 = 10'h1d8,
    ADDR_EDGE_LIST_CH_37_DATA_1 = 10'h1dc,
    ADDR_EDGE_LIST_CH_37_CTRL   = 10'h1e0,
    ADDR_EDGE_LIST_CH_38_DATA_0 = 10'h1e4,
    ADDR_EDGE_LIST_CH_38_DATA_1 = 10'h1e8,
    ADDR_EDGE_LIST_CH_38_CTRL   = 10'h1ec,
    ADDR_EDGE_LIST_CH_39_DATA_0 = 10'h1f0,
    ADDR_EDGE_LIST_CH_39_DATA_1 = 10'h1f4,
    ADDR_EDGE_LIST_CH_39_CTRL   = 10'h1f8,
    ADDR_EDGE_LIST_CH_40_DATA_0 = 10'h1fc,
    ADDR_EDGE_LIST_CH_40_DATA_1 = 10'h200,
    ADDR_EDGE_LIST_CH_40_CTRL   = 10'h204,
    ADDR_EDGE_LIST_CH_41_DATA_0 = 10'h208,
    ADDR_EDGE_LIST_CH_41_DATA_1 = 10'h20c,
    ADDR_EDGE_LIST_CH_41_CTRL   = 10'h210,
    ADDR_EDGE_LIST_CH_42_DATA_0 = 10'h214,
    ADDR_EDGE_LIST_CH_42_DATA_1 = 10'h218,
    ADDR_EDGE_LIST_CH_42_CTRL   = 10'h21c,
    ADDR_EDGE_LIST_CH_43_DATA_0 = 10'h220,
    ADDR_EDGE_LIST_CH_43_DATA_1 = 10'h224,
    ADDR_EDGE_LIST_CH_43_CTRL   = 10'h228,
    ADDR_EDGE_LIST_CH_44_DATA_0 = 10'h22c,
    ADDR_EDGE_LIST_CH_44_DATA_1 = 10'h230,
    ADDR_EDGE_LIST_CH_44_CTRL   = 10'h234,
    ADDR_EDGE_LIST_CH_45_DATA_0 = 10'h238,
    ADDR_EDGE_LIST_CH_45_DATA_1 = 10'h23c,
    ADDR_EDGE_LIST_CH_45_CTRL   = 10'h240,
    ADDR_EDGE_LIST_CH_46_DATA_0 = 10'h244,
    ADDR_EDGE_LIST_CH_46_DATA_1 = 10'h248,
    ADDR_EDGE_LIST_CH_46_CTRL   = 10'h24c,
    ADDR_EDGE_LIST_CH_47_DATA_0 = 10'h250,
    ADDR_EDGE_LIST_CH_47_DATA_1 = 10'h254,
    ADDR_EDGE_LIST_CH_47_CTRL   = 10'h258,
    ADDR_EDGE_LIST_CH_48_DATA_0 = 10'h25c,
    ADDR_EDGE_LIST_CH_48_DATA_1 = 10'h260,
    ADDR_EDGE_LIST_CH_48_CTRL   = 10'h264,
    ADDR_EDGE_LIST_CH_49_DATA_0 = 10'h268,
    ADDR_EDGE_LIST_CH_49_DATA_1 = 10'h26c,
    ADDR_EDGE_LIST_CH_49_CTRL   = 10'h270,
    ADDR_EDGE_LIST_CH_50_DATA_0 = 10'h274,
    ADDR_EDGE_LIST_CH_50_DATA_1 = 10'h278,
    ADDR_EDGE_LIST_CH_50_CTRL   = 10'h27c,
    ADDR_EDGE_LIST_CH_51_DATA_0 = 10'h280,
    ADDR_EDGE_LIST_CH_51_DATA_1 = 10'h284,
    ADDR_EDGE_LIST_CH_51_CTRL   = 10'h288,
    ADDR_EDGE_LIST_CH_52_DATA_0 = 10'h28c,
    ADDR_EDGE_LIST_CH_52_DATA_1 = 10'h290,
    ADDR_EDGE_LIST_CH_52_CTRL   = 10'h294,
    ADDR_EDGE_LIST_CH_53_DATA_0 = 10'h298,
    ADDR_EDGE_LIST_CH_53_DATA_1 = 10'h29c,
    ADDR_EDGE_LIST_CH_53_CTRL   = 10'h2a0,
    ADDR_EDGE_LIST_CH_54_DATA_0 = 10'h2a4,
    ADDR_EDGE_LIST_CH_54_DATA_1 = 10'h2a8,
    ADDR_EDGE_LIST_CH_54_CTRL   = 10'h2ac,
    ADDR_EDGE_LIST_CH_55_DATA_0 = 10'h2b0,
    ADDR_EDGE_LIST_CH_55_DATA_1 = 10'h2b4,
    ADDR_EDGE_LIST_CH_55_CTRL   = 10'h2b8,
    ADDR_VEC_X_DATA_0           = 10'h2bc,
    ADDR_VEC_X_DATA_1           = 10'h2c0,
    ADDR_VEC_X_CTRL             = 10'h2c4,
    ADDR_VEC_Y_DATA_0           = 10'h2c8,
    ADDR_VEC_Y_DATA_1           = 10'h2cc,
    ADDR_VEC_Y_CTRL             = 10'h2d0,
    ADDR_VEC_Y_OUT_DATA_0       = 10'h2d4,
    ADDR_VEC_Y_OUT_DATA_1       = 10'h2d8,
    ADDR_VEC_Y_OUT_CTRL         = 10'h2dc,
    ADDR_NUM_ITE_DATA_0         = 10'h2e0,
    ADDR_NUM_ITE_CTRL           = 10'h2e4,
    ADDR_NUM_A_LEN_DATA_0       = 10'h2e8,
    ADDR_NUM_A_LEN_CTRL         = 10'h2ec,
    ADDR_M_DATA_0               = 10'h2f0,
    ADDR_M_CTRL                 = 10'h2f4,
    ADDR_K_DATA_0               = 10'h2f8,
    ADDR_K_CTRL                 = 10'h2fc,
    ADDR_P_N_DATA_0             = 10'h300,
    ADDR_P_N_CTRL               = 10'h304,
    ADDR_ALPHA_U_DATA_0         = 10'h308,
    ADDR_ALPHA_U_CTRL           = 10'h30c,
    ADDR_BETA_U_DATA_0          = 10'h310,
    ADDR_BETA_U_CTRL            = 10'h314,
    WRIDLE                      = 2'd0,
    WRDATA                      = 2'd1,
    WRRESP                      = 2'd2,
    WRRESET                     = 2'd3,
    RDIDLE                      = 2'd0,
    RDDATA                      = 2'd1,
    RDRESET                     = 2'd2,
    ADDR_BITS                = 10;

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
    reg  [63:0]                   int_edge_list_ptr = 'b0;
    reg  [63:0]                   int_edge_list_ch_0 = 'b0;
    reg  [63:0]                   int_edge_list_ch_1 = 'b0;
    reg  [63:0]                   int_edge_list_ch_2 = 'b0;
    reg  [63:0]                   int_edge_list_ch_3 = 'b0;
    reg  [63:0]                   int_edge_list_ch_4 = 'b0;
    reg  [63:0]                   int_edge_list_ch_5 = 'b0;
    reg  [63:0]                   int_edge_list_ch_6 = 'b0;
    reg  [63:0]                   int_edge_list_ch_7 = 'b0;
    reg  [63:0]                   int_edge_list_ch_8 = 'b0;
    reg  [63:0]                   int_edge_list_ch_9 = 'b0;
    reg  [63:0]                   int_edge_list_ch_10 = 'b0;
    reg  [63:0]                   int_edge_list_ch_11 = 'b0;
    reg  [63:0]                   int_edge_list_ch_12 = 'b0;
    reg  [63:0]                   int_edge_list_ch_13 = 'b0;
    reg  [63:0]                   int_edge_list_ch_14 = 'b0;
    reg  [63:0]                   int_edge_list_ch_15 = 'b0;
    reg  [63:0]                   int_edge_list_ch_16 = 'b0;
    reg  [63:0]                   int_edge_list_ch_17 = 'b0;
    reg  [63:0]                   int_edge_list_ch_18 = 'b0;
    reg  [63:0]                   int_edge_list_ch_19 = 'b0;
    reg  [63:0]                   int_edge_list_ch_20 = 'b0;
    reg  [63:0]                   int_edge_list_ch_21 = 'b0;
    reg  [63:0]                   int_edge_list_ch_22 = 'b0;
    reg  [63:0]                   int_edge_list_ch_23 = 'b0;
    reg  [63:0]                   int_edge_list_ch_24 = 'b0;
    reg  [63:0]                   int_edge_list_ch_25 = 'b0;
    reg  [63:0]                   int_edge_list_ch_26 = 'b0;
    reg  [63:0]                   int_edge_list_ch_27 = 'b0;
    reg  [63:0]                   int_edge_list_ch_28 = 'b0;
    reg  [63:0]                   int_edge_list_ch_29 = 'b0;
    reg  [63:0]                   int_edge_list_ch_30 = 'b0;
    reg  [63:0]                   int_edge_list_ch_31 = 'b0;
    reg  [63:0]                   int_edge_list_ch_32 = 'b0;
    reg  [63:0]                   int_edge_list_ch_33 = 'b0;
    reg  [63:0]                   int_edge_list_ch_34 = 'b0;
    reg  [63:0]                   int_edge_list_ch_35 = 'b0;
    reg  [63:0]                   int_edge_list_ch_36 = 'b0;
    reg  [63:0]                   int_edge_list_ch_37 = 'b0;
    reg  [63:0]                   int_edge_list_ch_38 = 'b0;
    reg  [63:0]                   int_edge_list_ch_39 = 'b0;
    reg  [63:0]                   int_edge_list_ch_40 = 'b0;
    reg  [63:0]                   int_edge_list_ch_41 = 'b0;
    reg  [63:0]                   int_edge_list_ch_42 = 'b0;
    reg  [63:0]                   int_edge_list_ch_43 = 'b0;
    reg  [63:0]                   int_edge_list_ch_44 = 'b0;
    reg  [63:0]                   int_edge_list_ch_45 = 'b0;
    reg  [63:0]                   int_edge_list_ch_46 = 'b0;
    reg  [63:0]                   int_edge_list_ch_47 = 'b0;
    reg  [63:0]                   int_edge_list_ch_48 = 'b0;
    reg  [63:0]                   int_edge_list_ch_49 = 'b0;
    reg  [63:0]                   int_edge_list_ch_50 = 'b0;
    reg  [63:0]                   int_edge_list_ch_51 = 'b0;
    reg  [63:0]                   int_edge_list_ch_52 = 'b0;
    reg  [63:0]                   int_edge_list_ch_53 = 'b0;
    reg  [63:0]                   int_edge_list_ch_54 = 'b0;
    reg  [63:0]                   int_edge_list_ch_55 = 'b0;
    reg  [63:0]                   int_vec_X = 'b0;
    reg  [63:0]                   int_vec_Y = 'b0;
    reg  [63:0]                   int_vec_Y_out = 'b0;
    reg  [31:0]                   int_NUM_ITE = 'b0;
    reg  [31:0]                   int_NUM_A_LEN = 'b0;
    reg  [31:0]                   int_M = 'b0;
    reg  [31:0]                   int_K = 'b0;
    reg  [31:0]                   int_P_N = 'b0;
    reg  [31:0]                   int_alpha_u = 'b0;
    reg  [31:0]                   int_beta_u = 'b0;

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
                ADDR_EDGE_LIST_PTR_DATA_0: begin
                    rdata <= int_edge_list_ptr[31:0];
                end
                ADDR_EDGE_LIST_PTR_DATA_1: begin
                    rdata <= int_edge_list_ptr[63:32];
                end
                ADDR_EDGE_LIST_CH_0_DATA_0: begin
                    rdata <= int_edge_list_ch_0[31:0];
                end
                ADDR_EDGE_LIST_CH_0_DATA_1: begin
                    rdata <= int_edge_list_ch_0[63:32];
                end
                ADDR_EDGE_LIST_CH_1_DATA_0: begin
                    rdata <= int_edge_list_ch_1[31:0];
                end
                ADDR_EDGE_LIST_CH_1_DATA_1: begin
                    rdata <= int_edge_list_ch_1[63:32];
                end
                ADDR_EDGE_LIST_CH_2_DATA_0: begin
                    rdata <= int_edge_list_ch_2[31:0];
                end
                ADDR_EDGE_LIST_CH_2_DATA_1: begin
                    rdata <= int_edge_list_ch_2[63:32];
                end
                ADDR_EDGE_LIST_CH_3_DATA_0: begin
                    rdata <= int_edge_list_ch_3[31:0];
                end
                ADDR_EDGE_LIST_CH_3_DATA_1: begin
                    rdata <= int_edge_list_ch_3[63:32];
                end
                ADDR_EDGE_LIST_CH_4_DATA_0: begin
                    rdata <= int_edge_list_ch_4[31:0];
                end
                ADDR_EDGE_LIST_CH_4_DATA_1: begin
                    rdata <= int_edge_list_ch_4[63:32];
                end
                ADDR_EDGE_LIST_CH_5_DATA_0: begin
                    rdata <= int_edge_list_ch_5[31:0];
                end
                ADDR_EDGE_LIST_CH_5_DATA_1: begin
                    rdata <= int_edge_list_ch_5[63:32];
                end
                ADDR_EDGE_LIST_CH_6_DATA_0: begin
                    rdata <= int_edge_list_ch_6[31:0];
                end
                ADDR_EDGE_LIST_CH_6_DATA_1: begin
                    rdata <= int_edge_list_ch_6[63:32];
                end
                ADDR_EDGE_LIST_CH_7_DATA_0: begin
                    rdata <= int_edge_list_ch_7[31:0];
                end
                ADDR_EDGE_LIST_CH_7_DATA_1: begin
                    rdata <= int_edge_list_ch_7[63:32];
                end
                ADDR_EDGE_LIST_CH_8_DATA_0: begin
                    rdata <= int_edge_list_ch_8[31:0];
                end
                ADDR_EDGE_LIST_CH_8_DATA_1: begin
                    rdata <= int_edge_list_ch_8[63:32];
                end
                ADDR_EDGE_LIST_CH_9_DATA_0: begin
                    rdata <= int_edge_list_ch_9[31:0];
                end
                ADDR_EDGE_LIST_CH_9_DATA_1: begin
                    rdata <= int_edge_list_ch_9[63:32];
                end
                ADDR_EDGE_LIST_CH_10_DATA_0: begin
                    rdata <= int_edge_list_ch_10[31:0];
                end
                ADDR_EDGE_LIST_CH_10_DATA_1: begin
                    rdata <= int_edge_list_ch_10[63:32];
                end
                ADDR_EDGE_LIST_CH_11_DATA_0: begin
                    rdata <= int_edge_list_ch_11[31:0];
                end
                ADDR_EDGE_LIST_CH_11_DATA_1: begin
                    rdata <= int_edge_list_ch_11[63:32];
                end
                ADDR_EDGE_LIST_CH_12_DATA_0: begin
                    rdata <= int_edge_list_ch_12[31:0];
                end
                ADDR_EDGE_LIST_CH_12_DATA_1: begin
                    rdata <= int_edge_list_ch_12[63:32];
                end
                ADDR_EDGE_LIST_CH_13_DATA_0: begin
                    rdata <= int_edge_list_ch_13[31:0];
                end
                ADDR_EDGE_LIST_CH_13_DATA_1: begin
                    rdata <= int_edge_list_ch_13[63:32];
                end
                ADDR_EDGE_LIST_CH_14_DATA_0: begin
                    rdata <= int_edge_list_ch_14[31:0];
                end
                ADDR_EDGE_LIST_CH_14_DATA_1: begin
                    rdata <= int_edge_list_ch_14[63:32];
                end
                ADDR_EDGE_LIST_CH_15_DATA_0: begin
                    rdata <= int_edge_list_ch_15[31:0];
                end
                ADDR_EDGE_LIST_CH_15_DATA_1: begin
                    rdata <= int_edge_list_ch_15[63:32];
                end
                ADDR_EDGE_LIST_CH_16_DATA_0: begin
                    rdata <= int_edge_list_ch_16[31:0];
                end
                ADDR_EDGE_LIST_CH_16_DATA_1: begin
                    rdata <= int_edge_list_ch_16[63:32];
                end
                ADDR_EDGE_LIST_CH_17_DATA_0: begin
                    rdata <= int_edge_list_ch_17[31:0];
                end
                ADDR_EDGE_LIST_CH_17_DATA_1: begin
                    rdata <= int_edge_list_ch_17[63:32];
                end
                ADDR_EDGE_LIST_CH_18_DATA_0: begin
                    rdata <= int_edge_list_ch_18[31:0];
                end
                ADDR_EDGE_LIST_CH_18_DATA_1: begin
                    rdata <= int_edge_list_ch_18[63:32];
                end
                ADDR_EDGE_LIST_CH_19_DATA_0: begin
                    rdata <= int_edge_list_ch_19[31:0];
                end
                ADDR_EDGE_LIST_CH_19_DATA_1: begin
                    rdata <= int_edge_list_ch_19[63:32];
                end
                ADDR_EDGE_LIST_CH_20_DATA_0: begin
                    rdata <= int_edge_list_ch_20[31:0];
                end
                ADDR_EDGE_LIST_CH_20_DATA_1: begin
                    rdata <= int_edge_list_ch_20[63:32];
                end
                ADDR_EDGE_LIST_CH_21_DATA_0: begin
                    rdata <= int_edge_list_ch_21[31:0];
                end
                ADDR_EDGE_LIST_CH_21_DATA_1: begin
                    rdata <= int_edge_list_ch_21[63:32];
                end
                ADDR_EDGE_LIST_CH_22_DATA_0: begin
                    rdata <= int_edge_list_ch_22[31:0];
                end
                ADDR_EDGE_LIST_CH_22_DATA_1: begin
                    rdata <= int_edge_list_ch_22[63:32];
                end
                ADDR_EDGE_LIST_CH_23_DATA_0: begin
                    rdata <= int_edge_list_ch_23[31:0];
                end
                ADDR_EDGE_LIST_CH_23_DATA_1: begin
                    rdata <= int_edge_list_ch_23[63:32];
                end
                ADDR_EDGE_LIST_CH_24_DATA_0: begin
                    rdata <= int_edge_list_ch_24[31:0];
                end
                ADDR_EDGE_LIST_CH_24_DATA_1: begin
                    rdata <= int_edge_list_ch_24[63:32];
                end
                ADDR_EDGE_LIST_CH_25_DATA_0: begin
                    rdata <= int_edge_list_ch_25[31:0];
                end
                ADDR_EDGE_LIST_CH_25_DATA_1: begin
                    rdata <= int_edge_list_ch_25[63:32];
                end
                ADDR_EDGE_LIST_CH_26_DATA_0: begin
                    rdata <= int_edge_list_ch_26[31:0];
                end
                ADDR_EDGE_LIST_CH_26_DATA_1: begin
                    rdata <= int_edge_list_ch_26[63:32];
                end
                ADDR_EDGE_LIST_CH_27_DATA_0: begin
                    rdata <= int_edge_list_ch_27[31:0];
                end
                ADDR_EDGE_LIST_CH_27_DATA_1: begin
                    rdata <= int_edge_list_ch_27[63:32];
                end
                ADDR_EDGE_LIST_CH_28_DATA_0: begin
                    rdata <= int_edge_list_ch_28[31:0];
                end
                ADDR_EDGE_LIST_CH_28_DATA_1: begin
                    rdata <= int_edge_list_ch_28[63:32];
                end
                ADDR_EDGE_LIST_CH_29_DATA_0: begin
                    rdata <= int_edge_list_ch_29[31:0];
                end
                ADDR_EDGE_LIST_CH_29_DATA_1: begin
                    rdata <= int_edge_list_ch_29[63:32];
                end
                ADDR_EDGE_LIST_CH_30_DATA_0: begin
                    rdata <= int_edge_list_ch_30[31:0];
                end
                ADDR_EDGE_LIST_CH_30_DATA_1: begin
                    rdata <= int_edge_list_ch_30[63:32];
                end
                ADDR_EDGE_LIST_CH_31_DATA_0: begin
                    rdata <= int_edge_list_ch_31[31:0];
                end
                ADDR_EDGE_LIST_CH_31_DATA_1: begin
                    rdata <= int_edge_list_ch_31[63:32];
                end
                ADDR_EDGE_LIST_CH_32_DATA_0: begin
                    rdata <= int_edge_list_ch_32[31:0];
                end
                ADDR_EDGE_LIST_CH_32_DATA_1: begin
                    rdata <= int_edge_list_ch_32[63:32];
                end
                ADDR_EDGE_LIST_CH_33_DATA_0: begin
                    rdata <= int_edge_list_ch_33[31:0];
                end
                ADDR_EDGE_LIST_CH_33_DATA_1: begin
                    rdata <= int_edge_list_ch_33[63:32];
                end
                ADDR_EDGE_LIST_CH_34_DATA_0: begin
                    rdata <= int_edge_list_ch_34[31:0];
                end
                ADDR_EDGE_LIST_CH_34_DATA_1: begin
                    rdata <= int_edge_list_ch_34[63:32];
                end
                ADDR_EDGE_LIST_CH_35_DATA_0: begin
                    rdata <= int_edge_list_ch_35[31:0];
                end
                ADDR_EDGE_LIST_CH_35_DATA_1: begin
                    rdata <= int_edge_list_ch_35[63:32];
                end
                ADDR_EDGE_LIST_CH_36_DATA_0: begin
                    rdata <= int_edge_list_ch_36[31:0];
                end
                ADDR_EDGE_LIST_CH_36_DATA_1: begin
                    rdata <= int_edge_list_ch_36[63:32];
                end
                ADDR_EDGE_LIST_CH_37_DATA_0: begin
                    rdata <= int_edge_list_ch_37[31:0];
                end
                ADDR_EDGE_LIST_CH_37_DATA_1: begin
                    rdata <= int_edge_list_ch_37[63:32];
                end
                ADDR_EDGE_LIST_CH_38_DATA_0: begin
                    rdata <= int_edge_list_ch_38[31:0];
                end
                ADDR_EDGE_LIST_CH_38_DATA_1: begin
                    rdata <= int_edge_list_ch_38[63:32];
                end
                ADDR_EDGE_LIST_CH_39_DATA_0: begin
                    rdata <= int_edge_list_ch_39[31:0];
                end
                ADDR_EDGE_LIST_CH_39_DATA_1: begin
                    rdata <= int_edge_list_ch_39[63:32];
                end
                ADDR_EDGE_LIST_CH_40_DATA_0: begin
                    rdata <= int_edge_list_ch_40[31:0];
                end
                ADDR_EDGE_LIST_CH_40_DATA_1: begin
                    rdata <= int_edge_list_ch_40[63:32];
                end
                ADDR_EDGE_LIST_CH_41_DATA_0: begin
                    rdata <= int_edge_list_ch_41[31:0];
                end
                ADDR_EDGE_LIST_CH_41_DATA_1: begin
                    rdata <= int_edge_list_ch_41[63:32];
                end
                ADDR_EDGE_LIST_CH_42_DATA_0: begin
                    rdata <= int_edge_list_ch_42[31:0];
                end
                ADDR_EDGE_LIST_CH_42_DATA_1: begin
                    rdata <= int_edge_list_ch_42[63:32];
                end
                ADDR_EDGE_LIST_CH_43_DATA_0: begin
                    rdata <= int_edge_list_ch_43[31:0];
                end
                ADDR_EDGE_LIST_CH_43_DATA_1: begin
                    rdata <= int_edge_list_ch_43[63:32];
                end
                ADDR_EDGE_LIST_CH_44_DATA_0: begin
                    rdata <= int_edge_list_ch_44[31:0];
                end
                ADDR_EDGE_LIST_CH_44_DATA_1: begin
                    rdata <= int_edge_list_ch_44[63:32];
                end
                ADDR_EDGE_LIST_CH_45_DATA_0: begin
                    rdata <= int_edge_list_ch_45[31:0];
                end
                ADDR_EDGE_LIST_CH_45_DATA_1: begin
                    rdata <= int_edge_list_ch_45[63:32];
                end
                ADDR_EDGE_LIST_CH_46_DATA_0: begin
                    rdata <= int_edge_list_ch_46[31:0];
                end
                ADDR_EDGE_LIST_CH_46_DATA_1: begin
                    rdata <= int_edge_list_ch_46[63:32];
                end
                ADDR_EDGE_LIST_CH_47_DATA_0: begin
                    rdata <= int_edge_list_ch_47[31:0];
                end
                ADDR_EDGE_LIST_CH_47_DATA_1: begin
                    rdata <= int_edge_list_ch_47[63:32];
                end
                ADDR_EDGE_LIST_CH_48_DATA_0: begin
                    rdata <= int_edge_list_ch_48[31:0];
                end
                ADDR_EDGE_LIST_CH_48_DATA_1: begin
                    rdata <= int_edge_list_ch_48[63:32];
                end
                ADDR_EDGE_LIST_CH_49_DATA_0: begin
                    rdata <= int_edge_list_ch_49[31:0];
                end
                ADDR_EDGE_LIST_CH_49_DATA_1: begin
                    rdata <= int_edge_list_ch_49[63:32];
                end
                ADDR_EDGE_LIST_CH_50_DATA_0: begin
                    rdata <= int_edge_list_ch_50[31:0];
                end
                ADDR_EDGE_LIST_CH_50_DATA_1: begin
                    rdata <= int_edge_list_ch_50[63:32];
                end
                ADDR_EDGE_LIST_CH_51_DATA_0: begin
                    rdata <= int_edge_list_ch_51[31:0];
                end
                ADDR_EDGE_LIST_CH_51_DATA_1: begin
                    rdata <= int_edge_list_ch_51[63:32];
                end
                ADDR_EDGE_LIST_CH_52_DATA_0: begin
                    rdata <= int_edge_list_ch_52[31:0];
                end
                ADDR_EDGE_LIST_CH_52_DATA_1: begin
                    rdata <= int_edge_list_ch_52[63:32];
                end
                ADDR_EDGE_LIST_CH_53_DATA_0: begin
                    rdata <= int_edge_list_ch_53[31:0];
                end
                ADDR_EDGE_LIST_CH_53_DATA_1: begin
                    rdata <= int_edge_list_ch_53[63:32];
                end
                ADDR_EDGE_LIST_CH_54_DATA_0: begin
                    rdata <= int_edge_list_ch_54[31:0];
                end
                ADDR_EDGE_LIST_CH_54_DATA_1: begin
                    rdata <= int_edge_list_ch_54[63:32];
                end
                ADDR_EDGE_LIST_CH_55_DATA_0: begin
                    rdata <= int_edge_list_ch_55[31:0];
                end
                ADDR_EDGE_LIST_CH_55_DATA_1: begin
                    rdata <= int_edge_list_ch_55[63:32];
                end
                ADDR_VEC_X_DATA_0: begin
                    rdata <= int_vec_X[31:0];
                end
                ADDR_VEC_X_DATA_1: begin
                    rdata <= int_vec_X[63:32];
                end
                ADDR_VEC_Y_DATA_0: begin
                    rdata <= int_vec_Y[31:0];
                end
                ADDR_VEC_Y_DATA_1: begin
                    rdata <= int_vec_Y[63:32];
                end
                ADDR_VEC_Y_OUT_DATA_0: begin
                    rdata <= int_vec_Y_out[31:0];
                end
                ADDR_VEC_Y_OUT_DATA_1: begin
                    rdata <= int_vec_Y_out[63:32];
                end
                ADDR_NUM_ITE_DATA_0: begin
                    rdata <= int_NUM_ITE[31:0];
                end
                ADDR_NUM_A_LEN_DATA_0: begin
                    rdata <= int_NUM_A_LEN[31:0];
                end
                ADDR_M_DATA_0: begin
                    rdata <= int_M[31:0];
                end
                ADDR_K_DATA_0: begin
                    rdata <= int_K[31:0];
                end
                ADDR_P_N_DATA_0: begin
                    rdata <= int_P_N[31:0];
                end
                ADDR_ALPHA_U_DATA_0: begin
                    rdata <= int_alpha_u[31:0];
                end
                ADDR_BETA_U_DATA_0: begin
                    rdata <= int_beta_u[31:0];
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
assign edge_list_ptr     = int_edge_list_ptr;
assign edge_list_ch_0    = int_edge_list_ch_0;
assign edge_list_ch_1    = int_edge_list_ch_1;
assign edge_list_ch_2    = int_edge_list_ch_2;
assign edge_list_ch_3    = int_edge_list_ch_3;
assign edge_list_ch_4    = int_edge_list_ch_4;
assign edge_list_ch_5    = int_edge_list_ch_5;
assign edge_list_ch_6    = int_edge_list_ch_6;
assign edge_list_ch_7    = int_edge_list_ch_7;
assign edge_list_ch_8    = int_edge_list_ch_8;
assign edge_list_ch_9    = int_edge_list_ch_9;
assign edge_list_ch_10   = int_edge_list_ch_10;
assign edge_list_ch_11   = int_edge_list_ch_11;
assign edge_list_ch_12   = int_edge_list_ch_12;
assign edge_list_ch_13   = int_edge_list_ch_13;
assign edge_list_ch_14   = int_edge_list_ch_14;
assign edge_list_ch_15   = int_edge_list_ch_15;
assign edge_list_ch_16   = int_edge_list_ch_16;
assign edge_list_ch_17   = int_edge_list_ch_17;
assign edge_list_ch_18   = int_edge_list_ch_18;
assign edge_list_ch_19   = int_edge_list_ch_19;
assign edge_list_ch_20   = int_edge_list_ch_20;
assign edge_list_ch_21   = int_edge_list_ch_21;
assign edge_list_ch_22   = int_edge_list_ch_22;
assign edge_list_ch_23   = int_edge_list_ch_23;
assign edge_list_ch_24   = int_edge_list_ch_24;
assign edge_list_ch_25   = int_edge_list_ch_25;
assign edge_list_ch_26   = int_edge_list_ch_26;
assign edge_list_ch_27   = int_edge_list_ch_27;
assign edge_list_ch_28   = int_edge_list_ch_28;
assign edge_list_ch_29   = int_edge_list_ch_29;
assign edge_list_ch_30   = int_edge_list_ch_30;
assign edge_list_ch_31   = int_edge_list_ch_31;
assign edge_list_ch_32   = int_edge_list_ch_32;
assign edge_list_ch_33   = int_edge_list_ch_33;
assign edge_list_ch_34   = int_edge_list_ch_34;
assign edge_list_ch_35   = int_edge_list_ch_35;
assign edge_list_ch_36   = int_edge_list_ch_36;
assign edge_list_ch_37   = int_edge_list_ch_37;
assign edge_list_ch_38   = int_edge_list_ch_38;
assign edge_list_ch_39   = int_edge_list_ch_39;
assign edge_list_ch_40   = int_edge_list_ch_40;
assign edge_list_ch_41   = int_edge_list_ch_41;
assign edge_list_ch_42   = int_edge_list_ch_42;
assign edge_list_ch_43   = int_edge_list_ch_43;
assign edge_list_ch_44   = int_edge_list_ch_44;
assign edge_list_ch_45   = int_edge_list_ch_45;
assign edge_list_ch_46   = int_edge_list_ch_46;
assign edge_list_ch_47   = int_edge_list_ch_47;
assign edge_list_ch_48   = int_edge_list_ch_48;
assign edge_list_ch_49   = int_edge_list_ch_49;
assign edge_list_ch_50   = int_edge_list_ch_50;
assign edge_list_ch_51   = int_edge_list_ch_51;
assign edge_list_ch_52   = int_edge_list_ch_52;
assign edge_list_ch_53   = int_edge_list_ch_53;
assign edge_list_ch_54   = int_edge_list_ch_54;
assign edge_list_ch_55   = int_edge_list_ch_55;
assign vec_X             = int_vec_X;
assign vec_Y             = int_vec_Y;
assign vec_Y_out         = int_vec_Y_out;
assign NUM_ITE           = int_NUM_ITE;
assign NUM_A_LEN         = int_NUM_A_LEN;
assign M                 = int_M;
assign K                 = int_K;
assign P_N               = int_P_N;
assign alpha_u           = int_alpha_u;
assign beta_u            = int_beta_u;
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

// int_edge_list_ptr[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ptr[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_PTR_DATA_0)
            int_edge_list_ptr[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ptr[31:0] & ~wmask);
    end
end

// int_edge_list_ptr[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ptr[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_PTR_DATA_1)
            int_edge_list_ptr[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ptr[63:32] & ~wmask);
    end
end

// int_edge_list_ch_0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_0_DATA_0)
            int_edge_list_ch_0[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_0[31:0] & ~wmask);
    end
end

// int_edge_list_ch_0[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_0[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_0_DATA_1)
            int_edge_list_ch_0[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_0[63:32] & ~wmask);
    end
end

// int_edge_list_ch_1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_1_DATA_0)
            int_edge_list_ch_1[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_1[31:0] & ~wmask);
    end
end

// int_edge_list_ch_1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_1_DATA_1)
            int_edge_list_ch_1[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_1[63:32] & ~wmask);
    end
end

// int_edge_list_ch_2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_2_DATA_0)
            int_edge_list_ch_2[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_2[31:0] & ~wmask);
    end
end

// int_edge_list_ch_2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_2_DATA_1)
            int_edge_list_ch_2[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_2[63:32] & ~wmask);
    end
end

// int_edge_list_ch_3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_3_DATA_0)
            int_edge_list_ch_3[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_3[31:0] & ~wmask);
    end
end

// int_edge_list_ch_3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_3_DATA_1)
            int_edge_list_ch_3[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_3[63:32] & ~wmask);
    end
end

// int_edge_list_ch_4[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_4[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_4_DATA_0)
            int_edge_list_ch_4[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_4[31:0] & ~wmask);
    end
end

// int_edge_list_ch_4[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_4[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_4_DATA_1)
            int_edge_list_ch_4[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_4[63:32] & ~wmask);
    end
end

// int_edge_list_ch_5[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_5[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_5_DATA_0)
            int_edge_list_ch_5[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_5[31:0] & ~wmask);
    end
end

// int_edge_list_ch_5[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_5[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_5_DATA_1)
            int_edge_list_ch_5[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_5[63:32] & ~wmask);
    end
end

// int_edge_list_ch_6[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_6[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_6_DATA_0)
            int_edge_list_ch_6[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_6[31:0] & ~wmask);
    end
end

// int_edge_list_ch_6[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_6[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_6_DATA_1)
            int_edge_list_ch_6[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_6[63:32] & ~wmask);
    end
end

// int_edge_list_ch_7[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_7[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_7_DATA_0)
            int_edge_list_ch_7[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_7[31:0] & ~wmask);
    end
end

// int_edge_list_ch_7[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_7[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_7_DATA_1)
            int_edge_list_ch_7[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_7[63:32] & ~wmask);
    end
end

// int_edge_list_ch_8[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_8[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_8_DATA_0)
            int_edge_list_ch_8[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_8[31:0] & ~wmask);
    end
end

// int_edge_list_ch_8[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_8[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_8_DATA_1)
            int_edge_list_ch_8[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_8[63:32] & ~wmask);
    end
end

// int_edge_list_ch_9[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_9[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_9_DATA_0)
            int_edge_list_ch_9[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_9[31:0] & ~wmask);
    end
end

// int_edge_list_ch_9[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_9[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_9_DATA_1)
            int_edge_list_ch_9[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_9[63:32] & ~wmask);
    end
end

// int_edge_list_ch_10[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_10[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_10_DATA_0)
            int_edge_list_ch_10[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_10[31:0] & ~wmask);
    end
end

// int_edge_list_ch_10[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_10[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_10_DATA_1)
            int_edge_list_ch_10[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_10[63:32] & ~wmask);
    end
end

// int_edge_list_ch_11[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_11[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_11_DATA_0)
            int_edge_list_ch_11[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_11[31:0] & ~wmask);
    end
end

// int_edge_list_ch_11[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_11[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_11_DATA_1)
            int_edge_list_ch_11[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_11[63:32] & ~wmask);
    end
end

// int_edge_list_ch_12[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_12[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_12_DATA_0)
            int_edge_list_ch_12[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_12[31:0] & ~wmask);
    end
end

// int_edge_list_ch_12[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_12[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_12_DATA_1)
            int_edge_list_ch_12[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_12[63:32] & ~wmask);
    end
end

// int_edge_list_ch_13[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_13[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_13_DATA_0)
            int_edge_list_ch_13[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_13[31:0] & ~wmask);
    end
end

// int_edge_list_ch_13[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_13[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_13_DATA_1)
            int_edge_list_ch_13[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_13[63:32] & ~wmask);
    end
end

// int_edge_list_ch_14[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_14[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_14_DATA_0)
            int_edge_list_ch_14[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_14[31:0] & ~wmask);
    end
end

// int_edge_list_ch_14[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_14[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_14_DATA_1)
            int_edge_list_ch_14[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_14[63:32] & ~wmask);
    end
end

// int_edge_list_ch_15[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_15[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_15_DATA_0)
            int_edge_list_ch_15[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_15[31:0] & ~wmask);
    end
end

// int_edge_list_ch_15[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_15[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_15_DATA_1)
            int_edge_list_ch_15[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_15[63:32] & ~wmask);
    end
end

// int_edge_list_ch_16[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_16[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_16_DATA_0)
            int_edge_list_ch_16[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_16[31:0] & ~wmask);
    end
end

// int_edge_list_ch_16[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_16[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_16_DATA_1)
            int_edge_list_ch_16[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_16[63:32] & ~wmask);
    end
end

// int_edge_list_ch_17[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_17[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_17_DATA_0)
            int_edge_list_ch_17[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_17[31:0] & ~wmask);
    end
end

// int_edge_list_ch_17[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_17[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_17_DATA_1)
            int_edge_list_ch_17[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_17[63:32] & ~wmask);
    end
end

// int_edge_list_ch_18[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_18[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_18_DATA_0)
            int_edge_list_ch_18[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_18[31:0] & ~wmask);
    end
end

// int_edge_list_ch_18[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_18[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_18_DATA_1)
            int_edge_list_ch_18[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_18[63:32] & ~wmask);
    end
end

// int_edge_list_ch_19[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_19[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_19_DATA_0)
            int_edge_list_ch_19[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_19[31:0] & ~wmask);
    end
end

// int_edge_list_ch_19[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_19[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_19_DATA_1)
            int_edge_list_ch_19[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_19[63:32] & ~wmask);
    end
end

// int_edge_list_ch_20[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_20[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_20_DATA_0)
            int_edge_list_ch_20[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_20[31:0] & ~wmask);
    end
end

// int_edge_list_ch_20[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_20[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_20_DATA_1)
            int_edge_list_ch_20[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_20[63:32] & ~wmask);
    end
end

// int_edge_list_ch_21[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_21[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_21_DATA_0)
            int_edge_list_ch_21[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_21[31:0] & ~wmask);
    end
end

// int_edge_list_ch_21[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_21[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_21_DATA_1)
            int_edge_list_ch_21[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_21[63:32] & ~wmask);
    end
end

// int_edge_list_ch_22[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_22[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_22_DATA_0)
            int_edge_list_ch_22[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_22[31:0] & ~wmask);
    end
end

// int_edge_list_ch_22[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_22[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_22_DATA_1)
            int_edge_list_ch_22[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_22[63:32] & ~wmask);
    end
end

// int_edge_list_ch_23[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_23[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_23_DATA_0)
            int_edge_list_ch_23[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_23[31:0] & ~wmask);
    end
end

// int_edge_list_ch_23[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_23[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_23_DATA_1)
            int_edge_list_ch_23[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_23[63:32] & ~wmask);
    end
end

// int_edge_list_ch_24[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_24[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_24_DATA_0)
            int_edge_list_ch_24[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_24[31:0] & ~wmask);
    end
end

// int_edge_list_ch_24[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_24[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_24_DATA_1)
            int_edge_list_ch_24[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_24[63:32] & ~wmask);
    end
end

// int_edge_list_ch_25[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_25[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_25_DATA_0)
            int_edge_list_ch_25[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_25[31:0] & ~wmask);
    end
end

// int_edge_list_ch_25[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_25[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_25_DATA_1)
            int_edge_list_ch_25[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_25[63:32] & ~wmask);
    end
end

// int_edge_list_ch_26[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_26[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_26_DATA_0)
            int_edge_list_ch_26[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_26[31:0] & ~wmask);
    end
end

// int_edge_list_ch_26[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_26[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_26_DATA_1)
            int_edge_list_ch_26[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_26[63:32] & ~wmask);
    end
end

// int_edge_list_ch_27[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_27[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_27_DATA_0)
            int_edge_list_ch_27[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_27[31:0] & ~wmask);
    end
end

// int_edge_list_ch_27[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_27[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_27_DATA_1)
            int_edge_list_ch_27[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_27[63:32] & ~wmask);
    end
end

// int_edge_list_ch_28[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_28[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_28_DATA_0)
            int_edge_list_ch_28[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_28[31:0] & ~wmask);
    end
end

// int_edge_list_ch_28[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_28[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_28_DATA_1)
            int_edge_list_ch_28[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_28[63:32] & ~wmask);
    end
end

// int_edge_list_ch_29[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_29[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_29_DATA_0)
            int_edge_list_ch_29[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_29[31:0] & ~wmask);
    end
end

// int_edge_list_ch_29[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_29[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_29_DATA_1)
            int_edge_list_ch_29[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_29[63:32] & ~wmask);
    end
end

// int_edge_list_ch_30[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_30[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_30_DATA_0)
            int_edge_list_ch_30[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_30[31:0] & ~wmask);
    end
end

// int_edge_list_ch_30[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_30[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_30_DATA_1)
            int_edge_list_ch_30[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_30[63:32] & ~wmask);
    end
end

// int_edge_list_ch_31[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_31[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_31_DATA_0)
            int_edge_list_ch_31[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_31[31:0] & ~wmask);
    end
end

// int_edge_list_ch_31[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_31[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_31_DATA_1)
            int_edge_list_ch_31[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_31[63:32] & ~wmask);
    end
end

// int_edge_list_ch_32[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_32[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_32_DATA_0)
            int_edge_list_ch_32[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_32[31:0] & ~wmask);
    end
end

// int_edge_list_ch_32[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_32[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_32_DATA_1)
            int_edge_list_ch_32[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_32[63:32] & ~wmask);
    end
end

// int_edge_list_ch_33[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_33[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_33_DATA_0)
            int_edge_list_ch_33[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_33[31:0] & ~wmask);
    end
end

// int_edge_list_ch_33[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_33[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_33_DATA_1)
            int_edge_list_ch_33[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_33[63:32] & ~wmask);
    end
end

// int_edge_list_ch_34[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_34[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_34_DATA_0)
            int_edge_list_ch_34[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_34[31:0] & ~wmask);
    end
end

// int_edge_list_ch_34[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_34[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_34_DATA_1)
            int_edge_list_ch_34[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_34[63:32] & ~wmask);
    end
end

// int_edge_list_ch_35[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_35[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_35_DATA_0)
            int_edge_list_ch_35[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_35[31:0] & ~wmask);
    end
end

// int_edge_list_ch_35[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_35[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_35_DATA_1)
            int_edge_list_ch_35[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_35[63:32] & ~wmask);
    end
end

// int_edge_list_ch_36[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_36[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_36_DATA_0)
            int_edge_list_ch_36[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_36[31:0] & ~wmask);
    end
end

// int_edge_list_ch_36[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_36[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_36_DATA_1)
            int_edge_list_ch_36[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_36[63:32] & ~wmask);
    end
end

// int_edge_list_ch_37[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_37[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_37_DATA_0)
            int_edge_list_ch_37[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_37[31:0] & ~wmask);
    end
end

// int_edge_list_ch_37[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_37[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_37_DATA_1)
            int_edge_list_ch_37[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_37[63:32] & ~wmask);
    end
end

// int_edge_list_ch_38[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_38[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_38_DATA_0)
            int_edge_list_ch_38[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_38[31:0] & ~wmask);
    end
end

// int_edge_list_ch_38[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_38[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_38_DATA_1)
            int_edge_list_ch_38[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_38[63:32] & ~wmask);
    end
end

// int_edge_list_ch_39[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_39[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_39_DATA_0)
            int_edge_list_ch_39[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_39[31:0] & ~wmask);
    end
end

// int_edge_list_ch_39[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_39[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_39_DATA_1)
            int_edge_list_ch_39[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_39[63:32] & ~wmask);
    end
end

// int_edge_list_ch_40[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_40[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_40_DATA_0)
            int_edge_list_ch_40[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_40[31:0] & ~wmask);
    end
end

// int_edge_list_ch_40[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_40[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_40_DATA_1)
            int_edge_list_ch_40[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_40[63:32] & ~wmask);
    end
end

// int_edge_list_ch_41[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_41[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_41_DATA_0)
            int_edge_list_ch_41[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_41[31:0] & ~wmask);
    end
end

// int_edge_list_ch_41[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_41[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_41_DATA_1)
            int_edge_list_ch_41[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_41[63:32] & ~wmask);
    end
end

// int_edge_list_ch_42[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_42[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_42_DATA_0)
            int_edge_list_ch_42[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_42[31:0] & ~wmask);
    end
end

// int_edge_list_ch_42[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_42[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_42_DATA_1)
            int_edge_list_ch_42[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_42[63:32] & ~wmask);
    end
end

// int_edge_list_ch_43[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_43[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_43_DATA_0)
            int_edge_list_ch_43[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_43[31:0] & ~wmask);
    end
end

// int_edge_list_ch_43[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_43[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_43_DATA_1)
            int_edge_list_ch_43[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_43[63:32] & ~wmask);
    end
end

// int_edge_list_ch_44[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_44[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_44_DATA_0)
            int_edge_list_ch_44[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_44[31:0] & ~wmask);
    end
end

// int_edge_list_ch_44[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_44[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_44_DATA_1)
            int_edge_list_ch_44[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_44[63:32] & ~wmask);
    end
end

// int_edge_list_ch_45[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_45[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_45_DATA_0)
            int_edge_list_ch_45[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_45[31:0] & ~wmask);
    end
end

// int_edge_list_ch_45[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_45[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_45_DATA_1)
            int_edge_list_ch_45[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_45[63:32] & ~wmask);
    end
end

// int_edge_list_ch_46[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_46[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_46_DATA_0)
            int_edge_list_ch_46[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_46[31:0] & ~wmask);
    end
end

// int_edge_list_ch_46[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_46[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_46_DATA_1)
            int_edge_list_ch_46[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_46[63:32] & ~wmask);
    end
end

// int_edge_list_ch_47[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_47[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_47_DATA_0)
            int_edge_list_ch_47[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_47[31:0] & ~wmask);
    end
end

// int_edge_list_ch_47[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_47[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_47_DATA_1)
            int_edge_list_ch_47[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_47[63:32] & ~wmask);
    end
end

// int_edge_list_ch_48[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_48[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_48_DATA_0)
            int_edge_list_ch_48[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_48[31:0] & ~wmask);
    end
end

// int_edge_list_ch_48[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_48[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_48_DATA_1)
            int_edge_list_ch_48[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_48[63:32] & ~wmask);
    end
end

// int_edge_list_ch_49[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_49[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_49_DATA_0)
            int_edge_list_ch_49[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_49[31:0] & ~wmask);
    end
end

// int_edge_list_ch_49[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_49[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_49_DATA_1)
            int_edge_list_ch_49[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_49[63:32] & ~wmask);
    end
end

// int_edge_list_ch_50[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_50[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_50_DATA_0)
            int_edge_list_ch_50[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_50[31:0] & ~wmask);
    end
end

// int_edge_list_ch_50[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_50[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_50_DATA_1)
            int_edge_list_ch_50[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_50[63:32] & ~wmask);
    end
end

// int_edge_list_ch_51[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_51[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_51_DATA_0)
            int_edge_list_ch_51[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_51[31:0] & ~wmask);
    end
end

// int_edge_list_ch_51[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_51[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_51_DATA_1)
            int_edge_list_ch_51[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_51[63:32] & ~wmask);
    end
end

// int_edge_list_ch_52[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_52[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_52_DATA_0)
            int_edge_list_ch_52[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_52[31:0] & ~wmask);
    end
end

// int_edge_list_ch_52[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_52[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_52_DATA_1)
            int_edge_list_ch_52[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_52[63:32] & ~wmask);
    end
end

// int_edge_list_ch_53[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_53[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_53_DATA_0)
            int_edge_list_ch_53[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_53[31:0] & ~wmask);
    end
end

// int_edge_list_ch_53[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_53[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_53_DATA_1)
            int_edge_list_ch_53[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_53[63:32] & ~wmask);
    end
end

// int_edge_list_ch_54[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_54[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_54_DATA_0)
            int_edge_list_ch_54[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_54[31:0] & ~wmask);
    end
end

// int_edge_list_ch_54[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_54[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_54_DATA_1)
            int_edge_list_ch_54[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_54[63:32] & ~wmask);
    end
end

// int_edge_list_ch_55[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_55[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_55_DATA_0)
            int_edge_list_ch_55[31:0] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_55[31:0] & ~wmask);
    end
end

// int_edge_list_ch_55[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_edge_list_ch_55[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EDGE_LIST_CH_55_DATA_1)
            int_edge_list_ch_55[63:32] <= (WDATA[31:0] & wmask) | (int_edge_list_ch_55[63:32] & ~wmask);
    end
end

// int_vec_X[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_vec_X[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VEC_X_DATA_0)
            int_vec_X[31:0] <= (WDATA[31:0] & wmask) | (int_vec_X[31:0] & ~wmask);
    end
end

// int_vec_X[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_vec_X[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VEC_X_DATA_1)
            int_vec_X[63:32] <= (WDATA[31:0] & wmask) | (int_vec_X[63:32] & ~wmask);
    end
end

// int_vec_Y[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_vec_Y[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VEC_Y_DATA_0)
            int_vec_Y[31:0] <= (WDATA[31:0] & wmask) | (int_vec_Y[31:0] & ~wmask);
    end
end

// int_vec_Y[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_vec_Y[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VEC_Y_DATA_1)
            int_vec_Y[63:32] <= (WDATA[31:0] & wmask) | (int_vec_Y[63:32] & ~wmask);
    end
end

// int_vec_Y_out[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_vec_Y_out[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VEC_Y_OUT_DATA_0)
            int_vec_Y_out[31:0] <= (WDATA[31:0] & wmask) | (int_vec_Y_out[31:0] & ~wmask);
    end
end

// int_vec_Y_out[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_vec_Y_out[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VEC_Y_OUT_DATA_1)
            int_vec_Y_out[63:32] <= (WDATA[31:0] & wmask) | (int_vec_Y_out[63:32] & ~wmask);
    end
end

// int_NUM_ITE[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_NUM_ITE[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NUM_ITE_DATA_0)
            int_NUM_ITE[31:0] <= (WDATA[31:0] & wmask) | (int_NUM_ITE[31:0] & ~wmask);
    end
end

// int_NUM_A_LEN[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_NUM_A_LEN[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NUM_A_LEN_DATA_0)
            int_NUM_A_LEN[31:0] <= (WDATA[31:0] & wmask) | (int_NUM_A_LEN[31:0] & ~wmask);
    end
end

// int_M[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_M[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_M_DATA_0)
            int_M[31:0] <= (WDATA[31:0] & wmask) | (int_M[31:0] & ~wmask);
    end
end

// int_K[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K_DATA_0)
            int_K[31:0] <= (WDATA[31:0] & wmask) | (int_K[31:0] & ~wmask);
    end
end

// int_P_N[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_P_N[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_P_N_DATA_0)
            int_P_N[31:0] <= (WDATA[31:0] & wmask) | (int_P_N[31:0] & ~wmask);
    end
end

// int_alpha_u[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_alpha_u[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ALPHA_U_DATA_0)
            int_alpha_u[31:0] <= (WDATA[31:0] & wmask) | (int_alpha_u[31:0] & ~wmask);
    end
end

// int_beta_u[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_beta_u[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BETA_U_DATA_0)
            int_beta_u[31:0] <= (WDATA[31:0] & wmask) | (int_beta_u[31:0] & ~wmask);
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
