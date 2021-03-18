// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 16 17:56:21 2021
// Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top design_1_udp_core_eval_1_0 -prefix
//               design_1_udp_core_eval_1_0_ design_1_udp_core_eval_0_0_stub.v
// Design      : design_1_udp_core_eval_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "udp_core_eval,Vivado 2020.2" *)
module design_1_udp_core_eval_1_0(axi4lite_aclk, axi4lite_aresetn, 
  axi4lite_arready, axi4lite_arvalid, axi4lite_awready, axi4lite_awvalid, axi4lite_bready, 
  axi4lite_bvalid, axi4lite_rready, axi4lite_rvalid, axi4lite_wready, axi4lite_wvalid, 
  rx_axis_s_clk, rx_axis_s_rst, rx_axis_s_tlast, rx_axis_s_tready, rx_axis_s_tvalid, 
  rx_core_clk, tx_axis_m_clk, tx_axis_m_rst, tx_axis_m_tlast, tx_axis_m_tready, 
  tx_axis_m_tvalid, tx_core_clk, udp_axis_m_tlast, udp_axis_m_tready, udp_axis_m_tvalid, 
  udp_axis_s_tlast, udp_axis_s_tready, udp_axis_s_tvalid, axi4lite_araddr, axi4lite_awaddr, 
  axi4lite_bresp, axi4lite_rdata, axi4lite_rresp, axi4lite_wdata, axi4lite_wstrb, 
  rx_axis_s_tdata, rx_axis_s_tid, rx_axis_s_tkeep, rx_axis_s_tuser, tx_axis_m_tdata, 
  tx_axis_m_tid, tx_axis_m_tkeep, tx_axis_m_tuser, udp_axis_m_tdata, udp_axis_m_tid, 
  udp_axis_m_tkeep, udp_axis_m_tuser, udp_axis_s_tdata, udp_axis_s_tid, udp_axis_s_tkeep, 
  udp_axis_s_tuser)
/* synthesis syn_black_box black_box_pad_pin="axi4lite_aclk,axi4lite_aresetn,axi4lite_arready,axi4lite_arvalid,axi4lite_awready,axi4lite_awvalid,axi4lite_bready,axi4lite_bvalid,axi4lite_rready,axi4lite_rvalid,axi4lite_wready,axi4lite_wvalid,rx_axis_s_clk,rx_axis_s_rst,rx_axis_s_tlast,rx_axis_s_tready,rx_axis_s_tvalid,rx_core_clk,tx_axis_m_clk,tx_axis_m_rst,tx_axis_m_tlast,tx_axis_m_tready,tx_axis_m_tvalid,tx_core_clk,udp_axis_m_tlast,udp_axis_m_tready,udp_axis_m_tvalid,udp_axis_s_tlast,udp_axis_s_tready,udp_axis_s_tvalid,axi4lite_araddr[31:0],axi4lite_awaddr[31:0],axi4lite_bresp[1:0],axi4lite_rdata[31:0],axi4lite_rresp[1:0],axi4lite_wdata[31:0],axi4lite_wstrb[3:0],rx_axis_s_tdata[511:0],rx_axis_s_tid[7:0],rx_axis_s_tkeep[63:0],rx_axis_s_tuser[31:0],tx_axis_m_tdata[511:0],tx_axis_m_tid[7:0],tx_axis_m_tkeep[63:0],tx_axis_m_tuser[31:0],udp_axis_m_tdata[511:0],udp_axis_m_tid[7:0],udp_axis_m_tkeep[63:0],udp_axis_m_tuser[31:0],udp_axis_s_tdata[511:0],udp_axis_s_tid[7:0],udp_axis_s_tkeep[63:0],udp_axis_s_tuser[31:0]" */;
  input axi4lite_aclk;
  input axi4lite_aresetn;
  output axi4lite_arready;
  input axi4lite_arvalid;
  output axi4lite_awready;
  input axi4lite_awvalid;
  input axi4lite_bready;
  output axi4lite_bvalid;
  input axi4lite_rready;
  output axi4lite_rvalid;
  output axi4lite_wready;
  input axi4lite_wvalid;
  input rx_axis_s_clk;
  input rx_axis_s_rst;
  input rx_axis_s_tlast;
  output rx_axis_s_tready;
  input rx_axis_s_tvalid;
  input rx_core_clk;
  input tx_axis_m_clk;
  input tx_axis_m_rst;
  output tx_axis_m_tlast;
  input tx_axis_m_tready;
  output tx_axis_m_tvalid;
  input tx_core_clk;
  output udp_axis_m_tlast;
  input udp_axis_m_tready;
  output udp_axis_m_tvalid;
  input udp_axis_s_tlast;
  output udp_axis_s_tready;
  input udp_axis_s_tvalid;
  input [31:0]axi4lite_araddr;
  input [31:0]axi4lite_awaddr;
  output [1:0]axi4lite_bresp;
  output [31:0]axi4lite_rdata;
  output [1:0]axi4lite_rresp;
  input [31:0]axi4lite_wdata;
  input [3:0]axi4lite_wstrb;
  input [511:0]rx_axis_s_tdata;
  input [7:0]rx_axis_s_tid;
  input [63:0]rx_axis_s_tkeep;
  input [31:0]rx_axis_s_tuser;
  output [511:0]tx_axis_m_tdata;
  output [7:0]tx_axis_m_tid;
  output [63:0]tx_axis_m_tkeep;
  output [31:0]tx_axis_m_tuser;
  output [511:0]udp_axis_m_tdata;
  output [7:0]udp_axis_m_tid;
  output [63:0]udp_axis_m_tkeep;
  output [31:0]udp_axis_m_tuser;
  input [511:0]udp_axis_s_tdata;
  input [7:0]udp_axis_s_tid;
  input [63:0]udp_axis_s_tkeep;
  input [31:0]udp_axis_s_tuser;
endmodule
