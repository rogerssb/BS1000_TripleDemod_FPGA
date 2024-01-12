/*
 *	FLL.c
 *
 *	FLL.c performs a frequency locked loop on the input signal and returns
 *	a buffer of data which has the estimated frequency removed.
 *
 *	A vector of the DDS controlling signal is also returned.
 *
 */



////////////////////////////////
// includes
#include <math.h>

////////////////////////////////
// defines


////////////////////////////////
// global variables
float	fll_buffer_r[2];		// buffers to hold the last two input samples from previous call
float	fll_buffer_i[2];

 
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
 *	History
 *
 *		Oct. , 2005			created
 *		Nov. 21, 2005		integrated into STC receiver code
 *
 *	Copyright (c) 2005 Michael Rice.
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

  static int	FirstCall = 1;
  

/////////////////////////////////////////////////////////////////
// initialize the signal buffer on the first call
	if(FirstCall)
	{
		FirstCall = 0;

		for(n = 0; n < 2; n++)
		{
			fll_buffer_r[n] = 0.0f;
			fll_buffer_i[n] = 0.0f;
		}
	}

/////////////////////////////////////////////////////////////////
// first iteration--need last 2 input samples from previous call
	n = 0;

	// compute the complex phasor
	c = (float)cos(6.28318530717959*CReg);
	s = (float)sin(6.28318530717959*CReg);
	
	// generate the output sample by rotating it (note that we are multiplying by the conjugate
	// of the complex phasor)
	signal_r[0] = s_in_r[0]*c + s_in_i[0]*s;
	signal_i[0] = -s_in_r[0]*s + s_in_i[0]*c;
	
	// update the phase error estimate
	PEDout = fll_buffer_r[1]*(signal_i[n]-fll_buffer_i[0]) - fll_buffer_i[1]*(signal_r[n]-fll_buffer_r[0]);
	
	// perform the loop filtering
	Fout = Fout + K*FReg;
	
	// update the phase of the complex phasor
	CReg = CReg + Fout;
	
	// store the phase error estimate
	FReg = PEDout;
	
	// store the frequency estimate
	v[n] = Fout;

	
/////////////////////////////////////////////////////////////////
// second iteration--need last input sample from previous call
	n = 1;
	
	// compute the complex phasor
	c = (float)cos(6.28318530717959*CReg);
	s = (float)sin(6.28318530717959*CReg);
	
	// generate the output sample by rotating it (note that we are multiplying by the conjugate
	// of the complex phasor)
	signal_r[1] = s_in_r[1]*c + s_in_i[1]*s;
	signal_i[1] = -s_in_r[1]*s + s_in_i[1]*c;
	
	// update the phase error estimate
	PEDout = signal_r[n-1]*(signal_i[n]-fll_buffer_i[1]) - signal_i[n-1]*(signal_r[n]-fll_buffer_r[1]);
	
	// perform the loop filtering
	Fout = Fout + K*FReg;
	
	// update the phase of the complex phasor
	CReg = CReg + Fout;
	
	// store the phase error estimate
	FReg = PEDout;
	
	// store the frequency estimate
	v[n] = Fout;
	

/////////////////////////////////////////////////////////////////
// loop over the rest of the input samples
	for (n = 2; n < num_samps; n++)
	{
		// compute the complex phasor
		c = (float)cos(6.28318530717959*CReg);
		s = (float)sin(6.28318530717959*CReg);
		
		// generate the output sample by rotating it (note that we are multiplying by the conjugate
		// of the complex phasor)
		signal_r[n] = s_in_r[n]*c + s_in_i[n]*s;
		signal_i[n] = -s_in_r[n]*s + s_in_i[n]*c;
		
		// update the phase error estimate
		PEDout = signal_r[n-1]*(signal_i[n]-signal_i[n-2]) - signal_i[n-1]*(signal_r[n]-signal_r[n-2]);
		
		// perform the loop filtering
		Fout = Fout + K*FReg;
		
		// update the phase of the complex phasor
		CReg = CReg + Fout;
		
		// store the phase error estimate
		FReg = PEDout;
		
		// store the frequency estimate
		v[n] = Fout;
	}


/////////////////////////////////////////////////////////////////
// store the last two input samples for next time
	for(n = 0; n < 2; n++)
	{
		fll_buffer_r[n] = s_in_r[num_samps-2+n];
		fll_buffer_i[n] = s_in_i[num_samps-2+n];
	}

	return(0);
}

