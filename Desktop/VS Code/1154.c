#include<stdio.h>
int main()
{
    double i, count= 0, sum = 0;
    while(1)
    {
        scanf("%lf", &i);
        if(i > 0){
            sum += i;
            count++;
        }
        if(i < 0){
            break;
        }
        
    }
    printf("%.2lf\n", (sum/count));
}