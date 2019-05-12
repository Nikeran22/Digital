use ieee.std_logic_1164.all;	

entity second_term is
    port(input_number:in std_logic_vector(7 downto 0);
         raw_output:out std_logic_vector(7 downto 0);
         transformed_output:out std_logic_vector(7 downto 0);
         carry:out std_logic;
         clock:in std_logic;
         reset:in std_logic);
end second_term;

architecture second_term_behaviour of second_term is
    signal stored_number:std_logic_vector(7 downto 0);
begin
    raw_output<=stored_number;
    transformed_output(0)<='0';
    transformed_output(7 downto 1)<=not(stored_number(6 downto 0));
    carry <= '1';

    process(reset,clock)
    begin
        if(clock'event and clock='1') then
            if(reset='1') then
                stored_number<= (others => '0');
            else
                stored_number<=input_number;
            end if;
        end if;
    end process;
end second_term_behaviour;