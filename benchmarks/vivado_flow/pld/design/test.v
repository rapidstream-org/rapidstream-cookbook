`timescale 1 ns / 1 ps

module test();

reg ap_clk;
reg ap_rst_n;
reg ap_start;

wire [63:0]  Output_1_V_TDATA;
wire         Output_1_V_TVALID;
wire         Output_1_V_TREADY;
wire [511:0] Output_2_V_TDATA;
wire         Output_2_V_TVALID;
wire         Output_2_V_TREADY;

wire [63:0]  dout1;
wire         vld_out1;
wire         rdy_out1;

wire [511:0] dout2;
wire         vld_out2;
wire         rdy_out2;

assign rdy_out1 = 1'b1;
assign rdy_out2 = 1'b1;

wire ap_done;


data_gen i1(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .Output_1_V_TDATA(Output_1_V_TDATA),
    .Output_1_V_TVALID(Output_1_V_TVALID),
    .Output_1_V_TREADY(Output_1_V_TREADY),
    .Output_2_V_TDATA(Output_2_V_TDATA),
    .Output_2_V_TVALID(Output_2_V_TVALID),
    .Output_2_V_TREADY(Output_2_V_TREADY)
);

dut i2(
    .Loop_VITIS_LOOP_31_1_proc1_U0_v1_buffer_V_din(Output_1_V_TDATA),
    .Loop_VITIS_LOOP_31_1_proc1_U0_v1_buffer_V_write(Output_1_V_TVALID),
    .v1_buffer_V_full_n(Output_1_V_TREADY),
    .Loop_VITIS_LOOP_35_3_proc3_U0_v2_buffer_V_din(Output_2_V_TDATA),
    .Loop_VITIS_LOOP_35_3_proc3_U0_v2_buffer_V_write(Output_2_V_TVALID),
    .v2_buffer_V_full_n(Output_2_V_TREADY),
    .v1_buffer_V_dout(dout1),
    .v1_buffer_V_empty_n(vld_out1),
    .Loop_VITIS_LOOP_32_2_proc2_U0_v1_buffer_V_read(rdy_out1),
    .v2_buffer_V_dout(dout2),
    .v2_buffer_V_empty_n(vld_out2),
    .Loop_VITIS_LOOP_36_4_proc4_U0_v2_buffer_V_read(rdy_out2),
    .ap_rst_n(ap_rst_n),
    .ap_clk(ap_clk)
);

always #5 ap_clk = ~ap_clk;

initial begin

    ap_start = 0;
    ap_clk = 0;
    ap_rst_n = 0;
    #1000
    ap_rst_n = 1;
    #1007
    ap_start = 1;
    #10
    ap_start = 0;
    #1_000_000_000
    $stop();

end

wire [31:0] in_cnt, out_cnt;

counter1 #(
    .CNT_WIDTH(32)
)cnt1(
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .valid(Output_2_V_TVALID),
    .ready(Output_2_V_TREADY),
    .cnt1(in_cnt)
);


counter1 #(
    .CNT_WIDTH(32)
)cnt2(
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .valid(vld_out2),
    .ready(rdy_out2),
    .cnt1(out_cnt)
);



endmodule
