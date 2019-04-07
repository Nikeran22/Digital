LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity millisecond_counter is
 Port (CK: in STD_LOGIC;
Enable_out: out STD_LOGIC);
end millisecond_counter;

architecture Behaviour of millisecond_counter is

BEGIN
PROCESS(CK)
variable count : unsigned(15 downto 0) :=(others=>'0');
BEGIN

if(CK'event and CK='1') then
if(count="1100001101010000") then 
count:=(others=>'0');
Enable_out<='1';
else 
count:=count + 1;
Enable_out<='0';
end if;
end if;
END PROCESS;
END Behaviour;
