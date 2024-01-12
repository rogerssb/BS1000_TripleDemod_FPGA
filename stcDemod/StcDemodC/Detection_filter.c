/*
 *	Detection_filter.c
 *
 *	Detection_filter.c contains the filter routine for the detection filter
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */



////////////////////////////////
// includes


////////////////////////////////
// defines
#define	DF_LEN		8			// number of taps in the detection filter

////////////////////////////////
// global variables
float det_filter[DF_LEN] = { 0.00965657f,		// this filter has unit DC gain
			                 0.06389303f,
			                 0.16877815f,
			                 0.25767225f,
			                 0.25767225f,
			                 0.16877815f,
			                 0.06389303f,
			                 0.00965657f, };

 
// filter buffer (for saving the end samples between calls to avoid edge effects
float filter_buffer_r[DF_LEN];
float filter_buffer_i[DF_LEN];

////////////////////////////////
// function definitions


/*
 *	Function
 *
 *		Detection_filter()
 *
 *	Description
 *
 *		Detection_filter() performs the filtering operation on the received signal
 *		with the detection filter.  The detection filter is the second PAM pulse of
 *		the CPM approximation of FQPSK-JR.
 *
 *		The last DF_LEN-1 samples from each call are saved and used to generate the
 *		first DF_LEN-1 output samples of the next call.
 *
 *		The sample rate is 4 samples/bit
 *
 *	Inputs
 *
 *		float *s_in_r			- pointer to input signal
 *		float *s_in_i			
 *		float *s_out_r			- pointer to output signal (must be able to hold num_out_samps floats)
 *		float *s_out_i
 *		int num_out_samps		- number of samples to be output
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
int Detection_filter(float *s_in_r, float *s_in_i, float *s_out_r, float *s_out_i, int num_out_samps)
{
	int	i;
	int	j;
	static int	FirstCall = 1;

	if(FirstCall)
	{
		FirstCall = 0;

		// initialize the filter buffers
		for(i = 0; i < DF_LEN; i++)
		{
			filter_buffer_r[i] = 0.0f;
			filter_buffer_i[i] = 0.0f;
		}
	}

	// generate the first few filter outputs using data from the previous call
	for(i = 0; i < DF_LEN-1; i++)
	{
		// perform the filtering
		s_out_r[i] = 0.0f;
		s_out_i[i] = 0.0f;
		for(j = 0; j <= i; j++)					// these samples come from the previous call
		{
			s_out_r[i] += det_filter[j]*s_in_r[i-j];
			s_out_i[i] += det_filter[j]*s_in_i[i-j];
		}
		for(j = i+1; j < DF_LEN; j++)			// these samples come from the previous call
		{
			s_out_r[i] += det_filter[j]*filter_buffer_r[DF_LEN - 1 + i - j];
			s_out_i[i] += det_filter[j]*filter_buffer_i[DF_LEN - 1 + i - j];
		}

	}

	// perform the rest of the filtering
	for(i = DF_LEN-1; i < num_out_samps; i++)
	{
		s_out_r[i] = det_filter[0]*s_in_r[i];
		s_out_i[i] = det_filter[0]*s_in_i[i];
		for(j = 1; j < DF_LEN; j++)
		{
			s_out_r[i] += det_filter[j]*s_in_r[i-j];
			s_out_i[i] += det_filter[j]*s_in_i[i-j];
		}
	}

	for(j = 0; j < DF_LEN-1; j++)
	{
		filter_buffer_r[j] = s_in_r[num_out_samps - DF_LEN + 1 + j];	// skip filter preload to get back to the origin of the frame
		filter_buffer_i[j] = s_in_i[num_out_samps - DF_LEN + 1 + j];
	}

	// done
	return(0);
}
