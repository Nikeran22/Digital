-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;



ENTITY counter_1024_tb IS
END counter_1024_tb;

architecture behavior of counter_1024_tb is

		signal clk,count_up,count_down,en,clear: std_logic;
		signal count: unsigned(9 downto 0);
		
component counter_1024 is
port(
		clk,count_up,count_down,en,clear: in std_logic;
		count: out unsigned(9 downto 0));
end component;

BEGIN
dut: counter_1024 PORT MAP (clk, count_up, count_down, en,clear,count);
PROCESS
BEGIN


----------------------------------
clk<='0';
count_up<='0';
count_down<='0';
en<='1';
clear<='1';
WAIT FOR 20 ns;
----------------------------------
----------------------------------
clk<='1';
count_up<='0';
count_down<='0';
en<='1';
clear<='0';
WAIT FOR 20 ns;
----------------------------------

----------------------------------
clk<='0';
count_up<='1';
count_down<='0';
en<='1';
clear<='0';
WAIT FOR 20 ns;
----------------------------------
----------------------------------
clk<='1';
count_up<='1';
count_down<='0';
en<='1';
clear<='0';
WAIT FOR 20 ns;
----------------------------------

----------------------------------
clk<='0';
count_up<='1';
count_down<='0';
en<='1';
clear<='0';
WAIT FOR 20 ns;
----------------------------------
----------------------------------
clk<='1';
count_up<='1';
count_down<='0';
en<='1';
clear<='0';
WAIT FOR 20 ns;
----------------------------------

----------------------------------
clk<='0';
count_up<='1';
count_down<='0';
en<='1';
clear<='0';
WAIT FOR 20 ns;
----------------------------------
----------------------------------
clk<='1';
count_up<='1';
count_down<='0';
en<='1';
clear<='0';
WAIT FOR 20 ns;
----------------------------------

----------------------------------
clk<='0';
count_up<='0';
count_down<='1';
en<='1';
clear<='0';
WAIT FOR 20 ns;
----------------------------------
----------------------------------
clk<='1';
count_up<='0';
count_down<='1';
en<='1';
clear<='0';
WAIT FOR 20 ns;
----------------------------------

----------------------------------
clk<='0';
count_up<='0';
count_down<='1';
en<='1';
clear<='1';
WAIT FOR 20 ns;
----------------------------------

----------------------------------
clk<='0';
count_up<='0';
count_down<='1';
en<='1';
clear<='1';
WAIT FOR 20 ns;
----------------------------------





WAIT;
END PROCESS;

		
end behavior;
