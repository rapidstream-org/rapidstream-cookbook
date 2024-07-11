`timescale 1 ns / 1 ps

/////////////////////////////////////////////////////////////////
module __rs_feed_forward_reg #(
  parameter DATA_WIDTH = 32,
  parameter ENABLE_REG = 0,
  parameter __REGION = ""
) (
  // pragma RS clk port=clk
  input wire clk,
  // pragma RS ff data=if_din
  input  wire [DATA_WIDTH-1:0] if_din,
  // pragma RS ff data=if_dout
  output wire [DATA_WIDTH-1:0] if_dout
);
  generate
  // reg enabled
  if (ENABLE_REG > 0) begin : inst
    (* keep = "true" *) reg [DATA_WIDTH-1:0] if_dout_reg;
    always @ (posedge clk) begin
      if_dout_reg <= if_din;
    end
    assign if_dout = if_dout_reg;
  end
  // pass through
  else begin : inst
    assign if_dout = if_din;
  end
  endgenerate
endmodule
