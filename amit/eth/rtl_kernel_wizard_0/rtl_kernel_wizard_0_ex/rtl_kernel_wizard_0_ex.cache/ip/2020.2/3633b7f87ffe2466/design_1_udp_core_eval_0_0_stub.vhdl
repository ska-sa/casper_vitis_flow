-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Tue Mar 16 17:56:21 2021
-- Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_udp_core_eval_0_0_stub.vhdl
-- Design      : design_1_udp_core_eval_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    axi4lite_aclk : in STD_LOGIC;
    axi4lite_aresetn : in STD_LOGIC;
    axi4lite_arready : out STD_LOGIC;
    axi4lite_arvalid : in STD_LOGIC;
    axi4lite_awready : out STD_LOGIC;
    axi4lite_awvalid : in STD_LOGIC;
    axi4lite_bready : in STD_LOGIC;
    axi4lite_bvalid : out STD_LOGIC;
    axi4lite_rready : in STD_LOGIC;
    axi4lite_rvalid : out STD_LOGIC;
    axi4lite_wready : out STD_LOGIC;
    axi4lite_wvalid : in STD_LOGIC;
    rx_axis_s_clk : in STD_LOGIC;
    rx_axis_s_rst : in STD_LOGIC;
    rx_axis_s_tlast : in STD_LOGIC;
    rx_axis_s_tready : out STD_LOGIC;
    rx_axis_s_tvalid : in STD_LOGIC;
    rx_core_clk : in STD_LOGIC;
    tx_axis_m_clk : in STD_LOGIC;
    tx_axis_m_rst : in STD_LOGIC;
    tx_axis_m_tlast : out STD_LOGIC;
    tx_axis_m_tready : in STD_LOGIC;
    tx_axis_m_tvalid : out STD_LOGIC;
    tx_core_clk : in STD_LOGIC;
    udp_axis_m_tlast : out STD_LOGIC;
    udp_axis_m_tready : in STD_LOGIC;
    udp_axis_m_tvalid : out STD_LOGIC;
    udp_axis_s_tlast : in STD_LOGIC;
    udp_axis_s_tready : out STD_LOGIC;
    udp_axis_s_tvalid : in STD_LOGIC;
    axi4lite_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axi4lite_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axi4lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi4lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi4lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi4lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axi4lite_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rx_axis_s_tdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    rx_axis_s_tid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_axis_s_tkeep : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rx_axis_s_tuser : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tx_axis_m_tdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    tx_axis_m_tid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_axis_m_tkeep : out STD_LOGIC_VECTOR ( 63 downto 0 );
    tx_axis_m_tuser : out STD_LOGIC_VECTOR ( 31 downto 0 );
    udp_axis_m_tdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    udp_axis_m_tid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    udp_axis_m_tkeep : out STD_LOGIC_VECTOR ( 63 downto 0 );
    udp_axis_m_tuser : out STD_LOGIC_VECTOR ( 31 downto 0 );
    udp_axis_s_tdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    udp_axis_s_tid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    udp_axis_s_tkeep : in STD_LOGIC_VECTOR ( 63 downto 0 );
    udp_axis_s_tuser : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "axi4lite_aclk,axi4lite_aresetn,axi4lite_arready,axi4lite_arvalid,axi4lite_awready,axi4lite_awvalid,axi4lite_bready,axi4lite_bvalid,axi4lite_rready,axi4lite_rvalid,axi4lite_wready,axi4lite_wvalid,rx_axis_s_clk,rx_axis_s_rst,rx_axis_s_tlast,rx_axis_s_tready,rx_axis_s_tvalid,rx_core_clk,tx_axis_m_clk,tx_axis_m_rst,tx_axis_m_tlast,tx_axis_m_tready,tx_axis_m_tvalid,tx_core_clk,udp_axis_m_tlast,udp_axis_m_tready,udp_axis_m_tvalid,udp_axis_s_tlast,udp_axis_s_tready,udp_axis_s_tvalid,axi4lite_araddr[31:0],axi4lite_awaddr[31:0],axi4lite_bresp[1:0],axi4lite_rdata[31:0],axi4lite_rresp[1:0],axi4lite_wdata[31:0],axi4lite_wstrb[3:0],rx_axis_s_tdata[511:0],rx_axis_s_tid[7:0],rx_axis_s_tkeep[63:0],rx_axis_s_tuser[31:0],tx_axis_m_tdata[511:0],tx_axis_m_tid[7:0],tx_axis_m_tkeep[63:0],tx_axis_m_tuser[31:0],udp_axis_m_tdata[511:0],udp_axis_m_tid[7:0],udp_axis_m_tkeep[63:0],udp_axis_m_tuser[31:0],udp_axis_s_tdata[511:0],udp_axis_s_tid[7:0],udp_axis_s_tkeep[63:0],udp_axis_s_tuser[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "udp_core_eval,Vivado 2020.2";
begin
end;
