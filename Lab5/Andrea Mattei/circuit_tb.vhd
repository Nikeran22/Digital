library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit_tb is
end entity;

architecture circuit_tb_behaviour of circuit_tb is
    
    constant WAITING_TIME:time :=20 ns;

    component circuit is
        port (SW:in std_logic_vector(1 downto 0);
        KEY:in std_logic;
        LEDR : out std_logic);
    end component;

    signal SW_tb: std_logic_vector(1 downto 0);
    signal LEDR_tb: std_logic;
    signal KEY_tb: std_logic;

begin
    utt:circuit port map(SW_tb,KEY_tb,LEDR_tb);

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
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        --state B
        wait for WAITING_TIME;
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;
        --state C
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;
        --state D
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;
        --state E
        KEY_tb<='0';
        SW_tb(1)<='0';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='0';
        wait for WAITING_TIME;
        --from E to F
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        --state F
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        --state G
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        --state H
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;        
        --state I
        KEY_tb<='0';
        SW_tb(1)<='1';
        wait for WAITING_TIME;
        KEY_tb <='1';
        SW_tb(1) <='1';
        wait for WAITING_TIME;
        wait;
    end process;
end circuit_tb_behaviour;