`timescale 1 ns / 1 ps

module kernel3_fifo_w64_d33_A_ram
#(parameter
    MEM_STYLE   = "auto",
    DATA_WIDTH  = 64,
    ADDR_WIDTH  = 6,
    DEPTH       = 32)
(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  we,
    input  wire [ADDR_WIDTH-1:0] waddr,
    input  wire [DATA_WIDTH-1:0] din,
    input  wire [ADDR_WIDTH-1:0] raddr,
    //output register?
    input  wire                  rden,
    output reg  [DATA_WIDTH-1:0] dout //yes
);
    (* ram_style = MEM_STYLE, rw_addr_collision = "yes" *)
    reg  [DATA_WIDTH-1:0] mem[0:DEPTH-1];
    reg  [ADDR_WIDTH-1:0] raddr_reg;
    //write to ram
    always @(posedge clk) begin
        if (we)
            mem[waddr] <= din;
    end
    //buffer the raddr
    always @(posedge clk) begin
        raddr_reg <= raddr;
    end
    //read from ram, output register?
    always @(posedge clk ) begin
        if (reset)
            dout <= 0;
        else if (rden)
            dout <= mem[raddr_reg];
    end// yes
endmodule
