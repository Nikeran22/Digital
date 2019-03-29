LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- Simple module that connects
-- the SW switches to the LEDR lights
ENTITY LED IS
PORT ( SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)); -- red LEDs
END LED;
ARCHITECTURE LED_Behavior OF LED IS
BEGIN
LEDR <= SW;
END LED_Behavior;