-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(6 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component exp8 is
port(inp:in std_logic_vector(4 downto 0); reset: in std_logic; clock: in std_logic; outp: out std_logic );
		end component;
begin

   -- A/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: exp8
			port map (
					-- order of As Cin B A
				inp(4)=> input_vector(6),
				inp(3)=> input_vector(5),
				inp(2)=> input_vector(4),
				inp(1)=> input_vector(3),
				inp(0)=> input_vector(2),
				reset=> input_vector(1),
				clock=> input_vector(0),
				outp=> output_vector(0));
				
end DutWrap;

