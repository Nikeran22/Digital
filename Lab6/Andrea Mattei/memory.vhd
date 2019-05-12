library ieee;
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;

entity memory is
    port(data_in: in std_logic_vector(7 downto 0);
    address: in std_logic_vector(9 downto 0);
    cs: in std_logic;
    clock: in std_logic;
    wr: in std_logic;
    rd: in std_logic;
    data_out: out std_logic_vector(7 downto 0));
end memory;

architecture memory_behaviour of memory is
    type mem_block is array (0 to 1023) of std_logic_vector(7 downto 0);
    signal memory_block: mem_block;
begin
    process(clock) begin
        if(clock'event and clock='1') then
            if(cs='1' and wr='1') then
                memory_block(to_integer(unsigned(address)))<=data_in; 
            end if;
        end if;
    end process;
    process(rd,cs,address) begin
        if(cs='1' and rd='1') then
            data_out<=memory_block(to_integer(unsigned(address)));
        else
            data_out<="00000000";
        end if;
    end process;
end memory_behaviour;