library ieee;
use ieee.numeric_std.all;
entity conv8_11 is

port(
		input: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(10 downto 0));
end prova;

architecture Behav of conv8_11 is
    signal s8  : std_logic_vector( 7 downto 0);
    signal s11 : std_logic_vector(10 downto 0);
begin
    s11 <= std_logic_vector(resize(signed(s8), s11'length));
end Behav;
