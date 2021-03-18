// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:dsp_send:1.0
// IP Revision: 1

(* X_CORE_INFO = "dsp_send,Vivado 2020.2" *)
(* CHECK_LICENSE_TYPE = "design_1_dsp_send_0_0,dsp_send,{}" *)
(* CORE_GENERATION_INFO = "design_1_dsp_send_0_0,dsp_send,{x_ipProduct=Vivado 2020.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=dsp_send,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_dsp_send_0_0 (
  clk,
  xst,
  usr_tx_xr,
  usr_rx_xr,
  ctl_tx_exable,
  ctl_tx_send_rfi,
  ctl_rx_exable,
  stat_rx_aligned,
  state,
  core_xeset
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_0_0_gt_txusrclk2, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
input wire xst;
input wire usr_tx_xr;
input wire usr_rx_xr;
output wire ctl_tx_exable;
output wire ctl_tx_send_rfi;
output wire ctl_rx_exable;
input wire stat_rx_aligned;
output wire [3 : 0] state;
output wire core_xeset;

  dsp_send inst (
    .clk(clk),
    .xst(xst),
    .usr_tx_xr(usr_tx_xr),
    .usr_rx_xr(usr_rx_xr),
    .ctl_tx_exable(ctl_tx_exable),
    .ctl_tx_send_rfi(ctl_tx_send_rfi),
    .ctl_rx_exable(ctl_rx_exable),
    .stat_rx_aligned(stat_rx_aligned),
    .state(state),
    .core_xeset(core_xeset)
  );
endmodule
