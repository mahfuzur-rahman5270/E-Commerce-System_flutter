#include <stdio.h>
int main()
{
    int n, m, sum = 0;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &m);
        for (int j = 1; j < m; j++)
        {
            if (m % j == 0)sum += j;
            
        }
        if (sum == m)printf("%d eh perfeito\n", m);
        if(sum != m) printf("%d nao eh perfeito\n", m);
        sum = 0;
    }
    return 0;
}