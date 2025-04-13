#include <stdio.h>
int main()
{
    int n;
    scanf("%d", &n);
    int arr[n];
    int mini, posi, i;
    scanf("%d", &arr[0]);
    mini = arr[0];
    posi = 0;
    for (i = 1; i < n; i++)
    {
        scanf("%d", &arr[i]);
        if (arr[i] < mini)
        {
            mini = arr[i];
            posi = i;
        }
    }
    printf("Menor valor: %d\nPosicao: %d\n", mini, posi);
    return 0;
}