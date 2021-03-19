-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Fri Mar 19 09:59:26 2021
-- Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_1_ex/rtl_kernel_wizard_1_ex.gen/sources_1/bd/design_1/ip/design_1_dsp_send_1_0/design_1_dsp_send_1_0_sim_netlist.vhdl
-- Design      : design_1_dsp_send_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_dsp_send_1_0_dsp_send is
  port (
    state : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ctl_tx_exable : out STD_LOGIC;
    ctl_tx_send_rfi : out STD_LOGIC;
    ctl_rx_exable : out STD_LOGIC;
    core_xeset : out STD_LOGIC;
    clk : in STD_LOGIC;
    stat_rx_aligned : in STD_LOGIC;
    xst : in STD_LOGIC;
    usr_rx_xr : in STD_LOGIC;
    usr_tx_xr : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_dsp_send_1_0_dsp_send : entity is "dsp_send";
end design_1_dsp_send_1_0_dsp_send;

architecture STRUCTURE of design_1_dsp_send_1_0_dsp_send is
  signal \FSM_onehot_send_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[7]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[8]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[8]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[8]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[8]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[6]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[7]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[8]\ : STD_LOGIC;
  signal \^core_xeset\ : STD_LOGIC;
  signal core_xeset_i_10_n_0 : STD_LOGIC;
  signal core_xeset_i_11_n_0 : STD_LOGIC;
  signal core_xeset_i_12_n_0 : STD_LOGIC;
  signal core_xeset_i_13_n_0 : STD_LOGIC;
  signal core_xeset_i_14_n_0 : STD_LOGIC;
  signal core_xeset_i_1_n_0 : STD_LOGIC;
  signal core_xeset_i_2_n_0 : STD_LOGIC;
  signal core_xeset_i_3_n_0 : STD_LOGIC;
  signal core_xeset_i_4_n_0 : STD_LOGIC;
  signal core_xeset_i_5_n_0 : STD_LOGIC;
  signal core_xeset_i_6_n_0 : STD_LOGIC;
  signal core_xeset_i_7_n_0 : STD_LOGIC;
  signal core_xeset_i_8_n_0 : STD_LOGIC;
  signal core_xeset_i_9_n_0 : STD_LOGIC;
  signal \^ctl_rx_exable\ : STD_LOGIC;
  signal ctl_rx_exable_i_1_n_0 : STD_LOGIC;
  signal \^ctl_tx_exable\ : STD_LOGIC;
  signal ctl_tx_exable_i_1_n_0 : STD_LOGIC;
  signal \^ctl_tx_send_rfi\ : STD_LOGIC;
  signal ctl_tx_send_rfi_i_1_n_0 : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reset_done_tx : STD_LOGIC;
  signal reset_done_tx_i_1_n_0 : STD_LOGIC;
  signal rx_tx_reset : STD_LOGIC;
  signal stat_rx_aligned_l : STD_LOGIC;
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal \state[2]_i_1_n_0\ : STD_LOGIC;
  signal \state[3]_i_1_n_0\ : STD_LOGIC;
  signal timer1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \timer10_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \timer10_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \timer10_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \timer10_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \timer10_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \timer10_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \timer10_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \timer10_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \timer10_carry__0_n_0\ : STD_LOGIC;
  signal \timer10_carry__0_n_1\ : STD_LOGIC;
  signal \timer10_carry__0_n_2\ : STD_LOGIC;
  signal \timer10_carry__0_n_3\ : STD_LOGIC;
  signal \timer10_carry__0_n_4\ : STD_LOGIC;
  signal \timer10_carry__0_n_5\ : STD_LOGIC;
  signal \timer10_carry__0_n_6\ : STD_LOGIC;
  signal \timer10_carry__0_n_7\ : STD_LOGIC;
  signal \timer10_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \timer10_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \timer10_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \timer10_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \timer10_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \timer10_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \timer10_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \timer10_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \timer10_carry__1_n_0\ : STD_LOGIC;
  signal \timer10_carry__1_n_1\ : STD_LOGIC;
  signal \timer10_carry__1_n_2\ : STD_LOGIC;
  signal \timer10_carry__1_n_3\ : STD_LOGIC;
  signal \timer10_carry__1_n_4\ : STD_LOGIC;
  signal \timer10_carry__1_n_5\ : STD_LOGIC;
  signal \timer10_carry__1_n_6\ : STD_LOGIC;
  signal \timer10_carry__1_n_7\ : STD_LOGIC;
  signal \timer10_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \timer10_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \timer10_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \timer10_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \timer10_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \timer10_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \timer10_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \timer10_carry__2_n_2\ : STD_LOGIC;
  signal \timer10_carry__2_n_3\ : STD_LOGIC;
  signal \timer10_carry__2_n_4\ : STD_LOGIC;
  signal \timer10_carry__2_n_5\ : STD_LOGIC;
  signal \timer10_carry__2_n_6\ : STD_LOGIC;
  signal \timer10_carry__2_n_7\ : STD_LOGIC;
  signal timer10_carry_i_1_n_0 : STD_LOGIC;
  signal timer10_carry_i_2_n_0 : STD_LOGIC;
  signal timer10_carry_i_3_n_0 : STD_LOGIC;
  signal timer10_carry_i_4_n_0 : STD_LOGIC;
  signal timer10_carry_i_5_n_0 : STD_LOGIC;
  signal timer10_carry_i_6_n_0 : STD_LOGIC;
  signal timer10_carry_i_7_n_0 : STD_LOGIC;
  signal timer10_carry_i_8_n_0 : STD_LOGIC;
  signal timer10_carry_n_0 : STD_LOGIC;
  signal timer10_carry_n_1 : STD_LOGIC;
  signal timer10_carry_n_2 : STD_LOGIC;
  signal timer10_carry_n_3 : STD_LOGIC;
  signal timer10_carry_n_4 : STD_LOGIC;
  signal timer10_carry_n_5 : STD_LOGIC;
  signal timer10_carry_n_6 : STD_LOGIC;
  signal timer10_carry_n_7 : STD_LOGIC;
  signal timer1_en : STD_LOGIC;
  signal timer1_en_i_1_n_0 : STD_LOGIC;
  signal timer2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \timer20_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \timer20_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \timer20_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \timer20_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \timer20_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \timer20_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \timer20_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \timer20_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \timer20_carry__0_n_0\ : STD_LOGIC;
  signal \timer20_carry__0_n_1\ : STD_LOGIC;
  signal \timer20_carry__0_n_10\ : STD_LOGIC;
  signal \timer20_carry__0_n_11\ : STD_LOGIC;
  signal \timer20_carry__0_n_12\ : STD_LOGIC;
  signal \timer20_carry__0_n_13\ : STD_LOGIC;
  signal \timer20_carry__0_n_14\ : STD_LOGIC;
  signal \timer20_carry__0_n_15\ : STD_LOGIC;
  signal \timer20_carry__0_n_2\ : STD_LOGIC;
  signal \timer20_carry__0_n_3\ : STD_LOGIC;
  signal \timer20_carry__0_n_4\ : STD_LOGIC;
  signal \timer20_carry__0_n_5\ : STD_LOGIC;
  signal \timer20_carry__0_n_6\ : STD_LOGIC;
  signal \timer20_carry__0_n_7\ : STD_LOGIC;
  signal \timer20_carry__0_n_8\ : STD_LOGIC;
  signal \timer20_carry__0_n_9\ : STD_LOGIC;
  signal \timer20_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \timer20_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \timer20_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \timer20_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \timer20_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \timer20_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \timer20_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \timer20_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \timer20_carry__1_n_0\ : STD_LOGIC;
  signal \timer20_carry__1_n_1\ : STD_LOGIC;
  signal \timer20_carry__1_n_10\ : STD_LOGIC;
  signal \timer20_carry__1_n_11\ : STD_LOGIC;
  signal \timer20_carry__1_n_12\ : STD_LOGIC;
  signal \timer20_carry__1_n_13\ : STD_LOGIC;
  signal \timer20_carry__1_n_14\ : STD_LOGIC;
  signal \timer20_carry__1_n_15\ : STD_LOGIC;
  signal \timer20_carry__1_n_2\ : STD_LOGIC;
  signal \timer20_carry__1_n_3\ : STD_LOGIC;
  signal \timer20_carry__1_n_4\ : STD_LOGIC;
  signal \timer20_carry__1_n_5\ : STD_LOGIC;
  signal \timer20_carry__1_n_6\ : STD_LOGIC;
  signal \timer20_carry__1_n_7\ : STD_LOGIC;
  signal \timer20_carry__1_n_8\ : STD_LOGIC;
  signal \timer20_carry__1_n_9\ : STD_LOGIC;
  signal \timer20_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \timer20_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \timer20_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \timer20_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \timer20_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \timer20_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \timer20_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \timer20_carry__2_n_10\ : STD_LOGIC;
  signal \timer20_carry__2_n_11\ : STD_LOGIC;
  signal \timer20_carry__2_n_12\ : STD_LOGIC;
  signal \timer20_carry__2_n_13\ : STD_LOGIC;
  signal \timer20_carry__2_n_14\ : STD_LOGIC;
  signal \timer20_carry__2_n_15\ : STD_LOGIC;
  signal \timer20_carry__2_n_2\ : STD_LOGIC;
  signal \timer20_carry__2_n_3\ : STD_LOGIC;
  signal \timer20_carry__2_n_4\ : STD_LOGIC;
  signal \timer20_carry__2_n_5\ : STD_LOGIC;
  signal \timer20_carry__2_n_6\ : STD_LOGIC;
  signal \timer20_carry__2_n_7\ : STD_LOGIC;
  signal \timer20_carry__2_n_9\ : STD_LOGIC;
  signal timer20_carry_i_1_n_0 : STD_LOGIC;
  signal timer20_carry_i_2_n_0 : STD_LOGIC;
  signal timer20_carry_i_3_n_0 : STD_LOGIC;
  signal timer20_carry_i_4_n_0 : STD_LOGIC;
  signal timer20_carry_i_5_n_0 : STD_LOGIC;
  signal timer20_carry_i_6_n_0 : STD_LOGIC;
  signal timer20_carry_i_7_n_0 : STD_LOGIC;
  signal timer20_carry_i_8_n_0 : STD_LOGIC;
  signal timer20_carry_n_0 : STD_LOGIC;
  signal timer20_carry_n_1 : STD_LOGIC;
  signal timer20_carry_n_10 : STD_LOGIC;
  signal timer20_carry_n_11 : STD_LOGIC;
  signal timer20_carry_n_12 : STD_LOGIC;
  signal timer20_carry_n_13 : STD_LOGIC;
  signal timer20_carry_n_14 : STD_LOGIC;
  signal timer20_carry_n_15 : STD_LOGIC;
  signal timer20_carry_n_2 : STD_LOGIC;
  signal timer20_carry_n_3 : STD_LOGIC;
  signal timer20_carry_n_4 : STD_LOGIC;
  signal timer20_carry_n_5 : STD_LOGIC;
  signal timer20_carry_n_6 : STD_LOGIC;
  signal timer20_carry_n_7 : STD_LOGIC;
  signal timer20_carry_n_8 : STD_LOGIC;
  signal timer20_carry_n_9 : STD_LOGIC;
  signal \timer2[0]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[10]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[11]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[12]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[13]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[14]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[15]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[16]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[17]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[18]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[19]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[1]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[20]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[21]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[22]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[23]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[24]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[25]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[26]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[27]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[28]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[29]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[2]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[30]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[31]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[31]_i_2_n_0\ : STD_LOGIC;
  signal \timer2[31]_i_3_n_0\ : STD_LOGIC;
  signal \timer2[31]_i_4_n_0\ : STD_LOGIC;
  signal \timer2[31]_i_5_n_0\ : STD_LOGIC;
  signal \timer2[31]_i_6_n_0\ : STD_LOGIC;
  signal \timer2[31]_i_7_n_0\ : STD_LOGIC;
  signal \timer2[31]_i_8_n_0\ : STD_LOGIC;
  signal \timer2[31]_i_9_n_0\ : STD_LOGIC;
  signal \timer2[3]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[4]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[5]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[6]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[7]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[8]_i_1_n_0\ : STD_LOGIC;
  signal \timer2[9]_i_1_n_0\ : STD_LOGIC;
  signal timer2_en : STD_LOGIC;
  signal timer2_en_i_1_n_0 : STD_LOGIC;
  signal \NLW_timer10_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_timer10_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_timer20_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_timer20_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_send_state[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_onehot_send_state[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_onehot_send_state[8]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_onehot_send_state[8]_i_4\ : label is "soft_lutpair3";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[0]\ : label is "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[1]\ : label is "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[2]\ : label is "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[3]\ : label is "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[4]\ : label is "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[5]\ : label is "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[6]\ : label is "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[7]\ : label is "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[8]\ : label is "a2:000001000,a12:000000010,a11:100000000,a10:010000000,a1:000000100,a0:000000001,a7:000010000,a9:001000000,a8:000100000";
  attribute SOFT_HLUTNM of core_xeset_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of core_xeset_i_4 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of core_xeset_i_6 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of ctl_rx_exable_i_1 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of ctl_tx_exable_i_1 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of ctl_tx_send_rfi_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \state[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \state[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \state[2]_i_1\ : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of timer10_carry : label is 35;
  attribute ADDER_THRESHOLD of \timer10_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \timer10_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \timer10_carry__2\ : label is 35;
  attribute SOFT_HLUTNM of \timer1[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \timer1[10]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \timer1[11]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \timer1[12]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \timer1[13]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \timer1[14]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \timer1[15]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \timer1[16]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \timer1[17]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \timer1[18]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \timer1[19]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \timer1[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \timer1[20]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \timer1[21]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \timer1[22]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \timer1[23]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \timer1[24]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \timer1[25]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \timer1[26]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \timer1[27]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \timer1[28]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \timer1[29]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \timer1[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \timer1[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \timer1[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \timer1[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \timer1[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \timer1[7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \timer1[8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \timer1[9]_i_1\ : label is "soft_lutpair9";
  attribute ADDER_THRESHOLD of timer20_carry : label is 35;
  attribute ADDER_THRESHOLD of \timer20_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \timer20_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \timer20_carry__2\ : label is 35;
  attribute SOFT_HLUTNM of timer2_en_i_1 : label is "soft_lutpair20";
begin
  core_xeset <= \^core_xeset\;
  ctl_rx_exable <= \^ctl_rx_exable\;
  ctl_tx_exable <= \^ctl_tx_exable\;
  ctl_tx_send_rfi <= \^ctl_tx_send_rfi\;
\FSM_onehot_send_state[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I2 => stat_rx_aligned_l,
      O => \FSM_onehot_send_state[3]_i_1_n_0\
    );
\FSM_onehot_send_state[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[3]\,
      I1 => stat_rx_aligned_l,
      O => \FSM_onehot_send_state[4]_i_1_n_0\
    );
\FSM_onehot_send_state[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[6]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I2 => stat_rx_aligned_l,
      O => \FSM_onehot_send_state[7]_i_1_n_0\
    );
\FSM_onehot_send_state[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFE0"
    )
        port map (
      I0 => stat_rx_aligned_l,
      I1 => core_xeset_i_5_n_0,
      I2 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I3 => \FSM_onehot_send_state[8]_i_2_n_0\,
      I4 => core_xeset_i_3_n_0,
      O => \FSM_onehot_send_state[8]_i_1_n_0\
    );
\FSM_onehot_send_state[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFEFFFE"
    )
        port map (
      I0 => \FSM_onehot_send_state[8]_i_3_n_0\,
      I1 => \FSM_onehot_send_state[8]_i_4_n_0\,
      I2 => \FSM_onehot_send_state_reg_n_0_[1]\,
      I3 => \FSM_onehot_send_state_reg_n_0_[8]\,
      I4 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I5 => reset_done_tx,
      O => \FSM_onehot_send_state[8]_i_2_n_0\
    );
\FSM_onehot_send_state[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[5]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[4]\,
      O => \FSM_onehot_send_state[8]_i_3_n_0\
    );
\FSM_onehot_send_state[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[7]\,
      O => \FSM_onehot_send_state[8]_i_4_n_0\
    );
\FSM_onehot_send_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_send_state[8]_i_1_n_0\,
      D => \FSM_onehot_send_state_reg_n_0_[8]\,
      PRE => rx_tx_reset,
      Q => \FSM_onehot_send_state_reg_n_0_[0]\
    );
\FSM_onehot_send_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_send_state[8]_i_1_n_0\,
      CLR => rx_tx_reset,
      D => \FSM_onehot_send_state_reg_n_0_[0]\,
      Q => \FSM_onehot_send_state_reg_n_0_[1]\
    );
\FSM_onehot_send_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_send_state[8]_i_1_n_0\,
      CLR => rx_tx_reset,
      D => \FSM_onehot_send_state_reg_n_0_[1]\,
      Q => \FSM_onehot_send_state_reg_n_0_[2]\
    );
\FSM_onehot_send_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_send_state[8]_i_1_n_0\,
      CLR => rx_tx_reset,
      D => \FSM_onehot_send_state[3]_i_1_n_0\,
      Q => \FSM_onehot_send_state_reg_n_0_[3]\
    );
\FSM_onehot_send_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_send_state[8]_i_1_n_0\,
      CLR => rx_tx_reset,
      D => \FSM_onehot_send_state[4]_i_1_n_0\,
      Q => \FSM_onehot_send_state_reg_n_0_[4]\
    );
\FSM_onehot_send_state_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_send_state[8]_i_1_n_0\,
      CLR => rx_tx_reset,
      D => \FSM_onehot_send_state_reg_n_0_[4]\,
      Q => \FSM_onehot_send_state_reg_n_0_[5]\
    );
\FSM_onehot_send_state_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_send_state[8]_i_1_n_0\,
      CLR => rx_tx_reset,
      D => \FSM_onehot_send_state_reg_n_0_[5]\,
      Q => \FSM_onehot_send_state_reg_n_0_[6]\
    );
\FSM_onehot_send_state_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_send_state[8]_i_1_n_0\,
      CLR => rx_tx_reset,
      D => \FSM_onehot_send_state[7]_i_1_n_0\,
      Q => \FSM_onehot_send_state_reg_n_0_[7]\
    );
\FSM_onehot_send_state_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_send_state[8]_i_1_n_0\,
      CLR => rx_tx_reset,
      D => \FSM_onehot_send_state_reg_n_0_[7]\,
      Q => \FSM_onehot_send_state_reg_n_0_[8]\
    );
core_xeset_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABABAAABA8A8AAA8"
    )
        port map (
      I0 => core_xeset_i_2_n_0,
      I1 => core_xeset_i_3_n_0,
      I2 => core_xeset_i_4_n_0,
      I3 => core_xeset_i_5_n_0,
      I4 => core_xeset_i_6_n_0,
      I5 => \^core_xeset\,
      O => core_xeset_i_1_n_0
    );
core_xeset_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => timer1(14),
      I1 => timer1(12),
      I2 => timer1(15),
      I3 => timer1(13),
      I4 => core_xeset_i_14_n_0,
      O => core_xeset_i_10_n_0
    );
core_xeset_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => timer1(21),
      I1 => timer1(23),
      I2 => timer1(19),
      I3 => timer1(20),
      O => core_xeset_i_11_n_0
    );
core_xeset_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => timer1(27),
      I1 => timer1(29),
      I2 => timer1(31),
      I3 => timer1(28),
      O => core_xeset_i_12_n_0
    );
core_xeset_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => timer1(7),
      I1 => timer1(18),
      I2 => timer1(22),
      I3 => timer1(16),
      O => core_xeset_i_13_n_0
    );
core_xeset_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => timer1(9),
      I1 => timer1(11),
      I2 => timer1(10),
      I3 => timer1(8),
      O => core_xeset_i_14_n_0
    );
core_xeset_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[6]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[2]\,
      O => core_xeset_i_2_n_0
    );
core_xeset_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000200"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[6]\,
      I1 => \timer2[31]_i_5_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_3_n_0\,
      I4 => \timer2[31]_i_2_n_0\,
      O => core_xeset_i_3_n_0
    );
core_xeset_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[8]\,
      O => core_xeset_i_4_n_0
    );
core_xeset_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => core_xeset_i_7_n_0,
      I1 => core_xeset_i_8_n_0,
      I2 => core_xeset_i_9_n_0,
      I3 => core_xeset_i_10_n_0,
      O => core_xeset_i_5_n_0
    );
core_xeset_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => stat_rx_aligned_l,
      I1 => \FSM_onehot_send_state_reg_n_0_[2]\,
      O => core_xeset_i_6_n_0
    );
core_xeset_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => timer1(3),
      I1 => timer1(2),
      I2 => timer1(5),
      I3 => timer1(4),
      I4 => core_xeset_i_11_n_0,
      O => core_xeset_i_7_n_0
    );
core_xeset_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => timer1(24),
      I1 => timer1(25),
      I2 => timer1(26),
      I3 => timer1(30),
      I4 => core_xeset_i_12_n_0,
      O => core_xeset_i_8_n_0
    );
core_xeset_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => timer1(0),
      I1 => timer1(1),
      I2 => timer1(17),
      I3 => timer1(6),
      I4 => core_xeset_i_13_n_0,
      O => core_xeset_i_9_n_0
    );
core_xeset_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rx_tx_reset,
      D => core_xeset_i_1_n_0,
      Q => \^core_xeset\
    );
ctl_rx_exable_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => stat_rx_aligned_l,
      I1 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I2 => \^ctl_rx_exable\,
      O => ctl_rx_exable_i_1_n_0
    );
ctl_rx_exable_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rx_tx_reset,
      D => ctl_rx_exable_i_1_n_0,
      Q => \^ctl_rx_exable\
    );
ctl_tx_exable_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => stat_rx_aligned_l,
      I1 => \FSM_onehot_send_state_reg_n_0_[3]\,
      I2 => \^ctl_tx_exable\,
      O => ctl_tx_exable_i_1_n_0
    );
ctl_tx_exable_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => usr_rx_xr,
      I1 => usr_tx_xr,
      O => rx_tx_reset
    );
ctl_tx_exable_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rx_tx_reset,
      D => ctl_tx_exable_i_1_n_0,
      Q => \^ctl_tx_exable\
    );
ctl_tx_send_rfi_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F7F0F0"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I1 => stat_rx_aligned_l,
      I2 => \FSM_onehot_send_state_reg_n_0_[1]\,
      I3 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I4 => \^ctl_tx_send_rfi\,
      O => ctl_tx_send_rfi_i_1_n_0
    );
ctl_tx_send_rfi_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rx_tx_reset,
      D => ctl_tx_send_rfi_i_1_n_0,
      Q => \^ctl_tx_send_rfi\
    );
reset_done_tx_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => usr_tx_xr,
      O => reset_done_tx_i_1_n_0
    );
reset_done_tx_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => reset_done_tx_i_1_n_0,
      Q => reset_done_tx,
      R => '0'
    );
stat_rx_aligned_l_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rx_tx_reset,
      D => stat_rx_aligned,
      Q => stat_rx_aligned_l
    );
\state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[3]\,
      I2 => \FSM_onehot_send_state_reg_n_0_[7]\,
      I3 => \FSM_onehot_send_state_reg_n_0_[5]\,
      O => \state[0]_i_1_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[6]\,
      I2 => \FSM_onehot_send_state_reg_n_0_[7]\,
      I3 => \FSM_onehot_send_state_reg_n_0_[3]\,
      O => \state[1]_i_1_n_0\
    );
\state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[5]\,
      I2 => \FSM_onehot_send_state_reg_n_0_[7]\,
      I3 => \FSM_onehot_send_state_reg_n_0_[6]\,
      O => \state[2]_i_1_n_0\
    );
\state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \state[1]_i_1_n_0\,
      I1 => \FSM_onehot_send_state_reg_n_0_[1]\,
      I2 => \FSM_onehot_send_state_reg_n_0_[4]\,
      I3 => \FSM_onehot_send_state_reg_n_0_[5]\,
      I4 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I5 => \FSM_onehot_send_state_reg_n_0_[8]\,
      O => \state[3]_i_1_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \state[3]_i_1_n_0\,
      D => \state[0]_i_1_n_0\,
      PRE => rx_tx_reset,
      Q => state(0)
    );
\state_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \state[3]_i_1_n_0\,
      D => \state[1]_i_1_n_0\,
      PRE => rx_tx_reset,
      Q => state(1)
    );
\state_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \state[3]_i_1_n_0\,
      D => \state[2]_i_1_n_0\,
      PRE => rx_tx_reset,
      Q => state(2)
    );
\state_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \state[3]_i_1_n_0\,
      D => \FSM_onehot_send_state_reg_n_0_[8]\,
      PRE => rx_tx_reset,
      Q => state(3)
    );
timer10_carry: unisim.vcomponents.CARRY8
     port map (
      CI => timer1(0),
      CI_TOP => '0',
      CO(7) => timer10_carry_n_0,
      CO(6) => timer10_carry_n_1,
      CO(5) => timer10_carry_n_2,
      CO(4) => timer10_carry_n_3,
      CO(3) => timer10_carry_n_4,
      CO(2) => timer10_carry_n_5,
      CO(1) => timer10_carry_n_6,
      CO(0) => timer10_carry_n_7,
      DI(7 downto 0) => timer1(8 downto 1),
      O(7 downto 0) => data0(8 downto 1),
      S(7) => timer10_carry_i_1_n_0,
      S(6) => timer10_carry_i_2_n_0,
      S(5) => timer10_carry_i_3_n_0,
      S(4) => timer10_carry_i_4_n_0,
      S(3) => timer10_carry_i_5_n_0,
      S(2) => timer10_carry_i_6_n_0,
      S(1) => timer10_carry_i_7_n_0,
      S(0) => timer10_carry_i_8_n_0
    );
\timer10_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => timer10_carry_n_0,
      CI_TOP => '0',
      CO(7) => \timer10_carry__0_n_0\,
      CO(6) => \timer10_carry__0_n_1\,
      CO(5) => \timer10_carry__0_n_2\,
      CO(4) => \timer10_carry__0_n_3\,
      CO(3) => \timer10_carry__0_n_4\,
      CO(2) => \timer10_carry__0_n_5\,
      CO(1) => \timer10_carry__0_n_6\,
      CO(0) => \timer10_carry__0_n_7\,
      DI(7 downto 0) => timer1(16 downto 9),
      O(7 downto 0) => data0(16 downto 9),
      S(7) => \timer10_carry__0_i_1_n_0\,
      S(6) => \timer10_carry__0_i_2_n_0\,
      S(5) => \timer10_carry__0_i_3_n_0\,
      S(4) => \timer10_carry__0_i_4_n_0\,
      S(3) => \timer10_carry__0_i_5_n_0\,
      S(2) => \timer10_carry__0_i_6_n_0\,
      S(1) => \timer10_carry__0_i_7_n_0\,
      S(0) => \timer10_carry__0_i_8_n_0\
    );
\timer10_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(16),
      O => \timer10_carry__0_i_1_n_0\
    );
\timer10_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(15),
      O => \timer10_carry__0_i_2_n_0\
    );
\timer10_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(14),
      O => \timer10_carry__0_i_3_n_0\
    );
\timer10_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(13),
      O => \timer10_carry__0_i_4_n_0\
    );
\timer10_carry__0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(12),
      O => \timer10_carry__0_i_5_n_0\
    );
\timer10_carry__0_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(11),
      O => \timer10_carry__0_i_6_n_0\
    );
\timer10_carry__0_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(10),
      O => \timer10_carry__0_i_7_n_0\
    );
\timer10_carry__0_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(9),
      O => \timer10_carry__0_i_8_n_0\
    );
\timer10_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \timer10_carry__0_n_0\,
      CI_TOP => '0',
      CO(7) => \timer10_carry__1_n_0\,
      CO(6) => \timer10_carry__1_n_1\,
      CO(5) => \timer10_carry__1_n_2\,
      CO(4) => \timer10_carry__1_n_3\,
      CO(3) => \timer10_carry__1_n_4\,
      CO(2) => \timer10_carry__1_n_5\,
      CO(1) => \timer10_carry__1_n_6\,
      CO(0) => \timer10_carry__1_n_7\,
      DI(7 downto 0) => timer1(24 downto 17),
      O(7 downto 0) => data0(24 downto 17),
      S(7) => \timer10_carry__1_i_1_n_0\,
      S(6) => \timer10_carry__1_i_2_n_0\,
      S(5) => \timer10_carry__1_i_3_n_0\,
      S(4) => \timer10_carry__1_i_4_n_0\,
      S(3) => \timer10_carry__1_i_5_n_0\,
      S(2) => \timer10_carry__1_i_6_n_0\,
      S(1) => \timer10_carry__1_i_7_n_0\,
      S(0) => \timer10_carry__1_i_8_n_0\
    );
\timer10_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(24),
      O => \timer10_carry__1_i_1_n_0\
    );
\timer10_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(23),
      O => \timer10_carry__1_i_2_n_0\
    );
\timer10_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(22),
      O => \timer10_carry__1_i_3_n_0\
    );
\timer10_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(21),
      O => \timer10_carry__1_i_4_n_0\
    );
\timer10_carry__1_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(20),
      O => \timer10_carry__1_i_5_n_0\
    );
\timer10_carry__1_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(19),
      O => \timer10_carry__1_i_6_n_0\
    );
\timer10_carry__1_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(18),
      O => \timer10_carry__1_i_7_n_0\
    );
\timer10_carry__1_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(17),
      O => \timer10_carry__1_i_8_n_0\
    );
\timer10_carry__2\: unisim.vcomponents.CARRY8
     port map (
      CI => \timer10_carry__1_n_0\,
      CI_TOP => '0',
      CO(7 downto 6) => \NLW_timer10_carry__2_CO_UNCONNECTED\(7 downto 6),
      CO(5) => \timer10_carry__2_n_2\,
      CO(4) => \timer10_carry__2_n_3\,
      CO(3) => \timer10_carry__2_n_4\,
      CO(2) => \timer10_carry__2_n_5\,
      CO(1) => \timer10_carry__2_n_6\,
      CO(0) => \timer10_carry__2_n_7\,
      DI(7 downto 6) => B"00",
      DI(5 downto 0) => timer1(30 downto 25),
      O(7) => \NLW_timer10_carry__2_O_UNCONNECTED\(7),
      O(6 downto 0) => data0(31 downto 25),
      S(7) => '0',
      S(6) => \timer10_carry__2_i_1_n_0\,
      S(5) => \timer10_carry__2_i_2_n_0\,
      S(4) => \timer10_carry__2_i_3_n_0\,
      S(3) => \timer10_carry__2_i_4_n_0\,
      S(2) => \timer10_carry__2_i_5_n_0\,
      S(1) => \timer10_carry__2_i_6_n_0\,
      S(0) => \timer10_carry__2_i_7_n_0\
    );
\timer10_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(31),
      O => \timer10_carry__2_i_1_n_0\
    );
\timer10_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(30),
      O => \timer10_carry__2_i_2_n_0\
    );
\timer10_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(29),
      O => \timer10_carry__2_i_3_n_0\
    );
\timer10_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(28),
      O => \timer10_carry__2_i_4_n_0\
    );
\timer10_carry__2_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(27),
      O => \timer10_carry__2_i_5_n_0\
    );
\timer10_carry__2_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(26),
      O => \timer10_carry__2_i_6_n_0\
    );
\timer10_carry__2_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(25),
      O => \timer10_carry__2_i_7_n_0\
    );
timer10_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(8),
      O => timer10_carry_i_1_n_0
    );
timer10_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(7),
      O => timer10_carry_i_2_n_0
    );
timer10_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(6),
      O => timer10_carry_i_3_n_0
    );
timer10_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(5),
      O => timer10_carry_i_4_n_0
    );
timer10_carry_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(4),
      O => timer10_carry_i_5_n_0
    );
timer10_carry_i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(3),
      O => timer10_carry_i_6_n_0
    );
timer10_carry_i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(2),
      O => timer10_carry_i_7_n_0
    );
timer10_carry_i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer1(1),
      O => timer10_carry_i_8_n_0
    );
\timer1[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => timer1(0),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(0)
    );
\timer1[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(10),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(10)
    );
\timer1[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(11),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(11)
    );
\timer1[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(12),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(12)
    );
\timer1[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(13),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(13)
    );
\timer1[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(14),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(14)
    );
\timer1[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(15),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(15)
    );
\timer1[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(16),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(16)
    );
\timer1[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(17),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(17)
    );
\timer1[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(18),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(18)
    );
\timer1[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(19),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(19)
    );
\timer1[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(1),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(1)
    );
\timer1[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(20),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(20)
    );
\timer1[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(21),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(21)
    );
\timer1[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(22),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(22)
    );
\timer1[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(23),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(23)
    );
\timer1[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(24),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(24)
    );
\timer1[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(25),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(25)
    );
\timer1[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(26),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(26)
    );
\timer1[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(27),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(27)
    );
\timer1[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(28),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(28)
    );
\timer1[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(29),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(29)
    );
\timer1[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(2),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(2)
    );
\timer1[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => data0(30),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(30)
    );
\timer1[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(31),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(31)
    );
\timer1[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(3),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(3)
    );
\timer1[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(4),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(4)
    );
\timer1[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(5),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(5)
    );
\timer1[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(6),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(6)
    );
\timer1[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(7),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(7)
    );
\timer1[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(8),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(8)
    );
\timer1[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => data0(9),
      I1 => timer1_en,
      I2 => core_xeset_i_5_n_0,
      O => p_0_in(9)
    );
timer1_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888BBBBB88888888"
    )
        port map (
      I0 => reset_done_tx,
      I1 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I2 => stat_rx_aligned_l,
      I3 => core_xeset_i_5_n_0,
      I4 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I5 => timer1_en,
      O => timer1_en_i_1_n_0
    );
timer1_en_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rx_tx_reset,
      D => timer1_en_i_1_n_0,
      Q => timer1_en
    );
\timer1_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(0),
      Q => timer1(0)
    );
\timer1_reg[10]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(10),
      PRE => xst,
      Q => timer1(10)
    );
\timer1_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(11),
      Q => timer1(11)
    );
\timer1_reg[12]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(12),
      PRE => xst,
      Q => timer1(12)
    );
\timer1_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(13),
      Q => timer1(13)
    );
\timer1_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(14),
      Q => timer1(14)
    );
\timer1_reg[15]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(15),
      PRE => xst,
      Q => timer1(15)
    );
\timer1_reg[16]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(16),
      PRE => xst,
      Q => timer1(16)
    );
\timer1_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(17),
      Q => timer1(17)
    );
\timer1_reg[18]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(18),
      PRE => xst,
      Q => timer1(18)
    );
\timer1_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(19),
      Q => timer1(19)
    );
\timer1_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(1),
      Q => timer1(1)
    );
\timer1_reg[20]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(20),
      PRE => xst,
      Q => timer1(20)
    );
\timer1_reg[21]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(21),
      PRE => xst,
      Q => timer1(21)
    );
\timer1_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(22),
      Q => timer1(22)
    );
\timer1_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(23),
      Q => timer1(23)
    );
\timer1_reg[24]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(24),
      PRE => xst,
      Q => timer1(24)
    );
\timer1_reg[25]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(25),
      PRE => xst,
      Q => timer1(25)
    );
\timer1_reg[26]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(26),
      PRE => xst,
      Q => timer1(26)
    );
\timer1_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(27),
      Q => timer1(27)
    );
\timer1_reg[28]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(28),
      PRE => xst,
      Q => timer1(28)
    );
\timer1_reg[29]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(29),
      PRE => xst,
      Q => timer1(29)
    );
\timer1_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(2),
      Q => timer1(2)
    );
\timer1_reg[30]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(30),
      PRE => xst,
      Q => timer1(30)
    );
\timer1_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(31),
      Q => timer1(31)
    );
\timer1_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(3),
      Q => timer1(3)
    );
\timer1_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(4),
      Q => timer1(4)
    );
\timer1_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(5),
      Q => timer1(5)
    );
\timer1_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(6),
      Q => timer1(6)
    );
\timer1_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(7),
      Q => timer1(7)
    );
\timer1_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(8),
      Q => timer1(8)
    );
\timer1_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => p_0_in(9),
      Q => timer1(9)
    );
timer20_carry: unisim.vcomponents.CARRY8
     port map (
      CI => timer2(0),
      CI_TOP => '0',
      CO(7) => timer20_carry_n_0,
      CO(6) => timer20_carry_n_1,
      CO(5) => timer20_carry_n_2,
      CO(4) => timer20_carry_n_3,
      CO(3) => timer20_carry_n_4,
      CO(2) => timer20_carry_n_5,
      CO(1) => timer20_carry_n_6,
      CO(0) => timer20_carry_n_7,
      DI(7 downto 0) => timer2(8 downto 1),
      O(7) => timer20_carry_n_8,
      O(6) => timer20_carry_n_9,
      O(5) => timer20_carry_n_10,
      O(4) => timer20_carry_n_11,
      O(3) => timer20_carry_n_12,
      O(2) => timer20_carry_n_13,
      O(1) => timer20_carry_n_14,
      O(0) => timer20_carry_n_15,
      S(7) => timer20_carry_i_1_n_0,
      S(6) => timer20_carry_i_2_n_0,
      S(5) => timer20_carry_i_3_n_0,
      S(4) => timer20_carry_i_4_n_0,
      S(3) => timer20_carry_i_5_n_0,
      S(2) => timer20_carry_i_6_n_0,
      S(1) => timer20_carry_i_7_n_0,
      S(0) => timer20_carry_i_8_n_0
    );
\timer20_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => timer20_carry_n_0,
      CI_TOP => '0',
      CO(7) => \timer20_carry__0_n_0\,
      CO(6) => \timer20_carry__0_n_1\,
      CO(5) => \timer20_carry__0_n_2\,
      CO(4) => \timer20_carry__0_n_3\,
      CO(3) => \timer20_carry__0_n_4\,
      CO(2) => \timer20_carry__0_n_5\,
      CO(1) => \timer20_carry__0_n_6\,
      CO(0) => \timer20_carry__0_n_7\,
      DI(7 downto 0) => timer2(16 downto 9),
      O(7) => \timer20_carry__0_n_8\,
      O(6) => \timer20_carry__0_n_9\,
      O(5) => \timer20_carry__0_n_10\,
      O(4) => \timer20_carry__0_n_11\,
      O(3) => \timer20_carry__0_n_12\,
      O(2) => \timer20_carry__0_n_13\,
      O(1) => \timer20_carry__0_n_14\,
      O(0) => \timer20_carry__0_n_15\,
      S(7) => \timer20_carry__0_i_1_n_0\,
      S(6) => \timer20_carry__0_i_2_n_0\,
      S(5) => \timer20_carry__0_i_3_n_0\,
      S(4) => \timer20_carry__0_i_4_n_0\,
      S(3) => \timer20_carry__0_i_5_n_0\,
      S(2) => \timer20_carry__0_i_6_n_0\,
      S(1) => \timer20_carry__0_i_7_n_0\,
      S(0) => \timer20_carry__0_i_8_n_0\
    );
\timer20_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(16),
      O => \timer20_carry__0_i_1_n_0\
    );
\timer20_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(15),
      O => \timer20_carry__0_i_2_n_0\
    );
\timer20_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(14),
      O => \timer20_carry__0_i_3_n_0\
    );
\timer20_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(13),
      O => \timer20_carry__0_i_4_n_0\
    );
\timer20_carry__0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(12),
      O => \timer20_carry__0_i_5_n_0\
    );
\timer20_carry__0_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(11),
      O => \timer20_carry__0_i_6_n_0\
    );
\timer20_carry__0_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(10),
      O => \timer20_carry__0_i_7_n_0\
    );
\timer20_carry__0_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(9),
      O => \timer20_carry__0_i_8_n_0\
    );
\timer20_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \timer20_carry__0_n_0\,
      CI_TOP => '0',
      CO(7) => \timer20_carry__1_n_0\,
      CO(6) => \timer20_carry__1_n_1\,
      CO(5) => \timer20_carry__1_n_2\,
      CO(4) => \timer20_carry__1_n_3\,
      CO(3) => \timer20_carry__1_n_4\,
      CO(2) => \timer20_carry__1_n_5\,
      CO(1) => \timer20_carry__1_n_6\,
      CO(0) => \timer20_carry__1_n_7\,
      DI(7 downto 0) => timer2(24 downto 17),
      O(7) => \timer20_carry__1_n_8\,
      O(6) => \timer20_carry__1_n_9\,
      O(5) => \timer20_carry__1_n_10\,
      O(4) => \timer20_carry__1_n_11\,
      O(3) => \timer20_carry__1_n_12\,
      O(2) => \timer20_carry__1_n_13\,
      O(1) => \timer20_carry__1_n_14\,
      O(0) => \timer20_carry__1_n_15\,
      S(7) => \timer20_carry__1_i_1_n_0\,
      S(6) => \timer20_carry__1_i_2_n_0\,
      S(5) => \timer20_carry__1_i_3_n_0\,
      S(4) => \timer20_carry__1_i_4_n_0\,
      S(3) => \timer20_carry__1_i_5_n_0\,
      S(2) => \timer20_carry__1_i_6_n_0\,
      S(1) => \timer20_carry__1_i_7_n_0\,
      S(0) => \timer20_carry__1_i_8_n_0\
    );
\timer20_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(24),
      O => \timer20_carry__1_i_1_n_0\
    );
\timer20_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(23),
      O => \timer20_carry__1_i_2_n_0\
    );
\timer20_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(22),
      O => \timer20_carry__1_i_3_n_0\
    );
\timer20_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(21),
      O => \timer20_carry__1_i_4_n_0\
    );
\timer20_carry__1_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(20),
      O => \timer20_carry__1_i_5_n_0\
    );
\timer20_carry__1_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(19),
      O => \timer20_carry__1_i_6_n_0\
    );
\timer20_carry__1_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(18),
      O => \timer20_carry__1_i_7_n_0\
    );
\timer20_carry__1_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(17),
      O => \timer20_carry__1_i_8_n_0\
    );
\timer20_carry__2\: unisim.vcomponents.CARRY8
     port map (
      CI => \timer20_carry__1_n_0\,
      CI_TOP => '0',
      CO(7 downto 6) => \NLW_timer20_carry__2_CO_UNCONNECTED\(7 downto 6),
      CO(5) => \timer20_carry__2_n_2\,
      CO(4) => \timer20_carry__2_n_3\,
      CO(3) => \timer20_carry__2_n_4\,
      CO(2) => \timer20_carry__2_n_5\,
      CO(1) => \timer20_carry__2_n_6\,
      CO(0) => \timer20_carry__2_n_7\,
      DI(7 downto 6) => B"00",
      DI(5 downto 0) => timer2(30 downto 25),
      O(7) => \NLW_timer20_carry__2_O_UNCONNECTED\(7),
      O(6) => \timer20_carry__2_n_9\,
      O(5) => \timer20_carry__2_n_10\,
      O(4) => \timer20_carry__2_n_11\,
      O(3) => \timer20_carry__2_n_12\,
      O(2) => \timer20_carry__2_n_13\,
      O(1) => \timer20_carry__2_n_14\,
      O(0) => \timer20_carry__2_n_15\,
      S(7) => '0',
      S(6) => \timer20_carry__2_i_1_n_0\,
      S(5) => \timer20_carry__2_i_2_n_0\,
      S(4) => \timer20_carry__2_i_3_n_0\,
      S(3) => \timer20_carry__2_i_4_n_0\,
      S(2) => \timer20_carry__2_i_5_n_0\,
      S(1) => \timer20_carry__2_i_6_n_0\,
      S(0) => \timer20_carry__2_i_7_n_0\
    );
\timer20_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(31),
      O => \timer20_carry__2_i_1_n_0\
    );
\timer20_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(30),
      O => \timer20_carry__2_i_2_n_0\
    );
\timer20_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(29),
      O => \timer20_carry__2_i_3_n_0\
    );
\timer20_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(28),
      O => \timer20_carry__2_i_4_n_0\
    );
\timer20_carry__2_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(27),
      O => \timer20_carry__2_i_5_n_0\
    );
\timer20_carry__2_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(26),
      O => \timer20_carry__2_i_6_n_0\
    );
\timer20_carry__2_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(25),
      O => \timer20_carry__2_i_7_n_0\
    );
timer20_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(8),
      O => timer20_carry_i_1_n_0
    );
timer20_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(7),
      O => timer20_carry_i_2_n_0
    );
timer20_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(6),
      O => timer20_carry_i_3_n_0
    );
timer20_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(5),
      O => timer20_carry_i_4_n_0
    );
timer20_carry_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(4),
      O => timer20_carry_i_5_n_0
    );
timer20_carry_i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(3),
      O => timer20_carry_i_6_n_0
    );
timer20_carry_i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(2),
      O => timer20_carry_i_7_n_0
    );
timer20_carry_i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => timer2(1),
      O => timer20_carry_i_8_n_0
    );
\timer2[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFB00000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => timer2(0),
      I5 => timer2_en,
      O => \timer2[0]_i_1_n_0\
    );
\timer2[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__0_n_14\,
      I5 => timer2_en,
      O => \timer2[10]_i_1_n_0\
    );
\timer2[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__0_n_13\,
      I5 => timer2_en,
      O => \timer2[11]_i_1_n_0\
    );
\timer2[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__0_n_12\,
      I5 => timer2_en,
      O => \timer2[12]_i_1_n_0\
    );
\timer2[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__0_n_11\,
      I5 => timer2_en,
      O => \timer2[13]_i_1_n_0\
    );
\timer2[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__0_n_10\,
      I5 => timer2_en,
      O => \timer2[14]_i_1_n_0\
    );
\timer2[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__0_n_9\,
      I5 => timer2_en,
      O => \timer2[15]_i_1_n_0\
    );
\timer2[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__0_n_8\,
      I5 => timer2_en,
      O => \timer2[16]_i_1_n_0\
    );
\timer2[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__1_n_15\,
      I5 => timer2_en,
      O => \timer2[17]_i_1_n_0\
    );
\timer2[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__1_n_14\,
      I5 => timer2_en,
      O => \timer2[18]_i_1_n_0\
    );
\timer2[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__1_n_13\,
      I5 => timer2_en,
      O => \timer2[19]_i_1_n_0\
    );
\timer2[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => timer20_carry_n_15,
      I5 => timer2_en,
      O => \timer2[1]_i_1_n_0\
    );
\timer2[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__1_n_12\,
      I5 => timer2_en,
      O => \timer2[20]_i_1_n_0\
    );
\timer2[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__1_n_11\,
      I5 => timer2_en,
      O => \timer2[21]_i_1_n_0\
    );
\timer2[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__1_n_10\,
      I5 => timer2_en,
      O => \timer2[22]_i_1_n_0\
    );
\timer2[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__1_n_9\,
      I5 => timer2_en,
      O => \timer2[23]_i_1_n_0\
    );
\timer2[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__1_n_8\,
      I5 => timer2_en,
      O => \timer2[24]_i_1_n_0\
    );
\timer2[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__2_n_15\,
      I5 => timer2_en,
      O => \timer2[25]_i_1_n_0\
    );
\timer2[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__2_n_14\,
      I5 => timer2_en,
      O => \timer2[26]_i_1_n_0\
    );
\timer2[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__2_n_13\,
      I5 => timer2_en,
      O => \timer2[27]_i_1_n_0\
    );
\timer2[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__2_n_12\,
      I5 => timer2_en,
      O => \timer2[28]_i_1_n_0\
    );
\timer2[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__2_n_11\,
      I5 => timer2_en,
      O => \timer2[29]_i_1_n_0\
    );
\timer2[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0004FFFFFFFF"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => timer20_carry_n_14,
      I5 => timer2_en,
      O => \timer2[2]_i_1_n_0\
    );
\timer2[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__2_n_10\,
      I5 => timer2_en,
      O => \timer2[30]_i_1_n_0\
    );
\timer2[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__2_n_9\,
      I5 => timer2_en,
      O => \timer2[31]_i_1_n_0\
    );
\timer2[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => timer2(0),
      I1 => timer2(1),
      I2 => timer2(3),
      I3 => timer2(2),
      I4 => \timer2[31]_i_6_n_0\,
      O => \timer2[31]_i_2_n_0\
    );
\timer2[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => timer2(8),
      I1 => timer2(10),
      I2 => timer2(11),
      I3 => timer2(9),
      I4 => \timer2[31]_i_7_n_0\,
      O => \timer2[31]_i_3_n_0\
    );
\timer2[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => timer2(17),
      I1 => timer2(6),
      I2 => timer2(23),
      I3 => timer2(21),
      I4 => \timer2[31]_i_8_n_0\,
      O => \timer2[31]_i_4_n_0\
    );
\timer2[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => timer2(24),
      I1 => timer2(25),
      I2 => timer2(15),
      I3 => timer2(13),
      I4 => \timer2[31]_i_9_n_0\,
      O => \timer2[31]_i_5_n_0\
    );
\timer2[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => timer2(27),
      I1 => timer2(29),
      I2 => timer2(30),
      I3 => timer2(26),
      O => \timer2[31]_i_6_n_0\
    );
\timer2[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => timer2(19),
      I1 => timer2(20),
      I2 => timer2(16),
      I3 => timer2(18),
      O => \timer2[31]_i_7_n_0\
    );
\timer2[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => timer2(31),
      I1 => timer2(28),
      I2 => timer2(22),
      I3 => timer2(7),
      O => \timer2[31]_i_8_n_0\
    );
\timer2[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => timer2(12),
      I1 => timer2(14),
      I2 => timer2(4),
      I3 => timer2(5),
      O => \timer2[31]_i_9_n_0\
    );
\timer2[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => timer20_carry_n_13,
      I5 => timer2_en,
      O => \timer2[3]_i_1_n_0\
    );
\timer2[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => timer20_carry_n_12,
      I5 => timer2_en,
      O => \timer2[4]_i_1_n_0\
    );
\timer2[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0004FFFFFFFF"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => timer20_carry_n_11,
      I5 => timer2_en,
      O => \timer2[5]_i_1_n_0\
    );
\timer2[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0004FFFFFFFF"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => timer20_carry_n_10,
      I5 => timer2_en,
      O => \timer2[6]_i_1_n_0\
    );
\timer2[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => timer20_carry_n_9,
      I5 => timer2_en,
      O => \timer2[7]_i_1_n_0\
    );
\timer2[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => timer20_carry_n_8,
      I5 => timer2_en,
      O => \timer2[8]_i_1_n_0\
    );
\timer2[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \timer2[31]_i_2_n_0\,
      I1 => \timer2[31]_i_3_n_0\,
      I2 => \timer2[31]_i_4_n_0\,
      I3 => \timer2[31]_i_5_n_0\,
      I4 => \timer20_carry__0_n_15\,
      I5 => timer2_en,
      O => \timer2[9]_i_1_n_0\
    );
timer2_en_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[5]\,
      I1 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I2 => timer2_en,
      O => timer2_en_i_1_n_0
    );
timer2_en_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rx_tx_reset,
      D => timer2_en_i_1_n_0,
      Q => timer2_en
    );
\timer2_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[0]_i_1_n_0\,
      Q => timer2(0)
    );
\timer2_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[10]_i_1_n_0\,
      Q => timer2(10)
    );
\timer2_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[11]_i_1_n_0\,
      Q => timer2(11)
    );
\timer2_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[12]_i_1_n_0\,
      Q => timer2(12)
    );
\timer2_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[13]_i_1_n_0\,
      Q => timer2(13)
    );
\timer2_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[14]_i_1_n_0\,
      Q => timer2(14)
    );
\timer2_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[15]_i_1_n_0\,
      Q => timer2(15)
    );
\timer2_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[16]_i_1_n_0\,
      Q => timer2(16)
    );
\timer2_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[17]_i_1_n_0\,
      Q => timer2(17)
    );
\timer2_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[18]_i_1_n_0\,
      Q => timer2(18)
    );
\timer2_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[19]_i_1_n_0\,
      Q => timer2(19)
    );
\timer2_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[1]_i_1_n_0\,
      Q => timer2(1)
    );
\timer2_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[20]_i_1_n_0\,
      Q => timer2(20)
    );
\timer2_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[21]_i_1_n_0\,
      Q => timer2(21)
    );
\timer2_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[22]_i_1_n_0\,
      Q => timer2(22)
    );
\timer2_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[23]_i_1_n_0\,
      Q => timer2(23)
    );
\timer2_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[24]_i_1_n_0\,
      Q => timer2(24)
    );
\timer2_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[25]_i_1_n_0\,
      Q => timer2(25)
    );
\timer2_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[26]_i_1_n_0\,
      Q => timer2(26)
    );
\timer2_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[27]_i_1_n_0\,
      Q => timer2(27)
    );
\timer2_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[28]_i_1_n_0\,
      Q => timer2(28)
    );
\timer2_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[29]_i_1_n_0\,
      Q => timer2(29)
    );
\timer2_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => \timer2[2]_i_1_n_0\,
      PRE => xst,
      Q => timer2(2)
    );
\timer2_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[30]_i_1_n_0\,
      Q => timer2(30)
    );
\timer2_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[31]_i_1_n_0\,
      Q => timer2(31)
    );
\timer2_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[3]_i_1_n_0\,
      Q => timer2(3)
    );
\timer2_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[4]_i_1_n_0\,
      Q => timer2(4)
    );
\timer2_reg[5]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => \timer2[5]_i_1_n_0\,
      PRE => xst,
      Q => timer2(5)
    );
\timer2_reg[6]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => \timer2[6]_i_1_n_0\,
      PRE => xst,
      Q => timer2(6)
    );
\timer2_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[7]_i_1_n_0\,
      Q => timer2(7)
    );
\timer2_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[8]_i_1_n_0\,
      Q => timer2(8)
    );
\timer2_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => xst,
      D => \timer2[9]_i_1_n_0\,
      Q => timer2(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_dsp_send_1_0 is
  port (
    clk : in STD_LOGIC;
    xst : in STD_LOGIC;
    usr_tx_xr : in STD_LOGIC;
    usr_rx_xr : in STD_LOGIC;
    ctl_tx_exable : out STD_LOGIC;
    ctl_tx_send_rfi : out STD_LOGIC;
    ctl_rx_exable : out STD_LOGIC;
    stat_rx_aligned : in STD_LOGIC;
    state : out STD_LOGIC_VECTOR ( 3 downto 0 );
    core_xeset : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_dsp_send_1_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_dsp_send_1_0 : entity is "design_1_dsp_send_1_0,dsp_send,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_dsp_send_1_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_dsp_send_1_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_dsp_send_1_0 : entity is "dsp_send,Vivado 2020.2";
end design_1_dsp_send_1_0;

architecture STRUCTURE of design_1_dsp_send_1_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_1_0_gt_txusrclk2, INSERT_VIP 0";
begin
inst: entity work.design_1_dsp_send_1_0_dsp_send
     port map (
      clk => clk,
      core_xeset => core_xeset,
      ctl_rx_exable => ctl_rx_exable,
      ctl_tx_exable => ctl_tx_exable,
      ctl_tx_send_rfi => ctl_tx_send_rfi,
      stat_rx_aligned => stat_rx_aligned,
      state(3 downto 0) => state(3 downto 0),
      usr_rx_xr => usr_rx_xr,
      usr_tx_xr => usr_tx_xr,
      xst => xst
    );
end STRUCTURE;
