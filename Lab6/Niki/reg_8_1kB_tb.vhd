-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


ENTITY reg_8_1kB_tb IS
END reg_8_1kB_tb;

ARCHITECTURE Behavior OF reg_8_1kB_tb IS

signal clk, csin, wrin,rdin : std_logic;
signal din,dout : std_logic_vector(7 downto 0);
signal inaddress: std_logic_vector(9 downto 0);


component reg_8_1kB is --1kByte register 8 bit data
	port(
			cs, wr, rd: in std_logic;
			address: in std_logic_vector(9 downto 0);
			input: in std_logic_vector(7 downto 0);
			output: out std_logic_vector(7 downto 0);
			clock: in std_logic);
end component;

BEGIN
dut: reg_8_1kB PORT MAP (csin, wrin, rdin, inaddress, din, dout, clk);

PROCESS
BEGIN


-----------RESET-----------------------
csin<='0';
rdin<='0';
wrin<='0';
din<="00000000";
inaddress<="0000000000";
clk<='0';
WAIT FOR 20 ns;
csin<='0';
rdin<='0';
wrin<='0';
din<="00000000";
inaddress<="0000000000";
clk<='1';
WAIT FOR 20 ns;
----------------------------------

---------------LOAD -------------------
csin<='1';
rdin<='0';
wrin<='1';
din<="00111000";
inaddress<="0010010001";
clk<='0';
WAIT FOR 20 ns;
csin<='1';
rdin<='0';
wrin<='1';
din<="00111000";
inaddress<="0010010001";
clk<='1';
WAIT FOR 20 ns;
----------------------------------
---------------LOAD -------------------
csin<='1';
rdin<='0';
wrin<='1';
din<="01100000";
inaddress<="0110010001";
clk<='0';
WAIT FOR 20 ns;
csin<='1';
rdin<='0';
wrin<='1';
din<="01100000";
inaddress<="0110010001";
clk<='1';
WAIT FOR 20 ns;
----------------------------------
---------------READ -------------------
csin<='1';
rdin<='1';
wrin<='0';
din<="00111000";
inaddress<="0010010001";
clk<='0';
WAIT FOR 20 ns;
csin<='1';
rdin<='1';
wrin<='0';
din<="00111000";
inaddress<="0010010001";
clk<='1';
WAIT FOR 20 ns;
----------------------------------
---------------READ-------------------
csin<='1';
rdin<='1';
wrin<='0';
din<="01100000";
inaddress<="0110010001";
clk<='0';
WAIT FOR 20 ns;
csin<='1';
rdin<='1';
wrin<='0';
din<="01100000";
inaddress<="0110010001";
clk<='1';
WAIT FOR 20 ns;
----------------------------------

WAIT;
END PROCESS;



END Behavior;