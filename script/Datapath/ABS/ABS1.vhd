library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity ABS1 is
	port(
	in1 : in integer;
	in2 : in integer;
	out1 : out integer
	);
	end ABS1;
architecture structural of ABS1 is
begin
	process(in1, in2)
	begin
		if in1<in2 then 
			out1 <= in2 - in1;
		else out1 <= in1 - in2;
		end if;
	end process;
end structural;