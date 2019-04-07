LIBRARY ieee;
USE ieee.std_logic_1164.all;

--key0 -> clock
--SW1 -> Enable
--SW0 ->Reset

entity counter16 is
 Port (SW1, KEY0, SW0: in STD_LOGIC;
 HEX0, HEX1, HEX2, HEX3 : out STD_LOGIC_VECTOR(6 downto 0));
end counter16;

architecture Behavioral of counter16 is

signal count : STD_LOGIC_vector(15 downto 0);


--COMPONENTS INITIALIZATION--------------------
component counter16 IS PORT (
CK,Enable,Clear: in STD_LOGIC;
Q: out STD_LOGIC_VECTOR(15 downto 0));
end component; 

component decoderHEX16bit IS PORT ( 
input: in STD_LOGIC_VECTOR (3 downto 0);
 output : out STD_LOGIC_VECTOR (6 downto 0));
end component; 
------------------------------------------------



BEGIN


COUNTER0: counter16 PORT MAP (KEY0,SW1,SW0,count);
DHEX0: decoderHEX16bit PORT MAP (count(3 downto 0), HEX0);
DHEX1: decoderHEX16bit PORT MAP (count(7 downto 4), HEX1);
DHEX2: decoderHEX16bit PORT MAP (count(11 downto 8), HEX2);
DHEX3: decoderHEX16bit PORT MAP (count(15 downto 12), HEX3);


end Behavioral;
