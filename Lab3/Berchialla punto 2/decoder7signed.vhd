-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.all;

-- entity
entity decoder7signed is
port		(a : in SIGNED(3 downto 0);  
		Display : out std_logic_vector(6 downto 0); 
		Display_sign: out std_logic_vector(6 downto 0)); 
		
end decoder7signed;

-- architecture
architecture Behavior of decoder7signed is
begin
	Display(6) <='1' when (a="0000" or a="0001" or a="0111" or a="1001" or a="1111") else '0';
	Display(5) <='1' when (a="0001" or a="0010" or a="0011" or a="0111" or a="1001" or a="1101" or a="1110" or a="1111") else '0';

	Display(4) <='1' when (a="0001" or a="0011" or a="0100" or a="0101" or a="0111" or a="1001" or a="1011" or a="1100" or a="1101" or a="1111") else '0';

	Display(3) <='1' when (a="0001" or a="0100" or a="0111" or a="1001" or a="1100" or a="1111") else '0';

	Display(2) <='1' when (a="0010" or a="1110") else '0';

	Display(1) <='1' when (a="0101" or a="0110" or a="1010" or a="1011") else '0';

	Display(0) <='1' when (a="0001" or a="0100" or a="1100" or a="1111") else '0'; 
	
	Display_sign(6) <= not a(3);
	Display_sign(5 downto 0)<="111111";
	

	
end Behavior;
