library IEEE;
	use IEEE.std_logic_1164.all;
	use ieee.numeric_std.ALL;
--	use ieee.std_logic_arith.all;


entity reg_8_1kB is --1kByte register 8 bit data 
	port(
			cs, wr, rd: in std_logic;
			address: in std_logic_vector(9 downto 0);
			input: in std_logic_vector(7 downto 0);
			output: out std_logic_vector(7 downto 0);
			clock: in std_logic);
end reg_8_1kB;

architecture behave of reg_8_1kB is

	type MEM_array is array(0 to 1023)  of std_logic_vector(7 downto 0);
	signal mem: MEM_array := (others => "00000000");
	
	begin
		process(clock,rd)
			begin
			if(cs='1') then
				if(rd ='1') then
					output<=std_logic_vector(mem(to_integer(unsigned(address))));
				elsif(rising_edge(clock)) then
						if(wr = '1') then
							mem(to_integer(unsigned(address))) <= input;
						end if;
				end if;		
			end if;
		end process;

end behave;
			
				
					
					
					
		
			
		
		
