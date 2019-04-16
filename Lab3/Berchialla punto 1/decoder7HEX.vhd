-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.all;

-- entity
entity decoder7HEX is
port		(a : in std_logic_vector(3 downto 0);  
		Display : out std_logic_vector(6 downto 0)); 
		
end decoder7HEX;

-- architecture
architecture Behavior of decoder7HEX is
begin

	Display(6) <= (not(a(1) and a(2) and a(3))) or (a(0) and a(1) and a(2) and not a(3)) or (not(a(0) and a(1)) and a(2) and a(3));

	Display(5) <= (a(0) and not(a(2) and a(3))) or (a(1) and not (a(2) and a(3))) or (a(0) and a(1) and not a(3)) or (a(0) and a(2) and a(3) and not a(1));

	Display(4) <=(a(0) and not (a(3))) or (a(2) and not(a(1) and a(3))) or (a(0) and not (a(1) and a(3)));

	Display(3) <=(a(0) and not (a(1) and a(2) and a(3))) or (a(2) and not (a(0) and a(1) and a(3))) or (a(0) and a(1) and a(2)) or (a(1) and a(3) and not (a(0) and a(2)));

	Display(2) <=(a(1) and not(a(0) and a(2) and a(3))) or (a(1) and a(2) and a(3)) or (a(2) and a(3) and not(a(0) and a(1)));

	Display(1) <=(a(0) and a(2) and not(a(1) and a(3))) or (a(2) and not(a(0) and a(1))) or (a(2) and a(3) and not(a(0) and a(1))) or (a(1) and a(2) and a(3)) or (a(0) and a(1) and a(3));

	Display(0) <=(a(0) and not(a(1) and a(2) and a(3))) or (a(2) and not(a(0) and a(1) and a(3))) or (a(0) and a(2) and a(3) and not a(1)) or (a(0) and a(1) and a(3) and not a(2));
	

	
end Behavior;