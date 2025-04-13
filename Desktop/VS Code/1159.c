#include <stdio.h>
int main()
{
    int n, j, sum;
    while (1)
    {
        sum = 0; 
        scanf("%d", &n);
        if (n == 0)break;
        if(n % 2 != 0)n++;
        for(j = 0; j < 5; j++){
            sum += n;
            n += 2;
        }  
         printf("%d\n", sum);
     
    }
    return 0;
}