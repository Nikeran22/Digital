library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity conv8_11 is

port(
		input: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(10 downto 0));
end conv8_11;

architecture Behav of conv8_11 is
   
begin
    output <= std_logic_vector(resize(signed(input), output'length));
end Behav;
