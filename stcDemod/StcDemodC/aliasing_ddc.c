/***
 * aliasing_ddc.c implements an aliasing digital down-converter. This is done using a modified, two-path
 * poly-phase filter. This particular implementaion operates on frames of data that may vary in length. It is 
 * downsampling by two, and since the input data frames may have odd lengths, the output length may also vary.
 * In addition, since the output is complex, but half the length of the input, for odd-length inputs, the final
 * sample will be stored until the next time aliasing_ddc() is called. Hence, it stores state from call to call.
 *
 *	Updated Sept. 15, 2006 by Tom Nelson
 *	I fixed a bug that caused the imaginary part of the output to be delayed by 1 sample relative to the 
 *	real part.  (The change was just in the initial conditions of bank, r_sign, and i_sign.)  Also now the 
 *	spectrum inversion is working properly (for both settings of the INVERT_SPECTRUM switch).
 *
 * Copyright (c) 2005 Joseph McRae Palmer
 ***/

#include <stdio.h>
#include <math.h>

#define NUM_REAL_COEFFS 13
#define NUM_IMAG_COEFFS 24

// if the input spectrum is reversed, set this switch to fix it
// (the spectrum inversion is accomplished by conjugating the output
// signal--the DDC performs that conjugation for free)
#define INVERT_SPECTRUM	1

/*********************
 * FUNCTION: aliasing_ddc()
 *
 * DESCRIPTION: Implements an aliasing digital down-converter. The LPF is defined by 
 *				the arrays h0 and h1. There is a two-path polyphase filter. This function
 *				uses static variables to maintains state between input frames. Thus, if the
 *				input buffer is of an odd length, the final output sample will only have the
 *				the real part defined. This sample will not be placed in the output buffer. 
 *				Instead, it will be saved till the next function call, and then included in the 
 *				output. Note that the s_out_len_used argument will give the actual number
 *				of complex samples recorded into the output buffer.
 *
 *				Note that this particular implementation is for an input signal with a bandwidth
 *				less-than-or-equal to 0.1893 times the sampling frequency (0.1893*fs). The
 *				LPF gives a -80 dB response in the stop band, and has less than 0.05 dB of distortion
 *				in the pass band.
 *
 * ARGUMENTS:	s_in : pointer to the input vector
 *				s_in_len : length of the input vector
 *				s_out_r : real part of the output buffer
 *				s_out_i : imaginary part of the output buffer
 *				s_out_len : total length of the ouput buffer
 *				s_out_len_used : number of buffer entries used.
 *
 *
 * Copyright (c) 2005 Joseph McRae Palmer
*********************/

void aliasing_ddc(float *s_in, int s_in_len, 
                float *s_out_r, float *s_out_i, int s_out_len, int *s_out_len_used){
// h1 consists of the non-zero taps of a halfband filter (order 48) that was generated in MATLAB
// with the following command:
//
// h = remez(48,[0 0.17 0.33 0.5]*2,[1 1 0 0]);
// h1 = 2*h(2:2:end);
//
// (h0 is an impulse and represents a delay of 12 samples)

// Coefficients were further modified by Chris Lavin to go from order
// 40, to 48 to make the hardware utilization more efficient.
const float h1[NUM_IMAG_COEFFS] = { 
  -0.0000210174403f, 0.0001348647796f, -0.0005257635805f, 0.0015689796596f, 
  -0.0039197724731f, 0.0086029808759f, -0.0171272994009f, 0.0317530040337f, 
  -0.0563815140547f, 0.0999964008243f, -0.1946352538560f, 0.6305538201783f, 
  0.6305538201783f, -0.1946352538560f, 0.0999964008243f, -0.0563815140547f, 
  0.0317530040337f, -0.0171272994009f, 0.0086029808759f, -0.0039197724731f, 
  0.0015689796596f, -0.0005257635805f, 0.0001348647796f, -0.0000210174403f};

    int i,j;    // loop iterators
    static int bank = 0; // tracks current bank being processed
    static int r_sign = 1; // tracks current sign of input for bank0
#if INVERT_SPECTRUM == 1
    static int i_sign = 1; // tracks current sign of input for bank1
#else
	static int i_sign = -1;
#endif
    float temp = 0;
    int r_ind = 0;  // output index for bank0
    int i_ind = 0;  // output index for bank1
    static float taps_real[NUM_REAL_COEFFS] = {0}; // real filter taps
    static float taps_imag[NUM_IMAG_COEFFS] = {0}; // imaginary filter taps
    static float saved_sample = 0;
	float *tmp;

    // check for correct output buffer lengths
    if(0x1 & s_in_len){ // check if s_in_len is odd
      if(s_out_len < (s_in_len + 1)>>1){
	fprintf(stderr,"ERROR: ALIASING_DDC() -- for odd length input, output buffer must be of length\n.");
	fprintf(stderr,"(s_in_len + 1)/2\n");
	return;
      }
    } else {
      
      if(s_out_len < s_in_len>>1){
	fprintf(stderr,"ERROR: ALIASING_DDC() -- for even length input, output buffer must be of length\n.");
	fprintf(stderr,"s_in_len/2\n");
	return;
      }
    }
    
    if(bank)
	{
      s_out_r[r_ind++] = saved_sample;
    }
    *s_out_len_used = 0;
	for(i=0; i<s_in_len; i++){
		if(!bank)
		{
			for(j=NUM_REAL_COEFFS-1; j>0; j--)
		   {
			taps_real[j] = taps_real[j-1];		// shift the shift register
			}
			taps_real[0] = r_sign*s_in[i];
			r_sign *= -1;
			temp = taps_real[NUM_REAL_COEFFS-2];				// no need to filter--just pull the sample out of the shift register
	   
			if(i==s_in_len-1)
			{
				saved_sample = temp;
			} else 
			{
				s_out_r[r_ind++] = temp;
			}
		}else {
			for(j=NUM_IMAG_COEFFS-1; j>0; j--)
			{
				taps_imag[j] = taps_imag[j-1];
			}
			taps_imag[0] = i_sign*s_in[i];
			i_sign *= -1;
			temp = 0;
			for(j=0; j<NUM_IMAG_COEFFS; j++)
			{
				temp += h1[j]*taps_imag[j];
			}
			s_out_i[i_ind++] = temp;
			*s_out_len_used += 1;
		}
		bank = (++bank)%2;
    }    
}
