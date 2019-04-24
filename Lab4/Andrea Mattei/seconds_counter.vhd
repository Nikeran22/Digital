library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seconds_counter is
    port(clock: in std_logic;
			reset: in std_logic;
         overflow: out std_logic);
end seconds_counter; 

architecture seconds_counter_behaviour of seconds_counter is

begin
    count : process(clock,reset)
--  variable counter: integer range 0 to 50000000;
    variable counter: integer range 0 to 5;
  
    begin
	     if(reset='1') then
		      counter:=0;
                overflow<='0';
        elsif(clock'event and clock='1') then
            if(counter=(5-1)) then
--          if(counter=(50000000-1)) then
                counter:=0;
                overflow<='1';
            else
                counter:=counter+1;
                overflow<='0';
            end if;
        end if;
    end process ; -- count

    
end seconds_counter_behaviour;