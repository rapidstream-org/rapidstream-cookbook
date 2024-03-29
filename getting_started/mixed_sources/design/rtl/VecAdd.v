`timescale 1 ns / 1 ps

module VecAdd
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
  system_clock,
  ap_rst_n,
  interrupt,
  m_axi_a_ARADDR,
  m_axi_a_ARBURST,
  m_axi_a_ARCACHE,
  m_axi_a_ARID,
  m_axi_a_ARLEN,
  m_axi_a_ARLOCK,
  m_axi_a_ARPROT,
  m_axi_a_ARQOS,
  m_axi_a_ARREADY,
  m_axi_a_ARSIZE,
  m_axi_a_ARVALID,
  m_axi_a_AWADDR,
  m_axi_a_AWBURST,
  m_axi_a_AWCACHE,
  m_axi_a_AWID,
  m_axi_a_AWLEN,
  m_axi_a_AWLOCK,
  m_axi_a_AWPROT,
  m_axi_a_AWQOS,
  m_axi_a_AWREADY,
  m_axi_a_AWSIZE,
  m_axi_a_AWVALID,
  m_axi_a_BID,
  m_axi_a_BREADY,
  m_axi_a_BRESP,
  m_axi_a_BVALID,
  m_axi_a_RDATA,
  m_axi_a_RID,
  m_axi_a_RLAST,
  m_axi_a_RREADY,
  m_axi_a_RRESP,
  m_axi_a_RVALID,
  m_axi_a_WDATA,
  m_axi_a_WLAST,
  m_axi_a_WREADY,
  m_axi_a_WSTRB,
  m_axi_a_WVALID,
  m_axi_b_ARADDR,
  m_axi_b_ARBURST,
  m_axi_b_ARCACHE,
  m_axi_b_ARID,
  m_axi_b_ARLEN,
  m_axi_b_ARLOCK,
  m_axi_b_ARPROT,
  m_axi_b_ARQOS,
  m_axi_b_ARREADY,
  m_axi_b_ARSIZE,
  m_axi_b_ARVALID,
  m_axi_b_AWADDR,
  m_axi_b_AWBURST,
  m_axi_b_AWCACHE,
  m_axi_b_AWID,
  m_axi_b_AWLEN,
  m_axi_b_AWLOCK,
  m_axi_b_AWPROT,
  m_axi_b_AWQOS,
  m_axi_b_AWREADY,
  m_axi_b_AWSIZE,
  m_axi_b_AWVALID,
  m_axi_b_BID,
  m_axi_b_BREADY,
  m_axi_b_BRESP,
  m_axi_b_BVALID,
  m_axi_b_RDATA,
  m_axi_b_RID,
  m_axi_b_RLAST,
  m_axi_b_RREADY,
  m_axi_b_RRESP,
  m_axi_b_RVALID,
  m_axi_b_WDATA,
  m_axi_b_WLAST,
  m_axi_b_WREADY,
  m_axi_b_WSTRB,
  m_axi_b_WVALID,
  m_axi_c_ARADDR,
  m_axi_c_ARBURST,
  m_axi_c_ARCACHE,
  m_axi_c_ARID,
  m_axi_c_ARLEN,
  m_axi_c_ARLOCK,
  m_axi_c_ARPROT,
  m_axi_c_ARQOS,
  m_axi_c_ARREADY,
  m_axi_c_ARSIZE,
  m_axi_c_ARVALID,
  m_axi_c_AWADDR,
  m_axi_c_AWBURST,
  m_axi_c_AWCACHE,
  m_axi_c_AWID,
  m_axi_c_AWLEN,
  m_axi_c_AWLOCK,
  m_axi_c_AWPROT,
  m_axi_c_AWQOS,
  m_axi_c_AWREADY,
  m_axi_c_AWSIZE,
  m_axi_c_AWVALID,
  m_axi_c_BID,
  m_axi_c_BREADY,
  m_axi_c_BRESP,
  m_axi_c_BVALID,
  m_axi_c_RDATA,
  m_axi_c_RID,
  m_axi_c_RLAST,
  m_axi_c_RREADY,
  m_axi_c_RRESP,
  m_axi_c_RVALID,
  m_axi_c_WDATA,
  m_axi_c_WLAST,
  m_axi_c_WREADY,
  m_axi_c_WSTRB,
  m_axi_c_WVALID
);

  parameter C_S_AXI_CONTROL_DATA_WIDTH = 32;
  parameter C_S_AXI_CONTROL_ADDR_WIDTH = 6;
  parameter C_S_AXI_DATA_WIDTH = 32;
  parameter C_S_AXI_CONTROL_WSTRB_WIDTH = 32 / 8;
  parameter C_S_AXI_WSTRB_WIDTH = 32 / 8;

  (* RS_HS = "s_axi_control_AW.valid" *) input s_axi_control_AWVALID;
  (* RS_HS = "s_axi_control_AW.ready" *) output s_axi_control_AWREADY;
  (* RS_HS = "s_axi_control_AW.data" *) input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_AWADDR;
  (* RS_HS = "s_axi_control_W.valid" *) input s_axi_control_WVALID;
  (* RS_HS = "s_axi_control_W.ready" *) output s_axi_control_WREADY;
  (* RS_HS = "s_axi_control_W.data" *) input [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_WDATA;
  (* RS_HS = "s_axi_control_W.data" *) input [C_S_AXI_CONTROL_WSTRB_WIDTH-1:0] s_axi_control_WSTRB;
  (* RS_HS = "s_axi_control_AR.valid" *) input s_axi_control_ARVALID;
  (* RS_HS = "s_axi_control_AR.ready" *) output s_axi_control_ARREADY;
  (* RS_HS = "s_axi_control_AR.data" *) input [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_ARADDR;
  (* RS_HS = "s_axi_control_R.valid" *) output s_axi_control_RVALID;
  (* RS_HS = "s_axi_control_R.ready" *) input s_axi_control_RREADY;
  (* RS_HS = "s_axi_control_R.data" *) output [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_RDATA;
  (* RS_HS = "s_axi_control_R.data" *) output [1:0] s_axi_control_RRESP;
  (* RS_HS = "s_axi_control_B.valid" *) output s_axi_control_BVALID;
  (* RS_HS = "s_axi_control_B.ready" *) input s_axi_control_BREADY;
  (* RS_HS = "s_axi_control_B.data" *) output [1:0] s_axi_control_BRESP;
  (* RS_CLK *) input system_clock;
  (* RS_RST = "ff" *) input ap_rst_n;
  (* RS_FF = "interrupt" *) output interrupt;
  (* RS_HS = "m_axi_a_AR.data" *) output [63:0] m_axi_a_ARADDR;
  (* RS_HS = "m_axi_a_AR.data" *) output [1:0] m_axi_a_ARBURST;
  (* RS_HS = "m_axi_a_AR.data" *) output [3:0] m_axi_a_ARCACHE;
  (* RS_HS = "m_axi_a_AR.data" *) output [0:0] m_axi_a_ARID;
  (* RS_HS = "m_axi_a_AR.data" *) output [7:0] m_axi_a_ARLEN;
  (* RS_HS = "m_axi_a_AR.data" *) output m_axi_a_ARLOCK;
  (* RS_HS = "m_axi_a_AR.data" *) output [2:0] m_axi_a_ARPROT;
  (* RS_HS = "m_axi_a_AR.data" *) output [3:0] m_axi_a_ARQOS;
  (* RS_HS = "m_axi_a_AR.ready" *) input m_axi_a_ARREADY;
  (* RS_HS = "m_axi_a_AR.data" *) output [2:0] m_axi_a_ARSIZE;
  (* RS_HS = "m_axi_a_AR.valid" *) output m_axi_a_ARVALID;
  (* RS_HS = "m_axi_a_AW.data" *) output [63:0] m_axi_a_AWADDR;
  (* RS_HS = "m_axi_a_AW.data" *) output [1:0] m_axi_a_AWBURST;
  (* RS_HS = "m_axi_a_AW.data" *) output [3:0] m_axi_a_AWCACHE;
  (* RS_HS = "m_axi_a_AW.data" *) output [0:0] m_axi_a_AWID;
  (* RS_HS = "m_axi_a_AW.data" *) output [7:0] m_axi_a_AWLEN;
  (* RS_HS = "m_axi_a_AW.data" *) output m_axi_a_AWLOCK;
  (* RS_HS = "m_axi_a_AW.data" *) output [2:0] m_axi_a_AWPROT;
  (* RS_HS = "m_axi_a_AW.data" *) output [3:0] m_axi_a_AWQOS;
  (* RS_HS = "m_axi_a_AW.ready" *) input m_axi_a_AWREADY;
  (* RS_HS = "m_axi_a_AW.data" *) output [2:0] m_axi_a_AWSIZE;
  (* RS_HS = "m_axi_a_AW.valid" *) output m_axi_a_AWVALID;
  (* RS_HS = "m_axi_a_B.data" *) input [0:0] m_axi_a_BID;
  (* RS_HS = "m_axi_a_B.ready" *) output m_axi_a_BREADY;
  (* RS_HS = "m_axi_a_B.data" *) input [1:0] m_axi_a_BRESP;
  (* RS_HS = "m_axi_a_B.valid" *) input m_axi_a_BVALID;
  (* RS_HS = "m_axi_a_R.data" *) input [31:0] m_axi_a_RDATA;
  (* RS_HS = "m_axi_a_R.data" *) input [0:0] m_axi_a_RID;
  (* RS_HS = "m_axi_a_R.data" *) input m_axi_a_RLAST;
  (* RS_HS = "m_axi_a_R.ready" *) output m_axi_a_RREADY;
  (* RS_HS = "m_axi_a_R.data" *) input [1:0] m_axi_a_RRESP;
  (* RS_HS = "m_axi_a_R.valid" *) input m_axi_a_RVALID;
  (* RS_HS = "m_axi_a_W.data" *) output [31:0] m_axi_a_WDATA;
  (* RS_HS = "m_axi_a_W.data" *) output m_axi_a_WLAST;
  (* RS_HS = "m_axi_a_W.ready" *) input m_axi_a_WREADY;
  (* RS_HS = "m_axi_a_W.data" *) output [3:0] m_axi_a_WSTRB;
  (* RS_HS = "m_axi_a_W.valid" *) output m_axi_a_WVALID;
  (* RS_HS = "m_axi_b_AR.data" *) output [63:0] m_axi_b_ARADDR;
  (* RS_HS = "m_axi_b_AR.data" *) output [1:0] m_axi_b_ARBURST;
  (* RS_HS = "m_axi_b_AR.data" *) output [3:0] m_axi_b_ARCACHE;
  (* RS_HS = "m_axi_b_AR.data" *) output [0:0] m_axi_b_ARID;
  (* RS_HS = "m_axi_b_AR.data" *) output [7:0] m_axi_b_ARLEN;
  (* RS_HS = "m_axi_b_AR.data" *) output m_axi_b_ARLOCK;
  (* RS_HS = "m_axi_b_AR.data" *) output [2:0] m_axi_b_ARPROT;
  (* RS_HS = "m_axi_b_AR.data" *) output [3:0] m_axi_b_ARQOS;
  (* RS_HS = "m_axi_b_AR.ready" *) input m_axi_b_ARREADY;
  (* RS_HS = "m_axi_b_AR.data" *) output [2:0] m_axi_b_ARSIZE;
  (* RS_HS = "m_axi_b_AR.valid" *) output m_axi_b_ARVALID;
  (* RS_HS = "m_axi_b_AW.data" *) output [63:0] m_axi_b_AWADDR;
  (* RS_HS = "m_axi_b_AW.data" *) output [1:0] m_axi_b_AWBURST;
  (* RS_HS = "m_axi_b_AW.data" *) output [3:0] m_axi_b_AWCACHE;
  (* RS_HS = "m_axi_b_AW.data" *) output [0:0] m_axi_b_AWID;
  (* RS_HS = "m_axi_b_AW.data" *) output [7:0] m_axi_b_AWLEN;
  (* RS_HS = "m_axi_b_AW.data" *) output m_axi_b_AWLOCK;
  (* RS_HS = "m_axi_b_AW.data" *) output [2:0] m_axi_b_AWPROT;
  (* RS_HS = "m_axi_b_AW.data" *) output [3:0] m_axi_b_AWQOS;
  (* RS_HS = "m_axi_b_AW.ready" *) input m_axi_b_AWREADY;
  (* RS_HS = "m_axi_b_AW.data" *) output [2:0] m_axi_b_AWSIZE;
  (* RS_HS = "m_axi_b_AW.valid" *) output m_axi_b_AWVALID;
  (* RS_HS = "m_axi_b_B.data" *) input [0:0] m_axi_b_BID;
  (* RS_HS = "m_axi_b_B.ready" *) output m_axi_b_BREADY;
  (* RS_HS = "m_axi_b_B.data" *) input [1:0] m_axi_b_BRESP;
  (* RS_HS = "m_axi_b_B.valid" *) input m_axi_b_BVALID;
  (* RS_HS = "m_axi_b_R.data" *) input [31:0] m_axi_b_RDATA;
  (* RS_HS = "m_axi_b_R.data" *) input [0:0] m_axi_b_RID;
  (* RS_HS = "m_axi_b_R.data" *) input m_axi_b_RLAST;
  (* RS_HS = "m_axi_b_R.ready" *) output m_axi_b_RREADY;
  (* RS_HS = "m_axi_b_R.data" *) input [1:0] m_axi_b_RRESP;
  (* RS_HS = "m_axi_b_R.valid" *) input m_axi_b_RVALID;
  (* RS_HS = "m_axi_b_W.data" *) output [31:0] m_axi_b_WDATA;
  (* RS_HS = "m_axi_b_W.data" *) output m_axi_b_WLAST;
  (* RS_HS = "m_axi_b_W.ready" *) input m_axi_b_WREADY;
  (* RS_HS = "m_axi_b_W.data" *) output [3:0] m_axi_b_WSTRB;
  (* RS_HS = "m_axi_b_W.valid" *) output m_axi_b_WVALID;
  (* RS_HS = "m_axi_c_AR.data" *) output [63:0] m_axi_c_ARADDR;
  (* RS_HS = "m_axi_c_AR.data" *) output [1:0] m_axi_c_ARBURST;
  (* RS_HS = "m_axi_c_AR.data" *) output [3:0] m_axi_c_ARCACHE;
  (* RS_HS = "m_axi_c_AR.data" *) output [0:0] m_axi_c_ARID;
  (* RS_HS = "m_axi_c_AR.data" *) output [7:0] m_axi_c_ARLEN;
  (* RS_HS = "m_axi_c_AR.data" *) output m_axi_c_ARLOCK;
  (* RS_HS = "m_axi_c_AR.data" *) output [2:0] m_axi_c_ARPROT;
  (* RS_HS = "m_axi_c_AR.data" *) output [3:0] m_axi_c_ARQOS;
  (* RS_HS = "m_axi_c_AR.ready" *) input m_axi_c_ARREADY;
  (* RS_HS = "m_axi_c_AR.data" *) output [2:0] m_axi_c_ARSIZE;
  (* RS_HS = "m_axi_c_AR.valid" *) output m_axi_c_ARVALID;
  (* RS_HS = "m_axi_c_AW.data" *) output [63:0] m_axi_c_AWADDR;
  (* RS_HS = "m_axi_c_AW.data" *) output [1:0] m_axi_c_AWBURST;
  (* RS_HS = "m_axi_c_AW.data" *) output [3:0] m_axi_c_AWCACHE;
  (* RS_HS = "m_axi_c_AW.data" *) output [0:0] m_axi_c_AWID;
  (* RS_HS = "m_axi_c_AW.data" *) output [7:0] m_axi_c_AWLEN;
  (* RS_HS = "m_axi_c_AW.data" *) output m_axi_c_AWLOCK;
  (* RS_HS = "m_axi_c_AW.data" *) output [2:0] m_axi_c_AWPROT;
  (* RS_HS = "m_axi_c_AW.data" *) output [3:0] m_axi_c_AWQOS;
  (* RS_HS = "m_axi_c_AW.ready" *) input m_axi_c_AWREADY;
  (* RS_HS = "m_axi_c_AW.data" *) output [2:0] m_axi_c_AWSIZE;
  (* RS_HS = "m_axi_c_AW.valid" *) output m_axi_c_AWVALID;
  (* RS_HS = "m_axi_c_B.data" *) input [0:0] m_axi_c_BID;
  (* RS_HS = "m_axi_c_B.ready" *) output m_axi_c_BREADY;
  (* RS_HS = "m_axi_c_B.data" *) input [1:0] m_axi_c_BRESP;
  (* RS_HS = "m_axi_c_B.valid" *) input m_axi_c_BVALID;
  (* RS_HS = "m_axi_c_R.data" *) input [31:0] m_axi_c_RDATA;
  (* RS_HS = "m_axi_c_R.data" *) input [0:0] m_axi_c_RID;
  (* RS_HS = "m_axi_c_R.data" *) input m_axi_c_RLAST;
  (* RS_HS = "m_axi_c_R.ready" *) output m_axi_c_RREADY;
  (* RS_HS = "m_axi_c_R.data" *) input [1:0] m_axi_c_RRESP;
  (* RS_HS = "m_axi_c_R.valid" *) input m_axi_c_RVALID;
  (* RS_HS = "m_axi_c_W.data" *) output [31:0] m_axi_c_WDATA;
  (* RS_HS = "m_axi_c_W.data" *) output m_axi_c_WLAST;
  (* RS_HS = "m_axi_c_W.ready" *) input m_axi_c_WREADY;
  (* RS_HS = "m_axi_c_W.data" *) output [3:0] m_axi_c_WSTRB;
  (* RS_HS = "m_axi_c_W.valid" *) output m_axi_c_WVALID;

  wire ap_start;
  wire [63:0] a;
  wire [63:0] b;
  wire [63:0] c;
  wire [63:0] n;
  wire [32:0] a_q_VecAdd__dout;
  wire a_q_VecAdd__empty_n;
  wire a_q_VecAdd__read;
  wire [32:0] a_q_VecAdd__din;
  wire a_q_VecAdd__full_n;
  wire a_q_VecAdd__write;
  wire [32:0] b_q_VecAdd__dout;
  wire b_q_VecAdd__empty_n;
  wire b_q_VecAdd__read;
  wire [32:0] b_q_VecAdd__din;
  wire b_q_VecAdd__full_n;
  wire b_q_VecAdd__write;
  wire [32:0] c_q_VecAdd__dout;
  wire c_q_VecAdd__empty_n;
  wire c_q_VecAdd__read;
  wire [32:0] c_q_VecAdd__din;
  wire c_q_VecAdd__full_n;
  wire c_q_VecAdd__write;
  wire [63:0] Add_0___n__q0;
  wire Add_0__ap_start;
  wire Add_0__ap_ready;
  wire Add_0__ap_done;
  wire Add_0__ap_idle;
  wire [63:0] Mmap2Stream_0___a__q0;
  wire [63:0] Mmap2Stream_0___n__q0;
  wire Mmap2Stream_0__ap_start;
  wire Mmap2Stream_0__ap_ready;
  wire Mmap2Stream_0__ap_done;
  wire Mmap2Stream_0__ap_idle;
  wire [63:0] Mmap2Stream_1___b__q0;
  wire [63:0] Mmap2Stream_1___n__q0;
  wire Mmap2Stream_1__ap_start;
  wire Mmap2Stream_1__ap_ready;
  wire Mmap2Stream_1__ap_done;
  wire Mmap2Stream_1__ap_idle;
  wire [63:0] Stream2Mmap_0___c__q0;
  wire [63:0] Stream2Mmap_0___n__q0;
  wire Stream2Mmap_0__ap_start;
  wire Stream2Mmap_0__ap_ready;
  wire Stream2Mmap_0__ap_done;
  wire Stream2Mmap_0__ap_idle;
  wire ap_rst_n_inv;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;

  VecAdd_control_s_axi
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
    .ACLK(system_clock),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .a(a),
    .b(b),
    .c(c),
    .n(n),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
  );


  (* keep_hierarchy = "yes" *)  fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  a_q_VecAdd
  (
    .clk(system_clock),
    .reset(~ap_rst_n),
    .if_dout(a_q_VecAdd__dout),
    .if_empty_n(a_q_VecAdd__empty_n),
    .if_read(a_q_VecAdd__read),
    .if_read_ce(1'b1),
    .if_din(a_q_VecAdd__din),
    .if_full_n(a_q_VecAdd__full_n),
    .if_write(a_q_VecAdd__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *)  fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  b_q_VecAdd
  (
    .clk(system_clock),
    .reset(~ap_rst_n),
    .if_dout(b_q_VecAdd__dout),
    .if_empty_n(b_q_VecAdd__empty_n),
    .if_read(b_q_VecAdd__read),
    .if_read_ce(1'b1),
    .if_din(b_q_VecAdd__din),
    .if_full_n(b_q_VecAdd__full_n),
    .if_write(b_q_VecAdd__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *)  fifo
  #(
    .DATA_WIDTH(33),
    .ADDR_WIDTH(1),
    .DEPTH(2)
  )
  c_q_VecAdd
  (
    .clk(system_clock),
    .reset(~ap_rst_n),
    .if_dout(c_q_VecAdd__dout),
    .if_empty_n(c_q_VecAdd__empty_n),
    .if_read(c_q_VecAdd__read),
    .if_read_ce(1'b1),
    .if_din(c_q_VecAdd__din),
    .if_full_n(c_q_VecAdd__full_n),
    .if_write(c_q_VecAdd__write),
    .if_write_ce(1'b1)
  );


  (* keep_hierarchy = "yes" *)  Add
  Add_0
  (
    .ap_clk(system_clock),
    .ap_rst_n(ap_rst_n),
    .ap_start(Add_0__ap_start),
    .ap_done(Add_0__ap_done),
    .ap_idle(Add_0__ap_idle),
    .ap_ready(Add_0__ap_ready),
    .a_s_dout(a_q_VecAdd__dout),
    .a_peek_dout(a_q_VecAdd__dout),
    .a_s_empty_n(a_q_VecAdd__empty_n),
    .a_peek_empty_n(a_q_VecAdd__empty_n),
    .a_s_read(a_q_VecAdd__read),
    .a_peek_read(),
    .b_s_dout(b_q_VecAdd__dout),
    .b_peek_dout(b_q_VecAdd__dout),
    .b_s_empty_n(b_q_VecAdd__empty_n),
    .b_peek_empty_n(b_q_VecAdd__empty_n),
    .b_s_read(b_q_VecAdd__read),
    .b_peek_read(),
    .c_din(c_q_VecAdd__din),
    .c_full_n(c_q_VecAdd__full_n),
    .c_write(c_q_VecAdd__write),
    .n(Add_0___n__q0)
  );


  (* keep_hierarchy = "yes" *)  Mmap2Stream
  Mmap2Stream_0
  (
    .ap_clk(system_clock),
    .ap_rst_n(ap_rst_n),
    .ap_start(Mmap2Stream_0__ap_start),
    .ap_done(Mmap2Stream_0__ap_done),
    .ap_idle(Mmap2Stream_0__ap_idle),
    .ap_ready(Mmap2Stream_0__ap_ready),
    .m_axi_mmap_ARADDR(m_axi_a_ARADDR),
    .m_axi_mmap_ARBURST(m_axi_a_ARBURST),
    .m_axi_mmap_ARID(m_axi_a_ARID),
    .m_axi_mmap_ARLEN(m_axi_a_ARLEN),
    .m_axi_mmap_ARREADY(m_axi_a_ARREADY),
    .m_axi_mmap_ARSIZE(m_axi_a_ARSIZE),
    .m_axi_mmap_ARVALID(m_axi_a_ARVALID),
    .m_axi_mmap_AWADDR(m_axi_a_AWADDR),
    .m_axi_mmap_AWBURST(m_axi_a_AWBURST),
    .m_axi_mmap_AWID(m_axi_a_AWID),
    .m_axi_mmap_AWLEN(m_axi_a_AWLEN),
    .m_axi_mmap_AWREADY(m_axi_a_AWREADY),
    .m_axi_mmap_AWSIZE(m_axi_a_AWSIZE),
    .m_axi_mmap_AWVALID(m_axi_a_AWVALID),
    .m_axi_mmap_BID(m_axi_a_BID),
    .m_axi_mmap_BREADY(m_axi_a_BREADY),
    .m_axi_mmap_BRESP(m_axi_a_BRESP),
    .m_axi_mmap_BVALID(m_axi_a_BVALID),
    .m_axi_mmap_RDATA(m_axi_a_RDATA),
    .m_axi_mmap_RID(m_axi_a_RID),
    .m_axi_mmap_RLAST(m_axi_a_RLAST),
    .m_axi_mmap_RREADY(m_axi_a_RREADY),
    .m_axi_mmap_RRESP(m_axi_a_RRESP),
    .m_axi_mmap_RVALID(m_axi_a_RVALID),
    .m_axi_mmap_WDATA(m_axi_a_WDATA),
    .m_axi_mmap_WLAST(m_axi_a_WLAST),
    .m_axi_mmap_WREADY(m_axi_a_WREADY),
    .m_axi_mmap_WSTRB(m_axi_a_WSTRB),
    .m_axi_mmap_WVALID(m_axi_a_WVALID),
    .m_axi_mmap_ARLOCK(m_axi_a_ARLOCK),
    .m_axi_mmap_ARPROT(m_axi_a_ARPROT),
    .m_axi_mmap_ARQOS(m_axi_a_ARQOS),
    .m_axi_mmap_ARCACHE(m_axi_a_ARCACHE),
    .m_axi_mmap_AWCACHE(m_axi_a_AWCACHE),
    .m_axi_mmap_AWLOCK(m_axi_a_AWLOCK),
    .m_axi_mmap_AWPROT(m_axi_a_AWPROT),
    .m_axi_mmap_AWQOS(m_axi_a_AWQOS),
    .mmap_offset(Mmap2Stream_0___a__q0),
    .stream_din(a_q_VecAdd__din),
    .stream_full_n(a_q_VecAdd__full_n),
    .stream_write(a_q_VecAdd__write),
    .n(Mmap2Stream_0___n__q0)
  );


  (* keep_hierarchy = "yes" *)  Mmap2Stream
  Mmap2Stream_1
  (
    .ap_clk(system_clock),
    .ap_rst_n(ap_rst_n),
    .ap_start(Mmap2Stream_1__ap_start),
    .ap_done(Mmap2Stream_1__ap_done),
    .ap_idle(Mmap2Stream_1__ap_idle),
    .ap_ready(Mmap2Stream_1__ap_ready),
    .m_axi_mmap_ARADDR(m_axi_b_ARADDR),
    .m_axi_mmap_ARBURST(m_axi_b_ARBURST),
    .m_axi_mmap_ARID(m_axi_b_ARID),
    .m_axi_mmap_ARLEN(m_axi_b_ARLEN),
    .m_axi_mmap_ARREADY(m_axi_b_ARREADY),
    .m_axi_mmap_ARSIZE(m_axi_b_ARSIZE),
    .m_axi_mmap_ARVALID(m_axi_b_ARVALID),
    .m_axi_mmap_AWADDR(m_axi_b_AWADDR),
    .m_axi_mmap_AWBURST(m_axi_b_AWBURST),
    .m_axi_mmap_AWID(m_axi_b_AWID),
    .m_axi_mmap_AWLEN(m_axi_b_AWLEN),
    .m_axi_mmap_AWREADY(m_axi_b_AWREADY),
    .m_axi_mmap_AWSIZE(m_axi_b_AWSIZE),
    .m_axi_mmap_AWVALID(m_axi_b_AWVALID),
    .m_axi_mmap_BID(m_axi_b_BID),
    .m_axi_mmap_BREADY(m_axi_b_BREADY),
    .m_axi_mmap_BRESP(m_axi_b_BRESP),
    .m_axi_mmap_BVALID(m_axi_b_BVALID),
    .m_axi_mmap_RDATA(m_axi_b_RDATA),
    .m_axi_mmap_RID(m_axi_b_RID),
    .m_axi_mmap_RLAST(m_axi_b_RLAST),
    .m_axi_mmap_RREADY(m_axi_b_RREADY),
    .m_axi_mmap_RRESP(m_axi_b_RRESP),
    .m_axi_mmap_RVALID(m_axi_b_RVALID),
    .m_axi_mmap_WDATA(m_axi_b_WDATA),
    .m_axi_mmap_WLAST(m_axi_b_WLAST),
    .m_axi_mmap_WREADY(m_axi_b_WREADY),
    .m_axi_mmap_WSTRB(m_axi_b_WSTRB),
    .m_axi_mmap_WVALID(m_axi_b_WVALID),
    .m_axi_mmap_ARLOCK(m_axi_b_ARLOCK),
    .m_axi_mmap_ARPROT(m_axi_b_ARPROT),
    .m_axi_mmap_ARQOS(m_axi_b_ARQOS),
    .m_axi_mmap_ARCACHE(m_axi_b_ARCACHE),
    .m_axi_mmap_AWCACHE(m_axi_b_AWCACHE),
    .m_axi_mmap_AWLOCK(m_axi_b_AWLOCK),
    .m_axi_mmap_AWPROT(m_axi_b_AWPROT),
    .m_axi_mmap_AWQOS(m_axi_b_AWQOS),
    .mmap_offset(Mmap2Stream_1___b__q0),
    .stream_din(b_q_VecAdd__din),
    .stream_full_n(b_q_VecAdd__full_n),
    .stream_write(b_q_VecAdd__write),
    .n(Mmap2Stream_1___n__q0)
  );


  (* keep_hierarchy = "yes" *)  Stream2Mmap
  Stream2Mmap_0
  (
    .ap_clk(system_clock),
    .ap_rst_n(ap_rst_n),
    .ap_start(Stream2Mmap_0__ap_start),
    .ap_done(Stream2Mmap_0__ap_done),
    .ap_idle(Stream2Mmap_0__ap_idle),
    .ap_ready(Stream2Mmap_0__ap_ready),
    .m_axi_mmap_ARADDR(m_axi_c_ARADDR),
    .m_axi_mmap_ARBURST(m_axi_c_ARBURST),
    .m_axi_mmap_ARID(m_axi_c_ARID),
    .m_axi_mmap_ARLEN(m_axi_c_ARLEN),
    .m_axi_mmap_ARREADY(m_axi_c_ARREADY),
    .m_axi_mmap_ARSIZE(m_axi_c_ARSIZE),
    .m_axi_mmap_ARVALID(m_axi_c_ARVALID),
    .m_axi_mmap_AWADDR(m_axi_c_AWADDR),
    .m_axi_mmap_AWBURST(m_axi_c_AWBURST),
    .m_axi_mmap_AWID(m_axi_c_AWID),
    .m_axi_mmap_AWLEN(m_axi_c_AWLEN),
    .m_axi_mmap_AWREADY(m_axi_c_AWREADY),
    .m_axi_mmap_AWSIZE(m_axi_c_AWSIZE),
    .m_axi_mmap_AWVALID(m_axi_c_AWVALID),
    .m_axi_mmap_BID(m_axi_c_BID),
    .m_axi_mmap_BREADY(m_axi_c_BREADY),
    .m_axi_mmap_BRESP(m_axi_c_BRESP),
    .m_axi_mmap_BVALID(m_axi_c_BVALID),
    .m_axi_mmap_RDATA(m_axi_c_RDATA),
    .m_axi_mmap_RID(m_axi_c_RID),
    .m_axi_mmap_RLAST(m_axi_c_RLAST),
    .m_axi_mmap_RREADY(m_axi_c_RREADY),
    .m_axi_mmap_RRESP(m_axi_c_RRESP),
    .m_axi_mmap_RVALID(m_axi_c_RVALID),
    .m_axi_mmap_WDATA(m_axi_c_WDATA),
    .m_axi_mmap_WLAST(m_axi_c_WLAST),
    .m_axi_mmap_WREADY(m_axi_c_WREADY),
    .m_axi_mmap_WSTRB(m_axi_c_WSTRB),
    .m_axi_mmap_WVALID(m_axi_c_WVALID),
    .m_axi_mmap_ARLOCK(m_axi_c_ARLOCK),
    .m_axi_mmap_ARPROT(m_axi_c_ARPROT),
    .m_axi_mmap_ARQOS(m_axi_c_ARQOS),
    .m_axi_mmap_ARCACHE(m_axi_c_ARCACHE),
    .m_axi_mmap_AWCACHE(m_axi_c_AWCACHE),
    .m_axi_mmap_AWLOCK(m_axi_c_AWLOCK),
    .m_axi_mmap_AWPROT(m_axi_c_AWPROT),
    .m_axi_mmap_AWQOS(m_axi_c_AWQOS),
    .mmap_offset(Stream2Mmap_0___c__q0),
    .stream_s_dout(c_q_VecAdd__dout),
    .stream_peek_dout(c_q_VecAdd__dout),
    .stream_s_empty_n(c_q_VecAdd__empty_n),
    .stream_peek_empty_n(c_q_VecAdd__empty_n),
    .stream_s_read(c_q_VecAdd__read),
    .stream_peek_read(),
    .n(Stream2Mmap_0___n__q0)
  );


  (* keep_hierarchy = "yes" *)  VecAdd_fsm
  FSM_unit
  (
    .ap_clk(system_clock),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .Add_0__ap_start(Add_0__ap_start),
    .Add_0__ap_ready(Add_0__ap_ready),
    .Add_0__ap_done(Add_0__ap_done),
    .Add_0__ap_idle(Add_0__ap_idle),
    .Mmap2Stream_0__ap_start(Mmap2Stream_0__ap_start),
    .Mmap2Stream_0__ap_ready(Mmap2Stream_0__ap_ready),
    .Mmap2Stream_0__ap_done(Mmap2Stream_0__ap_done),
    .Mmap2Stream_0__ap_idle(Mmap2Stream_0__ap_idle),
    .Mmap2Stream_1__ap_start(Mmap2Stream_1__ap_start),
    .Mmap2Stream_1__ap_ready(Mmap2Stream_1__ap_ready),
    .Mmap2Stream_1__ap_done(Mmap2Stream_1__ap_done),
    .Mmap2Stream_1__ap_idle(Mmap2Stream_1__ap_idle),
    .Stream2Mmap_0__ap_start(Stream2Mmap_0__ap_start),
    .Stream2Mmap_0__ap_ready(Stream2Mmap_0__ap_ready),
    .Stream2Mmap_0__ap_done(Stream2Mmap_0__ap_done),
    .Stream2Mmap_0__ap_idle(Stream2Mmap_0__ap_idle)
  );

  assign ap_rst_n_inv = (~ap_rst_n);
  assign Add_0___n__q0 = n;
  assign Mmap2Stream_0___a__q0 = a;
  assign Mmap2Stream_0___n__q0 = n;
  assign Mmap2Stream_1___b__q0 = b;
  assign Mmap2Stream_1___n__q0 = n;
  assign Stream2Mmap_0___c__q0 = c;
  assign Stream2Mmap_0___n__q0 = n;

endmodule
