LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY d_ff IS
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END d_ff;
ARCHITECTURE Behavior OF d_ff IS
BEGIN
PROCESS (Clock, Resetn)
BEGIN
IF (Clock'EVENT AND Clock = '1') THEN
IF (Resetn = '0' ) THEN -- synchronous clear
Q <= '0';
ELSE
Q <= D;
END IF;
END IF;
END PROCESS;
END Behavior;
