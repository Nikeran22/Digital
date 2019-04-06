-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


--key0 -> clock
--SW1 -> Enable
--SW0 ->Reset

ENTITY counter16_testbench IS
END counter16_testbench;

ARCHITECTURE Behavior OF counter16_testbench IS
signal clk, en, res : std_logic;
signal disp0, disp1, disp2, disp3 : std_logic_vector(6 downto 0);


component counter16
port		(SW1, KEY0, SW0: in STD_LOGIC;
 HEX0, HEX1, HEX2, HEX3 : out STD_LOGIC_VECTOR(6 downto 0)); 		
end component;

BEGIN
dut: counter16 PORT MAP (SW1=>en, KEY0=>clk, SW0=>res, HEX0 => disp0, HEX1 => disp1, HEX2 => disp2, HEX3 => disp3);

PROCESS
BEGIN


en<='1';
res<='1';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='1';
clk<='1';
WAIT FOR 20 ns;



en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
en<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;




WAIT;
END PROCESS;



END Behavior;