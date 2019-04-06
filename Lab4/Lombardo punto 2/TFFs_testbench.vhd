-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


--key0 -> clock
--SW1 -> Enable
--SW0 ->Reset

ENTITY TFFs_testbench IS
END TFFs_testbench;

ARCHITECTURE Behavior OF TFFs_testbench IS
signal clk, tin, res : std_logic;
signal outp : std_logic;


component TFFs
port		(t, clockk, clearr: in STD_LOGIC;
 q : out STD_LOGIC); 		
end component;

BEGIN
dut: TFFs PORT MAP (t => tin, clockk => clk, clearr => res, q => outp);

PROCESS
BEGIN




tin<='1';
res<='1';
clk<='0';
WAIT FOR 20 ns;
tin<='1';
res<='1';
clk<='1';
WAIT FOR 20 ns;

tin<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
tin<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;

tin<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
tin<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;

tin<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
tin<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;

tin<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
tin<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;


tin<='1';
res<='1';
clk<='0';
WAIT FOR 20 ns;
tin<='1';
res<='1';
clk<='1';
WAIT FOR 20 ns;


tin<='0';
res<='1';
clk<='0';
WAIT FOR 20 ns;
tin<='0';
res<='1';
clk<='1';
WAIT FOR 20 ns;



WAIT;
END PROCESS;



END Behavior;
