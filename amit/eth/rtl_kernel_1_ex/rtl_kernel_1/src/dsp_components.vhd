-- dsp_components.vhd 16. July 2018 by claus


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY UNISIM;
USE UNISIM.VComponents.all;

PACKAGE dsp_components IS


  -------------------------------------------------------------------------------
  -- INIT CLOCK PLL
  -------------------------------------------------------------------------------
  COMPONENT dsp_init_clk_pll
  PORT (
    clk_out1          : OUT STD_LOGIC;
   --  AB XCU280 reset             : IN  STD_LOGIC;
    locked            : OUT STD_LOGIC;
    clk_in1_p         : IN  STD_LOGIC;
    clk_in1_n         : IN  STD_LOGIC
    );
  END COMPONENT;
  
  -------------------------------------------------------------------------------
  -- LATCH ASYNC
  -------------------------------------------------------------------------------

  COMPONENT latch_async is
  GENERIC (
    data_in     : INTEGER := 32         -- width of data word
    );
  PORT (
    clk         : IN STD_LOGIC;         -- sample clock
    din         : IN STD_LOGIC_VECTOR(data_in-1 DOWNTO 0);      -- data input
    dout        : OUT STD_LOGIC_VECTOR(data_in-1 DOWNTO 0)    -- data-output
    );
  END COMPONENT latch_async;

  -------------------------------------------------------------------------------
  -- FIFO to transfer to clock domain 322.269 MHz
  -------------------------------------------------------------------------------
  COMPONENT dsp_clock_crossing_fifo IS
  PORT (
    rst                 : IN STD_LOGIC;
    wr_clk              : IN STD_LOGIC;
    rd_clk              : IN STD_LOGIC;
    din                 : IN STD_LOGIC_VECTOR(512 DOWNTO 0);
    wr_en               : IN STD_LOGIC;
    rd_en               : IN STD_LOGIC;
    dout                : OUT STD_LOGIC_VECTOR(512 DOWNTO 0);
    full                : OUT STD_LOGIC;
    empty               : OUT STD_LOGIC
  );
  END COMPONENT dsp_clock_crossing_fifo;

  
  -------------------------------------------------------------------------------
  -- FIFO for ADC data packet to be send
  -------------------------------------------------------------------------------
  COMPONENT dsp_fst_src_fifo IS
  PORT (
    clk         : IN STD_LOGIC;
    rst         : IN STD_LOGIC;
    din         : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    wr_en       : IN STD_LOGIC;
    rd_en       : IN STD_LOGIC;
    dout        : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    full        : OUT STD_LOGIC;
    empty       : OUT STD_LOGIC
  );
  END COMPONENT dsp_fst_src_fifo;

  
  -------------------------------------------------------------------------------
  -- FIFO for second source (ARP, ICMP, ...))
  -------------------------------------------------------------------------------
  COMPONENT dsp_snd_src_fifo IS
    PORT (
      rst       : IN STD_LOGIC;
      wr_clk    : IN STD_LOGIC;
      rd_clk    : IN STD_LOGIC;
      din       : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      wr_en     : IN STD_LOGIC;
      rd_en     : IN STD_LOGIC;
      dout      : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
      full      : OUT STD_LOGIC;
      empty     : OUT STD_LOGIC
      );


--  PORT (
--    clk         : IN STD_LOGIC;
--    rst         : IN STD_LOGIC;
--    din         : IN STD_LOGIC_VECTOR(512 DOWNTO 0);
--    wr_en       : IN STD_LOGIC;
--    rd_en       : IN STD_LOGIC;
--    dout        : OUT STD_LOGIC_VECTOR(512 DOWNTO 0);
--    full        : OUT STD_LOGIC;
--    empty       : OUT STD_LOGIC
--  );
  END COMPONENT dsp_snd_src_fifo;



  -------------------------------------------------------------------------------
  -- FIFO for protocols receive (ARP, ICMP, ...))
  -------------------------------------------------------------------------------
  COMPONENT dsp_protocols_fifo IS
  PORT (
--    rst         : IN STD_LOGIC;
    wr_clk      : IN STD_LOGIC;
    rd_clk      : IN STD_LOGIC;
    din         : IN STD_LOGIC_VECTOR(520 DOWNTO 0);
    wr_en       : IN STD_LOGIC;
    rd_en       : IN STD_LOGIC;
    dout        : OUT STD_LOGIC_VECTOR(520 DOWNTO 0);
    full        : OUT STD_LOGIC;
    empty       : OUT STD_LOGIC
  );
  END COMPONENT dsp_protocols_fifo;

  
  
  -----------------------------------------------------------------------------
  -- I2C
  -----------------------------------------------------------------------------
  COMPONENT dsp_i2c IS
  GENERIC(
    input_clk :  INTEGER := 50_000_000;
    bus_clk   :  INTEGER := 100_000);
  PORT(
    clk       :  IN      STD_LOGIC;                    
    reset     :  IN      STD_LOGIC;                    
    ena       :  IN      STD_LOGIC;                    
    addr      :  IN      STD_LOGIC_VECTOR(6 DOWNTO 0); 
    rw        :  IN      STD_LOGIC;                    
    data_wr   :  IN      STD_LOGIC_VECTOR(7 DOWNTO 0); 
    busy      :  OUT     STD_LOGIC;                    
    data_rd   :  OUT     STD_LOGIC_VECTOR(7 DOWNTO 0); 
    ack_error :  OUT     STD_LOGIC;                    
    sda       :  INOUT   STD_LOGIC;                    
    scl       :  INOUT   STD_LOGIC
    );                   
  END COMPONENT dsp_i2c;


  -----------------------------------------------------------------------------
  -- QSFP TOP
  -----------------------------------------------------------------------------
  COMPONENT dsp_eth_top IS
  PORT (
    init_clk                    : IN STD_LOGIC;
    sys_reset                   : IN STD_LOGIC;

-- --  AB XCU280   IF0_txusrclk2_out           : OUT STD_LOGIC;
--    IF0_gt_ref_clk_out          : OUT STD_LOGIC;
--    IF0_tx_rdyout               : OUT STD_LOGIC;

--    IF0_refclk_gty_p            : IN STD_LOGIC;
--    IF0_refclk_gty_n            : IN STD_LOGIC;

--    IF0_eth_rxn                 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--    IF0_eth_rxp                 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--    IF0_eth_txn                 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
--    IF0_eth_txp                 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

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

    status_out                  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    error_out                   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

      --data rx signals
   rx_clk           : OUT STD_LOGIC;
   rx_out_data      : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
   rx_out_ena       : OUT STD_LOGIC;
   rx_out_sop       : OUT STD_LOGIC;
   rx_out_eop       : OUT STD_LOGIC;
   rx_out_err       : OUT STD_LOGIC;
   rx_out_mty       : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
   
    clr_err_out                 : OUT STD_LOGIC
    );
  END COMPONENT dsp_eth_top;


  
  -----------------------------------------------------------------------------
  -- BUFFER
  -----------------------------------------------------------------------------
  COMPONENT dsp_buf IS
  PORT ( 
    clk                           : IN STD_LOGIC;
    rst                           : IN STD_LOGIC;
    
    port1_clk                     : IN STD_LOGIC;
    port1_data_in                 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    port1_data_in_wr              : IN STD_LOGIC;
    port1_addr                    : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    port1_data_out                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

    port2_data_in                 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    port2_data_in_wr              : IN STD_LOGIC;
    port2_addr                    : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    port2_data_out                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

    data_size                     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    mode_edd                      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);

    -- signal processing
    flip_signal_spec              : OUT STD_LOGIC;
    mode_wave_data_gen            : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ampl_wave_data_gen            : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    pre_decimation_fac            : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    deskew_val                    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

    mcast_size                    : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0);
    heap_size                     : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);

    status_in                     : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);

    use_1pps                      : OUT STD_LOGIC;
    data_enable1                  : OUT STD_LOGIC;
    data_enable2                  : OUT STD_LOGIC;
    sync_request                  : OUT STD_LOGIC;
    filter_select                 : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
    sync_timestamp                : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    test_value                    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

    time_at_1pps                  : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    eddy_status                   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

    --

    clr_err                       : OUT STD_LOGIC;

    -- IF0
    IF0_enable                    : OUT STD_LOGIC;
    IF0_arpbeat_enable            : OUT STD_LOGIC;
    IF0_status                    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);

    IF0_dst_sel                   : IN  STD_LOGIC_VECTOR( 1 DOWNTO 0);

    IF0_dst_mac_addr              : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
    IF0_dst_ip_addr               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IF0_src_mac_addr              : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
    IF0_src_ip_addr               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IF0_dst_udp_port              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    IF0_src_udp_port              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

    -- snd src
    IF0_word_from_buf             : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    IF0_msg_first_addr            : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    IF0_msg_last_addr             : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    IF0_msg_send_trig             : OUT STD_LOGIC;
    IF0_dhcpdiscover_trig         : OUT STD_LOGIC;
    IF0_arp_req_trig              : OUT STD_LOGIC;

    -- SPEAD item pointers
    IF0_item_pointer_01           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF0_item_pointer_02           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF0_item_pointer_03           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF0_item_pointer_04           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF0_item_pointer_05           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF0_item_pointer_06           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF0_item_pointer_07           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF0_item_pointer_08           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);

    IF0_item_pointer_09           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF0_item_pointer_10           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF0_item_pointer_11           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);

    -- IF1
    IF1_enable                    : OUT STD_LOGIC;
    IF1_arpbeat_enable            : OUT STD_LOGIC;
    IF1_status                    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);

    IF1_dst_sel                   : IN  STD_LOGIC_VECTOR( 1 DOWNTO 0);

    IF1_dst_mac_addr              : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
    IF1_dst_ip_addr               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IF1_src_mac_addr              : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
    IF1_src_ip_addr               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    IF1_dst_udp_port              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    IF1_src_udp_port              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

    -- snd src
    IF1_word_from_buf             : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    IF1_msg_first_addr            : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    IF1_msg_last_addr             : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    IF1_msg_send_trig             : OUT STD_LOGIC;
    IF1_dhcpdiscover_trig         : OUT STD_LOGIC;
    IF1_arp_req_trig              : OUT STD_LOGIC;

    -- SPEAD item pointers
    IF1_item_pointer_01           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF1_item_pointer_02           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF1_item_pointer_03           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF1_item_pointer_04           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF1_item_pointer_05           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF1_item_pointer_06           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF1_item_pointer_07           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF1_item_pointer_08           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);

    IF1_item_pointer_09           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF1_item_pointer_10           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    IF1_item_pointer_11           : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
  END COMPONENT dsp_buf;

  
  -----------------------------------------------------------------------------
  -- BUF CLOCK CROSSING FIFO
  -----------------------------------------------------------------------------
  COMPONENT dsp_buf_clock_crossing_fifo IS
  PORT (
    rst         : IN STD_LOGIC;
    wr_clk      : IN STD_LOGIC;
    rd_clk      : IN STD_LOGIC;
    din         : IN STD_LOGIC_VECTOR(48 DOWNTO 0);
    wr_en       : IN STD_LOGIC;
    rd_en       : IN STD_LOGIC;
    dout        : OUT STD_LOGIC_VECTOR(48 DOWNTO 0);
    full        : OUT STD_LOGIC;
    empty       : OUT STD_LOGIC
    );
  END COMPONENT dsp_buf_clock_crossing_fifo;

  
  
  -----------------------------------------------------------------------------
  -- HEADER
  -----------------------------------------------------------------------------
  COMPONENT dsp_header IS
    PORT ( 
      clk                       : IN STD_LOGIC;
      rst                       : IN STD_LOGIC;
      
      item_pointer_01           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      item_pointer_02           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      item_pointer_03           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      item_pointer_04           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      item_pointer_05           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      item_pointer_06           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      item_pointer_07           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      item_pointer_08           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);

      item_pointer_09           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      item_pointer_10           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      item_pointer_11           : IN STD_LOGIC_VECTOR(63 DOWNTO 0);

      data_size                 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

      mcast_offs                : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
      heap_offs                 : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      heap_size                 : IN STD_LOGIC_VECTOR(47 DOWNTO 0);

      mac_dst_addr              : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      mac_src_addr              : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      ip_dst_addr               : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ip_src_addr               : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

      udp_dst_port              : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      udp_src_port              : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      
      pol_id                    : IN STD_LOGIC_VECTOR( 1 DOWNTO 0);
      timestamp                 : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      adc_sat_count             : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      adc_sat_flag              : IN STD_LOGIC;
      ndiode_flag               : IN STD_LOGIC;
      
      header                    : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
      header_size               : OUT STD_LOGIC_VECTOR(  3 DOWNTO 0);
      header_valid              : OUT STD_LOGIC;
      header_last_word_empty    : OUT STD_LOGIC_VECTOR(  5 DOWNTO 0);
      header_word_sel           : IN  STD_LOGIC_VECTOR(  3 DOWNTO 0)
      );
  END COMPONENT dsp_header;

  
  -----------------------------------------------------------------------------
  -- UDPIP CHECKSUM
  -----------------------------------------------------------------------------
  COMPONENT DSP_CHKSUM512_UDPIP is
  PORT (
    RST        : in  std_logic;                      -- Reset.
    CLK        : in  std_logic;                      -- Clock.
    DATA       : in  std_logic_vector(511 downto 0); -- Input data to be processed.
    START      : in  std_logic;                      -- Indicates frist word on DATA.
    ADD        : in  std_logic;                      -- Indicates word is valid on DATA.
    FINISH     : in  std_logic;                      -- Indicates last word on DATA.
    DONE       : out std_logic;                      -- Indicates completion of checksums.
    IPH_CHKSUM : out std_logic_vector(15 downto 0);  -- Latest completed IP header checksum.
    UDP_CHKSUM : out std_logic_vector(15 downto 0)   -- Latest completed UDP checksum.
  );
  END COMPONENT DSP_CHKSUM512_UDPIP;

  
  COMPONENT DSP_CHKSUM512_HEAD is
  PORT (
    RST       : in  std_logic;
    CLK       : in  std_logic;
    HEADER    : in  std_logic_vector(511 downto 0);
    START     : in  std_logic;
    DONE      : out std_logic;
    IPHCHKSUM : out std_logic_vector(15 downto 0);
    UDPCHKSUM : out std_logic_vector(15 downto 0)
    );
  END COMPONENT DSP_CHKSUM512_HEAD;

  
  COMPONENT DSP_CHKSUM512_DATA is
  PORT (
    RST    : in  std_logic;
    CLK    : in  std_logic;
    DATA   : in  std_logic_vector(511 downto 0);
    START  : in  std_logic;
    ADD    : in  std_logic;
    FINISH : in  std_logic;
    DONE   : out std_logic;
    CHKSUM : out std_logic_vector( 15 downto 0)
    );
  END COMPONENT DSP_CHKSUM512_DATA;

  
  -----------------------------------------------------------------------------
  -- INPUT DATA TEST GENERATOR
  -----------------------------------------------------------------------------
  COMPONENT dsp_test_data_gen IS
    PORT (
      clk                   : IN STD_LOGIC;
      rst                   : IN STD_LOGIC;
      enable                : IN STD_LOGIC;
      test_data             : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
      test_data_valid       : OUT STD_LOGIC;
      data_size             : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      start_packet          : OUT STD_LOGIC;
      destination           : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
      );
  END COMPONENT dsp_test_data_gen;

  
  -----------------------------------------------------------------------------
  -- PACKET GENERATOR
  -----------------------------------------------------------------------------
  COMPONENT dsp_packetizer IS
    PORT ( 
      clk                       : IN STD_LOGIC;
      rst                       : IN STD_LOGIC;

      header                    : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      header_size               : IN STD_LOGIC_VECTOR(  3 DOWNTO 0);
      header_valid              : IN STD_LOGIC;
      header_last_word_empty    : IN STD_LOGIC_VECTOR(  5 DOWNTO 0);
      header_word_sel           : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);

      chksum_data               : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
      chksum_start              : OUT STD_LOGIC;
      chksum_add                : OUT STD_LOGIC;
      chksum_finish             : OUT STD_LOGIC;
      chksum_done               : IN STD_LOGIC;
      
      cc_fifo_data              : IN STD_LOGIC_VECTOR(512 DOWNTO 0);
      cc_fifo_rd_en             : OUT STD_LOGIC;
      cc_fifo_empty             : IN STD_LOGIC;
 
      fst_src_fifo_din          : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
      fst_src_fifo_wr_en        : OUT STD_LOGIC; 
      fst_src_fifo_full         : IN STD_LOGIC;
      fst_src_fifo_empty        : IN STD_LOGIC;
      last_word_empty           : OUT STD_LOGIC_VECTOR( 5 DOWNTO 0);

      fst_src_send              : OUT STD_LOGIC;
      fst_src_send_busy         : IN STD_LOGIC;

      enable                    : IN STD_LOGIC;
      data_size                 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

      clr_err                   : IN  STD_LOGIC;
      start_packet_err          : OUT STD_LOGIC
     );
  END COMPONENT dsp_packetizer;

  
  
  -----------------------------------------------------------------------------
  -- SECOND SOURCE
  -----------------------------------------------------------------------------
  COMPONENT dsp_snd_src IS
   PORT ( 
     clk                        : IN STD_LOGIC;
     rst                        : IN STD_LOGIC;

     snd_src_fifo_din           : OUT STD_LOGIC_VECTOR(512 DOWNTO 0);
     snd_src_fifo_wr_en         : OUT STD_LOGIC; 
     snd_src_fifo_full          : IN STD_LOGIC;
  
     snd_src_send               : OUT STD_LOGIC;
     send_busy                  : IN STD_LOGIC;

     my_mac_address             : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
     my_ip_address              : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  
     last_word_valid            : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);

     -- CTRL
     arpbeat_enable             : IN STD_LOGIC

     );
  END COMPONENT dsp_snd_src;

  
  -----------------------------------------------------------------------------
  -- SEND MACHINE
  -----------------------------------------------------------------------------
  COMPONENT dsp_send IS
    PORT ( 
      clk                   : IN STD_LOGIC;
      rst                   : IN STD_LOGIC;
      usr_tx_reset          : IN STD_LOGIC;
      usr_rx_reset          : IN STD_LOGIC;
      
      fst_src_send          : IN STD_LOGIC;
      fst_src_send_busy     : OUT STD_LOGIC;
      fst_src_fifo_data     : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      fst_src_fifo_rd_en    : OUT STD_LOGIC;
      fst_src_fifo_empty    : IN STD_LOGIC;
      fst_src_last_word_empty : IN STD_LOGIC_VECTOR(  5 DOWNTO 0);

      snd_src_send          : IN STD_LOGIC;
      snd_src_send_busy     : OUT STD_LOGIC;
      snd_src_fifo_data     : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      snd_src_fifo_rd_en    : OUT STD_LOGIC;
      snd_src_fifo_empty    : IN STD_LOGIC;
      snd_src_last_word_empty : IN STD_LOGIC_VECTOR(  5 DOWNTO 0);
      snd_src_data_size     : IN STD_LOGIC_VECTOR(  7 DOWNTO 0);

      data_size             : IN STD_LOGIC_VECTOR(  7 DOWNTO 0);
      header_size           : IN STD_LOGIC_VECTOR(  3 DOWNTO 0);
      
      chksum_iph            : IN STD_LOGIC_VECTOR( 15 DOWNTO 0);
      chksum_udp            : IN STD_LOGIC_VECTOR( 15 DOWNTO 0);
      
      tx_datain0            : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      tx_datain1            : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      tx_datain2            : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      tx_datain3            : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      
      tx_mtyin0             : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      tx_mtyin1             : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      tx_mtyin2             : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      tx_mtyin3             : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      
      tx_enain0             : OUT STD_LOGIC;
      tx_enain1             : OUT STD_LOGIC;
      tx_enain2             : OUT STD_LOGIC;
      tx_enain3             : OUT STD_LOGIC;
      
      tx_sopin0             : OUT STD_LOGIC;
      tx_sopin1             : OUT STD_LOGIC;
      tx_sopin2             : OUT STD_LOGIC;
      tx_sopin3             : OUT STD_LOGIC;
      
      tx_eopin0             : OUT STD_LOGIC;
      tx_eopin1             : OUT STD_LOGIC;
      tx_eopin2             : OUT STD_LOGIC;
      tx_eopin3             : OUT STD_LOGIC;

      tx_errin0             : OUT STD_LOGIC;
      tx_errin1             : OUT STD_LOGIC;
      tx_errin2             : OUT STD_LOGIC;
      tx_errin3             : OUT STD_LOGIC;
      
      tx_ovfout             : IN STD_LOGIC;
      tx_rdyout             : IN STD_LOGIC;
      tx_unfout             : IN STD_LOGIC;
      
      ctl_tx_enable         : OUT STD_LOGIC;
      ctl_tx_send_rfi       : OUT STD_LOGIC;
      ctl_rx_enable         : OUT STD_LOGIC;

      status                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

      stat_rx_aligned               : IN  STD_LOGIC;
      stat_rx_status                : IN  STD_LOGIC;
      gtwiz_reset_rx_datapath       : OUT STD_LOGIC;
      
      core_reset            : OUT STD_LOGIC
      );
  END COMPONENT dsp_send;

  
  -----------------------------------------------------------------------------
  -- PROTOCOLS
  -----------------------------------------------------------------------------
  COMPONENT dsp_protocols IS
    PORT ( 
      clk                       : IN STD_LOGIC;
      slow_clk                  : IN STD_LOGIC;
      rst                       : IN STD_LOGIC;

      src_mac_addr              : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      src_ip_addr               : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

      data                      : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      ena                       : IN STD_LOGIC;
      sop                       : IN STD_LOGIC;
      eop                       : IN STD_LOGIC;
      err                       : IN STD_LOGIC;
      mty                       : IN STD_LOGIC_VECTOR(  5 DOWNTO 0);
      
      snd_src_data              : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
      snd_src_fifo_wr_en        : OUT STD_LOGIC;
      snd_src_fifo_full         : IN  STD_LOGIC;
      snd_src_last_word_empty   : OUT STD_LOGIC_VECTOR(  5 DOWNTO 0);
      snd_src_data_size         : OUT STD_LOGIC_VECTOR(  7 DOWNTO 0);
      snd_src_send              : OUT STD_LOGIC;
      snd_src_send_busy         : IN STD_LOGIC;

      dhcpdiscover_trig         : IN STD_LOGIC;

      data_to_buf               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      data_to_buf_wr            : OUT STD_LOGIC;
      data_from_buf             : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      addr_for_buf              : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      
      packet_rec                : OUT STD_LOGIC;
      clr_err                   : IN STD_LOGIC;
      rec_err                   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
      );
  END COMPONENT dsp_protocols;

  
  -----------------------------------------------------------------------------
  -- IP packet handling
  -----------------------------------------------------------------------------
  COMPONENT dsp_rec_ip IS
    PORT ( 
      clk               : IN STD_LOGIC;
      rst               : IN STD_LOGIC;

      src_mac_addr      : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      src_ip_addr       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

      data              : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      ena               : IN STD_LOGIC;
      sop               : IN STD_LOGIC;
      eop               : IN STD_LOGIC;
      err               : IN STD_LOGIC;
      mty               : IN STD_LOGIC_VECTOR(5 DOWNTO 0);

      packet_rec        : OUT STD_LOGIC;
      clr_err           : IN STD_LOGIC
  );
  END COMPONENT dsp_rec_ip;

  
  -----------------------------------------------------------------------------
  -- ARP packet handling
  -----------------------------------------------------------------------------
  COMPONENT dsp_rec_arp IS
    PORT ( 
      clk               : IN STD_LOGIC;
      rst               : IN STD_LOGIC;

      src_mac_addr      : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      src_ip_addr       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

      data              : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      ena               : IN STD_LOGIC;
      sop               : IN STD_LOGIC;
      eop               : IN STD_LOGIC;
      err               : IN STD_LOGIC;
      mty               : IN STD_LOGIC_VECTOR(5 DOWNTO 0);

      packet_rec        : OUT STD_LOGIC;
      clr_err           : IN STD_LOGIC
  );
  END COMPONENT dsp_rec_arp;

  
  -----------------------------------------------------------------------------
  -- LBUS_RX
  -----------------------------------------------------------------------------
  COMPONENT DSP_RX_LBU_TO_ETH IS
  PORT (
    RST      : in  std_logic;
    CLK      : in  std_logic;  -- CMAC RX_CLK, 322.266 MHz.
    TESTPIN  : in  std_logic;
    -- LBUS input (segmented):
    DATA0_IN : in  std_logic_vector(127 downto 0);
    DATA1_IN : in  std_logic_vector(127 downto 0);
    DATA2_IN : in  std_logic_vector(127 downto 0);
    DATA3_IN : in  std_logic_vector(127 downto 0);
    ENA0_IN  : in  std_logic;
    ENA1_IN  : in  std_logic;
    ENA2_IN  : in  std_logic;
    ENA3_IN  : in  std_logic;
    SOP0_IN  : in  std_logic;
    SOP1_IN  : in  std_logic;
    SOP2_IN  : in  std_logic;
    SOP3_IN  : in  std_logic;
    EOP0_IN  : in  std_logic;
    EOP1_IN  : in  std_logic;
    EOP2_IN  : in  std_logic;
    EOP3_IN  : in  std_logic;
    ERR0_IN  : in  std_logic;
    ERR1_IN  : in  std_logic;
    ERR2_IN  : in  std_logic;
    ERR3_IN  : in  std_logic;
    MTY0_IN  : in  std_logic_vector(3 downto 0);
    MTY1_IN  : in  std_logic_vector(3 downto 0);
    MTY2_IN  : in  std_logic_vector(3 downto 0);
    MTY3_IN  : in  std_logic_vector(3 downto 0);
    -- Output (de-segmented):
    DATA_OUT : out std_logic_vector(511 downto 0);
    ENA_OUT  : out std_logic;
    SOP_OUT  : out std_logic;
    EOP_OUT  : out std_logic;
    ERR_OUT  : out std_logic;
    MTY_OUT  : out std_logic_vector(5 downto 0);
    -- Error:
    CLR_ERR  : in  std_logic;
    ERR      : out std_logic_vector(3 downto 0)
  );
  END COMPONENT;

  COMPONENT  DSP_RX_ETH_TO_IP is
  port (
    RST             : in  std_logic;
    CLK             : in  std_logic;
    TESTPIN         : in  std_logic;
    -- Data input (Ethernet):
    DATA_IN         : in  std_logic_vector(511 downto 0);
    ENA_IN          : in  std_logic;
    SOP_IN          : in  std_logic;
    EOP_IN          : in  std_logic;
    ERR_IN          : in  std_logic;
    MTY_IN          : in  std_logic_vector(5 downto 0);
    -- Data output (IP):
    DATA_OUT        : out std_logic_vector(511 downto 0);
    ENA_OUT         : out std_logic;
    SOP_OUT         : out std_logic;
    EOP_OUT         : out std_logic;
    ERR_OUT         : out std_logic;
    MTY_OUT         : out std_logic_vector(5 downto 0);
    -- Meta output:
    ETH_MAC_DST_OUT : out std_logic_vector(47 downto 0);
    ETH_MAC_SRC_OUT : out std_logic_vector(47 downto 0);
    -- Error:
    CLR_ERR         : in  std_logic;
    ERR             : out std_logic_vector(3 downto 0)
  );
  END COMPONENT;
  
  COMPONENT DSP_RX_IP_TO_UDP is
  port (
    RST             : in  std_logic;
    CLK             : in  std_logic;
    TESTPIN         : in  std_logic;
    -- Data input (IP):
    DATA_IN         : in  std_logic_vector(511 downto 0);
    ENA_IN          : in  std_logic;
    SOP_IN          : in  std_logic;
    EOP_IN          : in  std_logic;
    ERR_IN          : in  std_logic;
    MTY_IN          : in  std_logic_vector(5 downto 0);
    -- Meta data input:
    ETH_MAC_DST_IN  : in  std_logic_vector(47 downto 0);
    ETH_MAC_SRC_IN  : in  std_logic_vector(47 downto 0);
    -- Data output (UDP):
    DATA_OUT        : out std_logic_vector(511 downto 0);
    ENA_OUT         : out std_logic;
    SOP_OUT         : out std_logic;
    EOP_OUT         : out std_logic;
    ERR_OUT         : out std_logic;
    MTY_OUT         : out std_logic_vector(5 downto 0);
    -- Meta data output:
    ETH_MAC_DST_OUT : out std_logic_vector(47 downto 0);
    ETH_MAC_SRC_OUT : out std_logic_vector(47 downto 0);
    IP_LENGTH_OUT   : out std_logic_vector(15 downto 0);
    IP_ADR_DST_OUT  : out std_logic_vector(31 downto 0);
    IP_ADR_SRC_OUT  : out std_logic_vector(31 downto 0);
    -- Error:
    CLR_ERR         : in  std_logic;
    ERR             : out std_logic_vector(5 downto 0)
  );
  END COMPONENT;
  
  -----------------------------------------------------------------------------
  -- INIT MACHINE
  -----------------------------------------------------------------------------
  COMPONENT dsp_init IS
  PORT (
    clk                 : IN  STD_LOGIC;
    rst                 : IN  STD_LOGIC;
    init_button         : IN  STD_LOGIC;
    init_err            : OUT STD_LOGIC;
    clr_err             : IN STD_LOGIC;
    sda                 : INOUT STD_LOGIC;
    scl                 : INOUT STD_LOGIC;
    i2c_rst             : OUT STD_LOGIC
    );
  END COMPONENT dsp_init;

  COMPONENT dsp_init_mem IS
    PORT (
      addr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      data : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
      );
  END COMPONENT dsp_init_mem;


  
  -----------------------------------------------------------------------------
  -- CTRL UART
  -----------------------------------------------------------------------------

  COMPONENT dsp_ctrl_uart IS
  PORT (
    clk         : IN STD_LOGIC;
    rst         : IN STD_LOGIC;
    
    txd         : OUT STD_LOGIC;
    rxd         : IN STD_lOGIC;

    data        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    data_wr     : OUT STD_LOGIC;
    addr        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    data_out    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

    err_out     : OUT STD_LOGIC
    );

  END COMPONENT dsp_ctrl_uart;

  
  -----------------------------------------------------------------------------
  -- QSFP
  -----------------------------------------------------------------------------
  COMPONENT dsp_eth IS
  PORT (

    -- CLOCKS AND RESETS
    init_clk            : IN STD_LOGIC;
    sys_reset           : IN STD_LOGIC;

    refclk_gty_p        : IN STD_LOGIC;
    refclk_gty_n        : IN STD_LOGIC;

    txusrclk2           : OUT STD_LOGIC;
    gt_ref_clk_out      : OUT STD_LOGIC;
    tx_rdyout           : OUT STD_LOGIC;
    
    -- GT
    eth_rx1_p           : IN STD_LOGIC;
    eth_rx1_n           : IN STD_LOGIC;
    eth_rx2_p           : IN STD_LOGIC;
    eth_rx2_n           : IN STD_LOGIC;
    eth_rx3_p           : IN STD_LOGIC;
    eth_rx3_n           : IN STD_LOGIC;
    eth_rx4_p           : IN STD_LOGIC;
    eth_rx4_n           : IN STD_LOGIC;
    
    eth_tx1_p           : OUT STD_LOGIC;
    eth_tx1_n           : OUT STD_LOGIC;
    eth_tx2_p           : OUT STD_LOGIC;
    eth_tx2_n           : OUT STD_LOGIC;
    eth_tx3_p           : OUT STD_LOGIC;
    eth_tx3_n           : OUT STD_LOGIC;
    eth_tx4_p           : OUT STD_LOGIC;
    eth_tx4_n           : OUT STD_LOGIC;

    data_size           : IN STD_LOGIC_VECTOR(  7 DOWNTO 0);

    data_in             : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    data_in_valid       : IN STD_LOGIC;
    start_packet        : IN STD_LOGIC;
    
    status              : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

    enable              : IN STD_LOGIC;

    dhcpdiscover_trig   : IN STD_LOGIC;
    arpbeat_enable      : IN STD_LOGIC;

    mcast_offs          : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
    heap_offs           : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    heap_size           : IN STD_LOGIC_VECTOR(47 DOWNTO 0);

    dst_mac_addr        : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    dst_ip_addr         : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

    src_mac_addr        : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    src_ip_addr         : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  
    dst_udp_port        : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    src_udp_port        : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
 
    pol_id              : IN STD_LOGIC_VECTOR( 1 DOWNTO 0);
    timestamp           : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    adc_sat_count       : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    adc_sat_flag        : IN STD_LOGIC;
    ndiode_flag         : IN STD_LOGIC;

    item_pointer_01     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_02     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_03     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_04     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_05     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_06     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_07     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_08     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_09     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_10     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    item_pointer_11     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);

    data_to_buf         : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    data_to_buf_wr      : OUT STD_LOGIC;
    data_from_buf       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    addr_for_buf        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);

      --data rx signals
   rx_clk           : OUT STD_LOGIC;
   rx_out_data      : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
   rx_out_ena       : OUT STD_LOGIC;
   rx_out_sop       : OUT STD_LOGIC;
   rx_out_eop       : OUT STD_LOGIC;
   rx_out_err       : OUT STD_LOGIC;
   rx_out_mty       : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);

    clr_err             : IN STD_LOGIC
  );
  END COMPONENT dsp_eth;


  
  -----------------------------------------------------------------------------
  -- CMAC
  -----------------------------------------------------------------------------
  COMPONENT cmac_usplus_0 IS
    PORT (
      sys_reset                         : IN STD_LOGIC;
      init_clk                          : IN STD_LOGIC;

      -- GT
      -------------------------------------------------------------------------------
      gt_ref_clk_p                      : IN STD_LOGIC;
      gt_ref_clk_n                      : IN STD_LOGIC;

      gt_rxp_in                        : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      gt_rxn_in                        : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--      gt1_rxp_in                        : IN STD_LOGIC;
--      gt1_rxn_in                        : IN STD_LOGIC;
--      gt2_rxp_in                        : IN STD_LOGIC;
--      gt2_rxn_in                        : IN STD_LOGIC;
--      gt3_rxp_in                        : IN STD_LOGIC;
--      gt3_rxn_in                        : IN STD_LOGIC;

      gt_txn_out                       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      gt_txp_out                       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
--      gt1_txn_out                       : OUT STD_LOGIC;
--      gt1_txp_out                       : OUT STD_LOGIC;
--      gt2_txn_out                       : OUT STD_LOGIC;
--      gt2_txp_out                       : OUT STD_LOGIC;
--      gt3_txn_out                       : OUT STD_LOGIC;
--      gt3_txp_out                       : OUT STD_LOGIC;

      gt_txusrclk2                      : OUT STD_LOGIC;
      gt_rxusrclk2                      : OUT STD_LOGIC;

      gt_loopback_in                    : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      gt_rxrecclkout                    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      gt_powergoodout                   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      gt_ref_clk_out                    : OUT STD_LOGIC;
      gtwiz_reset_tx_datapath           : IN STD_LOGIC;
      gtwiz_reset_rx_datapath           : IN STD_LOGIC;

      -- LBUS RX
      -------------------------------------------------------------------------------
      rx_dataout0                       : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      rx_dataout1                       : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      rx_dataout2                       : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      rx_dataout3                       : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);

      rx_mtyout0                        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      rx_mtyout1                        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      rx_mtyout2                        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      rx_mtyout3                        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

      rx_enaout0                        : OUT STD_LOGIC;
      rx_enaout1                        : OUT STD_LOGIC;
      rx_enaout2                        : OUT STD_LOGIC;
      rx_enaout3                        : OUT STD_LOGIC;

      rx_sopout0                        : OUT STD_LOGIC;
      rx_sopout1                        : OUT STD_LOGIC;
      rx_sopout2                        : OUT STD_LOGIC;
      rx_sopout3                        : OUT STD_LOGIC;

      rx_eopout0                        : OUT STD_LOGIC;
      rx_eopout1                        : OUT STD_LOGIC;
      rx_eopout2                        : OUT STD_LOGIC;
      rx_eopout3                        : OUT STD_LOGIC;

      rx_errout0                        : OUT STD_LOGIC;
      rx_errout1                        : OUT STD_LOGIC;
      rx_errout2                        : OUT STD_LOGIC;
      rx_errout3                        : OUT STD_LOGIC;

      
      -- LBUS TX
      -------------------------------------------------------------------------------
      tx_datain0                        : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      tx_datain1                        : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      tx_datain2                        : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      tx_datain3                        : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      
      tx_mtyin0                         : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      tx_mtyin1                         : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      tx_mtyin2                         : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      tx_mtyin3                         : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

      tx_enain0                         : IN STD_LOGIC;
      tx_enain1                         : IN STD_LOGIC;
      tx_enain2                         : IN STD_LOGIC;
      tx_enain3                         : IN STD_LOGIC;

      tx_sopin0                         : IN STD_LOGIC;
      tx_sopin1                         : IN STD_LOGIC;
      tx_sopin2                         : IN STD_LOGIC;
      tx_sopin3                         : IN STD_LOGIC;

      tx_eopin0                         : IN STD_LOGIC;
      tx_eopin1                         : IN STD_LOGIC;
      tx_eopin2                         : IN STD_LOGIC;
      tx_eopin3                         : IN STD_LOGIC;

      tx_errin0                         : IN STD_LOGIC;
      tx_errin1                         : IN STD_LOGIC;
      tx_errin2                         : IN STD_LOGIC;
      tx_errin3                         : IN STD_LOGIC;

      tx_ovfout                         : OUT STD_LOGIC;
      tx_rdyout                         : OUT STD_LOGIC;
      tx_unfout                         : OUT STD_LOGIC;

      -------------------------------------------------------------------------------
      usr_rx_reset                      : OUT STD_LOGIC;
      stat_rx_aligned                   : OUT STD_LOGIC;
      stat_rx_aligned_err               : OUT STD_LOGIC;
      stat_rx_bad_code                  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      stat_rx_bad_fcs                   : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      stat_rx_bad_preamble              : OUT STD_LOGIC;
      stat_rx_bad_sfd                   : OUT STD_LOGIC;
      stat_rx_bip_err_0                 : OUT STD_LOGIC;
      stat_rx_bip_err_1                 : OUT STD_LOGIC;
      stat_rx_bip_err_10                : OUT STD_LOGIC;
      stat_rx_bip_err_11                : OUT STD_LOGIC;
      stat_rx_bip_err_12                : OUT STD_LOGIC;
      stat_rx_bip_err_13                : OUT STD_LOGIC;
      stat_rx_bip_err_14                : OUT STD_LOGIC;
      stat_rx_bip_err_15                : OUT STD_LOGIC;
      stat_rx_bip_err_16                : OUT STD_LOGIC;
      stat_rx_bip_err_17                : OUT STD_LOGIC;
      stat_rx_bip_err_18                : OUT STD_LOGIC;
      stat_rx_bip_err_19                : OUT STD_LOGIC;
      stat_rx_bip_err_2                 : OUT STD_LOGIC;
      stat_rx_bip_err_3                 : OUT STD_LOGIC;
      stat_rx_bip_err_4                 : OUT STD_LOGIC;
      stat_rx_bip_err_5                 : OUT STD_LOGIC;
      stat_rx_bip_err_6                 : OUT STD_LOGIC;
      stat_rx_bip_err_7                 : OUT STD_LOGIC;
      stat_rx_bip_err_8                 : OUT STD_LOGIC;
      stat_rx_bip_err_9                 : OUT STD_LOGIC;
      stat_rx_block_lock                : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      stat_rx_broadcast                 : OUT STD_LOGIC;
      stat_rx_fragment                  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      stat_rx_framing_err_0             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_1             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_10            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_11            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_12            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_13            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_14            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_15            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_16            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_17            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_18            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_19            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_2             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_3             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_4             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_5             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_6             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_7             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_8             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_9             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      stat_rx_framing_err_valid_0       : OUT STD_LOGIC;
      stat_rx_framing_err_valid_1       : OUT STD_LOGIC;
      stat_rx_framing_err_valid_10      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_11      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_12      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_13      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_14      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_15      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_16      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_17      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_18      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_19      : OUT STD_LOGIC;
      stat_rx_framing_err_valid_2       : OUT STD_LOGIC;
      stat_rx_framing_err_valid_3       : OUT STD_LOGIC;
      stat_rx_framing_err_valid_4       : OUT STD_LOGIC;
      stat_rx_framing_err_valid_5       : OUT STD_LOGIC;
      stat_rx_framing_err_valid_6       : OUT STD_LOGIC;
      stat_rx_framing_err_valid_7       : OUT STD_LOGIC;
      stat_rx_framing_err_valid_8       : OUT STD_LOGIC;
      stat_rx_framing_err_valid_9       : OUT STD_LOGIC;
      stat_rx_got_signal_os             : OUT STD_LOGIC;
      stat_rx_hi_ber                    : OUT STD_LOGIC;
      stat_rx_inrangeerr                : OUT STD_LOGIC;
      stat_rx_internal_local_fault      : OUT STD_LOGIC;
      stat_rx_jabber                    : OUT STD_LOGIC;
      stat_rx_local_fault               : OUT STD_LOGIC;
      stat_rx_mf_err                    : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      stat_rx_mf_len_err                : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      stat_rx_mf_repeat_err             : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      stat_rx_misaligned                : OUT STD_LOGIC;
      stat_rx_multicast                 : OUT STD_LOGIC;
      stat_rx_oversize                  : OUT STD_LOGIC;
      stat_rx_packet_1024_1518_bytes    : OUT STD_LOGIC;
      stat_rx_packet_128_255_bytes      : OUT STD_LOGIC;
      stat_rx_packet_1519_1522_bytes    : OUT STD_LOGIC;
      stat_rx_packet_1523_1548_bytes    : OUT STD_LOGIC;
      stat_rx_packet_1549_2047_bytes    : OUT STD_LOGIC;
      stat_rx_packet_2048_4095_bytes    : OUT STD_LOGIC;
      stat_rx_packet_256_511_bytes      : OUT STD_LOGIC;
      stat_rx_packet_4096_8191_bytes    : OUT STD_LOGIC;
      stat_rx_packet_512_1023_bytes     : OUT STD_LOGIC;
      stat_rx_packet_64_bytes           : OUT STD_LOGIC;
      stat_rx_packet_65_127_bytes       : OUT STD_LOGIC;
      stat_rx_packet_8192_9215_bytes    : OUT STD_LOGIC;
      stat_rx_packet_bad_fcs            : OUT STD_LOGIC;
      stat_rx_packet_large              : OUT STD_LOGIC;
      stat_rx_packet_small              : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
 
      ctl_rx_enable                     : IN STD_LOGIC;
      ctl_rx_force_resync               : IN STD_LOGIC;
      ctl_rx_test_pattern               : IN STD_LOGIC;
      core_rx_reset                     : IN STD_LOGIC;
      rx_clk                            : IN STD_LOGIC;

      stat_rx_received_local_fault      : OUT STD_LOGIC;
      stat_rx_remote_fault              : OUT STD_LOGIC;
      stat_rx_status                    : OUT STD_LOGIC;
      stat_rx_stomped_fcs               : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      stat_rx_synced                    : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      stat_rx_synced_err                : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      stat_rx_test_pattern_mismatch     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      stat_rx_toolong                   : OUT STD_LOGIC;
      stat_rx_total_bytes               : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      stat_rx_total_good_bytes          : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
      stat_rx_total_good_packets        : OUT STD_LOGIC;
      stat_rx_total_packets             : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      stat_rx_truncated                 : OUT STD_LOGIC;
      stat_rx_undersize                 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      stat_rx_unicast                   : OUT STD_LOGIC;
      stat_rx_vlan                      : OUT STD_LOGIC;
      stat_rx_pcsl_demuxed              : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      stat_rx_pcsl_number_0             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_1             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_10            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_11            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_12            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_13            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_14            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_15            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_16            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_17            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_18            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_19            : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_2             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_3             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_4             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_5             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_6             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_7             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_8             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_rx_pcsl_number_9             : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      stat_tx_bad_fcs                   : OUT STD_LOGIC;
      stat_tx_broadcast                 : OUT STD_LOGIC;
      stat_tx_frame_error               : OUT STD_LOGIC;
      stat_tx_local_fault               : OUT STD_LOGIC;
      stat_tx_multicast                 : OUT STD_LOGIC;
      stat_tx_packet_1024_1518_bytes    : OUT STD_LOGIC;
      stat_tx_packet_128_255_bytes      : OUT STD_LOGIC;
      stat_tx_packet_1519_1522_bytes    : OUT STD_LOGIC;
      stat_tx_packet_1523_1548_bytes    : OUT STD_LOGIC;
      stat_tx_packet_1549_2047_bytes    : OUT STD_LOGIC;
      stat_tx_packet_2048_4095_bytes    : OUT STD_LOGIC;
      stat_tx_packet_256_511_bytes      : OUT STD_LOGIC;
      stat_tx_packet_4096_8191_bytes    : OUT STD_LOGIC;
      stat_tx_packet_512_1023_bytes     : OUT STD_LOGIC;
      stat_tx_packet_64_bytes           : OUT STD_LOGIC;
      stat_tx_packet_65_127_bytes       : OUT STD_LOGIC;
      stat_tx_packet_8192_9215_bytes    : OUT STD_LOGIC;
      stat_tx_packet_large              : OUT STD_LOGIC;
      stat_tx_packet_small              : OUT STD_LOGIC;
      stat_tx_total_bytes               : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      stat_tx_total_good_bytes          : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
      stat_tx_total_good_packets        : OUT STD_LOGIC;
      stat_tx_total_packets             : OUT STD_LOGIC;
      stat_tx_unicast                   : OUT STD_LOGIC;
      stat_tx_vlan                      : OUT STD_LOGIC;

      ctl_tx_enable                     : IN STD_LOGIC;
      ctl_tx_send_idle                  : IN STD_LOGIC;
      ctl_tx_send_rfi                   : IN STD_LOGIC;
      ctl_tx_send_lfi                   : IN STD_LOGIC;
      tx_preamblein                     : IN STD_LOGIC_VECTOR(55 DOWNTO 0);
      ctl_tx_test_pattern               : IN STD_LOGIC;
      core_tx_reset                     : IN STD_LOGIC;

      usr_tx_reset                      : OUT STD_LOGIC;
      core_drp_reset                    : IN STD_LOGIC;
      drp_clk                           : IN STD_LOGIC;
      drp_addr                          : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      drp_di                            : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      drp_en                            : IN STD_LOGIC;
      drp_do                            : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      drp_rdy                           : OUT STD_LOGIC;
      drp_we                            : IN STD_LOGIC
      );
  END COMPONENT cmac_usplus_0;


  
  -----------------------------------------------------------------------------
  -- SIGNAL PROCESSING
  -----------------------------------------------------------------------------

  component DSP_LATCH_ASYNC is
    generic(DATA_IN : integer);
    port(
      CLK  : in  std_logic;
      DIN  : in  std_logic_vector(DATA_IN-1 downto 0);
      DOUT : out std_logic_vector(DATA_IN-1 downto 0)
      );
  end component;

  component DSP_SIGNAL_PROCESSING512 is
    generic(
      INCLUDE_WAVE_DATA_GEN : integer := 1;     -- 0, 1
      OPERATING_MODE        : string  := "EDD"
    );
    port(
      RST_IN                : in  std_logic; -- Reset.
      CLK_IN                : in  std_logic; -- 218.75 MHz.
      -- Configuration and control inputs:
      USE_1PPS_IN           : in  std_logic := '1';
      MODE_EDD_IN           : in  std_logic_vector(  1 downto 0) := "00"; -- EDD mode 00=8bit 01=unused 10=10bit 11=12bit.
      MODE_WAVE_DATA_GEN_IN : in  std_logic_vector(  7 downto 0) := X"00";
      AMPL_WAVE_DATA_GEN_IN : in  std_logic_vector(  7 downto 0) := X"00";
      DESKEW_IN             : in  std_logic_vector(  7 downto 0) := X"00";
      FLIP_SIGNAL_SPEC_IN   : in  std_logic := '0';
      PRE_DECIMATION_FAC_IN : in  std_logic_vector(  3 downto 0) := X"0";
      DATA_SIZE_IN          : in  std_logic_vector(  7 downto 0) := X"40";  -- Number of 512-bit words per packet.
      MCAST_SIZE_IN         : in  std_logic_vector(  7 downto 0) := X"00";  -- Number of multicast groups to spread out packets of each polarisation.
      HEAP_SIZE_IN          : in  std_logic_vector( 11 downto 0) := X"000"; -- Number of packets per heap.
      NOISEDIODE_IN         : in  std_logic := '0';
      SYNC_TIMESTAMP_IN     : in  std_logic_vector( 63 downto 0) := (others => '0');
      SYNC_REQUEST_IN       : in  std_logic := '0';
      DATA_ENABLE1_IN       : in  std_logic := '1';
      DATA_ENABLE2_IN       : in  std_logic := '1';
      -- Data input:
      DATA_IN               : in  std_logic_vector(383 downto 0);
      DATA_IN_VALID         : in  std_logic := '0';
      -- Monitor output:
      DMONITOR_OUT          : out std_logic_vector(383 downto 0);
      DMONITOR_OUT_VALID    : out std_logic;
      -- Data output interface 0:
      IF0_DATA_OUT          : out std_logic_vector(511 downto 0);
      IF0_DATA_OUT_VALID    : out std_logic;
      IF0_START_PACKET      : out std_logic;
      IF0_DESTINATION_OUT   : out std_logic_vector(  1 downto 0);
      IF0_MCAST_OFFS_OUT    : out std_logic_vector(  7 downto 0); -- Offset to be added to base multicast address.
      IF0_HEAP_OFFS_OUT     : out std_logic_vector( 47 downto 0); -- Heap offset in bytes.
      IF0_HEAP_SIZE_OUT     : out std_logic_vector( 47 downto 0); -- Heap size in bytes.
      IF0_TIMESTAMP_OUT     : out std_logic_vector( 47 downto 0);
      IF0_POL_ID_OUT        : out std_logic;
      IF0_SATURATION_OUT    : out std_logic_vector( 15 downto 0);
      IF0_SATURATION_FLAG   : out std_logic;
      IF0_NOISEDIODE_OUT    : out std_logic;
      -- Data output interface 1:
      IF1_DATA_OUT          : out std_logic_vector(511 downto 0);
      IF1_DATA_OUT_VALID    : out std_logic;
      IF1_START_PACKET      : out std_logic;
      IF1_DESTINATION_OUT   : out std_logic_vector(  1 downto 0);
      IF1_MCAST_OFFS_OUT    : out std_logic_vector(  7 downto 0); -- Offset to be added to base multicast address.
      IF1_HEAP_OFFS_OUT     : out std_logic_vector( 47 downto 0); -- Heap offset in bytes.
      IF1_HEAP_SIZE_OUT     : out std_logic_vector( 47 downto 0); -- Heap size in bytes.
      IF1_TIMESTAMP_OUT     : out std_logic_vector( 47 downto 0);
      IF1_POL_ID_OUT        : out std_logic;
      IF1_SATURATION_OUT    : out std_logic_vector( 15 downto 0);
      IF1_SATURATION_FLAG   : out std_logic;
      IF1_NOISEDIODE_OUT    : out std_logic;
      -- Sensor values:
      TIME_AT_1PPS_OUT      : out std_logic_vector( 63 downto 0);
      EDDY_STATUS_OUT       : out std_logic_vector( 31 downto 0);
      -- Debug:
      TESTPIN1              : in  std_logic := '0';
      TESTPIN2              : in  std_logic := '0';
      TEST_VALUE_IN         : in  std_logic_vector( 31 downto 0);
      USER_LED1             : out std_logic;
      USER_LED2             : out std_logic;
      USER_LED3             : out std_logic;
      CLR_ERR               : in  std_logic := '0';
      ERR                   : out std_logic_vector( 15 downto 0)
    );
  end component;


  -----------------------------------------------------------------------------
  -- ILA0
  -----------------------------------------------------------------------------
  COMPONENT ila_0 IS
    PORT (
      clk       : IN STD_LOGIC;
      probe0    : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      probe1    : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      probe2    : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      probe3    : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      probe4    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe5    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe6    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe7    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      probe8    : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe9    : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe10   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe11   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe12   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe13   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe14   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe15   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe16   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe17   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe18   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe19   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe20   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe21   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe22   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe23   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe24   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe25   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe26   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe27   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe28   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe29   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe30   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      probe31   : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
      );
  END COMPONENT ila_0;

  
  -----------------------------------------------------------------------------
  -- ILA1
  -----------------------------------------------------------------------------
  COMPONENT ila_1 IS
    PORT (
      clk    : IN STD_LOGIC;
      probe0 : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
      probe1 : IN STD_LOGIC_VECTOR(  5 DOWNTO 0);
      probe2 : IN STD_LOGIC_VECTOR(  0 DOWNTO 0);
      probe3 : IN STD_LOGIC_VECTOR(  0 DOWNTO 0);
      probe4 : IN STD_LOGIC_VECTOR(  0 DOWNTO 0);
      probe5 : IN STD_LOGIC_VECTOR(  0 DOWNTO 0);
      probe6 : IN STD_LOGIC_VECTOR(  0 DOWNTO 0);
      probe7 : IN STD_LOGIC_VECTOR(  0 DOWNTO 0)
      );
  END COMPONENT ila_1;

  
END PACKAGE dsp_components;
