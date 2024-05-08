  library	IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignE_TB is 
end  SignE_TB ;


architecture TB of SignE_TB is 	 

component Sign_extender
		  port ( signE_in : in STD_LOGIC_VECTOR ( 15 downto 0);
		   signE_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
		   );  
end component ;	

   signal	signE_in : STD_LOGIC_VECTOR ( 15 downto 0) ;
   signal   signE_out :  STD_LOGIC_VECTOR ( 31 downto 0 );
   
begin  
    tree: Sign_extender port map (
	      signE_in => signE_in	,
		  signE_out => signE_out 
		  );
		  
		  process 
		  begin
			  
			  signE_in <= "0111111111111111" ;
			  wait for 20 ns ;	  
			  
			  signE_in <= "1000000000000000" ;
			  wait for 20 ns ;
			  
			  signE_in <= "1111111111111111" ;
			  wait for 20 ns ;
			
			  
		assert false 
		  report " end "
		  severity failure;
		  
		end process;  
	
end TB ;
	