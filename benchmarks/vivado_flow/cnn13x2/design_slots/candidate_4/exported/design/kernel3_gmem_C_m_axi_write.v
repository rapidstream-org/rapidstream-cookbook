`timescale 1 ns / 1 ps

module kernel3_gmem_C_m_axi_write
#(parameter
    CONSERVATIVE              = 0,
    C_M_AXI_ID_WIDTH          = 1,
    C_M_AXI_AWUSER_WIDTH      = 1,
    C_M_AXI_WUSER_WIDTH       = 1,
    C_M_AXI_BUSER_WIDTH       = 1,
    C_USER_VALUE              = 1'b0,
    C_PROT_VALUE              = 3'b000,
    C_CACHE_VALUE             = 4'b0011,
    BUS_ADDR_WIDTH            = 32,
    BUS_DATA_WIDTH            = 32,
    NUM_WRITE_OUTSTANDING     = 2,
    MAX_WRITE_BURST_LENGTH    = 16
)(
    // system signal
    input  wire                             ACLK,
    input  wire                             ARESET,
    input  wire                             ACLK_EN,
    // write address channel
    output wire [C_M_AXI_ID_WIDTH-1:0]      out_BUS_AWID,
    output wire [2:0]                       out_BUS_AWSIZE,
    output wire [1:0]                       out_BUS_AWBURST,
    output wire [1:0]                       out_BUS_AWLOCK,
    output wire [3:0]                       out_BUS_AWCACHE,
    output wire [2:0]                       out_BUS_AWPROT,
    output wire [3:0]                       out_BUS_AWQOS,
    output wire [3:0]                       out_BUS_AWREGION,
    output wire [C_M_AXI_AWUSER_WIDTH-1:0]  out_BUS_AWUSER,
    output wire [BUS_ADDR_WIDTH-1:0]        out_BUS_AWADDR,
    output wire [7:0]                       out_BUS_AWLEN,
    output wire                             out_BUS_AWVALID,
    input  wire                             in_BUS_AWREADY,
    // write data channel
    output wire [C_M_AXI_ID_WIDTH-1:0]      out_BUS_WID,
    output wire [C_M_AXI_WUSER_WIDTH-1:0]   out_BUS_WUSER,
    output wire [BUS_DATA_WIDTH-1:0]        out_BUS_WDATA,
    output wire [BUS_DATA_WIDTH/8-1:0]      out_BUS_WSTRB,
    output wire                             out_BUS_WLAST,
    output wire                             out_BUS_WVALID,
    input  wire                             in_BUS_WREADY,
    // write response channel
    input  wire [C_M_AXI_ID_WIDTH-1:0]      in_BUS_BID,
    input  wire [1:0]                       in_BUS_BRESP,
    input  wire [C_M_AXI_BUSER_WIDTH-1:0]   in_BUS_BUSER,
    input  wire                             in_BUS_BVALID,
    output wire                             out_BUS_BREADY,
    // write request
    input  wire [BUS_ADDR_WIDTH-1:0]        in_HLS_AWADDR,
    input  wire [31:0]                      in_HLS_AWLEN,
    input  wire                             in_HLS_AWVALID,
    output wire                             out_HLS_AWREADY,
    input  wire [BUS_DATA_WIDTH-1:0]        in_HLS_WDATA,
    input  wire [BUS_DATA_WIDTH/8-1:0]      in_HLS_WSTRB,
    input  wire                             in_HLS_WVALID,
    output wire                             out_HLS_WREADY,
    output wire                             out_HLS_BVALID,
    input  wire                             in_HLS_BREADY);
//------------------------Parameter----------------------
    localparam
        BUS_DATA_BYTES  = BUS_DATA_WIDTH / 8,
        BUS_ADDR_ALIGN  = log2(BUS_DATA_BYTES),
        NUM_WRITE_WIDTH = log2(MAX_WRITE_BURST_LENGTH),
        BOUNDARY_BEATS  = {12-BUS_ADDR_ALIGN{1'b1}};
//------------------------Task and function--------------
    function integer calc_data_width;
        input integer x;
        integer y;
    begin
        y = 8;
        while (y < x) y = y * 2;
        calc_data_width = y;
    end
    endfunction
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
//------------------------Local signal-------------------
    // AW channel
    wire                                wreq_valid;
    wire [BUS_ADDR_WIDTH - 1:0]         tmp_addr;
    wire [31:0]                         tmp_len;
    wire [7:0]                          awlen_tmp;
    wire [BUS_ADDR_WIDTH - 1:0]         awaddr_tmp;
    reg  [BUS_ADDR_WIDTH - 1:0]         start_addr;
    reg  [BUS_ADDR_WIDTH - 1:0]         end_addr;
    wire [BUS_ADDR_WIDTH - 1:0]         sect_addr;
    reg  [BUS_ADDR_WIDTH - 1:0]         sect_addr_buf;
    wire [11 - BUS_ADDR_ALIGN:0]        start_to_4k;
    wire [11 - BUS_ADDR_ALIGN:0]        sect_len;
    reg  [11 - BUS_ADDR_ALIGN:0]        sect_len_buf;
    reg  [11 - BUS_ADDR_ALIGN:0]        beat_len;
    wire                                aw2b_info;
    reg  [BUS_ADDR_WIDTH - 13:0]        sect_cnt;
    wire                                fifo_burst_w;
    wire                                fifo_resp_w;
    wire [BUS_ADDR_WIDTH - 1:0]         AWADDR_Dummy;
    wire [7:0]                          AWLEN_Dummy;
    reg                                 AWVALID_Dummy;
    wire                                AWREADY_Dummy;
    wire                                ready_for_sect;
    wire                                next_wreq;
    wire                                ready_for_wreq;
    reg                                 wreq_handling;
    wire                                first_sect;
    reg                                 last_sect_buf;
    wire                                last_sect;
    wire                                next_sect;
    // W channel
    wire                                next_data;
    wire                                data_valid;
    wire                                data_ready;
    reg  [BUS_DATA_WIDTH - 1:0]         data_buf;
    reg  [BUS_DATA_BYTES - 1:0]         strb_buf;
    wire                                ready_for_data;
    reg  [7:0]                          len_cnt;
    wire [7:0]                          burst_len;
    wire                                fifo_burst_ready;
    wire                                next_burst;
    wire                                burst_valid;
    reg                                 WVALID_Dummy;
    wire                                WREADY_Dummy;
    reg                                 WLAST_Dummy;
    //B channel
    wire                                next_resp;
    wire                                last_resp;
    wire                                fifo_resp_ready;
    wire                                need_wrsp;
    wire                                resp_valid;
    wire                                resp_ready;
//------------------------AW channel begin---------------
//------------------------Instantiation------------------
    kernel3_gmem_C_m_axi_reg_slice #(
        .DATA_WIDTH     (BUS_ADDR_WIDTH + 32)
    ) rs_wreq (
        .clk            (ACLK),
        .reset          (ARESET),
        .s_data         ({in_HLS_AWLEN, in_HLS_AWADDR}),
        .s_valid        (in_HLS_AWVALID),
        .s_ready        (out_HLS_AWREADY),
        .m_data         ({tmp_len, tmp_addr}),
        .m_valid        (wreq_valid),
        .m_ready        (next_wreq));
//------------------------Body---------------------------
    assign ready_for_wreq = last_sect & next_sect | ~wreq_handling;
    assign next_wreq      = wreq_valid & ready_for_wreq;
    always @(posedge ACLK)
    begin
        if (ARESET) begin
            start_addr <= 0;
            end_addr   <= 0;
            beat_len   <= 0;
        end
        else if (ACLK_EN) begin
            if (next_wreq) begin
                start_addr <= tmp_addr;
                end_addr   <= tmp_addr + tmp_len;
                beat_len   <= (tmp_len[11:0] + tmp_addr[BUS_ADDR_ALIGN-1:0]) >> BUS_ADDR_ALIGN;
            end
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            wreq_handling <= 1'b0;
        else if (ACLK_EN) begin
            if (wreq_valid && ~wreq_handling)
                wreq_handling <= 1'b1;
            else if (~wreq_valid && last_sect && next_sect)
                wreq_handling <= 1'b0;
        end
    end
    // 4k boundary
    assign first_sect = (sect_cnt == start_addr[BUS_ADDR_WIDTH-1:12]);
    assign last_sect  = (sect_cnt == end_addr[BUS_ADDR_WIDTH-1:12]);
    assign next_sect  = wreq_handling && ready_for_sect;
    assign sect_addr  = (first_sect)? start_addr : {sect_cnt, {12{1'b0}}};
    assign start_to_4k = BOUNDARY_BEATS - start_addr[11:BUS_ADDR_ALIGN];
    assign sect_len    = ( first_sect &&  last_sect)? beat_len :
                         ( first_sect && ~last_sect)? start_to_4k:
                         (~first_sect &&  last_sect)? end_addr[11:BUS_ADDR_ALIGN] :
                                                      BOUNDARY_BEATS;
    always @(posedge ACLK)
    begin
        if (ARESET)
            sect_cnt <= 0;
        else if (ACLK_EN) begin
            if (next_wreq)
                sect_cnt <= tmp_addr[BUS_ADDR_WIDTH-1:12];
            else if (next_sect)
                sect_cnt <= sect_cnt + 1;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET) begin
            sect_addr_buf <= 0;
            sect_len_buf <= 0;
            last_sect_buf <= 1'b0;
        end
        else if (ACLK_EN) begin
            if (next_sect) begin
                sect_addr_buf <= sect_addr;
                sect_len_buf <= sect_len;
                last_sect_buf <= last_sect;
            end
        end
    end
    // burst converter
    assign out_BUS_AWID     = 0;
    assign out_BUS_AWSIZE   = BUS_ADDR_ALIGN;
    assign out_BUS_AWBURST  = 2'b01;
    assign out_BUS_AWLOCK   = 2'b00;
    assign out_BUS_AWCACHE  = C_CACHE_VALUE;
    assign out_BUS_AWPROT   = C_PROT_VALUE;
    assign out_BUS_AWUSER   = C_USER_VALUE;
    assign out_BUS_AWQOS    = 4'b0000;
    assign out_BUS_AWREGION = 4'b0000;
    generate
    if (BUS_DATA_BYTES >= 4096/MAX_WRITE_BURST_LENGTH) begin : must_one_burst
        assign AWADDR_Dummy   = {sect_addr_buf[BUS_ADDR_WIDTH - 1:BUS_ADDR_ALIGN], {BUS_ADDR_ALIGN{1'b0}}};
        assign AWLEN_Dummy    = sect_len_buf;
        assign ready_for_sect = ~(AWVALID_Dummy && ~AWREADY_Dummy) && fifo_burst_ready && fifo_resp_ready;
        always @(posedge ACLK)
        begin
            if (ARESET)
                AWVALID_Dummy <= 1'b0;
            else if (ACLK_EN) begin
                if (next_sect)
                    AWVALID_Dummy <= 1'b1;
                else if (~next_sect && AWREADY_Dummy)
                    AWVALID_Dummy <= 1'b0;
            end
        end
        assign fifo_resp_w = next_sect;
        assign aw2b_info   = last_sect;
        assign fifo_burst_w = next_sect;
        assign awaddr_tmp   = sect_addr[BUS_ADDR_WIDTH - 1:0];
        assign awlen_tmp    = sect_len;
    end
    else begin : could_multi_bursts
        reg  [BUS_ADDR_WIDTH - 1:0]                         awaddr_buf;
        reg  [7:0]                                          awlen_buf;
        reg  [11 - NUM_WRITE_WIDTH - BUS_ADDR_ALIGN : 0]    loop_cnt;
        reg                                                 sect_handling;
        wire                                                last_loop;
        wire                                                next_loop;
        wire                                                ready_for_loop;
        assign AWADDR_Dummy   = awaddr_buf;
        assign AWLEN_Dummy    = awlen_buf;
        assign last_loop      = (loop_cnt == sect_len_buf[11 - BUS_ADDR_ALIGN : NUM_WRITE_WIDTH]);
        assign next_loop      = sect_handling && ready_for_loop;
        assign ready_for_loop = ~(AWVALID_Dummy && ~AWREADY_Dummy) && fifo_burst_ready && fifo_resp_ready;
        assign ready_for_sect = ~(sect_handling && ~(last_loop && next_loop));
        always @(posedge ACLK)
        begin
            if (ARESET)
                sect_handling <= 1'b0;
            else if (ACLK_EN) begin
                if (wreq_handling && ~sect_handling)
                    sect_handling <= 1'b1;
                else if (~wreq_handling && last_loop && next_loop)
                    sect_handling <= 1'b0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                loop_cnt <= 0;
            else if (ACLK_EN) begin
                if (next_sect)
                    loop_cnt <= 0;
                else if (next_loop)
                    loop_cnt <= loop_cnt + 1;
            end
        end
        assign awaddr_tmp = (loop_cnt == 0)? sect_addr_buf[BUS_ADDR_WIDTH - 1:0] : (awaddr_buf + ((awlen_buf + 1) << BUS_ADDR_ALIGN));
        assign awlen_tmp  = (NUM_WRITE_WIDTH == 0)? 0 :
                    (last_loop)? sect_len_buf[NUM_WRITE_WIDTH - 1:0] : { NUM_WRITE_WIDTH{1'b1} };
        always @(posedge ACLK)
        begin
            if (ARESET) begin
                awaddr_buf <= 0;
                awlen_buf <= 0;
            end
            else if (ACLK_EN) begin
                if (next_loop) begin
                    awaddr_buf <= {awaddr_tmp[BUS_ADDR_WIDTH - 1:BUS_ADDR_ALIGN], {BUS_ADDR_ALIGN{1'b0}}};
                    awlen_buf <= awlen_tmp;
                end
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                AWVALID_Dummy <= 1'b0;
            else if (ACLK_EN) begin
                if (next_loop)
                    AWVALID_Dummy <= 1'b1;
                else if (~next_loop && AWREADY_Dummy)
                    AWVALID_Dummy <= 1'b0;
            end
        end
        assign fifo_resp_w = next_loop;
        assign fifo_burst_w = next_loop;
        assign aw2b_info = last_loop && last_sect_buf;
    end
    endgenerate
//------------------------AW channel end-----------------
//------------------------W channel begin----------------
//------------------------Instantiation------------------
    kernel3_gmem_C_m_axi_fifo #(
        .DATA_WIDTH     (8),
        .ADDR_WIDTH     (log2(NUM_WRITE_OUTSTANDING)),
        .DEPTH          (NUM_WRITE_OUTSTANDING)
    ) fifo_burst (
        .clk            (ACLK),
        .reset          (ARESET),
        .clk_en         (ACLK_EN),
        .if_full_n      (fifo_burst_ready),
        .if_write       (fifo_burst_w),
        .if_din         (awlen_tmp),
        .if_empty_n     (burst_valid),
        .if_read        (next_burst),
        .if_dout        (burst_len),
        .if_num_data_valid());
//------------------------Body---------------------------
    assign out_BUS_WUSER    = C_USER_VALUE;
    assign out_BUS_WID      = 0;
    assign out_HLS_WREADY   = data_ready;
    assign data_valid       = in_HLS_WVALID;
    assign data_ready       = burst_valid && ready_for_data;
    assign next_data        = data_ready && data_valid;
    assign next_burst       = (len_cnt == burst_len) && next_data;
    assign ready_for_data   = ~WVALID_Dummy || WREADY_Dummy;
    always @(posedge ACLK)
    begin
        if (ARESET) begin
            strb_buf <= 0;
            data_buf <= 0;
        end
        if (ACLK_EN) begin
            if (next_data) begin
                data_buf <= in_HLS_WDATA;
                strb_buf <= in_HLS_WSTRB;
            end
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            WVALID_Dummy <= 1'b0;
        else if (ACLK_EN) begin
            if (next_data)
                WVALID_Dummy <= 1'b1;
            else if (ready_for_data)
                WVALID_Dummy <= 1'b0;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            WLAST_Dummy <= 0;
        else if (ACLK_EN) begin
            if (next_burst)
                WLAST_Dummy <= 1;
            else if (ready_for_data)
                WLAST_Dummy <= 0;
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            len_cnt <= 0;
        else if (ACLK_EN) begin
            if (next_burst)
                len_cnt <= 0;
            else if (next_data)
                len_cnt <= len_cnt + 1;
        end
    end
//------------------------W channel end------------------
    // Write throttling unit
    kernel3_gmem_C_m_axi_throttle #(
        .CONSERVATIVE(CONSERVATIVE),
        .USED_FIX(0),
        .ADDR_WIDTH(BUS_ADDR_WIDTH),
        .DATA_WIDTH(BUS_DATA_WIDTH),
        .DEPTH(MAX_WRITE_BURST_LENGTH),
        .MAXREQS(NUM_WRITE_OUTSTANDING),
        .AVERAGE_MODE(0)
    ) wreq_throttle (
        .clk(ACLK),
        .reset(ARESET),
        .clk_en(ACLK_EN),
        // internal
        .in_TOP_AWADDR(AWADDR_Dummy),
        .in_TOP_AWLEN(AWLEN_Dummy),
        .in_TOP_AWVALID(AWVALID_Dummy),
        .out_TOP_AWREADY(AWREADY_Dummy),
        .in_TOP_WDATA(data_buf),
        .in_TOP_WSTRB(strb_buf),
        .in_TOP_WLAST(WLAST_Dummy),
        .in_TOP_WVALID(WVALID_Dummy),
        .out_TOP_WREADY(WREADY_Dummy),
        // AXI BUS
        .out_BUS_AWADDR(out_BUS_AWADDR),
        .out_BUS_AWLEN(out_BUS_AWLEN),
        .out_BUS_AWVALID(out_BUS_AWVALID),
        .in_BUS_AWREADY(in_BUS_AWREADY),
        .out_BUS_WDATA(out_BUS_WDATA),
        .out_BUS_WSTRB(out_BUS_WSTRB),
        .out_BUS_WLAST(out_BUS_WLAST),
        .out_BUS_WVALID(out_BUS_WVALID),
        .in_BUS_WREADY(in_BUS_WREADY)
    );

//------------------------B channel begin----------------
//------------------------Instantiation------------------
    kernel3_gmem_C_m_axi_reg_slice #(
        .DATA_WIDTH     (1)
    ) rs_resp (
        .clk            (ACLK),
        .reset          (ARESET),
        .s_data         (1'b1),
        .s_valid        (in_BUS_BVALID),
        .s_ready        (out_BUS_BREADY),
        .m_data         (),
        .m_valid        (resp_valid),
        .m_ready        (resp_ready));
    kernel3_gmem_C_m_axi_fifo #(
        .DATA_WIDTH     (1),
        .ADDR_WIDTH     (log2(NUM_WRITE_OUTSTANDING)),
        .DEPTH          (NUM_WRITE_OUTSTANDING)
    ) fifo_resp (
        .clk            (ACLK),
        .reset          (ARESET),
        .clk_en         (ACLK_EN),
        .if_full_n      (fifo_resp_ready),
        .if_write       (fifo_resp_w),
        .if_din         (aw2b_info),
        .if_empty_n     (need_wrsp),
        .if_read        (next_resp),
        .if_dout        (last_resp),
        .if_num_data_valid());
//------------------------Body---------------------------
    assign resp_ready = need_wrsp && (in_HLS_BREADY || (last_resp === 1'b0));
    assign next_resp  = resp_ready && resp_valid;
    assign out_HLS_BVALID = resp_valid && (last_resp === 1'b1 ) ;
//------------------------B channel end------------------
endmodule
