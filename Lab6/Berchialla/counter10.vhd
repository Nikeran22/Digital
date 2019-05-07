LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity counter10 is
 Port (CK,Reset,Load,up,down: in STD_LOGIC;
Input: in STD_LOGIC_VECTOR(9 downto 0);
tcu,tcd: out STD_LOGIC;
Q: out STD_LOGIC_VECTOR(9 downto 0));
end counter10;

architecture Behaviour of counter10 is
BEGIN
PROCESS(CK)
variable count :unsigned(9 downto 0);
BEGIN
if(CK='1' and CK'event) then
if(Reset='1') then count:=(others=>'0');

else 
if(Load='1') then
count:=unsigned(Input);


else


if(up='1') then
if(count="1111111111") then 
count:=(others=>'0'); 
else
count:=count+1;
end if;
end if;
if(down='1')then
if(count="0000000000") then 
count:=(others=>'1'); 
else
count:=count-1;
end if;
end if;
end if;
end if;
end if;

if (count="0000000000") then 
tcd<='1';
else 
tcd<='0';
end if;
if (count="1111111111")then 
tcu<='1';
else 
tcu<='0';
end if;

Q<=STD_LOGIC_VECTOR(count);
END PROCESS;
END Behaviour;
