-- dsp_rx_lbu_to_eth.vhd	24. May 2019	by eddy

-- Receive data from CMAC via LBUS and extract ethernet packets from it.
--         +---+                                             __
--  IN_3 --| F |-- FO_3 --------o---------------------- 6 --|  \
--  IN_2 --| I |-- FO_2 -----o-- \ -------------------- 5 --|   \
--  IN_1 --| F |-- FO_1 --o-- \ - \ ------------------- 4 --| M  |--- OU_3
--  IN_0 --| O |-- FO_0 -- \ - \ - \ ------------------ 3 --| U  |--- OU_2
--         +---+            \   \   \   +---+               | X  |--- OU_1
--                           \   \   \--| Z |-- BU_3 -- 2 --|    |--- OU_0
--                            \   \-----| - |-- BU_2 -- 1 --|   /
--                             \--------| 1 |-- BU_1 -- 0 --|__/
--                                      +---+
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;


entity DSP_RX_LBU_TO_ETH is
  port (
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
end entity;


architecture behavioral of DSP_RX_LBU_TO_ETH is

  component DSP_RX_LBUS_FIFO is
    port (
      CLK         : in  std_logic;
      RST         : in  std_logic;
      DIN         : in  std_logic_vector(527 downto 0);
      WR_EN       : in  std_logic;
      RD_EN       : in  std_logic;
      DOUT        : out std_logic_vector(527 downto 0);
      FULL        : out std_logic;
      OVERFLOW    : out std_logic;
      EMPTY       : out std_logic;
      UNDERFLOW   : out std_logic
    );
  end component;

  -- Condensed RX signals:
  signal RX_ERR         : std_logic;
  signal RX_MTY         : std_logic_vector(3 downto 0);
  --  FIFO:
  signal FIFO_DIN       : std_logic_vector(527 downto 0);
  signal FIFO_DOUT      : std_logic_vector(527 downto 0);
  signal FIFO_WREN      : std_logic;
  signal FIFO_RDEN      : std_logic;
  signal FIFO_FULL      : std_logic;
  signal FIFO_EMPTY     : std_logic;
  signal FIFO_OVERFLOW  : std_logic;
  signal FIFO_UNDERFLOW : std_logic;
  -- FIFO output:
  signal FO_DATA0       : std_logic_vector(127 downto 0);
  signal FO_DATA1       : std_logic_vector(127 downto 0);
  signal FO_DATA2       : std_logic_vector(127 downto 0);
  signal FO_DATA3       : std_logic_vector(127 downto 0);
  signal FO_ENA0        : std_logic;
  signal FO_ENA1        : std_logic;
  signal FO_ENA2        : std_logic;
  signal FO_ENA3        : std_logic;
  signal FO_SOP0        : std_logic;
  signal FO_SOP1        : std_logic;
  signal FO_SOP2        : std_logic;
  signal FO_SOP3        : std_logic;
  signal FO_EOP0        : std_logic;
  signal FO_EOP1        : std_logic;
  signal FO_EOP2        : std_logic;
  signal FO_EOP3        : std_logic;
  signal FO_ERR         : std_logic;
  signal FO_MTY         : std_logic_vector(3 downto 0);
  -- Buffer for 3 segments:
  signal BU_DATA1       : std_logic_vector(127 downto 0);
  signal BU_DATA2       : std_logic_vector(127 downto 0);
  signal BU_DATA3       : std_logic_vector(127 downto 0);
  signal BU_ENA1        : std_logic;
  signal BU_ENA2        : std_logic;
  signal BU_ENA3        : std_logic;
  signal BU_SOP1        : std_logic;
  signal BU_SOP2        : std_logic;
  signal BU_SOP3        : std_logic;
  signal BU_EOP1        : std_logic;
  signal BU_EOP2        : std_logic;
  signal BU_EOP3        : std_logic;
  signal BU_ERR1        : std_logic;
  signal BU_ERR2        : std_logic;
  signal BU_ERR3        : std_logic;
  signal BU_MTY1        : std_logic_vector(3 downto 0);
  signal BU_MTY2        : std_logic_vector(3 downto 0);
  signal BU_MTY3        : std_logic_vector(3 downto 0);
  -- BU and FO joined:
  signal DAT0           : std_logic_vector(127 downto 0);
  signal DAT1           : std_logic_vector(127 downto 0);
  signal DAT2           : std_logic_vector(127 downto 0);
  signal DAT3           : std_logic_vector(127 downto 0);
  signal DAT4           : std_logic_vector(127 downto 0);
  signal DAT5           : std_logic_vector(127 downto 0);
  signal DAT6           : std_logic_vector(127 downto 0);
  signal ENA0           : std_logic;
  signal ENA1           : std_logic;
  signal ENA2           : std_logic;
  signal ENA3           : std_logic;
  signal ENA4           : std_logic;
  signal ENA5           : std_logic;
  signal ENA6           : std_logic;
  signal SOP0           : std_logic;
  signal SOP1           : std_logic;
  signal SOP2           : std_logic;
  signal SOP3           : std_logic;
  signal SOP4           : std_logic;
  signal SOP5           : std_logic;
  signal SOP6           : std_logic;
  signal EOP0           : std_logic;
  signal EOP1           : std_logic;
  signal EOP2           : std_logic;
  signal EOP3           : std_logic;
  signal EOP4           : std_logic;
  signal EOP5           : std_logic;
  signal EOP6           : std_logic;
  signal ERR0           : std_logic;
  signal ERR1           : std_logic;
  signal ERR2           : std_logic;
  signal ERR3           : std_logic;
  signal ERR4           : std_logic;
  signal ERR5           : std_logic;
  signal ERR6           : std_logic;
  signal MTY0           : std_logic_vector(3 downto 0);
  signal MTY1           : std_logic_vector(3 downto 0);
  signal MTY2           : std_logic_vector(3 downto 0);
  signal MTY3           : std_logic_vector(3 downto 0);
  signal MTY4           : std_logic_vector(3 downto 0);
  signal MTY5           : std_logic_vector(3 downto 0);
  signal MTY6           : std_logic_vector(3 downto 0);
  signal MTI0           : integer range 0 to 15;
  signal MTI1           : integer range 0 to 15;
  signal MTI2           : integer range 0 to 15;
  signal MTI3           : integer range 0 to 15;
  signal MTI4           : integer range 0 to 15;
  signal MTI5           : integer range 0 to 15;
  signal MTI6           : integer range 0 to 15;
  -- Output:
  signal OU_DAT         : std_logic_vector(511 downto 0);
  signal OU_ENA         : std_logic;
  signal OU_SOP         : std_logic;
  signal OU_EOP         : std_logic;
  signal OU_ERR         : std_logic;
  signal OU_MTY         : std_logic_vector(5 downto 0);
  
  signal READ_REQUEST   : std_logic := '1';
  
  signal RUN_FLAG       : std_logic;              -- Debug text out run flag.
  signal DBG            : integer range 0 to 255; -- Debug combiner case code.
  signal DBP            : integer range 0 to 3;   -- Debug back pressure case code.

  type PS_STATE is(S_HOLD, S_FILL); -- HOLD: Check for SOP. FILL: Fill and check for EOP.
  signal STATE  : PS_STATE;
  
  signal ERR_FIFO_OVERFLOW : std_logic;
  signal ERROR  : std_logic_vector(3 downto 0);

begin

  -- Map FIFO input:
  FIFO_DIN(127 downto   0) <= DATA0_IN;
  FIFO_DIN(255 downto 128) <= DATA1_IN;
  FIFO_DIN(383 downto 256) <= DATA2_IN;
  FIFO_DIN(511 downto 384) <= DATA3_IN;
  FIFO_DIN(512) <= ENA1_IN;
  FIFO_DIN(513) <= ENA2_IN;
  FIFO_DIN(514) <= ENA3_IN;
  FIFO_DIN(515) <= SOP0_IN;
  FIFO_DIN(516) <= SOP1_IN;
  FIFO_DIN(517) <= SOP2_IN;
  FIFO_DIN(518) <= SOP3_IN;
  FIFO_DIN(519) <= EOP0_IN;
  FIFO_DIN(520) <= EOP1_IN;
  FIFO_DIN(521) <= EOP2_IN;
  FIFO_DIN(522) <= EOP3_IN;
  FIFO_DIN(523) <= RX_ERR;
  FIFO_DIN(527 downto 524) <= RX_MTY;


  CONDENSE_ERR_MTY : process(EOP0_IN, EOP1_IN, EOP2_IN, EOP3_IN, ERR0_IN, ERR1_IN, ERR2_IN, ERR3_IN, MTY0_IN, MTY1_IN, MTY2_IN, MTY3_IN)
  begin
    if   (EOP0_IN = '1') then
      RX_ERR <= ERR0_IN;
      RX_MTY <= MTY0_IN;
    elsif(EOP1_IN = '1') then
      RX_ERR <= ERR1_IN;
      RX_MTY <= MTY1_IN;
    elsif(EOP2_IN = '1') then
      RX_ERR <= ERR2_IN;
      RX_MTY <= MTY2_IN;
    elsif(EOP3_IN = '1') then
      RX_ERR <= ERR3_IN;
      RX_MTY <= MTY3_IN;
    else
      RX_ERR <= '0';
      RX_MTY <= (others => '0');
    end if;
  end process;


  FIFO_WE : process(RST, FIFO_FULL, FIFO_OVERFLOW, ENA0_IN)
  begin
    if(RST = '1') then
      FIFO_WREN         <= '0';
      ERR_FIFO_OVERFLOW <= '0';
    else
      FIFO_WREN         <= (not FIFO_FULL) and ENA0_IN;
      ERR_FIFO_OVERFLOW <= (FIFO_FULL and ENA0_IN) or FIFO_OVERFLOW;
    end if;
  end process;


  LBUS_FIFO : DSP_RX_LBUS_FIFO
    port map (
      CLK       => CLK,
      RST       => RST,
      DIN       => FIFO_DIN,
      WR_EN     => FIFO_WREN,
      RD_EN     => FIFO_RDEN,
      DOUT      => FIFO_DOUT,
      FULL      => FIFO_FULL,
      OVERFLOW  => FIFO_OVERFLOW,
      EMPTY     => FIFO_EMPTY,
      UNDERFLOW => FIFO_UNDERFLOW
    );


  FIFO_RE : process(RST, FIFO_EMPTY, READ_REQUEST)
  begin
    if(RST = '1') then
      FIFO_RDEN <= '0';
    else
      FIFO_RDEN <= READ_REQUEST and (not FIFO_EMPTY);
    end if;
  end process;


  FIFO_OUTPUT_VALID : process(RST, CLK)
  begin
    if(RST = '1') then
      FO_ENA0 <= '0';
    elsif rising_edge(CLK) then
      FO_ENA0 <= FIFO_RDEN; -- One clock delay.
    end if;
  end process;


  -- Map FIFO output:
  FO_DATA0 <= FIFO_DOUT(127 downto   0);
  FO_DATA1 <= FIFO_DOUT(255 downto 128);
  FO_DATA2 <= FIFO_DOUT(383 downto 256);
  FO_DATA3 <= FIFO_DOUT(511 downto 384);
  FO_ENA1  <= FIFO_DOUT(512);
  FO_ENA2  <= FIFO_DOUT(513);
  FO_ENA3  <= FIFO_DOUT(514);
  FO_SOP0  <= FIFO_DOUT(515);
  FO_SOP1  <= FIFO_DOUT(516);
  FO_SOP2  <= FIFO_DOUT(517);
  FO_SOP3  <= FIFO_DOUT(518);
  FO_EOP0  <= FIFO_DOUT(519);
  FO_EOP1  <= FIFO_DOUT(520);
  FO_EOP2  <= FIFO_DOUT(521);
  FO_EOP3  <= FIFO_DOUT(522);
  FO_ERR   <= FIFO_DOUT(523);
  FO_MTY   <= FIFO_DOUT(527 downto 524);
  

  -- Map BU_ and FO_ segments for easy reading (0,1,2 is BU, 3,4,5,6 is FO):
  DAT0 <= BU_DATA1;
  DAT1 <= BU_DATA2;
  DAT2 <= BU_DATA3;
  DAT3 <= FO_DATA0;
  DAT4 <= FO_DATA1;
  DAT5 <= FO_DATA2;
  DAT6 <= FO_DATA3;
  ENA0 <= BU_ENA1;
  ENA1 <= BU_ENA2;
  ENA2 <= BU_ENA3;
  ENA3 <= FO_ENA0;
  ENA4 <= ENA3 and FO_ENA1;
  ENA5 <= ENA4 and FO_ENA2;
  ENA6 <= ENA5 and FO_ENA3;
  SOP0 <= ENA0 and BU_SOP1;
  SOP1 <= ENA1 and BU_SOP2;
  SOP2 <= ENA2 and BU_SOP3;
  SOP3 <= ENA3 and FO_SOP0;
  SOP4 <= ENA4 and FO_SOP1;
  SOP5 <= ENA5 and FO_SOP2;
  SOP6 <= ENA6 and FO_SOP3;
  EOP0 <= ENA0 and BU_EOP1;
  EOP1 <= ENA1 and BU_EOP2;
  EOP2 <= ENA2 and BU_EOP3;
  EOP3 <= ENA3 and FO_EOP0;
  EOP4 <= ENA4 and FO_EOP1;
  EOP5 <= ENA5 and FO_EOP2;
  EOP6 <= ENA6 and FO_EOP3;
  ERR0 <= EOP0 and BU_ERR1;
  ERR1 <= EOP1 and BU_ERR2;
  ERR2 <= EOP2 and BU_ERR3;
  ERR3 <= EOP3 and FO_ERR;
  ERR4 <= EOP4 and FO_ERR;
  ERR5 <= EOP5 and FO_ERR;
  ERR6 <= EOP6 and FO_ERR;
  MTY0 <= (EOP0 and BU_MTY1(3)) & (EOP0 and BU_MTY1(2)) & (EOP0 and BU_MTY1(1)) & (EOP0 and BU_MTY1(0));
  MTY1 <= (EOP1 and BU_MTY2(3)) & (EOP1 and BU_MTY2(2)) & (EOP1 and BU_MTY2(1)) & (EOP1 and BU_MTY2(0));
  MTY2 <= (EOP2 and BU_MTY3(3)) & (EOP2 and BU_MTY3(2)) & (EOP2 and BU_MTY3(1)) & (EOP2 and BU_MTY3(0));
  MTY3 <= (EOP3 and FO_MTY(3)) & (EOP3 and FO_MTY(2)) & (EOP3 and FO_MTY(1)) & (EOP3 and FO_MTY(0));
  MTY4 <= (EOP4 and FO_MTY(3)) & (EOP4 and FO_MTY(2)) & (EOP4 and FO_MTY(1)) & (EOP4 and FO_MTY(0));
  MTY5 <= (EOP5 and FO_MTY(3)) & (EOP5 and FO_MTY(2)) & (EOP5 and FO_MTY(1)) & (EOP5 and FO_MTY(0));
  MTY6 <= (EOP6 and FO_MTY(3)) & (EOP6 and FO_MTY(2)) & (EOP6 and FO_MTY(1)) & (EOP6 and FO_MTY(0));
  MTI0 <= to_integer(unsigned(MTY0));
  MTI1 <= to_integer(unsigned(MTY1));
  MTI2 <= to_integer(unsigned(MTY2));
  MTI3 <= to_integer(unsigned(MTY3));
  MTI4 <= to_integer(unsigned(MTY4));
  MTI5 <= to_integer(unsigned(MTY5));
  MTI6 <= to_integer(unsigned(MTY6));


  REQUEST : process(RST, STATE, ENA0, ENA1, ENA2, EOP4, EOP5, EOP6)
    -- Easy approach was: READ_REQUEST <= not (EOP4 or EOP5 or EOP6);
  begin
    DBP <= 0; -- Default assignment.
    if(RST = '1') then
      READ_REQUEST <= '0';
    elsif(EOP4 = '1') then
      if(ENA0 = '0') then
        READ_REQUEST <= '1';
      else
        READ_REQUEST <= '0';
        DBP <= 1;
      end if;
    elsif(EOP5 = '1') then
      if((ENA0 = '0') and (ENA1 = '0')) then
        READ_REQUEST <= '1';
      else
        READ_REQUEST <= '0';
        DBP <= 2;
      end if;  
    elsif(EOP6 = '1') then
      if((ENA0 = '0') and (ENA1 = '0') and (ENA2 = '0')) then
        READ_REQUEST <= '1';
      else
        READ_REQUEST <= '0';
        DBP <= 3;
      end if;
    else
      READ_REQUEST <= '1';
    end if;
  end process;


  COMBINER : process(RST, CLK)
    variable BU_STORE : integer range 0 to 3;
    variable BU_CLEAR : integer range 0 to 3;
    constant UNUSED   : std_logic := '0';
    constant NULL_SEG : std_logic_vector(127 downto 0) := (others => UNUSED);
    variable DATA_SEG : std_logic_vector(127 downto 0);
  begin
    if(RST = '1') then
      BU_DATA1 <= (others => UNUSED);
      BU_DATA2 <= (others => UNUSED);
      BU_DATA3 <= (others => UNUSED);
      BU_ENA1  <= '0';
      BU_ENA2  <= '0';
      BU_ENA3  <= '0';
      BU_SOP1  <= '0';
      BU_SOP2  <= '0';
      BU_SOP3  <= '0';
      BU_EOP1  <= '0';
      BU_EOP2  <= '0';
      BU_EOP3  <= '0';
      BU_ERR1  <= '0';
      BU_ERR2  <= '0';
      BU_ERR3  <= '0';
      BU_MTY1  <= (others => '0');
      BU_MTY2  <= (others => '0');
      BU_MTY3  <= (others => '0');
      OU_DAT   <= (others => UNUSED);
      OU_ENA   <= '0';
      OU_SOP   <= '0';
      OU_EOP   <= '0';
      OU_ERR   <= '0';
      OU_MTY   <= (others => '0');
      STATE    <= S_HOLD;
      DBG      <= 0;
    elsif rising_edge(CLK) then
      -- Default assignments:
      OU_DAT   <= (others => UNUSED);
      OU_ENA   <= '0';
      OU_SOP   <= '0';
      OU_EOP   <= '0';
      OU_ERR   <= '0';
      OU_MTY   <= (others => '0');
      DATA_SEG := (others => UNUSED);
      DBG <= 0;
      -- Output in case of STATE = S_HOLD;      
      if(STATE = S_HOLD) then 
        if(   (SOP0 and ENA1 and ENA2 and ENA3) = '1') then       -- SOP ENA ENA   ENA XXX XXX XXX
          OU_DAT   <= DAT0 & DAT1 & DAT2 & DAT3;                  -- DAT DAT DAT   DAT --- --- ---
          OU_ENA   <= '1';                                        -- --- --- ---       STO STO STO
          OU_SOP   <= '1';
          OU_EOP   <= EOP3;
          OU_ERR   <= ERR3;
          OU_MTY   <= (others => '0');
          BU_STORE := 3;
          BU_CLEAR := 0;
          if(EOP3 = '0') then
            STATE  <= S_FILL;
            DBG <= 101;
          else
            DBG <= 102;  
          end if;
        elsif((SOP1 and ENA2 and ENA3 and ENA4) = '1') then       -- XXX SOP ENA   ENA ENA XXX XXX
          OU_DAT   <= DAT1 & DAT2 & DAT3 & DAT4;                  -- --- DAT DAT   DAT DAT --- ---
          OU_ENA   <= '1';                                        -- CLR --- ---       --- STO STO
          OU_SOP   <= '1';
          OU_EOP   <= EOP4;
          OU_ERR   <= ERR4;
          OU_MTY   <= (others => '0');
          BU_STORE := 2;
          BU_CLEAR := 1;
          if(EOP4 = '0') then
            STATE  <= S_FILL;
            DBG <= 103;
          else
            DBG <= 104;
          end if;
        elsif((SOP2 and ENA3 and ENA4 and ENA5) = '1') then       -- XXX XXX SOP   ENA ENA ENA XXX
          OU_DAT   <= DAT2 & DAT3 & DAT4 & DAT5;                  -- --- --- DAT   DAT DAT DAT ---
          OU_ENA   <= '1';                                        -- CLR CLR ---       --- --- STO
          OU_SOP   <= '1';
          OU_EOP   <= EOP5;
          OU_ERR   <= ERR5;
          OU_MTY   <= (others => '0');
          BU_STORE := 1;
          BU_CLEAR := 2;
          if(EOP5 = '0') then
            STATE  <= S_FILL;
            DBG <= 105;
          else
            DBG <= 106;
          end if;
        elsif((SOP3 and ENA4 and ENA5 and ENA6) = '1') then       -- XXX XXX XXX   SOP ENA ENA ENA
          OU_DAT   <= DAT3 & DAT4 & DAT5 & DAT6;                  -- --- --- ---   DAT DAT DAT DAT
          OU_ENA   <= '1';                                        -- CLR CLR CLR       --- --- ---
          OU_SOP   <= '1';
          OU_EOP   <= EOP6;
          OU_ERR   <= ERR6;
          OU_MTY   <= (others => '0');
          BU_STORE := 0;
          BU_CLEAR := 3;
          if(EOP6 = '0') then
            STATE  <= S_FILL;
            DBG <= 107;
          else
            DBG <= 108;
          end if;
        elsif(SOP4 = '1') then                                    -- XXX XXX XXX   XXX SOP ENA ENA
          BU_STORE := 3;                                          -- --- --- ---       STO STO STO
          BU_CLEAR := 0;
          DBG <= 109;
        elsif(SOP5 = '1') then                                    -- XXX XXX XXX   XXX XXX SOP ENA
          BU_STORE := 2;                                          -- CLR --- ---       --- STO STO
          BU_CLEAR := 1;
          DBG <= 110;
        elsif(SOP6 = '1') then                                    -- XXX XXX XXX   XXX XXX XXX SOP
          BU_STORE := 1;                                          -- CLR CLR ---       --- --- STO
          BU_CLEAR := 2;
          DBG <= 111;
        else
          BU_STORE := 0;
          BU_CLEAR := 0;
          DBG <= 100;
        end if;
      -- Output in case of STATE = S_FILL;
      else -- STAT = S_FILL
        if(   (ENA0 = '1') and (EOP0 = '1')) then                 -- EOP XXX XXX   XXX XXX XXX XXX
          DATA_SEG(127 downto 8*MTI0) := DAT0(127 downto 8*MTI0); -- D.. 000 000   000 --- --- ---
          OU_DAT   <= DATA_SEG & NULL_SEG & NULL_SEG & NULL_SEG;  -- CLR --- ---       --- --- ---
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR0;
          OU_MTY   <= "11" & MTY0;
          BU_STORE := 0;
          BU_CLEAR := 1;
          STATE    <= S_HOLD;
          DBG <= 201;
        elsif((ENA0 = '1') and (EOP1 = '1')) then                 -- ENA EOP XXX   XXX XXX XXX XXX
          DATA_SEG(127 downto 8*MTI1) := DAT1(127 downto 8*MTI1); -- DAT D.. 000   000 --- --- ---
          OU_DAT   <= DAT0 & DATA_SEG & NULL_SEG & NULL_SEG;      -- CLR CLR ---       --- --- ---
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR1;
          OU_MTY   <= "10" & MTY1;
          BU_STORE := 0;
          BU_CLEAR := 2;
          STATE    <= S_HOLD;
          DBG <= 202;
        elsif((ENA0 = '1') and (EOP2 = '1')) then                 -- ENA ENA EOP   XXX XXX XXX XXX
          DATA_SEG(127 downto 8*MTI2) := DAT2(127 downto 8*MTI2); -- DAT DAT D..   000 --- --- ---
          OU_DAT   <= DAT0 & DAT1 & DATA_SEG & NULL_SEG;          -- CLR CLR CLR       --- --- ---
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR2;
          OU_MTY   <= "01" & MTY2;
          BU_STORE := 0;
          BU_CLEAR := 3;
          STATE    <= S_HOLD;
          DBG <= 203;
        elsif((ENA0 = '1') and (EOP3 = '1')) then                 -- ENA ENA ENA   EOP XXX XXX XXX
          DATA_SEG(127 downto 8*MTI3) := DAT3(127 downto 8*MTI3); -- DAT DAT DAT   D.. --- --- ---
          OU_DAT   <= DAT0 & DAT1 & DAT2 & DATA_SEG;              -- --- --- ---       STO STO STO
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR3;
          OU_MTY   <= "00" & MTY3;
          BU_STORE := 3;
          BU_CLEAR := 0;
          STATE    <= S_HOLD;
          DBG <= 204;
        elsif((ENA0 = '1') and (ENA3 = '1')) then                 -- ENA ENA ENA   ENA XXX XXX XXX
          OU_DAT   <= DAT0 & DAT1 & DAT2 & DAT3;                  -- DAT DAT DAT   DAT --- --- ---
          OU_ENA   <= '1';                                        -- --- --- ---       STO STO STO
          OU_SOP   <= '0';
          OU_EOP   <= '0';
          OU_ERR   <= '0';
          OU_MTY   <= (others => '0');
          BU_STORE := 3;
          BU_CLEAR := 0;
          -- Keep STATE S_FILL.
          DBG <= 205;
        elsif((ENA1 = '1') and (EOP1 = '1')) then                 -- --- EOP XXX   XXX XXX XXX XXX
          DATA_SEG(127 downto 8*MTI1) := DAT1(127 downto 8*MTI1); -- --- D.. 000   000 000 --- ---
          OU_DAT   <= DATA_SEG & NULL_SEG & NULL_SEG & NULL_SEG;  -- CLR CLR ---       --- --- ---
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR1;
          OU_MTY   <= "11" & MTY1;
          BU_STORE := 0;
          BU_CLEAR := 2;
          STATE    <= S_HOLD;
          DBG <= 206;
        elsif((ENA1 = '1') and (EOP2 = '1')) then                 -- --- ENA EOP   XXX XXX XXX XXX
          DATA_SEG(127 downto 8*MTI2) := DAT2(127 downto 8*MTI2); -- --- DAT D..   000 000 --- ---
          OU_DAT   <= DAT1 & DATA_SEG & NULL_SEG & NULL_SEG;      -- CLR CLR CLR       --- --- ---
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR2;
          OU_MTY   <= "10" & MTY2;
          BU_STORE := 0;
          BU_CLEAR := 3;
          STATE    <= S_HOLD;
          DBG <= 207;
        elsif((ENA1 = '1') and (EOP3 = '1')) then                 -- --- ENA ENA   EOP XXX XXX XXX
          DATA_SEG(127 downto 8*MTI3) := DAT3(127 downto 8*MTI3); -- --- DAT DAT   D.. 000 --- ---
          OU_DAT   <= DAT1 & DAT2 & DATA_SEG & NULL_SEG;          -- --- --- ---       STO STO STO
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR3;
          OU_MTY   <= "01" & MTY3;
          BU_STORE := 3;
          BU_CLEAR := 0;
          STATE    <= S_HOLD;
          DBG <= 208;
        elsif((ENA1 = '1') and (EOP4 = '1')) then                 -- --- ENA ENA   ENA EOP XXX XXX
          DATA_SEG(127 downto 8*MTI4) := DAT4(127 downto 8*MTI4); -- --- DAT DAT   DAT D.. --- ---
          OU_DAT   <= DAT1 & DAT2 & DAT3 & DATA_SEG;              -- CLR --- ---       --- STO STO
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR4;
          OU_MTY   <= "00" & MTY4;
          BU_STORE := 2;
          BU_CLEAR := 1;
          STATE    <= S_HOLD;
          DBG <= 209;
        elsif((ENA1 = '1') and (ENA4 = '1')) then                 -- --- ENA ENA   ENA ENA XXX XXX
          OU_DAT   <= DAT1 & DAT2 & DAT3 & DAT4;                  -- --- DAT DAT   DAT DAT --- ---
          OU_ENA   <= '1';                                        -- CLR --- ---       --- STO STO
          OU_SOP   <= '0';
          OU_EOP   <= '0';
          OU_ERR   <= '0';
          OU_MTY   <= (others => '0');
          BU_STORE := 2;
          BU_CLEAR := 1;
          -- Keep STATE S_FILL.
          DBG <= 210;
        elsif((ENA2 = '1') and (EOP2 = '1')) then                 -- --- --- EOP   XXX XXX XXX XXX
          DATA_SEG(127 downto 8*MTI2) := DAT2(127 downto 8*MTI2); -- --- --- D..   000 000 000 ---
          OU_DAT   <= DATA_SEG & NULL_SEG & NULL_SEG & NULL_SEG;  -- CLR CLR CLR       --- --- ---
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR2;
          OU_MTY   <= "11" & MTY2;
          BU_STORE := 0;
          BU_CLEAR := 3;
          STATE    <= S_HOLD;
          DBG <= 211;
        elsif((ENA2 = '1') and (EOP3 = '1')) then                 -- --- --- ENA   EOP XXX XXX XXX
          DATA_SEG(127 downto 8*MTI3) := DAT3(127 downto 8*MTI3); -- --- --- DAT   D.. 000 000 ---
          OU_DAT   <= DAT2 & DATA_SEG & NULL_SEG & NULL_SEG;      -- --- --- ---       STO STO STO
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR3;
          OU_MTY   <= "10" & MTY3;
          BU_STORE := 3;
          BU_CLEAR := 0;
          STATE    <= S_HOLD;
          DBG <= 212;
        elsif((ENA2 = '1') and (EOP4 = '1')) then                 -- --- --- ENA   ENA EOP XXX XXX
          DATA_SEG(127 downto 8*MTI4) := DAT4(127 downto 8*MTI4); -- --- --- DAT   DAT D.. 000 ---
          OU_DAT   <= DAT2 & DAT3 & DATA_SEG & NULL_SEG;          -- CLR --- ---       --- STO STO
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR4;
          OU_MTY   <= "01" & MTY4;
          BU_STORE := 2;
          BU_CLEAR := 1;
          STATE    <= S_HOLD;
          DBG <= 213;
        elsif((ENA2 = '1') and (EOP5 = '1')) then                 -- --- --- ENA   ENA ENA EOP XXX
          DATA_SEG(127 downto 8*MTI5) := DAT5(127 downto 8*MTI5); -- --- --- DAT   DAT DAT D.. ---
          OU_DAT   <= DAT2 & DAT3 & DAT4 & DATA_SEG;              -- CLR CLR ---       --- --- STO
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR5;
          OU_MTY   <= "00" & MTY5;
          BU_STORE := 1;
          BU_CLEAR := 2;
          STATE    <= S_HOLD;
          DBG <= 214;
        elsif((ENA2 = '1') and (ENA5 = '1')) then                 -- --- --- ENA   ENA ENA ENA XXX
          OU_DAT   <= DAT2 & DAT3 & DAT4 & DAT5;                  -- --- --- DAT   DAT DAT DAT ---
          OU_ENA   <= '1';                                        -- CLR CLR ---       --- --- STO
          OU_SOP   <= '0';
          OU_EOP   <= '0';
          OU_ERR   <= '0';
          OU_MTY   <= (others => '0');
          BU_STORE := 1;
          BU_CLEAR := 2;
          -- Keep STATE S_FILL.
          DBG <= 215;
        elsif((ENA3 = '1') and (EOP3 = '1')) then                 -- --- --- ---   EOP XXX XXX XXX
          DATA_SEG(127 downto 8*MTI3) := DAT3(127 downto 8*MTI3); -- --- --- ---   D.. 000 000 000
          OU_DAT   <= DATA_SEG & NULL_SEG & NULL_SEG & NULL_SEG;  -- --- --- ---       STO STO STO
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR3;
          OU_MTY   <= "11" & MTY3;
          BU_STORE := 3;
          BU_CLEAR := 0;
          STATE    <= S_HOLD;
          DBG <= 216;
        elsif((ENA3 = '1') and (EOP4 = '1')) then                 -- --- --- ---   ENA EOP XXX XXX
          DATA_SEG(127 downto 8*MTI4) := DAT4(127 downto 8*MTI4); -- --- --- ---   DAT D.. 000 000
          OU_DAT   <= DAT3 & DATA_SEG & NULL_SEG & NULL_SEG;      -- CLR --- ---       --- STO STO
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR4;
          OU_MTY   <= "10" & MTY4;
          BU_STORE := 2;
          BU_CLEAR := 1;
          STATE    <= S_HOLD;
          DBG <= 217;
        elsif((ENA3 = '1') and (EOP5 = '1')) then                 -- --- --- ---   ENA ENA EOP XXX
          DATA_SEG(127 downto 8*MTI5) := DAT5(127 downto 8*MTI5); -- --- --- ---   DAT DAT D.. 000
          OU_DAT   <= DAT3 & DAT4 & DATA_SEG & NULL_SEG;          -- CLR CLR ---       ___ ___ STO
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR5;
          OU_MTY   <= "01" & MTY5;
          BU_STORE := 1;
          BU_CLEAR := 2;
          STATE    <= S_HOLD;
          DBG <= 218;
        elsif((ENA3 = '1') and (EOP6 = '1')) then                 -- --- --- ---   ENA ENA ENA EOP
          DATA_SEG(127 downto 8*MTI6) := DAT6(127 downto 8*MTI6); -- --- --- ---   DAT DAT DAT D..
          OU_DAT   <= DAT3 & DAT4 & DAT5 & DATA_SEG;              -- CLR CLR CLR       --- --- ---
          OU_ENA   <= '1';
          OU_SOP   <= '0';
          OU_EOP   <= '1';
          OU_ERR   <= ERR6;
          OU_MTY   <= "00" & MTY6;
          BU_STORE := 0;
          BU_CLEAR := 3;
          STATE    <= S_HOLD;
          DBG <= 219;
        elsif((ENA3 = '1') and (ENA6 = '1')) then                 -- --- --- ---   ENA ENA ENA ENA
          OU_DAT   <= DAT3 & DAT4 & DAT5 & DAT6;                  -- --- --- ---   DAT DAT DAT DAT
          OU_ENA   <= '1';                                        -- CLR CLR CLR       --- --- ---
          OU_SOP   <= '0';
          OU_EOP   <= '0';
          OU_ERR   <= '0';
          OU_MTY   <= (others => '0');
          BU_STORE := 0;
          BU_CLEAR := 3;
          -- Keep STATE S_FILL.
          DBG <= 220;
        else
          BU_STORE := 0;
          BU_CLEAR := 0;
          -- Keep STATE S_FILL.
          DBG <= 200;
        end if;
      end if;
      -- STORE to BU and CLEAR BU:
      if(BU_STORE = 3) then
        BU_DATA1 <= FO_DATA1;
        BU_ENA1  <= FO_ENA1;
        BU_SOP1  <= FO_SOP1;
        BU_EOP1  <= FO_EOP1;
        BU_ERR1  <= FO_EOP1 and FO_ERR;
        BU_MTY1  <= (FO_EOP1 and FO_MTY(3)) & (FO_EOP1 and FO_MTY(2)) & (FO_EOP1 and FO_MTY(1)) & (FO_EOP1 and FO_MTY(0));
      elsif((BU_CLEAR = 1) or (BU_CLEAR = 2) or (BU_CLEAR = 3)) then
        BU_DATA1 <= (others => UNUSED);
        BU_ENA1  <= '0';
        BU_SOP1  <= '0';
        BU_EOP1  <= '0';
        BU_ERR1  <= '0';
        BU_MTY1  <= (others => '0');
      end if;
      if((BU_STORE = 3) or (BU_STORE = 2)) then
        BU_DATA2 <= FO_DATA2;
        BU_ENA2  <= FO_ENA2;
        BU_SOP2  <= FO_SOP2;
        BU_EOP2  <= FO_EOP2;
        BU_ERR2  <= FO_EOP2 and FO_ERR;
        BU_MTY2  <= (FO_EOP2 and FO_MTY(3)) & (FO_EOP2 and FO_MTY(2)) & (FO_EOP2 and FO_MTY(1)) & (FO_EOP2 and FO_MTY(0));
      elsif((BU_CLEAR = 2) or (BU_CLEAR = 3)) then
        BU_DATA2 <= (others => UNUSED);
        BU_ENA2  <= '0';
        BU_SOP2  <= '0';
        BU_EOP2  <= '0';
        BU_ERR2  <= '0';
        BU_MTY2  <= (others => '0');
      end if;
      if((BU_STORE = 3) or (BU_STORE = 2) or (BU_STORE = 1)) then
        BU_DATA3 <= FO_DATA3;
        BU_ENA3  <= FO_ENA3;
        BU_SOP3  <= FO_SOP3;
        BU_EOP3  <= FO_EOP3;
        BU_ERR3  <= FO_EOP3 and FO_ERR;
        BU_MTY3  <= (FO_EOP3 and FO_MTY(3)) & (FO_EOP3 and FO_MTY(2)) & (FO_EOP3 and FO_MTY(1)) & (FO_EOP3 and FO_MTY(0));
      elsif(BU_CLEAR = 3) then
        BU_DATA3 <= (others => UNUSED);
        BU_ENA3  <= '0';
        BU_SOP3  <= '0';
        BU_EOP3  <= '0';
        BU_ERR3  <= '0';
        BU_MTY3  <= (others => '0');
      end if;
    end if;
  end process;


  -- Map output signals:
  DATA_OUT <= OU_DAT;
  ENA_OUT  <= OU_ENA;
  SOP_OUT  <= OU_SOP;
  EOP_OUT  <= OU_EOP;
  ERR_OUT  <= OU_ERR;
  MTY_OUT  <= OU_MTY;


  -- Map error signals:
  ERROR(1) <= ERR_FIFO_OVERFLOW;
  ERROR(2) <= FIFO_UNDERFLOW;
  ERROR(3) <= OU_ERR;

  ERRORBUS : process(RST, CLK, ERROR)
  begin
    ERROR(0) <= ERROR(1) or ERROR(2) or ERROR(3);
    if(RST = '1') then
      ERR <= (others => '0');
    elsif rising_edge(CLK) then
      if(CLR_ERR = '1') then
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
--    file FIL_OUT      : text open write_mode is "/home/en/fpga/rx100/debug_dsp_rx_lbu_to_eth.txt";
--    variable LIN      : line;
--    variable TXT_TIT  : string(1 to 47);
--    variable TXT_PRE  : string(1 to 5);
--  begin
--    if(RST = '1') then
--      RUN_FLAG <= '0';
--    elsif rising_edge(CLK) then
--      if(ENA0_IN = '1') then
--        RUN_FLAG <= '1';
--      end if;
--      if((ENA0_IN = '1') or (RUN_FLAG = '1')) then
--        TXT_TIT := "     . D . A . T . A . . . . B . U .  A S E R M";
--        write(LIN,TXT_TIT,left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "BU 0 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,DAT0,left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ENA0, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,SOP0, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,EOP0, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ERR0, left,0);
--        write (LIN,' ',  left,0);
--        hwrite(LIN,MTY0, left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "BU 1 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,DAT1,left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ENA1, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,SOP1, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,EOP1, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ERR1, left,0);
--        write (LIN,' ',  left,0);
--        hwrite(LIN,MTY1, left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "BU 2 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,DAT2,left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ENA2, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,SOP2, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,EOP2, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ERR2, left,0);
--        write (LIN,' ',  left,0);
--        hwrite(LIN,MTY2, left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_TIT := "     . D . A . T . A . . . . F . O .  A S E R M";
--        write(LIN,TXT_TIT,left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "FO 3 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,DAT3,left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ENA3, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,SOP3, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,EOP3, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ERR3, left,0);
--        write (LIN,' ',  left,0);
--        hwrite(LIN,MTY3, left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "FO 4 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,DAT4,left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ENA4, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,SOP4, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,EOP4, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ERR4, left,0);
--        write (LIN,' ',  left,0);
--        hwrite(LIN,MTY4, left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "FO 5 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,DAT5,left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ENA5, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,SOP5, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,EOP5, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ERR5, left,0);
--        write (LIN,' ',  left,0);
--        hwrite(LIN,MTY5, left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "FO 6 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,DAT6,left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ENA6, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,SOP6, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,EOP6, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,ERR6, left,0);
--        write (LIN,' ',  left,0);
--        hwrite(LIN,MTY6, left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_TIT := "     . D . A . T . A . . . . O . U .  A S E R M";
--        write(LIN,TXT_TIT,left,0);
--        writeline(FIL_OUT,LIN);
      
--        TXT_PRE := "OU 0 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,OU_DAT(511 downto 384),left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,OU_ENA, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,OU_SOP, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,OU_EOP, left,0);
--        write (LIN,' ',  left,0);
--        write (LIN,OU_ERR, left,0);
--        write (LIN,' ',  left,0);
--        write(LIN,to_integer(unsigned(OU_MTY)), left,0);
--        writeline(FIL_OUT,LIN);
      
--        TXT_PRE := "OU 1 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,OU_DAT(383 downto 256),left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "OU 2 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,OU_DAT(255 downto 128),left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "OU 3 ";
--        write(LIN,TXT_PRE,left,0);
--        hwrite(LIN,OU_DAT(127 downto 0),left,0);
--        writeline(FIL_OUT,LIN);

--        TXT_PRE := "DBG  ";
--        write(LIN,TXT_PRE,left,0);
--        write(LIN,DBG,left,0);
--        if(DBP /= 0) then
--          TXT_PRE := " DBP ";
--          write(LIN,TXT_PRE,left,0);
--          write(LIN,DBP,left,0);
--        end if;
--        writeline(FIL_OUT,LIN);
--        writeline(FIL_OUT,LIN);
--      end if;
--    end if;
--  end process;


end architecture behavioral;
