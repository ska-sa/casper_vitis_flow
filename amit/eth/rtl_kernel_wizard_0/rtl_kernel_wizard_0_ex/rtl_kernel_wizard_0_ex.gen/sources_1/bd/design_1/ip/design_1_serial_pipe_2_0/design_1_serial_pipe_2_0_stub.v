// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 16 17:56:04 2021
// Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub
//               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_serial_pipe_2_0/design_1_serial_pipe_2_0_stub.v
// Design      : design_1_serial_pipe_2_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "serial_pipe,Vivado 2020.2" *)
module design_1_serial_pipe_2_0(clk, rst_s_n, en, serial_in, serial_out)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_s_n,en,serial_in,serial_out" */;
  input clk;
  input rst_s_n;
  input en;
  input serial_in;
  output serial_out;
endmodule
