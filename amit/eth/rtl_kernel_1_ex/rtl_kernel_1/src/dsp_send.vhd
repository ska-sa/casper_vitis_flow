-- dsp_send 7. November 2018 by claus

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
USE WORK.DSP_COMPONENTS.ALL;
USE WORK.DSP_PARAMETERS.ALL;

LIBRARY UNISIM;
USE UNISIM.VCOMPONENTS.ALL;



ENTITY dsp_send IS
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
  
  stat_rx_aligned          : IN STD_LOGIC;
  stat_rx_status           : IN  STD_LOGIC;
  gtwiz_reset_rx_datapath  : OUT STD_LOGIC;
  
  core_reset               : OUT STD_LOGIC
  );
END dsp_send;




ARCHITECTURE arch OF dsp_send IS

  SIGNAL fst_src_data   : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL snd_src_data   : STD_LOGIC_VECTOR(511 DOWNTO 0);
  
  SIGNAL tx_data_sel    : STD_LOGIC_VECTOR(3 DOWNTO 0);

  TYPE statetype IS (
    A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13
    );

  SIGNAL stat_rx_aligned_l : STD_LOGIC;
  SIGNAL stat_rx_status_l  : STD_LOGIC;

  SIGNAL send_state     : statetype;

  SIGNAL counter1       : INTEGER;

  SIGNAL timer1         : INTEGER;
  SIGNAL timer1_en      : STD_LOGIC;
  CONSTANT TIMER1_MAX   : INTEGER := 2_000_000_000;
  
  
  SIGNAL timer_an         : INTEGER;
  SIGNAL timer_an_en      : STD_LOGIC;
  CONSTANT TIMER_AN_MAX   : INTEGER := 250000000;

  SIGNAL timer2         : INTEGER;
  SIGNAL timer2_en      : STD_LOGIC;
  CONSTANT TIMER2_MAX   : INTEGER := 100;
  SIGNAL hit            : STD_LOGIC;

  SIGNAL last_mtyin0    : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL last_mtyin1    : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL last_mtyin2    : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL last_mtyin3    : STD_LOGIC_VECTOR(3 DOWNTO 0);
  
  SIGNAL last_enain0    : STD_LOGIC;
  SIGNAL last_enain1    : STD_LOGIC;
  SIGNAL last_enain2    : STD_LOGIC;
  SIGNAL last_enain3    : STD_LOGIC;

  SIGNAL last_eopin0    : STD_LOGIC;
  SIGNAL last_eopin1    : STD_LOGIC;
  SIGNAL last_eopin2    : STD_LOGIC;
  SIGNAL last_eopin3    : STD_LOGIC;

  SIGNAL chks_done_clr  : STD_LOGIC;

  SIGNAL rx_tx_reset    : STD_LOGIC;

  SIGNAL reset_done_tx  : STD_LOGIC;
  SIGNAL reset_done_rx  : STD_LOGIC;

  SIGNAL last_word_empty_int    : INTEGER;

  SIGNAL state_for_ila  : STD_LOGIC_VECTOR(3 DOWNTO 0);

  SIGNAL snd_src_send_busy_buf  : STD_LOGIC;
  SIGNAL snd_src_send_sync      : STD_LOGIC;
  
BEGIN

  fst_src_data          <= fst_src_fifo_data(511 DOWNTO 0);
  snd_src_data          <= snd_src_fifo_data;

  snd_src_send_busy     <= snd_src_send_busy_buf;
  
  rx_tx_reset           <= usr_rx_reset OR usr_tx_reset;

  -----------------------------------------------------------------------------
  -- timer for core reset
  -----------------------------------------------------------------------------
  TIMER1_PROC : PROCESS (clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      timer1 <= TIMER1_MAX;
    ELSIF rising_edge(clk) THEN
      IF (timer1_en = '1') THEN
        IF (timer1 = 0) THEN
          timer1 <= TIMER1_MAX;
        ELSE
          timer1 <= timer1 - 1;
        END IF;
      ELSE
        timer1  <= TIMER1_MAX;
      END IF;
    END IF;

  END PROCESS;

  -----------------------------------------------------------------------------
  -- timer for core reset, AR # 71820
  -----------------------------------------------------------------------------
  TIMER_AN_PROC : PROCESS (clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      timer_an <= TIMER_AN_MAX;
    ELSIF rising_edge(clk) THEN
      IF (timer_an_en = '1') THEN
        IF (timer_an = 0) THEN
          timer_an <= TIMER_AN_MAX;
        ELSE
          timer_an <= timer_an - 1;
        END IF;
      ELSE
        timer_an  <= TIMER_AN_MAX;
      END IF;
    END IF;

  END PROCESS;


  -----------------------------------------------------------------------------
  -- TX reset done
  -----------------------------------------------------------------------------
  TX_RESET_DONE_PROC : PROCESS (clk) IS
  BEGIN

    IF rising_edge(clk) THEN
      IF (usr_tx_reset = '1') THEN
        reset_done_tx <= '0';
      ELSE
        reset_done_tx <= '1';
      END IF;
    END IF;

  END PROCESS;

  -----------------------------------------------------------------------------
  -- RX reset done
  -----------------------------------------------------------------------------
  RX_RESET_DONE_PROC : PROCESS (clk) IS
  BEGIN

    IF rising_edge(clk) THEN
      IF (usr_rx_reset = '1') THEN
        reset_done_rx <= '0';
      ELSE
        reset_done_rx <= '1';
      END IF;
    END IF;

  END PROCESS;

  
  -----------------------------------------------------------------------------
  -- timer for error
  -----------------------------------------------------------------------------
  TIMER2_PROC : PROCESS (clk,rx_tx_reset) IS
  BEGIN

    IF (rst = '1') THEN
      timer2 <= TIMER2_MAX;
    ELSIF rising_edge(clk) THEN
      IF (timer2_en = '1') THEN
        IF (timer2 = 0) THEN
          timer2 <= TIMER2_MAX;
        ELSE
          timer2 <= timer2 - 1;
        END IF;
      ELSE
        timer2  <= TIMER2_MAX;
      END IF;
    END IF;

  END PROCESS;


  -----------------------------------------------------------------------------
  -- snd src send sync
  -----------------------------------------------------------------------------
  SND_SRC_SEND_PROC : PROCESS (clk,rx_tx_reset) IS
  BEGIN

    IF rising_edge(clk) THEN
      IF (rx_tx_reset = '1') THEN
        snd_src_send_sync <= '0';
      ELSE
        snd_src_send_sync <= snd_src_send;
      END IF;
    END IF;

  END PROCESS;

  
  -----------------------------------------------------------------------------
  -- SEND STATE MACHINE
  -----------------------------------------------------------------------------
  PROCESS (clk, rx_tx_reset) IS
  BEGIN

    IF (rx_tx_reset = '1') THEN

      stat_rx_aligned_l         <= '0';
      stat_rx_status_l          <= '0';

      send_state                <= A0;
      tx_data_sel               <= X"0";

      fst_src_fifo_rd_en        <= '0';
      snd_src_fifo_rd_en        <= '0';
      chks_done_clr             <= '0';

      counter1                  <= 0;
      timer1_en                 <= '0';
      timer2_en                 <= '0';
      hit                       <= '0';
      
      fst_src_send_busy         <= '0';
      snd_src_send_busy_buf     <= '0';
      
      tx_mtyin0                 <= (OTHERS => '0');
      tx_mtyin1                 <= (OTHERS => '0');
      tx_mtyin2                 <= (OTHERS => '0');
      tx_mtyin3                 <= (OTHERS => '0');
      
      tx_enain0                 <= '0';
      tx_enain1                 <= '0';
      tx_enain2                 <= '0';
      tx_enain3                 <= '0';
      
      tx_sopin0                 <= '0';
      tx_sopin1                 <= '0';
      tx_sopin2                 <= '0';
      tx_sopin3                 <= '0';
      
      tx_eopin0                 <= '0';
      tx_eopin1                 <= '0';
      tx_eopin2                 <= '0';
      tx_eopin3                 <= '0';
      
      tx_errin0                 <= '0';
      tx_errin1                 <= '0';
      tx_errin2                 <= '0';
      tx_errin3                 <= '0';
      
      ctl_tx_enable             <= '0';
      ctl_tx_send_rfi           <= '0';
--      ctl_tx_send_rfi           <= '1';
      ctl_rx_enable             <= '0';
      core_reset                <= '0';

      status                    <= (OTHERS => '0');

    ELSIF rising_edge(clk) THEN

      stat_rx_aligned_l         <= stat_rx_aligned;
      stat_rx_status_l          <= stat_rx_status;
      
      -- default assignements

      tx_mtyin0                 <= (OTHERS => '0');
      tx_mtyin1                 <= (OTHERS => '0');
      tx_mtyin2                 <= (OTHERS => '0');
      tx_mtyin3                 <= (OTHERS => '0');

      tx_enain0                 <= '0';
      tx_enain1                 <= '0';
      tx_enain2                 <= '0';
      tx_enain3                 <= '0';

      tx_sopin0                 <= '0';
      tx_sopin1                 <= '0';
      tx_sopin2                 <= '0';
      tx_sopin3                 <= '0';

      tx_eopin0                 <= '0';
      tx_eopin1                 <= '0';
      tx_eopin2                 <= '0';
      tx_eopin3                 <= '0';

      tx_errin0                 <= '0';
      tx_errin1                 <= '0';
      tx_errin2                 <= '0';
      tx_errin3                 <= '0';

      
      CASE send_state IS
        
        -- LINK ESTABLISHMENT
        -----------------------------------------------------------------------
        WHEN A0 =>
          fst_src_send_busy     <= '0';
          snd_src_send_busy_buf <= '0';
          core_reset            <= '0';
          timer1_en             <= '0';
          timer_an_en             <= '0';
          timer2_en             <= '0';
          fst_src_fifo_rd_en    <= '0';
          snd_src_fifo_rd_en    <= '0';
          ctl_tx_send_rfi       <= '0';

          IF (reset_done_tx = '1') THEN
            timer1_en           <= '1';
            timer_an_en         <= '1';
            send_state          <= A12;
          END IF;
          
        WHEN A12 => -- AB
          ctl_tx_send_rfi <= '1';
          send_state          <= A1;
        
        WHEN A1 =>

          IF (stat_rx_aligned_l = '1') THEN
            timer1_en           <= '0';
            ctl_tx_send_rfi     <= '0';
            ctl_rx_enable       <= '1';
            send_state          <= A2;
          ELSIF (timer1 = 0) THEN
            status(1)           <= '1';
            timer1_en           <= '0';
            core_reset          <= '1';
            send_state          <= A10;
          END IF;
          
          
        -- AR #71820 START
        -----------------------------------------------------------------------
--        WHEN A12 =>
         
--          IF (timer_an = 0) THEN
--              IF (stat_rx_aligned_l = '1' OR stat_rx_status_l = '1') THEN
--                    status(2)           <= '0';
--                    gtwiz_reset_rx_datapath <= '1';
--                    timer_an_en         <= '1';
--                    send_state          <= A13;
--              ELSE
--                    gtwiz_reset_rx_datapath <= '1';
--                    status(2)           <= '1';
--                    timer_an_en         <= '1';
--                    send_state          <= A12;
                    
--              END IF;
----          ELSE
----              gtwiz_reset_rx_datapath <= '0';
--          END IF;
          
--        WHEN A13 =>
          
--          IF (timer_an = 0) THEN
--              IF (stat_rx_aligned_l = '1' OR stat_rx_status_l = '1') THEN
--                  status(3)           <= '0';
--                  timer_an_en         <= '0';
--                  send_state          <= A1;
--                  gtwiz_reset_rx_datapath <= '0';
--              ELSE 
--                  status(3)           <= '1';
--                  timer_an_en         <= '0';
--                  send_state          <= A12;
--              END IF;
--          END IF;
        
        -- AR #71820 END
        -----------------------------------------------------------------------  
        
        
        -- FEED MAC WITH DATA
        -----------------------------------------------------------------------
        WHEN A2 =>
          IF (snd_src_send_sync = '1' AND snd_src_fifo_empty = '0' AND tx_rdyout = '1') THEN
            snd_src_send_busy_buf       <= '1';
            last_word_empty_int         <= TO_INTEGER(UNSIGNED(snd_src_last_word_empty));
            counter1                    <= TO_INTEGER(UNSIGNED(snd_src_data_size)) - 1;
            ctl_tx_enable               <= '1';
            tx_data_sel                 <= X"2"; 
            snd_src_fifo_rd_en          <= '1';
            send_state                  <= A5;
          ELSIF (fst_src_send = '1' AND tx_rdyout = '1') THEN
            fst_src_send_busy           <= '1';
            last_word_empty_int         <= TO_INTEGER(UNSIGNED(fst_src_last_word_empty));
            counter1                    <= TO_INTEGER(UNSIGNED(data_size)) + TO_INTEGER(UNSIGNED(header_size)) - 1;
            ctl_tx_enable               <= '1';
            tx_data_sel                 <= X"0"; 
            fst_src_fifo_rd_en          <= '1';
            send_state                  <= A3;
          ELSIF (stat_rx_aligned_l = '0') THEN
            send_state                  <= A0;
          ELSE
            snd_src_fifo_rd_en          <= '0';
          END IF;

        -- fst src
        -----------------------------------------------------------------------
        WHEN A3 =>
          tx_sopin0             <= '1';

          IF (counter1 > 0) THEN
            tx_enain0           <= '1';
            tx_enain1           <= '1';
            tx_enain2           <= '1';
            tx_enain3           <= '1';
            tx_mtyin0           <= X"0";
            tx_mtyin1           <= X"0";
            tx_mtyin2           <= X"0";
            tx_mtyin3           <= X"0";
--            tx_data_sel         <= X"1";
--            counter1            <= counter1 - 1;
            send_state          <= A4;
          ELSE
            tx_sopin0           <= '0';
            tx_enain0           <= last_enain0;
            tx_enain1           <= last_enain1;
            tx_enain2           <= last_enain2;
            tx_enain3           <= last_enain3;
            tx_mtyin0           <= last_mtyin0;
            tx_mtyin1           <= last_mtyin1;
            tx_mtyin2           <= last_mtyin2;
            tx_mtyin3           <= last_mtyin3;
            tx_eopin0           <= last_eopin0;
            tx_eopin1           <= last_eopin1;
            tx_eopin2           <= last_eopin2;
            tx_eopin3           <= last_eopin3;

            fst_src_fifo_rd_en  <= '0';
            send_state          <= A7;
          END IF;

        WHEN A4 =>
          tx_data_sel         <= X"1";
          tx_sopin0           <= '0';

          IF (tx_rdyout = '1') THEN
            
            fst_src_fifo_rd_en  <= '1';

            tx_enain0           <= '1';
            tx_enain1           <= '1';
            tx_enain2           <= '1';
            tx_enain3           <= '1';
            tx_mtyin0           <= X"0";
            tx_mtyin1           <= X"0";
            tx_mtyin2           <= X"0";
            tx_mtyin3           <= X"0";

            counter1            <= counter1 - 1;

            IF (counter1 = 1) THEN
              tx_enain0           <= last_enain0;
              tx_enain1           <= last_enain1;
              tx_enain2           <= last_enain2;
              tx_enain3           <= last_enain3;
              tx_mtyin0           <= last_mtyin0;
              tx_mtyin1           <= last_mtyin1;
              tx_mtyin2           <= last_mtyin2;
              tx_mtyin3           <= last_mtyin3;
              tx_eopin0           <= last_eopin0;
              tx_eopin1           <= last_eopin1;
              tx_eopin2           <= last_eopin2;
              tx_eopin3           <= last_eopin3;

              fst_src_fifo_rd_en  <= '0';
              send_state          <= A7;

            END IF;
          ELSE
            fst_src_fifo_rd_en  <= '0';
          END IF;

        -- snd src
        -----------------------------------------------------------------------
        WHEN A5 =>
          tx_sopin0             <= '1';

          IF (counter1 > 0) THEN
            tx_enain0           <= '1';
            tx_enain1           <= '1';
            tx_enain2           <= '1';
            tx_enain3           <= '1';
            tx_mtyin0           <= X"0";
            tx_mtyin1           <= X"0";
            tx_mtyin2           <= X"0";
            tx_mtyin3           <= X"0";
            tx_data_sel         <= X"2";
--            counter1            <= counter1 - 1;
            send_state          <= A6;
          ELSE
--            tx_sopin0           <= '0';
            tx_enain0           <= last_enain0;
            tx_enain1           <= last_enain1;
            tx_enain2           <= last_enain2;
            tx_enain3           <= last_enain3;
            tx_mtyin0           <= last_mtyin0;
            tx_mtyin1           <= last_mtyin1;
            tx_mtyin2           <= last_mtyin2;
            tx_mtyin3           <= last_mtyin3;
            tx_eopin0           <= last_eopin0;
            tx_eopin1           <= last_eopin1;
            tx_eopin2           <= last_eopin2;
            tx_eopin3           <= last_eopin3;

            snd_src_fifo_rd_en  <= '0';
            send_state          <= A7;
          END IF;

        WHEN A6 =>

          IF (tx_rdyout = '1') THEN
            
            snd_src_fifo_rd_en    <= '1';

            tx_sopin0           <= '0';
            tx_enain0           <= '1';
            tx_enain1           <= '1';
            tx_enain2           <= '1';
            tx_enain3           <= '1';
            tx_mtyin0           <= X"0";
            tx_mtyin1           <= X"0";
            tx_mtyin2           <= X"0";
            tx_mtyin3           <= X"0";

            counter1              <= counter1 - 1;

            IF (counter1 = 1) THEN
              tx_enain0           <= last_enain0;
              tx_enain1           <= last_enain1;
              tx_enain2           <= last_enain2;
              tx_enain3           <= last_enain3;
              tx_mtyin0           <= last_mtyin0;
              tx_mtyin1           <= last_mtyin1;
              tx_mtyin2           <= last_mtyin2;
              tx_mtyin3           <= last_mtyin3;
              tx_eopin0           <= last_eopin0;
              tx_eopin1           <= last_eopin1;
              tx_eopin2           <= last_eopin2;
              tx_eopin3           <= last_eopin3;

              snd_src_fifo_rd_en  <= '0';
              send_state          <= A7;

            END IF;
          ELSE
            snd_src_fifo_rd_en  <= '0';
          END IF;

        -----------------------------------------------------------------------
        WHEN A7 =>
          send_state <= A8;
          
        -----------------------------------------------------------------------
        WHEN A8 =>
          timer2_en             <= '1';
          send_state            <= A9;
          
        -----------------------------------------------------------------------
        WHEN A9 =>
          fst_src_send_busy     <= '0';
          snd_src_send_busy_buf <= '0';
          tx_sopin0             <= '0';
          tx_enain0             <= '0';
          tx_enain1             <= '0';
          tx_enain2             <= '0';
          tx_enain3             <= '0';
          tx_mtyin0             <= X"0";
          tx_mtyin1             <= X"0";
          tx_mtyin2             <= X"0";
          tx_mtyin3             <= X"0";
          tx_eopin0             <= '0';
          tx_eopin1             <= '0';
          tx_eopin2             <= '0';
          tx_eopin3             <= '0';

          IF (timer2 = 0) THEN
            hit                 <= '1';
            send_state          <= A0;
          END IF;
          
          IF (snd_src_send_sync = '0') THEN
            timer2_en           <= '0';
            send_state          <= A2;
          END IF;

        WHEN A10  =>
          send_state    <= A11;

        WHEN A11  =>
          core_reset    <= '0';
          send_state    <= A0;

        WHEN OTHERS => NULL;
      END CASE;
      
    END IF;

  END PROCESS;


  ------------------------------------------------------------------------
  -- MAC TX DATA MUX
  ------------------------------------------------------------------------
  PROCESS (tx_data_sel,fst_src_data,chksum_udp,chksum_iph,snd_src_data) IS
  BEGIN
    IF (tx_data_sel = X"0") THEN
      tx_datain0            <= fst_src_data(511 DOWNTO 384);
      tx_datain1            <= fst_src_data(383 DOWNTO 320) & chksum_iph & fst_src_data(303 DOWNTO 256);
      tx_datain2            <= fst_src_data(255 DOWNTO 192) & chksum_udp & fst_src_data(175 DOWNTO 128);
      tx_datain3            <= fst_src_data(127 DOWNTO   0);

    ELSIF (tx_data_sel = X"1") THEN
      tx_datain0            <= fst_src_data(511 DOWNTO 384);
      tx_datain1            <= fst_src_data(383 DOWNTO 256);
      tx_datain2            <= fst_src_data(255 DOWNTO 128);
      tx_datain3            <= fst_src_data(127 DOWNTO   0);

    ELSIF (tx_data_sel = X"2") THEN
      tx_datain0            <= snd_src_data(511 DOWNTO 384);
      tx_datain1            <= snd_src_data(383 DOWNTO 256);
      tx_datain2            <= snd_src_data(255 DOWNTO 128);
      tx_datain3            <= snd_src_data(127 DOWNTO   0);

    ELSE
      tx_datain0            <= fst_src_data(511 DOWNTO 384);
      tx_datain1            <= fst_src_data(383 DOWNTO 256);
      tx_datain2            <= fst_src_data(255 DOWNTO 128);
      tx_datain3            <= fst_src_data(127 DOWNTO   0);
      
    END IF;

  END PROCESS;



  PROCESS (last_word_empty_int) IS
  BEGIN

    IF (last_word_empty_int = 0) THEN
      last_mtyin0 <= "0000";
      last_mtyin1 <= "0000";
      last_mtyin2 <= "0000";
      last_mtyin3 <= "0000";
      last_enain0 <= '1';
      last_enain1 <= '1';
      last_enain2 <= '1';
      last_enain3 <= '1';
      last_eopin0 <= '0';
      last_eopin1 <= '0';
      last_eopin2 <= '0';
      last_eopin3 <= '1';
      
    ELSIF (last_word_empty_int = 64) THEN
      last_mtyin0 <= "0000";
      last_mtyin1 <= "0000";
      last_mtyin2 <= "0000";
      last_mtyin3 <= "0000";
      last_enain0 <= '0';
      last_enain1 <= '0';
      last_enain2 <= '0';
      last_enain3 <= '0';
      last_eopin0 <= '0';
      last_eopin1 <= '0';
      last_eopin2 <= '0';
      last_eopin3 <= '1';
      
    ELSIF (last_word_empty_int > 48) THEN
      last_mtyin0 <= STD_LOGIC_VECTOR(TO_UNSIGNED((last_word_empty_int - 48),4));
      last_mtyin1 <= "0000";
      last_mtyin2 <= "0000";
      last_mtyin3 <= "0000";
      last_enain0 <= '1';
      last_enain1 <= '0';
      last_enain2 <= '0';
      last_enain3 <= '0';
      last_eopin0 <= '1';
      last_eopin1 <= '0';
      last_eopin2 <= '0';
      last_eopin3 <= '0';
      
    ELSIF (last_word_empty_int > 32) THEN
      last_mtyin0 <= "0000";
      last_mtyin1 <= STD_LOGIC_VECTOR(TO_UNSIGNED((last_word_empty_int - 32),4));
      last_mtyin2 <= "0000";
      last_mtyin3 <= "0000";
      last_enain0 <= '1';
      last_enain1 <= '1';
      last_enain2 <= '0';
      last_enain3 <= '0';
      last_eopin0 <= '0';
      last_eopin1 <= '1';
      last_eopin2 <= '0';
      last_eopin3 <= '0';

    ELSIF (last_word_empty_int > 16) THEN
      last_mtyin0 <= "0000";
      last_mtyin1 <= "0000";
      last_mtyin2 <= STD_LOGIC_VECTOR(TO_UNSIGNED((last_word_empty_int - 16),4));
      last_mtyin3 <= "0000";
      last_enain0 <= '1';
      last_enain1 <= '1';
      last_enain2 <= '1';
      last_enain3 <= '0';
      last_eopin0 <= '0';
      last_eopin1 <= '0';
      last_eopin2 <= '1';
      last_eopin3 <= '0';
      
    ELSE
      last_mtyin0 <= "0000";
      last_mtyin1 <= "0000";
      last_mtyin2 <= "0000";
      last_mtyin3 <= STD_LOGIC_VECTOR(TO_UNSIGNED(last_word_empty_int,4));
      last_enain0 <= '1';
      last_enain1 <= '1';
      last_enain2 <= '1';
      last_enain3 <= '1';
      last_eopin0 <= '0';
      last_eopin1 <= '0';
      last_eopin2 <= '0';
      last_eopin3 <= '1';
      
    END IF;

  END PROCESS;

  
  STATES_FOR_ILA : PROCESS (send_state) IS
  BEGIN

    CASE send_state IS
      WHEN A0 =>
        state_for_ila <= "0000";
      WHEN A1 =>
        state_for_ila <= "0001";
      WHEN A2 =>
        state_for_ila <= "0010";
      WHEN A3 =>
        state_for_ila <= "0011";
      WHEN A4 =>
        state_for_ila <= "0100";
      WHEN A5 =>
        state_for_ila <= "0101";
      WHEN A6 =>
        state_for_ila <= "0110";
      WHEN A7 =>
        state_for_ila <= "0111";
      WHEN A8 =>
        state_for_ila <= "1000";
      WHEN A9 =>
        state_for_ila <= "1001";
      WHEN A10 =>
        state_for_ila <= "1010";
      WHEN A11 =>
        state_for_ila <= "1011";
      WHEN OTHERS => NULL;
    END CASE;

  END PROCESS;

  
--  ILA_1_inst : COMPONENT ila_1
--  PORT MAP (
--    clk                 => clk,
--    probe0              => (OTHERS => '0'),
--    probe1(5 DOWNTO 4)  => (OTHERS => '0'),
--    probe1(3 DOWNTO 0)  => state_for_ila,
--    probe2(0)           => '0',
--    probe3(0)           => '0',
--    probe4(0)           => '0',
--    probe5(0)           => '0',
--    probe6(0)           => '0',
--    probe7(0)           => '0'
--    );
  

END arch;

