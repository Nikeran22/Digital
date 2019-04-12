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

component FA is port(
cin: IN STD_LOGIC;
a: IN STD_LOGIC;
b: IN STD_LOGIC; 
s : OUT STD_LOGIC;
cout : OUT STD_LOGIC);

END component ;

begin

FA0: FA PORT MAP( cini, ai(0), bi(0), si(0),c0);
FA1: FA PORT MAP( c0, ai(1), bi(1), si(1),c1);
FA2: FA PORT MAP( c1, ai(2), bi(2), si(2),c2);
FA3: FA PORT MAP( c2, ai(3), bi(3), si(3),couti);

end behave;


