/*
 * This file contains the code to perform the timing estimation and the channel
 * estimation on the received STC encoded signal (at 4 samples/bit)
 *
 * Copyright (c) 2005 Joseph McRae Palmer
 */


/*
 *	NOTES
 *
 *	resolve the sign issue with the timing estimates
 *
 *	make sure the magnitudes of the channel estimates are exactly correct
 *
 *	make sure that the alignment is right (that the timing estimate is
 *	computed correctly given the index of the minimum)
 *
 *	look for any places where efficiency can be improved
 *
 */




#include <stdio.h>
#include <math.h>
#include "defines.h"
#include "complex_math.h"

#include "estimation_templates.h"		// contains the signal templates

#ifndef INF
    #define INF 1e9
#endif

/*#ifndef PILOT_LENGTH_4
    #define PILOT_LENGTH_4 256
#endif*/

#define	BIG				1
#define	SMALL			0
#define	NUM_ITER		64
#define	SAMPS_BIT_OVER	32


////////////////////////////////
// global data
#define	NUM_SEARCHES	65

float	**SS_inv_LUT_r[NUM_SEARCHES];
float	**SS_inv_LUT_i[NUM_SEARCHES];
float	*ss_inv_lut_mem_r[NUM_SEARCHES*NUM_SEARCHES];
float	*ss_inv_lut_mem_i[NUM_SEARCHES*NUM_SEARCHES];
float	ss_inv_mem_r[NUM_SEARCHES*NUM_SEARCHES*4];
float	ss_inv_mem_i[NUM_SEARCHES*NUM_SEARCHES*4];

FILE *fp_sinv_lut_r, *fp_sinv_lut_i;
FILE *fp_s0_lut_r, *fp_s0_lut_i;
FILE *fp_s1_lut_r, *fp_s1_lut_i;

extern openError;

////////////////////////////////
// function definitions
void timing_estimate(float x_r[PILOT_HALF_LENGTH_4], float x_i[PILOT_HALF_LENGTH_4],
                    float sig_0_r[527], float sig_0_i[527],
                    float sig_1_r[527], float sig_1_i[527],
                    float *tau_est0, float *tau_est1, int *tau0_est_ndx, int *tau1_est_ndx);
void channel_estimate(float x_r[PILOT_HALF_LENGTH_4], float x_i[PILOT_HALF_LENGTH_4],
                      float sig_0_r[527], float sig_0_i[527],
                      float sig_1_r[527], float sig_1_i[527],
                      float *h0_est_r, float *h0_est_i,
                      float *h1_est_r, float *h1_est_i,
					  int tau_est0_ndx, int tau_est1_ndx);
float compute_metric(float *s0_r, float *s0_i, float *s1_r, float *s1_i,
					 float *x_r, float *x_i, int x_ndx, int y_ndx);
void InitInverseLUT(float *sig_0_r, float *sig_0_i, float *sig_1_r, float *sig_1_i);
int simplex_max(float *simplex, float *max_val);
int simplex_min(float *simplex, float *min_val);
int convert2ternary(int val);
void TinySimplexLUT(int x_1, int x_2, int y_1, int y_2, int max_index, int *newpoint, int * xx, int * yy);
void MyFwrite(void const* _Buffer, size_t _ElementSize, size_t _ElementCount, FILE* _Stream);

/*
 *	Function
 *
 *		Trellis_detector()
 *
 *	Description
 *
 *		Trellis_detector() is the wrapper for the detector.  It calls the appropriate setup routine (depending
 *		on whether delta_tau is positive or negative) and then loops over blocks of 4 samples, calling
 *		Detect_block() to detect each block of 4 bits.
 *
 *
 *	Inputs
 *
 *		float *s_in0_r			- pointer to input signal for channel 0
 *		float *s_in0_i			  (there must be num_in_samps samples in this array)
 *		float *s_in1_r			- pointer to input signal for channel 1
 *		float *s_in1_i			  (there must be num_in_samps samples in this array)
 *		int *BitsOut			- array for the output bits
 *		int num_out_bits		- number of bits to be detected
 *		float delta_tau			- differential delay which equals tau_1 - tau_0, should be between -1.0 and +1.0,
 *								  positive means channel 1 delayed more than channel 0)
 *								  NOTE: currently delta_tau gets quantized to the nearest quarter of a bit time
 *		float h0_r				- complex channel gain on channel 0
 *		float h0_i
 *		float h1_r				- complex chanenl gain on channel 1
 *		float h1_i
 *
 *	Outputs
 *
 *		The function returns 0 on success
 *
 *	Side Effects
 *
 *
 */
int Timing_channel_estimator(float *s_r, float *s_i, float *tau_est0, float *tau_est1,
							 float *h0_est_r, float *h0_est_i, float *h1_est_r, float *h1_est_i)
{
	int tau0_est_ndx;
	int tau1_est_ndx;
	float	h0_mag;
	float	h1_mag;

	// first estimate the timing delays
	timing_estimate(s_r, s_i, sig_0_r, sig_0_i, sig_1_r, sig_1_i, tau_est0, tau_est1, &tau0_est_ndx, &tau1_est_ndx);

	// then estimate the channel gains using the timing delays
	channel_estimate(s_r, s_i, sig_0_r, sig_0_i, sig_1_r, sig_1_i, h0_est_r, h0_est_i, h1_est_r, h1_est_i,
					 tau0_est_ndx, tau1_est_ndx);
/* TODO */
	// if one of the channels is not present, then set the delay for that channel to 0 (because we
	// couldn't get a good estimate of the delay for that channel and the algorithm might have returned
	// anything, which could mess up the trellis detector later on)
	h0_mag = *h0_est_r * *h0_est_r + *h0_est_i * *h0_est_i;
	h1_mag = *h1_est_r * *h1_est_r + *h1_est_i * *h1_est_i;

	if(h0_mag < h1_mag/4)
		*tau_est0 = 0.0f;
	if(h1_mag < h0_mag/4)
		*tau_est1 = 0.0f;

	// done
	return(0);
}


/*
 *	Function
 *
 *		timing_estimate() performs a simplex search over the 2D surface of the metric that is
 *		to be minimized (to find the values of tau0 and tau1).
 *
 *		Note that conceptually tau0 is the x axis and tau1 is the y axis of the surface.
 */
void timing_estimate(float x_r[PILOT_HALF_LENGTH_4], float x_i[PILOT_HALF_LENGTH_4],
                    float sig_0_r[527], float sig_0_i[527],
                    float sig_1_r[527], float sig_1_i[527],
                    float *tau_est0, float *tau_est1, int *tau0_est_ndx, int *tau1_est_ndx)
{
	int		i,j,k;
	int		simplex_size;
	int n,nn;
	float metric_tmp;
	float	f_min;
	float	f_max;
	float	f_new;
	int	min_index;
	int     int_index;
	int	newpoint_index;
	int	newpoint[2];
	int	psum[2];
	int	xx[3];
	int	yy[3];
	int     x_1, x_2, y_1, y_2;
	float	yl;
	float	yr;
	float	simplex[3];
	float	tau0_est_ndxi;
	float	tau1_est_ndxi;
	static int	FirstCall = 1;
	FILE * fp_bowl;
	FILE * fp_xx_yy;

	float FZ_Matrix[65];

	if(FirstCall)
	// on the first call, initialize the LUT for the matrix inverses (inv(S'*S))
	{
		FirstCall = 0;

		InitInverseLUT(sig_0_r,sig_0_i,sig_1_r,sig_1_i);		// sets up the global LUT for inv(S'*S)

#ifdef WRITE_MSGS
			fp_sinv_lut_r = fopen("sinv_lut_r.txt", "wb");
			fp_sinv_lut_i = fopen("sinv_lut_i.txt", "wb");
			fp_s0_lut_r = fopen("s0_lut_r.txt", "wb");
			fp_s0_lut_i = fopen("s0_lut_i.txt", "wb");
			fp_s1_lut_r = fopen("s1_lut_r.txt", "wb");
			fp_s1_lut_i = fopen("s1_lut_i.txt", "wb");
			MyFwrite(sig_0_r, sizeof(float), EST_TEMPLATE_LENGTH, fp_s0_lut_r);
			MyFwrite(sig_0_i, sizeof(float), EST_TEMPLATE_LENGTH, fp_s0_lut_i);
			MyFwrite(sig_1_r, sizeof(float), EST_TEMPLATE_LENGTH, fp_s1_lut_r);
			MyFwrite(sig_1_i, sizeof(float), EST_TEMPLATE_LENGTH, fp_s1_lut_i);

		FILE * fp_Matrix;
		fp_Matrix = fopen("Matrix.txt", "wb");
		for (i = 0; i < NUM_SEARCHES; i++)
{
	for (j = 0; j < NUM_SEARCHES; j++)
	{
		FZ_Matrix[j] = compute_metric(sig_0_r, sig_0_i, sig_1_r, sig_1_i, x_r, x_i, i, j);
	}
	MyFwrite(FZ_Matrix, sizeof(float), 65, fp_Matrix);
}
		fclose(fp_Matrix);
/
					MyFwrite(SS_inv_LUT_r[i][j], sizeof(float), 4, fp_sinv_lut_r);
					MyFwrite(SS_inv_LUT_i[i][j], sizeof(float), 4, fp_sinv_lut_i);
				}
			}
			fclose(fp_sinv_lut_r);
			fclose(fp_sinv_lut_i);
			fclose(fp_s0_lut_r);
			fclose(fp_s0_lut_i);
			fclose(fp_s1_lut_r);
			fclose(fp_s1_lut_i);
#endif WRITE_MSGS

	}

	// initialize things
	simplex_size = BIG;

	xx[0] = SEARCH_MID_PT;			// these are the initial coordinates of the simplex
	xx[1] = SEARCH_MID_PT;
	xx[2] = SEARCH_MID_PT + 3;
	yy[0] = SEARCH_MID_PT;
	yy[1] = SEARCH_MID_PT + 1;
	yy[2] = SEARCH_MID_PT + 2;

	psum[0] = xx[0] + xx[1] + xx[2];
	psum[1] = yy[0] + yy[1] + yy[2];

//#ifdef WRITE_MSGS
	FILE *fp_r, *fp_i;
	openError = fopen_s(&fp_r, "TimeEstXr.txt", "wb");
	openError = fopen_s(&fp_i, "TimeEstXi.txt", "wb");
	MyFwrite(x_r, sizeof(float), PILOT_HALF_LENGTH_4, fp_r);
	MyFwrite(x_i, sizeof(float), PILOT_HALF_LENGTH_4, fp_i);
	fclose(fp_r);
	fclose(fp_i);
//#endif WRITE_MSGS

	// get the initial three points in the simplex
	simplex[0] = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i, xx[0], yy[0]);
	simplex[1] = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i, xx[1], yy[1]);
	simplex[2] = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i, xx[2], yy[2]);

	// find the min and max points in the simplex
	min_index = simplex_min(simplex,&f_min);
	newpoint_index = simplex_max(simplex,&f_max);

	newpoint[0] = psum[0] - 2*xx[newpoint_index];
	newpoint[1] = psum[1] - 2*yy[newpoint_index];
	//printf("\nNewpoint0=%d, Newpoint1=%d, Did initial three\n", newpoint[0], newpoint[1]);
	// now we are ready to proceed with the simplex search for the minimum of the metric surface
	// (the routine will just run a fixed number of times and then stop)
	for(i = 0; i < NUM_ITER-1; i++)		// (the first iteration was done above)
	{
		// check for new point out of bounds (if it is then just stop the iteration)
		if(newpoint[0] >= NUM_SEARCHES || newpoint[1] >= NUM_SEARCHES)
			break;
		if(newpoint[0] < 0 || newpoint[1] < 0)
			break;
		// compute the metric for the next point in the simplex
		f_new = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i,newpoint[0],newpoint[1]);

		// update the simplex
		simplex[newpoint_index] = f_new;
		xx[newpoint_index] = newpoint[0];
		yy[newpoint_index] = newpoint[1];

		psum[0] = xx[0] + xx[1] + xx[2];
		psum[1] = yy[0] + yy[1] + yy[2];

		if(f_new < f_min)
		{
			f_min = f_new;
			min_index = newpoint_index;
			newpoint_index = simplex_max(simplex,&f_max);
			if(simplex_size == BIG)
			{
				newpoint[0] = psum[0] - 2*xx[newpoint_index];
				newpoint[1] = psum[1] - 2*yy[newpoint_index];
			//	printf("Newpoint0=%d, Newpopoint1=%d, Minus 2 BIG\n", newpoint[0], newpoint[1]);
			}
			else
			{
				newpoint[0] = 2*psum[0] - 5*xx[newpoint_index];
				newpoint[1] = 2*psum[1] - 5*yy[newpoint_index];
			//	printf("Newpoint0=%d, Newpopoint1=%d, Minus 5 Small\n", newpoint[0], newpoint[1]);

				simplex_size = BIG;
			}
		}
		else
		{
			if(simplex_size == BIG)
			{
				newpoint[0] = (int)floor((float)psum[0]/3.0f);
				newpoint[1] = (int)floor((float)psum[1]/3.0f);
				simplex_size = SMALL;
			//	printf("Newpoint0=%d, Newpopoint1=%d, DivBy3\n", newpoint[0], newpoint[1]);
			}
			else
			{
			    newpoint_index = simplex_max(simplex,&f_max);
				if(f_new == f_max){
				  // Change modes, finish search with
				  // a smaller triangle to get exact minimum

				  //Calculate three new points based
				  //on previous minimum
				  min_index = simplex_min(simplex,&f_min);
				  xx[0] = xx[min_index];
				  yy[0] = yy[min_index];
				  simplex[0] = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i, xx[0], yy[0]);
				  xx[1] = xx[0] + 1;
				  yy[1] = yy[0] + 0;
				  simplex[1] = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i, xx[1], yy[1]);
				  xx[2] = xx[0] + 0;
				  yy[2] = yy[0] + 1;
				  simplex[2] = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i, xx[2], yy[2]);

				  //Finish the rest of the iterations
				  //with the smaller triangle
				  while(i < 64){
				    min_index = simplex_min(simplex,&f_min);
				    newpoint_index = simplex_max(simplex,&f_max);

				    // Calculate intermediate Index
				    if (min_index == 0)
				      if (newpoint_index == 1)
						int_index = 2;
				      else
						int_index = 1;
				    else if (min_index == 1)
				      if (newpoint_index == 0)
					int_index = 2;
				      else
					int_index = 0;
				    else
				      if (newpoint_index == 0)
					int_index = 1;
				      else
					int_index = 0;
				    //If the smaller triangle gets
				    //stuck, flip him over by the
				    //intermediate value rather than
				    //the max(newpoint) value
				    if(f_new == f_max){
				      //Subtract points from pivot vertex
				      x_1 = xx[int_index] - xx[min_index];
				      y_1 = yy[int_index] - yy[min_index];
				      x_2 = xx[int_index] - xx[newpoint_index];
				      y_2 = yy[int_index] - yy[newpoint_index];
				      newpoint_index = int_index;
				    }
				    else{
				      //Subtract points from pivot vertex
				      x_1 = xx[newpoint_index] - xx[min_index];
				      y_1 = yy[newpoint_index] - yy[min_index];
				      x_2 = xx[newpoint_index] - xx[int_index];
				      y_2 = yy[newpoint_index] - yy[int_index];
				    }
				    //Determine if the results were
				    //zero=0,pos=1,neg=2
				    x_1 = convert2ternary(x_1);
				    x_2 = convert2ternary(x_2);
				    y_1 = convert2ternary(y_1);
				    y_2 = convert2ternary(y_2);

				    //Use a LUT to determine what
				    //position and case that the
				    //triangle is in to figure out
				    //where to move next
				    TinySimplexLUT(x_1, x_2, y_1, y_2, newpoint_index, newpoint, xx, yy);

				    // Check boundaries
				    if(newpoint[0] >= NUM_SEARCHES || newpoint[1] >= NUM_SEARCHES)
				      break;
				    if(newpoint[0] < 0 || newpoint[1] < 0)
				      break;
				//	printf("WhileLT64 => min_index=%d, newpoint_index=%d, int_index=%d, xx(NwPtNdx)=%d, yy(NwPtNdx)=%d, FNew=%2.6f, FMax=%2.6f\n",
				//		min_index, newpoint_index, int_index, xx[newpoint_index], yy[newpoint_index], f_new, f_max);
				//	printf("x1=%d, x2=%d, y1=%d, y2=%d, new0=%d new1=%d\n",
				//		x_1, x_2, y_1, y_2, newpoint[0], newpoint[1]);
					f_new = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i,newpoint[0],newpoint[1]);
				    simplex[newpoint_index] = f_new;
				    xx[newpoint_index] = newpoint[0];
				    yy[newpoint_index] = newpoint[1];
				    i++;
				  }

				  break;
				}
				else{
				  newpoint[0] = psum[0] - 2*xx[newpoint_index];
				  newpoint[1] = psum[1] - 2*yy[newpoint_index];
				}
			}
		}
	}

	// now we are done with the search, find the min in the simplex--that gives the answer
	min_index = simplex_min(simplex,&f_min);

	*tau0_est_ndx = xx[min_index];
	*tau1_est_ndx = yy[min_index];

	// interpolate to get better accuracy on the timing estimates
	// interpolate tau0
/*	if(*tau0_est_ndx == 0 || *tau0_est_ndx == NUM_SEARCHES-1)		// if the index is on a boundary then don't interpolate
	{
		*tau_est0 = (float)(*tau0_est_ndx - SAMPS_BIT_OVER-1)/(float)SAMPS_BIT_OVER;
	}
	else
	{
		yl = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i,*tau0_est_ndx-1,*tau1_est_ndx);
		yr = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i,*tau0_est_ndx+1,*tau1_est_ndx);
		tau0_est_ndxi = 0.5f*(yl-yr)/(yr+yl-2*f_min) + *tau0_est_ndx;
//		*tau_est0 = (tau0_est_ndxi - SAMPS_BIT_OVER-1)/SAMPS_BIT_OVER;
		*tau_est0 = (tau0_est_ndxi - SAMPS_BIT_OVER)/SAMPS_BIT_OVER;
	}*/
	*tau_est0 = (float)(*tau0_est_ndx - SAMPS_BIT_OVER)/(float)SAMPS_BIT_OVER;

	// interpolate tau1
/*	if(*tau1_est_ndx == 0 || *tau1_est_ndx == NUM_SEARCHES-1)		// if the index is on a boundary then don't interpolate
	{
		*tau_est1 = (float)(*tau1_est_ndx - SAMPS_BIT_OVER-1)/(float)SAMPS_BIT_OVER;
	}
	else
	{
		yl = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i,*tau0_est_ndx,*tau1_est_ndx-1);
		yr = compute_metric(sig_0_r,sig_0_i,sig_1_r,sig_1_i,x_r,x_i,*tau0_est_ndx,*tau1_est_ndx+1);
		tau1_est_ndxi = 0.5f*(yl-yr)/(yr+yl-2*f_min) + *tau1_est_ndx;
//		*tau_est1 = (tau1_est_ndxi - SAMPS_BIT_OVER-1)/SAMPS_BIT_OVER;
		*tau_est1 = (tau1_est_ndxi - SAMPS_BIT_OVER)/SAMPS_BIT_OVER;
	}*/
	*tau_est1 = (float)(*tau1_est_ndx - SAMPS_BIT_OVER)/(float)SAMPS_BIT_OVER;

	// the result of the search is actually inverted from what it needs to be to fix that here
	*tau_est0 *= -1.0f;
	*tau_est1 *= -1.0f;
}



	/***************************************\
	*	Compute the complex channel gains   *
	\***************************************/

void channel_estimate(float x_r[PILOT_HALF_LENGTH_4], float x_i[PILOT_HALF_LENGTH_4],
                      float sig_0_r[527], float sig_0_i[527], float sig_1_r[527], float sig_1_i[527],
                      float *h0_est_r, float *h0_est_i, float *h1_est_r, float *h1_est_i,
					  int tau_est0_ndx, int tau_est1_ndx)
{
    float	S_pinv_r[2][256], S_pinv_i[2][256];
	float	*ss_inv_r;
	float	*ss_inv_i;
	float	A_r[2], A_i[2];
    float	temp0_r, temp0_i, temp1_r, temp1_i;
    float	ss0_r[PILOT_HALF_LENGTH_4], ss0_i[PILOT_HALF_LENGTH_4];
    float	ss1_r[PILOT_HALF_LENGTH_4], ss1_i[PILOT_HALF_LENGTH_4];

    int k;      // loop iterator
 /*
	int x, y, scale;
	scale = 1 << 24;
	float	*Ram;
	FILE *fp_sinv_lut;
	fp_sinv_lut = fopen("SinvLutDump.txt", "w");
	for (y = 0; y < 65; y++) {
		for (x = 0; x < 65; x++) {
			Ram = SS_inv_LUT_r[x][y];
			for (k = 0; k < 4; k++) {
				Ram[k] = round(Ram[k] *scale) / scale;
			}
			fprintf(fp_sinv_lut, "x=%d, y=%d, Ram 0 to 3 =\t%1.8f,\t%1.8f,\t%1.8f,\t%1.8f\n", x, y, Ram[0],Ram[1],Ram[2],Ram[3]);
		}
	}
	fclose(fp_sinv_lut);
*/
	// extract the template (with the desired offset)--together these form S, a PILOT_LENGTH_4x2 matrix
	for(k=0; k<PILOT_HALF_LENGTH_4; k++)
	{
        ss0_r[k] = sig_0_r[SEARCH_SKIP*k+tau_est0_ndx];
        ss0_i[k] = sig_0_i[SEARCH_SKIP*k+tau_est0_ndx];
    	ss1_r[k] = sig_1_r[SEARCH_SKIP*k+tau_est1_ndx];
    	ss1_i[k] = sig_1_i[SEARCH_SKIP*k+tau_est1_ndx];
    }

	// get the inverted matrix inv(S'*S) for s0 and s1 (this was precomputed)
	ss_inv_r = SS_inv_LUT_r[tau_est0_ndx][tau_est1_ndx];
	ss_inv_i = SS_inv_LUT_i[tau_est0_ndx][tau_est1_ndx];

	// compute inv(S'*S)*S' (the result is a 2xPILOT_LENGTH_4 matrix)
    for(k=0; k<PILOT_HALF_LENGTH_4; k++){
        complex_mult(ss_inv_r[0],ss_inv_i[0],ss0_r[k],-ss0_i[k],&temp0_r,&temp0_i);
        complex_mult(ss_inv_r[1],ss_inv_i[1],ss1_r[k],-ss1_i[k],&temp1_r,&temp1_i);
        S_pinv_r[0][k] = temp0_r + temp1_r; S_pinv_i[0][k] = temp0_i + temp1_i;

        complex_mult(ss_inv_r[2],ss_inv_i[2],ss0_r[k],-ss0_i[k],&temp0_r,&temp0_i);
        complex_mult(ss_inv_r[3],ss_inv_i[3],ss1_r[k],-ss1_i[k],&temp1_r,&temp1_i);
        S_pinv_r[1][k] = temp0_r + temp1_r; S_pinv_i[1][k] = temp0_i + temp1_i;

    }

	// compute A = inv(S'*S)*S'*x (the result is a 2x1 matrix)
    A_r[0] = 0.0f;
	A_i[0] = 0.0f;
    A_r[1] = 0.0f;
	A_i[1] = 0.0f;
    for(k=0; k<PILOT_HALF_LENGTH_4; k++){
        complex_mult(x_r[k],x_i[k],S_pinv_r[0][k],S_pinv_i[0][k],&temp0_r,&temp0_i);
        A_r[0] += temp0_r;
		A_i[0] += temp0_i;

        complex_mult(x_r[k],x_i[k],S_pinv_r[1][k],S_pinv_i[1][k],&temp1_r,&temp1_i);
        A_r[1] += temp1_r;
		A_i[1] += temp1_i;
    }

	// store the results in the output variables
	*h0_est_r = A_r[0];
	*h0_est_i = A_i[0];
	*h1_est_r = A_r[1];
	*h1_est_i = A_i[1];
}

void MyFwrite(void const* Buffer, size_t ElementSize, size_t ElementCount, FILE* Stream)
{
	int i, *IntPtr;
	double *DoublePtr;
	float *FloatPtr;

	if (ElementSize == sizeof(float))
	{
		FloatPtr = Buffer;
		for (i = 0; i < ElementCount; i++)
		{
			fprintf(Stream, "%10.10f\n", FloatPtr[i]);
		}
	}
	else if (ElementSize == sizeof(double))
	{
		DoublePtr = Buffer;
		for (i = 0; i < ElementCount; i++)
		{
			fprintf(Stream, "%10.10f\n", DoublePtr[i]);
		}
	}
	else if (ElementSize == 0)
	{
		IntPtr = Buffer;
		for (i = 0; i < ElementCount; i++)
		{
			fprintf(Stream, "%.8X\n", IntPtr[i]);
		}
	}
	else
	{
		FloatPtr = Buffer;
		for (i = 0; i < ElementCount; i++)
		{
			fprintf(Stream, "%10.10f\n", FloatPtr[i]);
		}
	}
}


/*
 *	Function
 *
 *		compute_metric() computes the metric used by the timing
 *		estimator for a single value of tau0 and tau1
 *
 *	Inputs
 *
 *		float *s0_r			: pointer to the signal 0 template (real)
 *		float *s0_i			: pointer to the signal 0 template (imag)
 *		float *s1_r			: pointer to the signal 1 template (real)
 *		float *s1_i			: pointer to the signal 1 template (imag)
 *		float *x_r			: pointer to the input data (real)
 *		float *x_i			: pointer to the input data (imag)
 *		float *Spinv_r		: pointer to the inverted matrix (real)
 *		float *Spinv_i		: pointer to the inverted matrix (imag)
 *
 *	Output
 *
 *		The computed metric is returned.
 */
float compute_metric(float *s0_r, float *s0_i, float *s1_r, float *s1_i,
	float *x_r, float *x_i, int x_ndx, int y_ndx)
{
	int		k;
	float	norm;
	float	temp0;
	float	temp0_r, temp0_i;
	float	temp1_r, temp1_i;
	float	norm_temp_r[2];
	float	norm_temp_i[2];
	float	norm_temp_long_r[PILOT_HALF_LENGTH_4];
	float	norm_temp_long_i[PILOT_HALF_LENGTH_4];
	float	S_pinv_r[2][PILOT_HALF_LENGTH_4];
	float	S_pinv_i[2][PILOT_HALF_LENGTH_4];
	float	ss0_r[PILOT_HALF_LENGTH_4];
	float	ss0_i[PILOT_HALF_LENGTH_4];
	float	ss1_r[PILOT_HALF_LENGTH_4];
	float	ss1_i[PILOT_HALF_LENGTH_4];
	float	*ss_inv_r;
	float	*ss_inv_i;

#ifdef WRITE_MSGS
		FILE * fp_ss0_r = fopen("ss0_r.txt", "wb");
		FILE * fp_ss0_i = fopen("ss0_i.txt", "wb");
		FILE * fp_ss1_r = fopen("ss1_r.txt", "wb");
		FILE * fp_ss1_i = fopen("ss1_i.txt", "wb");


		// Input to Compute_Metric
		FILE * fp_pilot_buffer_r = fopen("pilot_buffer_r.txt", "wb");
		FILE * fp_pilot_buffer_i = fopen("pilot_buffer_i.txt", "wb");

		// Output loop 1
		FILE * fp_s_pinv_0_r = fopen("s_pinv_0_r.txt", "wb");
		FILE * fp_s_pinv_0_i = fopen("s_pinv_0_i.txt", "wb");
		FILE * fp_s_pinv_1_r = fopen("s_pinv_1_r.txt", "wb");
		FILE * fp_s_pinv_1_i = fopen("s_pinv_1_i.txt", "wb");

		//Intermediate Values in Loop 2
		FILE * fp_int_mult_0_r = fopen("int_mult_0_r.txt", "wb");
		FILE * fp_int_mult_0_i = fopen("int_mult_0_i.txt", "wb");
		FILE * fp_int_mult_1_r = fopen("int_mult_1_r.txt", "wb");
		FILE * fp_int_mult_1_i = fopen("int_mult_1_i.txt", "wb");

		FILE * fp_int_sum_r = fopen("int_sum_r.txt", "wb");
		FILE * fp_int_sum_i = fopen("int_sum_i.txt", "wb");

		FILE * fp_int2_mult_0_r = fopen("int2_mult_0_r.txt", "wb");
		FILE * fp_int2_mult_0_i = fopen("int2_mult_0_i.txt", "wb");
		FILE * fp_int2_mult_1_r = fopen("int2_mult_1_r.txt", "wb");
		FILE * fp_int2_mult_1_i = fopen("int2_mult_1_i.txt", "wb");

		FILE * fp_int2_sub_r = fopen("int2_sum_r.txt", "wb");
		FILE * fp_int2_sub_i = fopen("int2_sum_i.txt", "wb");

		FILE * fp_int2_mag = fopen("int2_mag.txt", "wb");

		// Output loop 2, and loop 3
		FILE * fp_norm_temp_0_r = fopen("norm_temp_0_r.txt", "wb");
		FILE * fp_norm_temp_0_i = fopen("norm_temp_0_i.txt", "wb");
		FILE * fp_norm_temp_1_r = fopen("norm_temp_1_r.txt", "wb");
		FILE * fp_norm_temp_1_i = fopen("norm_temp_1_i.txt", "wb");
#endif WRITE_MSGS

	// extract the template (with the desired offset)--together these form S, a PILOT_LENGTH_4x2 matrix
	for(k=0; k<PILOT_HALF_LENGTH_4; k++)
	{
        ss0_r[k] = sig_0_r[SEARCH_SKIP*k+x_ndx];
        ss0_i[k] = sig_0_i[SEARCH_SKIP*k+x_ndx];
    	ss1_r[k] = sig_1_r[SEARCH_SKIP*k+y_ndx];
    	ss1_i[k] = sig_1_i[SEARCH_SKIP*k+y_ndx];
    }

	/*printf("x_ndx = %d\n", x_ndx);
	printf("y_ndx = %d\n", y_ndx); */
#ifdef WRITE_MSGS
		MyFwrite(ss0_r, sizeof(float), PILOT_HALF_LENGTH_4, fp_ss0_r);
		MyFwrite(ss0_i, sizeof(float), PILOT_HALF_LENGTH_4, fp_ss0_i);
		MyFwrite(ss1_r, sizeof(float), PILOT_HALF_LENGTH_4, fp_ss1_r);
		MyFwrite(ss1_i, sizeof(float), PILOT_HALF_LENGTH_4, fp_ss1_i);

		// Input to Compute_Metric
		MyFwrite(x_r, sizeof(float), PILOT_HALF_LENGTH_4, fp_pilot_buffer_r);
		MyFwrite(x_i, sizeof(float), PILOT_HALF_LENGTH_4, fp_pilot_buffer_i);
#endif WRITE_MSGS

	// get the inverted matrix inv(S'*S) for s0 and s1 (this was precomputed)
	ss_inv_r = SS_inv_LUT_r[x_ndx][y_ndx];
	ss_inv_i = SS_inv_LUT_i[x_ndx][y_ndx];

	// compute inv(S'*S)*S' (the result is a 2xPILOT_LENGTH_4 matrix)
    for(k=0; k<PILOT_HALF_LENGTH_4; k++){
        complex_mult(ss_inv_r[0],ss_inv_i[0],ss0_r[k],-ss0_i[k],&temp0_r,&temp0_i);
        complex_mult(ss_inv_r[1],ss_inv_i[1],ss1_r[k],-ss1_i[k],&temp1_r,&temp1_i);
        S_pinv_r[0][k] = temp0_r + temp1_r; S_pinv_i[0][k] = temp0_i + temp1_i;

        complex_mult(ss_inv_r[2],ss_inv_i[2],ss0_r[k],-ss0_i[k],&temp0_r,&temp0_i);
        complex_mult(ss_inv_r[3],ss_inv_i[3],ss1_r[k],-ss1_i[k],&temp1_r,&temp1_i);
        S_pinv_r[1][k] = temp0_r + temp1_r; S_pinv_i[1][k] = temp0_i + temp1_i;

    }

	// Output loop 1
#ifdef WRITE_MSGS
		MyFwrite(S_pinv_r[0], sizeof(float), PILOT_HALF_LENGTH_4, fp_s_pinv_0_r);
		MyFwrite(S_pinv_i[0], sizeof(float), PILOT_HALF_LENGTH_4, fp_s_pinv_0_i);
		MyFwrite(S_pinv_r[1], sizeof(float), PILOT_HALF_LENGTH_4, fp_s_pinv_1_r);
		MyFwrite(S_pinv_i[1], sizeof(float), PILOT_HALF_LENGTH_4, fp_s_pinv_1_i);
#endif WRITE_MSGS

    //compute the norm
    temp0_r = 0.0f;
	temp0_i = 0.0f;
    temp1_r = 0.0f;
	temp1_i = 0.0f;
    norm_temp_r[0] = 0.0f;
	norm_temp_i[0] = 0.0f;
    norm_temp_r[1] = 0.0f;
	norm_temp_i[1] = 0.0f;

	// compute inv(S'*S)*S'*x (the result is a 2x1 matrix)
    for(k=0; k<PILOT_HALF_LENGTH_4; k++){
        complex_mult(x_r[k],x_i[k],S_pinv_r[0][k],S_pinv_i[0][k],&temp0_r,&temp0_i);
#ifdef WRITE_MSGS
			MyFwrite(&temp0_r, sizeof(float), 1, fp_int_mult_0_r);
			MyFwrite(&temp0_i, sizeof(float), 1, fp_int_mult_0_i);
#endif WRITE_MSGS
		norm_temp_r[0] += temp0_r;
		norm_temp_i[0] += temp0_i;

		complex_mult(x_r[k],x_i[k],S_pinv_r[1][k],S_pinv_i[1][k],&temp1_r,&temp1_i);
#ifdef WRITE_MSGS
	MyFwrite(&temp1_r, sizeof(float), 1, fp_int_mult_1_r);
	MyFwrite(&temp1_i, sizeof(float), 1, fp_int_mult_1_i);
#endif WRITE_MSGS
		norm_temp_r[1] += temp1_r;
		norm_temp_i[1] += temp1_i;
#ifdef WRITE_MSGS
	MyFwrite(norm_temp_r, sizeof(float), 2, fp_int_sum_r);
	MyFwrite(norm_temp_i, sizeof(float), 2, fp_int_sum_i);
#endif WRITE_MSGS
    }

	//// Output loop 2, and loop 3
#ifdef WRITE_MSGS
		MyFwrite(norm_temp_r, sizeof(float), 2, fp_norm_temp_0_r);
		MyFwrite(norm_temp_i, sizeof(float), 2, fp_norm_temp_0_i);
#endif WRITE_MSGS
	// compute S*inv(S'*S)*S'*x (the result is a PILOT_LENGTH_4x1 vector)
    for(k=0; k<PILOT_HALF_LENGTH_4; k++){
        complex_mult(norm_temp_r[0],norm_temp_i[0],ss0_r[k],ss0_i[k],&temp0_r,&temp0_i);
#ifdef WRITE_MSGS
			MyFwrite(&temp0_r, sizeof(float), 1, fp_int2_mult_0_r);
			MyFwrite(&temp0_i, sizeof(float), 1, fp_int2_mult_0_i);
#endif WRITE_MSGS
		complex_mult(norm_temp_r[1],norm_temp_i[1],ss1_r[k],ss1_i[k],&temp1_r,&temp1_i);
#ifdef WRITE_MSGS
			MyFwrite(&temp1_r, sizeof(float), 1, fp_int2_mult_1_r);
			MyFwrite(&temp1_i, sizeof(float), 1, fp_int2_mult_1_i);
#endif WRITE_MSGS

		norm_temp_long_r[k] = temp0_r + temp1_r;
		norm_temp_long_i[k] = temp0_i + temp1_i;
    }

	// compute x - S*inv(S'*S)*S'*x (the result is a PILOT_LENGTH_4x1 vector)
    for(k=0; k<PILOT_HALF_LENGTH_4; k++){
        norm_temp_long_r[k] = x_r[k] - norm_temp_long_r[k];
        norm_temp_long_i[k] = x_i[k] - norm_temp_long_i[k];
    }
	//MyFwrite(norm_temp_long_r,sizeof(float), PILOT_HALF_LENGTH_4, fp_int2_sub_r);
	//MyFwrite(norm_temp_long_i,sizeof(float), PILOT_HALF_LENGTH_4, fp_int2_sub_i);

	// compute the Frobenius norm of the vector (the sum of the squares)
    norm = 0.0f;
    for(k=0; k<PILOT_HALF_LENGTH_4; k++){
        complex_abs2(norm_temp_long_r[k],norm_temp_long_i[k],&temp0);
        norm += temp0;
    }
	/*
	printf("x=%d, y=%d, norm=%f, [%f + %fi, %f + %fi, \n\t\t%f + %fi, %f + %fi]\n",x_ndx,y_ndx,norm,256*ss_inv_r[0],256*ss_inv_i[0]
																			   ,256*ss_inv_r[1],256*ss_inv_i[1]
																			   ,256*ss_inv_r[2],256*ss_inv_i[2]
																			   ,256*ss_inv_r[3],256*ss_inv_i[3]);

    */
	// Output loop 2, and loop 3
#ifdef WRITE_MSGS
		MyFwrite(&norm, sizeof(float), 1, fp_norm_temp_0_r);
		MyFwrite(&norm, sizeof(float), 1, fp_norm_temp_0_i);

		fclose(fp_ss0_r);
		fclose(fp_ss0_i);
		fclose(fp_ss1_r);
		fclose(fp_ss1_i);

		// Input to Compute_Metric
		fclose(fp_pilot_buffer_r);
		fclose(fp_pilot_buffer_i);

		// Output loop 1
		fclose(fp_s_pinv_0_r);
		fclose(fp_s_pinv_0_i);
		fclose(fp_s_pinv_1_r);
		fclose(fp_s_pinv_1_i);

		//Intermediate Values in Loop 2
		fclose(fp_int_mult_0_r);
		fclose(fp_int_mult_0_i);
		fclose(fp_int_mult_1_r);
		fclose(fp_int_mult_1_i);

		fclose(fp_int_sum_r);
		fclose(fp_int_sum_i);

		// Intermediate Values in Loop 3
		fclose(fp_int2_mult_0_r);
		fclose(fp_int2_mult_0_i);
		fclose(fp_int2_mult_1_r);
		fclose(fp_int2_mult_1_i);

		fclose(fp_int2_sub_r);
		fclose(fp_int2_sub_i);

		fclose(fp_int2_mag);

		// Output loop 2, and loop 3
		fclose(fp_norm_temp_0_r);
		fclose(fp_norm_temp_0_i);
		fclose(fp_norm_temp_1_r);
		fclose(fp_norm_temp_1_i);
#endif WRITE_MSGS
	//	printf("x=%d, y=%d, Result=%2.6f\n", x_ndx, y_ndx, norm);
	// return the metric
	return(norm);
};





/* 	// compute inv(S'*S)*S'*x (the result is a 2x1 matrix) */
/*     for(k=0; k<PILOT_HALF_LENGTH_4; k++){ */
/*         complex_mult(x_r[k],x_i[k],S_pinv_r[0][k],S_pinv_i[0][k],&temp0_r,&temp0_i); */
/*         norm_temp_r[0] += temp0_r; */
/* 		norm_temp_i[0] += temp0_i; */

/*         complex_mult(x_r[k],x_i[k],S_pinv_r[1][k],S_pinv_i[1][k],&temp1_r,&temp1_i); */
/*         norm_temp_r[1] += temp1_r; */
/* 		norm_temp_i[1] += temp1_i; */
/*     } */

/* 	// compute S*inv(S'*S)*S'*x (the result is a PILOT_LENGTH_4x1 vector) */
/*     for(k=0; k<PILOT_HALF_LENGTH_4; k++){ */
/*         complex_mult(norm_temp_r[0],norm_temp_i[0],ss0_r[k],ss0_i[k],&temp0_r,&temp0_i); */
/*         complex_mult(norm_temp_r[1],norm_temp_i[1],ss1_r[k],ss1_i[k],&temp1_r,&temp1_i); */
/*         norm_temp_long_r[k] = temp0_r + temp1_r; */
/* 		norm_temp_long_i[k] = temp0_i + temp1_i;              */
/*     } */

/* 	// compute x - S*inv(S'*S)*S'*x (the result is a PILOT_LENGTH_4x1 vector) */
/*     for(k=0; k<PILOT_HALF_LENGTH_4; k++){ */
/*         norm_temp_long_r[k] = x_r[k] - norm_temp_long_r[k]; */
/*         norm_temp_long_i[k] = x_i[k] - norm_temp_long_i[k];              */
/*     } */

/* 	// compute the Frobenius norm of the vector (the sum of the squares) */
/*     norm = 0.0f; */
/*     for(k=0; k<PILOT_HALF_LENGTH_4; k++){ */
/*         complex_abs2(norm_temp_long_r[k],norm_temp_long_i[k],&temp0); */
/*         norm += temp0; */
/*     } */

/* 	// Output loop 2, and loop 3 */
/* 	MyFwrite(&norm, sizeof(float), 1, fp_norm_temp_0_r); */
/* 	MyFwrite(&norm, sizeof(float), 1, fp_norm_temp_0_i); */

/* 	fclose(fp_ss0_r); */
/* 	fclose(fp_ss0_i); */
/* 	fclose(fp_ss1_r); */
/* 	fclose(fp_ss1_i);  */

/* 	// Input to Compute_Metric */
/* 	fclose(fp_pilot_buffer_r); */
/* 	fclose(fp_pilot_buffer_i); */

/* 	// Output loop 1 */
/* 	fclose(fp_s_pinv_0_r); */
/* 	fclose(fp_s_pinv_0_i); */
/* 	fclose(fp_s_pinv_1_r); */
/* 	fclose(fp_s_pinv_1_i); */

/* 	//Intermediate Values in Loop 2 */
/* 	fclose(fp_int_mult_0_r); */
/* 	fclose(fp_int_mult_0_i); */
/* 	fclose(fp_int_mult_1_r); */
/* 	fclose(fp_int_mult_1_i); */

/* 	fclose(fp_int_sum_r); */
/* 	fclose(fp_int_sum_i); */

/* 	// Intermediate Values in Loop 3 */
/* 	fclose(fp_int2_mult_0_r); */
/* 	fclose(fp_int2_mult_0_i); */
/* 	fclose(fp_int2_mult_1_r); */
/* 	fclose(fp_int2_mult_1_i); */

/* 	fclose(fp_int2_sub_r); */
/* 	fclose(fp_int2_sub_i); */

/* 	fclose(fp_int2_mag); */

/* 	// Output loop 2, and loop 3 */
/* 	fclose(fp_norm_temp_0_r); */
/* 	fclose(fp_norm_temp_0_i); */
/* 	fclose(fp_norm_temp_1_r); */
/* 	fclose(fp_norm_temp_1_i); */

/* 	// return the metric */



/* 	// return the metric */
/* 	return(norm); */
/* } */

/*
 * These routines find the maximum and minimum values of the simplex.
 * They are not general purpose--they both assume that there are
 * 3 values to be compared.
 *
 * The max value is returned via the pointer float *max_val
 * (and the min value is returned via the pointer float *min_val)
 * The index is returned as the function return value
 */
int simplex_max(float *simplex, float *max_val)
{
	int	ndx;

	*max_val = simplex[0];
	ndx = 0;
	if(simplex[1] > *max_val)
	{
		*max_val = simplex[1];
		ndx = 1;
	}
	if(simplex[2] > *max_val)
	{
		*max_val = simplex[2];
		ndx = 2;
	}

	return(ndx);
}

int simplex_min(float *simplex, float *min_val)
{
	int	ndx;

	*min_val = simplex[0];
	ndx = 0;
	if(simplex[1] < *min_val)
	{
		*min_val = simplex[1];
		ndx = 1;
	}
	if(simplex[2] < *min_val)
	{
		*min_val = simplex[2];
		ndx = 2;
	}

	return(ndx);
}


/*
 *	Function
 *
 *		InitInverseLUT() initializes the lookup table for all of the values
 *		of inv(S'*S).
 *
 *		The lookup table is a 65x65 array of pointers.  Each pointer points
 *		to a 4 element array containing the 4 elements of a 2x2 inverse matrix.
 *
 *		The 65x65 array is implemented using an array of pointers to speed up
 *		access time.
 */
void InitInverseLUT(float *sig_0_r, float *sig_0_i, float *sig_1_r, float *sig_1_i)
{
	int		i,j,k;
	float	ss0_r[PILOT_HALF_LENGTH_4];
	float	ss0_i[PILOT_HALF_LENGTH_4];
	float	ss1_r[PILOT_HALF_LENGTH_4];
	float	ss1_i[PILOT_HALF_LENGTH_4];
	float	temp0;
	float	temp1;
	float	temp0_r, temp0_i;
	float	temp1_r, temp1_i;
	float	a_r, a_i;
	float	b_r, b_i;
	float	c_r, c_i;
	float	d_r, d_i;
	float	alpha_r, alpha_i;
	float	beta_r, beta_i;
	float	S_temp_r[2][2];
	float	S_temp_i[2][2];
	float	*s_inv_ptr_r;
	float	*s_inv_ptr_i;

	// initialize the array of 65 pointers to point into the block of memory that makes up the 65x65 array
	for(k = 0; k < NUM_SEARCHES; k++)
	{
		SS_inv_LUT_r[k] = &(ss_inv_lut_mem_r[k*NUM_SEARCHES]);
		SS_inv_LUT_i[k] = &(ss_inv_lut_mem_i[k*NUM_SEARCHES]);
	}

	// initialize the 65x65 array of pointers to each point to an array of 4 floats
	for(i = 0; i < NUM_SEARCHES; i++)
		for(j = 0; j < NUM_SEARCHES; j++)
		{
			SS_inv_LUT_r[i][j] = &(ss_inv_mem_r[i*NUM_SEARCHES*4 + j*4]);
			SS_inv_LUT_i[i][j] = &(ss_inv_mem_i[i*NUM_SEARCHES*4 + j*4]);
		}

	// compute inv(S'*S) for each offset of both tau0 and tau1
	for(i = 0; i < NUM_SEARCHES; i++)
	{
		for(j = 0; j < NUM_SEARCHES; j++)
		{
			// point the output pointer to the appropriate array of 4
			s_inv_ptr_r = SS_inv_LUT_r[i][j];
			s_inv_ptr_i = SS_inv_LUT_i[i][j];

			// extract the template (with the desired offset)--together these form S, a PILOT_LENGTH_4x2 matrix
			for(k=0; k<PILOT_HALF_LENGTH_4; k++)
			{
				ss0_r[k] = sig_0_r[SEARCH_SKIP*k+i];
				ss0_i[k] = sig_0_i[SEARCH_SKIP*k+i];
    			ss1_r[k] = sig_1_r[SEARCH_SKIP*k+j];
    			ss1_i[k] = sig_1_i[SEARCH_SKIP*k+j];
			}

			// compute the 2x2 matrix S'S
			temp0 = 0.0f;
			for(k=0; k<PILOT_HALF_LENGTH_4; k++){
				complex_abs2(ss0_r[k],ss0_i[k],&temp1);
				temp0 += temp1;
			}
			S_temp_r[0][0] = temp0;
			S_temp_i[0][0] = 0.0f;

			temp0_r = 0.0f;
			temp0_i = 0.0f;
			for(k=0; k<PILOT_HALF_LENGTH_4; k++){
				complex_mult(ss0_r[k],-ss0_i[k],ss1_r[k],ss1_i[k],&temp1_r,&temp1_i);
				temp0_r += temp1_r;
				temp0_i += temp1_i;
			}
			S_temp_r[0][1] = temp0_r;
			S_temp_i[0][1] = temp0_i;

			temp0_r = 0.0f;
			temp0_i = 0.0f;
			for(k=0; k<PILOT_HALF_LENGTH_4; k++){
				complex_mult(ss0_r[k],ss0_i[k],ss1_r[k],-ss1_i[k],&temp1_r,&temp1_i);
				temp0_r += temp1_r;
				temp0_i += temp1_i;
			}
			S_temp_r[1][0] = temp0_r;
			S_temp_i[1][0] = temp0_i;

			temp0 = 0.0f;
			for(k=0; k<PILOT_HALF_LENGTH_4; k++){
				complex_abs2(ss1_r[k],ss1_i[k],&temp1);
				temp0 += temp1;
			}
			S_temp_r[1][1] = temp0;
			S_temp_i[1][1] = 0.0f;

			// invert S_temp
			a_r = S_temp_r[0][0]; a_i = S_temp_i[0][0];
			b_r = S_temp_r[0][1]; b_i = S_temp_i[0][1];
			c_r = S_temp_r[1][0]; c_i = S_temp_i[1][0];
			d_r = S_temp_r[1][1]; d_i = S_temp_i[1][1];
			complex_mult(a_r,a_i,d_r,d_i,&temp0_r,&temp0_i);
			complex_mult(b_r,b_i,c_r,c_i,&temp1_r,&temp1_i);
			alpha_r = temp0_r - temp1_r; alpha_i = temp0_i - temp1_i;
			temp0 = alpha_r*alpha_r + alpha_i*alpha_i;
			beta_r = alpha_r/temp0; beta_i = -alpha_i/temp0;
			complex_mult(beta_r,beta_i,S_temp_r[1][1],S_temp_i[1][1],&(s_inv_ptr_r[0]),&(s_inv_ptr_i[0]));
			complex_mult(-beta_r,-beta_i,S_temp_r[0][1],S_temp_i[0][1],&(s_inv_ptr_r[1]),&(s_inv_ptr_i[1]));
			complex_mult(-beta_r,-beta_i,S_temp_r[1][0],S_temp_i[1][0],&(s_inv_ptr_r[2]),&(s_inv_ptr_i[2]));
			complex_mult(beta_r,beta_i,S_temp_r[0][0],S_temp_i[0][0],&(s_inv_ptr_r[3]),&(s_inv_ptr_i[3]));
			/*for(k=0; k<4; k++)
			{
				printf("x[%d]=(%f,%f)\t",k,s_inv_ptr_r[k],s_inv_ptr_i[k]);
			}
			printf("\n");*/
		}
	}
}


// This function will return a
//	zero if the value is zero
//	one  if the value is positive
//	two  if the value is negative
int convert2ternary(int val){
  if(val == 0)
    return 0;
  else if(val > 0)
    return 1;
  else
    return 2;
}




// This is a LUT to determine which of the 12 cases that the triangle
// could be arranged.  There are 4 positions and 3 possible pivot
// points.  The triangle will flip itself along the axis of the pivot
// point (max_index) by replacing that point with a new point
// generated with the case statement.
//      /|3    3|\
//     /A|      |B\
//  1 /__|2    2|__\1
//
//    ___       ___
//   1\  |2    2|  /1
//     \C|	|D/
//      \|3    3|/
//
//
//	LETTERS = Triangle Position
//	NUMBERS = Pivot Point
//
//	A1 = Case 1
//	A2 = Case 2
//	A3 = Case 3
//	B1 = Case 4
//	B2 = Case 5
//	B3 = Case 6
//	C1 = Case 7
//	C2 = Case 8
//	C3 = Case 9
//	D1 = Case 10
//	D2 = Case 11
//	D3 = Case 12

// A1		   X,Y
// Pivot - PT_1 = (-,0)
// Pivot - PT_2 = (-,+)
// A2
// Pivot - PT_1 = (+,0)
// Pivot - PT_2 = (0,+)
// A3
// Pivot - PT_1 = (+,-)
// Pivot - PT_2 = (0,-)

// B1		   X,Y
// Pivot - PT_1 = (+,0)
// Pivot - PT_2 = (+,+)
// B2
// Pivot - PT_1 = (-,0)
// Pivot - PT_2 = (0,+)
// B3
// Pivot - PT_1 = (-,-)
// Pivot - PT_2 = (0,-)

// C1		   X,Y
// Pivot - PT_1 = (-,0)
// Pivot - PT_2 = (-,-)
// C2
// Pivot - PT_1 = (+,0)
// Pivot - PT_2 = (0,-)
// C3
// Pivot - PT_1 = (+,+)
// Pivot - PT_2 = (0,+)

// D1		   X,Y
// Pivot - PT_1 = (+,0)
// Pivot - PT_2 = (+,-)
// D2
// Pivot - PT_1 = (-,0)
// Pivot - PT_2 = (0,-)
// D3
// Pivot - PT_1 = (-,+)
// Pivot - PT_2 = (0,+)

// Looking at these patterns I choose to look at X coordinate pairs
// and Y coordinate pairs.  For example from A1, the X coordinate pair
// is (-) because both X coordinate values are negative from the
//    (-)
// subtraction operation.  I then assigned the four types of recurring
// pairs to a value.
//	(-) = 1		(-) or (0) = 2
//	(-)		(0)    (-)
//
//	(+) = 3		(+) or (0) = 4
//	(+)		(0)    (+)
//
// This is how I arrived at the LUT values for LUT_XY. I then used
// those unique identifiers to create LUT_LAST to determine which case
// the triangle was in.
void TinySimplexLUT(int x_1, int x_2, int y_1, int y_2, int max_index, int *newpoint, int * xx, int * yy){
   // xy_1           0      1       2       xy_2
  int LUT_XY[3][3] =  {{0,     4,      2},  // 0
                       {4,     3,      0},  // 1
                       {2,     0,      1}}; // 2


  //                     0	 1	 2 	 3
  int LUT_LAST[4][4] = {{0,      6,      0,      3},  // 0
                        {7,     11,     10,      8},  // 1
                        {0,     12,      0,      9},  // 2
                        {1,      5,      4,      2}}; // 3

  int x_type = LUT_XY[x_2][x_1];
  int y_type = LUT_XY[y_2][y_1];
  int check = LUT_LAST[y_type-1][x_type-1];

  switch (check){
  case 1:
    newpoint[0] = xx[max_index] + 2;
    newpoint[1] = yy[max_index] + 0;
    break;
  case 2:
    newpoint[0] = xx[max_index] - 1;
    newpoint[1] = yy[max_index] - 1;
    break;
  case 3:
    newpoint[0] = xx[max_index] + 0;
    newpoint[1] = yy[max_index] + 2;
    break;
  case 4:
    newpoint[0] = xx[max_index] - 2;
    newpoint[1] = yy[max_index] + 0;
    break;
  case 5:
    newpoint[0] = xx[max_index] + 1;
    newpoint[1] = yy[max_index] - 1;
    break;
  case 6:
    newpoint[0] = xx[max_index] + 0;
    newpoint[1] = yy[max_index] + 2;
    break;
  case 7:
    newpoint[0] = xx[max_index] + 2;
    newpoint[1] = yy[max_index] + 0;
    break;
  case 8:
    newpoint[0] = xx[max_index] - 1;
    newpoint[1] = yy[max_index] + 1;
    break;
  case 9:
    newpoint[0] = xx[max_index] + 0;
    newpoint[1] = yy[max_index] - 2;
    break;
  case 10:
    newpoint[0] = xx[max_index] - 2;
    newpoint[1] = yy[max_index] + 0;
    break;
  case 11:
    newpoint[0] = xx[max_index] + 1;
    newpoint[1] = yy[max_index] + 1;
    break;
  case 12:
    newpoint[0] = xx[max_index] + 0;
    newpoint[1] = yy[max_index] - 2;
    break;
  default:
    newpoint[0] = xx[max_index] + 0;
    newpoint[1] = yy[max_index] - 0;
    break;
  }
  return;
}
