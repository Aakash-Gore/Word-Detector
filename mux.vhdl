library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity mux is
  port (S,d0,d1: in std_logic; Y: out std_logic);
end entity mux;

architecture Struct of mux is
  signal a1,a2,a3 : std_logic;
begin
  -- component instances
     not1: INVERTER port map (A => S, Y => a2);
	  AND1: AND_2 port map (A => d1, B => S, Y => a1);
	  AND2: AND_2 port map (A => a2, B => d0, Y => a3);
	  OR1: OR_2 port map (A => a1, B => a3, Y => Y);
 
  --NAND5: NAND_2 port map (A => B, B => B, Y => B_BAR);
 
  
  -- final OR
  
end Struct;