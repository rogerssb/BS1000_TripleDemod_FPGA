////////////////////////////////////////////////////////////////////////////////
// File:  LdpcLogDecScaledMin.cpp
// Date:  21-Dec-2016
// Version:  0.1
// Author:  Erik Perrins, esp@ieee.org
// This file is a Matlab EXecutable (MEX) implementation of a log-based LDPC
// decoder. The notation and general structure of this implementation follows
// the algorithm description found in [1, page 652]. However, this
// implementation uses the "scaled-min" approximation discussed in
// [2, Sec. III-D].
//
// [1] T. K. Moon, "Error Correction Coding: Mathematical Methods and
// Algorithms," Wiley-Interscience, 2005.
// [2] E. Perrins, "FEC Systems for Aeronautical Telemetry," IEEE Transactions
// on Aerospace and Electronic Systems, vol. 49, no. 4, pp. 2340-2352, October
// 2013.
//
// HLSLdpcLogDecScaledMin.cpp Created August 1, 2017 based on the above sited 
// reference
//
////////////////////////////////////////////////////////////////////////////////
//#define HLS_LDPC_LOG_DEC_VERSION "HLS LDPC Log-based Scaled-min Decoder Ver. 0.1 (1-AUG-2017)"

#include "ap_fixed.h"
#include <ap_int.h>

typedef ap_int<8> int8;

typedef ap_fixed<8, 3, AP_RND, AP_SAT> ldpc_dbl;

// typedef uint16_t tab_int;

typedef unsigned short tab_int;

//typedef ap_uint<16> tab_int;

//typedef double ldpc_dbl;


#include "LDPCparms.h"
#include "txword.h"
#include "ldpc4096_45_data.h"
#include "ldpc4096_45_info.h"
#include "ldpc4096_45_code.h"
#include "ldpc1024_23.h"
#include "Txcode_1024_23.h"

#include <stdio.h>
#include <string.h>
#include <stdio.h>
#include <math.h>

static tab_int nR_M, etaIndexM_M, etaIndexN_M, numbits;
static tab_int pCodeM;
static tab_int pMaxIterations;

bool run1024_45=false;
bool run1024_23=false;
bool run1024_12=false;
bool run4096_45=false;
bool run4096_23=false;
bool run4096_12=true;


short r_int[10240];
int8_t p_int[2048], p_int1[2048], p_int2[2048], p_int3[2048], p_int4[1024], p_int5[1024], p_int6[1024], p_int7[1024], p_int8[1024];
int8_t p_int9[1024], p_int10[1024];

void HLSLdpcLogDecScaledMin(int8_t pR[2048], int8_t pR1[2048], int8_t pR2[2048], int8_t pR3[2048], int8_t pR4[1024], int8_t pR5[1024],
		 	 	 	 	 	 int8_t pR6[1024], int8_t pR7[1024], int8_t pR8[1024], int8_t pR9[1024], int8_t pR10[1024],
						      bool pbhat0[2048],  bool pbhat1[2048], bool pbhat2[1024], bool pbhat3[1024],
							  bool pbhat4[1024], bool pbhat5[1024], bool pbhat6[1024], bool pbhat7[1024], int *cnt,  tab_int nR_M,
						      tab_int etaIndexM_M, tab_int pCodeM, tab_int pMaxIterations, int8_t *itt_num,
							  tab_int numbits, volatile bool *mux);

int new_setupLDPC(int size, int rate);

int main();


void split_mem()
{
	int mem=0;
	int pos =0;


	for (int i=0;i<1280; i++)
	{
		switch (mem)
		{
		case 0:
			p_int[pos] = r_int[i];
			break;
		case 1:
			p_int1[pos] = r_int[i];
			break;
		case 2:
			p_int2[pos] = r_int[i];
			break;
		case 3:
			p_int3[pos] = r_int[i];
			break;
		case 4:
			p_int4[pos] = r_int[i];
			break;
		case 5:
			p_int5[pos] = r_int[i];
			break;
		case 6:
			p_int6[pos] = r_int[i];
			break;
		case 7:
			p_int7[pos] = r_int[i];
			break;
		case 8:
			p_int8[pos] = r_int[i];
			break;
		case 9:
			p_int9[pos] = r_int[i];
			break;
		case 10:
			p_int10[pos] = r_int[i];
			break;

		}

		pos++;

		if (pos == 128)
		{
			pos = 0;
			mem++;
		}
	}
}

void split_mem_4096_45()
{
	int mem=0;
	int pos =0;


	for (int i=0;i<5120; i++)
	{
		switch (mem)
		{
		case 0:
			p_int[pos] = r_int[i];
			break;
		case 1:
			p_int1[pos] = r_int[i];
			break;
		case 2:
			p_int2[pos] = r_int[i];
			break;
		case 3:
			p_int3[pos] = r_int[i];
			break;
		case 4:
			p_int4[pos] = r_int[i];
			break;
		case 5:
			p_int5[pos] = r_int[i];
			break;
		case 6:
			p_int6[pos] = r_int[i];
			break;
		case 7:
			p_int7[pos] = r_int[i];
			break;
		case 8:
			p_int8[pos] = r_int[i];
			break;
		case 9:
			p_int9[pos] = r_int[i];
			break;
		case 10:
			p_int10[pos] = r_int[i];
			break;

		}

		pos++;

		if (pos == 512)
		{
			pos = 0;
			mem++;
		}
	}
}

void split_mem_1024_23()
{
	int mem=0;
	int pos =0;


	for (int i=0;i<1536; i++)
	{
		switch (mem)
		{
		case 0:
			p_int[pos] = r_int[i];
			break;
		case 1:
			p_int1[pos] = r_int[i];
			break;
		case 2:
			p_int2[pos] = r_int[i];
			break;
		case 3:
			p_int3[pos] = r_int[i];
			break;
		case 4:
			p_int4[pos] = r_int[i];
			break;
		case 5:
			p_int5[pos] = r_int[i];
			break;
		case 6:
			p_int6[pos] = r_int[i];
			break;
		case 7:
			p_int7[pos] = r_int[i];
			break;
		case 8:
			p_int8[pos] = r_int[i];
			break;
		case 9:
			p_int9[pos] = r_int[i];
			break;
		case 10:
			p_int10[pos] = r_int[i];
			break;

		}

		pos++;

		if (pos == 256)
		{
			pos = 0;
			mem++;
		}
	}
}

void split_mem_4096_23()
{
	int mem=0;
	int pos =0;


	for (int i=0;i<6144; i++)
	{
		switch (mem)
		{
		case 0:
			p_int[pos] = r_int[i];
			break;
		case 1:
			p_int1[pos] = r_int[i];
			break;
		case 2:
			p_int2[pos] = r_int[i];
			break;
		case 3:
			p_int3[pos] = r_int[i];
			break;
		case 4:
			p_int4[pos] = r_int[i];
			break;
		case 5:
			p_int5[pos] = r_int[i];
			break;
		case 6:
			p_int6[pos] = r_int[i];
			break;
		case 7:
			p_int7[pos] = r_int[i];
			break;
		case 8:
			p_int8[pos] = r_int[i];
			break;
		case 9:
			p_int9[pos] = r_int[i];
			break;
		case 10:
			p_int10[pos] = r_int[i];
			break;

		}

		pos++;

		if (pos == 1024)
		{
			pos = 0;
			mem++;
		}
	}
}

void split_mem_1024_12()
{
	int mem=0;
	int pos =0;


	for (int i=0;i<2048; i++)
	{
		switch (mem)
		{
		case 0:
			p_int[pos] = r_int[i];
			break;
		case 1:
			p_int1[pos] = r_int[i];
			break;
		case 2:
			p_int2[pos] = r_int[i];
			break;
		case 3:
			p_int3[pos] = r_int[i];
			break;
		case 4:
			p_int4[pos] = r_int[i];
			break;
		case 5:
			p_int5[pos] = r_int[i];
			break;
		case 6:
			p_int6[pos] = r_int[i];
			break;
		case 7:
			p_int7[pos] = r_int[i];
			break;
		case 8:
			p_int8[pos] = r_int[i];
			break;
		case 9:
			p_int9[pos] = r_int[i];
			break;
		case 10:
			p_int10[pos] = r_int[i];
			break;

		}

		pos++;

		if (pos == 512)
		{
			pos = 0;
			mem++;
		}
	}
}

void split_mem_4096_12()
{
	int mem=0;
	int pos =0;


	for (int i=0;i<8192; i++)
	{
		switch (mem)
		{
		case 0:
			p_int[pos] = r_int[i];
			break;
		case 1:
			p_int1[pos] = r_int[i];
			break;
		case 2:
			p_int2[pos] = r_int[i];
			break;
		case 3:
			p_int3[pos] = r_int[i];
			break;
		case 4:
			p_int4[pos] = r_int[i];
			break;
		case 5:
			p_int5[pos] = r_int[i];
			break;
		case 6:
			p_int6[pos] = r_int[i];
			break;
		case 7:
			p_int7[pos] = r_int[i];
			break;
		case 8:
			p_int8[pos] = r_int[i];
			break;
		case 9:
			p_int9[pos] = r_int[i];
			break;
		case 10:
			p_int10[pos] = r_int[i];
			break;

		}

		pos++;

		if (pos == 2048)
		{
			pos = 0;
			mem++;
		}
	}
}

int main()
{
	unsigned char cHat[20480];
	bool bHat0[2048], bHat1[2048], bHat2[1024], bHat3[1024], bHat4[1024], bHat5[1024], bHat6[1024], bHat7[1024];
	ldpc_dbl  codem = 384, NumItt = 1, r_prime[20480];
	double r_dub, r_prime_dub;
	bool codepass = true;
	bool pass_tot = true;
	bool mux1 = true;
	bool *ptr_mux ;

	ptr_mux = &mux1;
	int result=1, cnt = 0, size, rate;

	char test;
	int8_t itt_num, itt_step;
	short spot;

	//	pMaxIterations = 10;

	for(int inx=0; inx<10240; inx++)
		r_prime[inx]=0;


	if (run4096_23)
	{
		codepass = true;

		for(int inx=0; inx<10240; inx++)
			r_prime[inx]=0;

		for(int inx=0; inx<7168; inx++)
		{
			r_prime[inx]=r_4096_23[inx];
			r_prime_dub= trunc(60 * ( (double)r_prime[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			//		r_int[inx] =   (128 * ( r[inx] / 3));
			if (r_int[inx] > 128)
			{
				printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = 128;
			}
			if (r_int[inx] < -128)
			{
				printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = -128;
			}
		}
		size =2; 	//BLOCK = 4096
		rate = 2;	//RATE 2/3

		new_setupLDPC(size, rate);
		split_mem_4096_23();

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<1024; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+1024]= (unsigned char) bHat1[k];
			cHat[k+2048]= (unsigned char) bHat2[k];
			cHat[k+3072]= (unsigned char) bHat3[k];
			cHat[k+4096]= (unsigned char) bHat4[k];
			cHat[k+5120]= (unsigned char) bHat5[k];
			cHat[k+6144]= (unsigned char) bHat6[k];
			//		cHat[k+7168]= (unsigned char) bHat7[k];
		}


		for (int i = 0; i < 4096; i++)
		{

			if (raw_4096_23[i] != (cHat[i]))
			{

				//			printf("loop i= %i: expected = %c calculated = %c \n", i, test, cHat[i]);

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 4096 2/3 ************ \n");
		else
			printf("************** You Loser it Failed 4096 2/3 !!!!     ************ \n");

		printf(" 4096 2/3 *****  Iterations = %i \n", cnt);
	}



	if (run1024_45)
	{

		codepass = true;

		for(int inx=0; inx<1408; inx++)
		{
			r_prime_dub= trunc(60 * ( (double)r[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			if (r_int[inx] > 127)
			{
				//			printf("overflow at %i %i \n", inx, r_int[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
				//			printf("underflow at %i %i \n", inx, r_int[inx]);
				r_int[inx] = -127;
			}


			if (inx < 1280)
			{
				if (TXrawData[inx] == 0x30)
					r_int[inx] = -32;
				else
					r_int[inx] = 31;
			}
			else
				r_int[inx] =0;


		}


		size =1; 	//BLOCK = 1024
		rate = 3;	//RATE 4/5

		//	setupLDPC(size, rate);
		new_setupLDPC(size, rate);

		//	for(short k=0; k<1280;k++)
		//		r_int[k] = k;

		split_mem();

		codepass = true;
		//	pMaxIterations = 1;

		//	pCodeM = 165;

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<128; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+128]= (unsigned char) bHat1[k];
			cHat[k+256]= (unsigned char) bHat2[k];
			cHat[k+384]= (unsigned char) bHat3[k];
			cHat[k+512]= (unsigned char) bHat4[k];
			cHat[k+640]= (unsigned char) bHat5[k];
			cHat[k+768]= (unsigned char) bHat6[k];
			cHat[k+896]= (unsigned char) bHat7[k];
		}



		for (int i = 0; i < 1024; i++)
		{
			if (TXrawData[i] != (cHat[i] | 0x30))
			{
				//			printf("loop i= %i: expected = %c calculated = %c \n", i, rawData[i], (cHat[i] | 0x30));

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 1024 4/5 ************ \n");
		else
			printf("************** You Loser it Failed 1024 4/5 !!!!     ************ \n");

		printf(" 1024 4/5 *****  Iterations = %i \n", cnt);

		codepass = true;

		for(int inx=0; inx<1408; inx++)
		{
			r_prime_dub= trunc(60 * ( (double)r[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			if (r_int[inx] > 127)
			{
				//			printf("overflow at %i %i \n", inx, r_int[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
				//			printf("underflow at %i %i \n", inx, r_int[inx]);
				r_int[inx] = -127;
			}


		}


		size =1; 	//BLOCK = 1024
		rate = 3;	//RATE 4/5

		//	setupLDPC(size, rate);
		new_setupLDPC(size, rate);
		split_mem();
		//	pMaxIterations = 1;

		//	pCodeM = 165;


		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<128; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+128]= (unsigned char) bHat1[k];
			cHat[k+256]= (unsigned char) bHat2[k];
			cHat[k+384]= (unsigned char) bHat3[k];
			cHat[k+512]= (unsigned char) bHat4[k];
			cHat[k+640]= (unsigned char) bHat5[k];
			cHat[k+768]= (unsigned char) bHat6[k];
			cHat[k+896]= (unsigned char) bHat7[k];
		}

		for (int i = 0; i < 1024; i++)
		{
			if (rawData[i] != (cHat[i] | 0x30))
			{
				//			printf("loop i= %i: expected = %c calculated = %c \n", i, rawData[i], (cHat[i] | 0x30));

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 1024 4/5 ************ \n");
		else
			printf("************** You Loser it Failed 1024 4/5 !!!!     ************ \n");

		printf(" 1024 4/5 *****  Iterations = %i \n", cnt);

		for(int inx=0; inx<1408; inx++)
		{
			r_prime_dub= trunc(60 * ( (double)r[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			if (r_int[inx] > 127)
			{
				//			printf("overflow at %i %i \n", inx, r_int[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
				//			printf("underflow at %i %i \n", inx, r_int[inx]);
				r_int[inx] = -127;
			}


			if (inx < 1280)
			{
				if (TXrawData[inx] == 0x30)
					r_int[inx] = -32;
				else
					r_int[inx] = 31;
			}
			else
				r_int[inx] =0;


		}

		codepass = true;
		size =1; 	//BLOCK = 1024
		rate = 3;	//RATE 4/5

		//	setupLDPC(size, rate);
		new_setupLDPC(size, rate);
		split_mem();
		//	pMaxIterations = 1;

		//	pCodeM = 165;

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<128; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+128]= (unsigned char) bHat1[k];
			cHat[k+256]= (unsigned char) bHat2[k];
			cHat[k+384]= (unsigned char) bHat3[k];
			cHat[k+512]= (unsigned char) bHat4[k];
			cHat[k+640]= (unsigned char) bHat5[k];
			cHat[k+768]= (unsigned char) bHat6[k];
			cHat[k+896]= (unsigned char) bHat7[k];
		}

		for (int i = 0; i < 1024; i++)
		{
			if (TXrawData[i] != (cHat[i] | 0x30))
			{
				//			printf("loop i= %i: expected = %c calculated = %c \n", i, rawData[i], (cHat[i] | 0x30));

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 1024 4/5 ************ \n");
		else
			printf("************** You Loser it Failed 1024 4/5 !!!!     ************ \n");

		printf(" 1024 4/5 *****  Iterations = %i \n", cnt);

		for(int inx=0; inx<1408; inx++)
		{
			r_prime_dub= trunc(60 * ( (double)r[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			if (r_int[inx] > 127)
			{
				//			printf("overflow at %i %i \n", inx, r_int[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
				//			printf("underflow at %i %i \n", inx, r_int[inx]);
				r_int[inx] = -127;
			}

		}

		codepass = true;
		size =1; 	//BLOCK = 1024
		rate = 3;	//RATE 4/5

		//	setupLDPC(size, rate);
		new_setupLDPC(size, rate);
		split_mem();
		//	pMaxIterations = 1;

		//	pCodeM = 165;

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<128; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+128]= (unsigned char) bHat1[k];
			cHat[k+256]= (unsigned char) bHat2[k];
			cHat[k+384]= (unsigned char) bHat3[k];
			cHat[k+512]= (unsigned char) bHat4[k];
			cHat[k+640]= (unsigned char) bHat5[k];
			cHat[k+768]= (unsigned char) bHat6[k];
			cHat[k+896]= (unsigned char) bHat7[k];
		}

		for (int i = 0; i < 1024; i++)
		{
			if (rawData[i] != (cHat[i] | 0x30))
			{
				//			printf("loop i= %i: expected = %c calculated = %c \n", i, rawData[i], (cHat[i] | 0x30));

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 1024 4/5 ************ \n");
		else
			printf("************** You Loser it Failed 1024 4/5 !!!!     ************ \n");

		printf(" 1024 4/5 *****  Iterations = %i \n", cnt);
	}


	if (run4096_45)
	{
		codepass = true;

		for(int inx=0; inx<10240; inx++)
			r_prime[inx]=0;

		for(int inx=0; inx<5120; inx++)
		{
			r_prime[inx]=Rx_4096_45[inx];
			r_prime_dub= trunc(60 * ( (double)r_prime[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			//		r_int[inx] =   (128 * ( r[inx] / 3));
			if (r_int[inx] > 127)
			{
				//			printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
				//			printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = -127;
			}
		}



		size =2; 	//BLOCK = 4096
		rate = 3;	//RATE 4/5

		new_setupLDPC(size, rate);
		split_mem_4096_45();

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<512; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+512]= (unsigned char) bHat1[k];
			cHat[k+1024]= (unsigned char) bHat2[k];
			cHat[k+1536]= (unsigned char) bHat3[k];
			cHat[k+2048]= (unsigned char) bHat4[k];
			cHat[k+2560]= (unsigned char) bHat5[k];
			cHat[k+3072]= (unsigned char) bHat6[k];
			cHat[k+3584]= (unsigned char) bHat7[k];
		}

		for (int i = 0; i < 4096; i++)
		{

			if (Info_4096_45[i] != (cHat[i]))
			{

				printf("loop i= %i: expected = %c calculated = %c \n", i, (raw_4096_45[i] | 0x30), (cHat[i] | 0x30));

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 4096 4/5 ************ \n");
		else
			printf("************** You Loser it Failed 4096  4/5 !!!!     ************ \n");

		printf(" 4096 4/5 *****  Iterations = %i \n", cnt);
	}


	if (run1024_23)
	{
		codepass = true;
/*
		for(int inx=0; inx<10240; inx++)
		{
			r_prime[inx]=0;
			r_int[inx] =0;
		}

		for(int inx=0; inx<1792; inx++)
		{
			r_prime[inx]=r_1024_23[inx];
			r_prime_dub= trunc(60 * ( (double)r_prime[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			//		r_int[inx] =   (128 * ( r[inx] / 3));
			if (r_int[inx] > 127)
			{
				//			printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
				//			printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = -127;
			}
		}
		size =1; 	//BLOCK = 1024
		rate = 2;	//RATE 2/3

		new_setupLDPC(size, rate);
		split_mem_1024_23();

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<256; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+256]= (unsigned char) bHat1[k];
			cHat[k+512]= (unsigned char) bHat2[k];
			cHat[k+768]= (unsigned char) bHat3[k];
			cHat[k+1024]= (unsigned char) bHat4[k];
			cHat[k+1280]= (unsigned char) bHat5[k];
			cHat[k+1536]= (unsigned char) bHat6[k];
			cHat[k+1792]= (unsigned char) bHat7[k];
		}



		for (int i = 0; i < 1024; i++)
		{

			if (raw_1024_23[i] != cHat[i])
			{

				printf("loop i= %i: expected = %c calculated = %c \n", i, test, cHat[i]);

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 1024 2/3 ************ \n");
		else
			printf("************** You Loser it Failed 1024 2/3 !!!!     ************ \n");

		printf(" 1024 2/3 *****  Iterations = %i \n", cnt);

		codepass = true;

		for(int inx=0; inx<10240; inx++)
		{
			r_prime[inx]=0;
			r_int[inx] =0;
		}

		for(int inx=0; inx<1536; inx++)
		{
			r_prime[inx]=code_1024_23[inx];
			r_prime_dub= trunc(60 * ( (double)r_prime[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			//		r_int[inx] =   (128 * ( r[inx] / 3));
			if (r_int[inx] > 127)
			{
				//			printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
				//			printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = -127;
			}
		}
		size =1; 	//BLOCK = 1024
		rate = 2;	//RATE 2/3

		new_setupLDPC(size, rate);
		split_mem_1024_23();

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<256; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+256]= (unsigned char) bHat1[k];
			cHat[k+512]= (unsigned char) bHat2[k];
			cHat[k+768]= (unsigned char) bHat3[k];
			cHat[k+1024]= (unsigned char) bHat4[k];
			cHat[k+1280]= (unsigned char) bHat5[k];
			cHat[k+1536]= (unsigned char) bHat6[k];
			cHat[k+1792]= (unsigned char) bHat7[k];
		}



		for (int i = 0; i < 1024; i++)
		{

			if (rawData_1024_23[i] != (cHat[i]|0x30))
			{

				printf("loop i= %i: expected = %c calculated = %c \n", i, test, cHat[i]);

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 1024 2/3 ************ \n");
		else
			printf("************** You Loser it Failed 1024 2/3 !!!!     ************ \n");

		printf(" 1024 2/3 *****  Iterations = %i \n", cnt);
*/
		codepass = true;

		for(int inx=0; inx<10240; inx++)
		{
			r_prime[inx]=0;
			r_int[inx] =0;
		}

		for(int inx=0; inx<1536; inx++)
		{
			r_prime[inx]=code_1024_23[inx];
			r_prime_dub= trunc(60 * ( (double)r_prime[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			//		r_int[inx] =   (128 * ( r[inx] / 3));
			if (r_int[inx] > 127)
			{
				//			printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
				//			printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = -127;
			}

			if (inx < 1536)
			{
				if (TxData1024_23[inx] == 0x30)
					r_int[inx] = -32;
				else
					r_int[inx] = 31;
			}
			else
				r_int[inx] =0;

		}
		size =1; 	//BLOCK = 1024
		rate = 2;	//RATE 2/3

		new_setupLDPC(size, rate);
		split_mem_1024_23();

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<256; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+256]= (unsigned char) bHat1[k];
			cHat[k+512]= (unsigned char) bHat2[k];
			cHat[k+768]= (unsigned char) bHat3[k];
			cHat[k+1024]= (unsigned char) bHat4[k];
			cHat[k+1280]= (unsigned char) bHat5[k];
			cHat[k+1536]= (unsigned char) bHat6[k];
			cHat[k+1792]= (unsigned char) bHat7[k];
		}



		for (int i = 0; i < 1024; i++)
		{

			if (rawData_1024_23[i] != (cHat[i]|0x30))
			{

				printf("loop i= %i: expected = %c calculated = %c \n", i, test, cHat[i]);

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 1024 2/3 ************ \n");
		else
			printf("************** You Loser it Failed 1024 2/3 !!!!     ************ \n");

		printf(" 1024 2/3 *****  Iterations = %i \n", cnt);
	}



	if (run1024_12)
	{
		codepass = true;

		for(int inx=0; inx<10240; inx++)
			r_prime[inx]=0;

		for(int inx=0; inx<2560; inx++)
		{
			r_prime[inx]=r_1024_12[inx];
			r_prime_dub= trunc(60 * ( (double)r_prime[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			//		r_int[inx] =   (128 * ( r[inx] / 3));
			if (r_int[inx] > 127)
			{
				printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
				printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = -127;
			}
		}
		size =1; 	//BLOCK = 1024
		rate = 1;	//RATE 1/2

		new_setupLDPC(size, rate);

		split_mem_1024_12();

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<512; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+512]= (unsigned char) bHat1[k];
			cHat[k+1024]= (unsigned char) bHat3[k];
			cHat[k+1536]= (unsigned char) bHat4[k];
			cHat[k+2048]= (unsigned char) bHat5[k];
			cHat[k+2560]= (unsigned char) bHat6[k];
			//		cHat[k+1792]= (unsigned char) bHat7[k];
		}


		for (int i = 0; i < 1024; i++)
		{

			if (raw_1024_12[i] != cHat[i])
			{

				printf("loop i= %i: expected = %c calculated = %c \n", i, test, cHat[i]);

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 1024 1/2 ************ \n");
		else
			printf("************** You Loser it Failed 1024 1/2 !!!!     ************ \n");

		printf(" 1024 1/2 *****  Iterations = %i \n", cnt);
	}



	if (run4096_23)
	{
		codepass = true;

		for(int inx=0; inx<10240; inx++)
			r_prime[inx]=0;

		for(int inx=0; inx<7168; inx++)
		{
			r_prime[inx]=r_4096_23[inx];
			r_prime_dub= trunc(60 * ( (double)r_prime[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			//		r_int[inx] =   (128 * ( r[inx] / 3));
			if (r_int[inx] > 128)
			{
				printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = 128;
			}
			if (r_int[inx] < -128)
			{
				printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = -128;
			}
		}
		size =2; 	//BLOCK = 4096
		rate = 2;	//RATE 2/3

		new_setupLDPC(size, rate);
		split_mem_4096_23();

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<1024; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+1024]= (unsigned char) bHat1[k];
			cHat[k+2048]= (unsigned char) bHat2[k];
			cHat[k+3072]= (unsigned char) bHat3[k];
			cHat[k+4096]= (unsigned char) bHat4[k];
			cHat[k+5120]= (unsigned char) bHat5[k];
			cHat[k+6144]= (unsigned char) bHat6[k];
			//		cHat[k+7168]= (unsigned char) bHat7[k];
		}


		for (int i = 0; i < 4096; i++)
		{

			if (raw_4096_23[i] != cHat[i])
			{

				printf("loop i= %i: expected = %c calculated = %c \n", i, (raw_4096_23[i] | 0x30), (cHat[i] | 0x30) );

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 4096 2/3 ************ \n");
		else
			printf("************** You Loser it Failed 4096 2/3 !!!!     ************ \n");

		printf(" 4096 2/3 *****  Iterations = %i \n", cnt);
	}

	if (run4096_12)
	{

		codepass = true;

		for(int inx=0; inx<10240; inx++)
			r_prime[inx]=0;

		for(int inx=0; inx<10240; inx++)
		{
			r_prime[inx]=r_4096_12[inx];
			r_prime_dub= trunc(60 * ( (double)r_prime[inx] / 3));
			r_int[inx] = (short) ((r_prime_dub * 2) + 1);
			//		r_int[inx] =   (128 * ( r[inx] / 3));
			if (r_int[inx] > 127)
			{
//				printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = 127;
			}
			if (r_int[inx] < -127)
			{
//				printf("overflow at %i %i %d \n", inx, r_int[inx], (double) r_prime[inx]);
				r_int[inx] = -127;
			}

		}
		size =2; 	//BLOCK = 4096
		rate = 1;	//RATE 1/2

		new_setupLDPC(size, rate);

		split_mem_4096_12();

		HLSLdpcLogDecScaledMin(p_int, p_int1, p_int2, p_int3, p_int4, p_int5, p_int6, p_int7, p_int8, p_int9, p_int10,
				bHat0, bHat1, bHat2, bHat3, bHat4, bHat5, bHat6, bHat7, &cnt, nR_M, etaIndexM_M,
				pCodeM, pMaxIterations, &itt_num, numbits, ptr_mux);

		for (int k=0; k<2048; k++)
		{
			cHat[k]= (unsigned char) bHat0[k];
			cHat[k+2048]= (unsigned char) bHat1[k];
			// cHat[k+4096]= (unsigned char) bHat3[k];
			//		cHat[k+1536]= (unsigned char) bHat4[k];
			//		cHat[k+2048]= (unsigned char) bHat5[k];
			//		cHat[k+2560]= (unsigned char) bHat6[k];
			//		cHat[k+1792]= (unsigned char) bHat7[k];
		}

		for (int i = 0; i < 4096; i++)
		{

			if (raw_4096_12[i] != cHat[i])
			{

				printf("loop i= %i: expected = %c calculated = %c \n", i, (raw_4096_12[i] | 0x30), (cHat[i] | 0x30));

				codepass = false;
				pass_tot = false;
			}
		}

		if (codepass)
			printf("**************  You Lucky Biscuit it passed 4096 1/2 ************ \n");
		else
			printf("************** You Loser it Failed 4096 1/2  !!!!     ************ \n");

		printf(" 4096 1/2  *****  Iterations = %i \n", cnt);
	}



	if (pass_tot)
	{
		printf("\n **** All Tests Passed ********* \n");
		result = 0;
	}
	else
	{
		printf("\n **** Test(s) Failed ********* \n");
		result = 1;
	}

//	result = 0;

	return(result);

}

int new_setupLDPC(int size, int rate)
{
	// size: 1 = 1024, 2 = 4096
	// rate: 1 = 1/2, 2 = 2/3, 3 = 4/5

	int sucess = 0;
	int etaindexM_max = 0;
	int etaindexN_max = 0;
	int lambdaindexM_max = 0;

	int num_read;
	int value;
	int delta[25];
	int last_val[25];
	int cur_val[25];
	int line_val[25];
	int line_num = 0;
	int first_num = 0;
	int diff = 0;
	int test_diff;
	int num_entries = 0;
	int chk_indx_m[41000];
	int chk_pos = 0;




	for (int dx = 0; dx < 25; dx++)
	{
		delta[dx] = 0;
		last_val[dx] = 0;
		cur_val[dx] = 0;
		line_val[dx] = 0;
	}



	if (size == 1 && rate == 3)
	{
		nR_M = 1408;
		etaIndexM_M = 5376;
		etaIndexN_M = 6400;
		pCodeM = 384;
		pMaxIterations = 50;
		sucess = 1;
		numbits= 1280;
	}

	if (size == 1 && rate == 2)
	{

		nR_M = 1792;
		etaIndexM_M = 6656;
		etaIndexN_M = 7680;
		pCodeM = 768;
		pMaxIterations = 50;
		sucess = 1;
		numbits = 1536;
	}

	if (size == 1 && rate == 1)
	{

		nR_M = 2560;
		etaIndexM_M = 9216;
		etaIndexN_M = 10240;
		pCodeM = 1536;
		pMaxIterations = 50;
		sucess = 1;
		numbits = 2048;
	}

	if (size == 2 && rate == 3)
	{
		nR_M = 5632;
		etaIndexM_M = 21504;
		etaIndexN_M = 25600;
		pCodeM = 1536;
		pMaxIterations = 100;
		sucess = 1;
		numbits = 5120;
	}

	if (size == 2 && rate == 2)
	{

		nR_M = 7168;
		etaIndexM_M = 26624;
		etaIndexN_M = 30720;
		pCodeM = 3072;
		pMaxIterations = 50;
		sucess = 1;
		numbits = 6144;
	}

	if (size == 2 && rate == 1)
	{

		nR_M = 10240;
		etaIndexM_M = 36864;
		etaIndexN_M = 40960;
		pCodeM = 6144;
		pMaxIterations = 50;
		sucess = 1;
		numbits = 8192;
	}


	return(sucess);
}


////////////////////////////////////////////////////////////////////////////////
// End of HLSLdpcLogDecScaledMin.cpp file
////////////////////////////////////////////////////////////////////////////////
// Copyright 20176
