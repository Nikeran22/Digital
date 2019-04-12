LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity LAB4_es5_tt is
Port (KEY: in STD_LOGIC_VECTOR(3 downto 0);
CLOCK_50 : in STD_logic;
SW: in STD_LOGIC_VECTOR(7 downto 0);
LEDR: out STD_logic_Vector(0 downto 0);
BCD_count : out STD_LOGIC_VECTOR(15 downto 0));
end LAB4_es5_tt;

architecture Behavioral of LAB4_es5_tt is




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

component millisecond_counter_tt is
 Port (CK: in STD_LOGIC;
Enable_out: out STD_LOGIC);
end component; 

component decoderHEX16bit is
 Port (input: in STD_LOGIC_VECTOR (3 downto 0);
 output : out STD_LOGIC_VECTOR (6 downto 0));
end component; 

------------------------------------------------

signal millisecond_signal,m0,m1,mn,en_cc,eno_cc,en_bcd : STD_LOGIC;

BEGIN

en_cc<=m0 and millisecond_signal;
en_bcd<=(eno_cc and m1) and millisecond_signal;
LEDR(0)<=eno_cc and m1;

millisecond: millisecond_counter_tt PORT MAP (CLOCK_50,millisecond_signal);
MEM0: jk_ff port map (CLOCK_50,KEY(0),KEY(3),m0);
MEM1: jk_ff port map (CLOCK_50,KEY(3),KEY(0),mn,m1);
timer: counter_comparator port map (CLOCK_50,en_cc,KEY(0),SW,eno_cc);
BCD: BCD_4digits_counter port map (CLOCK_50,en_bcd,KEY(0),BCD_count);




end Behavioral;
