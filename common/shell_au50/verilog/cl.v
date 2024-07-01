`timescale 1 ps / 1 ps

(* DONT_TOUCH = "yes" *) module cl
   (ARESETN_HBM,
    ARESETN_KL,
    ARESETN_XDMA,
    CLK_HBM,
    CLK_KL,
    CLK_XDMA,

    M_AXI_HBM00_araddr,
    M_AXI_HBM00_arburst,
    M_AXI_HBM00_arcache,
    M_AXI_HBM00_arlen,
    M_AXI_HBM00_arlock,
    M_AXI_HBM00_arprot,
    M_AXI_HBM00_arqos,
    M_AXI_HBM00_arready,
    M_AXI_HBM00_arsize,
    M_AXI_HBM00_arvalid,
    M_AXI_HBM00_awaddr,
    M_AXI_HBM00_awburst,
    M_AXI_HBM00_awcache,
    M_AXI_HBM00_awlen,
    M_AXI_HBM00_awlock,
    M_AXI_HBM00_awprot,
    M_AXI_HBM00_awqos,
    M_AXI_HBM00_awready,
    M_AXI_HBM00_awsize,
    M_AXI_HBM00_awvalid,
    M_AXI_HBM00_bready,
    M_AXI_HBM00_bresp,
    M_AXI_HBM00_bvalid,
    M_AXI_HBM00_rdata,
    M_AXI_HBM00_rlast,
    M_AXI_HBM00_rready,
    M_AXI_HBM00_rresp,
    M_AXI_HBM00_rvalid,
    M_AXI_HBM00_wdata,
    M_AXI_HBM00_wlast,
    M_AXI_HBM00_wready,
    M_AXI_HBM00_wstrb,
    M_AXI_HBM00_wvalid,
    M_AXI_HBM01_araddr,
    M_AXI_HBM01_arburst,
    M_AXI_HBM01_arcache,
    M_AXI_HBM01_arlen,
    M_AXI_HBM01_arlock,
    M_AXI_HBM01_arprot,
    M_AXI_HBM01_arqos,
    M_AXI_HBM01_arready,
    M_AXI_HBM01_arsize,
    M_AXI_HBM01_arvalid,
    M_AXI_HBM01_awaddr,
    M_AXI_HBM01_awburst,
    M_AXI_HBM01_awcache,
    M_AXI_HBM01_awlen,
    M_AXI_HBM01_awlock,
    M_AXI_HBM01_awprot,
    M_AXI_HBM01_awqos,
    M_AXI_HBM01_awready,
    M_AXI_HBM01_awsize,
    M_AXI_HBM01_awvalid,
    M_AXI_HBM01_bready,
    M_AXI_HBM01_bresp,
    M_AXI_HBM01_bvalid,
    M_AXI_HBM01_rdata,
    M_AXI_HBM01_rlast,
    M_AXI_HBM01_rready,
    M_AXI_HBM01_rresp,
    M_AXI_HBM01_rvalid,
    M_AXI_HBM01_wdata,
    M_AXI_HBM01_wlast,
    M_AXI_HBM01_wready,
    M_AXI_HBM01_wstrb,
    M_AXI_HBM01_wvalid,
    M_AXI_HBM02_araddr,
    M_AXI_HBM02_arburst,
    M_AXI_HBM02_arcache,
    M_AXI_HBM02_arlen,
    M_AXI_HBM02_arlock,
    M_AXI_HBM02_arprot,
    M_AXI_HBM02_arqos,
    M_AXI_HBM02_arready,
    M_AXI_HBM02_arsize,
    M_AXI_HBM02_arvalid,
    M_AXI_HBM02_awaddr,
    M_AXI_HBM02_awburst,
    M_AXI_HBM02_awcache,
    M_AXI_HBM02_awlen,
    M_AXI_HBM02_awlock,
    M_AXI_HBM02_awprot,
    M_AXI_HBM02_awqos,
    M_AXI_HBM02_awready,
    M_AXI_HBM02_awsize,
    M_AXI_HBM02_awvalid,
    M_AXI_HBM02_bready,
    M_AXI_HBM02_bresp,
    M_AXI_HBM02_bvalid,
    M_AXI_HBM02_rdata,
    M_AXI_HBM02_rlast,
    M_AXI_HBM02_rready,
    M_AXI_HBM02_rresp,
    M_AXI_HBM02_rvalid,
    M_AXI_HBM02_wdata,
    M_AXI_HBM02_wlast,
    M_AXI_HBM02_wready,
    M_AXI_HBM02_wstrb,
    M_AXI_HBM02_wvalid,
    M_AXI_HBM03_araddr,
    M_AXI_HBM03_arburst,
    M_AXI_HBM03_arcache,
    M_AXI_HBM03_arlen,
    M_AXI_HBM03_arlock,
    M_AXI_HBM03_arprot,
    M_AXI_HBM03_arqos,
    M_AXI_HBM03_arready,
    M_AXI_HBM03_arsize,
    M_AXI_HBM03_arvalid,
    M_AXI_HBM03_awaddr,
    M_AXI_HBM03_awburst,
    M_AXI_HBM03_awcache,
    M_AXI_HBM03_awlen,
    M_AXI_HBM03_awlock,
    M_AXI_HBM03_awprot,
    M_AXI_HBM03_awqos,
    M_AXI_HBM03_awready,
    M_AXI_HBM03_awsize,
    M_AXI_HBM03_awvalid,
    M_AXI_HBM03_bready,
    M_AXI_HBM03_bresp,
    M_AXI_HBM03_bvalid,
    M_AXI_HBM03_rdata,
    M_AXI_HBM03_rlast,
    M_AXI_HBM03_rready,
    M_AXI_HBM03_rresp,
    M_AXI_HBM03_rvalid,
    M_AXI_HBM03_wdata,
    M_AXI_HBM03_wlast,
    M_AXI_HBM03_wready,
    M_AXI_HBM03_wstrb,
    M_AXI_HBM03_wvalid,
    M_AXI_HBM04_araddr,
    M_AXI_HBM04_arburst,
    M_AXI_HBM04_arcache,
    M_AXI_HBM04_arlen,
    M_AXI_HBM04_arlock,
    M_AXI_HBM04_arprot,
    M_AXI_HBM04_arqos,
    M_AXI_HBM04_arready,
    M_AXI_HBM04_arsize,
    M_AXI_HBM04_arvalid,
    M_AXI_HBM04_awaddr,
    M_AXI_HBM04_awburst,
    M_AXI_HBM04_awcache,
    M_AXI_HBM04_awlen,
    M_AXI_HBM04_awlock,
    M_AXI_HBM04_awprot,
    M_AXI_HBM04_awqos,
    M_AXI_HBM04_awready,
    M_AXI_HBM04_awsize,
    M_AXI_HBM04_awvalid,
    M_AXI_HBM04_bready,
    M_AXI_HBM04_bresp,
    M_AXI_HBM04_bvalid,
    M_AXI_HBM04_rdata,
    M_AXI_HBM04_rlast,
    M_AXI_HBM04_rready,
    M_AXI_HBM04_rresp,
    M_AXI_HBM04_rvalid,
    M_AXI_HBM04_wdata,
    M_AXI_HBM04_wlast,
    M_AXI_HBM04_wready,
    M_AXI_HBM04_wstrb,
    M_AXI_HBM04_wvalid,
    M_AXI_HBM05_araddr,
    M_AXI_HBM05_arburst,
    M_AXI_HBM05_arcache,
    M_AXI_HBM05_arlen,
    M_AXI_HBM05_arlock,
    M_AXI_HBM05_arprot,
    M_AXI_HBM05_arqos,
    M_AXI_HBM05_arready,
    M_AXI_HBM05_arsize,
    M_AXI_HBM05_arvalid,
    M_AXI_HBM05_awaddr,
    M_AXI_HBM05_awburst,
    M_AXI_HBM05_awcache,
    M_AXI_HBM05_awlen,
    M_AXI_HBM05_awlock,
    M_AXI_HBM05_awprot,
    M_AXI_HBM05_awqos,
    M_AXI_HBM05_awready,
    M_AXI_HBM05_awsize,
    M_AXI_HBM05_awvalid,
    M_AXI_HBM05_bready,
    M_AXI_HBM05_bresp,
    M_AXI_HBM05_bvalid,
    M_AXI_HBM05_rdata,
    M_AXI_HBM05_rlast,
    M_AXI_HBM05_rready,
    M_AXI_HBM05_rresp,
    M_AXI_HBM05_rvalid,
    M_AXI_HBM05_wdata,
    M_AXI_HBM05_wlast,
    M_AXI_HBM05_wready,
    M_AXI_HBM05_wstrb,
    M_AXI_HBM05_wvalid,
    M_AXI_HBM06_araddr,
    M_AXI_HBM06_arburst,
    M_AXI_HBM06_arcache,
    M_AXI_HBM06_arlen,
    M_AXI_HBM06_arlock,
    M_AXI_HBM06_arprot,
    M_AXI_HBM06_arqos,
    M_AXI_HBM06_arready,
    M_AXI_HBM06_arsize,
    M_AXI_HBM06_arvalid,
    M_AXI_HBM06_awaddr,
    M_AXI_HBM06_awburst,
    M_AXI_HBM06_awcache,
    M_AXI_HBM06_awlen,
    M_AXI_HBM06_awlock,
    M_AXI_HBM06_awprot,
    M_AXI_HBM06_awqos,
    M_AXI_HBM06_awready,
    M_AXI_HBM06_awsize,
    M_AXI_HBM06_awvalid,
    M_AXI_HBM06_bready,
    M_AXI_HBM06_bresp,
    M_AXI_HBM06_bvalid,
    M_AXI_HBM06_rdata,
    M_AXI_HBM06_rlast,
    M_AXI_HBM06_rready,
    M_AXI_HBM06_rresp,
    M_AXI_HBM06_rvalid,
    M_AXI_HBM06_wdata,
    M_AXI_HBM06_wlast,
    M_AXI_HBM06_wready,
    M_AXI_HBM06_wstrb,
    M_AXI_HBM06_wvalid,
    M_AXI_HBM07_araddr,
    M_AXI_HBM07_arburst,
    M_AXI_HBM07_arcache,
    M_AXI_HBM07_arlen,
    M_AXI_HBM07_arlock,
    M_AXI_HBM07_arprot,
    M_AXI_HBM07_arqos,
    M_AXI_HBM07_arready,
    M_AXI_HBM07_arsize,
    M_AXI_HBM07_arvalid,
    M_AXI_HBM07_awaddr,
    M_AXI_HBM07_awburst,
    M_AXI_HBM07_awcache,
    M_AXI_HBM07_awlen,
    M_AXI_HBM07_awlock,
    M_AXI_HBM07_awprot,
    M_AXI_HBM07_awqos,
    M_AXI_HBM07_awready,
    M_AXI_HBM07_awsize,
    M_AXI_HBM07_awvalid,
    M_AXI_HBM07_bready,
    M_AXI_HBM07_bresp,
    M_AXI_HBM07_bvalid,
    M_AXI_HBM07_rdata,
    M_AXI_HBM07_rlast,
    M_AXI_HBM07_rready,
    M_AXI_HBM07_rresp,
    M_AXI_HBM07_rvalid,
    M_AXI_HBM07_wdata,
    M_AXI_HBM07_wlast,
    M_AXI_HBM07_wready,
    M_AXI_HBM07_wstrb,
    M_AXI_HBM07_wvalid,
    M_AXI_HBM08_araddr,
    M_AXI_HBM08_arburst,
    M_AXI_HBM08_arcache,
    M_AXI_HBM08_arlen,
    M_AXI_HBM08_arlock,
    M_AXI_HBM08_arprot,
    M_AXI_HBM08_arqos,
    M_AXI_HBM08_arready,
    M_AXI_HBM08_arsize,
    M_AXI_HBM08_arvalid,
    M_AXI_HBM08_awaddr,
    M_AXI_HBM08_awburst,
    M_AXI_HBM08_awcache,
    M_AXI_HBM08_awlen,
    M_AXI_HBM08_awlock,
    M_AXI_HBM08_awprot,
    M_AXI_HBM08_awqos,
    M_AXI_HBM08_awready,
    M_AXI_HBM08_awsize,
    M_AXI_HBM08_awvalid,
    M_AXI_HBM08_bready,
    M_AXI_HBM08_bresp,
    M_AXI_HBM08_bvalid,
    M_AXI_HBM08_rdata,
    M_AXI_HBM08_rlast,
    M_AXI_HBM08_rready,
    M_AXI_HBM08_rresp,
    M_AXI_HBM08_rvalid,
    M_AXI_HBM08_wdata,
    M_AXI_HBM08_wlast,
    M_AXI_HBM08_wready,
    M_AXI_HBM08_wstrb,
    M_AXI_HBM08_wvalid,
    M_AXI_HBM09_araddr,
    M_AXI_HBM09_arburst,
    M_AXI_HBM09_arcache,
    M_AXI_HBM09_arlen,
    M_AXI_HBM09_arlock,
    M_AXI_HBM09_arprot,
    M_AXI_HBM09_arqos,
    M_AXI_HBM09_arready,
    M_AXI_HBM09_arsize,
    M_AXI_HBM09_arvalid,
    M_AXI_HBM09_awaddr,
    M_AXI_HBM09_awburst,
    M_AXI_HBM09_awcache,
    M_AXI_HBM09_awlen,
    M_AXI_HBM09_awlock,
    M_AXI_HBM09_awprot,
    M_AXI_HBM09_awqos,
    M_AXI_HBM09_awready,
    M_AXI_HBM09_awsize,
    M_AXI_HBM09_awvalid,
    M_AXI_HBM09_bready,
    M_AXI_HBM09_bresp,
    M_AXI_HBM09_bvalid,
    M_AXI_HBM09_rdata,
    M_AXI_HBM09_rlast,
    M_AXI_HBM09_rready,
    M_AXI_HBM09_rresp,
    M_AXI_HBM09_rvalid,
    M_AXI_HBM09_wdata,
    M_AXI_HBM09_wlast,
    M_AXI_HBM09_wready,
    M_AXI_HBM09_wstrb,
    M_AXI_HBM09_wvalid,
    M_AXI_HBM10_araddr,
    M_AXI_HBM10_arburst,
    M_AXI_HBM10_arcache,
    M_AXI_HBM10_arlen,
    M_AXI_HBM10_arlock,
    M_AXI_HBM10_arprot,
    M_AXI_HBM10_arqos,
    M_AXI_HBM10_arready,
    M_AXI_HBM10_arsize,
    M_AXI_HBM10_arvalid,
    M_AXI_HBM10_awaddr,
    M_AXI_HBM10_awburst,
    M_AXI_HBM10_awcache,
    M_AXI_HBM10_awlen,
    M_AXI_HBM10_awlock,
    M_AXI_HBM10_awprot,
    M_AXI_HBM10_awqos,
    M_AXI_HBM10_awready,
    M_AXI_HBM10_awsize,
    M_AXI_HBM10_awvalid,
    M_AXI_HBM10_bready,
    M_AXI_HBM10_bresp,
    M_AXI_HBM10_bvalid,
    M_AXI_HBM10_rdata,
    M_AXI_HBM10_rlast,
    M_AXI_HBM10_rready,
    M_AXI_HBM10_rresp,
    M_AXI_HBM10_rvalid,
    M_AXI_HBM10_wdata,
    M_AXI_HBM10_wlast,
    M_AXI_HBM10_wready,
    M_AXI_HBM10_wstrb,
    M_AXI_HBM10_wvalid,
    M_AXI_HBM11_araddr,
    M_AXI_HBM11_arburst,
    M_AXI_HBM11_arcache,
    M_AXI_HBM11_arlen,
    M_AXI_HBM11_arlock,
    M_AXI_HBM11_arprot,
    M_AXI_HBM11_arqos,
    M_AXI_HBM11_arready,
    M_AXI_HBM11_arsize,
    M_AXI_HBM11_arvalid,
    M_AXI_HBM11_awaddr,
    M_AXI_HBM11_awburst,
    M_AXI_HBM11_awcache,
    M_AXI_HBM11_awlen,
    M_AXI_HBM11_awlock,
    M_AXI_HBM11_awprot,
    M_AXI_HBM11_awqos,
    M_AXI_HBM11_awready,
    M_AXI_HBM11_awsize,
    M_AXI_HBM11_awvalid,
    M_AXI_HBM11_bready,
    M_AXI_HBM11_bresp,
    M_AXI_HBM11_bvalid,
    M_AXI_HBM11_rdata,
    M_AXI_HBM11_rlast,
    M_AXI_HBM11_rready,
    M_AXI_HBM11_rresp,
    M_AXI_HBM11_rvalid,
    M_AXI_HBM11_wdata,
    M_AXI_HBM11_wlast,
    M_AXI_HBM11_wready,
    M_AXI_HBM11_wstrb,
    M_AXI_HBM11_wvalid,
    M_AXI_HBM12_araddr,
    M_AXI_HBM12_arburst,
    M_AXI_HBM12_arcache,
    M_AXI_HBM12_arlen,
    M_AXI_HBM12_arlock,
    M_AXI_HBM12_arprot,
    M_AXI_HBM12_arqos,
    M_AXI_HBM12_arready,
    M_AXI_HBM12_arsize,
    M_AXI_HBM12_arvalid,
    M_AXI_HBM12_awaddr,
    M_AXI_HBM12_awburst,
    M_AXI_HBM12_awcache,
    M_AXI_HBM12_awlen,
    M_AXI_HBM12_awlock,
    M_AXI_HBM12_awprot,
    M_AXI_HBM12_awqos,
    M_AXI_HBM12_awready,
    M_AXI_HBM12_awsize,
    M_AXI_HBM12_awvalid,
    M_AXI_HBM12_bready,
    M_AXI_HBM12_bresp,
    M_AXI_HBM12_bvalid,
    M_AXI_HBM12_rdata,
    M_AXI_HBM12_rlast,
    M_AXI_HBM12_rready,
    M_AXI_HBM12_rresp,
    M_AXI_HBM12_rvalid,
    M_AXI_HBM12_wdata,
    M_AXI_HBM12_wlast,
    M_AXI_HBM12_wready,
    M_AXI_HBM12_wstrb,
    M_AXI_HBM12_wvalid,
    M_AXI_HBM13_araddr,
    M_AXI_HBM13_arburst,
    M_AXI_HBM13_arcache,
    M_AXI_HBM13_arlen,
    M_AXI_HBM13_arlock,
    M_AXI_HBM13_arprot,
    M_AXI_HBM13_arqos,
    M_AXI_HBM13_arready,
    M_AXI_HBM13_arsize,
    M_AXI_HBM13_arvalid,
    M_AXI_HBM13_awaddr,
    M_AXI_HBM13_awburst,
    M_AXI_HBM13_awcache,
    M_AXI_HBM13_awlen,
    M_AXI_HBM13_awlock,
    M_AXI_HBM13_awprot,
    M_AXI_HBM13_awqos,
    M_AXI_HBM13_awready,
    M_AXI_HBM13_awsize,
    M_AXI_HBM13_awvalid,
    M_AXI_HBM13_bready,
    M_AXI_HBM13_bresp,
    M_AXI_HBM13_bvalid,
    M_AXI_HBM13_rdata,
    M_AXI_HBM13_rlast,
    M_AXI_HBM13_rready,
    M_AXI_HBM13_rresp,
    M_AXI_HBM13_rvalid,
    M_AXI_HBM13_wdata,
    M_AXI_HBM13_wlast,
    M_AXI_HBM13_wready,
    M_AXI_HBM13_wstrb,
    M_AXI_HBM13_wvalid,
    M_AXI_HBM14_araddr,
    M_AXI_HBM14_arburst,
    M_AXI_HBM14_arcache,
    M_AXI_HBM14_arlen,
    M_AXI_HBM14_arlock,
    M_AXI_HBM14_arprot,
    M_AXI_HBM14_arqos,
    M_AXI_HBM14_arready,
    M_AXI_HBM14_arsize,
    M_AXI_HBM14_arvalid,
    M_AXI_HBM14_awaddr,
    M_AXI_HBM14_awburst,
    M_AXI_HBM14_awcache,
    M_AXI_HBM14_awlen,
    M_AXI_HBM14_awlock,
    M_AXI_HBM14_awprot,
    M_AXI_HBM14_awqos,
    M_AXI_HBM14_awready,
    M_AXI_HBM14_awsize,
    M_AXI_HBM14_awvalid,
    M_AXI_HBM14_bready,
    M_AXI_HBM14_bresp,
    M_AXI_HBM14_bvalid,
    M_AXI_HBM14_rdata,
    M_AXI_HBM14_rlast,
    M_AXI_HBM14_rready,
    M_AXI_HBM14_rresp,
    M_AXI_HBM14_rvalid,
    M_AXI_HBM14_wdata,
    M_AXI_HBM14_wlast,
    M_AXI_HBM14_wready,
    M_AXI_HBM14_wstrb,
    M_AXI_HBM14_wvalid,
    M_AXI_HBM15_araddr,
    M_AXI_HBM15_arburst,
    M_AXI_HBM15_arcache,
    M_AXI_HBM15_arlen,
    M_AXI_HBM15_arlock,
    M_AXI_HBM15_arprot,
    M_AXI_HBM15_arqos,
    M_AXI_HBM15_arready,
    M_AXI_HBM15_arsize,
    M_AXI_HBM15_arvalid,
    M_AXI_HBM15_awaddr,
    M_AXI_HBM15_awburst,
    M_AXI_HBM15_awcache,
    M_AXI_HBM15_awlen,
    M_AXI_HBM15_awlock,
    M_AXI_HBM15_awprot,
    M_AXI_HBM15_awqos,
    M_AXI_HBM15_awready,
    M_AXI_HBM15_awsize,
    M_AXI_HBM15_awvalid,
    M_AXI_HBM15_bready,
    M_AXI_HBM15_bresp,
    M_AXI_HBM15_bvalid,
    M_AXI_HBM15_rdata,
    M_AXI_HBM15_rlast,
    M_AXI_HBM15_rready,
    M_AXI_HBM15_rresp,
    M_AXI_HBM15_rvalid,
    M_AXI_HBM15_wdata,
    M_AXI_HBM15_wlast,
    M_AXI_HBM15_wready,
    M_AXI_HBM15_wstrb,
    M_AXI_HBM15_wvalid,
    M_AXI_HBM16_araddr,
    M_AXI_HBM16_arburst,
    M_AXI_HBM16_arcache,
    M_AXI_HBM16_arlen,
    M_AXI_HBM16_arlock,
    M_AXI_HBM16_arprot,
    M_AXI_HBM16_arqos,
    M_AXI_HBM16_arready,
    M_AXI_HBM16_arsize,
    M_AXI_HBM16_arvalid,
    M_AXI_HBM16_awaddr,
    M_AXI_HBM16_awburst,
    M_AXI_HBM16_awcache,
    M_AXI_HBM16_awlen,
    M_AXI_HBM16_awlock,
    M_AXI_HBM16_awprot,
    M_AXI_HBM16_awqos,
    M_AXI_HBM16_awready,
    M_AXI_HBM16_awsize,
    M_AXI_HBM16_awvalid,
    M_AXI_HBM16_bready,
    M_AXI_HBM16_bresp,
    M_AXI_HBM16_bvalid,
    M_AXI_HBM16_rdata,
    M_AXI_HBM16_rlast,
    M_AXI_HBM16_rready,
    M_AXI_HBM16_rresp,
    M_AXI_HBM16_rvalid,
    M_AXI_HBM16_wdata,
    M_AXI_HBM16_wlast,
    M_AXI_HBM16_wready,
    M_AXI_HBM16_wstrb,
    M_AXI_HBM16_wvalid,
    M_AXI_HBM17_araddr,
    M_AXI_HBM17_arburst,
    M_AXI_HBM17_arcache,
    M_AXI_HBM17_arlen,
    M_AXI_HBM17_arlock,
    M_AXI_HBM17_arprot,
    M_AXI_HBM17_arqos,
    M_AXI_HBM17_arready,
    M_AXI_HBM17_arsize,
    M_AXI_HBM17_arvalid,
    M_AXI_HBM17_awaddr,
    M_AXI_HBM17_awburst,
    M_AXI_HBM17_awcache,
    M_AXI_HBM17_awlen,
    M_AXI_HBM17_awlock,
    M_AXI_HBM17_awprot,
    M_AXI_HBM17_awqos,
    M_AXI_HBM17_awready,
    M_AXI_HBM17_awsize,
    M_AXI_HBM17_awvalid,
    M_AXI_HBM17_bready,
    M_AXI_HBM17_bresp,
    M_AXI_HBM17_bvalid,
    M_AXI_HBM17_rdata,
    M_AXI_HBM17_rlast,
    M_AXI_HBM17_rready,
    M_AXI_HBM17_rresp,
    M_AXI_HBM17_rvalid,
    M_AXI_HBM17_wdata,
    M_AXI_HBM17_wlast,
    M_AXI_HBM17_wready,
    M_AXI_HBM17_wstrb,
    M_AXI_HBM17_wvalid,
    M_AXI_HBM18_araddr,
    M_AXI_HBM18_arburst,
    M_AXI_HBM18_arcache,
    M_AXI_HBM18_arlen,
    M_AXI_HBM18_arlock,
    M_AXI_HBM18_arprot,
    M_AXI_HBM18_arqos,
    M_AXI_HBM18_arready,
    M_AXI_HBM18_arsize,
    M_AXI_HBM18_arvalid,
    M_AXI_HBM18_awaddr,
    M_AXI_HBM18_awburst,
    M_AXI_HBM18_awcache,
    M_AXI_HBM18_awlen,
    M_AXI_HBM18_awlock,
    M_AXI_HBM18_awprot,
    M_AXI_HBM18_awqos,
    M_AXI_HBM18_awready,
    M_AXI_HBM18_awsize,
    M_AXI_HBM18_awvalid,
    M_AXI_HBM18_bready,
    M_AXI_HBM18_bresp,
    M_AXI_HBM18_bvalid,
    M_AXI_HBM18_rdata,
    M_AXI_HBM18_rlast,
    M_AXI_HBM18_rready,
    M_AXI_HBM18_rresp,
    M_AXI_HBM18_rvalid,
    M_AXI_HBM18_wdata,
    M_AXI_HBM18_wlast,
    M_AXI_HBM18_wready,
    M_AXI_HBM18_wstrb,
    M_AXI_HBM18_wvalid,
    M_AXI_HBM19_araddr,
    M_AXI_HBM19_arburst,
    M_AXI_HBM19_arcache,
    M_AXI_HBM19_arlen,
    M_AXI_HBM19_arlock,
    M_AXI_HBM19_arprot,
    M_AXI_HBM19_arqos,
    M_AXI_HBM19_arready,
    M_AXI_HBM19_arsize,
    M_AXI_HBM19_arvalid,
    M_AXI_HBM19_awaddr,
    M_AXI_HBM19_awburst,
    M_AXI_HBM19_awcache,
    M_AXI_HBM19_awlen,
    M_AXI_HBM19_awlock,
    M_AXI_HBM19_awprot,
    M_AXI_HBM19_awqos,
    M_AXI_HBM19_awready,
    M_AXI_HBM19_awsize,
    M_AXI_HBM19_awvalid,
    M_AXI_HBM19_bready,
    M_AXI_HBM19_bresp,
    M_AXI_HBM19_bvalid,
    M_AXI_HBM19_rdata,
    M_AXI_HBM19_rlast,
    M_AXI_HBM19_rready,
    M_AXI_HBM19_rresp,
    M_AXI_HBM19_rvalid,
    M_AXI_HBM19_wdata,
    M_AXI_HBM19_wlast,
    M_AXI_HBM19_wready,
    M_AXI_HBM19_wstrb,
    M_AXI_HBM19_wvalid,
    M_AXI_HBM20_araddr,
    M_AXI_HBM20_arburst,
    M_AXI_HBM20_arcache,
    M_AXI_HBM20_arlen,
    M_AXI_HBM20_arlock,
    M_AXI_HBM20_arprot,
    M_AXI_HBM20_arqos,
    M_AXI_HBM20_arready,
    M_AXI_HBM20_arsize,
    M_AXI_HBM20_arvalid,
    M_AXI_HBM20_awaddr,
    M_AXI_HBM20_awburst,
    M_AXI_HBM20_awcache,
    M_AXI_HBM20_awlen,
    M_AXI_HBM20_awlock,
    M_AXI_HBM20_awprot,
    M_AXI_HBM20_awqos,
    M_AXI_HBM20_awready,
    M_AXI_HBM20_awsize,
    M_AXI_HBM20_awvalid,
    M_AXI_HBM20_bready,
    M_AXI_HBM20_bresp,
    M_AXI_HBM20_bvalid,
    M_AXI_HBM20_rdata,
    M_AXI_HBM20_rlast,
    M_AXI_HBM20_rready,
    M_AXI_HBM20_rresp,
    M_AXI_HBM20_rvalid,
    M_AXI_HBM20_wdata,
    M_AXI_HBM20_wlast,
    M_AXI_HBM20_wready,
    M_AXI_HBM20_wstrb,
    M_AXI_HBM20_wvalid,
    M_AXI_HBM21_araddr,
    M_AXI_HBM21_arburst,
    M_AXI_HBM21_arcache,
    M_AXI_HBM21_arlen,
    M_AXI_HBM21_arlock,
    M_AXI_HBM21_arprot,
    M_AXI_HBM21_arqos,
    M_AXI_HBM21_arready,
    M_AXI_HBM21_arsize,
    M_AXI_HBM21_arvalid,
    M_AXI_HBM21_awaddr,
    M_AXI_HBM21_awburst,
    M_AXI_HBM21_awcache,
    M_AXI_HBM21_awlen,
    M_AXI_HBM21_awlock,
    M_AXI_HBM21_awprot,
    M_AXI_HBM21_awqos,
    M_AXI_HBM21_awready,
    M_AXI_HBM21_awsize,
    M_AXI_HBM21_awvalid,
    M_AXI_HBM21_bready,
    M_AXI_HBM21_bresp,
    M_AXI_HBM21_bvalid,
    M_AXI_HBM21_rdata,
    M_AXI_HBM21_rlast,
    M_AXI_HBM21_rready,
    M_AXI_HBM21_rresp,
    M_AXI_HBM21_rvalid,
    M_AXI_HBM21_wdata,
    M_AXI_HBM21_wlast,
    M_AXI_HBM21_wready,
    M_AXI_HBM21_wstrb,
    M_AXI_HBM21_wvalid,
    M_AXI_HBM22_araddr,
    M_AXI_HBM22_arburst,
    M_AXI_HBM22_arcache,
    M_AXI_HBM22_arlen,
    M_AXI_HBM22_arlock,
    M_AXI_HBM22_arprot,
    M_AXI_HBM22_arqos,
    M_AXI_HBM22_arready,
    M_AXI_HBM22_arsize,
    M_AXI_HBM22_arvalid,
    M_AXI_HBM22_awaddr,
    M_AXI_HBM22_awburst,
    M_AXI_HBM22_awcache,
    M_AXI_HBM22_awlen,
    M_AXI_HBM22_awlock,
    M_AXI_HBM22_awprot,
    M_AXI_HBM22_awqos,
    M_AXI_HBM22_awready,
    M_AXI_HBM22_awsize,
    M_AXI_HBM22_awvalid,
    M_AXI_HBM22_bready,
    M_AXI_HBM22_bresp,
    M_AXI_HBM22_bvalid,
    M_AXI_HBM22_rdata,
    M_AXI_HBM22_rlast,
    M_AXI_HBM22_rready,
    M_AXI_HBM22_rresp,
    M_AXI_HBM22_rvalid,
    M_AXI_HBM22_wdata,
    M_AXI_HBM22_wlast,
    M_AXI_HBM22_wready,
    M_AXI_HBM22_wstrb,
    M_AXI_HBM22_wvalid,
    M_AXI_HBM23_araddr,
    M_AXI_HBM23_arburst,
    M_AXI_HBM23_arcache,
    M_AXI_HBM23_arlen,
    M_AXI_HBM23_arlock,
    M_AXI_HBM23_arprot,
    M_AXI_HBM23_arqos,
    M_AXI_HBM23_arready,
    M_AXI_HBM23_arsize,
    M_AXI_HBM23_arvalid,
    M_AXI_HBM23_awaddr,
    M_AXI_HBM23_awburst,
    M_AXI_HBM23_awcache,
    M_AXI_HBM23_awlen,
    M_AXI_HBM23_awlock,
    M_AXI_HBM23_awprot,
    M_AXI_HBM23_awqos,
    M_AXI_HBM23_awready,
    M_AXI_HBM23_awsize,
    M_AXI_HBM23_awvalid,
    M_AXI_HBM23_bready,
    M_AXI_HBM23_bresp,
    M_AXI_HBM23_bvalid,
    M_AXI_HBM23_rdata,
    M_AXI_HBM23_rlast,
    M_AXI_HBM23_rready,
    M_AXI_HBM23_rresp,
    M_AXI_HBM23_rvalid,
    M_AXI_HBM23_wdata,
    M_AXI_HBM23_wlast,
    M_AXI_HBM23_wready,
    M_AXI_HBM23_wstrb,
    M_AXI_HBM23_wvalid,
    M_AXI_HBM24_araddr,
    M_AXI_HBM24_arburst,
    M_AXI_HBM24_arcache,
    M_AXI_HBM24_arlen,
    M_AXI_HBM24_arlock,
    M_AXI_HBM24_arprot,
    M_AXI_HBM24_arqos,
    M_AXI_HBM24_arready,
    M_AXI_HBM24_arsize,
    M_AXI_HBM24_arvalid,
    M_AXI_HBM24_awaddr,
    M_AXI_HBM24_awburst,
    M_AXI_HBM24_awcache,
    M_AXI_HBM24_awlen,
    M_AXI_HBM24_awlock,
    M_AXI_HBM24_awprot,
    M_AXI_HBM24_awqos,
    M_AXI_HBM24_awready,
    M_AXI_HBM24_awsize,
    M_AXI_HBM24_awvalid,
    M_AXI_HBM24_bready,
    M_AXI_HBM24_bresp,
    M_AXI_HBM24_bvalid,
    M_AXI_HBM24_rdata,
    M_AXI_HBM24_rlast,
    M_AXI_HBM24_rready,
    M_AXI_HBM24_rresp,
    M_AXI_HBM24_rvalid,
    M_AXI_HBM24_wdata,
    M_AXI_HBM24_wlast,
    M_AXI_HBM24_wready,
    M_AXI_HBM24_wstrb,
    M_AXI_HBM24_wvalid,
    M_AXI_HBM25_araddr,
    M_AXI_HBM25_arburst,
    M_AXI_HBM25_arcache,
    M_AXI_HBM25_arlen,
    M_AXI_HBM25_arlock,
    M_AXI_HBM25_arprot,
    M_AXI_HBM25_arqos,
    M_AXI_HBM25_arready,
    M_AXI_HBM25_arsize,
    M_AXI_HBM25_arvalid,
    M_AXI_HBM25_awaddr,
    M_AXI_HBM25_awburst,
    M_AXI_HBM25_awcache,
    M_AXI_HBM25_awlen,
    M_AXI_HBM25_awlock,
    M_AXI_HBM25_awprot,
    M_AXI_HBM25_awqos,
    M_AXI_HBM25_awready,
    M_AXI_HBM25_awsize,
    M_AXI_HBM25_awvalid,
    M_AXI_HBM25_bready,
    M_AXI_HBM25_bresp,
    M_AXI_HBM25_bvalid,
    M_AXI_HBM25_rdata,
    M_AXI_HBM25_rlast,
    M_AXI_HBM25_rready,
    M_AXI_HBM25_rresp,
    M_AXI_HBM25_rvalid,
    M_AXI_HBM25_wdata,
    M_AXI_HBM25_wlast,
    M_AXI_HBM25_wready,
    M_AXI_HBM25_wstrb,
    M_AXI_HBM25_wvalid,
    M_AXI_HBM26_araddr,
    M_AXI_HBM26_arburst,
    M_AXI_HBM26_arcache,
    M_AXI_HBM26_arlen,
    M_AXI_HBM26_arlock,
    M_AXI_HBM26_arprot,
    M_AXI_HBM26_arqos,
    M_AXI_HBM26_arready,
    M_AXI_HBM26_arsize,
    M_AXI_HBM26_arvalid,
    M_AXI_HBM26_awaddr,
    M_AXI_HBM26_awburst,
    M_AXI_HBM26_awcache,
    M_AXI_HBM26_awlen,
    M_AXI_HBM26_awlock,
    M_AXI_HBM26_awprot,
    M_AXI_HBM26_awqos,
    M_AXI_HBM26_awready,
    M_AXI_HBM26_awsize,
    M_AXI_HBM26_awvalid,
    M_AXI_HBM26_bready,
    M_AXI_HBM26_bresp,
    M_AXI_HBM26_bvalid,
    M_AXI_HBM26_rdata,
    M_AXI_HBM26_rlast,
    M_AXI_HBM26_rready,
    M_AXI_HBM26_rresp,
    M_AXI_HBM26_rvalid,
    M_AXI_HBM26_wdata,
    M_AXI_HBM26_wlast,
    M_AXI_HBM26_wready,
    M_AXI_HBM26_wstrb,
    M_AXI_HBM26_wvalid,
    M_AXI_HBM27_araddr,
    M_AXI_HBM27_arburst,
    M_AXI_HBM27_arcache,
    M_AXI_HBM27_arlen,
    M_AXI_HBM27_arlock,
    M_AXI_HBM27_arprot,
    M_AXI_HBM27_arqos,
    M_AXI_HBM27_arready,
    M_AXI_HBM27_arsize,
    M_AXI_HBM27_arvalid,
    M_AXI_HBM27_awaddr,
    M_AXI_HBM27_awburst,
    M_AXI_HBM27_awcache,
    M_AXI_HBM27_awlen,
    M_AXI_HBM27_awlock,
    M_AXI_HBM27_awprot,
    M_AXI_HBM27_awqos,
    M_AXI_HBM27_awready,
    M_AXI_HBM27_awsize,
    M_AXI_HBM27_awvalid,
    M_AXI_HBM27_bready,
    M_AXI_HBM27_bresp,
    M_AXI_HBM27_bvalid,
    M_AXI_HBM27_rdata,
    M_AXI_HBM27_rlast,
    M_AXI_HBM27_rready,
    M_AXI_HBM27_rresp,
    M_AXI_HBM27_rvalid,
    M_AXI_HBM27_wdata,
    M_AXI_HBM27_wlast,
    M_AXI_HBM27_wready,
    M_AXI_HBM27_wstrb,
    M_AXI_HBM27_wvalid,
    M_AXI_HBM28_araddr,
    M_AXI_HBM28_arburst,
    M_AXI_HBM28_arcache,
    M_AXI_HBM28_arlen,
    M_AXI_HBM28_arlock,
    M_AXI_HBM28_arprot,
    M_AXI_HBM28_arqos,
    M_AXI_HBM28_arready,
    M_AXI_HBM28_arsize,
    M_AXI_HBM28_arvalid,
    M_AXI_HBM28_awaddr,
    M_AXI_HBM28_awburst,
    M_AXI_HBM28_awcache,
    M_AXI_HBM28_awlen,
    M_AXI_HBM28_awlock,
    M_AXI_HBM28_awprot,
    M_AXI_HBM28_awqos,
    M_AXI_HBM28_awready,
    M_AXI_HBM28_awsize,
    M_AXI_HBM28_awvalid,
    M_AXI_HBM28_bready,
    M_AXI_HBM28_bresp,
    M_AXI_HBM28_bvalid,
    M_AXI_HBM28_rdata,
    M_AXI_HBM28_rlast,
    M_AXI_HBM28_rready,
    M_AXI_HBM28_rresp,
    M_AXI_HBM28_rvalid,
    M_AXI_HBM28_wdata,
    M_AXI_HBM28_wlast,
    M_AXI_HBM28_wready,
    M_AXI_HBM28_wstrb,
    M_AXI_HBM28_wvalid,
    M_AXI_HBM29_araddr,
    M_AXI_HBM29_arburst,
    M_AXI_HBM29_arcache,
    M_AXI_HBM29_arlen,
    M_AXI_HBM29_arlock,
    M_AXI_HBM29_arprot,
    M_AXI_HBM29_arqos,
    M_AXI_HBM29_arready,
    M_AXI_HBM29_arsize,
    M_AXI_HBM29_arvalid,
    M_AXI_HBM29_awaddr,
    M_AXI_HBM29_awburst,
    M_AXI_HBM29_awcache,
    M_AXI_HBM29_awlen,
    M_AXI_HBM29_awlock,
    M_AXI_HBM29_awprot,
    M_AXI_HBM29_awqos,
    M_AXI_HBM29_awready,
    M_AXI_HBM29_awsize,
    M_AXI_HBM29_awvalid,
    M_AXI_HBM29_bready,
    M_AXI_HBM29_bresp,
    M_AXI_HBM29_bvalid,
    M_AXI_HBM29_rdata,
    M_AXI_HBM29_rlast,
    M_AXI_HBM29_rready,
    M_AXI_HBM29_rresp,
    M_AXI_HBM29_rvalid,
    M_AXI_HBM29_wdata,
    M_AXI_HBM29_wlast,
    M_AXI_HBM29_wready,
    M_AXI_HBM29_wstrb,
    M_AXI_HBM29_wvalid,
    M_AXI_HBM30_araddr,
    M_AXI_HBM30_arburst,
    M_AXI_HBM30_arcache,
    M_AXI_HBM30_arlen,
    M_AXI_HBM30_arlock,
    M_AXI_HBM30_arprot,
    M_AXI_HBM30_arqos,
    M_AXI_HBM30_arready,
    M_AXI_HBM30_arsize,
    M_AXI_HBM30_arvalid,
    M_AXI_HBM30_awaddr,
    M_AXI_HBM30_awburst,
    M_AXI_HBM30_awcache,
    M_AXI_HBM30_awlen,
    M_AXI_HBM30_awlock,
    M_AXI_HBM30_awprot,
    M_AXI_HBM30_awqos,
    M_AXI_HBM30_awready,
    M_AXI_HBM30_awsize,
    M_AXI_HBM30_awvalid,
    M_AXI_HBM30_bready,
    M_AXI_HBM30_bresp,
    M_AXI_HBM30_bvalid,
    M_AXI_HBM30_rdata,
    M_AXI_HBM30_rlast,
    M_AXI_HBM30_rready,
    M_AXI_HBM30_rresp,
    M_AXI_HBM30_rvalid,
    M_AXI_HBM30_wdata,
    M_AXI_HBM30_wlast,
    M_AXI_HBM30_wready,
    M_AXI_HBM30_wstrb,
    M_AXI_HBM30_wvalid,
    M_AXI_HBM31_araddr,
    M_AXI_HBM31_arburst,
    M_AXI_HBM31_arcache,
    M_AXI_HBM31_arlen,
    M_AXI_HBM31_arlock,
    M_AXI_HBM31_arprot,
    M_AXI_HBM31_arqos,
    M_AXI_HBM31_arready,
    M_AXI_HBM31_arsize,
    M_AXI_HBM31_arvalid,
    M_AXI_HBM31_awaddr,
    M_AXI_HBM31_awburst,
    M_AXI_HBM31_awcache,
    M_AXI_HBM31_awlen,
    M_AXI_HBM31_awlock,
    M_AXI_HBM31_awprot,
    M_AXI_HBM31_awqos,
    M_AXI_HBM31_awready,
    M_AXI_HBM31_awsize,
    M_AXI_HBM31_awvalid,
    M_AXI_HBM31_bready,
    M_AXI_HBM31_bresp,
    M_AXI_HBM31_bvalid,
    M_AXI_HBM31_rdata,
    M_AXI_HBM31_rlast,
    M_AXI_HBM31_rready,
    M_AXI_HBM31_rresp,
    M_AXI_HBM31_rvalid,
    M_AXI_HBM31_wdata,
    M_AXI_HBM31_wlast,
    M_AXI_HBM31_wready,
    M_AXI_HBM31_wstrb,
    M_AXI_HBM31_wvalid,
    S_AXI_BYPASS_araddr,
    S_AXI_BYPASS_arburst,
    S_AXI_BYPASS_arcache,
    S_AXI_BYPASS_arid,
    S_AXI_BYPASS_arlen,
    S_AXI_BYPASS_arlock,
    S_AXI_BYPASS_arprot,
    S_AXI_BYPASS_arqos,
    S_AXI_BYPASS_arready,
    S_AXI_BYPASS_arregion,
    S_AXI_BYPASS_arsize,
    S_AXI_BYPASS_arvalid,
    S_AXI_BYPASS_awaddr,
    S_AXI_BYPASS_awburst,
    S_AXI_BYPASS_awcache,
    S_AXI_BYPASS_awid,
    S_AXI_BYPASS_awlen,
    S_AXI_BYPASS_awlock,
    S_AXI_BYPASS_awprot,
    S_AXI_BYPASS_awqos,
    S_AXI_BYPASS_awready,
    S_AXI_BYPASS_awregion,
    S_AXI_BYPASS_awsize,
    S_AXI_BYPASS_awvalid,
    S_AXI_BYPASS_bid,
    S_AXI_BYPASS_bready,
    S_AXI_BYPASS_bresp,
    S_AXI_BYPASS_bvalid,
    S_AXI_BYPASS_rdata,
    S_AXI_BYPASS_rid,
    S_AXI_BYPASS_rlast,
    S_AXI_BYPASS_rready,
    S_AXI_BYPASS_rresp,
    S_AXI_BYPASS_rvalid,
    S_AXI_BYPASS_wdata,
    S_AXI_BYPASS_wlast,
    S_AXI_BYPASS_wready,
    S_AXI_BYPASS_wstrb,
    S_AXI_BYPASS_wvalid,
    S_AXI_XDMA_araddr,
    S_AXI_XDMA_arburst,
    S_AXI_XDMA_arcache,
    S_AXI_XDMA_arid,
    S_AXI_XDMA_arlen,
    S_AXI_XDMA_arlock,
    S_AXI_XDMA_arprot,
    S_AXI_XDMA_arqos,
    S_AXI_XDMA_arready,
    S_AXI_XDMA_arregion,
    S_AXI_XDMA_arsize,
    S_AXI_XDMA_arvalid,
    S_AXI_XDMA_awaddr,
    S_AXI_XDMA_awburst,
    S_AXI_XDMA_awcache,
    S_AXI_XDMA_awid,
    S_AXI_XDMA_awlen,
    S_AXI_XDMA_awlock,
    S_AXI_XDMA_awprot,
    S_AXI_XDMA_awqos,
    S_AXI_XDMA_awready,
    S_AXI_XDMA_awregion,
    S_AXI_XDMA_awsize,
    S_AXI_XDMA_awvalid,
    S_AXI_XDMA_bid,
    S_AXI_XDMA_bready,
    S_AXI_XDMA_bresp,
    S_AXI_XDMA_bvalid,
    S_AXI_XDMA_rdata,
    S_AXI_XDMA_rid,
    S_AXI_XDMA_rlast,
    S_AXI_XDMA_rready,
    S_AXI_XDMA_rresp,
    S_AXI_XDMA_rvalid,
    S_AXI_XDMA_wdata,
    S_AXI_XDMA_wlast,
    S_AXI_XDMA_wready,
    S_AXI_XDMA_wstrb,
    S_AXI_XDMA_wvalid);
  input ARESETN_HBM;
  input ARESETN_KL;
  input ARESETN_XDMA;
  input CLK_HBM;
  input CLK_KL;
  input CLK_XDMA;
  output [63:0]M_AXI_HBM00_araddr;
  output [1:0]M_AXI_HBM00_arburst;
  output [3:0]M_AXI_HBM00_arcache;
  output [3:0]M_AXI_HBM00_arlen;
  output [1:0]M_AXI_HBM00_arlock;
  output [2:0]M_AXI_HBM00_arprot;
  output [3:0]M_AXI_HBM00_arqos;
  input M_AXI_HBM00_arready;
  output [2:0]M_AXI_HBM00_arsize;
  output M_AXI_HBM00_arvalid;
  output [63:0]M_AXI_HBM00_awaddr;
  output [1:0]M_AXI_HBM00_awburst;
  output [3:0]M_AXI_HBM00_awcache;
  output [3:0]M_AXI_HBM00_awlen;
  output [1:0]M_AXI_HBM00_awlock;
  output [2:0]M_AXI_HBM00_awprot;
  output [3:0]M_AXI_HBM00_awqos;
  input M_AXI_HBM00_awready;
  output [2:0]M_AXI_HBM00_awsize;
  output M_AXI_HBM00_awvalid;
  output M_AXI_HBM00_bready;
  input [1:0]M_AXI_HBM00_bresp;
  input M_AXI_HBM00_bvalid;
  input [255:0]M_AXI_HBM00_rdata;
  input M_AXI_HBM00_rlast;
  output M_AXI_HBM00_rready;
  input [1:0]M_AXI_HBM00_rresp;
  input M_AXI_HBM00_rvalid;
  output [255:0]M_AXI_HBM00_wdata;
  output M_AXI_HBM00_wlast;
  input M_AXI_HBM00_wready;
  output [31:0]M_AXI_HBM00_wstrb;
  output M_AXI_HBM00_wvalid;
  output [63:0]M_AXI_HBM01_araddr;
  output [1:0]M_AXI_HBM01_arburst;
  output [3:0]M_AXI_HBM01_arcache;
  output [3:0]M_AXI_HBM01_arlen;
  output [1:0]M_AXI_HBM01_arlock;
  output [2:0]M_AXI_HBM01_arprot;
  output [3:0]M_AXI_HBM01_arqos;
  input M_AXI_HBM01_arready;
  output [2:0]M_AXI_HBM01_arsize;
  output M_AXI_HBM01_arvalid;
  output [63:0]M_AXI_HBM01_awaddr;
  output [1:0]M_AXI_HBM01_awburst;
  output [3:0]M_AXI_HBM01_awcache;
  output [3:0]M_AXI_HBM01_awlen;
  output [1:0]M_AXI_HBM01_awlock;
  output [2:0]M_AXI_HBM01_awprot;
  output [3:0]M_AXI_HBM01_awqos;
  input M_AXI_HBM01_awready;
  output [2:0]M_AXI_HBM01_awsize;
  output M_AXI_HBM01_awvalid;
  output M_AXI_HBM01_bready;
  input [1:0]M_AXI_HBM01_bresp;
  input M_AXI_HBM01_bvalid;
  input [255:0]M_AXI_HBM01_rdata;
  input M_AXI_HBM01_rlast;
  output M_AXI_HBM01_rready;
  input [1:0]M_AXI_HBM01_rresp;
  input M_AXI_HBM01_rvalid;
  output [255:0]M_AXI_HBM01_wdata;
  output M_AXI_HBM01_wlast;
  input M_AXI_HBM01_wready;
  output [31:0]M_AXI_HBM01_wstrb;
  output M_AXI_HBM01_wvalid;
  output [63:0]M_AXI_HBM02_araddr;
  output [1:0]M_AXI_HBM02_arburst;
  output [3:0]M_AXI_HBM02_arcache;
  output [3:0]M_AXI_HBM02_arlen;
  output [1:0]M_AXI_HBM02_arlock;
  output [2:0]M_AXI_HBM02_arprot;
  output [3:0]M_AXI_HBM02_arqos;
  input M_AXI_HBM02_arready;
  output [2:0]M_AXI_HBM02_arsize;
  output M_AXI_HBM02_arvalid;
  output [63:0]M_AXI_HBM02_awaddr;
  output [1:0]M_AXI_HBM02_awburst;
  output [3:0]M_AXI_HBM02_awcache;
  output [3:0]M_AXI_HBM02_awlen;
  output [1:0]M_AXI_HBM02_awlock;
  output [2:0]M_AXI_HBM02_awprot;
  output [3:0]M_AXI_HBM02_awqos;
  input M_AXI_HBM02_awready;
  output [2:0]M_AXI_HBM02_awsize;
  output M_AXI_HBM02_awvalid;
  output M_AXI_HBM02_bready;
  input [1:0]M_AXI_HBM02_bresp;
  input M_AXI_HBM02_bvalid;
  input [255:0]M_AXI_HBM02_rdata;
  input M_AXI_HBM02_rlast;
  output M_AXI_HBM02_rready;
  input [1:0]M_AXI_HBM02_rresp;
  input M_AXI_HBM02_rvalid;
  output [255:0]M_AXI_HBM02_wdata;
  output M_AXI_HBM02_wlast;
  input M_AXI_HBM02_wready;
  output [31:0]M_AXI_HBM02_wstrb;
  output M_AXI_HBM02_wvalid;
  output [63:0]M_AXI_HBM03_araddr;
  output [1:0]M_AXI_HBM03_arburst;
  output [3:0]M_AXI_HBM03_arcache;
  output [3:0]M_AXI_HBM03_arlen;
  output [1:0]M_AXI_HBM03_arlock;
  output [2:0]M_AXI_HBM03_arprot;
  output [3:0]M_AXI_HBM03_arqos;
  input M_AXI_HBM03_arready;
  output [2:0]M_AXI_HBM03_arsize;
  output M_AXI_HBM03_arvalid;
  output [63:0]M_AXI_HBM03_awaddr;
  output [1:0]M_AXI_HBM03_awburst;
  output [3:0]M_AXI_HBM03_awcache;
  output [3:0]M_AXI_HBM03_awlen;
  output [1:0]M_AXI_HBM03_awlock;
  output [2:0]M_AXI_HBM03_awprot;
  output [3:0]M_AXI_HBM03_awqos;
  input M_AXI_HBM03_awready;
  output [2:0]M_AXI_HBM03_awsize;
  output M_AXI_HBM03_awvalid;
  output M_AXI_HBM03_bready;
  input [1:0]M_AXI_HBM03_bresp;
  input M_AXI_HBM03_bvalid;
  input [255:0]M_AXI_HBM03_rdata;
  input M_AXI_HBM03_rlast;
  output M_AXI_HBM03_rready;
  input [1:0]M_AXI_HBM03_rresp;
  input M_AXI_HBM03_rvalid;
  output [255:0]M_AXI_HBM03_wdata;
  output M_AXI_HBM03_wlast;
  input M_AXI_HBM03_wready;
  output [31:0]M_AXI_HBM03_wstrb;
  output M_AXI_HBM03_wvalid;
  output [63:0]M_AXI_HBM04_araddr;
  output [1:0]M_AXI_HBM04_arburst;
  output [3:0]M_AXI_HBM04_arcache;
  output [3:0]M_AXI_HBM04_arlen;
  output [1:0]M_AXI_HBM04_arlock;
  output [2:0]M_AXI_HBM04_arprot;
  output [3:0]M_AXI_HBM04_arqos;
  input M_AXI_HBM04_arready;
  output [2:0]M_AXI_HBM04_arsize;
  output M_AXI_HBM04_arvalid;
  output [63:0]M_AXI_HBM04_awaddr;
  output [1:0]M_AXI_HBM04_awburst;
  output [3:0]M_AXI_HBM04_awcache;
  output [3:0]M_AXI_HBM04_awlen;
  output [1:0]M_AXI_HBM04_awlock;
  output [2:0]M_AXI_HBM04_awprot;
  output [3:0]M_AXI_HBM04_awqos;
  input M_AXI_HBM04_awready;
  output [2:0]M_AXI_HBM04_awsize;
  output M_AXI_HBM04_awvalid;
  output M_AXI_HBM04_bready;
  input [1:0]M_AXI_HBM04_bresp;
  input M_AXI_HBM04_bvalid;
  input [255:0]M_AXI_HBM04_rdata;
  input M_AXI_HBM04_rlast;
  output M_AXI_HBM04_rready;
  input [1:0]M_AXI_HBM04_rresp;
  input M_AXI_HBM04_rvalid;
  output [255:0]M_AXI_HBM04_wdata;
  output M_AXI_HBM04_wlast;
  input M_AXI_HBM04_wready;
  output [31:0]M_AXI_HBM04_wstrb;
  output M_AXI_HBM04_wvalid;
  output [63:0]M_AXI_HBM05_araddr;
  output [1:0]M_AXI_HBM05_arburst;
  output [3:0]M_AXI_HBM05_arcache;
  output [3:0]M_AXI_HBM05_arlen;
  output [1:0]M_AXI_HBM05_arlock;
  output [2:0]M_AXI_HBM05_arprot;
  output [3:0]M_AXI_HBM05_arqos;
  input M_AXI_HBM05_arready;
  output [2:0]M_AXI_HBM05_arsize;
  output M_AXI_HBM05_arvalid;
  output [63:0]M_AXI_HBM05_awaddr;
  output [1:0]M_AXI_HBM05_awburst;
  output [3:0]M_AXI_HBM05_awcache;
  output [3:0]M_AXI_HBM05_awlen;
  output [1:0]M_AXI_HBM05_awlock;
  output [2:0]M_AXI_HBM05_awprot;
  output [3:0]M_AXI_HBM05_awqos;
  input M_AXI_HBM05_awready;
  output [2:0]M_AXI_HBM05_awsize;
  output M_AXI_HBM05_awvalid;
  output M_AXI_HBM05_bready;
  input [1:0]M_AXI_HBM05_bresp;
  input M_AXI_HBM05_bvalid;
  input [255:0]M_AXI_HBM05_rdata;
  input M_AXI_HBM05_rlast;
  output M_AXI_HBM05_rready;
  input [1:0]M_AXI_HBM05_rresp;
  input M_AXI_HBM05_rvalid;
  output [255:0]M_AXI_HBM05_wdata;
  output M_AXI_HBM05_wlast;
  input M_AXI_HBM05_wready;
  output [31:0]M_AXI_HBM05_wstrb;
  output M_AXI_HBM05_wvalid;
  output [63:0]M_AXI_HBM06_araddr;
  output [1:0]M_AXI_HBM06_arburst;
  output [3:0]M_AXI_HBM06_arcache;
  output [3:0]M_AXI_HBM06_arlen;
  output [1:0]M_AXI_HBM06_arlock;
  output [2:0]M_AXI_HBM06_arprot;
  output [3:0]M_AXI_HBM06_arqos;
  input M_AXI_HBM06_arready;
  output [2:0]M_AXI_HBM06_arsize;
  output M_AXI_HBM06_arvalid;
  output [63:0]M_AXI_HBM06_awaddr;
  output [1:0]M_AXI_HBM06_awburst;
  output [3:0]M_AXI_HBM06_awcache;
  output [3:0]M_AXI_HBM06_awlen;
  output [1:0]M_AXI_HBM06_awlock;
  output [2:0]M_AXI_HBM06_awprot;
  output [3:0]M_AXI_HBM06_awqos;
  input M_AXI_HBM06_awready;
  output [2:0]M_AXI_HBM06_awsize;
  output M_AXI_HBM06_awvalid;
  output M_AXI_HBM06_bready;
  input [1:0]M_AXI_HBM06_bresp;
  input M_AXI_HBM06_bvalid;
  input [255:0]M_AXI_HBM06_rdata;
  input M_AXI_HBM06_rlast;
  output M_AXI_HBM06_rready;
  input [1:0]M_AXI_HBM06_rresp;
  input M_AXI_HBM06_rvalid;
  output [255:0]M_AXI_HBM06_wdata;
  output M_AXI_HBM06_wlast;
  input M_AXI_HBM06_wready;
  output [31:0]M_AXI_HBM06_wstrb;
  output M_AXI_HBM06_wvalid;
  output [63:0]M_AXI_HBM07_araddr;
  output [1:0]M_AXI_HBM07_arburst;
  output [3:0]M_AXI_HBM07_arcache;
  output [3:0]M_AXI_HBM07_arlen;
  output [1:0]M_AXI_HBM07_arlock;
  output [2:0]M_AXI_HBM07_arprot;
  output [3:0]M_AXI_HBM07_arqos;
  input M_AXI_HBM07_arready;
  output [2:0]M_AXI_HBM07_arsize;
  output M_AXI_HBM07_arvalid;
  output [63:0]M_AXI_HBM07_awaddr;
  output [1:0]M_AXI_HBM07_awburst;
  output [3:0]M_AXI_HBM07_awcache;
  output [3:0]M_AXI_HBM07_awlen;
  output [1:0]M_AXI_HBM07_awlock;
  output [2:0]M_AXI_HBM07_awprot;
  output [3:0]M_AXI_HBM07_awqos;
  input M_AXI_HBM07_awready;
  output [2:0]M_AXI_HBM07_awsize;
  output M_AXI_HBM07_awvalid;
  output M_AXI_HBM07_bready;
  input [1:0]M_AXI_HBM07_bresp;
  input M_AXI_HBM07_bvalid;
  input [255:0]M_AXI_HBM07_rdata;
  input M_AXI_HBM07_rlast;
  output M_AXI_HBM07_rready;
  input [1:0]M_AXI_HBM07_rresp;
  input M_AXI_HBM07_rvalid;
  output [255:0]M_AXI_HBM07_wdata;
  output M_AXI_HBM07_wlast;
  input M_AXI_HBM07_wready;
  output [31:0]M_AXI_HBM07_wstrb;
  output M_AXI_HBM07_wvalid;
  output [63:0]M_AXI_HBM08_araddr;
  output [1:0]M_AXI_HBM08_arburst;
  output [3:0]M_AXI_HBM08_arcache;
  output [3:0]M_AXI_HBM08_arlen;
  output [1:0]M_AXI_HBM08_arlock;
  output [2:0]M_AXI_HBM08_arprot;
  output [3:0]M_AXI_HBM08_arqos;
  input M_AXI_HBM08_arready;
  output [2:0]M_AXI_HBM08_arsize;
  output M_AXI_HBM08_arvalid;
  output [63:0]M_AXI_HBM08_awaddr;
  output [1:0]M_AXI_HBM08_awburst;
  output [3:0]M_AXI_HBM08_awcache;
  output [3:0]M_AXI_HBM08_awlen;
  output [1:0]M_AXI_HBM08_awlock;
  output [2:0]M_AXI_HBM08_awprot;
  output [3:0]M_AXI_HBM08_awqos;
  input M_AXI_HBM08_awready;
  output [2:0]M_AXI_HBM08_awsize;
  output M_AXI_HBM08_awvalid;
  output M_AXI_HBM08_bready;
  input [1:0]M_AXI_HBM08_bresp;
  input M_AXI_HBM08_bvalid;
  input [255:0]M_AXI_HBM08_rdata;
  input M_AXI_HBM08_rlast;
  output M_AXI_HBM08_rready;
  input [1:0]M_AXI_HBM08_rresp;
  input M_AXI_HBM08_rvalid;
  output [255:0]M_AXI_HBM08_wdata;
  output M_AXI_HBM08_wlast;
  input M_AXI_HBM08_wready;
  output [31:0]M_AXI_HBM08_wstrb;
  output M_AXI_HBM08_wvalid;
  output [63:0]M_AXI_HBM09_araddr;
  output [1:0]M_AXI_HBM09_arburst;
  output [3:0]M_AXI_HBM09_arcache;
  output [3:0]M_AXI_HBM09_arlen;
  output [1:0]M_AXI_HBM09_arlock;
  output [2:0]M_AXI_HBM09_arprot;
  output [3:0]M_AXI_HBM09_arqos;
  input M_AXI_HBM09_arready;
  output [2:0]M_AXI_HBM09_arsize;
  output M_AXI_HBM09_arvalid;
  output [63:0]M_AXI_HBM09_awaddr;
  output [1:0]M_AXI_HBM09_awburst;
  output [3:0]M_AXI_HBM09_awcache;
  output [3:0]M_AXI_HBM09_awlen;
  output [1:0]M_AXI_HBM09_awlock;
  output [2:0]M_AXI_HBM09_awprot;
  output [3:0]M_AXI_HBM09_awqos;
  input M_AXI_HBM09_awready;
  output [2:0]M_AXI_HBM09_awsize;
  output M_AXI_HBM09_awvalid;
  output M_AXI_HBM09_bready;
  input [1:0]M_AXI_HBM09_bresp;
  input M_AXI_HBM09_bvalid;
  input [255:0]M_AXI_HBM09_rdata;
  input M_AXI_HBM09_rlast;
  output M_AXI_HBM09_rready;
  input [1:0]M_AXI_HBM09_rresp;
  input M_AXI_HBM09_rvalid;
  output [255:0]M_AXI_HBM09_wdata;
  output M_AXI_HBM09_wlast;
  input M_AXI_HBM09_wready;
  output [31:0]M_AXI_HBM09_wstrb;
  output M_AXI_HBM09_wvalid;
  output [63:0]M_AXI_HBM10_araddr;
  output [1:0]M_AXI_HBM10_arburst;
  output [3:0]M_AXI_HBM10_arcache;
  output [3:0]M_AXI_HBM10_arlen;
  output [1:0]M_AXI_HBM10_arlock;
  output [2:0]M_AXI_HBM10_arprot;
  output [3:0]M_AXI_HBM10_arqos;
  input M_AXI_HBM10_arready;
  output [2:0]M_AXI_HBM10_arsize;
  output M_AXI_HBM10_arvalid;
  output [63:0]M_AXI_HBM10_awaddr;
  output [1:0]M_AXI_HBM10_awburst;
  output [3:0]M_AXI_HBM10_awcache;
  output [3:0]M_AXI_HBM10_awlen;
  output [1:0]M_AXI_HBM10_awlock;
  output [2:0]M_AXI_HBM10_awprot;
  output [3:0]M_AXI_HBM10_awqos;
  input M_AXI_HBM10_awready;
  output [2:0]M_AXI_HBM10_awsize;
  output M_AXI_HBM10_awvalid;
  output M_AXI_HBM10_bready;
  input [1:0]M_AXI_HBM10_bresp;
  input M_AXI_HBM10_bvalid;
  input [255:0]M_AXI_HBM10_rdata;
  input M_AXI_HBM10_rlast;
  output M_AXI_HBM10_rready;
  input [1:0]M_AXI_HBM10_rresp;
  input M_AXI_HBM10_rvalid;
  output [255:0]M_AXI_HBM10_wdata;
  output M_AXI_HBM10_wlast;
  input M_AXI_HBM10_wready;
  output [31:0]M_AXI_HBM10_wstrb;
  output M_AXI_HBM10_wvalid;
  output [63:0]M_AXI_HBM11_araddr;
  output [1:0]M_AXI_HBM11_arburst;
  output [3:0]M_AXI_HBM11_arcache;
  output [3:0]M_AXI_HBM11_arlen;
  output [1:0]M_AXI_HBM11_arlock;
  output [2:0]M_AXI_HBM11_arprot;
  output [3:0]M_AXI_HBM11_arqos;
  input M_AXI_HBM11_arready;
  output [2:0]M_AXI_HBM11_arsize;
  output M_AXI_HBM11_arvalid;
  output [63:0]M_AXI_HBM11_awaddr;
  output [1:0]M_AXI_HBM11_awburst;
  output [3:0]M_AXI_HBM11_awcache;
  output [3:0]M_AXI_HBM11_awlen;
  output [1:0]M_AXI_HBM11_awlock;
  output [2:0]M_AXI_HBM11_awprot;
  output [3:0]M_AXI_HBM11_awqos;
  input M_AXI_HBM11_awready;
  output [2:0]M_AXI_HBM11_awsize;
  output M_AXI_HBM11_awvalid;
  output M_AXI_HBM11_bready;
  input [1:0]M_AXI_HBM11_bresp;
  input M_AXI_HBM11_bvalid;
  input [255:0]M_AXI_HBM11_rdata;
  input M_AXI_HBM11_rlast;
  output M_AXI_HBM11_rready;
  input [1:0]M_AXI_HBM11_rresp;
  input M_AXI_HBM11_rvalid;
  output [255:0]M_AXI_HBM11_wdata;
  output M_AXI_HBM11_wlast;
  input M_AXI_HBM11_wready;
  output [31:0]M_AXI_HBM11_wstrb;
  output M_AXI_HBM11_wvalid;
  output [63:0]M_AXI_HBM12_araddr;
  output [1:0]M_AXI_HBM12_arburst;
  output [3:0]M_AXI_HBM12_arcache;
  output [3:0]M_AXI_HBM12_arlen;
  output [1:0]M_AXI_HBM12_arlock;
  output [2:0]M_AXI_HBM12_arprot;
  output [3:0]M_AXI_HBM12_arqos;
  input M_AXI_HBM12_arready;
  output [2:0]M_AXI_HBM12_arsize;
  output M_AXI_HBM12_arvalid;
  output [63:0]M_AXI_HBM12_awaddr;
  output [1:0]M_AXI_HBM12_awburst;
  output [3:0]M_AXI_HBM12_awcache;
  output [3:0]M_AXI_HBM12_awlen;
  output [1:0]M_AXI_HBM12_awlock;
  output [2:0]M_AXI_HBM12_awprot;
  output [3:0]M_AXI_HBM12_awqos;
  input M_AXI_HBM12_awready;
  output [2:0]M_AXI_HBM12_awsize;
  output M_AXI_HBM12_awvalid;
  output M_AXI_HBM12_bready;
  input [1:0]M_AXI_HBM12_bresp;
  input M_AXI_HBM12_bvalid;
  input [255:0]M_AXI_HBM12_rdata;
  input M_AXI_HBM12_rlast;
  output M_AXI_HBM12_rready;
  input [1:0]M_AXI_HBM12_rresp;
  input M_AXI_HBM12_rvalid;
  output [255:0]M_AXI_HBM12_wdata;
  output M_AXI_HBM12_wlast;
  input M_AXI_HBM12_wready;
  output [31:0]M_AXI_HBM12_wstrb;
  output M_AXI_HBM12_wvalid;
  output [63:0]M_AXI_HBM13_araddr;
  output [1:0]M_AXI_HBM13_arburst;
  output [3:0]M_AXI_HBM13_arcache;
  output [3:0]M_AXI_HBM13_arlen;
  output [1:0]M_AXI_HBM13_arlock;
  output [2:0]M_AXI_HBM13_arprot;
  output [3:0]M_AXI_HBM13_arqos;
  input M_AXI_HBM13_arready;
  output [2:0]M_AXI_HBM13_arsize;
  output M_AXI_HBM13_arvalid;
  output [63:0]M_AXI_HBM13_awaddr;
  output [1:0]M_AXI_HBM13_awburst;
  output [3:0]M_AXI_HBM13_awcache;
  output [3:0]M_AXI_HBM13_awlen;
  output [1:0]M_AXI_HBM13_awlock;
  output [2:0]M_AXI_HBM13_awprot;
  output [3:0]M_AXI_HBM13_awqos;
  input M_AXI_HBM13_awready;
  output [2:0]M_AXI_HBM13_awsize;
  output M_AXI_HBM13_awvalid;
  output M_AXI_HBM13_bready;
  input [1:0]M_AXI_HBM13_bresp;
  input M_AXI_HBM13_bvalid;
  input [255:0]M_AXI_HBM13_rdata;
  input M_AXI_HBM13_rlast;
  output M_AXI_HBM13_rready;
  input [1:0]M_AXI_HBM13_rresp;
  input M_AXI_HBM13_rvalid;
  output [255:0]M_AXI_HBM13_wdata;
  output M_AXI_HBM13_wlast;
  input M_AXI_HBM13_wready;
  output [31:0]M_AXI_HBM13_wstrb;
  output M_AXI_HBM13_wvalid;
  output [63:0]M_AXI_HBM14_araddr;
  output [1:0]M_AXI_HBM14_arburst;
  output [3:0]M_AXI_HBM14_arcache;
  output [3:0]M_AXI_HBM14_arlen;
  output [1:0]M_AXI_HBM14_arlock;
  output [2:0]M_AXI_HBM14_arprot;
  output [3:0]M_AXI_HBM14_arqos;
  input M_AXI_HBM14_arready;
  output [2:0]M_AXI_HBM14_arsize;
  output M_AXI_HBM14_arvalid;
  output [63:0]M_AXI_HBM14_awaddr;
  output [1:0]M_AXI_HBM14_awburst;
  output [3:0]M_AXI_HBM14_awcache;
  output [3:0]M_AXI_HBM14_awlen;
  output [1:0]M_AXI_HBM14_awlock;
  output [2:0]M_AXI_HBM14_awprot;
  output [3:0]M_AXI_HBM14_awqos;
  input M_AXI_HBM14_awready;
  output [2:0]M_AXI_HBM14_awsize;
  output M_AXI_HBM14_awvalid;
  output M_AXI_HBM14_bready;
  input [1:0]M_AXI_HBM14_bresp;
  input M_AXI_HBM14_bvalid;
  input [255:0]M_AXI_HBM14_rdata;
  input M_AXI_HBM14_rlast;
  output M_AXI_HBM14_rready;
  input [1:0]M_AXI_HBM14_rresp;
  input M_AXI_HBM14_rvalid;
  output [255:0]M_AXI_HBM14_wdata;
  output M_AXI_HBM14_wlast;
  input M_AXI_HBM14_wready;
  output [31:0]M_AXI_HBM14_wstrb;
  output M_AXI_HBM14_wvalid;
  output [63:0]M_AXI_HBM15_araddr;
  output [1:0]M_AXI_HBM15_arburst;
  output [3:0]M_AXI_HBM15_arcache;
  output [3:0]M_AXI_HBM15_arlen;
  output [1:0]M_AXI_HBM15_arlock;
  output [2:0]M_AXI_HBM15_arprot;
  output [3:0]M_AXI_HBM15_arqos;
  input M_AXI_HBM15_arready;
  output [2:0]M_AXI_HBM15_arsize;
  output M_AXI_HBM15_arvalid;
  output [63:0]M_AXI_HBM15_awaddr;
  output [1:0]M_AXI_HBM15_awburst;
  output [3:0]M_AXI_HBM15_awcache;
  output [3:0]M_AXI_HBM15_awlen;
  output [1:0]M_AXI_HBM15_awlock;
  output [2:0]M_AXI_HBM15_awprot;
  output [3:0]M_AXI_HBM15_awqos;
  input M_AXI_HBM15_awready;
  output [2:0]M_AXI_HBM15_awsize;
  output M_AXI_HBM15_awvalid;
  output M_AXI_HBM15_bready;
  input [1:0]M_AXI_HBM15_bresp;
  input M_AXI_HBM15_bvalid;
  input [255:0]M_AXI_HBM15_rdata;
  input M_AXI_HBM15_rlast;
  output M_AXI_HBM15_rready;
  input [1:0]M_AXI_HBM15_rresp;
  input M_AXI_HBM15_rvalid;
  output [255:0]M_AXI_HBM15_wdata;
  output M_AXI_HBM15_wlast;
  input M_AXI_HBM15_wready;
  output [31:0]M_AXI_HBM15_wstrb;
  output M_AXI_HBM15_wvalid;
  output [63:0]M_AXI_HBM16_araddr;
  output [1:0]M_AXI_HBM16_arburst;
  output [3:0]M_AXI_HBM16_arcache;
  output [3:0]M_AXI_HBM16_arlen;
  output [1:0]M_AXI_HBM16_arlock;
  output [2:0]M_AXI_HBM16_arprot;
  output [3:0]M_AXI_HBM16_arqos;
  input M_AXI_HBM16_arready;
  output [2:0]M_AXI_HBM16_arsize;
  output M_AXI_HBM16_arvalid;
  output [63:0]M_AXI_HBM16_awaddr;
  output [1:0]M_AXI_HBM16_awburst;
  output [3:0]M_AXI_HBM16_awcache;
  output [3:0]M_AXI_HBM16_awlen;
  output [1:0]M_AXI_HBM16_awlock;
  output [2:0]M_AXI_HBM16_awprot;
  output [3:0]M_AXI_HBM16_awqos;
  input M_AXI_HBM16_awready;
  output [2:0]M_AXI_HBM16_awsize;
  output M_AXI_HBM16_awvalid;
  output M_AXI_HBM16_bready;
  input [1:0]M_AXI_HBM16_bresp;
  input M_AXI_HBM16_bvalid;
  input [255:0]M_AXI_HBM16_rdata;
  input M_AXI_HBM16_rlast;
  output M_AXI_HBM16_rready;
  input [1:0]M_AXI_HBM16_rresp;
  input M_AXI_HBM16_rvalid;
  output [255:0]M_AXI_HBM16_wdata;
  output M_AXI_HBM16_wlast;
  input M_AXI_HBM16_wready;
  output [31:0]M_AXI_HBM16_wstrb;
  output M_AXI_HBM16_wvalid;
  output [63:0]M_AXI_HBM17_araddr;
  output [1:0]M_AXI_HBM17_arburst;
  output [3:0]M_AXI_HBM17_arcache;
  output [3:0]M_AXI_HBM17_arlen;
  output [1:0]M_AXI_HBM17_arlock;
  output [2:0]M_AXI_HBM17_arprot;
  output [3:0]M_AXI_HBM17_arqos;
  input M_AXI_HBM17_arready;
  output [2:0]M_AXI_HBM17_arsize;
  output M_AXI_HBM17_arvalid;
  output [63:0]M_AXI_HBM17_awaddr;
  output [1:0]M_AXI_HBM17_awburst;
  output [3:0]M_AXI_HBM17_awcache;
  output [3:0]M_AXI_HBM17_awlen;
  output [1:0]M_AXI_HBM17_awlock;
  output [2:0]M_AXI_HBM17_awprot;
  output [3:0]M_AXI_HBM17_awqos;
  input M_AXI_HBM17_awready;
  output [2:0]M_AXI_HBM17_awsize;
  output M_AXI_HBM17_awvalid;
  output M_AXI_HBM17_bready;
  input [1:0]M_AXI_HBM17_bresp;
  input M_AXI_HBM17_bvalid;
  input [255:0]M_AXI_HBM17_rdata;
  input M_AXI_HBM17_rlast;
  output M_AXI_HBM17_rready;
  input [1:0]M_AXI_HBM17_rresp;
  input M_AXI_HBM17_rvalid;
  output [255:0]M_AXI_HBM17_wdata;
  output M_AXI_HBM17_wlast;
  input M_AXI_HBM17_wready;
  output [31:0]M_AXI_HBM17_wstrb;
  output M_AXI_HBM17_wvalid;
  output [63:0]M_AXI_HBM18_araddr;
  output [1:0]M_AXI_HBM18_arburst;
  output [3:0]M_AXI_HBM18_arcache;
  output [3:0]M_AXI_HBM18_arlen;
  output [1:0]M_AXI_HBM18_arlock;
  output [2:0]M_AXI_HBM18_arprot;
  output [3:0]M_AXI_HBM18_arqos;
  input M_AXI_HBM18_arready;
  output [2:0]M_AXI_HBM18_arsize;
  output M_AXI_HBM18_arvalid;
  output [63:0]M_AXI_HBM18_awaddr;
  output [1:0]M_AXI_HBM18_awburst;
  output [3:0]M_AXI_HBM18_awcache;
  output [3:0]M_AXI_HBM18_awlen;
  output [1:0]M_AXI_HBM18_awlock;
  output [2:0]M_AXI_HBM18_awprot;
  output [3:0]M_AXI_HBM18_awqos;
  input M_AXI_HBM18_awready;
  output [2:0]M_AXI_HBM18_awsize;
  output M_AXI_HBM18_awvalid;
  output M_AXI_HBM18_bready;
  input [1:0]M_AXI_HBM18_bresp;
  input M_AXI_HBM18_bvalid;
  input [255:0]M_AXI_HBM18_rdata;
  input M_AXI_HBM18_rlast;
  output M_AXI_HBM18_rready;
  input [1:0]M_AXI_HBM18_rresp;
  input M_AXI_HBM18_rvalid;
  output [255:0]M_AXI_HBM18_wdata;
  output M_AXI_HBM18_wlast;
  input M_AXI_HBM18_wready;
  output [31:0]M_AXI_HBM18_wstrb;
  output M_AXI_HBM18_wvalid;
  output [63:0]M_AXI_HBM19_araddr;
  output [1:0]M_AXI_HBM19_arburst;
  output [3:0]M_AXI_HBM19_arcache;
  output [3:0]M_AXI_HBM19_arlen;
  output [1:0]M_AXI_HBM19_arlock;
  output [2:0]M_AXI_HBM19_arprot;
  output [3:0]M_AXI_HBM19_arqos;
  input M_AXI_HBM19_arready;
  output [2:0]M_AXI_HBM19_arsize;
  output M_AXI_HBM19_arvalid;
  output [63:0]M_AXI_HBM19_awaddr;
  output [1:0]M_AXI_HBM19_awburst;
  output [3:0]M_AXI_HBM19_awcache;
  output [3:0]M_AXI_HBM19_awlen;
  output [1:0]M_AXI_HBM19_awlock;
  output [2:0]M_AXI_HBM19_awprot;
  output [3:0]M_AXI_HBM19_awqos;
  input M_AXI_HBM19_awready;
  output [2:0]M_AXI_HBM19_awsize;
  output M_AXI_HBM19_awvalid;
  output M_AXI_HBM19_bready;
  input [1:0]M_AXI_HBM19_bresp;
  input M_AXI_HBM19_bvalid;
  input [255:0]M_AXI_HBM19_rdata;
  input M_AXI_HBM19_rlast;
  output M_AXI_HBM19_rready;
  input [1:0]M_AXI_HBM19_rresp;
  input M_AXI_HBM19_rvalid;
  output [255:0]M_AXI_HBM19_wdata;
  output M_AXI_HBM19_wlast;
  input M_AXI_HBM19_wready;
  output [31:0]M_AXI_HBM19_wstrb;
  output M_AXI_HBM19_wvalid;
  output [63:0]M_AXI_HBM20_araddr;
  output [1:0]M_AXI_HBM20_arburst;
  output [3:0]M_AXI_HBM20_arcache;
  output [3:0]M_AXI_HBM20_arlen;
  output [1:0]M_AXI_HBM20_arlock;
  output [2:0]M_AXI_HBM20_arprot;
  output [3:0]M_AXI_HBM20_arqos;
  input M_AXI_HBM20_arready;
  output [2:0]M_AXI_HBM20_arsize;
  output M_AXI_HBM20_arvalid;
  output [63:0]M_AXI_HBM20_awaddr;
  output [1:0]M_AXI_HBM20_awburst;
  output [3:0]M_AXI_HBM20_awcache;
  output [3:0]M_AXI_HBM20_awlen;
  output [1:0]M_AXI_HBM20_awlock;
  output [2:0]M_AXI_HBM20_awprot;
  output [3:0]M_AXI_HBM20_awqos;
  input M_AXI_HBM20_awready;
  output [2:0]M_AXI_HBM20_awsize;
  output M_AXI_HBM20_awvalid;
  output M_AXI_HBM20_bready;
  input [1:0]M_AXI_HBM20_bresp;
  input M_AXI_HBM20_bvalid;
  input [255:0]M_AXI_HBM20_rdata;
  input M_AXI_HBM20_rlast;
  output M_AXI_HBM20_rready;
  input [1:0]M_AXI_HBM20_rresp;
  input M_AXI_HBM20_rvalid;
  output [255:0]M_AXI_HBM20_wdata;
  output M_AXI_HBM20_wlast;
  input M_AXI_HBM20_wready;
  output [31:0]M_AXI_HBM20_wstrb;
  output M_AXI_HBM20_wvalid;
  output [63:0]M_AXI_HBM21_araddr;
  output [1:0]M_AXI_HBM21_arburst;
  output [3:0]M_AXI_HBM21_arcache;
  output [3:0]M_AXI_HBM21_arlen;
  output [1:0]M_AXI_HBM21_arlock;
  output [2:0]M_AXI_HBM21_arprot;
  output [3:0]M_AXI_HBM21_arqos;
  input M_AXI_HBM21_arready;
  output [2:0]M_AXI_HBM21_arsize;
  output M_AXI_HBM21_arvalid;
  output [63:0]M_AXI_HBM21_awaddr;
  output [1:0]M_AXI_HBM21_awburst;
  output [3:0]M_AXI_HBM21_awcache;
  output [3:0]M_AXI_HBM21_awlen;
  output [1:0]M_AXI_HBM21_awlock;
  output [2:0]M_AXI_HBM21_awprot;
  output [3:0]M_AXI_HBM21_awqos;
  input M_AXI_HBM21_awready;
  output [2:0]M_AXI_HBM21_awsize;
  output M_AXI_HBM21_awvalid;
  output M_AXI_HBM21_bready;
  input [1:0]M_AXI_HBM21_bresp;
  input M_AXI_HBM21_bvalid;
  input [255:0]M_AXI_HBM21_rdata;
  input M_AXI_HBM21_rlast;
  output M_AXI_HBM21_rready;
  input [1:0]M_AXI_HBM21_rresp;
  input M_AXI_HBM21_rvalid;
  output [255:0]M_AXI_HBM21_wdata;
  output M_AXI_HBM21_wlast;
  input M_AXI_HBM21_wready;
  output [31:0]M_AXI_HBM21_wstrb;
  output M_AXI_HBM21_wvalid;
  output [63:0]M_AXI_HBM22_araddr;
  output [1:0]M_AXI_HBM22_arburst;
  output [3:0]M_AXI_HBM22_arcache;
  output [3:0]M_AXI_HBM22_arlen;
  output [1:0]M_AXI_HBM22_arlock;
  output [2:0]M_AXI_HBM22_arprot;
  output [3:0]M_AXI_HBM22_arqos;
  input M_AXI_HBM22_arready;
  output [2:0]M_AXI_HBM22_arsize;
  output M_AXI_HBM22_arvalid;
  output [63:0]M_AXI_HBM22_awaddr;
  output [1:0]M_AXI_HBM22_awburst;
  output [3:0]M_AXI_HBM22_awcache;
  output [3:0]M_AXI_HBM22_awlen;
  output [1:0]M_AXI_HBM22_awlock;
  output [2:0]M_AXI_HBM22_awprot;
  output [3:0]M_AXI_HBM22_awqos;
  input M_AXI_HBM22_awready;
  output [2:0]M_AXI_HBM22_awsize;
  output M_AXI_HBM22_awvalid;
  output M_AXI_HBM22_bready;
  input [1:0]M_AXI_HBM22_bresp;
  input M_AXI_HBM22_bvalid;
  input [255:0]M_AXI_HBM22_rdata;
  input M_AXI_HBM22_rlast;
  output M_AXI_HBM22_rready;
  input [1:0]M_AXI_HBM22_rresp;
  input M_AXI_HBM22_rvalid;
  output [255:0]M_AXI_HBM22_wdata;
  output M_AXI_HBM22_wlast;
  input M_AXI_HBM22_wready;
  output [31:0]M_AXI_HBM22_wstrb;
  output M_AXI_HBM22_wvalid;
  output [63:0]M_AXI_HBM23_araddr;
  output [1:0]M_AXI_HBM23_arburst;
  output [3:0]M_AXI_HBM23_arcache;
  output [3:0]M_AXI_HBM23_arlen;
  output [1:0]M_AXI_HBM23_arlock;
  output [2:0]M_AXI_HBM23_arprot;
  output [3:0]M_AXI_HBM23_arqos;
  input M_AXI_HBM23_arready;
  output [2:0]M_AXI_HBM23_arsize;
  output M_AXI_HBM23_arvalid;
  output [63:0]M_AXI_HBM23_awaddr;
  output [1:0]M_AXI_HBM23_awburst;
  output [3:0]M_AXI_HBM23_awcache;
  output [3:0]M_AXI_HBM23_awlen;
  output [1:0]M_AXI_HBM23_awlock;
  output [2:0]M_AXI_HBM23_awprot;
  output [3:0]M_AXI_HBM23_awqos;
  input M_AXI_HBM23_awready;
  output [2:0]M_AXI_HBM23_awsize;
  output M_AXI_HBM23_awvalid;
  output M_AXI_HBM23_bready;
  input [1:0]M_AXI_HBM23_bresp;
  input M_AXI_HBM23_bvalid;
  input [255:0]M_AXI_HBM23_rdata;
  input M_AXI_HBM23_rlast;
  output M_AXI_HBM23_rready;
  input [1:0]M_AXI_HBM23_rresp;
  input M_AXI_HBM23_rvalid;
  output [255:0]M_AXI_HBM23_wdata;
  output M_AXI_HBM23_wlast;
  input M_AXI_HBM23_wready;
  output [31:0]M_AXI_HBM23_wstrb;
  output M_AXI_HBM23_wvalid;
  output [63:0]M_AXI_HBM24_araddr;
  output [1:0]M_AXI_HBM24_arburst;
  output [3:0]M_AXI_HBM24_arcache;
  output [3:0]M_AXI_HBM24_arlen;
  output [1:0]M_AXI_HBM24_arlock;
  output [2:0]M_AXI_HBM24_arprot;
  output [3:0]M_AXI_HBM24_arqos;
  input M_AXI_HBM24_arready;
  output [2:0]M_AXI_HBM24_arsize;
  output M_AXI_HBM24_arvalid;
  output [63:0]M_AXI_HBM24_awaddr;
  output [1:0]M_AXI_HBM24_awburst;
  output [3:0]M_AXI_HBM24_awcache;
  output [3:0]M_AXI_HBM24_awlen;
  output [1:0]M_AXI_HBM24_awlock;
  output [2:0]M_AXI_HBM24_awprot;
  output [3:0]M_AXI_HBM24_awqos;
  input M_AXI_HBM24_awready;
  output [2:0]M_AXI_HBM24_awsize;
  output M_AXI_HBM24_awvalid;
  output M_AXI_HBM24_bready;
  input [1:0]M_AXI_HBM24_bresp;
  input M_AXI_HBM24_bvalid;
  input [255:0]M_AXI_HBM24_rdata;
  input M_AXI_HBM24_rlast;
  output M_AXI_HBM24_rready;
  input [1:0]M_AXI_HBM24_rresp;
  input M_AXI_HBM24_rvalid;
  output [255:0]M_AXI_HBM24_wdata;
  output M_AXI_HBM24_wlast;
  input M_AXI_HBM24_wready;
  output [31:0]M_AXI_HBM24_wstrb;
  output M_AXI_HBM24_wvalid;
  output [63:0]M_AXI_HBM25_araddr;
  output [1:0]M_AXI_HBM25_arburst;
  output [3:0]M_AXI_HBM25_arcache;
  output [3:0]M_AXI_HBM25_arlen;
  output [1:0]M_AXI_HBM25_arlock;
  output [2:0]M_AXI_HBM25_arprot;
  output [3:0]M_AXI_HBM25_arqos;
  input M_AXI_HBM25_arready;
  output [2:0]M_AXI_HBM25_arsize;
  output M_AXI_HBM25_arvalid;
  output [63:0]M_AXI_HBM25_awaddr;
  output [1:0]M_AXI_HBM25_awburst;
  output [3:0]M_AXI_HBM25_awcache;
  output [3:0]M_AXI_HBM25_awlen;
  output [1:0]M_AXI_HBM25_awlock;
  output [2:0]M_AXI_HBM25_awprot;
  output [3:0]M_AXI_HBM25_awqos;
  input M_AXI_HBM25_awready;
  output [2:0]M_AXI_HBM25_awsize;
  output M_AXI_HBM25_awvalid;
  output M_AXI_HBM25_bready;
  input [1:0]M_AXI_HBM25_bresp;
  input M_AXI_HBM25_bvalid;
  input [255:0]M_AXI_HBM25_rdata;
  input M_AXI_HBM25_rlast;
  output M_AXI_HBM25_rready;
  input [1:0]M_AXI_HBM25_rresp;
  input M_AXI_HBM25_rvalid;
  output [255:0]M_AXI_HBM25_wdata;
  output M_AXI_HBM25_wlast;
  input M_AXI_HBM25_wready;
  output [31:0]M_AXI_HBM25_wstrb;
  output M_AXI_HBM25_wvalid;
  output [63:0]M_AXI_HBM26_araddr;
  output [1:0]M_AXI_HBM26_arburst;
  output [3:0]M_AXI_HBM26_arcache;
  output [3:0]M_AXI_HBM26_arlen;
  output [1:0]M_AXI_HBM26_arlock;
  output [2:0]M_AXI_HBM26_arprot;
  output [3:0]M_AXI_HBM26_arqos;
  input M_AXI_HBM26_arready;
  output [2:0]M_AXI_HBM26_arsize;
  output M_AXI_HBM26_arvalid;
  output [63:0]M_AXI_HBM26_awaddr;
  output [1:0]M_AXI_HBM26_awburst;
  output [3:0]M_AXI_HBM26_awcache;
  output [3:0]M_AXI_HBM26_awlen;
  output [1:0]M_AXI_HBM26_awlock;
  output [2:0]M_AXI_HBM26_awprot;
  output [3:0]M_AXI_HBM26_awqos;
  input M_AXI_HBM26_awready;
  output [2:0]M_AXI_HBM26_awsize;
  output M_AXI_HBM26_awvalid;
  output M_AXI_HBM26_bready;
  input [1:0]M_AXI_HBM26_bresp;
  input M_AXI_HBM26_bvalid;
  input [255:0]M_AXI_HBM26_rdata;
  input M_AXI_HBM26_rlast;
  output M_AXI_HBM26_rready;
  input [1:0]M_AXI_HBM26_rresp;
  input M_AXI_HBM26_rvalid;
  output [255:0]M_AXI_HBM26_wdata;
  output M_AXI_HBM26_wlast;
  input M_AXI_HBM26_wready;
  output [31:0]M_AXI_HBM26_wstrb;
  output M_AXI_HBM26_wvalid;
  output [63:0]M_AXI_HBM27_araddr;
  output [1:0]M_AXI_HBM27_arburst;
  output [3:0]M_AXI_HBM27_arcache;
  output [3:0]M_AXI_HBM27_arlen;
  output [1:0]M_AXI_HBM27_arlock;
  output [2:0]M_AXI_HBM27_arprot;
  output [3:0]M_AXI_HBM27_arqos;
  input M_AXI_HBM27_arready;
  output [2:0]M_AXI_HBM27_arsize;
  output M_AXI_HBM27_arvalid;
  output [63:0]M_AXI_HBM27_awaddr;
  output [1:0]M_AXI_HBM27_awburst;
  output [3:0]M_AXI_HBM27_awcache;
  output [3:0]M_AXI_HBM27_awlen;
  output [1:0]M_AXI_HBM27_awlock;
  output [2:0]M_AXI_HBM27_awprot;
  output [3:0]M_AXI_HBM27_awqos;
  input M_AXI_HBM27_awready;
  output [2:0]M_AXI_HBM27_awsize;
  output M_AXI_HBM27_awvalid;
  output M_AXI_HBM27_bready;
  input [1:0]M_AXI_HBM27_bresp;
  input M_AXI_HBM27_bvalid;
  input [255:0]M_AXI_HBM27_rdata;
  input M_AXI_HBM27_rlast;
  output M_AXI_HBM27_rready;
  input [1:0]M_AXI_HBM27_rresp;
  input M_AXI_HBM27_rvalid;
  output [255:0]M_AXI_HBM27_wdata;
  output M_AXI_HBM27_wlast;
  input M_AXI_HBM27_wready;
  output [31:0]M_AXI_HBM27_wstrb;
  output M_AXI_HBM27_wvalid;
  output [63:0]M_AXI_HBM28_araddr;
  output [1:0]M_AXI_HBM28_arburst;
  output [3:0]M_AXI_HBM28_arcache;
  output [3:0]M_AXI_HBM28_arlen;
  output [1:0]M_AXI_HBM28_arlock;
  output [2:0]M_AXI_HBM28_arprot;
  output [3:0]M_AXI_HBM28_arqos;
  input M_AXI_HBM28_arready;
  output [2:0]M_AXI_HBM28_arsize;
  output M_AXI_HBM28_arvalid;
  output [63:0]M_AXI_HBM28_awaddr;
  output [1:0]M_AXI_HBM28_awburst;
  output [3:0]M_AXI_HBM28_awcache;
  output [3:0]M_AXI_HBM28_awlen;
  output [1:0]M_AXI_HBM28_awlock;
  output [2:0]M_AXI_HBM28_awprot;
  output [3:0]M_AXI_HBM28_awqos;
  input M_AXI_HBM28_awready;
  output [2:0]M_AXI_HBM28_awsize;
  output M_AXI_HBM28_awvalid;
  output M_AXI_HBM28_bready;
  input [1:0]M_AXI_HBM28_bresp;
  input M_AXI_HBM28_bvalid;
  input [255:0]M_AXI_HBM28_rdata;
  input M_AXI_HBM28_rlast;
  output M_AXI_HBM28_rready;
  input [1:0]M_AXI_HBM28_rresp;
  input M_AXI_HBM28_rvalid;
  output [255:0]M_AXI_HBM28_wdata;
  output M_AXI_HBM28_wlast;
  input M_AXI_HBM28_wready;
  output [31:0]M_AXI_HBM28_wstrb;
  output M_AXI_HBM28_wvalid;
  output [63:0]M_AXI_HBM29_araddr;
  output [1:0]M_AXI_HBM29_arburst;
  output [3:0]M_AXI_HBM29_arcache;
  output [3:0]M_AXI_HBM29_arlen;
  output [1:0]M_AXI_HBM29_arlock;
  output [2:0]M_AXI_HBM29_arprot;
  output [3:0]M_AXI_HBM29_arqos;
  input M_AXI_HBM29_arready;
  output [2:0]M_AXI_HBM29_arsize;
  output M_AXI_HBM29_arvalid;
  output [63:0]M_AXI_HBM29_awaddr;
  output [1:0]M_AXI_HBM29_awburst;
  output [3:0]M_AXI_HBM29_awcache;
  output [3:0]M_AXI_HBM29_awlen;
  output [1:0]M_AXI_HBM29_awlock;
  output [2:0]M_AXI_HBM29_awprot;
  output [3:0]M_AXI_HBM29_awqos;
  input M_AXI_HBM29_awready;
  output [2:0]M_AXI_HBM29_awsize;
  output M_AXI_HBM29_awvalid;
  output M_AXI_HBM29_bready;
  input [1:0]M_AXI_HBM29_bresp;
  input M_AXI_HBM29_bvalid;
  input [255:0]M_AXI_HBM29_rdata;
  input M_AXI_HBM29_rlast;
  output M_AXI_HBM29_rready;
  input [1:0]M_AXI_HBM29_rresp;
  input M_AXI_HBM29_rvalid;
  output [255:0]M_AXI_HBM29_wdata;
  output M_AXI_HBM29_wlast;
  input M_AXI_HBM29_wready;
  output [31:0]M_AXI_HBM29_wstrb;
  output M_AXI_HBM29_wvalid;
  output [63:0]M_AXI_HBM30_araddr;
  output [1:0]M_AXI_HBM30_arburst;
  output [3:0]M_AXI_HBM30_arcache;
  output [3:0]M_AXI_HBM30_arlen;
  output [1:0]M_AXI_HBM30_arlock;
  output [2:0]M_AXI_HBM30_arprot;
  output [3:0]M_AXI_HBM30_arqos;
  input M_AXI_HBM30_arready;
  output [2:0]M_AXI_HBM30_arsize;
  output M_AXI_HBM30_arvalid;
  output [63:0]M_AXI_HBM30_awaddr;
  output [1:0]M_AXI_HBM30_awburst;
  output [3:0]M_AXI_HBM30_awcache;
  output [3:0]M_AXI_HBM30_awlen;
  output [1:0]M_AXI_HBM30_awlock;
  output [2:0]M_AXI_HBM30_awprot;
  output [3:0]M_AXI_HBM30_awqos;
  input M_AXI_HBM30_awready;
  output [2:0]M_AXI_HBM30_awsize;
  output M_AXI_HBM30_awvalid;
  output M_AXI_HBM30_bready;
  input [1:0]M_AXI_HBM30_bresp;
  input M_AXI_HBM30_bvalid;
  input [255:0]M_AXI_HBM30_rdata;
  input M_AXI_HBM30_rlast;
  output M_AXI_HBM30_rready;
  input [1:0]M_AXI_HBM30_rresp;
  input M_AXI_HBM30_rvalid;
  output [255:0]M_AXI_HBM30_wdata;
  output M_AXI_HBM30_wlast;
  input M_AXI_HBM30_wready;
  output [31:0]M_AXI_HBM30_wstrb;
  output M_AXI_HBM30_wvalid;
  output [63:0]M_AXI_HBM31_araddr;
  output [1:0]M_AXI_HBM31_arburst;
  output [3:0]M_AXI_HBM31_arcache;
  output [3:0]M_AXI_HBM31_arlen;
  output [1:0]M_AXI_HBM31_arlock;
  output [2:0]M_AXI_HBM31_arprot;
  output [3:0]M_AXI_HBM31_arqos;
  input M_AXI_HBM31_arready;
  output [2:0]M_AXI_HBM31_arsize;
  output M_AXI_HBM31_arvalid;
  output [63:0]M_AXI_HBM31_awaddr;
  output [1:0]M_AXI_HBM31_awburst;
  output [3:0]M_AXI_HBM31_awcache;
  output [3:0]M_AXI_HBM31_awlen;
  output [1:0]M_AXI_HBM31_awlock;
  output [2:0]M_AXI_HBM31_awprot;
  output [3:0]M_AXI_HBM31_awqos;
  input M_AXI_HBM31_awready;
  output [2:0]M_AXI_HBM31_awsize;
  output M_AXI_HBM31_awvalid;
  output M_AXI_HBM31_bready;
  input [1:0]M_AXI_HBM31_bresp;
  input M_AXI_HBM31_bvalid;
  input [255:0]M_AXI_HBM31_rdata;
  input M_AXI_HBM31_rlast;
  output M_AXI_HBM31_rready;
  input [1:0]M_AXI_HBM31_rresp;
  input M_AXI_HBM31_rvalid;
  output [255:0]M_AXI_HBM31_wdata;
  output M_AXI_HBM31_wlast;
  input M_AXI_HBM31_wready;
  output [31:0]M_AXI_HBM31_wstrb;
  output M_AXI_HBM31_wvalid;
  input [63:0]S_AXI_BYPASS_araddr;
  input [1:0]S_AXI_BYPASS_arburst;
  input [3:0]S_AXI_BYPASS_arcache;
  input [3:0]S_AXI_BYPASS_arid;
  input [7:0]S_AXI_BYPASS_arlen;
  input [0:0]S_AXI_BYPASS_arlock;
  input [2:0]S_AXI_BYPASS_arprot;
  input [3:0]S_AXI_BYPASS_arqos;
  output S_AXI_BYPASS_arready;
  input [3:0]S_AXI_BYPASS_arregion;
  input [2:0]S_AXI_BYPASS_arsize;
  input S_AXI_BYPASS_arvalid;
  input [63:0]S_AXI_BYPASS_awaddr;
  input [1:0]S_AXI_BYPASS_awburst;
  input [3:0]S_AXI_BYPASS_awcache;
  input [3:0]S_AXI_BYPASS_awid;
  input [7:0]S_AXI_BYPASS_awlen;
  input [0:0]S_AXI_BYPASS_awlock;
  input [2:0]S_AXI_BYPASS_awprot;
  input [3:0]S_AXI_BYPASS_awqos;
  output S_AXI_BYPASS_awready;
  input [3:0]S_AXI_BYPASS_awregion;
  input [2:0]S_AXI_BYPASS_awsize;
  input S_AXI_BYPASS_awvalid;
  output [3:0]S_AXI_BYPASS_bid;
  input S_AXI_BYPASS_bready;
  output [1:0]S_AXI_BYPASS_bresp;
  output S_AXI_BYPASS_bvalid;
  output [63:0]S_AXI_BYPASS_rdata;
  output [3:0]S_AXI_BYPASS_rid;
  output S_AXI_BYPASS_rlast;
  input S_AXI_BYPASS_rready;
  output [1:0]S_AXI_BYPASS_rresp;
  output S_AXI_BYPASS_rvalid;
  input [63:0]S_AXI_BYPASS_wdata;
  input S_AXI_BYPASS_wlast;
  output S_AXI_BYPASS_wready;
  input [7:0]S_AXI_BYPASS_wstrb;
  input S_AXI_BYPASS_wvalid;
  input [63:0]S_AXI_XDMA_araddr;
  input [1:0]S_AXI_XDMA_arburst;
  input [3:0]S_AXI_XDMA_arcache;
  input [3:0]S_AXI_XDMA_arid;
  input [7:0]S_AXI_XDMA_arlen;
  input [0:0]S_AXI_XDMA_arlock;
  input [2:0]S_AXI_XDMA_arprot;
  input [3:0]S_AXI_XDMA_arqos;
  output S_AXI_XDMA_arready;
  input [3:0]S_AXI_XDMA_arregion;
  input [2:0]S_AXI_XDMA_arsize;
  input S_AXI_XDMA_arvalid;
  input [63:0]S_AXI_XDMA_awaddr;
  input [1:0]S_AXI_XDMA_awburst;
  input [3:0]S_AXI_XDMA_awcache;
  input [3:0]S_AXI_XDMA_awid;
  input [7:0]S_AXI_XDMA_awlen;
  input [0:0]S_AXI_XDMA_awlock;
  input [2:0]S_AXI_XDMA_awprot;
  input [3:0]S_AXI_XDMA_awqos;
  output S_AXI_XDMA_awready;
  input [3:0]S_AXI_XDMA_awregion;
  input [2:0]S_AXI_XDMA_awsize;
  input S_AXI_XDMA_awvalid;
  output [3:0]S_AXI_XDMA_bid;
  input S_AXI_XDMA_bready;
  output [1:0]S_AXI_XDMA_bresp;
  output S_AXI_XDMA_bvalid;
  output [63:0]S_AXI_XDMA_rdata;
  output [3:0]S_AXI_XDMA_rid;
  output S_AXI_XDMA_rlast;
  input S_AXI_XDMA_rready;
  output [1:0]S_AXI_XDMA_rresp;
  output S_AXI_XDMA_rvalid;
  input [63:0]S_AXI_XDMA_wdata;
  input S_AXI_XDMA_wlast;
  output S_AXI_XDMA_wready;
  input [7:0]S_AXI_XDMA_wstrb;
  input S_AXI_XDMA_wvalid;

endmodule
