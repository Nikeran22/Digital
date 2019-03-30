LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;
 
ENTITY lab3_es1 IS PORT ( 
SW: IN SIGNED(7 DOWNTO 0);
KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 9);
HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END lab3_es1; 


ARCHITECTURE Behavior OF lab3_es1 IS 

SIGNAL A,B,S,SREG : SIGNED(3 DOWNTO 0);
SIGNAL A7,B7,S7 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL RST,overflow : STD_LOGIC;

component FA4 IS PORT ( 
cin: IN STD_LOGIC;
a,b: IN SIGNED(3 DOWNTO 0);
s : OUT SIGNED(3 DOWNTO 0);
overflow : OUT STD_LOGIC);
end component; 

COMPONENT decoder7signed is
port		(a : in SIGNED(3 downto 0);  
		Display : out std_logic_vector(6 downto 0); 
		Display_sign: out std_logic_vector(6 downto 0)); 
END COMPONENT;

COMPONENT regn IS
GENERIC ( N : integer:=4);
PORT (R : IN SIGNED(N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT flipflop IS
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END COMPONENT;

BEGIN 
RST<=not KEY(0);
REG0: REGN PORT MAP (SW(3 DOWNTO 0),KEY(1),RST,A);
REG1: REGN PORT MAP (SW(7 DOWNTO 4),KEY(1),RST,B);
DEC0: decoder7signed PORT MAP (A,HEX4,HEX5);
DEC1: decoder7signed PORT MAP (B,HEX2,HEX3);
FA40: FA4 PORT MAP('0',A,B,S,overflow);
REG2: REGN PORT MAP (S,KEY(1),RST,SREG);
DEC2: decoder7signed PORT MAP (SREG,HEX0,HEX1);
FF0: flipflop PORT MAP (overflow,KEY(1),RST,LEDR(9));


END Behavior; 
