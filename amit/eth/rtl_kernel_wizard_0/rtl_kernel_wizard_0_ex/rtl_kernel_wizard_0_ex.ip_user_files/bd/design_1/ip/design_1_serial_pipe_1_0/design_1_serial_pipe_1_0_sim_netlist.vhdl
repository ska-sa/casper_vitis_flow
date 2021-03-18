-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Tue Mar 16 17:56:06 2021
-- Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_serial_pipe_1_0/design_1_serial_pipe_1_0_sim_netlist.vhdl
-- Design      : design_1_serial_pipe_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_serial_pipe_1_0_serial_pipe is
  port (
    serial_out : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst_s_n : in STD_LOGIC;
    en : in STD_LOGIC;
    serial_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_serial_pipe_1_0_serial_pipe : entity is "serial_pipe";
end design_1_serial_pipe_1_0_serial_pipe;

architecture STRUCTURE of design_1_serial_pipe_1_0_serial_pipe is
  signal \^serial_out\ : STD_LOGIC;
  signal \sr_eq1.serial_out_i_1_n_0\ : STD_LOGIC;
begin
  serial_out <= \^serial_out\;
\sr_eq1.serial_out_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => rst_s_n,
      I1 => \^serial_out\,
      I2 => en,
      I3 => serial_in,
      O => \sr_eq1.serial_out_i_1_n_0\
    );
\sr_eq1.serial_out_reg\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \sr_eq1.serial_out_i_1_n_0\,
      Q => \^serial_out\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_serial_pipe_1_0 is
  port (
    clk : in STD_LOGIC;
    rst_s_n : in STD_LOGIC;
    en : in STD_LOGIC;
    serial_in : in STD_LOGIC;
    serial_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_serial_pipe_1_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_serial_pipe_1_0 : entity is "design_1_serial_pipe_1_0,serial_pipe,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_serial_pipe_1_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_serial_pipe_1_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_serial_pipe_1_0 : entity is "serial_pipe,Vivado 2020.2";
end design_1_serial_pipe_1_0;

architecture STRUCTURE of design_1_serial_pipe_1_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_1_0_gt_txusrclk2, INSERT_VIP 0";
begin
inst: entity work.design_1_serial_pipe_1_0_serial_pipe
     port map (
      clk => clk,
      en => en,
      rst_s_n => rst_s_n,
      serial_in => serial_in,
      serial_out => serial_out
    );
end STRUCTURE;
