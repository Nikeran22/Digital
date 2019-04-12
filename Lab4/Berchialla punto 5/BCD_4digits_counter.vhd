LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity BCD_4digits_counter is
Port(CK,Enable,a_clear: in STD_LOGIC;

counter: out STD_LOGIC_VECTOR(15 downto 0));
end BCD_4digits_counter;

architecture Behavioral of BCD_4digits_counter is

signal eno1,eno2,eno3,en1,en2,en3 : STD_LOGIC;

--COMPONENTS INITIALIZATION--------------------
component BCD_counter IS PORT (
CK,millisecond,Enable,a_clear: in STD_LOGIC;
counter: out std_logic_vector(3 downto 0);
Enable_out: out STD_LOGIC);
end component; 
------------------------------------------------


BEGIN
en1<=Enable and eno1;
en2<=Enable and eno2;
en3<=Enable and eno3;
COUNTER0: BCD_counter PORT MAP (CK,Enable,Enable,a_clear,counter(15 downto 12),eno1);
COUNTER1: BCD_counter PORT MAP (CK,Enable,en1,a_clear,counter(11 downto 8),eno2);
COUNTER2: BCD_counter PORT MAP (CK,Enable,en2,a_clear,counter(7 downto 4),eno3);
COUNTER3: BCD_counter PORT MAP (CK,Enable,en3,a_clear,counter(3 downto 0));
end Behavioral;
