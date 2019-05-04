library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	
entity counter_1024 is
port(
		clk,count_up,count_down,en,clear: in std_logic;
		count: out std_logic_vector(9 downto 0));
end counter_1024;

architecture behave of counter_1024 is
begin

process(clk,clear,EN)
variable c_var: unsigned(9 downto 0) := "0000000000";
begin
	if(EN='1' and clear='0') then
		if(rising_edge(clk)) then 
			if(count_up='1') then
				c_var:=c_var+1;
			elsif(count_down='1') then
				if(c_var="0000000000") then
					c_var:="0000000000";
				else
					c_var:=c_var-1;

				end if;
			end if;
		end if;
	elsif(clear='1') then
		c_var:="0000000000";
	end if;
	
count<=STD_LOGIC_VECTOR(c_var);
end process;
end behave;

			
				
				
				
			
	
		
	
		