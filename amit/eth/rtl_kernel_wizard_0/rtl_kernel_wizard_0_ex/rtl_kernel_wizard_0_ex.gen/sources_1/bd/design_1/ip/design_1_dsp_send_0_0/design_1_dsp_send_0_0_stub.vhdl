-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Tue Mar 16 17:56:04 2021
-- Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_dsp_send_0_0/design_1_dsp_send_0_0_stub.vhdl
-- Design      : design_1_dsp_send_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_dsp_send_0_0 is
  Port ( 
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

end design_1_dsp_send_0_0;

architecture stub of design_1_dsp_send_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,xst,usr_tx_xr,usr_rx_xr,ctl_tx_exable,ctl_tx_send_rfi,ctl_rx_exable,stat_rx_aligned,state[3:0],core_xeset";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "dsp_send,Vivado 2020.2";
begin
end;
