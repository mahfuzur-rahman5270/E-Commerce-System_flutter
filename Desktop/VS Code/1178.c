#include <stdio.h>
int main()
{
    double x,N[100];
    scanf("%lf", &x);
    for (int i = 0; i < 100; i++)
    {
        printf("N[%d] = %.4lf\n", i, x);
        x = x/2;
    }
    return 0;
}