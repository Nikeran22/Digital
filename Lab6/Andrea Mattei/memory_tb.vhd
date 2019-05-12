library ieee;
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;

entity memory_tb is
end memory_tb;

architecture memory_tb_behaviour of memory_tb is

    constant WAITING_TIME:time :=20 ns;

    signal data_in_tb:std_logic_vector(7 downto 0);
    signal data_out_tb:std_logic_vector(7 downto 0);
    signal address_tb: std_logic_vector(9 downto 0);
    signal cs_tb,wr_tb,rd_tb: std_logic;
    signal clock_tb: std_logic;

    component memory is
        port(data_in: in std_logic_vector(7 downto 0);
        address: in std_logic_vector(9 downto 0);
        cs: in std_logic;
        clock: in std_logic;
        wr: in std_logic;
        rd: in std_logic;
        data_out: out std_logic_vector(7 downto 0));
    end component;

begin

    utt:memory port map(data_in_tb,address_tb,cs_tb,clock_tb,wr_tb,rd_tb,data_out_tb);

    process
    variable current_number:unsigned(7 downto 0);
    variable success:boolean:=true;
    begin
        wr_tb<='1';
        cs_tb<='1';
        rd_tb<='0';
        current_number:=(others=>'0');
        for i in 0 to 1023 loop
            if(current_number/=1023) then
                current_number:=current_number+1;
            else
                current_number:=(others=>'0');
            end if;
            data_in_tb <= std_logic_vector(current_number);
            address_tb <= std_logic_vector(to_unsigned(i,10));
            clock_tb<='1';
            wait for WAITING_TIME;
            clock_tb<='0';
            wait for WAITING_TIME;
        end loop;

        wr_tb<='0';
        rd_tb<='1';        
        current_number:=(others=>'0');
        for i in 0 to 1023 loop  

            if(current_number/=1023) then
                current_number:=current_number+1;
            else
                current_number:=(others=>'0');
            end if;  

            address_tb <= std_logic_vector(to_unsigned(i,10));
            clock_tb<='1';
            wait for WAITING_TIME;
            clock_tb<='0';
            wait for WAITING_TIME;
            if(std_logic_vector(current_number)/=data_out_tb) then
                assert false report "error found" severity error;
                success:=false;
            end if;
        end loop;
        if(success) then
            report "test successful" severity note;
        end if;
        wait;
    end process;

end memory_tb_behaviour;
