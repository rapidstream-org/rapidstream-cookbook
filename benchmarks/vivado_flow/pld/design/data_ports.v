`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/13/2018 05:35:43 PM
// Design Name:
// Module Name: Stream_Flow_Control
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
module data_ports #(
      parameter PACKET_BITS           = 97
    , parameter NUM_LEAF_BITS         = 6
    , parameter NUM_PORT_BITS         = 4
    , parameter NUM_ADDR_BITS         = 7
    , parameter PAYLOAD_BITS          = 64
    , parameter NUM_IN_PORTS          = 7
    , parameter NUM_OUT_PORTS         = 7
    , parameter NUM_BRAM_ADDR_BITS    = 7
    , parameter FREESPACE_UPDATE_SIZE = 64
    , localparam OUT_PORTS_REG_BITS   = NUM_LEAF_BITS + NUM_PORT_BITS + NUM_ADDR_BITS + NUM_ADDR_BITS + 3
    , localparam IN_PORTS_REG_BITS    = NUM_LEAF_BITS + NUM_PORT_BITS
    , localparam REG_CONTROL_BITS     = OUT_PORTS_REG_BITS * NUM_OUT_PORTS + IN_PORTS_REG_BITS * NUM_IN_PORTS
)(
      input                                   i_bft_ready
    , input                                   clk
    , input                                   reset

    , input  [PACKET_BITS-1:0]                i_stream
    , output [PACKET_BITS-1:0]                o_stream
    , input  [REG_CONTROL_BITS-1:0]           i_control_reg

    //data to USER
    , output [PAYLOAD_BITS*NUM_IN_PORTS-1:0]  o_user_data
    , output [NUM_IN_PORTS-1:0]               o_user_valid
    , input  [NUM_IN_PORTS-1:0]               i_user_ready

    //data from USER
    , output [NUM_OUT_PORTS-1:0]              o_user_ready
    , input  [NUM_OUT_PORTS-1:0]              i_user_valid
    , input  [PAYLOAD_BITS*NUM_OUT_PORTS-1:0] i_user_data
);

wire [NUM_IN_PORTS-1:0]              freespace_update;
wire [NUM_OUT_PORTS-1:0]             empty;
wire [PACKET_BITS*NUM_IN_PORTS-1:0]  packet_from_input_ports;
wire [PACKET_BITS*NUM_OUT_PORTS-1:0] packet_from_output_ports;
wire [NUM_OUT_PORTS-1:0]             rd_en_sel;


converge_ctrl#(
      .PACKET_BITS              (PACKET_BITS                                                     )
    , .NUM_PORT_BITS            (NUM_PORT_BITS                                                   )
    , .NUM_IN_PORTS             (NUM_IN_PORTS                                                    )
    , .NUM_OUT_PORTS            (NUM_OUT_PORTS                                                   )
)ConCtrl(
      .clk                      (clk                                                             )
    , .reset                    (reset                                                           )
    , .outport_sel              (rd_en_sel                                                       )
    , .stream_out               (o_stream                                                        )
    , .freespace_update         (freespace_update                                                )
    , .packet_from_input_ports  (packet_from_input_ports                                         )
    , .packet_from_output_ports (packet_from_output_ports                                        )
    , .empty                    (empty                                                           )
    , .resend                   (i_bft_ready                                                     )
);


Input_Port_Cluster # (
      .PACKET_BITS              (PACKET_BITS                                                     )
    , .NUM_LEAF_BITS            (NUM_LEAF_BITS                                                   )
    , .NUM_PORT_BITS            (NUM_PORT_BITS                                                   )
    , .NUM_ADDR_BITS            (NUM_ADDR_BITS                                                   )
    , .PAYLOAD_BITS             (PAYLOAD_BITS                                                    )
    , .NUM_IN_PORTS             (NUM_IN_PORTS                                                    )
    , .NUM_OUT_PORTS            (NUM_OUT_PORTS                                                   )
    , .NUM_BRAM_ADDR_BITS       (NUM_BRAM_ADDR_BITS                                              )
    , .FREESPACE_UPDATE_SIZE    (FREESPACE_UPDATE_SIZE                                           )
)ipc(
      .clk                      (clk                                                             )
    , .reset                    (reset                                                           )
    , .freespace_update         (freespace_update                                                )
    , .packet_from_input_ports  (packet_from_input_ports                                         )
    , .stream_in                (i_stream                                                        )
    , .in_control_reg           (i_control_reg[IN_PORTS_REG_BITS*NUM_IN_PORTS-1:0]               )
    , .dout2user                (o_user_data                                                     )
    , .vld2user                 (o_user_valid                                                    )
    , .ack_user2b_in            (i_user_ready                                                    )
);


Output_Port_Cluster #(
      .PACKET_BITS              (PACKET_BITS                                                     )
    , .NUM_LEAF_BITS            (NUM_LEAF_BITS                                                   )
    , .NUM_PORT_BITS            (NUM_PORT_BITS                                                   )
    , .NUM_ADDR_BITS            (NUM_ADDR_BITS                                                   )
    , .PAYLOAD_BITS             (PAYLOAD_BITS                                                    )
    , .NUM_IN_PORTS             (NUM_IN_PORTS                                                    )
    , .NUM_OUT_PORTS            (NUM_OUT_PORTS                                                   )
    , .NUM_BRAM_ADDR_BITS       (NUM_BRAM_ADDR_BITS                                              )
    , .FREESPACE_UPDATE_SIZE    (FREESPACE_UPDATE_SIZE                                           )
)opc(
      .clk                      (clk                                                             )
    , .reset                    (reset                                                           )
    , .out_control_reg          (i_control_reg[REG_CONTROL_BITS-1:IN_PORTS_REG_BITS*NUM_IN_PORTS])
    , .internal_out             (packet_from_output_ports                                        )
    , .empty                    (empty                                                           )
    , .rd_en_sel                (rd_en_sel                                                       )
    , .ack_b_out2user           (o_user_ready                                                    )
    , .din_leaf_user2interface  (i_user_data                                                     )
    , .vld_user2b_out           (i_user_valid                                                    )
);

endmodule
