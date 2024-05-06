library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MIPs is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC
	     );
end MIPs;


architecture MIPs of MIPs is 

component MUX 
	port( mux_in0 : in STD_LOGIC_VECTOR (31 downto 0);
	mux_in1 : in STD_LOGIC_VECTOR (31 downto 0);
	mux_s1 : in STD_LOGIC;
	mux_out : out STD_LOGIC_VECTOR (31 downto 0));
end component ;

component Sign_extender
	port ( signE_in : in STD_LOGIC_VECTOR ( 15 downto 0);
		   signE_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
		   );
end component	;  


signal signE_in : std_logic_vector (15 downto 0) := x"7fff";
signal signE_out : std_logic_vector	(31 downto 0) := x"00000000";  

signal reg2 : std_logic_vector	(31 downto 0) := x"12345678"; 
signal mux_s1 : std_logic := '0'; 
signal mux_out : std_logic_vector	(31 downto 0) := x"00000000"; 

begin
   
   C1: MUX port map (
       	  mux_in0 => reg2,
	      mux_in1 => signE_out,
	      mux_s1  => mux_s1,
	      mux_out => mux_out
		  );
              
   C2: Sign_extender port map (
   		  signE_in =>  signE_in ,
		  signE_out =>  signE_out
		  );

end MIPs;
