library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity MIPs is
	port(
		 
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC
	     );
end MIPs;


architecture MIPs of MIPs is 
signal PC : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
    signal prev_PC : STD_LOGIC_VECTOR(31 DOWNTO 0);



component MUX 
	generic (
            N : integer := 32
        );
	port( mux_in0 : in STD_LOGIC_VECTOR (N-1 downto 0);
	mux_in1 : in STD_LOGIC_VECTOR (N-1 downto 0);
	mux_s1 : in STD_LOGIC;
	mux_out : out STD_LOGIC_VECTOR (N-1 downto 0));
end component ;

component Sign_extender
	port ( signE_in : in STD_LOGIC_VECTOR ( 15 downto 0);
		   signE_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
		   );
end component	;



component instructionmemory
	port ( ReadAddress : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		   );
end component;

component control
	port ( funct: in std_logic_vector(5 downto 0);
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
end component;


component registerfile
	port ( ReadRegister1 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	ReadRegister2 : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	WriteRegister : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	RegWrite : IN STD_LOGIC;
	WriteData : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	ReadData1 :	OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	ReadData2 :	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		   );
end component;


component alu
	port ( A1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	A2 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	ALU_CONTROL : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	ALU_RESULT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	ZERO : OUT STD_LOGIC
		   );
end component;	

component datamemory
	port ( MemRead : in STD_LOGIC;
		 MemWrite : in STD_LOGIC;
		 Address : in STD_LOGIC_VECTOR(31 downto 0);
		 WriteData : in STD_LOGIC_VECTOR(31 downto 0);
		 ReadData : out STD_LOGIC_VECTOR(31 downto 0)
		   );
end component;








signal ReadData2 : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal signE_out : std_logic_vector	(31 downto 0);
signal ALUsrc: std_logic;
signal mux_out : std_logic_vector	(31 downto 0);
signal Instruction: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RegDst: std_logic;
signal mux2_out : std_logic_vector(4 downto 0);
signal RegWrite: std_logic;
signal mux3_out : std_logic_vector	(31 downto 0);
signal ReadData1 :	STD_LOGIC_VECTOR (31 DOWNTO 0);
signal	Branch: 	std_logic;
signal	memRead: std_logic:='0';
signal	memWrite:  std_logic:='0';
signal	memToReg:  std_logic;
signal op: std_logic_vector(2 downto 0);
signal ALU_RESULT :  STD_LOGIC_VECTOR (31 DOWNTO 0);
signal ZERO :  STD_LOGIC;
signal ReadData :  STD_LOGIC_VECTOR(31 downto 0);
signal mux4_out : std_logic_vector	(31 downto 0);
signal andGateForBeq :  STD_LOGIC; 
signal andGateForBnq :  STD_LOGIC;
signal Bnq :  STD_LOGIC;
signal oneOrTwo : integer range 1 to 2:=1; 



signal WriteData :  STD_LOGIC_VECTOR (31 DOWNTO 0);
signal ReadRegister1 :  STD_LOGIC_VECTOR (4 DOWNTO 0);
signal	ReadRegister2 : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal	WriteRegister :  STD_LOGIC_VECTOR (4 DOWNTO 0);

signal Address :  STD_LOGIC_VECTOR(31 downto 0);




 






begin
   
PROCESS(clk,reset)
BEGIN 		
	
	
		if reset = '1' then
            PC <= (others => '0');
			
						

        elsif clk='1' then
			
			prev_pc<=PC;
			PC <= std_logic_vector(unsigned(PC) + oneOrTwo);  
			
		elsif clk='0' then
	
			
	 			  
			
			if(Branch='1')then 
				if(Bnq='0')then
					if(andGateForBeq='0') then
					oneOrTwo <= 2;
					else
					oneOrTwo <= 1;
					end if;
				else  
					if(andGateForBnq='0') then
					oneOrTwo <= 2;
					else
					oneOrTwo <= 1;
					end if;
					
				
				end if;
			else
				oneOrTwo <= 1;
				end if;
			
        end if;
    end process;
	andGateForBeq<= Branch and ZERO;
	andGateForBnq<= Bnq and (not ZERO);
	--mux connected to sign extender and register file to alu
   M1: MUX
   generic map (N => 32)
   port map (
       	  mux_in0 => ReadData2,
	      mux_in1 => signE_out,
	      mux_s1  => ALUsrc,
	      mux_out => mux_out
		  );
              
   SE: Sign_extender port map (
   		  signE_in =>  Instruction(15 downto 0) ,
		  signE_out =>  signE_out
		  );
		  
		  
	--mux connected to instruction memory to register file
   M2: MUX
   generic map (N => 5)
   port map (
       	  mux_in0 => Instruction(20 downto 16),
	      mux_in1 => Instruction(15 downto 11),
	      mux_s1  => RegDst,
	      mux_out => mux2_out
		  );
		  
	IM: instructionmemory	
		  
		  port map ( 
       	  ReadAddress => PC,
	      Instruction => Instruction
		  );
		  
	RF: registerfile
	port map ( 
       	  ReadRegister1 => Instruction(25 downto 21),
	ReadRegister2 =>Instruction(20 downto 16),
	WriteRegister=>mux2_out,
	RegWrite=>RegWrite,
	WriteData =>mux3_out,
	ReadData1 =>ReadData1,
	ReadData2 =>ReadData2
	);
	ctrl: control 
	port map ( 
       	  funct=>Instruction(5 downto 0),
	opCode=>Instruction(31 downto 26),
	RegDst=>RegDst,
	Branch=>Branch,	 
	Bnq=>Bnq,
	memRead=>memRead,
	memWrite=>memWrite,
	ALUsrc=>ALUsrc,
	RegWrite=>RegWrite,
	memToReg=>memToReg,
	op=>op
	);
	
	alu1: alu
	port map ( 
       	  A1 =>ReadData1 ,
	A2 =>mux_out ,
	ALU_CONTROL =>op ,
	ALU_RESULT =>ALU_RESULT ,
	ZERO=>ZERO 
	 
	);
	DM: datamemory
	port map ( 
       	  MemRead =>memRead,
		 MemWrite =>memWrite,
		 Address =>ALU_RESULT,
		 WriteData =>ReadData2,
		 ReadData =>ReadData
	);
	
	--mux connected to data memory and alu to register file
   M3: MUX
   generic map (N => 32)
   port map (
       	  mux_in0 => ALU_RESULT,
	      mux_in1 => ReadData,
	      mux_s1  => memToReg,
	      mux_out => mux3_out
		  );
		  
		  
		 
	
	
	
		  
		  
		  

end MIPs;