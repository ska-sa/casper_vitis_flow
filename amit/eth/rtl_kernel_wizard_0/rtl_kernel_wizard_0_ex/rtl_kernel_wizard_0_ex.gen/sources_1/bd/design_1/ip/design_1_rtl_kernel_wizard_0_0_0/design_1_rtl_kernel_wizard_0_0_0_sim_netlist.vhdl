-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Tue Mar 16 18:21:51 2021
-- Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_rtl_kernel_wizard_0_0_0/design_1_rtl_kernel_wizard_0_0_0_sim_netlist.vhdl
-- Design      : design_1_rtl_kernel_wizard_0_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_rtl_kernel_wizard_0_0_0_rtl_kernel_wizard_0_control_s_axi is
  port (
    BVALID : out STD_LOGIC;
    WREADY : out STD_LOGIC;
    AWREADY : out STD_LOGIC;
    RVALID : out STD_LOGIC;
    ARREADY : out STD_LOGIC;
    ap_start : out STD_LOGIC;
    scalar00 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi00_ptr0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    interrupt : out STD_LOGIC;
    ARESET : in STD_LOGIC;
    ACLK_EN : in STD_LOGIC;
    ACLK : in STD_LOGIC;
    AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    ap_ready : in STD_LOGIC;
    WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_done : in STD_LOGIC;
    ap_idle : in STD_LOGIC;
    ARVALID : in STD_LOGIC;
    RREADY : in STD_LOGIC;
    BREADY : in STD_LOGIC;
    WVALID : in STD_LOGIC;
    WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    AWVALID : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_rtl_kernel_wizard_0_0_0_rtl_kernel_wizard_0_control_s_axi : entity is "rtl_kernel_wizard_0_control_s_axi";
end design_1_rtl_kernel_wizard_0_0_0_rtl_kernel_wizard_0_control_s_axi;

architecture STRUCTURE of design_1_rtl_kernel_wizard_0_0_0_rtl_kernel_wizard_0_control_s_axi is
  signal \^arready\ : STD_LOGIC;
  signal \^awready\ : STD_LOGIC;
  signal \^bvalid\ : STD_LOGIC;
  signal \FSM_onehot_rstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[3]_i_1_n_0\ : STD_LOGIC;
  signal \^rvalid\ : STD_LOGIC;
  signal \^wready\ : STD_LOGIC;
  signal \^ap_start\ : STD_LOGIC;
  signal \^axi00_ptr0\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal int_ap_done_i_1_n_0 : STD_LOGIC;
  signal int_ap_start3_out : STD_LOGIC;
  signal int_ap_start_i_1_n_0 : STD_LOGIC;
  signal int_auto_restart_i_1_n_0 : STD_LOGIC;
  signal int_auto_restart_i_2_n_0 : STD_LOGIC;
  signal int_axi00_ptr0 : STD_LOGIC;
  signal \int_axi00_ptr0[63]_i_1_n_0\ : STD_LOGIC;
  signal int_axi00_ptr0_reg0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal int_axi00_ptr0_reg01_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal int_gie_i_1_n_0 : STD_LOGIC;
  signal int_gie_i_2_n_0 : STD_LOGIC;
  signal int_gie_reg_n_0 : STD_LOGIC;
  signal int_ier9_out : STD_LOGIC;
  signal \int_ier_reg_n_0_[0]\ : STD_LOGIC;
  signal int_isr6_out : STD_LOGIC;
  signal \int_isr[0]_i_1_n_0\ : STD_LOGIC;
  signal \int_isr[1]_i_1_n_0\ : STD_LOGIC;
  signal \int_isr_reg_n_0_[0]\ : STD_LOGIC;
  signal int_scalar00 : STD_LOGIC;
  signal int_scalar000 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \int_scalar00[31]_i_3_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_0_in_0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal \^rdata\ : STD_LOGIC;
  signal \rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \^scalar00\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal waddr : STD_LOGIC;
  signal \waddr_reg_n_0_[0]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[1]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[2]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[3]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[4]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[5]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rstate[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_onehot_rstate[2]_i_1\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_rstate_reg[1]\ : label is "RDIDLE:010,RDDATA:100,iSTATE:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_rstate_reg[2]\ : label is "RDIDLE:010,RDDATA:100,iSTATE:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[1]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[2]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[3]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[0]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[10]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[11]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[12]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[13]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[14]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[15]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[16]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[17]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[18]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[19]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[20]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[21]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[22]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[23]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[24]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[25]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[26]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[27]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[28]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[29]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[2]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[30]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[31]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[32]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[33]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[34]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[35]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[36]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[37]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[38]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[39]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[3]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[40]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[41]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[42]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[43]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[44]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[45]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[46]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[47]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[48]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[49]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[4]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[50]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[51]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[52]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[53]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[54]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[55]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[56]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[57]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[58]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[59]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[5]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[60]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[61]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[62]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[63]_i_2\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[6]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[7]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[8]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \int_axi00_ptr0[9]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of int_gie_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \int_isr[0]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \int_scalar00[0]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \int_scalar00[10]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \int_scalar00[11]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \int_scalar00[12]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \int_scalar00[13]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \int_scalar00[14]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \int_scalar00[15]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \int_scalar00[16]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \int_scalar00[17]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \int_scalar00[18]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \int_scalar00[19]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_scalar00[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \int_scalar00[20]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_scalar00[21]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_scalar00[22]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \int_scalar00[23]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \int_scalar00[24]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_scalar00[25]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_scalar00[26]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \int_scalar00[27]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_scalar00[28]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_scalar00[29]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \int_scalar00[2]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \int_scalar00[30]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_scalar00[31]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_scalar00[3]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \int_scalar00[4]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \int_scalar00[5]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \int_scalar00[6]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \int_scalar00[7]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \int_scalar00[8]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \int_scalar00[9]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \rdata[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rdata[3]_i_1\ : label is "soft_lutpair2";
begin
  ARREADY <= \^arready\;
  AWREADY <= \^awready\;
  BVALID <= \^bvalid\;
  RVALID <= \^rvalid\;
  WREADY <= \^wready\;
  ap_start <= \^ap_start\;
  axi00_ptr0(63 downto 0) <= \^axi00_ptr0\(63 downto 0);
  scalar00(31 downto 0) <= \^scalar00\(31 downto 0);
\FSM_onehot_rstate[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8FDD"
    )
        port map (
      I0 => \^rvalid\,
      I1 => RREADY,
      I2 => ARVALID,
      I3 => \^arready\,
      O => \FSM_onehot_rstate[1]_i_1_n_0\
    );
\FSM_onehot_rstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \^arready\,
      I1 => ARVALID,
      I2 => RREADY,
      I3 => \^rvalid\,
      O => \FSM_onehot_rstate[2]_i_1_n_0\
    );
\FSM_onehot_rstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => ACLK_EN,
      D => \FSM_onehot_rstate[1]_i_1_n_0\,
      Q => \^arready\,
      R => ARESET
    );
\FSM_onehot_rstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => ACLK_EN,
      D => \FSM_onehot_rstate[2]_i_1_n_0\,
      Q => \^rvalid\,
      R => ARESET
    );
\FSM_onehot_wstate[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0FFD1D1"
    )
        port map (
      I0 => \^wready\,
      I1 => \^bvalid\,
      I2 => BREADY,
      I3 => AWVALID,
      I4 => \^awready\,
      O => \FSM_onehot_wstate[1]_i_1_n_0\
    );
\FSM_onehot_wstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \^awready\,
      I1 => AWVALID,
      I2 => WVALID,
      I3 => \^wready\,
      O => \FSM_onehot_wstate[2]_i_1_n_0\
    );
\FSM_onehot_wstate[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => BREADY,
      I1 => \^bvalid\,
      I2 => WVALID,
      I3 => \^wready\,
      O => \FSM_onehot_wstate[3]_i_1_n_0\
    );
\FSM_onehot_wstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => ACLK_EN,
      D => \FSM_onehot_wstate[1]_i_1_n_0\,
      Q => \^awready\,
      R => ARESET
    );
\FSM_onehot_wstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => ACLK_EN,
      D => \FSM_onehot_wstate[2]_i_1_n_0\,
      Q => \^wready\,
      R => ARESET
    );
\FSM_onehot_wstate_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => ACLK_EN,
      D => \FSM_onehot_wstate[3]_i_1_n_0\,
      Q => \^bvalid\,
      R => ARESET
    );
int_ap_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFAAAA0000"
    )
        port map (
      I0 => ap_done,
      I1 => \rdata[0]_i_3_n_0\,
      I2 => \^arready\,
      I3 => ARVALID,
      I4 => ACLK_EN,
      I5 => data0(1),
      O => int_ap_done_i_1_n_0
    );
int_ap_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => int_ap_done_i_1_n_0,
      Q => data0(1),
      R => ARESET
    );
int_ap_idle_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => ACLK_EN,
      D => ap_idle,
      Q => data0(2),
      R => ARESET
    );
int_ap_ready_reg: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => ACLK_EN,
      D => ap_ready,
      Q => data0(3),
      R => ARESET
    );
int_ap_start_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFFF80"
    )
        port map (
      I0 => data0(7),
      I1 => ACLK_EN,
      I2 => ap_ready,
      I3 => int_ap_start3_out,
      I4 => \^ap_start\,
      O => int_ap_start_i_1_n_0
    );
int_ap_start_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => WSTRB(0),
      I1 => \waddr_reg_n_0_[4]\,
      I2 => WDATA(0),
      I3 => \waddr_reg_n_0_[3]\,
      I4 => \waddr_reg_n_0_[2]\,
      I5 => \int_scalar00[31]_i_3_n_0\,
      O => int_ap_start3_out
    );
int_ap_start_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => int_ap_start_i_1_n_0,
      Q => \^ap_start\,
      R => ARESET
    );
int_auto_restart_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => WDATA(7),
      I1 => \waddr_reg_n_0_[3]\,
      I2 => WSTRB(0),
      I3 => \waddr_reg_n_0_[4]\,
      I4 => int_auto_restart_i_2_n_0,
      I5 => data0(7),
      O => int_auto_restart_i_1_n_0
    );
int_auto_restart_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \int_scalar00[31]_i_3_n_0\,
      I1 => \waddr_reg_n_0_[2]\,
      O => int_auto_restart_i_2_n_0
    );
int_auto_restart_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => int_auto_restart_i_1_n_0,
      Q => data0(7),
      R => ARESET
    );
\int_axi00_ptr0[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(0),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(0),
      O => int_axi00_ptr0_reg01_out(0)
    );
\int_axi00_ptr0[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(10),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(10),
      O => int_axi00_ptr0_reg01_out(10)
    );
\int_axi00_ptr0[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(11),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(11),
      O => int_axi00_ptr0_reg01_out(11)
    );
\int_axi00_ptr0[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(12),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(12),
      O => int_axi00_ptr0_reg01_out(12)
    );
\int_axi00_ptr0[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(13),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(13),
      O => int_axi00_ptr0_reg01_out(13)
    );
\int_axi00_ptr0[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(14),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(14),
      O => int_axi00_ptr0_reg01_out(14)
    );
\int_axi00_ptr0[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(15),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(15),
      O => int_axi00_ptr0_reg01_out(15)
    );
\int_axi00_ptr0[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(16),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(16),
      O => int_axi00_ptr0_reg01_out(16)
    );
\int_axi00_ptr0[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(17),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(17),
      O => int_axi00_ptr0_reg01_out(17)
    );
\int_axi00_ptr0[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(18),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(18),
      O => int_axi00_ptr0_reg01_out(18)
    );
\int_axi00_ptr0[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(19),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(19),
      O => int_axi00_ptr0_reg01_out(19)
    );
\int_axi00_ptr0[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(1),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(1),
      O => int_axi00_ptr0_reg01_out(1)
    );
\int_axi00_ptr0[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(20),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(20),
      O => int_axi00_ptr0_reg01_out(20)
    );
\int_axi00_ptr0[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(21),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(21),
      O => int_axi00_ptr0_reg01_out(21)
    );
\int_axi00_ptr0[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(22),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(22),
      O => int_axi00_ptr0_reg01_out(22)
    );
\int_axi00_ptr0[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(23),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(23),
      O => int_axi00_ptr0_reg01_out(23)
    );
\int_axi00_ptr0[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(24),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(24),
      O => int_axi00_ptr0_reg01_out(24)
    );
\int_axi00_ptr0[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(25),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(25),
      O => int_axi00_ptr0_reg01_out(25)
    );
\int_axi00_ptr0[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(26),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(26),
      O => int_axi00_ptr0_reg01_out(26)
    );
\int_axi00_ptr0[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(27),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(27),
      O => int_axi00_ptr0_reg01_out(27)
    );
\int_axi00_ptr0[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(28),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(28),
      O => int_axi00_ptr0_reg01_out(28)
    );
\int_axi00_ptr0[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(29),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(29),
      O => int_axi00_ptr0_reg01_out(29)
    );
\int_axi00_ptr0[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(2),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(2),
      O => int_axi00_ptr0_reg01_out(2)
    );
\int_axi00_ptr0[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(30),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(30),
      O => int_axi00_ptr0_reg01_out(30)
    );
\int_axi00_ptr0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \waddr_reg_n_0_[4]\,
      I1 => \waddr_reg_n_0_[3]\,
      I2 => \waddr_reg_n_0_[2]\,
      I3 => \int_scalar00[31]_i_3_n_0\,
      O => int_axi00_ptr0
    );
\int_axi00_ptr0[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(31),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(31),
      O => int_axi00_ptr0_reg01_out(31)
    );
\int_axi00_ptr0[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(0),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(32),
      O => int_axi00_ptr0_reg0(0)
    );
\int_axi00_ptr0[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(1),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(33),
      O => int_axi00_ptr0_reg0(1)
    );
\int_axi00_ptr0[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(2),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(34),
      O => int_axi00_ptr0_reg0(2)
    );
\int_axi00_ptr0[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(3),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(35),
      O => int_axi00_ptr0_reg0(3)
    );
\int_axi00_ptr0[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(4),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(36),
      O => int_axi00_ptr0_reg0(4)
    );
\int_axi00_ptr0[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(5),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(37),
      O => int_axi00_ptr0_reg0(5)
    );
\int_axi00_ptr0[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(6),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(38),
      O => int_axi00_ptr0_reg0(6)
    );
\int_axi00_ptr0[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(7),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(39),
      O => int_axi00_ptr0_reg0(7)
    );
\int_axi00_ptr0[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(3),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(3),
      O => int_axi00_ptr0_reg01_out(3)
    );
\int_axi00_ptr0[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(8),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(40),
      O => int_axi00_ptr0_reg0(8)
    );
\int_axi00_ptr0[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(9),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(41),
      O => int_axi00_ptr0_reg0(9)
    );
\int_axi00_ptr0[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(10),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(42),
      O => int_axi00_ptr0_reg0(10)
    );
\int_axi00_ptr0[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(11),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(43),
      O => int_axi00_ptr0_reg0(11)
    );
\int_axi00_ptr0[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(12),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(44),
      O => int_axi00_ptr0_reg0(12)
    );
\int_axi00_ptr0[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(13),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(45),
      O => int_axi00_ptr0_reg0(13)
    );
\int_axi00_ptr0[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(14),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(46),
      O => int_axi00_ptr0_reg0(14)
    );
\int_axi00_ptr0[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(15),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(47),
      O => int_axi00_ptr0_reg0(15)
    );
\int_axi00_ptr0[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(16),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(48),
      O => int_axi00_ptr0_reg0(16)
    );
\int_axi00_ptr0[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(17),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(49),
      O => int_axi00_ptr0_reg0(17)
    );
\int_axi00_ptr0[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(4),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(4),
      O => int_axi00_ptr0_reg01_out(4)
    );
\int_axi00_ptr0[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(18),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(50),
      O => int_axi00_ptr0_reg0(18)
    );
\int_axi00_ptr0[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(19),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(51),
      O => int_axi00_ptr0_reg0(19)
    );
\int_axi00_ptr0[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(20),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(52),
      O => int_axi00_ptr0_reg0(20)
    );
\int_axi00_ptr0[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(21),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(53),
      O => int_axi00_ptr0_reg0(21)
    );
\int_axi00_ptr0[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(22),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(54),
      O => int_axi00_ptr0_reg0(22)
    );
\int_axi00_ptr0[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(23),
      I1 => WSTRB(2),
      I2 => \^axi00_ptr0\(55),
      O => int_axi00_ptr0_reg0(23)
    );
\int_axi00_ptr0[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(24),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(56),
      O => int_axi00_ptr0_reg0(24)
    );
\int_axi00_ptr0[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(25),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(57),
      O => int_axi00_ptr0_reg0(25)
    );
\int_axi00_ptr0[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(26),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(58),
      O => int_axi00_ptr0_reg0(26)
    );
\int_axi00_ptr0[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(27),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(59),
      O => int_axi00_ptr0_reg0(27)
    );
\int_axi00_ptr0[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(5),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(5),
      O => int_axi00_ptr0_reg01_out(5)
    );
\int_axi00_ptr0[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(28),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(60),
      O => int_axi00_ptr0_reg0(28)
    );
\int_axi00_ptr0[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(29),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(61),
      O => int_axi00_ptr0_reg0(29)
    );
\int_axi00_ptr0[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(30),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(62),
      O => int_axi00_ptr0_reg0(30)
    );
\int_axi00_ptr0[63]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \waddr_reg_n_0_[2]\,
      I1 => \waddr_reg_n_0_[3]\,
      I2 => \waddr_reg_n_0_[4]\,
      I3 => \int_scalar00[31]_i_3_n_0\,
      O => \int_axi00_ptr0[63]_i_1_n_0\
    );
\int_axi00_ptr0[63]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(31),
      I1 => WSTRB(3),
      I2 => \^axi00_ptr0\(63),
      O => int_axi00_ptr0_reg0(31)
    );
\int_axi00_ptr0[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(6),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(6),
      O => int_axi00_ptr0_reg01_out(6)
    );
\int_axi00_ptr0[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(7),
      I1 => WSTRB(0),
      I2 => \^axi00_ptr0\(7),
      O => int_axi00_ptr0_reg01_out(7)
    );
\int_axi00_ptr0[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(8),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(8),
      O => int_axi00_ptr0_reg01_out(8)
    );
\int_axi00_ptr0[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(9),
      I1 => WSTRB(1),
      I2 => \^axi00_ptr0\(9),
      O => int_axi00_ptr0_reg01_out(9)
    );
\int_axi00_ptr0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(0),
      Q => \^axi00_ptr0\(0),
      R => ARESET
    );
\int_axi00_ptr0_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(10),
      Q => \^axi00_ptr0\(10),
      R => ARESET
    );
\int_axi00_ptr0_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(11),
      Q => \^axi00_ptr0\(11),
      R => ARESET
    );
\int_axi00_ptr0_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(12),
      Q => \^axi00_ptr0\(12),
      R => ARESET
    );
\int_axi00_ptr0_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(13),
      Q => \^axi00_ptr0\(13),
      R => ARESET
    );
\int_axi00_ptr0_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(14),
      Q => \^axi00_ptr0\(14),
      R => ARESET
    );
\int_axi00_ptr0_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(15),
      Q => \^axi00_ptr0\(15),
      R => ARESET
    );
\int_axi00_ptr0_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(16),
      Q => \^axi00_ptr0\(16),
      R => ARESET
    );
\int_axi00_ptr0_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(17),
      Q => \^axi00_ptr0\(17),
      R => ARESET
    );
\int_axi00_ptr0_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(18),
      Q => \^axi00_ptr0\(18),
      R => ARESET
    );
\int_axi00_ptr0_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(19),
      Q => \^axi00_ptr0\(19),
      R => ARESET
    );
\int_axi00_ptr0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(1),
      Q => \^axi00_ptr0\(1),
      R => ARESET
    );
\int_axi00_ptr0_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(20),
      Q => \^axi00_ptr0\(20),
      R => ARESET
    );
\int_axi00_ptr0_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(21),
      Q => \^axi00_ptr0\(21),
      R => ARESET
    );
\int_axi00_ptr0_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(22),
      Q => \^axi00_ptr0\(22),
      R => ARESET
    );
\int_axi00_ptr0_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(23),
      Q => \^axi00_ptr0\(23),
      R => ARESET
    );
\int_axi00_ptr0_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(24),
      Q => \^axi00_ptr0\(24),
      R => ARESET
    );
\int_axi00_ptr0_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(25),
      Q => \^axi00_ptr0\(25),
      R => ARESET
    );
\int_axi00_ptr0_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(26),
      Q => \^axi00_ptr0\(26),
      R => ARESET
    );
\int_axi00_ptr0_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(27),
      Q => \^axi00_ptr0\(27),
      R => ARESET
    );
\int_axi00_ptr0_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(28),
      Q => \^axi00_ptr0\(28),
      R => ARESET
    );
\int_axi00_ptr0_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(29),
      Q => \^axi00_ptr0\(29),
      R => ARESET
    );
\int_axi00_ptr0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(2),
      Q => \^axi00_ptr0\(2),
      R => ARESET
    );
\int_axi00_ptr0_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(30),
      Q => \^axi00_ptr0\(30),
      R => ARESET
    );
\int_axi00_ptr0_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(31),
      Q => \^axi00_ptr0\(31),
      R => ARESET
    );
\int_axi00_ptr0_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(0),
      Q => \^axi00_ptr0\(32),
      R => ARESET
    );
\int_axi00_ptr0_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(1),
      Q => \^axi00_ptr0\(33),
      R => ARESET
    );
\int_axi00_ptr0_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(2),
      Q => \^axi00_ptr0\(34),
      R => ARESET
    );
\int_axi00_ptr0_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(3),
      Q => \^axi00_ptr0\(35),
      R => ARESET
    );
\int_axi00_ptr0_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(4),
      Q => \^axi00_ptr0\(36),
      R => ARESET
    );
\int_axi00_ptr0_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(5),
      Q => \^axi00_ptr0\(37),
      R => ARESET
    );
\int_axi00_ptr0_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(6),
      Q => \^axi00_ptr0\(38),
      R => ARESET
    );
\int_axi00_ptr0_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(7),
      Q => \^axi00_ptr0\(39),
      R => ARESET
    );
\int_axi00_ptr0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(3),
      Q => \^axi00_ptr0\(3),
      R => ARESET
    );
\int_axi00_ptr0_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(8),
      Q => \^axi00_ptr0\(40),
      R => ARESET
    );
\int_axi00_ptr0_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(9),
      Q => \^axi00_ptr0\(41),
      R => ARESET
    );
\int_axi00_ptr0_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(10),
      Q => \^axi00_ptr0\(42),
      R => ARESET
    );
\int_axi00_ptr0_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(11),
      Q => \^axi00_ptr0\(43),
      R => ARESET
    );
\int_axi00_ptr0_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(12),
      Q => \^axi00_ptr0\(44),
      R => ARESET
    );
\int_axi00_ptr0_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(13),
      Q => \^axi00_ptr0\(45),
      R => ARESET
    );
\int_axi00_ptr0_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(14),
      Q => \^axi00_ptr0\(46),
      R => ARESET
    );
\int_axi00_ptr0_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(15),
      Q => \^axi00_ptr0\(47),
      R => ARESET
    );
\int_axi00_ptr0_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(16),
      Q => \^axi00_ptr0\(48),
      R => ARESET
    );
\int_axi00_ptr0_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(17),
      Q => \^axi00_ptr0\(49),
      R => ARESET
    );
\int_axi00_ptr0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(4),
      Q => \^axi00_ptr0\(4),
      R => ARESET
    );
\int_axi00_ptr0_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(18),
      Q => \^axi00_ptr0\(50),
      R => ARESET
    );
\int_axi00_ptr0_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(19),
      Q => \^axi00_ptr0\(51),
      R => ARESET
    );
\int_axi00_ptr0_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(20),
      Q => \^axi00_ptr0\(52),
      R => ARESET
    );
\int_axi00_ptr0_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(21),
      Q => \^axi00_ptr0\(53),
      R => ARESET
    );
\int_axi00_ptr0_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(22),
      Q => \^axi00_ptr0\(54),
      R => ARESET
    );
\int_axi00_ptr0_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(23),
      Q => \^axi00_ptr0\(55),
      R => ARESET
    );
\int_axi00_ptr0_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(24),
      Q => \^axi00_ptr0\(56),
      R => ARESET
    );
\int_axi00_ptr0_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(25),
      Q => \^axi00_ptr0\(57),
      R => ARESET
    );
\int_axi00_ptr0_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(26),
      Q => \^axi00_ptr0\(58),
      R => ARESET
    );
\int_axi00_ptr0_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(27),
      Q => \^axi00_ptr0\(59),
      R => ARESET
    );
\int_axi00_ptr0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(5),
      Q => \^axi00_ptr0\(5),
      R => ARESET
    );
\int_axi00_ptr0_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(28),
      Q => \^axi00_ptr0\(60),
      R => ARESET
    );
\int_axi00_ptr0_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(29),
      Q => \^axi00_ptr0\(61),
      R => ARESET
    );
\int_axi00_ptr0_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(30),
      Q => \^axi00_ptr0\(62),
      R => ARESET
    );
\int_axi00_ptr0_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => \int_axi00_ptr0[63]_i_1_n_0\,
      D => int_axi00_ptr0_reg0(31),
      Q => \^axi00_ptr0\(63),
      R => ARESET
    );
\int_axi00_ptr0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(6),
      Q => \^axi00_ptr0\(6),
      R => ARESET
    );
\int_axi00_ptr0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(7),
      Q => \^axi00_ptr0\(7),
      R => ARESET
    );
\int_axi00_ptr0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(8),
      Q => \^axi00_ptr0\(8),
      R => ARESET
    );
\int_axi00_ptr0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_axi00_ptr0,
      D => int_axi00_ptr0_reg01_out(9),
      Q => \^axi00_ptr0\(9),
      R => ARESET
    );
int_gie_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => WDATA(0),
      I1 => int_gie_i_2_n_0,
      I2 => \waddr_reg_n_0_[2]\,
      I3 => \waddr_reg_n_0_[3]\,
      I4 => \int_scalar00[31]_i_3_n_0\,
      I5 => int_gie_reg_n_0,
      O => int_gie_i_1_n_0
    );
int_gie_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => WSTRB(0),
      I1 => \waddr_reg_n_0_[4]\,
      O => int_gie_i_2_n_0
    );
int_gie_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => int_gie_i_1_n_0,
      Q => int_gie_reg_n_0,
      R => ARESET
    );
\int_ier[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => \waddr_reg_n_0_[3]\,
      I1 => WSTRB(0),
      I2 => \waddr_reg_n_0_[4]\,
      I3 => \waddr_reg_n_0_[2]\,
      I4 => \int_scalar00[31]_i_3_n_0\,
      O => int_ier9_out
    );
\int_ier_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_ier9_out,
      D => WDATA(0),
      Q => \int_ier_reg_n_0_[0]\,
      R => ARESET
    );
\int_ier_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_ier9_out,
      D => WDATA(1),
      Q => p_0_in_0,
      R => ARESET
    );
\int_isr[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7777777F8888888"
    )
        port map (
      I0 => WDATA(0),
      I1 => int_isr6_out,
      I2 => \int_ier_reg_n_0_[0]\,
      I3 => ap_done,
      I4 => ACLK_EN,
      I5 => \int_isr_reg_n_0_[0]\,
      O => \int_isr[0]_i_1_n_0\
    );
\int_isr[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => WSTRB(0),
      I1 => \waddr_reg_n_0_[4]\,
      I2 => \waddr_reg_n_0_[2]\,
      I3 => \waddr_reg_n_0_[3]\,
      I4 => \int_scalar00[31]_i_3_n_0\,
      O => int_isr6_out
    );
\int_isr[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7777777F8888888"
    )
        port map (
      I0 => WDATA(1),
      I1 => int_isr6_out,
      I2 => p_0_in_0,
      I3 => ap_ready,
      I4 => ACLK_EN,
      I5 => p_1_in,
      O => \int_isr[1]_i_1_n_0\
    );
\int_isr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => \int_isr[0]_i_1_n_0\,
      Q => \int_isr_reg_n_0_[0]\,
      R => ARESET
    );
\int_isr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => '1',
      D => \int_isr[1]_i_1_n_0\,
      Q => p_1_in,
      R => ARESET
    );
\int_scalar00[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(0),
      I1 => WSTRB(0),
      I2 => \^scalar00\(0),
      O => int_scalar000(0)
    );
\int_scalar00[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(10),
      I1 => WSTRB(1),
      I2 => \^scalar00\(10),
      O => int_scalar000(10)
    );
\int_scalar00[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(11),
      I1 => WSTRB(1),
      I2 => \^scalar00\(11),
      O => int_scalar000(11)
    );
\int_scalar00[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(12),
      I1 => WSTRB(1),
      I2 => \^scalar00\(12),
      O => int_scalar000(12)
    );
\int_scalar00[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(13),
      I1 => WSTRB(1),
      I2 => \^scalar00\(13),
      O => int_scalar000(13)
    );
\int_scalar00[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(14),
      I1 => WSTRB(1),
      I2 => \^scalar00\(14),
      O => int_scalar000(14)
    );
\int_scalar00[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(15),
      I1 => WSTRB(1),
      I2 => \^scalar00\(15),
      O => int_scalar000(15)
    );
\int_scalar00[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(16),
      I1 => WSTRB(2),
      I2 => \^scalar00\(16),
      O => int_scalar000(16)
    );
\int_scalar00[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(17),
      I1 => WSTRB(2),
      I2 => \^scalar00\(17),
      O => int_scalar000(17)
    );
\int_scalar00[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(18),
      I1 => WSTRB(2),
      I2 => \^scalar00\(18),
      O => int_scalar000(18)
    );
\int_scalar00[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(19),
      I1 => WSTRB(2),
      I2 => \^scalar00\(19),
      O => int_scalar000(19)
    );
\int_scalar00[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(1),
      I1 => WSTRB(0),
      I2 => \^scalar00\(1),
      O => int_scalar000(1)
    );
\int_scalar00[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(20),
      I1 => WSTRB(2),
      I2 => \^scalar00\(20),
      O => int_scalar000(20)
    );
\int_scalar00[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(21),
      I1 => WSTRB(2),
      I2 => \^scalar00\(21),
      O => int_scalar000(21)
    );
\int_scalar00[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(22),
      I1 => WSTRB(2),
      I2 => \^scalar00\(22),
      O => int_scalar000(22)
    );
\int_scalar00[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(23),
      I1 => WSTRB(2),
      I2 => \^scalar00\(23),
      O => int_scalar000(23)
    );
\int_scalar00[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(24),
      I1 => WSTRB(3),
      I2 => \^scalar00\(24),
      O => int_scalar000(24)
    );
\int_scalar00[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(25),
      I1 => WSTRB(3),
      I2 => \^scalar00\(25),
      O => int_scalar000(25)
    );
\int_scalar00[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(26),
      I1 => WSTRB(3),
      I2 => \^scalar00\(26),
      O => int_scalar000(26)
    );
\int_scalar00[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(27),
      I1 => WSTRB(3),
      I2 => \^scalar00\(27),
      O => int_scalar000(27)
    );
\int_scalar00[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(28),
      I1 => WSTRB(3),
      I2 => \^scalar00\(28),
      O => int_scalar000(28)
    );
\int_scalar00[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(29),
      I1 => WSTRB(3),
      I2 => \^scalar00\(29),
      O => int_scalar000(29)
    );
\int_scalar00[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(2),
      I1 => WSTRB(0),
      I2 => \^scalar00\(2),
      O => int_scalar000(2)
    );
\int_scalar00[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(30),
      I1 => WSTRB(3),
      I2 => \^scalar00\(30),
      O => int_scalar000(30)
    );
\int_scalar00[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \waddr_reg_n_0_[3]\,
      I1 => \waddr_reg_n_0_[4]\,
      I2 => \waddr_reg_n_0_[2]\,
      I3 => \int_scalar00[31]_i_3_n_0\,
      O => int_scalar00
    );
\int_scalar00[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(31),
      I1 => WSTRB(3),
      I2 => \^scalar00\(31),
      O => int_scalar000(31)
    );
\int_scalar00[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
        port map (
      I0 => \waddr_reg_n_0_[0]\,
      I1 => \waddr_reg_n_0_[1]\,
      I2 => ACLK_EN,
      I3 => \waddr_reg_n_0_[5]\,
      I4 => WVALID,
      I5 => \^wready\,
      O => \int_scalar00[31]_i_3_n_0\
    );
\int_scalar00[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(3),
      I1 => WSTRB(0),
      I2 => \^scalar00\(3),
      O => int_scalar000(3)
    );
\int_scalar00[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(4),
      I1 => WSTRB(0),
      I2 => \^scalar00\(4),
      O => int_scalar000(4)
    );
\int_scalar00[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(5),
      I1 => WSTRB(0),
      I2 => \^scalar00\(5),
      O => int_scalar000(5)
    );
\int_scalar00[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(6),
      I1 => WSTRB(0),
      I2 => \^scalar00\(6),
      O => int_scalar000(6)
    );
\int_scalar00[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(7),
      I1 => WSTRB(0),
      I2 => \^scalar00\(7),
      O => int_scalar000(7)
    );
\int_scalar00[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(8),
      I1 => WSTRB(1),
      I2 => \^scalar00\(8),
      O => int_scalar000(8)
    );
\int_scalar00[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => WDATA(9),
      I1 => WSTRB(1),
      I2 => \^scalar00\(9),
      O => int_scalar000(9)
    );
\int_scalar00_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(0),
      Q => \^scalar00\(0),
      R => ARESET
    );
\int_scalar00_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(10),
      Q => \^scalar00\(10),
      R => ARESET
    );
\int_scalar00_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(11),
      Q => \^scalar00\(11),
      R => ARESET
    );
\int_scalar00_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(12),
      Q => \^scalar00\(12),
      R => ARESET
    );
\int_scalar00_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(13),
      Q => \^scalar00\(13),
      R => ARESET
    );
\int_scalar00_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(14),
      Q => \^scalar00\(14),
      R => ARESET
    );
\int_scalar00_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(15),
      Q => \^scalar00\(15),
      R => ARESET
    );
\int_scalar00_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(16),
      Q => \^scalar00\(16),
      R => ARESET
    );
\int_scalar00_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(17),
      Q => \^scalar00\(17),
      R => ARESET
    );
\int_scalar00_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(18),
      Q => \^scalar00\(18),
      R => ARESET
    );
\int_scalar00_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(19),
      Q => \^scalar00\(19),
      R => ARESET
    );
\int_scalar00_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(1),
      Q => \^scalar00\(1),
      R => ARESET
    );
\int_scalar00_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(20),
      Q => \^scalar00\(20),
      R => ARESET
    );
\int_scalar00_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(21),
      Q => \^scalar00\(21),
      R => ARESET
    );
\int_scalar00_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(22),
      Q => \^scalar00\(22),
      R => ARESET
    );
\int_scalar00_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(23),
      Q => \^scalar00\(23),
      R => ARESET
    );
\int_scalar00_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(24),
      Q => \^scalar00\(24),
      R => ARESET
    );
\int_scalar00_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(25),
      Q => \^scalar00\(25),
      R => ARESET
    );
\int_scalar00_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(26),
      Q => \^scalar00\(26),
      R => ARESET
    );
\int_scalar00_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(27),
      Q => \^scalar00\(27),
      R => ARESET
    );
\int_scalar00_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(28),
      Q => \^scalar00\(28),
      R => ARESET
    );
\int_scalar00_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(29),
      Q => \^scalar00\(29),
      R => ARESET
    );
\int_scalar00_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(2),
      Q => \^scalar00\(2),
      R => ARESET
    );
\int_scalar00_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(30),
      Q => \^scalar00\(30),
      R => ARESET
    );
\int_scalar00_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(31),
      Q => \^scalar00\(31),
      R => ARESET
    );
\int_scalar00_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(3),
      Q => \^scalar00\(3),
      R => ARESET
    );
\int_scalar00_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(4),
      Q => \^scalar00\(4),
      R => ARESET
    );
\int_scalar00_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(5),
      Q => \^scalar00\(5),
      R => ARESET
    );
\int_scalar00_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(6),
      Q => \^scalar00\(6),
      R => ARESET
    );
\int_scalar00_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(7),
      Q => \^scalar00\(7),
      R => ARESET
    );
\int_scalar00_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(8),
      Q => \^scalar00\(8),
      R => ARESET
    );
\int_scalar00_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ACLK,
      CE => int_scalar00,
      D => int_scalar000(9),
      Q => \^scalar00\(9),
      R => ARESET
    );
interrupt_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => \int_isr_reg_n_0_[0]\,
      I1 => p_1_in,
      I2 => int_gie_reg_n_0,
      O => interrupt
    );
\rdata[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEA"
    )
        port map (
      I0 => \rdata[0]_i_2_n_0\,
      I1 => \rdata[0]_i_3_n_0\,
      I2 => \^ap_start\,
      I3 => \rdata[0]_i_4_n_0\,
      O => p_0_in(0)
    );
\rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(0),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(0),
      I4 => \^axi00_ptr0\(32),
      I5 => \rdata[31]_i_5_n_0\,
      O => \rdata[0]_i_2_n_0\
    );
\rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => ARADDR(2),
      I1 => ARADDR(5),
      I2 => ARADDR(0),
      I3 => ARADDR(1),
      I4 => ARADDR(4),
      I5 => ARADDR(3),
      O => \rdata[0]_i_3_n_0\
    );
\rdata[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEC0000022C00000"
    )
        port map (
      I0 => \int_ier_reg_n_0_[0]\,
      I1 => ARADDR(2),
      I2 => int_gie_reg_n_0,
      I3 => ARADDR(3),
      I4 => \rdata[1]_i_4_n_0\,
      I5 => \int_isr_reg_n_0_[0]\,
      O => \rdata[0]_i_4_n_0\
    );
\rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(10),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(10),
      I4 => \^axi00_ptr0\(42),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(10)
    );
\rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(11),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(11),
      I4 => \^axi00_ptr0\(43),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(11)
    );
\rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(12),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(12),
      I4 => \^axi00_ptr0\(44),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(12)
    );
\rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(13),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(13),
      I4 => \^axi00_ptr0\(45),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(13)
    );
\rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(14),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(14),
      I4 => \^axi00_ptr0\(46),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(14)
    );
\rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(15),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(15),
      I4 => \^axi00_ptr0\(47),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(15)
    );
\rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(16),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(16),
      I4 => \^axi00_ptr0\(48),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(16)
    );
\rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(17),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(17),
      I4 => \^axi00_ptr0\(49),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(17)
    );
\rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(18),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(18),
      I4 => \^axi00_ptr0\(50),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(18)
    );
\rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(19),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(19),
      I4 => \^axi00_ptr0\(51),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(19)
    );
\rdata[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEA"
    )
        port map (
      I0 => \rdata[1]_i_2_n_0\,
      I1 => \rdata[31]_i_5_n_0\,
      I2 => \^axi00_ptr0\(33),
      I3 => \rdata[1]_i_3_n_0\,
      O => p_0_in(1)
    );
\rdata[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0800080"
    )
        port map (
      I0 => p_0_in_0,
      I1 => \rdata[1]_i_4_n_0\,
      I2 => ARADDR(3),
      I3 => ARADDR(2),
      I4 => p_1_in,
      O => \rdata[1]_i_2_n_0\
    );
\rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[0]_i_3_n_0\,
      I1 => data0(1),
      I2 => \rdata[31]_i_3_n_0\,
      I3 => \^scalar00\(1),
      I4 => \^axi00_ptr0\(1),
      I5 => \rdata[31]_i_4_n_0\,
      O => \rdata[1]_i_3_n_0\
    );
\rdata[1]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => ARADDR(5),
      I1 => ARADDR(0),
      I2 => ARADDR(1),
      I3 => ARADDR(4),
      O => \rdata[1]_i_4_n_0\
    );
\rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(20),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(20),
      I4 => \^axi00_ptr0\(52),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(20)
    );
\rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(21),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(21),
      I4 => \^axi00_ptr0\(53),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(21)
    );
\rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(22),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(22),
      I4 => \^axi00_ptr0\(54),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(22)
    );
\rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(23),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(23),
      I4 => \^axi00_ptr0\(55),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(23)
    );
\rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(24),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(24),
      I4 => \^axi00_ptr0\(56),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(24)
    );
\rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(25),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(25),
      I4 => \^axi00_ptr0\(57),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(25)
    );
\rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(26),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(26),
      I4 => \^axi00_ptr0\(58),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(26)
    );
\rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(27),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(27),
      I4 => \^axi00_ptr0\(59),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(27)
    );
\rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(28),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(28),
      I4 => \^axi00_ptr0\(60),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(28)
    );
\rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(29),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(29),
      I4 => \^axi00_ptr0\(61),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(29)
    );
\rdata[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \^axi00_ptr0\(34),
      I1 => \rdata[31]_i_5_n_0\,
      I2 => \rdata[2]_i_2_n_0\,
      O => p_0_in(2)
    );
\rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[0]_i_3_n_0\,
      I1 => data0(2),
      I2 => \rdata[31]_i_3_n_0\,
      I3 => \^scalar00\(2),
      I4 => \^axi00_ptr0\(2),
      I5 => \rdata[31]_i_4_n_0\,
      O => \rdata[2]_i_2_n_0\
    );
\rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(30),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(30),
      I4 => \^axi00_ptr0\(62),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(30)
    );
\rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^arready\,
      I1 => ARVALID,
      I2 => ACLK_EN,
      O => \^rdata\
    );
\rdata[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(31),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(31),
      I4 => \^axi00_ptr0\(63),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(31)
    );
\rdata[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => ARADDR(2),
      I1 => ARADDR(5),
      I2 => ARADDR(0),
      I3 => ARADDR(1),
      I4 => ARADDR(4),
      I5 => ARADDR(3),
      O => \rdata[31]_i_3_n_0\
    );
\rdata[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => ARADDR(2),
      I1 => ARADDR(5),
      I2 => ARADDR(0),
      I3 => ARADDR(1),
      I4 => ARADDR(4),
      I5 => ARADDR(3),
      O => \rdata[31]_i_4_n_0\
    );
\rdata[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => ARADDR(3),
      I1 => ARADDR(2),
      I2 => ARADDR(4),
      I3 => ARADDR(1),
      I4 => ARADDR(0),
      I5 => ARADDR(5),
      O => \rdata[31]_i_5_n_0\
    );
\rdata[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \^axi00_ptr0\(35),
      I1 => \rdata[31]_i_5_n_0\,
      I2 => \rdata[3]_i_2_n_0\,
      O => p_0_in(3)
    );
\rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[0]_i_3_n_0\,
      I1 => data0(3),
      I2 => \rdata[31]_i_3_n_0\,
      I3 => \^scalar00\(3),
      I4 => \^axi00_ptr0\(3),
      I5 => \rdata[31]_i_4_n_0\,
      O => \rdata[3]_i_2_n_0\
    );
\rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(4),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(4),
      I4 => \^axi00_ptr0\(36),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(4)
    );
\rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(5),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(5),
      I4 => \^axi00_ptr0\(37),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(5)
    );
\rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(6),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(6),
      I4 => \^axi00_ptr0\(38),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(6)
    );
\rdata[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \^axi00_ptr0\(39),
      I1 => \rdata[31]_i_5_n_0\,
      I2 => \rdata[7]_i_2_n_0\,
      O => p_0_in(7)
    );
\rdata[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[0]_i_3_n_0\,
      I1 => data0(7),
      I2 => \rdata[31]_i_3_n_0\,
      I3 => \^scalar00\(7),
      I4 => \^axi00_ptr0\(7),
      I5 => \rdata[31]_i_4_n_0\,
      O => \rdata[7]_i_2_n_0\
    );
\rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(8),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(8),
      I4 => \^axi00_ptr0\(40),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(8)
    );
\rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \^scalar00\(9),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \^axi00_ptr0\(9),
      I4 => \^axi00_ptr0\(41),
      I5 => \rdata[31]_i_5_n_0\,
      O => p_0_in(9)
    );
\rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(0),
      Q => RDATA(0),
      R => '0'
    );
\rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(10),
      Q => RDATA(10),
      R => '0'
    );
\rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(11),
      Q => RDATA(11),
      R => '0'
    );
\rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(12),
      Q => RDATA(12),
      R => '0'
    );
\rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(13),
      Q => RDATA(13),
      R => '0'
    );
\rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(14),
      Q => RDATA(14),
      R => '0'
    );
\rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(15),
      Q => RDATA(15),
      R => '0'
    );
\rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(16),
      Q => RDATA(16),
      R => '0'
    );
\rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(17),
      Q => RDATA(17),
      R => '0'
    );
\rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(18),
      Q => RDATA(18),
      R => '0'
    );
\rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(19),
      Q => RDATA(19),
      R => '0'
    );
\rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(1),
      Q => RDATA(1),
      R => '0'
    );
\rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(20),
      Q => RDATA(20),
      R => '0'
    );
\rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(21),
      Q => RDATA(21),
      R => '0'
    );
\rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(22),
      Q => RDATA(22),
      R => '0'
    );
\rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(23),
      Q => RDATA(23),
      R => '0'
    );
\rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(24),
      Q => RDATA(24),
      R => '0'
    );
\rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(25),
      Q => RDATA(25),
      R => '0'
    );
\rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(26),
      Q => RDATA(26),
      R => '0'
    );
\rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(27),
      Q => RDATA(27),
      R => '0'
    );
\rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(28),
      Q => RDATA(28),
      R => '0'
    );
\rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(29),
      Q => RDATA(29),
      R => '0'
    );
\rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(2),
      Q => RDATA(2),
      R => '0'
    );
\rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(30),
      Q => RDATA(30),
      R => '0'
    );
\rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(31),
      Q => RDATA(31),
      R => '0'
    );
\rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(3),
      Q => RDATA(3),
      R => '0'
    );
\rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(4),
      Q => RDATA(4),
      R => '0'
    );
\rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(5),
      Q => RDATA(5),
      R => '0'
    );
\rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(6),
      Q => RDATA(6),
      R => '0'
    );
\rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(7),
      Q => RDATA(7),
      R => '0'
    );
\rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(8),
      Q => RDATA(8),
      R => '0'
    );
\rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => \^rdata\,
      D => p_0_in(9),
      Q => RDATA(9),
      R => '0'
    );
\waddr[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ACLK_EN,
      I1 => \^awready\,
      I2 => AWVALID,
      O => waddr
    );
\waddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => waddr,
      D => AWADDR(0),
      Q => \waddr_reg_n_0_[0]\,
      R => '0'
    );
\waddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => waddr,
      D => AWADDR(1),
      Q => \waddr_reg_n_0_[1]\,
      R => '0'
    );
\waddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => waddr,
      D => AWADDR(2),
      Q => \waddr_reg_n_0_[2]\,
      R => '0'
    );
\waddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => waddr,
      D => AWADDR(3),
      Q => \waddr_reg_n_0_[3]\,
      R => '0'
    );
\waddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => waddr,
      D => AWADDR(4),
      Q => \waddr_reg_n_0_[4]\,
      R => '0'
    );
\waddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ACLK,
      CE => waddr,
      D => AWADDR(5),
      Q => \waddr_reg_n_0_[5]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_rtl_kernel_wizard_0_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESET : in STD_LOGIC;
    ACLK_EN : in STD_LOGIC;
    AWADDR : in STD_LOGIC_VECTOR ( 11 downto 0 );
    AWVALID : in STD_LOGIC;
    AWREADY : out STD_LOGIC;
    WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    WVALID : in STD_LOGIC;
    WREADY : out STD_LOGIC;
    BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    BVALID : out STD_LOGIC;
    BREADY : in STD_LOGIC;
    ARADDR : in STD_LOGIC_VECTOR ( 11 downto 0 );
    ARVALID : in STD_LOGIC;
    ARREADY : out STD_LOGIC;
    RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    RVALID : out STD_LOGIC;
    RREADY : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    scalar00 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi00_ptr0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ap_start : out STD_LOGIC;
    ap_done : in STD_LOGIC;
    ap_ready : in STD_LOGIC;
    ap_idle : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_rtl_kernel_wizard_0_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_rtl_kernel_wizard_0_0_0 : entity is "design_1_rtl_kernel_wizard_0_0_0,rtl_kernel_wizard_0_control_s_axi,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_rtl_kernel_wizard_0_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_rtl_kernel_wizard_0_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_rtl_kernel_wizard_0_0_0 : entity is "rtl_kernel_wizard_0_control_s_axi,Vivado 2020.2";
end design_1_rtl_kernel_wizard_0_0_0;

architecture STRUCTURE of design_1_rtl_kernel_wizard_0_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ACLK : signal is "xilinx.com:signal:clock:1.0 ACLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ACLK : signal is "XIL_INTERFACENAME ACLK, ASSOCIATED_BUSIF interface_aximm, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ARREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARREADY";
  attribute X_INTERFACE_INFO of ARVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARVALID";
  attribute X_INTERFACE_INFO of AWREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWREADY";
  attribute X_INTERFACE_INFO of AWVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWVALID";
  attribute X_INTERFACE_INFO of BREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BREADY";
  attribute X_INTERFACE_INFO of BVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BVALID";
  attribute X_INTERFACE_INFO of RREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RREADY";
  attribute X_INTERFACE_PARAMETER of RREADY : signal is "XIL_INTERFACENAME interface_aximm, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 12, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of RVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RVALID";
  attribute X_INTERFACE_INFO of WREADY : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WREADY";
  attribute X_INTERFACE_INFO of WVALID : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WVALID";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute X_INTERFACE_INFO of ARADDR : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARADDR";
  attribute X_INTERFACE_INFO of AWADDR : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWADDR";
  attribute X_INTERFACE_INFO of BRESP : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BRESP";
  attribute X_INTERFACE_INFO of RDATA : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RDATA";
  attribute X_INTERFACE_INFO of RRESP : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RRESP";
  attribute X_INTERFACE_INFO of WDATA : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WDATA";
  attribute X_INTERFACE_INFO of WSTRB : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WSTRB";
begin
  BRESP(1) <= \<const0>\;
  BRESP(0) <= \<const0>\;
  RRESP(1) <= \<const0>\;
  RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_rtl_kernel_wizard_0_0_0_rtl_kernel_wizard_0_control_s_axi
     port map (
      ACLK => ACLK,
      ACLK_EN => ACLK_EN,
      ARADDR(5 downto 0) => ARADDR(5 downto 0),
      ARESET => ARESET,
      ARREADY => ARREADY,
      ARVALID => ARVALID,
      AWADDR(5 downto 0) => AWADDR(5 downto 0),
      AWREADY => AWREADY,
      AWVALID => AWVALID,
      BREADY => BREADY,
      BVALID => BVALID,
      RDATA(31 downto 0) => RDATA(31 downto 0),
      RREADY => RREADY,
      RVALID => RVALID,
      WDATA(31 downto 0) => WDATA(31 downto 0),
      WREADY => WREADY,
      WSTRB(3 downto 0) => WSTRB(3 downto 0),
      WVALID => WVALID,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_start => ap_start,
      axi00_ptr0(63 downto 0) => axi00_ptr0(63 downto 0),
      interrupt => interrupt,
      scalar00(31 downto 0) => scalar00(31 downto 0)
    );
end STRUCTURE;
