// preprocessor directive to support printing to the display
#include <stdio.h>
// the main program
int main(void) {
	// declare, define, and initialize some working variables
	int x = 5;
	int y = 10;
	int z = 0;
	float a = 0.0;
	
	// perform a simple calculation
	z = x + y; 
 	
	// print the results of the calculation to the display
	printf("the sum of x and y is %d\n", z);
	

	// ask the user for some data
	printf("please enter a value\n");
	
	// get the data from the user
	// 	the data will be a floating point number: %f
	//	stored in the variable 'a'
	//
	scanf("%f", &a);

	getchar();

	printf("the data is %2.2f\n", a);
	
	return 0;
}