for(int i=0;i<1024;i++)
{
    y_i=0;
    P[4]=P[3];
    P[3]=P[2];
    P[2]=P[1];
    P[1]=Mem1[i];
    for(int j=0;j<4;j++)
    {
        y_i +=P[j].transformed;
        if(positive_overflow(y_i))
        {
            y_i=01111111;
            overflow=true;
            break;
        }
        else if(negative_overflow(y_i))
        {
            y_i=10000000;
            overflow=true;
            break;
        }
    }
    Mem2[i]=y_i;
}