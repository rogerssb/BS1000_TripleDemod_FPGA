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


void LDPC_Out(  bool *data_out, bool reset,	tab_int *cur_read_pos,
				tab_int numbits, bool rd_clk_in, bool *rd_mux, bool mem_out0[1024], bool mem_out1[1024], bool mem_out2[1024],
				bool mem_out3[1024], bool mem_out4[1024], bool mem_out5[1024], bool mem_out6[1024], bool mem_out7[1024]);

int main();

int main()
{
	short dat_in[10240];
	int8_t data, dr_data;
	char data_out[10240] = {1, 1, 0, 1, 0, 0};
	int pass = 0;
	bool bit, overrun, full, read, write, ack, mux, d_start;
	bool test_out0[1024] = {1, 1, 0, 1, 1, 0}, test_out1[1024],  test_out2[1024], test_out3[1024];
	bool test_out4[1024], test_out5[1024],  test_out6[1024], test_out7[1024];


	tab_int size = 348;
	tab_int c_cur_write_pos, c_cur_read_pos;
	data = 15;

//	LDPC_Out(&bit, false, data_out, &read,  1, &c_cur_read_pos, 1, 1, &mux );

	for (int i = 0; i<1; i++)
		LDPC_Out(&bit, false,  &c_cur_read_pos, 1280, 1, &mux, test_out0 , test_out1 ,  test_out2 ,
				test_out3 , test_out4 , test_out5 ,  test_out6 , test_out7);

	LDPC_Out(&bit, false,  &c_cur_read_pos, 1280, 1, &mux, test_out0 , test_out1 ,  test_out2 ,
				test_out3 , test_out4 , test_out5 ,  test_out6 , test_out7);


	if (bit)
		printf ("correct data bit \n");
	else
		pass = 1;

	if (c_cur_read_pos == 1)
		printf ("correct read position \n");
	else
		pass =1;


//	LDPC_Out(&bit, true, data_out, &read,  1, &c_cur_read_pos, 1, 1, &mux );

	LDPC_Out(&bit, true, &c_cur_read_pos, 1280, 1, &mux, test_out0 , test_out1 ,  test_out2 ,
				test_out3 , test_out4 , test_out5 ,  test_out6 , test_out7);

	if (bit)
		printf ("correct data bit \n");
	else
		pass = 1;

	if (c_cur_read_pos == 2)
		printf ("correct read position \n");
	else
		pass =1;

//	LDPC_Out(&bit, true, data_out, &read,  1, &c_cur_read_pos, 1, 1, &mux );

	LDPC_Out(&bit, true,  &c_cur_read_pos, 1280, 1, &mux, test_out0 , test_out1 ,  test_out2 ,
				test_out3 , test_out4 , test_out5 ,  test_out6 , test_out7);

	if (!bit)
		printf ("correct data bit \n");
	else
		pass = 1;

	if (c_cur_read_pos == 3)
		printf ("correct read position \n");
	else
		pass =1;



	if (pass == 0)
		printf("all test passed \n");
	else
		printf("you're a loser and failed \n");

	return(pass);

}


