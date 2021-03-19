-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Fri Mar 19 09:59:26 2021
-- Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_1_ex/rtl_kernel_wizard_1_ex.gen/sources_1/bd/design_1/ip/design_1_serial_pipe_1_0/design_1_serial_pipe_1_0_stub.vhdl
-- Design      : design_1_serial_pipe_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_serial_pipe_1_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_s_n : in STD_LOGIC;
    en : in STD_LOGIC;
    serial_in : in STD_LOGIC;
    serial_out : out STD_LOGIC
  );

end design_1_serial_pipe_1_0;

architecture stub of design_1_serial_pipe_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_s_n,en,serial_in,serial_out";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "serial_pipe,Vivado 2020.2";
begin
end;
