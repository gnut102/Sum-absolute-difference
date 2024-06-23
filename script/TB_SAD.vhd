--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.numeric_std.all;
--
--
--
--entity TB_SAD is
--end TB_SAD;
--
--architecture Behavioral of TB_SAD is
--		signal clk: std_logic;
--		signal sad_rst: std_logic;
--		signal we_1: std_logic;
--		signal we_2: std_logic;
--		signal start: std_logic;
--		signal addr1: integer;
--		signal addr2: integer;
--		signal n: integer;
--		signal m: integer;
--		signal data_in1: integer;
--		signal data_in2: integer;
--		
--		signal done: std_logic;
--		signal data_out: integer;
--		signal sad_out : integer;
--
--
--
--	component sad is
--	port(
--		clk: in std_logic;
--		sad_rst: in std_logic;
--		we_1: in std_logic;
--		we_2: in std_logic;
--		start: in std_logic;
--		addr1: in integer;
--		addr2: in integer;
--		n: in integer;
--		m: in integer;
--		data_in1: in integer;
--		data_in2: in integer;
--		
--		done: out std_logic;
--		data_out: out integer;
--		sad_out : out integer
--		
--);
--	end component;
--    
--begin
--    uut: SAD Port Map (
--	 	clk => clk,
--		sad_rst => sad_rst,
--		we_1 => we_1,
--		we_2 => we_2,
--		start => start,
--		addr1 => addr1,
--		addr2 => addr2,
--		n => n,
--		m => m,
--		data_in1 => data_in1,
--		data_in2 => data_in2,
--		
--		done => done,
--		data_out => data_out,
--		sad_out => sad_out
--    );
--
--clock: process
--    begin
--        while true loop
--            clk <= '0';
--            wait for 5 ns;
--            clk <= '1';
--            wait for 5 ns;
--        end loop;
--end process;
--
--
--test: process
--begin
---- initial
--	sad_rst <= '0';
--	we_1 <= '0'; 
--	we_2 <= '0';
--	start <= '0';
--	addr1 <= 0;
--	addr2 <= 0;
--	n <= 0;
--	m <= 0;
--	data_in1 <= 0;
--	data_in2 <= 0;
--	wait for 10ns;
--	
---- test 1:
--	sad_rst <= '0';
--	n <= 3;
--	m <= 2;
--	we_1 <= '1';
--	we_2 <= '1';
--	addr1 <= 0;
--	addr2 <= 0;
--	data_in1 <= 1;
--	data_in2 <= 0;
--	
--	wait for 10ns;
--	
--	addr1 <= 1;
--	addr2 <= 1;
--	data_in1 <= 2;
--	data_in2 <= 1;
--	
--	wait for 10ns;
--
--	addr1 <= 2;
--	addr2 <= 2;
--	data_in1 <= 3;
--	data_in2 <= 2;
--	
--	wait for 10ns;	
--	
--	addr1 <= 3;
--	addr2 <= 3;
--	data_in1 <= 4;
--	data_in2 <= 3;
--
--	wait for 10ns;
--	
--	addr1 <= 4;
--	addr2 <= 4;
--	data_in1 <= 5;
--	data_in2 <= 4;
--
--	wait for 10ns;
--
--	addr1 <= 5;
--	addr2 <= 5;
--	data_in1 <= 6;
--	data_in2 <= 5;
--
--	wait for 10ns;
--	
--	start <= '1';
--	
--	wait for 2000ns;
--	
--	
--	
--end process;
--
--
--end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity tb_sad is 
end tb_sad;

architecture Behavioral of TB_SAD is

	signal clk: std_logic;
	signal re_1: std_logic;
	signal re_2: std_logic;
	signal re_3: std_logic;
	signal we_1: std_logic;
	signal we_2: std_logic;
	signal we_3: std_logic;
	signal ld_sad: std_logic;
	signal rst_sad: std_logic;
	signal en_i: std_logic;
	signal ld_i: std_logic;
	signal en_j: std_logic;
	signal ld_j: std_logic;
	signal m: integer;
	signal n: integer;
	signal data_in1: integer;
	signal data_in2: integer;
	signal addr1: integer;
	signal addr2: integer;
	signal comp_i: std_logic;
	signal comp_j: std_logic;
	signal data_out: integer;
	signal sad_out: integer;
	
	component sad
	port(
		clk: in std_logic;
		RE_1: in std_logic;
		RE_2: in std_logic;
		RE_3: in std_logic;
		WE_1: in std_logic;
		WE_2: in std_logic;
		WE_3: in std_logic;
		ld_sad: in std_logic;
		rst_sad: in std_logic;
		En_i: in std_logic;
		ld_i: in std_logic;
		En_j: in std_logic;
		ld_j: in std_logic;
		
		
		m: in integer;
		n: in integer;
		data_in1: in integer;
		data_in2: in integer;
		addr1: in integer;
		addr2: in integer;
		
		
		comp_i: out std_logic;
		comp_j: out std_logic;
		Data_out: out integer;
		SAD_out: out integer
		
);
	end component;
	
	begin
	uut : sad port map (
		clk => clk,
		RE_1 => re_1,
		RE_2 => re_2,
		RE_3 => re_3,
		WE_1 => we_1,
		WE_2 => we_2,
		WE_3 => we_3,
		ld_sad => ld_sad,
		rst_sad => rst_sad,
		En_i => en_i,
		ld_i => ld_i,
		En_j => en_j,
		ld_j => en_j,
		
		m => m,
		n => n,
		data_in1 => data_in1,
		data_in2 => data_in2,
		addr1 => addr1,
		addr2 => addr2,
		
		
		--output
		comp_i => comp_i,
		comp_j => comp_j,
		Data_out => data_out,
		SAD_out => sad_out
		
	);
	
	clock : process
	begin
		clk <= '1'; wait for 5ns;
		clk <= '0'; wait for 5ns;
	end process;
	
	test: process
	begin
	--init
		RE_1 <= '0';
		RE_2 <= '0';
		RE_3 <= '0';
		WE_1 <= '0';
		WE_2 <= '0';
		WE_3 <= '0';
		ld_sad <= '0';
		rst_sad <= '0';
		En_i <= '0';
		ld_i <= '0';
		En_j <= '0';
		ld_j <= '0';
		
		m <= 0;
		n <= 0;
		data_in1 <= 0;
		data_in2 <= 0;
		addr1 <= 0;
		addr2 <= 0;
	wait for 10ns;
	
	-- load data in
		n <= 3;
		m <= 2;
		we_1 <= '1';
		we_2 <= '1';
		addr1 <= 0;
		addr2 <= 0;
		data_in1 <= 1;
		data_in2 <= 0;
		
		wait for 10ns;
		
		addr1 <= 1;
		addr2 <= 1;
		data_in1 <= 2;
		data_in2 <= 1;
		
		wait for 10ns;

		addr1 <= 2;
		addr2 <= 2;
		data_in1 <= 3;
		data_in2 <= 2;
		
		wait for 10ns;	
		
		addr1 <= 3;
		addr2 <= 3;
		data_in1 <= 4;
		data_in2 <= 3;

		wait for 10ns;
		
		addr1 <= 4;
		addr2 <= 4;
		data_in1 <= 5;
		data_in2 <= 4;

		wait for 10ns;

		addr1 <= 5;
		addr2 <= 5;
		data_in1 <= 6;
		data_in2 <= 5;
		
		wait for 10ns;
		
		-- start = 1
		re_1 = '1'; re_2 = '1'; wait for 10ns;
		we_3 = '1'; wait for 10ns;
		ld_sad = '1'; wait for 10ns;
		en_j = '1'; wait for 10ns;
		
		wait for 1000ns;
	wait;
	end process;
	
	end behavioral;
	