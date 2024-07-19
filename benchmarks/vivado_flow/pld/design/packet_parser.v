`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/11/2018 02:21:46 PM
// Design Name:
// Module Name: ExtractCtrl
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`define INPUT_PORT_MAX_NUM 8
`define OUTPUT_PORT_MIN_NUM 9

module packet_parser # (
      parameter PACKET_BITS   = 97
    , parameter NUM_LEAF_BITS = 6
    , parameter NUM_PORT_BITS = 4
    )(
      input clk
    , input reset

    //bft_side
    , output      [PACKET_BITS-1:0] o_bft_data
    , input       [PACKET_BITS-1:0] i_bft_data
    , input                         i_bft_ready

    //stream flow control side
    , output reg  [PACKET_BITS-1:0] o_data_packet
    , output                        o_bft_ready
    , input       [PACKET_BITS-1:0] i_data_packet

    //Config Control side
    , output reg  [PACKET_BITS-1:0] o_config_packet
);


wire                     bft_valid;
wire [NUM_LEAF_BITS-1:0] leaf_num;
wire [NUM_PORT_BITS-1:0] port_num;

assign bft_valid   = i_bft_data[PACKET_BITS-1];
assign leaf_num    = i_bft_data[PACKET_BITS-2                 : PACKET_BITS-1-NUM_LEAF_BITS];
assign port_num    = i_bft_data[PACKET_BITS-1-NUM_LEAF_BITS-1 : PACKET_BITS-1-NUM_LEAF_BITS-NUM_PORT_BITS];
assign o_bft_ready = i_bft_ready;
assign o_bft_data  = i_data_packet;

//outputs for config control module
always@(posedge clk) begin
    if(reset)
        o_config_packet <= 0;
    else if(bft_valid && ( (port_num == 0) || (port_num == 1) || (port_num >= `OUTPUT_PORT_MIN_NUM) ) )
        o_config_packet <= i_bft_data;
    else
        o_config_packet <= 0;
end

//outputs for stream flow control
always@(posedge clk) begin
    if(reset)
        o_data_packet <= 0;
    else if(bft_valid && ( (port_num > 1) && (port_num <= `INPUT_PORT_MAX_NUM) ) )
        o_data_packet <= i_bft_data;
    else
        o_data_packet <= 0;
end


endmodule
