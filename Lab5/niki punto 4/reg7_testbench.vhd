LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY reg7_testbench IS
END reg7_testbench;

ARCHITECTURE Behavior OF reg7_testbench IS
signal res: std_logic;
signal clock: std_logic;
signal inr, outr: std_logic_vector(6 downto 0);


component reg7 is 
port( 
resetn: in std_logic;
clockreg: in std_logic;
inreg: in std_logic_vector(6 downto 0);
outreg :out STD_LOGIC_VECTOR(6 downto 0));

end component;

BEGIN
dut: reg7 PORT MAP (res,clock,inr,outr);

PROCESS
BEGIN



res <='0';
clock<='0';
inr <="1111111";
WAIT FOR 20 ns;
res <='0';
clock<='1';
inr <="1111111";
WAIT FOR 20 ns;
res <='0';
clock<='0';
inr <="1111111";
WAIT FOR 20 ns;
res <='0';
clock<='1';
inr <="1111111";
WAIT FOR 20 ns;
-------------------------

res <='1';
clock<='0';
inr <="1111111";
WAIT FOR 20 ns;
res <='1';
clock<='1';
inr <="1111111";
WAIT FOR 20 ns;
res <='1';
clock<='0';
inr <="1111111";
WAIT FOR 20 ns;
res <='1';
clock<='1';
inr <="1111111";
WAIT FOR 20 ns;

------------------------


res <='1';
clock<='0';
inr <="1111000";
WAIT FOR 20 ns;
res <='1';
clock<='1';
inr <="1111000";
WAIT FOR 20 ns;
res <='1';
clock<='0';
inr <="1111000";
WAIT FOR 20 ns;
res <='1';
clock<='1';
inr <="1111000";
WAIT FOR 20 ns;

------------------------



res <='1';
clock<='0';
inr <="1001000";
WAIT FOR 20 ns;
res <='1';
clock<='1';
inr <="1001000";
WAIT FOR 20 ns;
res <='1';
clock<='0';
inr <="1001000";
WAIT FOR 20 ns;
res <='1';
clock<='1';
inr <="1001000";
WAIT FOR 20 ns;

------------------------








WAIT;
END PROCESS;



END Behavior;