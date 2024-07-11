`timescale 1 ns / 1 ps

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
//
module kernel3_gmem_A_m_axi_read
#(parameter
    C_M_AXI_ID_WIDTH          = 1,
    C_M_AXI_ARUSER_WIDTH      = 1,
    C_M_AXI_RUSER_WIDTH       = 1,
    C_USER_VALUE              = 1'b0,
    C_PROT_VALUE              = 3'b000,
    C_CACHE_VALUE             = 4'b0011,
    BUS_ADDR_WIDTH            = 32,
    BUS_DATA_WIDTH            = 32,
    NUM_READ_OUTSTANDING      = 2,
    MAX_READ_BURST_LENGTH     = 16
)(
    // system signal
    input  wire                            ACLK,
    input  wire                            ARESET,
    input  wire                            ACLK_EN,
    // read address channel
    output wire [C_M_AXI_ID_WIDTH-1:0]     out_BUS_ARID,
    output wire [BUS_ADDR_WIDTH-1:0]       out_BUS_ARADDR,
    output wire [7:0]                      out_BUS_ARLEN,
    output wire [2:0]                      out_BUS_ARSIZE,
    output wire [1:0]                      out_BUS_ARBURST,
    output wire [1:0]                      out_BUS_ARLOCK,
    output wire [3:0]                      out_BUS_ARCACHE,
    output wire [2:0]                      out_BUS_ARPROT,
    output wire [3:0]                      out_BUS_ARQOS,
    output wire [3:0]                      out_BUS_ARREGION,
    output wire [C_M_AXI_ARUSER_WIDTH-1:0] out_BUS_ARUSER,
    output wire                            out_BUS_ARVALID,
    input  wire                            in_BUS_ARREADY,
    // read data channel
    input  wire [C_M_AXI_ID_WIDTH-1:0]     in_BUS_RID,
    input  wire [BUS_DATA_WIDTH-1:0]       in_BUS_RDATA,
    input  wire [1:0]                      in_BUS_RRESP,
    input  wire                            in_BUS_RLAST,
    input  wire [C_M_AXI_RUSER_WIDTH-1:0]  in_BUS_RUSER,
    input  wire                            in_BUS_RVALID,
    output wire                            out_BUS_RREADY,
    // HLS internal read request channel
    input  wire [BUS_ADDR_WIDTH-1:0]       in_HLS_ARADDR,
    input  wire [31:0]                     in_HLS_ARLEN,
    input  wire                            in_HLS_ARVALID,
    output wire                            out_HLS_ARREADY,
    output wire [BUS_DATA_WIDTH-1:0]       out_HLS_RDATA,
    output wire [1:0]                      out_HLS_RLAST,
    output wire                            out_HLS_RVALID,
    input  wire                            in_HLS_RREADY,
    input  wire                            in_HLS_RBUST_READY);
//------------------------Parameter----------------------
    localparam
        BUS_DATA_BYTES  = BUS_DATA_WIDTH / 8,
        BUS_ADDR_ALIGN  = log2(BUS_DATA_BYTES),
        NUM_READ_WIDTH  = log2(MAX_READ_BURST_LENGTH),
        RBUFFER_AWIDTH  = log2(MAX_READ_BURST_LENGTH*NUM_READ_OUTSTANDING),
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
    // AR channel
    wire                                rreq_valid;
    wire [BUS_ADDR_WIDTH - 1:0]         tmp_addr;
    wire [31:0]                         tmp_len;
    wire [7:0]                          arlen_tmp;
    wire [BUS_ADDR_WIDTH - 1:0]         araddr_tmp;
    reg  [BUS_ADDR_WIDTH - 1:0]         start_addr;
    reg  [BUS_ADDR_WIDTH - 1:0]         end_addr;
    wire [BUS_ADDR_WIDTH - 1:0]         sect_addr;
    reg  [BUS_ADDR_WIDTH - 1:0]         sect_addr_buf;
    wire [11 - BUS_ADDR_ALIGN:0]        start_to_4k;
    wire [11 - BUS_ADDR_ALIGN:0]        sect_len;
    reg  [11 - BUS_ADDR_ALIGN:0]        sect_len_buf;
    reg  [11 - BUS_ADDR_ALIGN:0]        beat_len;
    reg  [BUS_ADDR_WIDTH - 13:0]        sect_cnt;
    wire                                ar2r_info;
    wire                                fifo_rctl_r;
    wire                                fifo_burst_w;
    reg                                 ARVALID_Dummy;
    wire                                ready_for_sect;
    wire                                next_rreq;
    wire                                ready_for_rreq;
    reg                                 rreq_handling;
    wire                                first_sect;
    wire                                last_sect;
    reg                                 last_sect_buf;
    wire                                next_sect;
    // R channel
    wire [BUS_DATA_WIDTH-1:0]           tmp_data;
    wire                                tmp_last;
    wire                                data_valid;
    wire                                data_ready;
    wire                                next_ctrl;
    wire                                need_rlast;
    wire                                burst_valid;
    wire                                last_burst;
    wire                                fifo_rctl_ready;
    wire                                next_burst;
    wire                                burst_end;
//------------------------AR channel begin---------------
//------------------------Instantiation------------------
    kernel3_gmem_A_m_axi_reg_slice #(
        .DATA_WIDTH     (BUS_ADDR_WIDTH + 32)
    ) rs_rreq (
        .clk            (ACLK),
        .reset          (ARESET),
        .s_data         ({in_HLS_ARLEN, in_HLS_ARADDR}),
        .s_valid        (in_HLS_ARVALID),
        .s_ready        (out_HLS_ARREADY),
        .m_data         ({tmp_len, tmp_addr}),
        .m_valid        (rreq_valid),
        .m_ready        (next_rreq));
//------------------------Body---------------------------
    assign ready_for_rreq = last_sect & next_sect | ~rreq_handling;
    assign next_rreq      = rreq_valid & ready_for_rreq;
    always @(posedge ACLK)
    begin
        if (ARESET) begin
            start_addr <= 0;
            end_addr   <= 0;
            beat_len   <= 0;
        end
        else if (ACLK_EN) begin
            if(next_rreq) begin
                start_addr <= tmp_addr;
                end_addr   <= tmp_addr + tmp_len;
                beat_len   <= (tmp_len[11:0] + tmp_addr[BUS_ADDR_ALIGN-1:0]) >> BUS_ADDR_ALIGN;
            end
        end
    end
    always @(posedge ACLK)
    begin
        if (ARESET)
            rreq_handling <= 1'b0;
        else if (ACLK_EN) begin
            if (rreq_valid && ~rreq_handling)
                rreq_handling <= 1'b1;
            else if (~rreq_valid && last_sect && next_sect)
                rreq_handling <= 1'b0;
        end
    end
    assign first_sect = (sect_cnt == start_addr[BUS_ADDR_WIDTH-1:12]);
    assign last_sect  = (sect_cnt == end_addr[BUS_ADDR_WIDTH-1:12]);
    assign next_sect  = rreq_handling & ready_for_sect;
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
            if (next_rreq)
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
    assign out_BUS_ARID     = 0;
    assign out_BUS_ARSIZE   = BUS_ADDR_ALIGN;
    assign out_BUS_ARBURST  = 2'b01;
    assign out_BUS_ARLOCK   = 2'b00;
    assign out_BUS_ARCACHE  = C_CACHE_VALUE;
    assign out_BUS_ARPROT   = C_PROT_VALUE;
    assign out_BUS_ARUSER   = C_USER_VALUE;
    assign out_BUS_ARQOS    = 4'b0000;
    assign out_BUS_ARREGION = 4'b0000;
    generate
    if (BUS_DATA_BYTES >= 4096/MAX_READ_BURST_LENGTH) begin : must_one_burst
        assign out_BUS_ARADDR  = {sect_addr_buf[BUS_ADDR_WIDTH - 1:BUS_ADDR_ALIGN], {BUS_ADDR_ALIGN{1'b0}}};
        assign out_BUS_ARLEN   = sect_len_buf;
        assign out_BUS_ARVALID = ARVALID_Dummy;
        assign ready_for_sect = ~(ARVALID_Dummy && ~in_BUS_ARREADY) && fifo_rctl_ready;
        always @(posedge ACLK)
        begin
            if (ARESET)
                ARVALID_Dummy <= 1'b0;
            else if (ACLK_EN) begin
                if (next_sect)
                    ARVALID_Dummy <= 1'b1;
                else if (~next_sect && in_BUS_ARREADY)
                    ARVALID_Dummy <= 1'b0;
            end
        end
        assign fifo_rctl_r  = next_sect;
        assign ar2r_info    = last_sect;
        assign fifo_burst_w = next_sect;
        assign araddr_tmp   = sect_addr[BUS_ADDR_WIDTH - 1:0];
        assign arlen_tmp    = sect_len;
    end
    else begin : could_multi_bursts
        reg  [BUS_ADDR_WIDTH - 1:0]                     araddr_buf;
        reg  [7:0]                                      arlen_buf;
        reg  [11 - NUM_READ_WIDTH - BUS_ADDR_ALIGN:0]   loop_cnt;
        reg                                             sect_handling;
        wire                                            last_loop;
        wire                                            next_loop;
        wire                                            ready_for_loop;
        assign out_BUS_ARADDR  = araddr_buf;
        assign out_BUS_ARLEN   = arlen_buf;
        assign out_BUS_ARVALID = ARVALID_Dummy;
        assign last_loop      = (loop_cnt == sect_len_buf[11 - BUS_ADDR_ALIGN : NUM_READ_WIDTH]);
        assign next_loop      = sect_handling && ready_for_loop;
        assign ready_for_loop = ~(ARVALID_Dummy && ~in_BUS_ARREADY) && fifo_rctl_ready;
        assign ready_for_sect = ~(sect_handling && ~(last_loop && next_loop));
        always @(posedge ACLK)
        begin
            if (ARESET)
                sect_handling <= 1'b0;
            else if (ACLK_EN) begin
                if (rreq_handling && ~sect_handling)
                    sect_handling <= 1'b1;
                else if (~rreq_handling && last_loop && next_loop)
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
        assign araddr_tmp = (loop_cnt == 0)? sect_addr_buf[BUS_ADDR_WIDTH - 1:0] : (araddr_buf + ((arlen_buf + 1) << BUS_ADDR_ALIGN));
        assign arlen_tmp  = (NUM_READ_WIDTH == 0) ? 0 :
                            (last_loop)? sect_len_buf[NUM_READ_WIDTH - 1:0] : { NUM_READ_WIDTH{1'b1} };
        always @(posedge ACLK)
        begin
            if (ARESET) begin
                araddr_buf <= 0;
                arlen_buf <= 0;
            end
            else if (ACLK_EN) begin
                if (next_loop) begin
                    araddr_buf <= {araddr_tmp[BUS_ADDR_WIDTH - 1:BUS_ADDR_ALIGN], {BUS_ADDR_ALIGN{1'b0}}};
                    arlen_buf <= arlen_tmp;
                end
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                ARVALID_Dummy <= 1'b0;
            else if (ACLK_EN) begin
                if (next_loop)
                    ARVALID_Dummy <= 1'b1;
                else if (~next_loop && in_BUS_ARREADY)
                    ARVALID_Dummy <= 1'b0;
            end
        end
        assign fifo_rctl_r  = next_loop;
        assign ar2r_info    = last_loop && last_sect_buf;
        assign fifo_burst_w = next_loop;
    end
    endgenerate
//------------------------AR channel end-----------------
//------------------------R channel begin----------------
//------------------------Instantiation------------------
    kernel3_gmem_A_m_axi_reg_slice #(
        .DATA_WIDTH     (BUS_DATA_WIDTH + 1)
    ) rs_rdata (
        .clk            (ACLK),
        .reset          (ARESET),
        .s_data         ({in_BUS_RLAST, in_BUS_RDATA}),
        .s_valid        (in_BUS_RVALID),
        .s_ready        (out_BUS_RREADY),
        .m_data         ({tmp_last, tmp_data}),
        .m_valid        (data_valid),
        .m_ready        (data_ready));
    kernel3_gmem_A_m_axi_fifo #(
        .DATA_WIDTH     (1),
        .ADDR_WIDTH     (log2(NUM_READ_OUTSTANDING)),
        .DEPTH          (NUM_READ_OUTSTANDING)
    ) fifo_rctl (
        .clk            (ACLK),
        .reset          (ARESET),
        .clk_en         (ACLK_EN),
        .if_full_n      (fifo_rctl_ready),
        .if_write       (fifo_rctl_r),
        .if_din         (ar2r_info),
        .if_empty_n     (need_rlast),
        .if_read        (next_ctrl),
        .if_dout        (),
        .if_num_data_valid());
    kernel3_gmem_A_m_axi_fifo #(
        .DATA_WIDTH     (1),
        .ADDR_WIDTH     (log2(NUM_READ_OUTSTANDING)),
        .DEPTH          (NUM_READ_OUTSTANDING)
    ) fifo_burst (
        .clk            (ACLK),
        .reset          (ARESET),
        .clk_en         (ACLK_EN),
        .if_full_n      (),
        .if_write       (fifo_rctl_r),
        .if_din         (ar2r_info),
        .if_empty_n     (burst_valid),
        .if_read        (next_burst),
        .if_dout        (last_burst),
        .if_num_data_valid());
//------------------------Body---------------------------
    assign next_ctrl      = in_HLS_RBUST_READY && need_rlast;
    assign next_burst     = burst_end && data_valid && data_ready;
    assign burst_end      = tmp_last === 1'b1;
    assign out_HLS_RLAST  = {burst_end, burst_end && last_burst && burst_valid};
    assign out_HLS_RDATA  = tmp_data;
    assign out_HLS_RVALID = data_valid;
    assign data_ready     = in_HLS_RREADY;
//------------------------R channel end------------------
endmodule
