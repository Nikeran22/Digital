library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity reg is
port(
		parallel_input: in std_logic_vector(10 downto 0);
		parallel_output: out std_logic_vector(10 downto 0);
		LOAD, CLK, RESET: in std_logic);
end reg;

architecture behave of reg is

begin

	process(reset,clk)
	
	

	begin
		if(RESET='1') then
			parallel_output<="00000000000";
		elsif(rising_edge(clk)) then
			if(load='1') then
				parallel_output<=parallel_input;
			
			end if;
		end if;
	end process;
end behave;


