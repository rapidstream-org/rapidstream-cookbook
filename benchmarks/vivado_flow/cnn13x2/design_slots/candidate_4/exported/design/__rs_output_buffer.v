`timescale 1 ns / 1 ps

module __rs_output_buffer #(
    parameter LUT_COUNT = 2,
    parameter DATA_WIDTH = 32
) (
    input ap_clk,
    output [DATA_WIDTH-1:0] data_out
);
    wire [DATA_WIDTH-1:0] data    [LUT_COUNT:0];
    genvar i, j;
    generate
        for (i = 0; i < LUT_COUNT; i = i + 1) begin
            for (j = 0; j < DATA_WIDTH; j = j + 1) begin
                (* DONT_TOUCH = "yes" *) LUT6 #(
                    .INIT(64'h0000000000000000) // Specify LUT Contents
                ) LUT6_inst (
                    .O(data[i+1][j]), // LUT general output
                    .I0(data[i][j]), // LUT input
                    .I1(1'b0), // LUT input
                    .I2(1'b0), // LUT input
                    .I3(1'b0), // LUT input
                    .I4(1'b0), // LUT input
                    .I5(1'b0)
                );
            end
        end
    endgenerate
    generate
        for (j = 0; j < DATA_WIDTH; j = j + 1) begin
            (* DONT_TOUCH = "yes" *) FDRE #(
                .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
            ) FDRE_inst (
                .Q(data[0][j]), // 1-bit Data output
                .C(ap_clk), // 1-bit Clock input
                .CE(1'b1), // 1-bit Clock enable input
                .R(1'b0), // 1-bit Synchronous reset input
                .D(1'b0) // 1-bit Data input
            );
        end
    endgenerate
    assign data_out = data[LUT_COUNT];     // output
endmodule
