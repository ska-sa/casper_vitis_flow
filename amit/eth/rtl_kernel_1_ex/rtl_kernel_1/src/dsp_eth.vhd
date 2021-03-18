-- dsp_eth.vhd	10. December 2018	by claus


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.DSP_COMPONENTS.ALL;
USE WORK.DSP_PARAMETERS.ALL;

LIBRARY UNISIM;
USE UNISIM.VComponents.all;


ENTITY dsp_eth IS
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
END dsp_eth;



ARCHITECTURE behaviour OF dsp_eth IS

  SIGNAL txusrclk2_sig          : STD_LOGIC;
  SIGNAL rxusrclk2_sig          : STD_LOGIC;
  SIGNAL gt_ref_clk_out_sig          : STD_LOGIC;
  SIGNAL tx_ovfout              : STD_LOGIC;
  
  SIGNAL usr_rx_reset           : STD_LOGIC;
  SIGNAL usr_tx_reset_sig       : STD_LOGIC;

  SIGNAL fst_src_fifo_din       : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL fst_src_fifo_wr_en     : STD_LOGIC;
  SIGNAL fst_src_fifo_rd_en     : STD_LOGIC;
  SIGNAL fst_src_fifo_dout      : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL fst_src_fifo_full      : STD_LOGIC;
  SIGNAL fst_src_fifo_empty     : STD_LOGIC;
  SIGNAL fst_src_send           : STD_LOGIC;
  SIGNAL fst_src_send_busy      : STD_LOGIC;
  SIGNAL fst_src_last_word_empty : STD_LOGIC_VECTOR(5 DOWNTO 0);

  
  SIGNAL snd_src_fifo_din       : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL snd_src_fifo_wr_en     : STD_LOGIC;
  SIGNAL snd_src_fifo_rd_en     : STD_LOGIC;
  SIGNAL snd_src_fifo_dout      : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL snd_src_fifo_full      : STD_LOGIC;
  SIGNAL snd_src_fifo_empty     : STD_LOGIC;
  SIGNAL snd_src_send           : STD_LOGIC;
  SIGNAL snd_src_send_busy      : STD_LOGIC;
  SIGNAL snd_src_last_word_empty : STD_LOGIC_VECTOR(5 DOWNTO 0);
  SIGNAL snd_src_data_size      : STD_LOGIC_VECTOR(7 DOWNTO 0);
  

  SIGNAL cc_fifo_dout           : STD_LOGIC_VECTOR(512 DOWNTO 0);
  SIGNAL cc_fifo_rd_en          : STD_LOGIC;
  SIGNAL cc_fifo_empty          : STD_LOGIC;

  SIGNAL header                 : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL header_size            : STD_LOGIC_VECTOR(  3 DOWNTO 0);
  SIGNAL header_valid           : STD_LOGIC;
  SIGNAL header_last_word_empty : STD_LOGIC_VECTOR(  5 DOWNTO 0);
  SIGNAL header_word_sel        : STD_LOGIC_VECTOR(  3 DOWNTO 0);

  SIGNAL chksum_data            : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL chksum_start           : STD_LOGIC;
  SIGNAL chksum_add             : STD_LOGIC;
  SIGNAL chksum_finish          : STD_LOGIC;
  SIGNAL chksum_done            : STD_LOGIC;
  SIGNAL chksum_iph             : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL chksum_udp             : STD_LOGIC_VECTOR(15 DOWNTO 0);

  SIGNAL gt_powergoodout        : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL stat_rx_local_fault    : STD_LOGIC;

  SIGNAL status_send            : STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL rec_err                : STD_LOGIC_VECTOR( 3 DOWNTO 0);

  -- LBUS TX
  -----------------------------------------------------------------------------
  SIGNAL tx_datain0             : STD_LOGIC_VECTOR(127 DOWNTO 0);
  SIGNAL tx_datain1             : STD_LOGIC_VECTOR(127 DOWNTO 0);
  SIGNAL tx_datain2             : STD_LOGIC_VECTOR(127 DOWNTO 0);
  SIGNAL tx_datain3             : STD_LOGIC_VECTOR(127 DOWNTO 0);

  SIGNAL tx_enain0              : STD_LOGIC;
  SIGNAL tx_enain1              : STD_LOGIC;
  SIGNAL tx_enain2              : STD_LOGIC;
  SIGNAL tx_enain3              : STD_LOGIC;

  SIGNAL tx_eopin0              : STD_LOGIC;
  SIGNAL tx_eopin1              : STD_LOGIC;
  SIGNAL tx_eopin2              : STD_LOGIC;
  SIGNAL tx_eopin3              : STD_LOGIC;

  SIGNAL tx_errin0              : STD_LOGIC;
  SIGNAL tx_errin1              : STD_LOGIC;
  SIGNAL tx_errin2              : STD_LOGIC;
  SIGNAL tx_errin3              : STD_LOGIC;
  
  SIGNAL tx_sopin0              : STD_LOGIC;
  SIGNAL tx_sopin1              : STD_LOGIC;
  SIGNAL tx_sopin2              : STD_LOGIC;
  SIGNAL tx_sopin3              : STD_LOGIC;

  SIGNAL tx_mtyin0              : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL tx_mtyin1              : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL tx_mtyin2              : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL tx_mtyin3              : STD_LOGIC_VECTOR(3 DOWNTO 0);

  SIGNAL tx_rdyout_int          : STD_LOGIC;
  SIGNAL tx_unfout              : STD_LOGIC;

  SIGNAL ctl_tx_enable          : STD_LOGIC;
  SIGNAL ctl_rx_enable          : STD_LOGIC;
  SIGNAL ctl_tx_send_rfi        : STD_LOGIC;
  SIGNAL ctl_tx_send_lfi        : STD_LOGIC := '0';
  SIGNAL stat_rx_aligned        : STD_LOGIC;
  SIGNAL tx_preamblein          :  STD_LOGIC_VECTOR(55 DOWNTO 0) := (OTHERS => '0');
  SIGNAL stat_rx_aligned_err        : STD_LOGIC;
  SIGNAL stat_rx_status             : STD_LOGIC;
  SIGNAL gtwiz_reset_rx_datapath    : STD_LOGIC;
  SIGNAL stat_rx_misaligned     : STD_LOGIC;
  SIGNAL core_reset             : STD_LOGIC;
  SIGNAL dsp_reset             : STD_LOGIC;

  -- LBUS RX
  -----------------------------------------------------------------------------
  SIGNAL rx_dataout0            : STD_LOGIC_VECTOR(127 DOWNTO 0);
  SIGNAL rx_dataout1            : STD_LOGIC_VECTOR(127 DOWNTO 0);
  SIGNAL rx_dataout2            : STD_LOGIC_VECTOR(127 DOWNTO 0);
  SIGNAL rx_dataout3            : STD_LOGIC_VECTOR(127 DOWNTO 0);

  SIGNAL rx_enaout0             : STD_LOGIC;
  SIGNAL rx_enaout1             : STD_LOGIC;
  SIGNAL rx_enaout2             : STD_LOGIC;
  SIGNAL rx_enaout3             : STD_LOGIC;

  SIGNAL rx_eopout0             : STD_LOGIC;
  SIGNAL rx_eopout1             : STD_LOGIC;
  SIGNAL rx_eopout2             : STD_LOGIC;
  SIGNAL rx_eopout3             : STD_LOGIC;

  SIGNAL rx_errout0             : STD_LOGIC;
  SIGNAL rx_errout1             : STD_LOGIC;
  SIGNAL rx_errout2             : STD_LOGIC;
  SIGNAL rx_errout3             : STD_LOGIC;
  
  SIGNAL rx_sopout0             : STD_LOGIC;
  SIGNAL rx_sopout1             : STD_LOGIC;
  SIGNAL rx_sopout2             : STD_LOGIC;
  SIGNAL rx_sopout3             : STD_LOGIC;

  SIGNAL rx_mtyout0             : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL rx_mtyout1             : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL rx_mtyout2             : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL rx_mtyout3             : STD_LOGIC_VECTOR(3 DOWNTO 0);

  
  -- desegmented LBUS RX
  -----------------------------------------------------------------------------
  SIGNAL rx_data                : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL rx_ena                 : STD_LOGIC;
  SIGNAL rx_sop                 : STD_LOGIC;
  SIGNAL rx_eop                 : STD_LOGIC;
  SIGNAL rx_err                 : STD_LOGIC;
  SIGNAL rx_mty                 : STD_LOGIC_VECTOR(5 DOWNTO 0);  
  
  SIGNAL rx_eth_to_ip_data      : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL rx_eth_to_ip_ena       : STD_LOGIC;
  SIGNAL rx_eth_to_ip_sop       : STD_LOGIC;
  SIGNAL rx_eth_to_ip_eop       : STD_LOGIC;
  SIGNAL rx_eth_to_ip_err       : STD_LOGIC;
  SIGNAL rx_eth_to_ip_mty       : STD_LOGIC_VECTOR(  5 DOWNTO 0);
  
    -- Meta output:
  SIGNAL rx_eth_to_ip_eth_mac_dst   : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL rx_eth_to_ip_eth_mac_src   : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL rx_eth_to_ip_err_out       : STD_LOGIC_VECTOR(3 DOWNTO 0);
  
  SIGNAL rx_ip_to_udp_data      : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL rx_ip_to_udp_ena       : STD_LOGIC;
  SIGNAL rx_ip_to_udp_sop       : STD_LOGIC;
  SIGNAL rx_ip_to_udp_eop       : STD_LOGIC;
  SIGNAL rx_ip_to_udp_err       : STD_LOGIC;
  SIGNAL rx_ip_to_udp_mty       : STD_LOGIC_VECTOR(5 DOWNTO 0);
  
    -- Meta output:
  SIGNAL rx_ip_to_udp_eth_mac_dst   : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL rx_ip_to_udp_eth_mac_src   : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL rx_ip_to_udp_err_out       : STD_LOGIC_VECTOR(5 DOWNTO 0);
  SIGNAL rx_ip_to_udp_ip_len        : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL rx_ip_to_udp_ip_addr_dst   : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL rx_ip_to_udp_ip_addr_src   : STD_LOGIC_VECTOR(31 DOWNTO 0); 
    
  SIGNAL din_fifo                 : STD_LOGIC_VECTOR(  512 DOWNTO 0);

  -- GTX
  SIGNAL gt_rxp_in,gt_rxn_in      : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL gt_txp_out,gt_txn_out    : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL gt_rxuserclk2_i          : STD_LOGIC_VECTOR(3 DOWNTO 0);
  
  
    
BEGIN

  txusrclk2             <= txusrclk2_sig;
  rx_clk                 <= txusrclk2_sig;
  tx_rdyout             <= tx_rdyout_int;

  status(3 DOWNTO 0)    <= gt_powergoodout;
  status(4)             <= stat_rx_aligned;
  status(5)             <= stat_rx_local_fault;
  status(6)             <= stat_rx_status;
  status(7)             <= ctl_rx_enable;
  status(8)             <= ctl_tx_send_rfi;
  status(9)             <= ctl_tx_send_lfi;
  status(10)             <= ctl_tx_enable;
  status(11)             <= usr_rx_reset;
  status(12)             <= usr_tx_reset_sig;
  status(13)             <= status_send(1);
  status(14)             <= status_send(2);
  status(15)             <= status_send(3);
  status(16)             <= '1';
  status(31 DOWNTO 17)   <= (OTHERS => '0');   

  din_fifo <= start_packet & data_in;
  ---- clock crossing fifo for first src data
 --------------------------------------------------------------------------
 DSP_CLOCK_CROSSING_FIFO_inst : dsp_clock_crossing_fifo
  PORT MAP(
    rst                 => sys_reset,
    wr_clk              => init_clk,
    rd_clk              => txusrclk2_sig,
    din                 => din_fifo,--start_packet & data_in,
    wr_en               => data_in_valid,
    rd_en               => cc_fifo_rd_en,
    dout                => cc_fifo_dout,
    full                => OPEN,
    empty               => cc_fifo_empty
    );

  ---- first src fifo for packet data to send
  ---------------------------------------------------------------------------
  DSP_FST_SRC_FIFO_inst : dsp_fst_src_fifo
  PORT MAP (
    clk                 => txusrclk2_sig,
    rst                 => sys_reset,
    din                 => fst_src_fifo_din,
    wr_en               => fst_src_fifo_wr_en,
    rd_en               => fst_src_fifo_rd_en,
    dout                => fst_src_fifo_dout,
    full                => fst_src_fifo_full,
    empty               => fst_src_fifo_empty
    );

  
  ---- second src fifo for packet data to send
  ---------------------------------------------------------------------------
  DSP_SND_SRC_FIFO_inst : dsp_snd_src_fifo
  PORT MAP (
    rst                 => sys_reset,
    wr_clk              => init_clk,
    rd_clk              => txusrclk2_sig,
    din                 => snd_src_fifo_din,
    wr_en               => snd_src_fifo_wr_en,
    rd_en               => snd_src_fifo_rd_en,
    dout                => snd_src_fifo_dout,
    full                => snd_src_fifo_full,
    empty               => snd_src_fifo_empty
    );
  
 ----  header for first src packet
  ---------------------------------------------------------------------------
  DSP_HEADER_inst : dsp_header
  PORT MAP (
    clk                 => txusrclk2_sig,
    rst                 => sys_reset,
    item_pointer_01     => item_pointer_01,
    item_pointer_02     => item_pointer_02,
    item_pointer_03     => item_pointer_03,
    item_pointer_04     => item_pointer_04,
    item_pointer_05     => item_pointer_05,
    item_pointer_06     => item_pointer_06,
    item_pointer_07     => item_pointer_07,
    item_pointer_08     => item_pointer_08,
    item_pointer_09     => item_pointer_09,
    item_pointer_10     => item_pointer_10,
    item_pointer_11     => item_pointer_11,

    data_size           => data_size, 

    mcast_offs          => mcast_offs,
    heap_offs           => heap_offs,
    heap_size           => heap_size,

    mac_dst_addr        => dst_mac_addr,
    mac_src_addr        => src_mac_addr,
    ip_dst_addr         => dst_ip_addr,
    ip_src_addr         => src_ip_addr,

    udp_dst_port        => dst_udp_port,
    udp_src_port        => src_udp_port,

    pol_id              => pol_id,
    timestamp           => timestamp,
    adc_sat_count       => adc_sat_count,
    adc_sat_flag        => adc_sat_flag,
    ndiode_flag         => ndiode_flag,
    
    header              => header,
    header_size         => header_size,
    header_valid        => header_valid,
    header_last_word_empty => header_last_word_empty,
    header_word_sel     => header_word_sel
    );

  
 --  UDP/IP checksum for first src packet
  ---------------------------------------------------------------------------
  DSP_CHKSUM512_UDPIP_inst : dsp_chksum512_udpip
  PORT MAP (
    rst                 => sys_reset,
    clk                 => txusrclk2_sig,
    data                => chksum_data,
    start               => chksum_start,
    add                 => chksum_add,
    finish              => chksum_finish,
    done                => chksum_done,
    iph_chksum          => chksum_iph,
    udp_chksum          => chksum_udp
    );

  
 --  packetize first src data, add header and fill first src fifo
  ---------------------------------------------------------------------------
  DSP_PACKETIZER_inst : dsp_packetizer
  PORT MAP (
    clk                 => txusrclk2_sig,
    rst                 => sys_reset,  

    header              => header,  
    header_size         => header_size,
    header_valid        => header_valid,  
    header_last_word_empty => header_last_word_empty,
    header_word_sel     => header_word_sel,

    chksum_data         => chksum_data,
    chksum_start        => chksum_start,
    chksum_add          => chksum_add,
    chksum_finish       => chksum_finish,
    chksum_done         => chksum_done,

    cc_fifo_data        => cc_fifo_dout,
    cc_fifo_rd_en       => cc_fifo_rd_en,
    cc_fifo_empty       => cc_fifo_empty,

    fst_src_fifo_din    => fst_src_fifo_din,
    fst_src_fifo_wr_en  => fst_src_fifo_wr_en,
    fst_src_fifo_full   => fst_src_fifo_full,
    fst_src_fifo_empty  => fst_src_fifo_empty,
    
    fst_src_send        => fst_src_send,
    fst_src_send_busy   => fst_src_send_busy,
  
    last_word_empty     => fst_src_last_word_empty,

    enable              => enable,
    data_size           => data_size,

    clr_err             => clr_err,
    start_packet_err    => OPEN
  );  


  -- handle second src packets
  ---------------------------------------------------------------------------
--  DSP_SND_SRC_inst : dsp_snd_src
--  PORT MAP (
--    clk                 => txusrclk2_sig,
--    rst                 => sys_reset,
--    snd_src_fifo_din    => OPEN,
--    snd_src_fifo_wr_en  => OPEN,
--    snd_src_fifo_full   => snd_src_fifo_full,
--    snd_src_send        => OPEN,
--    send_busy           => snd_src_send_busy,
--    my_mac_address      => src_mac_addr,
--    my_ip_address       => src_ip_addr,
--    last_word_valid     => OPEN,
----    last_word_valid     => snd_src_last_word_empty,
--    arpbeat_enable      => arpbeat_enable

--    clk                 => txusrclk2_sig,
--    rst                 => sys_reset,
--    snd_src_fifo_din    => snd_src_fifo_din,
--    snd_src_fifo_wr_en  => snd_src_fifo_wr_en,
--    snd_src_fifo_full   => snd_src_fifo_full,
--    snd_src_send        => snd_src_send,
--    send_busy           => snd_src_send_busy,
--    my_mac_address      => src_mac_addr,
--    my_ip_address       => src_ip_addr,
--    last_word_valid     => OPEN,
----    last_word_valid     => snd_src_last_word_empty,
--    arpbeat_enable      => arpbeat_enable
--    );


  -- feed the CMAC via LBUS
  -----------------------------------------------------------------------------
  DSP_SEND_inst : dsp_send
  PORT MAP (
    clk                 => txusrclk2_sig,
    rst                 => sys_reset,
    usr_tx_reset        => usr_tx_reset_sig,
    usr_rx_reset        => usr_rx_reset,

    fst_src_send        => fst_src_send,
    fst_src_send_busy   => fst_src_send_busy,
    fst_src_fifo_data   => fst_src_fifo_dout,
    fst_src_fifo_rd_en  => fst_src_fifo_rd_en,
    fst_src_fifo_empty  => fst_src_fifo_empty,
    fst_src_last_word_empty => fst_src_last_word_empty,

    snd_src_send        => snd_src_send,
    snd_src_send_busy   => snd_src_send_busy,
    snd_src_fifo_data   => snd_src_fifo_dout,
    snd_src_fifo_rd_en  => snd_src_fifo_rd_en,
    snd_src_fifo_empty  => snd_src_fifo_empty,
    snd_src_last_word_empty => snd_src_last_word_empty,
    snd_src_data_size   => snd_src_data_size,

    data_size           => data_size,
    header_size         => header_size,
    
    chksum_iph          => chksum_iph,
    chksum_udp          => chksum_udp,

    tx_datain0          => tx_datain0,
    tx_datain1          => tx_datain1,
    tx_datain2          => tx_datain2,
    tx_datain3          => tx_datain3,

    tx_mtyin0           => tx_mtyin0,
    tx_mtyin1           => tx_mtyin1,
    tx_mtyin2           => tx_mtyin2,
    tx_mtyin3           => tx_mtyin3,

    tx_enain0           => tx_enain0,
    tx_enain1           => tx_enain1,
    tx_enain2           => tx_enain2,
    tx_enain3           => tx_enain3,

    tx_sopin0           => tx_sopin0,
    tx_sopin1           => tx_sopin1,
    tx_sopin2           => tx_sopin2,
    tx_sopin3           => tx_sopin3,

    tx_eopin0           => tx_eopin0,
    tx_eopin1           => tx_eopin1,
    tx_eopin2           => tx_eopin2,
    tx_eopin3           => tx_eopin3,

    tx_errin0           => tx_errin0,
    tx_errin1           => tx_errin1,
    tx_errin2           => tx_errin2,
    tx_errin3           => tx_errin3,

    tx_ovfout           => tx_ovfout,
    tx_rdyout           => tx_rdyout_int,
    tx_unfout           => tx_unfout,

    ctl_tx_enable       => ctl_tx_enable,
    ctl_tx_send_rfi     => ctl_tx_send_rfi,
    ctl_rx_enable       => ctl_rx_enable,

    status              => status_send,

    stat_rx_aligned             => stat_rx_aligned,
    stat_rx_status              => stat_rx_status,
    gtwiz_reset_rx_datapath     => gtwiz_reset_rx_datapath,
    
    core_reset          => core_reset
    );

  
  -- get desegmented data packets from LBUS
  -----------------------------------------------------------------------------
  DSP_RX_LBU_TO_ETH_inst : dsp_rx_lbu_to_eth
  PORT MAP (
    RST                 => sys_reset,
    CLK                 => txusrclk2_sig,
    TESTPIN             => '0',

    DATA0_IN            => rx_dataout0,
    DATA1_IN            => rx_dataout1,
    DATA2_IN            => rx_dataout2,
    DATA3_IN            => rx_dataout3,

    ENA0_IN             => rx_enaout0,
    ENA1_IN             => rx_enaout1,
    ENA2_IN             => rx_enaout2,
    ENA3_IN             => rx_enaout3,

    SOP0_IN             => rx_sopout0,
    SOP1_IN             => rx_sopout1,
    SOP2_IN             => rx_sopout2,
    SOP3_IN             => rx_sopout3,

    EOP0_IN             => rx_eopout0,
    EOP1_IN             => rx_eopout1,
    EOP2_IN             => rx_eopout2,
    EOP3_IN             => rx_eopout3,

    ERR0_IN             => rx_errout0, 
    ERR1_IN             => rx_errout1, 
    ERR2_IN             => rx_errout2, 
    ERR3_IN             => rx_errout3,

    MTY0_IN             => rx_mtyout0,
    MTY1_IN             => rx_mtyout1,
    MTY2_IN             => rx_mtyout2,
    MTY3_IN             => rx_mtyout3,

    DATA_OUT            => rx_data,
    ENA_OUT             => rx_ena,
    SOP_OUT             => rx_sop,
    EOP_OUT             => rx_eop,
    ERR_OUT             => rx_err,
    MTY_OUT             => rx_mty,
    CLR_ERR             => clr_err,
    ERR                 => rec_err
    );
    
  DSP_RX_ETH_TO_IP_inst : dsp_rx_eth_to_ip
  PORT MAP (
    RST             => sys_reset,
    CLK             => txusrclk2_sig,
    TESTPIN         => '0',
    -- Data input (Ethernet):
    DATA_IN         =>  rx_data,
    ENA_IN          =>  rx_ena,
    SOP_IN          =>  rx_sop,
    EOP_IN          =>  rx_eop,
    ERR_IN          =>  rx_err,
    MTY_IN          =>  rx_mty,
    -- Data output (IP):
    DATA_OUT        => rx_eth_to_ip_data,
    ENA_OUT         => rx_eth_to_ip_ena,
    SOP_OUT         => rx_eth_to_ip_sop,
    EOP_OUT         => rx_eth_to_ip_eop,
    ERR_OUT         => rx_eth_to_ip_err,
    MTY_OUT         => rx_eth_to_ip_mty,
    -- Meta output:
    ETH_MAC_DST_OUT => rx_eth_to_ip_eth_mac_dst,
    ETH_MAC_SRC_OUT => rx_eth_to_ip_eth_mac_src,
    -- Error:
    CLR_ERR         =>  '0',
    ERR             =>  rx_eth_to_ip_err_out
  
  );
    
  DSP_RX_IP_TO_UDP_inst : dsp_rx_ip_to_udp
  PORT MAP (
    RST             => sys_reset,
    CLK             => txusrclk2_sig,
    TESTPIN         => '0',
    -- Data input (Ethernet):
    DATA_IN         =>  rx_eth_to_ip_data,
    ENA_IN          =>  rx_eth_to_ip_ena,
    SOP_IN          =>  rx_eth_to_ip_sop,
    EOP_IN          =>  rx_eth_to_ip_eop,
    ERR_IN          =>  rx_eth_to_ip_err,
    MTY_IN          =>  rx_eth_to_ip_mty,
    -- Meta data input:
    ETH_MAC_DST_IN  =>  rx_eth_to_ip_eth_mac_dst,
    ETH_MAC_SRC_IN  =>  rx_eth_to_ip_eth_mac_src,
    -- Data output (IP):
    DATA_OUT        => rx_out_data,
    ENA_OUT         => rx_out_ena,
    SOP_OUT         => rx_out_sop,
    EOP_OUT         => rx_out_eop,
    ERR_OUT         => rx_out_err,
    MTY_OUT         => rx_out_mty,
    -- Meta output:
    ETH_MAC_DST_OUT => rx_ip_to_udp_eth_mac_dst,
    ETH_MAC_SRC_OUT => rx_ip_to_udp_eth_mac_src,
    IP_LENGTH_OUT   => rx_ip_to_udp_ip_len,
    IP_ADR_DST_OUT  => rx_ip_to_udp_ip_addr_dst,
    IP_ADR_SRC_OUT  => rx_ip_to_udp_ip_addr_src,
    -- Error:
    CLR_ERR         =>  '0',
    ERR             =>  rx_ip_to_udp_err_out 
  );
  
  
  -- handle some protocols
  -----------------------------------------------------------------------------
  DSP_PROTOCOLS_inst : dsp_protocols
  PORT MAP (
    clk                         => txusrclk2_sig,
    slow_clk                    => init_clk,
    rst                         => sys_reset,

    src_mac_addr                => src_mac_addr,
    src_ip_addr                 => src_ip_addr,

    data                        => rx_data,
    ena                         => rx_ena,
    sop                         => rx_sop,
    eop                         => rx_eop,
    err                         => rx_err,
    mty                         => rx_mty,

    snd_src_data                => snd_src_fifo_din,
    snd_src_fifo_wr_en          => snd_src_fifo_wr_en,
    snd_src_fifo_full           => snd_src_fifo_full,
    snd_src_last_word_empty     => snd_src_last_word_empty,
    snd_src_data_size           => snd_src_data_size,
    snd_src_send                => snd_src_send,
    snd_src_send_busy           => snd_src_send_busy,

    dhcpdiscover_trig           => dhcpdiscover_trig,

    data_to_buf                 => data_to_buf,
    data_to_buf_wr              => data_to_buf_wr,
    data_from_buf               => data_from_buf,
    addr_for_buf                => addr_for_buf,
    
    packet_rec                  => OPEN,
    clr_err                     => clr_err,
    rec_err                     => rec_err
    );
  
  dsp_reset <= sys_reset OR core_reset;
  -----------------------------------------------------------------------------
  -- CMAC
  -----------------------------------------------------------------------------
  gt_rxp_in <= eth_rx4_p & eth_rx3_p & eth_rx2_p & eth_rx1_p;
  gt_rxn_in <= eth_rx4_n & eth_rx3_n & eth_rx2_n & eth_rx1_n;
  
 eth_tx4_p <= gt_txp_out(3); 
 eth_tx3_p <= gt_txp_out(2); 
 eth_tx2_p <= gt_txp_out(1);
 eth_tx1_p <= gt_txp_out(0);
 eth_tx4_n <= gt_txn_out(3);  
 eth_tx3_n <= gt_txn_out(2); 
 eth_tx2_n <= gt_txn_out(1);
 eth_tx1_n <= gt_txn_out(0);
  
--  cmac_dut_inst : cmac_usplus_0_exdes
--  PORT MAP (
--      gt_rxp_in => gt_rxp_in,
--      gt_rxn_in => gt_rxn_in,
--      gt_txp_out => gt_txp_out,
--      gt_txn_out => gt_txn_out,
  
--           send_continuous_pkts  => '1',
--          lbus_tx_rx_restart_in  => '0',
--       tx_done_led  => tx_done_led_reg,
--         tx_busy_led => tx_busy_led_reg,
  
--           rx_gt_locked_led => rx_gt_locked_led,
--          rx_aligned_led => rx_aligned_led,
--          rx_done_led => rx_done_led,
--          rx_data_fail_led => rx_data_fail_led,
--           rx_busy_led => rx_busy_led,
  
--           sys_reset => sys_reset,
  
--          gt_ref_clk_p => refclk_gty_p,
--           gt_ref_clk_n => refclk_gty_n,
--         init_clk => init_clk
--  );
  
--  gt_rxuserclk2_i <= rxusrclk2_sig & rxusrclk2_sig & rxusrclk2_sig & rxusrclk2_sig;
  
--  I_S_IBERT_inst : COMPONENT in_system_ibert_0
--  PORT MAP (
--    gt0_drpdo_i => x"0000",
--    gt1_drpdo_i => x"0000",
--    gt2_drpdo_i => x"0000",
--    gt3_drpdo_i => x"0000",
--    gt0_drprdy_i => b"0",
--    gt1_drprdy_i => b"0",
--    gt2_drprdy_i => b"0",
--    gt3_drprdy_i => b"0",
--    clk => init_clk,
--    rxoutclk_i => b"0000"
--  );
  
  CMAC_0_inst : cmac_usplus_0
  PORT MAP (

    sys_reset                           => dsp_reset,--sys_reset OR core_reset,
    init_clk                            => init_clk,

    -- GT
    -------------------------------------------------------------------------------
    gt_ref_clk_p                        => refclk_gty_p,
    gt_ref_clk_n                        => refclk_gty_n,

    --  ORIGINAL GTX MAPPING
--     gt0_rxp_in                          => eth_rx2_p,
--    gt0_rxn_in                          => eth_rx2_n,
--    gt1_rxp_in                          => eth_rx3_p,
--    gt1_rxn_in                          => eth_rx3_n, 
--    gt2_rxp_in                          => eth_rx1_p, 
--    gt2_rxn_in                          => eth_rx1_n, 
--    gt3_rxp_in                          => eth_rx4_p, 
--    gt3_rxn_in                          => eth_rx4_n, 
    
--    gt0_txp_out                         => eth_tx2_p, 
--    gt0_txn_out                         => eth_tx2_n, 
--    gt1_txp_out                         => eth_tx3_p, 
--    gt1_txn_out                         => eth_tx3_n, 
--    gt2_txp_out                         => eth_tx1_p, 
--    gt2_txn_out                         => eth_tx1_n, 
--    gt3_txp_out                         => eth_tx4_p, 
--    gt3_txn_out                         => eth_tx4_n, 
    gt_rxp_in                               => gt_rxp_in,
    gt_rxn_in                               => gt_rxn_in,
    
    gt_txp_out                          => gt_txp_out, 
    gt_txn_out                          => gt_txn_out, 

    gt_txusrclk2                        => txusrclk2_sig,
    gt_rxusrclk2                        => rxusrclk2_sig,

    gt_loopback_in                      => (OTHERS => '0'),
    gt_rxrecclkout                      => OPEN,
    gt_powergoodout                     => gt_powergoodout,
    gt_ref_clk_out                      => gt_ref_clk_out, 
    gtwiz_reset_tx_datapath             => '0',
    gtwiz_reset_rx_datapath             => gtwiz_reset_rx_datapath,

    -- LBUS RX
    -------------------------------------------------------------------------------
    rx_dataout0                         => rx_dataout0,
    rx_dataout1                         => rx_dataout1,
    rx_dataout2                         => rx_dataout2,
    rx_dataout3                         => rx_dataout3,

    rx_mtyout0                          => rx_mtyout0,
    rx_mtyout1                          => rx_mtyout1,
    rx_mtyout2                          => rx_mtyout2,
    rx_mtyout3                          => rx_mtyout3,

    rx_enaout0                          => rx_enaout0,
    rx_enaout1                          => rx_enaout1,
    rx_enaout2                          => rx_enaout2,
    rx_enaout3                          => rx_enaout3,

    rx_sopout0                          => rx_sopout0,
    rx_sopout1                          => rx_sopout1,
    rx_sopout2                          => rx_sopout2,
    rx_sopout3                          => rx_sopout3,

    rx_eopout0                          => rx_eopout0,
    rx_eopout1                          => rx_eopout1,
    rx_eopout2                          => rx_eopout2,
    rx_eopout3                          => rx_eopout3,

    rx_errout0                          => rx_errout0,
    rx_errout1                          => rx_errout1,
    rx_errout2                          => rx_errout2,
    rx_errout3                          => rx_errout3,

    -- LBUS TX
    -------------------------------------------------------------------------------
    tx_datain0                          => tx_datain0,
    tx_datain1                          => tx_datain1,
    tx_datain2                          => tx_datain2,
    tx_datain3                          => tx_datain3,

    tx_mtyin0                           => tx_mtyin0,
    tx_mtyin1                           => tx_mtyin1,
    tx_mtyin2                           => tx_mtyin2,
    tx_mtyin3                           => tx_mtyin3,

    tx_enain0                           => tx_enain0,
    tx_enain1                           => tx_enain1,
    tx_enain2                           => tx_enain2,
    tx_enain3                           => tx_enain3,

    tx_sopin0                           => tx_sopin0,
    tx_sopin1                           => tx_sopin1,
    tx_sopin2                           => tx_sopin2,
    tx_sopin3                           => tx_sopin3,

    tx_eopin0                           => tx_eopin0,
    tx_eopin1                           => tx_eopin1,
    tx_eopin2                           => tx_eopin2,
    tx_eopin3                           => tx_eopin3,

    tx_errin0                           => tx_errin0,
    tx_errin1                           => tx_errin1,
    tx_errin2                           => tx_errin2,
    tx_errin3                           => tx_errin3,

    tx_ovfout                           => tx_ovfout,
    tx_rdyout                           => tx_rdyout_int,
    tx_unfout                           => OPEN,

    
    usr_rx_reset                        => usr_rx_reset,
    stat_rx_aligned                     => stat_rx_aligned,
    stat_rx_aligned_err                 => stat_rx_aligned_err,
    stat_rx_bad_code                    => OPEN,
    stat_rx_bad_fcs                     => OPEN,
    stat_rx_bad_preamble                => OPEN,
    stat_rx_bad_sfd                     => OPEN,
    stat_rx_bip_err_0                   => OPEN,
    stat_rx_bip_err_1                   => OPEN,
    stat_rx_bip_err_10                  => OPEN,
    stat_rx_bip_err_11                  => OPEN,
    stat_rx_bip_err_12                  => OPEN,
    stat_rx_bip_err_13                  => OPEN,
    stat_rx_bip_err_14                  => OPEN,
    stat_rx_bip_err_15                  => OPEN,
    stat_rx_bip_err_16                  => OPEN,
    stat_rx_bip_err_17                  => OPEN,
    stat_rx_bip_err_18                  => OPEN,
    stat_rx_bip_err_19                  => OPEN,
    stat_rx_bip_err_2                   => OPEN,
    stat_rx_bip_err_3                   => OPEN,
    stat_rx_bip_err_4                   => OPEN,
    stat_rx_bip_err_5                   => OPEN,
    stat_rx_bip_err_6                   => OPEN,
    stat_rx_bip_err_7                   => OPEN,
    stat_rx_bip_err_8                   => OPEN,
    stat_rx_bip_err_9                   => OPEN,
    stat_rx_block_lock                  => OPEN,
    stat_rx_broadcast                   => OPEN,
    stat_rx_fragment                    => OPEN,
    stat_rx_framing_err_0               => OPEN,
    stat_rx_framing_err_1               => OPEN,
    stat_rx_framing_err_10              => OPEN,
    stat_rx_framing_err_11              => OPEN,
    stat_rx_framing_err_12              => OPEN,
    stat_rx_framing_err_13              => OPEN,
    stat_rx_framing_err_14              => OPEN,
    stat_rx_framing_err_15              => OPEN,
    stat_rx_framing_err_16              => OPEN,
    stat_rx_framing_err_17              => OPEN,
    stat_rx_framing_err_18              => OPEN,
    stat_rx_framing_err_19              => OPEN,
    stat_rx_framing_err_2               => OPEN,
    stat_rx_framing_err_3               => OPEN,
    stat_rx_framing_err_4               => OPEN,
    stat_rx_framing_err_5               => OPEN,
    stat_rx_framing_err_6               => OPEN,
    stat_rx_framing_err_7               => OPEN,
    stat_rx_framing_err_8               => OPEN,
    stat_rx_framing_err_9               => OPEN,
    stat_rx_framing_err_valid_0         => OPEN,
    stat_rx_framing_err_valid_1         => OPEN,
    stat_rx_framing_err_valid_10        => OPEN,
    stat_rx_framing_err_valid_11        => OPEN,
    stat_rx_framing_err_valid_12        => OPEN,
    stat_rx_framing_err_valid_13        => OPEN,
    stat_rx_framing_err_valid_14        => OPEN,
    stat_rx_framing_err_valid_15        => OPEN,
    stat_rx_framing_err_valid_16        => OPEN,
    stat_rx_framing_err_valid_17        => OPEN,
    stat_rx_framing_err_valid_18        => OPEN,
    stat_rx_framing_err_valid_19        => OPEN,
    stat_rx_framing_err_valid_2         => OPEN,
    stat_rx_framing_err_valid_3         => OPEN,
    stat_rx_framing_err_valid_4         => OPEN,
    stat_rx_framing_err_valid_5         => OPEN,
    stat_rx_framing_err_valid_6         => OPEN,
    stat_rx_framing_err_valid_7         => OPEN,
    stat_rx_framing_err_valid_8         => OPEN,
    stat_rx_framing_err_valid_9         => OPEN,
    stat_rx_got_signal_os               => OPEN,
    stat_rx_hi_ber                      => OPEN,
    stat_rx_inrangeerr                  => OPEN,
    stat_rx_internal_local_fault        => OPEN,
    stat_rx_jabber                      => OPEN,
    stat_rx_local_fault                 => stat_rx_local_fault,
    stat_rx_mf_err                      => OPEN,
    stat_rx_mf_len_err                  => OPEN,
    stat_rx_mf_repeat_err               => OPEN,
    stat_rx_misaligned                  => stat_rx_misaligned,
    stat_rx_multicast                   => OPEN,
    stat_rx_oversize                    => OPEN,
    stat_rx_packet_1024_1518_bytes      => OPEN,
    stat_rx_packet_128_255_bytes        => OPEN,
    stat_rx_packet_1519_1522_bytes      => OPEN,
    stat_rx_packet_1523_1548_bytes      => OPEN,
    stat_rx_packet_1549_2047_bytes      => OPEN,
    stat_rx_packet_2048_4095_bytes      => OPEN,
    stat_rx_packet_256_511_bytes        => OPEN,
    stat_rx_packet_4096_8191_bytes      => OPEN,
    stat_rx_packet_512_1023_bytes       => OPEN,
    stat_rx_packet_64_bytes             => OPEN,
    stat_rx_packet_65_127_bytes         => OPEN,
    stat_rx_packet_8192_9215_bytes      => OPEN,
    stat_rx_packet_bad_fcs              => OPEN,
    stat_rx_packet_large                => OPEN,
    stat_rx_packet_small                => OPEN,

    ctl_rx_enable                       => ctl_rx_enable,
    ctl_rx_force_resync                 => '0',
    ctl_rx_test_pattern                 => '0',
--    core_rx_reset                       => sys_reset,
    core_rx_reset                       => '0',
--    core_rx_reset                       => core_reset,
    rx_clk                              => txusrclk2_sig,

    stat_rx_received_local_fault        => OPEN,
    stat_rx_remote_fault                => OPEN,
    stat_rx_status                      => stat_rx_status,
    stat_rx_stomped_fcs                 => OPEN,
    stat_rx_synced                      => OPEN,
    stat_rx_synced_err                  => OPEN,
    stat_rx_test_pattern_mismatch       => OPEN,
    stat_rx_toolong                     => OPEN,
    stat_rx_total_bytes                 => OPEN,
    stat_rx_total_good_bytes            => OPEN,
    stat_rx_total_good_packets          => OPEN, 
    stat_rx_total_packets               => OPEN, 
    stat_rx_truncated                   => OPEN, 
    stat_rx_undersize                   => OPEN, 
    stat_rx_unicast                     => OPEN, 
    stat_rx_vlan                        => OPEN, 
    stat_rx_pcsl_demuxed                => OPEN, 
    stat_rx_pcsl_number_0               => OPEN, 
    stat_rx_pcsl_number_1               => OPEN, 
    stat_rx_pcsl_number_10              => OPEN, 
    stat_rx_pcsl_number_11              => OPEN, 
    stat_rx_pcsl_number_12              => OPEN, 
    stat_rx_pcsl_number_13              => OPEN, 
    stat_rx_pcsl_number_14              => OPEN, 
    stat_rx_pcsl_number_15              => OPEN, 
    stat_rx_pcsl_number_16              => OPEN, 
    stat_rx_pcsl_number_17              => OPEN, 
    stat_rx_pcsl_number_18              => OPEN, 
    stat_rx_pcsl_number_19              => OPEN, 
    stat_rx_pcsl_number_2               => OPEN, 
    stat_rx_pcsl_number_3               => OPEN, 
    stat_rx_pcsl_number_4               => OPEN, 
    stat_rx_pcsl_number_5               => OPEN, 
    stat_rx_pcsl_number_6               => OPEN, 
    stat_rx_pcsl_number_7               => OPEN, 
    stat_rx_pcsl_number_8               => OPEN, 
    stat_rx_pcsl_number_9               => OPEN, 
    stat_tx_bad_fcs                     => OPEN, 
    stat_tx_broadcast                   => OPEN, 
    stat_tx_frame_error                 => OPEN, 
    stat_tx_local_fault                 => OPEN, 
    stat_tx_multicast                   => OPEN, 
    stat_tx_packet_1024_1518_bytes      => OPEN, 
    stat_tx_packet_128_255_bytes        => OPEN, 
    stat_tx_packet_1519_1522_bytes      => OPEN, 
    stat_tx_packet_1523_1548_bytes      => OPEN, 
    stat_tx_packet_1549_2047_bytes      => OPEN, 
    stat_tx_packet_2048_4095_bytes      => OPEN, 
    stat_tx_packet_256_511_bytes        => OPEN, 
    stat_tx_packet_4096_8191_bytes      => OPEN, 
    stat_tx_packet_512_1023_bytes       => OPEN, 
    stat_tx_packet_64_bytes             => OPEN, 
    stat_tx_packet_65_127_bytes         => OPEN, 
    stat_tx_packet_8192_9215_bytes      => OPEN, 
    stat_tx_packet_large                => OPEN, 
    stat_tx_packet_small                => OPEN, 
    stat_tx_total_bytes                 => OPEN, 
    stat_tx_total_good_bytes            => OPEN, 
    stat_tx_total_good_packets          => OPEN, 
    stat_tx_total_packets               => OPEN, 
    stat_tx_unicast                     => OPEN, 
    stat_tx_vlan                        => OPEN,
    
    ctl_tx_enable                       => ctl_tx_enable,
    ctl_tx_send_idle                    => '0',
    ctl_tx_send_rfi                     => ctl_tx_send_rfi,
    ctl_tx_send_lfi                     => ctl_tx_send_lfi,
    tx_preamblein                       => tx_preamblein,
    ctl_tx_test_pattern                 => '0',
--    core_tx_reset                       => sys_reset,
    core_tx_reset                       => '0',
--    core_tx_reset                       => core_reset,

    usr_tx_reset                        => usr_tx_reset_sig,
    core_drp_reset                      => '0',
    drp_clk                             => '0',
    drp_addr                            => (OTHERS => '0'),
    drp_di                              => (OTHERS => '0'),
    drp_en                              => '0',
    drp_do                              => OPEN,
    drp_rdy                             => OPEN,
    drp_we                              => '0'
    );

  
--  ILA_0_inst : COMPONENT ila_0
--  PORT MAP (
----    clk         => txusrclk2_sig,
--    clk         => init_clk,
--    probe0      => (OTHERS => '0'),
--    probe1      => (OTHERS => '0'),
--    probe2      => (OTHERS => '0'),
--    probe3      => (OTHERS => '0'),
--    probe4      => (OTHERS => '0'),
--    probe5      => (OTHERS => '0'),
--    probe6      => (OTHERS => '0'),
--    probe7      => (OTHERS => '0'),
--    probe8(0)   => '0',
--    probe9(0)   => '0',
--    probe10(0)  => '0',
--    probe11(0)  => '0',
--    probe12(0)  => '0',
--    probe13(0)  => '0',
--    probe8(0)   => '0',
--    probe9(0)   => '0',
----    probe8(0)   => usr_rx_reset,
----    probe9(0)   => usr_tx_reset_sig,
--    probe10(0)  => stat_rx_aligned,
--    probe11(0)  => stat_rx_aligned_err,
--    probe12(0)  => ctl_tx_enable,
--    probe13(0)  => ctl_tx_send_rfi,
--    probe14(0)  => '0',
--    probe15(0)  => '0',
--    probe16(0)  => '0',
--    probe17(0)  => '0',
--    probe18(0)  => '0',
--    probe19(0)  => '0',
--    probe20(0)  => '0',
--    probe21(0)  => '0',
--    probe22(0)  => '0',
--    probe23(0)  => '0',
--    probe24(0)  => '0',
--    probe25(0)  => '0',
--    probe26(0)  => '0',
--    probe27(0)  => '0',
--    probe28(0)  => '0',
--    probe29(0)  => '0',
--    probe30(0)  => '0',
--    probe31(0)  => '0'
--    );

--  ILA_0_inst : COMPONENT ila_0
--  PORT MAP (
----    clk         => txusrclk2_sig,
--    clk         => init_clk,
--    probe0      => tx_datain0,
--    probe1      => tx_datain1,
--    probe2      => tx_datain2,
--    probe3      => tx_datain3,
--    probe4      => tx_mtyin0,
--    probe5      => tx_mtyin1,
--    probe6      => tx_mtyin2,
--    probe7      => tx_mtyin3,
--    probe8(0)   => tx_enain0,
--    probe9(0)   => tx_enain1,
--    probe10(0)  => tx_enain2,
--    probe11(0)  => tx_enain3,
--    probe12(0)  => tx_sopin0,
--    probe13(0)  => tx_sopin1,
--    probe14(0)  => tx_sopin2,
--    probe15(0)  => tx_sopin3,
--    probe16(0)  => tx_eopin0,
--    probe17(0)  => tx_eopin1,
--    probe18(0)  => tx_eopin2,
--    probe19(0)  => tx_eopin3,
--    probe20(0)  => tx_errin0,
--    probe21(0)  => tx_errin1,
--    probe22(0)  => tx_errin2,
--    probe23(0)  => tx_errin3,
--    probe24(0)  => tx_rdyout_int,
--    probe25(0)  => stat_rx_aligned,
--    probe26(0)  => stat_rx_aligned_err,
--    probe27(0)  => ctl_tx_enable,
--    probe28(0)  => ctl_tx_send_rfi,
--    probe29(0)  => gt_powergoodout(0),
--    probe30(0)  => gt_powergoodout(1),
--    probe31(0)  => '0'
--    );


END ARCHITECTURE behaviour;
