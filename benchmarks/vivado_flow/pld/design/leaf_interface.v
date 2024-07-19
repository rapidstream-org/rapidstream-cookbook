`timescale 1ns / 1ps

// NUM_LEAF_BITS + NUM_PORT_BITS + NUM_ADDR_BITS == ADDR_TOTAL
// NUM_BRAM_ADDR_BITS =< NUM_ADDR_BITS
// NUM_BRAM_ADDR_BITS = NUM_BRAM_ADDR_BITS + NUM_ADDR_REMAINDER_BITS
// port values == 0,1 reserved for initialization packets
// in thise case, port values == 2,3,4,5,6,7,8 are BRAM_IN
// port values == 9,10,11,12,13,14,15 are BRAM_OUT


module leaf_interface #(
      parameter PACKET_BITS           = 49
    , parameter PAYLOAD_BITS          = 32
    , parameter NUM_LEAF_BITS         = 3
    , parameter NUM_PORT_BITS         = 4
    , parameter NUM_ADDR_BITS         = 7
    , parameter NUM_IN_PORTS          = 1
    , parameter NUM_OUT_PORTS         = 1
    , parameter NUM_BRAM_ADDR_BITS    = 7
    , parameter FREESPACE_UPDATE_SIZE = 64
    , localparam OUT_PORTS_REG_BITS   = NUM_LEAF_BITS + NUM_PORT_BITS + NUM_ADDR_BITS + NUM_BRAM_ADDR_BITS + 3
    , localparam IN_PORTS_REG_BITS    = NUM_LEAF_BITS + NUM_PORT_BITS
    , localparam REG_CONTROL_BITS     = OUT_PORTS_REG_BITS * NUM_OUT_PORTS + IN_PORTS_REG_BITS * NUM_IN_PORTS
    )(
      input clk
    , input reset

    //data from BFT
    , input [PACKET_BITS-1:0]                 i_bft_data

    //data to BFT
    , output [PACKET_BITS-1:0]                o_bft_data
    , input                                   i_bft_ready

    //data to USER
    , output [PAYLOAD_BITS*NUM_IN_PORTS-1:0]  o_user_data
    , output [NUM_IN_PORTS-1:0]               o_user_valid
    , input  [NUM_IN_PORTS-1:0]               i_user_ready

    //data from USER
    , output [NUM_OUT_PORTS-1:0]              o_user_ready
    , input  [NUM_OUT_PORTS-1:0]              i_user_valid
    , input  [PAYLOAD_BITS*NUM_OUT_PORTS-1:0] i_user_data
);


wire [PACKET_BITS-1:0]      stream_ExCtrl2sfc;
wire [PACKET_BITS-1:0]      stream_sfc2ExCtrl;
wire [PACKET_BITS-1:0]      config_packet;
wire [REG_CONTROL_BITS-1:0] control_reg;
wire                        resend_ExCtrl2sfc;

packet_parser # (
      .PACKET_BITS           (PACKET_BITS          )
    , .NUM_LEAF_BITS         (NUM_LEAF_BITS        )
    , .NUM_PORT_BITS         (NUM_PORT_BITS        )
) pkt_ps (
      .clk                   (clk                  )
    , .reset                 (reset                )

    , .o_bft_data            (o_bft_data           )
    , .i_bft_ready           (i_bft_ready          )
    , .i_bft_data            (i_bft_data           )

    , .o_config_packet       (config_packet        )
    , .o_bft_ready           (resend_ExCtrl2sfc    )
    , .o_data_packet         (stream_ExCtrl2sfc    )
    , .i_data_packet         (stream_sfc2ExCtrl    )

);


control_registers # (
      .PACKET_BITS           (PACKET_BITS          )
    , .NUM_LEAF_BITS         (NUM_LEAF_BITS        )
    , .NUM_PORT_BITS         (NUM_PORT_BITS        )
    , .NUM_ADDR_BITS         (NUM_ADDR_BITS        )
    , .PAYLOAD_BITS          (PAYLOAD_BITS         )
    , .NUM_IN_PORTS          (NUM_IN_PORTS         )
    , .NUM_OUT_PORTS         (NUM_OUT_PORTS        )
    , .NUM_BRAM_ADDR_BITS    (NUM_BRAM_ADDR_BITS   )
) ctrl_regs (
      .o_control_reg         (control_reg          )
    , .clk                   (clk                  )
    , .reset                 (reset                )
    , .i_config_packet       (config_packet        )
);

data_ports #(
      .PACKET_BITS           (PACKET_BITS          )
    , .NUM_LEAF_BITS         (NUM_LEAF_BITS        )
    , .NUM_PORT_BITS         (NUM_PORT_BITS        )
    , .NUM_ADDR_BITS         (NUM_ADDR_BITS        )
    , .PAYLOAD_BITS          (PAYLOAD_BITS         )
    , .NUM_IN_PORTS          (NUM_IN_PORTS         )
    , .NUM_OUT_PORTS         (NUM_OUT_PORTS        )
    , .NUM_BRAM_ADDR_BITS    (NUM_BRAM_ADDR_BITS   )
    , .FREESPACE_UPDATE_SIZE (FREESPACE_UPDATE_SIZE)
) dp (
      .i_bft_ready           (resend_ExCtrl2sfc    )
    , .clk                   (clk                  )
    , .reset                 (reset                )
    , .i_stream              (stream_ExCtrl2sfc    )
    , .o_stream              (stream_sfc2ExCtrl    )
    , .i_control_reg         (control_reg          )

    , .o_user_data           (o_user_data          )
    , .o_user_valid          (o_user_valid         )
    , .i_user_ready          (i_user_ready         )

    , .i_user_data           (i_user_data          )
    , .i_user_valid          (i_user_valid         )
    , .o_user_ready          (o_user_ready         )
);

endmodule
