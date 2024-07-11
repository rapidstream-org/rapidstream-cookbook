`timescale 1 ns / 1 ps
module __rs___rs_ff_pipeline_aux #(
    parameter DATA_WIDTH      = 32,
    parameter HEAD_LEVEL      = 0,
    parameter BODY_LEVEL      = 2,
    parameter TAIL_LEVEL      = 0,
    parameter __HEAD_REGION   = "",
    parameter __BODY_0_REGION = "",
    parameter __BODY_1_REGION = "",
    parameter __BODY_2_REGION = "",
    parameter __BODY_3_REGION = "",
    parameter __BODY_4_REGION = "",
    parameter __BODY_5_REGION = "",
    parameter __BODY_6_REGION = "",
    parameter __BODY_7_REGION = "",
    parameter __BODY_8_REGION = "",
    parameter __TAIL_REGION   = ""
) (
    input wire                       clk,
    input wire  [(DATA_WIDTH - 1):0] if_din,
    output wire [(DATA_WIDTH - 1):0] if_dout,
    output wire                      head_clk,
    output wire [(DATA_WIDTH - 1):0] head_if_din,
    input wire  [(DATA_WIDTH - 1):0] head_if_dout,
    output wire                      body_0_clk,
    output wire [(DATA_WIDTH - 1):0] body_0_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_0_if_dout,
    output wire                      body_1_clk,
    output wire [(DATA_WIDTH - 1):0] body_1_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_1_if_dout,
    output wire                      body_2_clk,
    output wire [(DATA_WIDTH - 1):0] body_2_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_2_if_dout,
    output wire                      body_3_clk,
    output wire [(DATA_WIDTH - 1):0] body_3_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_3_if_dout,
    output wire                      body_4_clk,
    output wire [(DATA_WIDTH - 1):0] body_4_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_4_if_dout,
    output wire                      body_5_clk,
    output wire [(DATA_WIDTH - 1):0] body_5_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_5_if_dout,
    output wire                      body_6_clk,
    output wire [(DATA_WIDTH - 1):0] body_6_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_6_if_dout,
    output wire                      body_7_clk,
    output wire [(DATA_WIDTH - 1):0] body_7_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_7_if_dout,
    output wire                      body_8_clk,
    output wire [(DATA_WIDTH - 1):0] body_8_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_8_if_dout,
    output wire                      tail_clk,
    output wire [(DATA_WIDTH - 1):0] tail_if_din,
    input wire  [(DATA_WIDTH - 1):0] tail_if_dout
);
  wire [DATA_WIDTH-1:0] body_dout_0;
  wire [DATA_WIDTH-1:0] body_dout_1;
  wire [DATA_WIDTH-1:0] body_dout_2;
  wire [DATA_WIDTH-1:0] body_dout_3;
  wire [DATA_WIDTH-1:0] body_dout_4;
  wire [DATA_WIDTH-1:0] body_dout_5;
  wire [DATA_WIDTH-1:0] body_dout_6;
  wire [DATA_WIDTH-1:0] body_dout_7;
  wire [DATA_WIDTH-1:0] body_dout_8;
  wire [DATA_WIDTH-1:0] body_dout_9;
  assign head_clk = clk;
  assign head_if_din = if_din;
  assign body_dout_0 = head_if_dout;
  assign body_0_clk = clk;
  assign body_0_if_din = body_dout_0;
  assign body_dout_1 = body_0_if_dout;
  assign body_1_clk = clk;
  assign body_1_if_din = body_dout_1;
  assign body_dout_2 = body_1_if_dout;
  assign body_2_clk = clk;
  assign body_2_if_din = body_dout_2;
  assign body_dout_3 = body_2_if_dout;
  assign body_3_clk = clk;
  assign body_3_if_din = body_dout_3;
  assign body_dout_4 = body_3_if_dout;
  assign body_4_clk = clk;
  assign body_4_if_din = body_dout_4;
  assign body_dout_5 = body_4_if_dout;
  assign body_5_clk = clk;
  assign body_5_if_din = body_dout_5;
  assign body_dout_6 = body_5_if_dout;
  assign body_6_clk = clk;
  assign body_6_if_din = body_dout_6;
  assign body_dout_7 = body_6_if_dout;
  assign body_7_clk = clk;
  assign body_7_if_din = body_dout_7;
  assign body_dout_8 = body_7_if_dout;
  assign body_8_clk = clk;
  assign body_8_if_din = body_dout_8;
  assign body_dout_9 = body_8_if_dout;
  assign tail_clk = clk;
  assign tail_if_din = body_dout_9;
  assign if_dout = tail_if_dout;
endmodule
