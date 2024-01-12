/*
 *	FLL.c
 *
 *	FLL.c performs a frequency locked loop on the input signal and returns
 *	a buffer of data which has the estimated frequency removed.
 *
 *	A vector of the DDS controlling signal is also returned.
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */



////////////////////////////////
// includes
#include <math.h>

////////////////////////////////
// defines


////////////////////////////////
// global variables
float	prev_signal_r[2] = {0.0f, 0.0f};		// buffers to hold the last two rotated input samples from previous call
float	prev_signal_i[2] = {0.0f, 0.0f};

 
////////////////////////////////
// function definitions


/*
 *	Function
 *
 *		FLL()
 *
 *	Description
 *
 *		FLL() estimates and removes the frequency offset in the input signal.  The frequency
 *		locked loop used is based on the derivative filter.
 *
 *	Inputs
 *
 *		float *s_in_r			- pointer to input signal
 *		float *s_in_i			  
 *		float *signal_r			- pointer to output signal (must be able to hold num_samps floats)
 *		float *signal_i
 *		float *v				- output vector which holds the DDS controlling signal
 *		int	  num_samps			- number of samples in the input and output
 *		float K					- loop constant for the frequency locked loop
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
 *		Also the output DDS signal is stored in the v array
 *
 *
 */
int FLL(float *s_in_r, float *s_in_i, float *signal_r, float *signal_i, float *v, int num_samps, float K)
{
  int	n;

  float	c;
  float	s;

  float PEDout;

  static float	CReg = 0.0f;
  static float	Fout = 0.0f;
  static float	FReg = 0.0f;

	for (n = 0; n < num_samps; n++)
	{

	// compute the complex phasor
	c = (float)cos(6.28318530717959*CReg);
	s = (float)sin(6.28318530717959*CReg);
	
	// generate the output sample by rotating it (note that we are multiplying by the conjugate
	// of the complex phasor)
	signal_r[n] = s_in_r[n]*c + s_in_i[n]*s;
	signal_i[n] = -s_in_r[n]*s + s_in_i[n]*c;
	
	// update the phase error estimate
	PEDout = prev_signal_r[1]*(signal_i[n]-prev_signal_i[0]) - prev_signal_i[1]*(signal_r[n]-prev_signal_r[0]);
	
	// perform the loop filtering
	Fout = Fout + K*FReg;
	
	// update the phase of the complex phasor and clip to [-1.0, +1.0]
	CReg = CReg + Fout;
	while (CReg > 1.0f) CReg -= 1.0F;
	while (CReg < -1.0f) CReg += 1.0F;

	// store the phase error estimate
	FReg = PEDout;
	
	// store the frequency estimate
	v[n] = Fout;

	// Move over the prev_signal values
        prev_signal_r[0] = prev_signal_r[1];
        prev_signal_i[0] = prev_signal_i[1];
        prev_signal_r[1] = signal_r[n];
        prev_signal_i[1] = signal_i[n];
	}
	//printf("Fout = %8.2f\n",Fout);

	return(0);
}


