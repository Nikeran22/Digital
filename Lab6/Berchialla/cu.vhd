library ieee;
use ieee.std_logic_1164.all;

entity cu is
    port( clock,reset,start,tcua,tcda,tcul,tcub:in std_logic;
	loopc: in std_logic_vector(1 downto 0);
          
          ResetA,ResetB,ResetL,ResetSR,ResetOP,ResetR,WRA,CSA,RDA,cuA,LoadA,LoadSR,SR,SL,LoadOP,LoadR,cin,cuL,cdA,WRB,CSB,cuB,DONE_out : out std_logic);
end cu;

architecture behavior of cu is

    type state_type is (RST,READ1,W1_Start,W2_start,SR1,SR2,SL1,SL2,LOAD_OPm,load_rm,load_op,load_r,upw2,upw1,DONE);
    signal present_state, future_state : state_type;

begin
 
fs_eval: process (present_state,clock,start,tcua,tcda,tcul,loopc,tcub) -- state table
begin
    case present_state is
        when RST =>   if (start = '0') then
                        future_state <= RST ;
                    else 
                        future_state <= READ1;
                    end if;

        when READ1 =>   if (tcuA = '0') then
                        future_state <= READ1;
                    else
                        future_state <= W1_start;
                    end if;

        when W1_start =>   future_state<=W2_start;

        when W2_start =>   if (loopc = "11" or loopc="00") then
                        future_state <= SR1;
                    else
                        future_state <= SL1;
                    end if;

        when SR1 =>   if (loopc = "00") then
                        future_state <= load_opm;
                    else
                        future_state <= SR2;
                    end if;

        when SR2 =>   future_state<=load_op;

        when SL1 =>   if (loopc = "01") then
                        future_state <= load_opm;
                    else
                        future_state <= SL2;
                    end if;

         when SL2 =>   future_state<=load_op;

        when load_opm =>  future_state<=load_rm;

	when load_op =>  future_state<=load_r;

	when load_rm =>  future_state<=UPW2;

	when load_r =>  future_state<=UPW2;

	when UPW2 =>   if (tcdA='1' or tcuL='1') then
                        future_state <= UPW1;
                    else
                        future_state <= W2_start;
                    end if;

	when UPW1 =>   if (tcuB='1') then
                        future_state <= DONE;
                    else
                        future_state <= W1_start;
                    end if;

	when DONE =>   if (start='1') then
                        future_state <= DONE;
                    else
                        future_state <= RST;
                    end if;

        when others =>  future_state<= RST; --errors safeguard
    end case;
end process fs_eval; -- state table


output_eval:process (present_state)
begin
    case present_state is
        when RST => ResetA<='1';
		ResetB<='1';
		ResetL<='1';
		ResetSR<='1';
		ResetOP<='1';
		ResetR<='1';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';


        when READ1 => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='1';
		CSA<='1';
		RDA<='0';
		cuA<='1';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';



        when W1_start => ResetA<='0';
		ResetB<='0';
		ResetL<='1';
		ResetSR<='1';
		ResetOP<='1';
		ResetR<='1';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='1';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';



        when W2_start => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='1';
		RDA<='1';
		cuA<='0';
		LoadA<='0';
		LoadSR<='1';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';



        when SR1 => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='1';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';



        when SR2 => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='1';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';


        when SL1 => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='1';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';




        when SL2 => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='1';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';



        when load_opm => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='1';
		LoadR<='0';
		cin<='1';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';


        when load_op => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='1';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';



        when load_rm => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='1';
		cin<='1';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';



        when load_r => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='1';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';




        when UPW2 => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='1';
		cdA<='1';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0';



        when UPW1 => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='1';
		CSB<='1';
		cuB<='1';
		DONE_out<='0';


        when DONE => ResetA<='0';
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='1';


       
        when others => ResetA<='0';  --errors safeguard
		ResetB<='0';
		ResetL<='0';
		ResetSR<='0';
		ResetOP<='0';
		ResetR<='0';
		WRA<='0';
		CSA<='0';
		RDA<='0';
		cuA<='0';
		LoadA<='0';
		LoadSR<='0';
		SR<='0';
		SL<='0';
		LoadOP<='0';
		LoadR<='0';
		cin<='0';
		cuL<='0';
		cdA<='0';
		WRB<='0';
		CSB<='0';
		cuB<='0';
		DONE_out<='0'; 
    end case;
end process;

state_store: process(clock,reset) is
begin
if(reset='1') then
present_state<=RST;
elsif(rising_edge(clock)) then
present_state<=future_state;
end if;
end process;


end behavior;
