library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity TB_img is
end TB_img;

architecture Behavioral of TB_img is
		signal clk:  std_logic;
		signal RE: std_logic;
		signal WE: std_logic;
		signal D_in:  integer;
		signal Addr:  integer;

		signal D_out:  integer;


	component img is
	Port (
		clk: in std_logic;
		RE: in std_logic;
		WE: in std_logic;
		D_in: in integer;
		Addr: in integer;

		D_out: out integer
    );
	end component;
    
begin
    uut: img Port Map (
	 	clk => clk,
		re => re,
		we => we,

		d_in => d_in,
		addr => addr,
		d_out => d_out
    );
process
	begin
		we <= '1';D_in <= 1; addr <=0; wait for 10ns;
		D_in <= 2; addr <=1; wait for 10ns;
		D_in <= 3; addr <=2; wait for 20ns;
		we <= '0'; wait for 10ns;
		re <= '1'; addr <= 1; wait for 20ns;
		addr <= 5; wait for 20ns;
		addr <= 3; wait for 20ns;
		addr <= 2; wait for 20ns;
		addr <= 1; wait for 20ns;

		wait;
end process;
process
	begin 
		clk <= '0'; wait for 5ns;
		clk <= '1'; wait for 5ns;
	end process;
end Behavioral;

