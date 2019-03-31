LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY FAS4 IS PORT ( 
add_subtract : IN STD_LOGIC;
a,b: IN SIGNED(3 DOWNTO 0);
s : OUT SIGNED(3 DOWNTO 0);
overflow : OUT STD_LOGIC);

END FAS4; 


ARCHITECTURE Behavior OF FAS4 IS 

SIGNAL c1,c2,c3,c4 : STD_LOGIC;
SIGNAL Bc : STD_LOGIC_VECTOR (3 DOWNTO 0);

component FA IS PORT ( 
cin: IN STD_LOGIC;
a: IN STD_LOGIC;
b: IN STD_LOGIC; 
s : OUT STD_LOGIC;
cout : OUT STD_LOGIC);
end component; 

BEGIN 

Bc(0)<=add_subtract xor b(0);
Bc(1)<=add_subtract xor b(1);
Bc(2)<=add_subtract xor b(2);
Bc(3)<=add_subtract xor b(3);

FA0: FA PORT MAP (add_subtract,a(0),Bc(0),s(0),c1);
FA1: FA PORT MAP (c1,a(1),Bc(1),s(1),c2);
FA2: FA PORT MAP (c2,a(2),Bc(2),s(2),c3);
FA3: FA PORT MAP (c3,a(3),Bc(3),s(3),c4);
overflow<=c4 xor c3;

END Behavior; 
