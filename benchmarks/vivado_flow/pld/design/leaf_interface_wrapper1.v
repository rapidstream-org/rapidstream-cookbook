`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/23/2018 02:46:07 PM
// Design Name:
// Module Name: leaf_empty
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

module InterfaceWrapper1(
      input  wire          clk
    , input  wire [48 : 0] din_leaf_bft2interface
    , output wire [48 : 0] dout_leaf_interface2bft
    , input  wire          resend

    , input       [31:0]  Input_1_V_V
    , input               Input_1_V_V_ap_vld
    , output              Input_1_V_V_ap_ack
    , output      [31:0]  Output_1_V_V
    , output              Output_1_V_V_ap_vld
    , input               Output_1_V_V_ap_ack

    , input wire          reset
);

leaf_interface #(
      .PACKET_BITS                (49                     )
    , .PAYLOAD_BITS               (32                     )
    , .NUM_LEAF_BITS              (5                      )
    , .NUM_PORT_BITS              (4                      )
    , .NUM_ADDR_BITS              (7                      )
    , .NUM_IN_PORTS               (1                      )
    , .NUM_OUT_PORTS              (1                      )
    , .NUM_BRAM_ADDR_BITS         (7                      )
    , .FREESPACE_UPDATE_SIZE      (64                     )
)leaf_interface_inst(
      .clk                        (clk                    )
    , .reset                      (reset                  )
    , .i_bft_data                 (din_leaf_bft2interface )
    , .o_bft_data                 (dout_leaf_interface2bft)
    , .i_bft_ready                (resend                 )
    , .o_user_data                ({Output_1_V_V}         )
    , .o_user_valid               ({Output_1_V_V_ap_vld}  )
    , .i_user_ready               ({Output_1_V_V_ap_ack}  )
    , .o_user_ready               ({Input_1_V_V_ap_ack}   )
    , .i_user_valid               ({Input_1_V_V_ap_vld}   )
    , .i_user_data                ({Input_1_V_V}          )
);


endmodule
