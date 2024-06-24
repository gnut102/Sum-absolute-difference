library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control is
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
end control;

architecture Behavioral of control is

type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11);
signal state: state_type;


begin 
	process(clk, sad_rst, start, comp_i, comp_j)
	
	begin
	
		if sad_rst = '1' then 
			state <= s0;
		elsif (clk'event and clk = '1') then
			case state is 
				when s0 => 
					state <= s1;
				when s1 =>
					if(start = '1') then 
						state <= s2;
					else 
						state <= s1;
						end if;
				when s2 =>
					state <= s3;
				when s3 => 
					if comp_i = '0' then 
						state <= s4;
					else state <= s9;
					end if;
				when s4 => 
					if comp_j = '0' then 
						state <= s5;
					else state <= s8;
					end if;
				when s5 => 
					state <= s6;
				when s6 => 
					state <= s7;
				when s7 => 
					state <= s4;
				when s8 => 
					state <= s3;
				when s9 => 
					state <= s10;
				when s10 => 
					if(start = '0') then 
						state <= s11;
					else state <= s10;
					end if;
				when others => state <= s0;
			end case;
		
		end if;
	end process;
	
	done <= '1' when state = s9 else '0';
	re_1 <= '1' when state = s5 else '0';
	re_2 <= '1' when state = s5 else '0';
--	re_3 <= '1' when state = s10 else '0';
--	we_3 <= '1' when state = s6 else '0';
	ld_sad <= '1' when state = s6 else '0';
	rst_sad	<= '1' when (state = s2 or state = s0) else '0';
	en_i	<= '1' when state = s8 else '0';
	ld_i	<= '1' when (state = s2 or state = s0) else '0';
	en_j	<= '1' when state = s7 else '0';
	ld_j	<= '1' when (state = s8 or state = s2 or state = s0) else '0';


end behavioral;