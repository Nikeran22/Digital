library ieee;
-- use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
entity testbench_lab3_es2 is
end testbench_lab3_es2;
architecture TB_ARCHITECTURE of testbench_lab3_es2 is
component lab3_es2 IS PORT ( 
SW: IN SIGNED(8 DOWNTO 0);
KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 9);
HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END COMPONENT; 



signal CK : std_logic_vector(1 downto 0);
signal Ad,Bd,Sd : std_logic_vector(3 downto 0);
signal A,B : signed (3 downto 0);
signal SW : signed (8 downto 0);
signal HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : std_logic_vector(6 downto 0);
signal overflow : std_logic_vector(9 downto 9);
signal changheSW,add_subtract : std_logic;
begin
-- Unit Under Test port map
UUT : lab3_es2
port map(
KEY => CK,
SW => SW,
HEX0 => HEX0,
HEX1 => HEX1,
HEX2 => HEX2,
HEX3 => HEX3,
HEX4 => HEX4,
HEX5 => HEX5,
LEDR => overflow
);

clock: Process(CK) -- clock generation
begin
if (CK(1)='U') then
CK<="00";
else
CK(1)<=not(CK(1)) after 10 ps;
end if;
end process;

clock1: Process(changheSW) -- clock generation for counter
begin
if (changheSW='U') then
changheSW<='0';
else
changheSW<=not(changheSW) after 100 ps;
end if;
end process;

Process (changheSW) -- generation of input vectors
variable count:signed (8 downto 0):="000000000" ;
begin
if (changheSW'event and changheSW='1') then
count:=count+"000000001";
SW<=count;
A <= count(3 downto 0);
B <= count(7 downto 4);
add_subtract<=count(8);
end if;
end process;

process (HEX4,HEX5) --A displayed
begin
if HEX4 = "1000000" then Ad<="0000"; 
	  
end if;

if HEX4 = "1111001" then--1 
	if HEX5(6)='1' then Ad<="0001";
	else Ad<="1111";
end if;
end if;

if HEX4 = "0100100"then --2
	if HEX5(6)='1' then Ad<="0010";
	else Ad<="1110";
end if;
end if;

if HEX4 = "0110000"then --3
	if HEX5(6)='1' then Ad<="0011";
	else Ad<="1101";
end if;
end if;

if HEX4 = "0011001"then --4
	if HEX5(6)='1' then Ad<="0100";
	else Ad<="1100";
end if;
end if;

if HEX4 = "0010010" then--5
	if HEX5(6)='1' then Ad<="0101";
	else Ad<="1011";
end if;
end if;

if HEX4 = "0000010" then--6
	if HEX5(6)='1' then Ad<="0110";
	else Ad<="1010";
end if;
end if;

if HEX4 = "1111000" then--7
	if HEX5(6)='1' then Ad<="0111";
	else Ad<="1001";
end if;
end if;

if HEX4 = "0000000" then Ad<="1000"; -- -8
	
end if;
end process;

process (HEX2,HEX3) --B displayed
begin
if HEX2 = "1000000" then--0
	  Bd<="0000";

end if;

if HEX2 = "1111001" then --1 
	if HEX3(6)='1' then Bd<="0001";
	else Bd<="1111";
end if;
end if;

if HEX2 = "0100100" then--2
	if HEX3(6)='1' then Bd<="0010";
	else Bd<="1110";
end if;
end if;

if HEX2 = "0110000" then--3
	if HEX3(6)='1' then Bd<="0011";
	else Bd<="1101";
end if;
end if;

if HEX2 = "0011001" then--4
	if HEX3(6)='1' then Bd<="0100";
	else Bd<="1100";
end if;
end if;

if HEX2 = "0010010" then--5
	if HEX3(6)='1' then Bd<="0101";
	else Bd<="1011";
end if;
end if;

if HEX2 = "0000010" then--6
	if HEX3(6)='1' then Bd<="0110";
	else Bd<="1010";
end if;
end if;

if HEX2 = "1111000" then--7
	if HEX3(6)='1' then Bd<="0111";
	else Bd<="1001";
end if;
end if;

if HEX2 = "0000000" then Bd<="1000"; -- -8
	
end if;

end process;

process (HEX0,HEX1) --S displayed
begin
if HEX0 = "1000000" then--0
	  Sd<="0000";

end if;

if HEX0 = "1111001" then--1 
	if HEX1(6)='1' then Sd<="0001";
	else Sd<="1111";
end if;
end if;

if HEX0 = "0100100" then--2
	if HEX1(6)='1' then Sd<="0010";
	else Sd<="1110";
end if;
end if;

if HEX0 = "0110000" then--3
	if HEX1(6)='1' then Sd<="0011";
	else Sd<="1101";
end if;
end if;

if HEX0 = "0011001" then--4
	if HEX1(6)='1' then Sd<="0100";
	else Sd<="1100";
end if;
end if;

if HEX0 = "0010010" then--5
	if HEX1(6)='1' then Sd<="0101";
	else Sd<="1011";
end if;
end if;

if HEX0 = "0000010" then--6
	if HEX1(6)='1' then Sd<="0110";
	else Sd<="1010";
end if;
end if;

if HEX0 = "1111000" then--7
	if HEX1(6)='1' then Sd<="0111";
	else Sd<="1001";
end if;
end if;

if HEX0 = "0000000" then Sd<="1000"; -- -8
	
end if;

end process;

end TB_ARCHITECTURE;
