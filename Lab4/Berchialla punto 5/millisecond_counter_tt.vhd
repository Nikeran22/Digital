LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity millisecond_counter_tt is
 Port (CK: in STD_LOGIC;
Enable_out: out STD_LOGIC);
end millisecond_counter_tt;

architecture Behaviour of millisecond_counter_tt is

BEGIN
PROCESS(CK)
variable count : unsigned(15 downto 0) :=(others=>'0');
BEGIN

if(CK'event and CK='1') then
Enable_out<='0';
if(count="0000000000000100") then 
count:=(others=>'0');
else 
count:=count + 1;
end if;
if(count="0000000000000100") then 
Enable_out<='1';
end if;
end if;
END PROCESS;
END Behaviour;
