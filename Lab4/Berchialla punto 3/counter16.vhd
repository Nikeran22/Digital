LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity counter16 is
 Port (CK,Enable,Clear: in STD_LOGIC;
Q: out STD_LOGIC_VECTOR(15 downto 0));
end counter16;

architecture Behaviour of counter16 is
BEGIN
PROCESS(CK)
variable count :unsigned(15 downto 0);
BEGIN
if(CK='1' and CK'event) then
if(Clear='0') then count:=(others=>'0');
else 
if(Enable='1') then count:=count+1;
end if;
end if;
end if;
Q<=STD_LOGIC_VECTOR(count);
END PROCESS;
END Behaviour;