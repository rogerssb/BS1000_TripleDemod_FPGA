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

static short state=10;
static short mode = 0;			// 0 = idle, 1 = initializing, 2 = ready for data


static short blk_decode = 0;
static short blk_ovrs = -1;

//typedef double ldpc_dbl;



void LDPC_CTRL( tab_2_int block, tab_2_int code, bool run, bool *init_start, bool init_done,
				bool init_ready, bool *buff_start, tab_2_int *status, short *err_code,  tab_2_int *size,
				tab_2_int *rate, bool *buff_reset )
{
//		short state;

		switch (state) {

		case 0:

			if ( ((block == 1) || (block == 2)) && ((code >= 1) && (code <=3)))
			{
				mode = 1;							//Initializing Code

//				*init_mux = true;					// give control of the Lambda address mux to the init routine

				*size = block;
				*rate = code;
				*buff_reset = false;
				*init_start = true;				// start init process
				 state = 1;
				 *status =1;
			}
			else
			{
				*err_code = 3;
				state = 10;
			}
			break;

		case 1:

			if (init_ready)
			{
				*init_start = false;
				state = 2;
				if ( init_done)
				{
					*buff_start = true;				//start start data buffer process
					state = 3;
				}
			}
			break;

		case 2:
			if ( init_done)
			{
//				*init_mux = false;					//give address control back to decoder

//				*mem_mux = false;					//set ping-pong buffer to ping
//				*not_mem_mux = true;
				*buff_start = true;				//start start data buffer process
//				*buff_reset = true;				//reset buffer parameters
				state = 3;

			}
			break;

		case 3:
			if (!run)
			{
				*buff_start = false;
				mode = 0;
				state = 10;
			}
			break;

/*
		case 4:
			if (full)
			{
				if ( decode_done)
					blk_decode = blk_decode++;
				else
				{
					blk_ovrs = blk_ovrs++;
					*err_code = 1;
				}
				*mem_mux = true;
				*not_mem_mux = false;
				*buff_mux = true;
				state = 5;
			}
			break;

		case 5:
			if (buff_ack)
			{
				*decode_start = true;
				*buff_mux = false;
				state = 6;
			}
			break;

		case 6:
			if (decode_ready)
			{
				*decode_start = false;			// decoder only runs one cycle until next buffer
				state = 7;
			}
			break;

		case 7:
			if (full)
			{
				if ( decode_done)
					blk_decode = blk_decode++;
				else
				{
					blk_ovrs = blk_ovrs++;
					*err_code = 1;
				}
				*mem_mux = false;
				*not_mem_mux = true;
				*buff_mux = true;
				state = 8;
			}
			break;

		case 8:
			if (buff_ack)
			{
				*buff_mux = false;
				*decode_start = true;
				state = 9;
			}
			break;

		case 9:
			if (decode_ready)
			{
				*decode_start = false;			// decoder only runs one cycle until next buffer
				state = 4;
			}
			break;

*/

		case 10:
		default:
			*size = 0;
			*rate =  0;
			*init_start = false;
//			*init_mux = false;
//			*decode_start = false;
//			*mem_mux = false;
//			*not_mem_mux = true;
			*buff_reset = true;
//			*buff_mux = false;
			*buff_start = false;
			*err_code = 0;
			*status = 0;

			blk_decode = 0;
			blk_ovrs = 0;

			if (run)
			{
				state=0;
				mode = 0;			// 0 = idle, 1 = initializing, 2 = ready for data
			}
			break;

		}

//		curr_state = state;
}
