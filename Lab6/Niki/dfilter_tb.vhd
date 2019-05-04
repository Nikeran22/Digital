-- library declaration
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;


ENTITY dfilter_tb IS
END dfilter_tb;

ARCHITECTURE Behavior OF dfilter_tb IS

signal clk, start:  std_logic;
		signal D_IN:  std_logic_vector(7 downto 0);
		signal D_OUT: std_logic_vector(7 downto 0);
		signal done: std_logic;

component dfilter is
Port(
		clk, start: in std_logic;
		D_IN: in std_logic_vector(7 downto 0);
		D_OUT: out std_logic_vector(7 downto 0);
		done: out std_logic);
end component;

BEGIN
dut: dfilter PORT MAP (clk, start, D_in,D_out, done);

PROCESS
BEGIN

clk<='0';
start<='1';
clk<='1';
start<='1';


for cnt_val in 0 to 1023 loop

D_in<=std_logic_vector(to_unsigned(cnt_val, 8));
clk<='0';
WAIT FOR 20 ns;
clk<='1';
WAIT FOR 20 ns;

end loop;







WAIT;
END PROCESS;



END Behavior;