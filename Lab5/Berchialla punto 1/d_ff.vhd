LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY d_ff IS
PORT (D, Clock, Resetn,setn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END d_ff;
ARCHITECTURE Behavior OF d_ff IS
BEGIN
PROCESS (Clock, Resetn)
BEGIN
IF (Clock'EVENT AND Clock = '1') THEN
IF (Resetn = '0' or setn='0') THEN -- synchronous clear/set

if(resetn='0') then
Q <= '0';
else
Q <= '1';
end if;
ELSE
Q <= D;
END IF;
END IF;
END PROCESS;
END Behavior;
