-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;



ENTITY conv8_11_tb IS
END conv8_11_tb;

architecture behavior of conv8_11_tb is

		
		signal input: std_logic_vector(7 downto 0);
		signal output: std_logic_vector(10 downto 0);
		
component conv8_11 is
port(
		input: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(10 downto 0));
end component;

BEGIN
dut: conv8_11 PORT MAP (input,output);


PROCESS
BEGIN

input<="11111111";
wait for 10 ns;

input<="10000000";
wait for 10 ns;

input<="01111111";
wait for 10 ns;


wait;


END PROCESS;

		
end behavior;
