library ieee;
use ieee.std_logic_1164.all;

entity LED_tb is
end LED_tb;

--simple testbench that tries every switch of the array
architecture LED_tb_behaviour of LED_tb is

    constant WAITING_TIME:time :=20 ns;

    signal SW_tb : STD_LOGIC_VECTOR(9 DOWNTO 0);
    signal LEDR_tb : STD_LOGIC_VECTOR(9 DOWNTO 0);

    component LED
        port( SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
              LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
    end component;

    begin 
    u: LED port map(SW=>SW_tb,LEDR=>LEDR_tb);
    process
    begin
        for i in 0 to 9 loop --tests all the 10 switches one by one
            SW_tb<="0000000000";
            SW_tb(i)<='1';
            wait for WAITING_TIME;
        end loop;
        wait;
    end process;
end LED_tb_behaviour;