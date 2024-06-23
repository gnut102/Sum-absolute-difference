library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;



entity TB_SAD is
end TB_SAD;

architecture Behavioral of TB_SAD is
		signal clk: std_logic;
		signal sad_rst: std_logic;
		signal we_1: std_logic;
		signal we_2: std_logic;
		signal start: std_logic;
		signal addr1: integer;
		signal addr2: integer;
		signal n: integer;
		signal m: integer;
		signal data_in1: integer;
		signal data_in2: integer;
		
		signal done: std_logic;
		signal data_out: integer;
		signal sad_out : integer;



	component sad is
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
	end component;
    
begin
    uut: SAD Port Map (
	 	clk => clk,
		sad_rst => sad_rst,
		we_1 => we_1,
		we_2 => we_2,
		start => start,
		addr1 => addr1,
		addr2 => addr2,
		n => n,
		m => m,
		data_in1 => data_in1,
		data_in2 => data_in2,
		
		done => done,
		data_out => data_out,
		sad_out => sad_out
    );

clock: process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
end process;


test: process
begin
-- initial
	sad_rst <= '0';
	we_1 <= '0'; 
	we_2 <= '0';
	start <= '0';
	addr1 <= 0;
	addr2 <= 0;
	n <= 0;
	m <= 0;
	data_in1 <= 0;
	data_in2 <= 0;
	wait for 10ns;
	
-- test 1:
	sad_rst <= '0';
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
	
	start <= '1';
	
	wait for 500ns;
	
-- test 2:
	start <= '0';
	sad_rst <= '0';
	n <= 3;
	m <= 3;
	we_1 <= '1';
	we_2 <= '1';
	addr1 <= 0;
	addr2 <= 0;
	data_in1 <= 1;
	data_in2 <= 0;
	
	wait for 10ns;
	
	addr1 <= 1;
	addr2 <= 1;
	data_in1 <= 3;
	data_in2 <= 1;
	
	wait for 10ns;

	addr1 <= 2;
	addr2 <= 2;
	data_in1 <= 5;
	data_in2 <= 2;
	
	wait for 10ns;	
	
	addr1 <= 3;
	addr2 <= 3;
	data_in1 <= 7;
	data_in2 <= 3;

	wait for 10ns;
	
	addr1 <= 4;
	addr2 <= 4;
	data_in1 <= 9;
	data_in2 <= 4;

	wait for 10ns;

	addr1 <= 5;
	addr2 <= 5;
	data_in1 <= 11;
	data_in2 <= 5;

	wait for 10ns;

	addr1 <= 6;
	addr2 <= 6;
	data_in1 <= 13;
	data_in2 <= 6;

	wait for 10ns;	

	addr1 <= 7;
	addr2 <= 7;
	data_in1 <= 15;
	data_in2 <= 7;

	wait for 10ns;

	addr1 <= 8;
	addr2 <= 8;
	data_in1 <= 17;
	data_in2 <= 8;

	wait for 10ns;

	start <= '1';
	
	wait for 2000ns;
	wait;
	
end process;


end Behavioral;






