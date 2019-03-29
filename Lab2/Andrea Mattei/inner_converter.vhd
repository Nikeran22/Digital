library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inner_converter is
    port( v: in unsigned (3 downto 0);
          m: out std_logic_vector (3 downto 0);
          z: out std_logic);
end inner_converter;

architecture inner_converter_behaviour of inner_converter is
begin
    z <= '1' when v >= "1010" else '0';
    m <= std_logic_vector(v-"1010") when v >= "1010" else std_logic_vector(v);
end inner_converter_behaviour;