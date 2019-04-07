LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity BCD_counter is
Port (CK,Enable,a_clear: in STD_LOGIC;
counter: out std_logic_vector(3 downto 0);
Enable_out: out STD_LOGIC);
end BCD_counter;

architecture Behaviour of BCD_counter is
BEGIN
PROCESS(CK,a_clear)
variable count :unsigned(3 downto 0):=(others=>'0');
BEGIN
if(a_clear='1') then count:=(others=>'0');
else
if(CK='1' and CK'event) then
if(Enable='1') then
if(count="1001") then 
count:=(others=>'0');
else 
count:=count+1;
if(count="1001") then 
Enable_out<='1';
else
Enable_out<='0';
end if;
end if;
end if;
end if;
end if;
counter<=std_logic_vector(count);
END PROCESS;
END Behaviour;