#include <stdio.h>
int main()
{
    int N[10], d;
    scanf("%d", &d);
    for (int i = 0; i < 10; i++)
    {
           printf("N[%d] = %d\n", i, d);
             d+= d;
    }
  
    return 0;
}