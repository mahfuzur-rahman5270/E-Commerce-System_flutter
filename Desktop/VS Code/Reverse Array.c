#include<stdio.h>
int main()
{
   int i, n, x[100];
      scanf("%d", &n);
      printf("Input the number of elements to store in the array :%d\n", n);
      printf("\nInput %d number of elements in the array :\n", n);
   for(i = 0; i < n; i++){ 
      printf("element - %d :", i);
      scanf("%d",&x[i]);
}
   printf("The values store into the array are :\n");
   for(i= 0; i < n; i++){
      printf("% 2d", x[i]);
   }
   printf("\nThe values store into the array in reverse are :\n");
   for(i = n-1; i >= 0; i--){
      printf("% 2d", x[i]);
   }
   return 0;
}