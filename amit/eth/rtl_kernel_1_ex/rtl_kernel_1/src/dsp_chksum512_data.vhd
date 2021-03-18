-- dsp_chksum512_data.vhd	3. September 2018	by eddy

-- This entity is controlled by DSP_CHKSUM512_UDPIP.

-- From a series of 512 bit input data there will be calculated a 
-- 16 bit checksum to be used for UDP. Input data is cut into 16 bit 
-- pieces and added up. Any carry-over is added to the sum again. 
-- With each clock cycle a new 512 bit input word can be added.
-- The ADD signal controls whether the input is accumulated to the 
-- checksum or is ignored. The adders are realized in a multiple step 
-- pipeline. A new checksum is started by the START signal. The 
-- previous checksum is issued some clock cycles after the FINISH 
-- signal. This is indicted by DONE. The checksum will be available 
-- on the CHKSUM output until a new one has completed.

-- On Virtex UltraScale it seems to work fine to add up four values 
-- in one swoop (or three values plus one carry bit). You should 
-- not add more than four values and the result should be less than 
-- 24 bits. Then only three carry8 logic cells are needed.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DSP_CHKSUM512_DATA is
  port (
    RST    : in  std_logic;                      -- Reset.
    CLK    : in  std_logic;                      -- Clock.
    DATA   : in  std_logic_vector(511 downto 0); -- Input data to be accumulated.
    START  : in  std_logic;                      -- Start to accumulate a new checksum.
    ADD    : in  std_logic;                      -- Accumulate data to checksum.
    FINISH : in  std_logic;                      -- Finish to accumulate checksum (last word).
    DONE   : out std_logic;                      -- Indicates completion of checksum.
    CHKSUM : out std_logic_vector( 15 downto 0)  -- Latest completed checksum.
  );
end entity;

architecture behavioral of DSP_CHKSUM512_DATA is

  signal START_Z1   : std_logic;
  signal START_Z2   : std_logic;
  signal START_Z3   : std_logic;
  signal START_Z4   : std_logic;
  signal ADD_Z0     : std_logic;
  signal ADD_Z1     : std_logic;
  signal ADD_Z2     : std_logic;
  signal ADD_Z3     : std_logic;
  signal ADD_Z4     : std_logic;
  signal FINISH_Z1  : std_logic;
  signal FINISH_Z2  : std_logic;
  signal FINISH_Z3  : std_logic;
  signal FINISH_Z4  : std_logic;
  signal DATA_00    : unsigned(15 downto 0); -- Input data, 16 bit each.
  signal DATA_01    : unsigned(15 downto 0);
  signal DATA_02    : unsigned(15 downto 0);
  signal DATA_03    : unsigned(15 downto 0);
  signal DATA_04    : unsigned(15 downto 0);
  signal DATA_05    : unsigned(15 downto 0);
  signal DATA_06    : unsigned(15 downto 0);
  signal DATA_07    : unsigned(15 downto 0);
  signal DATA_08    : unsigned(15 downto 0);
  signal DATA_09    : unsigned(15 downto 0);
  signal DATA_10    : unsigned(15 downto 0);
  signal DATA_11    : unsigned(15 downto 0);
  signal DATA_12    : unsigned(15 downto 0);
  signal DATA_13    : unsigned(15 downto 0);
  signal DATA_14    : unsigned(15 downto 0);
  signal DATA_15    : unsigned(15 downto 0);
  signal DATA_16    : unsigned(15 downto 0);
  signal DATA_17    : unsigned(15 downto 0);
  signal DATA_18    : unsigned(15 downto 0);
  signal DATA_19    : unsigned(15 downto 0);
  signal DATA_20    : unsigned(15 downto 0);
  signal DATA_21    : unsigned(15 downto 0);
  signal DATA_22    : unsigned(15 downto 0);
  signal DATA_23    : unsigned(15 downto 0);
  signal DATA_24    : unsigned(15 downto 0);
  signal DATA_25    : unsigned(15 downto 0);
  signal DATA_26    : unsigned(15 downto 0);
  signal DATA_27    : unsigned(15 downto 0);
  signal DATA_28    : unsigned(15 downto 0);
  signal DATA_29    : unsigned(15 downto 0);
  signal DATA_30    : unsigned(15 downto 0);
  signal DATA_31    : unsigned(15 downto 0);
  signal SUM_LEV1_A : unsigned(17 downto 0); -- Level 1 sums, 18 bit each.
  signal SUM_LEV1_B : unsigned(17 downto 0);
  signal SUM_LEV1_C : unsigned(17 downto 0);
  signal SUM_LEV1_D : unsigned(17 downto 0);
  signal SUM_LEV1_E : unsigned(17 downto 0);
  signal SUM_LEV1_F : unsigned(17 downto 0);
  signal SUM_LEV1_G : unsigned(17 downto 0);
  signal SUM_LEV1_H : unsigned(17 downto 0);
  signal SUM_LEV2_A : unsigned(19 downto 0); -- Level 2 sums, 20 bit each.
  signal SUM_LEV2_B : unsigned(19 downto 0);
  signal SUM_LEV3   : unsigned(17 downto 0); -- Level 3 sum, 18 bit.
  signal SUM_LEV4   : unsigned(15 downto 0); -- Level 4 sum, 16 bit.
  signal TOTAL      : unsigned(15 downto 0);

begin

  ADD_Z0 <= ADD or START or FINISH; -- Just to be sure. 

  PIPE : process(RST, CLK)
  begin
    if (RST = '1') then
      START_Z1  <= '0';
      START_Z2  <= '0';
      START_Z3  <= '0';
      START_Z4  <= '0';
      ADD_Z1    <= '0';
      ADD_Z2    <= '0';
      ADD_Z3    <= '0';
      ADD_Z4    <= '0';
      FINISH_Z1 <= '0';
      FINISH_Z2 <= '0';
      FINISH_Z3 <= '0';
      FINISH_Z4 <= '0';
    elsif rising_edge(CLK) then
      START_Z1  <= START;
      START_Z2  <= START_Z1;
      START_Z3  <= START_Z2;
      START_Z4  <= START_Z3;
      ADD_Z1    <= ADD_Z0;
      ADD_Z2    <= ADD_Z1;
      ADD_Z3    <= ADD_Z2;
      ADD_Z4    <= ADD_Z3;
      FINISH_Z1 <= FINISH;
      FINISH_Z2 <= FINISH_Z1;
      FINISH_Z3 <= FINISH_Z2;
      FINISH_Z4 <= FINISH_Z3;
    end if;
  end process;

  -- Partition 16 bit wise:
  DATA_00 <= unsigned(DATA(511 downto 496));
  DATA_01 <= unsigned(DATA(495 downto 480));
  DATA_02 <= unsigned(DATA(479 downto 464));
  DATA_03 <= unsigned(DATA(463 downto 448));
  DATA_04 <= unsigned(DATA(447 downto 432));
  DATA_05 <= unsigned(DATA(431 downto 416));
  DATA_06 <= unsigned(DATA(415 downto 400));
  DATA_07 <= unsigned(DATA(399 downto 384));
  DATA_08 <= unsigned(DATA(383 downto 368));
  DATA_09 <= unsigned(DATA(367 downto 352));
  DATA_10 <= unsigned(DATA(351 downto 336));
  DATA_11 <= unsigned(DATA(335 downto 320));
  DATA_12 <= unsigned(DATA(319 downto 304));
  DATA_13 <= unsigned(DATA(303 downto 288));
  DATA_14 <= unsigned(DATA(287 downto 272));
  DATA_15 <= unsigned(DATA(271 downto 256));
  DATA_16 <= unsigned(DATA(255 downto 240));
  DATA_17 <= unsigned(DATA(239 downto 224));
  DATA_18 <= unsigned(DATA(223 downto 208));
  DATA_19 <= unsigned(DATA(207 downto 192));
  DATA_20 <= unsigned(DATA(191 downto 176));
  DATA_21 <= unsigned(DATA(175 downto 160));
  DATA_22 <= unsigned(DATA(159 downto 144));
  DATA_23 <= unsigned(DATA(143 downto 128));
  DATA_24 <= unsigned(DATA(127 downto 112));
  DATA_25 <= unsigned(DATA(111 downto  96));
  DATA_26 <= unsigned(DATA( 95 downto  80));
  DATA_27 <= unsigned(DATA( 79 downto  64));
  DATA_28 <= unsigned(DATA( 63 downto  48));
  DATA_29 <= unsigned(DATA( 47 downto  32));
  DATA_30 <= unsigned(DATA( 31 downto  16));
  DATA_31 <= unsigned(DATA( 15 downto   0));

  ADDER_LEVEL1 : process(RST, CLK)
  begin
    if (RST = '1') then
      SUM_LEV1_A <= (others => '0');
      SUM_LEV1_B <= (others => '0');
      SUM_LEV1_C <= (others => '0');
      SUM_LEV1_D <= (others => '0');
      SUM_LEV1_E <= (others => '0');
      SUM_LEV1_F <= (others => '0');
      SUM_LEV1_G <= (others => '0');
      SUM_LEV1_H <= (others => '0');
    elsif rising_edge(CLK) then
      if (ADD_Z0 = '1') then
        SUM_LEV1_A <= resize(DATA_00,18) + DATA_01 + DATA_02 + DATA_03;
        SUM_LEV1_B <= resize(DATA_04,18) + DATA_05 + DATA_06 + DATA_07;
        SUM_LEV1_C <= resize(DATA_08,18) + DATA_09 + DATA_10 + DATA_11;
        SUM_LEV1_D <= resize(DATA_12,18) + DATA_13 + DATA_14 + DATA_15;
        SUM_LEV1_E <= resize(DATA_16,18) + DATA_17 + DATA_18 + DATA_19;
        SUM_LEV1_F <= resize(DATA_20,18) + DATA_21 + DATA_22 + DATA_23;
        SUM_LEV1_G <= resize(DATA_24,18) + DATA_25 + DATA_26 + DATA_27;
        SUM_LEV1_H <= resize(DATA_28,18) + DATA_29 + DATA_30 + DATA_31;
      end if;
    end if;
  end process;

  ADDER_LEVEL2 : process(RST, CLK)
  begin
    if (RST = '1') then
      SUM_LEV2_A <= (others => '0');
      SUM_LEV2_B <= (others => '0');
    elsif rising_edge(CLK) then
      if (ADD_Z1 = '1') then
        SUM_LEV2_A <= resize(SUM_LEV1_A,20) + SUM_LEV1_B + SUM_LEV1_C + SUM_LEV1_D;
        SUM_LEV2_B <= resize(SUM_LEV1_E,20) + SUM_LEV1_F + SUM_LEV1_G + SUM_LEV1_H;
      end if;
    end if;
  end process;

  ADDER_LEVEL3 : process(RST, CLK)
  begin
    if (RST = '1') then
      SUM_LEV3 <= (others => '0');
    elsif rising_edge(CLK) then
      if (ADD_Z2 = '1') then
        SUM_LEV3 <= resize(SUM_LEV2_A(15 downto 0),18) + SUM_LEV2_B(15 downto 0) + SUM_LEV2_A(19 downto 16) + SUM_LEV2_B(19 downto 16);
      end if;
    end if;
  end process;

  ADDER_LEVEL4 : process(RST, CLK)
    variable TMPSUM1 : unsigned(16 downto 0);
    variable TMPSUM2 : unsigned(16 downto 0);
  begin
    if (RST = '1') then
      SUM_LEV4 <= (others => '0');
    elsif rising_edge(CLK) then
      if (ADD_Z3 = '1') then
        TMPSUM1 := resize(SUM_LEV3(15 downto 0),17) + SUM_LEV3(17 downto 16);
        TMPSUM2 := resize(TMPSUM1(15 downto 0),17) + 1;
        if (TMPSUM1(16) = '1') then
          SUM_LEV4 <= TMPSUM2(15 downto 0);
        else
          SUM_LEV4 <= TMPSUM1(15 downto 0);
        end if;
      end if;
    end if;
  end process;

  ADDER_LEVEL5 : process(RST, CLK)
    variable VAL2ADD : unsigned(15 downto 0);
    variable TMPSUM1 : unsigned(16 downto 0);
    variable TMPSUM2 : unsigned(16 downto 0);
    variable TMPSUM3 : unsigned(15 downto 0);
  begin
    if (RST = '1') then
      TOTAL  <= (others => '0');
      CHKSUM <= (others => '0');
      DONE   <= '0';
    elsif rising_edge(CLK) then
      VAL2ADD := SUM_LEV4;
      DONE <= '0';                  -- Default assignment, may be overwritten below.
      if (ADD_Z4 = '1') then
        if (START_Z4 = '1') then    -- First value of newly started sum.
          TOTAL <= VAL2ADD;
          if (FINISH_Z4 = '1') then -- In case START and FINISH at same clock cycle.
            CHKSUM <= std_logic_vector(VAL2ADD);
            DONE   <= '1';
          end if;
        else                        -- Usual add up.
          TMPSUM1 := resize(TOTAL,17) + VAL2ADD;
          TMPSUM2 := resize(TMPSUM1(15 downto 0),17) + 1;
          if (TMPSUM1(16) = '1') then
            TMPSUM3 := TMPSUM2(15 downto 0);
          else
            TMPSUM3 := TMPSUM1(15 downto 0);
          end if;
          TOTAL <= TMPSUM3;         -- Store total.
          if (FINISH_Z4 = '1') then -- Issue checksum.
            CHKSUM <= std_logic_vector(TMPSUM3);
            DONE   <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;
  
end architecture behavioral;
