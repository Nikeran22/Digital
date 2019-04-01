LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
 
ENTITY FA IS PORT ( 
cin: IN STD_LOGIC;
a: IN STD_LOGIC;
b: IN STD_LOGIC; 
s : OUT STD_LOGIC;
cout : OUT STD_LOGIC);

END FA; 


ARCHITECTURE Behavior OF FA IS 

SIGNAL S1 : STD_LOGIC;

component mux IS PORT (  sel: IN STD_LOGIC; 
in0: IN STD_LOGIC;
in1: IN STD_LOGIC;
output : OUT STD_LOGIC); 
end component; 

BEGIN 

MUX0: mux PORT MAP (S1,b,cin,cout); 

S1<=a xor b;
s<=S1 xor cin;

END Behavior; 
