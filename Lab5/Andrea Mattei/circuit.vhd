library ieee;
use ieee.std_logic_1164.all;

entity circuit is
    port (SW:in std_logic_vector(1 downto 0);
          KEY:in std_logic_vector(0 downto 0);
          LEDR : out std_logic_vector(0 downto 0));
end circuit;

architecture behavior of circuit is

    type state_type is (A, B, C, D, E, F, G, H, I);
    signal y_q, y_d : state_type; -- y_q is present state, y_d is next state
    signal w,clock,reset,z:std_logic;
begin
    w<=SW(1); 
    clock <=KEY(0);
    reset<=SW(0); --associate reset state to SW0
    LEDR(0)<=z;
process (w, y_q) -- state table
begin
    case y_q is
        when A =>   if (w = '0') then
                        y_d <= B;
                    else 
                        y_d <= F;
                    end if;
        when B =>   if (w = '0') then
                        y_d <= C;
                    else
                        y_d <= F;
                    end if;
        when C =>   if (w = '0') then
                        y_d <= D;
                    else
                        y_d <= F;
                    end if;
        when D =>   if (w = '0') then
                        y_d <= E;
                    else
                        y_d <= F;
                    end if;
        when E =>   if (w = '0') then
                        y_d <= E;
                    else
                        y_d <= F;
                    end if;
        when F =>   if (w = '0') then
                        y_d <= B;
                    else
                        y_d <= G;
                    end if;
        when G =>   if (w = '0') then
                        y_d <= B;
                    else
                        y_d <= H;
                    end if;
        when H =>   if (w = '0') then
                        y_d <= B;
                    else
                        y_d <= I;
                    end if;
        when I =>   if (w = '0') then
                        y_d <= B;
                    else
                        y_d <= I;
                    end if;
        when others => y_d <= A; --errors safeguard
    end case;
end process; -- state table

clock_state:process (clock, reset) -- state flip-flops
begin
    if(reset='0' and rising_edge(clock)) then
        y_q <= A;
    elsif (rising_edge(clock)) then
        y_q <= y_d;
    end if;
end process;

output_assignment:process (y_q)
begin
    case y_q is
        when E => z<='1';
        when I => z<='1';
        when others => z<='0';
    end case;
end process;

end behavior;
