LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity LAB4_es5 is
Port (KEY: in STD_LOGIC_VECTOR(3 downto 0);
CLOCK_50 : in STD_logic;
SW: in STD_LOGIC_VECTOR(7 downto 0);
LEDR: out STD_logic_Vector(0 downto 0);
HEX0, HEX1, HEX2, HEX3 : out STD_LOGIC_VECTOR(6 downto 0));
end LAB4_es5;

architecture Behavioral of LAB4_es5 is




--COMPONENTS INITIALIZATION--------------------
component BCD_4digits_counter is
Port(CK,Enable,a_clear: in STD_LOGIC;
counter: out STD_LOGIC_VECTOR(15 downto 0));
end component; 

component counter_comparator is
 Port (CK,enable,a_clear: in STD_LOGIC;
compare: in STD_LOGIC_VECTOR(7 DOWNTO 0);
Enable_out: out STD_LOGIC);
end component; 

component jk_ff IS
PORT ( CK, j, k : IN STD_LOGIC;
Q,Qn : OUT STD_LOGIC);
end component; 

component millisecond_counter is
 Port (CK: in STD_LOGIC;
Enable_out: out STD_LOGIC);
end component; 

component decoderHEX16bit is
 Port (input: in STD_LOGIC_VECTOR (3 downto 0);
 output : out STD_LOGIC_VECTOR (6 downto 0));
end component; 

------------------------------------------------

signal BCDcount : STD_LOGIC_VECTOR(15 downto 0);
signal millisecond_signal,m0,m1,mn,en_cc,eno_cc,en_bcd : STD_LOGIC;
signal KEYn :STD_LOGIC_VECTOR (3 downto 0);

BEGIN
KEYn<= not KEY;
en_cc<=m0 and millisecond_signal;
en_bcd<=(eno_cc and m1) and millisecond_signal;
LEDR(0)<=eno_cc and m1;

millisecond: millisecond_counter PORT MAP (CLOCK_50,millisecond_signal);
MEM0: jk_ff port map (CLOCK_50,KEYn(0),KEYn(3),m0);
MEM1: jk_ff port map (CLOCK_50,KEYn(3),KEYn(0),mn,m1);
timer: counter_comparator port map (CLOCK_50,en_cc,KEYn(0),SW,eno_cc);
BCD: BCD_4digits_counter port map (CLOCK_50,en_bcd,KEYn(0),BCDcount);

DHEX0: decoderHEX16bit PORT MAP (BCDcount(15 downto 12), HEX0);
DHEX1: decoderHEX16bit PORT MAP (BCDcount(11 downto 8), HEX1);
DHEX2: decoderHEX16bit PORT MAP (BCDcount(7 downto 4), HEX2);
DHEX3: decoderHEX16bit PORT MAP (BCDcount(3 downto 0), HEX3);


end Behavioral;
