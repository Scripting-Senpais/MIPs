library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;



entity mips_tb is
end mips_tb;

architecture TB_ARCHITECTURE of mips_tb is

	component mips
	port(
		clk : in std_logic;
		reset : in std_logic );
	end component;

	signal clk : std_logic;
	signal reset : std_logic;

begin

	-- Unit Under Test port map
	UUT : mips
		port map (
			clk => clk,
			reset => reset
		);
		process
		begin
	reset <= '1';
		wait for 0.3 ns;
		reset <= '0';
	for i in 0 to 100 loop
            clk <= '1';
            wait for 3 ns;
            clk <= '0';
            wait for 2 ns;
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

