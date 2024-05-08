 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_TB is 	
end MUX_TB;

architecture tb of MUX_TB is
	constant N : integer := 32;


     signal tb_mux_in0 : STD_LOGIC_VECTOR (N-1  downto 0) := (others => '0');	
	 signal tb_mux_in1 : STD_LOGIC_VECTOR (N-1  downto 0) := (others => '0');
	 signal tb_mux_s1  : STD_LOGIC	:='0';
	 signal tb_mux_out : STD_LOGIC_VECTOR (N-1  downto 0);
	 
begin  
	tree:entity work.MUX(Behave)
	Generic	map ( N => 32)
	port map (
	mux_in0 =>  tb_mux_in0,
	mux_in1 => tb_mux_in1,
	mux_s1 =>  tb_mux_s1,
	mux_out => tb_mux_out 
	);
	
	process 
	begin 
		-- 32 bit mux
	tb_mux_in0<= x"AAAA5555" ;
	tb_mux_in1<= x"5555AAAA" ; 
	
	tb_mux_s1 <= '0';
	wait for 20 ns ;
	
	tb_mux_s1<= '1';
	wait for 20 ns ; 
	
	tb_mux_s1 <= '0';
	wait for 20 ns ;  


	  --5 bit mux
--tb_mux_in0<= "10101" ;
--	tb_mux_in1<= "11000" ; 
--	
--	tb_mux_s1 <= '0';
--	wait for 20 ns ;
--	
--	tb_mux_s1<= '1';
--	wait for 20 ns ; 
--	
--	tb_mux_s1 <= '0';
--	wait for 20 ns ;
	
	 assert false 
	report "end"
    severity failure ;
	
end process;

END ;
	
