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
#define HLS_LDPC_LOG_DEC_VERSION "HLS LDPC Log-based Scaled-min Decoder Ver. 0.1 (1-AUG-2017)"

#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <ap_int.h>

typedef ap_int<8> int8;
typedef ap_int<11> int11;
typedef ap_int<12> int12;

//typedef  short int8;
//typedef short int11;



struct vars_3_23
{
	int11 inx1;
	int11 inx2;
	int11 inx3;
};

struct vars_3_12
{
	int12 inx1;
	int12 inx2;
	int12 inx3;
};


struct pack_var
{
	int11 	a;
	int11	b;
	int11	c;
};

struct pvars_18
{
	int11		deg;
	pack_var	one;
	pack_var	two;
	pack_var	three;
	pack_var	four;
	pack_var	five;
	pack_var	six;
};

struct xpeta
{
	int8	one;
	int8	two;
	int8	three;
	int8	four;
};

struct peta
{
	int8	one;
	int8	two;

};

struct peta_a
{
	int8	three;
	int8	four;
	int8	five;
	int8	six;

};

struct peta_b
{
	int8	seven;
	int8	eight;
	int8	nine;
	int8	ten;

};

struct peta_c
{
	int8	eleven;
	int8	twelve;
	int8	thirteen;
	int8	fourteen;

};

struct peta_d
{
	int8	fifteen;
	int8	sixteen;
	int8	seventeen;
	int8	eighteen;
};


xpeta SpEtaPrev[1024];
xpeta SpEtaPrevC[1024];

peta SpEtaPrevA[1024];
peta_a SpEtaPrevAa[1024];
peta_b SpEtaPrevAb[1024];
peta_c SpEtaPrevAc[512];
peta_d SpEtaPrevAd[512];

peta SpEtaPrevB[1024];
peta_a SpEtaPrevBa[1024];
peta_b SpEtaPrevBb[1024];
peta_c SpEtaPrevBc[512];
peta_d SpEtaPrevBd[512];

peta SpEtaPrevD[1024];
peta_a SpEtaPrevDa[1024];
peta_b SpEtaPrevDb[1024];
peta_c SpEtaPrevDc[512];
peta_d SpEtaPrevDd[512];

peta SpEtaPrevE[1024];
peta_a SpEtaPrevEa[1024];
peta_b SpEtaPrevEb[1024];
peta_c SpEtaPrevEc[512];
peta_d SpEtaPrevEd[512];


short pLambda0[2048];
short pLambda1[2048];
short pLambda2[2048];
short pLambda3[2048];
short pLambda4[2048];
short pLambda5[1024];
short pLambda6[1024];
short pLambda7[1024];
short pLambda8[1024];
short pLambda9[1024];
short pLambda10[1024];

short inxtab[8];

short  Lam_tabx[18], Peta_tabx[18], Eta_tabx[18], Eta_ans[18];
short  Lam_taby[18], Peta_taby[18], Eta_taby[18], Eta_ans_1[18];
short  Lam_tabz[18], Peta_tabz[18], Eta_tabz[18], Eta_ans_2[18];
short  Lam_tabe[18], Peta_tabe[18], Eta_tabe[18], Eta_ans_3[18];
short  Lam_tabf[18], Peta_tabf[18], Eta_tabf[18], Eta_ans_4[18];
short  Lam_tabg[18], Peta_tabg[18], Eta_tabg[18], Eta_ans_5[18];
short  Lam_tabh[18], Peta_tabh[18], Eta_tabh[18], Eta_ans_6[18];
short  Lam_tabi[18], Peta_tabi[18], Eta_tabi[18], Eta_ans_7[18];
short  Lam_tabj[18], Peta_tabj[18], Eta_tabj[18], Eta_ans_8[18];
short  Lam_tabk[18], Peta_tabk[18], Eta_tabk[18], Eta_ans_9[18];
short  Lam_tabl[18], Peta_tabl[18], Eta_tabl[18], Eta_ans_10[18];
short  Lam_tabm[18], Peta_tabm[18], Eta_tabm[18], Eta_ans_11[18];

short  Lam_tabn[18], Peta_tabn[18], Eta_tabn[18], Eta_ans_12[18];
short  Lam_tabo[18], Peta_tabo[18], Eta_tabo[18], Eta_ans_13[18];
short  Lam_tabp[18], Peta_tabp[18], Eta_tabp[18], Eta_ans_14[18];
short  Lam_tabq[18], Peta_tabq[18], Eta_tabq[18], Eta_ans_15[18];

short   Lam_buf2[1023+1], Lam_buf4[1023+1],Lam_buf4a[1023+1];
short  Lam_buf6[1024], Lam_buf6a[1024];;
short  Lam_buf8[1022+2], Lam_buf10[1022+2], Lam_buf10a[1022+2];

short Lam_bufAa[1023+1], Lam_bufAb[1023+1], Lam_bufAc[1023+1], Lam_bufA1[1023+1], Lam_bufA2a[1023+1], Lam_bufA2b[1023+1],Lam_bufA2c[1023+1];
short Lam_bufA3[1023+1],Lam_bufA4a[1023+1], Lam_bufA4b[1023+1], Lam_bufA4c[1023+1];
short Lam_bufA5[1024], Lam_bufA6[1024], Lam_bufA6b[1024],Lam_bufA6c[1024];
short Lam_bufA7[1022+2], Lam_bufA9[1022+2], Lam_bufA10a[1022+2],Lam_bufA10b[1022+2],Lam_bufA10c[1022+2];

short Lam_bufB[1023+1], Lam_bufB1a[1023+1], Lam_bufB1b[1023+1], Lam_bufB1c[1023+1], Lam_bufB2[1023+1];
short Lam_bufB3a[1023+1], Lam_bufB3b[1023+1], Lam_bufB3c[1023+1], Lam_bufB4[1023+1];
short Lam_bufB5a[1024],Lam_bufB5b[1024],Lam_bufB5c[1024], Lam_bufB6[1024];
short Lam_bufB7a[1022+2],  Lam_bufB7b[1022+2], Lam_bufB9a[1022+2],Lam_bufB9b[1022+2],Lam_bufB10[1022+2];

short   prLam_buf2[1023+1], prLam_buf4[1023+1], prLam_buf4a[1023+1];

short prLamC_buf[1023+1], prLamC_bufa[1023+1],prLamC_bufb[1023+1], prLamC_buf1[1023+1], prLamC_buf2[1023+1], prLamC_buf2a[1023+1], prLamC_buf2b[1023+1];
short prLamC_buf3[1023+1],prLamC_buf4[1023+1],prLamC_buf4a[1023+1],prLamC_buf4b[1023+1];
short prLamC_buf5[1024],prLamC_buf6[1024];
short prLamC_buf7[1022+2], prLamC_buf9[1022+2],prLamC_buf10[1022+2],prLamC_buf10a[1022+2],prLamC_buf10b[1022+2];

short prLamB_buf[1023+1], prLamB_buf1[1023+1], prLamB_buf1a[1023+1],prLamB_buf1b[1023+1], prLamB_buf2[1023+1];
short prLamB_buf3[1023+1], prLamB_buf3a[1023+1], prLamB_buf3b[1023+1],prLamB_buf4[1023+1];
short prLamB_buf5[1024], prLamB_buf5a[1024], prLamB_buf5b[1024], prLamB_buf6[1024];
short prLamB_buf7[1022+2], prLamB_buf7a[1022+2], prLamB_buf9[1022+2],prLamB_buf9a[1022+2],prLamB_buf10[1022+2];

short   prLam2_buf2[1023+1], prLam2_buf4[1023+1], prLam2_buf4a[1023+1];

short prLam2C_buf[1023+1], prLam2C_bufa[1023+1],prLam2C_bufb[1023+1], prLam2C_buf1[1023+1], prLam2C_buf2[1023+1], prLam2C_buf2a[1023+1], prLam2C_buf2b[1023+1];
short prLam2C_buf3[1023+1],prLam2C_buf4[1023+1],prLam2C_buf4a[1023+1],prLam2C_buf4b[1023+1];
short prLam2C_buf5[1024],prLam2C_buf6[1024];
short prLam2C_buf7[1022+2], prLam2C_buf9[1022+2],prLam2C_buf10[1022+2],prLam2C_buf10a[1022+2],prLam2C_buf10b[1022+2];

short prLam2B_buf[1023+1], prLam2B_buf1[1023+1], prLam2B_buf1a[1023+1],prLam2B_buf1b[1023+1], prLam2B_buf2[1023+1];
short prLam2B_buf3[1023+1], prLam2B_buf3a[1023+1], prLam2B_buf3b[1023+1],prLam2B_buf4[1023+1];
short prLam2B_buf5[1024], prLam2B_buf5a[1024], prLam2B_buf5b[1024], prLam2B_buf6[1024];
short prLam2B_buf7[1022+2], prLam2B_buf7a[1022+2], prLam2B_buf9[1022+2],prLam2B_buf9a[1022+2],prLam2B_buf10[1022+2];

bool prHat_buf[2048], prHat_buf1[2048], prHat_buf2[2048], prHat_buf3[2048], prHat_buf4[2048], prHat_buf4a[2048] ;
bool prHat_buf6[2048], prHat_buf6a[2048], prHat_buf8[2048], prHat_buf10[2048], prHat_buf10a[2048], prHat_buf10b[2048];

bool prHat_bufA[2048], prHat_bufAa[2048], prHat_bufAb[2048], prHat_bufAc[2048], prHat_bufA1[2048], prHat_bufA2[2048];
bool prHat_bufA2a[2048], prHat_bufA2b[2048],prHat_bufA2c[2048],prHat_bufA3[2048],prHat_bufA4[2048], prHat_bufA4a[2048], prHat_bufA4b[2048], prHat_bufA5[2048];
bool prHat_bufA6[2048], prHat_bufA6a[2048], prHat_bufA6b[2048], prHat_bufA6c[2048], prHat_bufA7[2048], prHat_bufA9[2048],prHat_bufA10[2048], prHat_bufA10a[2048], prHat_bufA10b[2048], prHat_bufA10c[2048] ;

bool prHat_bufB[2048], prHat_bufB1[2048], prHat_bufB1a[2048], prHat_bufB1b[2048], prHat_bufB1c[2048], prHat_bufB2[2048],prHat_bufB3[2048];
bool prHat_bufB3a[2048], prHat_bufB3b[2048],prHat_bufB3c[2048], prHat_bufB4[2048],prHat_bufB5[2048], prHat_bufB5a[2048], prHat_bufB5b[2048], prHat_bufB5c[2048];
bool prHat_bufB6[2048], prHat_bufB7[2048],prHat_bufB7a[2048], prHat_bufB9[2048], prHat_bufB9a[2048],prHat_bufB10[2048];

short pest0, pest1, pest2, pest3, pest4, pest5, pest6, pest7, pest8, pest9, pest10;
bool bpest0, bpest1, bpest2, bpest3, bpest4, bpest5, bpest6, bpest7, bpest8, bpest9, bpest10;

bool bAllChecksPassed = false;
short rows, cols, bitsperblock, numb;
short blk_val = 1;


//typedef uint16_t tab_int;

typedef unsigned short tab_int;

tab_int nIterationCounter;


#include "ldpc1024_1_2_1_trichk.h"
#include "ldpc1024_1_2_2_trichk.h"
#include "ldpc1024_1_2_trichk.h"

#include "ldpc4096_1_2_1_trichk.h"
#include "ldpc4096_1_2_2_trichk.h"
#include "ldpc4096_1_2_trichk.h"

#include "ldpc1024_2_3_1_trichk.h"
#include "ldpc1024_2_3_2_trichk.h"
#include "ldpc1024_2_3_3_trichk.h"
#include "ldpc1024_2_3_4_trichk.h"
#include "ldpc1024_2_3_trichk.h"

#include "ldpc4096_2_3_1_trichk.h"
#include "ldpc4096_2_3_2_trichk.h"
#include "ldpc4096_2_3_3_trichk.h"
#include "ldpc4096_2_3_4_trichk.h"
#include "ldpc4096_2_3_trichk.h"


#include "ldpc1024_4_5_1_trichk.h"
#include "ldpc1024_4_5_2_trichk.h"
#include "ldpc1024_4_5_3_trichk.h"
#include "ldpc1024_4_5_4_trichk.h"
#include "ldpc1024_4_5_5_trichk.h"
#include "ldpc1024_4_5_6_trichk.h"
#include "ldpc1024_4_5_trichk.h"

#include "ldpc4096_4_5_1_trichk.h"
#include "ldpc4096_4_5_2_trichk.h"
#include "ldpc4096_4_5_3_trichk.h"
#include "ldpc4096_4_5_4_trichk.h"
#include "ldpc4096_4_5_5_trichk.h"
#include "ldpc4096_4_5_6_trichk.h"
#include "ldpc4096_4_5_trichk.h"

#define SCALE_FACTOR          .75

void calc_m(tab_int nCodeM,   bool prev);
void calc_m_23(tab_int nCodeM,    bool prev);
void calc_m_12(tab_int nCodeM,    bool prev);

//void mcalcB(short num);

void mcalcB(short num, short *ptab, short *ltab, short *atab);
void mcalcC(short num);
void mcalcD(short num);
void mcalcE(short num);
void mcalcF(short num);
void mcalcG(short num);



void calc_ma(short num,short num_1, short num_2, short num_3);
void calc_n(tab_int nCodeN);
void calc_n_23(tab_int nCodeN);
void calc_n_12(tab_int nCodeN);

void write_pcHat( bool *ppbhat0, bool *ppbhat1, bool *ppbhat2, bool *ppbhat3,
				  bool *ppbhat4, bool *ppbhat5, bool *ppbhat6, bool *ppbhat7 );


void HLSLdpcLogDecScaledMin(int8_t pR[1024], int8_t pR1[1024], int8_t pR2[1024], int8_t pR3[1024], int8_t pR4[1024], int8_t pR5[1024],
		 	 	 	 	 	 int8_t pR6[1024], int8_t pR7[1024], int8_t pR8[1024], int8_t pR9[1024], int8_t pR10[1024],
						      bool pbhat0[1024],  bool pbhat1[1024], bool pbhat2[1024], bool pbhat3[1024],
							  bool pbhat4[1024], bool pbhat5[1024], bool pbhat6[1024], bool pbhat7[1024], int *cnt,  tab_int nR_M,
						      tab_int etaIndexM_M, tab_int pCodeM, tab_int pMaxIterations, int8_t *itt_num,
							  tab_int numbits, volatile bool *mux)

{

#pragma HLS data_pack variable=SpEtaPrev
#pragma HLS data_pack variable=SpEtaPrevC
#pragma HLS data_pack variable=SpEtaPrevA
#pragma HLS data_pack variable=SpEtaPrevAa
#pragma HLS data_pack variable=SpEtaPrevAb
#pragma HLS data_pack variable=SpEtaPrevAc
#pragma HLS data_pack variable=SpEtaPrevAd
#pragma HLS data_pack variable=SpEtaPrevB
#pragma HLS data_pack variable=SpEtaPrevBa
#pragma HLS data_pack variable=SpEtaPrevBb
#pragma HLS data_pack variable=SpEtaPrevBc
#pragma HLS data_pack variable=SpEtaPrevBd
#pragma HLS data_pack variable=SpEtaPrevD
#pragma HLS data_pack variable=SpEtaPrevDa
#pragma HLS data_pack variable=SpEtaPrevDb
#pragma HLS data_pack variable=SpEtaPrevDc
#pragma HLS data_pack variable=SpEtaPrevDd
#pragma HLS data_pack variable=SpEtaPrevE
#pragma HLS data_pack variable=SpEtaPrevEa
#pragma HLS data_pack variable=SpEtaPrevEb
#pragma HLS data_pack variable=SpEtaPrevEc
#pragma HLS data_pack variable=SpEtaPrevEd

#pragma HLS data_pack variable=varinx3_1024_12

#pragma HLS data_pack variable=varinx6A_1024_a
#pragma HLS data_pack variable=varinx6B_1024_a
#pragma HLS data_pack variable=varinx6A_1024_b
#pragma HLS data_pack variable=varinx6B_1024_b



#pragma HLS data_pack variable=varinx3_1024_23

#pragma HLS data_pack variable=varinx10A_1024_a
#pragma HLS data_pack variable=varinx10B_1024_a
#pragma HLS data_pack variable=varinx10A_1024_b
#pragma HLS data_pack variable=varinx10B_1024_b
#pragma HLS data_pack variable=varinx10A_1024_c
#pragma HLS data_pack variable=varinx10B_1024_c

#pragma HLS data_pack variable=varinx3_1024_45

#pragma HLS data_pack variable=varinx18A_1024_a
#pragma HLS data_pack variable=varinx18B_1024_a
#pragma HLS data_pack variable=varinx18A_1024_b
#pragma HLS data_pack variable=varinx18B_1024_b
#pragma HLS data_pack variable=varinx18A_1024_c
#pragma HLS data_pack variable=varinx18B_1024_c
#pragma HLS data_pack variable=varinx18A_1024_d
#pragma HLS data_pack variable=varinx18B_1024_d
#pragma HLS data_pack variable=varinx18A_1024_e
#pragma HLS data_pack variable=varinx18B_1024_e
#pragma HLS data_pack variable=varinx18A_1024_f
#pragma HLS data_pack variable=varinx18B_1024_f

#pragma HLS data_pack variable=varinx3_4096_12

#pragma HLS data_pack variable=varinx6A_4096_a
#pragma HLS data_pack variable=varinx6B_4096_a
#pragma HLS data_pack variable=varinx6A_4096_b
#pragma HLS data_pack variable=varinx6B_4096_b


#pragma HLS data_pack variable=varinx3_4096_23

#pragma HLS data_pack variable=varinx10A_4096_a
#pragma HLS data_pack variable=varinx10B_4096_a
#pragma HLS data_pack variable=varinx10A_4096_b
#pragma HLS data_pack variable=varinx10B_4096_b
#pragma HLS data_pack variable=varinx10A_4096_c
#pragma HLS data_pack variable=varinx10B_4096_c

#pragma HLS data_pack variable=varinx3_4096_45

#pragma HLS data_pack variable=varinx18A_4096_a
#pragma HLS data_pack variable=varinx18B_4096_a
#pragma HLS data_pack variable=varinx18A_4096_b
#pragma HLS data_pack variable=varinx18B_4096_b
#pragma HLS data_pack variable=varinx18A_4096_c
#pragma HLS data_pack variable=varinx18B_4096_c
#pragma HLS data_pack variable=varinx18A_4096_d
#pragma HLS data_pack variable=varinx18B_4096_d
#pragma HLS data_pack variable=varinx18A_4096_e
#pragma HLS data_pack variable=varinx18B_4096_e
#pragma HLS data_pack variable=varinx18A_4096_f
#pragma HLS data_pack variable=varinx18B_4096_f


	numb = numbits;

	if (numbits == 1280)
	{
		rows = 128;					// number of parity rows divided by 3
		cols = 128;					// number of variables divided by 11
		bitsperblock = 128;			// number of variables divided by 3
	}
	else if (numbits == 5120)
	{
		rows = 512;					// number of parity rows divided by 6
		cols = 512;					// number of variables divided by 11
		bitsperblock = 512;			// number of variables divided by 3
	}
	else if (numbits == 1536)
	{
		rows = 256;					// number of parity rows divided by 6
		cols = 256;					// number of variables divided by 11
		bitsperblock = 192;			// number of variables divided by 3
	}
	else if (numbits == 6144)
	{
		rows = 1024;					// number of parity rows divided by 6
		cols = 1024;					// number of variables divided by 11
		bitsperblock = 768;			// number of variables divided by 3
	}
	else if (numbits == 2048)
	{
		rows = 512;					// number of parity rows divided by 6
		cols = 512;					// number of variables divided by 11
		bitsperblock = 256;			// number of variables divided by 3
	}
	else if (numbits == 8192)
	{
		rows = 2048;					// number of parity rows divided by 6
		cols = 2048;					// number of variables divided by 11
		bitsperblock = 1024;			// number of variables divided by 3
	}
	else
	{
		rows = 128;					// number of parity rows divided by 6
		cols = 128;					// number of variables divided by 11
		bitsperblock = 128;			// number of variables divided by 3
	}


	tab_int  nCodeN         = nR_M;
	tab_int  nCodeN11 = cols;
	tab_int nCodeM         = pCodeM;
	tab_int nMaxIterations = pMaxIterations;
	tab_int nLenEta        = etaIndexM_M - pCodeM;
	short pos = 0, loop = 0;
	int out_cnt;



	for (int inx=0; inx < cols; inx++)
	{

		pLambda0[inx] = pR[inx];
		pLambda1[inx] = pR1[inx];
		pLambda2[inx] = pR2[inx];
		pLambda3[inx] = pR3[inx];
		pLambda4[inx] = pR4[inx];

		Lam_buf2[inx] = pR2[inx];
		Lam_buf4[inx] = pR4[inx];
		Lam_buf4a[inx] = pR4[inx];

		Lam_bufAa[inx] = pR[inx];
		Lam_bufAb[inx] = pR[inx];
		Lam_bufAc[inx] = pR[inx];
		Lam_bufA1[inx] = pR1[inx];
		Lam_bufA2a[inx] = pR2[inx];
		Lam_bufA2b[inx] = pR2[inx];
		Lam_bufA2c[inx] = pR2[inx];
		Lam_bufA3[inx] = pR3[inx];
		Lam_buf4a[inx] = pR4[inx];
		Lam_bufA4a[inx] = pR4[inx];
		Lam_bufA4b[inx] = pR4[inx];
		Lam_bufA4c[inx] = pR4[inx];

		Lam_bufB[inx] = pR[inx];
		Lam_bufB1a[inx] = pR1[inx];
		Lam_bufB1b[inx] = pR1[inx];
		Lam_bufB1c[inx] = pR1[inx];
		Lam_bufB2[inx] = pR2[inx];
		Lam_bufB3a[inx] = pR3[inx];
		Lam_bufB3b[inx] = pR3[inx];
		Lam_bufB3c[inx] = pR3[inx];
		Lam_bufB4[inx] =  pR4[inx];

		if ( (numbits == 2048) || (numbits == 8192))
		{
			pLambda4[inx] = blk_val;
			Lam_buf4[inx] = blk_val;
			Lam_buf4a[inx] = blk_val;
			Lam_bufA4a[inx] = blk_val;
			Lam_bufA4b[inx] = blk_val;
			Lam_bufA4c[inx] = blk_val;
			Lam_bufB4[inx] = blk_val;
		}

		prLamB_buf[inx] = 0;
		prLamC_buf[inx] = 0;
		prLamC_bufa[inx] = 0;
		prLamC_bufb[inx] = 0;



		prLam2B_buf[inx] = 0;
		prLam2C_buf[inx] = 0;
		prLam2C_bufa[inx] = 0;
		prLam2C_bufb[inx] = 0;



		prLamB_buf1[inx] = 0;
		prLamB_buf1a[inx] = 0;
		prLamB_buf1b[inx] = 0;
		prLamC_buf1[inx] = 0;


		prLam2B_buf1[inx] = 0;
		prLam2B_buf1a[inx] = 0;
		prLam2B_buf1b[inx] = 0;
		prLam2C_buf1[inx] = 0;


		prLam_buf2[inx] = 0;
		prLamB_buf2[inx] = 0;
		prLamC_buf2[inx] = 0;
		prLamC_buf2a[inx] = 0;
		prLamC_buf2b[inx] = 0;


		prLam2_buf2[inx] = 0;
		prLam2B_buf2[inx] = 0;
		prLam2C_buf2[inx] = 0;
		prLam2C_buf2a[inx] = 0;
		prLam2C_buf2b[inx] = 0;


		prLamB_buf3[inx] = 0;
		prLamB_buf3a[inx] = 0;
		prLamB_buf3b[inx] = 0;
		prLamC_buf3[inx] = 0;


		prLam2B_buf3[inx] = 0;
		prLam2B_buf3a[inx] = 0;
		prLam2B_buf3b[inx] = 0;
		prLam2C_buf3[inx] = 0;


		prLam_buf4[inx] = 0;
		prLam_buf4a[inx] = 0;
		prLamB_buf4[inx] = 0;
		prLamC_buf4[inx] = 0;
		prLamC_buf4a[inx] = 0;
		prLamC_buf4b[inx] = 0;


		prLam2_buf4[inx] = 0;
		prLam2_buf4a[inx] = 0;
		prLam2B_buf4[inx] = 0;
		prLam2C_buf4[inx] = 0;
		prLam2C_buf4a[inx] = 0;
		prLam2C_buf4b[inx] = 0;

		pLambda5[inx] = pR5[inx];

		Lam_bufA5[inx] = pR5[inx];

		Lam_buf6[inx] = pR6[inx];
		Lam_buf6a[inx] = pR6[inx];
		pLambda6[inx] = pR6[inx];
		Lam_bufA6[inx] = pR6[inx];
		Lam_bufA6b[inx] = pR6[inx];
		Lam_bufA6c[inx] = pR6[inx];
		Lam_bufB6[inx] = pR6[inx];

		if ( (numbits == 1536) || (numbits == 6144))
		{
			pLambda6[inx] = blk_val;
			Lam_buf6[inx] = blk_val;
			Lam_buf6a[inx] = blk_val;
			Lam_bufA6[inx] = blk_val;
			Lam_bufA6b[inx] = blk_val;
			Lam_bufA6c[inx] = blk_val;
			Lam_bufB6[inx] = blk_val;
		}

		Lam_bufB5a[inx] = pR5[inx];
		Lam_bufB5b[inx] = pR5[inx];
		Lam_bufB5c[inx] = pR5[inx];

		prLamB_buf5[inx] = 0;
		prLamB_buf5a[inx] = 0;
		prLamB_buf5b[inx] = 0;
		prLamC_buf5[inx] = 0;

		prLam2B_buf5[inx] = 0;
		prLam2B_buf5a[inx] = 0;
		prLam2B_buf5b[inx] = 0;
		prLam2C_buf5[inx] = 0;

		prLamB_buf6[inx] = 0;
		prLamC_buf6[inx] = 0;

		prLam2B_buf6[inx] = 0;
		prLam2C_buf6[inx] = 0;

		pLambda7[inx] = pR7[inx];
		pLambda8[inx] = pR8[inx];
		pLambda9[inx] = pR9[inx];
		pLambda10[inx+0] = blk_val;

		Lam_buf8[inx] = pR8[inx];
		Lam_buf10[inx+0] = blk_val;
		Lam_buf10a[inx+0] = blk_val;

		Lam_bufA7[inx] = pR7[inx];
		Lam_bufA9[inx] = pR9[inx];
		Lam_bufA10a[inx] = blk_val;
		Lam_bufA10b[inx] = blk_val;
		Lam_bufA10c[inx] = blk_val;

		Lam_bufB7a[inx] = pR7[inx];
		Lam_bufB7b[inx] = pR7[inx];
		Lam_bufB9a[inx] = pR9[inx];
		Lam_bufB9b[inx] = pR9[inx];
		Lam_bufB10[inx+0] = blk_val;

		prLamB_buf7[inx] = 0;
		prLamB_buf7a[inx] = 0;
		prLamC_buf7[inx] = 0;

		prLam2B_buf7[inx] = 0;
		prLam2B_buf7a[inx] = 0;
		prLam2C_buf7[inx] = 0;

		prLamB_buf9[inx] = 0;
		prLamB_buf9a[inx] = 0;
		prLamC_buf9[inx] = 0;

		prLam2B_buf9[inx] = 0;
		prLam2B_buf9a[inx] = 0;
		prLam2C_buf9[inx] = 0;

		prLamB_buf10[inx] = 0;
		prLamC_buf10[inx] = 0;
		prLamC_buf10a[inx] = 0;
		prLamC_buf10b[inx] = 0;

		prLam2B_buf10[inx] = 0;
		prLam2C_buf10[inx] = 0;
		prLam2C_buf10a[inx] = 0;
		prLam2C_buf10b[inx] = 0;

	}

	////////////////////////////////////////////////////////////////////////////
	// Main iteration loop
	////////////////////////////////////////////////////////////////////////////
	tab_int  m, mSparse, nLenMset, n, nSparse, nLenNset, nLenNset_1, jSparse;
	tab_int nThisCheck;



	short vMetric, vArg, minval;
	short min, last, est[20], test, flag;
	int num_cal=0, dug;
	int8_t step =0;

//	nMaxIterations = 30;


   for(nIterationCounter=0;nIterationCounter<nMaxIterations;++nIterationCounter)
	{
		// Print a status message on the iteration loop
//		printf("Loop Counter = %i\n",nIterationCounter+1);

	    *itt_num = (int8_t) nIterationCounter;


		////////////////////////////////////////////////////////////////////////
		///////////////////// Loop on m to update eta //////////////////////////

		// Point our temporary etaIndex at the "M-first" eta indexes


		// Loop on m

		bAllChecksPassed = true;

		if ( (numbits == 1280) || (numbits == 5120))
			calc_m(nCodeM,  true);
		else if ( (numbits == 1536) || (numbits == 6144))
			calc_m_23(nCodeM,    true);
		else if ( (numbits == 2048) || (numbits == 8192))
			calc_m_12(nCodeM,    true);

		if((bAllChecksPassed == true) && nIterationCounter != 0)
		{
			++nIterationCounter;
			break; // break out of the for(nIterationCounter...) loop
		}

		/////////////////// END Loop on m to update eta ////////////////////////


		////////////////////////////////////////////////////////////////////////
		//////////////////// Loop on n to update lambda ////////////////////////

		// Point our temporary etaIndex at the "N-first" eta indexes


//	    calc_n(nCodeN11);

		if ( (numbits == 1280) || (numbits == 5120))
			calc_n(nCodeN11);
		else if ( (numbits == 1536) || (numbits == 6144))
			calc_n_23(nCodeN11);
		else if ( (numbits == 2048) || (numbits == 8192))
			calc_n_12(nCodeN11);


		////////////////// END Loop on n to update lambda //////////////////////

		////////////////////////////////////////////////////////////////////////
		/////////////////// Loop on m to compute checks ////////////////////////

//		break;
		++nIterationCounter;
	    *itt_num = (int8_t) nIterationCounter;

		if( nIterationCounter  >= nMaxIterations)
		{
			break; // break out of the for(nIterationCounter...) loop
		}


		////////////////////////////////////////////////////////////////////////
		///////////////////// Loop on m to update eta //////////////////////////
		/////////////////////                         //////////////////////////
		//																	  //
		// Second Pass added to eliminate need to copy previous value array	  //
		//                                                                    //
		////////////////////////////////////////////////////////////////////////

		bAllChecksPassed = true;

		if ( (numbits == 1280) || (numbits == 5120))
			calc_m(nCodeM,   false);
		else if ( (numbits == 1536) || (numbits == 6144))
			calc_m_23(nCodeM,   false);
		else if ( (numbits == 2048) || (numbits == 8192))
			calc_m_12(nCodeM,    false);

		if(bAllChecksPassed == true)
		{
			++nIterationCounter;
			break; // break out of the for(nIterationCounter...) loop
		}
		/////////////////// END Loop on m to update eta ////////////////////////


		////////////////////////////////////////////////////////////////////////
		//////////////////// Loop on n to update lambda ////////////////////////


//		calc_n(nCodeN11);

		if ( (numbits == 1280) || (numbits == 5120))
			calc_n(nCodeN11);
		else if ( (numbits == 1536) || (numbits == 6144))
			calc_n_23(nCodeN11);
		else if ( (numbits == 2048) || (numbits == 8192))
			calc_n_12(nCodeN11);

		////////////////// END Loop on n to update lambda //////////////////////


	}

    if(bAllChecksPassed == false)
	{
		printf("Decoding failure after %d iterations\n", nMaxIterations);
	}
	else
	{
		// Print a status message on the iteration loop
		printf("Loop Counter = %i\n",nIterationCounter);
	}

    out_cnt =0;
    bool test_in;
    test_in = *mux;
    while (!test_in)
    {
    	*cnt = out_cnt;
    	out_cnt++;
    	test_in = *mux;

    }

	write_pcHat( pbhat0, pbhat1, pbhat2, pbhat3, pbhat4, pbhat5, pbhat6, pbhat7);
	*cnt = nIterationCounter ;

}

void mcalcAA_23(short *eTab, short *lTab, short *pTab, short num_nt, short num_shnt,
		short *eTabA, short *lTabA, short *pTabA, short num_ntA, short num_shntA,
		short *eTabB, short *lTabB, short *pTabB, short num_ntB, short num_shntB,
		short *eTabE, short *lTabE, short *pTabE, short *eTabF, short *lTabF, short *pTabF,
		short *eTabG, short *lTabG, short *pTabG, short *eTabH, short *lTabH, short *pTabH,
		short *eTabI, short *lTabI, short *pTabI, short *eTabJ, short *lTabJ, short *pTabJ,
		short *eTabK, short *lTabK, short *pTabK, short *eTabL, short *lTabL, short *pTabL,
		short *eTabM, short *lTabM, short *pTabM, bool prevflg)
{
	tab_int jSparse, nLenNset, nSparse;
	unsigned short a, b, c, d, e, f;
	unsigned short a2, b2, c2, d2, e2, f2;

	unsigned short a18A, b18A, c18A, d18A, e18A, f18A, g18A, h18A, i18A, j18A, k18A, l18A;
	unsigned short m18A, n18A, o18A, p18A, q18A, r18A;
	unsigned short a18A2, b18A2, c18A2, d18A2, e18A2, f18A2, g18A2, h18A2, i18A2, j18A2, k18A2, l18A2;
	unsigned short m18A2, n18A2, o18A2, p18A2, q18A2, r18A2;
	unsigned short a18A3, b18A3, c18A3, d18A3, e18A3, f18A3, g18A3, h18A3, i18A3, j18A3, k18A3, l18A3;
	unsigned short m18A3, n18A3, o18A3, p18A3, q18A3, r18A3;
	unsigned short a18A4, b18A4, c18A4, d18A4, e18A4, f18A4, g18A4, h18A4, i18A4, j18A4, k18A4, l18A4;
	unsigned short m18A4, n18A4, o18A4, p18A4, q18A4, r18A4;

	unsigned short a18B, b18B, c18B, d18B, e18B, f18B, g18B, h18B, i18B, j18B, k18B, l18B;
	unsigned short m18B, n18B, o18B, p18B, q18B, r18B;
	unsigned short a18B2, b18B2, c18B2, d18B2, e18B2, f18B2, g18B2, h18B2, i18B2, j18B2, k18B2, l18B2;
	unsigned short m18B2, n18B2, o18B2, p18B2, q18B2, r18B2;
	unsigned short a18B3, b18B3, c18B3, d18B3, e18B3, f18B3, g18B3, h18B3, i18B3, j18B3, k18B3, l18B3;
	unsigned short m18B3, n18B3, o18B3, p18B3, q18B3, r18B3;
	unsigned short a18B4, b18B4, c18B4, d18B4, e18B4, f18B4, g18B4, h18B4, i18B4, j18B4, k18B4, l18B4;
	unsigned short m18B4, n18B4, o18B4, p18B4, q18B4, r18B4;

	// Loop on jSparse

	short inx=num_nt;
	short inx1=inx+1;

	//		short in = inx /2;

	if (numb == 1536)
	{
		a = varinx3_1024_23[inx].inx1;
		b = varinx3_1024_23[inx].inx2;
		c = varinx3_1024_23[inx].inx3;

		d = varinx3_1024_23[inx1].inx1;
		e = varinx3_1024_23[inx1].inx2;
		f = varinx3_1024_23[inx1].inx3;


		a18A = varinx10A_1024_a[inx].inx1;
		b18A = varinx10A_1024_a[inx].inx2;
		c18A = varinx10A_1024_a[inx].inx3;
		d18A = varinx10A_1024_b[inx].inx1;
		e18A = varinx10A_1024_b[inx].inx2;
		f18A = varinx10A_1024_b[inx].inx3;
		g18A = varinx10A_1024_c[inx].inx1;
		h18A = varinx10A_1024_c[inx].inx2;
		i18A = varinx10A_1024_c[inx].inx3;
		j18A = varinx10A_1024_d[inx];

		a18A2 = varinx10A_1024_a[inx1].inx1;
		b18A2 = varinx10A_1024_a[inx1].inx2;
		c18A2 = varinx10A_1024_a[inx1].inx3;
		d18A2 = varinx10A_1024_b[inx1].inx1;
		e18A2 = varinx10A_1024_b[inx1].inx2;
		f18A2 = varinx10A_1024_b[inx1].inx3;
		g18A2 = varinx10A_1024_c[inx1].inx1;
		h18A2 = varinx10A_1024_c[inx1].inx2;
		i18A2 = varinx10A_1024_c[inx1].inx3;
		j18A2 = varinx10A_1024_d[inx1];

		a18B = varinx10B_1024_a[inx].inx1;
		b18B = varinx10B_1024_a[inx].inx2;
		c18B = varinx10B_1024_a[inx].inx3;
		d18B = varinx10B_1024_b[inx].inx1;
		e18B = varinx10B_1024_b[inx].inx2;
		f18B = varinx10B_1024_b[inx].inx3;
		g18B = varinx10B_1024_c[inx].inx1;
		h18B = varinx10B_1024_c[inx].inx2;
		i18B = varinx10B_1024_c[inx].inx3;
		j18B = varinx10B_1024_d[inx];

		a18B2 = varinx10B_1024_a[inx1].inx1;
		b18B2 = varinx10B_1024_a[inx1].inx2;
		c18B2 = varinx10B_1024_a[inx1].inx3;
		d18B2 = varinx10B_1024_b[inx1].inx1;
		e18B2 = varinx10B_1024_b[inx1].inx2;
		f18B2 = varinx10B_1024_b[inx1].inx3;
		g18B2 = varinx10B_1024_c[inx1].inx1;
		h18B2 = varinx10B_1024_c[inx1].inx2;
		i18B2 = varinx10B_1024_c[inx1].inx3;
		j18B2 = varinx10B_1024_d[inx1];
	}
	else
	{
		a = varinx3_4096_23[inx].inx1;
		b = varinx3_4096_23[inx].inx2;
		c = varinx3_4096_23[inx].inx3;

		d = varinx3_4096_23[inx1].inx1;
		e = varinx3_4096_23[inx1].inx2;
		f = varinx3_4096_23[inx1].inx3;


		a18A = varinx10A_4096_a[inx].inx1;
		b18A = varinx10A_4096_a[inx].inx2;
		c18A = varinx10A_4096_a[inx].inx3;
		d18A = varinx10A_4096_b[inx].inx1;
		e18A = varinx10A_4096_b[inx].inx2;
		f18A = varinx10A_4096_b[inx].inx3;
		g18A = varinx10A_4096_c[inx].inx1;
		h18A = varinx10A_4096_c[inx].inx2;
		i18A = varinx10A_4096_c[inx].inx3;
		j18A = varinx10A_4096_d[inx];

		a18A2 = varinx10A_4096_a[inx1].inx1;
		b18A2 = varinx10A_4096_a[inx1].inx2;
		c18A2 = varinx10A_4096_a[inx1].inx3;
		d18A2 = varinx10A_4096_b[inx1].inx1;
		e18A2 = varinx10A_4096_b[inx1].inx2;
		f18A2 = varinx10A_4096_b[inx1].inx3;
		g18A2 = varinx10A_4096_c[inx1].inx1;
		h18A2 = varinx10A_4096_c[inx1].inx2;
		i18A2 = varinx10A_4096_c[inx1].inx3;
		j18A2 = varinx10A_4096_d[inx1];

		a18B = varinx10B_4096_a[inx].inx1;
		b18B = varinx10B_4096_a[inx].inx2;
		c18B = varinx10B_4096_a[inx].inx3;
		d18B = varinx10B_4096_b[inx].inx1;
		e18B = varinx10B_4096_b[inx].inx2;
		f18B = varinx10B_4096_b[inx].inx3;
		g18B = varinx10B_4096_c[inx].inx1;
		h18B = varinx10B_4096_c[inx].inx2;
		i18B = varinx10B_4096_c[inx].inx3;
		j18B = varinx10B_4096_d[inx];

		a18B2 = varinx10B_4096_a[inx1].inx1;
		b18B2 = varinx10B_4096_a[inx1].inx2;
		c18B2 = varinx10B_4096_a[inx1].inx3;
		d18B2 = varinx10B_4096_b[inx1].inx1;
		e18B2 = varinx10B_4096_b[inx1].inx2;
		f18B2 = varinx10B_4096_b[inx1].inx3;
		g18B2 = varinx10B_4096_c[inx1].inx1;
		h18B2 = varinx10B_4096_c[inx1].inx2;
		i18B2 = varinx10B_4096_c[inx1].inx3;
		j18B2 = varinx10B_4096_d[inx1];
	}


	eTab[0] = (a) ;
	eTab[1] = (b) ;
	eTab[2] = (c) ;

	eTabE[0] = (d) ;
	eTabE[1] = (e) ;
	eTabE[2] = (f) ;

	lTab[0] = Lam_buf4[(a) ];
	lTab[1] = Lam_buf6[(b) ];
	lTab[2] = Lam_buf6[(c) ];

	lTabE[0] = Lam_buf4[(d) ];
	lTabE[1] = Lam_buf6a[(e) ];
	lTabE[2] = Lam_buf6a[(f) ];

	pTab[0] = SpEtaPrev[inx].one;
	pTab[1] = SpEtaPrev[inx].two;
	pTab[2] = SpEtaPrev[inx].three;

	pTabE[0] = SpEtaPrevC[inx1].one;
	pTabE[1] = SpEtaPrevC[inx1].two;
	pTabE[2] = SpEtaPrevC[inx1].three;

	inx = num_ntA;

	eTabA[0] = a18A;
	eTabA[1] = b18A;
	eTabA[2] = c18A;
	eTabA[3] = (d18A) ;
	eTabA[4] = (e18A) ;
	eTabA[5] = (f18A) ;
	eTabA[6] = (g18A) ;
	eTabA[7] = (h18A) ;
	eTabA[8] = (i18A) ;
	eTabA[9] = (j18A) ;

	lTabA[0] = Lam_bufAa[a18A];
	lTabA[1] = Lam_bufAb[b18A];
	lTabA[2] = Lam_bufAc[c18A];
	lTabA[3] = Lam_bufA1[(d18A) ];
	lTabA[4] = Lam_bufA2a[(e18A) ];
	lTabA[5] = Lam_bufA3[(f18A) ];
	lTabA[6] = Lam_bufA5[(g18A) ];
	lTabA[7] = Lam_buf6[(h18A) ];		// should be Lam_bufA6 but I diodn't want to burn more ram
	lTabA[8] = Lam_bufA6b[(i18A) ];
	lTabA[9] = Lam_bufA6c[(j18A) ];
	lTabA[10] = 0;
	lTabA[11] = 0;
	lTabA[12] = 0;
	lTabA[13] = 0;
	lTabA[14] = 0;
	lTabA[15] = 0;
	lTabA[16] = 0;
	lTabA[17] = 0;


	eTabF[0] = a18A2;
	eTabF[1] = b18A2;
	eTabF[2] = c18A2;
	eTabF[3] = (d18A2);
	eTabF[4] = (e18A2) ;
	eTabF[5] = (f18A2) ;
	eTabF[6] = (g18A2) ;
	eTabF[7] = (h18A2) ;
	eTabF[8] = (i18A2) ;
	eTabF[9] = (j18A2) ;

	lTabF[0] = Lam_bufAa[a18A2];
	lTabF[1] = Lam_bufAb[b18A2];
	lTabF[2] = Lam_bufAc[c18A2];
	lTabF[3] = Lam_bufA1[(d18A2) ];
	lTabF[4] = Lam_bufA2a[(e18A2) ];
	lTabF[5] = Lam_bufA3[(f18A2) ];
	lTabF[6] = Lam_bufA5[(g18A2) ];
	lTabF[7] = Lam_bufA6[(h18A2) ];
	lTabF[8] = Lam_bufA6b[(i18A2) ];
	lTabF[9] = Lam_bufA6c[(j18A2) ];
	lTabF[10] = 0;
	lTabF[11] = 0;
	lTabF[12] = 0;
	lTabF[13] = 0;
	lTabF[14] = 0;
	lTabF[15] = 0;
	lTabF[16] = 0;
	lTabF[17] = 0;


	pTabA[0] = SpEtaPrevA[inx].one;
	pTabA[1] = SpEtaPrevA[inx].two;
	pTabA[2] = SpEtaPrevAa[inx].three;
	pTabA[3] = SpEtaPrevAa[inx].four;
	pTabA[4] = SpEtaPrevAa[inx].five;
	pTabA[5] = SpEtaPrevAa[inx].six;
	pTabA[6] = SpEtaPrevAb[inx].seven;
	pTabA[7] = SpEtaPrevAb[inx].eight;
	pTabA[8] = SpEtaPrevAb[inx].nine;
	pTabA[9] = SpEtaPrevAb[inx].ten;
	pTabA[10] = 128;
	pTabA[11] = 128;
	pTabA[12] = 128;
	pTabA[13] = 128;
	pTabA[14] = 128;
	pTabA[15] = 128;
	pTabA[16] = 128;
	pTabA[17] = 128;

	pTabF[0] = SpEtaPrevD[inx1].one;
	pTabF[1] = SpEtaPrevD[inx1].two;
	pTabF[2] = SpEtaPrevDa[inx1].three;
	pTabF[3] = SpEtaPrevDa[inx1].four;
	pTabF[4] = SpEtaPrevDa[inx1].five;
	pTabF[5] = SpEtaPrevDa[inx1].six;
	pTabF[6] = SpEtaPrevDb[inx1].seven;
	pTabF[7] = SpEtaPrevDb[inx1].eight;
	pTabF[8] = SpEtaPrevDb[inx1].nine;
	pTabF[9] = SpEtaPrevDb[inx1].ten;
	pTabF[10] = 128;
	pTabF[11] = 128;
	pTabF[12] = 128;
	pTabF[13] = 128;
	pTabF[14] = 128;
	pTabF[15] = 128;
	pTabF[16] = 128;
	pTabF[17] = 128;



	inx = num_ntB;

	eTabB[0] = a18B;
	eTabB[1] = (b18B) ;
	eTabB[2] =  (c18B) ;
	eTabB[3] =  (d18B) ;
	eTabB[4] =  (e18B) ;
	eTabB[5] =  (f18B) ;
	eTabB[6] =  (g18B) ;
	eTabB[7] =  (h18B) ;
	eTabB[8] =  (i18B) ;
	eTabB[9] =  (j18B) ;


	lTabB[0] = Lam_bufB[a18B];
	lTabB[1] = Lam_bufB1a[(b18B) ];
	lTabB[2] = Lam_bufB1b[(c18B) ];
	lTabB[3] = Lam_bufB1c[(d18B) ];
	lTabB[4] = Lam_bufB2[(e18B) ];
	lTabB[5] = Lam_bufB3a[(f18B) ];
	lTabB[6] = Lam_bufB3b[(g18B) ];
	lTabB[7] = Lam_bufB5a[(h18B) ];
	lTabB[8] = Lam_bufB5b[(i18B) ];
	lTabB[9] = Lam_bufB6[(j18B) ];
	lTabB[10] = 0;
	lTabB[11] = 0;
	lTabB[12] = 0;
	lTabB[13] = 0;
	lTabB[14] = 0;
	lTabB[15] = 0;
	lTabB[16] = 0;
	lTabB[17] = 0;


	eTabG[0] = a18B2;
	eTabG[1] = (b18B2) ;
	eTabG[2] =  (c18B2) ;
	eTabG[3] =  (d18B2) ;
	eTabG[4] =  (e18B2) ;
	eTabG[5] =  (f18B2) ;
	eTabG[6] =  (g18B2) ;
	eTabG[7] =  (h18B2) ;
	eTabG[8] =  (i18B2) ;
	eTabG[9] =  (j18B2) ;


	lTabG[0] = Lam_bufB[a18B2];
	lTabG[1] = Lam_bufB1a[(b18B2) ];
	lTabG[2] = Lam_bufB1b[(c18B2) ];
	lTabG[3] = Lam_bufB1c[(d18B2) ];
	lTabG[4] = Lam_bufB2[(e18B2) ];
	lTabG[5] = Lam_bufB3a[(f18B2) ];
	lTabG[6] = Lam_bufB3b[(g18B2) ];
	lTabG[7] = Lam_bufB5a[(h18B2) ];
	lTabG[8] = Lam_bufB5b[(i18B2) ];
	lTabG[9] = Lam_bufB6[(j18B2) ];
	lTabG[10] = 0;
	lTabG[11] = 0;
	lTabG[12] = 0;
	lTabG[13] = 0;
	lTabG[14] = 0;
	lTabG[15] = 0;
	lTabG[16] = 0;
	lTabG[17] = 0;


	pTabB[0] = SpEtaPrevB[inx].one;
	pTabB[1] = SpEtaPrevB[inx].two;
	pTabB[2] = SpEtaPrevBa[inx].three;
	pTabB[3] = SpEtaPrevBa[inx].four;
	pTabB[4] = SpEtaPrevBa[inx].five;
	pTabB[5] = SpEtaPrevBa[inx].six;
	pTabB[6] = SpEtaPrevBb[inx].seven;
	pTabB[7] = SpEtaPrevBb[inx].eight;
	pTabB[8] = SpEtaPrevBb[inx].nine;
	pTabB[9] = SpEtaPrevBb[inx].ten;
	pTabB[10] = 128;
	pTabB[11] = 128;
	pTabB[12] = 128;
	pTabB[13] = 128;
	pTabB[14] = 128;
	pTabB[15] = 128;
	pTabB[16] = 128;
	pTabB[17] = 128;

	pTabG[0] = SpEtaPrevE[inx1].one;
	pTabG[1] = SpEtaPrevE[inx1].two;
	pTabG[2] = SpEtaPrevEa[inx1].three;
	pTabG[3] = SpEtaPrevEa[inx1].four;
	pTabG[4] = SpEtaPrevEa[inx1].five;
	pTabG[5] = SpEtaPrevEa[inx1].six;
	pTabG[6] = SpEtaPrevEb[inx1].seven;
	pTabG[7] = SpEtaPrevEb[inx1].eight;
	pTabG[8] = SpEtaPrevEb[inx1].nine;
	pTabG[9] = SpEtaPrevEb[inx1].ten;
	pTabG[10] = 128;
	pTabG[11] = 128;
	pTabG[12] = 128;
	pTabG[13] = 128;
	pTabG[14] = 128;
	pTabG[15] = 128;
	pTabG[16] = 128;
	pTabG[17] = 128;


	if (nIterationCounter == 0)
	{

		pTab[0] = 0;
		pTab[1] = 0;
		pTab[2] = 0;

		pTabE[0] = 0;
		pTabE[1] = 0;
		pTabE[2] = 0;

		pTabA[0] = 0;
		pTabA[1] = 0;
		pTabA[2] = 0;
		pTabA[3] = 0;
		pTabA[4] = 0;
		pTabA[5] = 0;
		pTabA[6] = 0;
		pTabA[7] = 0;
		pTabA[8] = 0;
		pTabA[9] = 0;
		pTabA[10] = 128;
		pTabA[11] = 128;
		pTabA[12] = 128;
		pTabA[13] = 128;
		pTabA[14] = 128;
		pTabA[15] = 128;
		pTabA[16] = 128;
		pTabA[17] = 128;

		pTabF[0] = 0;
		pTabF[1] = 0;
		pTabF[2] = 0;
		pTabF[3] = 0;
		pTabF[4] = 0;
		pTabF[5] = 0;
		pTabF[6] = 0;
		pTabF[7] = 0;
		pTabF[8] = 0;
		pTabF[9] = 0;
		pTabF[10] = 128;
		pTabF[11] = 128;
		pTabF[12] = 128;
		pTabF[13] = 128;
		pTabF[14] = 128;
		pTabF[15] = 128;
		pTabF[16] = 128;
		pTabF[17] = 128;

		pTabB[0] = 0;
		pTabB[1] = 0;
		pTabB[2] = 0;
		pTabB[3] = 0;
		pTabB[4] = 0;
		pTabB[5] = 0;
		pTabB[6] = 0;
		pTabB[7] = 0;
		pTabB[8] = 0;
		pTabB[9] = 0;
		pTabB[10] = 128;
		pTabB[11] = 128;
		pTabB[12] = 128;
		pTabB[13] = 128;
		pTabB[14] = 128;
		pTabB[15] = 128;
		pTabB[16] = 128;
		pTabB[17] = 128;

		pTabG[0] = 0;
		pTabG[1] = 0;
		pTabG[2] = 0;
		pTabG[3] = 0;
		pTabG[4] = 0;
		pTabG[5] = 0;
		pTabG[6] = 0;
		pTabG[7] = 0;
		pTabG[8] = 0;
		pTabG[9] = 0;
		pTabG[10] = 128;
		pTabG[11] = 128;
		pTabG[12] = 128;
		pTabG[13] = 128;
		pTabG[14] = 128;
		pTabG[15] = 128;
		pTabG[16] = 128;
		pTabG[17] = 128;

	}

	//		printf(" *** \n");

}

void mcalcAA_12(short *eTab, short *lTab, short *pTab, short num_nt, short num_shnt,
		short *eTabA, short *lTabA, short *pTabA, short num_ntA, short num_shntA,
		short *eTabB, short *lTabB, short *pTabB, short num_ntB, short num_shntB,
		short *eTabE, short *lTabE, short *pTabE, short *eTabF, short *lTabF, short *pTabF,
		short *eTabG, short *lTabG, short *pTabG, short *eTabH, short *lTabH, short *pTabH,
		short *eTabI, short *lTabI, short *pTabI, short *eTabJ, short *lTabJ, short *pTabJ,
		short *eTabK, short *lTabK, short *pTabK, short *eTabL, short *lTabL, short *pTabL,
		short *eTabM, short *lTabM, short *pTabM, bool prevflg)
{
	tab_int jSparse, nLenNset, nSparse;
	unsigned short a, b, c, d, e, f;
	unsigned short a2, b2, c2, d2, e2, f2;

	unsigned short a18A, b18A, c18A, d18A, e18A, f18A, g18A, h18A, i18A, j18A, k18A, l18A;
	unsigned short m18A, n18A, o18A, p18A, q18A, r18A;
	unsigned short a18A2, b18A2, c18A2, d18A2, e18A2, f18A2, g18A2, h18A2, i18A2, j18A2, k18A2, l18A2;
	unsigned short m18A2, n18A2, o18A2, p18A2, q18A2, r18A2;
	unsigned short a18A3, b18A3, c18A3, d18A3, e18A3, f18A3, g18A3, h18A3, i18A3, j18A3, k18A3, l18A3;
	unsigned short m18A3, n18A3, o18A3, p18A3, q18A3, r18A3;
	unsigned short a18A4, b18A4, c18A4, d18A4, e18A4, f18A4, g18A4, h18A4, i18A4, j18A4, k18A4, l18A4;
	unsigned short m18A4, n18A4, o18A4, p18A4, q18A4, r18A4;

	unsigned short a18B, b18B, c18B, d18B, e18B, f18B, g18B, h18B, i18B, j18B, k18B, l18B;
	unsigned short m18B, n18B, o18B, p18B, q18B, r18B;
	unsigned short a18B2, b18B2, c18B2, d18B2, e18B2, f18B2, g18B2, h18B2, i18B2, j18B2, k18B2, l18B2;
	unsigned short m18B2, n18B2, o18B2, p18B2, q18B2, r18B2;
	unsigned short a18B3, b18B3, c18B3, d18B3, e18B3, f18B3, g18B3, h18B3, i18B3, j18B3, k18B3, l18B3;
	unsigned short m18B3, n18B3, o18B3, p18B3, q18B3, r18B3;
	unsigned short a18B4, b18B4, c18B4, d18B4, e18B4, f18B4, g18B4, h18B4, i18B4, j18B4, k18B4, l18B4;
	unsigned short m18B4, n18B4, o18B4, p18B4, q18B4, r18B4;

	// Loop on jSparse

	short inx=num_nt;
	short inx1=inx+1;

	//		short in = inx /2;

	if (numb == 2048)
	{
		a = varinx3_1024_12[inx].inx1;
		b = varinx3_1024_12[inx].inx2;
		c = varinx3_1024_12[inx].inx3;

		d = varinx3_1024_12[inx1].inx1;
		e = varinx3_1024_12[inx1].inx2;
		f = varinx3_1024_12[inx1].inx3;


		a18A = varinx6A_1024_a[inx].inx1;
		b18A = varinx6A_1024_a[inx].inx2;
		c18A = varinx6A_1024_a[inx].inx3;
		d18A = varinx6A_1024_b[inx].inx1;
		e18A = varinx6A_1024_b[inx].inx2;
		f18A = varinx6A_1024_b[inx].inx3;


		a18A2 = varinx6A_1024_a[inx1].inx1;
		b18A2 = varinx6A_1024_a[inx1].inx2;
		c18A2 = varinx6A_1024_a[inx1].inx3;
		d18A2 = varinx6A_1024_b[inx1].inx1;
		e18A2 = varinx6A_1024_b[inx1].inx2;
		f18A2 = varinx6A_1024_b[inx1].inx3;


		a18B = varinx6B_1024_a[inx].inx1;
		b18B = varinx6B_1024_a[inx].inx2;
		c18B = varinx6B_1024_a[inx].inx3;
		d18B = varinx6B_1024_b[inx].inx1;
		e18B = varinx6B_1024_b[inx].inx2;
		f18B = varinx6B_1024_b[inx].inx3;

		a18B2 = varinx6B_1024_a[inx1].inx1;
		b18B2 = varinx6B_1024_a[inx1].inx2;
		c18B2 = varinx6B_1024_a[inx1].inx3;
		d18B2 = varinx6B_1024_b[inx1].inx1;
		e18B2 = varinx6B_1024_b[inx1].inx2;
		f18B2 = varinx6B_1024_b[inx1].inx3;

	}
	else
	{
		a = varinx3_4096_12[inx].inx1;
		b = varinx3_4096_12[inx].inx2;
		c = varinx3_4096_12[inx].inx3;

		d = varinx3_4096_12[inx1].inx1;
		e = varinx3_4096_12[inx1].inx2;
		f = varinx3_4096_12[inx1].inx3;


		a18A = varinx6A_4096_a[inx].inx1;
		b18A = varinx6A_4096_a[inx].inx2;
		c18A = varinx6A_4096_a[inx].inx3;
		d18A = varinx6A_4096_b[inx].inx1;
		e18A = varinx6A_4096_b[inx].inx2;
		f18A = varinx6A_4096_b[inx].inx3;

		a18A2 = varinx6A_4096_a[inx1].inx1;
		b18A2 = varinx6A_4096_a[inx1].inx2;
		c18A2 = varinx6A_4096_a[inx1].inx3;
		d18A2 = varinx6A_4096_b[inx1].inx1;
		e18A2 = varinx6A_4096_b[inx1].inx2;
		f18A2 = varinx6A_4096_b[inx1].inx3;

		a18B = varinx6B_4096_a[inx].inx1;
		b18B = varinx6B_4096_a[inx].inx2;
		c18B = varinx6B_4096_a[inx].inx3;
		d18B = varinx6B_4096_b[inx].inx1;
		e18B = varinx6B_4096_b[inx].inx2;
		f18B = varinx6B_4096_b[inx].inx3;

		a18B2 = varinx6B_4096_a[inx1].inx1;
		b18B2 = varinx6B_4096_a[inx1].inx2;
		c18B2 = varinx6B_4096_a[inx1].inx3;
		d18B2 = varinx6B_4096_b[inx1].inx1;
		e18B2 = varinx6B_4096_b[inx1].inx2;
		f18B2 = varinx6B_4096_b[inx1].inx3;

	}


	eTab[0] = (a) ;
	eTab[1] = (b) ;
	eTab[2] = (c) ;

	eTabE[0] = (d) ;
	eTabE[1] = (e) ;
	eTabE[2] = (f) ;

	lTab[0] = Lam_buf2[(a) ];
	lTab[1] = Lam_buf4[(b) ];
	lTab[2] = Lam_buf4a[(c) ];

	lTabE[0] = Lam_buf2[(d) ];
	lTabE[1] = Lam_buf4[(e) ];
	lTabE[2] = Lam_buf4a[(f) ];

	pTab[0] = SpEtaPrev[inx].one;
	pTab[1] = SpEtaPrev[inx].two;
	pTab[2] = SpEtaPrev[inx].three;

	pTabE[0] = SpEtaPrevC[inx1].one;
	pTabE[1] = SpEtaPrevC[inx1].two;
	pTabE[2] = SpEtaPrevC[inx1].three;


	inx = num_ntA;

	eTabA[0] = a18A;
	eTabA[1] = b18A;
	eTabA[2] = c18A;
	eTabA[3] = (d18A) ;
	eTabA[4] = (e18A) ;
	eTabA[5] = (f18A) ;

	lTabA[0] = Lam_bufAa[a18A];
	lTabA[1] = Lam_bufA1[b18A];
	lTabA[2] = Lam_bufA3[c18A];
	lTabA[3] = Lam_bufA4a[(d18A) ];
	lTabA[4] = Lam_bufA4b[(e18A) ];
	lTabA[5] = Lam_bufA4c[(f18A) ];
	lTabA[6] = 0;
	lTabA[7] = 0;		// should be Lam_bufA6 but I diodn't want to burn more ram
	lTabA[8] = 0;
	lTabA[9] = 0;
	lTabA[10] = 0;
	lTabA[11] = 0;
	lTabA[12] = 0;
	lTabA[13] = 0;
	lTabA[14] = 0;
	lTabA[15] = 0;
	lTabA[16] = 0;
	lTabA[17] = 0;


	eTabF[0] = a18A2;
	eTabF[1] = b18A2;
	eTabF[2] = c18A2;
	eTabF[3] = (d18A2);
	eTabF[4] = (e18A2) ;
	eTabF[5] = (f18A2) ;

	lTabF[0] = Lam_bufAa[a18A2];
	lTabF[1] = Lam_bufA1[b18A2];
	lTabF[2] = Lam_bufA3[c18A2];
	lTabF[3] = Lam_bufA4a[(d18A2) ];
	lTabF[4] = Lam_bufA4b[(e18A2) ];
	lTabF[5] = Lam_bufA4c[(f18A2) ];
	lTabF[6] = 0;
	lTabF[7] = 0;
	lTabF[8] = 0;
	lTabF[9] = 0;
	lTabF[10] = 0;
	lTabF[11] = 0;
	lTabF[12] = 0;
	lTabF[13] = 0;
	lTabF[14] = 0;
	lTabF[15] = 0;
	lTabF[16] = 0;
	lTabF[17] = 0;

	pTabA[6] = 128;
	pTabA[7] = 128;
	pTabA[8] = 128;
	pTabA[9] = 128;
	pTabA[10] = 128;
	pTabA[11] = 128;
	pTabA[12] = 128;
	pTabA[13] = 128;
	pTabA[14] = 128;
	pTabA[15] = 128;
	pTabA[16] = 128;
	pTabA[17] = 128;

	pTabF[6] = 128;
	pTabF[7] = 128;
	pTabF[8] = 128;
	pTabF[9] = 128;
	pTabF[10] = 128;
	pTabF[11] = 128;
	pTabF[12] = 128;
	pTabF[13] = 128;
	pTabF[14] = 128;
	pTabF[15] = 128;
	pTabF[16] = 128;
	pTabF[17] = 128;

	pTabA[0] = SpEtaPrevA[inx].one;
	pTabA[1] = SpEtaPrevA[inx].two;
	pTabA[2] = SpEtaPrevAa[inx].three;
	pTabA[3] = SpEtaPrevAa[inx].four;
	pTabA[4] = SpEtaPrevAa[inx].five;
	pTabA[5] = SpEtaPrevAa[inx].six;


	pTabF[0] = SpEtaPrevD[inx1].one;
	pTabF[1] = SpEtaPrevD[inx1].two;
	pTabF[2] = SpEtaPrevDa[inx1].three;
	pTabF[3] = SpEtaPrevDa[inx1].four;
	pTabF[4] = SpEtaPrevDa[inx1].five;
	pTabF[5] = SpEtaPrevDa[inx1].six;

	inx = num_ntB;

	eTabB[0] = a18B;
	eTabB[1] = (b18B) ;
	eTabB[2] =  (c18B) ;
	eTabB[3] =  (d18B) ;
	eTabB[4] =  (e18B) ;
	eTabB[5] =  (f18B) ;


	lTabB[0] = Lam_bufB[a18B];
	lTabB[1] = Lam_bufB1a[(b18B) ];
	lTabB[2] = Lam_bufB1b[(c18B) ];
	lTabB[3] = Lam_bufB3a[(d18B) ];
	lTabB[4] = Lam_bufB3b[(e18B) ];
	lTabB[5] = Lam_bufB4[(f18B) ];
	lTabB[6] = 0;
	lTabB[7] = 0;
	lTabB[8] = 0;
	lTabB[9] = 0;
	lTabB[10] = 0;
	lTabB[11] = 0;
	lTabB[12] = 0;
	lTabB[13] = 0;
	lTabB[14] = 0;
	lTabB[15] = 0;
	lTabB[16] = 0;
	lTabB[17] = 0;


	eTabG[0] = a18B2;
	eTabG[1] = (b18B2) ;
	eTabG[2] =  (c18B2) ;
	eTabG[3] =  (d18B2) ;
	eTabG[4] =  (e18B2) ;
	eTabG[5] =  (f18B2) ;


	lTabG[0] = Lam_bufB[a18B2];
	lTabG[1] = Lam_bufB1a[(b18B2) ];
	lTabG[2] = Lam_bufB1b[(c18B2) ];
	lTabG[3] = Lam_bufB3a[(d18B2) ];
	lTabG[4] = Lam_bufB3b[(e18B2) ];
	lTabG[5] = Lam_bufB4[(f18B2) ];
	lTabG[6] = 0;
	lTabG[7] = 0;
	lTabG[8] = 0;
	lTabG[9] = 0;
	lTabG[10] = 0;
	lTabG[11] = 0;
	lTabG[12] = 0;
	lTabG[13] = 0;
	lTabG[14] = 0;
	lTabG[15] = 0;
	lTabG[16] = 0;
	lTabG[17] = 0;

	pTabB[6] = 128;
	pTabB[7] = 128;
	pTabB[8] = 128;
	pTabB[9] = 128;
	pTabB[10] = 128;
	pTabB[11] = 128;
	pTabB[12] = 128;
	pTabB[13] = 128;
	pTabB[14] = 128;
	pTabB[15] = 128;
	pTabB[16] = 128;
	pTabB[17] = 128;

	pTabG[6] = 128;
	pTabG[7] = 128;
	pTabG[8] = 128;
	pTabG[9] = 128;
	pTabG[10] = 128;
	pTabG[11] = 128;
	pTabG[12] = 128;
	pTabG[13] = 128;
	pTabG[14] = 128;
	pTabG[15] = 128;
	pTabG[16] = 128;
	pTabG[17] = 128;


	pTabB[0] = SpEtaPrevB[inx].one;
	pTabB[1] = SpEtaPrevB[inx].two;
	pTabB[2] = SpEtaPrevBa[inx].three;
	pTabB[3] = SpEtaPrevBa[inx].four;
	pTabB[4] = SpEtaPrevBa[inx].five;
	pTabB[5] = SpEtaPrevBa[inx].six;


	pTabG[0] = SpEtaPrevE[inx1].one;
	pTabG[1] = SpEtaPrevE[inx1].two;
	pTabG[2] = SpEtaPrevEa[inx1].three;
	pTabG[3] = SpEtaPrevEa[inx1].four;
	pTabG[4] = SpEtaPrevEa[inx1].five;
	pTabG[5] = SpEtaPrevEa[inx1].six;


	if (nIterationCounter == 0)
	{

		pTab[0] = 0;
		pTab[1] = 0;
		pTab[2] = 0;

		pTabE[0] = 0;
		pTabE[1] = 0;
		pTabE[2] = 0;

		pTabA[0] = 0;
		pTabA[1] = 0;
		pTabA[2] = 0;
		pTabA[3] = 0;
		pTabA[4] = 0;
		pTabA[5] = 0;
		pTabA[6] = 128;
		pTabA[7] = 128;
		pTabA[8] = 128;
		pTabA[9] = 128;
		pTabA[10] = 128;
		pTabA[11] = 128;
		pTabA[12] = 128;
		pTabA[13] = 128;
		pTabA[14] = 128;
		pTabA[15] = 128;
		pTabA[16] = 128;
		pTabA[17] = 128;

		pTabF[0] = 0;
		pTabF[1] = 0;
		pTabF[2] = 0;
		pTabF[3] = 0;
		pTabF[4] = 0;
		pTabF[5] = 0;
		pTabF[6] = 128;
		pTabF[7] = 128;
		pTabF[8] = 128;
		pTabF[9] = 128;
		pTabF[10] = 128;
		pTabF[11] = 128;
		pTabF[12] = 128;
		pTabF[13] = 128;
		pTabF[14] = 128;
		pTabF[15] = 128;
		pTabF[16] = 128;
		pTabF[17] = 128;

		pTabB[0] = 0;
		pTabB[1] = 0;
		pTabB[2] = 0;
		pTabB[3] = 0;
		pTabB[4] = 0;
		pTabB[5] = 0;
		pTabB[6] = 128;
		pTabB[7] = 128;
		pTabB[8] = 128;
		pTabB[9] = 128;
		pTabB[10] = 128;
		pTabB[11] = 128;
		pTabB[12] = 128;
		pTabB[13] = 128;
		pTabB[14] = 128;
		pTabB[15] = 128;
		pTabB[16] = 128;
		pTabB[17] = 128;

		pTabG[0] = 0;
		pTabG[1] = 0;
		pTabG[2] = 0;
		pTabG[3] = 0;
		pTabG[4] = 0;
		pTabG[5] = 0;
		pTabG[6] = 128;
		pTabG[7] = 128;
		pTabG[8] = 128;
		pTabG[9] = 128;
		pTabG[10] = 128;
		pTabG[11] = 128;
		pTabG[12] = 128;
		pTabG[13] = 128;
		pTabG[14] = 128;
		pTabG[15] = 128;
		pTabG[16] = 128;
		pTabG[17] = 128;

	}

	//		printf(" *** \n");

}


void mcalcAA(short *eTab, short *lTab, short *pTab, short num_nt, short num_shnt,
		short *eTabA, short *lTabA, short *pTabA, short num_ntA, short num_shntA,
		short *eTabB, short *lTabB, short *pTabB, short num_ntB, short num_shntB,
		short *eTabE, short *lTabE, short *pTabE, short *eTabF, short *lTabF, short *pTabF,
		short *eTabG, short *lTabG, short *pTabG,  bool prevflg)
{
	tab_int jSparse, nLenNset, nSparse;
	unsigned short a, b, c, d, e, f;
	unsigned short a2, b2, c2, d2, e2, f2;

	unsigned short a18A, b18A, c18A, d18A, e18A, f18A, g18A, h18A, i18A, j18A, k18A, l18A;
	unsigned short m18A, n18A, o18A, p18A, q18A, r18A;
	unsigned short a18A2, b18A2, c18A2, d18A2, e18A2, f18A2, g18A2, h18A2, i18A2, j18A2, k18A2, l18A2;
	unsigned short m18A2, n18A2, o18A2, p18A2, q18A2, r18A2;
	unsigned short a18A3, b18A3, c18A3, d18A3, e18A3, f18A3, g18A3, h18A3, i18A3, j18A3, k18A3, l18A3;
	unsigned short m18A3, n18A3, o18A3, p18A3, q18A3, r18A3;
	unsigned short a18A4, b18A4, c18A4, d18A4, e18A4, f18A4, g18A4, h18A4, i18A4, j18A4, k18A4, l18A4;
	unsigned short m18A4, n18A4, o18A4, p18A4, q18A4, r18A4;

	unsigned short a18B, b18B, c18B, d18B, e18B, f18B, g18B, h18B, i18B, j18B, k18B, l18B;
	unsigned short m18B, n18B, o18B, p18B, q18B, r18B;
	unsigned short a18B2, b18B2, c18B2, d18B2, e18B2, f18B2, g18B2, h18B2, i18B2, j18B2, k18B2, l18B2;
	unsigned short m18B2, n18B2, o18B2, p18B2, q18B2, r18B2;
	unsigned short a18B3, b18B3, c18B3, d18B3, e18B3, f18B3, g18B3, h18B3, i18B3, j18B3, k18B3, l18B3;
	unsigned short m18B3, n18B3, o18B3, p18B3, q18B3, r18B3;
	unsigned short a18B4, b18B4, c18B4, d18B4, e18B4, f18B4, g18B4, h18B4, i18B4, j18B4, k18B4, l18B4;
	unsigned short m18B4, n18B4, o18B4, p18B4, q18B4, r18B4;

	// Loop on jSparse

	short inx=num_nt;
	short inx1=inx+1;

	//		short in = inx /2;

	if (numb == 1280)
	{
		a = varinx3_1024_45[inx].inx1;
		b = varinx3_1024_45[inx].inx2;
		c = varinx3_1024_45[inx].inx3;

		d = varinx3_1024_45[inx1].inx1;
		e = varinx3_1024_45[inx1].inx2;
		f = varinx3_1024_45[inx1].inx3;

		a18A = varinx18A_1024_a[inx].inx1;
		b18A = varinx18A_1024_a[inx].inx2;
		c18A = varinx18A_1024_a[inx].inx3;
		d18A = varinx18A_1024_b[inx].inx1;
		e18A = varinx18A_1024_b[inx].inx2;
		f18A = varinx18A_1024_b[inx].inx3;
		g18A = varinx18A_1024_c[inx].inx1;
		h18A = varinx18A_1024_c[inx].inx2;
		i18A = varinx18A_1024_c[inx].inx3;
		j18A = varinx18A_1024_d[inx].inx1;
		k18A = varinx18A_1024_d[inx].inx2;
		l18A = varinx18A_1024_d[inx].inx3;
		m18A = varinx18A_1024_e[inx].inx1;
		n18A = varinx18A_1024_e[inx].inx2;
		o18A = varinx18A_1024_e[inx].inx3;
		p18A = varinx18A_1024_f[inx].inx1;
		q18A = varinx18A_1024_f[inx].inx2;
		r18A = varinx18A_1024_f[inx].inx3;


		a18A2 = varinx18A_1024_a[inx1].inx1;
		b18A2 = varinx18A_1024_a[inx1].inx2;
		c18A2 = varinx18A_1024_a[inx1].inx3;
		d18A2 = varinx18A_1024_b[inx1].inx1;
		e18A2 = varinx18A_1024_b[inx1].inx2;
		f18A2 = varinx18A_1024_b[inx1].inx3;
		g18A2 = varinx18A_1024_c[inx1].inx1;
		h18A2 = varinx18A_1024_c[inx1].inx2;
		i18A2 = varinx18A_1024_c[inx1].inx3;
		j18A2 = varinx18A_1024_d[inx1].inx1;
		k18A2 = varinx18A_1024_d[inx1].inx2;
		l18A2 = varinx18A_1024_d[inx1].inx3;
		m18A2 = varinx18A_1024_e[inx1].inx1;
		n18A2 = varinx18A_1024_e[inx1].inx2;
		o18A2 = varinx18A_1024_e[inx1].inx3;
		p18A2 = varinx18A_1024_f[inx1].inx1;
		q18A2 = varinx18A_1024_f[inx1].inx2;
		r18A2 = varinx18A_1024_f[inx1].inx3;

		a18B = varinx18B_1024_a[inx].inx1;
		b18B = varinx18B_1024_a[inx].inx2;
		c18B = varinx18B_1024_a[inx].inx3;
		d18B = varinx18B_1024_b[inx].inx1;
		e18B = varinx18B_1024_b[inx].inx2;
		f18B = varinx18B_1024_b[inx].inx3;
		g18B = varinx18B_1024_c[inx].inx1;
		h18B = varinx18B_1024_c[inx].inx2;
		i18B = varinx18B_1024_c[inx].inx3;
		j18B = varinx18B_1024_d[inx].inx1;
		k18B = varinx18B_1024_d[inx].inx2;
		l18B = varinx18B_1024_d[inx].inx3;
		m18B = varinx18B_1024_e[inx].inx1;
		n18B = varinx18B_1024_e[inx].inx2;
		o18B = varinx18B_1024_e[inx].inx3;
		p18B = varinx18B_1024_f[inx].inx1;
		q18B = varinx18B_1024_f[inx].inx2;
		r18B = varinx18B_1024_f[inx].inx3;


		a18B2 = varinx18B_1024_a[inx1].inx1;
		b18B2 = varinx18B_1024_a[inx1].inx2;
		c18B2 = varinx18B_1024_a[inx1].inx3;
		d18B2 = varinx18B_1024_b[inx1].inx1;
		e18B2 = varinx18B_1024_b[inx1].inx2;
		f18B2 = varinx18B_1024_b[inx1].inx3;
		g18B2 = varinx18B_1024_c[inx1].inx1;
		h18B2 = varinx18B_1024_c[inx1].inx2;
		i18B2 = varinx18B_1024_c[inx1].inx3;
		j18B2 = varinx18B_1024_d[inx1].inx1;
		k18B2 = varinx18B_1024_d[inx1].inx2;
		l18B2 = varinx18B_1024_d[inx1].inx3;
		m18B2 = varinx18B_1024_e[inx1].inx1;
		n18B2 = varinx18B_1024_e[inx1].inx2;
		o18B2 = varinx18B_1024_e[inx1].inx3;
		p18B2 = varinx18B_1024_f[inx1].inx1;
		q18B2 = varinx18B_1024_f[inx1].inx2;
		r18B2 = varinx18B_1024_f[inx1].inx3;
	}
	else
	{

		a = varinx3_4096_45[inx].inx1;
		b = varinx3_4096_45[inx].inx2;
		c = varinx3_4096_45[inx].inx3;

		d = varinx3_4096_45[inx1].inx1;
		e = varinx3_4096_45[inx1].inx2;
		f = varinx3_4096_45[inx1].inx3;

		a18A = varinx18A_4096_a[inx].inx1;
		b18A = varinx18A_4096_a[inx].inx2;
		c18A = varinx18A_4096_a[inx].inx3;
		d18A = varinx18A_4096_b[inx].inx1;
		e18A = varinx18A_4096_b[inx].inx2;
		f18A = varinx18A_4096_b[inx].inx3;
		g18A = varinx18A_4096_c[inx].inx1;
		h18A = varinx18A_4096_c[inx].inx2;
		i18A = varinx18A_4096_c[inx].inx3;
		j18A = varinx18A_4096_d[inx].inx1;
		k18A = varinx18A_4096_d[inx].inx2;
		l18A = varinx18A_4096_d[inx].inx3;
		m18A = varinx18A_4096_e[inx].inx1;
		n18A = varinx18A_4096_e[inx].inx2;
		o18A = varinx18A_4096_e[inx].inx3;
		p18A = varinx18A_4096_f[inx].inx1;
		q18A = varinx18A_4096_f[inx].inx2;
		r18A = varinx18A_4096_f[inx].inx3;


		a18A2 = varinx18A_4096_a[inx1].inx1;
		b18A2 = varinx18A_4096_a[inx1].inx2;
		c18A2 = varinx18A_4096_a[inx1].inx3;
		d18A2 = varinx18A_4096_b[inx1].inx1;
		e18A2 = varinx18A_4096_b[inx1].inx2;
		f18A2 = varinx18A_4096_b[inx1].inx3;
		g18A2 = varinx18A_4096_c[inx1].inx1;
		h18A2 = varinx18A_4096_c[inx1].inx2;
		i18A2 = varinx18A_4096_c[inx1].inx3;
		j18A2 = varinx18A_4096_d[inx1].inx1;
		k18A2 = varinx18A_4096_d[inx1].inx2;
		l18A2 = varinx18A_4096_d[inx1].inx3;
		m18A2 = varinx18A_4096_e[inx1].inx1;
		n18A2 = varinx18A_4096_e[inx1].inx2;
		o18A2 = varinx18A_4096_e[inx1].inx3;
		p18A2 = varinx18A_4096_f[inx1].inx1;
		q18A2 = varinx18A_4096_f[inx1].inx2;
		r18A2 = varinx18A_4096_f[inx1].inx3;

		a18B = varinx18B_4096_a[inx].inx1;
		b18B = varinx18B_4096_a[inx].inx2;
		c18B = varinx18B_4096_a[inx].inx3;
		d18B = varinx18B_4096_b[inx].inx1;
		e18B = varinx18B_4096_b[inx].inx2;
		f18B = varinx18B_4096_b[inx].inx3;
		g18B = varinx18B_4096_c[inx].inx1;
		h18B = varinx18B_4096_c[inx].inx2;
		i18B = varinx18B_4096_c[inx].inx3;
		j18B = varinx18B_4096_d[inx].inx1;
		k18B = varinx18B_4096_d[inx].inx2;
		l18B = varinx18B_4096_d[inx].inx3;
		m18B = varinx18B_4096_e[inx].inx1;
		n18B = varinx18B_4096_e[inx].inx2;
		o18B = varinx18B_4096_e[inx].inx3;
		p18B = varinx18B_4096_f[inx].inx1;
		q18B = varinx18B_4096_f[inx].inx2;
		r18B = varinx18B_4096_f[inx].inx3;


		a18B2 = varinx18B_4096_a[inx1].inx1;
		b18B2 = varinx18B_4096_a[inx1].inx2;
		c18B2 = varinx18B_4096_a[inx1].inx3;
		d18B2 = varinx18B_4096_b[inx1].inx1;
		e18B2 = varinx18B_4096_b[inx1].inx2;
		f18B2 = varinx18B_4096_b[inx1].inx3;
		g18B2 = varinx18B_4096_c[inx1].inx1;
		h18B2 = varinx18B_4096_c[inx1].inx2;
		i18B2 = varinx18B_4096_c[inx1].inx3;
		j18B2 = varinx18B_4096_d[inx1].inx1;
		k18B2 = varinx18B_4096_d[inx1].inx2;
		l18B2 = varinx18B_4096_d[inx1].inx3;
		m18B2 = varinx18B_4096_e[inx1].inx1;
		n18B2 = varinx18B_4096_e[inx1].inx2;
		o18B2 = varinx18B_4096_e[inx1].inx3;
		p18B2 = varinx18B_4096_f[inx1].inx1;
		q18B2 = varinx18B_4096_f[inx1].inx2;
		r18B2 = varinx18B_4096_f[inx1].inx3;
	}


	eTab[0] = (a) ;
	eTab[1] = (b) ;
	eTab[2] = (c) ;

	eTabE[0] = (d) ;
	eTabE[1] = (e) ;
	eTabE[2] = (f) ;

	lTab[0] = Lam_buf8[(a) ];
	lTab[1] = Lam_buf10[(b) ];
	lTab[2] = Lam_buf10[(c) ];

	lTabE[0] = Lam_buf8[(d) ];
	lTabE[1] = Lam_buf10a[(e) ];
	lTabE[2] = Lam_buf10a[(f) ];

	pTab[0] = SpEtaPrev[inx].one;
	pTab[1] = SpEtaPrev[inx].two;
	pTab[2] = SpEtaPrev[inx].three;

	pTabE[0] = SpEtaPrevC[inx1].one;
	pTabE[1] = SpEtaPrevC[inx1].two;
	pTabE[2] = SpEtaPrevC[inx1].three;


	inx = num_ntA;

	eTabA[0] = a18A;
	eTabA[1] = b18A;
	eTabA[2] = c18A;
	eTabA[3] = (d18A) ;
	eTabA[4] = (e18A) ;
	eTabA[5] = (f18A) ;
	eTabA[6] = (g18A) ;
	eTabA[7] = (h18A) ;
	eTabA[8] = (i18A) ;
	eTabA[9] = (j18A) ;
	eTabA[10] = (k18A) ;
	eTabA[11] = (l18A) ;
	eTabA[12] = (m18A) ;
	eTabA[13] = (n18A) ;
	eTabA[14] = (o18A) ;
	eTabA[15] = (p18A) ;
	eTabA[16] = (q18A) ;
	eTabA[17] = (r18A) ;

	lTabA[0] = Lam_bufAa[a18A];
	lTabA[1] = Lam_bufAb[b18A];
	lTabA[2] = Lam_bufAc[c18A];
	lTabA[3] = Lam_bufA1[(d18A) ];
	lTabA[4] = Lam_bufA2a[(e18A) ];
	lTabA[5] = Lam_bufA2b[(f18A) ];
	lTabA[6] = Lam_bufA2c[(g18A) ];
	lTabA[7] = Lam_bufA3[(h18A) ];
	lTabA[8] = Lam_bufA4a[(i18A) ];
	lTabA[9] = Lam_bufA4b[(j18A) ];
	lTabA[10] = Lam_bufA4c[(k18A) ];
	lTabA[11] = Lam_bufA5[(l18A) ];
	lTabA[12] = Lam_bufA6[(m18A) ];
	lTabA[13] = Lam_bufA7[(n18A) ];
	lTabA[14] = Lam_bufA9[(o18A) ];
	lTabA[15] = Lam_bufA10a[(p18A) ];
	lTabA[16] = Lam_bufA10b[(q18A) ];
	lTabA[17] = Lam_bufA10c[(r18A) ];

	eTabF[0] = a18A2;
	eTabF[1] = b18A2;
	eTabF[2] = c18A2;
	eTabF[3] = (d18A2);
	eTabF[4] = (e18A2) ;
	eTabF[5] = (f18A2) ;
	eTabF[6] = (g18A2) ;
	eTabF[7] = (h18A2) ;
	eTabF[8] = (i18A2) ;
	eTabF[9] = (j18A2) ;
	eTabF[10] = (k18A2) ;
	eTabF[11] = (l18A2) ;
	eTabF[12] = (m18A2) ;
	eTabF[13] = (n18A2) ;
	eTabF[14] = (o18A2) ;
	eTabF[15] = (p18A2) ;
	eTabF[16] = (q18A2) ;
	eTabF[17] = (r18A2) ;

	lTabF[0] = Lam_bufAa[a18A2];
	lTabF[1] = Lam_bufAb[b18A2];
	lTabF[2] = Lam_bufAc[c18A2];
	lTabF[3] = Lam_bufA1[(d18A2) ];
	lTabF[4] = Lam_bufA2a[(e18A2) ];
	lTabF[5] = Lam_bufA2b[(f18A2) ];
	lTabF[6] = Lam_bufA2c[(g18A2) ];
	lTabF[7] = Lam_bufA3[(h18A2) ];
	lTabF[8] = Lam_bufA4a[(i18A2) ];
	lTabF[9] = Lam_bufA4b[(j18A2) ];
	lTabF[10] = Lam_bufA4c[(k18A2) ];
	lTabF[11] = Lam_bufA5[(l18A2) ];
	lTabF[12] = Lam_bufA6[(m18A2) ];
	lTabF[13] = Lam_bufA7[(n18A2) ];
	lTabF[14] = Lam_bufA9[(o18A2) ];
	lTabF[15] = Lam_bufA10a[(p18A2) ];
	lTabF[16] = Lam_bufA10b[(q18A2) ];
	lTabF[17] = Lam_bufA10c[(r18A2) ];

	pTabA[0] = SpEtaPrevA[inx].one;
	pTabA[1] = SpEtaPrevA[inx].two;
	pTabA[2] = SpEtaPrevAa[inx].three;
	pTabA[3] = SpEtaPrevAa[inx].four;
	pTabA[4] = SpEtaPrevAa[inx].five;
	pTabA[5] = SpEtaPrevAa[inx].six;
	pTabA[6] = SpEtaPrevAb[inx].seven;
	pTabA[7] = SpEtaPrevAb[inx].eight;
	pTabA[8] = SpEtaPrevAb[inx].nine;
	pTabA[9] = SpEtaPrevAb[inx].ten;
	pTabA[10] = SpEtaPrevAc[inx].eleven;
	pTabA[11] = SpEtaPrevAc[inx].twelve;
	pTabA[12] = SpEtaPrevAc[inx].thirteen;
	pTabA[13] = SpEtaPrevAc[inx].fourteen;
	pTabA[14] = SpEtaPrevAd[inx].fifteen;
	pTabA[15] = SpEtaPrevAd[inx].sixteen;
	pTabA[16] = SpEtaPrevAd[inx].seventeen;
	pTabA[17] = SpEtaPrevAd[inx].eighteen;

	pTabF[0] = SpEtaPrevD[inx1].one;
	pTabF[1] = SpEtaPrevD[inx1].two;
	pTabF[2] = SpEtaPrevDa[inx1].three;
	pTabF[3] = SpEtaPrevDa[inx1].four;
	pTabF[4] = SpEtaPrevDa[inx1].five;
	pTabF[5] = SpEtaPrevDa[inx1].six;
	pTabF[6] = SpEtaPrevDb[inx1].seven;
	pTabF[7] = SpEtaPrevDb[inx1].eight;
	pTabF[8] = SpEtaPrevDb[inx1].nine;
	pTabF[9] = SpEtaPrevDb[inx1].ten;
	pTabF[10] = SpEtaPrevDc[inx1].eleven;
	pTabF[11] = SpEtaPrevDc[inx1].twelve;
	pTabF[12] = SpEtaPrevDc[inx1].thirteen;
	pTabF[13] = SpEtaPrevDc[inx1].fourteen;
	pTabF[14] = SpEtaPrevDd[inx1].fifteen;
	pTabF[15] = SpEtaPrevDd[inx1].sixteen;
	pTabF[16] = SpEtaPrevDd[inx1].seventeen;
	pTabF[17] = SpEtaPrevDd[inx1].eighteen;

	inx = num_ntB;

	eTabB[0] = a18B;
	eTabB[1] = (b18B) ;
	eTabB[2] =  (c18B) ;
	eTabB[3] =  (d18B) ;
	eTabB[4] =  (e18B) ;
	eTabB[5] =  (f18B) ;
	eTabB[6] =  (g18B) ;
	eTabB[7] =  (h18B) ;
	eTabB[8] =  (i18B) ;
	eTabB[9] =  (j18B) ;
	eTabB[10] =  (k18B) ;
	eTabB[11] =  (l18B) ;
	eTabB[12] =  (m18B) ;
	eTabB[13] =  (n18B) ;
	eTabB[14] =  (o18B) ;
	eTabB[15] =  (p18B) ;
	eTabB[16] =  (q18B) ;
	eTabB[17] =  (r18B) ;

	lTabB[0] = Lam_bufB[a18B];
	lTabB[1] = Lam_bufB1a[(b18B) ];
	lTabB[2] = Lam_bufB1b[(c18B) ];
	lTabB[3] = Lam_bufB1c[(d18B) ];
	lTabB[4] = Lam_bufB2[(e18B) ];
	lTabB[5] = Lam_bufB3a[(f18B) ];
	lTabB[6] = Lam_bufB3b[(g18B) ];
	lTabB[7] = Lam_bufB3c[(h18B) ];
	lTabB[8] = Lam_bufB4[(i18B) ];
	lTabB[9] = Lam_bufB5a[(j18B) ];
	lTabB[10] = Lam_bufB5b[(k18B) ];
	lTabB[11] = Lam_bufB5c[(l18B) ];
	lTabB[12] = Lam_bufB6[(m18B) ];
	lTabB[13] = Lam_bufB7a[(n18B) ];
	lTabB[14] = Lam_bufB7b[(o18B) ];
	lTabB[15] = Lam_bufB9a[(p18B) ];
	lTabB[16] = Lam_bufB9b[(q18B) ];
	lTabB[17] = Lam_bufB10[(r18B)];

	eTabG[0] = a18B2;
	eTabG[1] = (b18B2) ;
	eTabG[2] =  (c18B2) ;
	eTabG[3] =  (d18B2) ;
	eTabG[4] =  (e18B2) ;
	eTabG[5] =  (f18B2) ;
	eTabG[6] =  (g18B2) ;
	eTabG[7] =  (h18B2) ;
	eTabG[8] =  (i18B2) ;
	eTabG[9] =  (j18B2) ;
	eTabG[10] =  (k18B2) ;
	eTabG[11] =  (l18B2) ;
	eTabG[12] =  (m18B2) ;
	eTabG[13] =  (n18B2) ;
	eTabG[14] =  (o18B2) ;
	eTabG[15] =  (p18B2) ;
	eTabG[16] =  (q18B2) ;
	eTabG[17] =  (r18B2) ;

	lTabG[0] = Lam_bufB[a18B2];
	lTabG[1] = Lam_bufB1a[(b18B2) ];
	lTabG[2] = Lam_bufB1b[(c18B2) ];
	lTabG[3] = Lam_bufB1c[(d18B2) ];
	lTabG[4] = Lam_bufB2[(e18B2) ];
	lTabG[5] = Lam_bufB3a[(f18B2) ];
	lTabG[6] = Lam_bufB3b[(g18B2) ];
	lTabG[7] = Lam_bufB3c[(h18B2) ];
	lTabG[8] = Lam_bufB4[(i18B2) ];
	lTabG[9] = Lam_bufB5a[(j18B2) ];
	lTabG[10] = Lam_bufB5b[(k18B2) ];
	lTabG[11] = Lam_bufB5c[(l18B2) ];
	lTabG[12] = Lam_bufB6[(m18B2) ];
	lTabG[13] = Lam_bufB7a[(n18B2) ];
	lTabG[14] = Lam_bufB7b[(o18B2) ];
	lTabG[15] = Lam_bufB9a[(p18B2) ];
	lTabG[16] = Lam_bufB9b[(q18B2) ];
	lTabG[17] = Lam_bufB10[(r18B2) ];


	pTabB[0] = SpEtaPrevB[inx].one;
	pTabB[1] = SpEtaPrevB[inx].two;
	pTabB[2] = SpEtaPrevBa[inx].three;
	pTabB[3] = SpEtaPrevBa[inx].four;
	pTabB[4] = SpEtaPrevBa[inx].five;
	pTabB[5] = SpEtaPrevBa[inx].six;
	pTabB[6] = SpEtaPrevBb[inx].seven;
	pTabB[7] = SpEtaPrevBb[inx].eight;
	pTabB[8] = SpEtaPrevBb[inx].nine;
	pTabB[9] = SpEtaPrevBb[inx].ten;
	pTabB[10] = SpEtaPrevBc[inx].eleven;
	pTabB[11] = SpEtaPrevBc[inx].twelve;
	pTabB[12] = SpEtaPrevBc[inx].thirteen;
	pTabB[13] = SpEtaPrevBc[inx].fourteen;
	pTabB[14] = SpEtaPrevBd[inx].fifteen;
	pTabB[15] = SpEtaPrevBd[inx].sixteen;
	pTabB[16] = SpEtaPrevBd[inx].seventeen;
	pTabB[17] = SpEtaPrevBd[inx].eighteen;

	pTabG[0] = SpEtaPrevE[inx1].one;
	pTabG[1] = SpEtaPrevE[inx1].two;
	pTabG[2] = SpEtaPrevEa[inx1].three;
	pTabG[3] = SpEtaPrevEa[inx1].four;
	pTabG[4] = SpEtaPrevEa[inx1].five;
	pTabG[5] = SpEtaPrevEa[inx1].six;
	pTabG[6] = SpEtaPrevEb[inx1].seven;
	pTabG[7] = SpEtaPrevEb[inx1].eight;
	pTabG[8] = SpEtaPrevEb[inx1].nine;
	pTabG[9] = SpEtaPrevEb[inx1].ten;
	pTabG[10] = SpEtaPrevEc[inx1].eleven;
	pTabG[11] = SpEtaPrevEc[inx1].twelve;
	pTabG[12] = SpEtaPrevEc[inx1].thirteen;
	pTabG[13] = SpEtaPrevEc[inx1].fourteen;
	pTabG[14] = SpEtaPrevEd[inx1].fifteen;
	pTabG[15] = SpEtaPrevEd[inx1].sixteen;
	pTabG[16] = SpEtaPrevEd[inx1].seventeen;
	pTabG[17] = SpEtaPrevEd[inx1].eighteen;


	if (nIterationCounter == 0)
	{

		pTab[0] = 0;
		pTab[1] = 0;
		pTab[2] = 0;

		pTabE[0] = 0;
		pTabE[1] = 0;
		pTabE[2] = 0;

		pTabA[0] = 0;
		pTabA[1] = 0;
		pTabA[2] = 0;
		pTabA[3] = 0;
		pTabA[4] = 0;
		pTabA[5] = 0;
		pTabA[6] = 0;
		pTabA[7] = 0;
		pTabA[8] = 0;
		pTabA[9] = 0;
		pTabA[10] = 0;
		pTabA[11] = 0;
		pTabA[12] = 0;
		pTabA[13] = 0;
		pTabA[14] = 0;
		pTabA[15] = 0;
		pTabA[16] = 0;
		pTabA[17] = 0;

		pTabF[0] = 0;
		pTabF[1] = 0;
		pTabF[2] = 0;
		pTabF[3] = 0;
		pTabF[4] = 0;
		pTabF[5] = 0;
		pTabF[6] = 0;
		pTabF[7] = 0;
		pTabF[8] = 0;
		pTabF[9] = 0;
		pTabF[10] = 0;
		pTabF[11] = 0;
		pTabF[12] = 0;
		pTabF[13] = 0;
		pTabF[14] = 0;
		pTabF[15] = 0;
		pTabF[16] = 0;
		pTabF[17] = 0;

		pTabB[0] = 0;
		pTabB[1] = 0;
		pTabB[2] = 0;
		pTabB[3] = 0;
		pTabB[4] = 0;
		pTabB[5] = 0;
		pTabB[6] = 0;
		pTabB[7] = 0;
		pTabB[8] = 0;
		pTabB[9] = 0;
		pTabB[10] = 0;
		pTabB[11] = 0;
		pTabB[12] = 0;
		pTabB[13] = 0;
		pTabB[14] = 0;
		pTabB[15] = 0;
		pTabB[16] = 0;
		pTabB[17] = 0;

		pTabG[0] = 0;
		pTabG[1] = 0;
		pTabG[2] = 0;
		pTabG[3] = 0;
		pTabG[4] = 0;
		pTabG[5] = 0;
		pTabG[6] = 0;
		pTabG[7] = 0;
		pTabG[8] = 0;
		pTabG[9] = 0;
		pTabG[10] = 0;
		pTabG[11] = 0;
		pTabG[12] = 0;
		pTabG[13] = 0;
		pTabG[14] = 0;
		pTabG[15] = 0;
		pTabG[16] = 0;
		pTabG[17] = 0;

	}

	//		printf(" *** \n");

}

void write_result(tab_int len, tab_int len1, tab_int len2, tab_int len3, bool prevflg)
{
	short inx;
	bool par_chk;

	bool AllChecksPassed = false;
	bool parity, parityA, parityB;
	bool parity1, parityA1, parityB1;
	bool parity2, parityA2, parityB2;
	bool parity3, parityA3, parityB3;

	AllChecksPassed = true;

	inx = inxtab[0];

	prLam_buf2[Eta_tabx[0]] += Eta_ans[0];
	prLam_buf4[Eta_tabx[1]] += Eta_ans[1];
	prLam_buf4a[Eta_tabx[2]] += Eta_ans[2];

	prLam2_buf2[Eta_tabe[0]] += Eta_ans_3[0];
	prLam2_buf4[Eta_tabe[1]] += Eta_ans_3[1];
	prLam2_buf4a[Eta_tabe[2]] += Eta_ans_3[2];

	parity =  prHat_buf8[Eta_tabx[0]] ^ prHat_buf10[Eta_tabx[1]] ^ prHat_buf10b[Eta_tabx[2]];
	parity1 =  prHat_buf8[Eta_tabe[0]] ^ prHat_buf10a[Eta_tabe[1]] ^ prHat_buf10a[Eta_tabe[2]];


	inx = inxtab[1];

	prLamC_buf[Eta_taby[0]]+= Eta_ans_1[0];
	prLamC_bufa[Eta_taby[1]]+= Eta_ans_1[1];
	prLamC_bufb[Eta_taby[2]]+= Eta_ans_1[2];
	prLamC_buf1[Eta_taby[3]]+= Eta_ans_1[3];
	prLamC_buf2[Eta_taby[4]]+= Eta_ans_1[4];
	prLamC_buf2a[Eta_taby[5]]+= Eta_ans_1[5];
	prLamC_buf2b[Eta_taby[6]]+= Eta_ans_1[6];
	prLamC_buf3[Eta_taby[7]]+= Eta_ans_1[7];
	prLamC_buf4[Eta_taby[8]]+= Eta_ans_1[8];
	prLamC_buf4a[Eta_taby[9]]+= Eta_ans_1[9];
	prLamC_buf4b[Eta_taby[10]]+= Eta_ans_1[10];
	prLamC_buf5[Eta_taby[11]]+= Eta_ans_1[11];
	prLamC_buf6[Eta_taby[12]]+= Eta_ans_1[12];
	prLamC_buf7[Eta_taby[13]]+= Eta_ans_1[13];
	prLamC_buf9[Eta_taby[14]]+= Eta_ans_1[14];
	prLamC_buf10[Eta_taby[15]]+= Eta_ans_1[15];
	prLamC_buf10a[Eta_taby[16]]+= Eta_ans_1[16];
	prLamC_buf10b[Eta_taby[17]]+= Eta_ans_1[17];

	prLam2C_buf[Eta_tabf[0]]+= Eta_ans_4[0];
	prLam2C_bufa[Eta_tabf[1]]+= Eta_ans_4[1];
	prLam2C_bufb[Eta_tabf[2]]+= Eta_ans_4[2];
	prLam2C_buf1[Eta_tabf[3]]+= Eta_ans_4[3];
	prLam2C_buf2[Eta_tabf[4]]+= Eta_ans_4[4];
	prLam2C_buf2a[Eta_tabf[5]]+= Eta_ans_4[5];
	prLam2C_buf2b[Eta_tabf[6]]+= Eta_ans_4[6];
	prLam2C_buf3[Eta_tabf[7]]+= Eta_ans_4[7];
	prLam2C_buf4[Eta_tabf[8]]+= Eta_ans_4[8];
	prLam2C_buf4a[Eta_tabf[9]]+= Eta_ans_4[9];
	prLam2C_buf4b[Eta_tabf[10]]+= Eta_ans_4[10];
	prLam2C_buf5[Eta_tabf[11]]+= Eta_ans_4[11];
	prLam2C_buf6[Eta_tabf[12]]+= Eta_ans_4[12];
	prLam2C_buf7[Eta_tabf[13]]+= Eta_ans_4[13];
	prLam2C_buf9[Eta_tabf[14]]+= Eta_ans_4[14];
	prLam2C_buf10[Eta_tabf[15]]+= Eta_ans_4[15];
	prLam2C_buf10a[Eta_tabf[16]]+= Eta_ans_4[16];
	prLam2C_buf10b[Eta_tabf[17]]+= Eta_ans_4[17];


	parityA = prHat_bufA[Eta_taby[0]] ^  prHat_bufA[Eta_taby[1]] ^  prHat_bufAb[Eta_taby[2]] ^
			prHat_bufA1[Eta_taby[3]] ^ prHat_bufA2[Eta_taby[4]] ^ prHat_bufA2[Eta_taby[5]] ^
			prHat_bufA2b[Eta_taby[6]] ^ prHat_bufA3[Eta_taby[7]] ^ prHat_bufA4[Eta_taby[8]] ^
			prHat_bufA4[Eta_taby[9]] ^ prHat_bufA4b[Eta_taby[10]] ^ prHat_bufA5[Eta_taby[11]] ^
			prHat_bufA6[Eta_taby[12]] ^ prHat_bufA7[Eta_taby[13]] ^ prHat_bufA9[Eta_taby[14]] ^
			prHat_bufA10[Eta_taby[15]] ^ prHat_bufA10[Eta_taby[16]] ^ prHat_bufA10b[Eta_taby[17]];

	parityA1 = prHat_bufAa[Eta_tabf[0]] ^  prHat_bufAa[Eta_tabf[1]] ^  prHat_bufAc[Eta_tabf[2]] ^
			prHat_bufA1[Eta_tabf[3]] ^ prHat_bufA2a[Eta_tabf[4]] ^ prHat_bufA2a[Eta_tabf[5]] ^
			prHat_bufA2c[Eta_tabf[6]] ^ prHat_bufA3[Eta_tabf[7]] ^ prHat_bufA4a[Eta_tabf[8]] ^
			prHat_bufA4a[Eta_tabf[9]] ^ prHat_bufA4b[Eta_tabf[10]] ^ prHat_bufA5[Eta_tabf[11]] ^
			prHat_bufA6a[Eta_tabf[12]] ^ prHat_bufA7[Eta_tabf[13]] ^ prHat_bufA9[Eta_tabf[14]] ^
			prHat_bufA10a[Eta_tabf[15]] ^ prHat_bufA10a[Eta_tabf[16]] ^ prHat_bufA10c[Eta_tabf[17]];


	inx = inxtab[2];


	prLamB_buf[Eta_tabz[0]]+= Eta_ans_2[0];
	prLamB_buf1[Eta_tabz[1]]+= Eta_ans_2[1];
	prLamB_buf1a[Eta_tabz[2]]+= Eta_ans_2[2];
	prLamB_buf1b[Eta_tabz[3]]+= Eta_ans_2[3];
	prLamB_buf2[Eta_tabz[4]]+= Eta_ans_2[4];
	prLamB_buf3[Eta_tabz[5]]+= Eta_ans_2[5];
	prLamB_buf3a[Eta_tabz[6]]+= Eta_ans_2[6];
	prLamB_buf3b[Eta_tabz[7]]+= Eta_ans_2[7];
	prLamB_buf4[Eta_tabz[8]]+= Eta_ans_2[8];
	prLamB_buf5[Eta_tabz[9]]+= Eta_ans_2[9];
	prLamB_buf5a[Eta_tabz[10]]+= Eta_ans_2[10];
	prLamB_buf5b[Eta_tabz[11]]+= Eta_ans_2[11];
	prLamB_buf6[Eta_tabz[12]]+= Eta_ans_2[12];
	prLamB_buf7[Eta_tabz[13]]+= Eta_ans_2[13];
	prLamB_buf7a[Eta_tabz[14]]+= Eta_ans_2[14];
	prLamB_buf9[Eta_tabz[15]]+= Eta_ans_2[15];
	prLamB_buf9a[Eta_tabz[16]]+= Eta_ans_2[16];
	prLamB_buf10[Eta_tabz[17]]+= Eta_ans_2[17];

	prLam2B_buf[Eta_tabg[0]]+= Eta_ans_5[0];
	prLam2B_buf1[Eta_tabg[1]]+= Eta_ans_5[1];
	prLam2B_buf1a[Eta_tabg[2]]+= Eta_ans_5[2];
	prLam2B_buf1b[Eta_tabg[3]]+= Eta_ans_5[3];
	prLam2B_buf2[Eta_tabg[4]]+= Eta_ans_5[4];
	prLam2B_buf3[Eta_tabg[5]]+= Eta_ans_5[5];
	prLam2B_buf3a[Eta_tabg[6]]+= Eta_ans_5[6];
	prLam2B_buf3b[Eta_tabg[7]]+= Eta_ans_5[7];
	prLam2B_buf4[Eta_tabg[8]]+= Eta_ans_5[8];
	prLam2B_buf5[Eta_tabg[9]]+= Eta_ans_5[9];
	prLam2B_buf5a[Eta_tabg[10]]+= Eta_ans_5[10];
	prLam2B_buf5b[Eta_tabg[11]]+= Eta_ans_5[11];
	prLam2B_buf6[Eta_tabg[12]]+= Eta_ans_5[12];
	prLam2B_buf7[Eta_tabg[13]]+= Eta_ans_5[13];
	prLam2B_buf7a[Eta_tabg[14]]+= Eta_ans_5[14];
	prLam2B_buf9[Eta_tabg[15]]+= Eta_ans_5[15];
	prLam2B_buf9a[Eta_tabg[16]]+= Eta_ans_5[16];
	prLam2B_buf10[Eta_tabg[17]]+= Eta_ans_5[17];


	SpEtaPrevB[inx].one = Eta_ans_2[0];
	SpEtaPrevB[inx].two = Eta_ans_2[1];
	SpEtaPrevBa[inx].three = Eta_ans_2[2];
	SpEtaPrevBa[inx].four = Eta_ans_2[3];
	SpEtaPrevBa[inx].five = Eta_ans_2[4];
	SpEtaPrevBa[inx].six = Eta_ans_2[5];
	SpEtaPrevBb[inx].seven = Eta_ans_2[6];
	SpEtaPrevBb[inx].eight = Eta_ans_2[7];
	SpEtaPrevBb[inx].nine = Eta_ans_2[8];
	SpEtaPrevBb[inx].ten = Eta_ans_2[9];
	SpEtaPrevBc[inx].eleven = Eta_ans_2[10];
	SpEtaPrevBc[inx].twelve = Eta_ans_2[11];
	SpEtaPrevBc[inx].thirteen = Eta_ans_2[12];
	SpEtaPrevBc[inx].fourteen = Eta_ans_2[13];
	SpEtaPrevBd[inx].fifteen = Eta_ans_2[14];
	SpEtaPrevBd[inx].sixteen = Eta_ans_2[15];
	SpEtaPrevBd[inx].seventeen = Eta_ans_2[16];
	SpEtaPrevBd[inx].eighteen = Eta_ans_2[17];

	SpEtaPrevE[inx+1].one = Eta_ans_5[0];
	SpEtaPrevE[inx+1].two = Eta_ans_5[1];
	SpEtaPrevEa[inx+1].three = Eta_ans_5[2];
	SpEtaPrevEa[inx+1].four = Eta_ans_5[3];
	SpEtaPrevEa[inx+1].five = Eta_ans_5[4];
	SpEtaPrevEa[inx+1].six = Eta_ans_5[5];
	SpEtaPrevEb[inx+1].seven = Eta_ans_5[6];
	SpEtaPrevEb[inx+1].eight = Eta_ans_5[7];
	SpEtaPrevEb[inx+1].nine = Eta_ans_5[8];
	SpEtaPrevEb[inx+1].ten = Eta_ans_5[9];
	SpEtaPrevEc[inx+1].eleven = Eta_ans_5[10];
	SpEtaPrevEc[inx+1].twelve = Eta_ans_5[11];
	SpEtaPrevEc[inx+1].thirteen = Eta_ans_5[12];
	SpEtaPrevEc[inx+1].fourteen = Eta_ans_5[13];
	SpEtaPrevEd[inx+1].fifteen = Eta_ans_5[14];
	SpEtaPrevEd[inx+1].sixteen = Eta_ans_5[15];
	SpEtaPrevEd[inx+1].seventeen = Eta_ans_5[16];
	SpEtaPrevEd[inx+1].eighteen = Eta_ans_5[17];

	SpEtaPrev[inx].one = Eta_ans[0];
	SpEtaPrev[inx].two = Eta_ans[1];
	SpEtaPrev[inx].three = Eta_ans[2];

	SpEtaPrevC[inx+1].one = Eta_ans_3[0];
	SpEtaPrevC[inx+1].two = Eta_ans_3[1];
	SpEtaPrevC[inx+1].three = Eta_ans_3[2];

	SpEtaPrevA[inx].one = Eta_ans_1[0];
	SpEtaPrevA[inx].two = Eta_ans_1[1];
	SpEtaPrevAa[inx].three = Eta_ans_1[2];
	SpEtaPrevAa[inx].four = Eta_ans_1[3];
	SpEtaPrevAa[inx].five = Eta_ans_1[4];
	SpEtaPrevAa[inx].six = Eta_ans_1[5];
	SpEtaPrevAb[inx].seven = Eta_ans_1[6];
	SpEtaPrevAb[inx].eight = Eta_ans_1[7];
	SpEtaPrevAb[inx].nine = Eta_ans_1[8];
	SpEtaPrevAb[inx].ten = Eta_ans_1[9];
	SpEtaPrevAc[inx].eleven = Eta_ans_1[10];
	SpEtaPrevAc[inx].twelve = Eta_ans_1[11];
	SpEtaPrevAc[inx].thirteen = Eta_ans_1[12];
	SpEtaPrevAc[inx].fourteen = Eta_ans_1[13];
	SpEtaPrevAd[inx].fifteen = Eta_ans_1[14];
	SpEtaPrevAd[inx].sixteen = Eta_ans_1[15];
	SpEtaPrevAd[inx].seventeen = Eta_ans_1[16];
	SpEtaPrevAd[inx].eighteen = Eta_ans_1[17];

	SpEtaPrevD[inx+1].one = Eta_ans_4[0];
	SpEtaPrevD[inx+1].two = Eta_ans_4[1];
	SpEtaPrevDa[inx+1].three = Eta_ans_4[2];
	SpEtaPrevDa[inx+1].four = Eta_ans_4[3];
	SpEtaPrevDa[inx+1].five = Eta_ans_4[4];
	SpEtaPrevDa[inx+1].six = Eta_ans_4[5];
	SpEtaPrevDb[inx+1].seven = Eta_ans_4[6];
	SpEtaPrevDb[inx+1].eight = Eta_ans_4[7];
	SpEtaPrevDb[inx+1].nine = Eta_ans_4[8];
	SpEtaPrevDb[inx+1].ten = Eta_ans_4[9];
	SpEtaPrevDc[inx+1].eleven = Eta_ans_4[10];
	SpEtaPrevDc[inx+1].twelve = Eta_ans_4[11];
	SpEtaPrevDc[inx+1].thirteen = Eta_ans_4[12];
	SpEtaPrevDc[inx+1].fourteen = Eta_ans_4[13];
	SpEtaPrevDd[inx+1].fifteen = Eta_ans_4[14];
	SpEtaPrevDd[inx+1].sixteen = Eta_ans_4[15];
	SpEtaPrevDd[inx+1].seventeen = Eta_ans_4[16];
	SpEtaPrevDd[inx+1].eighteen = Eta_ans_4[17];


	parityB = prHat_bufB[Eta_tabz[0]] ^ prHat_bufB1[Eta_tabz[1]] ^ prHat_bufB1b[Eta_tabz[2]] ^
			prHat_bufB1[Eta_tabz[3]] ^ prHat_bufB2[Eta_tabz[4]] ^ prHat_bufB3[Eta_tabz[5]] ^
			prHat_bufB3[Eta_tabz[6]] ^ prHat_bufB3b[Eta_tabz[7]] ^ prHat_bufB4[Eta_tabz[8]] ^
			prHat_bufB5[Eta_tabz[9]] ^ prHat_bufB5[Eta_tabz[10]] ^ prHat_bufB5b[Eta_tabz[11]] ^
			prHat_bufB6[Eta_tabz[12]] ^ prHat_bufB7[Eta_tabz[13]] ^ prHat_bufB7[Eta_tabz[14]] ^
			prHat_bufB9[Eta_tabz[15]] ^ prHat_bufB9[Eta_tabz[16]] ^ prHat_bufB10[Eta_tabz[17]];

	parityB1 = prHat_bufB[Eta_tabg[0]] ^ prHat_bufB1a[Eta_tabg[1]] ^ prHat_bufB1a[Eta_tabg[2]] ^
			prHat_bufB1c[Eta_tabg[3]] ^ prHat_bufB2[Eta_tabg[4]] ^ prHat_bufB3a[Eta_tabg[5]] ^
			prHat_bufB3a[Eta_tabg[6]] ^ prHat_bufB3c[Eta_tabg[7]] ^ prHat_bufB4[Eta_tabg[8]] ^
			prHat_bufB5a[Eta_tabg[9]] ^ prHat_bufB5a[Eta_tabg[10]] ^ prHat_bufB5c[Eta_tabg[11]] ^
			prHat_bufB6[Eta_tabg[12]] ^ prHat_bufB7a[Eta_tabg[13]] ^ prHat_bufB7a[Eta_tabg[14]] ^
			prHat_bufB9a[Eta_tabg[15]] ^ prHat_bufB9a[Eta_tabg[16]] ^ prHat_bufB10[Eta_tabg[17]];


	if ( (parity || parity1 || parityA || parityA1 ||
			parityB || parityB1) == true)
	{
		bAllChecksPassed = false;
	}


}

void write_result_23(tab_int len, tab_int len1, tab_int len2, tab_int len3, bool prevflg)
{
	short inx;
	bool par_chk;

	bool AllChecksPassed = false;
	bool parity, parityA, parityB;
	bool parity1, parityA1, parityB1;
	bool parity2, parityA2, parityB2;
	bool parity3, parityA3, parityB3;

	AllChecksPassed = true;

	inx = inxtab[0];

	SpEtaPrev[inx].one = Eta_ans[0];
	SpEtaPrev[inx].two = Eta_ans[1];
	SpEtaPrev[inx].three = Eta_ans[2];

	SpEtaPrevC[inx+1].one = Eta_ans_3[0];
	SpEtaPrevC[inx+1].two = Eta_ans_3[1];
	SpEtaPrevC[inx+1].three = Eta_ans_3[2];

	prLam_buf4[Eta_tabx[0]] += Eta_ans[0];
	prLam_buf2[Eta_tabx[1]] += Eta_ans[1];
	prLam_buf4a[Eta_tabx[2]] += Eta_ans[2];

	prLam2_buf4[Eta_tabe[0]] += Eta_ans_3[0];
	prLam2_buf2[Eta_tabe[1]] += Eta_ans_3[1];
	prLam2_buf4a[Eta_tabe[2]] += Eta_ans_3[2];

	parity =  prHat_buf4[Eta_tabx[0]] ^ prHat_buf6[Eta_tabx[1]] ^ prHat_buf6[Eta_tabx[2]];
	parity1 =  prHat_buf4a[Eta_tabe[0]] ^ prHat_buf6a[Eta_tabe[1]] ^ prHat_buf6a[Eta_tabe[2]];


	inx = inxtab[1];

	prLamC_buf[Eta_taby[0]]+= Eta_ans_1[0];
	prLamC_bufa[Eta_taby[1]]+= Eta_ans_1[1];
	prLamC_bufb[Eta_taby[2]]+= Eta_ans_1[2];
	prLamC_buf1[Eta_taby[3]]+= Eta_ans_1[3];
	prLamC_buf2[Eta_taby[4]]+= Eta_ans_1[4];
	prLamC_buf3[Eta_taby[5]]+= Eta_ans_1[5];
	prLamC_buf5[Eta_taby[6]]+= Eta_ans_1[6];
	prLamC_buf6[Eta_taby[7]]+= Eta_ans_1[7];
	prLamC_buf10a[Eta_taby[8]]+= Eta_ans_1[8];
	prLamC_buf10b[Eta_taby[9]]+= Eta_ans_1[9];

	prLam2C_buf[Eta_tabf[0]]+= Eta_ans_4[0];
	prLam2C_bufa[Eta_tabf[1]]+= Eta_ans_4[1];
	prLam2C_bufb[Eta_tabf[2]]+= Eta_ans_4[2];
	prLam2C_buf1[Eta_tabf[3]]+= Eta_ans_4[3];
	prLam2C_buf2[Eta_tabf[4]]+= Eta_ans_4[4];
	prLam2C_buf3[Eta_tabf[5]]+= Eta_ans_4[5];
	prLam2C_buf5[Eta_tabf[6]]+= Eta_ans_4[6];
	prLam2C_buf6[Eta_tabf[7]]+= Eta_ans_4[7];
	prLam2C_buf10a[Eta_tabf[8]]+= Eta_ans_4[8];
	prLam2C_buf10b[Eta_tabf[9]]+= Eta_ans_4[9];

	SpEtaPrevA[inx].one = Eta_ans_1[0];
	SpEtaPrevA[inx].two = Eta_ans_1[1];
	SpEtaPrevAa[inx].three = Eta_ans_1[2];
	SpEtaPrevAa[inx].four = Eta_ans_1[3];
	SpEtaPrevAa[inx].five = Eta_ans_1[4];
	SpEtaPrevAa[inx].six = Eta_ans_1[5];
	SpEtaPrevAb[inx].seven = Eta_ans_1[6];
	SpEtaPrevAb[inx].eight = Eta_ans_1[7];
	SpEtaPrevAb[inx].nine = Eta_ans_1[8];
	SpEtaPrevAb[inx].ten = Eta_ans_1[9];

	SpEtaPrevD[inx+1].one = Eta_ans_4[0];
	SpEtaPrevD[inx+1].two = Eta_ans_4[1];
	SpEtaPrevDa[inx+1].three = Eta_ans_4[2];
	SpEtaPrevDa[inx+1].four = Eta_ans_4[3];
	SpEtaPrevDa[inx+1].five = Eta_ans_4[4];
	SpEtaPrevDa[inx+1].six = Eta_ans_4[5];
	SpEtaPrevDb[inx+1].seven = Eta_ans_4[6];
	SpEtaPrevDb[inx+1].eight = Eta_ans_4[7];
	SpEtaPrevDb[inx+1].nine = Eta_ans_4[8];
	SpEtaPrevDb[inx+1].ten = Eta_ans_4[9];

	parityA = prHat_bufA[Eta_taby[0]] ^  prHat_bufA[Eta_taby[1]] ^  prHat_bufAb[Eta_taby[2]] ^
			prHat_bufA1[Eta_taby[3]] ^ prHat_bufA2[Eta_taby[4]] ^ prHat_bufA3[Eta_taby[5]] ^
			prHat_bufA5[Eta_taby[6]] ^ prHat_bufA6[Eta_taby[7]] ^ prHat_bufA6[Eta_taby[8]] ^
			prHat_bufA6b[Eta_taby[9]] ;

	parityA1 = prHat_bufAa[Eta_tabf[0]] ^  prHat_bufAa[Eta_tabf[1]] ^  prHat_bufAc[Eta_tabf[2]] ^
			prHat_bufA1[Eta_tabf[3]] ^ prHat_bufA2a[Eta_tabf[4]] ^ prHat_bufA3[Eta_tabf[5]] ^
			prHat_bufA5[Eta_tabf[6]] ^ prHat_bufA6a[Eta_tabf[7]] ^ prHat_bufA6a[Eta_tabf[8]] ^
			prHat_bufA6c[Eta_tabf[9]] ;


	inx = inxtab[2];


	prLamB_buf[Eta_tabz[0]]+= Eta_ans_2[0];
	prLamB_buf1[Eta_tabz[1]]+= Eta_ans_2[1];
	prLamB_buf1a[Eta_tabz[2]]+= Eta_ans_2[2];
	prLamB_buf1b[Eta_tabz[3]]+= Eta_ans_2[3];
	prLamB_buf2[Eta_tabz[4]]+= Eta_ans_2[4];
	prLamB_buf3[Eta_tabz[5]]+= Eta_ans_2[5];
	prLamB_buf3a[Eta_tabz[6]]+= Eta_ans_2[6];
	prLamB_buf5[Eta_tabz[7]]+= Eta_ans_2[7];
	prLamB_buf5a[Eta_tabz[8]]+= Eta_ans_2[8];
	prLamB_buf6[Eta_tabz[9]]+= Eta_ans_2[9];

	prLam2B_buf[Eta_tabg[0]]+= Eta_ans_5[0];
	prLam2B_buf1[Eta_tabg[1]]+= Eta_ans_5[1];
	prLam2B_buf1a[Eta_tabg[2]]+= Eta_ans_5[2];
	prLam2B_buf1b[Eta_tabg[3]]+= Eta_ans_5[3];
	prLam2B_buf2[Eta_tabg[4]]+= Eta_ans_5[4];
	prLam2B_buf3[Eta_tabg[5]]+= Eta_ans_5[5];
	prLam2B_buf3a[Eta_tabg[6]]+= Eta_ans_5[6];
	prLam2B_buf5[Eta_tabg[7]]+= Eta_ans_5[7];
	prLam2B_buf5a[Eta_tabg[8]]+= Eta_ans_5[8];
	prLam2B_buf6[Eta_tabg[9]]+= Eta_ans_5[9];

	SpEtaPrevB[inx].one = Eta_ans_2[0];
	SpEtaPrevB[inx].two = Eta_ans_2[1];
	SpEtaPrevBa[inx].three = Eta_ans_2[2];
	SpEtaPrevBa[inx].four = Eta_ans_2[3];
	SpEtaPrevBa[inx].five = Eta_ans_2[4];
	SpEtaPrevBa[inx].six = Eta_ans_2[5];
	SpEtaPrevBb[inx].seven = Eta_ans_2[6];
	SpEtaPrevBb[inx].eight = Eta_ans_2[7];
	SpEtaPrevBb[inx].nine = Eta_ans_2[8];
	SpEtaPrevBb[inx].ten = Eta_ans_2[9];

	SpEtaPrevE[inx+1].one = Eta_ans_5[0];
	SpEtaPrevE[inx+1].two = Eta_ans_5[1];
	SpEtaPrevEa[inx+1].three = Eta_ans_5[2];
	SpEtaPrevEa[inx+1].four = Eta_ans_5[3];
	SpEtaPrevEa[inx+1].five = Eta_ans_5[4];
	SpEtaPrevEa[inx+1].six = Eta_ans_5[5];
	SpEtaPrevEb[inx+1].seven = Eta_ans_5[6];
	SpEtaPrevEb[inx+1].eight = Eta_ans_5[7];
	SpEtaPrevEb[inx+1].nine = Eta_ans_5[8];
	SpEtaPrevEb[inx+1].ten = Eta_ans_5[9];


	parityB = prHat_bufB[Eta_tabz[0]] ^ prHat_bufB1[Eta_tabz[1]] ^ prHat_bufB1[Eta_tabz[2]] ^
			prHat_bufB1b[Eta_tabz[3]] ^ prHat_bufB2[Eta_tabz[4]] ^ prHat_bufB3[Eta_tabz[5]] ^
			prHat_bufB3b[Eta_tabz[6]] ^ prHat_bufB5[Eta_tabz[7]] ^ prHat_bufB5b[Eta_tabz[8]] ^
			prHat_bufB6[Eta_tabz[9]] ;

	parityB1 = prHat_bufB[Eta_tabg[0]] ^ prHat_bufB1a[Eta_tabg[1]] ^ prHat_bufB1a[Eta_tabg[2]] ^
			prHat_bufB1c[Eta_tabg[3]] ^ prHat_bufB2[Eta_tabg[4]] ^ prHat_bufB3a[Eta_tabg[5]] ^
			prHat_bufB3c[Eta_tabg[6]] ^ prHat_bufB5a[Eta_tabg[7]] ^ prHat_bufB5c[Eta_tabg[8]] ^
			prHat_bufB6[Eta_tabg[9]];


	if ( (parity || parity1 || parityA || parityA1 ||
			parityB || parityB1) == true)
	{
		bAllChecksPassed = false;
	}


}

void write_result_12(tab_int len, tab_int len1, tab_int len2, tab_int len3, bool prevflg)
{
	short inx;
	bool par_chk;

	bool AllChecksPassed = false;
	bool parity, parityA, parityB;
	bool parity1, parityA1, parityB1;
	bool parity2, parityA2, parityB2;
	bool parity3, parityA3, parityB3;

	AllChecksPassed = true;

	inx = inxtab[0];

	SpEtaPrev[inx].one = Eta_ans[0];
	SpEtaPrev[inx].two = Eta_ans[1];
	SpEtaPrev[inx].three = Eta_ans[2];

	SpEtaPrevC[inx+1].one = Eta_ans_3[0];
	SpEtaPrevC[inx+1].two = Eta_ans_3[1];
	SpEtaPrevC[inx+1].three = Eta_ans_3[2];

	prLam_buf2[Eta_tabx[0]] += Eta_ans[0];
	prLam_buf4[Eta_tabx[1]] += Eta_ans[1];
	prLam_buf4a[Eta_tabx[2]] += Eta_ans[2];

	prLam2_buf2[Eta_tabe[0]] += Eta_ans_3[0];
	prLam2_buf4[Eta_tabe[1]] += Eta_ans_3[1];
	prLam2_buf4a[Eta_tabe[2]] += Eta_ans_3[2];

	parity =  prHat_buf2[Eta_tabx[0]] ^ prHat_buf4[Eta_tabx[1]] ^ prHat_buf4[Eta_tabx[2]];
	parity1 =  prHat_buf2[Eta_tabe[0]] ^ prHat_buf4a[Eta_tabe[1]] ^ prHat_buf4a[Eta_tabe[2]];


	inx = inxtab[1];

	prLamC_buf[Eta_taby[0]]+= Eta_ans_1[0];
	prLamC_buf1[Eta_taby[1]]+= Eta_ans_1[1];
	prLamC_buf3[Eta_taby[2]]+= Eta_ans_1[2];
	prLamC_buf4[Eta_taby[3]]+= Eta_ans_1[3];
	prLamC_buf4a[Eta_taby[4]]+= Eta_ans_1[4];
	prLamC_buf4b[Eta_taby[5]]+= Eta_ans_1[5];

	prLam2C_buf[Eta_tabf[0]]+= Eta_ans_4[0];
	prLam2C_buf1[Eta_tabf[1]]+= Eta_ans_4[1];
	prLam2C_buf3[Eta_tabf[2]]+= Eta_ans_4[2];
	prLam2C_buf4[Eta_tabf[3]]+= Eta_ans_4[3];
	prLam2C_buf4a[Eta_tabf[4]]+= Eta_ans_4[4];
	prLam2C_buf4b[Eta_tabf[5]]+= Eta_ans_4[5];

	SpEtaPrevA[inx].one = Eta_ans_1[0];
	SpEtaPrevA[inx].two = Eta_ans_1[1];
	SpEtaPrevAa[inx].three = Eta_ans_1[2];
	SpEtaPrevAa[inx].four = Eta_ans_1[3];
	SpEtaPrevAa[inx].five = Eta_ans_1[4];
	SpEtaPrevAa[inx].six = Eta_ans_1[5];

	SpEtaPrevD[inx+1].one = Eta_ans_4[0];
	SpEtaPrevD[inx+1].two = Eta_ans_4[1];
	SpEtaPrevDa[inx+1].three = Eta_ans_4[2];
	SpEtaPrevDa[inx+1].four = Eta_ans_4[3];
	SpEtaPrevDa[inx+1].five = Eta_ans_4[4];
	SpEtaPrevDa[inx+1].six = Eta_ans_4[5];

	parityA = prHat_bufA[Eta_taby[0]] ^  prHat_buf1[Eta_taby[1]] ^  prHat_buf3[Eta_taby[2]] ^
			prHat_bufA4[Eta_taby[3]] ^ prHat_bufA4[Eta_taby[4]] ^ prHat_bufA4b[Eta_taby[5]] ;

	parityA1 = prHat_bufAa[Eta_tabf[0]] ^  prHat_bufA1[Eta_tabf[1]] ^  prHat_bufA3[Eta_tabf[2]] ^
			prHat_bufA4a[Eta_tabf[3]] ^ prHat_bufA4a[Eta_tabf[4]] ^ prHat_bufA4b[Eta_tabf[5]] ;


	inx = inxtab[2];


	prLamB_buf[Eta_tabz[0]]+= Eta_ans_2[0];
	prLamB_buf1[Eta_tabz[1]]+= Eta_ans_2[1];
	prLamB_buf1a[Eta_tabz[2]]+= Eta_ans_2[2];
	prLamB_buf3[Eta_tabz[3]]+= Eta_ans_2[3];
	prLamB_buf3a[Eta_tabz[4]]+= Eta_ans_2[4];
	prLamB_buf4[Eta_tabz[5]]+= Eta_ans_2[5];

	prLam2B_buf[Eta_tabg[0]]+= Eta_ans_5[0];
	prLam2B_buf1[Eta_tabg[1]]+= Eta_ans_5[1];
	prLam2B_buf1a[Eta_tabg[2]]+= Eta_ans_5[2];
	prLam2B_buf3[Eta_tabg[3]]+= Eta_ans_5[3];
	prLam2B_buf3a[Eta_tabg[4]]+= Eta_ans_5[4];
	prLam2B_buf4[Eta_tabg[5]]+= Eta_ans_5[5];

	SpEtaPrevB[inx].one = Eta_ans_2[0];
	SpEtaPrevB[inx].two = Eta_ans_2[1];
	SpEtaPrevBa[inx].three = Eta_ans_2[2];
	SpEtaPrevBa[inx].four = Eta_ans_2[3];
	SpEtaPrevBa[inx].five = Eta_ans_2[4];
	SpEtaPrevBa[inx].six = Eta_ans_2[5];

	SpEtaPrevE[inx+1].one = Eta_ans_5[0];
	SpEtaPrevE[inx+1].two = Eta_ans_5[1];
	SpEtaPrevEa[inx+1].three = Eta_ans_5[2];
	SpEtaPrevEa[inx+1].four = Eta_ans_5[3];
	SpEtaPrevEa[inx+1].five = Eta_ans_5[4];
	SpEtaPrevEa[inx+1].six = Eta_ans_5[5];

	parityB = prHat_bufB[Eta_tabz[0]] ^ prHat_bufB1[Eta_tabz[1]] ^ prHat_bufB1b[Eta_tabz[2]] ^
			prHat_bufB3[Eta_tabz[3]] ^ prHat_bufB3b[Eta_tabz[4]] ^ prHat_bufB4[Eta_tabz[5]];

	parityB1 = prHat_bufB[Eta_tabg[0]] ^ prHat_bufB1a[Eta_tabg[1]] ^ prHat_bufB1c[Eta_tabg[2]] ^
			prHat_bufB3a[Eta_tabg[3]] ^ prHat_bufB3c[Eta_tabg[4]] ^ prHat_bufB4[Eta_tabg[5]];


	if ( (parity || parity1 || parityA || parityA1 ||
			parityB || parityB1) == true)
	{
		bAllChecksPassed = false;
	}


}

void setup_calc(short m, short num_shnt,
				 short mA, short num_shntA, short mB, short num_shntB,
				 bool prevflg, short *num, short *num1, short *num2, short *num3, bool sec)
{
	short num_nt=0;
	short numpos;
	short nLenNset, nLenNset_1, nLenNset_2, nLenNset_3;
	short *ltab, *etab, *ptab;
	short *ltab1, *etab1, *ptab1;
	short *ltab2, *etab2, *ptab2;

	short *ltab3, *etab3, *ptab3;
	short *ltab4, *etab4, *ptab4;
	short *ltab5, *etab5, *ptab5;

	short *ltab6, *etab6, *ptab6;
	short *ltab7, *etab7, *ptab7;
	short *ltab8, *etab8, *ptab8;

	short *ltab9, *etab9, *ptab9;
	short *ltab10, *etab10, *ptab10;
	short *ltab11, *etab11, *ptab11;


	short num_nt0, num_ntA, num_ntB, num_nt3;
	short num_shnt0, num_shnt1, num_shnt2, num_shnt3;

	ltab = Lam_tabx;
	etab = Eta_tabx;
	ptab = Peta_tabx;
	ltab3 = Lam_tabe;
	etab3 = Eta_tabe;
	ptab3 = Peta_tabe;

	ltab6 = Lam_tabh;
	etab6 = Eta_tabh;
	ptab6 = Peta_tabh;
	ltab9 = Lam_tabk;
	etab9 = Eta_tabk;
	ptab9 = Peta_tabk;

	num_nt = m;
	inxtab[0] = m;
	num_shnt++;

	ltab1 = Lam_taby;
	etab1 = Eta_taby;
	ptab1 = Peta_taby;
	ltab4 = Lam_tabf;
	etab4 = Eta_tabf;
	ptab4 = Peta_tabf;

	ltab7 = Lam_tabi;
	etab7 = Eta_tabi;
	ptab7 = Peta_tabi;
	ltab10 = Lam_tabl;
	etab10= Eta_tabl;
	ptab10 = Peta_tabl;


	num_ntA = mA;
	inxtab[1] = num_ntA;
	num_shntA++;

	ltab2 = Lam_tabz;
	etab2 = Eta_tabz;
	ptab2 = Peta_tabz;
	ltab5 = Lam_tabg;
	etab5 = Eta_tabg;
	ptab5 = Peta_tabg;

	ltab8 = Lam_tabj;
	etab8 = Eta_tabj;
	ptab8 = Peta_tabj;
	ltab11 = Lam_tabm;
	etab11 = Eta_tabm;
	ptab11 = Peta_tabm;


	num_ntB = mB;
	inxtab[2] = num_ntB;
	num_shntB++;

		mcalcAA(etab, ltab, ptab, num_nt, num_shnt,
				etab1, ltab1, ptab1, num_ntA, num_shntA,
				etab2, ltab2, ptab2, num_ntB, num_shntB,
				etab3, ltab3, ptab3, etab4, ltab4, ptab4,
				etab5, ltab5, ptab5, prevflg);

	*num = 3+4+8;
	*num1 = 18+19+38;
	*num2 = 18+19+38;
	*num3 = 0;

}

void setup_calc_23(short m, short num_shnt,
				 short mA, short num_shntA, short mB, short num_shntB,
				 bool prevflg, short *num, short *num1, short *num2, short *num3, bool sec)
{
	short num_nt=0;
	short numpos;
	short nLenNset, nLenNset_1, nLenNset_2, nLenNset_3;
	short *ltab, *etab, *ptab;
	short *ltab1, *etab1, *ptab1;
	short *ltab2, *etab2, *ptab2;

	short *ltab3, *etab3, *ptab3;
	short *ltab4, *etab4, *ptab4;
	short *ltab5, *etab5, *ptab5;

	short *ltab6, *etab6, *ptab6;
	short *ltab7, *etab7, *ptab7;
	short *ltab8, *etab8, *ptab8;

	short *ltab9, *etab9, *ptab9;
	short *ltab10, *etab10, *ptab10;
	short *ltab11, *etab11, *ptab11;


	short num_nt0, num_ntA, num_ntB, num_nt3;
	short num_shnt0, num_shnt1, num_shnt2, num_shnt3;

	ltab = Lam_tabx;
	etab = Eta_tabx;
	ptab = Peta_tabx;
	ltab3 = Lam_tabe;
	etab3 = Eta_tabe;
	ptab3 = Peta_tabe;

	ltab6 = Lam_tabh;
	etab6 = Eta_tabh;
	ptab6 = Peta_tabh;
	ltab9 = Lam_tabk;
	etab9 = Eta_tabk;
	ptab9 = Peta_tabk;

	num_nt = m;
	inxtab[0] = m;
	num_shnt++;

	ltab1 = Lam_taby;
	etab1 = Eta_taby;
	ptab1 = Peta_taby;
	ltab4 = Lam_tabf;
	etab4 = Eta_tabf;
	ptab4 = Peta_tabf;

	ltab7 = Lam_tabi;
	etab7 = Eta_tabi;
	ptab7 = Peta_tabi;
	ltab10 = Lam_tabl;
	etab10= Eta_tabl;
	ptab10 = Peta_tabl;


	num_ntA = mA;
	inxtab[1] = num_ntA;
	num_shntA++;

	ltab2 = Lam_tabz;
	etab2 = Eta_tabz;
	ptab2 = Peta_tabz;
	ltab5 = Lam_tabg;
	etab5 = Eta_tabg;
	ptab5 = Peta_tabg;

	ltab8 = Lam_tabj;
	etab8 = Eta_tabj;
	ptab8 = Peta_tabj;
	ltab11 = Lam_tabm;
	etab11 = Eta_tabm;
	ptab11 = Peta_tabm;


	num_ntB = mB;
	inxtab[2] = num_ntB;
	num_shntB++;

	mcalcAA_23(etab, ltab, ptab, num_nt, num_shnt,
			etab1, ltab1, ptab1, num_ntA, num_shntA,
			etab2, ltab2, ptab2, num_ntB, num_shntB,
			etab3, ltab3, ptab3, etab4, ltab4, ptab4,
			etab5, ltab5, ptab5, etab6, ltab6, ptab6,
			etab7, ltab7, ptab7, etab8, ltab8, ptab8,
			etab9, ltab9, ptab9, etab10, ltab10, ptab10,
			etab11, ltab11, ptab11, prevflg);


	*num = 3+4+8;
	*num1 = 18+19+38;
	*num2 = 18+19+38;
	*num3 = 0;

}

void setup_calc_12(short m, short num_shnt,
				 short mA, short num_shntA, short mB, short num_shntB,
				 bool prevflg, short *num, short *num1, short *num2, short *num3, bool sec)
{
	short num_nt=0;
	short numpos;
	short nLenNset, nLenNset_1, nLenNset_2, nLenNset_3;
	short *ltab, *etab, *ptab;
	short *ltab1, *etab1, *ptab1;
	short *ltab2, *etab2, *ptab2;

	short *ltab3, *etab3, *ptab3;
	short *ltab4, *etab4, *ptab4;
	short *ltab5, *etab5, *ptab5;

	short *ltab6, *etab6, *ptab6;
	short *ltab7, *etab7, *ptab7;
	short *ltab8, *etab8, *ptab8;

	short *ltab9, *etab9, *ptab9;
	short *ltab10, *etab10, *ptab10;
	short *ltab11, *etab11, *ptab11;


	short num_nt0, num_ntA, num_ntB, num_nt3;
	short num_shnt0, num_shnt1, num_shnt2, num_shnt3;

	ltab = Lam_tabx;
	etab = Eta_tabx;
	ptab = Peta_tabx;
	ltab3 = Lam_tabe;
	etab3 = Eta_tabe;
	ptab3 = Peta_tabe;

	ltab6 = Lam_tabh;
	etab6 = Eta_tabh;
	ptab6 = Peta_tabh;
	ltab9 = Lam_tabk;
	etab9 = Eta_tabk;
	ptab9 = Peta_tabk;

	num_nt = m;
	inxtab[0] = m;
	num_shnt++;

	ltab1 = Lam_taby;
	etab1 = Eta_taby;
	ptab1 = Peta_taby;
	ltab4 = Lam_tabf;
	etab4 = Eta_tabf;
	ptab4 = Peta_tabf;

	ltab7 = Lam_tabi;
	etab7 = Eta_tabi;
	ptab7 = Peta_tabi;
	ltab10 = Lam_tabl;
	etab10= Eta_tabl;
	ptab10 = Peta_tabl;


	num_ntA = mA;
	inxtab[1] = num_ntA;
	num_shntA++;

	ltab2 = Lam_tabz;
	etab2 = Eta_tabz;
	ptab2 = Peta_tabz;
	ltab5 = Lam_tabg;
	etab5 = Eta_tabg;
	ptab5 = Peta_tabg;

	ltab8 = Lam_tabj;
	etab8 = Eta_tabj;
	ptab8 = Peta_tabj;
	ltab11 = Lam_tabm;
	etab11 = Eta_tabm;
	ptab11 = Peta_tabm;


	num_ntB = mB;
	inxtab[2] = num_ntB;
	num_shntB++;

	mcalcAA_12(etab, ltab, ptab, num_nt, num_shnt,
			etab1, ltab1, ptab1, num_ntA, num_shntA,
			etab2, ltab2, ptab2, num_ntB, num_shntB,
			etab3, ltab3, ptab3, etab4, ltab4, ptab4,
			etab5, ltab5, ptab5, etab6, ltab6, ptab6,
			etab7, ltab7, ptab7, etab8, ltab8, ptab8,
			etab9, ltab9, ptab9, etab10, ltab10, ptab10,
			etab11, ltab11, ptab11, prevflg);


	*num = 3+4+8;
	*num1 = 18+19+38;
	*num2 = 18+19+38;
	*num3 = 0;

}

void calc_m(tab_int nCodeM,    bool prevflg)
{
	short m, mA, mB;
//	int loopnum=0;
	short nLenNset, nLenNset_1, nLenNset_2, nLenNset_3;
	tab_int nLenNset_4, nLenNset_5, nLenNset_6, nLenNset_7;

	tab_int nLenNset_8, nLenNset_9, nLenNset_10, nLenNset_11;
	tab_int nLenNset_12, nLenNset_13, nLenNset_14, nLenNset_15;

//	nCodeM = 3;

//	printf("nCodeM == %i \n", nCodeM);

	short num_nt=0;
	short num_shnt=0;
	short num_deg;
	short num_ntA, num_ntB, num_shntB, num_shntA;

	short *ltab, *etab, *ptab;

	m = 0;
	mA = 128;
	mB = 256;

	num_shntA = 512;
	num_shntB = 2944;

	calc_m_labe45:
	for(m=0;m<rows;++m)
	{
//		setup_calc(m, num_shnt, m, num_shntA, m, num_shntB, prevflg, &nLenNset,  &nLenNset_1, &nLenNset_2, &nLenNset_3, true);
		setup_calc(m, num_shnt, m, num_shntA, m, num_shntB, true, &nLenNset,  &nLenNset_1, &nLenNset_2, &nLenNset_3, true);

		mA++;
		mA++;
		mB++;
		mB++;
		m++;

		calc_ma(nLenNset, nLenNset_1, nLenNset_2, nLenNset_3);
//		write_result(nLenNset, nLenNset_1, nLenNset_2, nLenNset_3, prevflg);
		write_result(nLenNset, nLenNset_1, nLenNset_2, nLenNset_3, false);
	}

}

void calc_m_23(tab_int nCodeM,    bool prevflg)
{
	short m, mA, mB;
//	int loopnum=0;
	short nLenNset, nLenNset_1, nLenNset_2, nLenNset_3;
	tab_int nLenNset_4, nLenNset_5, nLenNset_6, nLenNset_7;

	tab_int nLenNset_8, nLenNset_9, nLenNset_10, nLenNset_11;
	tab_int nLenNset_12, nLenNset_13, nLenNset_14, nLenNset_15;

//	nCodeM = 3;

//	printf("nCodeM == %i \n", nCodeM);

	short num_nt=0;
	short num_shnt=0;
	short num_deg;
	short num_ntA, num_ntB, num_shntB, num_shntA;

	short *ltab, *etab, *ptab;

	m = 0;
	mA = 128;
	mB = 256;

	num_shntA = 512;
	num_shntB = 2944;

	calc_m_label0:for(m=0;m<rows;++m)
	{
//		setup_calc_23(m, num_shnt, m, num_shntA, m, num_shntB, prevflg, &nLenNset,  &nLenNset_1, &nLenNset_2, &nLenNset_3, true);
		setup_calc_23(m, num_shnt, m, num_shntA, m, num_shntB, true, &nLenNset,  &nLenNset_1, &nLenNset_2, &nLenNset_3, true);

		mA++;
		mA++;
		mB++;
		mB++;
		m++;

		calc_ma(nLenNset, nLenNset_1, nLenNset_2, nLenNset_3);
//		write_result_23(nLenNset, nLenNset_1, nLenNset_2, nLenNset_3, prevflg);
		write_result_23(nLenNset, nLenNset_1, nLenNset_2, nLenNset_3, false);
	}

}

void calc_m_12(tab_int nCodeM,    bool prevflg)
{
	short m, mA, mB;
//	int loopnum=0;
	short nLenNset, nLenNset_1, nLenNset_2, nLenNset_3;
	tab_int nLenNset_4, nLenNset_5, nLenNset_6, nLenNset_7;

	tab_int nLenNset_8, nLenNset_9, nLenNset_10, nLenNset_11;
	tab_int nLenNset_12, nLenNset_13, nLenNset_14, nLenNset_15;

//	nCodeM = 3;

//	printf("nCodeM == %i \n", nCodeM);

	short num_nt=0;
	short num_shnt=0;
	short num_deg;
	short num_ntA, num_ntB, num_shntB, num_shntA;

	short *ltab, *etab, *ptab;

	m = 0;
	mA = 128;
	mB = 256;

	num_shntA = 512;
	num_shntB = 2944;

	calc_m_label0:for(m=0;m<rows;++m)
	{
//		setup_calc_12(m, num_shnt, m, num_shntA, m, num_shntB, prevflg, &nLenNset,  &nLenNset_1, &nLenNset_2, &nLenNset_3, true);
		setup_calc_12(m, num_shnt, m, num_shntA, m, num_shntB, true, &nLenNset,  &nLenNset_1, &nLenNset_2, &nLenNset_3, true);

		mA++;
		mA++;
		mB++;
		mB++;
		m++;

		calc_ma(nLenNset, nLenNset_1, nLenNset_2, nLenNset_3);
//		write_result_12(nLenNset, nLenNset_1, nLenNset_2, nLenNset_3, prevflg);
		write_result_12(nLenNset, nLenNset_1, nLenNset_2, nLenNset_3, false);
	}

}

void calc_ma(short num, short num_1, short num_2, short num_3)
{
	mcalcB(num, Peta_tabx, Lam_tabx, Eta_ans);
	mcalcC(num_1);
	mcalcD(num_2);
	mcalcE(num_3);
	mcalcF(num_3);
	mcalcG(num_3);

}

void mcalcB(short num, short *ptab, short *ltab, short *atab)
{
		int12 vMetric, vArg, minval, min, last, test, flag;
		tab_int jSparse, nLenNset, nSparse;

//		short *ptab, *ltab, *atab;

		ptab=Peta_tabx;
		ltab=Lam_tabx;
		atab=Eta_ans;

		int12 est[20];


		int12 mul1 = 1, mul2 =1, mul3 =1;

		bool sgn[18];

			// Loop on jSparse
				for(jSparse=0;jSparse<3;++jSparse)
				{
						vArg = -ltab[jSparse]
						       + ptab[jSparse];

//						vArg = -Lam_tabx[jSparse]
//						       + Peta_tabx[jSparse];

						if (vArg >= 0)
							sgn[jSparse] = false;
						else
						{
							sgn[jSparse] = true;
							vArg = vArg *-1;
						}


						if (vArg >= 127)
							est[jSparse] = 127;
						else if (vArg >= 63)
							est[jSparse] = 63;
						else if (vArg >= 31)
							est[jSparse] = 31;
						else if (vArg >= 15)
							est[jSparse] = 15;
						else if (vArg >= 7)
							est[jSparse] = 7;
						else if (vArg >= 3)
							est[jSparse] = 3;
						else
							est[jSparse] =1;


				}

				if ( !(sgn[1] ^ sgn[2] ))
					mul1 = -1;

				if ( !(sgn[0] ^ sgn[2] ))
					mul2 = -1;

				if ( !(sgn[0] ^ sgn[1] ))
					mul3 = -1;



				atab[0]= (est[1] & est[2]) * mul1 ;

				atab[1]= (est[0] & est[2]) * mul2 ;

				atab[2]= (est[0] & est[1]) * mul3 ;

/*
				Eta_ans[0]= (est[1] & est[2]) * mul1 ;

				Eta_ans[1]= (est[0] & est[2]) * mul2 ;

				Eta_ans[2]= (est[0] & est[1]) * mul3 ;
*/

}

void mcalcC(short num)
{
		int12 vMetric, vArg, minval, min, last, est[20], test, flag;
		tab_int jSparse, nLenNset, nSparse;

		int12 mul0 = 1, mul1 = 1, mul2 =1, mul3= 1, mul4 = 1, mul5 = 1;
		int12 mul6 = 1, mul7 = 1, mul8 =1, mul9= 1, mul10 = 1, mul11 = 1;
		int12 mul12 = 1, mul13 = 1, mul14 =1, mul15= 1, mul16 = 1, mul17 = 1;

		bool sgn[18];

			// Loop on jSparse
			for(jSparse=0;jSparse<18;++jSparse)
			{
					vArg = -Lam_taby[jSparse]
					       + Peta_taby[jSparse];

					if (vArg >= 0)
						sgn[jSparse] = false;
					else
					{
						sgn[jSparse] = true;
						vArg = vArg *-1;
					}

					if (vArg >= 127)
						est[jSparse] = 127;
					else if (vArg >= 63)
						est[jSparse] = 63;
					else if (vArg >= 31)
						est[jSparse] = 31;
					else if (vArg >= 15)
						est[jSparse] = 15;
					else if (vArg >= 7)
						est[jSparse] = 7;
					else if (vArg >= 3)
						est[jSparse] = 3;
					else
						est[jSparse] =1;

			}

			if ( !(sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul0 = -1;

			if ( !(sgn[0] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul1 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul2 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul3 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul4 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul5 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul6 = -1;

			if (!( sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul7 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul8 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[10]  ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul9 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul10 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul11 = -1;

			if ( !( sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul12= -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul13= -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul14 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[16] ^ sgn[17]))
				mul15 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[15] ^ sgn[17]))
				mul16 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[15] ^ sgn[16]))
				mul17 = -1;

			Eta_ans_1[0]= (est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul0;

			Eta_ans_1[1]= (est[0] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul1;

			Eta_ans_1[2]= (est[0] & est[1] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul2;

			Eta_ans_1[3]= (est[0] & est[1] & est[2] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul3;

			Eta_ans_1[4]= (est[0] & est[1] & est[2] & est[3] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul4 ;

			Eta_ans_1[5]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul5 ;

			Eta_ans_1[6]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul6 ;

			Eta_ans_1[7]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul7 ;

			Eta_ans_1[8]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul8;

			Eta_ans_1[9]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul9;

			Eta_ans_1[10]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul10 ;

			Eta_ans_1[11]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul11;

			Eta_ans_1[12]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul12;

			Eta_ans_1[13]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[14] & est[15] & est[16] & est[17]) * mul13;

			Eta_ans_1[14]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[15] & est[16] & est[17]) * mul14;

			Eta_ans_1[15]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[16] & est[17]) * mul15 ;

			Eta_ans_1[16]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[15] & est[17]) * mul16;

			Eta_ans_1[17]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[15] & est[16]) * mul17;

}

void mcalcD(short num)
{
		int12 vMetric, vArg, minval, min, last, est[20], test, flag;
		tab_int jSparse, nLenNset, nSparse;

		int12 mul0 = 1, mul1 = 1, mul2 =1, mul3= 1, mul4 = 1, mul5 = 1;
		int12 mul6 = 1, mul7 = 1, mul8 =1, mul9= 1, mul10 = 1, mul11 = 1;
		int12 mul12 = 1, mul13 = 1, mul14 =1, mul15= 1, mul16 = 1, mul17 = 1;
		bool sgn[18];

			// Loop on jSparse
			for(jSparse=0;jSparse<18;++jSparse)
			{
					vArg = -Lam_tabz[jSparse]
					       + Peta_tabz[jSparse];

					if (vArg >= 0)
						sgn[jSparse] = false;
					else
					{
						sgn[jSparse] = true;
						vArg = vArg *-1;
					}

					if (vArg >= 127)
						est[jSparse] = 127;
					else if (vArg >= 63)
						est[jSparse] = 63;
					else if (vArg >= 31)
						est[jSparse] = 31;
					else if (vArg >= 15)
						est[jSparse] = 15;
					else if (vArg >= 7)
						est[jSparse] = 7;
					else if (vArg >= 3)
						est[jSparse] = 3;
					else
						est[jSparse] =1;

			}

			if ( !(sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul0 = -1;

			if ( !(sgn[0] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul1 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul2 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul3 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul4 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul5 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul6 = -1;

			if (!( sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul7 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul8 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[10]  ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul9 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul10 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul11 = -1;

			if ( !( sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul12= -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul13= -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul14 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[16] ^ sgn[17]))
				mul15 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[15] ^ sgn[17]))
				mul16 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[15] ^ sgn[16]))
				mul17 = -1;

			Eta_ans_2[0]= (est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul0;

			Eta_ans_2[1]= (est[0] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul1;

			Eta_ans_2[2]= (est[0] & est[1] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul2;

			Eta_ans_2[3]= (est[0] & est[1] & est[2] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul3;

			Eta_ans_2[4]= (est[0] & est[1] & est[2] & est[3] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul4 ;

			Eta_ans_2[5]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul5 ;

			Eta_ans_2[6]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul6 ;

			Eta_ans_2[7]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul7 ;

			Eta_ans_2[8]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul8;

			Eta_ans_2[9]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul9;

			Eta_ans_2[10]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul10 ;

			Eta_ans_2[11]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul11;

			Eta_ans_2[12]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul12;

			Eta_ans_2[13]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[14] & est[15] & est[16] & est[17]) * mul13;

			Eta_ans_2[14]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[15] & est[16] & est[17]) * mul14;

			Eta_ans_2[15]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[16] & est[17]) * mul15 ;

			Eta_ans_2[16]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[15] & est[17]) * mul16;

			Eta_ans_2[17]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[15] & est[16]) * mul17;

}


void mcalcE(short num)
{
		int12 vMetric, vArg, minval, min, last, est[20], test, flag;
		tab_int jSparse, nLenNset, nSparse;
		int12 mul1 = 1, mul2 =1, mul3 =1;

		bool sgn[18];

			// Loop on jSparse
				for(jSparse=0;jSparse<3;++jSparse)
				{
						vArg = -Lam_tabe[jSparse]
						       + Peta_tabe[jSparse];

						if (vArg >= 0)
							sgn[jSparse] = false;
						else
						{
							sgn[jSparse] = true;
							vArg = vArg *-1;
						}

						if (vArg >= 127)
							est[jSparse] = 127;
						else if (vArg >= 63)
							est[jSparse] = 63;
						else if (vArg >= 31)
							est[jSparse] = 31;
						else if (vArg >= 15)
							est[jSparse] = 15;
						else if (vArg >= 7)
							est[jSparse] = 7;
						else if (vArg >= 3)
							est[jSparse] = 3;
						else
							est[jSparse] =1;

				}

				if ( !(sgn[1] ^ sgn[2] ))
					mul1 = -1;

				if ( !(sgn[0] ^ sgn[2] ))
					mul2 = -1;

				if ( !(sgn[0] ^ sgn[1] ))
					mul3 = -1;

				Eta_ans_3[0]= (est[1] & est[2]) * mul1 ;

				Eta_ans_3[1]= (est[0] & est[2]) * mul2 ;

				Eta_ans_3[2]= (est[0] & est[1]) * mul3 ;

/*
				if ( !(sgn[1] ^ sgn[2] ))
					Eta_ans_3[0] *= -1;

				if ( !(sgn[0] ^ sgn[2] ))
					Eta_ans_3[1] *= -1;

				if ( !(sgn[0] ^ sgn[1] ))
					Eta_ans_3[2] *= -1;
*/

 }

void mcalcF(short num)
{
		int12 vMetric, vArg, minval, min, last, est[20], test, flag;
		tab_int jSparse, nLenNset, nSparse;
		int12 mul0 = 1, mul1 = 1, mul2 =1, mul3= 1, mul4 = 1, mul5 = 1;
		int12 mul6 = 1, mul7 = 1, mul8 =1, mul9= 1, mul10 = 1, mul11 = 1;
		int12 mul12 = 1, mul13 = 1, mul14 =1, mul15= 1, mul16 = 1, mul17 = 1;

		bool sgn[18];

			// Loop on jSparse
			for(jSparse=0;jSparse<18;++jSparse)
			{
					vArg = -Lam_tabf[jSparse]
					       + Peta_tabf[jSparse];

					if (vArg >= 0)
						sgn[jSparse] = false;
					else
					{
						sgn[jSparse] = true;
						vArg = vArg *-1;
					}

					if (vArg >= 127)
						est[jSparse] = 127;
					else if (vArg >= 63)
						est[jSparse] = 63;
					else if (vArg >= 31)
						est[jSparse] = 31;
					else if (vArg >= 15)
						est[jSparse] = 15;
					else if (vArg >= 7)
						est[jSparse] = 7;
					else if (vArg >= 3)
						est[jSparse] = 3;
					else
						est[jSparse] =1;

			}

			if ( !(sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul0 = -1;

			if ( !(sgn[0] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul1 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul2 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul3 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul4 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul5 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul6 = -1;

			if (!( sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul7 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul8 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[10]  ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul9 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul10 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul11 = -1;

			if ( !( sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul12= -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul13= -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul14 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[16] ^ sgn[17]))
				mul15 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[15] ^ sgn[17]))
				mul16 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[15] ^ sgn[16]))
				mul17 = -1;

			Eta_ans_4[0]= (est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul0;

			Eta_ans_4[1]= (est[0] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul1;

			Eta_ans_4[2]= (est[0] & est[1] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul2;

			Eta_ans_4[3]= (est[0] & est[1] & est[2] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul3;

			Eta_ans_4[4]= (est[0] & est[1] & est[2] & est[3] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul4 ;

			Eta_ans_4[5]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul5 ;

			Eta_ans_4[6]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul6 ;

			Eta_ans_4[7]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul7 ;

			Eta_ans_4[8]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul8;

			Eta_ans_4[9]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul9;

			Eta_ans_4[10]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul10 ;

			Eta_ans_4[11]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul11;

			Eta_ans_4[12]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul12;

			Eta_ans_4[13]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[14] & est[15] & est[16] & est[17]) * mul13;

			Eta_ans_4[14]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[15] & est[16] & est[17]) * mul14;

			Eta_ans_4[15]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[16] & est[17]) * mul15 ;

			Eta_ans_4[16]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[15] & est[17]) * mul16;

			Eta_ans_4[17]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[15] & est[16]) * mul17;


 }

void mcalcG(short num)
{
		int12 vMetric, vArg, minval, min, last, est[20], test, flag;
		tab_int jSparse, nLenNset, nSparse;
		int12 mul0 = 1, mul1 = 1, mul2 =1, mul3= 1, mul4 = 1, mul5 = 1;
		int12 mul6 = 1, mul7 = 1, mul8 =1, mul9= 1, mul10 = 1, mul11 = 1;
		int12 mul12 = 1, mul13 = 1, mul14 =1, mul15= 1, mul16 = 1, mul17 = 1;

		bool sgn[18];
			// Loop on jSparse
			for(jSparse=0;jSparse<18;++jSparse)
			{
					vArg = -Lam_tabg[jSparse]
					       + Peta_tabg[jSparse];

					if (vArg >= 0)
						sgn[jSparse] = false;
					else
					{
						sgn[jSparse] = true;
						vArg = vArg *-1;
					}

					if (vArg >= 127)
						est[jSparse] = 127;
					else if (vArg >= 63)
						est[jSparse] = 63;
					else if (vArg >= 31)
						est[jSparse] = 31;
					else if (vArg >= 15)
						est[jSparse] = 15;
					else if (vArg >= 7)
						est[jSparse] = 7;
					else if (vArg >= 3)
						est[jSparse] = 3;
					else
						est[jSparse] =1;

			}

			if ( !(sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul0 = -1;

			if ( !(sgn[0] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul1 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul2 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul3 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[5] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul4 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[6] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul5 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[7] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul6 = -1;

			if (!( sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul7 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul8 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[10]  ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul9 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[11] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul10 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[12] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul11 = -1;

			if ( !( sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[13]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul12= -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[14] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul13= -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[15] ^ sgn[16] ^ sgn[17]))
				mul14 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[16] ^ sgn[17]))
				mul15 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[15] ^ sgn[17]))
				mul16 = -1;

			if ( !(sgn[0] ^ sgn[1] ^ sgn[2] ^ sgn[3] ^ sgn[4] ^ sgn[5] ^ sgn[6] ^ sgn [7] ^ sgn[8] ^ sgn[9] ^ sgn[10] ^ sgn[11] ^ sgn[12]
				  ^ sgn[13] ^ sgn[14] ^ sgn[15] ^ sgn[16]))
				mul17 = -1;

			Eta_ans_5[0]= (est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul0;

			Eta_ans_5[1]= (est[0] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul1;

			Eta_ans_5[2]= (est[0] & est[1] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul2;

			Eta_ans_5[3]= (est[0] & est[1] & est[2] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul3;

			Eta_ans_5[4]= (est[0] & est[1] & est[2] & est[3] & est[5] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul4 ;

			Eta_ans_5[5]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[6] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul5 ;

			Eta_ans_5[6]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[7] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul6 ;

			Eta_ans_5[7]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[8] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul7 ;

			Eta_ans_5[8]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[9] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul8;

			Eta_ans_5[9]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[10]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul9;

			Eta_ans_5[10]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[11] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul10 ;

			Eta_ans_5[11]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[12] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul11;

			Eta_ans_5[12]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[13] & est[14] & est[15] & est[16] & est[17]) * mul12;

			Eta_ans_5[13]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[14] & est[15] & est[16] & est[17]) * mul13;

			Eta_ans_5[14]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[15] & est[16] & est[17]) * mul14;

			Eta_ans_5[15]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[16] & est[17]) * mul15 ;

			Eta_ans_5[16]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[15] & est[17]) * mul16;

			Eta_ans_5[17]= (est[0] & est[1] & est[2] & est[3] & est[4] & est[5] & est[6] & est[7] & est[8] & est[9]
						& est[10] & est[11] & est[12] & est[13] & est[14] & est[15] & est[16]) * mul17;
 }




void update_lam_all(short pos)
{
//		Lam_buf[pos] = pest0;
		Lam_bufAa[pos] = pest0;
		Lam_bufAb[pos] = pest0;
		Lam_bufAc[pos] = pest0;
		Lam_bufB[pos] = pest0;
//		prLam_buf[pos] = 0;
		prLamB_buf[pos] = 0;
		prLamC_buf[pos] = 0;
		prLamC_bufa[pos] = 0;
		prLamC_bufb[pos] = 0;


//		prLam2_buf[pos] = 0;
		prLam2B_buf[pos] = 0;
		prLam2C_buf[pos] = 0;
		prLam2C_bufa[pos] = 0;
		prLam2C_bufb[pos] = 0;

//		Lam_buf1[pos] = pest1;
		Lam_bufA1[pos] = pest1;
		Lam_bufB1a[pos] = pest1;
		Lam_bufB1b[pos] = pest1;
		Lam_bufB1c[pos] = pest1;
//		prLam_buf1[pos] = 0;
		prLamB_buf1[pos] = 0;
		prLamB_buf1a[pos] = 0;
		prLamB_buf1b[pos] = 0;
		prLamC_buf1[pos] = 0;


//		prLam2_buf1[pos] = 0;
		prLam2B_buf1[pos] = 0;
		prLam2B_buf1a[pos] = 0;
		prLam2B_buf1b[pos] = 0;
		prLam2C_buf1[pos] = 0;

		Lam_buf2[pos] = pest2;
		Lam_bufA2a[pos] = pest2;
		Lam_bufA2b[pos] = pest2;
		Lam_bufA2c[pos] = pest2;
		Lam_bufB2[pos] = pest2;
		prLam_buf2[pos] = 0;
		prLamB_buf2[pos] = 0;
		prLamC_buf2[pos] = 0;
		prLamC_buf2a[pos] = 0;
		prLamC_buf2b[pos] = 0;

		prLam2_buf2[pos] = 0;
		prLam2B_buf2[pos] = 0;
		prLam2C_buf2[pos] = 0;
		prLam2C_buf2a[pos] = 0;
		prLam2C_buf2b[pos] = 0;

//		Lam_buf3[pos] = pest3;
		Lam_bufA3[pos] = pest3;
		Lam_bufB3a[pos] = pest3;
		Lam_bufB3b[pos] = pest3;
		Lam_bufB3c[pos] = pest3;
//		prLam_buf3[pos] = 0;
		prLamB_buf3[pos] = 0;
		prLamB_buf3a[pos] = 0;
		prLamB_buf3b[pos] = 0;
		prLamC_buf3[pos] = 0;


//		prLam2_buf3[pos] = 0;
		prLam2B_buf3[pos] = 0;
		prLam2B_buf3a[pos] = 0;
		prLam2B_buf3b[pos] = 0;
		prLam2C_buf3[pos] = 0;

		Lam_buf4[pos] = pest4;
		Lam_bufA4a[pos] = pest4;
		Lam_bufA4b[pos] = pest4;
		Lam_bufA4c[pos] = pest4;
		Lam_bufB4[pos] = pest4;
		prLam_buf4[pos] = 0;
		prLamB_buf4[pos] = 0;
		prLamC_buf4[pos] = 0;
		prLamC_buf4a[pos] = 0;
		prLamC_buf4b[pos] = 0;


		prLam2_buf4[pos] = 0;
		prLam2B_buf4[pos] = 0;
		prLam2C_buf4[pos] = 0;
		prLam2C_buf4a[pos] = 0;
		prLam2C_buf4b[pos] = 0;

//		Lam_buf5[pos] = pest5;
		Lam_bufA5[pos] = pest5;
		Lam_bufB5a[pos] = pest5;
		Lam_bufB5b[pos] = pest5;
		Lam_bufB5c[pos] = pest5;
//		prLam_buf5[pos] = 0;
		prLamB_buf5[pos] = 0;
		prLamB_buf5a[pos] = 0;
		prLamB_buf5b[pos] = 0;
		prLamC_buf5[pos] = 0;


//		prLam2_buf5[pos] = 0;
		prLam2B_buf5[pos] = 0;
		prLam2B_buf5a[pos] = 0;
		prLam2B_buf5b[pos] = 0;
		prLam2C_buf5[pos] = 0;

		Lam_buf6[pos] = pest6;
		Lam_buf6a[pos] = pest6;
		Lam_bufA6[pos] = pest6;
		Lam_bufA6b[pos] = pest6;
		Lam_bufA6c[pos] = pest6;
		Lam_bufB6[pos] = pest6;
//		prLam_buf6[pos] = 0;
		prLam_buf4a[pos] = 0;
		prLamB_buf6[pos] = 0;
		prLamC_buf6[pos] = 0;
//		prLamC_buf6a[pos] = 0;
//		prLamC_buf6b[pos] = 0;


//		prLam2_buf6[pos] = 0;
//		prLam2_buf6a[pos] = 0;
		prLam2B_buf6[pos] = 0;
		prLam2C_buf6[pos] = 0;
//		prLam2C_buf6a[pos] = 0;
//		prLam2C_buf6b[pos] = 0;

//		Lam_buf7[pos] = pest7;
		Lam_bufA7[pos] = pest7;
		Lam_bufB7a[pos] = pest7;
		Lam_bufB7b[pos] = pest7;
//		prLam_buf7[pos] = 0;
		prLamB_buf7[pos] = 0;
		prLamB_buf7a[pos] = 0;
		prLamC_buf7[pos] = 0;

//		prLam2_buf7[pos] = 0;
		prLam2B_buf7[pos] = 0;
		prLam2B_buf7a[pos] = 0;
		prLam2C_buf7[pos] = 0;

		Lam_buf8[pos] = pest8;
//		Lam_bufA8[pos] = pest8;
//		Lam_bufB8[pos] = pest8;
//		prLam_buf8[pos] = 0;
//		prLamB_buf8[pos] = 0;
//		prLamC_buf8[pos] = 0;

//		prLam2_buf8[pos] = 0;
//		prLam2B_buf8[pos] = 0;
//		prLam2C_buf8[pos] = 0;

//		Lam_buf9[pos] = pest9;
		Lam_bufA9[pos] = pest9;
		Lam_bufB9a[pos] = pest9;
		Lam_bufB9b[pos] = pest9;
//		prLam_buf9[pos] = 0;
		prLamB_buf9[pos] = 0;
		prLamB_buf9a[pos] = 0;
		prLamC_buf9[pos] = 0;

//		prLam2_buf9[pos] = 0;
		prLam2B_buf9[pos] = 0;
		prLam2B_buf9a[pos] = 0;
		prLam2C_buf9[pos] = 0;

		Lam_buf10[pos+0] = pest10;
		Lam_buf10a[pos+0] = pest10;
		Lam_bufA10a[pos+0] = pest10;
		Lam_bufA10b[pos+0] = pest10;
		Lam_bufA10c[pos+0] = pest10;
		Lam_bufB10[pos+0] = pest10;
		prLam_buf4[pos+0] = 0;
		prLam_buf4a[pos+0] = 0;
		prLamB_buf10[pos] = 0;
		prLamC_buf10[pos] = 0;
		prLamC_buf10a[pos] = 0;
		prLamC_buf10b[pos] = 0;

		prLam2_buf4[pos+0] = 0;
		prLam2_buf4a[pos+0] = 0;
		prLam2B_buf10[pos] = 0;
		prLam2C_buf10[pos] = 0;
		prLam2C_buf10a[pos] = 0;
		prLam2C_buf10b[pos] = 0;
}

void update_lam_all_23(short pos)
{
		if (pos > 1023)
			printf ("pos out of range update lam \n");

//		Lam_buf[pos] = pest0;
		Lam_bufAa[pos] = pest0;
		Lam_bufAb[pos] = pest0;
		Lam_bufAc[pos] = pest0;
		Lam_bufB[pos] = pest0;
//		prLam_buf[pos] = 0;
		prLamB_buf[pos] = 0;
		prLamC_buf[pos] = 0;
		prLamC_bufa[pos] = 0;
		prLamC_bufb[pos] = 0;


//		prLam2_buf[pos] = 0;
		prLam2B_buf[pos] = 0;
		prLam2C_buf[pos] = 0;
		prLam2C_bufa[pos] = 0;
		prLam2C_bufb[pos] = 0;

//		Lam_buf1[pos] = pest1;
		Lam_bufA1[pos] = pest1;
		Lam_bufB1a[pos] = pest1;
		Lam_bufB1b[pos] = pest1;
		Lam_bufB1c[pos] = pest1;
//		prLam_buf1[pos] = 0;
		prLamB_buf1[pos] = 0;
		prLamB_buf1a[pos] = 0;
		prLamB_buf1b[pos] = 0;
		prLamC_buf1[pos] = 0;


//		prLam2_buf1[pos] = 0;
		prLam2B_buf1[pos] = 0;
		prLam2B_buf1a[pos] = 0;
		prLam2B_buf1b[pos] = 0;
		prLam2C_buf1[pos] = 0;

		Lam_buf2[pos] = pest2;
		Lam_bufA2a[pos] = pest2;
		Lam_bufA2b[pos] = pest2;
		Lam_bufA2c[pos] = pest2;
		Lam_bufB2[pos] = pest2;
		prLam_buf2[pos] = 0;
		prLamB_buf2[pos] = 0;
		prLamC_buf2[pos] = 0;
		prLamC_buf2a[pos] = 0;
		prLamC_buf2b[pos] = 0;

		prLam2_buf2[pos] = 0;
		prLam2B_buf2[pos] = 0;
		prLam2C_buf2[pos] = 0;
		prLam2C_buf2a[pos] = 0;
		prLam2C_buf2b[pos] = 0;

//		Lam_buf3[pos] = pest3;
		Lam_bufA3[pos] = pest3;
		Lam_bufB3a[pos] = pest3;
		Lam_bufB3b[pos] = pest3;
		Lam_bufB3c[pos] = pest3;
//		prLam_buf3[pos] = 0;
		prLamB_buf3[pos] = 0;
		prLamB_buf3a[pos] = 0;
		prLamB_buf3b[pos] = 0;
		prLamC_buf3[pos] = 0;


//		prLam2_buf3[pos] = 0;
		prLam2B_buf3[pos] = 0;
		prLam2B_buf3a[pos] = 0;
		prLam2B_buf3b[pos] = 0;
		prLam2C_buf3[pos] = 0;

		Lam_buf4[pos] = pest4;
		Lam_bufA4a[pos] = pest4;
		Lam_bufA4b[pos] = pest4;
		Lam_bufA4c[pos] = pest4;
		Lam_bufB4[pos] = pest4;
		prLam_buf4[pos] = 0;
		prLamB_buf4[pos] = 0;
		prLamC_buf4[pos] = 0;
		prLamC_buf4a[pos] = 0;
		prLamC_buf4b[pos] = 0;


		prLam2_buf4[pos] = 0;
		prLam2B_buf4[pos] = 0;
		prLam2C_buf4[pos] = 0;
		prLam2C_buf4a[pos] = 0;
		prLam2C_buf4b[pos] = 0;

//		Lam_buf5[pos] = pest5;
		Lam_bufA5[pos] = pest5;
		Lam_bufB5a[pos] = pest5;
		Lam_bufB5b[pos] = pest5;
		Lam_bufB5c[pos] = pest5;
//		prLam_buf5[pos] = 0;
		prLamB_buf5[pos] = 0;
		prLamB_buf5a[pos] = 0;
		prLamB_buf5b[pos] = 0;
		prLamC_buf5[pos] = 0;


//		prLam2_buf5[pos] = 0;
		prLam2B_buf5[pos] = 0;
		prLam2B_buf5a[pos] = 0;
		prLam2B_buf5b[pos] = 0;
		prLam2C_buf5[pos] = 0;

		Lam_buf6[pos] = pest6;
		Lam_buf6a[pos] = pest6;
		Lam_bufA6[pos] = pest6;
		Lam_bufA6b[pos] = pest6;
		Lam_bufA6c[pos] = pest6;
		Lam_bufB6[pos] = pest6;
//		prLam_buf6[pos] = 0;
		prLam_buf4a[pos] = 0;
		prLamB_buf6[pos] = 0;
		prLamC_buf6[pos] = 0;
		prLamC_buf10a[pos] = 0;
		prLamC_buf10b[pos] = 0;


//		prLam2_buf6[pos] = 0;
		prLam2_buf4a[pos] = 0;
		prLam2B_buf6[pos] = 0;
		prLam2C_buf6[pos] = 0;
		prLam2C_buf10a[pos] = 0;
		prLam2C_buf10b[pos] = 0;
}

void update_lam_all_12(short pos)
{

//		Lam_buf[pos] = pest0;
		Lam_bufAa[pos] = pest0;
		Lam_bufAb[pos] = pest0;
		Lam_bufAc[pos] = pest0;
		Lam_bufB[pos] = pest0;
//		prLam_buf[pos] = 0;
		prLamB_buf[pos] = 0;
		prLamC_buf[pos] = 0;
		prLamC_bufa[pos] = 0;
		prLamC_bufb[pos] = 0;


//		prLam2_buf[pos] = 0;
		prLam2B_buf[pos] = 0;
		prLam2C_buf[pos] = 0;
		prLam2C_bufa[pos] = 0;
		prLam2C_bufb[pos] = 0;

//		Lam_buf1[pos] = pest1;
		Lam_bufA1[pos] = pest1;
		Lam_bufB1a[pos] = pest1;
		Lam_bufB1b[pos] = pest1;
		Lam_bufB1c[pos] = pest1;
//		prLam_buf1[pos] = 0;
		prLamB_buf1[pos] = 0;
		prLamB_buf1a[pos] = 0;
		prLamB_buf1b[pos] = 0;
		prLamC_buf1[pos] = 0;


//		prLam2_buf1[pos] = 0;
		prLam2B_buf1[pos] = 0;
		prLam2B_buf1a[pos] = 0;
		prLam2B_buf1b[pos] = 0;
		prLam2C_buf1[pos] = 0;

		Lam_buf2[pos] = pest2;
		Lam_bufA2a[pos] = pest2;
		Lam_bufA2b[pos] = pest2;
		Lam_bufA2c[pos] = pest2;
		Lam_bufB2[pos] = pest2;
		prLam_buf2[pos] = 0;
		prLamB_buf2[pos] = 0;
		prLamC_buf2[pos] = 0;
		prLamC_buf2a[pos] = 0;
		prLamC_buf2b[pos] = 0;

		prLam2_buf2[pos] = 0;
		prLam2B_buf2[pos] = 0;
		prLam2C_buf2[pos] = 0;
		prLam2C_buf2a[pos] = 0;
		prLam2C_buf2b[pos] = 0;

//		Lam_buf3[pos] = pest3;
		Lam_bufA3[pos] = pest3;
		Lam_bufB3a[pos] = pest3;
		Lam_bufB3b[pos] = pest3;
		Lam_bufB3c[pos] = pest3;
//		prLam_buf3[pos] = 0;
		prLamB_buf3[pos] = 0;
		prLamB_buf3a[pos] = 0;
		prLamB_buf3b[pos] = 0;
		prLamC_buf3[pos] = 0;


//		prLam2_buf3[pos] = 0;
		prLam2B_buf3[pos] = 0;
		prLam2B_buf3a[pos] = 0;
		prLam2B_buf3b[pos] = 0;
		prLam2C_buf3[pos] = 0;

		Lam_buf4[pos] = pest4;
		Lam_buf4a[pos] = pest4;
		Lam_bufA4a[pos] = pest4;
		Lam_bufA4b[pos] = pest4;
		Lam_bufA4c[pos] = pest4;
		Lam_bufB4[pos] = pest4;
		prLam_buf4[pos] = 0;
		prLam_buf4a[pos] = 0;
		prLamB_buf4[pos] = 0;
		prLamC_buf4[pos] = 0;
		prLamC_buf4a[pos] = 0;
		prLamC_buf4b[pos] = 0;


		prLam2_buf4[pos] = 0;
		prLam2_buf4a[pos] = 0;
		prLam2B_buf4[pos] = 0;
		prLam2C_buf4[pos] = 0;
		prLam2C_buf4a[pos] = 0;
		prLam2C_buf4b[pos] = 0;

}

void update_hat_all(short pos)
{

		prHat_buf[pos] = bpest0;
		prHat_bufA[pos] = bpest0;
		prHat_bufAa[pos] = bpest0;
		prHat_bufAb[pos] = bpest0;
		prHat_bufAc[pos] = bpest0;
		prHat_bufB[pos] = bpest0;

		prHat_buf1[pos] = bpest1;
		prHat_bufA1[pos] = bpest1;
		prHat_bufB1[pos] = bpest1;
		prHat_bufB1a[pos] = bpest1;
		prHat_bufB1b[pos] = bpest1;
		prHat_bufB1c[pos] = bpest1;

		prHat_buf2[pos] = bpest2;
		prHat_bufA2[pos] = bpest2;
		prHat_bufA2a[pos] = bpest2;
		prHat_bufA2b[pos] = bpest2;
		prHat_bufA2c[pos] = bpest2;
		prHat_bufB2[pos] = bpest2;

		prHat_buf3[pos] = bpest3;
		prHat_bufA3[pos] = bpest3;
		prHat_bufB3[pos] = bpest3;
		prHat_bufB3a[pos] = bpest3;
		prHat_bufB3b[pos] = bpest3;
		prHat_bufB3c[pos] = bpest3;

		prHat_buf4[pos] = bpest4;
		prHat_buf4a[pos] = bpest4;
		prHat_bufA4[pos] = bpest4;
		prHat_bufA4a[pos] = bpest4;
		prHat_bufA4b[pos] = bpest4;
		prHat_bufB4[pos] = bpest4;

//		prHat_buf5[pos] = bpest5;
		prHat_bufA5[pos] = bpest5;
		prHat_bufB5[pos] = bpest5;
		prHat_bufB5a[pos] = bpest5;
		prHat_bufB5b[pos] = bpest5;
		prHat_bufB5c[pos] = bpest5;

		prHat_buf6[pos] = bpest6;
		prHat_buf6a[pos] = bpest6;
		prHat_bufA6[pos] = bpest6;
		prHat_bufA6a[pos] = bpest6;
		prHat_bufA6b[pos] = bpest6;
		prHat_bufA6c[pos] = bpest6;
		prHat_bufB6[pos] = bpest6;

//		prHat_buf7[pos] = bpest7;
		prHat_bufA7[pos] = bpest7;
		prHat_bufB7[pos] = bpest7;
		prHat_bufB7a[pos] = bpest7;

		prHat_buf8[pos] = bpest8;
//		prHat_bufA8[pos] = bpest8;
//		prHat_bufB8[pos] = bpest8;

//		prHat_buf9[pos] = bpest9;
		prHat_bufA9[pos] = bpest9;
		prHat_bufB9[pos] = bpest9;
		prHat_bufB9a[pos] = bpest9;

		prHat_buf10[pos] = bpest10;
		prHat_buf10a[pos] = bpest10;
		prHat_bufA10[pos] = bpest10;
		prHat_bufA10a[pos] = bpest10;
		prHat_bufA10b[pos] = bpest10;
		prHat_bufA10c[pos] = bpest10;

		prHat_buf10b[pos] = bpest10;
		prHat_bufB10[pos] = bpest10;
}

void update_hat_all_23(short pos)
{

		prHat_buf[pos] = bpest0;
		prHat_bufA[pos] = bpest0;
		prHat_bufAa[pos] = bpest0;
		prHat_bufAb[pos] = bpest0;
		prHat_bufAc[pos] = bpest0;

		prHat_bufB[pos] = bpest0;

		prHat_buf1[pos] = bpest1;
		prHat_bufA1[pos] = bpest1;
		prHat_bufB1[pos] = bpest1;
		prHat_bufB1a[pos] = bpest1;
		prHat_bufB1b[pos] = bpest1;
		prHat_bufB1c[pos] = bpest1;

		prHat_buf2[pos] = bpest2;
		prHat_bufA2[pos] = bpest2;
		prHat_bufA2a[pos] = bpest2;
		prHat_bufA2b[pos] = bpest2;
		prHat_bufA2c[pos] = bpest2;
		prHat_bufB2[pos] = bpest2;

		prHat_buf3[pos] = bpest3;
		prHat_bufA3[pos] = bpest3;
		prHat_bufB3[pos] = bpest3;
		prHat_bufB3a[pos] = bpest3;
		prHat_bufB3b[pos] = bpest3;
		prHat_bufB3c[pos] = bpest3;

		prHat_buf4[pos] = bpest4;
		prHat_buf4a[pos] = bpest4;
		prHat_bufA4[pos] = bpest4;
		prHat_bufA4a[pos] = bpest4;
		prHat_bufA4b[pos] = bpest4;
		prHat_bufB4[pos] = bpest4;

//		prHat_buf5[pos] = bpest5;
		prHat_bufA5[pos] = bpest5;
		prHat_bufB5[pos] = bpest5;
		prHat_bufB5a[pos] = bpest5;
		prHat_bufB5b[pos] = bpest5;
		prHat_bufB5c[pos] = bpest5;

		prHat_buf6[pos] = bpest6;
		prHat_buf6a[pos] = bpest6;
		prHat_bufA6[pos] = bpest6;
		prHat_bufA6b[pos] = bpest6;
		prHat_bufA6c[pos] = bpest6;
		prHat_bufA6a[pos] = bpest6;
		prHat_bufB6[pos] = bpest6;
}

void update_hat_all_12(short pos)
{

		prHat_buf[pos] = bpest0;
		prHat_bufA[pos] = bpest0;
		prHat_bufAa[pos] = bpest0;
		prHat_bufAb[pos] = bpest0;
		prHat_bufAc[pos] = bpest0;

		prHat_bufB[pos] = bpest0;

		prHat_buf1[pos] = bpest1;
		prHat_bufA1[pos] = bpest1;
		prHat_bufB1[pos] = bpest1;
		prHat_bufB1a[pos] = bpest1;
		prHat_bufB1b[pos] = bpest1;
		prHat_bufB1c[pos] = bpest1;

		prHat_buf2[pos] = bpest2;
		prHat_bufA2[pos] = bpest2;
		prHat_bufA2a[pos] = bpest2;
		prHat_bufA2b[pos] = bpest2;
		prHat_bufA2c[pos] = bpest2;
		prHat_bufB2[pos] = bpest2;

		prHat_buf3[pos] = bpest3;
		prHat_bufA3[pos] = bpest3;
		prHat_bufB3[pos] = bpest3;
		prHat_bufB3a[pos] = bpest3;
		prHat_bufB3b[pos] = bpest3;
		prHat_bufB3c[pos] = bpest3;

		prHat_buf4[pos] = bpest4;
		prHat_buf4a[pos] = bpest4;
		prHat_bufA4[pos] = bpest4;
		prHat_bufA4a[pos] = bpest4;
		prHat_bufA4b[pos] = bpest4;
		prHat_bufB4[pos] = bpest4;

}

void load_pest_all(short pos)
{
		pest0 = pLambda0[pos] +  prLamB_buf[pos] + prLamC_buf[pos] + prLamC_bufa[pos]+ prLamC_bufb[pos] +
				 prLam2B_buf[pos] + prLam2C_buf[pos] + prLam2C_bufa[pos]+ prLam2C_bufb[pos];
		pest1 = pLambda1[pos] + prLamB_buf1[pos]  + prLamB_buf1a[pos] + prLamB_buf1b[pos] + prLamC_buf1[pos]
				+ prLam2B_buf1[pos]  + prLam2B_buf1a[pos] + prLam2B_buf1b[pos] + prLam2C_buf1[pos]  ;
		pest2 = pLambda2[pos] +  prLamB_buf2[pos] + prLamC_buf2[pos] + prLamC_buf2a[pos] + prLamC_buf2b[pos] +
				 prLam2B_buf2[pos] + prLam2C_buf2[pos] + prLam2C_buf2a[pos] + prLam2C_buf2b[pos];
		pest3 = pLambda3[pos] +  prLamB_buf3[pos] + prLamB_buf3a[pos] + prLamB_buf3b[pos] +
				prLamC_buf3[pos] +  prLam2B_buf3[pos] + prLam2B_buf3a[pos] + prLam2B_buf3b[pos] + prLam2C_buf3[pos];
		pest4 = pLambda4[pos] +  prLamB_buf4[pos] + prLamC_buf4[pos] + prLamC_buf4a[pos] + prLamC_buf4b[pos]+
				 prLam2B_buf4[pos] + prLam2C_buf4[pos] + prLam2C_buf4a[pos] + prLam2C_buf4b[pos] ;
		pest5 = pLambda5[pos] +  prLamB_buf5[pos] + prLamB_buf5a[pos] + prLamB_buf5b[pos] + prLamC_buf5[pos]
				+  prLam2B_buf5[pos] + prLam2B_buf5a[pos] + prLam2B_buf5b[pos]+ prLam2C_buf5[pos];
		pest6 = pLambda6[pos] +  prLamB_buf6[pos] + prLamC_buf6[pos] +
				 prLam2B_buf6[pos] + prLam2C_buf6[pos] ;
		pest7 = pLambda7[pos] +  prLamB_buf7[pos] + prLamB_buf7a[pos] + prLamC_buf7[pos] +
				 prLam2B_buf7[pos] + prLam2B_buf7a[pos]+ prLam2C_buf7[pos];
		pest8 = pLambda8[pos] + prLam_buf2[pos]+  prLam2_buf2[pos];
		pest9 = pLambda9[pos] +  prLamB_buf9[pos] + prLamB_buf9a[pos] + prLamC_buf9[pos] +
				prLam2B_buf9[pos]  + prLam2B_buf9a[pos] + prLam2C_buf9[pos];
		pest10 = blk_val + prLam_buf4[pos] + prLam_buf4a[pos]+ prLamB_buf10[pos] + prLamC_buf10[pos] + prLamC_buf10a[pos] + prLamC_buf10b[pos]+
				prLam2_buf4[pos] + prLam2_buf4a[pos] + prLam2B_buf10[pos] + prLam2C_buf10[pos] + prLam2C_buf10a[pos] + prLam2C_buf10b[pos];


		bpest0 = (pest0 >= 0.0);
		bpest1 = (pest1 >= 0.0);
		bpest2 = (pest2 >= 0.0);
		bpest3 = (pest3 >= 0.0);
		bpest4 = (pest4 >= 0.0);
		bpest5 = (pest5 >= 0.0);
		bpest6 = (pest6 >= 0.0);
		bpest7 = (pest7 >= 0.0);
		bpest8 = (pest8 >= 0.0);
		bpest9 = (pest9 >= 0.0);
		bpest10 = (pest10 >= 0.0);

}

void load_pest_all_23(short pos)
{
/*
	pest0 = pLambda0[pos] +  prLamB_buf[pos] + prLamC_buf[pos] + prLamC_bufa[pos]+ prLamC_bufb[pos] +
			 prLam2B_buf[pos] + prLam2C_buf[pos] + prLam2C_bufa[pos]+ prLam2C_bufb[pos];
	pest1 = pLambda1[pos] +  prLamB_buf1[pos]  + prLamB_buf1a[pos] + prLamB_buf1b[pos] + prLamC_buf1[pos]
			+ prLam2B_buf1[pos]  + prLam2B_buf1a[pos] + prLam2B_buf1b[pos] + prLam2C_buf1[pos]  ;
	pest2 = pLambda2[pos] + prLam_buf2[pos]+ prLamB_buf2[pos] + prLamC_buf2[pos] + prLamC_buf2a[pos] + prLamC_buf2b[pos] +
			prLam2_buf2[pos]+ prLam2B_buf2[pos] + prLam2C_buf2[pos] + prLam2C_buf2a[pos] + prLam2C_buf2b[pos];
	pest3 = pLambda3[pos] +  prLamB_buf3[pos] + prLamB_buf3a[pos] + prLamB_buf3b[pos] +
			prLamC_buf3[pos] +  prLam2B_buf3[pos] + prLam2B_buf3a[pos] + prLam2B_buf3b[pos] + prLam2C_buf3[pos];
	pest4 = pLambda4[pos] + prLam_buf4[pos]+ prLamB_buf4[pos] + prLamC_buf4[pos] + prLamC_buf4a[pos] + prLamC_buf4b[pos]+
			prLam2_buf4[pos]+ prLam2B_buf4[pos] + prLam2C_buf4[pos] + prLam2C_buf4a[pos] + prLam2C_buf4b[pos] ;
	pest5 = pLambda5[pos] +  prLamB_buf5[pos] + prLamB_buf5a[pos] + prLamB_buf5b[pos] + prLamC_buf5[pos]
			+  prLam2B_buf5[pos] + prLam2B_buf5a[pos] + prLam2B_buf5b[pos]+ prLam2C_buf5[pos];
	pest6 = pLambda6[pos] + prLam_buf6[pos]+ prLam_buf6a[pos] + prLamB_buf6[pos] + prLamC_buf6[pos] + prLamC_buf6a[pos] + prLamC_buf6b[pos] +
			prLam2_buf6[pos]+ prLam2_buf6a[pos] + prLam2B_buf6[pos] + prLam2C_buf6[pos] + prLam2C_buf6a[pos] + prLam2C_buf6b[pos];
*/

		pest0 = pLambda0[pos] +  prLamB_buf[pos] + prLamC_buf[pos] + prLamC_bufa[pos]+ prLamC_bufb[pos] +
				 prLam2B_buf[pos] + prLam2C_buf[pos] + prLam2C_bufa[pos]+ prLam2C_bufb[pos];
		pest1 = pLambda1[pos] +  prLamB_buf1[pos]  + prLamB_buf1a[pos] + prLamB_buf1b[pos] + prLamC_buf1[pos]
				+ prLam2B_buf1[pos]  + prLam2B_buf1a[pos] + prLam2B_buf1b[pos] + prLam2C_buf1[pos]  ;
		pest2 = pLambda2[pos] +  prLamB_buf2[pos] + prLamC_buf2[pos] + prLamC_buf2a[pos] + prLamC_buf2b[pos] +
				 prLam2B_buf2[pos] + prLam2C_buf2[pos] + prLam2C_buf2a[pos] + prLam2C_buf2b[pos];
		pest3 = pLambda3[pos] +  prLamB_buf3[pos] + prLamB_buf3a[pos] + prLamB_buf3b[pos] +
				prLamC_buf3[pos] +  prLam2B_buf3[pos] + prLam2B_buf3a[pos] + prLam2B_buf3b[pos] + prLam2C_buf3[pos];
		pest4 = pLambda4[pos] + prLam_buf4[pos]+ prLamB_buf4[pos] + prLamC_buf4[pos] + prLamC_buf4a[pos] + prLamC_buf4b[pos]+
				prLam2_buf4[pos]+ prLam2B_buf4[pos] + prLam2C_buf4[pos] + prLam2C_buf4a[pos] + prLam2C_buf4b[pos] ;
		pest5 = pLambda5[pos] +  prLamB_buf5[pos] + prLamB_buf5a[pos] + prLamB_buf5b[pos] + prLamC_buf5[pos]
				+  prLam2B_buf5[pos] + prLam2B_buf5a[pos] + prLam2B_buf5b[pos]+ prLam2C_buf5[pos];
		pest6 = pLambda6[pos] + prLam_buf2[pos]+ prLam_buf4a[pos] + prLamB_buf6[pos] + prLamC_buf6[pos] + prLamC_buf10a[pos] + prLamC_buf10b[pos] +
				prLam2_buf2[pos]+ prLam2_buf4a[pos] + prLam2B_buf6[pos] + prLam2C_buf6[pos] + prLam2C_buf10a[pos] + prLam2C_buf10b[pos];

		bpest0 = (pest0 >= 0.0);
		bpest1 = (pest1 >= 0.0);
		bpest2 = (pest2 >= 0.0);
		bpest3 = (pest3 >= 0.0);
		bpest4 = (pest4 >= 0.0);
		bpest5 = (pest5 >= 0.0);
		bpest6 = (pest6 >= 0.0);
}

void load_pest_all_12(short pos)
{
		pest0 = pLambda0[pos] +  prLamB_buf[pos] + prLamC_buf[pos] + prLamC_bufa[pos]+ prLamC_bufb[pos] +
				 prLam2B_buf[pos] + prLam2C_buf[pos] + prLam2C_bufa[pos]+ prLam2C_bufb[pos];
		pest1 = pLambda1[pos] +  prLamB_buf1[pos]  + prLamB_buf1a[pos] + prLamB_buf1b[pos] + prLamC_buf1[pos]
				+ prLam2B_buf1[pos]  + prLam2B_buf1a[pos] + prLam2B_buf1b[pos] + prLam2C_buf1[pos]  ;
		pest2 = pLambda2[pos] + prLam_buf2[pos]+ prLamB_buf2[pos] + prLamC_buf2[pos] + prLamC_buf2a[pos] + prLamC_buf2b[pos] +
				prLam2_buf2[pos]+ prLam2B_buf2[pos] + prLam2C_buf2[pos] + prLam2C_buf2a[pos] + prLam2C_buf2b[pos];
		pest3 = pLambda3[pos] +  prLamB_buf3[pos] + prLamB_buf3a[pos] + prLamB_buf3b[pos] +
				prLamC_buf3[pos] +  prLam2B_buf3[pos] + prLam2B_buf3a[pos] + prLam2B_buf3b[pos] + prLam2C_buf3[pos];
		pest4 = pLambda4[pos] + prLam_buf4[pos]+ prLam_buf4a[pos] + prLamB_buf4[pos] + prLamC_buf4[pos] + prLamC_buf4a[pos] + prLamC_buf4b[pos]+
				prLam2_buf4[pos] + prLam2_buf4a[pos] + prLam2B_buf4[pos] + prLam2C_buf4[pos] + prLam2C_buf4a[pos] + prLam2C_buf4b[pos] ;

		bpest0 = (pest0 >= 0.0);
		bpest1 = (pest1 >= 0.0);
		bpest2 = (pest2 >= 0.0);
		bpest3 = (pest3 >= 0.0);
		bpest4 = (pest4 >= 0.0);
}


void calc_n(tab_int nCodeN11)
{
	short n, mSparse, nLenMset, nindx=0;
	short test, ptest;

	short pos =0;
	short loop = 0;
	bool test1;

	for(n=0;n<(nCodeN11);++n)
	{
		load_pest_all(n);
		update_lam_all(n);
		update_hat_all(n);
	}

}

void calc_n_23(tab_int nCodeN11)
{
	short n, mSparse, nLenMset, nindx=0;
	short test, ptest;

	short pos =0;
	short loop = 0;
	bool test1;

	for(n=0;n<(nCodeN11);++n)
	{
		load_pest_all_23(n);
		update_lam_all_23(n);
		update_hat_all_23(n);
	}

}

void calc_n_12(tab_int nCodeN11)
{
	short n, mSparse, nLenMset, nindx=0;
	short test, ptest;

	short pos =0;
	short loop = 0;
	bool test1;

	for(n=0;n<(nCodeN11);++n)
	{
		load_pest_all_12(n);
		update_lam_all_12(n);
		update_hat_all_12(n);
	}

}

void write_pcHat( bool *ppbhat0, bool *ppbhat1, bool *ppbhat2, bool *ppbhat3,
				  bool *ppbhat4, bool *ppbhat5, bool *ppbhat6, bool *ppbhat7 )
{
	for (int i = 0; i < cols; i++)
	{
		ppbhat0[i] =  prHat_buf[i];
		ppbhat1[i] =  prHat_bufA1[i];
		ppbhat2[i] =  prHat_bufB2[i];
		ppbhat3[i] =  prHat_buf3[i];
		ppbhat4[i] =  prHat_bufA4[i];
		ppbhat5[i] =  prHat_bufB5[i];
		ppbhat6[i] =  prHat_buf6[i];
		ppbhat7[i] =  prHat_bufA7[i];
	}
}


