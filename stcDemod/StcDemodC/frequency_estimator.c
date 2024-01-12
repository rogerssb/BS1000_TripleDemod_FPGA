/*
* frequency_estimator.c produces the frequency offset estimation of a set of training sequences. The top-level interface
* function is frequency_estimator(). In short, it accepts a single 512-sample training sequence. In addition,
* it also accepts templates for these training sequences, and channel and timing estimations. The output is an estimation of
* the frequency offset of the trainging sequences from baseband.
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <memory.h>
#include "complex_math.h"
#include "defines.h"

#define NB_4	4			// the frequency estimator operates at a sample rate of 4 samples/bit

#ifndef FS
	#define FS 41.6e6   // sampling frequency
#endif

#ifndef PI_2
	#define PI_2 6.28318530718
#endif

#define GOLD 0.61803399
#define MGOLD (1.0 - GOLD)

#define R 64								// amount to resample the fft input by
#define FN (262144/R)						// size of FFT to use
#define DECIMATE decimate_64_1				// resampling function to utilize
extern DECIMATE(double *x,int nx, int phase, double *y);
#define FFT_INPUT_LENGTH (4*13312/R)		// length of the fft input

int mode = FE_ACQUIRE;						// current mode of the frequency estimator (FE_ACQUIRE or FE_TRACK)

unsigned int histogram[13] = {0};			// the histogram bins are seperated by 3.125 KHz
float histogram_center_frequency = 0.0f;	// corresponds to the frequency for histogram[13]
#define FREQ_AMBIGUITY	3125.0f				// separation of the ambiguous frequency estimation peaks = FS/13312

extern WRITE_MSGS;
extern openError;

///////////////////////////////////////////////////////////////////////////
// global variables

float	freq_off;
float	snr;
float	Ch0Power;

// estimated training sequence templates
float p_r[PILOT_LENGTH_4];
float p_i[PILOT_LENGTH_4];
float fe_p_r[PILOT_LENGTH_4];
float fe_p_i[PILOT_LENGTH_4];

// buffers for stored training sequences
float pilot_buffer_0_r[PILOT_LENGTH_4];
float pilot_buffer_0_i[PILOT_LENGTH_4];
float pilot_buffer_1_r[PILOT_LENGTH_4];
float pilot_buffer_1_i[PILOT_LENGTH_4];
float pilot_buffer_2_r[PILOT_LENGTH_4];
float pilot_buffer_2_i[PILOT_LENGTH_4];
float pilot_buffer_3_r[PILOT_LENGTH_4];
float pilot_buffer_3_i[PILOT_LENGTH_4];

// buffers for stored pilot-template vector products
double pt_buffer_0_r[PILOT_LENGTH_4];
double pt_buffer_0_i[PILOT_LENGTH_4];
double pt_buffer_1_r[PILOT_LENGTH_4];
double pt_buffer_1_i[PILOT_LENGTH_4];
double pt_buffer_2_r[PILOT_LENGTH_4];
double pt_buffer_2_i[PILOT_LENGTH_4];
double pt_buffer_3_r[PILOT_LENGTH_4];
double pt_buffer_3_i[PILOT_LENGTH_4];

// buffers for downsampled pilot_template vector products
double pt_down_buffer_0_r[PILOT_LENGTH_4];
double pt_down_buffer_0_i[PILOT_LENGTH_4];
double pt_down_buffer_1_r[PILOT_LENGTH_4];
double pt_down_buffer_1_i[PILOT_LENGTH_4];
double pt_down_buffer_2_r[PILOT_LENGTH_4];
double pt_down_buffer_2_i[PILOT_LENGTH_4];
double pt_down_buffer_3_r[PILOT_LENGTH_4];
double pt_down_buffer_3_i[PILOT_LENGTH_4];

// pointers to stored training sequence buffers
float *pilot_buf_ptr0_r;
float *pilot_buf_ptr0_i;
float *pilot_buf_ptr1_r;
float *pilot_buf_ptr1_i;
float *pilot_buf_ptr2_r;
float *pilot_buf_ptr2_i;
float *pilot_buf_ptr3_r;
float *pilot_buf_ptr3_i;

// pointer to stored pilot-template vector products
double *pt_buf_ptr0_r;
double *pt_buf_ptr0_i;
double *pt_buf_ptr1_r;
double *pt_buf_ptr1_i;
double *pt_buf_ptr2_r;
double *pt_buf_ptr2_i;
double *pt_buf_ptr3_r;
double *pt_buf_ptr3_i;

// pointer to stored downsampled pilot-template vector product
double *pt_down_buf_ptr0_r;
double *pt_down_buf_ptr0_i;
double *pt_down_buf_ptr1_r;
double *pt_down_buf_ptr1_i;
double *pt_down_buf_ptr2_r;
double *pt_down_buf_ptr2_i;
double *pt_down_buf_ptr3_r;
double *pt_down_buf_ptr3_i;

void fft_double(double *x_r, double *x_i, int xlen, double *X_r, double *X_i, int Xlen);


/*****
 * FUNCTION: dft()
 * DESCRIPTION: Performs the Discrete Fourier Transform for a single frequency. In other words,
 *				computes the correlation of the complex input sequence, x, with a complex
 *				sinusoid of frequency (FS/R)*(x1 - N/2 + 1)/N. x1 is a fraction bin number from
 *				an FFT of length N. The intent is to compute the magnitude-squared DFT for a
 *				frequency at some fractional interval between two integral FFT bins.
 *
 * ARGUMENTS:
 *			x1					:	Fraction bin number of the original FFT output.
 *          x_r, x_i			:   The complex input sequence.
 *			ndx					:	Length of x_r, x_i.
 *			N					:	Length of the FFT.
 *			y					:	Pointer to the output
 *
 *
 * Copyright (c) 2006 Joseph McRae Palmer
 *****/
void dft(double x1,
		 const double *x_r, const double *x_i, const int ndx, const int N,
		 double *y)
{
	double w_r,w_i;
	double wm_r,wm_i;
	double tmp_r, tmp_i;
	double xray_r, xray_i;
	const double ts = R/FS;
	double freq;
	int j;

	// compute DFTs of each point around center
	freq = FS*(x1 - N/2+1)/(R*N);
	wm_r = cos(PI_2*ts*freq); wm_i = -sin(PI_2*ts*freq);
	// initialize the phasor
	w_r = 1.0; w_i = 0.0;
	// initialize the accumulator
	xray_r = 0.0; xray_i = 0.0;
	for(j=0; j<ndx; j++)
	{
		complex_mult_double(w_r,w_i,x_r[j],x_i[j],&tmp_r,&tmp_i);
		xray_r += tmp_r; xray_i += tmp_i;
		/*if (x_r[j] != 0)
			printf("index=%f, cos=%f, sin=%f, X_r=%f, X_i=%f, xray_r=%f, xray_i=%f, j=%d\n",x1, w_r, w_i, x_r[j], x_i[j], xray_r, xray_i, j);
		 TODO*/

		// rotate the phasor
		complex_mult_double(w_r,w_i,wm_r,wm_i,&w_r,&w_i);
	}
	// compute the magnitude squared of the complex result, store in *y
	complex_abs2_double(xray_r,xray_i,y);
//	printf("Index=%f, y=%f\n", x1, *y); // TODO
}

/*****
 * FUNCTION: dft_search()
 * DESCRIPTION: Performs a find-grained search for the maximum magnitude squared frequency
 *				response between two candidate FFT output bins. The intent is to emulate an FFT
 *				64 times larger. The smaller FFT is good enough to locate possible bins where the
 *				max is located. Then dft_search() is called to search around those bins to find
 *				the true max.
 *
 *
 * ARGUMENTS:
 *			x1					:	Fraction bin number of the original FFT output around which to search.
 *			y1					:	Magnitude squared frequency response at x1.
 *          x_r, x_i			:   The complex input sequence.
 *			ndx					:	Length of x_r, x_i.
 *			N					:	Length of the FFT.
 *			x_val				:	Pointer to the output of the final maximum magnitude squared frequency response.
 *			x_ind				:	Poniter to the fraction bin index corresponding to x_val
 *
 *
 * Copyright (c) 2006 Joseph McRae Palmer
 *****/
void dft_search(double xcenter,
				const double *x_r, const double *x_i, const int ndx, const int N,
				double *x_val, double *x_ind)
{
	const double ts = R/FS;
	static int call_num_dft_search = 0;

	double xa, xb, xc;
	double fa, fb, fc;
	double f1, f2;
	double x0,x1,x2,x3;
	double max_ind;		// FZ was unused int max_ind;
	double max_val;

	int i,j;
	/*
	double delta_f_ind, step;
	double Peaks[192];
	max_val = 0;
	delta_f_ind = FREQ_AMBIGUITY / (2.0 * FS / (R*FN));
	step = delta_f_ind / 96;
	for (i = 0; i < 192; i++)
	{
		dft(xcenter - delta_f_ind + step*i, x_r, x_i, ndx, N, &Peaks[i]);
		if (Peaks[i] > max_val)
		{
			max_val = Peaks[i];
			max_ind = xcenter - delta_f_ind + step*i;
		}
	}
	printf("MaxVal=%f, MaxIndex=%f\n", max_val, max_ind);
	*/
/*	FILE * FilePtr;
	if (call_num_dft_search == 0)
	{
		FilePtr = fopen("DftSearch.txt", "w");
	}
	else
	{
		FilePtr = fopen("DftSearch.txt", "a");
	}
	MyFwrite(x_r, sizeof(double), ndx, FilePtr);
*/
	// setup the golden-section search (make sure xb is greater than both xa and xc
	call_num_dft_search++;
	xb = xcenter;
	dft(xb,x_r,x_i,ndx,N,&fb);
	xa = xb - 1.0;
	dft(xa,x_r,x_i,ndx,N,&fa);
	xc = xb + 1.0;
	dft(xc,x_r,x_i,ndx,N,&fc);

	i = 0;
	if(fa > fb)
	{
		while(fa > fb && i<4)
		{
			xc = xb;
			fc = fb;
			xb = xa;
			fb = fa;
			xa = xb - 1.0;
			dft(xa,x_r,x_i,ndx,N,&fa);
			i++;
		}
	}
	else if(fc > fb)
	{
		while(fc > fb && i<4)
		{
			xa = xb;
			fa = fb;
			xb = xc;
			fb = fc;
			xc = xb + 1.0;
			dft(xc,x_r,x_i,ndx,N,&fc);
			i++;
		}
	}

	// perform golden section search
	x0 = xa;
	x1 = xb;
	f1 = fb;
	x3 = xc;
	x2 = x1 + MGOLD*(x3 - x1);
	dft(x2,
		x_r, x_i, ndx, N,
		&f2);

	for (i = 0; i < 12; i++)
	{
		if (f2 > f1)
		{
			x0 = x1;
			x1 = x2;
			x2 = GOLD*x1 + MGOLD*x3;
			f1 = f2;
			dft(x2,
				x_r, x_i, ndx, N,
				&f2);
			//printf("F2>F1 x0=%f, x1=%f, x2=%f, x3=%f\n", x0, x1, x2, x3); // todo
		}
		else
		{
			x3 = x2;
			x2 = x1;
			x1 = GOLD*x2 + MGOLD*x0;
			f2 = f1;
			dft(x1,
				x_r, x_i, ndx, N,
				&f1);
			//printf("F2>F1 x0=%f, x1=%f, x2=%f, x3=%f\n", x0, x1, x2, x3); // todo
		}
	}
	if(f1 < f2)
	{
		*x_ind = x1;
		*x_val = f1;
	}
	else
	{
		*x_ind = x2;
		*x_val = f2;
	}
	// printf("x_val=%f, x_ind=%f\n", *x_val, *x_ind);
}
/*void dft_search(double x1, double y1,
				const double *x_r, const double *x_i, const int ndx, const int N,
				double *x_val, double *x_ind)
{
	const double ts = R/FS;

	double xc;
	double x[3];
	double z[3];
	int max_ind;
	double max_val;

	int i,j;

	xc = x1;
	z[1] = y1;

	// Each iteration evaluates evaluates two frequencies above and below
	// the current frequency with the maximum response. The max of these is
	// then saved for the next iteration, and the search is repeated. Note that
	// for each iteration, the search distance is incrementally smaller.
	for(i=-1; i>=-6; i--)
	{
		// set search points around center index
		x[0] = xc - pow(2.0,i);
		x[1] = xc;
		x[2] = xc + pow(2.0,i);

		// compute DFTs of each point around center
		dft(x[0],
			x_r,x_i,ndx,N,
			&z[0]);

		dft(x[2],
			x_r,x_i,ndx,N,
			&z[2]);

		// find max of the three candidate bins
		max_ind = 0;
		max_val = 0.0;
		for(j=0; j<3; j++)
		{
			if(z[j] > max_val)
			{
				max_val = z[j];
				max_ind = j;
			}
		}

		// save new center bin value
		xc = x[max_ind];
		z[1] = z[max_ind];
	}

	*x_ind = xc;
	*x_val = z[1];
}*/


/*****
 * FUNCTION: estimate_freq()
 * DESCRIPTION: Performs a frequency offset estimation. The estimate
 *				is made using the four most recent 512-sample pilots. The estimation is performed by,
 *				first, downsampling the vector product of the received pilots and the conjugate of the
 *				estimated pilots, second, performing a forward FFT of this downsampled product, third,
 *				identify seven candidate peaks in the FFT output, fourth, peform a fine-grain DFT search around
 *				the peaks in order to identify the true FFT output max.
 *
 *				The estimator operates in two modes. In the FE_ACQUIRE mode, the estimate returned is the
 *				result of a fine grain search over seven candidate FFT output peaks. But, during the
 *				FE_TRACK mode, the estimate returned is the result of a fine grain search of the current
 *				peak identified by the center bin of the histogram. Note that during the FE_TRACK mode,
 *				the fine grain searches of the FFT candidate peaks continue, though the results are only
 *				used to collect statistical information in the histogram. This information can then
 *				be used for making decisions about changing operating modes.
 *
 *				The downsampling is performed by six stages of 2:1 half-band decimators. The amount
 *				of the downsampling is a power-of-two, and is 64 in this case. The resolution
 *				of the FFT output is determined by the size of the FFT, which is fixed at 4096 here, which must
 *				also be a power-of-two.
 *
 * ARGUMENTS:
 *			freq_est_coarse		:	Pointer to location where the course estimate is stored.
 *          freq_est			:   Pointer to where the final estimate is stored.
 *
 *
 * Copyright (c) 2006 Joseph McRae Palmer
 *****/
void estimate_freq(float *freq_est_coarse, float *freq_est)
{
	FILE *fp_fft_in_r, *fp_fft_in_i;
	char fft_r[40], fft_i[40];

	double pt_spectrum_r[FN];
	double pt_spectrum_i[FN];
	double input_buf_r[FFT_INPUT_LENGTH] = {0.0};
	double input_buf_i[FFT_INPUT_LENGTH] = {0.0};
	double xray[FN] = {0};
	double max;
	double tmp;

	double x[7];
	double y[7];

	static int call_count = 0;

	const double freq_resolution = FS/(R*FN);
	int max_ind;
	float max_ind_f;
	int		i, j, ind_start;	// loop iterators
	int inc;
	float inc_float, inc_remainder;

	double delta_f_ind;
	double hcf_y;
	double hcf_x;
	double histogram_center_index;

	int StartBuf[4];
	///////////////////////////////////////////
	// record frame 0 pilots
	///////////////////////////////////////////
	inc_remainder = 0.0f;
	ind_start = 0;
	inc_float = 12800.0f/R + inc_remainder + ind_start;
	inc = (int)inc_float;
	inc_remainder = inc_float - inc;
	ind_start = inc;
	StartBuf[0] = ind_start;
	for(i=0; i<PILOT_LENGTH_4/R; i++)
	{
		input_buf_r[i+ind_start] = (double)pt_down_buf_ptr0_r[i];
		input_buf_i[i+ind_start] = (double)pt_down_buf_ptr0_i[i];
	}


	///////////////////////////////////////////
	// record frame 1 pilots
	///////////////////////////////////////////
	inc_float = 512.0f/R + 12800.0f/R + inc_remainder + ind_start;
	inc = (int)inc_float;
	inc_remainder = inc_float - inc;
	ind_start = inc;
	StartBuf[1] = ind_start;
	for(i=0; i<PILOT_LENGTH_4/R; i++)
	{
		input_buf_r[i+ind_start] = (double)pt_down_buf_ptr1_r[i];
		input_buf_i[i+ind_start] = (double)pt_down_buf_ptr1_i[i];
	}

	///////////////////////////////////////////
	// record frame 2 pilots
	///////////////////////////////////////////
	//ind_start += 256/R;
	inc_float = 512.0f/R + 12800.0f/R + inc_remainder + ind_start;
	inc = (int)inc_float;
	inc_remainder = inc_float - inc;
	ind_start = inc;
	StartBuf[2] = ind_start;
	for(i=0; i<PILOT_LENGTH_4/R; i++)
	{
		input_buf_r[i+ind_start] = (double)pt_down_buf_ptr2_r[i];
		input_buf_i[i+ind_start] = (double)pt_down_buf_ptr2_i[i];
	}

	///////////////////////////////////////////
	// record frame 3 pilots
	///////////////////////////////////////////
	inc_float = 512.0f/R + 12800.0f/R + inc_remainder + ind_start;
	inc = (int)inc_float;
	inc_remainder = inc_float - inc;
	ind_start = inc;
	StartBuf[3] = ind_start;
	for(i=0; i<PILOT_LENGTH_4/R; i++)
	{
		input_buf_r[i+ind_start] = (double)pt_down_buf_ptr3_r[i];
		input_buf_i[i+ind_start] = (double)pt_down_buf_ptr3_i[i];
	}
	float MaxMag = 0;
	float tempMag;
	for (i = 0; i < 832; i++)
	{
		tempMag = sqrt(input_buf_r[i] * input_buf_r[i] + input_buf_i[i] * input_buf_i[i]);
		if (tempMag > MaxMag)
			MaxMag = tempMag;
	}
	printf("\nMaxMag=%f\n", MaxMag);

#ifdef WRITE_MSGS
		sprintf(fft_r,"Brik2_fft_in_%d_r.txt",(int)freq_off);
		sprintf(fft_i,"Brik2_fft_in_%d_i.txt",(int)freq_off);
		fp_fft_in_r = fopen(fft_r,"w");
		fp_fft_in_i = fopen(fft_i,"w");
		MyFwrite(input_buf_r,sizeof(double),FFT_INPUT_LENGTH,fp_fft_in_r);
		MyFwrite(input_buf_i,sizeof(double),FFT_INPUT_LENGTH,fp_fft_in_i);
		fclose(fp_fft_in_r);
		fclose(fp_fft_in_i);
#endif WRITE_MSGS

	fft_double(input_buf_r, input_buf_i, FFT_INPUT_LENGTH, pt_spectrum_r, pt_spectrum_i, FN);

#ifdef WRITE_MSGS
	FILE *fp_fft_out_r, *fp_fft_out_i;
		sprintf(fft_r,"Brik2_fft_out_%d_r.txt",(int)freq_off);
		sprintf(fft_i,"Brik2_fft_out_%d_i.txt",(int)freq_off);
		fp_fft_out_r = fopen(fft_r,"wb");
		fp_fft_out_i = fopen(fft_i,"wb");
		MyFwrite(pt_spectrum_r,sizeof(double),FN,fp_fft_out_r);
		MyFwrite(pt_spectrum_i,sizeof(double),FN,fp_fft_out_i);
		fclose(fp_fft_out_r);
		fclose(fp_fft_out_i);
#endif WRITE_MSGS

	// save magnitude squared of spectrum, do fft shift
	for(i=0; i<FN/2-1; i++)
	{
		complex_abs2_double(pt_spectrum_r[i+FN/2+1],pt_spectrum_i[i+FN/2+1],&tmp);
		xray[i] = tmp;
	}
	for(i=FN/2-1; i<FN; i++)
	{
		complex_abs2_double(pt_spectrum_r[i-FN/2+1],pt_spectrum_i[i-FN/2+1],&tmp);
		xray[i] = tmp;
	}
/*
	FILE *XrayFP;
	XrayFP = fopen("Xray.txt", "w");
	MyFwrite(xray, sizeof(double), 4096, XrayFP);
	fclose(XrayFP);
*/

	// find the maximum FFT output
	max = 0.0;
	max_ind = 0;
	for(i=0; i<FN; i++)
	{
		// record current bin's identity if it has the current largest response
        if(xray[i] > max){
            max = xray[i];
            max_ind = i;
        }
    }
/*
	printf("\nFreqOff = %.0f, Max = %f, Index = %d\n", freq_off, max, max_ind);
	for (i = 0; i < 4; i++)
	{
		printf("PilotDown%dr = %f", i, input_buf_r[StartBuf[i]]);
		for (j = 1; j < 8; j++)
			printf(", %f", input_buf_r[StartBuf[i] + j]);
		printf("\n");
		printf("PilotDown%di = %f", i, input_buf_i[StartBuf[i]]);
		for (j = 1; j < 8; j++)
			printf(", %f", input_buf_i[StartBuf[i] + j]);
		printf("\n");
	}
	printf("\n");
*/
//TODO #ifdef WRITE_MSGS
	sprintf_s(fft_r, sizeof(fft_r), "Brik2_Dec64R_%+.0f_%d_%d%%.txt", freq_off, (int)snr, (int)(Ch0Power * 100));
	sprintf_s(fft_i, sizeof(fft_i), "Brik2_Dec64I_%+.0f_%d_%d%%.txt", freq_off, (int)snr, (int)(Ch0Power * 100));
	FILE *fp_r, *fp_i;
	openError = fopen_s(&fp_r, fft_r, "w");
	openError = fopen_s(&fp_i, fft_i, "w");
	for (i = 0; i < 4; i++)
	{
		for (j = 0; j < 8; j++)
		{
			fprintf(fp_r, " %10.10f\n", input_buf_r[i * 208 + 200 + j]);
			fprintf(fp_i,  "%10.10f\n", input_buf_i[i * 208 + 200 + j]);
		}
	}
	fprintf(fp_r, "%d\n", max_ind);
	fprintf(fp_i, "%d\n", max_ind);
	fclose(fp_r);
	fclose(fp_i);
//TODO #endif WRITE_MSGS

	// perform a fine-grain DFT search of the detected peak, and the three peaks on each side
	delta_f_ind = FREQ_AMBIGUITY/(FS/(R*FN));
	dft_search((double)max_ind,
				input_buf_r,input_buf_i,FFT_INPUT_LENGTH,FN,
				&y[3],&x[3]);
	for(i=2; i>=0; i--)
	{
		max_ind_f = x[i+1] - delta_f_ind;
		dft_search((double)max_ind_f,
					input_buf_r,input_buf_i,FFT_INPUT_LENGTH,FN,
					&y[i],&x[i]);
	}
	for(i=4; i<=6; i++)
	{
		max_ind_f = x[i-1] + delta_f_ind;
		dft_search((double)max_ind_f,
					input_buf_r,input_buf_i,FFT_INPUT_LENGTH,FN,
					&y[i],&x[i]);
	}

	// find the max of the six DFT search results
	max = 0.0;
	max_ind = 0;
	for(i=0; i<=6; i++)
	{
		if(y[i] > max)
		{
			max = y[i];
			max_ind = i;
		}
	}/**/

	// record the estimated frequency
    *freq_est_coarse = (float)((x[max_ind]-FN/2+1)*freq_resolution);



	// perform the fine grain search around the histogram center frequency
	histogram_center_index = (histogram_center_frequency/freq_resolution) + FN/2 - 1.0;
	dft(histogram_center_index,							// ??? Why is this needed? The next statement doesn't use it and overwrites it.
		input_buf_r,input_buf_i,FFT_INPUT_LENGTH,FN,
		&hcf_y);
	dft_search(histogram_center_index,
				input_buf_r,input_buf_i,FFT_INPUT_LENGTH,FN,
				&hcf_y,&hcf_x);

	if(mode == FE_TRACK)
		*freq_est = (float)((hcf_x-FN/2+1)*freq_resolution);
	else
		*freq_est = *freq_est_coarse;

}



/*******
 * FUNCTION	:	frequency_estimator()
 * DESCRIPTION :	This is the top-level function for frequency_estimator.c. It accepts as input the received training
 *					sequences, the training sequence templates, and timing and channel estimates. It outputs a final
 *					frequency estimate. The timing and channel estimates are used to produce estimated training
 *					sequence templates based on the templates provided. The four most recent training sequences are stored.
 * ARGUMENTS :
 *			r_r			:	real part of the received primary training sequence
 *			r_i			:	imaginary part of the received primaty training sequence
 *			r2_r		:	real part of the first-half of the received frequency estimation training sequence
 *			r2_i		:	imaginary part of the first-half of the received frequency estimation training sequence
 *			r3_r		:	real part of the second-half of the received frequency estimation training sequence
 *			r3_i		:	imaginary part of the second-half of the received frequency estimation training sequence
 *			p0_r		:	real part of the transmitter-0 primary training sequence template
 *			p0_i		:	imaginary part of the transmitter-0 primary training sequence template
 *			p1_r		:	real part of the transmitter-1 primary training sequence template
 *			p1_i		:	imaginary part of the transmitter-1 primary training sequence template
 *			fe_p0_r		:	real part of the transmitter-0 frequency estimation training sequence template
 *			fe_p0_i		:	imaginary part of the transmitter-0 frequency estimation training sequence template
 *			fe_p1_r		:	real part of the transmitter-1 frequency estimation training sequence template
 *			fe_p1_i		:	imaginary part of the transmitter-1 frequency estimation training sequence template
 *			tau_0_est	:	estimate of the transmitter-0 differential delay
 *			tau_1_est	:	estimate of the transmitter-1 differential delay
 *			h0_est_r	:	real part of the estimate of the transmitter-0 channel
 *			h0_est_i	:	imaginary part of the estimate of the transmitter-0 channel
 *			h1_est_r	:	real part of the estimate of the transmitter-1 channel
 *			h1_est_i	:	imaginary part of the estimate of the transmitter-1 channel
 *			freq		:	pointer to the final frequency estimation result.
 *			fe_mode		:	pointer to the current mode of the frequency estimator (FE_ACQUIRE, or FE_TRACK)
 *
 *
 * Copyright (c) 2005 Joseph McRae Palmer
 ********/
void frequency_estimator(float r_r[PILOT_LENGTH_4], float r_i[PILOT_LENGTH_4],
						 float *p0_r, float *p0_i, float *p1_r, float *p1_i,
						 float tau_0_est, float tau_1_est, float h0_est_r, float h0_est_i, float h1_est_r, float h1_est_i,
                         float *freq, int *fe_mode)
{
	FILE *fp_ds_in_r, *fp_ds_in_i;
	FILE *fp_ds_out_r, *fp_ds_out_i;
	FILE *fp_est, *fp_p_r, *fp_p_i;
	FILE *fp_pilot_buf_r, *fp_pilot_buf_i;
	FILE *fp_p_template_r, *fp_p_template_i;
    int		i;
    static int first_run = 1;

	float *tmp_ptr;
	double *db_tmp_ptr;

    float	freq_est_coarse;
    float	freq_est;

	int		offset;

	int		histogram_bin;
	float	histogram_bin_remainder;
	unsigned int		max2_val, max1_val, tmp_val;
	int		max2_bin, max1_bin, tmp_bin;
	static int		data_gather_cycle = 0;
	float	size_diff, delta_freq;


	// initialize the coarse frequency vector on the first call
    if(first_run){
        first_run = 0;

		// initialize the pilot buffer pointers
		pilot_buf_ptr0_r = pilot_buffer_0_r;
		pilot_buf_ptr0_i = pilot_buffer_0_i;
		pilot_buf_ptr1_r = pilot_buffer_1_r;
		pilot_buf_ptr1_i = pilot_buffer_1_i;
		pilot_buf_ptr2_r = pilot_buffer_2_r;
		pilot_buf_ptr2_i = pilot_buffer_2_i;
		pilot_buf_ptr3_r = pilot_buffer_3_r;
		pilot_buf_ptr3_i = pilot_buffer_3_i;

		pt_buf_ptr0_r = pt_buffer_0_r;
		pt_buf_ptr0_i = pt_buffer_0_i;
		pt_buf_ptr1_r = pt_buffer_1_r;
		pt_buf_ptr1_i = pt_buffer_1_i;
		pt_buf_ptr2_r = pt_buffer_2_r;
		pt_buf_ptr2_i = pt_buffer_2_i;
		pt_buf_ptr3_r = pt_buffer_3_r;
		pt_buf_ptr3_i = pt_buffer_3_i;

		pt_down_buf_ptr0_r = pt_down_buffer_0_r;
		pt_down_buf_ptr0_i = pt_down_buffer_0_i;
		pt_down_buf_ptr1_r = pt_down_buffer_1_r;
		pt_down_buf_ptr1_i = pt_down_buffer_1_i;
		pt_down_buf_ptr2_r = pt_down_buffer_2_r;
		pt_down_buf_ptr2_i = pt_down_buffer_2_i;
		pt_down_buf_ptr3_r = pt_down_buffer_3_r;
		pt_down_buf_ptr3_i = pt_down_buffer_3_i;
    }

	// update the pilot template with the estimates of the channel gains
	if(tau_1_est > tau_0_est)
	{
		offset = (int)((tau_1_est - tau_0_est)*NB_4 + 0.5);		// round to nearest sample
		for(i = 0; i < offset; i++)
		{
			p_r[i] = p0_r[i]*h0_est_r - p0_i[i]*h0_est_i;
			p_i[i] = p0_i[i]*h0_est_r + p0_r[i]*h0_est_i;
		}
		for(i = offset; i < PILOT_LENGTH_4-offset; i++)
		{
			p_r[i] = p0_r[i]*h0_est_r - p0_i[i]*h0_est_i + p1_r[i-offset]*h1_est_r - p1_i[i-offset]*h1_est_i;
			p_i[i] = p0_i[i]*h0_est_r + p0_r[i]*h0_est_i + p1_i[i-offset]*h1_est_r + p1_r[i-offset]*h1_est_i;
		}
	}
	else
	{
		offset = (int)((tau_0_est - tau_1_est)*NB_4 + 0.5);		// round to nearest sample
		for(i = 0; i < offset; i++)
		{
			p_r[i] = p1_r[i]*h1_est_r - p1_i[i]*h1_est_i;
			p_i[i] = p1_i[i]*h1_est_r + p1_r[i]*h1_est_i;
		}
		for(i = offset; i < PILOT_LENGTH_4-offset; i++)
		{
			p_r[i] = p0_r[i-offset]*h0_est_r - p0_i[i-offset]*h0_est_i + p1_r[i]*h1_est_r - p1_i[i]*h1_est_i;
			p_i[i] = p0_i[i-offset]*h0_est_r + p0_r[i-offset]*h0_est_i + p1_i[i]*h1_est_r + p1_r[i]*h1_est_i;
		}
	}

#ifdef WRITE_MSGS
		fp_est = fopen("est.txt", "wb");
		MyFwrite(&h0_est_r, sizeof(float), 1, fp_est);
		MyFwrite(&h0_est_i, sizeof(float), 1, fp_est);
		MyFwrite(&h1_est_r, sizeof(float), 1, fp_est);
		MyFwrite(&h1_est_i, sizeof(float), 1, fp_est);
		MyFwrite(&tau_0_est, sizeof(float), 1, fp_est);
		MyFwrite(&tau_1_est, sizeof(float), 1, fp_est);
		fclose(fp_est);
#endif WRITE_MSGS
#ifdef WRITE_MSGS
		fp_p_r = fopen("p0_r.txt", "wb");
		fp_p_i = fopen("p0_i.txt", "wb");
		MyFwrite(p0_r, sizeof(float), PILOT_LENGTH_4, fp_p_r);
		MyFwrite(p0_i, sizeof(float), PILOT_LENGTH_4, fp_p_i);
		fclose(fp_p_r);
		fclose(fp_p_i);

		fp_p_r = fopen("p1_r.txt", "wb");
		fp_p_i = fopen("p1_i.txt", "wb");
		MyFwrite(p1_r, sizeof(float), PILOT_LENGTH_4, fp_p_r);
		MyFwrite(p1_i, sizeof(float), PILOT_LENGTH_4, fp_p_i);
		fclose(fp_p_r);
		fclose(fp_p_i);
#endif WRITE_MSGS
	// load the current pilot signals into the third buffers
	memcpy(pilot_buf_ptr3_r,r_r,sizeof(float)*PILOT_LENGTH_4);
	memcpy(pilot_buf_ptr3_i,r_i,sizeof(float)*PILOT_LENGTH_4);

#ifdef WRITE_MSGS
	fp_p_template_r = fopen("p_template_r.txt", "wb");
	fp_p_template_i = fopen("p_template_i.txt", "wb");
	MyFwrite(p_r, sizeof(float), PILOT_LENGTH_4, fp_p_template_r);
	MyFwrite(p_i, sizeof(float), PILOT_LENGTH_4, fp_p_template_i);
	fclose(fp_p_template_r);
	fclose(fp_p_template_i);
#endif WRITE_MSGS

	/////////////////////////////////////////////////////////////////////////////////////////
	// compute and store the pilot-template vector product
	for(i=0; i<PILOT_LENGTH_4; i++)
	{
		if(i < 4 || i >= PILOT_LENGTH_4-7)
		{
			pilot_buf_ptr3_r[i] = 0.0;
			pilot_buf_ptr3_i[i] = 0.0;
			pilot_buf_ptr2_r[i] = 0.0;
			pilot_buf_ptr2_i[i] = 0.0;
			pilot_buf_ptr1_r[i] = 0.0;
			pilot_buf_ptr1_i[i] = 0.0;
			pilot_buf_ptr0_r[i] = 0.0;
			pilot_buf_ptr0_i[i] = 0.0;
			pt_buf_ptr3_r[i] = 0.0;
			pt_buf_ptr3_i[i] = 0.0;
			pt_buf_ptr2_r[i] = 0.0;
			pt_buf_ptr2_i[i] = 0.0;
			pt_buf_ptr1_r[i] = 0.0;
			pt_buf_ptr1_i[i] = 0.0;
			pt_buf_ptr0_r[i] = 0.0;
			pt_buf_ptr0_i[i] = 0.0;
		}
		else
		{
			complex_mult_double(
				pilot_buf_ptr3_r[i],pilot_buf_ptr3_i[i],
				p_r[i],-p_i[i],
				&pt_buf_ptr3_r[i],&pt_buf_ptr3_i[i]);
			// printf("%8.8f, %8.8f, %8.8f, %8.8f, %8.8lf, %8.8lf\n", pilot_buf_ptr3_r[i], pilot_buf_ptr3_i[i], p_r[i], p_i[i], pt_buf_ptr3_r[i], pt_buf_ptr3_i[i]);
			complex_mult_double(
				pilot_buf_ptr2_r[i],pilot_buf_ptr2_i[i],
				p_r[i],-p_i[i],
				&pt_buf_ptr2_r[i],&pt_buf_ptr2_i[i]);
			complex_mult_double(
				pilot_buf_ptr1_r[i],pilot_buf_ptr1_i[i],
				p_r[i],-p_i[i],
				&pt_buf_ptr1_r[i],&pt_buf_ptr1_i[i]);
			complex_mult_double(
				pilot_buf_ptr0_r[i],pilot_buf_ptr0_i[i],
				p_r[i],-p_i[i],
				&pt_buf_ptr0_r[i],&pt_buf_ptr0_i[i]);
		}
	}

#ifdef WRITE_MSGS
	char FileName[40];		// wait till first and last are zeroed
	sprintf(FileName, "pilot_buf_%d_r.txt", (int)freq_off);
	fp_pilot_buf_r = fopen(FileName, "a");
	sprintf(FileName, "pilot_buf_%d_i.txt", (int)freq_off);
	fp_pilot_buf_i = fopen(FileName, "a");
	MyFwrite(pilot_buf_ptr0_r, sizeof(float), PILOT_LENGTH_4, fp_pilot_buf_r);
	MyFwrite(pilot_buf_ptr0_i, sizeof(float), PILOT_LENGTH_4, fp_pilot_buf_i);
	MyFwrite(pilot_buf_ptr1_r, sizeof(float), PILOT_LENGTH_4, fp_pilot_buf_r);
	MyFwrite(pilot_buf_ptr1_i, sizeof(float), PILOT_LENGTH_4, fp_pilot_buf_i);
	MyFwrite(pilot_buf_ptr2_r, sizeof(float), PILOT_LENGTH_4, fp_pilot_buf_r);
	MyFwrite(pilot_buf_ptr2_i, sizeof(float), PILOT_LENGTH_4, fp_pilot_buf_i);
	MyFwrite(pilot_buf_ptr3_r, sizeof(float), PILOT_LENGTH_4, fp_pilot_buf_r);
	MyFwrite(pilot_buf_ptr3_i, sizeof(float), PILOT_LENGTH_4, fp_pilot_buf_i);
	fclose(fp_pilot_buf_r);
	fclose(fp_pilot_buf_i);
#endif WRITE_MSGS

	// downsample the pilot-template vector product
#ifdef WRITE_MSGS
		fp_ds_in_r = fopen("ds_in_0r.txt", "a");
		fp_ds_in_i = fopen("ds_in_0i.txt", "a");
		MyFwrite(pt_buf_ptr0_r, sizeof(double), PILOT_LENGTH_4, fp_ds_in_r);
		MyFwrite(pt_buf_ptr0_i, sizeof(double), PILOT_LENGTH_4, fp_ds_in_i);
		fclose(fp_ds_in_r);
		fclose(fp_ds_in_i);
		fp_ds_in_r = fopen("ds_in_1r.txt", "a");
		fp_ds_in_i = fopen("ds_in_1i.txt", "a");
		MyFwrite(pt_buf_ptr1_r, sizeof(double), PILOT_LENGTH_4, fp_ds_in_r);
		MyFwrite(pt_buf_ptr1_i, sizeof(double), PILOT_LENGTH_4, fp_ds_in_i);
		fclose(fp_ds_in_r);
		fclose(fp_ds_in_i);
		fp_ds_in_r = fopen("ds_in_2r.txt", "a");
		fp_ds_in_i = fopen("ds_in_2i.txt", "a");
		MyFwrite(pt_buf_ptr2_r, sizeof(double), PILOT_LENGTH_4, fp_ds_in_r);
		MyFwrite(pt_buf_ptr2_i, sizeof(double), PILOT_LENGTH_4, fp_ds_in_i);
		fclose(fp_ds_in_r);
		fclose(fp_ds_in_i);
		fp_ds_in_r = fopen("ds_in_3r.txt", "a");
		fp_ds_in_i = fopen("ds_in_3i.txt", "a");
		MyFwrite(pt_buf_ptr3_r, sizeof(double), PILOT_LENGTH_4, fp_ds_in_r);
		MyFwrite(pt_buf_ptr3_i, sizeof(double), PILOT_LENGTH_4, fp_ds_in_i);
		fclose(fp_ds_in_r);
		fclose(fp_ds_in_i);
#endif WRITE_MSGS

	DECIMATE(pt_buf_ptr3_r, PILOT_LENGTH_4, 0, pt_down_buf_ptr3_r);
	DECIMATE(pt_buf_ptr3_i, PILOT_LENGTH_4, 0, pt_down_buf_ptr3_i);
	DECIMATE(pt_buf_ptr2_r, PILOT_LENGTH_4, 0, pt_down_buf_ptr2_r);
	DECIMATE(pt_buf_ptr2_i, PILOT_LENGTH_4, 0, pt_down_buf_ptr2_i);
	DECIMATE(pt_buf_ptr1_r, PILOT_LENGTH_4, 0, pt_down_buf_ptr1_r);
	DECIMATE(pt_buf_ptr1_i, PILOT_LENGTH_4, 0, pt_down_buf_ptr1_i);
	DECIMATE(pt_buf_ptr0_r, PILOT_LENGTH_4, 0, pt_down_buf_ptr0_r);
	DECIMATE(pt_buf_ptr0_i, PILOT_LENGTH_4, 0, pt_down_buf_ptr0_i);
#ifdef WRITE_MSGS
		fp_ds_out_r = fopen("ds_out_0_r.txt", "a");
		fp_ds_out_i = fopen("ds_out_0_i.txt", "a");
		MyFwrite(pt_down_buf_ptr0_r, sizeof(double), PILOT_LENGTH_4 / R, fp_ds_out_r);
		MyFwrite(pt_down_buf_ptr0_i, sizeof(double), PILOT_LENGTH_4 / R, fp_ds_out_i);
		fclose(fp_ds_out_r);
		fclose(fp_ds_out_i);
		fp_ds_out_r = fopen("ds_out_1_r.txt", "a");
		fp_ds_out_i = fopen("ds_out_1_i.txt", "a");
		MyFwrite(pt_down_buf_ptr1_r, sizeof(double), PILOT_LENGTH_4 / R, fp_ds_out_r);
		MyFwrite(pt_down_buf_ptr1_i, sizeof(double), PILOT_LENGTH_4 / R, fp_ds_out_i);
		fclose(fp_ds_out_r);
		fclose(fp_ds_out_i);
		fp_ds_out_r = fopen("ds_out_2_r.txt", "a");
		fp_ds_out_i = fopen("ds_out_2_i.txt", "a");
		MyFwrite(pt_down_buf_ptr2_r, sizeof(double), PILOT_LENGTH_4 / R, fp_ds_out_r);
		MyFwrite(pt_down_buf_ptr2_i, sizeof(double), PILOT_LENGTH_4 / R, fp_ds_out_i);
		fclose(fp_ds_out_r);
		fclose(fp_ds_out_i);

		fp_ds_out_r = fopen("ds_out_3_r.txt", "a");
		fp_ds_out_i = fopen("ds_out_3_i.txt", "a");
		MyFwrite(pt_down_buf_ptr3_r, sizeof(double), PILOT_LENGTH_4 / R, fp_ds_out_r);
		MyFwrite(pt_down_buf_ptr3_i, sizeof(double), PILOT_LENGTH_4 / R, fp_ds_out_i);
		fclose(fp_ds_out_r);
		fclose(fp_ds_out_i);
#endif WRITE_MSGS
//		printf("PtDownBufPtrR3 = %f, %f, %f, %f, %f, %f, %f, %f\n", pt_down_buf_ptr3_r[0], pt_down_buf_ptr3_r[1],
//			pt_down_buf_ptr3_r[2], pt_down_buf_ptr3_r[3], pt_down_buf_ptr3_r[4], pt_down_buf_ptr3_r[5], pt_down_buf_ptr3_r[6], pt_down_buf_ptr3_r[7]);
//		printf("PtDownBufPtrI3 = %f, %f, %f, %f, %f, %f, %f, %f\n", pt_down_buf_ptr3_i[0], pt_down_buf_ptr3_i[1],
//			pt_down_buf_ptr3_i[2], pt_down_buf_ptr3_i[3], pt_down_buf_ptr3_i[4], pt_down_buf_ptr3_i[5], pt_down_buf_ptr3_i[6], pt_down_buf_ptr3_i[7]);
	/////////////////////////////////////////////////////////////////////////////////////////

	// perform the frequency estimate
	estimate_freq(&freq_est_coarse, &freq_est);

	// update the histogram
	delta_freq = (freq_est_coarse - histogram_center_frequency);
	if(delta_freq > 0)
		histogram_bin = ((int)(delta_freq/FREQ_AMBIGUITY + 0.5)) + 6;
	else
		histogram_bin = ((int)(delta_freq/FREQ_AMBIGUITY - 0.5)) + 6;
	histogram_bin_remainder = freq_est_coarse - (histogram_bin-6)*FREQ_AMBIGUITY - histogram_center_frequency;

	// If outside the histogram storage range, reset the histogram, set center bin to the
	// current frequency estimate.
	// Otherwise, increment the histogram bin corresponding to the current frequency estimate,
	// and shift the center frequency to account for frequency drift
	if(histogram_bin < 0 || histogram_bin > 12)
	{
		for(i=0; i<13; i++)
		{
			histogram[i] = 0;
		}
		mode = FE_ACQUIRE;
		histogram_center_frequency = freq_est_coarse;
		data_gather_cycle = 0;
		histogram[6]++;
	}
	else
	{
		histogram[histogram_bin]++;		// FZ Note, histBinRem = fec-(bin-6)*amb - hcf, so hcf += histBinRem reduces to hcf += fec-(bin-6)*amb
		histogram_center_frequency += histogram_bin_remainder;
	}

	// After 100 frequency estimates have been stored in the histogram,
	// evaluate the result, and update the operation mode if necessary.
	if(data_gather_cycle++ >= 100)
	{
		data_gather_cycle = 0;

		// find the two maximum histogram bins
		max2_val = 0;
		max2_bin = 0;
		max1_val = 0;
		max1_bin = 0;
		for(i=0; i<13; i++)
		{
			if(histogram[i] > max2_val)
			{
				tmp_val = max2_val;
				tmp_bin = max2_bin;
				max2_val = histogram[i];
				max2_bin = i;
				max1_val = tmp_val;
				max1_bin = tmp_bin;
			}
			else if(histogram[i] > max1_val)
			{
				max1_val = histogram[i];
				max1_bin = i;
			}
		}

		// clear histogram
		for(i=0; i<13; i++)
		{
			histogram[i] = 0;
		}

		// Check if max histogram bin is high enough relative to the next highest.
		// Note that the threshold for moving from FE_ACQUIRE to FE_TRACK is lower
		// than going the other direction.
		if(FE_ACQUIRE)
			size_diff = (0.75f*(float)max2_val - (float)max1_val);
		else
			size_diff = (0.9f*(float)max2_val - (float)max1_val);
		if( size_diff > 0.0f)
		{
			mode = FE_TRACK;
		}
		else
		{
			mode = FE_ACQUIRE;
		}
		// move the histogram center frequency to the frequency corresponding to the greatest bin
		histogram_center_frequency = (max2_bin-6)*FREQ_AMBIGUITY + histogram_center_frequency;
	}

	*fe_mode = mode;
	if(mode == FE_ACQUIRE)
		*freq = freq_est_coarse;
	else
		*freq = freq_est;

	// rotate the pointers for the next time (the oldest pilot
	// signal will be overwritten with the next pilot signal)
	tmp_ptr = pilot_buf_ptr0_r;
	pilot_buf_ptr0_r = pilot_buf_ptr1_r;
	pilot_buf_ptr1_r = pilot_buf_ptr2_r;
	pilot_buf_ptr2_r = pilot_buf_ptr3_r;
	pilot_buf_ptr3_r = tmp_ptr;

	tmp_ptr = pilot_buf_ptr0_i;
	pilot_buf_ptr0_i = pilot_buf_ptr1_i;
	pilot_buf_ptr1_i = pilot_buf_ptr2_i;
	pilot_buf_ptr2_i = pilot_buf_ptr3_i;
	pilot_buf_ptr3_i = tmp_ptr;

	db_tmp_ptr = pt_buf_ptr0_r;
	pt_buf_ptr0_r = pt_buf_ptr1_r;
	pt_buf_ptr1_r = pt_buf_ptr2_r;
	pt_buf_ptr2_r = pt_buf_ptr3_r;
	pt_buf_ptr3_r = db_tmp_ptr;

	db_tmp_ptr = pt_buf_ptr0_i;
	pt_buf_ptr0_i = pt_buf_ptr1_i;
	pt_buf_ptr1_i = pt_buf_ptr2_i;
	pt_buf_ptr2_i = pt_buf_ptr3_i;
	pt_buf_ptr3_i = db_tmp_ptr;

	db_tmp_ptr = pt_down_buf_ptr0_r;
	pt_down_buf_ptr0_r = pt_down_buf_ptr1_r;
	pt_down_buf_ptr1_r = pt_down_buf_ptr2_r;
	pt_down_buf_ptr2_r = pt_down_buf_ptr3_r;
	pt_down_buf_ptr3_r = db_tmp_ptr;

	db_tmp_ptr = pt_down_buf_ptr0_i;
	pt_down_buf_ptr0_i = pt_down_buf_ptr1_i;
	pt_down_buf_ptr1_i = pt_down_buf_ptr2_i;
	pt_down_buf_ptr2_i = pt_down_buf_ptr3_i;
	pt_down_buf_ptr3_i = db_tmp_ptr;
}
