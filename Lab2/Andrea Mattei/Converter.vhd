library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Converter is 
port( sw : in unsigned(3 DOWNTO 0);
      HEX0,HEX1: OUT STD_LOGIC_VECTOR(6 downto 0));
end Converter;

architecture Converter_behaviour of Converter is

    --the inner converter that performs the binary to decimal conversion
    component inner_converter
    port( v: in unsigned (3 downto 0);
          m: out std_logic_vector (3 downto 0);
          z: out std_logic);
    end component;

    component decimal_mux
        port( sel: in std_logic;
              figure: out std_logic_vector (6 downto 0));
    end component;

    component bcd_to_7s
        port( bcd: in std_logic_vector (3 downto 0);
              segments: out std_logic_vector (6 downto 0));
    end component;

    signal decimal_sel: std_logic;
    signal unit_bcd: std_logic_vector(3 downto 0);

    begin
    
    conv:inner_converter port map(v=>sw,m=>unit_bcd,z=>decimal_sel);
    mux:decimal_mux port map(sel=>decimal_sel,figure=>HEX1);
    unit_bcd_7s: bcd_to_7s port map(bcd=>unit_bcd,segments=>HEX0);

end Converter_behaviour;