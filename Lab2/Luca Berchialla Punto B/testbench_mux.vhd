
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_mux IS
END testbench_mux ;

ARCHITECTURE mytest OF testbench_mux IS
SIGNAL output_tb: STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL sel_tb: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL error: STD_LOGIC;

COMPONENT mux
PORT (  sel: IN STD_LOGIC_VECTOR(1 downto 0); 
output : OUT STD_LOGIC_VECTOR(14 downto 0)); 
END COMPONENT;
BEGIN

uut: mux PORT MAP (output=> output_tb,sel => sel_tb);


PROCESS
BEGIN
sel_tb<="00";

 WAIT FOR 200 ns;
sel_tb<="01";

WAIT FOR 200 ns;
sel_tb<="10";

 WAIT FOR 200 ns;
sel_tb<="11";

WAIT FOR 200 ns;
WAIT;
END PROCESS;
END mytest;
