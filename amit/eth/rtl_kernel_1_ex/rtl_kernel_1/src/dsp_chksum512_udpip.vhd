-- dsp_chksum512_udpip.vhd	30. August 2018	by eddy

-- Calculating IP header checksum and UDP checksum to be added to 
-- UDP/IP header. This entity DSP_CHKSUM512_UDPIP is using the 
-- entities DSP_CHKSUM512_HEAD and DSP_CHKSUM512_DATA. The first 
-- 512 bit word of a UDP/IP packet goes to DSP_CHKSUM512_HEAD to 
-- calculate the IP header checksum and the beginning part of the 
-- UDP checksum. The rest of the payload goes to DSP_CHKSUM512_DATA 
-- to complete the calculation of the UDP checksum.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DSP_CHKSUM512_UDPIP is
  port (
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
end entity;

architecture behavioral of DSP_CHKSUM512_UDPIP is

  component DSP_CHKSUM512_HEAD is
    port (
      RST       : in  std_logic;
      CLK       : in  std_logic;
      HEADER    : std_logic_vector(511 downto 0);
      START     : in  std_logic;
      DONE      : out std_logic;
      IPHCHKSUM : out std_logic_vector(15 downto 0);
      UDPCHKSUM : out std_logic_vector(15 downto 0)
    );
  end component;

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

  -- Latched 1st word:
  signal HEADER            : std_logic_vector(511 downto 0);
  -- Control signals:
  signal START_HEAD        : std_logic;
  signal START_DATA        : std_logic;
  signal START_AT_NEXT_ADD : std_logic;
  signal ADD_DATA          : std_logic;
  signal DONE_HEAD         : std_logic;
  signal DONE_DATA         : std_logic;
  -- Pre output checksums:
    signal IPH_CKS_HEAD      : std_logic_vector(15 downto 0);
  signal IPH_CKS           : std_logic_vector(15 downto 0);
  signal UDP_CKS_HEAD      : std_logic_vector(15 downto 0);
  signal UDP_CKS1          : std_logic_vector(15 downto 0);
  signal UDP_CKS2          : std_logic_vector(15 downto 0);
  signal UDP_CKS           : std_logic_vector(15 downto 0);
                            
begin

  FEED_CHKSUM512_HEAD : process(RST, CLK)
  begin
    if (RST = '1') then
      HEADER     <= (others => '0');
      START_HEAD <= '0';
    elsif rising_edge(CLK) then
      if (START = '1') then
        HEADER     <= DATA;
        START_HEAD <= '1';
      else
        START_HEAD <= '0';
      end if;
    end if;
  end process;

  DSP_CHKSUM512_HEAD_inst : DSP_CHKSUM512_HEAD
    port map (
      RST       => RST,
      CLK       => CLK,
      HEADER    => HEADER,
      START     => START_HEAD,
      DONE      => DONE_HEAD,
      IPHCHKSUM => IPH_CKS_HEAD,
      UDPCHKSUM => UDP_CKS_HEAD
    );

  FETCH_CHKSUM512_HEAD : process(RST, CLK)
  begin
    if (RST = '1') then
      IPH_CKS  <= (others => '0');
      UDP_CKS1 <= (others => '0');
    elsif rising_edge(CLK) then
      if (DONE_HEAD = '1') then
        IPH_CKS  <= IPH_CKS_HEAD;
        UDP_CKS1 <= UDP_CKS_HEAD;
      end if;
    end if;
  end process;

  FEED_CHKSUM512_DATA : process(RST, CLK, START, START_AT_NEXT_ADD, ADD)
  begin
    if (RST = '1') then
      START_DATA <= '0';
      ADD_DATA   <= '0';
      START_AT_NEXT_ADD <= '0';
    else
      START_DATA <= START_AT_NEXT_ADD and ADD;
      ADD_DATA   <= ADD and (not START);
      if rising_edge(CLK) then
        if (START = '1') then
          START_AT_NEXT_ADD <= '1';
        elsif (ADD = '1') then
          START_AT_NEXT_ADD <= '0';
        end if;
      end if;
    end if;
  end process;

  DSP_CHKSUM512_DATA_inst : DSP_CHKSUM512_DATA
    port map (
      RST    => RST,
      CLK    => CLK,
      DATA   => DATA,
      START  => START_DATA,
      ADD    => ADD_DATA,
      FINISH => FINISH,
      DONE   => DONE_DATA,
      CHKSUM => UDP_CKS2
    );

  COMBINE_UDP_CKS : process(UDP_CKS1, UDP_CKS2)
    variable TMPSUM1 : unsigned(16 downto 0);
    variable TMPSUM2 : unsigned(16 downto 0);
    variable TMPSUM3 : unsigned(15 downto 0);
  begin
    TMPSUM1 := resize(unsigned(  UDP_CKS1),17) + unsigned(UDP_CKS2);
    TMPSUM2 := resize(TMPSUM1(15 downto 0),17) + 1;
    if (TMPSUM1(16) = '1') then
      TMPSUM3 := TMPSUM2(15 downto 0);
    else
      TMPSUM3 := TMPSUM1(15 downto 0);
    end if;
    if (TMPSUM3 = X"FFFF") then
      UDP_CKS <= X"FFFF";
    else
      UDP_CKS <= std_logic_vector(TMPSUM3) xor X"FFFF";
    end if;
  end process;

  OUTPUT_CHKSUMS : process(RST, CLK)
  begin
    if (RST = '1') then
      DONE       <= '0';
      IPH_CHKSUM <= (others => '0');
      UDP_CHKSUM <= (others => '0');
    elsif rising_edge(CLK) then
      if (DONE_DATA = '1') then
        IPH_CHKSUM <= IPH_CKS;
        UDP_CHKSUM <= UDP_CKS;
        DONE <= '1';
      else
        DONE <= '0';
      end if;
    end if;
  end process;

end architecture behavioral;
