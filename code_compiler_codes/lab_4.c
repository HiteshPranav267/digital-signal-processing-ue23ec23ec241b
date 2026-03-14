//Circular convolution
#include <stdio.h>
int x[20] = h[20] = y[20] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int m,N,sum,i,n,k;
void main(){
	printf("Enter N: ");
	scanf("%d", &N);
	printf("Enter x[20]: \n");
	for (i = 0; i<N i++){scanf("%d",&x[i]);}
	printf("Enter h[20]: \n");
	for (i = 0; i<N i++){scanf("%d",&h[i]);}
	printf("Circular convolution: \n");
	for (m= 0; m<N; m++){
		sum = 0;
		for(k = 0; k<N ; k++){
			if((m-k)>=0)
				n = m-k;
			else
				n = m-k+N;
			sum+=x[k]*h[n];
		}
		y[m] = sum;
		printf("\ny[%d] = %d",m,y[m]);
	}
}
			