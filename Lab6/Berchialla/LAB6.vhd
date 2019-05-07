LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity LAB6 is
 Port (
data_in : in std_logic_vector(7 downto 0);
start,reset,CK : in std_logic;
done: out std_logic);
end LAB6;

architecture Behavioral of LAB6 is



--COMPONENTS INITIALIZATION--------------------
component adder IS PORT (A: in std_logic_vector( 10 downto 0);
		B: in std_logic_vector(10 downto 0);
		S: out std_logic_vector(10 downto 0);
		cin: in std_logic);
end component; 

component shreg is
port(
		parallel_input: in std_logic_vector(10 downto 0);
		parallel_output: out std_logic_vector(10 downto 0);
		SL, SR, LOAD, CLK, RESET: in std_logic);
end component; 


component conv8_11 is

port(
		input: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(10 downto 0));
end component; 

component conv11_8 is

port(
		input: in std_logic_vector(10 downto 0);
		output: out std_logic_vector(7 downto 0));
end component; 

component counter10 is
 Port (CK,Reset,Load,up,down: in STD_LOGIC;
Input: in STD_LOGIC_VECTOR(9 downto 0);
tcu,tcd: out STD_LOGIC;
Q: out STD_LOGIC_VECTOR(9 downto 0));
end component; 

component counter2 is
 Port (CK,Reset,Load,up,down: in STD_LOGIC;
Input: in STD_LOGIC_VECTOR(1 downto 0);
tcu,tcd: out STD_LOGIC;
Q: out STD_LOGIC_VECTOR(1 downto 0));
end component; 

component reg is
port(
		parallel_input: in std_logic_vector(10 downto 0);
		parallel_output: out std_logic_vector(10 downto 0);
		LOAD, CLK, RESET: in std_logic);
end component; 

component reg_8_1kB is --1kByte register 8 bit data 
	port(
			cs, wr, rd: in std_logic;
			address: in std_logic_vector(9 downto 0);
			input: in std_logic_vector(7 downto 0);
			output: out std_logic_vector(7 downto 0);
			clock: in std_logic);
end component; 

component cu is
    port( clock,reset,start,tcua,tcda,tcul,tcub:in std_logic;
	  loopc: in std_logic_vector(1 downto 0);
ResetA,ResetB,ResetL,ResetSR,ResetOP,ResetR,WRA,CSA,RDA,cuA,LoadA,LoadSR,SR,SL,LoadOP,LoadR,cin,cuL,cdA,WRB,CSB,cuB,DONE_out : out std_logic);

end component; 



------------------------------------------------

signal csA,wrA,rdA,csB,wrB,rdB,cin,SL,SR,LoadSR,ResetSR,LoadOP,ResetOP,LoadR,ResetR,ResetA,LoadA,cuA,cdA,tcuA,tcdA,ResetB,LoadB,cuB,cdB,tcuB,tcdB,ResetL,LoadL,cuL,cdL,tcuL,tcdL: std_logic;
signal outputA,inputB,outputB: std_logic_vector(7 downto 0);
signal addressA,addressB,Load_AddressB: std_logic_vector(9 downto 0);
signal operand1,operand2,sum,outputConv,outputSR: std_logic_vector(10 downto 0);
signal loopc,load_loopc: std_logic_vector(1 downto 0);
BEGIN
-- to do signal assignements?


MEMA: reg_8_1kB PORT MAP (csA,wrA,rdA,AddressA,data_in,OutputA,CK);
MEMB: reg_8_1kB PORT MAP (csB,wrB,rdB,AddressB,InputB,OutputB,CK);
ADD: adder PORT MAP(Operand1,Operand2,Sum,cin);
SHIFT_REG: shreg PORT MAP (OutputConv,OutputSR,SL,SR,LoadSR,CK,ResetSR);
OPERAND: reg PORT MAP (OutputSR,Operand2,LoadOP,CK,ResetOP);
RESULT: reg  PORT MAP (Sum,Operand1,LoadR,CK,ResetR);
CONV811: conv8_11 PORT MAP(OutputA,OutputConv);
CONV118: conv11_8 PORT MAP(Operand1,InputB);
AdrA: counter10 PORT MAP (CK,ResetA,LoadA,cuA,cdA,AddressB,tcuA,tcdA,AddressA);
AdrB: counter10 PORT MAP (CK,ResetB,LoadB,cuB,cdB,Load_AddressB,tcuB,tcdB,AddressB);
loop_counter: counter2 PORT MAP (CK,ResetL,LoadL,cuL,cdL,Load_loopc,tcuL,tcdL,loopc);
CONTROL_UNIT: cu PORT MAP(CK,reset,start,tcua,tcda,tcul,tcub,loopc,ResetA,ResetB,ResetL,ResetSR,ResetOP,ResetR,WRA,CSA,RDA,cuA,LoadA,LoadSR,SR,SL,LoadOP,LoadR,cin,cuL,cdA,WRB,CSB,cuB,DONE);
end Behavioral;
