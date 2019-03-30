library ieee; 
use ieee.std_logic_1164.all; 
 
--chooses the tens digit to display between 1 and 0
entity tens_mux is 
port( sel: in std_logic; 
	  digit : out std_logic_vector(6 downto 0)); 
end tens_mux; 

architecture tens_mux_behavior of tens_mux is 
begin
	digit <="1000000" when (sel = '0') else
		    "1111001" when (sel = '1');
end tens_mux_behavior; 