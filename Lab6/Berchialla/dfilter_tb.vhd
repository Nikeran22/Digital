-- library declaration
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;


ENTITY dfilter_tb IS
END dfilter_tb;

ARCHITECTURE Behavior OF dfilter_tb IS

signal clock, start,reset:  std_logic;
		signal D_IN:  std_logic_vector(7 downto 0);
		
		signal done: std_logic;

component LAB6 is
Port(data_in : in std_logic_vector(7 downto 0);
start,reset,CK : in std_logic;
done: out std_logic);
end component;

BEGIN
dut: LAB6 PORT MAP (D_in,start,reset,clock,done);

ck: Process(CLOCK) -- clock generation 
begin
if (CLOCK='U') then
CLOCK<='0';
else
CLOCK<=not(CLOCK) after 5 ns;
end if;
end process;


PROCESS
BEGIN

start<='0';
reset<='1';
wait for 10 ns;

reset<='0';
start<='1';

for cnt_val in 0 to 1023 loop

D_in<=std_logic_vector(to_unsigned(cnt_val, 8));

WAIT FOR 10 ns;

end loop;

WAIT;
END PROCESS;



END Behavior;