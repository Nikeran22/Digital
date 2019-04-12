LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
ENTITY mux IS PORT ( sel: IN STD_LOGIC; 
in0: IN STD_LOGIC;
in1: IN STD_LOGIC;
output : OUT STD_LOGIC); 

END mux; 


ARCHITECTURE Behavior OF mux IS 

BEGIN

	output<= in0 when (sel = '0') else
		 in1 when (sel = '1');
				

END Behavior; 

