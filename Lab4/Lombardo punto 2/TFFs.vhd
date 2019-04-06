library ieee;
  use ieee.std_logic_1164.all;
  
 entity TFFs is
     port (
          t, clockk, clearr: in STD_LOGIC;
 q : out STD_LOGIC
 
     );
 end TFFs;
 
 architecture behavioral of TFFs is
    signal tin :std_logic;
 begin
      process (clockk, clearr) begin
         if (clearr = '1') then
              tin <= '0';
        elsif (rising_edge(clockk)) then
              tin <=  t xor tin;
         end if;
    end process;
     q <= tin;
 end architecture;