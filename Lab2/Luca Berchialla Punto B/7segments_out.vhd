LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
 
ENTITY Part2 IS PORT ( SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0); 
HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(6 downto 0)); 
END Part2; 

ARCHITECTURE Behavior OF Part2 IS 
 
component mux IS PORT ( sel: IN STD_LOGIC_VECTOR(1 downto 0); 
output : OUT STD_LOGIC_VECTOR(14 downto 0)); 
end component; 
 
component shifter IS 
PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0); 
sel: IN STD_LOGIC_VECTOR(2 downto 0); 
output : OUT STD_LOGIC_VECTOR(14 downto 0)); 
end component ; 
 
COMPONENT decoder7 PORT ( C : IN STD_LOGIC_VECTOR(2 downto 0); 
Display : OUT STD_LOGIC_VECTOR(6 downto 0)); 
END COMPONENT; 

SIGNAL a1,a2 : std_logic_vector (14 downto 0); 

BEGIN MUX0: mux PORT MAP (SW(1 DOWNTO 0),a1); 

SHIFT0: shifter PORT MAP (a1, SW(4 downto 2),a2); 

H0: decoder7 PORT MAP (a2(2 downto 0), HEX4); 
H1: decoder7 PORT MAP (a2(5 downto 3), HEX3); 
H2: decoder7 PORT MAP (a2(8 downto 6), HEX2); 
H3: decoder7 PORT MAP (a2(11 downto 9), HEX1); 
H4: decoder7 PORT MAP (a2(14 downto 12), HEX0); 
END Behavior; 