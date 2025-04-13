#include<stdio.h>
int main()
{
    int y = 0, x = 10;
    y -= (x--);
    printf("%d", y);
    return 0;
}
