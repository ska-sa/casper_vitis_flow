//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu Mar 18 09:35:52 2021
//Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (ACLK_EN_0,
    ARESET_0,
    S00_AXI_0_araddr,
    S00_AXI_0_arprot,
    S00_AXI_0_arready,
    S00_AXI_0_arvalid,
    S00_AXI_0_awaddr,
    S00_AXI_0_awprot,
    S00_AXI_0_awready,
    S00_AXI_0_awvalid,
    S00_AXI_0_bready,
    S00_AXI_0_bresp,
    S00_AXI_0_bvalid,
    S00_AXI_0_rdata,
    S00_AXI_0_rready,
    S00_AXI_0_rresp,
    S00_AXI_0_rvalid,
    S00_AXI_0_wdata,
    S00_AXI_0_wready,
    S00_AXI_0_wstrb,
    S00_AXI_0_wvalid,
    aclk_0,
    ap_done_0,
    ap_idle_0,
    ap_ready_0,
    ap_start_0,
    axi00_ptr0_0,
    gt_ref_clk_0_clk_n,
    gt_ref_clk_0_clk_p,
    gt_ref_clk_1_clk_n,
    gt_ref_clk_1_clk_p,
    gt_serial_port_0_grx_n,
    gt_serial_port_0_grx_p,
    gt_serial_port_0_gtx_n,
    gt_serial_port_0_gtx_p,
    gt_serial_port_1_grx_n,
    gt_serial_port_1_grx_p,
    gt_serial_port_1_gtx_n,
    gt_serial_port_1_gtx_p,
    interrupt_0,
    locked,
    scalar00_0);
  input ACLK_EN_0;
  input ARESET_0;
  input [31:0]S00_AXI_0_araddr;
  input [2:0]S00_AXI_0_arprot;
  output S00_AXI_0_arready;
  input S00_AXI_0_arvalid;
  input [31:0]S00_AXI_0_awaddr;
  input [2:0]S00_AXI_0_awprot;
  output S00_AXI_0_awready;
  input S00_AXI_0_awvalid;
  input S00_AXI_0_bready;
  output [1:0]S00_AXI_0_bresp;
  output S00_AXI_0_bvalid;
  output [31:0]S00_AXI_0_rdata;
  input S00_AXI_0_rready;
  output [1:0]S00_AXI_0_rresp;
  output S00_AXI_0_rvalid;
  input [31:0]S00_AXI_0_wdata;
  output S00_AXI_0_wready;
  input [3:0]S00_AXI_0_wstrb;
  input S00_AXI_0_wvalid;
  input aclk_0;
  input ap_done_0;
  input ap_idle_0;
  input ap_ready_0;
  output ap_start_0;
  output [63:0]axi00_ptr0_0;
  input gt_ref_clk_0_clk_n;
  input gt_ref_clk_0_clk_p;
  input gt_ref_clk_1_clk_n;
  input gt_ref_clk_1_clk_p;
  input [3:0]gt_serial_port_0_grx_n;
  input [3:0]gt_serial_port_0_grx_p;
  output [3:0]gt_serial_port_0_gtx_n;
  output [3:0]gt_serial_port_0_gtx_p;
  input [3:0]gt_serial_port_1_grx_n;
  input [3:0]gt_serial_port_1_grx_p;
  output [3:0]gt_serial_port_1_gtx_n;
  output [3:0]gt_serial_port_1_gtx_p;
  output interrupt_0;
  input locked;
  output [31:0]scalar00_0;

  wire ACLK_EN_0;
  wire ARESET_0;
  wire [31:0]S00_AXI_0_araddr;
  wire [2:0]S00_AXI_0_arprot;
  wire S00_AXI_0_arready;
  wire S00_AXI_0_arvalid;
  wire [31:0]S00_AXI_0_awaddr;
  wire [2:0]S00_AXI_0_awprot;
  wire S00_AXI_0_awready;
  wire S00_AXI_0_awvalid;
  wire S00_AXI_0_bready;
  wire [1:0]S00_AXI_0_bresp;
  wire S00_AXI_0_bvalid;
  wire [31:0]S00_AXI_0_rdata;
  wire S00_AXI_0_rready;
  wire [1:0]S00_AXI_0_rresp;
  wire S00_AXI_0_rvalid;
  wire [31:0]S00_AXI_0_wdata;
  wire S00_AXI_0_wready;
  wire [3:0]S00_AXI_0_wstrb;
  wire S00_AXI_0_wvalid;
  wire aclk_0;
  wire ap_done_0;
  wire ap_idle_0;
  wire ap_ready_0;
  wire ap_start_0;
  wire [63:0]axi00_ptr0_0;
  wire gt_ref_clk_0_clk_n;
  wire gt_ref_clk_0_clk_p;
  wire gt_ref_clk_1_clk_n;
  wire gt_ref_clk_1_clk_p;
  wire [3:0]gt_serial_port_0_grx_n;
  wire [3:0]gt_serial_port_0_grx_p;
  wire [3:0]gt_serial_port_0_gtx_n;
  wire [3:0]gt_serial_port_0_gtx_p;
  wire [3:0]gt_serial_port_1_grx_n;
  wire [3:0]gt_serial_port_1_grx_p;
  wire [3:0]gt_serial_port_1_gtx_n;
  wire [3:0]gt_serial_port_1_gtx_p;
  wire interrupt_0;
  wire locked;
  wire [31:0]scalar00_0;

  design_1 design_1_i
       (.ACLK_EN_0(ACLK_EN_0),
        .ARESET_0(ARESET_0),
        .S00_AXI_0_araddr(S00_AXI_0_araddr),
        .S00_AXI_0_arprot(S00_AXI_0_arprot),
        .S00_AXI_0_arready(S00_AXI_0_arready),
        .S00_AXI_0_arvalid(S00_AXI_0_arvalid),
        .S00_AXI_0_awaddr(S00_AXI_0_awaddr),
        .S00_AXI_0_awprot(S00_AXI_0_awprot),
        .S00_AXI_0_awready(S00_AXI_0_awready),
        .S00_AXI_0_awvalid(S00_AXI_0_awvalid),
        .S00_AXI_0_bready(S00_AXI_0_bready),
        .S00_AXI_0_bresp(S00_AXI_0_bresp),
        .S00_AXI_0_bvalid(S00_AXI_0_bvalid),
        .S00_AXI_0_rdata(S00_AXI_0_rdata),
        .S00_AXI_0_rready(S00_AXI_0_rready),
        .S00_AXI_0_rresp(S00_AXI_0_rresp),
        .S00_AXI_0_rvalid(S00_AXI_0_rvalid),
        .S00_AXI_0_wdata(S00_AXI_0_wdata),
        .S00_AXI_0_wready(S00_AXI_0_wready),
        .S00_AXI_0_wstrb(S00_AXI_0_wstrb),
        .S00_AXI_0_wvalid(S00_AXI_0_wvalid),
        .aclk_0(aclk_0),
        .ap_done_0(ap_done_0),
        .ap_idle_0(ap_idle_0),
        .ap_ready_0(ap_ready_0),
        .ap_start_0(ap_start_0),
        .axi00_ptr0_0(axi00_ptr0_0),
        .gt_ref_clk_0_clk_n(gt_ref_clk_0_clk_n),
        .gt_ref_clk_0_clk_p(gt_ref_clk_0_clk_p),
        .gt_ref_clk_1_clk_n(gt_ref_clk_1_clk_n),
        .gt_ref_clk_1_clk_p(gt_ref_clk_1_clk_p),
        .gt_serial_port_0_grx_n(gt_serial_port_0_grx_n),
        .gt_serial_port_0_grx_p(gt_serial_port_0_grx_p),
        .gt_serial_port_0_gtx_n(gt_serial_port_0_gtx_n),
        .gt_serial_port_0_gtx_p(gt_serial_port_0_gtx_p),
        .gt_serial_port_1_grx_n(gt_serial_port_1_grx_n),
        .gt_serial_port_1_grx_p(gt_serial_port_1_grx_p),
        .gt_serial_port_1_gtx_n(gt_serial_port_1_gtx_n),
        .gt_serial_port_1_gtx_p(gt_serial_port_1_gtx_p),
        .interrupt_0(interrupt_0),
        .locked(locked),
        .scalar00_0(scalar00_0));
endmodule
