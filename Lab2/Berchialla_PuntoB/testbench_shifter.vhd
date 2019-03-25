
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_shifter IS
END testbench_shifter ;

ARCHITECTURE mytest OF testbench_shifter IS
SIGNAL input_tb,output_tb: STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL sel_tb: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL error: STD_LOGIC;

COMPONENT shifter
PORT (  input : IN STD_LOGIC_VECTOR(14 downto 0); 
sel: IN STD_LOGIC_VECTOR(2 downto 0); 
output : OUT STD_LOGIC_VECTOR(14 downto 0)); 
END COMPONENT;
BEGIN

uut: shifter PORT MAP (input=> input_tb ,output=> output_tb,sel => sel_tb);

input_tb<="000001010011100";

PROCESS
BEGIN
sel_tb<="000";

 WAIT FOR 200 ns;
sel_tb<="001";

WAIT FOR 200 ns;
sel_tb<="010";

 WAIT FOR 200 ns;
sel_tb<="011";

 WAIT FOR 200 ns;
sel_tb<="100";

 WAIT FOR 200 ns;
sel_tb<="101";


 WAIT FOR 200 ns;
sel_tb<="110";

 WAIT FOR 200 ns;
sel_tb<="111";

 WAIT FOR 200 ns;
WAIT;
END PROCESS;
END mytest;
