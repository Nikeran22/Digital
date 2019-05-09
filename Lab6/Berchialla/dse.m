% k=dec2bin(typecast(int16(-32768),'uint16'));
% typecast(uint16(bin2dec(k)),'int16');

clear all
clc

x=zeros(1024, 1, 'int16');
y=zeros(1024, 1, 'int16');

%reading memory A 
Af = fopen('A.MEM');
j=1;
while~feof(Af)
k=fgets(Af);
s=k(1:8);
x(j)=typecast(uint8(bin2dec(s)),'int8');
j=j+1;
end
fclose(Af);
%Caluclating Y(i) using the data from memory A
y(1)=-(bitsra(x(1),1));
y(2)=-(bitsra(x(2),1))-(bitsll(x(2-1),1));
y(3)=-(bitsra(x(3),1))-(bitsll(x(3-1),1))+bitsll(x(3-2),2);

for i=4:1024
    y(i)=-(bitsra(x(i),1))-(bitsll(x(i-1),1))+bitsll(x(i-2),2)+bitsra(x(i-3),2);
end
%saturating numbers for 8 bit signed
for i=1:1023
    if y(i)<-128
        y(i)=-128;
    end
    if y(i)>127
        y(i)=127;
    end
end
%reading B memory file
Bf = fopen('B.MEM');
j=1;
while~feof(Bf)
k=fgets(Bf);
s=k(1:8);
B(j)=typecast(uint8(bin2dec(s)),'int8');
j=j+1;
end
fclose(Bf);
B=B';

%cecking that memory B is equal to Y, error position in stored in errore
j=1;
for i=1:1024
    if y(i)==B(i)
        ceck(i)=0;
    else
        ceck(i)=1;
        errore(j)=i;
        j=j+1;
    end
end
number_of_errors=sum(ceck)
