// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//
// ===========================================================

`timescale 1 ns / 1 ps

module JACOBI3D_HLS_REG_ap_uint_512_s (
        ap_ready,
        in_r,
        ap_return
);


output   ap_ready;
input  [511:0] in_r;
output  [511:0] ap_return;

assign ap_ready = 1'b1;

assign ap_return = in_r;

endmodule //JACOBI3D_HLS_REG_ap_uint_512_s