/*
 *	Gen_FQPSK_JR() generates an FQPSK-JR modulated signal from the input bits
 *	The sample rate is 10 samples per bit
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */
 
////////////////////////////////
// includes
#include "jr_waveforms.h"			// FQPSK-JR basis waveforms 
#include <stdio.h>

////////////////////////////////
// defines
#include "defines.h"


////////////////////////////////
// global variables
 
 
/*
 *	Function
 *
 *		Gen_FQPSK_JR()
 *
 *	Description
 *
 *		Gen_FQPSK_JR() generates an FQPSK-JR signal modulated with the input bits.
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
 */
int Gen_FQPSK_JR(int *bits, int num_data_bits, float *signal_r, float *signal_i)
{
	int	j;
	int	n;
	int ndx;
	int wave_ndx;

	// index into signal_r and signal_i where the next waveform needs to be written
	wave_ndx = 0;

	// get the first waveform (assuming the preceeding bits were all 0)
	n = 0;

	// get inphase waveform
	ndx = (bits[n])<<2 | (0)<<1 | (bits[n+1]);						// (bits[n-1], bits[n-2], bits[n-3] are 0)
	if(bits[n])
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_r[wave_ndx*JR_WAVEFORM_LEN+j] = jr_waveforms[ndx][j];
		}
	}
	else
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_r[wave_ndx*JR_WAVEFORM_LEN+j] = -1*jr_waveforms[ndx][j];
		}
	}
	// get quadrature waveform
	// not that this waveform is offset by Nb relative to the inphase waveform (due to the "+SAMPS_PER_BIT_JR" below)
	ndx = (bits[n+1])<<2 | (bits[n])<<1 | (bits[n+2]^bits[n]);	// (bits[n-2], bits[n-3] are 0)
	if(bits[n+1])
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_i[wave_ndx*JR_WAVEFORM_LEN+j+SAMPS_PER_BIT_JR] = jr_waveforms[ndx][j];
		}
	}
	else
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_i[wave_ndx*JR_WAVEFORM_LEN+j+SAMPS_PER_BIT_JR] = -1*jr_waveforms[ndx][j];
		}
	}

	// get the second waveform (assuming the preceeding bits were all 0)
	n = 2;
	wave_ndx++;

	// get inphase waveform
	ndx = (bits[n]^bits[n-2])<<2 | (bits[n-1])<<1 | (bits[n+1]^bits[n-1]);	// (bits[n-3] is 0)
	if(bits[n])
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_r[wave_ndx*JR_WAVEFORM_LEN+j] = jr_waveforms[ndx][j];
		}
	}
	else
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_r[wave_ndx*JR_WAVEFORM_LEN+j] = -1*jr_waveforms[ndx][j];
		}
	}
	// get quadrature waveform
	// note that this waveform is offset by Nb relative to the inphase waveform (due to the "+SAMPS_PER_BIT_JR" below)
	ndx = (bits[n+1]^bits[n-1])<<2 | (bits[n]^bits[n-2])<<1 | (bits[n+2]^bits[n]);	// have to do this one to complete the IQ pair
	if(bits[n+1])
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_i[wave_ndx*JR_WAVEFORM_LEN+j+SAMPS_PER_BIT_JR] = jr_waveforms[ndx][j];
		}
	}
	else
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_i[wave_ndx*JR_WAVEFORM_LEN+j+SAMPS_PER_BIT_JR] = -1*jr_waveforms[ndx][j];
		}
	}

	// do the main loop
	for(n = 4, wave_ndx = 2; n < num_data_bits-2; n+=2, wave_ndx++)
	{
		// get inphase waveform
		ndx = (bits[n]^bits[n-2])<<2 | (bits[n-1]^bits[n-3])<<1 | (bits[n+1]^bits[n-1]);
		if(bits[n])
		{
			for(j = 0; j < JR_WAVEFORM_LEN; j++)
			{
				signal_r[wave_ndx*JR_WAVEFORM_LEN+j] = jr_waveforms[ndx][j];
			}
		}
		else
		{
			for(j = 0; j < JR_WAVEFORM_LEN; j++)
			{
				signal_r[wave_ndx*JR_WAVEFORM_LEN+j] = -1*jr_waveforms[ndx][j];
			}
		}
		// get quadrature waveform
		// note that this waveform is offset by Nb relative to the inphase waveform (due to the "+SAMPS_PER_BIT_JR" below)
		ndx = (bits[n+1]^bits[n-1])<<2 | (bits[n]^bits[n-2])<<1 | (bits[n+2]^bits[n]);
		if(bits[n+1])
		{
			for(j = 0; j < JR_WAVEFORM_LEN; j++)
			{
				signal_i[wave_ndx*JR_WAVEFORM_LEN+j+SAMPS_PER_BIT_JR] = jr_waveforms[ndx][j];
			}
		}
		else
		{
			for(j = 0; j < JR_WAVEFORM_LEN; j++)
			{
				signal_i[wave_ndx*JR_WAVEFORM_LEN+j+SAMPS_PER_BIT_JR] = -1*jr_waveforms[ndx][j];
			}
		}
	}
 
	// get the last waveform assuming the future bits are 0

	// get inphase waveform
	ndx = (bits[n]^bits[n-2])<<2 | (bits[n-1]^bits[n-3])<<1 | (bits[n+1]^bits[n-1]);	// have to do this one to complete the IQ pair
	if(bits[n])
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_r[wave_ndx*JR_WAVEFORM_LEN+j] = jr_waveforms[ndx][j];
		}
	}
	else
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_r[wave_ndx*JR_WAVEFORM_LEN+j] = -1*jr_waveforms[ndx][j];
		}
	}
	// get quadrature waveform
	// note that this waveform is offset by Nb relative to the inphase waveform (due to the "+SAMPS_PER_BIT_JR" below)
	ndx = (bits[n+1]^bits[n-1])<<2 | (bits[n]^bits[n-2])<<1 | (bits[n]);			// bits[n+1] is 0
	if(bits[n+1])
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_i[wave_ndx*JR_WAVEFORM_LEN+j+SAMPS_PER_BIT_JR] = jr_waveforms[ndx][j];
		}
	}
	else
	{
		for(j = 0; j < JR_WAVEFORM_LEN; j++)
		{
			signal_i[wave_ndx*JR_WAVEFORM_LEN+j+SAMPS_PER_BIT_JR] = -1*jr_waveforms[ndx][j];
		}
	}

	return(0);
}
