/*
 *	resample_156_175.c
 *
 *	resample_156_175.c contains the polyphase resampling function.  It is hard coded
 *	to resample the input data by the ratio 156/175 so that data that is sampled
 *	at 2800/312 samples/bit (about 8.9744 samples/bit) can come out at 4 samples per bit.
 *
 *	Note that this file is a variation of Resample.c, which is designed to resample by 35/39
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */



////////////////////////////////
// includes
#include "poly_filter_156_175.h"			// filter taps for the polyphase filter
											// also defines for this polyphase filter


////////////////////////////////
// defines
#include "defines.h"

////////////////////////////////
// global variables
float	rs_buffer_156_r[FILTER_LEN_156+1];			// used to store the samples from the previous call
float	rs_buffer_156_i[FILTER_LEN_156+1];

 
////////////////////////////////
// function definitions


/*
 *	Function
 *
 *		resample_156_175()
 *
 *	Description
 *
 *		resample_156_175() upsamples the input signal by 156 and downsamples by 175 using a
 *		polyphase filter.
 *
 *		The input sample rate is 2800/312 samples/bit (about 8.9744 samples/bit)
 *		The output sample rate is 4 samples/bit
 *
 *		This function is designed to always return the requested number of output samples
 *		(so a variable number of input samples is needed-the function keeps track of all
 *		of that)
 *
 *	Inputs
 *
 *		float *s_in_r			- pointer to input signal
 *		float *s_in_i
 *		int num_in_samps		- numer of samples in the input buffer
 *		float *signal_r			- pointer to output signal (must be able to hold num_out_samps floats)
 *		float *signal_i
 *		int num_out_samps		- number of samples to be output
 *
 *	Outputs
 *
 *		The function returns 0 on success 
 *
 *	Side Effects
 *
 *		The output signal is stored in the signal_r and signal_i arrays
 *		The last part of the input signal is saved in a buffer for next time 
 *		(to avoid edge effects in the filters)
 *
 */
int resample_156_175(float *s_in_r, float *s_in_i, int num_in_samps, float *signal_r, float *signal_i, int num_out_samps)
{
	int	i;
	int	j;
	int	s_inc;
	int	last_ndx;

	static int	f_ndx = 0;
	static int	sig_ndx = 0;
	static int	FirstCall = 1;
//	static int	cntr = 1;
	static int	extra_samp_in = 0;

	if(FirstCall)			// first time in this function initialize the filter pointers
	{
		FirstCall = 0;

		// initialize the filter bank pointers
		for(i = 0; i < 156; i++)
			filter_bank_156_175[i] = &(filter_taps_156_175[i*FILTER_LEN_156]);

		// initialize the buffer to zero
		for(j = 0; j < FILTER_LEN_156; j++)
		{
			rs_buffer_156_r[j] = 0.0f;
			rs_buffer_156_i[j] = 0.0f;
		}
	}

	// for first few output samples we need to use input samples from the previous call
	// to avoid edge effects
	for(i = 0; i < FILTER_LEN_156-1 + extra_samp_in; i++)
	{
		// perform the filtering
		signal_r[i] = 0.0f;
		signal_i[i] = 0.0f;
		for(j = 0; j <= i - extra_samp_in; j++)
		{
			signal_r[i] += filter_bank_156_175[f_ndx][j]*s_in_r[sig_ndx-j - extra_samp_in];
			signal_i[i] += filter_bank_156_175[f_ndx][j]*s_in_i[sig_ndx-j - extra_samp_in];
		}
		for(j = i+1 - extra_samp_in; j < FILTER_LEN_156; j++)			// these samples come from the previous call
		{
			signal_r[i] += filter_bank_156_175[f_ndx][j]*rs_buffer_156_r[FILTER_LEN_156-1+sig_ndx-j];
			signal_i[i] += filter_bank_156_175[f_ndx][j]*rs_buffer_156_i[FILTER_LEN_156-1+sig_ndx-j];
		}

		// update indices for next output sample
		f_ndx += DOWN_FACTOR2;			// increment the filter bank index by 156 (downsample by 156)

		s_inc = 0;
		while(f_ndx >= UP_FACTOR2)		// keep f_ndx in bounds
		{
			f_ndx -= UP_FACTOR2;
			s_inc++;					// record the number of times f_ndx wrapped
		}

		sig_ndx += s_inc;				// increment the signal index appropriately

		if(s_inc == 2)														// if s_inc is 2 in this stage of the filter then we need
		{																	// one extra sample in the buffer, and the sample that is
			rs_buffer_156_r[FILTER_LEN_156-1 + extra_samp_in] = s_in_r[0];		// needed is the first input sample, so transfer that
			rs_buffer_156_i[FILTER_LEN_156-1 + extra_samp_in] = s_in_i[0];		// sample into the buffer
		}
	}

	for(i = FILTER_LEN_156-1 + extra_samp_in; i < num_out_samps; i++)
	{
		// perform the filtering
		signal_r[i] = 0.0f;
		signal_i[i] = 0.0f;
		for(j = 0; j < FILTER_LEN_156; j++)
		{
			signal_r[i] += filter_bank_156_175[f_ndx][j]*s_in_r[sig_ndx-j - extra_samp_in];
			signal_i[i] += filter_bank_156_175[f_ndx][j]*s_in_i[sig_ndx-j - extra_samp_in];
		}

		// update indices for next output
		f_ndx += DOWN_FACTOR2;			// increment the filter bank index by 156 (downsample by 156)

		s_inc = 0;
		while(f_ndx >= UP_FACTOR2)		// keep f_ndx in bounds
		{
			f_ndx -= UP_FACTOR2;
			s_inc++;					// record the number of times f_ndx wrapped
		}

		sig_ndx += s_inc;				// increment the signal index appropriately
	}

	// copy the end of the input signal into the buffer so it can be used for next time
	// (to avoid filter transients in each call)
	extra_samp_in = num_in_samps - sig_ndx;
	if(extra_samp_in < 0)						// this happens when s_inc=2 at the end
		extra_samp_in = 0;						// in that case extra_samp_in should be zero

	last_ndx = sig_ndx - s_inc + 1;
	for(j = 0; j < FILTER_LEN_156-1 + extra_samp_in; j++)
	{
		rs_buffer_156_r[j] = s_in_r[last_ndx - FILTER_LEN_156 + s_inc + j];
		rs_buffer_156_i[j] = s_in_i[last_ndx - FILTER_LEN_156 + s_inc + j];
	}

	// for the next call, we want sig_ndx initialized to the next sample needed (that will either
	// be 0 or 1 depending on whether the last s_inc was 1 or 2)
	sig_ndx = 0;			// for this resampler sig_ndx needs to always start at 0 each time
	//sig_ndx = s_inc - 1;

	return(0);
}
