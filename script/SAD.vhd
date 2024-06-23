library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity sad is
	port(
		clk: in std_logic;
		sad_rst: in std_logic;
		we_1: in std_logic;
		we_2: in std_logic;
		start: in std_logic;
		addr1: in integer;
		addr2: in integer;
		n: in integer;
		m: in integer;
		data_in1: in integer;
		data_in2: in integer;
		
		done: out std_logic;
		data_out: out integer;
		sad_out : out integer
		
);
end sad;

architecture structural of sad is
	signal re_1, re_2, re_3, we_3, ld_sad, rst_sad, en_i, ld_i, en_j, ld_j : std_logic;
	signal comp_i, comp_j : std_logic;


component datapath is
	port (
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
	
	
component control is 
port (
		clk : in std_logic;
		sad_rst : in std_logic;
		start	: in std_logic;
		comp_i	: in std_logic;
		comp_j	: in std_logic;
		
		done	: out std_logic;
		re_1	: out std_logic;
		re_2	: out std_logic;
		re_3	: out std_logic;
		we_3	: out std_logic;
		ld_sad	: out std_logic;
		rst_sad	: out std_logic;
		en_i	: out std_logic;
		ld_i	: out std_logic;
		en_j	: out std_logic;
		ld_j	: out std_logic
);
end component;

begin 
sad_datapath : datapath port map (
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
		ld_j => ld_j,
		
		
		m => m,
		n => n,
		data_in1 => data_in1,
		data_in2 => data_in2,
		addr1 => addr1,
		addr2 => addr2,
		
		
		comp_i => comp_i,
		comp_j => comp_j,
		Data_out => data_out,
		SAD_out => sad_out
);

sad_control : control port map (
		clk => clk,
		sad_rst => sad_rst,
		start	=> start,
		comp_i => comp_i,
		comp_j => comp_j,
		
		done => done,
		re_1 => re_1,
		re_2 => re_2,
		re_3 => re_3,
		we_3 => we_3,
		ld_sad => ld_sad,
		rst_sad => rst_sad,
		en_i => en_i,
		ld_i => ld_i,
		en_j => en_j,
		ld_j => ld_j
);

end structural;









