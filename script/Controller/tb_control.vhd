library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity TB_control is
end TB_control;

architecture Behavioral of TB_control is

		signal clk		: std_logic;
		signal sad_rst : std_logic;
		signal start	: std_logic;
		signal comp_i	: std_logic;
		signal comp_j	: std_logic;
		
		signal done : std_logic;
		signal re_1 : std_logic;
		signal re_2 : std_logic;
		signal re_3 : std_logic;
		signal we_3 : std_logic;
		signal ld_sad : std_logic;
		signal rst_sad : std_logic;
		signal en_i : std_logic;
		signal ld_i : std_logic;
		signal en_j : std_logic;
		signal ld_j : std_logic;


	component control is
	Port (
		clk : in std_logic;
		sad_rst : in std_logic;
		start	: in std_logic;
		comp_i	: in std_logic;
		comp_j	: in std_logic;
		
		done	: out std_logic;
		re_1	: out std_logic;
		re_2	: out std_logic;
--		re_3	: out std_logic;
--		we_3	: out std_logic;
		ld_sad	: out std_logic;
		rst_sad	: out std_logic;
		en_i	: out std_logic;
		ld_i	: out std_logic;
		en_j	: out std_logic;
		ld_j	: out std_logic
    );
	end component;
    
begin
    uut: control Port Map (
		clk => clk,
		sad_rst => sad_rst,
		start	=> start,
		comp_i => comp_i,
		comp_j => comp_j,

		done => done,
		re_1 => re_1,
		re_2 => re_2,
--		re_3 => re_3,
--		we_3 => we_3,
		ld_sad => ld_sad,
		rst_sad => rst_sad,
		en_i => en_i,
		ld_i => ld_i,
		en_j => en_j,
		ld_j => ld_j
    );
	process
	begin
		sad_rst <= '1'; wait for 10ns;
		sad_rst <= '0'; wait for 10ns;
		start <= '1'; wait for 10ns;
		
		comp_i <= '0'; wait for 10ns;
		comp_j <= '0'; wait for 10ns;
		
	wait;
	end process;
	process
	begin 
		clk <= '0'; wait for 5ns;
		clk <= '1'; wait for 5ns;
	end process;
end Behavioral;

