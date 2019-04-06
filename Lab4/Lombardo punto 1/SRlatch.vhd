--A gated RS latch described the hard way 
LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
ENTITY SRlatch IS  
	PORT ( Clk, R, S : IN STD_LOGIC;  
	Q : OUT STD_LOGIC); 
	END SRlatch; 
 
ARCHITECTURE Structural OF SRlatch IS  
	SIGNAL R_g, S_g, Qa, Qb : STD_LOGIC ;  
	ATTRIBUTE keep : boolean;  
	ATTRIBUTE keep of R_g, S_g, Qa, Qb : SIGNAL IS true;
BEGIN  R_g <= R AND Clk; 
	S_g <= S AND Clk; 
	Qa <= NOT (R_g OR Qb); 
	Qb <= NOT (S_g OR Qa); 
	Q <= Qa; 
END Structural;