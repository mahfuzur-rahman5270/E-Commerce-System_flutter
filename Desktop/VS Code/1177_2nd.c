#include <stdio.h>
int main()
{
    int T[1000], n;
    scanf("%d", &n);
    int j = 0;
    for (int i = 0; i < 1000; i++)
    {
        printf("N[%d] = %d\n", i, j);
        j++;
        if(j == n)j = 0;
    }
return 0;
}