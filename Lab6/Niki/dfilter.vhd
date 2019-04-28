library IEEE;
	use IEEE.std_logic_1164.all;

entity dfilter is 
	port(
		clk: in std_logic;
		D_IN: in std_logic_vector(7 downto 0);
		D_OUT: out std_logic_vector(7 downto 0));
	end dfilter;
	
architecture FSM of dfilter is
begin
end FSM;

	