-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;



ENTITY counter_10_tb IS
END counter_10_tb;

architecture behavior of counter_10_tb is

		signal Clock,Reset,up,down,Load,tc: std_logic;
		signal counter,parallel_input: std_logic_vector(9 downto 0);
		
component counter10 is
port(
		CK,Reset,Load,up,down: in STD_LOGIC;
Input: in STD_LOGIC_VECTOR(9 downto 0);
tc: out STD_LOGIC;
Q: out STD_LOGIC_VECTOR(9 downto 0));
end component;

BEGIN
dut: counter10 PORT MAP (Clock,reset,load,up,down,parallel_input,tc,counter);

ck: Process(CLOCK) -- clock generation 
begin
if (CLOCK='U') then
CLOCK<='0';
else
CLOCK<=not(CLOCK) after 5 ns;
end if;
end process;

PROCESS
BEGIN

reset<='1';
load<='0';
up<='0';
down<='0';
parallel_input<="1111111100";
wait for 10 ns;

reset<='0';
load<='0';
up<='0';
down<='1';
parallel_input<="1111111100";
wait for 50 ns;

reset<='0';
load<='1';
up<='0';
down<='0';
parallel_input<="1111111100";
wait for 10 ns;

reset<='0';
load<='0';
up<='1';
down<='0';
parallel_input<="1111111100";
wait for 50 ns;
wait;


END PROCESS;

		
end behavior;
