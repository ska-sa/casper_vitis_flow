-- dsp_header 31 October 2018 by claus

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
USE WORK.DSP_PARAMETERS.ALL;


LIBRARY UNISIM;
USE UNISIM.VCOMPONENTS.ALL;



------------------
-- HEADER STACK --
------------------


--    WORD 1 (511 ... 256)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    ||                    ETH                 ||                                                                   IP                                                                         ||
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    |   MAC DEST   |   MAC SRC   |  eth type  |   IHL   |   version   |   TOS   |  total length  |  ident  |  flags + frag offs  |   TTL   |   protocol  |  hdr chks  |  src addr  |  dest addr  
--    511         464 463       416 415      400 399   396 395       392 391   384 383          368 367   352 351               336 335   328 327       320 319      304 303      272 271      256


--    WORD 1 (255 ... 0)
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                    ||                          UDP                              ||                                                  SPEAD
--    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--    |   dest_addr   |  source port  |  destination port  |  length  |  checksum  |  magic#  |  version  |  itempointerwidth  |  heapaddrwidth  |  reserved  |  nofitems  |  heap ID  | heap size
--    255          240 239         224 223              208 207    192 191      176 175    168 167     160 159              152 151           144 143      128 127      112 111      48 47       0




--    WORD 2 (511 ... 256)
--    |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                               SPEAD                                                                               
--    |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                          |              heap offset               |             packet length               |                  0x1600               |                   0x3101              
--    511                496 495                                  432 431                                   368 367                                 304 303                                     256


--    WORD 2 (255 ... 0)
--    |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                                                                                               SPEAD                     ||                                                          
--    |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                       |                   0x3102                        |                  0x3300                       |                 
--    255             240 239                                           176 175                                         112 111                                                                   0



-----------
-- SPEAD --
-----------
-- item pointer #     item pointer     MSB(1b)     (15b)                       LSB (48b)
---------------------------------------------------------------------------------------------------------
--              1     heap_id          1           000 0000 0000 0001          SPEADTIME
--              2     heap_size        1           000 0000 0000 0010          5120
--              3     heap_offset      1           000 0000 0000 0011          0
--              4     packet_length    1           000 0000 0000 0100          5120
--              5     0x1600           1           001 0110 0000 0000          SPEADTIME
--              6     0x3101           1           011 0001 0000 0001          digitiser_serial(24)
--                                                                             digitiser_type(8b)
--                                                                             receptor_id(14b)
--                                                                             pol_id(2b)
--              7     0x3102           1           011 0001 0000 0010          adc_count(16)
--                                                                             zeros(30b)
--                                                                             adc_saturation_flag(1b)
--                                                                             ndiode_flag(1b)
--              8     0x3300           0           011 0011 0000 0000          ADC data offset



ENTITY dsp_header IS
PORT ( 
  clk                           : IN STD_LOGIC;
  rst                           : IN STD_LOGIC;
  
  item_pointer_01               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  item_pointer_02               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  item_pointer_03               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  item_pointer_04               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  item_pointer_05               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  item_pointer_06               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  item_pointer_07               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  item_pointer_08               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);

  item_pointer_09               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  item_pointer_10               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
  item_pointer_11               : IN STD_LOGIC_VECTOR(63 DOWNTO 0);

  data_size                     : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

  mcast_offs                    : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
  heap_offs                     : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
  heap_size                     : IN STD_LOGIC_VECTOR(47 DOWNTO 0);

  mac_dst_addr                  : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
  mac_src_addr                  : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
  ip_dst_addr                   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  ip_src_addr                   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

  udp_dst_port                  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  udp_src_port                  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  
  pol_id                        : IN STD_LOGIC_VECTOR( 1 DOWNTO 0);
  timestamp                     : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
  adc_sat_count                 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  adc_sat_flag                  : IN STD_LOGIC;
  ndiode_flag                   : IN STD_LOGIC;
  
  header                        : OUT STD_LOGIC_VECTOR(511 DOWNTO 0);
  header_size                   : OUT STD_LOGIC_VECTOR(  3 DOWNTO 0);
  header_valid                  : OUT STD_LOGIC;
  header_last_word_empty        : OUT STD_LOGIC_VECTOR(  5 DOWNTO 0);
  header_word_sel               : IN  STD_LOGIC_VECTOR(  3 DOWNTO 0)
  );
END dsp_header;


ARCHITECTURE arch OF dsp_header IS

  -- ETH
  -----------------------------------------------------------------------------
  -- MAC DESTINATION              from buffer     6 byte
  -- MAC SOURCE                   from buffer     6 byte
  CONSTANT ETH_ETHERTYPE                : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"0800";

  -- IP --
  -------------------------------------------------------------------------------
  CONSTANT IP_HEADER_VERSION            : STD_LOGIC_VECTOR(3 DOWNTO 0)  := X"4";
  CONSTANT IP_HEADER_LENGTH             : STD_LOGIC_VECTOR(3 DOWNTO 0)  := X"5";
  CONSTANT IP_TYPE_OF_SERVICE           : STD_LOGIC_VECTOR(7 DOWNTO 0)  := X"00";
  -- IP TOTAL LENGTH              data_size_from_buffer * 32 + 20 + 8 + 8 + 64
  CONSTANT IP_IDENTIFICATION            : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"0000";
  CONSTANT IP_FLAGS_FRAGMENT_OFFSET     : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"4000";
  CONSTANT IP_TIME_TO_LIVE              : STD_LOGIC_VECTOR(7 DOWNTO 0)  := X"40";
  CONSTANT IP_PROTOCOL                  : STD_LOGIC_VECTOR(7 DOWNTO 0)  := X"11";
  CONSTANT IP_HEADER_CHKSUM_DUMMY       : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"0000";
  -- IP HEADER CHECKSUM           calculated      2 byte
  -- IP SOURCE ADDRESS            from buffer     4 byte
  -- IP DESTINATION ADDRESS       from buffer     4 byte
  SIGNAL ip_total_length                : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"0000";

  -- UDP --
  -----------------------------------------------------------------------------
  -- UDP SOURCE PORT              from buffer     2 byte
  -- UDP DESTINATION PORT         from buffer     2 byte
  -- UDP_LENGTH                   data_size from buffer * 32 + 8 + 8 + 64
  -- UDP CHECKSUM                 calculated      2 byte
  CONSTANT UDP_HEADER_LENGTH            : UNSIGNED(3 DOWNTO 0) := X"8";
  CONSTANT UDP_CHKSUM_DUMMY             : STD_LOGIC_VECTOR(15 DOWNTO 0)  := X"0000";
  SIGNAL udp_length                     : STD_LOGIC_VECTOR(15 DOWNTO 0)  := X"0000";

  -- SPEAD
  -----------------------------------------------------------------------------
  CONSTANT SPEAD_HEADER_LENGTH          : UNSIGNED(3 DOWNTO 0) := X"8";
  CONSTANT SPEAD_INFO_LENGTH            : UNSIGNED(15 DOWNTO 0) := X"0040";

  CONSTANT SPEAD_MAGIC                  : STD_LOGIC_VECTOR(7 DOWNTO 0)  := X"53";
  CONSTANT SPEAD_VERSION                : STD_LOGIC_VECTOR(7 DOWNTO 0)  := X"04";
  CONSTANT SPEAD_ITEM_POINTER_WIDTH     : STD_LOGIC_VECTOR(7 DOWNTO 0)  := X"02";
  CONSTANT SPEAD_HEAP_ADDR_WIDTH        : STD_LOGIC_VECTOR(7 DOWNTO 0)  := X"06";
  CONSTANT SPEAD_RESERVED               : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"0000";
  CONSTANT SPEAD_NOF_ITEMS              : STD_LOGIC_VECTOR(15 DOWNTO 0) := X"0008";

  CONSTANT NULL_VECTOR                  : STD_LOGIC_VECTOR(511 DOWNTO 0) := (OTHERS => '0');
  
  SIGNAL heap_id                        : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL mac_dst_addr_int               : STD_LOGIC_VECTOR(47 DOWNTO 0);
  SIGNAL ip_dst_addr_int                : STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN

  header_size                   <= "0010";
  header_last_word_empty        <= STD_LOGIC_VECTOR(TO_UNSIGNED((64 - HEADER_LAST_WORD_VALID_CONST),6));
  
  ip_total_length               <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(IP_HEADER_LENGTH & "00"),16) + RESIZE(UDP_HEADER_LENGTH,16) +
                                   SPEAD_HEADER_LENGTH + SPEAD_INFO_LENGTH + RESIZE(UNSIGNED(data_size & "000000"),16));

  udp_length                    <= STD_LOGIC_VECTOR(RESIZE(UDP_HEADER_LENGTH,16) + SPEAD_INFO_LENGTH + SPEAD_HEADER_LENGTH +
                                   RESIZE(UNSIGNED(data_size & "000000"),16));


  -----------------------------------------------------------------------------
  -- DESTINATION HANDLING
  -----------------------------------------------------------------------------
  DESTINATION : PROCESS (mac_dst_addr,ip_dst_addr,mcast_offs) IS
    VARIABLE mac_dst_addr_var       : STD_LOGIC_VECTOR(8 DOWNTO 0);
    VARIABLE ip_dst_addr_var        : STD_LOGIC_VECTOR(8 DOWNTO 0);
    
  BEGIN

    mac_dst_addr_int(47 DOWNTO 8)       <= mac_dst_addr(47 DOWNTO 8);
    mac_dst_addr_var                    := STD_LOGIC_VECTOR(RESIZE(UNSIGNED(mac_dst_addr(7 DOWNTO 0)),9) + RESIZE(UNSIGNED(mcast_offs),9));
    mac_dst_addr_int( 7 DOWNTO 0)       <= mac_dst_addr_var(7 DOWNTO 0);
  
    ip_dst_addr_int(31 DOWNTO 8)        <= ip_dst_addr(31 DOWNTO 8);
    ip_dst_addr_var                     := STD_LOGIC_VECTOR(RESIZE(UNSIGNED(ip_dst_addr(7 DOWNTO 0)),9) + RESIZE(UNSIGNED(mcast_offs),9));
    ip_dst_addr_int( 7 DOWNTO 0)        <= ip_dst_addr_var(7 DOWNTO 0);

  END PROCESS;

  -----------------------------------------------------------------------------
  -- HEAP ID HANDLING
  -----------------------------------------------------------------------------
  HEAP_ID_OFFSET : PROCESS(clk,rst) IS
  BEGIN
    
    IF (rst = '1') THEN
      heap_id                   <= (OTHERS => '0');
      
    ELSIF rising_edge(clk) THEN
      IF (heap_offs = X"000000000000") THEN
        heap_id(47 DOWNTO 2)    <= timestamp(47 DOWNTO 2);
        heap_id( 1 DOWNTO 0)    <= pol_id;
      END IF;
    END IF;
      
  END PROCESS;


  -----------------------------------------------------------------------------
  -- HEADER
  -----------------------------------------------------------------------------
  PROCESS (clk, rst) IS
  BEGIN

    IF (rst = '1') THEN
      header              <= (OTHERS => '0');
      header_valid        <= '0';
    
    ELSIF rising_edge(clk) THEN

      CASE header_word_sel IS

        WHEN "0000" => 
          header        <= mac_dst_addr_int & mac_src_addr & ETH_ETHERTYPE & 
                           IP_HEADER_VERSION & IP_HEADER_LENGTH & IP_TYPE_OF_SERVICE & ip_total_length & IP_IDENTIFICATION & IP_FLAGS_FRAGMENT_OFFSET &
                           IP_TIME_TO_LIVE & IP_PROTOCOL & IP_HEADER_CHKSUM_DUMMY & ip_src_addr & ip_dst_addr_int &
                           udp_src_port & udp_dst_port & udp_length & UDP_CHKSUM_DUMMY &
                           SPEAD_MAGIC & SPEAD_VERSION & SPEAD_ITEM_POINTER_WIDTH & SPEAD_HEAP_ADDR_WIDTH & SPEAD_RESERVED & SPEAD_NOF_ITEMS &
                           item_pointer_01(63 DOWNTO 48) & heap_id & item_pointer_02(63 DOWNTO 48) & heap_size(47 DOWNTO 16);

          header_valid  <= '1';
        
        WHEN "0001" =>
          header        <= heap_size(15 DOWNTO 0) & item_pointer_03(63 DOWNTO 48) & heap_offs & item_pointer_04 & item_pointer_05(63 DOWNTO 48) & timestamp &
                           item_pointer_06(63 DOWNTO 2) & pol_id & item_pointer_07 & --(63 DOWNTO 48) & --adc_sat_count & item_pointer_07(31 DOWNTO 2) &
                           --adc_sat_flag & ndiode_flag &
                           item_pointer_08 & X"0000000000000000000000000000";
      
          header_valid  <= '1';

        WHEN "0010" =>
          header        <= X"0000" & 
                           X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" &
                           X"0000000000000000000000000000";
      
          header_valid    <= '0';

        WHEN OTHERS => NULL;

      END CASE;
    
    END IF;

  END PROCESS;
  
  

END arch;

