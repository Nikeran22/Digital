LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
ENTITY shifter IS PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0); 
sel: IN STD_LOGIC_VECTOR(2 downto 0); 
output : OUT STD_LOGIC_VECTOR(14 downto 0)); 
END shifter; 
ARCHITECTURE Behavior OF shifter IS 
BEGIN
output <= 	input when (sel = "000") else
		input(11 downto 0) & input(14 downto 12)  when (sel = "001") else
		input(8 downto 0) & input(14 downto 9) when (sel = "010") else
		input(5 downto 0) & input(14 downto 6) when (sel = "011") else
		input(2 downto 0) & input(14 downto 3) when (sel = "100") else
		"111111111111111";
END Behavior;