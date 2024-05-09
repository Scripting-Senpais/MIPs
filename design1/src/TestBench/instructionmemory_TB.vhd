library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity IinstructionMemory_TB is
end IinstructionMemory_TB;

architecture TB_ARCHITECTURE of IinstructionMemory_TB is
	-- Component declaration of the tested unit
	component instructionmemory
	port(
		ReadAddress : in std_logic_vector(31 downto 0);
		Instruction : out std_logic_vector(31 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal ReadAddress : std_logic_vector(31 downto 0) := "00000011111111111111111111111100";
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Instruction : std_logic_vector(31 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : instructionmemory
		port map (
			ReadAddress => ReadAddress,
			Instruction => Instruction
		);

	-- Add your stimulus here ... 
	
	STIM: process
	begin
		for I in 0 to 11 loop
			ReadAddress <= "10000000000000000000000" or std_logic_vector(to_unsigned(I*4, 32));
			wait for 25 ns;
		end loop;
		
	end process;
			

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_instructionmemory of IinstructionMemory_TB is
	for TB_ARCHITECTURE
		for UUT : instructionmemory
			use entity work.instructionmemory(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_instructionmemory;

