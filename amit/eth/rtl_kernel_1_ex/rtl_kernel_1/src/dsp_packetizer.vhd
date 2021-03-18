-- October 31th 2018 cc

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
USE WORK.DSP_COMPONENTS.ALL;
USE WORK.DSP_PARAMETERS.ALL;

LIBRARY UNISIM;
USE UNISIM.VCOMPONENTS.ALL;



ENTITY dsp_packetizer IS
PORT ( 
  clk                           : IN STD_LOGIC;
  rst                           : IN STD_LOGIC;

  -- HEADER
  header                        : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
  header_size                   : IN STD_LOGIC_VECTOR(  3 DOWNTO 0);
  header_valid                  : IN STD_LOGIC;
  header_last_word_empty        : IN STD_LOGIC_VECTOR(  5 DOWNTO 0);
  header_word_sel               : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);

  -- CHECKSUM
  chksum_data                   : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
  chksum_start                  : OUT STD_LOGIC;
  chksum_add                    : OUT STD_LOGIC;
  chksum_finish                 : OUT STD_LOGIC;
  chksum_done                   : IN STD_LOGIC;
  
  -- CLOCK CROSSING
  cc_fifo_data                  : IN STD_LOGIC_VECTOR(512 DOWNTO 0);
  cc_fifo_rd_en                 : OUT STD_LOGIC;
  cc_fifo_empty                 : IN STD_LOGIC;

  -- FIRST SOURCE
  fst_src_fifo_din              : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
  fst_src_fifo_wr_en            : OUT STD_LOGIC; 
  fst_src_fifo_full             : IN STD_LOGIC;
  fst_src_fifo_empty            : IN STD_LOGIC;
  
  fst_src_send                  : OUT STD_LOGIC;
  fst_src_send_busy             : IN STD_LOGIC;
  
  last_word_empty               : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);

  -- CTRL
  enable                        : IN STD_LOGIC;
  data_size                     : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- ERROR
  clr_err                       : IN STD_LOGIC;
  start_packet_err              : OUT STD_LOGIC
  );
END dsp_packetizer;



ARCHITECTURE arch OF dsp_packetizer IS


  -- FILL
  SIGNAL data_count             : INTEGER    := 1;
  SIGNAL header_word_sel_int    : INTEGER;
  SIGNAL fst_src_fifo_din_sel   : STD_LOGIC_VECTOR(3 DOWNTO 0);
  
  SIGNAL fst_src_fifo_din_buf   : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL fst_src_fifo_wr_en_buf : STD_LOGIC;

  -- SEND
  SIGNAL send_count             : INTEGER;


  -- CHECKSUM UDP IP
  ------------------------------------------------------------------------------ 
  SIGNAL chksum_done_l          : STD_LOGIC;
  SIGNAL chksum_done_clr        : STD_LOGIC;

  -- CLOCK CROSSING FIFO FIRST SOURCE
  -------------------------------------------------------------------------------
  SIGNAL fst_src_data           : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL fst_src_data_z1        : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL fst_src_data_z2        : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL start_packet           : STD_LOGIC;

  SIGNAL read_cc_fifo           : STD_LOGIC;


  SIGNAL fst_src_data_valid     : STD_LOGIC_VECTOR(31 DOWNTO 0);

  
  -- FRAGMENT HANDLING
  -------------------------------------------------------------------------------
  CONSTANT ZERO_VECTOR          : STD_LOGIC_VECTOR(511 DOWNTO 0) := (OTHERS => '0');

  
  -- ERROR DETECT
  -------------------------------------------------------------------------------
  SIGNAL stpk_err               : STD_LOGIC;

  TYPE statetype IS (
    A0, A1, A2, A3, A4, A5, A6
    );

  SIGNAL fill_state     : statetype := A0;
  SIGNAL fill_state_ila : STD_LOGIC_VECTOR(7 DOWNTO 0);

  
  
BEGIN

  
  fst_src_fifo_din      <= fst_src_fifo_din_buf;
  fst_src_fifo_wr_en    <= fst_src_fifo_wr_en_buf;
  
  fst_src_data          <= cc_fifo_data(511 DOWNTO 0);
  start_packet          <= cc_fifo_data(512);

  header_word_sel       <= STD_LOGIC_VECTOR(TO_UNSIGNED(header_word_sel_int,4));

  last_word_empty       <= header_last_word_empty;

  chksum_data           <= fst_src_fifo_din_buf;
  chksum_add            <= fst_src_fifo_wr_en_buf;


  -----------------------------------------------------------------------------
  -- STATE DECODING FOR ILA
  -----------------------------------------------------------------------------
  PROCESS (fill_state) IS
  BEGIN
    
    CASE fill_state IS
      WHEN A0 =>
        fill_state_ila <= "00000000";
      WHEN A1 =>
        fill_state_ila <= "00000001";
      WHEN A2 =>
        fill_state_ila <= "00000010";
      WHEN A3 =>
        fill_state_ila <= "00000011";
      WHEN A4 =>
        fill_state_ila <= "00000100";
      WHEN A5 =>
        fill_state_ila <= "00000101";
      WHEN A6 =>
        fill_state_ila <= "00000110";
      WHEN OTHERS =>
        fill_state_ila <= "11111111";
    END CASE;

  END PROCESS;

  -------------------------------------------------------------------------------
  -- DELAY DATA
  -------------------------------------------------------------------------------
  PROCESS (clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      fst_src_data_z1 <= (OTHERS => '0');
      fst_src_data_z2 <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
--      IF (cc_fifo_empty = '0') THEN
        fst_src_data_z1 <= fst_src_data;
        fst_src_data_z2 <= fst_src_data_z1;
--      END IF;
    END IF;

  END PROCESS;
  
  -------------------------------------------------------------------------------  
  -- CONDITIONS FOR READING FROM CC FIFO FIRST SOURCE
  -------------------------------------------------------------------------------  
  PROCESS (read_cc_fifo,cc_fifo_empty,start_packet,fill_state) IS
  BEGIN

    IF (fill_state = A0) THEN
      IF (start_packet = '1') THEN
        cc_fifo_rd_en <= '0';
      ELSE
        cc_fifo_rd_en <= read_cc_fifo AND NOT cc_fifo_empty;
      END IF;
    ELSE
      cc_fifo_rd_en  <= read_cc_fifo AND NOT cc_fifo_empty;
    END IF;

  END PROCESS;



  -----------------------------------------------------------------------------
  -- FIRST SOURCE FIFO INPUT MUX
  -----------------------------------------------------------------------------
  PROCESS (fst_src_fifo_din_sel, fst_src_data, fst_src_data_z1 ,header) IS
  BEGIN

    -- HEADER WORDS
    IF (fst_src_fifo_din_sel = X"0") THEN
      fst_src_fifo_din_buf <= header;
     
    -- LAST HEADER + DATA
    ELSIF (fst_src_fifo_din_sel = X"1") THEN
      fst_src_fifo_din_buf <= header(511 DOWNTO FRAGMENT1) & fst_src_data(511 DOWNTO FRAGMENT2);
      
    -- DATA WORDS
    ELSIF (fst_src_fifo_din_sel = X"2") THEN
      fst_src_fifo_din_buf <= fst_src_data_z1(FRAGMENT2 - 1 DOWNTO 0) & fst_src_data(511 DOWNTO FRAGMENT2);
      
    -- LAST DATA WORD<
    ELSIF (fst_src_fifo_din_sel = X"3") THEN
      fst_src_fifo_din_buf <= fst_src_data_z1(FRAGMENT2 - 1 DOWNTO 0) & ZERO_VECTOR(511 DOWNTO FRAGMENT2);

    ELSE
      fst_src_fifo_din_buf   <= (OTHERS => '0');
    END IF;

  END PROCESS;


  -----------------------------------------------------------------------------
  -- FILL FIRST SOURCE FIFO
  -----------------------------------------------------------------------------
  FILL_FIRST_SOURCE_FIFO : PROCESS (clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      fst_src_fifo_wr_en_buf    <= '0';
      fst_src_fifo_din_sel      <= (OTHERS => '0');
      fst_src_send              <= '0';
      
      header_word_sel_int       <= 0;

      chksum_start              <= '0';
      chksum_finish             <= '0';
      chksum_done_clr           <= '0';
      
      read_cc_fifo              <= '0';
      data_count                <= 1;
      fill_state                <= A0;
      
    ELSIF rising_edge(clk) THEN
      
      
      CASE fill_state IS

        -- wait for cc fifo not empty and start packet
        ---------------------------------------------------------------------
        WHEN A0 =>

          chksum_done_clr         <= '0';
          header_word_sel_int     <= 0;
          data_count              <= 1;
          read_cc_fifo            <= '1';

          IF (cc_fifo_empty = '0' AND enable = '1') THEN
            IF (start_packet = '1') THEN
              fst_src_fifo_din_sel      <= X"0";
              header_word_sel_int       <= header_word_sel_int + 1;
              fst_src_fifo_wr_en_buf    <= '1';
              read_cc_fifo              <= '0';
              chksum_start              <= '1';
              fill_state                <= A1;
            END IF;
          END IF;
          
        -- fill in HEADER words
        ---------------------------------------------------------------------
        WHEN A1 =>
          chksum_start              <= '0';
          IF (header_word_sel_int < TO_INTEGER(UNSIGNED(header_size)) - 1) THEN
            fst_src_fifo_din_sel    <= X"0";
            header_word_sel_int     <= header_word_sel_int + 1;
            fst_src_fifo_wr_en_buf  <= '1';
            fill_state              <= A1;
          ELSE
            IF (header_last_word_empty = "000000") THEN
              fst_src_fifo_din_sel    <= X"0";
              fst_src_fifo_wr_en_buf  <= '1';
              read_cc_fifo            <= '1';
              fill_state              <= A2;
            ELSE
              fst_src_fifo_din_sel    <= X"1";
              fst_src_fifo_wr_en_buf  <= '1';
              read_cc_fifo            <= '1';
              fill_state              <= A2;
            END IF;
          END IF;
        
        -- 
        ---------------------------------------------------------------------
        WHEN A2 =>
          fst_src_fifo_din_sel      <= X"2";
          fst_src_fifo_wr_en_buf    <= '1';
          header_word_sel_int       <= 0;
          data_count                <= data_count + 1;
          fill_state                <= A3;
        
        -- fill in DATA words
        ---------------------------------------------------------------------
        WHEN A3 =>
          IF (data_count < TO_INTEGER(UNSIGNED(data_size))) THEN
            IF (cc_fifo_empty = '0') THEN
              fst_src_fifo_din_sel    <= X"2";
              fst_src_fifo_wr_en_buf  <= '1';
              data_count              <= data_count + 1;
              read_cc_fifo            <= '1';
            ELSE
              fst_src_fifo_wr_en_buf  <= '0';
            END IF;
          ELSE
            fst_src_fifo_din_sel      <= X"3";
            fst_src_fifo_wr_en_buf    <= '1';
            data_count                <= data_count + 1;
            chksum_finish             <= '1';
            fill_state                <= A4;
          END IF;
        
        -- LAST WORD
        ---------------------------------------------------------------------
        WHEN A4 =>
          fst_src_fifo_din_sel    <= X"0";
          fst_src_fifo_wr_en_buf  <= '0';
          read_cc_fifo            <= '0';
          chksum_finish           <= '0';
          IF (chksum_done_l = '1' AND fst_src_send_busy = '0') THEN
            chksum_done_clr       <= '1';
            fst_src_send          <= '1';
            fill_state            <= A5;
          END IF;

        -- 
        ---------------------------------------------------------------------
        WHEN A5 =>
          chksum_done_clr         <= '0';
          IF (fst_src_send_busy = '1') THEN
            fst_src_send          <= '0';
            fill_state            <= A6;
          ELSE
            fill_state            <= A5;
          END IF;

        -- 
        ---------------------------------------------------------------------
        WHEN A6 =>
          read_cc_fifo            <= '1';
          fill_state              <= A0;

        -- others
        ---------------------------------------------------------------------
        WHEN OTHERS => NULL;
                       
      END CASE;
    END IF;

  END PROCESS;



  
  ------------------------------------------------------------------------
  -- CHECKSUM DONE HANDLING
  ------------------------------------------------------------------------
  PROCESS (clk,rst) IS
  BEGIN
    IF (rst = '1') THEN
      chksum_done_l <= '0';

    ELSIF rising_edge(clk) THEN
      IF (chksum_done = '1') THEN
        chksum_done_l <= '1';
      ELSIF (chksum_done_clr = '1') THEN
        chksum_done_l <= '0';
      END IF;
    END IF;

  END PROCESS;

  
  ------------------------------------------------------------------------
  -- ERROR LED HANDLING
  ------------------------------------------------------------------------

  -- start packet signal at wrong position
  PROCESS (clk, rst, stpk_err, clr_err) IS
  BEGIN

    IF (rst = '1') THEN
      start_packet_err <= '0';
      
    ELSIF rising_edge(clk) THEN
      IF (clr_err = '1') THEN
        start_packet_err <= '0';
      ELSIF (stpk_err = '1') THEN
        start_packet_err <= '1';
      END IF;
    END IF;

  END PROCESS;

  
--  ILA_1_inst : COMPONENT ila_1
--  PORT MAP (
--    clk         => clk,
--    probe0      => fill_state_ila,
--    probe1(0)   => chksum_done,
--    probe2(0)   => chksum_done_l,
--    probe3(0)   => chksum_done_clr,
--    probe4(0)   => fst_src_send_busy,
--    probe5(0)   => '0',
--    probe6(0)   => '0',
--    probe7(0)   => '0'
--    );

END arch;



