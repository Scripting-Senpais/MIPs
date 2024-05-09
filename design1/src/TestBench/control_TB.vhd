---------------------------------------------------------------------------------------------------
--
-- Title       : Test Bench for control
library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity control_tb is
end control_tb;

architecture TB_ARCHITECTURE of control_tb is
	-- Component declaration of the tested unit
	component control
	port(
		funct : in std_logic_vector(5 downto 0);
		opCode : in std_logic_vector(5 downto 0);
		RegDst : out std_logic;
		Branch : out std_logic;
		memRead : out std_logic;
		memWrite : out std_logic;
		ALUsrc : out std_logic;
		RegWrite : out std_logic;
		memToReg : out std_logic;
		op : out std_logic_vector(2 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal funct : std_logic_vector(5 downto 0);
	signal opCode : std_logic_vector(5 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal RegDst : std_logic;
	signal Branch : std_logic;
	signal memRead : std_logic;
	signal memWrite : std_logic;
	signal ALUsrc : std_logic;
	signal RegWrite : std_logic;
	signal memToReg : std_logic;
	signal op : std_logic_vector(2 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : control
		port map (
			funct => funct,
			opCode => opCode,
			RegDst => RegDst,
			Branch => Branch,
			memRead => memRead,
			memWrite => memWrite,
			ALUsrc => ALUsrc,
			RegWrite => RegWrite,
			memToReg => memToReg,
			op => op
		);
		process
	begin
		opCode <= "000000"; -- add
		funct <= "001100";
		wait for 1ns;
		opCode <= "000000"; -- and
		funct <= "011011";
		wait for 1ns;
		opCode <= "000000"; -- or
		funct <= "110101";
		wait for 1ns;
		opCode <= "000000"; -- sub
		funct <= "110011";
		wait for 1ns;
		opCode <= "100000"; -- beq
		funct <= "000000";
		wait for 1ns;
		opCode <= "000001"; -- bnq
		funct <= "000000";
		wait for 1ns;
		opCode <= "010101"; -- sw
		funct <= "000000";
		wait for 1ns;
		opCode <= "101010"; -- lw
		funct <= "000000";
		wait for 1ns;
		opCode <= "110100";
		funct <= "000000";
		wait for 1ns;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_control of control_tb is
	for TB_ARCHITECTURE
		for UUT : control
			use entity work.control(control);
		end for;
	end for;
end TESTBENCH_FOR_control;
