// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 16 17:56:04 2021
// Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub
//               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_dsp_send_0_0/design_1_dsp_send_0_0_stub.v
// Design      : design_1_dsp_send_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "dsp_send,Vivado 2020.2" *)
module design_1_dsp_send_0_0(clk, xst, usr_tx_xr, usr_rx_xr, ctl_tx_exable, 
  ctl_tx_send_rfi, ctl_rx_exable, stat_rx_aligned, state, core_xeset)
/* synthesis syn_black_box black_box_pad_pin="clk,xst,usr_tx_xr,usr_rx_xr,ctl_tx_exable,ctl_tx_send_rfi,ctl_rx_exable,stat_rx_aligned,state[3:0],core_xeset" */;
  input clk;
  input xst;
  input usr_tx_xr;
  input usr_rx_xr;
  output ctl_tx_exable;
  output ctl_tx_send_rfi;
  output ctl_rx_exable;
  input stat_rx_aligned;
  output [3:0]state;
  output core_xeset;
endmodule
