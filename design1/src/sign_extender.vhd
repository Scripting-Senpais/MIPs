library	IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sign_extender is 
	port ( signE_in : in STD_LOGIC_VECTOR ( 15 downto 0);
		   signE_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
		   );
end  Sign_extender ;


architecture Behave of Sign_extender is 

begin  
signE_out <= "0000000000000000" & signE_in when signE_in(15) = '0' else 
			 "1111111111111111" & signE_in;
	
end Behave ;
	
	