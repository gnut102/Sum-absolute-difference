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
	process (clk)
	begin 
	if (clk ='1' and clk'event and RE = '1') then
			D_out <= D(Addr);
			
	elsif (clk = '1' and clk'event and WE = '1') then 
			D(Addr) <= D_in;
	end if;
	end process;
end structural;





--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.numeric_std.all;
--
--entity tb_img is
--end tb_img;
--
--architecture behavioral of tb_img is
--signal clk: std_logic;
--signal rst: std_logic;
--signal load: std_logic;
--signal enable: std_logic;
--signal cin: integer;
--signal count:integer;
--	component img
--	Port (
--        clk     : in  STD_LOGIC;
--        rst     : in  STD_LOGIC;
--        load    : in  STD_LOGIC;
--        enable  : in  STD_LOGIC; 
--		  cin		 : in  INTEGER;
--        count   : out INTEGER
--    );
--	 end component;
--begin
--uut: img port map(
--	clk => clk,
--	rst => rst,
--	load => load,
--	enable => enable, 
--	cin => cin,
--	count => count
--);
--
--clock: process
--begin 
--clk <= '1'; wait for 5ns;
--clk <= '0'; wait for 5ns;
--end process;
--
--process
--begin
--cin <= 0;
--enable <= '1';
--wait for 10ns;
--
--end process;
--
--end behavioral;
