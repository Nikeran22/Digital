-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


-- entity
entity decoder7 is
port		(C : in std_logic_vector(2 downto 0); 
		Display: out std_logic_vector(6 downto 0));
SIGNAL tmp1,tmp2, tmp3: std_logic;
		
end decoder7;

-- architecture
architecture decoder7 of decoder7 is
begin
	Display(0) <= 	C(0) AND NOT C(2) ;
	tmp1 <= NOT C(0) AND NOT C(1);
	tmp2 <= C(0) AND C(1);
	tmp3 <= tmp1 OR tmp2;
	Display(1) <= 	NOT C(2) AND tmp3;
	Display(2) <= 	NOT C(2) AND tmp3;
	Display(3) <= 	NOT C(2) AND (C(0) OR C(1));
	Display(4) <=	NOT C(2);
	Display(5) <=	NOT C(2);
	Display(6) <=	NOT C(1) AND NOT C(2);
	
end decoder7;
