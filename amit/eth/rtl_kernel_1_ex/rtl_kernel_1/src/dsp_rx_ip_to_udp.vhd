-- dsp_rx_ip_to_udp.vhd	29. April 2020	by eddy

-- Receive IP packets from DSP_RX_ETH_TO_IP and separate UDP packets out of it.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;


entity DSP_RX_IP_TO_UDP is
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
end entity;


architecture behavioral of DSP_RX_IP_TO_UDP is


  component DSP_CHKSUM512_DATA is
    port (
    RST    : in  std_logic;
    CLK    : in  std_logic;
    DATA   : in  std_logic_vector(511 downto 0);
    START  : in  std_logic;
    ADD    : in  std_logic;
    FINISH : in  std_logic;
    DONE   : out std_logic;
    CHKSUM : out std_logic_vector( 15 downto 0)
    );
  end component;


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
  constant SIZE_HEAD    : integer := 160;                 -- Number of bits for IP header in 1st word.
  constant SIZE_PAYL    : integer := SIZE_WORD-SIZE_HEAD; -- Number of data bits for payload in 1st word.
  type PS_STATE is(S_HOLD, S_FILL); -- S_HOLD: Check for valid SOP. S_FILL: Fill and check for EOP.
  signal STATE          : PS_STATE; -- Packet separator state.
  -- Input Z-1, Z-2, Z-3, Z-4, Z-5 to get extra clock cycles for calculating checksum:
  signal DATA_IN_Z1     : std_logic_vector(511 downto 0);
  signal DATA_IN_Z2     : std_logic_vector(511 downto 0);
  signal DATA_IN_Z3     : std_logic_vector(511 downto 0);
  signal DATA_IN_Z4     : std_logic_vector(511 downto 0);
  signal DATA_IN_Z5     : std_logic_vector(511 downto 0);
  signal ERR_IN_Z1      : std_logic;
  signal ERR_IN_Z2      : std_logic;
  signal ERR_IN_Z3      : std_logic;
  signal ERR_IN_Z4      : std_logic;
  signal ERR_IN_Z5      : std_logic;
  signal MTY_IN_Z1      : std_logic_vector(5 downto 0);
  signal MTY_IN_Z2      : std_logic_vector(5 downto 0);
  signal MTY_IN_Z3      : std_logic_vector(5 downto 0);
  signal MTY_IN_Z4      : std_logic_vector(5 downto 0);
  signal MTY_IN_Z5      : std_logic_vector(5 downto 0);
  signal ETH_MAC_DST_Z1 : std_logic_vector(47 downto 0);
  signal ETH_MAC_DST_Z2 : std_logic_vector(47 downto 0);
  signal ETH_MAC_DST_Z3 : std_logic_vector(47 downto 0);
  signal ETH_MAC_DST_Z4 : std_logic_vector(47 downto 0);
  signal ETH_MAC_DST_Z5 : std_logic_vector(47 downto 0);
  signal ETH_MAC_SRC_Z1 : std_logic_vector(47 downto 0);
  signal ETH_MAC_SRC_Z2 : std_logic_vector(47 downto 0);
  signal ETH_MAC_SRC_Z3 : std_logic_vector(47 downto 0);
  signal ETH_MAC_SRC_Z4 : std_logic_vector(47 downto 0);
  signal ETH_MAC_SRC_Z5 : std_logic_vector(47 downto 0);
  -- Z final delay for packet separator:
  signal DATA_IN_Z      : std_logic_vector(511 downto 0);
  signal ERR_IN_Z       : std_logic;
  signal MTI_IN_Z       : integer range 0 to 63;
  signal ETH_MAC_DST_Z  : std_logic_vector(47 downto 0);
  signal ETH_MAC_SRC_Z  : std_logic_vector(47 downto 0);
  signal IP_LENGTH_Z    : std_logic_vector(15 downto 0); -- Slice out of DATA_IN_Z.
  signal IP_ADR_DST_Z   : std_logic_vector(31 downto 0); -- Slice out of DATA_IN_Z.
  signal IP_ADR_SRC_Z   : std_logic_vector(31 downto 0); -- Slice out of DATA_IN_Z.
  signal IP_VER_IHL     : std_logic_vector( 7 downto 0); -- Slice out of DATA_IN.
  signal IP_PROTOCOL    : std_logic_vector( 7 downto 0); -- Slice out of DATA_IN.
  -- Y delay is one less than Z for length check:
  signal DATA_IN_Y      : std_logic_vector(511 downto 0);
  signal MTI_IN_Y       : integer range 0 to 63;
  signal IP_LENGTH_Y    : integer range 0 to 65535;
  signal LENGTH_VAL     : integer range 0 to 65535;
  -- Latched signals:
  signal ETH_MAC_DST_L  : std_logic_vector(47 downto 0); -- Latched destination MAC address.
  signal ETH_MAC_SRC_L  : std_logic_vector(47 downto 0); -- Latched source MAC address.
  signal IP_LENGTH_L    : std_logic_vector(15 downto 0); -- Latched total length.
  signal IP_ADR_DST_L   : std_logic_vector(31 downto 0); -- Latched IP destination address.
  signal IP_ADR_SRC_L   : std_logic_vector(31 downto 0); -- Latched IP source address.
  signal ERR_L          : std_logic;                     -- Latched ERR_IN.
  signal MTY_L          : integer range 0 to 63;         -- Latched MTY_IN as an integer.
  -- Condition flags:
  signal COND_VALID     : std_logic; -- Conditions valid flag.
  signal COND_SOP_Z0    : std_logic;
  signal COND_DAT_Z0    : std_logic;
  signal COND_EOP_Z0    : std_logic;
  signal COND_SOP_Z1    : std_logic;
  signal COND_DAT_Z1    : std_logic;
  signal COND_EOP_Z1    : std_logic;
  signal COND_SOP_Z2    : std_logic;
  signal COND_DAT_Z2    : std_logic;
  signal COND_EOP_Z2    : std_logic;
  signal COND_SOP_Z3    : std_logic;
  signal COND_DAT_Z3    : std_logic;
  signal COND_EOP_Z3    : std_logic;
  signal COND_SOP_Z4    : std_logic;
  signal COND_DAT_Z4    : std_logic;
  signal COND_EOP_Z4    : std_logic;
  signal COND_SOP_Z5    : std_logic;
  signal COND_DAT_Z5    : std_logic;
  signal COND_EOP_Z5    : std_logic;
  signal COND_SOP_Y     : std_logic; -- Condition start of packet for length check.
  signal COND_DAT_Y     : std_logic; -- Condition data valid      for length check.
  signal COND_EOP_Y     : std_logic; -- Condition end of packet   for length check.
  signal COND_SOP_Z     : std_logic; -- Condition start of packet for packet separator.
  signal COND_DAT_Z     : std_logic; -- Condition data valid      for packet separator.
  signal COND_EOP_Z     : std_logic; -- Condition end of packet   for packet separator.
  -- Next action flags:
  signal NEXT_ACT_SEP   : boolean; -- Next cycle action after start + end of packet.
  signal NEXT_ACT_SOP   : boolean; -- Next cycle action after start of packet.
  signal NEXT_ACT_EOP   : boolean; -- Next cycle action after end of packet.
  signal INMIND         : std_logic_vector(SIZE_PAYL-1 downto 0); -- Register to keep data in mind for next clock cycle.
  -- Signals to and from DSP_CHKSUM512_DATA:
  signal DATA_FIRST     : std_logic_vector(511 downto 0); -- First data word to be applied for checksum.
  signal CS_DATA        : std_logic_vector(511 downto 0);
  signal CS_START       : std_logic;
  signal CS_ADD         : std_logic;
  signal CS_FINISH      : std_logic;
  signal CS_DONE        : std_logic;
  signal CS_CHKSUM      : std_logic_vector(15 downto 0);
  -- Outputs:
  signal DATA_OU        : std_logic_vector(511 downto 0);
  signal ENA_OU         : std_logic;
  signal SOP_OU         : std_logic;
  signal EOP_OU         : std_logic;
  signal ERR_OU         : std_logic;
  signal MTY_OU         : std_logic_vector(5 downto 0);
  -- Error signals:
  signal CLR_ERROR      : std_logic;
  signal ERR_DELAY      : std_logic;
  signal ERR_ORDER      : std_logic;
  signal ERR_PACKET     : std_logic;
  signal ERR_LENGTH     : std_logic;
  signal ERR_CHKSUM     : std_logic;
  signal ERROR          : std_logic_vector(5 downto 0);
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

  SHIFT : process(RST, CLK)
  begin
    if(RST = '1') then
      DATA_IN_Z1     <= (others => '0');
      DATA_IN_Z2     <= (others => '0');
      DATA_IN_Z3     <= (others => '0');
      DATA_IN_Z4     <= (others => '0');
      DATA_IN_Z5     <= (others => '0');
      ERR_IN_Z1      <= '0';
      ERR_IN_Z2      <= '0';
      ERR_IN_Z3      <= '0';
      ERR_IN_Z4      <= '0';
      ERR_IN_Z5      <= '0';
      MTY_IN_Z1      <= (others => '0');
      MTY_IN_Z2      <= (others => '0');
      MTY_IN_Z3      <= (others => '0');
      MTY_IN_Z4      <= (others => '0');
      MTY_IN_Z5      <= (others => '0');
      ETH_MAC_DST_Z1 <= (others => '0');
      ETH_MAC_DST_Z2 <= (others => '0');
      ETH_MAC_DST_Z3 <= (others => '0');
      ETH_MAC_DST_Z4 <= (others => '0');
      ETH_MAC_DST_Z5 <= (others => '0');
      ETH_MAC_SRC_Z1 <= (others => '0');
      ETH_MAC_SRC_Z2 <= (others => '0');
      ETH_MAC_SRC_Z3 <= (others => '0');
      ETH_MAC_SRC_Z4 <= (others => '0');
      ETH_MAC_SRC_Z5 <= (others => '0');
    elsif rising_edge(CLK) then
      DATA_IN_Z1     <= DATA_IN;
      DATA_IN_Z2     <= DATA_IN_Z1;
      DATA_IN_Z3     <= DATA_IN_Z2;
      DATA_IN_Z4     <= DATA_IN_Z3;
      DATA_IN_Z5     <= DATA_IN_Z4;
      ERR_IN_Z1      <= ERR_IN;
      ERR_IN_Z2      <= ERR_IN_Z1;
      ERR_IN_Z3      <= ERR_IN_Z2;
      ERR_IN_Z4      <= ERR_IN_Z3;
      ERR_IN_Z5      <= ERR_IN_Z4;
      MTY_IN_Z1      <= MTY_IN;
      MTY_IN_Z2      <= MTY_IN_Z1;
      MTY_IN_Z3      <= MTY_IN_Z2;
      MTY_IN_Z4      <= MTY_IN_Z3;
      MTY_IN_Z5      <= MTY_IN_Z4;
      ETH_MAC_DST_Z1 <= ETH_MAC_DST_IN;
      ETH_MAC_DST_Z2 <= ETH_MAC_DST_Z1;
      ETH_MAC_DST_Z3 <= ETH_MAC_DST_Z2;
      ETH_MAC_DST_Z4 <= ETH_MAC_DST_Z3;
      ETH_MAC_DST_Z5 <= ETH_MAC_DST_Z4;
      ETH_MAC_SRC_Z1 <= ETH_MAC_SRC_IN;
      ETH_MAC_SRC_Z2 <= ETH_MAC_SRC_Z1;
      ETH_MAC_SRC_Z3 <= ETH_MAC_SRC_Z2;
      ETH_MAC_SRC_Z4 <= ETH_MAC_SRC_Z3;
      ETH_MAC_SRC_Z5 <= ETH_MAC_SRC_Z4;
    end if;
  end process;
  

  -- Choose input delay Z-4 for length check:
  COND_SOP_Y <= COND_SOP_Z4;
  COND_DAT_Y <= COND_DAT_Z4;
  COND_EOP_Y <= COND_EOP_Z4;
  DATA_IN_Y  <= DATA_IN_Z4;
  MTI_IN_Y   <= to_integer(unsigned(MTY_IN_Z4));
  

  -- Choose input delay Z-5 for packet separator:
  COND_SOP_Z    <= COND_SOP_Z5;
  COND_DAT_Z    <= COND_DAT_Z5;
  COND_EOP_Z    <= COND_EOP_Z5;
  DATA_IN_Z     <= DATA_IN_Z5;
  ERR_IN_Z      <= ERR_IN_Z5;
  MTI_IN_Z      <= to_integer(unsigned(MTY_IN_Z5));
  ETH_MAC_DST_Z <= ETH_MAC_DST_Z5;
  ETH_MAC_SRC_Z <= ETH_MAC_SRC_Z5;


  -- Slices:
  IP_VER_IHL   <= DATA_IN(SIZE_WORD-1     downto SIZE_WORD  -8);
  IP_PROTOCOL  <= DATA_IN(SIZE_WORD-1 -72 downto SIZE_WORD -80);
  IP_LENGTH_Y  <= to_integer(unsigned(DATA_IN_Y(SIZE_WORD-1 -16 downto SIZE_WORD -32)));
  IP_LENGTH_Z  <= DATA_IN_Z(SIZE_WORD-1 -16 downto SIZE_WORD -32);
  IP_ADR_SRC_Z <= DATA_IN_Z(SIZE_WORD-1 -96 downto SIZE_WORD-128);
  IP_ADR_DST_Z <= DATA_IN_Z(SIZE_WORD-1-128 downto SIZE_WORD-160);


  CONDITIONS : process(RST, CLK, ENA_IN, SOP_IN, EOP_IN, IP_VER_IHL, IP_PROTOCOL, COND_VALID)
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
      COND_SOP_Z2 <= '0';
      COND_DAT_Z2 <= '0';
      COND_EOP_Z2 <= '0';
      COND_SOP_Z3 <= '0';
      COND_DAT_Z3 <= '0';
      COND_EOP_Z3 <= '0';
      COND_SOP_Z4 <= '0';
      COND_DAT_Z4 <= '0';
      COND_EOP_Z4 <= '0';
      COND_SOP_Z5 <= '0';
      COND_DAT_Z5 <= '0';
      COND_EOP_Z5 <= '0';
    else      
      -- Combinatorial:
      -- Basic condition to accept a packet starting:
      if( (SOP_IN = '1') and (ENA_IN = '1') and (IP_VER_IHL = X"45") and (IP_PROTOCOL = X"11") ) then
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
        COND_SOP_Z2 <= COND_SOP_Z1;
        COND_SOP_Z3 <= COND_SOP_Z2;
        COND_SOP_Z4 <= COND_SOP_Z3;
        COND_SOP_Z5 <= COND_SOP_Z4;
        COND_DAT_Z1 <= COND_DAT_Z0;
        COND_DAT_Z2 <= COND_DAT_Z1;
        COND_DAT_Z3 <= COND_DAT_Z2;
        COND_DAT_Z4 <= COND_DAT_Z3;
        COND_DAT_Z5 <= COND_DAT_Z4;
        COND_EOP_Z1 <= COND_EOP_Z0;
        COND_EOP_Z2 <= COND_EOP_Z1;
        COND_EOP_Z3 <= COND_EOP_Z2;
        COND_EOP_Z4 <= COND_EOP_Z3;
        COND_EOP_Z5 <= COND_EOP_Z4;
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
      NEXT_ACT_SEP    <= false;
      NEXT_ACT_SOP    <= false;
      NEXT_ACT_EOP    <= false;
      ETH_MAC_DST_L   <= (others => '0');
      ETH_MAC_SRC_L   <= (others => '0');
      IP_LENGTH_L     <= (others => '0');
      IP_ADR_DST_L    <= (others => '0');
      IP_ADR_SRC_L    <= (others => '0');
      ETH_MAC_DST_OUT <= (others => '0');
      ETH_MAC_SRC_OUT <= (others => '0');
      IP_LENGTH_OUT   <= (others => '0');
      IP_ADR_DST_OUT  <= (others => '0');
      IP_ADR_SRC_OUT  <= (others => '0');
      ERR_L           <= '0';
      MTY_L           <= 0;
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
      if(COND_DAT_Z = '1') then
        if(STATE = S_HOLD) then
          if(COND_SOP_Z = '1') then
            if(COND_EOP_Z = '1') then
              ACT_SEP := true;
            else
              ACT_SOP := true;
              STATE <= S_FILL;
            end if;
          end if;
        elsif(STATE = S_FILL) then
          if(COND_EOP_Z = '1') then
            if((SIZE_WORD-8*MTI_IN_Z) <= SIZE_HEAD) then
              ACT_EOP_SML := true;
            else
              ACT_EOP_BIG := true;
            end if;
            STATE <= S_HOLD;
          else
            ACT_DAT := true;
          end if;
          if(COND_SOP_Z = '1') then
            ERR_ORDER <= '1';
          end if;
        end if;
      end if;
      -- Actions based on ACT_SEP, NEXT_ACT_SEP, ACT_SOP, ACT_DAT, ACT_EOP_SML, ACT_EOP_BIG, NEXT_ACT_SOP, NEXT_ACT_EOP:
      if(ACT_SEP) then -- Action at start and end at same packet.
        DBG_ACT_SEP <= true;
        ERR_L <= ERR_IN_Z or ERR_CHKSUM or ERR_LENGTH;
        MTY_L <= MTI_IN_Z+SIZE_HEAD/8;
        INMIND  <= DATA_IN_Z(SIZE_PAYL-1 downto 0);
        ETH_MAC_DST_L <= ETH_MAC_DST_Z;
        ETH_MAC_SRC_L <= ETH_MAC_SRC_Z;
        IP_LENGTH_L   <= IP_LENGTH_Z;
        IP_ADR_DST_L  <= IP_ADR_DST_Z;
        IP_ADR_SRC_L  <= IP_ADR_SRC_Z;
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
        MTI    := MTY_L;
        MTY_OU <= std_logic_vector(to_unsigned(MTI,6));
        DATA_OU(SIZE_WORD-1 downto SIZE_HEAD) <= INMIND;
        DATA_OU(8*MTI-1 downto 0) <= (others => '0');
        ETH_MAC_DST_OUT <= ETH_MAC_DST_L;
        ETH_MAC_SRC_OUT <= ETH_MAC_SRC_L;
        IP_LENGTH_OUT   <= IP_LENGTH_L;
        IP_ADR_DST_OUT  <= IP_ADR_DST_L;
        IP_ADR_SRC_OUT  <= IP_ADR_SRC_L;
      end if;
      if(ACT_SOP) then -- Action at start of packet.
        DBG_ACT_SOP <= true;
        ETH_MAC_DST_L <= ETH_MAC_DST_Z;
        ETH_MAC_SRC_L <= ETH_MAC_SRC_Z;
        IP_LENGTH_L   <= IP_LENGTH_Z;
        IP_ADR_DST_L  <= IP_ADR_DST_Z;
        IP_ADR_SRC_L  <= IP_ADR_SRC_Z;
        INMIND        <= DATA_IN_Z(SIZE_PAYL-1 downto 0);
        NEXT_ACT_SOP  <= true;
      end if;
      if((NEXT_ACT_SOP) and (COND_DAT_Z = '1')) then -- Next cycle action after start of packet.
        DBG_NXT_SOP <= true;
        SOP_OU <= '1';
        ETH_MAC_DST_OUT <= ETH_MAC_DST_L;
        ETH_MAC_SRC_OUT <= ETH_MAC_SRC_L;
        IP_LENGTH_OUT   <= IP_LENGTH_L;
        IP_ADR_DST_OUT  <= IP_ADR_DST_L;
        IP_ADR_SRC_OUT  <= IP_ADR_SRC_L;
        NEXT_ACT_SOP    <= false;
      end if;
      if(ACT_DAT) then -- Action at valid data, no start of packet, no end of packet.
        DBG_ACT_DAT  <= true;
        ENA_OU  <= '1';
        DATA_OU <= INMIND & DATA_IN_Z(SIZE_WORD-1 downto SIZE_PAYL);
        INMIND  <= DATA_IN_Z(SIZE_PAYL-1 downto 0);
      end if;
      if(ACT_EOP_SML) then -- Action at end of packet, data fits into current word.
        DBG_ACT_ESM <= true;
        ENA_OU  <= '1';
        EOP_OU  <= '1';
        ERR_OU  <= ERR_IN_Z or ERR_CHKSUM or ERR_LENGTH;
        MTI     := MTI_IN_Z-SIZE_PAYL/8;
        MTY_OU  <= std_logic_vector(to_unsigned(MTI,6));
        DATA_OU <= INMIND & DATA_IN_Z(SIZE_WORD-1 downto SIZE_PAYL);
        DATA_OU(8*MTI-1 downto 0) <= (others => '0');
        INMIND  <= (others => '0');
      end if;
      if(ACT_EOP_BIG) then -- Action at end of packet, data doesn't fit into current word.
        DBG_ACT_EBI  <= true;
        ENA_OU  <= '1';
        DATA_OU <= INMIND & DATA_IN_Z(SIZE_WORD-1 downto SIZE_PAYL);
        INMIND  <= DATA_IN_Z(SIZE_PAYL-1 downto 0);
        ERR_L   <= ERR_IN_Z or ERR_CHKSUM or ERR_LENGTH;
        MTY_L   <= MTI_IN_Z+SIZE_HEAD/8;
        NEXT_ACT_EOP <= true;
      end if;
      if(NEXT_ACT_EOP) then -- Next cycle action after end of packet.
        DBG_NXT_EOP <= true;
        ENA_OU <= '1';
        EOP_OU <= '1';
        ERR_OU <= ERR_L;
        MTI    := MTY_L;
        MTY_OU <= std_logic_vector(to_unsigned(MTI,6));
        DATA_OU(SIZE_WORD-1 downto SIZE_HEAD) <= INMIND;
        DATA_OU(8*MTI-1 downto 0) <= (others => '0');
        NEXT_ACT_EOP <= false;
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


  LENGTH_CHECK : process(RST, CLK)
    variable TMPLEN1 : integer range 0 to 65535;
    variable TMPLEN2 : integer range 0 to 65535;
  begin
    if(RST = '1') then
      ERR_LENGTH <= '0';
      LENGTH_VAL <= 0;
    elsif rising_edge(CLK) then
      ERR_LENGTH <= '0'; -- Default assignment.
      if((COND_SOP_Y = '1') and (COND_EOP_Y = '1')) then -- if both SOP and EOP condition.
        TMPLEN1 := IP_LENGTH_Y;
        TMPLEN2 := SIZE_WORD/8 - MTI_IN_Y;
        if(TMPLEN1 /= TMPLEN2) then
          ERR_LENGTH <= '1';
        end if;
      elsif(COND_SOP_Y = '1') then                       -- if SOP condition only.
        LENGTH_VAL <= IP_LENGTH_Y - SIZE_WORD/8;
      elsif(COND_EOP_Y = '1') then                       -- if EOP condition only.
        TMPLEN1 := LENGTH_VAL;
        TMPLEN2 := SIZE_WORD/8 - MTI_IN_Y;
        if(TMPLEN1 /= TMPLEN2) then
          ERR_LENGTH <= '1';
        end if;
      elsif(COND_DAT_Y = '1') then                       -- if DAT condition.
        LENGTH_VAL <= LENGTH_VAL - SIZE_WORD/8;  
      end if;
    end if;
  end process;


  DATA_FIRST <= X"0000_0000_0000_0000_0011" &  DATA_IN(319 downto 304) & DATA_IN(415 downto 0);
  CS_DATA    <= DATA_FIRST when (COND_SOP_Z0 = '1') else DATA_IN;
  CS_START   <= '1'        when (COND_SOP_Z0 = '1') else '0';
  CS_ADD     <= '1'        when (COND_DAT_Z0 = '1') else '0';
  CS_FINISH  <= '1'        when (COND_EOP_Z0 = '1') else '0';


  CHECKSUM_CALC : DSP_CHKSUM512_DATA
    port map (
      RST    => RST,
      CLK    => CLK,
      DATA   => CS_DATA,
      START  => CS_START,
      ADD    => CS_ADD,
      FINISH => CS_FINISH,
      DONE   => CS_DONE,
      CHKSUM => CS_CHKSUM
    );


  CHECKSUM_ERROR : process(RST, CLK, COND_EOP_Z, CS_DONE, CS_CHKSUM)
  begin
    if(RST = '1') then
      ERR_DELAY  <= '0';
      ERR_CHKSUM <= '0';
    else
      -- Combinatorial:
      if((CS_DONE = '1') and (CS_CHKSUM /= X"FFFF")) then
        ERR_CHKSUM <= '1';
      else
        ERR_CHKSUM <= '0';
      end if;
      -- Sequential:
      if rising_edge(CLK) then
        if(CS_DONE /= COND_EOP_Z) then
          ERR_DELAY <= '1';
        else
          ERR_DELAY <= '0';
        end if;
      end if;
    end if;
  end process;


  ERR_PACKET <= ERR_IN_Z and COND_EOP_Z;
  

  -- Map error signals:
  ERROR(1) <= ERR_DELAY;
  ERROR(2) <= ERR_ORDER;
  ERROR(3) <= ERR_PACKET;
  ERROR(4) <= ERR_LENGTH;
  ERROR(5) <= ERR_CHKSUM;


  LATCH_ASYNC_CLR_ERROR : DSP_LATCH_ASYNC
    generic map(DATA_IN => 1)
    port map(
      CLK     => CLK,
      DIN(0)  => CLR_ERR,
      DOUT(0) => CLR_ERROR
    );


  ERRORBUS : process(RST, CLK, ERROR)
  begin
    ERROR(0) <= ERROR(1) or ERROR(2) or ERROR(3) or ERROR(4) or ERROR(5);
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
        if(ERROR(4) = '1') then ERR(4) <= '1'; end if;
        if(ERROR(5) = '1') then ERR(5) <= '1'; end if;
      end if;
    end if;
  end process;


--  TEXTOUT : process(RST, CLK)
--    file FIL_OUT     : text open write_mode is "/home/en/fpga/rx100/debug_dsp_rx_ip_to_udp.txt";
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

--        TXT_TIT := "     [ . . . . . . . . . . . . . . . . . . .][ . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .] A S E R M";
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
