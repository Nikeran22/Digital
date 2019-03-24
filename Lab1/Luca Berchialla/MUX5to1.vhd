-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- entity
entity MUX5to1 is
port		(SW : in std_logic_vector(8 downto 0); 
			LEDR: out std_logic_vector(2 downto 0));
		
end MUX5to1;

-- architecture
architecture mux5to1 of MUX5to1 is
begin
	LEDR <= 		"101" when (SW(8 downto 6) = "000") else
				"010" when (SW(8 downto 6) = "001") else
				"111" when (SW(8 downto 6) = "010") else
				SW(5 downto 3) when (SW(8 downto 6) = "011") else
				SW(2 downto 0);
end mux5to1;
