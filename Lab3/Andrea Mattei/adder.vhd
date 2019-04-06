library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    port ( c_in: in std_logic;
           a,b:in std_logic_vector(3 downto 0);
           result: out std_logic_vector(3 downto 0);
           c_out: out std_logic);
end adder;

architecture adder_behaviour of adder is

    component fa is port ( 
        cin: in std_logic;
        a: in std_logic;
        b: in std_logic; 
        s : out std_logic;
        cout : out std_logic);
    end component; 

    signal c1,c2,c3:std_logic;

begin

    fa1: fa port map(c_in,a(0),b(0),result(0),c1);
    fa2: fa port map(c1,a(1),b(1),result(1),c2);
    fa3: fa port map(c2,a(2),b(2),result(2),c3);
    fa4: fa port map(c3,a(3),b(3),result(3),c_out);

end adder_behaviour;