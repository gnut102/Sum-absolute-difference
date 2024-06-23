library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux is
port(
	in0: in integer;
	in1: in integer;
	en: in std_logic;
	out1: out integer
);

end mux;

architecture behavior of mux is
	signal t_out : integer;
begin 
process(in1, in0, en)
begin
	if en = '0' then
	t_out <= in0;
	elsif t_out <= in1 then
	end if;
end process;
out1 <= t_out;
end behavior;