LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY FA16 IS PORT ( 
cin: IN STD_LOGIC;
a,b: IN SIGNED(15 DOWNTO 0);
s : OUT SIGNED(15 DOWNTO 0);
overflow : OUT STD_LOGIC);

END FA16; 


ARCHITECTURE Behavior OF FA16 IS 

SIGNAL c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16 : STD_LOGIC;

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
FA4: FA PORT MAP (c4,a(4),b(4),s(4),c5);
FA5: FA PORT MAP (c5,a(5),b(5),s(5),c6);
FA6: FA PORT MAP (c6,a(6),b(6),s(6),c7);
FA7: FA PORT MAP (c7,a(7),b(7),s(7),c8);
FA8: FA PORT MAP (c8,a(8),b(8),s(8),c9);
FA9: FA PORT MAP (c9,a(9),b(9),s(9),c10);
FA10: FA PORT MAP (c10,a(10),b(10),s(10),c11);
FA11: FA PORT MAP (c11,a(11),b(11),s(11),c12);
FA12: FA PORT MAP (c12,a(12),b(12),s(12),c13);
FA13: FA PORT MAP (c13,a(13),b(13),s(13),c14);
FA14: FA PORT MAP (c14,a(14),b(14),s(14),c15);
FA15: FA PORT MAP (c15,a(15),b(15),s(15),c16);

overflow<=c16 xor c15;

END Behavior; 
