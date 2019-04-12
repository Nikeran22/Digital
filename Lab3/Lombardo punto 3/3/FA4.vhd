LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;


entity FA4 is port(
ai: IN SIGNED (3 downto 0);
bi: IN SIGNED (3 downto 0);
cini: in std_logic;
couti: out std_logic;
si: out SIGNED(3 downto 0));
END FA4;


architecture behave of FA4 is

signal c0,c1,c2: std_logic;
signal c4,c5,c6: std_logic;
signal c00,c11: std_logic;
signal A0,B1: signed(3 downto 0);

component FA is port(
cin: IN STD_LOGIC;
a: IN STD_LOGIC;
b: IN STD_LOGIC; 
s : OUT STD_LOGIC;
cout : OUT STD_LOGIC);
END component ;

component mux IS PORT ( sel: IN STD_LOGIC; 
in0: IN STD_LOGIC;
in1: IN STD_LOGIC;
output : OUT STD_LOGIC); 

END component; 

begin


FA0: FA PORT MAP('0',ai(0),bi(0),A0(0),c0);
FA1: FA PORT MAP(c0,ai(1),bi(1),A0(1),c1);
FA2: FA PORT MAP(c1,ai(2),bi(2),A0(2),c2);
FA3: FA PORT MAP(c2,ai(3),bi(3),A0(3),c00);

 
FA4: FA PORT MAP('1',ai(0),bi(0),B1(0),c4);
FA5: FA PORT MAP(c4,ai(1),bi(1),B1(1),c5);
FA6: FA PORT MAP(c5,ai(2),bi(2),B1(2),c6);
FA7: FA PORT MAP(c6,ai(3),bi(3),B1(3),c11);

 
MUX1: mux PORT MAP(cini,A0(0),B1(0),si(0));
MUX2: mux PORT MAP(cini,A0(1),B1(1),si(1));
MUX3: mux PORT MAP(cini,A0(2),B1(2),si(2));
MUX4: mux PORT MAP(cini,A0(3),B1(3),si(3));
 
MUX5: mux PORT MAP(cini,c00,c11,couti);

end behave;


