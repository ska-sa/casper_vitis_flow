-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Tue Mar 16 18:21:50 2021
-- Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_rtl_kernel_wizard_0_0_0/design_1_rtl_kernel_wizard_0_0_0_stub.vhdl
-- Design      : design_1_rtl_kernel_wizard_0_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_rtl_kernel_wizard_0_0_0 is
  Port ( 
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

end design_1_rtl_kernel_wizard_0_0_0;

architecture stub of design_1_rtl_kernel_wizard_0_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ACLK,ARESET,ACLK_EN,AWADDR[11:0],AWVALID,AWREADY,WDATA[31:0],WSTRB[3:0],WVALID,WREADY,BRESP[1:0],BVALID,BREADY,ARADDR[11:0],ARVALID,ARREADY,RDATA[31:0],RRESP[1:0],RVALID,RREADY,interrupt,scalar00[31:0],axi00_ptr0[63:0],ap_start,ap_done,ap_ready,ap_idle";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rtl_kernel_wizard_0_control_s_axi,Vivado 2020.2";
begin
end;
