`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO = "vadd_bw_vadd_bw,hls_ip_2022_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu50-fsvh2104-2-e,HLS_INPUT_CLOCK=3.330000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=246,HLS_SYN_LUT=424,HLS_VERSION=2022_2}" *)


module vadd_bw
(
  s_axi_control_AWVALID,
  s_axi_control_AWREADY,
  s_axi_control_AWADDR,
  s_axi_control_WVALID,
  s_axi_control_WREADY,
  s_axi_control_WDATA,
  s_axi_control_WSTRB,
  s_axi_control_ARVALID,
  s_axi_control_ARREADY,
  s_axi_control_ARADDR,
  s_axi_control_RVALID,
  s_axi_control_RREADY,
  s_axi_control_RDATA,
  s_axi_control_RRESP,
  s_axi_control_BVALID,
  s_axi_control_BREADY,
  s_axi_control_BRESP,
  ap_clk,
  ap_rst_n,
  interrupt,
  m_axi_rmem0_ARADDR,
  m_axi_rmem0_ARBURST,
  m_axi_rmem0_ARCACHE,
  m_axi_rmem0_ARID,
  m_axi_rmem0_ARLEN,
  m_axi_rmem0_ARLOCK,
  m_axi_rmem0_ARPROT,
  m_axi_rmem0_ARQOS,
  m_axi_rmem0_ARREADY,
  m_axi_rmem0_ARSIZE,
  m_axi_rmem0_ARVALID,
  m_axi_rmem0_AWADDR,
  m_axi_rmem0_AWBURST,
  m_axi_rmem0_AWCACHE,
  m_axi_rmem0_AWID,
  m_axi_rmem0_AWLEN,
  m_axi_rmem0_AWLOCK,
  m_axi_rmem0_AWPROT,
  m_axi_rmem0_AWQOS,
  m_axi_rmem0_AWREADY,
  m_axi_rmem0_AWSIZE,
  m_axi_rmem0_AWVALID,
  m_axi_rmem0_BID,
  m_axi_rmem0_BREADY,
  m_axi_rmem0_BRESP,
  m_axi_rmem0_BVALID,
  m_axi_rmem0_RDATA,
  m_axi_rmem0_RID,
  m_axi_rmem0_RLAST,
  m_axi_rmem0_RREADY,
  m_axi_rmem0_RRESP,
  m_axi_rmem0_RVALID,
  m_axi_rmem0_WDATA,
  m_axi_rmem0_WLAST,
  m_axi_rmem0_WREADY,
  m_axi_rmem0_WSTRB,
  m_axi_rmem0_WVALID,
  m_axi_wmem0_ARADDR,
  m_axi_wmem0_ARBURST,
  m_axi_wmem0_ARCACHE,
  m_axi_wmem0_ARID,
  m_axi_wmem0_ARLEN,
  m_axi_wmem0_ARLOCK,
  m_axi_wmem0_ARPROT,
  m_axi_wmem0_ARQOS,
  m_axi_wmem0_ARREADY,
  m_axi_wmem0_ARSIZE,
  m_axi_wmem0_ARVALID,
  m_axi_wmem0_AWADDR,
  m_axi_wmem0_AWBURST,
  m_axi_wmem0_AWCACHE,
  m_axi_wmem0_AWID,
  m_axi_wmem0_AWLEN,
  m_axi_wmem0_AWLOCK,
  m_axi_wmem0_AWPROT,
  m_axi_wmem0_AWQOS,
  m_axi_wmem0_AWREADY,
  m_axi_wmem0_AWSIZE,
  m_axi_wmem0_AWVALID,
  m_axi_wmem0_BID,
  m_axi_wmem0_BREADY,
  m_axi_wmem0_BRESP,
  m_axi_wmem0_BVALID,
  m_axi_wmem0_RDATA,
  m_axi_wmem0_RID,
  m_axi_wmem0_RLAST,
  m_axi_wmem0_RREADY,
  m_axi_wmem0_RRESP,
  m_axi_wmem0_RVALID,
  m_axi_wmem0_WDATA,
  m_axi_wmem0_WLAST,
  m_axi_wmem0_WREADY,
  m_axi_wmem0_WSTRB,
  m_axi_wmem0_WVALID
);

  parameter C_S_AXI_CONTROL_DATA_WIDTH = 32;
  parameter C_S_AXI_CONTROL_ADDR_WIDTH = 6;
  parameter C_S_AXI_DATA_WIDTH = 32;
  parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 32 / 8;
  parameter C_S_AXI_WSTRB_WIDTH = 32 / 8;
  (* RS_HS = "s_axi_control_AW.valid" *)input s_axi_control_AWVALID;
  (* RS_HS = "s_axi_control_AW.ready" *)output s_axi_control_AWREADY;
  (* RS_HS = "s_axi_control_AW.data" *)input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_AWADDR;
  (* RS_HS = "s_axi_control_W.valid" *)input s_axi_control_WVALID;
  (* RS_HS = "s_axi_control_W.ready" *)output s_axi_control_WREADY;
  (* RS_HS = "s_axi_control_W.data" *)input [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_WDATA;
  (* RS_HS = "s_axi_control_W.data" *)input [C_S_AXI_CONTROL_WSTRB_WIDTH-1:0] s_axi_control_WSTRB;
  (* RS_HS = "s_axi_control_AR.valid" *)input s_axi_control_ARVALID;
  (* RS_HS = "s_axi_control_AR.ready" *)output s_axi_control_ARREADY;
  (* RS_HS = "s_axi_control_AR.data" *)input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_ARADDR;
  (* RS_HS = "s_axi_control_R.valid" *)output s_axi_control_RVALID;
  (* RS_HS = "s_axi_control_R.ready" *)input s_axi_control_RREADY;
  (* RS_HS = "s_axi_control_R.data" *)output [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_RDATA;
  (* RS_HS = "s_axi_control_R.data" *)output [1:0] s_axi_control_RRESP;
  (* RS_HS = "s_axi_control_B.valid" *)output s_axi_control_BVALID;
  (* RS_HS = "s_axi_control_B.ready" *)input s_axi_control_BREADY;
  (* RS_HS = "s_axi_control_B.data" *)output [1:0] s_axi_control_BRESP;
  (* RS_CLK *)input ap_clk;
  (* RS_RST = "ff" *)input ap_rst_n;
  (* RS_FF = "interrupt" *)output interrupt;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [63:0] m_axi_rmem0_ARADDR;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [1:0] m_axi_rmem0_ARBURST;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [3:0] m_axi_rmem0_ARCACHE;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [0:0] m_axi_rmem0_ARID;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [7:0] m_axi_rmem0_ARLEN;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output m_axi_rmem0_ARLOCK;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [2:0] m_axi_rmem0_ARPROT;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [3:0] m_axi_rmem0_ARQOS;
  (* RS_HS = "m_axi_rmem0_AR.ready" *)input m_axi_rmem0_ARREADY;
  (* RS_HS = "m_axi_rmem0_AR.data" *)output [2:0] m_axi_rmem0_ARSIZE;
  (* RS_HS = "m_axi_rmem0_AR.valid" *)output m_axi_rmem0_ARVALID;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [63:0] m_axi_rmem0_AWADDR;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [1:0] m_axi_rmem0_AWBURST;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [3:0] m_axi_rmem0_AWCACHE;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [0:0] m_axi_rmem0_AWID;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [7:0] m_axi_rmem0_AWLEN;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output m_axi_rmem0_AWLOCK;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [2:0] m_axi_rmem0_AWPROT;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [3:0] m_axi_rmem0_AWQOS;
  (* RS_HS = "m_axi_rmem0_AW.ready" *)input m_axi_rmem0_AWREADY;
  (* RS_HS = "m_axi_rmem0_AW.data" *)output [2:0] m_axi_rmem0_AWSIZE;
  (* RS_HS = "m_axi_rmem0_AW.valid" *)output m_axi_rmem0_AWVALID;
  (* RS_HS = "m_axi_rmem0_B.data" *)input [0:0] m_axi_rmem0_BID;
  (* RS_HS = "m_axi_rmem0_B.ready" *)output m_axi_rmem0_BREADY;
  (* RS_HS = "m_axi_rmem0_B.data" *)input [1:0] m_axi_rmem0_BRESP;
  (* RS_HS = "m_axi_rmem0_B.valid" *)input m_axi_rmem0_BVALID;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [255:0] m_axi_rmem0_RDATA;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [0:0] m_axi_rmem0_RID;
  (* RS_HS = "m_axi_rmem0_R.data" *)input m_axi_rmem0_RLAST;
  (* RS_HS = "m_axi_rmem0_R.ready" *)output m_axi_rmem0_RREADY;
  (* RS_HS = "m_axi_rmem0_R.data" *)input [1:0] m_axi_rmem0_RRESP;
  (* RS_HS = "m_axi_rmem0_R.valid" *)input m_axi_rmem0_RVALID;
  (* RS_HS = "m_axi_rmem0_W.data" *)output [255:0] m_axi_rmem0_WDATA;
  (* RS_HS = "m_axi_rmem0_W.data" *)output m_axi_rmem0_WLAST;
  (* RS_HS = "m_axi_rmem0_W.ready" *)input m_axi_rmem0_WREADY;
  (* RS_HS = "m_axi_rmem0_W.data" *)output [31:0] m_axi_rmem0_WSTRB;
  (* RS_HS = "m_axi_rmem0_W.valid" *)output m_axi_rmem0_WVALID;
  (* RS_HS = "m_axi_wmem0_AR.data" *)output [63:0] m_axi_wmem0_ARADDR;
  (* RS_HS = "m_axi_wmem0_AR.data" *)output [1:0] m_axi_wmem0_ARBURST;
  (* RS_HS = "m_axi_wmem0_AR.data" *)output [3:0] m_axi_wmem0_ARCACHE;
  (* RS_HS = "m_axi_wmem0_AR.data" *)output [0:0] m_axi_wmem0_ARID;
  (* RS_HS = "m_axi_wmem0_AR.data" *)output [7:0] m_axi_wmem0_ARLEN;
  (* RS_HS = "m_axi_wmem0_AR.data" *)output m_axi_wmem0_ARLOCK;
  (* RS_HS = "m_axi_wmem0_AR.data" *)output [2:0] m_axi_wmem0_ARPROT;
  (* RS_HS = "m_axi_wmem0_AR.data" *)output [3:0] m_axi_wmem0_ARQOS;
  (* RS_HS = "m_axi_wmem0_AR.ready" *)input m_axi_wmem0_ARREADY;
  (* RS_HS = "m_axi_wmem0_AR.data" *)output [2:0] m_axi_wmem0_ARSIZE;
  (* RS_HS = "m_axi_wmem0_AR.valid" *)output m_axi_wmem0_ARVALID;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [63:0] m_axi_wmem0_AWADDR;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [1:0] m_axi_wmem0_AWBURST;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [3:0] m_axi_wmem0_AWCACHE;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [0:0] m_axi_wmem0_AWID;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [7:0] m_axi_wmem0_AWLEN;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output m_axi_wmem0_AWLOCK;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [2:0] m_axi_wmem0_AWPROT;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [3:0] m_axi_wmem0_AWQOS;
  (* RS_HS = "m_axi_wmem0_AW.ready" *)input m_axi_wmem0_AWREADY;
  (* RS_HS = "m_axi_wmem0_AW.data" *)output [2:0] m_axi_wmem0_AWSIZE;
  (* RS_HS = "m_axi_wmem0_AW.valid" *)output m_axi_wmem0_AWVALID;
  (* RS_HS = "m_axi_wmem0_B.data" *)input [0:0] m_axi_wmem0_BID;
  (* RS_HS = "m_axi_wmem0_B.ready" *)output m_axi_wmem0_BREADY;
  (* RS_HS = "m_axi_wmem0_B.data" *)input [1:0] m_axi_wmem0_BRESP;
  (* RS_HS = "m_axi_wmem0_B.valid" *)input m_axi_wmem0_BVALID;
  (* RS_HS = "m_axi_wmem0_R.data" *)input [255:0] m_axi_wmem0_RDATA;
  (* RS_HS = "m_axi_wmem0_R.data" *)input [0:0] m_axi_wmem0_RID;
  (* RS_HS = "m_axi_wmem0_R.data" *)input m_axi_wmem0_RLAST;
  (* RS_HS = "m_axi_wmem0_R.ready" *)output m_axi_wmem0_RREADY;
  (* RS_HS = "m_axi_wmem0_R.data" *)input [1:0] m_axi_wmem0_RRESP;
  (* RS_HS = "m_axi_wmem0_R.valid" *)input m_axi_wmem0_RVALID;
  (* RS_HS = "m_axi_wmem0_W.data" *)output [255:0] m_axi_wmem0_WDATA;
  (* RS_HS = "m_axi_wmem0_W.data" *)output m_axi_wmem0_WLAST;
  (* RS_HS = "m_axi_wmem0_W.ready" *)input m_axi_wmem0_WREADY;
  (* RS_HS = "m_axi_wmem0_W.data" *)output [31:0] m_axi_wmem0_WSTRB;
  (* RS_HS = "m_axi_wmem0_W.valid" *)output m_axi_wmem0_WVALID;
  wire ap_start;
  wire [63:0] rmem0;
  wire [63:0] wmem0;
  wire [63:0] n;
  wire [256:0] q0_vadd_bw__dout;
  wire q0_vadd_bw__empty_n;
  wire q0_vadd_bw__read;
  wire [256:0] q0_vadd_bw__din;
  wire q0_vadd_bw__full_n;
  wire q0_vadd_bw__write;
  wire [256:0] q1_vadd_bw__dout;
  wire q1_vadd_bw__empty_n;
  wire q1_vadd_bw__read;
  wire [256:0] q1_vadd_bw__din;
  wire q1_vadd_bw__full_n;
  wire q1_vadd_bw__write;
  wire [63:0] Mmap2Stream_0___n__q0;
  wire [63:0] Mmap2Stream_0___rmem0__q0;
  wire Mmap2Stream_0__ap_start;
  wire Mmap2Stream_0__ap_ready;
  wire Mmap2Stream_0__ap_done;
  wire Mmap2Stream_0__ap_idle;
  wire [63:0] Stream2Mmap_0___n__q0;
  wire [63:0] Stream2Mmap_0___wmem0__q0;
  wire Stream2Mmap_0__ap_start;
  wire Stream2Mmap_0__ap_ready;
  wire Stream2Mmap_0__ap_done;
  wire Stream2Mmap_0__ap_idle;
  wire [63:0] yshift_0___n__q0;
  wire yshift_0__ap_start;
  wire yshift_0__ap_ready;
  wire yshift_0__ap_done;
  wire yshift_0__ap_idle;
  wire ap_rst_n_inv;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;

  vadd_bw_control_s_axi
  #(
    .C_S_AXI_ADDR_WIDTH(C_S_AXI_CONTROL_ADDR_WIDTH),
    .C_S_AXI_DATA_WIDTH(C_S_AXI_CONTROL_DATA_WIDTH)
  )
  control_s_axi_U
  (
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .rmem0(rmem0),
    .wmem0(wmem0),
    .n(n),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(257),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  q0_vadd_bw
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(q0_vadd_bw__dout),
    .if_empty_n(q0_vadd_bw__empty_n),
    .if_read(q0_vadd_bw__read),
    .if_read_ce(1'b1),
    .if_din(q0_vadd_bw__din),
    .if_full_n(q0_vadd_bw__full_n),
    .if_write(q0_vadd_bw__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) fifo
  #(
    .DATA_WIDTH(257),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  q1_vadd_bw
  (
    .clk(ap_clk),
    .reset(~ap_rst_n),
    .if_dout(q1_vadd_bw__dout),
    .if_empty_n(q1_vadd_bw__empty_n),
    .if_read(q1_vadd_bw__read),
    .if_read_ce(1'b1),
    .if_din(q1_vadd_bw__din),
    .if_full_n(q1_vadd_bw__full_n),
    .if_write(q1_vadd_bw__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *) Mmap2Stream
  Mmap2Stream_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Mmap2Stream_0__ap_start),
    .ap_done(Mmap2Stream_0__ap_done),
    .ap_idle(Mmap2Stream_0__ap_idle),
    .ap_ready(Mmap2Stream_0__ap_ready),
    .n(Mmap2Stream_0___n__q0),
    .stream_din(q0_vadd_bw__din),
    .stream_full_n(q0_vadd_bw__full_n),
    .stream_write(q0_vadd_bw__write),
    .m_axi_mmap_ARADDR(m_axi_rmem0_ARADDR),
    .m_axi_mmap_ARBURST(m_axi_rmem0_ARBURST),
    .m_axi_mmap_ARID(m_axi_rmem0_ARID),
    .m_axi_mmap_ARLEN(m_axi_rmem0_ARLEN),
    .m_axi_mmap_ARREADY(m_axi_rmem0_ARREADY),
    .m_axi_mmap_ARSIZE(m_axi_rmem0_ARSIZE),
    .m_axi_mmap_ARVALID(m_axi_rmem0_ARVALID),
    .m_axi_mmap_AWADDR(m_axi_rmem0_AWADDR),
    .m_axi_mmap_AWBURST(m_axi_rmem0_AWBURST),
    .m_axi_mmap_AWID(m_axi_rmem0_AWID),
    .m_axi_mmap_AWLEN(m_axi_rmem0_AWLEN),
    .m_axi_mmap_AWREADY(m_axi_rmem0_AWREADY),
    .m_axi_mmap_AWSIZE(m_axi_rmem0_AWSIZE),
    .m_axi_mmap_AWVALID(m_axi_rmem0_AWVALID),
    .m_axi_mmap_BID(m_axi_rmem0_BID),
    .m_axi_mmap_BREADY(m_axi_rmem0_BREADY),
    .m_axi_mmap_BRESP(m_axi_rmem0_BRESP),
    .m_axi_mmap_BVALID(m_axi_rmem0_BVALID),
    .m_axi_mmap_RDATA(m_axi_rmem0_RDATA),
    .m_axi_mmap_RID(m_axi_rmem0_RID),
    .m_axi_mmap_RLAST(m_axi_rmem0_RLAST),
    .m_axi_mmap_RREADY(m_axi_rmem0_RREADY),
    .m_axi_mmap_RRESP(m_axi_rmem0_RRESP),
    .m_axi_mmap_RVALID(m_axi_rmem0_RVALID),
    .m_axi_mmap_WDATA(m_axi_rmem0_WDATA),
    .m_axi_mmap_WLAST(m_axi_rmem0_WLAST),
    .m_axi_mmap_WREADY(m_axi_rmem0_WREADY),
    .m_axi_mmap_WSTRB(m_axi_rmem0_WSTRB),
    .m_axi_mmap_WVALID(m_axi_rmem0_WVALID),
    .m_axi_mmap_ARLOCK(m_axi_rmem0_ARLOCK),
    .m_axi_mmap_ARPROT(m_axi_rmem0_ARPROT),
    .m_axi_mmap_ARQOS(m_axi_rmem0_ARQOS),
    .m_axi_mmap_ARCACHE(m_axi_rmem0_ARCACHE),
    .m_axi_mmap_AWCACHE(m_axi_rmem0_AWCACHE),
    .m_axi_mmap_AWLOCK(m_axi_rmem0_AWLOCK),
    .m_axi_mmap_AWPROT(m_axi_rmem0_AWPROT),
    .m_axi_mmap_AWQOS(m_axi_rmem0_AWQOS),
    .mmap_offset(Mmap2Stream_0___rmem0__q0)
  );


  (* keep_hierarchy = "yes" *) Stream2Mmap
  Stream2Mmap_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(Stream2Mmap_0__ap_start),
    .ap_done(Stream2Mmap_0__ap_done),
    .ap_idle(Stream2Mmap_0__ap_idle),
    .ap_ready(Stream2Mmap_0__ap_ready),
    .n(Stream2Mmap_0___n__q0),
    .stream_s_dout(q1_vadd_bw__dout),
    .stream_peek_dout(q1_vadd_bw__dout),
    .stream_s_empty_n(q1_vadd_bw__empty_n),
    .stream_peek_empty_n(q1_vadd_bw__empty_n),
    .stream_s_read(q1_vadd_bw__read),
    .stream_peek_read(),
    .m_axi_mmap_ARADDR(m_axi_wmem0_ARADDR),
    .m_axi_mmap_ARBURST(m_axi_wmem0_ARBURST),
    .m_axi_mmap_ARID(m_axi_wmem0_ARID),
    .m_axi_mmap_ARLEN(m_axi_wmem0_ARLEN),
    .m_axi_mmap_ARREADY(m_axi_wmem0_ARREADY),
    .m_axi_mmap_ARSIZE(m_axi_wmem0_ARSIZE),
    .m_axi_mmap_ARVALID(m_axi_wmem0_ARVALID),
    .m_axi_mmap_AWADDR(m_axi_wmem0_AWADDR),
    .m_axi_mmap_AWBURST(m_axi_wmem0_AWBURST),
    .m_axi_mmap_AWID(m_axi_wmem0_AWID),
    .m_axi_mmap_AWLEN(m_axi_wmem0_AWLEN),
    .m_axi_mmap_AWREADY(m_axi_wmem0_AWREADY),
    .m_axi_mmap_AWSIZE(m_axi_wmem0_AWSIZE),
    .m_axi_mmap_AWVALID(m_axi_wmem0_AWVALID),
    .m_axi_mmap_BID(m_axi_wmem0_BID),
    .m_axi_mmap_BREADY(m_axi_wmem0_BREADY),
    .m_axi_mmap_BRESP(m_axi_wmem0_BRESP),
    .m_axi_mmap_BVALID(m_axi_wmem0_BVALID),
    .m_axi_mmap_RDATA(m_axi_wmem0_RDATA),
    .m_axi_mmap_RID(m_axi_wmem0_RID),
    .m_axi_mmap_RLAST(m_axi_wmem0_RLAST),
    .m_axi_mmap_RREADY(m_axi_wmem0_RREADY),
    .m_axi_mmap_RRESP(m_axi_wmem0_RRESP),
    .m_axi_mmap_RVALID(m_axi_wmem0_RVALID),
    .m_axi_mmap_WDATA(m_axi_wmem0_WDATA),
    .m_axi_mmap_WLAST(m_axi_wmem0_WLAST),
    .m_axi_mmap_WREADY(m_axi_wmem0_WREADY),
    .m_axi_mmap_WSTRB(m_axi_wmem0_WSTRB),
    .m_axi_mmap_WVALID(m_axi_wmem0_WVALID),
    .m_axi_mmap_ARLOCK(m_axi_wmem0_ARLOCK),
    .m_axi_mmap_ARPROT(m_axi_wmem0_ARPROT),
    .m_axi_mmap_ARQOS(m_axi_wmem0_ARQOS),
    .m_axi_mmap_ARCACHE(m_axi_wmem0_ARCACHE),
    .m_axi_mmap_AWCACHE(m_axi_wmem0_AWCACHE),
    .m_axi_mmap_AWLOCK(m_axi_wmem0_AWLOCK),
    .m_axi_mmap_AWPROT(m_axi_wmem0_AWPROT),
    .m_axi_mmap_AWQOS(m_axi_wmem0_AWQOS),
    .mmap_offset(Stream2Mmap_0___wmem0__q0)
  );


  (* keep_hierarchy = "yes" *) yshift
  yshift_0
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(yshift_0__ap_start),
    .ap_done(yshift_0__ap_done),
    .ap_idle(yshift_0__ap_idle),
    .ap_ready(yshift_0__ap_ready),
    .n(yshift_0___n__q0),
    .a_s_dout(q0_vadd_bw__dout),
    .a_peek_dout(q0_vadd_bw__dout),
    .a_s_empty_n(q0_vadd_bw__empty_n),
    .a_peek_empty_n(q0_vadd_bw__empty_n),
    .a_s_read(q0_vadd_bw__read),
    .a_peek_read(),
    .b_din(q1_vadd_bw__din),
    .b_full_n(q1_vadd_bw__full_n),
    .b_write(q1_vadd_bw__write)
  );


  (* keep_hierarchy = "yes" *) vadd_bw_fsm
  __tapa_fsm_unit
  (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .n(n),
    .rmem0(rmem0),
    .wmem0(wmem0),
    .Mmap2Stream_0___n__q0(Mmap2Stream_0___n__q0),
    .Mmap2Stream_0___rmem0__q0(Mmap2Stream_0___rmem0__q0),
    .Mmap2Stream_0__ap_start(Mmap2Stream_0__ap_start),
    .Mmap2Stream_0__ap_ready(Mmap2Stream_0__ap_ready),
    .Mmap2Stream_0__ap_done(Mmap2Stream_0__ap_done),
    .Mmap2Stream_0__ap_idle(Mmap2Stream_0__ap_idle),
    .Stream2Mmap_0___n__q0(Stream2Mmap_0___n__q0),
    .Stream2Mmap_0___wmem0__q0(Stream2Mmap_0___wmem0__q0),
    .Stream2Mmap_0__ap_start(Stream2Mmap_0__ap_start),
    .Stream2Mmap_0__ap_ready(Stream2Mmap_0__ap_ready),
    .Stream2Mmap_0__ap_done(Stream2Mmap_0__ap_done),
    .Stream2Mmap_0__ap_idle(Stream2Mmap_0__ap_idle),
    .yshift_0___n__q0(yshift_0___n__q0),
    .yshift_0__ap_start(yshift_0__ap_start),
    .yshift_0__ap_ready(yshift_0__ap_ready),
    .yshift_0__ap_done(yshift_0__ap_done),
    .yshift_0__ap_idle(yshift_0__ap_idle)
  );

  assign ap_rst_n_inv = (~ap_rst_n);

endmodule
