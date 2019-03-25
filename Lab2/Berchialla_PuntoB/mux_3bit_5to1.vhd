LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
ENTITY mux IS PORT ( sel: IN STD_LOGIC_VECTOR(1 downto 0); 
output : OUT STD_LOGIC_VECTOR(14 downto 0)); 
END mux; 

ARCHITECTURE Behavior OF mux IS 
BEGIN
	output<="000001010010011" when (sel = "00") else
		"111001111111011" when (sel = "01") else
		"111001010010011" when (sel = "10") else
		"111001111111011" when (sel = "11");
				

END Behavior; 