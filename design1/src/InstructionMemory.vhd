LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY InstructionMemory IS
	PORT( 
	ReadAddress : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END InstructionMemory;

ARCHITECTURE Behavioral OF InstructionMemory IS	

	TYPE RAM_16_X_32 IS ARRAY(0 TO 15) OF
		STD_LOGIC_VECTOR(31 DOWNTO 0); 
	
-- INSTRUCTION MEMORY	
	SIGNAL IM : RAM_16_X_32 := (x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000",
								x"00000000"
	);
BEGIN
	-- 	4194304 = 0x0040 0000
Instruction <= x"00000000" WHEN ReadAddress = x"003FFFFC" ELSE
			   IM( (TO_INTEGER(UNSIGNED(ReadAddress)) - 4194304)/4 );
	
END Behavioral;
