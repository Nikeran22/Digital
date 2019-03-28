-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- entity
entity decoder7 is
port		(C : in std_logic_vector(2 downto 0);  
		Display : out std_logic_vector(6 downto 0)); 
		
end decoder7;

-- architecture
architecture Behavior of decoder7 is
begin

	Display(6) <='0' when (C="000" or C="001" or C="101" or C="110") else '1';
	Display(5) <='0' when (C="000" or C="001" or C="010" or C="011" or C="100" or C="101" or C="110") else '1';

	Display(4) <='0' when (C="000" or C="001" or C="010" or C="011" or C="100" or C="101" or C="110") else '1';

	Display(3) <='0' when (C="001" or C="010" or C="011" or C="100" ) else '1';

	Display(2) <='0' when (C="000" or C="011") else '1';

	Display(1) <='0' when (C="000" or C="011" or C="101") else '1';

	Display(0) <='0' when (C="001" or C="011" or C="100" or C="101" or C="110") else '1'; 
	

	
end Behavior;