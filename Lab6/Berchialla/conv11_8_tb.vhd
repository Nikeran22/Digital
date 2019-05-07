-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;



ENTITY conv11_8_tb IS
END conv11_8_tb;

architecture behavior of conv11_8_tb is

		
		signal input: std_logic_vector(10 downto 0);
		signal output: std_logic_vector(7 downto 0);
		
component conv11_8 is
port(
		input: in std_logic_vector(10 downto 0);
		output: out std_logic_vector(7 downto 0));
end component;

BEGIN
dut: conv11_8 PORT MAP (input,output);


PROCESS
BEGIN

input<="11110010000";
wait for 10 ns;

input<="11101111110";
wait for 10 ns;

input<="00011111110";
wait for 10 ns;

input<="00001111100";
wait for 10 ns;


wait;


END PROCESS;

		
end behavior;
