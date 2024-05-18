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
	
	-- r-type : funct: add -> 001100          |    s1 => source 1
	--				   sub -> 110011		  |	s2 => source 2
	--				   and -> 011011
	--				   or  -> 110101
	
	-- i-type : opcode: load(lw)  -> 101010	  |	d => destination
	--				   store(sw)  -> 010101	  |	shamt => shift amount
	
	-- j-type : opcode: jamp(j) -> 100001	  |	funct => function code
												   
	-- opcode: branch-eq   -> 100000			   
	--		   branch-n-eq -> 000001			   
	
																		
-- INSTRUCTION MEMORY		   											
SIGNAL IM : RAM_16_X_32 := (
										-- opcode   s1	  s2	d	shamt  funct
"00000000110000001000000000001100",		-- 000000 00110 00000 10000 00000 001100 :	-- add	$s0, $a2, $zero 

										-- opcode   s1	  s2      offset  
"10000011101010100000000000000010",		-- 100000 11101	01010 00000 00000 000000 :  -- beq  $sp, $t2, 0 .
								
										-- opcode   s1	  s2	d	shamt  funct
"00000010011111000111000000001100",		-- 000000 10011 11100 01110 00000 001100 :	-- add	$t6, $s3, $gp
																
										-- opcode   s1	  s2      offset  								
"00000111011110000000000000000100",		-- 000001 11011	11000 00000 00000 000000 :  -- bne  $k1, $t8, 0	 														
								
										-- opcode   s1	  s2	d	shamt  funct
"00000011111011011111000000110011",		-- 000000 11111 01101 11110 00000 110011 :	-- sub	$fp, $ra, $t5
								
										-- opcode   s1	  s2      offset  								
"10000001001110010000000000000110",		-- 100000 01001	11001 00000 00000 000000 :  -- beq  $t1, $t9, 0 .  
								
										-- opcode   s1	  s2	d	shamt  funct
"00000001100000111101000000110011",		-- 000000 01100 00011 11010 00000 110011 :	-- sub	$k0, $t4, $v1
							
										-- opcode   s1	  s2      offset
"00000110111010000000000000000101",		-- 000001 10111	01000 00000 00000 000000 :  -- bne  $s7, $t0, 0
								
										-- opcode   s1    s2	  increment
"10101000101000010000000000000100",		-- 101010 00101 00001 00000 00000 000100 :  -- lw   $at, 4($a1)	    
"01010100100011110000000000000100",		-- 010101 00100 01111 00000 00000 000100 :  -- sw   $t7, 4($a0)
"10101001011000100000000000000100",		-- 101010 01011 00010 00000 00000 000100 :  -- lw   $v0, 4($t3)	
"01010100111100100000000000000100",		-- 010101 00111 10010 00000 00000 000100 :  -- sw   $s2, 4($a3)																									
								
										-- opcode   s1	  s2	d	shamt  funct :  
"00000010001101001011000000011011",		-- 000000 10001 10100 10110 00000 011011 :	-- and	$s6, $s1, $s4	
								
										-- opcode   s1	  s2      offset  								
"10000000000001000000000000000000",		-- 100000 00000	00100 00000 00000 000000 :  -- beq  $zero, $a0, 0 .
								
										-- opcode   s1	  s2	d	shamt  funct :
"00000010101011000111100000110101",		-- 000000 10101 01100 01111 00000 110101 :	-- or	$t7, $s5, $t4																		
										
"11111111111111111111111111111111"
);																														
BEGIN
																		   
Instruction <= 	"11111111111111111111111111111111"
WHEN
	ReadAddress = "00000000000000000000000000000000"
ELSE
	IM( (TO_INTEGER(UNSIGNED(ReadAddress)))-1 );
	
END Behavioral;
