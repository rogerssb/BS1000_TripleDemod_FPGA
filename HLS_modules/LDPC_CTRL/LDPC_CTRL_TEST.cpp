#define HLS_LDPC_CTRL_TEST_VERSION "HLS LDPC CTRL Ver. 0.1 (8-March-2018)"

//#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <ap_int.h>



//#include "ap_fixed.h"

//typedef ap_fixed<8,3, AP_RND, AP_SAT> ldpc_dbl;
typedef ap_uint<16> tab_int;
typedef ap_uint<2> tab_2_int;



//typedef double ldpc_dbl;

void LDPC_CTRL( tab_2_int block, tab_2_int code, bool run, bool *init_start, bool init_done,
				bool init_ready, bool *buff_start, tab_2_int *status, short *err_code,  tab_2_int *size,
				tab_2_int *rate, bool *buff_reset );

/*
void LDPC_CTRL( tab_2_int block, tab_2_int code, bool run, bool *init_start, bool init_done,
				bool init_ready, bool *decode_start, bool decode_done,
				bool decode_ready, bool full, bool *mem_mux, bool *buff_reset,
				bool *buff_mux, bool buff_ack, bool *buff_start,
				tab_2_int *status, short *err_code,  tab_2_int *size,
				tab_2_int *rate, bool *not_mem_mux );
*/


int main()
{
	tab_2_int size, rate, c_size, c_rate, c_status;
	bool c_run, c_init_start, c_init_done, c_init_ready, c_init_mux, c_decode_start;
	bool c_decode_done, c_decode_ready, c_overrun, c_full, c_mem_mux, c_buff_reset;
	bool c_buff_mux, c_buff_ack, c_buff_start, c_err_ack, c_not_mem_mux;

	short c_mem_ovrs, c_block_ovrs, c_itt_avg, c_err_code;

	int pass = 0;

	c_run = true;
	c_init_start = false;
	c_init_done = false;
	c_init_ready = false;
	c_init_mux = false;
	c_decode_start = false;

	c_decode_done = false;
	c_decode_ready = false;
	c_overrun = false;
	c_full = false;
	c_mem_mux = false;
	c_not_mem_mux = false;
	c_buff_reset = false;

	c_buff_mux = false;
	c_buff_ack = false;
	c_buff_start = false;
	c_err_ack = false;

	size = 3;
	rate = 6;

	LDPC_CTRL( size, rate, c_run, &c_init_start,c_init_done,
					c_init_ready,  &c_buff_start, &c_status, &c_err_code,  &c_size,
					&c_rate, &c_buff_reset );

	LDPC_CTRL( size, rate, c_run, &c_init_start,c_init_done,
					c_init_ready,  &c_buff_start, &c_status, &c_err_code,  &c_size,
					&c_rate, &c_buff_reset );

	if (c_err_code == 3)
		printf("*****  passed bad init test  ***** \n");
	else
	{
		printf("*****  failed bad init test  ***** \n");
		pass = 1;
	}

	size = 2;
	rate = 3;

	LDPC_CTRL( size, rate, c_run, &c_init_start,c_init_done,
					c_init_ready,  &c_buff_start, &c_status, &c_err_code,  &c_size,
					&c_rate, &c_buff_reset );

	LDPC_CTRL( size, rate, c_run, &c_init_start,c_init_done,
					c_init_ready,  &c_buff_start, &c_status, &c_err_code,  &c_size,
					&c_rate, &c_buff_reset );


	if ((c_size == 2) && (c_rate == 3))
		printf("*****  passed good init test  ***** \n");
	else
	{
		printf("*****  failed good init test  ***** \n");
		pass = 1;
	}

	return(pass);

}
