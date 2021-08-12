#include "ap_fixed.h"
#include <ap_int.h>
#include <stdio.h>

typedef ap_fixed<8, 3, AP_RND, AP_SAT> ldpc_dbl;

typedef ap_uint<16> tab_int;

typedef ap_uint<24> flash_addr;

typedef ap_uint<2> int_2b;

bool clk;
bool din;
bool dout;
bool cs;

tab_int etaIndexM_1[36864];
tab_int etaIndexN_1[40960];
tab_int lambdaIndexM_1[36864];

int setupLDPC(int_2b size, int_2b rate, tab_int *nR_M, tab_int *etaIndexM_M,
				tab_int *pCodeM, tab_int *pMaxIterations, tab_int *numbits,tab_int *split);

int main()
{
	tab_int nR_M, etaIndexM_M, etaIndexN_M;
	tab_int pCodeM, numbits, split=0;
	tab_int pMaxIterations;
	int_2b size, rate;
	int sucess;

	size = 1;
	rate = 3;
	nR_M = 345;

	setupLDPC(size, rate, &nR_M, &etaIndexM_M, &pCodeM, &pMaxIterations, &numbits,  &split);

	if ((nR_M == 1408) && (numbits == 1280) && (split == 128))
	{
		sucess = 0;
		printf("all test passed \n");
	}
	else
	{
		sucess = 1;
		printf("you're a loser and failed \n");
	}

	return(sucess);

}
