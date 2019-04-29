library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit_tb is
end entity;

architecture circuit_tb_behaviour of circuit_tb is
    
    constant WAITING_TIME:time :=20 ns;

    component circuit is
        port (SW:in std_logic_vector(1 downto 0);
        KEY:in std_logic_vector(0 downto 0);
        LEDR : out std_logic_vector(0 downto 0));
    end component;

    signal SW_tb: std_logic_vector(1 downto 0);
    signal LEDR_tb: std_logic;
    signal KEY_tb: std_logic;

begin
    utt:circuit port map(SW=>SW_tb,KEY(0)=>KEY_tb,LEDR(0)=>LEDR_tb);

    process
    begin
        --reset
        KEY_tb<='0';
        SW_tb(0)<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(0) <='0';
        SW_tb(1) <='0';
        wait for WAITING_TIME;
        KEY_tb<='0';
        SW_tb(0)<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(0) <='0';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        SW_tb(0)<='1';

        --state A
        --w=1
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        --w=0
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;

        --state B
        --w=1
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;        
        --w=0
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;       
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;

        --state C
        --w=1
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        --w=0
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;     
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;     
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;  

        --state D
        --w=1
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        --w=0
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;     
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;     
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;     
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;     

        --state E
        --w=0
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;
        --w=1
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;

        --state F
        --w=0
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;
        --w=1
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        
        --state G
        --w=0
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;
        --w=1
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
       
        --state H
        --w=0
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;
        --w=1
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;     
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;    
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME; 
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME; 

        --state I
        --w=1
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        --w=0
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;  
        wait;
    end process;
end circuit_tb_behaviour;