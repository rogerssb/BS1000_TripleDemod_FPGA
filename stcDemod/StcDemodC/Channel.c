/*
 *	Channel.c
 *
 *	Channel.c contains the function that imposes the channel on the
 *	modulated signals.  The two STC encoded signals are scaled, delayed,
 *	combined, resampled, offset in frequency, mixed to Fs/4, converted to 
 *	a real signal, and have noise added to them.
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */



////////////////////////////////
// includes
#include <math.h>
#include <stdio.h>

////////////////////////////////
// defines
#include "defines.h"

#define	EXTRA_CHANNEL_SAMPS		7								// extra samples for the resampler
#define DEL_T					1.071428571428572e-008			// one sample time at the 2800/312 samples/bit sample rate
#define	PI_2					6.28318530718


////////////////////////////////
// global variables
float sig_r[FRAME_LENGTH_10 + EXTRA_CHANNEL_SAMPS];		// arrays to hold scaled summed, signal
float sig_i[FRAME_LENGTH_10 + EXTRA_CHANNEL_SAMPS];

float tmp_sig_r[FRAME_LENGTH];	// arrays to hold the resampled signal
float tmp_sig_i[FRAME_LENGTH];

////////////////////////////////
// function definitions
float randn(long *idum);
int Resample_35_39(float *s_in_r, float *s_in_i, int num_in_samps, float *s_out_r, float *s_out_i, int *num_out_samps);
extern void MyFwrite(void const* _Buffer, size_t _ElementSize, size_t _ElementCount, FILE* _Stream);


/*
 *	Function
 *
 *		Channel()
 *
 *	Description
 *
 *		Channel() imposes the channel impairments on the STC encoded signals
 *
 *		The input sample rate is 10 samples/bit
 *		The output sample rate is 1400/153 samples/bit
 *
 *	Inputs
 *
 *		float *s_in0_r			- pointer to input signal for channel 0
 *		float *s_in0_i			  (there must be num_in_samps samples in this array)
 *		float *s_in1_r			- pointer to input signal for channel 1
 *		float *s_in1_i			  (there must be num_in_samps samples in this array)
 *		int num_in_samps		- number of samples in the input signals
 *		float *signal_out		- pointer to output signal (must be able to hold num_out_samps floats)
 *		int *num_out_samps		- number of samples that were produced (will be either 29867 or 29866)
 *		float delta_tau			- differential delay which equals tau_1 - tau_0, should be between -1.0 and +1.0,
 *								  positive means channel 1 delayed more than channel 0) 
 *		float h0_r				- complex channel gain on channel 0
 *		float h0_i
 *		float h1_r				- complex chanenl gain on channel 1
 *		float h1_i
 *		float freq_off			- frequency offset in Hertz
 *		float sigma				- standard deviation of the noise (sqrt of variance)
 *		long *idum				- pointer to the random number generator seed
 *
 *	Outputs
 *
 *		The function returns 0 on success 
 *
 *	Side Effects
 *
 *		The output signal is stored in the signal_out array
 *		The input signals get multiplied by the channel gains
 *
 *
 */
int Channel(float *s_in0_r, float *s_in0_i, float *s_in1_r, float *s_in1_i, int num_in_samps, 
			float *signal_out, int *num_out_samps, float delta_tau, float h0_r, float h0_i, 
			float h1_r, float h1_i, float freq_off, float sigma, long *idum)
{
	int		i;
	int		t0;
	int		t1;
	float	tmp_r;
	float	tmp_i;
	float	*s0_r;
	float	*s0_i;
	float	*s1_r;
	float	*s1_i;

	float	theta;
	float	d_theta;
	static float	theta_last = 0.0f;
	static int		carrier_phase = 0;
	float	c;
	float	s;

////////////////////////////////////////////////////////////////////////////////////////////////////////////
// impose the specified delays on the signal (delay rounded to nearest 0.1 Tb)
	// NOTE: The code below reverses the delays from what the code used to do.
	//       This change fixes a bug that caused the actual differential delay 
	//       to be the negative of what was intended
	if(delta_tau >= 0.0)						// channel 1 delayed more than channel 0
	{
		t0 = (int)(10.0f*delta_tau + 0.5f);		// convert to an integer between 0 and 10
		t1 = 0;
	}
	else										// channel 0 delayed more than channel 1
	{
		t0 = 0;
		t1 = (int)(-10.0f*delta_tau + 0.5f);		// convert to an integer between 0 and 10
	}

	// set pointers to the desired starting point in each input array (this implements the differential delay)
	s0_r = &(s_in0_r[t0]);
	s0_i = &(s_in0_i[t0]);
	s1_r = &(s_in1_r[t1]);
	s1_i = &(s_in1_i[t1]);


////////////////////////////////////////////////////////////////////////////////////////////////////////////
// scale the signals by the channel gains (complex multiply)
	for(i = 0; i < num_in_samps + EXTRA_CHANNEL_SAMPS; i++)
	{
		tmp_r = h0_r*s0_r[i] - h0_i*s0_i[i];
		tmp_i = h0_i*s0_r[i] + h0_r*s0_i[i];
		s0_r[i] = tmp_r;
		s0_i[i] = tmp_i;

		tmp_r = h1_r*s1_r[i] - h1_i*s1_i[i];
		tmp_i = h1_i*s1_r[i] + h1_r*s1_i[i];
		s1_r[i] = tmp_r;
		s1_i[i] = tmp_i;
	}


////////////////////////////////////////////////////////////////////////////////////////////////////////////
// sum the signals
	for(i = 0; i < num_in_samps + EXTRA_CHANNEL_SAMPS; i++)
	{
		sig_r[i] = s0_r[i] + s1_r[i];
		sig_i[i] = s0_i[i] + s1_i[i];
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
// resample by 35/39 to get 2800/312 samples per bit (the desired output rate)
// 280/3 = 93.3333... so 2800/3 = 10 samples, 312/3 = 104 which is the in/out STC ratio
	Resample_35_39(sig_r, sig_i, num_in_samps, tmp_sig_r, tmp_sig_i, num_out_samps);

////////////////////////////////////////////////////////////////////////////////////////////////////////////
// add a frequency offset
	d_theta = 0;	// TODO d_theta = PI_2 * freq_off * DEL_T);
	theta_last = (float)(PI_2 * freq_off / 360);

	theta = theta_last;

	for(i = 0; i < *num_out_samps; i++)
	{
		theta += d_theta;
		if(theta > PI_2)		// keep the phase between -2 pi and +2 pi
			theta -= (float)PI_2;
		else if(theta < -1*PI_2)
			theta += (float)PI_2;

		c = (float)cos(theta);
		s = (float)sin(theta);

		tmp_r = tmp_sig_r[i]*c - tmp_sig_i[i]*s;
		tmp_i = tmp_sig_i[i]*c + tmp_sig_r[i]*s;

		tmp_sig_r[i] = tmp_r;
		tmp_sig_i[i] = tmp_i;
	}
	theta_last = theta;

/*
	FILE *fp_RawDataR, *fp_RawDataI;
	fp_RawDataR = fopen("RawDataR.txt", "w");
	fp_RawDataI = fopen("RawDataI.txt", "w");
	MyFwrite(tmp_sig_r, sizeof(float), PILOT_LENGTH_4*2, fp_RawDataR);
	MyFwrite(tmp_sig_i, sizeof(float), PILOT_LENGTH_4*2, fp_RawDataI);
	fclose(fp_RawDataR);
	fclose(fp_RawDataI);
*/


////////////////////////////////////////////////////////////////////////////////////////////////////////////
// convert to a real signal at Fs/4 (23.333 MHz at our sample rate)
// this involves multiplying by cos(n*pi/2) and sin(n*pi/2) which will have
// values of (1,0), (0,1), (-1,0), and (0,-1) in turn
	// we have to be careful to be sure we don't introduce a carrier phase discontinuity here
	// so we have to keep track of where we ended last time and start up in the same place
	// (note that the variable carrier_phase = the actual carrier phase divided by pi/2)
	i = 0;
	switch(carrier_phase)						// IMPORTANT NOTE!!!!!!
	{											//
		case 1:									// There are no breaks in this case statement
			signal_out[i] = tmp_sig_i[i];		// so execution falls through from one case to the next.
			i++;								// NEVER REARRANGE THESE CASES!!
		case 2:									// If carrier_phase = 1 then we need to do all three
			signal_out[i] = -tmp_sig_r[i];		// cases, if it's 2 then we need to do the last two cases,
			i++;								// and if it's 3 then we need to do the last one only.
		case 3:									// At the end we will be ready to start back at a phase
			signal_out[i] = -tmp_sig_i[i];		// of zero.
			i++;
	}

	// now we are ready to mix the signal in blocks of 4 samples
	for(; i <= *num_out_samps - 4; i+=4)			// don't initialize i here--it's already at the correct value
	{
		signal_out[i] = tmp_sig_r[i];
		signal_out[i+1] = tmp_sig_i[i+1];
		signal_out[i+2] = -tmp_sig_r[i+2];
		signal_out[i+3] = -tmp_sig_i[i+3];
	}

	// now determine how many samples are left over after the last complete group of 4 and mix them
	// (also determine what the ending carrier phase will be)
	carrier_phase = *num_out_samps - i;

	if(carrier_phase == 1)
	{
		signal_out[*num_out_samps-1] = tmp_sig_r[*num_out_samps-1];
	}
	else if(carrier_phase == 2)
	{
		signal_out[*num_out_samps-2] = tmp_sig_r[*num_out_samps-2];
		signal_out[*num_out_samps-1] = tmp_sig_i[*num_out_samps-1];
	}
	else if(carrier_phase == 3)
	{
		signal_out[*num_out_samps-3] = tmp_sig_r[*num_out_samps-3];
		signal_out[*num_out_samps-2] = tmp_sig_i[*num_out_samps-2];
		signal_out[*num_out_samps-1] = -tmp_sig_r[*num_out_samps-1];
	}


////////////////////////////////////////////////////////////////////////////////////////////////////////////
// add real noise to the signal
	for(i = 0; i < *num_out_samps; i++)
	{
		signal_out[i] += (float)(sigma*randn(idum));
	}


////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	done
	return(0);
}






