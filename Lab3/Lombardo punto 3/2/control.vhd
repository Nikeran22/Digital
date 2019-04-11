LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;


ENTITY control IS PORT(
ai: IN SIGNED (3 downto 0);
bi: IN SIGNED (3 downto 0);
ao: out SIGNED (3 downto 0);
bo: out sIGNED (3 downto 0);
po: out std_logic);
END control;

ARCHITECTURE AR OF control IS
BEGIN
ao<=ai;
bo<=bi;
po<=(ai(0) xor bi(0)) and (ai(1) xor bi(1)) and (ai(2) xor bi(2))and (ai(3) xor bi(3)) ;
end AR;