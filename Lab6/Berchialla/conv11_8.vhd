library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	
entity conv11_8 is

port(
		input: in std_logic_vector(10 downto 0);
		output: out std_logic_vector(7 downto 0));
end conv11_8;

architecture Behav of conv11_8 is
signal max,min,inputs: signed(10 downto 0);
begin
max<="00001111111";
min<="11110000000";
inputs<=signed(input);

	output <= "01111111" when (inputs>=max) else
		  "10000000" when (inputs<=min) else 
		  std_logic_vector(resize(signed(input), output'length));

		  	
end Behav;
