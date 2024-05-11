library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity control is
	port(
	funct: in std_logic_vector(5 downto 0);
	opCode: in std_logic_vector(5 downto 0);
	RegDst: out	std_logic;
	Branch: out	std_logic;
	Bnq: out	std_logic;
	memRead:out std_logic;
	memWrite: out std_logic;
	ALUsrc: out std_logic;
	RegWrite: out std_logic;
	memToReg: out std_logic;
	op:out std_logic_vector(2 downto 0)
	);
end control;



architecture control of control is
begin
	process(opCode,funct)
	begin
		RegWrite<='0';
		case opCode is
			when "000000"=> --R-Type
				case funct is
					when "001100"=>	--add
					op<="001";
					when "110011"=>	--sub
					op<="011";
					when "011011"=>	--and
					op<="111";	
					when "110101"=>	--or
					op<="010";
					when others => null;
				end case;
				RegDst<='1';
				Branch<='0';
				Bnq<='0';
				memRead<='0';
				memWrite<='0';
				ALUsrc<='0';
				memToReg<='0';
				
				RegWrite<='1'after 0.5ns;
			
				
				when "101010"=>--load 
				op<="001";
				RegDst<='0';
				Branch<='0';
				Bnq<='0';
				memRead<='1'after 0.1ns;
				memToReg<='1';
				memWrite<='0'after 0.1ns;
				ALUsrc<='1';
				RegWrite<='1'after 0.5ns;
				
				
				
				when "010101"=>--store
				op<="001";
				RegDst<='X';
				Branch<='0' ;
				Bnq<='0';
				memToReg<='X';
				memRead<='0'after 0.1ns;
				memWrite<='1'after 0.1ns;
				ALUsrc<='1';
				RegWrite<='0';
				
				
				when "100000"=>--branch equal 
				op<="011";
				RegDst<='X';
				Branch<='1'after 0.5ns;
				Bnq<='0';
				memToReg<='X';
				memRead<='0';
				memWrite<='0';
				ALUsrc<='0';
				RegWrite<='0';
				
				
				when "000001"=> --branch not equal
				op<="011";
				RegDst<='X';
				Branch<='1'after 0.5ns;
				Bnq<='1';
				memToReg<='X';
				memRead<='0';
				memWrite<='0';
				ALUsrc<='0';
				RegWrite<='0';
				when others => null;
				RegDst<='0';
				op<="000";
				Branch<='0';
				memToReg<='0';
				memRead<='0';
				memWrite<='0';
				ALUsrc<='0';
				RegWrite<='0'; 
		end case;
	end process;
	
				
				
					
					

end control;