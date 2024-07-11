`timescale 1 ns / 1 ps

module kernel3_gmem_A_m_axi_srl
#(parameter
        DATA_WIDTH  = 32,
        ADDR_WIDTH  = 6,
        DEPTH       = 63
    )(
        input  wire                  clk,
        input  wire                  reset,
        input  wire                  clk_en,
        input  wire                  we,
        input  wire [DATA_WIDTH-1:0] din,
        input  wire [ADDR_WIDTH-1:0] raddr,
        input  wire                  re,
        output reg  [DATA_WIDTH-1:0] dout
    );
    generate
    if (DEPTH > 1) begin
        reg  [DATA_WIDTH-1:0] mem[0:DEPTH-2];
        integer i;
        always @(posedge clk)
        begin
            if (clk_en & we) begin
                for (i = 0; i < DEPTH - 2; i = i + 1) begin
                    mem[i+1] <= mem[i];
                end
                mem[0] <= din;
            end
        end
        always @(posedge clk)
        begin
            if (reset)
                dout <= 0;
            else if (clk_en & re) begin
                dout <= mem[raddr];
            end
        end
    end
    else begin
        always @(posedge clk)
        begin
            if (reset)
                dout <= 0;
            else if (clk_en & we) begin
                dout <= din;
            end
        end
    end
    endgenerate
endmodule
