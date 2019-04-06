-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench_SRlatch IS
END testbench_SRlatch;

ARCHITECTURE Behavior OF testbench_SRlatch IS
signal clkt, rt, st, qt : std_logic;

component SRlatch
port		(Clk, R, S : IN STD_LOGIC;  
	Q : OUT STD_LOGIC); 		
end component;

BEGIN
dut: SRlatch PORT MAP (Clk=>clkt, R=>rt, S=>st, Q=>qt);

PROCESS
BEGIN
--set--
clkt <= '1';
st <= '1';
rt <= '0';
WAIT FOR 20 ns;
-------
--memory--
clkt <= '1';
st <= '0';
rt <= '0';
WAIT FOR 20 ns;
-------
--enable off--
clkt <= '0';
st <= '0';
rt <= '0';
WAIT FOR 20 ns;
clkt <= '0';
st <= '1';
rt <= '0';
WAIT FOR 20 ns;
clkt <= '0';
st <= '0';
rt <= '1';
WAIT FOR 20 ns;
clkt <= '0';
st <= '1';
rt <= '1';
WAIT FOR 20 ns;
--------------
--reset------
clkt <= '1';
st <= '0';
rt <= '1';
WAIT FOR 20 ns;
--------------
--undefined--
clkt <= '1';
st <= '1';
rt <= '1';
WAIT FOR 20 ns;
--------------

WAIT;
END PROCESS;



END Behavior;