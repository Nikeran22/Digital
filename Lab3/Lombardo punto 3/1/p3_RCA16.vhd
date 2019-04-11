LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;
 
ENTITY p3_RCA16 IS PORT ( 
SW1: IN SIGNED(15 DOWNTO 0);   --A
SW2: IN SIGNED(31 DOWNTO 16);  --B
KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0); --reset     key1-> clock key0-> asynchronous reset
LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 9); --overflow
HEX0,HEX1,HEX2,HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --A,NUMBER DISPLAY
HEX4,HEX5,HEX6,HEX7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --B,NUMBER DISPLAY
HEX8,HEX9,HEX10,HEX11 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); --S,NUMBER DISPLAY
END p3_RCA16; 


ARCHITECTURE Behavior OF p3_RCA16 IS 

SIGNAL A,B,S,SREG,SDISP : SIGNED(15 DOWNTO 0);
SIGNAL RST,overflow : STD_LOGIC;
SIGNAL SN: STD_LOGIC; -- SIGN number 


component FA16 IS PORT ( 
cin: IN STD_LOGIC;
a,b: IN SIGNED(15 DOWNTO 0);
s : OUT SIGNED(15 DOWNTO 0);
overflow : OUT STD_LOGIC);
end component; 


COMPONENT decoderHEX16bit is
port		(input : in signed(3 downto 0);  
		output : out std_logic_vector(6 downto 0)); 
END COMPONENT;



COMPONENT regn IS
GENERIC ( N : integer:=16);
PORT (R : IN SIGNED(N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;


COMPONENT flipflop IS
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END COMPONENT;


BEGIN 

RST<=not (KEY(0));

REG0: REGN PORT MAP (SW1,KEY(1),RST,A);
REG1: REGN PORT MAP (SW2,KEY(1),RST,B);

ADDER16: FA16 PORT MAP('0',A,B,S,overflow);
REG2: REGN PORT MAP (S,KEY(1),RST,SREG);


--A representation----------------------------------
DEC3: decoderHEX16bit PORT MAP (A(15 downto 12),HEX3);
DEC2: decoderHEX16bit PORT MAP (A(11 downto 8),HEX2);
DEC1: decoderHEX16bit PORT MAP (A(7 downto 4),HEX1);
DEC0: decoderHEX16bit PORT MAP (A(3 downto 0),HEX0);
-----------------------------------------------------
--B representation----------------------------------
DEC7: decoderHEX16bit PORT MAP (B(15 downto 12),HEX7);
DEC6: decoderHEX16bit PORT MAP (B(11 downto 8),HEX6);
DEC5: decoderHEX16bit PORT MAP (B(7 downto 4),HEX5);
DEC4: decoderHEX16bit PORT MAP (B(3 downto 0),HEX4);
-----------------------------------------------------
--OUTPUT----------------------------------


DEC11: decoderHEX16bit PORT MAP (SREG(15 downto 12),HEX11);
DEC10: decoderHEX16bit PORT MAP (SREG(11 downto 8),HEX10);
DEC9: decoderHEX16bit PORT MAP (SREG(7 downto 4),HEX9);
DEC8: decoderHEX16bit PORT MAP (SREG(3 downto 0),HEX8);
-----------------------------------------------------

FF0: flipflop PORT MAP (overflow,KEY(1),RST,LEDR(9));


END Behavior; 
