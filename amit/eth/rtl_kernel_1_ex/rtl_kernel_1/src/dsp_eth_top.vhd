-- dsp_eth_top.vhd	31. January 2019	by claus

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.DSP_COMPONENTS.ALL;
USE WORK.DSP_PARAMETERS.ALL;

LIBRARY UNISIM;
USE UNISIM.VComponents.all;


ENTITY dsp_eth_top IS
  PORT (
    init_clk                    : IN STD_LOGIC;
    sys_reset                   : IN STD_LOGIC;

--   AB XCU280   IF0_txusrclk2_out           : OUT STD_LOGIC;
--    IF0_gt_ref_clk_out          : OUT STD_LOGIC;
--    IF0_tx_rdyout               : OUT STD_LOGIC;

--    IF0_refclk_gty_p            : IN STD_LOGIC;
--    IF0_refclk_gty_n            : IN STD_LOGIC;

--    IF0_eth_rxn                 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--    IF0_eth_rxp                 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--    IF0_eth_txn                 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
--    IF0_eth_txp                 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

--    IF1_data               : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
--    IF1_data_valid         : IN STD_LOGIC;
--    IF1_start_packet       : IN STD_LOGIC;
    IF1_txusrclk2_out           : OUT STD_LOGIC;
    IF1_gt_ref_clk_out          : OUT STD_LOGIC;
    IF1_tx_rdyout               : OUT STD_LOGIC;

    IF1_refclk_gty_p            : IN STD_LOGIC;
    IF1_refclk_gty_n            : IN STD_LOGIC;

    IF1_eth_rxn                 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    IF1_eth_rxp                 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    IF1_eth_txn                 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    IF1_eth_txp                 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

    noisediode_off_in	        : IN  STD_LOGIC;
    use_1pps_out	        : OUT STD_LOGIC;
    test_value_out              : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    mode_edd_out	        : OUT STD_LOGIC_VECTOR( 1 DOWNTO 0);

    dclk                        : IN STD_LOGIC;
    din                         : IN STD_LOGIC_VECTOR(383 DOWNTO 0);
    din_valid                   : IN STD_LOGIC;
           
    cfg_clk                     : IN  STD_LOGIC;
    cfg_wr_en                   : IN  STD_LOGIC;
    cfg_addr                    : IN  STD_LOGIC_VECTOR( 15 DOWNTO 0);
    cfg_data_in                 : IN  STD_LOGIC_VECTOR( 31 DOWNTO 0);
    cfg_data_out                : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0);

    dmonitor_out                : OUT STD_LOGIC_VECTOR(383 DOWNTO 0);
    dmonitor_out_valid          : OUT STD_LOGIC;

      --data rx signals
   rx_clk           : OUT STD_LOGIC;
   rx_out_data      : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
   rx_out_ena       : OUT STD_LOGIC;
   rx_out_sop       : OUT STD_LOGIC;
   rx_out_eop       : OUT STD_LOGIC;
   rx_out_err       : OUT STD_LOGIC;
   rx_out_mty       : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
   
    status_out                  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    error_out                   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    clr_err_out                 : OUT STD_LOGIC
);
END dsp_eth_top;



ARCHITECTURE behaviour OF dsp_eth_top IS

    -- clocks and resets
  SIGNAL IF0_txusrclk2          : STD_LOGIC;
  SIGNAL IF1_txusrclk2          : STD_LOGIC;

  -- IF0 test generator
  SIGNAL IF0_test_data_size     : STD_LOGIC_VECTOR(  7 DOWNTO 0);
  SIGNAL IF0_test_data          : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL IF0_test_data_valid    : STD_LOGIC;
  SIGNAL IF0_test_start_packet  : STD_LOGIC;
  SIGNAL IF0_test_destination   : STD_LOGIC_VECTOR(1 DOWNTO 0);

  -- IF1 test generator
  SIGNAL IF1_test_data_size     : STD_LOGIC_VECTOR(  7 DOWNTO 0);
  SIGNAL IF1_test_data          : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL IF1_test_data_valid    : STD_LOGIC;
  SIGNAL IF1_test_start_packet  : STD_LOGIC;
  SIGNAL IF1_test_destination   : STD_LOGIC_VECTOR(1 DOWNTO 0);

  --
  SIGNAL data_size              : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL status                 : STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL mode_edd               : STD_LOGIC_VECTOR( 1 DOWNTO 0);
  SIGNAL mode_wave_data_gen     : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL ampl_wave_data_gen     : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL pre_decimation_fac     : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL deskew_val             : STD_LOGIC_VECTOR( 7 DOWNTO 0);

  SIGNAL flip_signal_spec       : STD_LOGIC;
  SIGNAL mcast_size             : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL heap_size              : STD_LOGIC_VECTOR(11 DOWNTO 0);
  
  SIGNAL use_1pps               : STD_LOGIC;
  SIGNAL data_enable1           : STD_LOGIC;
  SIGNAL data_enable2           : STD_LOGIC;
  SIGNAL sync_request           : STD_LOGIC;
  SIGNAL filter_select          : STD_LOGIC_VECTOR( 3 downto 0);
  SIGNAL sync_timestamp         : STD_LOGIC_VECTOR(63 downto 0);
  SIGNAL test_value             : STD_LOGIC_VECTOR(31 downto 0);
  SIGNAL time_at_1pps           : STD_LOGIC_VECTOR(63 downto 0);
  SIGNAL eddy_status            : STD_LOGIC_VECTOR(31 downto 0);

  SIGNAL clr_err                : STD_LOGIC;
  
  -- IF0
  SIGNAL IF0_tvg                : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL IF0_data               : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL IF0_data_valid         : STD_LOGIC;
  SIGNAL IF0_data_eof           : STD_LOGIC;
  SIGNAL IF0_data_eof_z1        : STD_LOGIC;
  SIGNAL IF0_wait_done          : STD_LOGIC;
  SIGNAL IF0_wait_done_z1       : STD_LOGIC;
  SIGNAL IF0_start_packet       : STD_LOGIC;
  SIGNAL IF0_destination        : STD_LOGIC_VECTOR( 1 DOWNTO 0);
  SIGNAL IF0_counter            : INTEGER;
  SIGNAL IF0_wait               : INTEGER; --counts to wait before sending new packet
  
  SIGNAL NumFreqOffset          : INTEGER;

  SIGNAL IF0_enable             : STD_LOGIC;
  
  SIGNAL IF0_dhcpdiscover_trig  : STD_LOGIC;
  SIGNAL IF0_arpbeat_enable     : STD_LOGIC;

  SIGNAL IF0_mcast_offs         : STD_LOGIC_VECTOR( 7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL IF0_heap_offs          : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL IF0_heap_size          : STD_LOGIC_VECTOR(47 DOWNTO 0);
  
  SIGNAL IF0_dst_mac_addr       : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL IF0_dst_ip_addr        : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IF0_src_mac_addr       : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL IF0_src_ip_addr        : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IF0_dst_udp_port       : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL IF0_src_udp_port       : STD_LOGIC_VECTOR(15 DOWNTO 0);

  SIGNAL IF0_pol_id             : STD_LOGIC_VECTOR( 1 DOWNTO 0) := "00";
  SIGNAL IF0_timestamp          : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL IF0_adc_sat_count      : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL IF0_adc_sat_flag       : STD_LOGIC;
  SIGNAL IF0_ndiode_flag        : STD_LOGIC;
 
  SIGNAL IF0_item_pointer_01    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF0_item_pointer_02    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF0_item_pointer_03    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF0_item_pointer_04    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF0_item_pointer_05    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF0_item_pointer_06    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF0_item_pointer_07    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF0_item_pointer_08    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  
  SIGNAL IF0_item_pointer_07_reg    : STD_LOGIC_VECTOR(63 DOWNTO 0);

  SIGNAL IF0_item_pointer_09    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF0_item_pointer_10    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF0_item_pointer_11    : STD_LOGIC_VECTOR(63 DOWNTO 0);

  SIGNAL IF0_status             : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IF0_data_to_buf        : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IF0_data_to_buf_wr     : STD_LOGIC;
  SIGNAL IF0_data_from_buf      : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IF0_addr_for_buf       : STD_LOGIC_VECTOR(15 DOWNTO 0);
  

  -- IF1
  SIGNAL IF1_data               : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL IF1_data_valid         : STD_LOGIC;
  SIGNAL IF1_start_packet       : STD_LOGIC;
  SIGNAL IF1_destination        : STD_LOGIC_VECTOR(1 DOWNTO 0);

  SIGNAL IF1_enable             : STD_LOGIC;

  SIGNAL IF1_dhcpdiscover_trig  : STD_LOGIC;
  SIGNAL IF1_arpbeat_enable     : STD_LOGIC;

  SIGNAL IF1_mcast_offs         : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL IF1_heap_offs          : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL IF1_heap_size          : STD_LOGIC_VECTOR(47 DOWNTO 0);
  
  SIGNAL IF1_dst_mac_addr       : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL IF1_dst_ip_addr        : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IF1_src_mac_addr       : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL IF1_src_ip_addr        : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IF1_dst_udp_port       : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL IF1_src_udp_port       : STD_LOGIC_VECTOR(15 DOWNTO 0);
 
  SIGNAL IF1_pol_id             : STD_LOGIC_VECTOR( 1 DOWNTO 0);
  SIGNAL IF1_timestamp          : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL IF1_adc_sat_count      : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL IF1_adc_sat_flag       : STD_LOGIC;
  SIGNAL IF1_ndiode_flag        : STD_LOGIC;
 
  SIGNAL IF1_item_pointer_01    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF1_item_pointer_02    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF1_item_pointer_03    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF1_item_pointer_04    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF1_item_pointer_05    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF1_item_pointer_06    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF1_item_pointer_07    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF1_item_pointer_08    : STD_LOGIC_VECTOR(63 DOWNTO 0);

  SIGNAL IF1_item_pointer_09    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF1_item_pointer_10    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  SIGNAL IF1_item_pointer_11    : STD_LOGIC_VECTOR(63 DOWNTO 0);

  SIGNAL IF1_status             : STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL IF1_data_to_buf        : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IF1_data_to_buf_wr     : STD_LOGIC;
  SIGNAL IF1_data_from_buf      : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL IF1_addr_for_buf       : STD_LOGIC_VECTOR(15 DOWNTO 0);
  
  TYPE statetype IS (
    A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13
    );

  SIGNAL heap_machine     : statetype := A0;
          
  
BEGIN

  --  AB XCU280 IF0_txusrclk2_out             <= IF0_txusrclk2;
  IF1_txusrclk2_out             <= IF1_txusrclk2;
  status_out <= IF0_status;
--  AB status_out(0)                 <= IF0_status(4);
--  status_out(1)                 <= IF1_status(4);
--  status_out(2)                 <= IF0_status(5);
--  status_out(3)                 <= IF1_status(5);
--  status_out(4)                 <= IF0_status(6);
--  status_out(5)                 <= IF1_status(6);
--  status_out( 9 DOWNTO  6)      <= IF0_status(3 DOWNTO 0);
--  status_out(13 DOWNTO 10)      <= IF1_status(3 DOWNTO 0);

--  status_out(31 DOWNTO 14)      <= status(31 DOWNTO 14);

  clr_err_out                   <= clr_err;

  
  -- IF0 TEST DATA GENERATOR
  -----------------------------------------------------------------------------
--  AB XCU280 IF0_DSP_TEST_DATA_GEN_inst : dsp_test_data_gen
--  PORT MAP(
--    clk                         => init_clk,
--    rst                         => sys_reset,
--    enable                      => IF0_enable,
--    test_data                   => IF0_test_data,
--    test_data_valid             => IF0_test_data_valid,
--    data_size                   => IF0_test_data_size,
--    start_packet                => IF0_test_start_packet,
--    destination                 => IF0_test_destination
--    );

  -- IF1 TEST DATA GENERATOR
  -----------------------------------------------------------------------------
--  IF1_DSP_TEST_DATA_GEN_inst : dsp_test_data_gen
--  PORT MAP(
--    clk                         => init_clk,
--    rst                         => sys_reset,
--    enable                      => '1',--IF1_enable,
--    test_data                   => IF1_test_data,
--    test_data_valid             => IF1_test_data_valid,
--    data_size                   => IF1_test_data_size,
--    start_packet                => IF1_test_start_packet,
--    destination                 => IF1_test_destination
--    );

  
  -- INTERFACE IF0
  -----------------------------------------------------------------------------
  IF0_DSP_ETH_inst : dsp_eth
  PORT MAP (
    init_clk                    => init_clk,
    sys_reset                   => sys_reset,
    txusrclk2                   => IF1_txusrclk2,
    gt_ref_clk_out              => IF1_gt_ref_clk_out,
    tx_rdyout                   => IF1_tx_rdyout,
    refclk_gty_p                => IF1_refclk_gty_p,
    refclk_gty_n                => IF1_refclk_gty_n,

    eth_rx1_p                   => IF1_eth_rxp(0),
    eth_rx2_p                   => IF1_eth_rxp(1),
    eth_rx3_p                   => IF1_eth_rxp(2),
    eth_rx4_p                   => IF1_eth_rxp(3),

    eth_rx1_n                   => IF1_eth_rxn(0),
    eth_rx2_n                   => IF1_eth_rxn(1),
    eth_rx3_n                   => IF1_eth_rxn(2),
    eth_rx4_n                   => IF1_eth_rxn(3),

    eth_tx1_p                   => IF1_eth_txp(0),
    eth_tx2_p                   => IF1_eth_txp(1),
    eth_tx3_p                   => IF1_eth_txp(2),
    eth_tx4_p                   => IF1_eth_txp(3),

    eth_tx1_n                   => IF1_eth_txn(0),
    eth_tx2_n                   => IF1_eth_txn(1),
    eth_tx3_n                   => IF1_eth_txn(2),
    eth_tx4_n                   => IF1_eth_txn(3),

    data_size                   => data_size,

    data_in                     => IF0_data,
    data_in_valid               => IF0_data_valid,
    start_packet                => IF0_start_packet,

--    data_size                   => IF0_test_data_size,

--    data_in                     => IF1_test_data,
--    data_in_valid               => IF1_test_data_valid,
--    start_packet                => IF1_test_start_packet,
--    destination                 => IF1_test_destination,

    status                      => IF0_status,

    enable                      => '1',--IF0_enable,

    dhcpdiscover_trig           => IF0_dhcpdiscover_trig,
    arpbeat_enable              => IF0_arpbeat_enable,

    mcast_offs                  => IF0_mcast_offs,
    heap_offs                   => (OTHERS => '0'), --IF0_heap_offs,
    heap_size                   => x"000000002000", --IF0_heap_size,

    dst_mac_addr                => IF0_dst_mac_addr,
    dst_ip_addr                 => IF0_dst_ip_addr,

    src_mac_addr                => IF0_src_mac_addr,
    src_ip_addr                 => IF0_src_ip_addr,

    dst_udp_port                => IF0_dst_udp_port,
    src_udp_port                => IF0_src_udp_port,

    pol_id                      => b"00",-- & IF0_pol_id(0),
    timestamp                   => IF0_timestamp,
    adc_sat_count               => IF0_adc_sat_count,
    adc_sat_flag                => IF0_adc_sat_flag,
    ndiode_flag                 => IF0_ndiode_flag,

    item_pointer_01             => IF0_item_pointer_01,
    item_pointer_02             => IF0_item_pointer_02,
    item_pointer_03             => IF0_item_pointer_03,
    item_pointer_04             => IF0_item_pointer_04,
    item_pointer_05             => IF0_item_pointer_05,
    item_pointer_06             => IF0_item_pointer_06,
    item_pointer_07             => IF0_item_pointer_07_reg, -- freq update for alveo design
    item_pointer_08             => IF0_item_pointer_08,
    item_pointer_09             => IF0_item_pointer_09,
    item_pointer_10             => IF0_item_pointer_10,
    item_pointer_11             => IF0_item_pointer_11,
    data_to_buf                 => IF0_data_to_buf,
    data_to_buf_wr              => IF0_data_to_buf_wr,
    data_from_buf               => IF0_data_from_buf,
    addr_for_buf                => IF0_addr_for_buf,
    
   
   rx_clk                       => rx_clk , 
   rx_out_data                    => rx_out_data,
   rx_out_ena                   => rx_out_ena,
   rx_out_sop                   => rx_out_sop,
   rx_out_eop                   => rx_out_eop,
   rx_out_err                    => rx_out_err,
   rx_out_mty                   => rx_out_mty,

    clr_err                     => clr_err
    );      


  -- INTERFACE IF1
  -----------------------------------------------------------------------------
--  IF1_DSP_ETH_inst : dsp_eth
--  PORT MAP (
--    init_clk                    => init_clk,
--    sys_reset                   => sys_reset,
--    txusrclk2                   => IF1_txusrclk2,
--    gt_ref_clk_out              => IF1_gt_ref_clk_out,
--    tx_rdyout                   => IF1_tx_rdyout,
--    refclk_gty_p                => IF1_refclk_gty_p,
--    refclk_gty_n                => IF1_refclk_gty_n,

--    eth_rx1_p                   => IF1_eth_rxp(0),
--    eth_rx2_p                   => IF1_eth_rxp(1),
--    eth_rx3_p                   => IF1_eth_rxp(2),
--    eth_rx4_p                   => IF1_eth_rxp(3),

--    eth_rx1_n                   => IF1_eth_rxn(0),
--    eth_rx2_n                   => IF1_eth_rxn(1),
--    eth_rx3_n                   => IF1_eth_rxn(2),
--    eth_rx4_n                   => IF1_eth_rxn(3),

--    eth_tx1_p                   => IF1_eth_txp(0),
--    eth_tx2_p                   => IF1_eth_txp(1),
--    eth_tx3_p                   => IF1_eth_txp(2),
--    eth_tx4_p                   => IF1_eth_txp(3),

--    eth_tx1_n                   => IF1_eth_txn(0),
--    eth_tx2_n                   => IF1_eth_txn(1),
--    eth_tx3_n                   => IF1_eth_txn(2),
--    eth_tx4_n                   => IF1_eth_txn(3),

--    data_size                   => data_size,

--    data_in                     => IF1_data,
--    data_in_valid               => IF1_data_valid,
--    start_packet                => IF1_start_packet,

----    data_size                   => IF1_test_data_size,

----    data_in                     => IF1_test_data,
----    data_in_valid               => IF1_test_data_valid,
----    start_packet                => IF1_test_start_packet,
----    destination                 => IF1_test_destination,

--    status                      => IF1_status,

--    enable                      => '1', --IF1_ENABLE

--    dhcpdiscover_trig           => IF1_dhcpdiscover_trig,
--    arpbeat_enable              => IF1_arpbeat_enable,

--    mcast_offs                  => IF1_mcast_offs,
--    heap_offs                   => IF1_heap_offs,
--    heap_size                   => IF1_heap_size,

--    dst_mac_addr                => IF1_dst_mac_addr,
--    dst_ip_addr                 => IF1_dst_ip_addr,

--    src_mac_addr                => IF1_src_mac_addr,
--    src_ip_addr                 => IF1_src_ip_addr,

--    dst_udp_port                => IF1_dst_udp_port,
--    src_udp_port                => IF1_src_udp_port,

--    pol_id                      => b"00" ,--& IF1_pol_id(0),
--    timestamp                   => IF1_timestamp,
--    adc_sat_count               => IF1_adc_sat_count,
--    adc_sat_flag                => IF1_adc_sat_flag,
--    ndiode_flag                 => IF1_ndiode_flag,

--    item_pointer_01             => IF1_item_pointer_01,
--    item_pointer_02             => IF1_item_pointer_02,
--    item_pointer_03             => IF1_item_pointer_03,
--    item_pointer_04             => IF1_item_pointer_04,
--    item_pointer_05             => IF1_item_pointer_05,
--    item_pointer_06             => IF1_item_pointer_06,
--    item_pointer_07             => IF1_item_pointer_07,
--    item_pointer_08             => IF1_item_pointer_08,
--    item_pointer_09             => IF1_item_pointer_09,
--    item_pointer_10             => IF1_item_pointer_10,
--    item_pointer_11             => IF1_item_pointer_11,

--    data_to_buf                 => IF1_data_to_buf,
--    data_to_buf_wr              => IF1_data_to_buf_wr,
--    data_from_buf               => IF1_data_from_buf,
--    addr_for_buf                => IF1_addr_for_buf,

--    clr_err                     => clr_err
--    );      


  
  -- BUFFER
  -----------------------------------------------------------------------------
  DSP_BUF_inst : dsp_buf
  PORT MAP (
    clk                         => init_clk,
    rst                         => sys_reset,

    port1_clk                   => cfg_clk,
    port1_data_in               => cfg_data_in,
    port1_data_in_wr            => cfg_wr_en,
    port1_addr                  => cfg_addr,
    port1_data_out              => cfg_data_out,

    port2_data_in               => IF0_data_to_buf,
    port2_data_in_wr            => IF0_data_to_buf_wr,
    port2_addr                  => IF0_addr_for_buf,
    port2_data_out              => IF0_data_from_buf,
    
    data_size                   => data_size,
    mode_edd                    => mode_edd,
    mode_wave_data_gen          => mode_wave_data_gen,
    ampl_wave_data_gen          => ampl_wave_data_gen,
    pre_decimation_fac          => pre_decimation_fac,
    deskew_val                  => deskew_val,

    mcast_size                  => mcast_size,
    heap_size                   => heap_size,
    
    status_in                   => status,

    use_1pps                    => use_1pps,
    data_enable1                => data_enable1,
    data_enable2                => data_enable2,
    sync_request                => sync_request,
    filter_select               => filter_select,
    sync_timestamp              => sync_timestamp,
    test_value                  => test_value,

    time_at_1pps                => time_at_1pps,
    eddy_status                 => eddy_status,

    clr_err                     => clr_err,

    IF0_enable                  => IF0_enable,
    IF0_arpbeat_enable          => IF0_arpbeat_enable,
    IF0_status                  => IF0_status,
    
    IF0_dst_sel                 => b"00",--IF0_destination,

    IF0_dst_mac_addr            => IF0_dst_mac_addr,
    IF0_dst_ip_addr             => IF0_dst_ip_addr,
    IF0_dst_udp_port            => IF0_dst_udp_port,
    IF0_src_udp_port            => IF0_src_udp_port,

    IF0_src_mac_addr            => IF0_src_mac_addr,
    IF0_src_ip_addr             => IF0_src_ip_addr,

    IF0_word_from_buf           => OPEN,
    IF0_msg_first_addr          => OPEN,
    IF0_msg_last_addr           => OPEN,
    IF0_msg_send_trig           => OPEN,
    IF0_dhcpdiscover_trig       => IF0_dhcpdiscover_trig,
    IF0_arp_req_trig            => OPEN,
    
    IF0_item_pointer_01         => IF0_item_pointer_01,
    IF0_item_pointer_02         => IF0_item_pointer_02,
    IF0_item_pointer_03         => IF0_item_pointer_03,
    IF0_item_pointer_04         => IF0_item_pointer_04,
    IF0_item_pointer_05         => IF0_item_pointer_05,
    IF0_item_pointer_06         => IF0_item_pointer_06,
    IF0_item_pointer_07         => IF0_item_pointer_07,
    IF0_item_pointer_08         => IF0_item_pointer_08,

    IF0_item_pointer_09         => IF0_item_pointer_09,
    IF0_item_pointer_10         => IF0_item_pointer_10,
    IF0_item_pointer_11         => IF0_item_pointer_11,

    IF1_enable                  => IF1_enable,
    IF1_arpbeat_enable          => IF1_arpbeat_enable,
    IF1_status                  => IF1_status,

    IF1_dst_sel                 => IF1_destination,

    IF1_dst_mac_addr            => IF1_dst_mac_addr,
    IF1_dst_ip_addr             => IF1_dst_ip_addr,
    IF1_dst_udp_port            => IF1_dst_udp_port,
    IF1_src_udp_port            => IF1_src_udp_port,

    IF1_src_mac_addr            => IF1_src_mac_addr,
    IF1_src_ip_addr             => IF1_src_ip_addr,
    
    IF1_word_from_buf           => OPEN,
    IF1_msg_first_addr          => OPEN,
    IF1_msg_last_addr           => OPEN,
    IF1_msg_send_trig           => OPEN,
    IF1_dhcpdiscover_trig       => IF1_dhcpdiscover_trig,
    IF1_arp_req_trig            => OPEN,
    
    IF1_item_pointer_01         => IF1_item_pointer_01,
    IF1_item_pointer_02         => IF1_item_pointer_02,
    IF1_item_pointer_03         => IF1_item_pointer_03,
    IF1_item_pointer_04         => IF1_item_pointer_04,
    IF1_item_pointer_05         => IF1_item_pointer_05,
    IF1_item_pointer_06         => IF1_item_pointer_06,
    IF1_item_pointer_07         => IF1_item_pointer_07,
    IF1_item_pointer_08         => IF1_item_pointer_08,

    IF1_item_pointer_09         => IF1_item_pointer_09,
    IF1_item_pointer_10         => IF1_item_pointer_10,
    IF1_item_pointer_11         => IF1_item_pointer_11


    );

  -----------------------------------------------------------------------------
  -- timer for packet
  -----------------------------------------------------------------------------
  PACKET_BEAT : PROCESS (sys_reset, init_clk) IS
  BEGIN

    IF (sys_reset = '1') THEN
      IF0_counter <= 128;
      IF0_data_valid <= '0';
      IF0_data_eof   <= '0';
      IF0_tvg <= x"0000";
      IF0_data                 <= (OTHERS => '0');
    ELSIF rising_edge(init_clk) THEN
    
      IF0_data_eof_z1 <= IF0_data_eof;
       
      IF0_data                    <= ( IF0_tvg & x"0000")       & ((IF0_tvg + 1)  & x"0000")  & ((IF0_tvg + 2) & x"0000")   & ((IF0_tvg + 3) & x"0000") & 
                                     ((IF0_tvg + 4) & x"0000")  & ((IF0_tvg + 5)  & x"0000")  & ((IF0_tvg + 6) & x"0000")   & ((IF0_tvg + 7) & x"0000") & 
                                     ((IF0_tvg + 8) & x"0000")  & ((IF0_tvg + 9)  & x"0000")  & ((IF0_tvg + 10) & x"0000")  & ((IF0_tvg + 11) & x"0000") & 
                                     ((IF0_tvg + 12) & x"0000") & ((IF0_tvg + 13) & x"0000")  & ((IF0_tvg + 14) & x"0000")  & ((IF0_tvg + 15) & x"0000"); 
                                         
      IF (IF0_data_valid = '1' OR   IF0_start_packet = '1') THEN
        IF (IF0_counter = 0) THEN
          IF0_counter <= 128;
          IF0_data_valid <= '0';
          IF0_data_eof   <= '1';
          IF (IF0_tvg > 65520) THEN
               IF0_tvg <= x"0000";
          END IF;
        ELSE
          IF0_tvg <= IF0_tvg + 16;
          IF0_counter <= IF0_counter - 1;
          IF0_data_valid <= '1';
        END IF;
                                         
      ELSE
        IF0_counter  <= 128;
        IF0_data_valid <= '0';
        IF0_data_eof   <= '0';
      END IF;
    END IF;

  END PROCESS;
  
  -----------------------------------------------------------------------------
  -- timer for packet wait
  -----------------------------------------------------------------------------
  PACKET_WAIT : PROCESS (sys_reset, init_clk) IS
  BEGIN

    IF (sys_reset = '1') THEN
      IF0_wait <= 672;
      IF0_wait_done   <= '0';
    ELSIF rising_edge(init_clk) THEN
      IF ((IF0_data_eof = '1') OR  (IF0_wait < 672)) THEN
        IF (IF0_wait = 0) THEN
          IF0_wait <= 672;
          IF0_wait_done   <= '1';
        ELSE
          IF0_wait <= IF0_wait - 1;
          IF0_wait_done   <= '0';
        END IF;
      ELSE
        IF0_wait  <= 672;
        IF0_wait_done   <= '0';
      END IF;
    END IF;

  END PROCESS;
  
--  -----------------------------------------------------------------------------
--  -- timer for freqoffset calculation on item pointer 7
--  -----------------------------------------------------------------------------
--  FREQ_OFFSET : PROCESS (sys_reset, init_clk) IS
--  BEGIN

--    IF (sys_reset = '1') THEN
--      NumFreqOffset <= 0;
--    ELSIF rising_edge(init_clk) THEN
--      IF ((IF0_data_eof = '1') AND (IF0_data_eof_z1 = '0')) THEN
--        IF (NumFreqOffset = 15) THEN
--          NumFreqOffset <= 0;
--        ELSE
--          NumFreqOffset <= NumFreqOffset + 1;
--        END IF;
--      END IF;
--    END IF;

--  END PROCESS;
  
  -----------------------------------------------------------------------------
  -- SEND STATE MACHINE
  -----------------------------------------------------------------------------
  HEAP_CTRL : PROCESS (sys_reset, init_clk) IS
  BEGIN

    IF (sys_reset = '1') THEN
       -- IF0_data                 <= (OTHERS => '0');
       -- IF0_data_valid           <= '0';
        IF0_start_packet         <= '0';
        IF0_mcast_offs           <= (OTHERS => '0');
        IF0_timestamp           <= (OTHERS => '0');
       -- NumFreqOffset           <= 0;
        heap_machine             <= A0;
     
    ELSIF rising_edge(init_clk) THEN

    
      
            
                                         
             
             IF0_item_pointer_07_reg(63 downto 48) <= IF0_item_pointer_07(63 downto 48);
             
      CASE heap_machine IS
        
        -- Start of the heap
        -----------------------------------------------------------------------
        WHEN A0 =>
             --IF0_data_valid          <= '1';
             IF0_start_packet        <= '1';
             --IF0_wait_done           <= '0';
             --IF0_data_eof            <= '0';
             heap_machine            <= A1;
             
        WHEN A1 =>
             heap_machine            <= A2;
        WHEN A2 =>  --wait for end of packet
             IF ((IF0_data_eof = '1') AND (IF0_data_eof_z1 = '0')) THEN --wait for end of packet
                
                IF(IF0_mcast_offs < (mcast_size-1)) THEN 
                    IF0_mcast_offs           <= IF0_mcast_offs + 1 ;
                    IF0_item_pointer_07_reg(47 downto 0) <= IF0_item_pointer_07_reg(47 downto 0) + 1;
                ELSE                              
                    IF0_mcast_offs                       <= x"00" ;
                    IF0_timestamp                        <= IF0_timestamp + 1; --increment timestamp every 16 packets (every spectrum)
                    IF0_item_pointer_07_reg(47 downto 0) <= x"000000000000";   -- reset offset to zero
                END IF;
                
                
        
                heap_machine            <= A3;
             ELSE
                heap_machine            <= A2;
                IF0_start_packet        <= '0';
             END IF;
             
        -- new packet
        -----------------------------------------------------------------------
        WHEN A3 =>
             IF (IF0_wait_done = '1') THEN --wait for end of packet
                heap_machine            <= A0;
             ELSE
                heap_machine            <= A3;
             END IF;
        WHEN OTHERS => NULL;
      END CASE;
      
    END IF;

  END PROCESS;
  
  
  ---- SIGNAL PROCESSING
  ---------------------------------------------------------------------------
--  DSP_SIGNAL_PROCESSING512_inst : dsp_signal_processing512
--  GENERIC MAP (
--    include_wave_data_gen       => 1,
--    operating_mode              => "EDD"
--    )
--  PORT MAP (
--    rst_in                      => sys_reset,
--    clk_in                      => init_clk,
--    use_1pps_in                 => use_1pps,
--    mode_edd_in                 => mode_edd,
--    mode_wave_data_gen_in       => mode_wave_data_gen,
--    ampl_wave_data_gen_in       => ampl_wave_data_gen,
--    deskew_in                   => deskew_val,
    
--    flip_signal_spec_in         => flip_signal_spec,
--    pre_decimation_fac_in       => pre_decimation_fac,
--    data_size_in                => data_size,
--    mcast_size_in               => mcast_size,
--    heap_size_in                => heap_size,
--    noisediode_in               => noisediode_off_in,
--    sync_timestamp_in           => sync_timestamp,
--    sync_request_in             => sync_request,
--    data_enable1_in             => data_enable1,
--    data_enable2_in             => data_enable2,
--    data_in                     => (OTHERS => '1'),
--    data_in_valid               => '1',
--    dmonitor_out                => dmonitor_out,
--    dmonitor_out_valid          => dmonitor_out_valid,
--    IF0_data_out                => IF0_data,
--    IF0_data_out_valid          => IF0_data_valid,
--    IF0_start_packet            => IF0_start_packet,
--    IF0_destination_out         => IF0_destination,
--    IF0_mcast_offs_out          => IF0_mcast_offs,
--    IF0_heap_offs_out           => IF0_heap_offs,
--    IF0_heap_size_out           => IF0_heap_size,
--    IF0_timestamp_out           => IF0_timestamp,
--    IF0_pol_id_out              => IF0_pol_id(0),
--    IF0_saturation_out          => IF0_adc_sat_count,
--    IF0_saturation_flag         => IF0_adc_sat_flag,
--    IF0_noisediode_out          => IF0_ndiode_flag,
--    IF1_data_out                => IF1_data,
--    IF1_data_out_valid          => IF1_data_valid,
--    IF1_start_packet            => IF1_start_packet,
--    IF1_destination_out         => IF1_destination,
--    IF1_mcast_offs_out          => IF1_mcast_offs,
--    IF1_heap_offs_out           => IF1_heap_offs,
--    IF1_heap_size_out           => IF1_heap_size,
--    IF1_timestamp_out           => IF1_timestamp,
--    IF1_pol_id_out              => IF1_pol_id(0),
--    IF1_saturation_out          => IF1_adc_sat_count,
--    IF1_saturation_flag         => IF1_adc_sat_flag,
--    IF1_noisediode_out          => IF1_ndiode_flag,
--    time_at_1pps_out            => time_at_1pps,
--    eddy_status_out             => eddy_status,
--    testpin1                    => OPEN,
--    testpin2                    => OPEN,
--    test_value_in               => test_value,
--    user_led1                   => OPEN,
--    user_led2                   => OPEN,
--    user_led3                   => OPEN,
--    clr_err                     => clr_err,
--    err                         => OPEN
--    );

--  ILA_1_inst : COMPONENT ila_1
--  PORT MAP (
--    clk         => init_clk,
--    probe0      => (OTHERS => '0'),
--    probe1      => (OTHERS => '0'),
--    probe2(0)   => IF1_start_packet,
--    probe3(0)   => IF0_test_start_packet,
--    probe4(0)   => IF1_data_valid,
--    probe5(0)   => IF0_start_packet,
--    probe6(0)   => '0',
--    probe7(0)   => '0'
--    );


  
END ARCHITECTURE behaviour;
