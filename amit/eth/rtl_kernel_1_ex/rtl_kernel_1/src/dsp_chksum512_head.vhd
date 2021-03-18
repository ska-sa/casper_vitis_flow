-- dsp_chksum512_head.vhd	27. August 2018	by eddy

-- This entity is controlled by DSP_CHKSUM512_UDPIP.

-- The first 512bit word of a packet is put to HEADER for some cycles.
-- We calculate the IP header checksum and the first part of the UDP 
-- checksum. From START it takes four cycles to calculate and give DONE 
-- together with the new sums. 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DSP_CHKSUM512_HEAD is
  port (
    RST       : in  std_logic;
    CLK       : in  std_logic;
    HEADER    : in  std_logic_vector(511 downto 0);     -- 1st word of packet, contains IP and UDP headers.
    START     : in  std_logic;                      -- Start of packet, a new HEADER is valid.
    DONE      : out std_logic;                      -- Indicates completion.
    IPHCHKSUM : out std_logic_vector(15 downto 0);  -- IP header checksum.
    UDPCHKSUM : out std_logic_vector(15 downto 0)   -- UDP partly checksum.
  );
end entity;

architecture behavioral of DSP_CHKSUM512_HEAD is

  signal HEAD00    : unsigned(15 downto 0);
  signal HEAD01    : unsigned(15 downto 0);
  signal HEAD02    : unsigned(15 downto 0);
  signal HEAD03    : unsigned(15 downto 0);
  signal HEAD04    : unsigned(15 downto 0);
  signal HEAD05    : unsigned(15 downto 0);
  signal HEAD06    : unsigned(15 downto 0);
  signal HEAD07    : unsigned(15 downto 0);
  signal HEAD08    : unsigned(15 downto 0);
  signal HEAD09    : unsigned(15 downto 0);
  signal HEAD10    : unsigned(15 downto 0);
  signal HEAD11    : unsigned(15 downto 0);
  signal HEAD11_Z1 : unsigned(15 downto 0);
  signal HEAD12    : unsigned(15 downto 0);
  signal HEAD13    : unsigned(15 downto 0);
  signal HEAD14    : unsigned(15 downto 0);
  signal HEAD15    : unsigned(15 downto 0);
  signal HEAD16    : unsigned(15 downto 0);
  signal HEAD17    : unsigned(15 downto 0);
  signal HEAD17_Z1 : unsigned(15 downto 0);
  signal HEAD18    : unsigned(15 downto 0);
  signal HEAD19    : unsigned(15 downto 0);
  signal HEAD19_Z1 : unsigned(15 downto 0);
  signal HEAD20    : unsigned(15 downto 0);
  signal HEAD21    : unsigned(15 downto 0);
  signal HEAD22    : unsigned(15 downto 0);
  signal HEAD23    : unsigned(15 downto 0);
  signal HEAD24    : unsigned(15 downto 0);
  signal HEAD25    : unsigned(15 downto 0);
  signal HEAD26    : unsigned(15 downto 0);
  signal HEAD27    : unsigned(15 downto 0);
  signal HEAD28    : unsigned(15 downto 0);
  signal HEAD29    : unsigned(15 downto 0);
  signal HEAD30    : unsigned(15 downto 0);
  signal HEAD31    : unsigned(15 downto 0);
  signal SUM01     : unsigned(17 downto 0); -- Sum of 4x 16bit makes it 18bit.
  signal SUM02     : unsigned(17 downto 0); -- Sum of 4x 16bit makes it 18bit.
  signal SUM03     : unsigned(19 downto 0); -- Sum of 2x18bit plus 1x16bit makes 20bit.
  signal SUM04     : unsigned(15 downto 0); -- 16bit.
  signal SUM05     : unsigned(17 downto 0); -- Sum of 4x 16bit makes it 18bit.
  signal SUM06     : unsigned(17 downto 0); -- Sum of 4x 16bit makes it 18bit.
  signal SUM07     : unsigned(17 downto 0); -- Sum of 4x 16bit makes it 18bit.
  signal SUM08     : unsigned(19 downto 0); -- Sum of 2x 18bit plus some more makes 20bit.
  signal SUM09     : unsigned(19 downto 0); -- Sum of 2x 18bit plus some more makes 20bit.
  signal SUM10     : unsigned(20 downto 0); -- 21bit is sufficient.
  signal SUM11     : unsigned(15 downto 0); -- 16bit.
  signal START_Z1  : std_logic;
  signal START_Z2  : std_logic;
  signal START_Z3  : std_logic;
  signal START_Z4  : std_logic;

begin

  -- Partition 16 bit wise:
--HEAD00 <= unsigned(HEADER(511 downto 496)); -- IP header: MAC destination
--HEAD01 <= unsigned(HEADER(495 downto 480)); -- IP header: MAC destination
--HEAD02 <= unsigned(HEADER(479 downto 464)); -- IP header: MAC destination
--HEAD03 <= unsigned(HEADER(463 downto 448)); -- IP header: MAC source
--HEAD04 <= unsigned(HEADER(447 downto 432)); -- IP header: MAC source
--HEAD05 <= unsigned(HEADER(431 downto 416)); -- IP header: MAC source
--HEAD06 <= unsigned(HEADER(415 downto 400)); -- IP header: ether type
  HEAD07 <= unsigned(HEADER(399 downto 384)); -- IP header: version, IHL, TOS
  HEAD08 <= unsigned(HEADER(383 downto 368)); -- IP header: total length
  HEAD09 <= unsigned(HEADER(367 downto 352)); -- IP header: identification
  HEAD10 <= unsigned(HEADER(351 downto 336)); -- IP header: flags and fragments
  HEAD11 <= unsigned(HEADER(335 downto 320)); -- IP header: TTL, protocol
--HEAD12 <= unsigned(HEADER(319 downto 304)); -- IP header: header checksum
  HEAD13 <= unsigned(HEADER(303 downto 288)); -- IP header: source address
  HEAD14 <= unsigned(HEADER(287 downto 272)); -- IP header: source address
  HEAD15 <= unsigned(HEADER(271 downto 256)); -- IP header: destination address
  HEAD16 <= unsigned(HEADER(255 downto 240)); -- IP header: destination address
  HEAD17 <= unsigned(HEADER(239 downto 224)); -- UDP header: source port
  HEAD18 <= unsigned(HEADER(223 downto 208)); -- UDP header: destination port
  HEAD19 <= unsigned(HEADER(207 downto 192)); -- UDP header: length
--HEAD20 <= unsigned(HEADER(191 downto 176)); -- UDP header: checksum
  HEAD21 <= unsigned(HEADER(175 downto 160)); -- Rest of HEADER
  HEAD22 <= unsigned(HEADER(159 downto 144)); -- Rest of HEADER
  HEAD23 <= unsigned(HEADER(143 downto 128)); -- Rest of HEADER
  HEAD24 <= unsigned(HEADER(127 downto 112)); -- Rest of HEADER
  HEAD25 <= unsigned(HEADER(111 downto  96)); -- Rest of HEADER
  HEAD26 <= unsigned(HEADER( 95 downto  80)); -- Rest of HEADER
  HEAD27 <= unsigned(HEADER( 79 downto  64)); -- Rest of HEADER
  HEAD28 <= unsigned(HEADER( 63 downto  48)); -- Rest of HEADER
  HEAD29 <= unsigned(HEADER( 47 downto  32)); -- Rest of HEADER
  HEAD30 <= unsigned(HEADER( 31 downto  16)); -- Rest of HEADER
  HEAD31 <= unsigned(HEADER( 15 downto   0)); -- Rest of HEADER

-- This is what we do:
-- FORBOTH = HEAD13 + HEAD14 + HEAD15 + HEAD16
-- IPHCHKSUM = (FORBOTH + HEAD07 + HEAD08 + HEAD09 + HEAD10 + HEAD11) xor 0xFFFF
-- REST = HEAD21 + HEAD22 + HEAD23 + HEAD24 + HEAD25 + HEAD26 + HEAD27 + HEAD28 + HEAD29 + HEAD30 + HEAD31
-- UDPCHKSUM = FORBOTH + 0x0011 + HEAD17 + HEAD18 + 2x HEAD19 + REST

  DELAY : process(RST, CLK)
  begin
    if(RST = '1') then
      HEAD11_Z1 <= (others => '0');
      HEAD17_Z1 <= (others => '0');
      HEAD19_Z1 <= (others => '0');
    elsif rising_edge(CLK) then
      HEAD11_Z1 <= HEAD11;
      HEAD17_Z1 <= HEAD17;
      HEAD19_Z1 <= HEAD19;
    end if;
  end process;

  SUM_01 : process(RST, CLK) -- HEAD13 + HEAD14 + HEAD15 + HEAD16, used for both, IPHCHKSUM and UDPCHKSUM.
  begin
    if(RST = '1') then
      SUM01 <= (others => '0');
    elsif rising_edge(CLK) then
      SUM01 <= resize(HEAD13,18) + HEAD14 + HEAD15 + HEAD16;
    end if;
  end process;

  SUM_02 : process(RST, CLK) -- HEAD07 + HEAD08 + HEAD09 + HEAD10, used for IPHCHKSUM.
  begin
    if(RST = '1') then
      SUM02 <= (others => '0');
    elsif rising_edge(CLK) then
      SUM02 <= resize(HEAD07,18) + HEAD08 + HEAD09 + HEAD10;
    end if;
  end process;

  SUM_03 : process(RST, CLK) -- SUM01 + SUM02 + HEAD11, used for IPHCHKSUM.
  begin
    if(RST = '1') then
      SUM03 <= (others => '0');
    elsif rising_edge(CLK) then
      SUM03 <= resize(SUM01,20) + SUM02 + HEAD11_Z1;
    end if;
  end process;

  SUM_04 : process(RST, CLK) -- Lower 16 bit of SUM03 + upper bits of SUM03 + CARRY, used for IPHCHKSUM.
    variable TMPSUM1 : unsigned(16 downto 0);
    variable TMPSUM2 : unsigned(16 downto 0);
  begin
    if(RST = '1') then
      SUM04 <= (others => '0');
    elsif rising_edge(CLK) then
      TMPSUM1 := resize(SUM03(15 downto 0),17) + SUM03(19 downto 16);
      TMPSUM2 := resize(TMPSUM1(15 downto 0),17) + 1;
      if(TMPSUM1(16) = '1') then
        SUM04 <= TMPSUM2(15 downto 0);
      else
        SUM04 <= TMPSUM1(15 downto 0);
      end if;
    end if;
  end process;

  SUM_05 : process(RST, CLK) -- HEAD18 + HEAD21 + HEAD22 + HEAD23, used for UDPCHKSUM.
  begin
    if(RST = '1') then
      SUM05 <= (others => '0');
    elsif rising_edge(CLK) then
      SUM05 <= resize(HEAD18,18) + HEAD21 + HEAD22 + HEAD23;
    end if;
  end process;

  SUM_06 : process(RST, CLK) -- HEAD24 + HEAD25 + HEAD26 + HEAD27, used for UDPCHKSUM.
  begin
    if(RST = '1') then
      SUM06 <= (others => '0');
    elsif rising_edge(CLK) then
      SUM06 <= resize(HEAD24,18) + HEAD25 + HEAD26 + HEAD27;
    end if;
  end process;

  SUM_07 : process(RST, CLK) -- HEAD28 + HEAD29 + HEAD30 + HEAD31, used for UDPCHKSUM.
  begin
    if(RST = '1') then
      SUM07 <= (others => '0');
    elsif rising_edge(CLK) then
      SUM07 <= resize(HEAD28,18) + HEAD29 + HEAD30 + HEAD31;
    end if;
  end process;

  SUM_08 : process(RST, CLK) -- SUM01 + SUM05 + HEAD17 + 17, used for UDPCHKSUM.
  begin
    if(RST = '1') then
      SUM08 <= (others => '0');
    elsif rising_edge(CLK) then
      SUM08 <= resize(SUM01,20) + SUM05 + HEAD17_Z1 + 17;
    end if;
  end process;

  SUM_09 : process(RST, CLK) -- SUM06 + SUM07 + 2x HEAD19, used for UDPCHKSUM.
  begin
    if(RST = '1') then
      SUM09 <= (others => '0');
    elsif rising_edge(CLK) then
      SUM09 <= resize(SUM06,20) + SUM07 + (HEAD19_Z1 & "0");
    end if;
  end process;

  SUM_10 : process(RST, CLK) -- SUM_08 + SUM_09, used for UDPCHKSUM.
  begin
    if(RST = '1') then
      SUM10 <= (others => '0');
    elsif rising_edge(CLK) then
      SUM10 <= resize(SUM08,21) + SUM09;
    end if;
  end process;

  SUM_11 : process(RST, CLK) -- Lower 16 bit of SUM10 + upper bits of SUM10 + CARRY, used for UDPCHKSUM.
   variable TMPSUM1 : unsigned(16 downto 0);
   variable TMPSUM2 : unsigned(16 downto 0);
  begin
    if(RST = '1') then
      SUM11 <= (others => '0');
    elsif rising_edge(CLK) then
      TMPSUM1 := resize(SUM10(15 downto 0),17) + SUM10(19 downto 16);
      TMPSUM2 := resize(TMPSUM1(15 downto 0),17) + 1;
      if(TMPSUM1(16) = '1') then
        SUM11 <= TMPSUM2(15 downto 0);
      else
        SUM11 <= TMPSUM1(15 downto 0);
      end if;
    end if;
  end process;

  START_DONE : process(RST, CLK)
  begin
    if(RST = '1') then
      START_Z1 <= '0';
      START_Z2 <= '0';
      START_Z3 <= '0';
      START_Z4 <= '0';
    elsif rising_edge(CLK) then
      START_Z1 <= START;
      START_Z2 <= START_Z1;
      START_Z3 <= START_Z2;
      START_Z4 <= START_Z3;
    end if;
  end process;

  IPHCHKSUM <= std_logic_vector(SUM04) xor X"FFFF";
  UDPCHKSUM <= std_logic_vector(SUM11);
  DONE <= START_Z4;

end architecture behavioral;
