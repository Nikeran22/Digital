LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
ENTITY mux IS PORT ( sel: IN STD_LOGIC_VECTOR(1 downto 0); 
output : OUT STD_LOGIC_VECTOR(14 downto 0)); 

END mux; 


ARCHITECTURE Behavior OF mux IS 

SIGNAL H, E, L, O,C,P,F : STD_LOGIC_VECTOR(2 DOWNTO 0);


BEGIN
H<="000";
E<="001";
L<="010";
O<="011";
C<="100";
P<="101";
F<="110";

	output<=H&E&L&L&O when (sel = "00") else
		C&E&P&P&O when (sel = "01") else
		C&E&L&L&O when (sel = "10") else
		F&E&P&P&O when (sel = "11");
				

END Behavior; 