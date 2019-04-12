LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity counter_comparator is
 Port (CK,enable,a_clear: in STD_LOGIC;
compare: in STD_LOGIC_VECTOR(7 DOWNTO 0);
Enable_out: out STD_LOGIC);
end counter_comparator;

architecture Behaviour of counter_comparator is
BEGIN
PROCESS(CK,a_clear)
variable count :unsigned(7 downto 0):=(others=>'0');
variable stop_count: std_logic:='0';
BEGIN
if(a_clear='1') then 
count:=(others=>'0');
stop_count:='0';
Enable_out<='0';
else
if(CK='1' and CK'event) then
if(enable='1') then
if(count=unsigned(compare)) then 
count:=(others=>'0');
stop_count:='1';
Enable_out<='1';
else
if(stop_count='0') then 
count:=count+1;
Enable_out<='0';
end if;
end if;
end if;
end if;
end if;
END PROCESS;
END Behaviour;
