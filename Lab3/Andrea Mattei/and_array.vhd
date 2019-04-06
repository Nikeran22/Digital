library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity and_array is
    port( a:in std_logic_vector(3 downto 0);
          b:in std_logic;
          result:out std_logic_vector(3 downto 0));
end and_array;

architecture and_array_behaviour of and_array is
    begin
        result(0)<=(a(0) and b);
        result(1)<=(a(1) and b);
        result(2)<=(a(2) and b);
        result(3)<=(a(3) and b);
end and_array_behaviour;