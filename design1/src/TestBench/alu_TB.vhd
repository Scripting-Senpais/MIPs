library ieee;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.std_logic_1164.all;


entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	component alu
	port(
		A1 : in std_logic_vector(31 downto 0);
		A2 : in std_logic_vector(31 downto 0);
		ALU_CONTROL : in std_logic_vector(2 downto 0);
		ALU_RESULT : out std_logic_vector(31 downto 0);
		ZERO : out std_logic;
		OVERFLOW : out std_logic );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A1 : std_logic_vector(31 downto 0);
	signal A2 : std_logic_vector(31 downto 0);
	signal ALU_CONTROL : std_logic_vector(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ALU_RESULT : std_logic_vector(31 downto 0);
	signal ZERO : std_logic;
	signal OVERFLOW : std_logic;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			A1 => A1,
			A2 => A2,
			ALU_CONTROL => ALU_CONTROL,
			ALU_RESULT => ALU_RESULT,
			ZERO => ZERO,
			OVERFLOW => OVERFLOW
		);

	-- Add your stimulus here ...
	STIM : PROCESS
	BEGIN
		A1 <= "00000000000000000000000000000011";
		A2 <= "11111111111111111111111111111111";
		
		ALU_CONTROL <= "001"; -- ADDITION
		WAIT FOR 50 ns;
		ALU_CONTROL <= "011"; -- SUB
		WAIT FOR 50 ns;
		ALU_CONTROL <= "111"; -- AND
		WAIT FOR 50 ns;
		ALU_CONTROL <= "010"; -- OR
		WAIT FOR 50 ns;
	END PROCESS;	
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_alu;

