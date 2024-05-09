library ieee;
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
		clk <='1';
		wait for 50ns;	
			end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_mips of mips_tb is
	for TB_ARCHITECTURE
		for UUT : mips
			use entity work.mips(mips);
		end for;
	end for;
end TESTBENCH_FOR_mips;

