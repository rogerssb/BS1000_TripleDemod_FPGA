#define HLS_LDPC_CTRL_VERSION "HLS LDPC CTRL Ver. 0.1 (8-March-2018)"

//#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <ap_int.h>



//#include "ap_fixed.h"

//typedef ap_fixed<8,3, AP_RND, AP_SAT> ldpc_dbl;
typedef ap_uint<16> tab_int;
typedef ap_uint<2> tab_2_int;

static short state=0;
static short mode = 0;			// 0 = idle, 1 = initializing, 2 = ready for data

static tab_2_int c_size = 0, c_rate =  0;
static bool c_init_start = false, c_init_mux = false, c_decode_start = false;
static bool c_mem_mux = false, c_buff_reset = false;
static bool c_buff_mux = false, c_buff_start = false;

static short  c_err_code = 0;


short itt1, itt2, itt3;
static short blk_decode = 0;
static short blk_ovrs = -1;

//typedef double ldpc_dbl;



void LDPC_CTRL( tab_2_int block, tab_2_int code, bool run, bool *init_start, bool init_done,
				bool init_ready, bool *init_mux, bool *decode_start, bool decode_done,
				bool decode_ready, bool overrun, bool full, bool *mem_mux, bool *buff_reset,
				bool *buff_mux, bool buff_ack,bool *buff_start,  short *mem_ovrs, short *block_ovrs,
				short *itt_avg, tab_2_int *status, short *err_code, bool err_ack, tab_2_int *size,
				tab_2_int *rate )
{

	if (run)
	{

		switch (state) {

		case 0:

			if ( ((block == 1) | (block == 2)) & ((code >= 1) & (code <=3)))
			{
				mode = 1;							//Initializing Code

				c_init_mux = true;					// give control of the Lambda address mux to the init routine

				c_size = block;
				c_rate = code;
				c_init_start = true;				// start init process
				state = 1;
			}
			else
				c_err_code = 3;
			break;

		case 1:

			if (init_ready)
			{
				c_init_start = false;
				state = 2;
			}
			break;

		case 2:
			if ( init_done)
			{
				c_init_mux = false;					//give address control back to decoder

				c_mem_mux = false;					//set ping-pong buffer to ping
				c_buff_start = true;				//start start data buffer process
				c_buff_reset = true;				//reset buffer parameters
				state = 3;
			}
			break;

		case 3:
			if (buff_ack)
			{
				c_buff_reset = false;
				mode = 2;
				state = 4;
			}
			break;


		case 4:
			if (full)
			{
				if ( decode_done)
					blk_decode = blk_decode++;
				else
				{
					blk_ovrs = blk_ovrs++;
					c_err_code = 1;
				}
				c_mem_mux = !c_mem_mux;
				c_buff_mux = true;
				state = 5;
			}
			break;

		case 5:
			if (buff_ack)
			{
				c_decode_start = true;
				state = 6;
			}
			break;

		case 6:
			if (decode_ready)
			{
				c_decode_start = false;			// decoder only runs one cycle until next buffer
				state = 4;
			}
			break;
		}

		*size = c_size;
		*rate = c_rate;
		*status = mode;
		*err_code = c_err_code;
		*block_ovrs = blk_ovrs;
		*itt_avg = blk_decode;


		*init_start = c_init_start;
		*init_mux = c_init_mux;
		*decode_start = c_decode_start;

		*mem_mux = c_mem_mux;
		*buff_reset = c_buff_reset;

		*buff_mux = c_buff_mux;
		*buff_start = c_buff_start ;


	}
	else
	{
		state=0;
		mode = 0;			// 0 = idle, 1 = initializing, 2 = ready for data

		c_size = 0;
		c_rate =  0;
		c_init_start = false;
		c_init_mux = false;
		c_decode_start = false;
		c_mem_mux = false;
		c_buff_reset = false;
		c_buff_mux = false;
		c_buff_start = false;

		c_err_code = 0;

		*size = c_size;
		*rate = c_rate;
		*status = mode;
		*err_code = c_err_code;
		*block_ovrs = blk_ovrs;
		*itt_avg = blk_decode;


		*init_start = c_init_start;
		*init_mux = c_init_mux;
		*decode_start = c_decode_start;

		*mem_mux = c_mem_mux;
		*buff_reset = c_buff_reset;

		*buff_mux = c_buff_mux;
		*buff_start = c_buff_start ;

	}



}
