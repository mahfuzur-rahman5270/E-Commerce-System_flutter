#include <stdio.h>
int main()
{
    int n,i,m, ev[5], od[5],l = 0,k = 0;
    for ( i = 0; i < 15; i++)
    {
        scanf("%d", &n);
        if (n % 2 == 0)
        {
            ev[l] = n;
            l++;
            if (l == 5){
                for( m = 0; m <5 ; m++){ 
                 printf("par[%d] = %d\n", m, ev[m]);
                 ev[m] = 0;
                }
                l = 0;
                }
        }
        else
        {
             od[k] = n;
             k++;
            if (k == 5){
                for(int m = 0; m <5 ; m++){ 
                 printf("impar[%d] = %d\n", m, od[m]);
                 od[m] = 0;
                }
                k = 0;
                }
        }
    }
    for(i = 0; i< 5; i++){
            if(od[i]== 0)break;
            printf("impar[%d] = %d\n", i, od[i]);
        }
    for(i = 0; i< 5; i++){
            if(ev[i]== 0)break;
            printf("par[%d] = %d\n", i, ev[i]);
        }
    return 0;
}