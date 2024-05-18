LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY RegisterFile IS
	PORT(
	ReadRegister1 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	ReadRegister2 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	WriteRegister : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	RegWrite : IN STD_LOGIC;
	WriteData : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	ReadData1 :	OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	ReadData2 :	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RegisterFile;

ARCHITECTURE Behavioral OF RegisterFile IS

	
	TYPE reg_file_type IS ARRAY(0 TO 31) OF
		STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	
		
		
																			
											
SIGNAL array_reg : reg_file_type := (
"00000000000000000000000000000001",   --$zero 	  -- 0  -> 	"00000" 	-- 1		    .
"00000000000000000000000000101100",   --$at	  -- 1  -> 	"00001" 	-- 44			.
"00000000000000000000000001011011",   --$v0	  -- 2  -> 	"00010" 	-- 91			.
"00000000000000000000000010001000",   --$v1	  -- 3  -> 	"00011" 	-- 136			.
"00000000000000000000000000000001",   --$a0	  -- 4  -> 	"00100" 	-- 1			.
"00000000000000000000000000000000",   --$a1	  -- 5  -> 	"00101" 	-- 0			.
"00000000000000000000000101111101",   --$a2	  -- 6  -> 	"00110" 	-- 381		  	.
"00000000000000000000000000000011",   --$a3	  -- 7  -> 	"00111" 	-- 3			.
"00000000000000000000001000101111",   --$t0	  -- 8  -> 	"01000" 	-- 559			.
"00000000000000000000001010001000",   --$t1	  -- 9  -> 	"01001" 	-- 648			.
"00000000000000000000001011100011",   --$t2	  -- 10 -> 	"01010" 	-- 739			.
"00000000000000000000000000000010",   --$t3	  -- 11 -> 	"01011" 	-- 830			.
"00000000000000000000001110011001",   --$t4	  -- 12 -> 	"01100" 	-- 921	.		.
"00000000000000000000001111110100",   --$t5	  -- 13 -> 	"01101" 	-- 1012	.		.
"00000000000000000000010001001111",   --$t6	  -- 14 -> 	"01110" 	-- 1103	.		.
"00000000000000000000010010101100",   --$t7	  -- 15 -> 	"01111" 	-- 1196	.		.
"00000000000000000000010100001001",   --$s0	  -- 16 -> 	"10000" 	-- 1289	.		.
"00000000000000000000010101100110",   --$s1	  -- 17 -> 	"10001" 	-- 1382	.		.
"00000000000000000000010111000011",   --$s2	  -- 18 -> 	"10010" 	-- 1475	.		.
"00000000000000000000011000100000",   --$s3	  -- 19 -> 	"10011" 	-- 1568	.		.
"00000000000000000000011001111101",   --$s4	  -- 20 -> 	"10100" 	-- 1661	.		.
"00000000000000000000011011011010",   --$s5	  -- 21 -> 	"10101" 	-- 1754	.		.
"00000000000000000000011100110111",   --$s6	  -- 22 -> 	"10110" 	-- 1847	.		.
"00000000000000000000011110010100",   --$s7	  -- 23 -> 	"10111" 	-- 1940	.		.
"00000000000000000000011111110001",   --$t8	  -- 24 -> 	"11000" 	-- 2033	.		.
"00000000000000000000100001001110",   --$t9	  -- 25 -> 	"11001" 	-- 2126	.		.
"00000000000000000000100010101011",   --$k0	  -- 26 -> 	"11010" 	-- 2219	.		.
"00000000000000000000100100000110",   --$k1	  -- 27 -> 	"11011" 	-- 2310	.		.
"00000000000000000000100101100011",   --$gp	  -- 28 -> 	"11100" 	-- 2403	.		.
"00000000000000000000100111000000",   --$sp	  -- 29 -> 	"11101" 	-- 2496	.		.
"00000000000000000000101000011101",   --$fp	  -- 30 -> 	"11110" 	-- 2589	.		.
"00000000000000000000101001111010"    --$ra	  -- 31 -> 	"11111" 	-- 2682	.		.
);									  -- The decimal representation of the 32 bits =^
BEGIN 
	PROCESS(RegWrite)
	BEGIN
		IF( RegWrite = '1' ) THEN
			array_reg(TO_INTEGER(UNSIGNED(WriteRegister))) <= WriteData;
		END IF;
	END PROCESS;  
	-- i converted them to unsigned and to integer so i can use them as an index to the array
	ReadData1 <= array_reg(TO_INTEGER(UNSIGNED(ReadRegister1)));
	ReadData2 <= array_reg(TO_INTEGER(UNSIGNED(ReadRegister2)));	 
	
	
	
	
	
END Behavioral;
