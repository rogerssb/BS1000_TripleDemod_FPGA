/*
 *	Resample.c
 *
 *	Resample.c contains the polyphase resampling function.  It is hard coded
 *	to resample the input data by the ratio 35/39 so that data that is sampled
 *	at 10 samples per bit can come out at 2800/312 samples/bit (about 8.9744 samples/bit).
 *	This is the sample rate if a 10.4 Mbps signal is sampled at 93.3 M samples/s.
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */



////////////////////////////////
// includes
#include "poly_filter_35_39.h"			// filter taps for the polyphase filter
											// also defines for this polyphase filter


////////////////////////////////
// defines
#include "defines.h"

#define		MIN_FRAME_LENGTH_OUT	29866	// the minimum number of samples to output (maximum is 29867)

////////////////////////////////
// global variables
float	rs_buffer_35_r[FILTER_LEN_35+1];			// used to store the samples from the previous call
float	rs_buffer_35_i[FILTER_LEN_35+1];

 
////////////////////////////////
// function definitions


/*
 *	Function
 *
 *		Resample_35_39()
 *
 *	Description
 *
 *		Resample_35_39() upsamples the input signal by 35 and downsamples by 39 using a
 *		polyphase filter.
 *
 *		The input sample rate is 10 samples/bit
 *		The output sample rate is 2800/312 samples/bit (about 8.9744 samples/bit)
 *
 *	Inputs
 *
 *		float *s_in_r			- pointer to input signal
 *		float *s_in_i			  
 *		float *s_out_r			- pointer to output signal (must be able to hold num_samps floats)
 *		float *s_out_i
 *		int num_samps			- number of samples to be output
 *
 *	Outputs
 *
 *		The function returns 0 on success 
 *
 *	Side Effects
 *
 *		The output signal is stored in the s_out_r and s_out_i arrays
 *		The last part of the input signal is saved in a buffer for next time 
 *		(to avoid edge effects in the filters)
 *
 */
int Resample_35_39(float *s_in_r, float *s_in_i, int num_in_samps, float *s_out_r, float *s_out_i, int *num_out_samps)
{
	int	i;
	int	j;
	int	s_inc;
	int	last_ndx;
	int num_samps;
	int	extra_samp_out;

	static int	f_ndx = 0;
	static int	sig_ndx = 1;
	static int	FirstCall = 1;
	static int	cntr = 1;
	static int	extra_samp_in = 0;

	float c_tmp = 0.0f;

	if(FirstCall)			// first time in this function initialize the filter pointers
	{
		FirstCall = 0;

		// initialize the filter bank pointers
		for(i = 0; i < 35; i++)
			filter_bank_35_39[i] = &(filter_taps_35_39[i*FILTER_LEN_35]);

		// initialize the buffer to zero
		for(j = 0; j < FILTER_LEN_35; j++)
		{
			rs_buffer_35_r[j] = 0.0f;
			rs_buffer_35_i[j] = 0.0f;
		}
	}

	*num_out_samps = 0;			// initialize the output sample counter

	// determine how many samples to output this time
	extra_samp_out = (int)((cntr)/3.0f + 0.5f);			// round to 0 or 1
	num_samps = MIN_FRAME_LENGTH_OUT + extra_samp_out;
	if(++cntr == 4)
		cntr = 1;
	*num_out_samps = num_samps;

	// for first few output samples we need to use input samples from previous call
	// to avoid edge effects
	for(i = 0; i < FILTER_LEN_35-1 + extra_samp_in; i++)
	{
		// perform the filtering
		s_out_r[i] = 0.0f;
		s_out_i[i] = 0.0f;
		for(j = 0; j <= i - extra_samp_in; j++)
		{
			s_out_r[i] += filter_bank_35_39[f_ndx][j]*s_in_r[sig_ndx-j];
			s_out_i[i] += filter_bank_35_39[f_ndx][j]*s_in_i[sig_ndx-j];
		}
		for(j = i+1 - extra_samp_in; j < FILTER_LEN_35; j++)			// these samples come from the previous call
		{
			s_out_r[i] += filter_bank_35_39[f_ndx][j]*rs_buffer_35_r[FILTER_LEN_35-1+sig_ndx-j];
			s_out_i[i] += filter_bank_35_39[f_ndx][j]*rs_buffer_35_i[FILTER_LEN_35-1+sig_ndx-j];
		}

		// update indices for next output sample
		f_ndx += DOWN_FACTOR;			// increment the filter bank index by 39 (downsample by 39)

		s_inc = 0;
		while(f_ndx >= UP_FACTOR)		// keep f_ndx in bounds
		{
			f_ndx -= UP_FACTOR;
			s_inc++;					// record the number of times f_ndx wrapped
		}

		sig_ndx += s_inc;				// increment the signal index appropriately

		if(s_inc == 2)														// if s_inc is 2 in this stage of the filter then we need
		{																	// one extra sample in the buffer, and the sample that is
			rs_buffer_35_r[FILTER_LEN_35-1 + extra_samp_in] = s_in_r[0];		// needed is the first input sample, so transfer that
			rs_buffer_35_i[FILTER_LEN_35-1 + extra_samp_in] = s_in_i[0];		// sample into the buffer
		}
	}

	for(i = FILTER_LEN_35-1 + extra_samp_in; i < num_samps; i++)
	{
		// perform the filtering
		s_out_r[i] = 0.0f;
		s_out_i[i] = 0.0f;
		for(j = 0; j < FILTER_LEN_35; j++)
		{
			c_tmp = filter_bank_35_39[f_ndx][j];
			s_out_r[i] += c_tmp*s_in_r[sig_ndx-j];
			s_out_i[i] += c_tmp*s_in_i[sig_ndx-j];
		}

		// update indices for next output
		f_ndx += DOWN_FACTOR;			// increment the filter bank index by 39 (downsample by 39)

		s_inc = 0;
		while(f_ndx >= UP_FACTOR)		// keep f_ndx in bounds
		{
			f_ndx -= UP_FACTOR;
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
	for(j = 0; j < FILTER_LEN_35-1 + extra_samp_in; j++)
	{
		rs_buffer_35_r[j] = s_in_r[last_ndx - FILTER_LEN_35 + 1 + j];
		rs_buffer_35_i[j] = s_in_i[last_ndx - FILTER_LEN_35 + 1 + j];
	}

	// for the next call, we want sig_ndx initialized to the next sample needed (that will either
	// be 0 or 1 depending on whether the last s_inc was 1 or 2)
	sig_ndx = s_inc - 1;

	return(0);
}
