`timescale 1 ns / 1 ps

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
module kernel3_gmem_C_m_axi_load
#(parameter
    C_TARGET_ADDR                         = 32'h00000000,
    NUM_READ_OUTSTANDING                  = 2,
    MAX_READ_BURST_LENGTH                 = 16,
    BUS_ADDR_WIDTH                        = 32,
    BUS_DATA_WIDTH                        = 32,
    USER_DW                               = 16,
    USER_AW                               = 32,
    USER_MAXREQS                          = 16,
    USER_RFIFONUM_WIDTH                   = 6,
    BUFFER_IMPL                           = "auto"
)(
    // system signal
    input  wire                           ACLK,
    input  wire                           ARESET,
    input  wire                           ACLK_EN,
    // read address channel
    output wire [BUS_ADDR_WIDTH-1:0]      out_AXI_ARADDR,
    output wire [31:0]                    out_AXI_ARLEN,
    output wire                           out_AXI_ARVALID,
    input  wire                           in_AXI_ARREADY,
    // read data channel
    input  wire [BUS_DATA_WIDTH-1:0]      in_AXI_RDATA,
    input  wire [1:0]                     in_AXI_RLAST,
    input  wire                           in_AXI_RVALID,
    output wire                           out_AXI_RREADY,
    output wire                           out_AXI_RBURST_READY,
    // internal bus ports
    // read address
    input  wire [USER_AW-1:0]             in_HLS_ARADDR,
    input  wire [31:0]                    in_HLS_ARLEN,
    input  wire                           in_HLS_ARVALID,
    output wire                           out_HLS_ARREADY,
    // read data
    output wire [USER_DW-1:0]             out_HLS_RDATA,
    output wire                           out_HLS_RVALID,
    input  wire                           in_HLS_RREADY,
    output wire [USER_RFIFONUM_WIDTH-1:0] out_HLS_RFIFONUM);
//------------------------Parameter----------------------
    localparam
        USER_DATA_WIDTH = calc_data_width(USER_DW),
        USER_DATA_BYTES = USER_DATA_WIDTH / 8,
        USER_ADDR_ALIGN = log2(USER_DATA_BYTES),
        BUS_ADDR_ALIGN  = log2(BUS_DATA_WIDTH/8),
        RBUFF_DEPTH     = NUM_READ_OUTSTANDING * MAX_READ_BURST_LENGTH,
        TARGET_ADDR     = C_TARGET_ADDR & (32'hffffffff << USER_ADDR_ALIGN);
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
    wire                           next_rreq;
    wire                           ready_for_rreq;
    wire                           rreq_ready;
    wire [USER_AW-1 : 0]           rreq_addr;
    wire [31:0]                    rreq_len;
    wire                           rreq_valid;
    wire                           valid_length;
    reg  [BUS_ADDR_WIDTH-1 : 0]    tmp_addr;
    reg  [31:0]                    tmp_len;
    reg                            tmp_valid;
    wire                           burst_ready;
    wire                           beat_valid;
    wire                           next_beat;
    wire                           last_beat;
    wire [BUS_DATA_WIDTH-1 : 0]    beat_data;
    wire [log2(RBUFF_DEPTH) : 0]   beat_nvalid;
    reg                            ready_for_outstanding;
//------------------------Instantiation------------------
    kernel3_gmem_C_m_axi_fifo #(
        .DATA_WIDTH        (USER_AW + 32),
        .ADDR_WIDTH        (log2(USER_MAXREQS)),
        .DEPTH             (USER_MAXREQS)
    ) fifo_rreq (
        .clk               (ACLK),
        .reset             (ARESET),
        .clk_en            (ACLK_EN),
        .if_full_n         (out_HLS_ARREADY),
        .if_write          (in_HLS_ARVALID),
        .if_din            ({in_HLS_ARLEN, in_HLS_ARADDR}),
        .if_empty_n        (rreq_valid),
        .if_read           (next_rreq),
        .if_dout           ({rreq_len, rreq_addr}),
        .if_num_data_valid ());
    // ===================================================================
    // start of ARADDR PREPROCESSOR

    assign next_rreq       = rreq_valid && ready_for_rreq;
    assign ready_for_rreq  = ~tmp_valid || (in_AXI_ARREADY && rreq_ready);
    assign valid_length    = (rreq_len != 32'b0) && !rreq_len[31];
    assign out_AXI_ARLEN   = tmp_len;   // Byte length
    assign out_AXI_ARADDR  = tmp_addr;  // Byte address
    assign out_AXI_ARVALID = tmp_valid && rreq_ready;
    always @(posedge ACLK)
    begin
        if (ARESET) begin
            tmp_len  <= 0;
            tmp_addr <= 0;
        end
        else if (ACLK_EN) begin
            if(next_rreq) begin
                tmp_len  <= (rreq_len << USER_ADDR_ALIGN) - 1;            // byte length
                tmp_addr <= TARGET_ADDR + (rreq_addr << USER_ADDR_ALIGN); // byte address
            end
        end
    end

    always @(posedge ACLK)
    begin
        if (ARESET)
            tmp_valid <= 1'b0;
        else if (ACLK_EN) begin
            if (next_rreq && valid_length)
                tmp_valid <= 1'b1;
            else if (in_AXI_ARREADY && rreq_ready)
                tmp_valid <= 1'b0;
        end
    end
    // end of ARADDR PREPROCESSOR
    // ===================================================================
    kernel3_gmem_C_m_axi_fifo #(
        .MEM_STYLE         (BUFFER_IMPL),
        .DATA_WIDTH        (BUS_DATA_WIDTH + 2),
        .ADDR_WIDTH        (log2(RBUFF_DEPTH)),
        .DEPTH             (RBUFF_DEPTH)
    ) buff_rdata (
        .clk               (ACLK),
        .reset             (ARESET),
        .clk_en            (ACLK_EN),
        .if_full_n         (out_AXI_RREADY),
        .if_write          (in_AXI_RVALID),
        .if_din            ({in_AXI_RLAST, in_AXI_RDATA}),
        .if_empty_n        (beat_valid),
        .if_read           (next_beat),
        .if_dout           ({burst_ready, last_beat, beat_data}),
        .if_num_data_valid (beat_nvalid));
    assign out_AXI_RBURST_READY = ready_for_outstanding;
    always @(posedge ACLK)
    begin
        if (ARESET)
            ready_for_outstanding <= 1'b0;
        else if (ACLK_EN) begin
            if (next_beat)
                ready_for_outstanding <= burst_ready;
            else
                ready_for_outstanding <= 1'b0;
        end
    end
    // ===================================================================
    // start of RDATA PREPROCESSOR
    generate
    if (USER_DATA_WIDTH == BUS_DATA_WIDTH) begin : bus_equal_gen
        assign rreq_ready       = 1'b1;
        assign next_beat        = in_HLS_RREADY;
        assign out_HLS_RDATA    = beat_data[USER_DW-1 : 0];
        assign out_HLS_RVALID   = beat_valid;
        assign out_HLS_RFIFONUM = beat_nvalid;
    end
    else if (USER_DATA_WIDTH < BUS_DATA_WIDTH) begin : bus_wide_gen
        localparam
            TOTAL_SPLIT  = BUS_DATA_WIDTH / USER_DATA_WIDTH,
            SPLIT_ALIGN  = log2(TOTAL_SPLIT);
        wire [USER_AW - 1:0]        tmp_addr_end;
        wire                        offset_full_n;
        wire                        offset_write;
        wire [SPLIT_ALIGN-1 : 0]    start_offset;
        wire [SPLIT_ALIGN-1 : 0]    end_offset;
        wire                        offset_valid;
        wire                        next_offset;
        wire [SPLIT_ALIGN-1 : 0]    head_offset;
        wire [SPLIT_ALIGN-1 : 0]    tail_offset;
        reg                         first_beat;
        wire                        first_data;
        wire                        last_data;
        wire                        ready_for_data;
        reg  [BUS_DATA_WIDTH-1 : 0] data_buf;
        reg                         data_valid;
        reg  [USER_RFIFONUM_WIDTH-1:0] rdata_nvalid;
        reg  [SPLIT_ALIGN : 0]      data_nvalid;
        wire [SPLIT_ALIGN : 0]      split_nvalid;

        wire [SPLIT_ALIGN-1 : 0]    split_cnt;
        reg  [SPLIT_ALIGN-1 : 0]    split_cnt_buf;
        wire                        first_split;
        wire                        next_split;
        wire                        last_split;
        // Recording the offset of start & end address to extract the expect data from beats when USER_DW < BUS_DW.
        kernel3_gmem_C_m_axi_fifo #(
            .DATA_WIDTH         (2*SPLIT_ALIGN),
            .ADDR_WIDTH         (log2(NUM_READ_OUTSTANDING)),
            .DEPTH              (NUM_READ_OUTSTANDING)
        ) rreq_offset (
            .clk                (ACLK),
            .reset              (ARESET),
            .clk_en             (ACLK_EN),
            .if_full_n          (offset_full_n),
            .if_write           (offset_write),
            .if_din             ({start_offset, end_offset}),
            .if_empty_n         (offset_valid),
            .if_read            (next_offset),
            .if_dout            ({head_offset, tail_offset}),
            .if_num_data_valid  ());
        assign rreq_ready       = offset_full_n | ~offset_write;
        assign tmp_addr_end     = tmp_addr + tmp_len;
        assign start_offset     = tmp_addr[BUS_ADDR_ALIGN - 1 : 0] >> USER_ADDR_ALIGN;
        assign end_offset       = tmp_addr_end[BUS_ADDR_ALIGN - 1 : 0] >> USER_ADDR_ALIGN;
        assign offset_write     = tmp_valid & in_AXI_ARREADY;
        assign next_offset      = (last_beat & beat_valid) & last_split;
        assign next_beat        = last_split;
        assign out_HLS_RDATA    = data_buf[USER_DW-1 : 0];
        assign out_HLS_RVALID   = data_valid;
        assign out_HLS_RFIFONUM = rdata_nvalid + data_nvalid;
        assign ready_for_data   = ~data_valid | in_HLS_RREADY;
        assign first_data       = first_beat && beat_valid && offset_valid;
        assign last_data        = last_beat && beat_valid && offset_valid;
        assign first_split      = (~first_data) ? (split_cnt == 0 && beat_valid && ready_for_data) : ((split_cnt == head_offset) && ready_for_data);
        assign last_split       = (~last_data)  ? (split_cnt == (TOTAL_SPLIT-1) && ready_for_data) : ((split_cnt == tail_offset) && ready_for_data);
        assign next_split       = (~first_data) ? (split_cnt != 0 && ready_for_data)               : ((split_cnt != head_offset) && ready_for_data);
        assign split_cnt        = (first_data && (split_cnt_buf == 0)) ? head_offset : split_cnt_buf;
        assign split_nvalid     = (first_data && last_data)  ? tail_offset - head_offset + 1 :
                                   first_data                ? TOTAL_SPLIT - head_offset     :
                                   last_data                 ? tail_offset + 1               :
                                   TOTAL_SPLIT;
        always @(posedge ACLK)
        begin
            if (ARESET)
                split_cnt_buf <= 0;
            else if (ACLK_EN) begin
                if (last_split)
                    split_cnt_buf <= 0;
                else if (first_split || next_split)
                    split_cnt_buf <= split_cnt + 1;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                first_beat <= 1'b1;
            else if (ACLK_EN) begin
                if (last_beat && last_split)
                    first_beat <= 1'b1;
                else if (first_beat && last_split)
                    first_beat <= 1'b0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ACLK_EN) begin
                if (first_split & first_data)
                    data_buf <= beat_data >> (head_offset * USER_DATA_WIDTH);
                else if (first_split)
                    data_buf <= beat_data;
                else if (next_split)
                    data_buf <= data_buf >> USER_DATA_WIDTH;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                data_valid <= 1'b0;
            else if (ACLK_EN) begin
                if (first_split)
                    data_valid <= 1'b1;
                else if (~(first_split || next_split) && ready_for_data)
                    data_valid <= 1'b0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                data_nvalid <= 0;
            else if (ACLK_EN) begin
                if (first_split)
                    data_nvalid <= split_nvalid;
                else if (next_split)
                    data_nvalid <= data_nvalid - 1;
                else if (~(first_split || next_split) && ready_for_data)
                    data_nvalid <= 0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                rdata_nvalid <= 0;
            else if (ACLK_EN) begin
                if (!beat_valid)
                    rdata_nvalid <= 0;
                else
                    rdata_nvalid <= ((beat_nvalid - 1) << SPLIT_ALIGN);
            end
        end

    end
    else begin : bus_narrow_gen
        localparam
            TOTAL_PADS      = USER_DATA_WIDTH / BUS_DATA_WIDTH,
            PAD_ALIGN       = log2(TOTAL_PADS);
        reg [USER_DATA_WIDTH-1 : 0] data_buf;
        reg                         data_valid;
        reg [PAD_ALIGN:0]           data_nvalid;
        wire                        ready_for_data;
        wire [TOTAL_PADS - 1:0]     pad_oh;
        reg  [TOTAL_PADS - 1:0]     pad_oh_reg;
        reg                         first_pad;
        wire                        last_pad;
        wire                        next_pad;
        assign rreq_ready       = 1'b1;
        assign next_beat        = next_pad;

        assign out_HLS_RDATA    = data_buf[USER_DW-1 : 0];
        assign out_HLS_RVALID   = data_valid;
        assign out_HLS_RFIFONUM = beat_nvalid[log2(RBUFF_DEPTH) : PAD_ALIGN] + (beat_nvalid[PAD_ALIGN-1:0] + data_nvalid) >> PAD_ALIGN;
        assign ready_for_data   = ~data_valid | in_HLS_RREADY;
        assign next_pad         = beat_valid && ready_for_data;
        assign last_pad         = pad_oh[TOTAL_PADS - 1];
        always @(posedge ACLK)
        begin
            if (ARESET)
                first_pad <= 1'b1;
            else if (ACLK_EN) begin
                if (next_pad && ~last_pad)
                    first_pad <= 1'b0;
                else if (next_pad && last_pad)
                    first_pad <= 1'b1;
            end
        end
        assign pad_oh = (beat_valid == 0)  ?  0 :
                        (first_pad)        ?  1 :
                        pad_oh_reg;

        always @(posedge ACLK)
        begin
            if (ARESET)
                pad_oh_reg <= 0;
            else if (ACLK_EN) begin
                if (next_pad)
                    pad_oh_reg <= {pad_oh[TOTAL_PADS - 2:0], 1'b0};
            end
        end
        genvar  i;
        for (i = 0; i < TOTAL_PADS; i = i + 1) begin : data_gen
            always @(posedge ACLK)
            begin
                if (ACLK_EN) begin
                    if (pad_oh[i] == 1'b1 && ready_for_data)
                        data_buf[i*BUS_DATA_WIDTH +: BUS_DATA_WIDTH] <= beat_data;
                end
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                data_valid <= 1'b0;
            else if (ACLK_EN) begin
                if (next_beat)
                    data_valid <= 1'b1;
                else if (ready_for_data)
                    data_valid <= 1'b0;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                data_nvalid <= 0;
            else if (ACLK_EN) begin
                if (first_pad)
                    data_nvalid <= 1;
                else if (next_pad)
                    data_nvalid <= data_nvalid + 1;
            end
        end
    end
    endgenerate
    // end of RDATA PREPROCESSOR
    // ===================================================================
endmodule
