// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Thu Oct 29 12:31:46 2020
// Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub
//               /.aux_mnt/fpgdeva/casperlibs/casper_astro/mlib_devel/100gbe/u50/dsp_packetizer/dsp_packetizer.srcs/ip/ila_1/ila_1_stub.v
// Design      : ila_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu50-fsvh2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2020.1" *)
module ila_1(clk, probe0, probe1)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[63:0],probe1[63:0]" */;
  input clk;
  input [63:0]probe0;
  input [63:0]probe1;
endmodule
