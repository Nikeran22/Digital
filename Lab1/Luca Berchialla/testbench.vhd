LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench ;

ARCHITECTURE mytest OF testbench IS
SIGNAL x_tb: STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL m_tb: STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT mux_4bit_2ports
PORT (  SW : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;
BEGIN
uut: mux_4bit_2ports PORT MAP (SW(8 DOWNTO 0)=> x_tb(8 DOWNTO 0), LEDR(3 DOWNTO 0) => m_tb(3 DOWNTO 0));
 x_tb(3 downto 0) <= "0000";
 x_tb(7 downto 4) <= "1111";
PROCESS
BEGIN
 x_tb(8)<= '1';
 WAIT FOR 200 ps;
 x_tb(8)<= '0';
 WAIT for 200 ps;
x_tb(8)<='0';
wait;
END PROCESS;
END mytest;