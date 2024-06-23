library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity compare is
port(
	in1: in integer;
	in2: in integer;
	comp: out std_logic
);

end compare;

architecture behavior of compare is
	signal t_comp : std_logic;
begin 
process(in1, in2)
begin
	if in1 < in2 then
	t_comp <= '0';
	elsif t_comp <='1' then
	end if;
end process;
comp <= t_comp;
end behavior;