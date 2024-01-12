#include "defines.h"
#include "complex_math.h"
#include "fft.h"
#include <stdio.h>

#define FS 41.6e6f
#define H_OFFSET 66.66666666e3f

#ifndef PI2
	#define PI2 6.28318530717959f
#endif
float	freq_off;

extern WRITE_MSGS;
extern openError;

/*******
 * Implements the correlator for the pilot detector
 * Parameters:
 *		x_r, x_i	:	pointers the complex input
 *		h0_r, h0_i	:	the first complex correlation template
 *		h1_r, h1_i	:	the second complex correlation template
 *		r0, r1		:	the two real outputs
 *
 * Note: All arrays are of length PD_PILOT_LENGTH samples
 *******/
void pd_correlator(float *x_r, float *x_i,
				   float *h0_r, float *h0_i,
				   float *h1_r, float *h1_i,
				   float *r0_neg, float *r1_neg,
				   float *r0_center, float *r1_center,
				   float *r0_pos, float *r1_pos)
{
	float X_r[2*PD_PILOT_LENGTH], X_i[2*PD_PILOT_LENGTH];

	static float H0_r[2*PD_PILOT_LENGTH] = {0};
	static float H0_i[2*PD_PILOT_LENGTH] = {0};
	static float H1_r[2*PD_PILOT_LENGTH] = {0};
	static float H1_i[2*PD_PILOT_LENGTH] = {0};

	static float H0_neg_r[2*PD_PILOT_LENGTH] = {0};
	static float H0_neg_i[2*PD_PILOT_LENGTH] = {0};
	static float H1_neg_r[2*PD_PILOT_LENGTH] = {0};
	static float H1_neg_i[2*PD_PILOT_LENGTH] = {0};
	float h0_neg_r[PD_PILOT_LENGTH],h0_neg_i[PD_PILOT_LENGTH];
	float h1_neg_r[PD_PILOT_LENGTH],h1_neg_i[PD_PILOT_LENGTH];

	static float H0_pos_r[2*PD_PILOT_LENGTH] = {0};
	static float H0_pos_i[2*PD_PILOT_LENGTH] = {0};
	static float H1_pos_r[2*PD_PILOT_LENGTH] = {0};
	static float H1_pos_i[2*PD_PILOT_LENGTH] = {0};
	float h0_pos_r[PD_PILOT_LENGTH],h0_pos_i[PD_PILOT_LENGTH];
	float h1_pos_r[PD_PILOT_LENGTH],h1_pos_i[PD_PILOT_LENGTH];

	float w_r,w_i;
	float wm_r,wm_i;


	float R0_r[2*PD_PILOT_LENGTH], R0_i[2*PD_PILOT_LENGTH];
	float R1_r[2*PD_PILOT_LENGTH], R1_i[2*PD_PILOT_LENGTH];

	float r0_neg_r[2*PD_PILOT_LENGTH], r0_neg_i[2*PD_PILOT_LENGTH];
	float r1_neg_r[2*PD_PILOT_LENGTH], r1_neg_i[2*PD_PILOT_LENGTH];
	static float buf0_neg_r[PD_PILOT_LENGTH] = {0};
	static float buf0_neg_i[PD_PILOT_LENGTH] = {0};
	static float buf1_neg_r[PD_PILOT_LENGTH] = {0};
	static float buf1_neg_i[PD_PILOT_LENGTH] = {0};

	float r0_center_r[2*PD_PILOT_LENGTH], r0_center_i[2*PD_PILOT_LENGTH];
	float r1_center_r[2*PD_PILOT_LENGTH], r1_center_i[2*PD_PILOT_LENGTH];
	static float buf0_center_r[PD_PILOT_LENGTH] = {0};
	static float buf0_center_i[PD_PILOT_LENGTH] = {0};
	static float buf1_center_r[PD_PILOT_LENGTH] = {0};
	static float buf1_center_i[PD_PILOT_LENGTH] = {0};

	float r0_pos_r[2*PD_PILOT_LENGTH], r0_pos_i[2*PD_PILOT_LENGTH];
	float r1_pos_r[2*PD_PILOT_LENGTH], r1_pos_i[2*PD_PILOT_LENGTH];
	static float buf0_pos_r[PD_PILOT_LENGTH] = {0};
	static float buf0_pos_i[PD_PILOT_LENGTH] = {0};
	static float buf1_pos_r[PD_PILOT_LENGTH] = {0};
	static float buf1_pos_i[PD_PILOT_LENGTH] = {0};

	float tmp_r, tmp_i;
	static int first_run = 1;
	int m;
	float Zeroes[64] = { 0 };
	char FileName[40], HOffset[10], FOffset[10];
		FILE *neg_h0_r,
			*neg_h0_i,
			*neg_h1_r,
			*neg_h1_i,
			*center_h0_r,
			*center_h0_i,
			*center_h1_r,
			*center_h1_i,
			*pos_h0_r,
			*pos_h0_i,
			*pos_h1_r,
			*pos_h1_i,
			*fp_R0_r,
			*fp_R0_i,
			*fp_R1_r,
			*fp_R1_i;

	if(first_run)
	{
		first_run = 0;

		// create negative-band version of the h's
		wm_r = cos(PI2*H_OFFSET/FS); wm_i = sin(-PI2*H_OFFSET/FS);
		w_r = 1.0f; w_i = 0.0f;
		for(m=0; m<PD_PILOT_LENGTH; m++)
		{
			complex_mult(h0_r[m],h0_i[m],w_r,w_i,&h0_neg_r[m],&h0_neg_i[m]);
			complex_mult(h1_r[m],h1_i[m],w_r,w_i,&h1_neg_r[m],&h1_neg_i[m]);
			complex_mult(w_r,w_i,wm_r,wm_i,&w_r,&w_i);
		}
        fft(h0_neg_r,h0_neg_i,PD_PILOT_LENGTH,H0_neg_r,H0_neg_i,2*PD_PILOT_LENGTH);
        fft(h1_neg_r,h1_neg_i,PD_PILOT_LENGTH,H1_neg_r,H1_neg_i,2*PD_PILOT_LENGTH);

		// create positive-band version of the h's
		wm_r = cos(PI2*H_OFFSET/FS); wm_i = sin(PI2*H_OFFSET/FS);
		w_r = 1.0f; w_i = 0.0f;
		for(m=0; m<PD_PILOT_LENGTH; m++)
		{
			complex_mult(h0_r[m],h0_i[m],w_r,w_i,&h0_pos_r[m],&h0_pos_i[m]);
			complex_mult(h1_r[m],h1_i[m],w_r,w_i,&h1_pos_r[m],&h1_pos_i[m]);
			complex_mult(w_r,w_i,wm_r,wm_i,&w_r,&w_i);
		}
        fft(h0_pos_r,h0_pos_i,PD_PILOT_LENGTH,H0_pos_r,H0_pos_i,2*PD_PILOT_LENGTH);
        fft(h1_pos_r,h1_pos_i,PD_PILOT_LENGTH,H1_pos_r,H1_pos_i,2*PD_PILOT_LENGTH);

		// create base-band version of the h's
        fft(h0_r,h0_i,PD_PILOT_LENGTH,H0_r,H0_i,2*PD_PILOT_LENGTH);
        fft(h1_r,h1_i,PD_PILOT_LENGTH,H1_r,H1_i,2*PD_PILOT_LENGTH);

#ifdef WRITE_MSGS
			neg_h0_r = fopen("neg_h0_r.txt", "wb");
			neg_h0_i = fopen("neg_h0_i.txt", "wb");
			neg_h1_r = fopen("neg_h1_r.txt", "wb");
			neg_h1_i = fopen("neg_h1_i.txt", "wb");
			center_h0_r = fopen("center_h0_r.txt", "wb");
			center_h0_i = fopen("center_h0_i.txt", "wb");
			center_h1_r = fopen("center_h1_r.txt", "wb");
			center_h1_i = fopen("center_h1_i.txt", "wb");
			pos_h0_r = fopen("pos_h0_r.txt", "wb");
			pos_h0_i = fopen("pos_h0_i.txt", "wb");
			pos_h1_r = fopen("pos_h1_r.txt", "wb");
			pos_h1_i = fopen("pos_h1_i.txt", "wb");
			MyFwrite(H0_neg_r, sizeof(float), 2 * PD_PILOT_LENGTH, neg_h0_r);
			MyFwrite(H0_neg_i, sizeof(float), 2 * PD_PILOT_LENGTH, neg_h0_i);
			MyFwrite(H1_neg_r, sizeof(float), 2 * PD_PILOT_LENGTH, neg_h1_r);
			MyFwrite(H1_neg_i, sizeof(float), 2 * PD_PILOT_LENGTH, neg_h1_i);
			MyFwrite(H0_r, sizeof(float), 2 * PD_PILOT_LENGTH, center_h0_r);
			MyFwrite(H0_i, sizeof(float), 2 * PD_PILOT_LENGTH, center_h0_i);
			MyFwrite(H1_r, sizeof(float), 2 * PD_PILOT_LENGTH, center_h1_r);
			MyFwrite(H1_i, sizeof(float), 2 * PD_PILOT_LENGTH, center_h1_i);
			MyFwrite(H0_pos_r, sizeof(float), 2 * PD_PILOT_LENGTH, pos_h0_r);
			MyFwrite(H0_pos_i, sizeof(float), 2 * PD_PILOT_LENGTH, pos_h0_i);
			MyFwrite(H1_pos_r, sizeof(float), 2 * PD_PILOT_LENGTH, pos_h1_r);
			MyFwrite(H1_pos_i, sizeof(float), 2 * PD_PILOT_LENGTH, pos_h1_i);
			fclose(neg_h0_r);
			fclose(neg_h0_i);
			fclose(neg_h1_r);
			fclose(neg_h1_i);
			fclose(center_h0_r);
			fclose(center_h0_i);
			fclose(center_h1_r);
			fclose(center_h1_i);
			fclose(pos_h0_r);
			fclose(pos_h0_i);
			fclose(pos_h1_r);
			fclose(pos_h1_i);
#endif WRITE_MSGS
	}

	fft(x_r,x_i,PD_PILOT_LENGTH,X_r,X_i,2*PD_PILOT_LENGTH);

#ifdef WRITE_MSGS
	FILE	*fp_fft_out_r, *fp_fft_out_i;
	fp_fft_out_r = fopen("fft_out_r.txt", "a");
	fp_fft_out_i = fopen("fft_out_i.txt", "a");
	MyFwrite(X_r, sizeof(float), 2 * PD_PILOT_LENGTH, fp_fft_out_r);
	MyFwrite(Zeroes, sizeof(float), 64, fp_fft_out_r);
	MyFwrite(X_i, sizeof(float), 2 * PD_PILOT_LENGTH, fp_fft_out_i);
	MyFwrite(Zeroes, sizeof(float), 64, fp_fft_out_i);
	fclose(fp_fft_out_r);
	fclose(fp_fft_out_i);
#endif WRITE_MSGS

	// at -66.6 kHz
	for(m=0; m<2*PD_PILOT_LENGTH; m++)
	{
		complex_mult(X_r[m],X_i[m],H0_neg_r[m],H0_neg_i[m],&R0_r[m],&R0_i[m]);
		complex_mult(X_r[m],X_i[m],H1_neg_r[m],H1_neg_i[m],&R1_r[m],&R1_i[m]);
	}

	ifft(R0_r,R0_i,2*PD_PILOT_LENGTH,r0_neg_r,r0_neg_i,2*PD_PILOT_LENGTH);
	ifft(R1_r,R1_i,2*PD_PILOT_LENGTH,r1_neg_r,r1_neg_i,2*PD_PILOT_LENGTH);
#ifdef WRITE_MSGS
		strcpy(HOffset, "neg66k_");
		if (freq_off < 0)
			strcpy(FOffset, "neg100");
		else if (freq_off > 0)
			strcpy(FOffset, "pos100");
		else
			strcpy(FOffset, "center");
		sprintf(FileName, "fp_r0_r_%s%+.0f.txt", HOffset, freq_off);
		fp_R0_r = fopen(FileName, "a");
		sprintf(FileName, "fp_r0_i_%s%+0.f.txt", HOffset, freq_off);
		fp_R0_i = fopen(FileName, "a");
		sprintf(FileName, "fp_r1_r_%s%+0.f.txt", HOffset, freq_off);
		fp_R1_r = fopen(FileName, "a");
		sprintf(FileName, "fp_r1_i_%s%+0.f.txt", HOffset, freq_off);
		fp_R1_i = fopen(FileName, "a");
		MyFwrite(R0_r, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R0_r);
		MyFwrite(R0_i, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R0_i);
		MyFwrite(R1_r, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R1_r);
		MyFwrite(R1_i, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R1_i);
		fclose(fp_R0_r);
		fclose(fp_R0_i);
		fclose(fp_R1_r);
		fclose(fp_R1_i);
#endif WRITE_MSGS

	// at 0 Hz
	for(m=0; m<2*PD_PILOT_LENGTH; m++)
	{
		complex_mult(X_r[m],X_i[m],H0_r[m],H0_i[m],&R0_r[m],&R0_i[m]);
		complex_mult(X_r[m],X_i[m],H1_r[m],H1_i[m],&R1_r[m],&R1_i[m]);
	}

	ifft(R0_r,R0_i,2*PD_PILOT_LENGTH,r0_center_r,r0_center_i,2*PD_PILOT_LENGTH);
	ifft(R1_r,R1_i,2*PD_PILOT_LENGTH,r1_center_r,r1_center_i,2*PD_PILOT_LENGTH);

//TODO #ifdef WRITE_MSGS
		strcpy(HOffset, "center_");
		sprintf_s(FileName, sizeof(FileName), "fp_r0_r_%s%+.0f.txt", HOffset, freq_off);
		openError = fopen_s(&fp_R0_r,FileName, "a");
		sprintf_s(FileName, sizeof(FileName), "fp_r0_i_%s%+.0f.txt", HOffset, freq_off);
		openError = fopen_s(&fp_R0_i,FileName, "a");
		sprintf_s(FileName, sizeof(FileName), "fp_r1_r_%s%+.0f.txt", HOffset, freq_off);
		openError = fopen_s(&fp_R1_r, FileName, "a");
		sprintf_s(FileName, sizeof(FileName), "fp_r1_i_%s%+.0f.txt", HOffset, freq_off);
		openError = fopen_s(&fp_R1_i,FileName, "a");
		MyFwrite(R0_r, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R0_r);
		MyFwrite(R0_i, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R0_i);
		MyFwrite(R1_r, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R1_r);
		MyFwrite(R1_i, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R1_i);
		fclose(fp_R0_r);
		fclose(fp_R0_i);
		fclose(fp_R1_r);
		fclose(fp_R1_i);
		openError = fopen_s(&fp_R0_r, "fp_r0_ifft_r.txt", "a");
		openError = fopen_s(&fp_R0_i, "fp_r0_ifft_i.txt", "a");
		openError = fopen_s(&fp_R1_r, "fp_r1_ifft_r.txt", "a");
		openError = fopen_s(&fp_R1_i, "fp_r1_ifft_i.txt", "a");
		MyFwrite(r0_center_r, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R0_r);
		MyFwrite(r0_center_i, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R0_i);
		MyFwrite(r1_center_r, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R1_r);
		MyFwrite(r1_center_i, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R1_i);
		fclose(fp_R0_r);
		fclose(fp_R0_i);
		fclose(fp_R1_r);
		fclose(fp_R1_i);
#//TODO endif WRITE_MSGS

	// at +66.6 kHz
	for(m=0; m<2*PD_PILOT_LENGTH; m++)
	{
		complex_mult(X_r[m],X_i[m],H0_pos_r[m],H0_pos_i[m],&R0_r[m],&R0_i[m]);
		complex_mult(X_r[m],X_i[m],H1_pos_r[m],H1_pos_i[m],&R1_r[m],&R1_i[m]);
	}

	ifft(R0_r,R0_i,2*PD_PILOT_LENGTH,r0_pos_r,r0_pos_i,2*PD_PILOT_LENGTH);
	ifft(R1_r,R1_i,2*PD_PILOT_LENGTH,r1_pos_r,r1_pos_i,2*PD_PILOT_LENGTH);

#ifdef WRITE_MSGS
		strcpy(HOffset, "pos66k_");
		sprintf(FileName, "fp_r0_r_%s%s.txt", HOffset, FOffset);
		fp_R0_r = fopen(FileName, "ab");
		sprintf(FileName, "fp_r0_i_%s%s.txt", HOffset, FOffset);
		fp_R0_i = fopen(FileName, "ab");
		sprintf(FileName, "fp_r1_r_%s%s.txt", HOffset, FOffset);
		fp_R1_r = fopen(FileName, "ab");
		sprintf(FileName, "fp_r1_i_%s%s.txt", HOffset, FOffset);
		fp_R1_i = fopen(FileName, "ab");
		fwrite(R0_r, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R0_r);
		fwrite(R0_i, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R0_i);
		fwrite(R1_r, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R1_r);
		fwrite(R1_i, sizeof(float), 2 * PD_PILOT_LENGTH, fp_R1_i);
		fclose(fp_R0_r);
		fclose(fp_R0_i);
		fclose(fp_R1_r);
		fclose(fp_R1_i);
#endif WRITE_MSGS


	// overlap and add
	for(m=0; m<PD_PILOT_LENGTH; m++)
	{
		tmp_r = r0_neg_r[m] + buf0_neg_r[m]; tmp_i = r0_neg_i[m] + buf0_neg_i[m];
		complex_abs2(tmp_r,tmp_i,&r0_neg[m]);
		tmp_r = r1_neg_r[m] + buf1_neg_r[m]; tmp_i = r1_neg_i[m] + buf1_neg_i[m];
		complex_abs2(tmp_r,tmp_i,&r1_neg[m]);
	}
	for(m=0; m<PD_PILOT_LENGTH; m++)
	{
		tmp_r = r0_center_r[m] + buf0_center_r[m]; tmp_i = r0_center_i[m] + buf0_center_i[m];
		complex_abs2(tmp_r,tmp_i,&r0_center[m]);
		tmp_r = r1_center_r[m] + buf1_center_r[m]; tmp_i = r1_center_i[m] + buf1_center_i[m];
		complex_abs2(tmp_r,tmp_i,&r1_center[m]);
	}
	for(m=0; m<PD_PILOT_LENGTH; m++)
	{
		tmp_r = r0_pos_r[m] + buf0_pos_r[m]; tmp_i = r0_pos_i[m] + buf0_pos_i[m];
		complex_abs2(tmp_r,tmp_i,&r0_pos[m]);
		tmp_r = r1_pos_r[m] + buf1_pos_r[m]; tmp_i = r1_pos_i[m] + buf1_pos_i[m];
		complex_abs2(tmp_r,tmp_i,&r1_pos[m]);
	}



	// buffer the second half of the IFFT outputs
	for(m=0; m<PD_PILOT_LENGTH; m++)
	{
		buf0_neg_r[m] = r0_neg_r[m + PD_PILOT_LENGTH];
		buf0_neg_i[m] = r0_neg_i[m + PD_PILOT_LENGTH];
		buf1_neg_r[m] = r1_neg_r[m + PD_PILOT_LENGTH];
		buf1_neg_i[m] = r1_neg_i[m + PD_PILOT_LENGTH];
	}
	for(m=0; m<PD_PILOT_LENGTH; m++)
	{
		buf0_center_r[m] = r0_center_r[m + PD_PILOT_LENGTH];
		buf0_center_i[m] = r0_center_i[m + PD_PILOT_LENGTH];
		buf1_center_r[m] = r1_center_r[m + PD_PILOT_LENGTH];
		buf1_center_i[m] = r1_center_i[m + PD_PILOT_LENGTH];
	}
	for(m=0; m<PD_PILOT_LENGTH; m++)
	{
		buf0_pos_r[m] = r0_pos_r[m + PD_PILOT_LENGTH];
		buf0_pos_i[m] = r0_pos_i[m + PD_PILOT_LENGTH];
		buf1_pos_r[m] = r1_pos_r[m + PD_PILOT_LENGTH];
		buf1_pos_i[m] = r1_pos_i[m + PD_PILOT_LENGTH];
	}
}

