--Library include
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
---------------------------------------------------------------
--Entity definition
entity binarytoBCD is
	port( 
			sw : in std_logic_vector (5 downto 0);	
			HEX1 : out std_logic_vector(6 downto 0);
			HEX0: out std_logic_vector(6 downto 0)
			);
end binarytoBCD;
---------------------------------------------------------------
--Architecture definition
architecture behavioral of binarytoBCD is
--Component used to convert single digits
component bcd_to_7s is
	port( 
			bcd: in std_logic_vector (5 downto 0);
			segments: out std_logic_vector (6 downto 0)
			);
end component;
--Signals: dec for decimal digits , unit for unit digits
signal sw_u: signed(5 downto 0);
signal dec: std_logic_vector(5 downto 0);
signal unit: std_logic_vector(5 downto 0);
--Begin assignments part
begin
--Input signal cast
     sw_u <= signed(sw);
--Component instantiation	  
     converter_dec:bcd_to_7s port map(dec,HEX1);
  	  converter_unit:bcd_to_7s port map(unit,HEX0);
--Decimal digit assignment
	  dec <="000000" when sw_u<10 else 
	        "000001" when sw_u>9 and sw_u<20  else
           "000010" when sw_u>19 and sw_u<30 else 
			  "000011" when sw_u>29 and sw_u<40 else
			  "000100" when sw_u>39 and sw_u<50 else
           "000101" when sw_u>49 and sw_u<60 else
           "000110";
----Units digit assignment
	  unit <= std_logic_vector(sw_u - 0)  when sw_u<10             else 
	          std_logic_vector(sw_u - 10) when sw_u>9 and sw_u<20  else
             std_logic_vector(sw_u - 20) when sw_u>19 and sw_u<30 else 
             std_logic_vector(sw_u - 30) when sw_u>29 and sw_u<40 else
             std_logic_vector(sw_u - 40) when sw_u>39 and sw_u<50 else
             std_logic_vector(sw_u - 50) when sw_u>49 and sw_u<60 else
             std_logic_vector(sw_u - 60);
end Behavioral;
-----------------------------------------------------------------