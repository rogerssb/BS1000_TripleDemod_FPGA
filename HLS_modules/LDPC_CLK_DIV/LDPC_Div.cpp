#define HLS_LDPC_data_buffer_VERSION "HLS LDPC data buffer Ver. 0.1 (8-March-2018)"

#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <ap_int.h>



#include "ap_fixed.h"

typedef ap_uint<2> tab_2_int;

static short count, out_count;
static short max=5000;

void LDPC_Div(  bool reset,	 bool *rd_clk_out, short clk_div, tab_2_int block)
{

	if (!reset && (out_count >= max))
	{
		out_count = 0;
		count = 0;
	}

	if (block == 1)
		max = 1024;
	else
		max = 4096;

	count++;

	if ((count == clk_div) && (out_count < max))
	{
		*rd_clk_out = true;
		count =0;
		out_count++;
	}
	else
		*rd_clk_out = false;


}



