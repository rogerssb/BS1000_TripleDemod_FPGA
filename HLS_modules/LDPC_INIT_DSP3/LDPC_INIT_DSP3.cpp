#include "ap_fixed.h"
#include <ap_int.h>

typedef ap_fixed<8, 3, AP_RND, AP_SAT> ldpc_dbl;

typedef ap_uint<16> tab_int;

typedef ap_uint<24> flash_addr;

typedef ap_uint<2> int_2b;


//typedef double ldpc_dbl;



#include "newtabs1024.h"
#include "newtabs4096.h"


#include <stdio.h>
#include <string.h>
#include <stdio.h>


static tab_int nR_M, etaIndexM_M, etaIndexN_M;
static tab_int pCodeM;
static tab_int pMaxIterations;


void setupLDPC(int_2b size, int_2b rate, tab_int *nR_M, tab_int *etaIndexM_M,
				tab_int *pCodeM, tab_int *pMaxIterations, tab_int *numbits, tab_int *split)
{
	tab_int etaIndexN_M;

	// size: 1 = 1024, 2 = 4096
	// rate: 1 = 1/2, 2 = 2/3, 3 = 4/5

	int sucess=0;
	int mode;

	mode = ((size - 1) * 3) + rate;

	switch(mode) {

	case 3:			//size 1 Rate 3

//		sucess = new_setupLDPC(1, 3, etaIndexM, etaIndexN, lambdaIndexM );

		*nR_M = 1408;
		*etaIndexM_M = 5376;
		etaIndexN_M = 6400;
		*pCodeM = 384;
		*pMaxIterations = 30;
		*numbits = 1280;
		*split = 128;
//		sucess =1;
		break;

	case 2:			//size 1 Rate 2

//		sucess = new_setupLDPC(1, 2, etaIndexM, etaIndexN, lambdaIndexM );

		*nR_M = 1792;
		*etaIndexM_M = 6656;
		etaIndexN_M = 7680;
		*pCodeM = 768;
		*pMaxIterations = 3;
		*numbits = 1536;
		*split = 192;
//		sucess =1;
		break;

	case 1:			//size 1 Rate 1


//		sucess = new_setupLDPC(1, 1, etaIndexM, etaIndexN, lambdaIndexM );

		*nR_M = 2560;
		*etaIndexM_M = 9216;
		etaIndexN_M = 10240;
		*pCodeM = 1536;
		*pMaxIterations = 3;
		*numbits = 2048;
		*split = 256;
//		sucess =1;
		break;

	case 6:			//size 2 Rate 3


//		sucess = new_setupLDPC(2, 3, etaIndexM, etaIndexN, lambdaIndexM );

		*nR_M = 5632;
		*etaIndexM_M = 21504;
		etaIndexN_M = 25600;
		*pCodeM = 1536;
		*pMaxIterations = 3;
		*numbits = 5120;
		*split = 512;
//		sucess =1;
		break;

	case 5:			//size 2 Rate 2

//		sucess = new_setupLDPC(2, 2, etaIndexM, etaIndexN, lambdaIndexM );

		*nR_M = 7168;
		*etaIndexM_M = 26624;
		etaIndexN_M = 30720;
		*pCodeM = 3072;
		*pMaxIterations = 3;
		*numbits = 6144;
		*split = 768;
//		sucess =1;
		break;

	case 4:			//size 2 Rate 1

//		sucess = new_setupLDPC(2, 1, etaIndexM, etaIndexN, lambdaIndexM );

		*nR_M = 10240;
		*etaIndexM_M = 36864;
		etaIndexN_M = 40960;
		*pCodeM = 6144;
		*pMaxIterations = 3;
		*numbits = 8192;
		*split = 1024;
//		sucess =1;
		break;
	}

}







