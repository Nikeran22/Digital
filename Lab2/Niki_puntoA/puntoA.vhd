-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- entity
entity puntoA is
port		(SW : in std_logic_vector(2 downto 0);  
		HEX0 : out std_logic_vector(6 downto 0)); 
		
end puntoA;

-- architecture
architecture apuntoA of puntoA is
begin

	HEX0(6) <= (not SW(2)) and (not SW(1));
	HEX0(5) <= (not SW(2));
	HEX0(4) <= (not SW(2));
	HEX0(3) <= (not SW(2)) and (SW(0) or SW(1));
	HEX0(2) <= ( (not SW(2)) and (not SW(1)) and (not SW(0)) ) or ( (not SW(2)) and SW(1) and SW(0) );
	HEX0(1) <= ( (not SW(2)) and (not SW(1)) and (not SW(0)) ) or ( (not SW(2)) and SW(1) and SW(0) );
	HEX0(0) <= (not SW(2)) and SW(0);
	
end apuntoA;