`timescale 1 ns / 1 ps

module __rs_fifo_srl_almost_full_internal #(
  parameter DATA_WIDTH = 32'd32,
  parameter ADDR_WIDTH = 32'd4,
  parameter DEPTH = 5'd16
) (
  input  wire                  clk,
  input  wire [DATA_WIDTH-1:0] data,
  input  wire                  ce,
  input  wire [ADDR_WIDTH-1:0] a,
  output wire [DATA_WIDTH-1:0] q
);
(* shreg_extract = "yes" *) reg[DATA_WIDTH-1:0] SRL_SIG [0:DEPTH-1];
integer i;
always @ (posedge clk)
    begin
        if (ce)
        begin
            for (i=0;i<DEPTH-1;i=i+1)
                SRL_SIG[i+1] <= SRL_SIG[i];
            SRL_SIG[0] <= data;
        end
    end
assign q = SRL_SIG[a];
endmodule
