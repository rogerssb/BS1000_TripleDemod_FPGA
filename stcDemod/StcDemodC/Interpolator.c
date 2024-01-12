/*
 *	Interpolator.c
 *
 *	This file contains the functions Interpolator() and Farrow_filter().  These
 *	functions are for performing a fractional delay on a complex input signal.
 *
 *	The function Farrow_filter() performs the fractional delay through the use
 *	of a piece-wise parabolic interpolator with alpha=0.5.  It operates on a 
 *	single (real) input array.  
 *
 *	The function Interpolator() is a wrapper for Farrow_filter() which has 
 *	complex inputs and outputs and which calls Farrow_filter() once for the 
 *	real part of the input signal and once for the imaginary part.
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */
 

////////////////////////////////
// includes


////////////////////////////////
// defines


////////////////////////////////
// global variables
float	reg_0[2];			// shift registers for the Farrow filter
float	reg_1[3];
 

////////////////////////////////
// function definitions
int Farrow_filter(float *s_in, float *s_out, int num_out_samples, float mu);


/*
 *	Function
 *
 *		Interpolator()
 *
 *	Description
 *
 *		Interpolator() is a wrapper function for Farrow_filter().  It takes complex inputs and has 
 *		complex outputs and calls Farrow_filter() for both the real and imaginary parts.  Interpolator()
 *		performs the function of a fractional delay on a complex signal.  It also downsamples the 
 *		signal to 1 sample/bit from 4 samples/bit.  
 *
 *		In each group of 4 samples s_in[i] through s_in[i+3], the basepoint index is assumed to be 
 *		s_in[i+1].  That is, the desired output sample lies between s_in[i+1] and s_in[i+2] (and
 *		it is mu away from the index i+1).  As a result, the input signal should be aligned so that
 *		there is an extra sample at the beginning before the sample that preceeds the desired output.
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
 *		float mu				- fractional offset for interpolator
 *
 *	Outputs
 *
 *		The function returns 0 on success 
 *
 *	Side Effects
 *
 *		The output signal is stored in the s_out_r and s_out_i arrays
 *
 */
int Interpolator(float *s_in_r, float *s_in_i, float *s_out_r, float *s_out_i, int num_out_samples, float mu)
{
	// call the Farrow_filter() routine for the real part and the imaginary part of the input signal
	Farrow_filter(s_in_r, s_out_r, num_out_samples, mu);
	Farrow_filter(s_in_i, s_out_i, num_out_samples, mu);

	// done
	return(0);
}

/*
 *	Function
 *
 *		Farrow_filter()
 *
 *	Description
 *
 *		Farrow_filter() uses a Farrow filter to perform a fractional delay and downsample by 4.  
 *		The filter is piece-wise parabolic with alpha = 0.5. 
 *
 *		In each group of 4 samples s_in[i] through s_in[i+3], the basepoint index is assumed to be 
 *		s_in[i+1].  That is, the desired output sample lies between s_in[i+1] and s_in[i+2] (and
 *		it is mu away from the index i+1).  As a result, the input signal should be aligned so that
 *		there is an extra sample at the beginning before the sample that preceeds the desired output.
 *
 *		The input sample rate is 4 samples/bit
 *		The output sample rate is 1 sample/bit
 *
 *	Inputs
 *
 *		float *s_in				- pointer to input signal (should contain num_out_samps+3 floats)
 *		float *s_out			- pointer to output signal (must be able to hold num_out_samps floats)
 *		int num_out_samps		- number of samples to be output
 *		float mu				- fractional offset for interpolator
 *
 *	Outputs
 *
 *		The function returns 0 on success 
 *
 *	Side Effects
 *
 *		The output signal is stored in the s_out_r array and the contents of reg_0 and reg_1
 *		are altered.
 *
 */
int Farrow_filter(float *s_in, float *s_out, int num_out_samples, float mu)
{
	int		i,j;
	float	v0, v1, v2;

	// loop over blocks of 4 samples to perform the interpolation
	for(i = 0, j = 0; j < num_out_samples; i += 4, j++)
	{
		// compute the polynomial coefficients from the input samples
		v2 = 0.5f*(s_in[i+3] - s_in[i+2] - s_in[i+1] + s_in[i]);
		v1 = 0.5f*(-s_in[i+3] + 3*s_in[i+2] - s_in[i+1] - s_in[i]);
		v0 = s_in[i+1];

		// compute the output sample from those coefficients and the fractional delay
		s_out[j] = (mu*v2 + v1)*mu + v0;
	}

	// done
	return(0);
}

 

