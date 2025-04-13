#include <stdio.h>
int main()
{
    int n,num, check;
    scanf("%d", &n);
    for(int i=0; i<n; i++){
        check = 0;
        scanf("%d", &num);
        if(num<4){
            printf("%d eh primo\n", num);
        }
        else{
            for(int j = 2; j < num; j++){
            if(num % j == 0){
                check = 1;
                break;
            }
            else check=2;
            }
        }
        if(check == 1)printf("%d nao eh primo\n", num);
        else if(check == 2)printf("%d eh primo\n", num);
    }
    return 0;
}