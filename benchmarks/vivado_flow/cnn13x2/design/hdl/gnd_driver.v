(* DONT_TOUCH = "yes" *)
module gnd_driver(
    input clk,
    input rst_n,
    output reg dout
    );

    always@(posedge clk) begin
        if(!rst_n) dout <= 1'b0;
        else       dout <= 1'b0;
    end

endmodule
