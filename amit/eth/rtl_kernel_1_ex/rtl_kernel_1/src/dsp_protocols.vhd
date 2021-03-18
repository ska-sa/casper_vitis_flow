-- dsp_protocols 8. April 2019 by claus

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
USE WORK.DSP_COMPONENTS.ALL;
USE WORK.DSP_PARAMETERS.ALL;

LIBRARY UNISIM;
USE UNISIM.VCOMPONENTS.ALL;


-------------------------------------------------------------------------------
-- SOME PROTOCOL INFORMATION
-------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ARP
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--    WORD 1 (511 ... 256)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    ||                    ETH                 ||                                                                   ARP                                                                    ||   |
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    |   MAC DEST   |   MAC SRC   |  eth type  |  hard addr type  |  prot addr type  |  hard addr length | prot addr length |  operation  |  MAC src  |  IP src  |  dest MAC  |  dest IP   |    |
--    511         464 463       416 415      400 399            384 383            368 367             360 359            352 351       336 335     288 287    256 255      208 207      176 175 0



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- IP/ICMP
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--    WORD 1 (511 ... 256)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    ||                    ETH                 ||                                                                   IP                                                                         
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    |   MAC DEST   |   MAC SRC   |  eth type  |   IHL   |   version   |   TOS   |  total length  |  ident  |  flags + frag offs  |   TTL   |   protocol  |  hdr chks  |  src addr  |  dest addr  
--    511         464 463       416 415      400 399   396 395       392 391   384 383          368 367   352 351               336 335   328 327       320 319      304 303      272 271      256


--    WORD 1 (255 ... 0)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                    ||                                                                                 ICMP
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    |   dest_addr   |     type   |     code    |   checksum  |  identification  |  sequence no |                                    optional data
--    255          240 239      232 231       224 223       216 215            200 199        184 183                                                                                            0



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- IP/UDP/DHCP
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--    WORD 1 (511 ... 256)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    ||                    ETH                 ||                                                                   IP                                                                         
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    |   MAC DEST   |   MAC SRC   |  eth type  |   IHL   |   version   |   TOS   |  total length  |  ident  |  flags + frag offs  |   TTL   |   protocol  |  hdr chks  |  src addr  |  dest addr  
--    511         464 463       416 415      400 399   396 395       392 391   384 383          368 367   352 351               336 335   328 327       320 319      304 303      272 271      256

--    WORD 1 (255 ... 0)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                ||                                  UDP                  ||                                DHCP
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    | dest_addr | source port | destination port |  length  |  checksum  |    op   |   htype   |   hlen   |   hops  |    xid    |   secs   |    flags   |   ciaddr  |  yiaddr  |    siaddr
--    255      240 239       224 223            208 207    192 191      176 175   168 167     160 159    152 151   144 143     112 111     96 95        80 79       48 47      16 15             0


--    WORD 2 (511 ... 256)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                    DHCP
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--      siaddr  |  giaddr  |  chaddr  |                                                                   sname 
--    511    496 495    464 463    336 335                                                                                                                                                       0  

--    WORD 2 (255 ... 0)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                    DHCP
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                        sname  
--    255                                                                                                                                                                                        0  


--    WORD 3 (511 ... 256)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                    DHCP
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                     sname          |                                                                   file
--    511                          336 335                                                                                                                                                     256  

--    WORD 3 (255 ... 0)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                    DHCP
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                        file         
--    255                                                                                                                                                                                        0  


--    WORD 4 (511 ... 256)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                    DHCP
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                        file
--    511                                                                                                                                                                                      256  

--    WORD 4 (255 ... 0)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                    DHCP
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                        file
--    255                                                                                                                                                                                        0  


--    WORD 5 (511 ... 256)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                                    DHCP
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                file                |        magic cookie     |    message type   |    Padding   |     end    |
--    511                          336 335                   304 303             280 279        264 263      256 255                                                                           256  





ENTITY dsp_protocols IS
PORT ( 
    clk                         : IN STD_LOGIC;
    slow_clk                    : IN STD_LOGIC;
    rst                         : IN STD_LOGIC;

    src_mac_addr                : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    src_ip_addr                 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

    data                        : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    ena                         : IN STD_LOGIC;
    sop                         : IN STD_LOGIC;
    eop                         : IN STD_LOGIC;
    err                         : IN STD_LOGIC;
    mty                         : IN STD_LOGIC_VECTOR(  5 DOWNTO 0);

    snd_src_data                : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
    snd_src_fifo_wr_en          : OUT STD_LOGIC;
    snd_src_fifo_full           : IN  STD_LOGIC;
    snd_src_last_word_empty     : OUT STD_LOGIC_VECTOR(  5 DOWNTO 0);
    snd_src_data_size           : OUT STD_LOGIC_VECTOR(  7 DOWNTO 0);
    snd_src_send                : OUT STD_LOGIC;
    snd_src_send_busy           : IN STD_LOGIC;

    dhcpdiscover_trig           : IN STD_LOGIC;

    data_to_buf                 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    data_to_buf_wr              : OUT STD_LOGIC;
    data_from_buf               : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    addr_for_buf                : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    
    packet_rec                  : OUT STD_LOGIC;
    clr_err                     : IN STD_LOGIC;
    rec_err                     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END dsp_protocols;



ARCHITECTURE arch OF dsp_protocols IS

  CONSTANT IP                   : STD_LOGIC_VECTOR( 15 DOWNTO 0) := X"0800";
  CONSTANT ARP                  : STD_LOGIC_VECTOR( 15 DOWNTO 0) := X"0806";
  CONSTANT ICMP                 : STD_LOGIC_VECTOR(  7 DOWNTO 0) := X"01";
  CONSTANT UDP                  : STD_LOGIC_VECTOR(  7 DOWNTO 0) := X"11";
  CONSTANT PING                 : STD_LOGIC_VECTOR(  7 DOWNTO 0) := X"08";
  CONSTANT BROADCAST_MAC        : STD_LOGIC_VECTOR( 47 DOWNTO 0) := X"FFFFFFFFFFFF";
  
  CONSTANT ITS_ARP              : STD_LOGIC_VECTOR(  7 DOWNTO 0) := X"03";
  CONSTANT ITS_ICMP             : STD_LOGIC_VECTOR(  7 DOWNTO 0) := X"01";
  CONSTANT ITS_UDP              : STD_LOGIC_VECTOR(  7 DOWNTO 0) := X"02";

  CONSTANT DHCP_OFFER           : STD_LOGIC_VECTOR(  7 DOWNTO 0) := X"01";

  CONSTANT ZERO_WORD            : STD_LOGIC_VECTOR(511 DOWNTO 0) := (OTHERS => '0');

  CONSTANT DHCP_MAGIC_COOKIE    : STD_LOGIC_VECTOR(31 DOWNTO 0) := X"63825363";
  CONSTANT DHCP_DEFAULT_LEASE_TIME : STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000005";

  CONSTANT DHCP_DISCOVER_WORD1  : STD_LOGIC_VECTOR(511 DOWNTO 0) := X"FFFFFFFFFFFF0050C252500008004510011200000000801139CC00000000FFFFFFFF0044004300FE00000101060078563412000A000000000000000000000000";
  CONSTANT DHCP_DISCOVER_WORD2  : STD_LOGIC_VECTOR(511 DOWNTO 0) := X"0000000000000050C252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  CONSTANT DHCP_DISCOVER_WORD3  : STD_LOGIC_VECTOR(511 DOWNTO 0) := X"00000000000000000000000000000000000000000000638253633501010000FF0000000000000000000000000000000000000000000000000000000000000000";

  CONSTANT DHCP_REQUEST_WORD1   : STD_LOGIC_VECTOR(511 DOWNTO 0) := X"FFFFFFFFFFFF0050C252500008004510013200000000801139AC00000000FFFFFFFF00440043011E00000101060087654321000A000000000000000000000000";
  CONSTANT DHCP_REQUEST_WORD2   : STD_LOGIC_VECTOR(511 DOWNTO 0) := X"0000000000000050C252500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  CONSTANT DHCP_REQUEST_WORD3   : STD_LOGIC_VECTOR(511 DOWNTO 0) := X"00000000000000000000000000000000000000000000638253633501033604C0A8021532040000000000000000000000000000000000000000000000000000FF";

  CONSTANT BUF_WRITE            : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"C350";
  CONSTANT BUF_READ             : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"C351";
  
  SIGNAL eth_word_1             : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL eth_word_2             : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL eth_word_3             : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL eth_word_4             : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL eth_word_5             : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL eth_word_6             : STD_LOGIC_VECTOR(511 DOWNTO 0);

  SIGNAL packet_catched         : STD_LOGIC;
  SIGNAL rec_data_size          : STD_LOGIC_VECTOR(  7 DOWNTO 0);
  SIGNAL last_word_empty        : STD_LOGIC_VECTOR(  5 DOWNTO 0);

  SIGNAL last_word_empty_slow   : STD_LOGIC_VECTOR(  5 DOWNTO 0);

  SIGNAL snd_src_data_buf       : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL snd_src_send_buf       : STD_LOGIC;

  SIGNAL sop_l                  : STD_LOGIC := '0';
  SIGNAL sop_l_l                : STD_LOGIC := '0';
  SIGNAL eop_l                  : STD_LOGIC := '0';

  SIGNAL prot_fifo_wr_en        : STD_LOGIC := '0';
  SIGNAL prot_fifo_rd_en        : STD_LOGIC := '0';
  SIGNAL prot_fifo_full         : STD_LOGIC;
  SIGNAL prot_fifo_empty        : STD_LOGIC;
  SIGNAL prot_fifo_din          : STD_LOGIC_VECTOR(520 DOWNTO 0);
  SIGNAL prot_fifo_dout         : STD_LOGIC_VECTOR(520 DOWNTO 0);

  SIGNAL read_prot_fifo         : STD_LOGIC := '0';

  SIGNAL data_s                 : STD_LOGIC_VECTOR(511 DOWNTO 0);
  SIGNAL sop_s                  : STD_LOGIC;
  SIGNAL eop_s                  : STD_LOGIC;
  SIGNAL err_s                  : STD_LOGIC;
  SIGNAL mty_s                  : STD_LOGIC_VECTOR(  5 DOWNTO 0);

  SIGNAL snd_src_send_busy_s    : STD_LOGIC;

  SIGNAL dsp_protocols_fifo_rst : STD_LOGIC := '0';
  

  TYPE receive_statetype IS (
    A0, A1, A2
    );

  TYPE catch_statetype IS (
    CATCH_A0, CATCH_A1, CATCH_A2, CATCH_A3, CATCH_A4, CATCH_A5, CATCH_A6, CATCH_A7, CATCH_A8
    );

  TYPE examine_statetype IS (
    EXAMINE_A0, EXAMINE_A1,
    --
    EXAMINE_DHCP1, EXAMINE_DHCP2, EXAMINE_DHCP3, EXAMINE_DHCP4, EXAMINE_DHCP5,
    --
    EXAMINE_BUF1,
    --
    EXAMINE_Z1, EXAMINE_Z2
    );

  TYPE handle_statetype IS (
    HANDLE_A0, HANDLE_ICMP1, HANDLE_ICMP2, HANDLE_ICMP3, HANDLE_ICMP4, HANDLE_ICMP5,
    --
    HANDLE_ARP1, HANDLE_ARP2, HANDLE_ARP3, HANDLE_ARP4,
    --
    HANDLE_DHCP_DISC1, HANDLE_DHCP_DISC2, HANDLE_DHCP_DISC3, HANDLE_DHCP_DISC4,
    HANDLE_DHCP_DISC5, HANDLE_DHCP_DISC6, HANDLE_DHCP_DISC7, HANDLE_DHCP_DISC8,
    --
    HANDLE_DHCP_REQ1, HANDLE_DHCP_REQ2, HANDLE_DHCP_REQ3, HANDLE_DHCP_REQ4,
    HANDLE_DHCP_REQ5, HANDLE_DHCP_REQ6, HANDLE_DHCP_REQ7, HANDLE_DHCP_REQ8,
    --
    HANDLE_DHCP_ACK1, HANDLE_DHCP_ACK2,
    --
    HANDLE_BUF_READ1, HANDLE_BUF_READ2, HANDLE_BUF_READ3, HANDLE_BUF_READ4, HANDLE_BUF_READ5,
    --
    HANDLE_BUF_WRITE1, HANDLE_BUF_WRITE2,
    --
    HANDLE_Z0, HANDLE_Z1
    );

  TYPE fifo_test_statetype IS (
    A0, A1, A2, A3, A4, A5, A6
    );

  SIGNAL receive_state                  : receive_statetype;
  SIGNAL catch_state                    : catch_statetype;
  SIGNAL examine_state                  : examine_statetype;
  SIGNAL handle_state                   : handle_statetype;

  SIGNAL fifo_test_wr_state             : fifo_test_statetype;
  SIGNAL fifo_test_rd_state             : fifo_test_statetype;

  SIGNAL catch_done                     : STD_LOGIC := '0';
  SIGNAL examine_done                   : STD_LOGIC;
  SIGNAL handle_done                    : STD_LOGIC;

  SIGNAL handle_ping_reply              : STD_LOGIC;
  SIGNAL handle_arp_reply               : STD_LOGIC;
  SIGNAL handle_dhcp_request            : STD_LOGIC;
  SIGNAL handle_dhcp_ack                : STD_LOGIC;
  SIGNAL handle_buf_read                : STD_LOGIC;
  SIGNAL handle_buf_write               : STD_LOGIC;

  SIGNAL state_for_ila_1                : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL state_for_ila_2                : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL state_for_ila_3                : STD_LOGIC_VECTOR(7 DOWNTO 0);

  SIGNAL prot_fifo_wr_en_l              : STD_LOGIC;

  CONSTANT TIMER_MAX                    : INTEGER := 100;

  SIGNAL counter1                       : INTEGER;

  SIGNAL dhcpdiscover_trig_l1           : STD_LOGIC;
  SIGNAL dhcpdiscover_trig_l2           : STD_LOGIC;
  SIGNAL dhcpdiscover_send_once         : STD_LOGIC;
  SIGNAL dhcpdiscover_done              : STD_LOGIC;
  SIGNAL dhcp_lease_time_count1         : INTEGER := 0;
  SIGNAL dhcp_lease_time_count2         : INTEGER := 0;
  SIGNAL dhcp_lease_time_count1_load    : STD_LOGIC;
  SIGNAL dhcp_trigger                   : STD_LOGIC;
  
  SIGNAL byte_of_512                    : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL byte_idx                       : INTEGER := 0;
  SIGNAL dhcp_opt                       : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL dhcp_msg_type                  : STD_LOGIC_VECTOR( 7 DOWNTO 0);
  SIGNAL dhcp_ip_addr_offer             : STD_LOGIC_VECTOR(31 DOWNTO 0) := X"FFFFFFFF";
  SIGNAL dhcp_opt_length                : INTEGER := 0;
  SIGNAL dhcp_server_id                 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL dhcp_lease_time                : STD_LOGIC_VECTOR(31 DOWNTO 0);

  
BEGIN

  
  
  -----------------------------------------------------------------------------
  -- DHCP LEASE TIME HANDLING
  -----------------------------------------------------------------------------
  PROCESS (slow_clk, rst) IS
  BEGIN
    IF (rst = '1') THEN
      dhcpdiscover_trig_l1 <= '0';
      dhcpdiscover_trig_l2 <= '0';
    ELSIF rising_edge(slow_clk) THEN
      dhcpdiscover_trig_l1 <= dhcpdiscover_trig;
      dhcpdiscover_trig_l2 <= dhcpdiscover_trig_l1;
    END IF;

  END PROCESS;

  
  DHCP_DISCOVER_SEND_ONCE : PROCESS (slow_clk, rst) IS
  BEGIN
    IF (rst = '1') THEN
      dhcpdiscover_send_once <= '0';
    ELSIF rising_edge(slow_clk) THEN
      IF (dhcpdiscover_trig_l1 = '1' AND dhcpdiscover_trig_l2 = '0') THEN
        dhcpdiscover_send_once <= '1';
      ELSIF (dhcpdiscover_done = '1') THEN
        dhcpdiscover_send_once <= '0';
      END IF;
    END IF;

  END PROCESS;


  LEASE_TIME_COUNTER : PROCESS (slow_clk, rst) IS
  BEGIN
    IF (rst = '1') THEN
      dhcp_lease_time_count1    <= TO_INTEGER(UNSIGNED(DHCP_DEFAULT_LEASE_TIME));
      dhcp_trigger              <= '0';
      dhcp_lease_time_count2    <= 200000000;

    ELSIF rising_edge(slow_clk) THEN
      dhcp_trigger              <= '0';
      IF (dhcpdiscover_trig = '1') THEN
        dhcp_lease_time_count2  <= dhcp_lease_time_count2 - 1;

        IF(dhcp_lease_time_count2 = 0) THEN
          dhcp_lease_time_count1 <= dhcp_lease_time_count1 - 1;
          dhcp_lease_time_count2 <= 200000000;
        END IF;
        
        IF (dhcp_lease_time_count1 = 0) THEN
          dhcp_trigger           <= '1';
          dhcp_lease_time_count1 <= TO_INTEGER(UNSIGNED(DHCP_DEFAULT_LEASE_TIME));
        ELSIF (dhcpdiscover_done = '1') THEN
          dhcp_trigger           <= '0';
        ELSIF (dhcp_lease_time_count1_load = '1') THEN
          dhcp_lease_time_count1 <= TO_INTEGER(UNSIGNED(dhcp_lease_time));
        END IF;
      END IF;
        
    END IF;

  END PROCESS;


  -----------------------------------------------------------------------------
  -- snd_src_send_busy synced
  -----------------------------------------------------------------------------
  PROCESS (slow_clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      snd_src_send_busy_s <= '0';
    ELSIF rising_edge(slow_clk) THEN
      snd_src_send_busy_s <= snd_src_send_busy;
    END IF;

  END PROCESS;

  
  -----------------------------------------------------------------------------
  -- protocols FIFO
  -----------------------------------------------------------------------------

  DSP_PROTOCOLS_FIFO_RST_PROC : PROCESS (slow_clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      dsp_protocols_fifo_rst    <= '0';
      counter1                  <= 0;
    ELSIF rising_edge(slow_clk) THEN
      IF (counter1 < 30) THEN
        counter1                <= counter1 + 1;
        dsp_protocols_fifo_rst  <= '1';
      ELSE
        dsp_protocols_fifo_rst  <= '0';
      END IF;
    END IF;

  END PROCESS;
  
  DSP_PROTOCOLS_FIFO_inst : dsp_protocols_fifo
  PORT MAP (
--    rst         => dsp_protocols_fifo_rst,
    wr_clk      => clk,
    rd_clk      => slow_clk,
    din         => prot_fifo_din,
    wr_en       => prot_fifo_wr_en,
    rd_en       => prot_fifo_rd_en,
    dout        => prot_fifo_dout,
    full        => prot_fifo_full,
    empty       => prot_fifo_empty
    );


  -----------------------------------------------------------------------------
  -- fill protocols FIFO
  -----------------------------------------------------------------------------
  PROT_FIFO_DIN_PROC : PROCESS (clk,rst) IS

    VARIABLE packet_is_mine : BOOLEAN := FALSE;

  BEGIN

    -- packet for me?
    ---------------------------------------------------------------------------

      IF (ena = '1' AND sop = '1' AND prot_fifo_full = '0' AND
         (data(511 DOWNTO 464) = src_mac_addr OR data(511 DOWNTO 464) = BROADCAST_MAC) AND

         ((data(415 DOWNTO 400) = ARP) OR
          (data(415 DOWNTO 400) = IP AND data(327 DOWNTO 320) = ICMP) OR
          (data(415 DOWNTO 400) = IP AND data(327 DOWNTO 320) = UDP AND data(239 DOWNTO 224) = X"0043") OR
          (data(415 DOWNTO 400) = IP AND data(327 DOWNTO 320) = UDP AND data(239 DOWNTO 224) = X"C350") OR
          (data(415 DOWNTO 400) = IP AND data(327 DOWNTO 320) = UDP AND data(239 DOWNTO 224) = X"C351"))) THEN

        packet_rec     <= '1';
        packet_is_mine := TRUE;
      ELSE
        packet_rec     <= '0';
        packet_is_mine := FALSE;
      END IF;

    ---------------------------------------------------------------------------

      
    IF (rst = '1') THEN
      prot_fifo_din     <= (OTHERS => '0');
      prot_fifo_wr_en   <= '0';
      sop_l             <= '0';
      eop_l             <= '0';
      
    ELSIF rising_edge(clk) THEN

      IF (eop = '1') THEN
        eop_l <= '1';
      END IF;
      
      IF (packet_is_mine) THEN
        sop_l                 <= '1';
        prot_fifo_din         <= sop & eop & err & mty & data;
        prot_fifo_wr_en       <= '1';

      ELSIF (ena = '1' AND sop_l = '1' AND eop = '1') THEN
        eop_l                 <= '1';
        prot_fifo_din         <= sop & eop & err & mty & data;
        prot_fifo_wr_en       <= '1';

      ELSIF (eop_l = '1') THEN
        sop_l             <= '0';
        eop_l             <= '0';
        prot_fifo_wr_en   <= '0';

      ELSIF (ena = '1' AND sop_l = '1' AND prot_fifo_full = '0') THEN
        prot_fifo_din     <= sop & eop & err & mty & data;
        prot_fifo_wr_en   <= '1';

      ELSIF (err = '1') THEN
        sop_l             <= '0';
        prot_fifo_wr_en   <= '0';

      ELSE
        prot_fifo_wr_en   <= '0';
      
      END IF;
      
    END IF;


  END PROCESS;


  -----------------------------------------------------------------------------
  -- read from PROT FIFO
  -----------------------------------------------------------------------------
  READ_PROT_FIFO_proc : PROCESS (read_prot_fifo,eop_s,catch_state) IS
  BEGIN

    IF (catch_state = CATCH_A0 OR catch_state = CATCH_A1) THEN
      prot_fifo_rd_en <= read_prot_fifo;
    ELSE
      IF (read_prot_fifo = '1' AND eop_s = '0') THEN
        prot_fifo_rd_en <= '1';
      ELSE
        prot_fifo_rd_en <= '0';
      END IF;
    END IF;
    

  END PROCESS;
  
  -----------------------------------------------------------------------------
  -- PROT FIFO OUTPUT
  -----------------------------------------------------------------------------
  sop_s         <= prot_fifo_dout(520);
  eop_s         <= prot_fifo_dout(519);
  err_s         <= prot_fifo_dout(518);
  mty_s         <= prot_fifo_dout(517 DOWNTO 512);
  data_s        <= prot_fifo_dout(511 DOWNTO 0);
  
  snd_src_data  <= snd_src_data_buf;
  snd_src_send  <= snd_src_send_buf;

  -----------------------------------------------------------------------------
  -- catch 6 x 512 words
  -----------------------------------------------------------------------------
  CATCH_FIRST_WORDS : PROCESS (slow_clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      catch_state       <= CATCH_A0;
      eth_word_1        <= (OTHERS => '0');
      eth_word_2        <= (OTHERS => '0');
      eth_word_3        <= (OTHERS => '0');
      eth_word_4        <= (OTHERS => '0');
      packet_catched    <= '0';
      read_prot_fifo    <= '0';
      last_word_empty   <= (OTHERS => '0');
      rec_data_size     <= (OTHERS => '0');

    ELSIF rising_edge(slow_clk) THEN

      CASE catch_state IS

        
        WHEN CATCH_A0 =>
          packet_catched        <= '0';

          IF (prot_fifo_empty = '0') THEN
            read_prot_fifo      <= '1';
            catch_state         <= CATCH_A1;
          END IF;

        WHEN CATCH_A1 =>
          catch_state           <= CATCH_A2;
        
        WHEN CATCH_A2 =>
          IF (sop_s = '1' AND eop_s = '1') THEN
            eth_word_1          <= data_s;
            last_word_empty     <= mty_s;
            rec_data_size       <= X"01";
            read_prot_fifo      <= '0';
            catch_state         <= CATCH_A8;
          ELSIF (sop_s = '1') THEN
            eth_word_1          <= data_s;
            catch_state         <= CATCH_A3;
          ELSE
            read_prot_fifo     <= '0';
            catch_state         <= CATCH_A0;
            
          END IF;

        WHEN CATCH_A3 =>
          IF (eop_s = '0') THEN
            eth_word_2          <= data_s;
            catch_state         <= CATCH_A4;
          ELSIF (err_s = '1') THEN
            read_prot_fifo      <= '0';
            catch_state         <= CATCH_A0;
          ELSE
            eth_word_2          <= data_s;
            last_word_empty     <= mty_s;
            rec_data_size       <= X"02";
            read_prot_fifo      <= '0';
            catch_state         <= CATCH_A8;
          END IF;

        WHEN CATCH_A4 =>
          IF (eop_s = '0') THEN
            eth_word_3          <= data_s;
            catch_state         <= CATCH_A5;
          ELSIF (err_s = '1') THEN
            read_prot_fifo     <= '0';
            catch_state         <= CATCH_A0;
          ELSE
            eth_word_3          <= data_s;
            last_word_empty     <= mty_s;
            rec_data_size       <= X"03";
            read_prot_fifo      <= '0';
            catch_state         <= CATCH_A8;
          END IF;

        WHEN CATCH_A5 =>
          IF (eop_s = '0') THEN
            eth_word_4          <= data_s;
            catch_state         <= CATCH_A6;
          ELSIF (err_s = '1') THEN
            read_prot_fifo     <= '0';
            catch_state         <= CATCH_A0;
          ELSE
            eth_word_4          <= data_s;
            last_word_empty     <= mty_s;
            rec_data_size       <= X"04";
            read_prot_fifo      <= '0';
            catch_state         <= CATCH_A8;
          END IF;

        WHEN CATCH_A6 =>
          IF (eop_s = '0') THEN
            eth_word_5          <= data_s;
            catch_state         <= CATCH_A7;
          ELSIF (err_s = '1') THEN
            read_prot_fifo     <= '0';
            catch_state         <= CATCH_A0;
          ELSE
            eth_word_5          <= data_s;
            last_word_empty     <= mty_s;
            rec_data_size       <= X"05";
            read_prot_fifo      <= '0';
            catch_state         <= CATCH_A8;
          END IF;
          
        WHEN CATCH_A7 =>
          read_prot_fifo        <= '0';
            
          IF (err_s = '1') THEN
            read_prot_fifo      <= '0';
            catch_state         <= CATCH_A0;
          ELSE
            rec_data_size       <= X"06";
            eth_word_6          <= data_s;
            last_word_empty     <= mty_s;
            catch_state         <= CATCH_A8;
          END IF;

        WHEN CATCH_A8 =>
          packet_catched        <= '1';

          IF (examine_done = '1') THEN
            packet_catched      <= '0';
            eth_word_1          <= (OTHERS => '0');
            eth_word_2          <= (OTHERS => '0');
            eth_word_3          <= (OTHERS => '0');
            eth_word_4          <= (OTHERS => '0');
            eth_word_5          <= (OTHERS => '0');
            eth_word_6          <= (OTHERS => '0');
            catch_state         <= CATCH_A0;
          END IF;

        WHEN OTHERS =>
            catch_state         <= CATCH_A0;

      END CASE;
 
    END IF;

  END PROCESS;


  -----------------------------------------------------------------------------
  -- examine received words
  -----------------------------------------------------------------------------
  EXAMINE_PACKET : PROCESS (slow_clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      examine_state             <= EXAMINE_A0;
      handle_ping_reply         <= '0';
      handle_arp_reply          <= '0';
      handle_dhcp_request       <= '0';
      examine_done              <= '0';


    ELSIF rising_edge(slow_clk) THEN

      CASE examine_state IS

        WHEN EXAMINE_A0 =>
          handle_ping_reply   <= '0';
          handle_arp_reply    <= '0';
          handle_dhcp_request <= '0';
          examine_done        <= '0';
          
          IF (packet_catched = '1') THEN
            examine_state <= EXAMINE_A1;
          END IF;

        WHEN EXAMINE_A1 =>

          -------------------------------------------------------------------
          -- IP
          -------------------------------------------------------------------
          IF (eth_word_1(415 DOWNTO 400) = IP) THEN

            -----------------------------------------------------------------
            -- ICMP
            -----------------------------------------------------------------
            IF (eth_word_1(239 DOWNTO 232) = PING) THEN
              handle_ping_reply         <= '1';
              examine_state             <= EXAMINE_Z1;

            -----------------------------------------------------------------
            -- UDP
            -----------------------------------------------------------------
            ELSIF (eth_word_1(327 DOWNTO 320) = UDP) THEN

              ---------------------------------------------------------------
              -- DHCP
              ---------------------------------------------------------------
              IF (eth_word_1(239 DOWNTO 224) = X"0043" AND eth_word_5(335 DOWNTO 304) = DHCP_MAGIC_COOKIE) THEN
                examine_state       <= EXAMINE_DHCP1;
              
              ---------------------------------------------------------------
              -- BUFFER READ/WRITE
              ---------------------------------------------------------------
              ELSIF (eth_word_1(223 DOWNTO 208) = BUF_READ OR eth_word_1(223 DOWNTO 208) = BUF_WRITE) THEN
                examine_state       <= EXAMINE_BUF1;

              ELSE
                examine_done        <= '1';
                examine_state       <= EXAMINE_Z2;
              END IF;
              
            END IF;
            
          -------------------------------------------------------------------
          -- ARP
          -------------------------------------------------------------------
          ELSIF (eth_word_1(415 DOWNTO 400) = ARP) THEN
            handle_arp_reply  <= '1';
            examine_state     <= EXAMINE_Z1;

          -------------------------------------------------------------------  
          -- OTHERS
          -------------------------------------------------------------------  
          ELSE
            examine_done      <= '1';
            examine_state     <= EXAMINE_A0;
            
          END IF;

        -------------------------------------------------------------------  
        -- EXAMINE DHCP
        -------------------------------------------------------------------  
        WHEN EXAMINE_DHCP1 =>
          byte_idx      <= 27;
          examine_state <= EXAMINE_DHCP2;

        -- get dhcp option ID
        -----------------------------------------------------------------------
        WHEN EXAMINE_DHCP2 =>
          IF (byte_of_512 = X"FF") THEN
            examine_state <= EXAMINE_DHCP5;
          ELSE
            dhcp_opt              <= byte_of_512;
            byte_idx              <= byte_idx + 1;
            examine_state         <= EXAMINE_DHCP3;
          END IF;

        -- get option length
        -----------------------------------------------------------------------
        WHEN EXAMINE_DHCP3 =>
          dhcp_opt_length         <= TO_INTEGER(UNSIGNED(byte_of_512));
          byte_idx                <= byte_idx + 1;
          examine_state           <= EXAMINE_DHCP4;

        -- get dhcp option
        -----------------------------------------------------------------------
        WHEN EXAMINE_DHCP4 =>
          byte_idx                <= byte_idx + 1;

          IF (dhcp_opt = X"35") THEN
            dhcp_msg_type         <= byte_of_512;
          ELSIF (dhcp_opt = X"33") THEN
            dhcp_lease_time((dhcp_opt_length * 8 - 1) DOWNTO ((dhcp_opt_length - 1) * 8)) <= byte_of_512;
          ELSIF (dhcp_opt = X"36") THEN
            dhcp_server_id((dhcp_opt_length * 8 - 1) DOWNTO ((dhcp_opt_length - 1) * 8)) <= byte_of_512;
          END IF;
          
          IF (dhcp_opt_length > 1) THEN
            dhcp_opt_length     <= dhcp_opt_length - 1;
          ELSE
            examine_state       <= EXAMINE_DHCP2;
          END IF;
                  
        -- go to handle dhcp message
        -----------------------------------------------------------------------
        WHEN EXAMINE_DHCP5 =>
          -- dhcp offer
          IF (dhcp_msg_type = X"02") THEN
            dhcp_ip_addr_offer  <= eth_word_1(47 DOWNTO 16);
            dhcp_msg_type       <= (OTHERS => '0');
            handle_dhcp_request <= '1';
          -- dhcp acknowledge
          ELSIF (dhcp_msg_type = X"05") THEN
            dhcp_msg_type       <= (OTHERS => '0');
            handle_dhcp_ack     <= '1';
          END IF;

          examine_state         <= EXAMINE_Z1;
          
        -----------------------------------------------------------------------
        -- EXAMINE BUF READ/WRITE
        -----------------------------------------------------------------------
        WHEN EXAMINE_BUF1 =>
          IF (eth_word_1(223 DOWNTO 208) = BUF_READ) THEN
            handle_buf_read     <= '1';
          ELSIF (eth_word_1(223 DOWNTO 208) = BUF_WRITE) THEN
            handle_buf_write    <= '1';
          END IF;

          examine_state         <= EXAMINE_Z1;
          
        -----------------------------------------------------------------------
        -----------------------------------------------------------------------

        WHEN EXAMINE_Z1 =>
          IF (handle_done = '1') THEN
            examine_done        <= '1';
            handle_ping_reply   <= '0';
            handle_arp_reply    <= '0';
            handle_dhcp_request <= '0';
            handle_dhcp_ack     <= '0';
            handle_buf_read     <= '0';
            handle_buf_write    <= '0';
            examine_state       <= EXAMINE_Z2;
          END IF;

        WHEN EXAMINE_Z2 =>
          examine_done        <= '0';
          examine_state       <= EXAMINE_A0;
          
        WHEN OTHERS =>
          examine_done        <= '0';
          examine_state       <= EXAMINE_A0;

      END CASE;

    END IF;
                       
  END PROCESS;


  -----------------------------------------------------------------------------
  -- handle received packets
  -----------------------------------------------------------------------------
  HANDLE_PACKET : PROCESS (slow_clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      snd_src_data_buf                  <= (OTHERS => '0');
      snd_src_last_word_empty           <= (OTHERS => '0');
      snd_src_fifo_wr_en                <= '0';
      snd_src_send_buf                  <= '0';
      snd_src_data_size                 <= (OTHERS => '0');
      dhcpdiscover_done                 <= '0';
      handle_done                       <= '0';
      handle_state                      <= HANDLE_A0;
      dhcp_lease_time_count1_load       <= '0';
      data_to_buf                       <= (OTHERS => '0');
      addr_for_buf                      <= (OTHERS => '0');
      data_to_buf_wr                    <= '0';


     ELSIF rising_edge(slow_clk) THEN

       CASE handle_state IS

         -- wait for handle
         WHEN HANDLE_A0 =>
           snd_src_send_buf     <= '0';
           snd_src_data_size    <= (OTHERS => '0');
           dhcpdiscover_done    <= '0';
           handle_done          <= '0';
           
           IF (handle_ping_reply = '1') THEN
             handle_state       <= HANDLE_ICMP1;
           ELSIF (handle_arp_reply = '1') THEN
             handle_state       <= HANDLE_ARP1;
           ELSIF ((dhcpdiscover_send_once = '1') OR dhcp_trigger = '1') THEN
             handle_state       <= HANDLE_DHCP_DISC1;
           ELSIF (handle_dhcp_request = '1') THEN
             handle_state       <= HANDLE_DHCP_REQ1;
           ELSIF (handle_dhcp_ack = '1') THEN
             handle_state       <= HANDLE_DHCP_ACK1;
           ELSIF (handle_buf_read = '1') THEN
             handle_state       <= HANDLE_BUF_READ1;
           ELSIF (handle_buf_write = '1') THEN
             handle_state       <= HANDLE_BUF_WRITE1;
           END IF;

         ----------------------------------------------------------------------  
         -- handle ICMP ping reply (PONG)
         ----------------------------------------------------------------------  
         WHEN HANDLE_ICMP1 =>
           snd_src_data_buf             <= eth_word_1(463 DOWNTO 416) & src_mac_addr &
                                           eth_word_1(415 DOWNTO 304) & src_ip_addr &
                                           eth_word_1(303 DOWNTO 272) &
                                           X"0000" &
                                           eth_word_1(223 DOWNTO  64) &
                                           X"0800" &
                                           eth_word_1( 47 DOWNTO   0);
 
           snd_src_last_word_empty      <= last_word_empty;
           snd_src_data_size            <= rec_data_size;
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_ICMP2;
           
         WHEN HANDLE_ICMP2 =>
           snd_src_data_buf             <= eth_word_2;
           snd_src_last_word_empty      <= last_word_empty;
           snd_src_data_size            <= rec_data_size;
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_ICMP3;
           
         WHEN HANDLE_ICMP3 =>
           snd_src_send_buf             <= '1';
           snd_src_fifo_wr_en           <= '0';
           handle_state                 <= HANDLE_ICMP4;
           
         WHEN HANDLE_ICMP4 =>
           IF (snd_src_send_busy_s = '1') THEN
             snd_src_send_buf           <= '0';
             handle_state               <= HANDLE_ICMP5;
           END IF;
           
         WHEN HANDLE_ICMP5 =>
           IF (snd_src_send_busy_s = '0') THEN
             handle_state               <= HANDLE_Z0;
           END IF;

         ----------------------------------------------------------------------  
         -- handle ARP reply
         ----------------------------------------------------------------------  
         WHEN HANDLE_ARP1 =>
           snd_src_data_buf             <= eth_word_1(463 DOWNTO 416) & src_mac_addr &
                                           ARP &
                                           eth_word_1(399 DOWNTO 352) & X"0002" &
                                           src_mac_addr & src_ip_addr &
                                           eth_word_1(463 DOWNTO 416) & eth_word_1(287 DOWNTO 256) &
                                           eth_word_1(175 DOWNTO 0);
           
           snd_src_last_word_empty      <= last_word_empty;
           snd_src_data_size            <= rec_data_size;
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_ARP2;
           
         WHEN HANDLE_ARP2 =>
           snd_src_send_buf             <= '1';
           snd_src_fifo_wr_en           <= '0';
           handle_state                 <= HANDLE_ARP3;
           
         WHEN HANDLE_ARP3 =>
           IF (snd_src_send_busy_s = '1') THEN
             snd_src_send_buf           <= '0';
             handle_state               <= HANDLE_ARP4;
           END IF;
           
         WHEN HANDLE_ARP4 =>
           IF (snd_src_send_busy_s = '0') THEN
             handle_state               <= HANDLE_Z0;
           END IF;

         ----------------------------------------------------------------------  
         -- handle DHCP DISCOVER
         ----------------------------------------------------------------------
         WHEN HANDLE_DHCP_DISC1 =>

           snd_src_data_buf             <= DHCP_DISCOVER_WORD1(511 DOWNTO 464) & src_mac_addr &
                                           DHCP_DISCOVER_WORD1(415 DOWNTO   0);
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_data_size            <= X"05";
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_DISC2;

         WHEN HANDLE_DHCP_DISC2 =>
           snd_src_data_buf             <= DHCP_DISCOVER_WORD2(511 DOWNTO 464) & src_mac_addr &
                                           DHCP_DISCOVER_WORD2(415 DOWNTO   0);
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_DISC3;

         WHEN HANDLE_DHCP_DISC3 =>
           snd_src_data_buf             <= ZERO_WORD;
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_DISC4;

         WHEN HANDLE_DHCP_DISC4 =>
           snd_src_data_buf             <= ZERO_WORD;
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_DISC5;

         WHEN HANDLE_DHCP_DISC5 =>
           snd_src_data_buf             <= DHCP_DISCOVER_WORD3;
 
           snd_src_last_word_empty      <= "110000";
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_DISC6;

         WHEN HANDLE_DHCP_DISC6 =>
           snd_src_send_buf             <= '1';
           snd_src_fifo_wr_en           <= '0';
           handle_state                 <= HANDLE_DHCP_DISC7;

         WHEN HANDLE_DHCP_DISC7 =>
           IF (snd_src_send_busy_s = '1') THEN
             snd_src_send_buf           <= '0';
             handle_state               <= HANDLE_DHCP_DISC8;
           END IF;
           
         WHEN HANDLE_DHCP_DISC8 =>
           IF (snd_src_send_busy_s = '0') THEN
             dhcpdiscover_done          <= '1';
             handle_state               <= HANDLE_Z0;
           END IF;

         ----------------------------------------------------------------------  
         -- handle DHCP REQUEST
         ----------------------------------------------------------------------
         WHEN HANDLE_DHCP_REQ1 =>
           snd_src_data_buf             <= DHCP_REQUEST_WORD1(511 DOWNTO 464) & src_mac_addr &
                                           DHCP_REQUEST_WORD1(415 DOWNTO   0);
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_data_size            <= X"05";
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_REQ2;

         WHEN HANDLE_DHCP_REQ2 =>
           snd_src_data_buf             <= DHCP_REQUEST_WORD2(511 DOWNTO 464) & src_mac_addr &
                                           DHCP_REQUEST_WORD2(415 DOWNTO   0);
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_REQ3;

         WHEN HANDLE_DHCP_REQ3 =>
           snd_src_data_buf             <= ZERO_WORD;
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_REQ4;

         WHEN HANDLE_DHCP_REQ4 =>
           snd_src_data_buf             <= ZERO_WORD;
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_REQ5;

         WHEN HANDLE_DHCP_REQ5 =>
           snd_src_data_buf             <= DHCP_REQUEST_WORD3(511 DOWNTO 264) & dhcp_server_id & DHCP_REQUEST_WORD3(231 DOWNTO 216) &
                                           dhcp_ip_addr_offer & DHCP_REQUEST_WORD3(183 DOWNTO 0);
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_fifo_wr_en           <= '1';

           handle_state                 <= HANDLE_DHCP_REQ6;

         WHEN HANDLE_DHCP_REQ6 =>
           snd_src_send_buf             <= '1';
           snd_src_fifo_wr_en           <= '0';
           handle_state                 <= HANDLE_DHCP_REQ7;

         WHEN HANDLE_DHCP_REQ7 =>
           IF (snd_src_send_busy_s = '1') THEN
             snd_src_send_buf           <= '0';
             handle_state               <= HANDLE_DHCP_REQ8;
           END IF;
           
         WHEN HANDLE_DHCP_REQ8 =>
           IF (snd_src_send_busy_s = '0') THEN
             handle_state               <= HANDLE_Z0;
           END IF;


         ----------------------------------------------------------------------  
         -- handle DHCP ACKNOWLEDGE
         ----------------------------------------------------------------------
         WHEN HANDLE_DHCP_ACK1 =>
           dhcp_lease_time_count1_load  <= '1';
           addr_for_buf                 <= X"00" & X"11";
           data_to_buf                  <= dhcp_ip_addr_offer;
           data_to_buf_wr               <= '1';
           handle_state                 <= HANDLE_DHCP_ACK2;
        
         -----------------------------------------------------------------------
         WHEN HANDLE_DHCP_ACK2 =>
           dhcp_lease_time_count1_load  <= '0';
           handle_state                 <= HANDLE_Z0;

           
         ----------------------------------------------------------------------  
         -- handle BUF READ
         ----------------------------------------------------------------------
         WHEN HANDLE_BUF_READ1 =>
           addr_for_buf                 <= X"00" & eth_word_1(39 DOWNTO 32);
           handle_state                 <= HANDLE_BUF_READ2;

         WHEN HANDLE_BUF_READ2 =>
           snd_src_data_buf             <= eth_word_1(463 DOWNTO 416) & src_mac_addr &
                                           eth_word_1(415 DOWNTO 304) & src_ip_addr &
                                           eth_word_1(303 DOWNTO 272) &
                                           eth_word_1(239 DOWNTO 192) &
                                           X"0000" &
                                           eth_word_1(175 DOWNTO  32) &
                                           data_from_buf;
 
           snd_src_last_word_empty      <= (OTHERS => '0');
           snd_src_data_size            <= X"01";
           snd_src_fifo_wr_en           <= '1';
           handle_state                 <= HANDLE_BUF_READ3;

         WHEN HANDLE_BUF_READ3 =>
           snd_src_fifo_wr_en           <= '0';
           snd_src_send_buf             <= '1';
           handle_state                 <= HANDLE_BUF_READ4;

         WHEN HANDLE_BUF_READ4 =>
           IF (snd_src_send_busy_s = '1') THEN
             snd_src_send_buf           <= '0';
             handle_state               <= HANDLE_BUF_READ5;
           END IF;

         WHEN HANDLE_BUF_READ5 =>
           IF (snd_src_send_busy_s = '0') THEN
             handle_state               <= HANDLE_Z0;
           END IF;

         ----------------------------------------------------------------------  
         -- handle BUF WRITE
         ----------------------------------------------------------------------
         WHEN HANDLE_BUF_WRITE1 =>
           addr_for_buf                 <= X"00" & eth_word_1(39 DOWNTO 32);
           data_to_buf                  <= eth_word_1(31 DOWNTO  0);
           data_to_buf_wr               <= '1';
           handle_state                 <= HANDLE_BUF_WRITE2;

         WHEN HANDLE_BUF_WRITE2 =>
           data_to_buf_wr               <= '0';
           handle_state                 <= HANDLE_Z0;

         ----------------------------------------------------------------------
         WHEN HANDLE_Z0 =>
           handle_done                  <= '1';
           handle_state                 <= HANDLE_Z1;
           
         WHEN HANDLE_Z1 =>
           handle_state                 <= HANDLE_A0;
           
         WHEN OTHERS =>
           handle_done                  <= '1';
           handle_state                 <= HANDLE_A0;
       END CASE;
       
     END IF;

  END PROCESS;


  -----------------------------------------------------------------------------
  -- 1 OUT OF 128 MUX FOR 512 WORD 5 and WORD 6 (DHCP options range)
  -----------------------------------------------------------------------------
  PROCESS (eth_word_5,eth_word_6,byte_idx) IS
  BEGIN
    CASE byte_idx IS

      WHEN   1 =>
        byte_of_512 <= eth_word_5(511 DOWNTO 504);
      WHEN   2 =>
        byte_of_512 <= eth_word_5(503 DOWNTO 496);
      WHEN   3 =>
        byte_of_512 <= eth_word_5(495 DOWNTO 488);
      WHEN   4 =>
        byte_of_512 <= eth_word_5(487 DOWNTO 480);
      WHEN   5 =>
        byte_of_512 <= eth_word_5(479 DOWNTO 472);
      WHEN   6 =>
        byte_of_512 <= eth_word_5(471 DOWNTO 464);
      WHEN   7 =>
        byte_of_512 <= eth_word_5(463 DOWNTO 456);
      WHEN   8 =>
        byte_of_512 <= eth_word_5(455 DOWNTO 448);

      WHEN   9 =>
        byte_of_512 <= eth_word_5(447 DOWNTO 440);
      WHEN  10 =>
        byte_of_512 <= eth_word_5(439 DOWNTO 432);
      WHEN  11 =>
        byte_of_512 <= eth_word_5(431 DOWNTO 424);
      WHEN  12 =>
        byte_of_512 <= eth_word_5(423 DOWNTO 416);
      WHEN  13 =>
        byte_of_512 <= eth_word_5(415 DOWNTO 408);
      WHEN  14 =>
        byte_of_512 <= eth_word_5(407 DOWNTO 400);
      WHEN  15 =>
        byte_of_512 <= eth_word_5(399 DOWNTO 392);
      WHEN  16 =>
        byte_of_512 <= eth_word_5(391 DOWNTO 384);

      WHEN  17 =>
        byte_of_512 <= eth_word_5(383 DOWNTO 376);
      WHEN  18 =>
        byte_of_512 <= eth_word_5(375 DOWNTO 368);
      WHEN  19 =>
        byte_of_512 <= eth_word_5(367 DOWNTO 360);
      WHEN  20 =>
        byte_of_512 <= eth_word_5(359 DOWNTO 352);
      WHEN  21 =>
        byte_of_512 <= eth_word_5(351 DOWNTO 344);
      WHEN  22 =>
        byte_of_512 <= eth_word_5(343 DOWNTO 336);
      WHEN  23 =>
        byte_of_512 <= eth_word_5(335 DOWNTO 328);
      WHEN  24 =>
        byte_of_512 <= eth_word_5(327 DOWNTO 320);

      WHEN  25 =>
        byte_of_512 <= eth_word_5(319 DOWNTO 312);
      WHEN  26 =>
        byte_of_512 <= eth_word_5(311 DOWNTO 304);
      WHEN  27 =>
        byte_of_512 <= eth_word_5(303 DOWNTO 296);
      WHEN  28 =>
        byte_of_512 <= eth_word_5(295 DOWNTO 288);
      WHEN  29 =>
        byte_of_512 <= eth_word_5(287 DOWNTO 280);
      WHEN  30 =>
        byte_of_512 <= eth_word_5(279 DOWNTO 272);
      WHEN  31 =>
        byte_of_512 <= eth_word_5(271 DOWNTO 264);
      WHEN  32 =>
        byte_of_512 <= eth_word_5(263 DOWNTO 256);


      WHEN  33 =>
        byte_of_512 <= eth_word_5(255 DOWNTO 248);
      WHEN  34 =>
        byte_of_512 <= eth_word_5(247 DOWNTO 240);
      WHEN  35 =>
        byte_of_512 <= eth_word_5(239 DOWNTO 232);
      WHEN  36 =>
        byte_of_512 <= eth_word_5(231 DOWNTO 224);
      WHEN  37 =>
        byte_of_512 <= eth_word_5(223 DOWNTO 216);
      WHEN  38 =>
        byte_of_512 <= eth_word_5(215 DOWNTO 208);
      WHEN  39 =>
        byte_of_512 <= eth_word_5(207 DOWNTO 200);
      WHEN  40 =>
        byte_of_512 <= eth_word_5(199 DOWNTO 192);

      WHEN  41 =>
        byte_of_512 <= eth_word_5(191 DOWNTO 184);
      WHEN  42 =>
        byte_of_512 <= eth_word_5(183 DOWNTO 176);
      WHEN  43 =>
        byte_of_512 <= eth_word_5(175 DOWNTO 168);
      WHEN  44 =>
        byte_of_512 <= eth_word_5(167 DOWNTO 160);
      WHEN  45 =>
        byte_of_512 <= eth_word_5(159 DOWNTO 152);
      WHEN  46 =>
        byte_of_512 <= eth_word_5(151 DOWNTO 144);
      WHEN  47 =>
        byte_of_512 <= eth_word_5(143 DOWNTO 136);
      WHEN  48 =>
        byte_of_512 <= eth_word_5(135 DOWNTO 128);

      WHEN  49 =>
        byte_of_512 <= eth_word_5(127 DOWNTO 120);
      WHEN  50 =>
        byte_of_512 <= eth_word_5(119 DOWNTO 112);
      WHEN  51 =>
        byte_of_512 <= eth_word_5(111 DOWNTO 104);
      WHEN  52 =>
        byte_of_512 <= eth_word_5(103 DOWNTO  96);
      WHEN  53 =>
        byte_of_512 <= eth_word_5( 95 DOWNTO  88);
      WHEN  54 =>
        byte_of_512 <= eth_word_5( 87 DOWNTO  80);
      WHEN  55 =>
        byte_of_512 <= eth_word_5( 79 DOWNTO  72);
      WHEN  56 =>
        byte_of_512 <= eth_word_5( 71 DOWNTO  64);

      WHEN  57 =>
        byte_of_512 <= eth_word_5( 63 DOWNTO  56);
      WHEN  58 =>
        byte_of_512 <= eth_word_5( 55 DOWNTO  48);
      WHEN  59 =>
        byte_of_512 <= eth_word_5( 47 DOWNTO  40);
      WHEN  60 =>
        byte_of_512 <= eth_word_5( 39 DOWNTO  32);
      WHEN  61 =>
        byte_of_512 <= eth_word_5( 31 DOWNTO  24);
      WHEN  62 =>
        byte_of_512 <= eth_word_5( 23 DOWNTO  16);
      WHEN  63 =>
        byte_of_512 <= eth_word_5( 15 DOWNTO   8);
      WHEN  64 =>
        byte_of_512 <= eth_word_5(  7 DOWNTO   0);

        
      WHEN  65 =>
        byte_of_512 <= eth_word_6(511 DOWNTO 504);
      WHEN  66 =>
        byte_of_512 <= eth_word_6(503 DOWNTO 496);
      WHEN  67 =>
        byte_of_512 <= eth_word_6(495 DOWNTO 488);
      WHEN  68 =>
        byte_of_512 <= eth_word_6(487 DOWNTO 480);
      WHEN  69 =>
        byte_of_512 <= eth_word_6(479 DOWNTO 472);
      WHEN  70 =>
        byte_of_512 <= eth_word_6(471 DOWNTO 464);
      WHEN  71 =>
        byte_of_512 <= eth_word_6(463 DOWNTO 456);
      WHEN  72 =>
        byte_of_512 <= eth_word_6(455 DOWNTO 448);

      WHEN  73 =>
        byte_of_512 <= eth_word_6(447 DOWNTO 440);
      WHEN  74 =>
        byte_of_512 <= eth_word_6(439 DOWNTO 432);
      WHEN  75 =>
        byte_of_512 <= eth_word_6(431 DOWNTO 424);
      WHEN  76 =>
        byte_of_512 <= eth_word_6(423 DOWNTO 416);
      WHEN  77 =>
        byte_of_512 <= eth_word_6(415 DOWNTO 408);
      WHEN  78 =>
        byte_of_512 <= eth_word_6(407 DOWNTO 400);
      WHEN  79 =>
        byte_of_512 <= eth_word_6(399 DOWNTO 392);
      WHEN  80 =>
        byte_of_512 <= eth_word_6(391 DOWNTO 384);

      WHEN  81 =>
        byte_of_512 <= eth_word_6(383 DOWNTO 376);
      WHEN  82 =>
        byte_of_512 <= eth_word_6(375 DOWNTO 368);
      WHEN  83 =>
        byte_of_512 <= eth_word_6(367 DOWNTO 360);
      WHEN  84 =>
        byte_of_512 <= eth_word_6(359 DOWNTO 352);
      WHEN  85 =>
        byte_of_512 <= eth_word_6(351 DOWNTO 344);
      WHEN  86 =>
        byte_of_512 <= eth_word_6(343 DOWNTO 336);
      WHEN  87 =>
        byte_of_512 <= eth_word_6(335 DOWNTO 328);
      WHEN  88 =>
        byte_of_512 <= eth_word_6(327 DOWNTO 320);

      WHEN  89 =>
        byte_of_512 <= eth_word_6(319 DOWNTO 312);
      WHEN  90 =>
        byte_of_512 <= eth_word_6(311 DOWNTO 304);
      WHEN  91 =>
        byte_of_512 <= eth_word_6(303 DOWNTO 296);
      WHEN  92 =>
        byte_of_512 <= eth_word_6(295 DOWNTO 288);
      WHEN  93 =>
        byte_of_512 <= eth_word_6(287 DOWNTO 280);
      WHEN  94 =>
        byte_of_512 <= eth_word_6(279 DOWNTO 272);
      WHEN  95 =>
        byte_of_512 <= eth_word_6(271 DOWNTO 264);
      WHEN  96 =>
        byte_of_512 <= eth_word_6(263 DOWNTO 256);


      WHEN  97 =>
        byte_of_512 <= eth_word_6(255 DOWNTO 248);
      WHEN  98 =>
        byte_of_512 <= eth_word_6(247 DOWNTO 240);
      WHEN  99 =>
        byte_of_512 <= eth_word_6(239 DOWNTO 232);
      WHEN 100 =>
        byte_of_512 <= eth_word_6(231 DOWNTO 224);
      WHEN 101 =>
        byte_of_512 <= eth_word_6(223 DOWNTO 216);
      WHEN 102 =>
        byte_of_512 <= eth_word_6(215 DOWNTO 208);
      WHEN 103 =>
        byte_of_512 <= eth_word_6(207 DOWNTO 200);
      WHEN 104 =>
        byte_of_512 <= eth_word_6(199 DOWNTO 192);

      WHEN 105 =>
        byte_of_512 <= eth_word_6(191 DOWNTO 184);
      WHEN 106 =>
        byte_of_512 <= eth_word_6(183 DOWNTO 176);
      WHEN 107 =>
        byte_of_512 <= eth_word_6(175 DOWNTO 168);
      WHEN 108 =>
        byte_of_512 <= eth_word_6(167 DOWNTO 160);
      WHEN 109 =>
        byte_of_512 <= eth_word_6(159 DOWNTO 152);
      WHEN 110 =>
        byte_of_512 <= eth_word_6(151 DOWNTO 144);
      WHEN 111 =>
        byte_of_512 <= eth_word_6(143 DOWNTO 136);
      WHEN 112 =>
        byte_of_512 <= eth_word_6(135 DOWNTO 128);

      WHEN 113 =>
        byte_of_512 <= eth_word_6(127 DOWNTO 120);
      WHEN 114 =>
        byte_of_512 <= eth_word_6(119 DOWNTO 112);
      WHEN 115 =>
        byte_of_512 <= eth_word_6(111 DOWNTO 104);
      WHEN 116 =>
        byte_of_512 <= eth_word_6(103 DOWNTO  96);
      WHEN 117 =>
        byte_of_512 <= eth_word_6( 95 DOWNTO  88);
      WHEN 118 =>
        byte_of_512 <= eth_word_6( 87 DOWNTO  80);
      WHEN 119 =>
        byte_of_512 <= eth_word_6( 79 DOWNTO  72);
      WHEN 120 =>
        byte_of_512 <= eth_word_6( 71 DOWNTO  64);

      WHEN 121 =>
        byte_of_512 <= eth_word_6( 63 DOWNTO  56);
      WHEN 122 =>
        byte_of_512 <= eth_word_6( 55 DOWNTO  48);
      WHEN 123 =>
        byte_of_512 <= eth_word_6( 47 DOWNTO  40);
      WHEN 124 =>
        byte_of_512 <= eth_word_6( 39 DOWNTO  32);
      WHEN 125 =>
        byte_of_512 <= eth_word_6( 31 DOWNTO  24);
      WHEN 126 =>
        byte_of_512 <= eth_word_6( 23 DOWNTO  16);
      WHEN 127 =>
        byte_of_512 <= eth_word_6( 15 DOWNTO   8);
      WHEN 128 =>
        byte_of_512 <= eth_word_6(  7 DOWNTO   0);

      WHEN OTHERS =>
        byte_of_512 <= eth_word_6(  7 DOWNTO   0);

    END CASE;

  END PROCESS;


  
  STATES_FOR_ILA_1 : PROCESS (catch_state) IS
  BEGIN

    CASE catch_state IS
      WHEN CATCH_A0 =>
        state_for_ila_1 <= "0000";
      WHEN CATCH_A1 =>
        state_for_ila_1 <= "0001";
      WHEN CATCH_A2 =>
        state_for_ila_1 <= "0010";
      WHEN CATCH_A3 =>
        state_for_ila_1 <= "0011";
      WHEN CATCH_A4 =>
        state_for_ila_1 <= "0100";
      WHEN CATCH_A5 =>
        state_for_ila_1 <= "0101";
      WHEN CATCH_A6 =>
        state_for_ila_1 <= "0110";
      WHEN OTHERS => 
        state_for_ila_1 <= "1111";
    END CASE;

  END PROCESS;

  
  STATES_FOR_ILA_2 : PROCESS (examine_state) IS
  BEGIN

    CASE examine_state IS
      WHEN EXAMINE_A0 =>
        state_for_ila_2 <= "0000";
      WHEN EXAMINE_A1 =>
        state_for_ila_2 <= "0001";
      WHEN EXAMINE_DHCP1 =>
        state_for_ila_2 <= "0010";
      WHEN EXAMINE_DHCP2 =>
        state_for_ila_2 <= "0011";
      WHEN EXAMINE_DHCP3 =>
        state_for_ila_2 <= "0100";
      WHEN EXAMINE_DHCP4 =>
        state_for_ila_2 <= "0101";
      WHEN EXAMINE_DHCP5 =>
        state_for_ila_2 <= "0110";
      WHEN EXAMINE_Z1 =>
        state_for_ila_2 <= "0111";
      WHEN EXAMINE_Z2 =>
        state_for_ila_2 <= "1000";
      WHEN OTHERS => 
        state_for_ila_2 <= "1001";
    END CASE;

  END PROCESS;
  

  STATES_FOR_ILA_3 : PROCESS (handle_state) IS
  BEGIN

    CASE handle_state IS
      WHEN HANDLE_A0 =>
        state_for_ila_3 <= X"00";
      WHEN HANDLE_ICMP1 =>
        state_for_ila_3 <= X"01";
      WHEN HANDLE_ICMP2 =>
        state_for_ila_3 <= X"02";
      WHEN HANDLE_ICMP3 =>
        state_for_ila_3 <= X"03";
      WHEN HANDLE_ICMP4 =>
        state_for_ila_3 <= X"04";
      WHEN HANDLE_ICMP5 =>
        state_for_ila_3 <= X"05";
      WHEN HANDLE_ARP1 =>
        state_for_ila_3 <= X"06";
      WHEN HANDLE_ARP2 =>
        state_for_ila_3 <= X"07";
      WHEN HANDLE_ARP3 =>
        state_for_ila_3 <= X"08";
      WHEN HANDLE_ARP4 =>
        state_for_ila_3 <= X"09";
      WHEN HANDLE_DHCP_DISC1 =>
        state_for_ila_3 <= X"0A";
      WHEN HANDLE_DHCP_DISC2 =>
        state_for_ila_3 <= X"0B";
      WHEN HANDLE_DHCP_DISC3 =>
        state_for_ila_3 <= X"0C";
      WHEN HANDLE_DHCP_DISC4 =>
        state_for_ila_3 <= X"0D";
      WHEN HANDLE_DHCP_DISC5 =>
        state_for_ila_3 <= X"0E";
      WHEN HANDLE_DHCP_DISC6 =>
        state_for_ila_3 <= X"0F";
      WHEN HANDLE_DHCP_DISC7 =>
        state_for_ila_3 <= X"10";
      WHEN HANDLE_DHCP_DISC8 =>
        state_for_ila_3 <= X"11";
      WHEN HANDLE_DHCP_REQ1 =>
        state_for_ila_3 <= X"12";
      WHEN HANDLE_DHCP_REQ2 =>
        state_for_ila_3 <= X"13";
      WHEN HANDLE_DHCP_REQ3 =>
        state_for_ila_3 <= X"14";
      WHEN HANDLE_DHCP_REQ4 =>
        state_for_ila_3 <= X"15";
      WHEN HANDLE_DHCP_REQ5 =>
        state_for_ila_3 <= X"16";
      WHEN HANDLE_DHCP_REQ6 =>
        state_for_ila_3 <= X"17";
      WHEN HANDLE_DHCP_REQ7 =>
        state_for_ila_3 <= X"18";
      WHEN HANDLE_DHCP_REQ8 =>
        state_for_ila_3 <= X"19";
      WHEN HANDLE_DHCP_ACK1 =>
        state_for_ila_3 <= X"1A";
      WHEN HANDLE_DHCP_ACK2 =>
        state_for_ila_3 <= X"1B";
      WHEN HANDLE_BUF_READ1 =>
        state_for_ila_3 <= X"1C";
      WHEN HANDLE_BUF_READ2 =>
        state_for_ila_3 <= X"1D";
      WHEN HANDLE_BUF_WRITE1 =>
        state_for_ila_3 <= X"1E";
      WHEN HANDLE_Z0 =>
        state_for_ila_3 <= X"1F";
      WHEN HANDLE_Z1 =>
        state_for_ila_3 <= X"20";
      WHEN OTHERS => 
        state_for_ila_3 <= X"FF";
    END CASE;

  END PROCESS;

  

--  ILA_2_inst : COMPONENT ila_1
--  PORT MAP (
--    clk                 => slow_clk,
--    probe0(95 DOWNTO 0) => (OTHERS => '0'),
--    probe1(5 DOWNTO  4) => (OTHERS => '0'),
--    probe1(3 DOWNTO  0) => test_prot_fifo_dout(3 DOWNTO 0),
--    probe2(0)           => '0',
--    probe3(0)           => test_prot_fifo_rd_en,
--    probe4(0)           => test_prot_fifo_empty,
--    probe5(0)           => '0',
--    probe6(0)           => '0',
--    probe7(0)           => '0'
--    );


  
--  ILA_1_inst : COMPONENT ila_1
--  PORT MAP (
--    clk                 => clk,
--    probe0(95 DOWNTO 0) => (OTHERS => '0'),
--    probe1( 5 DOWNTO 3) => (OTHERS => '0'),
--    probe1( 2 DOWNTO 0) => (OTHERS => '0'),
--    probe2(0)           => sop,
--    probe3(0)           => eop,
--    probe4(0)           => ena,
--    probe5(0)           => prot_fifo_wr_en,
--    probe6(0)           => eop_l,
--    probe7(0)           => sop_l
--    );

--  ILA_1_inst : COMPONENT ila_1
--  PORT MAP (
--    clk                 => slow_clk,
--    probe0(95 DOWNTO 0) => prot_fifo_dout(528 DOWNTO 433),
--    probe1( 5 DOWNTO 4) => (OTHERS => '0'),
--    probe1( 3 DOWNTO 0) => state_for_ila_1,
--    probe2(0)           => snd_src_send_busy,
--    probe3(0)           => snd_src_send_buf,
--    probe4(0)           => '0',
--    probe5(0)           => '0',
--    probe6(0)           => '0',
--    probe7(0)           => '0'
--    );
  
--  ILA_2_inst : COMPONENT ila_1
--  PORT MAP (
--    clk                  => slow_clk,
--    probe0               => prot_fifo_dout(511 DOWNTO 0),
--    probe1( 5 DOWNTO  4) => (OTHERS => '0'),
--    probe1( 3 DOWNTO  0) => state_for_ila_1,
--    probe2(0)            => handle_ping_reply,
--    probe3(0)            => handle_arp_reply,
--    probe4(0)            => handle_done,
--    probe5(0)            => snd_src_send_buf,
--    probe6(0)            => examine_done,
--    probe7(0)            => '0'
--    );
  
--  ILA_3_inst : COMPONENT ila_1
--  PORT MAP (
--    clk                         => slow_clk,
--    probe0(511 DOWNTO 508)      => state_for_ila_1,
--    probe0(507 DOWNTO 504)      => state_for_ila_2,
--    probe0(503 DOWNTO 496)      => state_for_ila_3,
--    probe0(495 DOWNTO   0)      => (OTHERS => '0'), 
--    probe1(5)                   => prot_fifo_empty,
--    probe1(4)                   => sop_s,
--    probe1(3)                   => eop_s,
--    probe1(2)                   => prot_fifo_rd_en,
--    probe1(1)                   => read_prot_fifo,
--    probe1(0)                   => '0',
--    probe2(0)                   => handle_done,
--    probe3(0)                   => snd_src_send_buf,
--    probe4(0)                   => handle_arp_reply,
--    probe5(0)                   => handle_ping_reply,
--    probe6(0)                   => handle_dhcp_request,
--    probe7(0)                   => handle_buf_read
--    );
  
--  ILA_4_inst : COMPONENT ila_1
--  PORT MAP (
--    clk                 => slow_clk,
--    probe0(95 DOWNTO 0) => prot_fifo_dout(511 DOWNTO 416),
--    probe1( 5 DOWNTO 0) => (OTHERS => '0'),
--    probe2(0)           => sop_s,
--    probe3(0)           => eop_s,
--    probe4(0)           => err_s,
--    probe5(0)           => '0',
--    probe6(0)           => '0',
--    probe7(0)           => '0'
--    );
  
END arch;

