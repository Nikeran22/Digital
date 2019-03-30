LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY FA4 IS PORT ( 
cin: IN STD_LOGIC;
a,b: IN SIGNED(3 DOWNTO 0);
s : OUT SIGNED(3 DOWNTO 0);
overflow : OUT STD_LOGIC);

END FA4; 


ARCHITECTURE Behavior OF FA4 IS 

SIGNAL c1,c2,c3,c4 : STD_LOGIC;

component FA IS PORT ( 
cin: IN STD_LOGIC;
a: IN STD_LOGIC;
b: IN STD_LOGIC; 
s : OUT STD_LOGIC;
cout : OUT STD_LOGIC);
end component; 

BEGIN 

FA0: FA PORT MAP (cin,a(0),b(0),s(0),c1);
FA1: FA PORT MAP (c1,a(1),b(1),s(1),c2);
FA2: FA PORT MAP (c2,a(2),b(2),s(2),c3);
FA3: FA PORT MAP (c3,a(3),b(3),s(3),c4);
overflow<=c4 xor c3;

END Behavior; 
