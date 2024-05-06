		 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is 
	Generic	(
	   N : integer :=32
	);
	port( mux_in0 : in STD_LOGIC_VECTOR (N-1 downto 0);
	mux_in1 : in STD_LOGIC_VECTOR (N-1 downto 0);
	mux_s1 : in STD_LOGIC;
	mux_out : out STD_LOGIC_VECTOR (N-1 downto 0));
	
	
end MUX;

architecture Behave of MUX is

begin  
  mux_out <= mux_in0 when mux_s1 ='0' else 
			 mux_in1;
	
end behave;

	