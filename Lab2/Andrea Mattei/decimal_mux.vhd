library ieee; 
use ieee.std_logic_1164.all; 
 
entity decimal_mux is 
port( sel: in std_logic; 
	figure : out std_logic_vector(6 downto 0)); 
end decimal_mux; 

architecture decimal_mux_behavior of decimal_mux is 
begin
	figure <="1000000" when (sel = '0') else
		     "1111001" when (sel = '1');
end decimal_mux_behavior; 