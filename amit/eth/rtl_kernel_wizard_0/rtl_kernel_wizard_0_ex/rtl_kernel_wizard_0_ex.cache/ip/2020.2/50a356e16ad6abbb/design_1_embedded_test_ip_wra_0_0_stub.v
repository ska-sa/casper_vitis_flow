// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 16 17:56:11 2021
// Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_embedded_test_ip_wra_0_0_stub.v
// Design      : design_1_embedded_test_ip_wra_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "embedded_test_ip_wrapper,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(axi4lite_aclk, axi4lite_aresetn, 
  axi4lite_arready, axi4lite_arvalid, axi4lite_awready, axi4lite_awvalid, axi4lite_bready, 
  axi4lite_bvalid, axi4lite_rready, axi4lite_rvalid, axi4lite_wready, axi4lite_wvalid, 
  chk_axi4s_s_clk, chk_axi4s_s_rst, chk_axi4s_s_tlast, chk_axi4s_s_tready, 
  chk_axi4s_s_tvalid, gen_axi4s_m_clk, gen_axi4s_m_rst, gen_axi4s_m_tlast, 
  gen_axi4s_m_tready, gen_axi4s_m_tvalid, axi4lite_araddr, axi4lite_awaddr, axi4lite_bresp, 
  axi4lite_rdata, axi4lite_rresp, axi4lite_wdata, axi4lite_wstrb, chk_axi4s_s_tdata, 
  chk_axi4s_s_tid, chk_axi4s_s_tkeep, chk_axi4s_s_tuser, gen_axi4s_m_tdata, 
  gen_axi4s_m_tid, gen_axi4s_m_tkeep, gen_axi4s_m_tuser)
/* synthesis syn_black_box black_box_pad_pin="axi4lite_aclk,axi4lite_aresetn,axi4lite_arready,axi4lite_arvalid,axi4lite_awready,axi4lite_awvalid,axi4lite_bready,axi4lite_bvalid,axi4lite_rready,axi4lite_rvalid,axi4lite_wready,axi4lite_wvalid,chk_axi4s_s_clk,chk_axi4s_s_rst,chk_axi4s_s_tlast,chk_axi4s_s_tready,chk_axi4s_s_tvalid,gen_axi4s_m_clk,gen_axi4s_m_rst,gen_axi4s_m_tlast,gen_axi4s_m_tready,gen_axi4s_m_tvalid,axi4lite_araddr[31:0],axi4lite_awaddr[31:0],axi4lite_bresp[1:0],axi4lite_rdata[31:0],axi4lite_rresp[1:0],axi4lite_wdata[31:0],axi4lite_wstrb[3:0],chk_axi4s_s_tdata[511:0],chk_axi4s_s_tid[7:0],chk_axi4s_s_tkeep[63:0],chk_axi4s_s_tuser[31:0],gen_axi4s_m_tdata[511:0],gen_axi4s_m_tid[7:0],gen_axi4s_m_tkeep[63:0],gen_axi4s_m_tuser[31:0]" */;
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
  input chk_axi4s_s_clk;
  input chk_axi4s_s_rst;
  input chk_axi4s_s_tlast;
  output chk_axi4s_s_tready;
  input chk_axi4s_s_tvalid;
  input gen_axi4s_m_clk;
  input gen_axi4s_m_rst;
  output gen_axi4s_m_tlast;
  input gen_axi4s_m_tready;
  output gen_axi4s_m_tvalid;
  input [31:0]axi4lite_araddr;
  input [31:0]axi4lite_awaddr;
  output [1:0]axi4lite_bresp;
  output [31:0]axi4lite_rdata;
  output [1:0]axi4lite_rresp;
  input [31:0]axi4lite_wdata;
  input [3:0]axi4lite_wstrb;
  input [511:0]chk_axi4s_s_tdata;
  input [7:0]chk_axi4s_s_tid;
  input [63:0]chk_axi4s_s_tkeep;
  input [31:0]chk_axi4s_s_tuser;
  output [511:0]gen_axi4s_m_tdata;
  output [7:0]gen_axi4s_m_tid;
  output [63:0]gen_axi4s_m_tkeep;
  output [31:0]gen_axi4s_m_tuser;
endmodule
