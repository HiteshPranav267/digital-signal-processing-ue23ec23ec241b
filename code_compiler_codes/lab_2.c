//DFT
#include <stdio.h>
#include <math.h>
float x[4] = {0,1,2,3};
float Yreal[4],Yimag[4];
float theta;
int n,k,N=4, xlen = 4;
void main(){
	for (k = 0; k<N; k++){
		Yreal[k] = 0;
		Yimag[k] = 0;
		for (n = 0; n<xlen; n++){
			theta = -2*3.141592*k*n/N;
			Yreal[k] = Yreal[k] + x[n]*cos(theta);
			Yimag[k] = Yimag[k] + x[n]*sin(theta);
			printf("%0.2f + j%0.2f\n", Yreal[k], Yimag[k]);}}

//IDFT
#include <stdio.h>
#include <math.h>
float x[4];
float xreal[4]={6,-2,-2,-2},ximag[4]={0,2,0,-2};
float theta;
int n,k,N=4;
void main(){
	for (n = 0; n<N; n++){
		x[n] = 0;
		for (k = 0; k<N; k++){
			theta = 2*3.141592*k*n/N;
			x[n] = x[n] + xreal[k]*cos(theta) - ximag[k]*sin(theta);
			}
			x(n) = x[n]/N;
			}
			for(n=0; n<N; n++){
			printf("x[%d] = %.2f\n",n,x[n]);}}
