`timescale 1ns / 1ps
module page_8(
    input wire clk,
    input wire [49-1 : 0] din_leaf_bft2interface,
    output wire [49-1 : 0] dout_leaf_interface2bft,
    input wire resend,
    input wire reset
    );

wire [32-1 :0] dout_leaf_interface2user_2;
wire vld_interface2user_2;
wire ack_user2interface_2;
wire [32-1 :0] dout_leaf_interface2user_1;
wire vld_interface2user_1;
wire ack_user2interface_1;
wire [32-1 :0] din_leaf_user2interface_1;
wire vld_user2interface_1;
wire ack_interface2user_1;

leaf_interface #(
      .PACKET_BITS           (49                                                     )
    , .PAYLOAD_BITS          (32                                                     )
    , .NUM_LEAF_BITS         (5                                                      )
    , .NUM_PORT_BITS         (4                                                      )
    , .NUM_ADDR_BITS         (7                                                      )
    , .NUM_IN_PORTS          (2                                                      )
    , .NUM_OUT_PORTS         (1                                                      )
    , .NUM_BRAM_ADDR_BITS    (7                                                      )
    , .FREESPACE_UPDATE_SIZE (64                                                     )
)leaf_interface_inst(
      .clk                   (clk                                                    )
    , .reset                 (reset                                                  )
    , .i_bft_data            (din_leaf_bft2interface                                 )
    , .o_bft_data            (dout_leaf_interface2bft                                )
    , .i_bft_ready           (resend                                                 )
    , .o_user_data           ({dout_leaf_interface2user_2,dout_leaf_interface2user_1})
    , .o_user_valid          ({vld_interface2user_2,vld_interface2user_1}            )
    , .i_user_ready          ({ack_user2interface_2,ack_user2interface_1}            )
    , .o_user_ready          ({ack_interface2user_1}                                 )
    , .i_user_valid          ({vld_user2interface_1}                                 )
    , .i_user_data           ({din_leaf_user2interface_1}                            )
);

zculling_bot zculling_bot_inst(
      .ap_clk                (clk                                                    )
    , .ap_start              (1'b1                                                   )
    , .ap_done               (                                                       )
    , .ap_idle               (                                                       )
    , .ap_ready              (                                                       )
    , .Input_2_V_TDATA       (dout_leaf_interface2user_2                             )
    , .Input_2_V_TVALID      (vld_interface2user_2                                   )
    , .Input_2_V_TREADY      (ack_user2interface_2                                   )
    , .Input_1_V_TDATA       (dout_leaf_interface2user_1                             )
    , .Input_1_V_TVALID      (vld_interface2user_1                                   )
    , .Input_1_V_TREADY      (ack_user2interface_1                                   )
    , .Output_1_V_TDATA      (din_leaf_user2interface_1                              )
    , .Output_1_V_TVALID     (vld_user2interface_1                                   )
    , .Output_1_V_TREADY     (ack_interface2user_1                                   )
    , .ap_rst_n              (~reset                                                 )
);

endmodule
