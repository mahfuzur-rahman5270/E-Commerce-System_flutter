#include <stdio.h>
int main()
{
    int n, x, y, sum = 0, count = 0;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d %d", &x, &y);
        int j = x;
        while(count < y)
        {
            if(j % 2 != 0)
            {
                sum += j;
                j++;
                count++;
            }
            else j++;
        }
        printf("%d\n", sum);
        
    }

    return 0;
}