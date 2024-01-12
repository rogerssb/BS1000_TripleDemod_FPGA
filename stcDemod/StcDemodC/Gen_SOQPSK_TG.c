/*
 *	Gen_SOQPSK_TG() generates an SOQPSK-TG modulated signals from the input bits
 *	There are 10 samples per bit
 *
 *	NOTE:	THE FUNCTION IN THIS FILE CONTAINS BUGS AND DOES NOT CURRENTLY WORK.
 *			FUTURE VERSIONS OF THIS CODE WILL BE FUNCTIONAL
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */
 

////////////////////////////////
// includes
#include <math.h>

#include "tg_freq_pulse.h"			// taps for the SOQPSK-TG frequency pulse 


////////////////////////////////
// defines
#include "defines.h"

#define PI_FOURTH	0.78539816339745f


////////////////////////////////
// global variables
int		alpha[2*PILOT_LENGTH+DATA_FRAME_LENGTH+TG_FILT_LEN];
float	freq[FRAME_LENGTH_10+EXTRA_SAMPLES];		
float	phi[FRAME_LENGTH_10+EXTRA_SAMPLES];

int	bipolar[2] = {-1, 1};		// mapping from {0,1} to {-1,1}


/*
 *	Function
 *
 *		Gen_SOQPSK_TG()
 *
 *	Description
 *
 *		Gen_SOQPSK_TG() generates an SOQPSK-TG signal modulated with the input bits.
 *
 *		The output sample rate is 10 samples/bit
 *
 *	Inputs
 *
 *		int *bits				- pointer to the array of data bits to be modulated (bits are bipolar)
 *		int num_data_bits		- number of data bits to be inserted into the frame
 *								  (this must be less than or equal to MAX_DATA_LENGTH and should be a multiple of 4)
 *		float *signal_r			- pointer to array to hold the real part of the output signal
 *								  (array must be able to hold 10*num_data_bits floats)
 *		float *signal_i			- pointer to array to hold the imag part of the output signal
 *								  (array must be able to hold 10*num_data_bits floats)
 *
 *	Outputs
 *
 *		The function returns 0 on success 
 *
 *	Side Effects
 *
 *		The output signal is stored in the signal_r and signal_i arrays
 *
 *	History
 *	FZ 7-19-16
 *	Increased freq and phi arrays by EXTRA_SAMPLES to prevent overruns while processing
 *	Increased alpha by TO_FILT_LEN to prevent reading negative offset when j > i during filt processing
 */
int Gen_SOQPSK_TG(int *bits, int num_data_bits, float *signal_r, float *signal_i)
{
	int		i,j;

	// generate the array of alphas based on the input bits
	for (i = 0; i < TG_FILT_LEN; i++)		// pad lower end of alpha array for [i-j] accesses in freq loops
	{
		alpha[i] = 0;
	}
	alpha[TG_FILT_LEN+0] = bipolar[0]*bipolar[0] * bits[0];			// assume zeros before the bits, FZ Note -1*-1=1
	alpha[TG_FILT_LEN+1] = bipolar[1]*bipolar[bits[0]]*bits[1];		// assume zeros before the bits, FZ Note bipolar[1]=1
	for(i = 2; i < num_data_bits; i++)
	{
		alpha[TG_FILT_LEN+i] = bipolar[i&0x1]*bipolar[bits[i-1]]*(bits[i] - bits[i-2]);		// this formula is for bits in {0,1}
	}

	// do the frequency pulse filtering (use a polyphase structure to upsample by 10) to get the frequency sequence
	for(i = 0; i < num_data_bits; i++)
	{
		// generate 10 output samples (using the 10 filter phases)
		freq[10*i+0] = alpha[i+TG_FILT_LEN]*tg_freq_pulse_0[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+0] += alpha[i-j+TG_FILT_LEN]*tg_freq_pulse_0[j];
		}
		freq[10*i+1] = alpha[i+TG_FILT_LEN]*tg_freq_pulse_1[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+1] += alpha[i-j +TG_FILT_LEN]*tg_freq_pulse_1[j];
		}
		freq[10*i+2] = alpha[i +TG_FILT_LEN]*tg_freq_pulse_2[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+2] += alpha[i-j +TG_FILT_LEN]*tg_freq_pulse_2[j];
		}
		freq[10*i+3] = alpha[i +TG_FILT_LEN]*tg_freq_pulse_3[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+3] += alpha[i-j +TG_FILT_LEN]*tg_freq_pulse_3[j];
		}
		freq[10*i+4] = alpha[i +TG_FILT_LEN]*tg_freq_pulse_4[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+4] += alpha[i-j +TG_FILT_LEN]*tg_freq_pulse_4[j];
		}
		freq[10*i+5] = alpha[i +TG_FILT_LEN]*tg_freq_pulse_5[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+5] += alpha[i-j +TG_FILT_LEN]*tg_freq_pulse_5[j];
		}
		freq[10*i+6] = alpha[i +TG_FILT_LEN]*tg_freq_pulse_6[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+6] += alpha[i-j +TG_FILT_LEN]*tg_freq_pulse_6[j];
		}
		freq[10*i+7] = alpha[i +TG_FILT_LEN]*tg_freq_pulse_7[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+7] += alpha[i-j +TG_FILT_LEN]*tg_freq_pulse_7[j];
		}
		freq[10*i+8] = alpha[i +TG_FILT_LEN]*tg_freq_pulse_8[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+8] += alpha[i-j +TG_FILT_LEN]*tg_freq_pulse_8[j];
		}
		freq[10*i+9] = alpha[i +TG_FILT_LEN]*tg_freq_pulse_9[0];
		for(j = 1; j < TG_FILT_LEN; j++)
		{
			freq[10*i+9] += alpha[i-j +TG_FILT_LEN]*tg_freq_pulse_9[j];
		}
	}

	// determine the proper starting phase
	i = TG_FILT_LEN;
	while (alpha[i] == 0 && i < 10 * num_data_bits)		// find the first nonzero alpha
	{
		i++;
	}
	if(i == 10*num_data_bits)						// if there were none then set theta to -pi/4
		phi[0] = -1*PI_FOURTH;
	else if((i & 0x1)==0)					// first nonzero alpha occurs on a Q bit
		phi[0] = alpha[i]*PI_FOURTH;
	else											// first nonzero alpha occurs on an I bit
		phi[0] = -1*alpha[i]*PI_FOURTH;

	// integrate to get the phase (and add appropriate phase offset)
	for(i = 1; i < 10*num_data_bits; i++)
	{
		phi[i] = freq[i-1] + phi[i-1];
	}
	// note that the frequency pulse above was already scaled by pi/2 so that the phase
	// doesn't need to be scaled by the modulation index here

	// put phase on a complex phasor

	// this is where I can chop off the beginning and the end of the signal so that
	// exactly 1 frame of signal is returned (this is the easiest place to do it,
	// but maybe it would be better to do it in Gen_Frame() because that function
	// knows that it sent in extra data into this function)
	for(i = 0; i < 10*num_data_bits; i++)
	{
		signal_r[i] = (float)cos(phi[i]);
		signal_i[i] = (float)sin(phi[i]);
	}

	return(0);
}
