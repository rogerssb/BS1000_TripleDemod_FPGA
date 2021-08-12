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

void write_raw_data(int8_t dat, int8_t *r_dat0, int8_t *r_dat1, int8_t *r_dat2, int8_t *r_dat3, int8_t *r_dat4, int8_t *r_dat5,
					int8_t *r_dat6, int8_t *r_dat7, int8_t *r_dat8, int8_t *r_dat9, int8_t *r_dat10 );

static tab_int  ccsds, irig=3 ;
static short write_pos, pos, mem, trig;
static bool mux_pos = 0;

int8_t test;



void LDPC_buff( int8_t data_in, bool reset,
				int8_t raw_dat0[2048], int8_t raw_dat1[2048],int8_t raw_dat2[2048],int8_t raw_dat3[2048],int8_t raw_dat4[1024],
				int8_t raw_dat5[1024],int8_t raw_dat6[1024],int8_t raw_dat7[1024],int8_t raw_dat8[1024],int8_t raw_dat9[1024],
				int8_t raw_dat10[1024],tab_int numbits, bool *overrun, bool *full, bool write,
				tab_2_int deran, bool *mux,  bool decode_done, bool *decode_start,
				bool decode_ready, bool decode_done_b, bool *decode_start_b, bool decode_ready_b,
				int8_t *deran_data, tab_int *cur_write_pos, bool out_mux)
{
	int bit1, bit4, bit6, bit8, bit15, bit14, new_bit, xor_bit;


// reset module

	if (!reset)
	{
		write_pos = -1;
		pos = 0;
		mem = 0;
		if ( (numbits == 5120 ) || (numbits == 2048))
			trig = 512;
		else if ( numbits == 1536)
			trig = 256;
		else if (numbits == 6144)
			trig = 1024;
		else if (numbits == 8192)
			trig = 2048;
		else
			trig = 128;
//		trig = numbits/10;
		ccsds = 255;
//		irig = 3;
		*overrun = false;
		*full = false;

		mux_pos = out_mux;		//sync input buffer with output buffer
		*mux = mux_pos;


	}
	else if (write)
	{

		write_pos++;
		switch(deran) {

		case 1:		// CCSDS De-randomizer
			bit1 = ccsds & 0b00000001;
			bit4 = (ccsds & 0b00001000) >> 3;
			bit6 = (ccsds & 0b00100000) >> 5;
			bit8 = (ccsds & 0b10000000) >> 7;
			new_bit = ( (bit1 ^ bit4) ^ bit6) ^ bit8;

			if (bit1 == 1)
				data_in = data_in * -1;

//			raw_dat[write_pos]= (short) data_in;

			write_raw_data(data_in, raw_dat0, raw_dat1, raw_dat2, raw_dat3, raw_dat4, raw_dat5,
								raw_dat6, raw_dat7, raw_dat8, raw_dat9, raw_dat10 );

			if (write_pos == (numbits-1))
			{
				*full = true;
//				mux_pos = !mux_pos;
//				*mux = mux_pos;
				if (!mux_pos)
				{
					*decode_start = true;
					if (!decode_done_b)
						*overrun = true;
				}
				else
				{
					*decode_start_b = true;
					if (!decode_done)
						*overrun = true;
				}
			}

			if (new_bit == 1)
				ccsds = ccsds | 0b100000000;

			ccsds = ccsds >> 1;
			break;

		case 2:											// IRIG De-Randomizer
			bit14 = (irig & 0b10000000000000);
			bit15 = (irig & 0b100000000000000) >> 1;

			xor_bit = (bit15 ^ bit14);

			new_bit = data_in;

			if (xor_bit > 0)
				data_in = data_in * -1;

//			raw_dat[write_pos]= (short) data_in;

			write_raw_data(data_in, raw_dat0, raw_dat1, raw_dat2, raw_dat3, raw_dat4, raw_dat5,
								raw_dat6, raw_dat7, raw_dat8, raw_dat9, raw_dat10 );

			if (write_pos == (numbits-1))
			{
				*full = true;
//				mux_pos = !mux_pos;
//				*mux = mux_pos;
				if (!mux_pos)
				{
					*decode_start = true;
					if (!decode_done_b)
						*overrun = true;
				}
				else
				{
					*decode_start_b = true;
					if (!decode_done)
						*overrun = true;
				}
			}

			irig = irig << 1;

			if (new_bit < 0 )
				irig = irig | 0b1;
			break;

		default:								// No De-Randomizer
//			raw_dat[write_pos]= (short) data_in;

			write_raw_data(data_in, raw_dat0, raw_dat1, raw_dat2, raw_dat3, raw_dat4, raw_dat5,
								raw_dat6, raw_dat7, raw_dat8, raw_dat9, raw_dat10 );

			if (write_pos == (numbits-1))
			{
				*full = true;
//				mux_pos = !mux_pos;
//				*mux = mux_pos;
				if (!mux_pos)
				{
					*decode_start = true;
					if (!decode_done_b)
						*overrun = true;
				}
				else
				{
					*decode_start_b = true;
					if (!decode_done)
						*overrun = true;
				}
			}

			break;
		}

		*deran_data = data_in;
	}



	if (decode_ready)
		*decode_start = false;

	if (decode_ready_b)
		*decode_start_b = false;


	*cur_write_pos = write_pos;

}

void write_raw_data(int8_t dat, int8_t *r_dat0, int8_t *r_dat1, int8_t *r_dat2, int8_t *r_dat3, int8_t *r_dat4, int8_t *r_dat5,
					int8_t *r_dat6, int8_t *r_dat7, int8_t *r_dat8, int8_t *r_dat9, int8_t *r_dat10 )
{
	switch (mem){

	case 0:
		r_dat0[pos] = dat;
		break;
	case 1:
		r_dat1[pos] = dat;
		break;
	case 2:
		r_dat2[pos] = dat;
		break;
	case 3:
		r_dat3[pos] = dat;
		break;
	case 4:
		r_dat4[pos] = dat;
		break;
	case 5:
		r_dat5[pos] = dat;
		break;
	case 6:
		r_dat6[pos] = dat;
		break;
	case 7:
		r_dat7[pos] = dat;
		break;
	case 8:
		r_dat8[pos] = dat;
		break;
	case 9:
		r_dat9[pos] = dat;
		break;
	case 10:
		r_dat10[pos] = dat;
		break;
	}
	pos++;

	if (pos == trig)
	{
		pos = 0;
		mem++;
	}

}

