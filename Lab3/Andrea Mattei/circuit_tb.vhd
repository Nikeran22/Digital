library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit_tb is
end circuit_tb;

architecture circuit_tb_behaviour of circuit_tb is

    constant WAITING_TIME:time :=20 ns;

    component circuit is
        port(SW:in std_logic_vector(7 downto 0);
        HEX0,HEX1,HEX2,HEX3 : out std_logic_vector(6 downto 0));
    end component;

    signal SW_tb:std_logic_vector(7 downto 0);
    signal HEX0_tb,HEX1_tb,HEX2_tb,HEX3_tb : std_logic_vector(6 downto 0);

begin
    uut:circuit port map(sw_tb,HEX0_tb,HEX1_tb,HEX2_tb,HEX3_tb);
    process
    begin
        for i in 0 to 15 loop
            sw_tb(3 downto 0)<=std_logic_vector(to_unsigned(i,4));
            for j in 0 to 15 loop
                sw_tb(7 downto 4)<=std_logic_vector(to_unsigned(j,4));
                wait for WAITING_TIME;
            end loop;
        end loop;
        WAIT;
    end process;
    
end architecture;