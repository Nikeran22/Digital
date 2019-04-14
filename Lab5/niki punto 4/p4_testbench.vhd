LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY p4_testbench IS
END p4_testbench;

ARCHITECTURE Behavior OF p4_testbench IS
signal res: std_logic_vector(0 downto 0);
signal clock: std_logic;
signal H0, H1, H2, H3, H4, H5 :  STD_LOGIC_VECTOR(6 downto 0);


component p4 is 
port( 
Key: in std_logic_vector(0 downto 0);  --resetn
clock_50: in std_logic;
HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out STD_LOGIC_VECTOR(6 downto 0));

end component;

BEGIN
dut: p4 PORT MAP (res,clock,H0, H1, H2, H3, H4, H5);

PROCESS
BEGIN



res <="0";
clock<='0';

WAIT FOR 20 ns;
res <="0";
clock<='1';

WAIT FOR 20 ns;
res <="0";
clock<='0';

WAIT FOR 20 ns;
res <="0";
clock<='1';

WAIT FOR 20 ns;
-------------------------

res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;

------------------------

res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;

res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;

------------------------

res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;

res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;

------------------------

res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;

res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;

------------------------

res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;
res <="1";
clock<='0';
WAIT FOR 20 ns;
res <="1";
clock<='1';
WAIT FOR 20 ns;





WAIT;
END PROCESS;



END Behavior;