/*
 *	Gen_Frame() generates one frame of a space time encoded Tier 1 signal
 *	with the specified delays and channel gains.  The sample rate is fixed
 *	at 2800/312 samples per bit.  The frame structure is 128 pilot bits
 *	followed by 3200 data bits followed by the same 128 pilots bits.
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */
 
 
////////////////////////////////
// includes



////////////////////////////////
// defines
#include "defines.h"


////////////////////////////////
// global variables
int pilot0[PILOT_LENGTH] = {1, 0, 1, 0, 1, 0, 0, 0, 
							1, 0, 0, 0, 1, 1, 0, 1, 
							1, 0, 0, 1, 1, 0, 1, 0, 
							1, 1, 0, 1, 0, 1, 0, 0, 
							1, 1, 0, 1, 1, 1, 0, 0, 
							0, 1, 0, 0, 0, 0, 0, 0, 
							0, 1, 0, 0, 1, 0, 0, 1, 
							0, 1, 0, 0, 0, 1, 1, 1,
							1, 1, 1, 0, 0, 0, 1, 0, 
							1, 0, 0, 1, 0, 0, 1, 0, 
							0, 0, 0, 0, 0, 0, 1, 0, 
							0, 0, 1, 1, 1, 0, 1, 1, 
							0, 0, 1, 0, 1, 0, 1, 1, 
							0, 1, 0, 1, 1, 0, 0, 1, 
							1, 0, 1, 1, 0, 0, 0, 1, 
							0, 0, 0, 1, 0, 1, 0, 1};
int pilot1[PILOT_LENGTH] = {1, 1, 1, 0, 0, 0, 1, 1, 
							1, 1, 0, 0, 0, 1, 1, 1, 
							0, 1, 1, 1, 0, 1, 1, 1, 
							0, 1, 1, 0, 0, 0, 0, 1, 
							1, 1, 1, 1, 0, 0, 0, 0, 
							0, 1, 1, 1, 0, 0, 0, 0, 
							0, 0, 1, 1, 0, 1, 1, 0, 
							1, 0, 1, 1, 1, 1, 1, 0,
							0, 1, 1, 1, 1, 1, 0, 1, 
							0, 1, 1, 0, 1, 1, 0, 0, 
							0, 0, 0, 0, 1, 1, 1, 0, 
							0, 0, 0, 0, 1, 1, 1, 1, 
							1, 0, 0, 0, 0, 1, 1, 0, 
							1, 1, 1, 0, 1, 1, 1, 0, 
							1, 1, 1, 0, 0, 0, 1, 1, 
							1, 1, 0, 0, 0, 1, 1, 1};


int	bits0[2*PILOT_LENGTH + DATA_FRAME_LENGTH];	// array to hold all of the bits in the frame
int	bits1[2*PILOT_LENGTH + DATA_FRAME_LENGTH];	// array to hold all of the bits in the frame

int	b0[DATA_FRAME_LENGTH];					// array to hold STC encoded bit stream 0
int	b1[DATA_FRAME_LENGTH];					// array to hold STC encoded bit stream 1



////////////////////////////////
// function definitions
int Alamouti_encode(int *b, int num_data_bits, int *b0, int *b1);
int Gen_SOQPSK_TG(int *bits, int num_data_bits, float *signal_r, float *signal_i);
int Gen_FQPSK_JR(int *bits, int num_data_bits, float *signal_r, float *signal_i);


 /*
 *	Function
 *
 *		Gen_Frame()
 *
 *	Description
 *
 *		Gen_Frame() generates a frame of an STC encoded Tier 1 signal (the modulated signals are output 
 *      separately for the two channels).
 *
 *		The output sample rate is 10 samples/bit
 *
 *	Inputs
 *
 *		int *b					- pointer to the array of data bits to be inserted into the frame
 *		int num_data_bits		- number of data bits to be inserted into the frame
 *								  (this must be less than or equal to DATA_FRAME_LENGTH and should be a multiple of 4)
 *		int mode				- Tier 1 mode:
 *									0 means SOQPSK-TG
 *									1 means FQPSK-JR
 *		float *signal_0_r		- pointer to array to hold the real part of output signal 0
 *								  (array must be able to hold FRAME_LENGTH_10 floats)
 *		float *signal_0_i		- pointer to array to hold the imag part of output signal 0
 *								  (array must be able to hold FRAME_LENGTH_10 floats)
 *		float *signal_1_r		- pointer to array to hold the real part of output signal 1
 *								  (array must be able to hold FRAME_LENGTH_10 floats)
 *		float *signal_1_i		- pointer to array to hold the imag part of output signal 1
 *								  (array must be able to hold FRAME_LENGTH_10 floats)
 *
 *	Outputs
 *
 *		The function returns 0 on success and -1 if too many data bits were input 
 *
 *	Side Effects
 *
 *		The output signal is stored in the signal_r and signal_i arrays
 *
 */
int Gen_Frame(int *b, int num_data_bits, int mode, float *signal_0_r, float *signal_0_i, 
			  float *signal_1_r, float *signal_1_i)
{
	int	i;

	// check to make sure that there aren't too many data bits
	// if there are, then bail out
	if(num_data_bits > DATA_FRAME_LENGTH)
	{
		for(i = 0; i < FRAME_LENGTH_10; i++)		// zero out the output signal arrays
		{
			signal_0_r[i] = 0.0f;
			signal_0_i[i] = 0.0f;
			signal_1_r[i] = 0.0f;
			signal_1_i[i] = 0.0f;
		}
		return(-1);
	}

	// copy pilot bits to the beginning of the bit array
	// should we STC encode the pilots?								FZ Note, is this still a question?
	for(i = 0; i < PILOT_LENGTH; i++)
	{
		bits0[i] = pilot0[i];
		bits1[i] = pilot1[i];
	}

	// STC encode the data bits and store in the bit streams
	Alamouti_encode(b, num_data_bits, &(bits0[PILOT_LENGTH]), &(bits1[PILOT_LENGTH]));

	// copy pilot bits to the end of the bit array
	// should we STC encode the pilots?
	for(i = 0; i < PILOT_LENGTH; i++)
	{
		bits0[i + PILOT_LENGTH + num_data_bits] = pilot0[i];
		bits1[i + PILOT_LENGTH + num_data_bits] = pilot1[i];
	}

	// generate the two modulated signals at 10 samples per bit
	if(mode == 0)
	{
		Gen_SOQPSK_TG(bits0,2*PILOT_LENGTH+num_data_bits,signal_0_r,signal_0_i);
		Gen_SOQPSK_TG(bits1,2*PILOT_LENGTH+num_data_bits,signal_1_r,signal_1_i);
	}
	else
	{
		Gen_FQPSK_JR(bits0,2*PILOT_LENGTH+num_data_bits,signal_0_r,signal_0_i);
		Gen_FQPSK_JR(bits1,2*PILOT_LENGTH+num_data_bits,signal_1_r,signal_1_i);
	}

	return(0);
}


 
 
