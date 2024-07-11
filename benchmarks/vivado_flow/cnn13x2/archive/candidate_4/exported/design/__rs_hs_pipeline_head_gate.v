`timescale 1 ns / 1 ps

module __rs_hs_pipeline_head_gate #(
    parameter DATA_WIDTH = 32,
    parameter __REGION = ""
) (
    // pragma RS clk port=clk
    input wire clk,
    // pragma RS rst port=reset active=high
    input wire reset,
    // inbound
    // pragma RS handshake valid=if_write ready=if_full_n data=if_din
    output wire                  if_full_n,
    input  wire                  if_write,
    input  wire [DATA_WIDTH-1:0] if_din,
    // outbound
    // pragma RS handshake valid=if_empty_n ready=if_read data=if_dout
    output wire                  if_empty_n,
    input  wire                  if_read,
    output wire [DATA_WIDTH-1:0] if_dout
);
    assign if_empty_n = if_write & if_read;
    assign if_full_n = if_read;
    assign if_dout = if_din;
endmodule
