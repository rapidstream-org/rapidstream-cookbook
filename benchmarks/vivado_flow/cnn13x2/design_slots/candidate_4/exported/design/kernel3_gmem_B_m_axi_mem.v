`timescale 1 ns / 1 ps

module kernel3_gmem_B_m_axi_mem
#(parameter
    MEM_STYLE   = "auto",
    DATA_WIDTH  = 32,
    ADDR_WIDTH  = 6,
    DEPTH       = 63
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  clk_en,
    input  wire                  we,
    input  wire [ADDR_WIDTH-1:0] waddr,
    input  wire [DATA_WIDTH-1:0] din,
    input  wire [ADDR_WIDTH-1:0] raddr,
    input  wire                  re,
    output reg  [DATA_WIDTH-1:0] dout);
    (* ram_style = MEM_STYLE, rw_addr_collision = "yes" *)
    reg  [DATA_WIDTH-1:0] mem[0:DEPTH-2];
    reg  [ADDR_WIDTH-1:0] raddr_reg;
    //write to ram
    always @(posedge clk) begin
        if (clk_en & we)
            mem[waddr] <= din;
    end
    //buffer the raddr
    always @(posedge clk) begin
        if (clk_en)
            raddr_reg <= raddr;
    end
    //read from ram
    always @(posedge clk) begin
        if (reset)
            dout <= 0;
        else if (clk_en & re)
            dout <= mem[raddr_reg];
    end
endmodule
