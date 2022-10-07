-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(11 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
   component exp5 is
     port(a: in std_logic_vector(7 downto 0); b: in std_logic_vector(2 downto 0); L: in std_logic;
       	y: out std_logic_vector(7 downto 0));
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: exp5 
			port map (
					-- order of inputs B A
					L => input_vector(11),
					b(2) => input_vector(10),
					b(1) => input_vector(9),
					b(0) => input_vector(8),
					a(7) => input_vector(7),
					a(6) => input_vector(6),
					a(5) => input_vector(5),
					a(4) => input_vector(4),
					a(3) => input_vector(3),
					a(2) => input_vector(2),
					a(1) => input_vector(1),
					a(0) => input_vector(0),
               -- order of output OUTPUT
					y(7)=> output_vector(7),
					y(6)=> output_vector(6),
					y(5)=> output_vector(5),
					y(4)=> output_vector(4),
					y(3)=> output_vector(3),
					y(2)=> output_vector(2),
					y(1)=> output_vector(1),
					y(0)=> output_vector(0));
end DutWrap;