library ieee;

use ieee.std_logic_1164.all;

entity testbench_lab5_es1 is
end testbench_lab5_es1;
architecture TB_ARCHITECTURE of testbench_lab5_es1 is


component LAB5_es1 IS
PORT (SW : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0));
END COMPONENT; 


SIGNAL SW :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL CLOCK,led :  STD_LOGIC;


begin
-- Unit Under Test port map
UUT : LAB5_es1
port map(
SW => SW,
KEY(0) => CLOCK,
LEDR(0) => led);

ck: Process(CLOCK) -- clock generation 
begin
if (CLOCK='U') then
CLOCK<='0';
else
CLOCK<=not(CLOCK) after 5 ns;
end if;
end process;

test: Process
begin
SW<="00"; --reset
wait for 50 ns;
SW<="01";
wait for 70 ns;
SW<="11";
wait for 70 ns;
SW<="00"; --reset
wait for 70 ns;
wait;
end process;

end TB_ARCHITECTURE;
