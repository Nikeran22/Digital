library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--converters the input decimal numerical system digit encoded as a 4-bit binary number into the 7-segments encoding
entity bcd_to_7s is
    port( bcd: in std_logic_vector (3 downto 0);
          segments: out std_logic_vector (6 downto 0));
end bcd_to_7s;

architecture bcd_to_7s_behaviour of bcd_to_7s is
    begin
        with bcd select segments <=
            "1111001" when "0001",
            "0100100" when "0010",
            "0110000" when "0011",
            "0011001" when "0100",
            "0010010" when "0101",
            "0000010" when "0110",
            "1111000" when "0111",
            "0000000" when "1000",
            "0010000" when "1001",
            "1111111" when others; --in case of not valid input displays the blank character
end bcd_to_7s_behaviour;