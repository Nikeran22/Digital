library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

entity adder_8bit is
Port(
		A: in std_logic_vector( 7 downto 0);
		B: in std_logic_vector(7 downto 0);
		S: out std_logic_vector(7 downto 0);
		cin: in std_logic);
end adder_8bit;

architecture behave of adder_8bit is
signal sum : signed(7 downto 0);

begin
		process(A,B,cin)
		begin
			if(cin='0') then
				sum<= signed(A) + signed(B);
			else
				sum<= signed(A) - signed(B);
			end if;
		end process;
		S<= std_logic_vector(sum);

end behave;
			
			