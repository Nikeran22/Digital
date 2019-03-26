library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_to_7s is
    port( bcd: in std_logic_vector (3 downto 0);
          segments: out std_logic_vector (6 downto 0));
end bcd_to_7s;

architecture bcd_to_7s_behaviour of bcd_to_7s is
    begin
        convert: process (bcd)
        begin
            case bcd is
                when "0000" => segments <= "1000000";
                when "0001" => segments <= "1111001";
                when "0010" => segments <= "0100100";
                when "0011" => segments <= "0110000";
                when "0100" => segments <= "0011001";
                when "0101" => segments <= "0010010";
                when "0110" => segments <= "0000010";
                when "0111" => segments <= "1111000";
                when "1000" => segments <= "0000000";
                when "1001" => segments <= "0010000";
                when others => segments <= "1111111";
            end case;
        end process convert;
end bcd_to_7s_behaviour;