--Library include
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
---------------------------------------------------------------
--Entity definition
entity binarytoBCD_tb is
end binarytoBCD_tb;
---------------------------------------------------------------
--Architecture definition
architecture behaviour_binarytoBCD_tb of binarytoBCD_tb is
--Signals: testbench signals for the inputs and the outputs
	signal sw_tb : std_logic_vector(5 downto 0);
	signal HEX1_tb , HEX0_tb : std_logic_vector(6 downto 0);
component binarytoBCD is
	port(
		sw : in std_logic_vector (5 downto 0);	
		HEX1 : out std_logic_vector(6 downto 0);
		HEX0: out std_logic_vector(6 downto 0)
		);
end component;
--Begin assignments part
begin	
	binarytoBCD_under_test: binarytoBCD port map( sw_tb , Hex1_tb , HEX0_tb );
--Process that generates the assignments necessary for the testing
	process
	variable sw_v : unsigned(5 downto 0) := "000000";
	begin
		  sw_tb <= std_logic_vector(sw_v);        
        while (sw_v /= "111111") loop
        	sw_v := sw_v + "000001";
                sw_tb <= std_logic_vector(sw_v);
                wait for 200ns;
        end loop;
	wait;
	end process;
end behaviour_binarytoBCD_tb;