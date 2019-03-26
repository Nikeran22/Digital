library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inner_converter_tb is
end inner_converter_tb;

architecture inner_converter_tb_behaviour of inner_converter_tb is

    constant WAITING_TIME:time :=20 ns;

    signal v_tb: unsigned (3 downto 0);
    signal z_tb:std_logic;
    signal m_tb:std_logic_vector (3 downto 0);


    component inner_converter
        port( v: in unsigned (3 downto 0);
              m: out std_logic_vector (3 downto 0);
              z: out std_logic);
    end component;

    begin 
    u: inner_converter port map(v=>v_tb,z=>z_tb,m=>m_tb);
    process
    begin
        for i in 0 to 15 loop --tests all the 16 possible values
            v_tb<=to_unsigned(i,v_tb'length);
            wait for WAITING_TIME;
        end loop;
        wait;
    end process;
end inner_converter_tb_behaviour;