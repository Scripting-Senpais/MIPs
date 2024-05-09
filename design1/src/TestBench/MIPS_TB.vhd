    library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPS_TB is 
	
end MIPS_TB;

architecture TB of MIPS_TB iS

component MIPS
		 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC
	     );	  
end component ;

signal clk : std_logic := '0' ;
signal reset : std_logic := '0' ;	

constant clk_period : time := 20 ns;

begin  
	
	tree: MIPS port map (
	clk => clk,
	reset => reset 
	);
	
	clk_process: process
	begin 
		clk <= '0';
		wait for clk_period/2; 
		
		clk <= '1';
		wait for clk_period/2;
	end process ; 
	
	
	 stim_process: process 
	begin  
		
		wait for 100 ns ;
		
		
	assert false 
	  report "end"
	  severity failure;
	
end process;

end TB;

	