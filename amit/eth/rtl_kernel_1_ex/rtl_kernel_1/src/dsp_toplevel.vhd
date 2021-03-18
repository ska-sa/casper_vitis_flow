-- dsp_toplevel.vhd	14. June 2018	by claus


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.DSP_COMPONENTS.ALL;
USE WORK.DSP_PARAMETERS.ALL;

LIBRARY UNISIM;
USE UNISIM.VComponents.all;


ENTITY dsp_toplevel IS
  PORT (

    -- CLOCKS AND RESETS
--    refclk_p              : IN STD_LOGIC;
--    refclk_n              : IN STD_LOGIC;
    
    --clk_gty2_rst_n        : OUT STD_LOGIC;

     init_clk               : IN STD_LOGIC; --200 mhz
     init_clk_locked        : IN STD_LOGIC;
    -- PUSHBUTTONS
--    user_pb1              : IN STD_LOGIC;
--    user_pb2              : IN STD_LOGIC;
    
    -- GT QSFP IF0 
    --AB XCU280 ADAPTION
--    refclk_gty_133_p      : IN STD_LOGIC;
--    refclk_gty_133_n      : IN STD_LOGIC;
    
--    qsfp28_5_rst_n        : OUT STD_LOGIC;
--    qsfp28_5_modprsl      : IN STD_LOGIC;

--    qsfp28_5_rx1_p        : IN STD_LOGIC;
--    qsfp28_5_rx1_n        : IN STD_LOGIC;
--    qsfp28_5_rx2_p        : IN STD_LOGIC;
--    qsfp28_5_rx2_n        : IN STD_LOGIC;
--    qsfp28_5_rx3_p        : IN STD_LOGIC;
--    qsfp28_5_rx3_n        : IN STD_LOGIC;
--    qsfp28_5_rx4_p        : IN STD_LOGIC;
--    qsfp28_5_rx4_n        : IN STD_LOGIC;
    
--    qsfp28_5_tx1_p        : OUT STD_LOGIC;
--    qsfp28_5_tx1_n        : OUT STD_LOGIC;
--    qsfp28_5_tx2_p        : OUT STD_LOGIC;
--    qsfp28_5_tx2_n        : OUT STD_LOGIC;
--    qsfp28_5_tx3_p        : OUT STD_LOGIC;
--    qsfp28_5_tx3_n        : OUT STD_LOGIC;
--    qsfp28_5_tx4_p        : OUT STD_LOGIC;
--    qsfp28_5_tx4_n        : OUT STD_LOGIC;

    -- GT QSFP IF1
    refclk_gt_p      : IN STD_LOGIC;
    refclk_gt_n      : IN STD_LOGIC;

     
     --QSFP Signals
--    qsfp28_modesel_ls    : out std_logic;
  

    qsfp28_rx1_p        : IN STD_LOGIC;
    qsfp28_rx1_n        : IN STD_LOGIC;
    qsfp28_rx2_p        : IN STD_LOGIC;
    qsfp28_rx2_n        : IN STD_LOGIC;
    qsfp28_rx3_p        : IN STD_LOGIC;
    qsfp28_rx3_n        : IN STD_LOGIC;
    qsfp28_rx4_p        : IN STD_LOGIC;
    qsfp28_rx4_n        : IN STD_LOGIC;
    
    --data rx signals
   rx_clk           : OUT STD_LOGIC;
   rx_out_data      : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
   rx_out_ena       : OUT STD_LOGIC;
   rx_out_sop       : OUT STD_LOGIC;
   rx_out_eop       : OUT STD_LOGIC;
   rx_out_err       : OUT STD_LOGIC;
   rx_out_mty       : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    
    qsfp28_tx1_p        : OUT STD_LOGIC;
    qsfp28_tx1_n        : OUT STD_LOGIC;
    qsfp28_tx2_p        : OUT STD_LOGIC;
    qsfp28_tx2_n        : OUT STD_LOGIC;
    qsfp28_tx3_p        : OUT STD_LOGIC;
    qsfp28_tx3_n        : OUT STD_LOGIC;
    qsfp28_tx4_p        : OUT STD_LOGIC;
    qsfp28_tx4_n        : OUT STD_LOGIC

  
--    user_led1_g           : OUT STD_LOGIC;
--    user_led2_g           : OUT STD_LOGIC;
--    user_led3_g           : OUT STD_LOGIC;
--    user_led4_g           : OUT STD_LOGIC;

--    user_led5_r           : OUT STD_LOGIC;
--    user_led6_r           : OUT STD_LOGIC;
--    user_led7_r           : OUT STD_LOGIC;
--    user_led8_r           : OUT STD_LOGIC
  );
END dsp_toplevel;



ARCHITECTURE behaviour OF dsp_toplevel IS

  -- clocks and resets
  --SIGNAL init_clk               : STD_LOGIC;
  --SIGNAL init_clk_locked        : STD_LOGIC;
  SIGNAL init_clk_dev_by_2      : STD_LOGIC;
  SIGNAL IF0_txusrclk2          : STD_LOGIC;
  SIGNAL IF0_gt_ref_clk         : STD_LOGIC;
  SIGNAL IF0_tx_rdyout          : STD_LOGIC;
  SIGNAL IF1_txusrclk2          : STD_LOGIC;
  SIGNAL IF1_gt_ref_clk         : STD_LOGIC;
  SIGNAL IF1_tx_rdyout          : STD_LOGIC;
  SIGNAL sys_reset              : STD_LOGIC;

  SIGNAL init_err               : STD_LOGIC;

  -- I2C
  SIGNAL sda                    : STD_LOGIC;
  SIGNAL scl                    : STD_LOGIC;

  --
  SIGNAL noisediode		: STD_LOGIC := '0';

  -- counters and timers
  
  SIGNAL counter1               : INTEGER := 200000000;
  SIGNAL counter2               : INTEGER := 322000000;
  SIGNAL counter3               : INTEGER := 322000000;
  SIGNAL counter4               : INTEGER := 322000000;
  SIGNAL counter5               : INTEGER := 322000000;
  SIGNAL counter6               : INTEGER := 322000000;

  -- UART
  SIGNAL rxd                    : STD_LOGIC;
  SIGNAL txd                    : STD_LOGIC;

  SIGNAL uart_rxd_buf           : STD_LOGIC;

  SIGNAL rx_data                : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL tx_data                : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL tr                     : STD_LOGIC;
  SIGNAL busy                   : STD_LOGIC;
  SIGNAL rx_data_valid          : STD_LOGIC;


  SIGNAL uart_data              : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL uart_data_wr           : STD_LOGIC;
  SIGNAL uart_addr              : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL uart_data_out          : STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL fifo_err               : STD_LOGIC;

  SIGNAL status                 : STD_LOGIC_VECTOR(31 DOWNTO 0);

  SIGNAL clr_err                : STD_LOGIC;

  SIGNAL  user_led2_g,led_2g    : STD_LOGIC;
  SIGNAL  led_reg0,led_reg1,led_reg2,led_reg3     : STD_LOGIC;
  
  SIGNAL  IntL_reg,ModPrsL_reg  : STD_LOGIC;
  
 SIGNAL tx_done_led_reg,tx_busy_led_reg :  STD_LOGIC;
 SIGNAL rx_gt_locked_led,rx_aligned_led :  STD_LOGIC;
 SIGNAL rx_done_led,rx_data_fail_led,rx_busy_led :  STD_LOGIC;
  
BEGIN

  -- RESETS
  sys_reset             <= NOT init_clk_locked;
--  clk_gty2_rst_n        <= init_clk_locked;
 --AB XCU280 ADAPTION qsfp28_5_rst_n        <= init_clk_locked;
 -- i2c_main_rst_n_f      <= init_clk_locked;

  -- UART
--  uart_reset_n          <= '1';
--  uart_suspend_n        <= '1';



  
  -- IF0 RX ALIGNED
--  user_led3_g           <= status(0);
  
  -- IF1 RX ALIGNED
--  user_led4_g           <= status(1);

  -- UART ERR
  -- user_led5_r
  
  -- INIT ERR
--  user_led6_r           <= init_err;

  -- IF0 
--  user_led7_r           <= status(2);

  -- IF0 proto fifo full
--  user_led8_r           <= status(4);
--  user_led8_r           <= init_clk_locked;


  
  
  -- fifo full error
  -----------------------------------------------------------------------------
--  LDPE_inst : LDPE
--  GENERIC MAP (INIT => '0')
--  PORT MAP (
--    Q   => fifo_err,
--    PRE => IF0_cc_fifo_full,
--    D   => '0',
--    G   => clr_err OR sys_reset,
--    GE  => '1'
--    );


  -- INIT CLOCK
  -----------------------------------------------------------------------------
--  DSP_INIT_CLK_PLL_inst : dsp_init_clk_pll
--  PORT MAP(
--    clk_out1    => init_clk,
--   -- AB XCU280 ADAPTION reset       => NOT user_pb1,
--    locked      => init_clk_locked,
--    clk_in1_p   => refclk_p,
--    clk_in1_n   => refclk_n
--    );

  -- INIT CLOCK DEVIDE BY 2
  -----------------------------------------------------------------------------
--  INIT_CLK_DEV_BY_TWO : PROCESS (init_clk, sys_reset) IS
--  BEGIN

--    IF (sys_reset = '1') THEN
--      init_clk_dev_by_2 <= '0';
--    ELSIF rising_edge(init_clk) THEN
--      init_clk_dev_by_2 <= NOT init_clk_dev_by_2;
--    END IF;
--  END PROCESS;

  
--  -- indicate init_clk
--  -----------------------------------------------------------------------------
  init_clk_indicator : PROCESS (init_clk, sys_reset) IS
  BEGIN

    IF (sys_reset = '1') THEN
      counter1    <= 200000000;
      led_reg1 <= '0';

    ELSIF rising_edge(init_clk) THEN
      IF (counter1 = 100000000) THEN
        counter1    <= counter1 - 1;
        led_reg1  <= '1';
      ELSIF (counter1 = 0) THEN
        counter1    <= 200000000;
        led_reg1 <= '0';
      ELSE
        counter1    <= counter1 - 1;
      END IF;
      
		
      IF (counter5 = 100000000) THEN
        counter5    <= counter5 - 1;
        led_reg0  <= '1';
      ELSIF (counter5 = 0) THEN
        counter5    <= 200000000;
        led_reg0 <= '0';
        ELSIF(IntL_reg = '1') THEN
            counter5 <= counter5 - 1;
        END IF;
      
      
		
      IF (counter6 = 100000000) THEN
        counter6    <= counter6 - 1;
        led_reg2  <= '1';
      ELSIF (counter6 = 0) THEN
        counter6    <= 200000000;
        led_reg2 <= '0';
      ELSIF(ModPrsL_reg = '0') THEN
            counter6 <= counter6 - 1;
      END IF;
      
      
      
    END IF;

  END PROCESS;
 
  -- indicate IF0_txusrclk2
  -----------------------------------------------------------------------------
--  IF0_txusrclk2_indicator : PROCESS (IF0_txusrclk2, sys_reset) IS
--  BEGIN

--    IF (sys_reset = '1') THEN
--      counter2    <= 322000000;
--  --    user_led1_g <= '0';

--    ELSIF rising_edge(IF0_txusrclk2) THEN
--      IF (counter2 = 161000000) THEN
--        counter2    <= counter2 - 1;
-- --       user_led1_g <= '1';
--      ELSIF (counter2 = 0) THEN
--        counter2    <= 322000000;
-- --       user_led1_g <= '0';
--      ELSE
--        counter2    <= counter2 - 1;
--      END IF;
      
--    END IF;

--  END PROCESS;

  
  -- indicate IF1_txusrclk2
  -----------------------------------------------------------------------------
  IF1_txusrclk2_indicator : PROCESS (IF1_txusrclk2, sys_reset) IS
  BEGIN

    IF (sys_reset = '1') THEN
      counter3    <= 322000000;
      led_2g <= '0';

    ELSIF rising_edge(IF1_txusrclk2) THEN
      IF (counter3 = 161000000) THEN
        counter3    <= counter3 - 1;
      led_2g <= '0';
      ELSIF (counter3 = 0) THEN
        counter3    <= 322000000;
      led_2g <= '1';
      ELSE
        counter3    <= counter3 - 1;
      END IF;
      
		
      IF (status = x"00000000") THEN
        led_reg3 <= '1';
      ELSE
        led_reg3 <= '0';
      END IF;
      
    END IF;

  END PROCESS;


  -- indicate IF0_gt_ref_clk
  -----------------------------------------------------------------------------
--  IF0_gt_ref_clk_indicator : PROCESS (IF0_gt_ref_clk, sys_reset) IS
--  BEGIN

--    IF (sys_reset = '1') THEN
--      counter2    <= 322000000;
--      user_led1_g <= '0';

--    ELSIF rising_edge(IF0_gt_ref_clk) THEN
--      IF (counter2 = 161000000) THEN
--        counter2    <= counter2 - 1;
--        user_led1_g <= '1';
--      ELSIF (counter2 = 0) THEN
--        counter2    <= 322000000;
--        user_led1_g <= '0';
--      ELSE
--        counter2    <= counter2 - 1;
--      END IF;
      
--    END IF;

--  END PROCESS;

  
 --  indicate IF1_gt_ref_clk
  ---------------------------------------------------------------------------
  IF1_gt_ref_clk_indicator : PROCESS (IF1_gt_ref_clk, sys_reset) IS
  BEGIN

    IF (sys_reset = '1') THEN
      counter4    <= 322000000;
      user_led2_g <= '0';

    ELSIF rising_edge(IF1_gt_ref_clk) THEN
      IF (counter4 = 161000000) THEN
        counter4    <= counter4 - 1;
        user_led2_g <= '1';
      ELSIF (counter4 = 0) THEN
        counter4    <= 322000000;
        user_led2_g <= '0';
      ELSE
        counter4    <= counter4 - 1;
      END IF;
      
    END IF;

  END PROCESS;

  
  -- CTRL UART
  -----------------------------------------------------------------------------
--  DSP_CTRL_UART_inst : dsp_ctrl_uart
--  PORT MAP (
--    clk                 => init_clk_dev_by_2,
--    rst                 => sys_reset,
--    txd                 => uart_rxd,
--    rxd                 => uart_txd,
--    data                => uart_data,
--    data_wr             => uart_data_wr,
--    addr                => uart_addr,
--    data_out            => uart_data_out,
--    err_out             => OPEN
--    );
  
  
--  -- INIT
--  -----------------------------------------------------------------------------
--  DSP_INIT_inst : dsp_init
--  PORT MAP (
--    clk                 => init_clk,
--    rst                 => sys_reset,
--    init_button         => '0',--  AB XCU280,
--    init_err            => init_err,
--    clr_err             => clr_err,
--    sda                 => i2c_main_sda_f,
--    scl                 => i2c_main_scl_f,
--    i2c_rst             => i2c_main_rst_n_f
--    );

  
  -- QSFP TOP
  -----------------------------------------------------------------------------
  DSP_ETH_TOP_inst : dsp_eth_top
  PORT MAP (
    init_clk            => init_clk,
    sys_reset           => sys_reset,
--  AB XCU280
--    IF0_txusrclk2_out   => IF0_txusrclk2,
--    IF0_gt_ref_clk_out  => IF0_gt_ref_clk,
--    IF0_tx_rdyout       => IF0_tx_rdyout,


--    IF0_refclk_gty_p    => refclk_gty_133_p,
--    IF0_refclk_gty_n    => refclk_gty_133_n,

--    IF0_eth_rxn(0)      => qsfp28_5_rx1_n,
--    IF0_eth_rxn(1)      => qsfp28_5_rx2_n,
--    IF0_eth_rxn(2)      => qsfp28_5_rx3_n,
--    IF0_eth_rxn(3)      => qsfp28_5_rx4_n,
  
--    IF0_eth_rxp(0)      => qsfp28_5_rx1_p,
--    IF0_eth_rxp(1)      => qsfp28_5_rx2_p,
--    IF0_eth_rxp(2)      => qsfp28_5_rx3_p,
--    IF0_eth_rxp(3)      => qsfp28_5_rx4_p,

--    IF0_eth_txn(0)      => qsfp28_5_tx1_n,
--    IF0_eth_txn(1)      => qsfp28_5_tx2_n,
--    IF0_eth_txn(2)      => qsfp28_5_tx3_n,
--    IF0_eth_txn(3)      => qsfp28_5_tx4_n,

--    IF0_eth_txp(0)      => qsfp28_5_tx1_p,
--    IF0_eth_txp(1)      => qsfp28_5_tx2_p,
--    IF0_eth_txp(2)      => qsfp28_5_tx3_p,
--    IF0_eth_txp(3)      => qsfp28_5_tx4_p,


    IF1_txusrclk2_out   => IF1_txusrclk2,
    IF1_gt_ref_clk_out  => IF1_gt_ref_clk,
    IF1_tx_rdyout       => IF1_tx_rdyout,

    IF1_refclk_gty_p    => refclk_gt_p,
    IF1_refclk_gty_n    => refclk_gt_n,

    IF1_eth_rxn(0)      => qsfp28_rx1_n,
    IF1_eth_rxn(1)      => qsfp28_rx2_n,
    IF1_eth_rxn(2)      => qsfp28_rx3_n,
    IF1_eth_rxn(3)      => qsfp28_rx4_n,
  
    IF1_eth_rxp(0)      => qsfp28_rx1_p,
    IF1_eth_rxp(1)      => qsfp28_rx2_p,
    IF1_eth_rxp(2)      => qsfp28_rx3_p,
    IF1_eth_rxp(3)      => qsfp28_rx4_p,
   
   rx_clk                       => rx_clk , 
   rx_out_data                    => rx_out_data,
   rx_out_ena                   => rx_out_ena,
   rx_out_sop                   => rx_out_sop,
   rx_out_eop                   => rx_out_eop,
   rx_out_err                    => rx_out_err,
   rx_out_mty                   => rx_out_mty,

    IF1_eth_txn(0)      => qsfp28_tx1_n,
    IF1_eth_txn(1)      => qsfp28_tx2_n,
    IF1_eth_txn(2)      => qsfp28_tx3_n,
    IF1_eth_txn(3)      => qsfp28_tx4_n,

    IF1_eth_txp(0)      => qsfp28_tx1_p,
    IF1_eth_txp(1)      => qsfp28_tx2_p,
    IF1_eth_txp(2)      => qsfp28_tx3_p,
    IF1_eth_txp(3)      => qsfp28_tx4_p,

    noisediode_off_in   => '1',
    use_1pps_out        => OPEN,
    test_value_out      => OPEN,
    mode_edd_out        => OPEN,

    dclk                => '0',
    din                 => (OTHERS => '0'),
    din_valid           => '0',
    
--    tx_done_led_reg              =>tx_done_led_reg,
--    tx_busy_led_reg              =>tx_busy_led_reg,
--    rx_gt_locked_led              =>rx_gt_locked_led,
--    rx_aligned_led              =>rx_aligned_led,
--    rx_done_led              =>rx_done_led,
--    rx_data_fail_led              =>rx_data_fail_led,
--    rx_busy_led              =>rx_busy_led,

    cfg_clk             => init_clk_dev_by_2,
    cfg_wr_en           => uart_data_wr,
    cfg_addr            => uart_addr,
    cfg_data_in         => uart_data,
    cfg_data_out        => uart_data_out,

    dmonitor_out        => OPEN,
    dmonitor_out_valid  => OPEN,

    status_out          => status,
    error_out           => OPEN,
    clr_err_out         => clr_err
    );      

  
END ARCHITECTURE behaviour;
