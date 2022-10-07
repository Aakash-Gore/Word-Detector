library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity block_shift  is
      port(d: in std_logic_vector(8 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity block_shift;

architecture Struct of block_shift is
component mux is
port (S,d0,d1: in std_logic; Y: out std_logic);
end component mux;
  --signal s1,s2,s3,s4 : std_logic;
begin
  -- component instances
  n4_bit : for i in 0 to 7 generate
lsb: if i < 4 generate
b2: mux port map(d(0) => a(i), d(1) => a(i+4), S => b(2), Y => s(i));
end generate lsb;
msb: if i > 3 generate
b2: mux port map(d(0) => a(i), d(1) => '0', S => b(2), Y => s(i));
end generate msb;
end generate ;

 n2_bit : for i in 0 to 7 generate
lsb: if i < 2 generate
b2: mux port map(d(0) => s(i), d(1) => s(i+2), S => b(1), Y => s(i));
end generate lsb;
msb: if i > 5 generate
b2: mux port map(d(0) => a(i), d(1) => '0', S => b(1), Y => s(i));
end generate msb;
end generate ;
end Struct;

 n1_bit : for i in 0 to 7 generate
lsb: if i < 1 generate
b2: mux port map(d(0) => a(i), d(1) => a(i+1), S => b(0), Y => s(i));
end generate lsb;
msb: if i > 6 generate
b2: mux port map(d(0) => a(i), d(1) => '0', S => b(0), Y => s(i));
end generate msb;
end generate ;
