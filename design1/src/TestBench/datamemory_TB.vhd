library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity datamemory_tb is
end datamemory_tb;

architecture TB_ARCHITECTURE of datamemory_tb is
	-- Component declaration of the tested unit
	component datamemory
	port(
		MemRead : in std_logic;
		MemWrite : in std_logic;
		Address : in std_logic_vector(31 downto 0);
		WriteData : in std_logic_vector(31 downto 0);
		ReadData : out std_logic_vector(31 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal MemRead : std_logic;
	signal MemWrite : std_logic;
	signal Address : std_logic_vector(31 downto 0);
	signal WriteData : std_logic_vector(31 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ReadData : std_logic_vector(31 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : datamemory
		port map (
			MemRead => MemRead,
			MemWrite => MemWrite,
			Address => Address,
			WriteData => WriteData,
			ReadData => ReadData
		);

	process
	begin
		Address <= "00000000000000000000000000000100"; --4$(0)
		memRead<='1';
		wait for 1ns;
		memRead<='0';
		wait for 1ns;
		Address <= "00000000000000000000000000000101"; --4$(1)
		MemWrite<='1';
		WriteData<="00000000000000000000000001010001";	
		wait for 1ns;
		MemWrite<='0';
		wait for 1ns;
		Address <= "00000000000000000000000000110100";
		MemWrite<='1';
		WriteData<="00000000000000000000000000000110"; --4$(2)	
		wait for 1ns;
		MemWrite<='0';
		wait for 1ns;
		
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_datamemory of datamemory_tb is
	for TB_ARCHITECTURE
		for UUT : datamemory
			use entity work.datamemory(datamemory);
		end for;
	end for;
end TESTBENCH_FOR_datamemory;

