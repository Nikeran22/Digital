LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity TFFs is
 Port (t, clockk, clearr: in STD_LOGIC;
 q : out STD_LOGIC);
end TFFs;

architecture Behavioral of TFFs is

signal t_temp: std_logic;
begin

	process(clockk, clearr)
	begin
	
		if(clearr='1') then 
			t_temp <='0';
			
		elsif (rising_edge(clockk)) then
			t_temp <= t XOR t_temp;
			
		end if;
	end process;
	
	q <= t_temp;

end Behavioral;
