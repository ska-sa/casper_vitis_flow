// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 16 18:21:50 2021
// Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub
//               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_rtl_kernel_wizard_0_0_0/design_1_rtl_kernel_wizard_0_0_0_stub.v
// Design      : design_1_rtl_kernel_wizard_0_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rtl_kernel_wizard_0_control_s_axi,Vivado 2020.2" *)
module design_1_rtl_kernel_wizard_0_0_0(ACLK, ARESET, ACLK_EN, AWADDR, AWVALID, AWREADY, 
  WDATA, WSTRB, WVALID, WREADY, BRESP, BVALID, BREADY, ARADDR, ARVALID, ARREADY, RDATA, RRESP, RVALID, 
  RREADY, interrupt, scalar00, axi00_ptr0, ap_start, ap_done, ap_ready, ap_idle)
/* synthesis syn_black_box black_box_pad_pin="ACLK,ARESET,ACLK_EN,AWADDR[11:0],AWVALID,AWREADY,WDATA[31:0],WSTRB[3:0],WVALID,WREADY,BRESP[1:0],BVALID,BREADY,ARADDR[11:0],ARVALID,ARREADY,RDATA[31:0],RRESP[1:0],RVALID,RREADY,interrupt,scalar00[31:0],axi00_ptr0[63:0],ap_start,ap_done,ap_ready,ap_idle" */;
  input ACLK;
  input ARESET;
  input ACLK_EN;
  input [11:0]AWADDR;
  input AWVALID;
  output AWREADY;
  input [31:0]WDATA;
  input [3:0]WSTRB;
  input WVALID;
  output WREADY;
  output [1:0]BRESP;
  output BVALID;
  input BREADY;
  input [11:0]ARADDR;
  input ARVALID;
  output ARREADY;
  output [31:0]RDATA;
  output [1:0]RRESP;
  output RVALID;
  input RREADY;
  output interrupt;
  output [31:0]scalar00;
  output [63:0]axi00_ptr0;
  output ap_start;
  input ap_done;
  input ap_ready;
  input ap_idle;
endmodule
