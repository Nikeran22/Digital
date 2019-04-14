LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity reg7 is 
port( 
resetn: in std_logic;
clockreg: in std_logic;
inreg: in std_logic_vector(6 downto 0);
outreg :out STD_LOGIC_VECTOR(6 downto 0));

end reg7;

architecture beha of reg7 is

begin

process(clockreg)
begin
	if (resetn ='0') then
		outreg<="0000000";
	elsif(rising_edge(clockreg)) then
		outreg<=inreg;
	end if;
end process;
end beha;
