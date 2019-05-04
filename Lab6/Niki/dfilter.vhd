library IEEE;
	use IEEE.std_logic_1164.all;

entity dfilter is 
	port(
		clk, start: in std_logic;
		D_IN: in std_logic_vector(7 downto 0);
		D_OUT: out std_logic_vector(7 downto 0);
		done: out std_logic);

	end dfilter;
	
architecture FSM of dfilter is
	--FSM--
	type state_type is (STOP,LOAD_A,OP1);
	signal PS,NS : state_type;
	--
	--MEMORY_A--
   signal cs_memA, wr_memA, rd_memA: std_logic;
   signal addr_memA: std_logic_vector(9 downto 0);
	--
	--COUNTER--
	signal c_up, c_down, en_counter, clear_counter: std_logic;
	signal addr_count: std_logic_vector(9 downto 0);
	--
	--FULL_MEMORY--
	signal mem_full: std_logic;
	--



	component adder_8bit is
		Port(
		A: in std_logic_vector( 7 downto 0);
		B: in std_logic_vector(7 downto 0);
		S: out std_logic_vector(7 downto 0);
		cin: in std_logic);
	end component;

	component reg_8_1kB is 
		port(
			cs, wr, rd: in std_logic;
			address: in std_logic_vector(9 downto 0);
			input: in std_logic_vector(7 downto 0);
			output: out std_logic_vector(7 downto 0);
			clock: in std_logic);
	end component;

	component shreg is
		port(
		parallel_input: in std_logic_vector(7 downto 0);
		parallel_output: out std_logic_vector(7 downto 0);
		SL, SR, LOAD, CLK, RESET: in std_logic);
	end component;

	component counter_1024 is
		port(
		clk,count_up,count_down,en,clear: in std_logic;
		count: out STD_LOGIC_VECTOR(9 downto 0));
	end component;
	

	
begin
	
	sync_proc: process(CLK,NS)
		begin
			if (rising_edge(CLK)) then
				PS <= NS;
			end if;
	end process sync_proc;
	
	
	
	comb_proc: process(PS,START)
		begin
			case PS is
				when STOP => 
							--init config--
							clear_counter<='1';

							if (START = '1') then NS <= LOAD_A;
							else NS <= STOP;
							end if;
				when LOAD_A => 
							--counter confing--
							c_up<='1';
							c_down<='0';
							en_counter<='1';
							clear_counter<='0';
							--memory config--
							cs_memA<='1';
							wr_memA<='1';
							rd_memA<='0';
							
							if (mem_full='1') then NS <= OP1;
							else NS <= LOAD_A;
							end if;
				when OP1 =>
							NS<=STOP;


			end case;
	end process comb_proc;

	MEM_A : reg_8_1kB port map (cs_memA, wr_memA, rd_memA, addr_memA, D_in, D_out, clk);
	COUNTER_A: counter_1024 port map(clk, c_up, c_down, en_counter, clear_counter, addr_count);
	addr_memA<=addr_count;
	
	--mem_full--
	mem_full<= addr_count(0) and addr_count(1) and addr_count(2) and addr_count(3) and addr_count(4) and addr_count(5) and addr_count(6) and addr_count(7) and addr_count(8) and addr_count(9);
	
	
	


		


end FSM;

	