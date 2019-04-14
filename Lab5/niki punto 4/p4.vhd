LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity p4 is 
port( 
Key: in std_logic_vector(0 downto 0);  --resetn
clock_50: in std_logic;
HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out STD_LOGIC_VECTOR(6 downto 0));

end p4;

architecture behave of p4 is

type state_type is (H, E, L, L1, O,VOID);
signal ps, ns: state_type;
signal clock1: std_logic;

signal H0, H1, H2, H3, H4, H5 : STD_LOGIC_VECTOR(6 downto 0);
signal z: std_logic_vector(6 downto 0);



component reg7 is 
port( 
resetn: in std_logic;
clockreg: in std_logic;
inreg: in std_logic_vector(6 downto 0);
outreg: out STD_LOGIC_VECTOR(6 downto 0));

end component;




begin 

comb_proc: process(ps)
begin
	case ps is
		when H => 
						ns<=E;
		when E => 
						ns<=L;
		when L => 
						ns<=L1;
		when L1 => 
						ns<=O;
		when O => 
						ns<=void;
		when VOID => 
						ns<=H;
	end case;
end process comb_proc;

---------------------------------------------------

sync_proc: PROCESS (clock_50) -- state flip-flops

variable count : natural;
 
BEGIN
if (rising_edge(clock_50)) then
		if (key = "0") then
				ps <= H;
		else	
				clock1 <='0';
				count:=count+1;
			if (count = 50000000) then
				--if (count = 2) then   --testbench
					ps<=ns;
					clock1<='1';
					count:=0;
					
				end if;
		end if;
end if;
END PROCESS sync_proc;

----------------------------------------------------


comb_proc2:process(ps)
Variable z_var: std_logic_vector(6 downto 0);
begin
z_var:="0000000";
case ps is
when H =>	z_var:="1110110";
when E =>	z_var:="1111001";
when L =>	z_var:="0111000";
when L1 =>	z_var:="0111000";
when O =>	z_var:="0111111";
when others => z_var:="0000000";
end case;
Z<=z_var;

end process comb_proc2;

R0: reg7 port map(key(0),clock1,z,H0);
R1: reg7 port map(key(0),clock1,H0,H1);
R2: reg7 port map(key(0),clock1,H1,H2);
R3: reg7 port map(key(0),clock1,H2,H3);
R4: reg7 port map(key(0),clock1,H3,H4);
R5: reg7 port map(key(0),clock1,H4,H5);

HEX0<=H0;
HEX1<=H1;
HEX2<=H2;
HEX3<=H3;
HEX4<=H4;
HEX5<=H5;




end behave;