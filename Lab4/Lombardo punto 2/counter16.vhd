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

signal ex1, ex2, ex3, ex4, ex5, ex6, ex7, ex8, ex9, ex10, ex11, ex12, ex13, ex14, ex15 : STD_LOGIC;
signal count : STD_LOGIC_vector(15 downto 0);


--COMPONENTS INITIALIZATION--------------------
component TFFs IS PORT (
t, clockk, clearr: in STD_LOGIC;
q : out STD_LOGIC);
end component; 

component decoderHEX16bit IS PORT ( 
input: in STD_LOGIC_VECTOR (3 downto 0);
 output : out STD_LOGIC_VECTOR (6 downto 0));
end component; 
------------------------------------------------



BEGIN

FF0: TFFs PORT MAP (SW1, KEY0 , SW0 ,count(0));
ex1 <= count(0) and SW1;
FF1: TFFs PORT MAP ( ex1 ,KEY0,SW0,count(1));
ex2 <= count(1) and ex1;
FF2: TFFs PORT MAP ( ex2 ,KEY0,SW0,count(2));
ex3 <= count(2) and ex2;
FF3: TFFs PORT MAP ( ex3 ,KEY0,SW0,count(3));
ex4 <= count(3) and ex3;
FF4: TFFs PORT MAP ( ex4 ,KEY0,SW0,count(4));
ex5 <= count(4) and ex4;
FF5: TFFs PORT MAP ( ex5 ,KEY0,SW0,count(5));
ex6 <= count(5) and ex5;
FF6: TFFs PORT MAP ( ex6 ,KEY0,SW0,count(6));
ex7 <= count(6) and ex6;
FF7: TFFs PORT MAP ( ex7 ,KEY0,SW0,count(7));
ex8 <= count(7) and ex7;
FF8: TFFs PORT MAP ( ex8 ,KEY0,SW0,count(8));
ex9 <= count(8) and ex8;
FF9: TFFs PORT MAP ( ex9 ,KEY0,SW0,count(9));
ex10 <= count(9) and ex9;
FF10: TFFs PORT MAP ( ex10 ,KEY0,SW0,count(10));
ex11 <= count(10) and ex10;
FF11: TFFs PORT MAP ( ex11 ,KEY0,SW0,count(11));
ex12 <= count(11) and ex11;
FF12: TFFs PORT MAP ( ex12 ,KEY0,SW0,count(12));
ex13 <= count(12) and ex12;
FF13: TFFs PORT MAP ( ex13 ,KEY0,SW0,count(13));
ex14 <= count(13) and ex13;
FF14: TFFs PORT MAP ( ex14 ,KEY0,SW0,count(14));
ex15 <= count(14) and ex14;
FF15: TFFs PORT MAP ( ex15 ,KEY0,SW0,count(15));

DHEX0: decoderHEX16bit PORT MAP (count(3 downto 0), HEX0);
DHEX1: decoderHEX16bit PORT MAP (count(7 downto 4), HEX1);
DHEX2: decoderHEX16bit PORT MAP (count(11 downto 8), HEX2);
DHEX3: decoderHEX16bit PORT MAP (count(15 downto 12), HEX3);


end Behavioral;
