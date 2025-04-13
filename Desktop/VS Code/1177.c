#include <stdio.h>
int main()
{
    int T[1000], n;
    scanf("%d", &n);
    int j = 0;
    while(j <=999){
    for (int i = 0; i < n; i++)
    {
        printf("N[%d] = %d\n",j, i);
        j++;
        }
        if(j==1000){
            break;
        }
    }
    return 0;
}