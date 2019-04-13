library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity digit_counter is
    port(clock: in std_logic;
         add: in std_logic;
			reset: in std_logic;
         digit: out std_logic_vector(3 downto 0));
end digit_counter; 

architecture digit_counter_behaviour of digit_counter is
begin
    count : process(clock,reset)
    variable counter:unsigned(3 downto 0);
    begin
	     if(reset='1') then
				counter:="0000";
        elsif(clock'event and clock='1') then
            if(add='1') then
                if(counter=10) then
                    counter:="0000";
                else
                    counter:=counter+1;
               end if;
            end if;
        end if; 
    digit <=std_logic_vector(counter);
    end process ; -- count

    
end digit_counter_behaviour;