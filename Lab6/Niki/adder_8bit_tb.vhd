-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


ENTITY adder_8bit_tb IS
END adder_8bit_tb;

ARCHITECTURE Behavior OF adder_8bit_tb IS

signal ci : std_logic;
signal Ain,Bin,Sout : std_logic_vector(7 downto 0);

component adder_8bit is
Port(
		A: in std_logic_vector( 7 downto 0);
		B: in std_logic_vector(7 downto 0);
		S: out std_logic_vector(7 downto 0);
		cin: in std_logic);
end component;

BEGIN
dut: adder_8bit PORT MAP (Ain, Bin, Sout, ci);
PROCESS
BEGIN


-----------ADDITION-----------------------
Ain<="00101101";
Bin<="01001010";
ci<='0';
WAIT FOR 20 ns;
----------------------------------
-----------SUBTRACTION-----------------------
Ain<="01101101";
Bin<="01001010";
ci<='1';
WAIT FOR 20 ns;
----------------------------------


WAIT;
END PROCESS;



END Behavior;