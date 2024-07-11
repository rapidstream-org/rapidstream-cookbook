`timescale 1 ns / 1 ps
// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
module kernel3_gmem_B_m_axi
#(parameter
    CONSERVATIVE            = 0,
    NUM_READ_OUTSTANDING    = 2,
    NUM_WRITE_OUTSTANDING   = 2,
    MAX_READ_BURST_LENGTH   = 16,
    MAX_WRITE_BURST_LENGTH  = 16,
    C_M_AXI_ID_WIDTH        = 1,
    C_M_AXI_ADDR_WIDTH      = 32,
    C_M_AXI_DATA_WIDTH      = 32, // power of 2 & range: 2 to 1024
    C_M_AXI_AWUSER_WIDTH    = 1,
    C_M_AXI_ARUSER_WIDTH    = 1,
    C_M_AXI_WUSER_WIDTH     = 1,
    C_M_AXI_RUSER_WIDTH     = 1,
    C_M_AXI_BUSER_WIDTH     = 1,
    C_TARGET_ADDR           = 32'h00000000,
    C_USER_VALUE            = 1'b0,
    C_PROT_VALUE            = 3'b000,
    C_CACHE_VALUE           = 4'b0011,
    USER_DW                 = 32, // multiple of 8
    USER_AW                 = 32,
    USER_MAXREQS            = 16,
    USER_RFIFONUM_WIDTH     = 6,
    MAXI_BUFFER_IMPL        = "block"
)(

    // system signal
    input  wire                               ACLK,
    input  wire                               ARESET,
    input  wire                               ACLK_EN,
    // write address channel
    output wire [C_M_AXI_ID_WIDTH-1:0]        AWID,
    output wire [C_M_AXI_ADDR_WIDTH-1:0]      AWADDR,
    output wire [7:0]                         AWLEN,
    output wire [2:0]                         AWSIZE,
    output wire [1:0]                         AWBURST,
    output wire [1:0]                         AWLOCK,
    output wire [3:0]                         AWCACHE,
    output wire [2:0]                         AWPROT,
    output wire [3:0]                         AWQOS,
    output wire [3:0]                         AWREGION,
    output wire [C_M_AXI_AWUSER_WIDTH-1:0]    AWUSER,
    output wire                               AWVALID,
    input  wire                               AWREADY,
    // write data channel
    output wire [C_M_AXI_ID_WIDTH-1:0]        WID,
    output wire [C_M_AXI_DATA_WIDTH-1:0]      WDATA,
    output wire [C_M_AXI_DATA_WIDTH/8-1:0]    WSTRB,
    output wire                               WLAST,
    output wire [C_M_AXI_WUSER_WIDTH-1:0]     WUSER,
    output wire                               WVALID,
    input  wire                               WREADY,
    // write response channel
    input  wire [C_M_AXI_ID_WIDTH-1:0]        BID,
    input  wire [1:0]                         BRESP,
    input  wire [C_M_AXI_BUSER_WIDTH-1:0]     BUSER,
    input  wire                               BVALID,
    output wire                               BREADY,
    // read address channel
    output wire [C_M_AXI_ID_WIDTH-1:0]        ARID,
    output wire [C_M_AXI_ADDR_WIDTH-1:0]      ARADDR,
    output wire [7:0]                         ARLEN,
    output wire [2:0]                         ARSIZE,
    output wire [1:0]                         ARBURST,
    output wire [1:0]                         ARLOCK,
    output wire [3:0]                         ARCACHE,
    output wire [2:0]                         ARPROT,
    output wire [3:0]                         ARQOS,
    output wire [3:0]                         ARREGION,
    output wire [C_M_AXI_ARUSER_WIDTH-1:0]    ARUSER,
    output wire                               ARVALID,
    input  wire                               ARREADY,
    // read data channel
    input  wire [C_M_AXI_ID_WIDTH-1:0]        RID,
    input  wire [C_M_AXI_DATA_WIDTH-1:0]      RDATA,
    input  wire [1:0]                         RRESP,
    input  wire                               RLAST,
    input  wire [C_M_AXI_RUSER_WIDTH-1:0]     RUSER,
    input  wire                               RVALID,
    output wire                               RREADY,
    // internal bus ports
    // write address
    input  wire [USER_AW-1:0]                 I_AWADDR,
    input  wire [31:0]                        I_AWLEN,
    input  wire                               I_AWVALID,
    output wire                               I_AWREADY,
    // write data
    input  wire [USER_DW-1:0]                 I_WDATA,
    input  wire [USER_DW/8-1:0]               I_WSTRB,
    input  wire                               I_WVALID,
    output wire                               I_WREADY,
    // write response
    output wire                               I_BVALID,
    input  wire                               I_BREADY,
    // read address
    input  wire [USER_AW-1:0]                 I_ARADDR,
    input  wire [31:0]                        I_ARLEN,
    input  wire                               I_ARVALID,
    output wire                               I_ARREADY,
    // read data
    output wire [USER_DW-1:0]                 I_RDATA,
    output wire                               I_RVALID,
    input  wire                               I_RREADY,
    output wire [USER_RFIFONUM_WIDTH-1:0]     I_RFIFONUM);
//------------------------Local signal-------------------
    wire [C_M_AXI_ADDR_WIDTH-1:0]   AWADDR_Dummy;
    wire [31:0]                     AWLEN_Dummy;
    wire                            AWVALID_Dummy;
    wire                            AWREADY_Dummy;
    wire [C_M_AXI_DATA_WIDTH-1:0]   WDATA_Dummy;
    wire [C_M_AXI_DATA_WIDTH/8-1:0] WSTRB_Dummy;
    wire                            WVALID_Dummy;
    wire                            WREADY_Dummy;
    wire                            BVALID_Dummy;
    wire                            BREADY_Dummy;
    wire [C_M_AXI_ADDR_WIDTH-1:0]   ARADDR_Dummy;
    wire [31:0]                     ARLEN_Dummy;
    wire                            ARVALID_Dummy;
    wire                            ARREADY_Dummy;
    wire [C_M_AXI_DATA_WIDTH-1:0]   RDATA_Dummy;
    wire [1:0]                      RLAST_Dummy;
    wire                            RVALID_Dummy;
    wire                            RREADY_Dummy;
    wire                            RBURST_READY_Dummy;

//------------------------Instantiation------------------
    // kernel3_gmem_B_m_axi_store
    kernel3_gmem_B_m_axi_store #(
        .C_TARGET_ADDR           ( C_TARGET_ADDR ),
        .NUM_WRITE_OUTSTANDING   ( NUM_WRITE_OUTSTANDING ),
        .MAX_WRITE_BURST_LENGTH  ( MAX_WRITE_BURST_LENGTH ),
        .BUS_ADDR_WIDTH          ( C_M_AXI_ADDR_WIDTH ),
        .BUS_DATA_WIDTH          ( C_M_AXI_DATA_WIDTH ),
        .USER_DW                 ( USER_DW ),
        .USER_AW                 ( USER_AW ),
        .USER_MAXREQS            ( USER_MAXREQS ),
        .BUFFER_IMPL             ( MAXI_BUFFER_IMPL )
    ) store_unit (
        .ACLK                    ( ACLK ),
        .ARESET                  ( ARESET ),
        .ACLK_EN                 ( ACLK_EN ),
        .out_AXI_AWADDR          ( AWADDR_Dummy ),
        .out_AXI_AWLEN           ( AWLEN_Dummy ),
        .out_AXI_AWVALID         ( AWVALID_Dummy ),
        .in_AXI_AWREADY          ( AWREADY_Dummy ),
        .out_AXI_WDATA           ( WDATA_Dummy ),
        .out_AXI_WSTRB           ( WSTRB_Dummy ),
        .out_AXI_WVALID          ( WVALID_Dummy ),
        .in_AXI_WREADY           ( WREADY_Dummy ),
        .in_AXI_BVALID           ( BVALID_Dummy ),
        .out_AXI_BREADY          ( BREADY_Dummy ),
        .in_HLS_AWADDR           ( I_AWADDR ),
        .in_HLS_AWLEN            ( I_AWLEN ),
        .in_HLS_AWVALID          ( I_AWVALID ),
        .out_HLS_AWREADY         ( I_AWREADY ),
        .in_HLS_WDATA            ( I_WDATA ),
        .in_HLS_WSTRB            ( I_WSTRB ),
        .in_HLS_WVALID           ( I_WVALID ),
        .out_HLS_WREADY          ( I_WREADY ),
        .out_HLS_BVALID          ( I_BVALID ),
        .in_HLS_BREADY           ( I_BREADY ));
    // kernel3_gmem_B_m_axi_load
    kernel3_gmem_B_m_axi_load #(
        .C_TARGET_ADDR           ( C_TARGET_ADDR ),
        .NUM_READ_OUTSTANDING    ( NUM_READ_OUTSTANDING ),
        .MAX_READ_BURST_LENGTH   ( MAX_READ_BURST_LENGTH ),
        .BUS_ADDR_WIDTH          ( C_M_AXI_ADDR_WIDTH ),
        .BUS_DATA_WIDTH          ( C_M_AXI_DATA_WIDTH ),
        .USER_DW                 ( USER_DW ),
        .USER_AW                 ( USER_AW ),
        .USER_MAXREQS            ( USER_MAXREQS ),
        .USER_RFIFONUM_WIDTH     ( USER_RFIFONUM_WIDTH ),
        .BUFFER_IMPL             ( MAXI_BUFFER_IMPL )
    ) load_unit (
        .ACLK                    ( ACLK ),
        .ARESET                  ( ARESET ),
        .ACLK_EN                 ( ACLK_EN ),
        .out_AXI_ARADDR          ( ARADDR_Dummy ),
        .out_AXI_ARLEN           ( ARLEN_Dummy ),
        .out_AXI_ARVALID         ( ARVALID_Dummy ),
        .in_AXI_ARREADY          ( ARREADY_Dummy ),
        .in_AXI_RDATA            ( RDATA_Dummy ),
        .in_AXI_RLAST            ( RLAST_Dummy ),
        .in_AXI_RVALID           ( RVALID_Dummy ),
        .out_AXI_RREADY          ( RREADY_Dummy ),
        .out_AXI_RBURST_READY    ( RBURST_READY_Dummy),
        .in_HLS_ARADDR           ( I_ARADDR ),
        .in_HLS_ARLEN            ( I_ARLEN ),
        .in_HLS_ARVALID          ( I_ARVALID ),
        .out_HLS_ARREADY         ( I_ARREADY ),
        .out_HLS_RDATA           ( I_RDATA ),
        .out_HLS_RVALID          ( I_RVALID ),
        .in_HLS_RREADY           ( I_RREADY ),
        .out_HLS_RFIFONUM        ( I_RFIFONUM ));
    // kernel3_gmem_B_m_axi_write
    kernel3_gmem_B_m_axi_write #(
        .CONSERVATIVE            ( CONSERVATIVE),
        .C_M_AXI_ID_WIDTH        ( C_M_AXI_ID_WIDTH ),
        .C_M_AXI_AWUSER_WIDTH    ( C_M_AXI_AWUSER_WIDTH ),
        .C_M_AXI_WUSER_WIDTH     ( C_M_AXI_WUSER_WIDTH ),
        .C_M_AXI_BUSER_WIDTH     ( C_M_AXI_BUSER_WIDTH ),
        .C_USER_VALUE            ( C_USER_VALUE ),
        .C_PROT_VALUE            ( C_PROT_VALUE ),
        .C_CACHE_VALUE           ( C_CACHE_VALUE ),
        .BUS_ADDR_WIDTH          ( C_M_AXI_ADDR_WIDTH ),
        .BUS_DATA_WIDTH          ( C_M_AXI_DATA_WIDTH ),
        .NUM_WRITE_OUTSTANDING   ( NUM_WRITE_OUTSTANDING ),
        .MAX_WRITE_BURST_LENGTH  ( MAX_WRITE_BURST_LENGTH )
    ) bus_write (
        .ACLK                    ( ACLK ),
        .ARESET                  ( ARESET ),
        .ACLK_EN                 ( ACLK_EN ),
        .out_BUS_AWID            ( AWID ),
        .out_BUS_AWSIZE          ( AWSIZE ),
        .out_BUS_AWBURST         ( AWBURST ),
        .out_BUS_AWLOCK          ( AWLOCK ),
        .out_BUS_AWCACHE         ( AWCACHE ),
        .out_BUS_AWPROT          ( AWPROT ),
        .out_BUS_AWQOS           ( AWQOS ),
        .out_BUS_AWREGION        ( AWREGION ),
        .out_BUS_AWUSER          ( AWUSER ),
        .out_BUS_AWADDR          ( AWADDR ),
        .out_BUS_AWLEN           ( AWLEN ),


        .out_BUS_AWVALID         ( AWVALID ),
        .in_BUS_AWREADY          ( AWREADY ),
        .out_BUS_WID             ( WID),
        .out_BUS_WUSER           ( WUSER),
        .out_BUS_WDATA           ( WDATA ),
        .out_BUS_WSTRB           ( WSTRB ),
        .out_BUS_WLAST           ( WLAST ),


        .out_BUS_WVALID          ( WVALID ),
        .in_BUS_WREADY           ( WREADY ),
        .in_BUS_BID              ( BID ),
        .in_BUS_BRESP            ( BRESP ),
        .in_BUS_BUSER            ( BUSER ),
        .in_BUS_BVALID           ( BVALID ),


        .out_BUS_BREADY          ( BREADY ),
        .in_HLS_AWVALID          ( AWVALID_Dummy ),
        .out_HLS_AWREADY         ( AWREADY_Dummy ),
        .in_HLS_AWADDR           ( AWADDR_Dummy ),
        .in_HLS_AWLEN            ( AWLEN_Dummy ),
        .in_HLS_WVALID           ( WVALID_Dummy ),
        .out_HLS_WREADY          ( WREADY_Dummy ),
        .in_HLS_WSTRB            ( WSTRB_Dummy ),
        .in_HLS_WDATA            ( WDATA_Dummy ),
        .out_HLS_BVALID          ( BVALID_Dummy ),
        .in_HLS_BREADY           ( BREADY_Dummy ));
    // kernel3_gmem_B_m_axi_read
    kernel3_gmem_B_m_axi_read #(
        .C_M_AXI_ID_WIDTH         ( C_M_AXI_ID_WIDTH ),
        .C_M_AXI_ARUSER_WIDTH     ( C_M_AXI_ARUSER_WIDTH ),
        .C_M_AXI_RUSER_WIDTH      ( C_M_AXI_RUSER_WIDTH ),
        .C_USER_VALUE             ( C_USER_VALUE ),
        .C_PROT_VALUE             ( C_PROT_VALUE ),
        .C_CACHE_VALUE            ( C_CACHE_VALUE ),
        .BUS_ADDR_WIDTH           ( C_M_AXI_ADDR_WIDTH ),
        .BUS_DATA_WIDTH           ( C_M_AXI_DATA_WIDTH ),
        .NUM_READ_OUTSTANDING     ( NUM_READ_OUTSTANDING ),
        .MAX_READ_BURST_LENGTH    ( MAX_READ_BURST_LENGTH )
    ) bus_read (
        .ACLK                     ( ACLK ),
        .ARESET                   ( ARESET ),
        .ACLK_EN                  ( ACLK_EN ),
        .out_BUS_ARID             ( ARID ),
        .out_BUS_ARADDR           ( ARADDR ),
        .out_BUS_ARLEN            ( ARLEN ),
        .out_BUS_ARSIZE           ( ARSIZE ),
        .out_BUS_ARBURST          ( ARBURST ),
        .out_BUS_ARLOCK           ( ARLOCK ),
        .out_BUS_ARCACHE          ( ARCACHE ),
        .out_BUS_ARPROT           ( ARPROT ),
        .out_BUS_ARQOS            ( ARQOS ),
        .out_BUS_ARREGION         ( ARREGION ),
        .out_BUS_ARUSER           ( ARUSER ),


        .out_BUS_ARVALID          ( ARVALID ),
        .in_BUS_ARREADY           ( ARREADY ),
        .in_BUS_RID               ( RID ),
        .in_BUS_RDATA             ( RDATA ),
        .in_BUS_RRESP             ( RRESP ),
        .in_BUS_RLAST             ( RLAST ),
        .in_BUS_RUSER             ( RUSER ),
        .in_BUS_RVALID            ( RVALID ),


        .out_BUS_RREADY           ( RREADY ),
        .in_HLS_ARVALID           ( ARVALID_Dummy ),
        .out_HLS_ARREADY          ( ARREADY_Dummy ),
        .in_HLS_ARADDR            ( ARADDR_Dummy ),
        .in_HLS_ARLEN             ( ARLEN_Dummy ),
        .out_HLS_RVALID           ( RVALID_Dummy ),
        .in_HLS_RREADY            ( RREADY_Dummy ),
        .in_HLS_RBUST_READY       ( RBURST_READY_Dummy),
        .out_HLS_RDATA            ( RDATA_Dummy ),
        .out_HLS_RLAST            ( RLAST_Dummy ));

endmodule
