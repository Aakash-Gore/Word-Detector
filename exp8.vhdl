library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity exp8 is
port( inp:in std_logic_vector(4 downto 0);
	reset,clock:in std_logic;
	outp: out std_logic);
	end exp8;

architecture bhv of exp8 is
---------------Define state type here-----------------------------
type state is (rst,s1_gun,s2_gun,s1_bomb,s2_bomb,s3_bomb,s1_roam,s2_roam,s3_roam); -- Fill other states here
---------------Define signals of state type-----------------------
signal y_present_gun,y_next_gun,y_present_bomb,y_next_bomb, y_present_roam,y_next_roam : state:=rst;
signal outp1,outp2,outp3: std_logic:='0';


begin
clock_proc:process(clock,reset)

begin
if(clock='1' and clock' event) then
if(reset='1') then
y_present_gun<=rst;
y_present_bomb<=rst;
y_present_roam<=rst;
--Here Reset is synchronous
-- Fill the code here
else
y_present_gun<=y_next_gun;
y_present_bomb<=y_next_bomb;
y_present_roam<=y_next_roam;
-- Fill the code here
end if;
end if;
end process;

state_transition_proc_gun:process(inp,y_present_gun)
begin
case y_present_gun is
when rst=>
if(unsigned(inp)=7) then --g has been detected
y_next_gun<=s1_gun; -- Fill the code here
else
y_next_gun<=y_present_gun;
end if;
outp1<='0';

when s1_gun=>
if(unsigned(inp)=21) then --u has been detected
y_next_gun<=s2_gun; -- Fill the code here
else
y_next_gun<=y_present_gun;
end if;
outp1<='0';

when s2_gun=>
if(unsigned(inp)=14) then --n has been detected
outp1<='1';
y_next_gun<=rst; -- Fill the code here
else
y_next_gun<=y_present_gun;
end if;
when others => 
y_next_gun<= y_present_gun;
outp1<='0';
end case;
end process;

state_transition_proc_bomb: process(inp,y_present_bomb)
begin
case y_present_bomb is
when rst=>
if(unsigned(inp)=2) then --b has been detected
y_next_bomb<=s1_bomb; -- Fill the code here
else
y_next_bomb<=y_present_bomb;
end if;
outp2<='0';

when s1_bomb=>
if(unsigned(inp)=15) then --o has been detected
y_next_bomb<=s2_bomb; -- Fill the code here
else
y_next_bomb<=y_present_bomb;
end if;
outp2<='0';

when s2_bomb=>
if(unsigned(inp)=13) then --m has been detected
y_next_bomb<=s3_bomb; -- Fill the code here
else
y_next_bomb<=y_present_bomb;
end if;
outp2<='0';


when s3_bomb=>
if(unsigned(inp)=2) then --b has been detected
outp2<='1';
y_next_bomb<=rst; -- Fill the code here
else
y_next_bomb<=y_present_bomb;
end if;
when others => 
y_next_bomb<= y_present_bomb;
outp2<='0';
end case;
end process;


state_transition_proc_roam:process(inp,y_present_roam)
begin
case y_present_roam is
when rst=>
if(unsigned(inp)=18) then --r has been detected
y_next_roam<=s1_roam; -- Fill the code here
else
y_next_roam<=y_present_roam;
end if;
outp3<='0';


when s1_roam=>
if(unsigned(inp)=15) then --o has been detected
y_next_roam<=s2_roam; -- Fill the code here
else
y_next_roam<=y_present_roam;
end if;
outp3<='0';

when s2_roam=>
if(unsigned(inp)=1) then --a has been detected
y_next_roam<=s3_roam; -- Fill the code here
else
y_next_roam<=y_present_roam;
end if;
outp3<='0';

when s3_roam=>
if(unsigned(inp)=13) then --m has been detected
outp3<='1';
y_next_roam<=rst; -- Fill the code here
else
y_next_roam<=y_present_roam;
end if;
when others => 
y_next_roam<= y_present_roam;
outp3<='0';
end case;
end process;


outp<= outp1 or outp2 or outp3;


end bhv;