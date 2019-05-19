ResetAll();
while(AddressA<1024)
{
    write D_in[AddressA];
    AddressA++;
}
while(AddressB<1024)
{
    AddressA=AddressB;
    loop=0;
    Reset(shift_register,operand,result);
    while(tcA || loop<4)
    {
        shift_register=MemoryA[AddressA];
        switch(loop)
        {
            case 0:
            shift_register>>1; //divides by 2
            result= result-shift_register;
            break;

            case 1:
            shift_register<<1; //multiplies by 2
            result = result -shift_register;
            break;

            case 2:
            shift_register<<2;
            result= result+shift_register;
            break;

            case 3:
            shift_register>>2;
            result=result+shift_register;
            break;
        }
        loop++;
        AddressA--;
    }
    MemoryB[AddressB]=result;
    AddressB++;
}
Done=1;