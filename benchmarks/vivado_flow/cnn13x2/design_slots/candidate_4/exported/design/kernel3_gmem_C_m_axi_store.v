`timescale 1 ns / 1 ps

module kernel3_gmem_C_m_axi_store
#(parameter
    C_TARGET_ADDR           = 32'h00000000,
    NUM_WRITE_OUTSTANDING   = 2,
    MAX_WRITE_BURST_LENGTH  = 16,
    BUS_ADDR_WIDTH          = 32,
    BUS_DATA_WIDTH          = 32,
    USER_DW                 = 16,
    USER_AW                 = 32,
    USER_MAXREQS            = 16,
    BUFFER_IMPL             = "auto"
)(
    // system signal
    input  wire                        ACLK,
    input  wire                        ARESET,
    input  wire                        ACLK_EN,
    // write address channel
    output wire [BUS_ADDR_WIDTH-1:0]   out_AXI_AWADDR,
    output wire [31:0]                 out_AXI_AWLEN,
    output wire                        out_AXI_AWVALID,
    input  wire                        in_AXI_AWREADY,
    // write data channel
    output wire [BUS_DATA_WIDTH-1:0]   out_AXI_WDATA,
    output wire [BUS_DATA_WIDTH/8-1:0] out_AXI_WSTRB,
    output wire                        out_AXI_WVALID,
    input  wire                        in_AXI_WREADY,
    // write response channel
    input  wire                        in_AXI_BVALID,
    output wire                        out_AXI_BREADY,
    // internal bus ports
    // write address
    input  wire [USER_AW-1:0]          in_HLS_AWADDR,
    input  wire [31:0]                 in_HLS_AWLEN,
    input  wire                        in_HLS_AWVALID,
    output wire                        out_HLS_AWREADY,
    // write data
    input  wire [USER_DW-1:0]          in_HLS_WDATA,
    input  wire [USER_DW/8-1:0]        in_HLS_WSTRB,
    input  wire                        in_HLS_WVALID,
    output wire                        out_HLS_WREADY,
    // write response
    output wire                        out_HLS_BVALID,
    input  wire                        in_HLS_BREADY);
//------------------------Parameter----------------------
    localparam
        USER_DATA_WIDTH = calc_data_width(USER_DW),
        USER_DATA_BYTES = USER_DATA_WIDTH / 8,
        USER_ADDR_ALIGN = log2(USER_DATA_BYTES),
        BUS_DATA_BYTES  = BUS_DATA_WIDTH / 8,
        BUS_ADDR_ALIGN  = log2(BUS_DATA_BYTES),
        // write buffer size
        WBUFF_DEPTH     = max(MAX_WRITE_BURST_LENGTH * BUS_DATA_WIDTH / USER_DATA_WIDTH, 1),
        TARGET_ADDR     = C_TARGET_ADDR & (32'hffffffff << USER_ADDR_ALIGN);
//------------------------Task and function--------------
    function integer max;
        input integer x;
        input integer y;
    begin
        max = (x > y) ? x : y;
    end
    endfunction
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
    wire                                next_wreq;
    wire                                ready_for_wreq;
    wire                                wreq_ready;
    wire [USER_AW-1 : 0]                wreq_addr;
    wire [31:0]                         wreq_len;
    wire                                wreq_valid;
    wire                                valid_length;
    reg  [USER_AW-1 : 0]                tmp_addr;
    reg  [31:0]                         tmp_len;
    reg                                 tmp_valid;
    wire                                next_wdata;
    wire                                wdata_valid;
    wire [USER_DW-1 : 0]                tmp_wdata;
    wire [USER_DW/8-1 : 0]              tmp_wstrb;
    wire                                wrsp_ready;
    wire                                wrsp_valid;
    wire                                wrsp_read;
    wire                                wrsp_type;
    wire                                ursp_ready;
    wire                                ursp_write;
//------------------------Instantiation------------------
    kernel3_gmem_C_m_axi_fifo #(
        .DATA_WIDTH     (USER_AW + 32),
        .ADDR_WIDTH     (log2(USER_MAXREQS)),
        .DEPTH          (USER_MAXREQS)
    ) fifo_wreq (
        .clk            (ACLK),
        .reset          (ARESET),
        .clk_en         (ACLK_EN),
        .if_full_n      (out_HLS_AWREADY),
        .if_write       (in_HLS_AWVALID),
        .if_din         ({in_HLS_AWLEN, in_HLS_AWADDR}),
        .if_empty_n     (wreq_valid),
        .if_read        (next_wreq),
        .if_dout        ({wreq_len, wreq_addr}),
        .if_num_data_valid());
    assign next_wreq = wreq_valid && ready_for_wreq && wrsp_ready;
    assign ready_for_wreq  = ~tmp_valid || (in_AXI_AWREADY && wreq_ready);
    assign valid_length    = (wreq_len != 32'b0) && !wreq_len[31];
    assign out_AXI_AWLEN   = tmp_len;   // Byte length
    assign out_AXI_AWADDR  = tmp_addr;  // Byte address
    assign out_AXI_AWVALID = tmp_valid && wreq_ready;
    always @(posedge ACLK)
    begin
        if (ARESET) begin
            tmp_len  <= 0;
            tmp_addr <= 0;
        end
        else if (ACLK_EN) begin
            if(next_wreq) begin
                tmp_len  <= (wreq_len << USER_ADDR_ALIGN) - 1;
                tmp_addr <= TARGET_ADDR + (wreq_addr << USER_ADDR_ALIGN);
            end
        end
    end

    always @(posedge ACLK)
    begin
        if (ARESET)
            tmp_valid <= 1'b0;
        else if (next_wreq && valid_length)
            tmp_valid <= 1'b1;
        else if (in_AXI_AWREADY && wreq_ready)
            tmp_valid <= 1'b0;
    end
    // ===================================================================
    kernel3_gmem_C_m_axi_fifo #(
        .MEM_STYLE         (BUFFER_IMPL),
        .DATA_WIDTH        (USER_DW + USER_DW/8),
        .ADDR_WIDTH        (log2(WBUFF_DEPTH)),
        .DEPTH             (WBUFF_DEPTH)
    ) buff_wdata (
        .clk               (ACLK),
        .reset             (ARESET),
        .clk_en            (ACLK_EN),
        .if_full_n         (out_HLS_WREADY),
        .if_write          (in_HLS_WVALID),
        .if_din            ({in_HLS_WSTRB , in_HLS_WDATA}),
        .if_empty_n        (wdata_valid),
        .if_read           (next_wdata),
        .if_dout           ({tmp_wstrb, tmp_wdata}),
        .if_num_data_valid ());
    generate
    if (USER_DATA_WIDTH == BUS_DATA_WIDTH) begin : bus_equal_gen
        assign next_wdata       = in_AXI_WREADY;
        assign out_AXI_WVALID   = wdata_valid;
        assign out_AXI_WDATA    = tmp_wdata;
        assign out_AXI_WSTRB    = tmp_wstrb;
        assign wreq_ready   = 1'b1;
    end
    else if (USER_DATA_WIDTH < BUS_DATA_WIDTH) begin : bus_wide_gen
        localparam
            TOTAL_PADS      = BUS_DATA_WIDTH / USER_DATA_WIDTH,
            PAD_ALIGN       = log2(TOTAL_PADS),
            BEAT_LEN_WIDTH  = 32 - BUS_ADDR_ALIGN;
        function [TOTAL_PADS-1 : 0] decoder;
            input [PAD_ALIGN-1 : 0] din;
            reg  [TOTAL_PADS-1 : 0] dout;
            integer i;
        begin
            dout = {TOTAL_PADS{1'b0}};
            for (i = 0; i < din; i = i + 1)
                dout[i] = 1'b1;
            decoder = dout;
        end
        endfunction
        wire [USER_AW - 1:0]        tmp_addr_end;
        wire                        offset_full_n;
        wire                        offset_write;
        wire [PAD_ALIGN-1 : 0]      start_offset;
        wire [PAD_ALIGN-1 : 0]      end_offset;
        wire [BEAT_LEN_WIDTH-1 : 0] beat_total;
        wire                        offset_valid;
        wire                        next_offset;
        wire [PAD_ALIGN-1 : 0]      head_offset;
        wire [PAD_ALIGN-1 : 0]      tail_offset;
        wire [BEAT_LEN_WIDTH-1 : 0] beat_len;
        reg  [BEAT_LEN_WIDTH-1:0]   len_cnt;
        wire [TOTAL_PADS - 1:0]     add_head;
        wire [TOTAL_PADS - 1:0]     add_tail;
        wire [TOTAL_PADS - 1:0]     pad_oh;
        reg  [TOTAL_PADS - 1:0]     pad_oh_reg;
        wire [TOTAL_PADS-1 : 0]     head_pad_sel;
        wire [0 : TOTAL_PADS-1]     tail_pad_sel; // reverse
        wire                        ready_for_data;
        wire                        next_pad;
        reg                         first_pad;
        wire                        last_pad;
        wire                        first_beat;
        wire                        last_beat;
        wire                        next_beat;
        reg  [BUS_DATA_WIDTH - 1:0] data_buf;
        reg  [BUS_DATA_BYTES - 1:0] strb_buf;
        reg                         data_valid;
        // Recording the offset of start & end address to align beats from data USER_DW < BUS_DW.
        kernel3_gmem_C_m_axi_fifo #(
            .DATA_WIDTH             (2*PAD_ALIGN + BEAT_LEN_WIDTH),
            .ADDR_WIDTH             (log2(NUM_WRITE_OUTSTANDING)),
            .DEPTH                  (NUM_WRITE_OUTSTANDING)
        ) wreq_offset (
            .clk                    (ACLK),
            .reset                  (ARESET),
            .clk_en                 (ACLK_EN),
            .if_full_n              (offset_full_n),
            .if_write               (offset_write),
            .if_din                 ({start_offset, end_offset, beat_total}),
            .if_empty_n             (offset_valid),
            .if_read                (next_offset),
            .if_dout                ({head_offset, tail_offset, beat_len}),
            .if_num_data_valid      ());
        assign wreq_ready   = offset_full_n | ~offset_write;
        assign tmp_addr_end = tmp_addr + tmp_len;
        assign start_offset   = tmp_addr[BUS_ADDR_ALIGN-1 : 0] >> USER_ADDR_ALIGN;
        assign end_offset     = ~tmp_addr_end[BUS_ADDR_ALIGN-1 : 0] >> USER_ADDR_ALIGN;
        assign beat_total     = (tmp_len + tmp_addr[BUS_ADDR_ALIGN-1 : 0]) >> BUS_ADDR_ALIGN;
        assign offset_write   = tmp_valid & in_AXI_AWREADY;
        assign out_AXI_WDATA  = data_buf;
        assign out_AXI_WSTRB  = strb_buf;
        assign out_AXI_WVALID = data_valid;
        assign next_wdata     = next_pad;
        assign next_offset    = last_beat && next_beat;
        assign ready_for_data = ~data_valid || in_AXI_WREADY;
        assign first_beat     = (len_cnt == 0) && offset_valid;
        assign last_beat      = (len_cnt == beat_len) && offset_valid;
        assign next_beat      = offset_valid && last_pad && ready_for_data;
        assign next_pad       = offset_valid && wdata_valid && ready_for_data;
        assign last_pad       = (last_beat) ? pad_oh[TOTAL_PADS-tail_offset-1] : pad_oh[TOTAL_PADS-1];
        assign head_pad_sel   = decoder(head_offset);
        assign tail_pad_sel   = decoder(tail_offset);
        always @(posedge ACLK)
        begin
            if (ARESET)
                len_cnt <= 0;
            else if (ACLK_EN) begin
                if (next_offset)
                    len_cnt <= 0;
                else if (next_beat)
                    len_cnt <= len_cnt + 1;
            end
        end
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

        assign pad_oh = (~wdata_valid)            ? 0                :
                        (first_pad && first_beat) ? 1 << head_offset :
                        (first_pad)?                1                :
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
            assign add_head[i] = head_pad_sel[i] && first_beat;
            assign add_tail[i] = tail_pad_sel[i] && last_beat;
            always @(posedge ACLK)
            begin
                if (ARESET)
                    data_buf[i*USER_DATA_WIDTH +: USER_DATA_WIDTH] <= {USER_DATA_WIDTH{1'b0}};
                else if (ACLK_EN) begin
                    if ((add_head[i] || add_tail[i]) && ready_for_data)
                        data_buf[i*USER_DATA_WIDTH +: USER_DATA_WIDTH] <= {USER_DATA_WIDTH{1'b0}};
                    else if (pad_oh[i] == 1'b1 && ready_for_data)
                        data_buf[i*USER_DATA_WIDTH +: USER_DATA_WIDTH] <= tmp_wdata;
                end
            end
            always @(posedge ACLK)
            begin
                if (ARESET)
                    strb_buf[i*USER_DATA_BYTES +: USER_DATA_BYTES] <= {USER_DATA_BYTES{1'b0}};
                else if (ACLK_EN) begin
                    if ((add_head[i] || add_tail[i]) && ready_for_data)
                        strb_buf[i*USER_DATA_BYTES +: USER_DATA_BYTES] <= {USER_DATA_BYTES{1'b0}};
                    else if (pad_oh[i] == 1'b1 && ready_for_data)
                        strb_buf[i*USER_DATA_BYTES +: USER_DATA_BYTES] <= tmp_wstrb;
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
    end
    else begin : bus_narrow_gen
        localparam
            TOTAL_SPLIT       = USER_DATA_WIDTH / BUS_DATA_WIDTH,
            SPLIT_ALIGN       = log2(TOTAL_SPLIT),
            BEAT_LEN_WIDTH    = 32 - BUS_ADDR_ALIGN;
        wire [USER_AW - 1:0]        tmp_addr_end;
        wire                        offset_full_n;
        wire                        offset_write;
        wire  [BEAT_LEN_WIDTH-1 : 0] beat_total;
        wire                        offset_valid;
        wire                        next_offset;
        wire [BEAT_LEN_WIDTH-1 : 0] beat_len;
        reg  [BEAT_LEN_WIDTH-1 : 0] len_cnt;
        wire                        ready_for_data;
        reg  [BUS_DATA_WIDTH - 1:0] data_buf;
        reg  [BUS_DATA_BYTES - 1:0] strb_buf;
        reg                         data_valid;
        reg [SPLIT_ALIGN-1 : 0]     split_cnt;
        wire                        first_split;
        wire                        next_split;
        wire                        last_split;
        // Recording the offset of start & end address to align beats from data USER_DW < BUS_DW.
        kernel3_gmem_C_m_axi_fifo #(
            .DATA_WIDTH        (BEAT_LEN_WIDTH),
            .ADDR_WIDTH        (log2(NUM_WRITE_OUTSTANDING)),
            .DEPTH             (NUM_WRITE_OUTSTANDING)
        ) wreq_offset (
            .clk               (ACLK),
            .reset             (ARESET),
            .clk_en            (ACLK_EN),
            .if_full_n         (offset_full_n),
            .if_write          (offset_write),
            .if_din            (beat_total),
            .if_empty_n        (offset_valid),
            .if_read           (next_offset),
            .if_dout           (beat_len),
            .if_num_data_valid ());
        assign wreq_ready     = offset_full_n | ~offset_write;
        assign beat_total     = (tmp_len + tmp_addr[BUS_ADDR_ALIGN-1 : 0]) >> BUS_ADDR_ALIGN;
        assign offset_write   = tmp_valid & in_AXI_AWREADY;
        assign out_AXI_WDATA  = data_buf[BUS_DATA_WIDTH - 1:0];
        assign out_AXI_WSTRB  = strb_buf[BUS_DATA_BYTES - 1:0];
        assign out_AXI_WVALID = data_valid;
        assign next_wdata     = first_split;
        assign next_offset    = (len_cnt == beat_len) && offset_valid && last_split;
        assign ready_for_data = ~data_valid | in_AXI_WREADY;
        assign first_split    = (split_cnt == 0) && wdata_valid && offset_valid && ready_for_data;
        assign last_split     = (split_cnt == (TOTAL_SPLIT - 1)) && ready_for_data;
        assign next_split     = (split_cnt != 0) && ready_for_data;

        always @(posedge ACLK)
        begin
            if (ARESET)
                split_cnt <= 0;
            else if (ACLK_EN) begin
                if (last_split)
                    split_cnt <= 0;
                else if (first_split || next_split)
                    split_cnt <= split_cnt + 1;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                len_cnt <= 0;
            else if (ACLK_EN) begin
                if (next_offset)
                    len_cnt <= 0;
                else if (next_wdata || next_split)
                    len_cnt <= len_cnt + 1;
            end
        end

        always @(posedge ACLK)
        begin
            if (ACLK_EN) begin
                if (next_wdata)
                    data_buf <= tmp_wdata;
                else if (next_split)
                    data_buf <= data_buf >> BUS_DATA_WIDTH;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                strb_buf <= 0;
            else if (ACLK_EN) begin
                if (next_wdata)
                    strb_buf <= tmp_wstrb;
                else if (next_split)
                    strb_buf <= strb_buf >> BUS_DATA_BYTES;
            end
        end
        always @(posedge ACLK)
        begin
            if (ARESET)
                data_valid <= 0;
            else if (ACLK_EN) begin
                if (next_wdata)
                    data_valid <= 1;
                else if (~(first_split || next_split) && ready_for_data)
                    data_valid <= 0;
            end
        end
    end
    endgenerate
    // ===================================================================
    // generate response for all request (including request with invalid length)
    kernel3_gmem_C_m_axi_fifo #(
        .DATA_WIDTH        (1),
        .ADDR_WIDTH        (log2(NUM_WRITE_OUTSTANDING)),
        .DEPTH             (NUM_WRITE_OUTSTANDING)
    ) fifo_wrsp (
        .clk               (ACLK),
        .reset             (ARESET),
        .clk_en            (ACLK_EN),
        .if_full_n         (wrsp_ready),
        .if_write          (next_wreq),
        .if_din            (valid_length),
        .if_empty_n        (wrsp_valid),
        .if_read           (wrsp_read),
        .if_dout           (wrsp_type), // 1 - valid length request, 0 - invalid length request
        .if_num_data_valid ());
    kernel3_gmem_C_m_axi_fifo #(
        .DATA_WIDTH        (1),
        .ADDR_WIDTH        (log2(USER_MAXREQS)),
        .DEPTH             (USER_MAXREQS)
    ) user_resp (
        .clk               (ACLK),
        .reset             (ARESET),
        .clk_en            (ACLK_EN),
        .if_full_n         (ursp_ready),
        .if_write          (ursp_write),
        .if_din            (1'b1),
        .if_empty_n        (out_HLS_BVALID),
        .if_read           (in_HLS_BREADY),
        .if_dout           (),
        .if_num_data_valid ());
    assign ursp_write  = wrsp_valid && (!wrsp_type || in_AXI_BVALID);
    assign wrsp_read   = ursp_ready && ursp_write;
    assign out_AXI_BREADY = wrsp_type && ursp_ready;
endmodule
