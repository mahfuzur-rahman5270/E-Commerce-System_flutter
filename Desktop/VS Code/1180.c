#include <stdio.h>
int main()
{
    int i,n, mini, posi, arr[1000];
    scanf("%d", &n);
    for (i = 0; i < n; i++)
    {
        scanf("%d", &arr[i]);
        if (i == 1)
        {
            if (arr[0] < arr[1])
            {
                mini = arr[0];
                posi = 0;
            }
            else
            {
                mini = arr[1];
                posi = 1;
            }
        }
        if (i > 1)
        {
            if (arr[i] < mini)
            {
                mini = arr[i];
                posi = i;
            }
        }
    }
    printf("Menor valor: %d\nPosicao: %d\n", mini, posi);
    return 0;
}