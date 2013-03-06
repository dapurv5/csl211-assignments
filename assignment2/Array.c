#include<stdio.h>
int main(){
	int a[]={2,4,5,9,1};
	int min=a[0];
	int max=a[0];
	int i=0;
	for(i=0;i<5;i++){
		if(a[i]<min){
			min=a[i];
		}
		else if (a[i]>max){
			max=a[i];
		}
	}
	printf("The maximum and minimum numbers are %d %d \n",min,max);
	return 0;
}
