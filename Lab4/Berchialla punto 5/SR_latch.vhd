-- A gated RS latch described the hard way
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY SR_glatch IS
PORT ( Clk, R, S : IN STD_LOGIC;
Q,Qn : OUT STD_LOGIC);
END SR_glatch;
ARCHITECTURE Structural OF SR_glatch IS
SIGNAL R_g, S_g, Qa, Qb : STD_LOGIC ;
BEGIN
R_g <= R AND Clk;
S_g <= S AND Clk;
Qa <= NOT (R_g OR Qb);
Qb <= NOT (S_g OR Qa);
Q <= Qa;
Qn <= NOT Qa;
END Structural;