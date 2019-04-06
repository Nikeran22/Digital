library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity and_array_tb is
end and_array_tb;

architecture and_array_tb_behaviour of and_array_tb is
    
    constant WAITING_TIME:time :=20 ns;

    signal a_tb: std_logic_vector (3 downto 0);
    signal b_tb: std_logic;
    signal result_tb: std_logic_vector (3 downto 0);

    component and_array is
        port( a:in std_logic_vector (3 downto 0);
              b:in std_logic;
              result:out std_logic_vector (3 downto 0));
    end component;

    begin
        u:and_array port map(a=>a_tb,b=>b_tb,result=>result_tb);
        process
        begin
            for i in 0 to 15 loop --tests all the 16 possible values with b=0
                a_tb<=std_logic_vector(to_unsigned(i,a_tb'length));
                b_tb<='0';
                wait for WAITING_TIME;
            end loop;
            for i in 0 to 15 loop --tests all the 16 possible values with b=0
                a_tb<=std_logic_vector(to_unsigned(i,a_tb'length));
                b_tb<='1';
                wait for WAITING_TIME;
            end loop;

            wait;
        end process;

end and_array_tb_behaviour;