`timescale 1 ns / 1 ps
   // __rs_hs_pipeline
module __rs_fifo_reg #(
  parameter DATA_WIDTH = 32,
  parameter ENABLE_REG = 0,
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
  generate
  // reg enabled
  if (ENABLE_REG > 0) begin
    reg                   if_full_n_reg;
    reg                   if_empty_n_reg;
    reg  [DATA_WIDTH-1:0] if_dout_reg;
    always @ (posedge clk) begin
      if_dout_reg <= if_din;
      if_empty_n_reg <= if_write;
      if_full_n_reg <= if_read;
    end
    assign if_dout = if_dout_reg;
    assign if_empty_n = if_empty_n_reg;
    assign if_full_n = if_full_n_reg;
  end
  // pass through
  else begin
    assign if_dout = if_din;
    assign if_empty_n = if_write;
    assign if_full_n = if_read;
  end
  endgenerate
endmodule
