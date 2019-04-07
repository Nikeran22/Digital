LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity BCD_4digits_counter is
Port(CK,Enable,a_clear: in STD_LOGIC;

counter: out STD_LOGIC_VECTOR(0 to 15));
end BCD_4digits_counter;

architecture Behavioral of BCD_4digits_counter is

signal eno1,eno2,eno3,en1,en2,en3 : STD_LOGIC;

--COMPONENTS INITIALIZATION--------------------
component BCD_counter IS PORT (
CK,Enable,a_clear: in STD_LOGIC;
counter: out std_logic_vector(3 downto 0);
Enable_out: out STD_LOGIC);
end component; 
------------------------------------------------


BEGIN
en1<=Enable and eno1;
en2<=Enable and eno2;
en3<=Enable and eno3;
COUNTER0: BCD_counter PORT MAP (CK,Enable,a_clear,counter(0 to 3),eno1);
COUNTER1: BCD_counter PORT MAP (CK,en1,a_clear,counter(4 to 7),eno2);
COUNTER2: BCD_counter PORT MAP (CK,en2,a_clear,counter(8 to 11),eno3);
COUNTER3: BCD_counter PORT MAP (CK,en3,a_clear,counter(12 to 15));
end Behavioral;
