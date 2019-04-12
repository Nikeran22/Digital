LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY LAB5_es2 IS
PORT (SW : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0));
END LAB5_es2;


ARCHITECTURE Behavior OF LAB5_es2 IS

component d_ff IS
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END component;

signal sw1n,d0,d1,d2,d3,d4,d5,d6,d7,d8,q0,q1,q2,q3,q4,q5,q6,q7,q8 : STD_LOGIC;

BEGIN
y0: d_ff port map (d0,KEY(0),SW(0),q0);
y1: d_ff port map (d1,KEY(0),SW(0),q1);
y2: d_ff port map (d2,KEY(0),SW(0),q2);
y3: d_ff port map (d3,KEY(0),SW(0),q3);
y4: d_ff port map (d4,KEY(0),SW(0),q4);
y5: d_ff port map (d5,KEY(0),SW(0),q5);
y6: d_ff port map (d6,KEY(0),SW(0),q6);
y7: d_ff port map (d7,KEY(0),SW(0),q7);
y8: d_ff port map (d8,KEY(0),SW(0),q8);


--cc1
sw1n<=not SW(1);

d0<=(q1 or q2 or q3 or q4 or q5 or  q6 or q7 or q8);
d1<=sw1n and (not q0 or q5 or q6 or q7 or q8);
d2<=sw1n and q1;
d3<=sw1n and q2;
d4<=sw1n and (q3 or q4);
d5<=SW(1) and (not q0 or q1  or q2 or q3 or  q4);
d6<=SW(1) and q5;
d7<=SW(1) and q6;
d8<=SW(1) and (q7 or q8);

--cc2
LEDR(0)<=q4 or q8;


END Behavior;
