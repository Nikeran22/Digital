library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decimal_mux_tb is
end decimal_mux_tb;

architecture decimal_mux_tb_behaviour of decimal_mux_tb is
    
    constant WAITING_TIME:time :=20 ns;

    signal sel_tb: std_logic;
    signal figure_tb: std_logic_vector (6 downto 0);

    component decimal_mux
        port( sel: in std_logic;
            figure: out std_logic_vector (6 downto 0));
    end component;

    begin 
    u: decimal_mux port map(sel=>sel_tb, figure=>figure_tb);
    process
    begin
        sel_tb<='0';
        wait for WAITING_TIME;
        sel_tb<='1';
        wait for WAITING_TIME;
        wait;
    end process;
end decimal_mux_tb_behaviour;