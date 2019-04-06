library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
    port( a:in std_logic_vector(3 downto 0);
          b:in std_logic_vector(3 downto 0);
          result: out std_logic_vector(7 downto 0));
end multiplier;

architecture multiplier_behaviour of multiplier is

    component and_array is
        port( a:in std_logic_vector (3 downto 0);
              b:in std_logic;
              result:out std_logic_vector(3 downto 0));
    end component;

    component adder is port ( 
        c_in: in std_logic;
        a,b: in std_logic_vector(3 downto 0);
        result : out std_logic_vector(3 downto 0);
        c_out: out std_logic);
    end component; 
        
    signal in11,in12,in21,in22,in31,in32:std_logic_vector(3 downto 0); --inputs lines of the adders (inxy= input y of the n-th adder)

begin
    --a*b(0)
    array1:and_array port map(
        a=>a,
        b=>b(0),
        result(0)=>result(0),
        result(3 downto 1)=>in11(2 downto 0));

    in11(3)<='0';

    --a*b(1)
    array2:and_array port map(
        a=>a,
        b=>b(1),
        result=>in12
    );

    adder1:adder port map(
        c_in=>'0',
        a=>in11,
        b=>in12,
        result(0)=>result(1),
        result(3 downto 1)=>in21(2 downto 0),
        c_out=>in21(3)
    );

    array3:and_array port map(
        a=>a,
        b=>b(2),
        result=>in22
    );

    adder2:adder port map(
        c_in=>'0',
        a=>in21,
        b=>in22,
        result(0)=>result(2),
        result(3 downto 1)=>in31(2 downto 0),
        c_out=>in31(3)
    );

    array4:and_array port map(
        a=>a,
        b=>b(3),
        result=>in32
    );

    adder3:adder port map(
        c_in=>'0',
        a=>in31,
        b=>in32,
        result=>result(6 downto 3),
        c_out=>result(7)
    );

end multiplier_behaviour ; -- multiplier_behaviour