`timescale 1 ns / 1 ps

module kernel3_gmem_C_m_axi_fifo
#(parameter
    MEM_STYLE   = "shiftreg",
    DATA_WIDTH = 32,
    ADDR_WIDTH = 5,
    DEPTH      = 32
) (
    // system signal
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  clk_en,
    // write
    output wire                  if_full_n,
    input  wire                  if_write,
    input  wire [DATA_WIDTH-1:0] if_din,
    // read
    output wire                  if_empty_n,
    input  wire                  if_read,
    output wire [DATA_WIDTH-1:0] if_dout,
    output wire [ADDR_WIDTH:0]   if_num_data_valid);
//------------------------Local signal-------------------
    wire                  push;
    wire                  pop;
    reg                   full_n = 1'b1;
    reg                   empty_n = 1'b0;
    reg                   dout_vld = 1'b0;
    reg  [ADDR_WIDTH:0]   mOutPtr = 1'b0;
//------------------------Instantiation------------------
    generate
    if ((MEM_STYLE == "shiftreg") || (DEPTH == 1)) begin
        reg  [ADDR_WIDTH-1:0] raddr = 1'b0;
        kernel3_gmem_C_m_axi_srl
        #(  .DATA_WIDTH     (DATA_WIDTH),
            .ADDR_WIDTH     (ADDR_WIDTH),
            .DEPTH          (DEPTH))
        U_fifo_srl(
            .clk            (clk),
            .reset          (reset),
            .clk_en         (clk_en),
            .we             (push),
            .din            (if_din),
            .raddr          (raddr),
            .re             (pop),
            .dout           (if_dout)
        );
        // raddr
        always @(posedge clk) begin
            if (reset == 1'b1)
                raddr <= 1'b0;
            else if (clk_en) begin
                if (push & ~pop & empty_n)
                    raddr <= raddr + 1'b1;
                else if (~push & pop && raddr != 0)
                    raddr <= raddr - 1'b1;
            end
        end
    end else begin
        reg  [ADDR_WIDTH-1:0] waddr = 1'b0;
        reg  [ADDR_WIDTH-1:0] raddr = 1'b0;
        wire [ADDR_WIDTH-1:0] wnext;
        wire [ADDR_WIDTH-1:0] rnext;
        kernel3_gmem_C_m_axi_mem
        #(  .MEM_STYLE      (MEM_STYLE),
            .DATA_WIDTH     (DATA_WIDTH),
            .ADDR_WIDTH     (ADDR_WIDTH),
            .DEPTH          (DEPTH))
        U_fifo_mem(
            .clk            (clk),
            .reset          (reset),
            .clk_en         (clk_en),
            .we             (push),
            .waddr          (waddr),
            .din            (if_din),
            .raddr          (rnext),
            .re             (pop),
            .dout           (if_dout)
        );
        assign wnext =  !push                ? waddr :
                        (waddr == DEPTH - 2) ? 1'b0  :
                        waddr + 1'b1;
        assign rnext =  !pop                 ? raddr :
                        (raddr == DEPTH - 2) ? 1'b0  :
                        raddr + 1'b1;
        // waddr
        always @(posedge clk) begin
            if (reset == 1'b1)
                waddr <= 1'b0;
            else if (clk_en)
                waddr <= wnext;
        end
        // raddr
        always @(posedge clk) begin
            if (reset == 1'b1)
                raddr <= 1'b0;
            else if (clk_en)
                raddr <= rnext;
        end
    end
    endgenerate
//------------------------Body---------------------------
    assign if_num_data_valid = dout_vld ? mOutPtr + 1'b1 : 'b0;
    generate if (DEPTH == 1) begin
        assign if_full_n  = !dout_vld;
        assign if_empty_n = dout_vld;
        assign push = !dout_vld & if_write;
        assign pop  = !dout_vld & if_write;

    end else begin
        assign if_full_n  = full_n;
        assign if_empty_n = dout_vld;
        assign push = full_n & if_write;
        assign pop  = empty_n & (if_read | ~dout_vld);
        // mOutPtr
        always @(posedge clk) begin
            if (reset == 1'b1)
                mOutPtr <= 'b0;
            else if (clk_en)
                if (push & ~pop)
                    mOutPtr <= mOutPtr + 1'b1;
                else if (~push & pop)
                    mOutPtr <= mOutPtr - 1'b1;
        end
        // full_n
        always @(posedge clk) begin
            if (reset == 1'b1)
                full_n <= 1'b1;
            else if (clk_en)
                if (push & ~pop)
                    full_n <= (mOutPtr != DEPTH - 2);
                else if (~push & pop)
                    full_n <= 1'b1;
        end
        // empty_n
        always @(posedge clk)
        begin
            if (reset)
                empty_n <= 1'b0;
            else if (clk_en) begin
                if (push & ~pop)
                    empty_n <= 1'b1;
                else if (~push & pop)
                    empty_n <= (mOutPtr != 1'b1);
            end
        end
    end
    endgenerate
    // dout_vld
    always @(posedge clk) begin
        if (reset == 1'b1)
            dout_vld <= 1'b0;
        else if (clk_en)
            if (pop)
                dout_vld <= 1'b1;
            else if (if_read)
                dout_vld <= 1'b0;
    end
endmodule
