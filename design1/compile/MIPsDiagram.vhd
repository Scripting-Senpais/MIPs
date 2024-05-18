---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : design1
-- Author      : FaRaH
-- Company     : HP Inc.
--
---------------------------------------------------------------------------------------------------
--
-- File        : d:\Uni\PROJECTS\HW Project\MIPs\design1\compile\MIPsDiagram.vhd
-- Generated   : Fri May 10 20:34:55 2024
-- From        : d:/Uni/PROJECTS/HW Project/MIPs/design1/src/MIPsDiagram.bde
-- By          : Bde2Vhdl ver. 2.6
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity MIPsDiagram is 
end MIPsDiagram;

architecture MIPsDiagram of MIPsDiagram is

---- Component declarations -----

component Fub1
  port (
       BUS101 : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component Fub2
	--- component Fub2 has no ports
end component;
component Fub3
	--- component Fub3 has no ports
end component;
component Memory
  port (
       BUS101 : in STD_LOGIC_VECTOR(7 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS101 : STD_LOGIC_VECTOR (7 downto 0);

begin

----  Component instantiations  ----

Instruction : Memory
  port map(
       BUS101 => BUS101
  );

PC : Fub1
  port map(
       BUS101 => BUS101
  );

U1 : Fub2;

U2 : Fub3;


end MIPsDiagram;
