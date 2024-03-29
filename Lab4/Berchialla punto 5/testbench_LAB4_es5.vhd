
library ieee;
-- use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
entity testbench_lab4_es5 is
end testbench_lab4_es5;
architecture TB_ARCHITECTURE of testbench_lab4_es5 is


component LAB4_es5 is
Port (KEY: in STD_LOGIC_VECTOR(3 downto 0);
CLOCK_50 : in STD_logic;
SW: in STD_LOGIC_VECTOR(7 downto 0);
LEDR: out STD_logic_Vector(0 downto 0);
HEX0, HEX1, HEX2, HEX3 : out STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT; 


signal KEY: STD_LOGIC_VECTOR(3 downto 0);
signal CLOCK : STD_logic;
signal SW: STD_LOGIC_VECTOR(7 downto 0);
signal HEX0, HEX1, HEX2, HEX3 : STD_LOGIC_VECTOR(6 downto 0);
signal led: std_logic;

begin
-- Unit Under Test port map
UUT : LAB4_es5
port map(
KEY => KEY,
CLOCK_50 => CLOCK,
SW => SW,
HEX0 => HEX0,
HEX1 => HEX1,
HEX2 => HEX2,
HEX3 => HEX3,
LEDR(0) => led
);

ck: Process(CLOCK) -- clock generation 50MHz
begin
if (CLOCK='U') then
CLOCK<='0';
else
CLOCK<=not(CLOCK) after 10 ns;
end if;
end process;

test: Process
begin
KEY<="0000";
SW<="00000011";  --setting waiting time to 3ms
wait for 1 ms;
KEY(0)<='1';
wait for 1 ms;
KEY(0)<='0';
wait for 15 ms; --want a reaction time of 12ms
KEY(3)<='1';
wait for 1 ms;
KEY(3)<='0';
wait for 5 ms; -- wait to read the reaction time
SW<="00000001"; -- wait time to 1ms
KEY(0)<='1'; --resetting
wait for 500 us;
KEY(0)<='0';
wait for 18 ms; --reaction time of 17ms
KEY(3)<='1';
wait for 100 us;
KEY(3)<='0';
wait;
end process;

end TB_ARCHITECTURE;