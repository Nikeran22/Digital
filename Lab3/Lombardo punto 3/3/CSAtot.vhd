LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;
 
ENTITY CSAtot IS PORT ( 
cine: IN STD_LOGIC;
ae,be: IN SIGNED(15 DOWNTO 0);
se : OUT SIGNED(15 DOWNTO 0);
overflow : OUT STD_LOGIC);
END CSAtot; 

ARCHITECTURE Behavior OF CSAtot IS 

signal cp0,cp1,cp2,cp3: std_logic;


component FA4 is port(
ai: IN SIGNED (3 downto 0);
bi: IN SIGNED (3 downto 0);
cini: in std_logic;
couti: out std_logic;
si: out SIGNED(3 downto 0));
END component;


BEGIN

block0: FA4 port map(ae(3 downto 0), be(3 downto 0), cine, cp0, se(3 downto 0) );
block1: FA4 port map(ae(7 downto 4), be(7 downto 4), cp0, cp1, se(7 downto 4) );
block2: FA4 port map(ae(11 downto 8), be(11 downto 8), cp1, cp2, se(11 downto 8) );
block3: FA4 port map(ae(15 downto 12), be(15 downto 12), cp2, cp3, se(15 downto 12 ));


overflow<=cp2 xor cp3;


END Behavior;