LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY jk_ff IS
PORT ( CK, j, k : IN STD_LOGIC;
Q,Qn : OUT STD_LOGIC);
END jk_ff;
ARCHITECTURE Behaviour OF jk_ff IS


BEGIN
PROCESS(CK)
variable qv : std_logic :='0';
BEGIN
if(CK'event and CK='1') then
if(j='1') then 
if (k='0') then
qv:='1';
else qv:=not qv;
end if;
end if;
if(k='1') then
if (j='0') then
qv:='0';
end if;
end if;
end if;
Q<=qv;
Qn<=not qv;
END PROCESS;
END Behaviour;
