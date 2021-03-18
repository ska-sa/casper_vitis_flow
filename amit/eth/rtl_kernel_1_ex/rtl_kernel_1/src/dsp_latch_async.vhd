----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 				Stefan Hochguertel
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: 			latch_async - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 			latch data with an asynchronous clock assuring proper transfer between clock domains
--								- "din" is latched if it does not change between two "clk" cycles
--								- "clk" must be significantly faster than "din" changes
--                           __    __    __    __    __    __
--                        __|  |__|  |__|  |__|  |__|  |__|  
--								  00000001111111111111111111111111111 din(0)
--								  00000000111111111111111111111111111 din(1) 
--
--								  00000000011111111111111111111111111 dbuf0(0)
--								  00000000000000011111111111111111111 dbuf0(1)
--
--								  00000000000000011111111111111111111 dbuf1(0)
--								  00000000000000000000011111111111111 dbuf1(1)
--
--								  00000000000000000000000000011111111 dout(0)
--								  00000000000000000000000000011111111 dout(1)
--
-- Dependencies: 			Behavioral:
--
-- Revision: 				version20.5 2016-08-15 S.H. (add signal attributes for asynchronous signals)
--								version20.5 2015-08-05 S.H. (clean-up libraries)
--								version19 03.04.2013 S.H. ()
--
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity dsp_latch_async is
  generic (
    data_in     : integer := 32		-- width of data word
    );
  port (
    clk         : in std_logic;		-- sample clock
    din         : in std_logic_vector(data_in-1 downto 0);	-- data input
    dout        : out	std_logic_vector(data_in-1 downto 0)	-- data-output
    );
end dsp_latch_async;

architecture Behavioral of dsp_latch_async is

-- *** signals to transmit data ***
type data_array is array(0 to 1) of std_logic_vector(data_in-1 downto 0);
signal data	      	: std_logic_vector(data_in-1 downto 0);
signal data_buf		: data_array;
signal data_l		: std_logic_vector(data_in-1 downto 0);

attribute KEEP                          : string;
attribute ASYNC_REG                     : string;
attribute FALSE_PATH_NET                : boolean;
attribute ASYNC_REG of data_buf	        : signal is "TRUE";
attribute ASYNC_REG of data_l	        : signal is "TRUE";
attribute KEEP of data		        : signal is "TRUE";
attribute FALSE_PATH_NET of data	: signal is TRUE;

begin

-- transmit data to other clock domain
data <= din;
process(clk)
begin
  if rising_edge(clk) then
    data_buf(0) <= data;
    data_buf(1) <= data_buf(0);
    
    if data_buf(0)=data_buf(1) then
      data_l <= data_buf(0);
    end if;
  end if;
end process;

dout <= data_l;

end Behavioral;
