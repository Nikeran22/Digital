library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit_tb is
end circuit_tb;

architecture circuit_tb_behaviour of circuit_tb is

    constant WAITING_TIME:time :=20 ns;

    component circuit is
        port(CLOCK_50:in std_logic;
            KEY:in std_logic_vector(0 downto 0);
            HEX0:out std_logic_vector(6 downto 0));
    end component;

    signal CLOCK_50_tb: std_logic;
    signal KEY_tb:std_logic_vector(0 downto 0);
    signal HEX0_tb : std_logic_vector(6 downto 0);

begin
    uut:circuit port map(CLOCK_50_tb,KEY_tb,HEX0_tb);
    process
    begin
        --reset
        KEY_tb(0)<='1';
        CLOCK_50_tb<='1';
        wait for WAITING_TIME;
        CLOCK_50_tb<='0';
        wait for WAITING_TIME;
        KEY_tb(0)<='0';
        for i in 0 to 60 loop
            CLOCK_50_tb<='1';
            wait for WAITING_TIME;
            CLOCK_50_tb<='0';
            wait for WAITING_TIME;
        end loop;
        wait;
    end process;
    
end architecture;