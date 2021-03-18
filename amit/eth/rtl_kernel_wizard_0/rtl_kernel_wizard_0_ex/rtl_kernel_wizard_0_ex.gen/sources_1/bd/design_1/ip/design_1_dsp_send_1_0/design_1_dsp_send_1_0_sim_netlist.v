// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 16 17:56:05 2021
// Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode funcsim
//               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_dsp_send_1_0/design_1_dsp_send_1_0_sim_netlist.v
// Design      : design_1_dsp_send_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_dsp_send_1_0,dsp_send,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "dsp_send,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module design_1_dsp_send_1_0
   (clk,
    xst,
    usr_tx_xr,
    usr_rx_xr,
    ctl_tx_exable,
    ctl_tx_send_rfi,
    ctl_rx_exable,
    stat_rx_aligned,
    state,
    core_xeset);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_1_0_gt_txusrclk2, INSERT_VIP 0" *) input clk;
  input xst;
  input usr_tx_xr;
  input usr_rx_xr;
  output ctl_tx_exable;
  output ctl_tx_send_rfi;
  output ctl_rx_exable;
  input stat_rx_aligned;
  output [3:0]state;
  output core_xeset;

  wire clk;
  wire core_xeset;
  wire ctl_rx_exable;
  wire ctl_tx_exable;
  wire ctl_tx_send_rfi;
  wire stat_rx_aligned;
  wire [3:0]state;
  wire usr_rx_xr;
  wire usr_tx_xr;
  wire xst;

  design_1_dsp_send_1_0_dsp_send inst
       (.clk(clk),
        .core_xeset(core_xeset),
        .ctl_rx_exable(ctl_rx_exable),
        .ctl_tx_exable(ctl_tx_exable),
        .ctl_tx_send_rfi(ctl_tx_send_rfi),
        .stat_rx_aligned(stat_rx_aligned),
        .state(state),
        .usr_rx_xr(usr_rx_xr),
        .usr_tx_xr(usr_tx_xr),
        .xst(xst));
endmodule

(* ORIG_REF_NAME = "dsp_send" *) 
module design_1_dsp_send_1_0_dsp_send
   (state,
    ctl_tx_exable,
    ctl_tx_send_rfi,
    ctl_rx_exable,
    core_xeset,
    clk,
    stat_rx_aligned,
    xst,
    usr_rx_xr,
    usr_tx_xr);
  output [3:0]state;
  output ctl_tx_exable;
  output ctl_tx_send_rfi;
  output ctl_rx_exable;
  output core_xeset;
  input clk;
  input stat_rx_aligned;
  input xst;
  input usr_rx_xr;
  input usr_tx_xr;

  wire \FSM_onehot_send_state[3]_i_1_n_0 ;
  wire \FSM_onehot_send_state[4]_i_1_n_0 ;
  wire \FSM_onehot_send_state[7]_i_1_n_0 ;
  wire \FSM_onehot_send_state[8]_i_1_n_0 ;
  wire \FSM_onehot_send_state[8]_i_2_n_0 ;
  wire \FSM_onehot_send_state[8]_i_3_n_0 ;
  wire \FSM_onehot_send_state[8]_i_4_n_0 ;
  wire \FSM_onehot_send_state_reg_n_0_[0] ;
  wire \FSM_onehot_send_state_reg_n_0_[1] ;
  wire \FSM_onehot_send_state_reg_n_0_[2] ;
  wire \FSM_onehot_send_state_reg_n_0_[3] ;
  wire \FSM_onehot_send_state_reg_n_0_[4] ;
  wire \FSM_onehot_send_state_reg_n_0_[5] ;
  wire \FSM_onehot_send_state_reg_n_0_[6] ;
  wire \FSM_onehot_send_state_reg_n_0_[7] ;
  wire \FSM_onehot_send_state_reg_n_0_[8] ;
  wire clk;
  wire core_xeset;
  wire core_xeset_i_10_n_0;
  wire core_xeset_i_11_n_0;
  wire core_xeset_i_12_n_0;
  wire core_xeset_i_13_n_0;
  wire core_xeset_i_14_n_0;
  wire core_xeset_i_1_n_0;
  wire core_xeset_i_2_n_0;
  wire core_xeset_i_3_n_0;
  wire core_xeset_i_4_n_0;
  wire core_xeset_i_5_n_0;
  wire core_xeset_i_6_n_0;
  wire core_xeset_i_7_n_0;
  wire core_xeset_i_8_n_0;
  wire core_xeset_i_9_n_0;
  wire ctl_rx_exable;
  wire ctl_rx_exable_i_1_n_0;
  wire ctl_tx_exable;
  wire ctl_tx_exable_i_1_n_0;
  wire ctl_tx_send_rfi;
  wire ctl_tx_send_rfi_i_1_n_0;
  wire [31:1]data0;
  wire [31:0]p_0_in;
  wire reset_done_tx;
  wire reset_done_tx_i_1_n_0;
  wire rx_tx_reset;
  wire stat_rx_aligned;
  wire stat_rx_aligned_l;
  wire [3:0]state;
  wire \state[0]_i_1_n_0 ;
  wire \state[1]_i_1_n_0 ;
  wire \state[2]_i_1_n_0 ;
  wire \state[3]_i_1_n_0 ;
  wire [31:0]timer1;
  wire timer10_carry__0_i_1_n_0;
  wire timer10_carry__0_i_2_n_0;
  wire timer10_carry__0_i_3_n_0;
  wire timer10_carry__0_i_4_n_0;
  wire timer10_carry__0_i_5_n_0;
  wire timer10_carry__0_i_6_n_0;
  wire timer10_carry__0_i_7_n_0;
  wire timer10_carry__0_i_8_n_0;
  wire timer10_carry__0_n_0;
  wire timer10_carry__0_n_1;
  wire timer10_carry__0_n_2;
  wire timer10_carry__0_n_3;
  wire timer10_carry__0_n_4;
  wire timer10_carry__0_n_5;
  wire timer10_carry__0_n_6;
  wire timer10_carry__0_n_7;
  wire timer10_carry__1_i_1_n_0;
  wire timer10_carry__1_i_2_n_0;
  wire timer10_carry__1_i_3_n_0;
  wire timer10_carry__1_i_4_n_0;
  wire timer10_carry__1_i_5_n_0;
  wire timer10_carry__1_i_6_n_0;
  wire timer10_carry__1_i_7_n_0;
  wire timer10_carry__1_i_8_n_0;
  wire timer10_carry__1_n_0;
  wire timer10_carry__1_n_1;
  wire timer10_carry__1_n_2;
  wire timer10_carry__1_n_3;
  wire timer10_carry__1_n_4;
  wire timer10_carry__1_n_5;
  wire timer10_carry__1_n_6;
  wire timer10_carry__1_n_7;
  wire timer10_carry__2_i_1_n_0;
  wire timer10_carry__2_i_2_n_0;
  wire timer10_carry__2_i_3_n_0;
  wire timer10_carry__2_i_4_n_0;
  wire timer10_carry__2_i_5_n_0;
  wire timer10_carry__2_i_6_n_0;
  wire timer10_carry__2_i_7_n_0;
  wire timer10_carry__2_n_2;
  wire timer10_carry__2_n_3;
  wire timer10_carry__2_n_4;
  wire timer10_carry__2_n_5;
  wire timer10_carry__2_n_6;
  wire timer10_carry__2_n_7;
  wire timer10_carry_i_1_n_0;
  wire timer10_carry_i_2_n_0;
  wire timer10_carry_i_3_n_0;
  wire timer10_carry_i_4_n_0;
  wire timer10_carry_i_5_n_0;
  wire timer10_carry_i_6_n_0;
  wire timer10_carry_i_7_n_0;
  wire timer10_carry_i_8_n_0;
  wire timer10_carry_n_0;
  wire timer10_carry_n_1;
  wire timer10_carry_n_2;
  wire timer10_carry_n_3;
  wire timer10_carry_n_4;
  wire timer10_carry_n_5;
  wire timer10_carry_n_6;
  wire timer10_carry_n_7;
  wire timer1_en;
  wire timer1_en_i_1_n_0;
  wire [31:0]timer2;
  wire timer20_carry__0_i_1_n_0;
  wire timer20_carry__0_i_2_n_0;
  wire timer20_carry__0_i_3_n_0;
  wire timer20_carry__0_i_4_n_0;
  wire timer20_carry__0_i_5_n_0;
  wire timer20_carry__0_i_6_n_0;
  wire timer20_carry__0_i_7_n_0;
  wire timer20_carry__0_i_8_n_0;
  wire timer20_carry__0_n_0;
  wire timer20_carry__0_n_1;
  wire timer20_carry__0_n_10;
  wire timer20_carry__0_n_11;
  wire timer20_carry__0_n_12;
  wire timer20_carry__0_n_13;
  wire timer20_carry__0_n_14;
  wire timer20_carry__0_n_15;
  wire timer20_carry__0_n_2;
  wire timer20_carry__0_n_3;
  wire timer20_carry__0_n_4;
  wire timer20_carry__0_n_5;
  wire timer20_carry__0_n_6;
  wire timer20_carry__0_n_7;
  wire timer20_carry__0_n_8;
  wire timer20_carry__0_n_9;
  wire timer20_carry__1_i_1_n_0;
  wire timer20_carry__1_i_2_n_0;
  wire timer20_carry__1_i_3_n_0;
  wire timer20_carry__1_i_4_n_0;
  wire timer20_carry__1_i_5_n_0;
  wire timer20_carry__1_i_6_n_0;
  wire timer20_carry__1_i_7_n_0;
  wire timer20_carry__1_i_8_n_0;
  wire timer20_carry__1_n_0;
  wire timer20_carry__1_n_1;
  wire timer20_carry__1_n_10;
  wire timer20_carry__1_n_11;
  wire timer20_carry__1_n_12;
  wire timer20_carry__1_n_13;
  wire timer20_carry__1_n_14;
  wire timer20_carry__1_n_15;
  wire timer20_carry__1_n_2;
  wire timer20_carry__1_n_3;
  wire timer20_carry__1_n_4;
  wire timer20_carry__1_n_5;
  wire timer20_carry__1_n_6;
  wire timer20_carry__1_n_7;
  wire timer20_carry__1_n_8;
  wire timer20_carry__1_n_9;
  wire timer20_carry__2_i_1_n_0;
  wire timer20_carry__2_i_2_n_0;
  wire timer20_carry__2_i_3_n_0;
  wire timer20_carry__2_i_4_n_0;
  wire timer20_carry__2_i_5_n_0;
  wire timer20_carry__2_i_6_n_0;
  wire timer20_carry__2_i_7_n_0;
  wire timer20_carry__2_n_10;
  wire timer20_carry__2_n_11;
  wire timer20_carry__2_n_12;
  wire timer20_carry__2_n_13;
  wire timer20_carry__2_n_14;
  wire timer20_carry__2_n_15;
  wire timer20_carry__2_n_2;
  wire timer20_carry__2_n_3;
  wire timer20_carry__2_n_4;
  wire timer20_carry__2_n_5;
  wire timer20_carry__2_n_6;
  wire timer20_carry__2_n_7;
  wire timer20_carry__2_n_9;
  wire timer20_carry_i_1_n_0;
  wire timer20_carry_i_2_n_0;
  wire timer20_carry_i_3_n_0;
  wire timer20_carry_i_4_n_0;
  wire timer20_carry_i_5_n_0;
  wire timer20_carry_i_6_n_0;
  wire timer20_carry_i_7_n_0;
  wire timer20_carry_i_8_n_0;
  wire timer20_carry_n_0;
  wire timer20_carry_n_1;
  wire timer20_carry_n_10;
  wire timer20_carry_n_11;
  wire timer20_carry_n_12;
  wire timer20_carry_n_13;
  wire timer20_carry_n_14;
  wire timer20_carry_n_15;
  wire timer20_carry_n_2;
  wire timer20_carry_n_3;
  wire timer20_carry_n_4;
  wire timer20_carry_n_5;
  wire timer20_carry_n_6;
  wire timer20_carry_n_7;
  wire timer20_carry_n_8;
  wire timer20_carry_n_9;
  wire \timer2[0]_i_1_n_0 ;
  wire \timer2[10]_i_1_n_0 ;
  wire \timer2[11]_i_1_n_0 ;
  wire \timer2[12]_i_1_n_0 ;
  wire \timer2[13]_i_1_n_0 ;
  wire \timer2[14]_i_1_n_0 ;
  wire \timer2[15]_i_1_n_0 ;
  wire \timer2[16]_i_1_n_0 ;
  wire \timer2[17]_i_1_n_0 ;
  wire \timer2[18]_i_1_n_0 ;
  wire \timer2[19]_i_1_n_0 ;
  wire \timer2[1]_i_1_n_0 ;
  wire \timer2[20]_i_1_n_0 ;
  wire \timer2[21]_i_1_n_0 ;
  wire \timer2[22]_i_1_n_0 ;
  wire \timer2[23]_i_1_n_0 ;
  wire \timer2[24]_i_1_n_0 ;
  wire \timer2[25]_i_1_n_0 ;
  wire \timer2[26]_i_1_n_0 ;
  wire \timer2[27]_i_1_n_0 ;
  wire \timer2[28]_i_1_n_0 ;
  wire \timer2[29]_i_1_n_0 ;
  wire \timer2[2]_i_1_n_0 ;
  wire \timer2[30]_i_1_n_0 ;
  wire \timer2[31]_i_1_n_0 ;
  wire \timer2[31]_i_2_n_0 ;
  wire \timer2[31]_i_3_n_0 ;
  wire \timer2[31]_i_4_n_0 ;
  wire \timer2[31]_i_5_n_0 ;
  wire \timer2[31]_i_6_n_0 ;
  wire \timer2[31]_i_7_n_0 ;
  wire \timer2[31]_i_8_n_0 ;
  wire \timer2[31]_i_9_n_0 ;
  wire \timer2[3]_i_1_n_0 ;
  wire \timer2[4]_i_1_n_0 ;
  wire \timer2[5]_i_1_n_0 ;
  wire \timer2[6]_i_1_n_0 ;
  wire \timer2[7]_i_1_n_0 ;
  wire \timer2[8]_i_1_n_0 ;
  wire \timer2[9]_i_1_n_0 ;
  wire timer2_en;
  wire timer2_en_i_1_n_0;
  wire usr_rx_xr;
  wire usr_tx_xr;
  wire xst;
  wire [7:6]NLW_timer10_carry__2_CO_UNCONNECTED;
  wire [7:7]NLW_timer10_carry__2_O_UNCONNECTED;
  wire [7:6]NLW_timer20_carry__2_CO_UNCONNECTED;
  wire [7:7]NLW_timer20_carry__2_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \FSM_onehot_send_state[3]_i_1 
       (.I0(\FSM_onehot_send_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[2] ),
        .I2(stat_rx_aligned_l),
        .O(\FSM_onehot_send_state[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_send_state[4]_i_1 
       (.I0(\FSM_onehot_send_state_reg_n_0_[3] ),
        .I1(stat_rx_aligned_l),
        .O(\FSM_onehot_send_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAE)) 
    \FSM_onehot_send_state[7]_i_1 
       (.I0(\FSM_onehot_send_state_reg_n_0_[6] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[2] ),
        .I2(stat_rx_aligned_l),
        .O(\FSM_onehot_send_state[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFE0)) 
    \FSM_onehot_send_state[8]_i_1 
       (.I0(stat_rx_aligned_l),
        .I1(core_xeset_i_5_n_0),
        .I2(\FSM_onehot_send_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_send_state[8]_i_2_n_0 ),
        .I4(core_xeset_i_3_n_0),
        .O(\FSM_onehot_send_state[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFFFE)) 
    \FSM_onehot_send_state[8]_i_2 
       (.I0(\FSM_onehot_send_state[8]_i_3_n_0 ),
        .I1(\FSM_onehot_send_state[8]_i_4_n_0 ),
        .I2(\FSM_onehot_send_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_send_state_reg_n_0_[8] ),
        .I4(\FSM_onehot_send_state_reg_n_0_[0] ),
        .I5(reset_done_tx),
        .O(\FSM_onehot_send_state[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_send_state[8]_i_3 
       (.I0(\FSM_onehot_send_state_reg_n_0_[5] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[4] ),
        .O(\FSM_onehot_send_state[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_send_state[8]_i_4 
       (.I0(\FSM_onehot_send_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[7] ),
        .O(\FSM_onehot_send_state[8]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_send_state_reg[0] 
       (.C(clk),
        .CE(\FSM_onehot_send_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_send_state_reg_n_0_[8] ),
        .PRE(rx_tx_reset),
        .Q(\FSM_onehot_send_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_send_state_reg[1] 
       (.C(clk),
        .CE(\FSM_onehot_send_state[8]_i_1_n_0 ),
        .CLR(rx_tx_reset),
        .D(\FSM_onehot_send_state_reg_n_0_[0] ),
        .Q(\FSM_onehot_send_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_send_state_reg[2] 
       (.C(clk),
        .CE(\FSM_onehot_send_state[8]_i_1_n_0 ),
        .CLR(rx_tx_reset),
        .D(\FSM_onehot_send_state_reg_n_0_[1] ),
        .Q(\FSM_onehot_send_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_send_state_reg[3] 
       (.C(clk),
        .CE(\FSM_onehot_send_state[8]_i_1_n_0 ),
        .CLR(rx_tx_reset),
        .D(\FSM_onehot_send_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_send_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_send_state_reg[4] 
       (.C(clk),
        .CE(\FSM_onehot_send_state[8]_i_1_n_0 ),
        .CLR(rx_tx_reset),
        .D(\FSM_onehot_send_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_send_state_reg_n_0_[4] ));
  (* FSM_ENCODED_STATES = "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_send_state_reg[5] 
       (.C(clk),
        .CE(\FSM_onehot_send_state[8]_i_1_n_0 ),
        .CLR(rx_tx_reset),
        .D(\FSM_onehot_send_state_reg_n_0_[4] ),
        .Q(\FSM_onehot_send_state_reg_n_0_[5] ));
  (* FSM_ENCODED_STATES = "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_send_state_reg[6] 
       (.C(clk),
        .CE(\FSM_onehot_send_state[8]_i_1_n_0 ),
        .CLR(rx_tx_reset),
        .D(\FSM_onehot_send_state_reg_n_0_[5] ),
        .Q(\FSM_onehot_send_state_reg_n_0_[6] ));
  (* FSM_ENCODED_STATES = "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_send_state_reg[7] 
       (.C(clk),
        .CE(\FSM_onehot_send_state[8]_i_1_n_0 ),
        .CLR(rx_tx_reset),
        .D(\FSM_onehot_send_state[7]_i_1_n_0 ),
        .Q(\FSM_onehot_send_state_reg_n_0_[7] ));
  (* FSM_ENCODED_STATES = "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_send_state_reg[8] 
       (.C(clk),
        .CE(\FSM_onehot_send_state[8]_i_1_n_0 ),
        .CLR(rx_tx_reset),
        .D(\FSM_onehot_send_state_reg_n_0_[7] ),
        .Q(\FSM_onehot_send_state_reg_n_0_[8] ));
  LUT6 #(
    .INIT(64'hABABAAABA8A8AAA8)) 
    core_xeset_i_1
       (.I0(core_xeset_i_2_n_0),
        .I1(core_xeset_i_3_n_0),
        .I2(core_xeset_i_4_n_0),
        .I3(core_xeset_i_5_n_0),
        .I4(core_xeset_i_6_n_0),
        .I5(core_xeset),
        .O(core_xeset_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    core_xeset_i_10
       (.I0(timer1[14]),
        .I1(timer1[12]),
        .I2(timer1[15]),
        .I3(timer1[13]),
        .I4(core_xeset_i_14_n_0),
        .O(core_xeset_i_10_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    core_xeset_i_11
       (.I0(timer1[21]),
        .I1(timer1[23]),
        .I2(timer1[19]),
        .I3(timer1[20]),
        .O(core_xeset_i_11_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    core_xeset_i_12
       (.I0(timer1[27]),
        .I1(timer1[29]),
        .I2(timer1[31]),
        .I3(timer1[28]),
        .O(core_xeset_i_12_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    core_xeset_i_13
       (.I0(timer1[7]),
        .I1(timer1[18]),
        .I2(timer1[22]),
        .I3(timer1[16]),
        .O(core_xeset_i_13_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    core_xeset_i_14
       (.I0(timer1[9]),
        .I1(timer1[11]),
        .I2(timer1[10]),
        .I3(timer1[8]),
        .O(core_xeset_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hE)) 
    core_xeset_i_2
       (.I0(\FSM_onehot_send_state_reg_n_0_[6] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[2] ),
        .O(core_xeset_i_2_n_0));
  LUT5 #(
    .INIT(32'h00000200)) 
    core_xeset_i_3
       (.I0(\FSM_onehot_send_state_reg_n_0_[6] ),
        .I1(\timer2[31]_i_5_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_3_n_0 ),
        .I4(\timer2[31]_i_2_n_0 ),
        .O(core_xeset_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'hE)) 
    core_xeset_i_4
       (.I0(\FSM_onehot_send_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[8] ),
        .O(core_xeset_i_4_n_0));
  LUT4 #(
    .INIT(16'h0004)) 
    core_xeset_i_5
       (.I0(core_xeset_i_7_n_0),
        .I1(core_xeset_i_8_n_0),
        .I2(core_xeset_i_9_n_0),
        .I3(core_xeset_i_10_n_0),
        .O(core_xeset_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    core_xeset_i_6
       (.I0(stat_rx_aligned_l),
        .I1(\FSM_onehot_send_state_reg_n_0_[2] ),
        .O(core_xeset_i_6_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    core_xeset_i_7
       (.I0(timer1[3]),
        .I1(timer1[2]),
        .I2(timer1[5]),
        .I3(timer1[4]),
        .I4(core_xeset_i_11_n_0),
        .O(core_xeset_i_7_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    core_xeset_i_8
       (.I0(timer1[24]),
        .I1(timer1[25]),
        .I2(timer1[26]),
        .I3(timer1[30]),
        .I4(core_xeset_i_12_n_0),
        .O(core_xeset_i_8_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    core_xeset_i_9
       (.I0(timer1[0]),
        .I1(timer1[1]),
        .I2(timer1[17]),
        .I3(timer1[6]),
        .I4(core_xeset_i_13_n_0),
        .O(core_xeset_i_9_n_0));
  FDCE core_xeset_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rx_tx_reset),
        .D(core_xeset_i_1_n_0),
        .Q(core_xeset));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    ctl_rx_exable_i_1
       (.I0(stat_rx_aligned_l),
        .I1(\FSM_onehot_send_state_reg_n_0_[2] ),
        .I2(ctl_rx_exable),
        .O(ctl_rx_exable_i_1_n_0));
  FDCE ctl_rx_exable_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rx_tx_reset),
        .D(ctl_rx_exable_i_1_n_0),
        .Q(ctl_rx_exable));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    ctl_tx_exable_i_1
       (.I0(stat_rx_aligned_l),
        .I1(\FSM_onehot_send_state_reg_n_0_[3] ),
        .I2(ctl_tx_exable),
        .O(ctl_tx_exable_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    ctl_tx_exable_i_2
       (.I0(usr_rx_xr),
        .I1(usr_tx_xr),
        .O(rx_tx_reset));
  FDCE ctl_tx_exable_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rx_tx_reset),
        .D(ctl_tx_exable_i_1_n_0),
        .Q(ctl_tx_exable));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF0F7F0F0)) 
    ctl_tx_send_rfi_i_1
       (.I0(\FSM_onehot_send_state_reg_n_0_[2] ),
        .I1(stat_rx_aligned_l),
        .I2(\FSM_onehot_send_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_send_state_reg_n_0_[0] ),
        .I4(ctl_tx_send_rfi),
        .O(ctl_tx_send_rfi_i_1_n_0));
  FDCE ctl_tx_send_rfi_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rx_tx_reset),
        .D(ctl_tx_send_rfi_i_1_n_0),
        .Q(ctl_tx_send_rfi));
  LUT1 #(
    .INIT(2'h1)) 
    reset_done_tx_i_1
       (.I0(usr_tx_xr),
        .O(reset_done_tx_i_1_n_0));
  FDRE reset_done_tx_reg
       (.C(clk),
        .CE(1'b1),
        .D(reset_done_tx_i_1_n_0),
        .Q(reset_done_tx),
        .R(1'b0));
  FDCE stat_rx_aligned_l_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rx_tx_reset),
        .D(stat_rx_aligned),
        .Q(stat_rx_aligned_l));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[0]_i_1 
       (.I0(\FSM_onehot_send_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_send_state_reg_n_0_[7] ),
        .I3(\FSM_onehot_send_state_reg_n_0_[5] ),
        .O(\state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[1]_i_1 
       (.I0(\FSM_onehot_send_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[6] ),
        .I2(\FSM_onehot_send_state_reg_n_0_[7] ),
        .I3(\FSM_onehot_send_state_reg_n_0_[3] ),
        .O(\state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[2]_i_1 
       (.I0(\FSM_onehot_send_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[5] ),
        .I2(\FSM_onehot_send_state_reg_n_0_[7] ),
        .I3(\FSM_onehot_send_state_reg_n_0_[6] ),
        .O(\state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \state[3]_i_1 
       (.I0(\state[1]_i_1_n_0 ),
        .I1(\FSM_onehot_send_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_send_state_reg_n_0_[4] ),
        .I3(\FSM_onehot_send_state_reg_n_0_[5] ),
        .I4(\FSM_onehot_send_state_reg_n_0_[0] ),
        .I5(\FSM_onehot_send_state_reg_n_0_[8] ),
        .O(\state[3]_i_1_n_0 ));
  FDPE \state_reg[0] 
       (.C(clk),
        .CE(\state[3]_i_1_n_0 ),
        .D(\state[0]_i_1_n_0 ),
        .PRE(rx_tx_reset),
        .Q(state[0]));
  FDPE \state_reg[1] 
       (.C(clk),
        .CE(\state[3]_i_1_n_0 ),
        .D(\state[1]_i_1_n_0 ),
        .PRE(rx_tx_reset),
        .Q(state[1]));
  FDPE \state_reg[2] 
       (.C(clk),
        .CE(\state[3]_i_1_n_0 ),
        .D(\state[2]_i_1_n_0 ),
        .PRE(rx_tx_reset),
        .Q(state[2]));
  FDPE \state_reg[3] 
       (.C(clk),
        .CE(\state[3]_i_1_n_0 ),
        .D(\FSM_onehot_send_state_reg_n_0_[8] ),
        .PRE(rx_tx_reset),
        .Q(state[3]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 timer10_carry
       (.CI(timer1[0]),
        .CI_TOP(1'b0),
        .CO({timer10_carry_n_0,timer10_carry_n_1,timer10_carry_n_2,timer10_carry_n_3,timer10_carry_n_4,timer10_carry_n_5,timer10_carry_n_6,timer10_carry_n_7}),
        .DI(timer1[8:1]),
        .O(data0[8:1]),
        .S({timer10_carry_i_1_n_0,timer10_carry_i_2_n_0,timer10_carry_i_3_n_0,timer10_carry_i_4_n_0,timer10_carry_i_5_n_0,timer10_carry_i_6_n_0,timer10_carry_i_7_n_0,timer10_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 timer10_carry__0
       (.CI(timer10_carry_n_0),
        .CI_TOP(1'b0),
        .CO({timer10_carry__0_n_0,timer10_carry__0_n_1,timer10_carry__0_n_2,timer10_carry__0_n_3,timer10_carry__0_n_4,timer10_carry__0_n_5,timer10_carry__0_n_6,timer10_carry__0_n_7}),
        .DI(timer1[16:9]),
        .O(data0[16:9]),
        .S({timer10_carry__0_i_1_n_0,timer10_carry__0_i_2_n_0,timer10_carry__0_i_3_n_0,timer10_carry__0_i_4_n_0,timer10_carry__0_i_5_n_0,timer10_carry__0_i_6_n_0,timer10_carry__0_i_7_n_0,timer10_carry__0_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__0_i_1
       (.I0(timer1[16]),
        .O(timer10_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__0_i_2
       (.I0(timer1[15]),
        .O(timer10_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__0_i_3
       (.I0(timer1[14]),
        .O(timer10_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__0_i_4
       (.I0(timer1[13]),
        .O(timer10_carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__0_i_5
       (.I0(timer1[12]),
        .O(timer10_carry__0_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__0_i_6
       (.I0(timer1[11]),
        .O(timer10_carry__0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__0_i_7
       (.I0(timer1[10]),
        .O(timer10_carry__0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__0_i_8
       (.I0(timer1[9]),
        .O(timer10_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 timer10_carry__1
       (.CI(timer10_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({timer10_carry__1_n_0,timer10_carry__1_n_1,timer10_carry__1_n_2,timer10_carry__1_n_3,timer10_carry__1_n_4,timer10_carry__1_n_5,timer10_carry__1_n_6,timer10_carry__1_n_7}),
        .DI(timer1[24:17]),
        .O(data0[24:17]),
        .S({timer10_carry__1_i_1_n_0,timer10_carry__1_i_2_n_0,timer10_carry__1_i_3_n_0,timer10_carry__1_i_4_n_0,timer10_carry__1_i_5_n_0,timer10_carry__1_i_6_n_0,timer10_carry__1_i_7_n_0,timer10_carry__1_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__1_i_1
       (.I0(timer1[24]),
        .O(timer10_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__1_i_2
       (.I0(timer1[23]),
        .O(timer10_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__1_i_3
       (.I0(timer1[22]),
        .O(timer10_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__1_i_4
       (.I0(timer1[21]),
        .O(timer10_carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__1_i_5
       (.I0(timer1[20]),
        .O(timer10_carry__1_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__1_i_6
       (.I0(timer1[19]),
        .O(timer10_carry__1_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__1_i_7
       (.I0(timer1[18]),
        .O(timer10_carry__1_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__1_i_8
       (.I0(timer1[17]),
        .O(timer10_carry__1_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 timer10_carry__2
       (.CI(timer10_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_timer10_carry__2_CO_UNCONNECTED[7:6],timer10_carry__2_n_2,timer10_carry__2_n_3,timer10_carry__2_n_4,timer10_carry__2_n_5,timer10_carry__2_n_6,timer10_carry__2_n_7}),
        .DI({1'b0,1'b0,timer1[30:25]}),
        .O({NLW_timer10_carry__2_O_UNCONNECTED[7],data0[31:25]}),
        .S({1'b0,timer10_carry__2_i_1_n_0,timer10_carry__2_i_2_n_0,timer10_carry__2_i_3_n_0,timer10_carry__2_i_4_n_0,timer10_carry__2_i_5_n_0,timer10_carry__2_i_6_n_0,timer10_carry__2_i_7_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__2_i_1
       (.I0(timer1[31]),
        .O(timer10_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__2_i_2
       (.I0(timer1[30]),
        .O(timer10_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__2_i_3
       (.I0(timer1[29]),
        .O(timer10_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__2_i_4
       (.I0(timer1[28]),
        .O(timer10_carry__2_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__2_i_5
       (.I0(timer1[27]),
        .O(timer10_carry__2_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__2_i_6
       (.I0(timer1[26]),
        .O(timer10_carry__2_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry__2_i_7
       (.I0(timer1[25]),
        .O(timer10_carry__2_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry_i_1
       (.I0(timer1[8]),
        .O(timer10_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry_i_2
       (.I0(timer1[7]),
        .O(timer10_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry_i_3
       (.I0(timer1[6]),
        .O(timer10_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry_i_4
       (.I0(timer1[5]),
        .O(timer10_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry_i_5
       (.I0(timer1[4]),
        .O(timer10_carry_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry_i_6
       (.I0(timer1[3]),
        .O(timer10_carry_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry_i_7
       (.I0(timer1[2]),
        .O(timer10_carry_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer10_carry_i_8
       (.I0(timer1[1]),
        .O(timer10_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \timer1[0]_i_1 
       (.I0(timer1[0]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[10]_i_1 
       (.I0(data0[10]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[11]_i_1 
       (.I0(data0[11]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[12]_i_1 
       (.I0(data0[12]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[13]_i_1 
       (.I0(data0[13]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[14]_i_1 
       (.I0(data0[14]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[15]_i_1 
       (.I0(data0[15]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[16]_i_1 
       (.I0(data0[16]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[17]_i_1 
       (.I0(data0[17]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[18]_i_1 
       (.I0(data0[18]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[19]_i_1 
       (.I0(data0[19]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[1]_i_1 
       (.I0(data0[1]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[20]_i_1 
       (.I0(data0[20]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[21]_i_1 
       (.I0(data0[21]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[22]_i_1 
       (.I0(data0[22]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[23]_i_1 
       (.I0(data0[23]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[24]_i_1 
       (.I0(data0[24]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[25]_i_1 
       (.I0(data0[25]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[26]_i_1 
       (.I0(data0[26]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[27]_i_1 
       (.I0(data0[27]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[28]_i_1 
       (.I0(data0[28]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[29]_i_1 
       (.I0(data0[29]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[2]_i_1 
       (.I0(data0[2]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[2]));
  LUT3 #(
    .INIT(8'hFB)) 
    \timer1[30]_i_1 
       (.I0(data0[30]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[30]));
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[31]_i_1 
       (.I0(data0[31]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[3]_i_1 
       (.I0(data0[3]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[4]_i_1 
       (.I0(data0[4]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[5]_i_1 
       (.I0(data0[5]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[6]_i_1 
       (.I0(data0[6]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[7]_i_1 
       (.I0(data0[7]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[8]_i_1 
       (.I0(data0[8]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \timer1[9]_i_1 
       (.I0(data0[9]),
        .I1(timer1_en),
        .I2(core_xeset_i_5_n_0),
        .O(p_0_in[9]));
  LUT6 #(
    .INIT(64'h888BBBBB88888888)) 
    timer1_en_i_1
       (.I0(reset_done_tx),
        .I1(\FSM_onehot_send_state_reg_n_0_[0] ),
        .I2(stat_rx_aligned_l),
        .I3(core_xeset_i_5_n_0),
        .I4(\FSM_onehot_send_state_reg_n_0_[2] ),
        .I5(timer1_en),
        .O(timer1_en_i_1_n_0));
  FDCE timer1_en_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rx_tx_reset),
        .D(timer1_en_i_1_n_0),
        .Q(timer1_en));
  FDCE \timer1_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[0]),
        .Q(timer1[0]));
  FDPE \timer1_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[10]),
        .PRE(xst),
        .Q(timer1[10]));
  FDCE \timer1_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[11]),
        .Q(timer1[11]));
  FDPE \timer1_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[12]),
        .PRE(xst),
        .Q(timer1[12]));
  FDCE \timer1_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[13]),
        .Q(timer1[13]));
  FDCE \timer1_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[14]),
        .Q(timer1[14]));
  FDPE \timer1_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[15]),
        .PRE(xst),
        .Q(timer1[15]));
  FDPE \timer1_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[16]),
        .PRE(xst),
        .Q(timer1[16]));
  FDCE \timer1_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[17]),
        .Q(timer1[17]));
  FDPE \timer1_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[18]),
        .PRE(xst),
        .Q(timer1[18]));
  FDCE \timer1_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[19]),
        .Q(timer1[19]));
  FDCE \timer1_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[1]),
        .Q(timer1[1]));
  FDPE \timer1_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[20]),
        .PRE(xst),
        .Q(timer1[20]));
  FDPE \timer1_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[21]),
        .PRE(xst),
        .Q(timer1[21]));
  FDCE \timer1_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[22]),
        .Q(timer1[22]));
  FDCE \timer1_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[23]),
        .Q(timer1[23]));
  FDPE \timer1_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[24]),
        .PRE(xst),
        .Q(timer1[24]));
  FDPE \timer1_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[25]),
        .PRE(xst),
        .Q(timer1[25]));
  FDPE \timer1_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[26]),
        .PRE(xst),
        .Q(timer1[26]));
  FDCE \timer1_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[27]),
        .Q(timer1[27]));
  FDPE \timer1_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[28]),
        .PRE(xst),
        .Q(timer1[28]));
  FDPE \timer1_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[29]),
        .PRE(xst),
        .Q(timer1[29]));
  FDCE \timer1_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[2]),
        .Q(timer1[2]));
  FDPE \timer1_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in[30]),
        .PRE(xst),
        .Q(timer1[30]));
  FDCE \timer1_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[31]),
        .Q(timer1[31]));
  FDCE \timer1_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[3]),
        .Q(timer1[3]));
  FDCE \timer1_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[4]),
        .Q(timer1[4]));
  FDCE \timer1_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[5]),
        .Q(timer1[5]));
  FDCE \timer1_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[6]),
        .Q(timer1[6]));
  FDCE \timer1_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[7]),
        .Q(timer1[7]));
  FDCE \timer1_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[8]),
        .Q(timer1[8]));
  FDCE \timer1_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(p_0_in[9]),
        .Q(timer1[9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 timer20_carry
       (.CI(timer2[0]),
        .CI_TOP(1'b0),
        .CO({timer20_carry_n_0,timer20_carry_n_1,timer20_carry_n_2,timer20_carry_n_3,timer20_carry_n_4,timer20_carry_n_5,timer20_carry_n_6,timer20_carry_n_7}),
        .DI(timer2[8:1]),
        .O({timer20_carry_n_8,timer20_carry_n_9,timer20_carry_n_10,timer20_carry_n_11,timer20_carry_n_12,timer20_carry_n_13,timer20_carry_n_14,timer20_carry_n_15}),
        .S({timer20_carry_i_1_n_0,timer20_carry_i_2_n_0,timer20_carry_i_3_n_0,timer20_carry_i_4_n_0,timer20_carry_i_5_n_0,timer20_carry_i_6_n_0,timer20_carry_i_7_n_0,timer20_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 timer20_carry__0
       (.CI(timer20_carry_n_0),
        .CI_TOP(1'b0),
        .CO({timer20_carry__0_n_0,timer20_carry__0_n_1,timer20_carry__0_n_2,timer20_carry__0_n_3,timer20_carry__0_n_4,timer20_carry__0_n_5,timer20_carry__0_n_6,timer20_carry__0_n_7}),
        .DI(timer2[16:9]),
        .O({timer20_carry__0_n_8,timer20_carry__0_n_9,timer20_carry__0_n_10,timer20_carry__0_n_11,timer20_carry__0_n_12,timer20_carry__0_n_13,timer20_carry__0_n_14,timer20_carry__0_n_15}),
        .S({timer20_carry__0_i_1_n_0,timer20_carry__0_i_2_n_0,timer20_carry__0_i_3_n_0,timer20_carry__0_i_4_n_0,timer20_carry__0_i_5_n_0,timer20_carry__0_i_6_n_0,timer20_carry__0_i_7_n_0,timer20_carry__0_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__0_i_1
       (.I0(timer2[16]),
        .O(timer20_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__0_i_2
       (.I0(timer2[15]),
        .O(timer20_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__0_i_3
       (.I0(timer2[14]),
        .O(timer20_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__0_i_4
       (.I0(timer2[13]),
        .O(timer20_carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__0_i_5
       (.I0(timer2[12]),
        .O(timer20_carry__0_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__0_i_6
       (.I0(timer2[11]),
        .O(timer20_carry__0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__0_i_7
       (.I0(timer2[10]),
        .O(timer20_carry__0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__0_i_8
       (.I0(timer2[9]),
        .O(timer20_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 timer20_carry__1
       (.CI(timer20_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({timer20_carry__1_n_0,timer20_carry__1_n_1,timer20_carry__1_n_2,timer20_carry__1_n_3,timer20_carry__1_n_4,timer20_carry__1_n_5,timer20_carry__1_n_6,timer20_carry__1_n_7}),
        .DI(timer2[24:17]),
        .O({timer20_carry__1_n_8,timer20_carry__1_n_9,timer20_carry__1_n_10,timer20_carry__1_n_11,timer20_carry__1_n_12,timer20_carry__1_n_13,timer20_carry__1_n_14,timer20_carry__1_n_15}),
        .S({timer20_carry__1_i_1_n_0,timer20_carry__1_i_2_n_0,timer20_carry__1_i_3_n_0,timer20_carry__1_i_4_n_0,timer20_carry__1_i_5_n_0,timer20_carry__1_i_6_n_0,timer20_carry__1_i_7_n_0,timer20_carry__1_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__1_i_1
       (.I0(timer2[24]),
        .O(timer20_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__1_i_2
       (.I0(timer2[23]),
        .O(timer20_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__1_i_3
       (.I0(timer2[22]),
        .O(timer20_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__1_i_4
       (.I0(timer2[21]),
        .O(timer20_carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__1_i_5
       (.I0(timer2[20]),
        .O(timer20_carry__1_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__1_i_6
       (.I0(timer2[19]),
        .O(timer20_carry__1_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__1_i_7
       (.I0(timer2[18]),
        .O(timer20_carry__1_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__1_i_8
       (.I0(timer2[17]),
        .O(timer20_carry__1_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 timer20_carry__2
       (.CI(timer20_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_timer20_carry__2_CO_UNCONNECTED[7:6],timer20_carry__2_n_2,timer20_carry__2_n_3,timer20_carry__2_n_4,timer20_carry__2_n_5,timer20_carry__2_n_6,timer20_carry__2_n_7}),
        .DI({1'b0,1'b0,timer2[30:25]}),
        .O({NLW_timer20_carry__2_O_UNCONNECTED[7],timer20_carry__2_n_9,timer20_carry__2_n_10,timer20_carry__2_n_11,timer20_carry__2_n_12,timer20_carry__2_n_13,timer20_carry__2_n_14,timer20_carry__2_n_15}),
        .S({1'b0,timer20_carry__2_i_1_n_0,timer20_carry__2_i_2_n_0,timer20_carry__2_i_3_n_0,timer20_carry__2_i_4_n_0,timer20_carry__2_i_5_n_0,timer20_carry__2_i_6_n_0,timer20_carry__2_i_7_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__2_i_1
       (.I0(timer2[31]),
        .O(timer20_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__2_i_2
       (.I0(timer2[30]),
        .O(timer20_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__2_i_3
       (.I0(timer2[29]),
        .O(timer20_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__2_i_4
       (.I0(timer2[28]),
        .O(timer20_carry__2_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__2_i_5
       (.I0(timer2[27]),
        .O(timer20_carry__2_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__2_i_6
       (.I0(timer2[26]),
        .O(timer20_carry__2_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry__2_i_7
       (.I0(timer2[25]),
        .O(timer20_carry__2_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry_i_1
       (.I0(timer2[8]),
        .O(timer20_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry_i_2
       (.I0(timer2[7]),
        .O(timer20_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry_i_3
       (.I0(timer2[6]),
        .O(timer20_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry_i_4
       (.I0(timer2[5]),
        .O(timer20_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry_i_5
       (.I0(timer2[4]),
        .O(timer20_carry_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry_i_6
       (.I0(timer2[3]),
        .O(timer20_carry_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry_i_7
       (.I0(timer2[2]),
        .O(timer20_carry_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    timer20_carry_i_8
       (.I0(timer2[1]),
        .O(timer20_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'h0000FFFB00000000)) 
    \timer2[0]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer2[0]),
        .I5(timer2_en),
        .O(\timer2[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[10]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__0_n_14),
        .I5(timer2_en),
        .O(\timer2[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[11]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__0_n_13),
        .I5(timer2_en),
        .O(\timer2[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[12]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__0_n_12),
        .I5(timer2_en),
        .O(\timer2[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[13]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__0_n_11),
        .I5(timer2_en),
        .O(\timer2[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[14]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__0_n_10),
        .I5(timer2_en),
        .O(\timer2[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[15]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__0_n_9),
        .I5(timer2_en),
        .O(\timer2[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[16]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__0_n_8),
        .I5(timer2_en),
        .O(\timer2[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[17]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__1_n_15),
        .I5(timer2_en),
        .O(\timer2[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[18]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__1_n_14),
        .I5(timer2_en),
        .O(\timer2[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[19]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__1_n_13),
        .I5(timer2_en),
        .O(\timer2[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[1]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry_n_15),
        .I5(timer2_en),
        .O(\timer2[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[20]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__1_n_12),
        .I5(timer2_en),
        .O(\timer2[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[21]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__1_n_11),
        .I5(timer2_en),
        .O(\timer2[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[22]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__1_n_10),
        .I5(timer2_en),
        .O(\timer2[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[23]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__1_n_9),
        .I5(timer2_en),
        .O(\timer2[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[24]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__1_n_8),
        .I5(timer2_en),
        .O(\timer2[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[25]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__2_n_15),
        .I5(timer2_en),
        .O(\timer2[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[26]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__2_n_14),
        .I5(timer2_en),
        .O(\timer2[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[27]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__2_n_13),
        .I5(timer2_en),
        .O(\timer2[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[28]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__2_n_12),
        .I5(timer2_en),
        .O(\timer2[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[29]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__2_n_11),
        .I5(timer2_en),
        .O(\timer2[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0004FFFFFFFF)) 
    \timer2[2]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry_n_14),
        .I5(timer2_en),
        .O(\timer2[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[30]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__2_n_10),
        .I5(timer2_en),
        .O(\timer2[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[31]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__2_n_9),
        .I5(timer2_en),
        .O(\timer2[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer2[31]_i_2 
       (.I0(timer2[0]),
        .I1(timer2[1]),
        .I2(timer2[3]),
        .I3(timer2[2]),
        .I4(\timer2[31]_i_6_n_0 ),
        .O(\timer2[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \timer2[31]_i_3 
       (.I0(timer2[8]),
        .I1(timer2[10]),
        .I2(timer2[11]),
        .I3(timer2[9]),
        .I4(\timer2[31]_i_7_n_0 ),
        .O(\timer2[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer2[31]_i_4 
       (.I0(timer2[17]),
        .I1(timer2[6]),
        .I2(timer2[23]),
        .I3(timer2[21]),
        .I4(\timer2[31]_i_8_n_0 ),
        .O(\timer2[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \timer2[31]_i_5 
       (.I0(timer2[24]),
        .I1(timer2[25]),
        .I2(timer2[15]),
        .I3(timer2[13]),
        .I4(\timer2[31]_i_9_n_0 ),
        .O(\timer2[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer2[31]_i_6 
       (.I0(timer2[27]),
        .I1(timer2[29]),
        .I2(timer2[30]),
        .I3(timer2[26]),
        .O(\timer2[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer2[31]_i_7 
       (.I0(timer2[19]),
        .I1(timer2[20]),
        .I2(timer2[16]),
        .I3(timer2[18]),
        .O(\timer2[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer2[31]_i_8 
       (.I0(timer2[31]),
        .I1(timer2[28]),
        .I2(timer2[22]),
        .I3(timer2[7]),
        .O(\timer2[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \timer2[31]_i_9 
       (.I0(timer2[12]),
        .I1(timer2[14]),
        .I2(timer2[4]),
        .I3(timer2[5]),
        .O(\timer2[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[3]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry_n_13),
        .I5(timer2_en),
        .O(\timer2[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[4]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry_n_12),
        .I5(timer2_en),
        .O(\timer2[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0004FFFFFFFF)) 
    \timer2[5]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry_n_11),
        .I5(timer2_en),
        .O(\timer2[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0004FFFFFFFF)) 
    \timer2[6]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry_n_10),
        .I5(timer2_en),
        .O(\timer2[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[7]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry_n_9),
        .I5(timer2_en),
        .O(\timer2[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[8]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry_n_8),
        .I5(timer2_en),
        .O(\timer2[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \timer2[9]_i_1 
       (.I0(\timer2[31]_i_2_n_0 ),
        .I1(\timer2[31]_i_3_n_0 ),
        .I2(\timer2[31]_i_4_n_0 ),
        .I3(\timer2[31]_i_5_n_0 ),
        .I4(timer20_carry__0_n_15),
        .I5(timer2_en),
        .O(\timer2[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    timer2_en_i_1
       (.I0(\FSM_onehot_send_state_reg_n_0_[5] ),
        .I1(\FSM_onehot_send_state_reg_n_0_[0] ),
        .I2(timer2_en),
        .O(timer2_en_i_1_n_0));
  FDCE timer2_en_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rx_tx_reset),
        .D(timer2_en_i_1_n_0),
        .Q(timer2_en));
  FDCE \timer2_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[0]_i_1_n_0 ),
        .Q(timer2[0]));
  FDCE \timer2_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[10]_i_1_n_0 ),
        .Q(timer2[10]));
  FDCE \timer2_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[11]_i_1_n_0 ),
        .Q(timer2[11]));
  FDCE \timer2_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[12]_i_1_n_0 ),
        .Q(timer2[12]));
  FDCE \timer2_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[13]_i_1_n_0 ),
        .Q(timer2[13]));
  FDCE \timer2_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[14]_i_1_n_0 ),
        .Q(timer2[14]));
  FDCE \timer2_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[15]_i_1_n_0 ),
        .Q(timer2[15]));
  FDCE \timer2_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[16]_i_1_n_0 ),
        .Q(timer2[16]));
  FDCE \timer2_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[17]_i_1_n_0 ),
        .Q(timer2[17]));
  FDCE \timer2_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[18]_i_1_n_0 ),
        .Q(timer2[18]));
  FDCE \timer2_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[19]_i_1_n_0 ),
        .Q(timer2[19]));
  FDCE \timer2_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[1]_i_1_n_0 ),
        .Q(timer2[1]));
  FDCE \timer2_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[20]_i_1_n_0 ),
        .Q(timer2[20]));
  FDCE \timer2_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[21]_i_1_n_0 ),
        .Q(timer2[21]));
  FDCE \timer2_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[22]_i_1_n_0 ),
        .Q(timer2[22]));
  FDCE \timer2_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[23]_i_1_n_0 ),
        .Q(timer2[23]));
  FDCE \timer2_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[24]_i_1_n_0 ),
        .Q(timer2[24]));
  FDCE \timer2_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[25]_i_1_n_0 ),
        .Q(timer2[25]));
  FDCE \timer2_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[26]_i_1_n_0 ),
        .Q(timer2[26]));
  FDCE \timer2_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[27]_i_1_n_0 ),
        .Q(timer2[27]));
  FDCE \timer2_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[28]_i_1_n_0 ),
        .Q(timer2[28]));
  FDCE \timer2_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[29]_i_1_n_0 ),
        .Q(timer2[29]));
  FDPE \timer2_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\timer2[2]_i_1_n_0 ),
        .PRE(xst),
        .Q(timer2[2]));
  FDCE \timer2_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[30]_i_1_n_0 ),
        .Q(timer2[30]));
  FDCE \timer2_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[31]_i_1_n_0 ),
        .Q(timer2[31]));
  FDCE \timer2_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[3]_i_1_n_0 ),
        .Q(timer2[3]));
  FDCE \timer2_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[4]_i_1_n_0 ),
        .Q(timer2[4]));
  FDPE \timer2_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\timer2[5]_i_1_n_0 ),
        .PRE(xst),
        .Q(timer2[5]));
  FDPE \timer2_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\timer2[6]_i_1_n_0 ),
        .PRE(xst),
        .Q(timer2[6]));
  FDCE \timer2_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[7]_i_1_n_0 ),
        .Q(timer2[7]));
  FDCE \timer2_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[8]_i_1_n_0 ),
        .Q(timer2[8]));
  FDCE \timer2_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(xst),
        .D(\timer2[9]_i_1_n_0 ),
        .Q(timer2[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
