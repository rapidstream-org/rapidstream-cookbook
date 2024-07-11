`timescale 1 ns / 1 ps

module kernel3_gmem_C_m_axi_throttle
#(parameter
    CONSERVATIVE   = 0,
    USED_FIX       = 0,
    FIX_VALUE      = 4,
    ADDR_WIDTH     = 32,
    DATA_WIDTH     = 32,
    DEPTH          = 16,
    MAXREQS        = 16,
    AVERAGE_MODE   = 0
)(
    input  wire                      clk,
    input  wire                      reset,
    input  wire                      clk_en,
    input  wire [ADDR_WIDTH-1:0]     in_TOP_AWADDR,
    input  wire [7:0]                in_TOP_AWLEN,
    input  wire                      in_TOP_AWVALID,
    output wire                      out_TOP_AWREADY,
    input  wire [DATA_WIDTH-1:0]     in_TOP_WDATA,
    input  wire [DATA_WIDTH/8-1:0]   in_TOP_WSTRB,
    input  wire                      in_TOP_WLAST,
    input  wire                      in_TOP_WVALID,
    output wire                      out_TOP_WREADY,
    output wire [ADDR_WIDTH-1:0]     out_BUS_AWADDR,
    output wire [7:0]                out_BUS_AWLEN,
    output wire                      out_BUS_AWVALID,
    input  wire                      in_BUS_AWREADY,
    output wire [DATA_WIDTH-1:0]     out_BUS_WDATA,
    output wire [DATA_WIDTH/8-1:0]   out_BUS_WSTRB,
    output wire                      out_BUS_WLAST,
    output wire                      out_BUS_WVALID,
    input  wire                      in_BUS_WREADY);
    function integer log2;
        input integer x;
        integer n, m;
    begin
        n = 0;
        m = 1;
        while (m < x) begin
            n = n + 1;
            m = m * 2;
        end
        log2 = n;
    end
    endfunction
// aggressive mode
    generate
    if (CONSERVATIVE == 0) begin
        localparam threshold = (USED_FIX)? FIX_VALUE-1 : 0;
        wire                req_en;
        wire                handshake;
        wire  [7:0]         load_init;
        reg   [8:0]         throttl_cnt;
        // AW Channel
        assign out_BUS_AWADDR = in_TOP_AWADDR;
        assign out_BUS_AWLEN  = in_TOP_AWLEN;
        // W Channel
        assign out_BUS_WDATA  = in_TOP_WDATA;
        assign out_BUS_WSTRB  = in_TOP_WSTRB;
        assign out_BUS_WLAST  = in_TOP_WLAST;
        assign out_BUS_WVALID = in_TOP_WVALID & (throttl_cnt > 0);
        assign out_TOP_WREADY = in_BUS_WREADY & (throttl_cnt > 0);
        if (USED_FIX) begin
            assign load_init = FIX_VALUE-1;
            assign handshake = 1'b1;
        end else if (AVERAGE_MODE) begin
            assign load_init = in_TOP_AWLEN;
            assign handshake = 1'b1;
        end else begin
            assign load_init = in_TOP_AWLEN;
            assign handshake = out_BUS_WVALID & in_BUS_WREADY;
        end
        assign out_BUS_AWVALID = in_TOP_AWVALID & req_en;
        assign out_TOP_AWREADY = in_BUS_AWREADY & req_en;
        assign req_en = (throttl_cnt == 0) | (throttl_cnt == 1 & handshake);
        always @(posedge clk)
        begin
            if (reset)
                throttl_cnt <= 0;
            else if (clk_en) begin
                if (in_TOP_AWLEN >= threshold && req_en && in_TOP_AWVALID && in_BUS_AWREADY)
                    throttl_cnt <= load_init + 1'b1; //load
                else if (throttl_cnt > 0 && handshake)
                    throttl_cnt <= throttl_cnt - 1'b1;
            end
        end
    end
// conservative mode
    else begin
        localparam CNT_WIDTH = ((DEPTH < 4)? 2 : log2(DEPTH)) + 1;
        // Instantiation for reg slice for AW channel
        wire                        rs_req_ready;
        wire                        rs_req_valid;
        wire [ADDR_WIDTH + 7 : 0]   rs_req_in;
        wire [ADDR_WIDTH + 7 : 0]   rs_req_out;
        kernel3_gmem_C_m_axi_reg_slice #(
            .DATA_WIDTH     (ADDR_WIDTH + 8)
        ) rs_req (
            .clk            (clk),
            .reset          (reset),
            .s_data         (rs_req_in),
            .s_valid        (rs_req_valid),
            .s_ready        (rs_req_ready),
            .m_data         (rs_req_out),
            .m_valid        (out_BUS_AWVALID),
            .m_ready        (in_BUS_AWREADY));
        wire  [DATA_WIDTH + DATA_WIDTH/8 : 0]   data_in;
        wire  [DATA_WIDTH + DATA_WIDTH/8 : 0]   data_out;
        wire  [ADDR_WIDTH + 7 : 0]              req_in;
        reg                                     req_en;
        wire                                    data_en;
        wire                                    fifo_valid;
        wire                                    read_fifo;
        wire                                    req_fifo_valid;
        wire                                    read_req;
        wire                                    data_push;
        wire                                    data_pop;
        reg                                     flying_req;
        reg   [CNT_WIDTH-1 : 0]                 last_cnt;
        //AW Channel
        assign req_in   = {in_TOP_AWLEN, in_TOP_AWADDR};
        assign out_BUS_AWADDR = rs_req_out[ADDR_WIDTH-1 : 0];
        assign out_BUS_AWLEN  = rs_req_out[ADDR_WIDTH+7 : ADDR_WIDTH];
        assign rs_req_valid = req_fifo_valid & req_en;
        assign read_req      = rs_req_ready & req_en;
        always @(*)
        begin
            if (~flying_req & data_en)
                req_en <= 1;
            else if (flying_req & (out_BUS_WLAST & data_pop) & (last_cnt[CNT_WIDTH-1:1] != 0))
                req_en <= 1;
            else
                req_en <= 0;
        end
        always @(posedge clk)
        begin
            if (reset)
                flying_req <= 0;
            else if (clk_en) begin
                if (rs_req_valid & rs_req_ready)
                    flying_req <= 1;
                else if (out_BUS_WLAST & data_pop)
                    flying_req <= 0;
            end
        end
        kernel3_gmem_C_m_axi_fifo #(
            .DATA_WIDTH     (ADDR_WIDTH + 8),
            .ADDR_WIDTH     (log2(MAXREQS)),
            .DEPTH          (MAXREQS)
        ) req_fifo (
            .clk            (clk),
            .reset          (reset),
            .clk_en         (clk_en),
            .if_full_n      (out_TOP_AWREADY),
            .if_write       (in_TOP_AWVALID),
            .if_din         (req_in),
            .if_empty_n     (req_fifo_valid),
            .if_read        (read_req),
            .if_dout        (rs_req_in),
            .if_num_data_valid());
        //W Channel
        assign data_in  = {in_TOP_WLAST, in_TOP_WSTRB, in_TOP_WDATA};
        assign out_BUS_WDATA = data_out[DATA_WIDTH-1 : 0];
        assign out_BUS_WSTRB = data_out[DATA_WIDTH+DATA_WIDTH/8-1 : DATA_WIDTH];
        assign out_BUS_WLAST = data_out[DATA_WIDTH+DATA_WIDTH/8];
        assign out_BUS_WVALID = fifo_valid & data_en & flying_req;
        assign data_en   = last_cnt != 0;
        assign data_push = in_TOP_WVALID & out_TOP_WREADY;
        assign data_pop  = fifo_valid & read_fifo;
        assign read_fifo = in_BUS_WREADY & data_en & flying_req;
        always @(posedge clk)
        begin
            if (reset)
                last_cnt <= 0;
            else if (clk_en) begin
                if ((in_TOP_WLAST & data_push) && ~(out_BUS_WLAST & data_pop))
                    last_cnt <= last_cnt + 1;
                else if (~(in_TOP_WLAST & data_push) && (out_BUS_WLAST & data_pop))
                    last_cnt <= last_cnt - 1;
            end
        end

        kernel3_gmem_C_m_axi_fifo #(
            .DATA_WIDTH     (DATA_WIDTH + DATA_WIDTH/8 + 1),
            .ADDR_WIDTH     (log2(DEPTH)),
            .DEPTH          (DEPTH)
        ) data_fifo (
            .clk            (clk),
            .reset          (reset),
            .clk_en         (clk_en),
            .if_full_n      (out_TOP_WREADY),
            .if_write       (in_TOP_WVALID),
            .if_din         (data_in),
            .if_empty_n     (fifo_valid),
            .if_read        (read_fifo),
            .if_dout        (data_out),
            .if_num_data_valid());
        end
    endgenerate
endmodule
