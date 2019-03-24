LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_mmux5to1 IS
END testbench_mmux5to1 ;

ARCHITECTURE mytest OF testbench_mmux5to1 IS
SIGNAL x_tb,y_tb,m_tb,s_tb: STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT mux5to1
PORT (  SW : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END COMPONENT;
BEGIN
uut: mux5to1 PORT MAP (SW(2 DOWNTO 0)=> y_tb, SW(5 DOWNTO 3)=> x_tb, SW(8 DOWNTO 6)=> s_tb, LEDR(2 DOWNTO 0) => m_tb);
 
x_tb <= "000";
y_tb <= "001";

PROCESS
BEGIN
 s_tb<= "000";
 WAIT FOR 200 ns;
 s_tb<="001";
WAIT FOR 200 ns;
 s_tb<="010";
 WAIT FOR 200 ns;
 s_tb<="011";
 WAIT FOR 200 ns;
 s_tb<="100";
 WAIT FOR 200 ns;
 s_tb<="101";
 WAIT FOR 200 ns;
 s_tb<="110";
 WAIT FOR 200 ns;
 s_tb<="111";
 WAIT;
END PROCESS;
END mytest;
