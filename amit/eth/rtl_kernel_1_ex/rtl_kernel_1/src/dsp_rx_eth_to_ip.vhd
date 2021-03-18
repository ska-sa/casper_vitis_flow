-- dsp_rx_eth_to_ip.vhd	29. April 2020	by eddy

-- Receive ethernet packets from DSP_RX_LBU_TO_ETH and separate IP packets out of it.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;


entity DSP_RX_ETH_TO_IP is
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
end entity;


architecture behavioral of DSP_RX_ETH_TO_IP is

  component DSP_LATCH_ASYNC
    generic(DATA_IN : integer);
    port(
      CLK  : in  std_logic;
      DIN  : in  std_logic_vector(DATA_IN-1 downto 0);
      DOUT : out std_logic_vector(DATA_IN-1 downto 0)
    );
  end component;

-- There are some important variables and registers to control what happens:

-- variable ACT_SEP       Action at start and end at same packet.
-- variable NEXT_ACT_SEP  Next cycle action after start + end of packet.
-- variable ACT_SOP       Action at start of packet.
-- register NEXT_ACT_SOP  Next cycle action after start of packet.
-- variable ACT_DAT       Action at valid data, no start of packet, no end of packet.
-- variable ACT_EOP_SML   Action at end of packet, data fits into current word.
-- variable ACT_EOP_BIG   Action at end of packet, data doesn't fit into current word.
-- register NEXT_ACT_EOP  Next cycle action after end of packet.

  constant SIZE_WORD    : integer := 512;                 -- Number of bits per word.
  constant SIZE_HEAD    : integer := 112;                 -- Number of bits for ethernet header in 1st word.
  constant SIZE_PAYL    : integer := SIZE_WORD-SIZE_HEAD; -- Number of data bits for payload in 1st word.
  type PS_STATE is(S_HOLD, S_FILL); -- S_HOLD: Check for valid SOP. S_FILL: Fill and check for EOP.
  signal STATE          : PS_STATE; -- Packet separator state.
  -- Input Z-1 to give one more clock cycle for calculating checksum:
  signal DATA_IN_Z1     : std_logic_vector(511 downto 0);
  signal ERR_IN_Z1      : std_logic;
  signal MTY_IN_Z1      : std_logic_vector(5 downto 0);
  signal MTI_IN_Z1      : integer range 0 to 63; -- MTY_IN_Z1 as an integer.
  signal ETH_MAC_DST_Z1 : std_logic_vector(47 downto 0); -- Slice out of DATA_IN_Z1.
  signal ETH_MAC_SRC_Z1 : std_logic_vector(47 downto 0); -- Slice out of DATA_IN_Z1.
  -- Latched signals:
  signal ETH_MAC_DST_L  : std_logic_vector(47 downto 0); -- Latched destination MAC address.
  signal ETH_MAC_SRC_L  : std_logic_vector(47 downto 0); -- Latched source MAC address.
  signal ETHERTYPE      : std_logic_vector(15 downto 0); -- Slice out of DATA_IN.
  signal ERR_L          : std_logic;                     -- Latched ERR_IN.
  signal MTI_L          : integer range 0 to 63;         -- Latched MTY as an integer.
  -- Condition flags:
  signal COND_VALID     : std_logic; -- Conditions valid flag.
  signal COND_SOP_Z0    : std_logic;
  signal COND_DAT_Z0    : std_logic;
  signal COND_EOP_Z0    : std_logic;
  signal COND_SOP_Z1    : std_logic;
  signal COND_DAT_Z1    : std_logic;
  signal COND_EOP_Z1    : std_logic;
  -- Next action flags:
  signal NEXT_ACT_SEP   : boolean; -- Next cycle action after start + end of packet.
  signal NEXT_ACT_SOP   : boolean; -- Next cycle action after start of packet.
  signal NEXT_ACT_EOP   : boolean; -- Next cycle action after end of packet.
  signal INMIND         : std_logic_vector(SIZE_PAYL-1 downto 0); -- Register to keep data in mind for next clock cycle.
  -- IP header for checksum check:
  signal HEAD07         : unsigned(15 downto 0);
  signal HEAD08         : unsigned(15 downto 0);
  signal HEAD09         : unsigned(15 downto 0);
  signal HEAD10         : unsigned(15 downto 0);
  signal HEAD11         : unsigned(15 downto 0);
  signal HEAD12         : unsigned(15 downto 0);
  signal HEAD13         : unsigned(15 downto 0);
  signal HEAD14         : unsigned(15 downto 0);
  signal HEAD15         : unsigned(15 downto 0);
  signal HEAD16         : unsigned(15 downto 0);
  signal SUM1           : unsigned(17 downto 0);
  signal SUM2           : unsigned(17 downto 0);
  signal SUM3           : unsigned(17 downto 0);
  -- Outputs:
  signal DATA_OU        : std_logic_vector(511 downto 0);
  signal ENA_OU         : std_logic;
  signal SOP_OU         : std_logic;
  signal EOP_OU         : std_logic;
  signal ERR_OU         : std_logic;
  signal MTY_OU         : std_logic_vector(5 downto 0);
  -- Error signals:
  signal CLR_ERROR      : std_logic;
  signal ERR_CHKSUM     : std_logic;
  signal ERR_ORDER      : std_logic;
  signal ERR_PACKET     : std_logic;
  signal ERROR          : std_logic_vector(3 downto 0);
  -- Debug:
  signal RUN_FLAG       : std_logic;
  signal DBG_ACT_SEP    : boolean;
  signal DBG_ACT_SOP    : boolean;
  signal DBG_ACT_DAT    : boolean;
  signal DBG_ACT_ESM    : boolean;
  signal DBG_ACT_EBI    : boolean;
  signal DBG_NXT_SEP    : boolean;
  signal DBG_NXT_SOP    : boolean;
  signal DBG_NXT_EOP    : boolean;

begin

  INPUT_Z1 : process(RST, CLK)
  begin
    if(RST = '1') then
      DATA_IN_Z1 <= (others => '0');
      ERR_IN_Z1  <= '0';
      MTY_IN_Z1  <= (others => '0');
    elsif rising_edge(CLK) then
      DATA_IN_Z1 <= DATA_IN;
      ERR_IN_Z1  <= ERR_IN;
      MTY_IN_Z1  <= MTY_IN;
    end if;
  end process;
  

  ETHERTYPE      <= DATA_IN(SIZE_WORD-1-96 downto SIZE_WORD-112);
  ETH_MAC_DST_Z1 <= DATA_IN_Z1(SIZE_WORD-1    downto SIZE_WORD-48);
  ETH_MAC_SRC_Z1 <= DATA_IN_Z1(SIZE_WORD-1-48 downto SIZE_WORD-96);
  MTI_IN_Z1      <= to_integer(unsigned(MTY_IN_Z1));


  CONDITIONS : process(RST, CLK, ENA_IN, SOP_IN, EOP_IN, ETHERTYPE, COND_VALID)
    variable COND_START : std_logic;
  begin
    if(RST = '1') then
      COND_VALID  <= '0';
      COND_SOP_Z0 <= '0';
      COND_DAT_Z0 <= '0';
      COND_EOP_Z0 <= '0';
      COND_SOP_Z1 <= '0';
      COND_DAT_Z1 <= '0';
      COND_EOP_Z1 <= '0';
    else
      -- Combinatorial:
      -- Basic condition to accept a packet starting:
      if( (SOP_IN = '1') and (ENA_IN = '1') and (ETHERTYPE = X"0800") ) then
        COND_START := '1';
      else
        COND_START := '0';
      end if;
       -- Condition start of packet:
      COND_SOP_Z0 <= COND_START;
      -- Condition data valid:
      if( ((ENA_IN = '1') and (COND_VALID = '1')) or (COND_START = '1') ) then
        COND_DAT_Z0 <= '1';
      else
        COND_DAT_Z0 <= '0';
      end if;
      -- Condition end of packet:
      if(EOP_IN = '1') then
        if((COND_VALID = '1') or (COND_START = '1')) then
          COND_EOP_Z0 <= '1';
        else
          COND_EOP_Z0 <= '0';
        end if;
      else
        COND_EOP_Z0 <= '0';
      end if;
      -- Sequencial:
      if rising_edge(CLK) then
        -- Condition COND_VALID to control subsequent COND_DAT and COND_EOP:
        if(EOP_IN = '1' ) then
          COND_VALID <= '0';
        elsif(COND_START = '1') then
          COND_VALID <= '1';
        end if;
        -- Shifts:
        COND_SOP_Z1 <= COND_SOP_Z0;
        COND_DAT_Z1 <= COND_DAT_Z0;
        COND_EOP_Z1 <= COND_EOP_Z0;
      end if;    
    end if;
  end process;


  PACKET_SEPARATOR : process(RST, CLK)
    variable ACT_SOP     : boolean; -- Action at start of packet.
    variable ACT_SEP     : boolean; -- Action at start and end at same packet.
    variable ACT_DAT     : boolean; -- Action at valid data, no start of packet, no end of packet.
    variable ACT_EOP_SML : boolean; -- Action at end of packet, data fits into current word.
    variable ACT_EOP_BIG : boolean; -- Action at end of packet, data doesn't fit into current word.
    variable MTI         : integer range 0 to 63; -- MTY_OU as integer.
  begin
    if(RST = '1') then
      STATE           <= S_HOLD;
      INMIND          <= (others => '0');
      DATA_OU         <= (others => '0');
      ENA_OU          <= '0';
      SOP_OU          <= '0';
      EOP_OU          <= '0';
      ERR_OU          <= '0';
      MTY_OU          <= (others => '0');
      ERR_ORDER       <= '0';
      NEXT_ACT_SOP    <= false;
      NEXT_ACT_EOP    <= false;
      ETH_MAC_DST_L   <= (others => '0');
      ETH_MAC_SRC_L   <= (others => '0');
      ETH_MAC_DST_OUT <= (others => '0');
      ETH_MAC_SRC_OUT <= (others => '0');
      MTI_L           <= 0;
    elsif rising_edge(CLK) then
      -- Default assignments:
      DATA_OU     <= (others => '-');
      ENA_OU      <= '0';
      SOP_OU      <= '0';
      EOP_OU      <= '0';
      ERR_OU      <= '0';
      MTY_OU      <= (others => '0');
      ERR_ORDER   <= '0';
      ACT_SOP     := false;
      ACT_SEP     := false;
      ACT_DAT     := false;
      ACT_EOP_SML := false;
      ACT_EOP_BIG := false;
      DBG_ACT_SEP <= false;
      DBG_ACT_SOP <= false;
      DBG_ACT_ESM <= false;
      DBG_ACT_EBI <= false;
      DBG_ACT_DAT <= false;
      DBG_NXT_SEP <= false;
      DBG_NXT_SOP <= false;
      DBG_NXT_EOP <= false;
      -- Packet separator state machine:
      if(COND_DAT_Z1 = '1') then
        if(STATE = S_HOLD) then
          if(COND_SOP_Z1 = '1') then
            if(COND_EOP_Z1 = '1') then
              ACT_SEP := true;
            else
              ACT_SOP := true;
              STATE <= S_FILL;
            end if;
          end if;
        elsif(STATE = S_FILL) then
          if(COND_EOP_Z1 = '1') then
            if((SIZE_WORD-8*MTI_IN_Z1) <= SIZE_HEAD) then
              ACT_EOP_SML := true;
            else
              ACT_EOP_BIG := true;
            end if;
            STATE <= S_HOLD;
          else
            ACT_DAT := true;
          end if;
          if(COND_SOP_Z1 = '1') then
            ERR_ORDER <= '1';
          end if;
        end if;
      end if;
      -- Actions based on ACT_SEP, NEXT_ACT_SEP, ACT_SOP, ACT_DAT, ACT_EOP_SML, ACT_EOP_BIG, NEXT_ACT_SOP, NEXT_ACT_EOP:
      if(ACT_SEP) then -- Action at start and end at same packet.
        DBG_ACT_SEP <= true;
        ERR_L  <= ERR_IN_Z1 or ERR_CHKSUM;
        MTI_L  <= MTI_IN_Z1+SIZE_HEAD/8;
        INMIND <= DATA_IN_Z1(SIZE_PAYL-1 downto 0);
        ETH_MAC_DST_L <= ETH_MAC_DST_Z1;
        ETH_MAC_SRC_L <= ETH_MAC_SRC_Z1;
        NEXT_ACT_SEP <= true;
      else
        NEXT_ACT_SEP <= false;
      end if;
      if(NEXT_ACT_SEP) then -- Next cycle action after start + end of packet.
        DBG_NXT_SEP <= true;
        ENA_OU <= '1';
        SOP_OU <= '1';
        EOP_OU <= '1';
        ERR_OU <= ERR_L;
        MTI    := MTI_L;
        MTY_OU <= std_logic_vector(to_unsigned(MTI,6));
        DATA_OU(SIZE_WORD-1 downto SIZE_HEAD) <= INMIND;
        DATA_OU(8*MTI-1 downto 0) <= (others => '0');
        ETH_MAC_DST_OUT <= ETH_MAC_DST_L;
        ETH_MAC_SRC_OUT <= ETH_MAC_SRC_L;
      end if;
      if(ACT_SOP) then -- Action at start of packet.
        DBG_ACT_SOP <= true;
        ETH_MAC_DST_L <= ETH_MAC_DST_Z1;
        ETH_MAC_SRC_L <= ETH_MAC_SRC_Z1;
        INMIND <= DATA_IN_Z1(SIZE_PAYL-1 downto 0);
        NEXT_ACT_SOP <= true;
      end if;
      if((NEXT_ACT_SOP) and (COND_DAT_Z1 = '1')) then -- Next cycle action after start of packet.
        DBG_NXT_SOP <= true;
        SOP_OU <= '1';
        ETH_MAC_DST_OUT <= ETH_MAC_DST_L;
        ETH_MAC_SRC_OUT <= ETH_MAC_SRC_L;
        NEXT_ACT_SOP <= false;
      end if;
      if(ACT_DAT) then -- Action at valid data, no start of packet, no end of packet.
        DBG_ACT_DAT  <= true;
        ENA_OU  <= '1';
        DATA_OU <= INMIND & DATA_IN_Z1(SIZE_WORD-1 downto SIZE_PAYL);
        INMIND  <= DATA_IN_Z1(SIZE_PAYL-1 downto 0);
      end if;
      if(ACT_EOP_SML) then -- Action at end of packet, data fits into current word.
        DBG_ACT_ESM <= true;
        ENA_OU  <= '1';
        EOP_OU  <= '1';
        ERR_OU  <= ERR_IN_Z1 or ERR_CHKSUM;
        MTI     := MTI_IN_Z1-SIZE_PAYL/8;
        MTY_OU  <= std_logic_vector(to_unsigned(MTI,6));
        DATA_OU <= INMIND & DATA_IN_Z1(SIZE_WORD-1 downto SIZE_PAYL);
        DATA_OU(8*MTI-1 downto 0) <= (others => '0');
        INMIND  <= (others => '0');
      end if;
      if(ACT_EOP_BIG) then -- Action at end of packet, data doesn't fit into current word.
        DBG_ACT_EBI  <= true;
        ENA_OU  <= '1';
        DATA_OU <= INMIND & DATA_IN_Z1(SIZE_WORD-1 downto SIZE_PAYL);
        INMIND  <= DATA_IN_Z1(SIZE_PAYL-1 downto 0);
        ERR_L   <= ERR_IN_Z1 or ERR_CHKSUM;
        MTI_L   <= MTI_IN_Z1+SIZE_HEAD/8;
        NEXT_ACT_EOP <= true;
      end if;
      if(NEXT_ACT_EOP) then -- Next cycle action after end of packet.
        DBG_NXT_EOP <= true;
        ENA_OU <= '1';
        EOP_OU <= '1';
        ERR_OU <= ERR_L;
        MTI    := MTI_L;
        MTY_OU <= std_logic_vector(to_unsigned(MTI,6));
        DATA_OU(SIZE_WORD-1 downto SIZE_HEAD) <= INMIND;
        DATA_OU(8*MTI-1 downto 0) <= (others => '0');
        NEXT_ACT_EOP <= false;
      end if;
    end if;
  end process;


  HEAD07 <= unsigned(DATA_IN(399 downto 384)); -- IP header: version, IHL, TOS
  HEAD08 <= unsigned(DATA_IN(383 downto 368)); -- IP header: total length
  HEAD09 <= unsigned(DATA_IN(367 downto 352)); -- IP header: identification
  HEAD10 <= unsigned(DATA_IN(351 downto 336)); -- IP header: flags and fragments
  HEAD11 <= unsigned(DATA_IN(335 downto 320)); -- IP header: TTL, protocol
  HEAD12 <= unsigned(DATA_IN(319 downto 304)); -- IP header: header checksum
  HEAD13 <= unsigned(DATA_IN(303 downto 288)); -- IP header: source address
  HEAD14 <= unsigned(DATA_IN(287 downto 272)); -- IP header: source address
  HEAD15 <= unsigned(DATA_IN(271 downto 256)); -- IP header: destination address
  HEAD16 <= unsigned(DATA_IN(255 downto 240)); -- IP header: destination address


  CHECKSUM : process(RST, CLK, SUM1, SUM2, SUM3)
    variable SUM4 : unsigned(19 downto 0);
    variable SUM5 : unsigned(16 downto 0);
  begin
    if(RST = '1') then
      SUM1 <= (others => '0');
      SUM2 <= (others => '0');
      SUM3 <= (others => '0');
      ERR_CHKSUM <= '0';
    else
      -- Combinatorial:
      SUM4 := resize(SUM1,20) + SUM2 + SUM3;
      case SUM4 is  -- if SUM4(15 downto 0) + SUM4(19 downto 16) = FFFF
        when X"0FFFF" => ERR_CHKSUM <= '0';
        when X"1FFFE" => ERR_CHKSUM <= '0';
        when X"2FFFD" => ERR_CHKSUM <= '0';
        when X"3FFFC" => ERR_CHKSUM <= '0';
        when X"4FFFB" => ERR_CHKSUM <= '0';
        when X"5FFFA" => ERR_CHKSUM <= '0';
        when X"6FFF9" => ERR_CHKSUM <= '0';
        when X"7FFF8" => ERR_CHKSUM <= '0';
        when X"8FFF7" => ERR_CHKSUM <= '0';
        when X"9FFF6" => ERR_CHKSUM <= '0';
        -- These don't occur:
        --when X"AFFF5" => ERR_CHKSUM <= '0';
        --when X"BFFF4" => ERR_CHKSUM <= '0';
        --when X"CFFF3" => ERR_CHKSUM <= '0';
        --when X"DFFF2" => ERR_CHKSUM <= '0';
        --when X"EFFF1" => ERR_CHKSUM <= '0';
        --when X"FFFF0" => ERR_CHKSUM <= '0';
        when others   => ERR_CHKSUM <= '1';
      end case;
      -- Sequential:
      if rising_edge(CLK) then
        if(COND_SOP_Z0 = '1') then -- Add and latch subtotals:
          SUM1 <= resize(HEAD07,18) + HEAD08 + HEAD09 + HEAD10;
          SUM2 <= resize(HEAD11,18) + HEAD12 + HEAD13;
          SUM3 <= resize(HEAD14,18) + HEAD15 + HEAD16;
        end if;
      end if;
    end if;
  end process;


  -- Map output signals:
  DATA_OUT <= DATA_OU;
  ENA_OUT  <= ENA_OU;
  SOP_OUT  <= SOP_OU;
  EOP_OUT  <= EOP_OU;
  ERR_OUT  <= ERR_OU;
  MTY_OUT  <= MTY_OU;
  

  ERR_PACKET <= ERR_IN_Z1 and COND_EOP_Z1;
  

  -- Map error signals:
  ERROR(1) <= ERR_CHKSUM and COND_EOP_Z1;
  ERROR(2) <= ERR_ORDER;
  ERROR(3) <= ERR_PACKET;


  LATCH_ASYNC_CLR_ERROR : DSP_LATCH_ASYNC
    generic map(DATA_IN => 1)
    port map(
      CLK     => CLK,
      DIN(0)  => CLR_ERR,
      DOUT(0) => CLR_ERROR
    );


  ERRORBUS : process(RST, CLK, ERROR)
  begin
    ERROR(0) <= ERROR(1) or ERROR(2) or ERROR(3);
    if(RST = '1') then
      ERR <= (others => '0');
    elsif rising_edge(CLK) then
      if(CLR_ERROR = '1') then
        ERR <= (others => '0');
      else
        if(ERROR(0) = '1') then ERR(0) <= '1'; end if;
        if(ERROR(1) = '1') then ERR(1) <= '1'; end if;
        if(ERROR(2) = '1') then ERR(2) <= '1'; end if;
        if(ERROR(3) = '1') then ERR(3) <= '1'; end if;
      end if;
    end if;
  end process;


--  TEXTOUT : process(RST, CLK)
--    file FIL_OUT     : text open write_mode is "/home/en/fpga/rx100/debug_dsp_rx_eth_to_ip.txt";
--    variable LIN     : line;
--    variable TXT_TIT : string(1 to 143);
--    variable TXT_PRE : string(1 to 5);
--    variable TXT_FLG : string(1 to 8);
--  begin
--    if(RST = '1') then
--      RUN_FLAG <= '0';
--    elsif rising_edge(CLK) then
--      if(ENA_IN = '1') then
--        RUN_FLAG <= '1';
--      end if;
--      if((ENA_IN = '1') or (RUN_FLAG = '1')) then

--        TXT_PRE := "STAT ";
--        write(LIN,TXT_PRE,left,0);
--        if(STATE = S_HOLD) then TXT_FLG := "HOLD    "; else TXT_FLG := "FILL    "; end if;
--        write(LIN,TXT_FLG,left,0);
--        write (LIN,' ',left,0);
--        if(DBG_ACT_SEP) then TXT_FLG := "ACT_SEP "; else TXT_FLG := "act_sep "; end if;
--        write(LIN,TXT_FLG,left,0);
--        if(DBG_ACT_SOP) then TXT_FLG := "ACT_SOP "; else TXT_FLG := "act_sop "; end if;
--        write(LIN,TXT_FLG,left,0);
--        if(DBG_ACT_DAT) then TXT_FLG := "ACT_DAT "; else TXT_FLG := "act_dat "; end if;
--        write(LIN,TXT_FLG,left,0);
--        if(DBG_ACT_ESM) then TXT_FLG := "ACT_ESM "; else TXT_FLG := "act_esm "; end if;
--        write(LIN,TXT_FLG,left,0);
--        if(DBG_ACT_EBI) then TXT_FLG := "ACT_EBI "; else TXT_FLG := "act_ebi "; end if;
--        write(LIN,TXT_FLG,left,0);
--        if(DBG_NXT_SEP) then TXT_FLG := "NXT_SEP "; else TXT_FLG := "nxt_sep "; end if;
--        write(LIN,TXT_FLG,left,0);
--        if(DBG_NXT_SOP) then TXT_FLG := "NXT_SOP "; else TXT_FLG := "nxt_sop "; end if;
--        write(LIN,TXT_FLG,left,0);
--        if(DBG_NXT_EOP) then TXT_FLG := "NXT_EOP "; else TXT_FLG := "nxt_eop "; end if;
--        write(LIN,TXT_FLG,left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "OUT  ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,DATA_OU,left,0);
--        write (LIN,' ',left,0);
--        write (LIN,ENA_OU,left,0);
--        write (LIN,' ',left,0);
--        write (LIN,SOP_OU,left,0);
--        write (LIN,' ',left,0);
--        write (LIN,EOP_OU,left,0);
--        write (LIN,' ',left,0);
--        write (LIN,ERR_OU,left,0);
--        write (LIN,' ',left,0);
--        hwrite(LIN,MTY_OU,left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_TIT := "     [ . . . . . . . . . . . . .][ . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .] A S E R M";
--        write(LIN,TXT_TIT,left,0);
--        writeline(FIL_OUT,LIN);
        
--        TXT_PRE := "IN   ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,DATA_IN,left,0);
--        write (LIN,' ',left,0);
--        write (LIN,ENA_IN,left,0);
--        write (LIN,' ',left,0);
--        write (LIN,SOP_IN,left,0);
--        write (LIN,' ',left,0);
--        write (LIN,EOP_IN,left,0);
--        write (LIN,' ',left,0);
--        write (LIN,ERR_IN,left,0);
--        write (LIN,' ',left,0);
--        hwrite(LIN,MTY_IN,left,0);
--        writeline(FIL_OUT,LIN);
    
--        writeline(FIL_OUT,LIN);
--      end if;
--    end if;
--  end process;


end architecture behavioral;
