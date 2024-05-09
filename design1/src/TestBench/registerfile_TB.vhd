library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity RegisterFile_TB is
end RegisterFile_TB;

architecture TB_ARCHITECTURE of RegisterFile_TB is
	-- Component declaration of the tested unit
	component registerfile
	port(
		ReadRegister1 : in std_logic_vector(4 downto 0);
		ReadRegister2 : in std_logic_vector(4 downto 0);
		WriteRegister : in std_logic_vector(4 downto 0);
		RegWrite : in std_logic;
		WriteData : in std_logic_vector(31 downto 0);
		ReadData1 : out std_logic_vector(31 downto 0);
		ReadData2 : out std_logic_vector(31 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal ReadRegister1 : std_logic_vector(4 downto 0);
	signal ReadRegister2 : std_logic_vector(4 downto 0);
	signal WriteRegister : std_logic_vector(4 downto 0);
	signal RegWrite : std_logic;
	signal WriteData : std_logic_vector(31 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ReadData1 : std_logic_vector(31 downto 0);
	signal ReadData2 : std_logic_vector(31 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : registerfile
		port map (
			ReadRegister1 => ReadRegister1,
			ReadRegister2 => ReadRegister2,
			WriteRegister => WriteRegister,
			RegWrite => RegWrite,
			WriteData => WriteData,
			ReadData1 => ReadData1,
			ReadData2 => ReadData2
		);

	-- Add your stimulus here ...
	
	STIM : process
	begin
		for I in 0 to 30 loop
			ReadRegister1 <= std_logic_vector(to_unsigned(I, 5));
			ReadRegister2 <= std_logic_vector(to_unsigned(I+1, 5));
			wait for 25 ns;
		end loop;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_registerfile of RegisterFile_TB is
	for TB_ARCHITECTURE
		for UUT : registerfile
			use entity work.registerfile(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_registerfile;

