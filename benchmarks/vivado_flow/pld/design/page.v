module page(
    input wire clk,
    input wire [48 : 0] din_leaf_bft2interface,
    output wire [48 : 0] dout_leaf_interface2bft,
    input wire resend,
    input wire reset
    );

wire [31:0] dout_leaf_interface2user_1;
wire vld_interface2user_1;
wire ack_user2interface_1;
wire [31:0] din_leaf_user2interface_1;
wire vld_user2interface_1;
wire ack_interface2user_1;

leaf_interface #(
      .PACKET_BITS           (49                          )
    , .PAYLOAD_BITS          (32                          )
    , .NUM_LEAF_BITS         (5                           )
    , .NUM_PORT_BITS         (4                           )
    , .NUM_ADDR_BITS         (7                           )
    , .NUM_IN_PORTS          (1                           )
    , .NUM_OUT_PORTS         (1                           )
    , .NUM_BRAM_ADDR_BITS    (7                           )
    , .FREESPACE_UPDATE_SIZE (64                          )
)leaf_interface_inst(
      .clk                   (clk                         )
    , .reset                 (reset                       )
    , .i_bft_data            (din_leaf_bft2interface      )
    , .o_bft_data            (dout_leaf_interface2bft     )
    , .o_user_data           ({dout_leaf_interface2user_1})
    , .o_user_valid          ({vld_interface2user_1}      )
    , .i_user_ready          ({ack_user2interface_1}      )
    , .o_user_ready          ({ack_interface2user_1}      )
    , .i_user_valid          ({vld_user2interface_1}      )
    , .i_user_data           ({din_leaf_user2interface_1} )
    , .i_bft_ready           (resend                      )
);
user_kernel user_kernel_inst(
      .ap_clk                (clk                         )
    , .ap_rst                (~reset                      )
    , .ap_start              (1'b1                        )
    , .ap_done               (                            )
    , .ap_idle               (                            )
    , .Input_1_V_V           (dout_leaf_interface2user_1  )
    , .Input_1_V_V_ap_vld    (vld_interface2user_1        )
    , .Input_1_V_V_ap_ack    (ack_user2interface_1        )
    , .Output_1_V_V          (din_leaf_user2interface_1   )
    , .Output_1_V_V_ap_vld   (vld_user2interface_1        )
    , .Output_1_V_V_ap_ack   (ack_interface2user_1        )
    , .ap_ready              (                            )
);


endmodule
