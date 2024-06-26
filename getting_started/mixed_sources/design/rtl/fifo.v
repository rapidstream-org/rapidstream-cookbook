`default_nettype none

// first-word fall-through (FWFT) FIFO
module fifo #(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 5,
  parameter DEPTH      = 32
) (
  input wire clk,
  input wire resetn,
  // write
  output wire                  din_TREADY,
  input  wire                  din_TVALID,
  input  wire [DATA_WIDTH-1:0] din_TDATA,

  output wire                  dout_TVALID,
  input  wire                  dout_TREADY,
  output wire [DATA_WIDTH-1:0] dout_TDATA

);

// write
wire                  if_full_n;
wire                  if_write_ce;
wire                  if_write;
wire [DATA_WIDTH-1:0] if_din;

// read
wire                  if_empty_n;
wire                  if_read_ce;
wire                  if_read;
wire [DATA_WIDTH-1:0] if_dout;
wire                  reset;

assign if_din = din_TDATA;
assign if_write = din_TVALID;
assign din_TREADY = if_full_n;
assign if_write_ce = 1'b1;

assign dout_TDATA = if_dout;
assign dout_TVALID = if_empty_n;
assign if_read = dout_TREADY;
assign if_read_ce = 1'b1;

assign reset = ~resetn;

generate
  if (DEPTH == 1) begin : d1
    fifo_fwd #(
      .DATA_WIDTH(DATA_WIDTH)
    ) unit (
      .clk  (clk),
      .reset(reset),

      .if_full_n  (if_full_n),
      .if_write_ce(if_write_ce),
      .if_write   (if_write),
      .if_din     (if_din),

      .if_empty_n(if_empty_n),
      .if_read_ce(if_read_ce),
      .if_read   (if_read),
      .if_dout   (if_dout)
    );
  end else if (DATA_WIDTH >= 36 && DEPTH >= 4096) begin : uram
    fifo_bram #(
      .MEM_STYLE ("ultra"),
      .DATA_WIDTH(DATA_WIDTH),
      .ADDR_WIDTH(ADDR_WIDTH),
      .DEPTH     (DEPTH)
    ) unit (
      .clk  (clk),
      .reset(reset),

      .if_full_n  (if_full_n),
      .if_write_ce(if_write_ce),
      .if_write   (if_write),
      .if_din     (if_din),

      .if_empty_n(if_empty_n),
      .if_read_ce(if_read_ce),
      .if_read   (if_read),
      .if_dout   (if_dout)
    );
  end else if (DEPTH >=128) begin : bram
    fifo_bram #(
      .MEM_STYLE ("block"),
      .DATA_WIDTH(DATA_WIDTH),
      .ADDR_WIDTH(ADDR_WIDTH),
      .DEPTH     (DEPTH)
    ) unit (
      .clk  (clk),
      .reset(reset),

      .if_full_n  (if_full_n),
      .if_write_ce(if_write_ce),
      .if_write   (if_write),
      .if_din     (if_din),

      .if_empty_n(if_empty_n),
      .if_read_ce(if_read_ce),
      .if_read   (if_read),
      .if_dout   (if_dout)
    );
  end else begin : srl
    fifo_srl #(
      .DATA_WIDTH(DATA_WIDTH),
      .ADDR_WIDTH(ADDR_WIDTH),
      .DEPTH     (DEPTH)
    ) unit (
      .clk  (clk),
      .reset(reset),

      .if_full_n  (if_full_n),
      .if_write_ce(if_write_ce),
      .if_write   (if_write),
      .if_din     (if_din),

      .if_empty_n(if_empty_n),
      .if_read_ce(if_read_ce),
      .if_read   (if_read),
      .if_dout   (if_dout)
    );
  end
endgenerate

endmodule  // fifo

`default_nettype wire
