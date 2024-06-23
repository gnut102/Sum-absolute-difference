library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

entity counter is
    Port (
        clk     : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        load    : in  STD_LOGIC;
        enable  : in  STD_LOGIC; 
		  cin		 : in  INTEGER;
        count   : out INTEGER
    );
end counter;

architecture Behavioral of counter is
    signal count_reg : INTEGER := 0;
begin
    process (clk, rst, load, enable, cin)
    begin
        if rst = '1' then
            count_reg <= 0;
        elsif rising_edge(clk) then
            if load = '1' then
                count_reg <= cin;
            elsif (enable = '1') then
                count_reg <= count_reg + 1;
            end if;
        end if;
    end process;
    count <= count_reg;
end Behavioral;

