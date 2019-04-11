-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.all;



--key0 -> clock
--SW1 -> Enable
--SW0 ->Reset

ENTITY CBA16_testbench IS
END CBA16_testbench;

ARCHITECTURE Behavior OF CBA16_testbench IS

signal A: signed(15 downto 0);
signal B: signed(15 downto 0);
signal resclock: std_logic_vector(1 downto 0);
signal LEDOF: std_logic_vector(0 downto 0);
signal HA0,HA1,HA2,HA3:std_logic_vector(6 downto 0);
signal HB0,HB1,HB2,HB3:std_logic_vector(6 downto 0);
signal HC0,HC1,HC2,HC3:std_logic_vector(6 downto 0);




component CBA16 is
port (SW1: IN SIGNED(15 DOWNTO 0);   --A
SW2: IN SIGNED(31 DOWNTO 16);  --B
KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0); --reset     key0-> clock key1-> asynchronous reset
LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 9); --overflow
HEX0,HEX1,HEX2,HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --A,NUMBER DISPLAY
HEX4,HEX5,HEX6,HEX7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --B,NUMBER DISPLAY
HEX8,HEX9,HEX10,HEX11 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); --S,NUMBER DISPLAY		
end component;

BEGIN
dut: CBA16 PORT MAP (SW1=>A, KEY=>resclock, SW2=>B, LEDR => LEDOF, HEX0 => HA0, HEX1 => HA1,HEX2 => HA2,HEX3 => HA3,HEX4 => HB0,HEX5 => HB1,HEX6 => HB2,HEX7 => HB3,HEX8 => HC0,HEX9 => HC1,HEX10 => HC2,HEX11 => HC3);

PROCESS
BEGIN



resclock<="00";
A<="0000000000000000";
B<="0000000000000000";
WAIT FOR 20 ns;
resclock<="01";
A<="0000000000000000";
B<="0000000000000000";
WAIT FOR 20 ns;
resclock<="10";
A<="0000000000000000";
B<="0000000000000000";
WAIT FOR 20 ns;
resclock<="00";
A<="0000000000000000";
B<="0000000000000000";
WAIT FOR 20 ns;

resclock<="10";
A<="0000000000100000";
B<="0000000100000000";
WAIT FOR 20 ns;
resclock<="00";
A<="0000000000100000";
B<="0000000100000000";

WAIT FOR 20 ns;
resclock<="10";
A<="0000000000001000";
B<="0000000000000010";
WAIT FOR 20 ns;
resclock<="00";
A<="0000000000001000";
B<="0000000000000010";
WAIT FOR 20 ns;

resclock<="10";
A<="0001000000100000";
B<="0010000100000000";
WAIT FOR 20 ns;
resclock<="00";
A<="0001000000100000";
B<="0010000100000000";
WAIT FOR 20 ns;

resclock<="10";
A<="1000000000001000";
B<="1000000000000010";
WAIT FOR 20 ns;
resclock<="00";
A<="1000000000001000";
B<="1000000000000010";
WAIT FOR 20 ns;

resclock<="10";
A<="0001000000100000";
B<="0010000100000000";
WAIT FOR 20 ns;
resclock<="00";
A<="0001000000100000";
B<="0010000100000000";

WAIT FOR 20 ns;
resclock<="10";
A<="1111111111111111";
B<="1111111111111111";
WAIT FOR 20 ns;
resclock<="00";
A<="1111111111111111";
B<="1111111111111111";
WAIT FOR 20 ns;
WAIT;
END PROCESS;



END Behavior;