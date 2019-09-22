
//Name: Sofia M. Salazar
//Description: Program that calculates the 2^n operation. The implementation
//      must use recursive function 
//Date: 22/09/2019


#include <stdio.h> //Include the standard in/out head

int exponent(int, int); //Initializing function
int main()
{
    int x = 2; //Initializing base
    int y; //Declare exponent
    do
    {
        printf("Tip an exponent >=0 : ");
        scanf("%i", &y);
    }while(y<0); //Validate a correct exponent inpput
    int result=exponent(x,y); //Call function to elevate
    printf("%i ^ %i = %i", x,y,result); //show result
    
    return 0;
}
int exponent(int x, int y) //Procedure for function
{
 if (y==0)  //If the exponent is zero, return 1
     return 1;
 else
     return x*(exponent(x,y-1)); //Always sub a unit from exponen
}