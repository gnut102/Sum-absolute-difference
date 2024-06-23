library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity img is
	port(
		clk: in std_logic;
		RE: in std_logic;
		WE: in std_logic;

		D_in: in integer;
		Addr: in integer;

		D_out: out integer
	);
end img;

architecture structural of img is
	type integer_array is array (0 to 15) of integer;
	signal D: integer_array;
	
begin 
	process (RE, WE, Addr, clk)
	variable i: integer:=0;
	begin 
	if (clk'event and clk = '1' and RE = '1') then
			D_out <= D(Addr);
			
	elsif (clk'event and clk = '1' and WE = '1') then 
			D(Addr) <= D_in;
	end if;
	end process;
end structural;