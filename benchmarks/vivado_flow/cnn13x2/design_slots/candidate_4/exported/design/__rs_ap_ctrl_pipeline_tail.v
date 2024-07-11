`timescale 1 ns / 1 ps
   // __rs_relay_station
// make the module interface FIFO-like to simplify later codegen
// The ap_start signal must remain High until ap_ready goes High. Once ap_ready goes
// High:
// => If ap_start remains High the design will start the next transaction.
// => If ap_start is taken Low, the design will complete the current transaction and
// halt operation.
// Since we are pipeline the ap_ready and ap_start, there will be a delay between when
// ap_ready is first asserted and when ap_start was dropped.
// This module ensures that the ap_start exposed to the sink will become low in the next
// cycle after ap_ready is high.
// The tradeoff is that there will be a cooling period of GRACE_PERIOD cycles before
// the sink module can be triggerred again. However, this generally will not affect
// the design performance at all in dataflow designs.
module __rs_ap_ctrl_pipeline_tail #(
    parameter GRACE_PERIOD = 4,
    parameter TAIL_LEVEL = 1,
    parameter __REGION = ""
) (
  // pragma RS clk port=clk
  input wire clk,
  // pragma RS rst port=reset active=high
  input wire reset,
  // pragma RS ap-ctrl ap_start=if_write ap_ready=if_full_n
  output wire                  if_full_n,
  input  wire                  if_write,
  // read
  // pragma RS ap-ctrl ap_start=if_empty_n ap_ready=if_read
  output wire                  if_empty_n,
  input  wire                  if_read
);
    wire                  pp_if_full_n;
    wire                  pp_if_write;
    initial begin
        if (TAIL_LEVEL > 1) begin
            $display("ERROR: TAIL_LEVEL > 1 is not supported");
            $finish;
        end
    end
    // since the FSM will not register the signals, we need to intaniate a register
    // to break the combinational loop and ensure a 1 cycle delay to match other
    // pipeline templates.
    __rs_fifo_reg #(
        .DATA_WIDTH(1),
        .ENABLE_REG(TAIL_LEVEL),
        .__REGION(__REGION)
    ) tail_reg (
        .clk(clk),
        .reset(reset),
        // inbound
        .if_full_n  (if_full_n),
        .if_write   (if_write),
        .if_din     (1'b0),
        // outbound
        .if_empty_n(pp_if_write),
        .if_read   (pp_if_full_n),
        .if_dout   ()
    );
    parameter STATE_IDLE = 2'b00;
    parameter STATE_HOLDING = 2'b01;
    reg [1:0] state = STATE_IDLE;
    // the width is more than useful, vivado will opt away
    reg [GRACE_PERIOD-1: 0] counter;
    wire ap_ready_hold = state == STATE_HOLDING;
    wire ap_start_from_upstream = pp_if_write;
    wire ap_ready_from_downstream = if_read;
    // when ap_ready is being held, disable the ap_start to downstream
    wire ap_start_to_downstream = ap_start_from_upstream & (~ap_ready_hold);
    assign if_empty_n = ap_start_to_downstream;
    // pass the original (not held) ap_ready to upstream
    wire ap_ready_to_upstream = ap_ready_from_downstream;
    assign pp_if_full_n = ap_ready_to_upstream;
    always @(posedge clk) begin
        if (reset) begin
            state <= STATE_IDLE;
            counter <= 0;
        end
        else if (state == STATE_IDLE) begin
            if(ap_ready_from_downstream) begin
                state <= STATE_HOLDING;
                counter <= 1;
            end
        end
        else if(state == STATE_HOLDING) begin
            // reset the counter if ap_ready asserted again
            if (ap_ready_from_downstream) begin
                $display("WARNING: ap_ready asserted again during hold");
                counter <= 1;
            end
            // hold finished
            else if (counter == GRACE_PERIOD) begin
                state <= STATE_IDLE;
                counter <= 0;
            end
            // holding
            else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
