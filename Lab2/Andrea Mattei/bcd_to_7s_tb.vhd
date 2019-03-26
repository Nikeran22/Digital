library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_to_7s_tb is
end bcd_to_7s_tb;

architecture bcd_to_7s_tb_behaviour of bcd_to_7s_tb is
    
    constant WAITING_TIME:time :=20 ns;

    signal bcd_tb: std_logic_vector (3 downto 0);
    signal segments_tb: std_logic_vector (6 downto 0);

    component bcd_to_7s
        port( bcd: in std_logic_vector (3 downto 0);
            segments: out std_logic_vector (6 downto 0));
    end component;

    begin 
    u: bcd_to_7s port map(segments=>segments_tb, bcd=>bcd_tb);
    process
    begin
        for i in 0 to 10 loop --tests all the 16 possible values
            bcd_tb <= std_logic_vector(to_unsigned(i,4));
            wait for WAITING_TIME;
        end loop;
        wait;
    end process;
end bcd_to_7s_tb_behaviour;