`timescale 1 ns / 1 ps
module __rs___rs_hs_pipeline_aux #(
    parameter DATA_WIDTH                      = 32,
    parameter DEPTH                           = 24,
    parameter PIPELINE_READY_IN_HEAD          = 1,
    parameter PIPELINE_VALID_AND_DATA_IN_HEAD = 0,
    parameter PIPELINE_BODY_LEVEL             = 2,
    parameter MEM_STYLE                       = 0,
    parameter __HEAD_REGION                   = "",
    parameter __BODY_0_REGION                 = "",
    parameter __BODY_1_REGION                 = "",
    parameter __BODY_2_REGION                 = "",
    parameter __BODY_3_REGION                 = "",
    parameter __BODY_4_REGION                 = "",
    parameter __BODY_5_REGION                 = "",
    parameter __BODY_6_REGION                 = "",
    parameter __BODY_7_REGION                 = "",
    parameter __BODY_8_REGION                 = "",
    parameter __TAIL_REGION                   = "",
    parameter GRACE_PERIOD                    = PIPELINE_BODY_LEVEL * 2 + PIPELINE_READY_IN_HEAD + PIPELINE_VALID_AND_DATA_IN_HEAD,
    parameter REAL_DEPTH                      = GRACE_PERIOD + DEPTH + 4,
    parameter REAL_ADDR_WIDTH                 = $clog2 ( REAL_DEPTH )
) (
    input wire                       clk,
    input wire                       reset,
    output wire                      if_full_n,
    input wire                       if_write,
    input wire  [(DATA_WIDTH - 1):0] if_din,
    output wire                      if_empty_n,
    input wire                       if_read,
    output wire [(DATA_WIDTH - 1):0] if_dout,
    output wire                      head_gate_clk,
    output wire [(DATA_WIDTH - 1):0] head_gate_if_din,
    input wire  [(DATA_WIDTH - 1):0] head_gate_if_dout,
    input wire                       head_gate_if_empty_n,
    input wire                       head_gate_if_full_n,
    output wire                      head_gate_if_read,
    output wire                      head_gate_if_write,
    output wire                      head_gate_reset,
    output wire                      head_clk,
    output wire [(DATA_WIDTH - 1):0] head_if_din,
    input wire  [(DATA_WIDTH - 1):0] head_if_dout,
    input wire                       head_if_empty_n,
    input wire                       head_if_full_n,
    output wire                      head_if_read,
    output wire                      head_if_write,
    output wire                      head_reset,
    output wire                      body_0_clk,
    output wire [(DATA_WIDTH - 1):0] body_0_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_0_if_dout,
    input wire                       body_0_if_empty_n,
    input wire                       body_0_if_full_n,
    output wire                      body_0_if_read,
    output wire                      body_0_if_write,
    output wire                      body_0_reset,
    output wire                      body_1_clk,
    output wire [(DATA_WIDTH - 1):0] body_1_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_1_if_dout,
    input wire                       body_1_if_empty_n,
    input wire                       body_1_if_full_n,
    output wire                      body_1_if_read,
    output wire                      body_1_if_write,
    output wire                      body_1_reset,
    output wire                      body_2_clk,
    output wire [(DATA_WIDTH - 1):0] body_2_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_2_if_dout,
    input wire                       body_2_if_empty_n,
    input wire                       body_2_if_full_n,
    output wire                      body_2_if_read,
    output wire                      body_2_if_write,
    output wire                      body_2_reset,
    output wire                      body_3_clk,
    output wire [(DATA_WIDTH - 1):0] body_3_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_3_if_dout,
    input wire                       body_3_if_empty_n,
    input wire                       body_3_if_full_n,
    output wire                      body_3_if_read,
    output wire                      body_3_if_write,
    output wire                      body_3_reset,
    output wire                      body_4_clk,
    output wire [(DATA_WIDTH - 1):0] body_4_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_4_if_dout,
    input wire                       body_4_if_empty_n,
    input wire                       body_4_if_full_n,
    output wire                      body_4_if_read,
    output wire                      body_4_if_write,
    output wire                      body_4_reset,
    output wire                      body_5_clk,
    output wire [(DATA_WIDTH - 1):0] body_5_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_5_if_dout,
    input wire                       body_5_if_empty_n,
    input wire                       body_5_if_full_n,
    output wire                      body_5_if_read,
    output wire                      body_5_if_write,
    output wire                      body_5_reset,
    output wire                      body_6_clk,
    output wire [(DATA_WIDTH - 1):0] body_6_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_6_if_dout,
    input wire                       body_6_if_empty_n,
    input wire                       body_6_if_full_n,
    output wire                      body_6_if_read,
    output wire                      body_6_if_write,
    output wire                      body_6_reset,
    output wire                      body_7_clk,
    output wire [(DATA_WIDTH - 1):0] body_7_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_7_if_dout,
    input wire                       body_7_if_empty_n,
    input wire                       body_7_if_full_n,
    output wire                      body_7_if_read,
    output wire                      body_7_if_write,
    output wire                      body_7_reset,
    output wire                      body_8_clk,
    output wire [(DATA_WIDTH - 1):0] body_8_if_din,
    input wire  [(DATA_WIDTH - 1):0] body_8_if_dout,
    input wire                       body_8_if_empty_n,
    input wire                       body_8_if_full_n,
    output wire                      body_8_if_read,
    output wire                      body_8_if_write,
    output wire                      body_8_reset,
    output wire                      tail_clk,
    output wire [(DATA_WIDTH - 1):0] tail_if_din,
    input wire  [(DATA_WIDTH - 1):0] tail_if_dout,
    input wire                       tail_if_empty_n,
    input wire                       tail_if_full_n,
    output wire                      tail_if_read,
    output wire                      tail_if_write,
    output wire                      tail_reset
);
    wire                  gate_valid;
    wire                  gate_ready;
    wire [DATA_WIDTH-1:0] gate_data ;
    wire                  body_outbound_0_valid;
    wire                  body_outbound_0_ready;
    wire [DATA_WIDTH-1:0] body_outbound_0_data ;
    wire                  body_outbound_1_valid;
    wire                  body_outbound_1_ready;
    wire [DATA_WIDTH-1:0] body_outbound_1_data ;
    wire                  body_outbound_2_valid;
    wire                  body_outbound_2_ready;
    wire [DATA_WIDTH-1:0] body_outbound_2_data ;
    wire                  body_outbound_3_valid;
    wire                  body_outbound_3_ready;
    wire [DATA_WIDTH-1:0] body_outbound_3_data ;
    wire                  body_outbound_4_valid;
    wire                  body_outbound_4_ready;
    wire [DATA_WIDTH-1:0] body_outbound_4_data ;
    wire                  body_outbound_5_valid;
    wire                  body_outbound_5_ready;
    wire [DATA_WIDTH-1:0] body_outbound_5_data ;
    wire                  body_outbound_6_valid;
    wire                  body_outbound_6_ready;
    wire [DATA_WIDTH-1:0] body_outbound_6_data ;
    wire                  body_outbound_7_valid;
    wire                  body_outbound_7_ready;
    wire [DATA_WIDTH-1:0] body_outbound_7_data ;
    wire                  body_outbound_8_valid;
    wire                  body_outbound_8_ready;
    wire [DATA_WIDTH-1:0] body_outbound_8_data ;
    wire                  body_outbound_9_valid;
    wire                  body_outbound_9_ready;
    wire [DATA_WIDTH-1:0] body_outbound_9_data ;
  assign head_gate_clk = clk;
  assign head_gate_if_din = if_din;
  assign gate_data = head_gate_if_dout;
  assign gate_valid = head_gate_if_empty_n;
  assign if_full_n = head_gate_if_full_n;
  assign head_gate_if_read = gate_ready;
  assign head_gate_if_write = if_write;
  assign head_gate_reset = reset;
  assign head_clk = clk;
  assign head_if_din = gate_data;
  assign body_outbound_0_data = head_if_dout;
  assign body_outbound_0_valid = head_if_empty_n;
  assign gate_ready = head_if_full_n;
  assign head_if_read = body_outbound_0_ready;
  assign head_if_write = gate_valid;
  assign head_reset = reset;
  assign body_0_clk = clk;
  assign body_0_if_din = body_outbound_0_data;
  assign body_outbound_1_data = body_0_if_dout;
  assign body_outbound_1_valid = body_0_if_empty_n;
  assign body_outbound_0_ready = body_0_if_full_n;
  assign body_0_if_read = body_outbound_1_ready;
  assign body_0_if_write = body_outbound_0_valid;
  assign body_0_reset = reset;
  assign body_1_clk = clk;
  assign body_1_if_din = body_outbound_1_data;
  assign body_outbound_2_data = body_1_if_dout;
  assign body_outbound_2_valid = body_1_if_empty_n;
  assign body_outbound_1_ready = body_1_if_full_n;
  assign body_1_if_read = body_outbound_2_ready;
  assign body_1_if_write = body_outbound_1_valid;
  assign body_1_reset = reset;
  assign body_2_clk = clk;
  assign body_2_if_din = body_outbound_2_data;
  assign body_outbound_3_data = body_2_if_dout;
  assign body_outbound_3_valid = body_2_if_empty_n;
  assign body_outbound_2_ready = body_2_if_full_n;
  assign body_2_if_read = body_outbound_3_ready;
  assign body_2_if_write = body_outbound_2_valid;
  assign body_2_reset = reset;
  assign body_3_clk = clk;
  assign body_3_if_din = body_outbound_3_data;
  assign body_outbound_4_data = body_3_if_dout;
  assign body_outbound_4_valid = body_3_if_empty_n;
  assign body_outbound_3_ready = body_3_if_full_n;
  assign body_3_if_read = body_outbound_4_ready;
  assign body_3_if_write = body_outbound_3_valid;
  assign body_3_reset = reset;
  assign body_4_clk = clk;
  assign body_4_if_din = body_outbound_4_data;
  assign body_outbound_5_data = body_4_if_dout;
  assign body_outbound_5_valid = body_4_if_empty_n;
  assign body_outbound_4_ready = body_4_if_full_n;
  assign body_4_if_read = body_outbound_5_ready;
  assign body_4_if_write = body_outbound_4_valid;
  assign body_4_reset = reset;
  assign body_5_clk = clk;
  assign body_5_if_din = body_outbound_5_data;
  assign body_outbound_6_data = body_5_if_dout;
  assign body_outbound_6_valid = body_5_if_empty_n;
  assign body_outbound_5_ready = body_5_if_full_n;
  assign body_5_if_read = body_outbound_6_ready;
  assign body_5_if_write = body_outbound_5_valid;
  assign body_5_reset = reset;
  assign body_6_clk = clk;
  assign body_6_if_din = body_outbound_6_data;
  assign body_outbound_7_data = body_6_if_dout;
  assign body_outbound_7_valid = body_6_if_empty_n;
  assign body_outbound_6_ready = body_6_if_full_n;
  assign body_6_if_read = body_outbound_7_ready;
  assign body_6_if_write = body_outbound_6_valid;
  assign body_6_reset = reset;
  assign body_7_clk = clk;
  assign body_7_if_din = body_outbound_7_data;
  assign body_outbound_8_data = body_7_if_dout;
  assign body_outbound_8_valid = body_7_if_empty_n;
  assign body_outbound_7_ready = body_7_if_full_n;
  assign body_7_if_read = body_outbound_8_ready;
  assign body_7_if_write = body_outbound_7_valid;
  assign body_7_reset = reset;
  assign body_8_clk = clk;
  assign body_8_if_din = body_outbound_8_data;
  assign body_outbound_9_data = body_8_if_dout;
  assign body_outbound_9_valid = body_8_if_empty_n;
  assign body_outbound_8_ready = body_8_if_full_n;
  assign body_8_if_read = body_outbound_9_ready;
  assign body_8_if_write = body_outbound_8_valid;
  assign body_8_reset = reset;
  assign tail_clk = clk;
  assign tail_if_din = body_outbound_9_data;
  assign if_dout = tail_if_dout;
  assign if_empty_n = tail_if_empty_n;
  assign body_outbound_9_ready = tail_if_full_n;
  assign tail_if_read = if_read;
  assign tail_if_write = body_outbound_9_valid;
  assign tail_reset = reset;
endmodule
