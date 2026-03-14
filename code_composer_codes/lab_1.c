//Impulse response
#include <stdio.h>
float x[5] = {1,0,0,0,0};
float y[5] = {0,0,0,0,0};
void main(){
	int i,j;
	printf("\n To calculate impulse response");
	for (i = 0; i<5; i++){
		if(i==0)
			y[i] = x[i]*0.1311;
		if(i==1)
			y[i] = x[i]*0.1311 + 0.2622*x[i-1] + 0.7488*y[i-1];
		if(i>=2)
			y[i] = x[i]*0.1311 + 0.2622*x[i-1] + 0.7488*y[i-1]-0.2722*y[i-2];
		}
	for (j=0; j<5; j++)
		printf("\n %f",y[j]);
}