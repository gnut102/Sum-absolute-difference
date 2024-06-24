library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity tb_datapath is 
end tb_datapath;

architecture Behavioral of TB_datapath is

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
	
	
	--test
--	signal m1_test : integer; 
--	signal m2_test : integer;
--	signal m1_addr : integer;
--	signal m2_addr : integer;
--	signal sad_addr: integer;
--	signal tcount_j: integer;
	
	component datapath
	port(
		clk: in std_logic;
		RE_1: in std_logic;
		RE_2: in std_logic;
--		RE_3: in std_logic;
		WE_1: in std_logic;
		WE_2: in std_logic;
--		WE_3: in std_logic;
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
--		Data_out: out integer;
		SAD_out: out integer
		
		--test
--		m1_test: out integer;
--		m2_test: out integer;
--		m1_addr: out integer;
--		m2_addr: out integer;
--		sad_addr: out integer;
--		tcount_j: out integer
		
);
	end component;
	
	begin
	uut : datapath port map (
		clk => clk,
		RE_1 => re_1,
		RE_2 => re_2,
--		RE_3 => re_3,
		WE_1 => we_1,
		WE_2 => we_2,
--		WE_3 => we_3,
		ld_sad => ld_sad,
		rst_sad => rst_sad,
		En_i => en_i,
		ld_i => ld_i,
		En_j => en_j,
		ld_j => ld_j,
		
		m => m,
		n => n,
		data_in1 => data_in1,
		data_in2 => data_in2,
		addr1 => addr1,
		addr2 => addr2,
		
		
		--output
		comp_i => comp_i,
		comp_j => comp_j,
--		Data_out => data_out,
		SAD_out => sad_out
		
		--test
--		m1_test => m1_test,
--		m2_test => m2_test,
--		m1_addr => m1_addr,
--		m2_addr => m2_addr,
--		sad_addr => sad_addr,
--		tcount_j => tcount_j
		
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
		rst_sad <= '1';
		En_i <= '0';
		ld_i <= '1';
		En_j <= '0';
		ld_j <= '1';
		
		m <= 0;
		n <= 0;
		data_in1 <= 0;
		data_in2 <= 0;
		addr1 <= 0;
		addr2 <= 0;

		wait for 10ns;
	
	-- load data in
		ld_i <= '0';
		ld_j <= '0';
		rst_sad <= '0';
		n <= 3;
		m <= 2;

		
		wait for 10ns;
		we_1 <= '1';
		we_2 <= '1';		
		data_in1 <= 1;
		data_in2 <= 0;
		addr1 <= 0;
		addr2 <= 0;
		
		wait for 10ns;
		data_in1 <= 1;
		data_in2 <= 0;
		addr1 <= 1;
		addr2 <= 1;
		
		wait for 10ns;
		

		data_in1 <= 2;
		data_in2 <= 1;
		addr1 <= 2;
		addr2 <= 2;
		
		wait for 10ns;


		data_in1 <= 4;
		data_in2 <= 2;
		addr1 <= 3;
		addr2 <= 3;	
		
		wait for 10ns;	
		

		data_in1 <= 6;
		data_in2 <= 3;
		addr1 <= 4;
		addr2 <= 4;
		
		wait for 10ns;
		

		data_in1 <= 8;
		data_in2 <= 4;
		addr1 <= 5;
		addr2 <= 5;

		wait for 10ns;


		data_in1 <= 10;
		data_in2 <= 5;
		addr1 <= 6;
		addr2 <= 6;
		
		wait for 10ns;
		
		
		we_1 <= '0';
		we_2 <= '0';
		wait for 10ns;
		
		-- start = 1
		--loop0
		re_1 <= '1'; re_2 <= '1'; wait for 10ns;
		re_1 <= '0'; re_2 <= '0'; we_3 <= '1'; wait for 10ns;
		we_3 <= '0'; ld_sad <= '1'; wait for 10ns;
		ld_sad <= '0'; en_j <= '1'; wait for 10ns;

		--loop1
		en_j <= '0'; re_1 <= '1'; re_2 <= '1'; wait for 10ns;
		re_1 <= '0'; re_2 <= '0'; we_3 <= '1'; wait for 10ns;
		we_3 <= '0'; ld_sad <= '1'; wait for 10ns;
		ld_sad <= '0'; en_j <= '1'; wait for 10ns;
		
		--loop2
		en_j <= '0'; re_1 <= '1'; re_2 <= '1'; wait for 10ns;
		re_1 <= '0'; re_2 <= '0'; we_3 <= '1'; wait for 10ns;
		we_3 <= '0'; ld_sad <= '1'; wait for 10ns;
		ld_sad <= '0'; en_j <= '1'; wait for 10ns;
		
		
		--loop3
		en_j <= '0'; re_1 <= '1'; re_2 <= '1'; wait for 10ns;
		re_1 <= '0'; re_2 <= '0'; we_3 <= '1'; wait for 10ns;
		we_3 <= '0'; ld_sad <= '1'; wait for 10ns;
		ld_sad <= '0'; en_j <= '1'; wait for 10ns;
		
		--loop4
		en_j <= '0'; re_1 <= '1'; re_2 <= '1'; wait for 10ns;
		re_1 <= '0'; re_2 <= '0'; we_3 <= '1'; wait for 10ns;
		we_3 <= '0'; ld_sad <= '1'; wait for 10ns;
		ld_sad <= '0'; en_j <= '1'; wait for 10ns;
		
		--loop5
		en_j <= '0'; re_1 <= '1'; re_2 <= '1'; wait for 10ns;
		re_1 <= '0'; re_2 <= '0'; we_3 <= '1'; wait for 10ns;
		we_3 <= '0'; ld_sad <= '1'; wait for 10ns;
		ld_sad <= '0'; en_j <= '1'; wait for 10ns;
		
		--loop6
		en_j <= '0'; re_1 <= '1'; re_2 <= '1'; wait for 10ns;
		re_1 <= '0'; re_2 <= '0'; we_3 <= '1'; wait for 10ns;
		we_3 <= '0'; ld_sad <= '1'; wait for 10ns;
		ld_sad <= '0'; en_j <= '1'; en_i <= '1'; wait for 10ns;
		wait for 1000ns;
	wait;
	end process;
	
	end behavioral;