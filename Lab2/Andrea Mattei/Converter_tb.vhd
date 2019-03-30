library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Converter_tb is
end Converter_tb;

architecture Converter_tb_behaviour of Converter_tb is

    constant WAITING_TIME:time :=20 ns;

    signal sw_tb: unsigned(3 downto 0);
    signal HEX0_tb,HEX1_tb: STD_LOGIC_VECTOR(6 downto 0);

    component Converter
        port( sw : in unsigned(3 DOWNTO 0);
              HEX0,HEX1: OUT STD_LOGIC_VECTOR(6 downto 0));
    end component;

    begin 
    u: Converter port map(sw=>sw_tb,HEX0=>HEX0_tb,HEX1=>HEX1_tb);
    process
    begin
        for i in 0 to 15 loop --tests all the 16 possible input values
            sw_tb<=to_unsigned(i,sw_tb'length);
            wait for WAITING_TIME;
        end loop;
        wait;
    end process;
end Converter_tb_behaviour;