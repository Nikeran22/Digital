

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;
 
ENTITY FACBA16 IS PORT ( 
cine: IN STD_LOGIC;
ae,be: IN SIGNED(15 DOWNTO 0);
se : OUT SIGNED(15 DOWNTO 0);
overflow : OUT STD_LOGIC);
END FACBA16; 

ARCHITECTURE Behavior OF FACBA16 IS 

signal au,bu: sIGNED(15 downto 0);
signal propagate0, propagate1, propagate2, propagate3: std_logic;
signal cpropin0,cpropin1,cpropin2,cpropin3: std_logic;
signal cpropout0,cpropout1,cpropout2,cpropout3: std_logic;

component control IS PORT(
ai: IN SIGNED (3 downto 0);
bi: IN SIGNED (3 downto 0);
ao: out SIGNED (3 downto 0);
bo: out SIGNED (3 downto 0);
po: out std_logic);
END component;

component FA4 is port(
ai: IN SIGNED (3 downto 0);
bi: IN SIGNED (3 downto 0);
cini: in std_logic;
couti: out std_logic;
si: out SIGNED(3 downto 0));
END component;

component mux IS PORT ( sel: IN STD_LOGIC; 
in0: IN STD_LOGIC;
in1: IN STD_LOGIC;
output : OUT STD_LOGIC); 
end component;


BEGIN

SET0: control PORT MAP(ae(3 downto 0), be(3 downto 0), au(3 downto 0), bu(3 downto 0), propagate0);
FAD0: FA4 PORT MAP(au(3 downto 0), bu(3 downto 0), cine, cpropin0, se(3 downto 0));
M0: mux PORT MAP(propagate0,cpropin0, cine,cpropout0);

SET1: control PORT MAP(ae(7 downto 4), be(7 downto 4), au(7 downto 4), bu(7 downto 4), propagate1);
FAD1: FA4 PORT MAP(au(7 downto 4), bu(7 downto 4), cpropout0, cpropin1, se(7 downto 4));
M1: mux PORT MAP(propagate1,cpropin1, cpropout0,cpropout1);

SET2: control PORT MAP(ae(11 downto 8), be(11 downto 8), au(11 downto 8), bu(11 downto 8), propagate2);
FAD2: FA4 PORT MAP(au(11 downto 8), bu(11 downto 8), cpropout1, cpropin2, se(11 downto 8));
M2: mux PORT MAP(propagate2,cpropin2, cpropout1,cpropout2);

SET3: control PORT MAP(ae(15 downto 12), be(15 downto 12), au(15 downto 12), bu(15 downto 12), propagate3);
FAD3: FA4 PORT MAP(au(15 downto 12), bu(15 downto 12), cpropout2, cpropin3, se(15 downto 12));
M3: mux PORT MAP(propagate3,cpropin3, cpropout2,cpropout3);

overflow<=cpropout3 xor cpropout2;


END Behavior;