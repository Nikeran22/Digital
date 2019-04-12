
library ieee;
-- use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
entity testbench_lab4_es5_tt is
end testbench_lab4_es5_tt;
architecture TB_ARCHITECTURE of testbench_lab4_es5_tt is


component LAB4_es5_tt is
Port (KEY: in STD_LOGIC_VECTOR(3 downto 0);
CLOCK_50 : in STD_logic;
SW: in STD_LOGIC_VECTOR(7 downto 0);
LEDR : out STD_logic_vector(0 downto 0);
 BCD_count : out STD_LOGIC_VECTOR(15 downto 0));
END COMPONENT; 


signal KEY: STD_LOGIC_VECTOR(3 downto 0);
signal CLOCK : STD_logic;
signal SW: STD_LOGIC_VECTOR(7 downto 0);
signal BCD_count : STD_logic_vector(15 downto 0);
signal led: std_logic;

begin
-- Unit Under Test port map
UUT : LAB4_es5_tt
port map(
KEY => KEY,
CLOCK_50 => CLOCK,
SW => SW,
BCD_count => BCD_count,
LEDR(0) => led
);

ck: Process(CLOCK) -- clock generation 20ps
begin
if (CLOCK='U') then
CLOCK<='0';
else
CLOCK<=not(CLOCK) after 10 ps;
end if;
end process;

test: Process
begin
KEY<="0000";
SW<="11111111";  --setting waiting time to max = 25500 ps
wait for 40 ps;
KEY(0)<='1';
wait for 40 ps;
KEY(0)<='0';
wait for 1025600 ps; --want a reaction time greater than 9999
KEY(3)<='1';
wait;
end process;

end TB_ARCHITECTURE;
