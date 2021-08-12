#define HLS_LDPC_data_buffer_VERSION "HLS LDPC data buffer Ver. 0.1 (8-March-2018)"

#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <ap_int.h>



#include "ap_fixed.h"

typedef ap_fixed<8,3, AP_RND, AP_SAT> ldpc_dbl;
typedef ap_uint<16> tab_int;
typedef ap_uint<2> tab_2_int;



//typedef double ldpc_dbl;



static short read_cnt;
static bool zero = 0;
static bool mux=1;
static short max=1024;
static short pos, mem, trig=127;

void LDPC_Out(  bool *data_out, bool reset,	tab_int *cur_read_pos,
				tab_int numbits, bool rd_clk_in, bool *rd_mux, bool mem_out0[2048], bool mem_out1[2048], bool mem_out2[1024],
				bool mem_out3[1024], bool mem_out4[1024], bool mem_out5[1024], bool mem_out6[1024], bool mem_out7[1024])
{

	bool data;

// reset module


	if (reset && zero)
	{
		zero =0;
		if (numbits == 1280)
		{
			max = 1024;
			trig = 127;
		}
		else if (numbits == 5120)
		{
			max = 4096;
			trig = 511;
		}
		else if (numbits == 1536)
		{
			max = 1024;
			trig = 255;
		}
		else if (numbits == 6144)
		{
			max = 4096;
			trig = 1023;
		}
		else if (numbits == 8192)
		{
			max = 4096;
			trig = 2047;
		}
		else
		{
			max = 1024;		// numbits == 2048
			trig = 511;
		}
	}

	if (!reset && !zero && (read_cnt >= max))
	{
		pos = 0;
		read_cnt=0;
		mem=0;
		zero =1;
		mux=!mux;
		*rd_mux = mux;
	}
	else if ( rd_clk_in && (read_cnt  < max))
	{

		switch (mem) {

		case 0:
			data = mem_out0[pos];
			break;

		case 1:
			data = mem_out1[pos] ;
			break;

		case 2:
			data = mem_out2[pos] ;
			break;

		case 3:
			data = mem_out3[pos] ;
			break;

		case 4:
			data = mem_out4[pos];
			break;

		case 5:
			data = mem_out5[pos] ;
			break;

		case 6:
			data = mem_out6[pos] ;
			break;

		case 7:
			data = mem_out7[pos] ;
			break;

		}

		if (pos == trig)
		{
			mem++;
			pos=0;
		}
		else
			pos++;

		*data_out = data;
		read_cnt++;

	}

// Read Decoded data


	*cur_read_pos = read_cnt;

}



