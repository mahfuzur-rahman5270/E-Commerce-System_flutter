#include <stdio.h>
int main()
{
    int n, par[5], impar[5], p = 0, ip = 0;
    for(int i = 0; i < 15; i++){
        scanf("%d", &n);
        if(p == 5){
            for(int j = 0; j < 5; j++){
            printf("par[%d] = %d\n", j, par[j]);
            }
        }
        if(ip == 5){
            for(int j = 0; j < 5; j++){
            printf("impar[%d] = %d\n", j, impar[j]);
            }
        }
        if(n % 2 == 0){
            
        }
    }

    return 0;
}