-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE Behavior OF testbench IS
signal inp: std_logic_vector(2 downto 0);
signal outp: std_logic_vector(0 to 6);

component puntoA
port		(SW : in std_logic_vector(2 downto 0);  
		 HEX0 : out std_logic_vector(0 to 6)); 		
end component;

BEGIN
uut: puntoA PORT MAP (SW=>inp, HEX0=>outp);

PROCESS
BEGIN
inp <= "000";
WAIT FOR 20 ns;
inp <= "001";
WAIT FOR 20 ns;
inp <= "010";
WAIT FOR 20 ns;
inp <= "011";
WAIT FOR 20 ns;
inp <= "100";
WAIT FOR 20 ns;
inp <= "101";
WAIT FOR 20 ns;
inp <= "110";
WAIT FOR 20 ns;
inp <= "111";
WAIT FOR 20 ns;
WAIT;
END PROCESS;



END Behavior;