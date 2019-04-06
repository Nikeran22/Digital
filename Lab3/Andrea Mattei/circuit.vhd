library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit is 
    port(SW:in std_logic_vector(7 downto 0);
        HEX0,HEX1,HEX2,HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
end circuit;

architecture circuit_behaviour of circuit is

    component decoder7HEX is
        port(a : in std_logic_vector(3 downto 0);  
            Display : out std_logic_vector(6 downto 0));     
    end component;

    component multiplier is
        port( a:in std_logic_vector(3 downto 0);
              b:in std_logic_vector(3 downto 0);
              result: out std_logic_vector(7 downto 0));
    end component;

    signal multiplier_output: std_logic_vector(7 downto 0);

begin

    multiplier_circuit:multiplier port map(SW(3 downto 0),SW(7 downto 4),multiplier_output);
    decoder1:decoder7HEX port map(SW(3 downto 0),HEX0);
    decoder2:decoder7HEX port map(SW(7 downto 4),HEX1);
    decoder4:decoder7HEX port map(multiplier_output(7 downto 4),HEX3);
    decoder3:decoder7HEX port map(multiplier_output(3 downto 0),HEX2);

end circuit_behaviour ; 