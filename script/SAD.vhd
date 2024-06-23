--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.numeric_std.all;
--
--entity sad is
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
--end sad;
--
--architecture structural of sad is
--	signal re_1, re_2, re_3, we_3, ld_sad, rst_sad, en_i, ld_i, en_j, ld_j : std_logic;
--	signal comp_i, comp_j : std_logic;
--
--
--component datapath is
--	port (
--		clk: in std_logic;
--		RE_1: in std_logic;
--		RE_2: in std_logic;
--		RE_3: in std_logic;
--		WE_1: in std_logic;
--		WE_2: in std_logic;
--		WE_3: in std_logic;
--		ld_sad: in std_logic;
--		rst_sad: in std_logic;
--		En_i: in std_logic;
--		ld_i: in std_logic;
--		En_j: in std_logic;
--		ld_j: in std_logic;
--		
--		
--		m: in integer;
--		n: in integer;
--		data_in1: in integer;
--		data_in2: in integer;
--		addr1: in integer;
--		addr2: in integer;
--		
--		
--		comp_i: out std_logic;
--		comp_j: out std_logic;
--		Data_out: out integer;
--		SAD_out: out integer
--	);
--	end component;
--	
--	
--component control is 
--port (
--		clk : in std_logic;
--		sad_rst : in std_logic;
--		start	: in std_logic;
--		comp_i	: in std_logic;
--		comp_j	: in std_logic;
--		
--		done	: out std_logic;
--		re_1	: out std_logic;
--		re_2	: out std_logic;
--		re_3	: out std_logic;
--		we_3	: out std_logic;
--		ld_sad	: out std_logic;
--		rst_sad	: out std_logic;
--		en_i	: out std_logic;
--		ld_i	: out std_logic;
--		en_j	: out std_logic;
--		ld_j	: out std_logic
--);
--end component;
--
--begin 
--sad_datapath : datapath port map (
--		clk => clk,
--		RE_1 => re_1,
--		RE_2 => re_2,
--		RE_3 => re_3,
--		WE_1 => we_1,
--		WE_2 => we_2,
--		WE_3 => we_3,
--		ld_sad => ld_sad,
--		rst_sad => rst_sad,
--		En_i => en_i,
--		ld_i => ld_i,
--		En_j => en_j,
--		ld_j => ld_j,
--		
--		
--		m => m,
--		n => n,
--		data_in1 => data_in1,
--		data_in2 => data_in2,
--		addr1 => addr1,
--		addr2 => addr2,
--		
--		
--		comp_i => comp_i,
--		comp_j => comp_j,
--		Data_out => data_out,
--		SAD_out => sad_out
--);
--
--sad_control : control port map (
--		clk => clk,
--		sad_rst => sad_rst,
--		start	=> start,
--		comp_i => comp_i,
--		comp_j => comp_j,
--		
--		done => done,
--		re_1 => re_1,
--		re_2 => re_2,
--		re_3 => re_3,
--		we_3 => we_3,
--		ld_sad => ld_sad,
--		rst_sad => rst_sad,
--		en_i => en_i,
--		ld_i => ld_i,
--		en_j => en_j,
--		ld_j => ld_j
--);
--
--end structural;







library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity datapath is
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
end datapath;

architecture structural of datapath is
	signal d_out1, d_out2, d_out3, abs_out: integer;
	signal count_i, count_j : integer;
	signal sad_maddr: integer;
	signal ad_value, sad_value: integer;
	signal maddr1, maddr2: integer;

	
	
	
-- memory
	component img is
	port(
		clk: in std_logic;
		RE: in std_logic;
		WE: in std_logic;
		D_in: in integer;
		Addr: in integer;

		D_out: out integer
	);
	end component;
	
	
	
-- abs
	component ABS1 is
	port(
	in1 : in integer;
	in2 : in integer;
	out1 : out integer
	);
	end component;
	
	
	
--counter	
	component counter is
	    Port (
        clk     : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        load    : in  STD_LOGIC;
        enable  : in  STD_LOGIC; 
		  cin		 : in  INTEGER;
        count   : out INTEGER
    );
	 end component;

--compare 
	component compare is 
		port(
			in1: in integer;
			in2: in integer;
			comp: out std_logic
		);
		end component;

	
-- mux
	component mux is
	port(
	in0: in integer;
	in1: in integer;
	en: in std_logic;
	out1: out integer
	);
	end component;
	 
	
begin 
-- mem1
	 img1: img port map(
		clk => clk,
		RE => RE_1,
		WE => WE_1, 
		D_in => data_in1,
		Addr => maddr1,
		D_out => d_out1
	 );
	 


--mem2
	 img2: img port map(
		clk => clk,
		RE => RE_2,
		WE => WE_1, 
		D_in => data_in2,
		Addr => maddr2,
		D_out => d_out2
	 );
	 
	 
--mem3
	 sad_m: img port map(
		clk => clk,
		RE => RE_3,
		WE => WE_3, 
		D_in => abs_out,
		Addr => sad_maddr,
		D_out => data_out
	 );

	 
--abs
	 zabs: abs1 port map(
		in1 => d_out1,
		in2 => d_out2,
		out1 => abs_out
	 );
	 
	 
	 
--count_i
	 counter_i : counter port map (
		clk => clk,
		rst => rst_sad,
		load => ld_i,
		enable => en_i,
		cin => 0,
		count => count_i
	 );
	 
--count_j
	 counter_j : counter port map (
		clk => clk,
		rst => rst_sad,
		load => ld_j,
		enable => en_j,
		cin => 0,
		count => count_j
	 );
	 
	 
-- sad_register 
	 sad_reg: counter port map (
		clk => clk,
		rst => rst_sad,
		load => ld_sad,
		enable => '0',
		cin => ad_value,
		count => sad_value
	 );



-- compare i
	compare_i : compare port map(
		in1 => count_i,
		in2 => m,
		comp => comp_i 
	);

-- compare i
	compare_j : compare port map(
		in1 => count_j,
		in2 => m,
		comp => comp_j  
	);
	

	
-- mux0
	mux1 : mux port map(
		in0 => sad_maddr,
		in1 => addr1,
		en => WE_1,
		out1 => maddr1
	);
	
-- mux1
	mux2 : mux port map(
		in0 => sad_maddr,
		in1 => addr2,
		en => WE_2,
		out1 => maddr2
	);
	
	
-- sad_addr
	sad_maddr <= n*count_i + count_j;

-- sad value: 
	sad_out <= sad_value;
	ad_value <= sad_value + abs_out;

end structural;