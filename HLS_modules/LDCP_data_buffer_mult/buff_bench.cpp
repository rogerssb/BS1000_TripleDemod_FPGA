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


void LDPC_buff( int8_t data_in, bool reset,
				int8_t raw_dat0[2048], int8_t raw_dat1[2048],int8_t raw_dat2[2048],int8_t raw_dat3[2048],int8_t raw_dat4[1024],
				int8_t raw_dat5[1024],int8_t raw_dat6[1024],int8_t raw_dat7[1024],int8_t raw_dat8[1024],int8_t raw_dat9[1024],
				int8_t raw_dat10[1024],tab_int numbits, bool *overrun, bool *full, bool write,
				tab_2_int deran, bool *mux,  bool decode_done, bool *decode_start,
				bool decode_ready, bool decode_done_b, bool *decode_start_b, bool decode_ready_b,
				int8_t *deran_data, tab_int *cur_write_pos, bool out_mux);



int main();

int main()
{
	int8_t dat_in[2048], dat_in1[2048], dat_in2[2048], dat_in3[2048], dat_in4[1024], dat_in5[1024], dat_in6[1024], dat_in7[1024];
	int8_t dat_in8[1024], dat_in9[1024], dat_in10[1024];
	int8_t data, dr_data;
	char data_out[10240] = {1, 0, 0, 0};
	int pass = 0;
	bool bit, overrun, full, read, write, ack, mux, d_start, d_start_b;
	tab_int size = 1280;
	tab_int c_cur_write_pos, c_cur_read_pos;
	data = 15;

	LDPC_buff( data,  false, dat_in, dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			   size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false,&dr_data, &c_cur_write_pos, true);
	LDPC_buff( data,  false, dat_in,   dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);
	LDPC_buff( data,  false, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);

	LDPC_buff( data,  true, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  true, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true) ;

	LDPC_buff( data,  true, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);

//	if (bit)
//		printf ("correct data bit \n");
//	else
//		pass = 1;

	data = -25;

	LDPC_buff( data,  true, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  true, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);

	LDPC_buff( data,  true, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);

//	if (bit)
//		printf ("correct data bit \n");
//	else
//		pass = 1;

	data = 25;

	LDPC_buff( data,  true, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  true, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);
	LDPC_buff( data,  true, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);
	LDPC_buff( data,  true, dat_in,   dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);

//	if (!bit)
//		printf ("correct data bit \n");
//	else
//		pass = 1;

	data = -15;

	if  (dat_in[0] == data)
		printf (" correct 15 input array values \n");
	else
		pass = 1;

	data = 25;

	if ( dat_in[1] == data )
		printf (" correct -25 input array values \n");
	else
		pass = 1;

	data = -25;

	if ( dat_in[2] == data)
		printf (" correct 25  input array values \n");
	else
		pass = 1;


	LDPC_buff( data,  false, dat_in, dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			   size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);
	LDPC_buff( data,  false, dat_in,   dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);
	LDPC_buff( data,  false, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  false, 1, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);
/*
	for (int k=0; k< 1280; k++)
	{
		data = k;

	LDPC_buff( data,  true, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  true, 0, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true) ;

	LDPC_buff( data,  true, dat_in,  dat_in1, dat_in2, dat_in3, dat_in4, dat_in5, dat_in6, dat_in7, dat_in8, dat_in9, dat_in10,
			size, &overrun, &full,  false, 0, &mux, false, &d_start, false, false, &d_start_b, false, &dr_data, &c_cur_write_pos, true);
	}

	for( int j=0; j<128;j++ )
	{
		data = j+ 1152;
		if (data != dat_in9[j])
		{
			pass = 1;
			printf("data failed fill test \n");
		}

	}
*/
	if (pass == 0)
		printf("data passed fill test  \n");



	if (pass == 0)
		printf("all test passed \n");
	else
		printf("you're a loser and failed \n");

	return(pass);


}


