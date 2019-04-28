-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;


ENTITY shreg_tb IS
END shreg_tb;

ARCHITECTURE Behavior OF shreg_tb IS

signal shl, shr, ld, clk, res  : std_logic;
signal input, output : std_logic_vector(7 downto 0);

component shreg is
port(
		parallel_input: in std_logic_vector(7 downto 0);
		parallel_output: out std_logic_vector(7 downto 0);
		SL, SR, LOAD, CLK, RESET: in std_logic);
end component;

BEGIN
dut: shreg PORT MAP (input,output,shl,shr,ld,clk,res);

PROCESS
BEGIN


-----------RESET-----------------------
input<="00000000";
shl<='0';
shr<='0';
ld<='0';
res<='1';
clk<='0';
WAIT FOR 20 ns;
input<="00000000";
shl<='0';
shr<='0';
ld<='0';
res<='1';
clk<='1';
WAIT FOR 20 ns;
---------------------------------------
-----------load_unsigned-----------------------
input<="00010110";
shl<='0';
shr<='0';
ld<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
input<="00010110";
shl<='0';
shr<='0';
ld<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
---------------------------------------
-----------shift left_unsigned---------
input<="00010110";
shl<='1';
shr<='0';
ld<='0';
res<='0';
clk<='0';
WAIT FOR 20 ns;
input<="00010110";
shl<='1';
shr<='0';
ld<='0';
res<='0';
clk<='1';
WAIT FOR 20 ns;
---------------------------------------
-----------shift right_unsigned---------
input<="00010110";
shl<='0';
shr<='1';
ld<='0';
res<='0';
clk<='0';
WAIT FOR 20 ns;
input<="00010110";
shl<='0';
shr<='1';
ld<='0';
res<='0';
clk<='1';
WAIT FOR 20 ns;
---------------------------------------

-----------load_signed-----------------------
input<="11010110";
shl<='0';
shr<='0';
ld<='1';
res<='0';
clk<='0';
WAIT FOR 20 ns;
input<="11010110";
shl<='0';
shr<='0';
ld<='1';
res<='0';
clk<='1';
WAIT FOR 20 ns;
---------------------------------------
-----------shift left_signed---------
input<="11010110";
shl<='1';
shr<='0';
ld<='0';
res<='0';
clk<='0';
WAIT FOR 20 ns;
input<="11010110";
shl<='1';
shr<='0';
ld<='0';
res<='0';
clk<='1';
WAIT FOR 20 ns;
---------------------------------------
-----------shift right_signed---------
input<="11010110";
shl<='0';
shr<='1';
ld<='0';
res<='0';
clk<='0';
WAIT FOR 20 ns;
input<="11010110";
shl<='0';
shr<='1';
ld<='0';
res<='0';
clk<='1';
WAIT FOR 20 ns;
---------------------------------------




WAIT;
END PROCESS;



END Behavior;