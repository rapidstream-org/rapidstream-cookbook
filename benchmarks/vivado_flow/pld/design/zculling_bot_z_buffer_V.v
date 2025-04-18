// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module zculling_bot_z_buffer_V (address0, ce0, d0, we0, q0, address1, ce1, d1, we1,  reset,clk);

parameter DataWidth = 8;
parameter AddressWidth = 15;
parameter AddressRange = 32768;

input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input we0;
output reg[DataWidth-1:0] q0;
input[AddressWidth-1:0] address1;
input ce1;
input[DataWidth-1:0] d1;
input we1;
input reset;
input clk;

reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./zculling_bot_z_buffer_V.dat", ram);
end



always @(posedge clk)
begin
    if (ce0) begin
        if (we0)
            ram[address0] <= d0;
        q0 <= ram[address0];
    end
end


always @(posedge clk)
begin
    if (ce1) begin
        if (we1)
            ram[address1] <= d1;
    end
end


endmodule
