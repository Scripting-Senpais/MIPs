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
	
	
		
		
		
		
	SIGNAL array_reg : reg_file_type := ( 	x"00000000",   --$zero 
											x"11111111",   --$at
											x"22222222",   --$v0
											x"33333333",   --$v1
											x"44444444",   --$a0
											x"55555555",   --$a1
											x"66666666",   --$a2
											x"77777777",   --$a3
											x"88888888",   --$t0
											x"99999999",   --$t1
											x"aaaaaaaa",   --$t2
											x"bbbbbbbb",   --$t3
											x"cccccccc",   --$t4
											x"dddddddd",   --$t5
											x"eeeeeeee",   --$t6
											x"ffffffff",   --$t7
											x"00000000",   --$s0
											x"11111111",   --$s1
											x"22222222",   --$s2
											x"33333333",   --$s3
											x"44444444",   --$s4
											x"55555555",   --$s5
											x"66666666",   --$s6
											x"77777777",   --$s7
											x"88888888",   --$t8
											x"99999999",   --$t9
											x"aaaaaaaa",   --$k0
											x"bbbbbbbb",   --$k1
											x"10008000",   --$gp
											x"6FFFF1EC",   --$sp
											x"eeeeeeee",   --$fp
											x"ffffffff"    --$ra
											);
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
