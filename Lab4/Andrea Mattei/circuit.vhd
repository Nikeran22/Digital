library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit is
    port(CLOCK_50:in std_logic;
	      KEY:in std_logic_vector(3 downto 0);
         HEX0:out std_logic_vector(6 downto 0));
end circuit;

architecture circuit_behaviour of circuit is

    component digit_counter is
    port(clock: in std_logic;
         add: in std_logic;
			reset: in std_logic;
         digit: out std_logic_vector(3 downto 0));
    end component;

    component seconds_counter is 
		 port(clock: in std_logic;
				reset: in std_logic;
				overflow: out std_logic);
    end component;

    component decoder7HEX is
        port(a : in std_logic_vector(3 downto 0);  
		     Display : out std_logic_vector(6 downto 0)); 
		
    end component;    
    
    signal add:std_logic;
    signal bcd_output:std_logic_vector(3 downto 0);

begin
    digit_c:digit_counter port map(clock_50,add,KEY(0),bcd_output);
    decoder:decoder7HEX port map(bcd_output,HEX0);
    seconds_c:seconds_counter port map(clock_50,KEY(0),add);

end circuit_behaviour;