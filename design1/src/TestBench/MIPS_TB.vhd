---------------------------------------------------------------------------------------------------
--
-- Title       : Test Bench for mips
-- Design      : design1
-- Author      : Sandy 3Laa
-- Company     : Dell
--
---------------------------------------------------------------------------------------------------
--
-- File        : $DSN\src\TestBench\mips_TB.vhd
-- Generated   : 5/9/2024, 7:51 PM
-- From        : $DSN\src\mips.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
---------------------------------------------------------------------------------------------------
--
-- Description : Automatically generated Test Bench for mips_tb
--
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity mips_tb is
end mips_tb;

architecture TB_ARCHITECTURE of mips_tb is
	-- Component declaration of the tested unit
	component mips
	port(
		clk : in std_logic;
		reset : in std_logic );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : std_logic;
	signal reset : std_logic;
	-- Observed signals - signals mapped to the output ports of tested entity

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : mips
		port map (
			clk => clk,
			reset => reset
		);

	process 																   												   
	begin 	
		wait for 5 ns;
	for i in 0 to 100 loop
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 1 ns;
        end loop;
        wait;
			
			
			
			
				
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mips of mips_tb is
	for TB_ARCHITECTURE
		for UUT : mips
			use entity work.mips(mips);
		end for;
	end for;
end TESTBENCH_FOR_mips;

