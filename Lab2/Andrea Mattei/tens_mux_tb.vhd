library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tens_mux_tb is
end tens_mux_tb;

architecture tens_mux_tb_behaviour of tens_mux_tb is
    
    constant WAITING_TIME:time :=20 ns;

    signal sel_tb: std_logic;
    signal digit_tb: std_logic_vector (6 downto 0);

    component tens_mux
        port( sel: in std_logic;
            digit: out std_logic_vector (6 downto 0));
    end component;

    begin 
    u: tens_mux port map(sel=>sel_tb, digit=>digit_tb);
    process
    begin
        sel_tb<='0';
        wait for WAITING_TIME;
        sel_tb<='1';
        wait for WAITING_TIME;
        wait;
    end process;
end tens_mux_tb_behaviour;