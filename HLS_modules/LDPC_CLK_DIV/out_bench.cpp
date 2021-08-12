#define HLS_LDPC_data_buffer_VERSION "HLS LDPC data buffer Ver. 0.1 (8-March-2018)"

/*
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <ap_int.h>
*/


#include "ap_fixed.h"

typedef ap_uint<16> tab_int;
typedef ap_uint<2> tab_2_int;

//typedef double ldpc_dbl;


void LDPC_Div(  bool reset,	 bool *rd_clk_out, short clk_div, tab_2_int block);


int main();

int main()
{
	bool  read;
	short div;
	tab_2_int blk;
	int pass=0;

	blk = 1;
	div = 2;

	LDPC_Div( false, &read, div, blk);

	for(int k=0; k < 1024;k++)
	{
		LDPC_Div( true, &read, div, blk);
		if (!read)
			pass =1;
		LDPC_Div( true, &read, div, blk);
		if (read)
			pass =1;
	}

	for(int k=0; k < 10;k++)
	{
		LDPC_Div( true, &read, div, blk);
		if (read)
			pass =1;
		LDPC_Div( true, &read, div, blk);
		if (read)
			pass =1;
	}

	LDPC_Div( false, &read, div, blk);

	for(int k=0; k < 1024;k++)
	{
		LDPC_Div( true, &read, div, blk);
		if (!read)
			pass =1;
		LDPC_Div( true, &read, div, blk);
		if (read)
			pass =1;
	}


	if (pass == 0)
		printf("all test passed \n");
	else
		printf("you're a loser and failed \n");

	return(pass);

}


