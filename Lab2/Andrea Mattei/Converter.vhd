library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter is
    port( v: in unsigned (3 downto 0);
          m: out std_logic_vector (3 downto 0);
          z: out std_logic);
end converter;

architecture converter_behaviour of converter is
    signal difference:std_logic_vector(3 downto 0);
begin
    convert: PROCESS (v)
    BEGIN
        IF v >= "1010" THEN 
        z <= '1';
        m <= (v-"1010");
        ELSE 
        z <= '0';
        m <= v;
        END IF;
    END PROCESS convert;
end converter_behaviour;