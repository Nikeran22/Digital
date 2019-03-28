
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_lab2_es2 IS
END testbench_lab2_es2 ;

ARCHITECTURE mytest OF testbench_lab2_es2 IS
SIGNAL HEX0_tb,HEX1_tb,HEX2_tb,HEX3_tb,HEX4_tb, H_tb,E_tb,L_tb,O_tb,C_tb,P_tb,F_tb,z_tb: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL SW_tb: STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL error: STD_LOGIC;

COMPONENT Part2
PORT (  SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0); 
HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

BEGIN

uut: part2 PORT MAP (SW=> SW_tb ,HEX0=> HEX4_tb, HEX1=> HEX3_tb, HEX2=> HEX2_tb, HEX3=> HEX1_tb, HEX4=> HEX0_tb);

PROCESS
BEGIN
H_tb<="0001001";
E_tb<="0000110";
L_tb<="1000111";
O_tb<="1000000";
C_tb<="1000110";
P_tb<="0001100";
F_tb<="0001110";
z_tb<="1111111";

SW_tb(1 downto 0)<= "00";
SW_tb(4 downto 2)<= "000";
 WAIT FOR 20 ps;
 IF (HEX0_tb = H_tb and HEX1_tb = E_tb and HEX2_tb = L_tb and HEX3_tb = L_tb and HEX4_tb = O_tb) THEN error<='0';
ELSE error<='1'; 
END IF;

 WAIT FOR 200 ns;
SW_tb(4 downto 2)<= "001";
 WAIT FOR 20 ps;
 IF (HEX0_tb = E_tb and HEX1_tb = L_tb and HEX2_tb = L_tb and HEX3_tb = O_tb and HEX4_tb = H_tb) THEN error<='0';
ELSE error<='1'; 
END IF;

WAIT FOR 200 ns;
SW_tb(4 downto 2)<= "010";
 WAIT FOR 20 ps;
 IF HEX0_tb = L_tb and HEX1_tb = L_tb and HEX2_tb = O_tb and HEX3_tb = H_tb and HEX4_tb = E_tb THEN error<='0';
ELSE error<='1'; 
END IF;

 WAIT FOR 200 ns;
 SW_tb(4 downto 2)<= "011";
 WAIT FOR 20 ps;
 IF HEX0_tb = L_tb and HEX1_tb = O_tb and HEX2_tb = H_tb and HEX3_tb = E_tb and HEX4_tb = L_tb THEN error<='0';
ELSE error<='1'; 
END IF;

 WAIT FOR 200 ns;
SW_tb(4 downto 2)<= "100";
 WAIT FOR 20 ps;
 IF HEX0_tb = O_tb and HEX1_tb = H_tb and HEX2_tb = E_tb and HEX3_tb = L_tb and HEX4_tb = L_tb THEN error<='0';
ELSE error<='1'; 
END IF;

 WAIT FOR 200 ns;
SW_tb(1 downto 0)<= "01";
SW_tb(4 downto 2)<= "000";
 WAIT FOR 20 ps;
 IF HEX0_tb = C_tb and HEX1_tb = E_tb and HEX2_tb = P_tb and HEX3_tb = P_tb and HEX4_tb = O_tb THEN error<='0';
ELSE error<='1'; 
END IF;


 WAIT FOR 200 ns;
SW_tb(1 downto 0)<= "10";
SW_tb(4 downto 2)<= "000";
 WAIT FOR 20 ps;
 IF HEX0_tb = C_tb and HEX1_tb = E_tb and HEX2_tb = L_tb and HEX3_tb = L_tb and HEX4_tb = O_tb THEN error<='0';
ELSE error<='1'; 
END IF;

 WAIT FOR 200 ns;
SW_tb(1 downto 0)<= "11";
SW_tb(4 downto 2)<= "000";
 WAIT FOR 20 ps;
 IF HEX0_tb = F_tb and HEX1_tb = E_tb and HEX2_tb = P_tb and HEX3_tb = P_tb and HEX4_tb = O_tb THEN error<='0';
ELSE error<='1'; 
END IF;

 WAIT FOR 200 ns;
WAIT;
END PROCESS;
END mytest;