library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity exp5  is
 port(a: in std_logic_vector(7 downto 0); b: in std_logic_vector(2 downto 0); L: in std_logic;
       	y: out std_logic_vector(7 downto 0));
end entity exp5;

architecture Struct of exp5 is
component mux is
port (S,d0,d1: in std_logic; Y: out std_logic);
end component mux;

  signal p : std_logic_vector(7 downto 0); signal t : std_logic_vector(7 downto 0);signal m : std_logic_vector(7 downto 0);signal  x : std_logic_vector(7 downto 0);signal q : std_logic_vector(7 downto 0);
begin
  -- component instances
  
  --NAND5: NAND_2 port map (A => B, B => B, Y => B_BAR);
  reversal_1: for i in 0 to 7 generate
      w1: mux port map(d0 => a(i), d1 => a(7-i), S => L, Y => p(i));
		end generate;
  
 n4_bit : for i in 0 to 7 generate
lsb: if i < 4 generate
b2: mux port map(d0 => p(i), d1 => p(i+4), S => b(2), Y => t(i));
end generate lsb;
msb: if i > 3 generate
b2: mux port map(d0 => p(i), d1 => '0', S => b(2), Y => t(i));
end generate msb;
end generate ;

 n2_bit : for i in 0 to 7 generate
lsb: if i < 6 generate
b2: mux port map(d0 => t(i), d1 => t(i+2), S => b(1), Y => x(i));
end generate lsb;
msb: if i > 5 generate
b2: mux port map(d0 => t(i), d1 => '0', S => b(1), Y => x(i));
end generate msb;
end generate ;


 n1_bit : for i in 0 to 7 generate
lsb: if i < 7 generate
b2: mux port map(d0 => x(i), d1 => x(i+1), S => b(0), Y => q(i));
end generate lsb;
msb: if i > 6 generate
b2: mux port map(d0 => x(i), d1 => '0', S => b(0), Y => q(i));
end generate msb;
end generate ;

 reversal_2: for i in 0 to 7 generate
      w2: mux port map(d0 => q(i), d1 => q(7-i), S => L, Y => y(i));
		end generate;

end Struct;