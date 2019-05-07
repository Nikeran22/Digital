library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
-- 8 bit (*signed*) shift register with parallel input, parallel output, SL, SR, LOAD, RESET
entity shreg is
port(
		parallel_input: in std_logic_vector(10 downto 0);
		parallel_output: out std_logic_vector(10 downto 0);
		SL, SR, LOAD, CLK, RESET: in std_logic);
end shreg;

architecture behave of shreg is
--signal temp : signed(7 downto 0);
begin

	process(reset,clk)
	
	variable temp : signed(10 downto 0);

	begin
		if(RESET='1') then
			parallel_output<="00000000000";
		elsif(rising_edge(clk)) then
			if(load='1') then
				temp:=signed(parallel_input);
			end if;
			if(SR='1') then
				temp:=shift_right(temp,1);
			end if;
			if(SL='1') then 
				temp:=shift_left(temp,1);
			end if;
			parallel_output<=std_logic_vector(temp);
		end if;
	end process;
end behave;


