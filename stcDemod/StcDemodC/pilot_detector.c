/***
 * pilot_detector.c implements the pilot detector.
 *
 * Copyright (c) 2006 Joseph McRae Palmer and Christopher Lavin
 ***/

#include "find_pilot.h"



#define SECTION_SIZE PD_PILOT_LENGTH
#define NSECTIONS 26
#define THRESHOLD 3e4f


//////////////////////////////////////
// globals
float frame_buffer_r[PD_PILOT_LENGTH];						// arrays to hold partial frames for pilot detector
float frame_buffer_i[PD_PILOT_LENGTH];
int pd_acquired = 0;										// State variable to indicated pd status
int good_pilots = 0;										// Keeps track of pilots found
int bad_pilots = 0;											// Keeps track of pilots not found
float average;
float max_max = 0;
float min_max = 2000;

extern WRITE_MSGS;
extern openError;

///////////////////////////////////////////////////
// helper functions

// find the max of the input vector x, return it and it's index
void find_max(float *x, int xlen, float *max_val, int *max_ind){
    int i;
    float current_max_val;
    int current_max_ind;

    current_max_val = 0;
	current_max_ind = 0;
    for(i=0;i<xlen;i++){
        if(x[i] > current_max_val){
            current_max_val = x[i];
            current_max_ind = i;
        }
    }
    *max_val = current_max_val;
    *max_ind = current_max_ind;
}



///////////////////////////////////////////////////////
// user functions

/***
 * FUNCTION : find_pilot()
 *
 * DESCRIPTION : find_pilot() detects the pilot in the input stream. After detection, it
 *				continues to verify the location, and also formats the data frames. Each frame
 *				contains a 512 sample pilot, followed by 12,800 data samples.
 *			    Note that the source of the data stream used for detection
 *				is the FLL ouput, while the source for the data frames is the output of the
 *				resampling filter. This is done because find_pilot() can detect pilots with
 *				a maximum frequency offset of about +/- 85,000 Hz. Since the maximum offset
 *				might be as high as +/- 100,000 Hz, the FLL is required for pulling the
 *				pilot within detection range. But, the FLL output is distorted, so the data
 *				frame output is obtained from the same uncorrected source used by the FLL.
 *
 *				Note that find_pilot() may have a delay of as high as one frame. This is caused
 *				by the frame formatting, where the possibility occurs of having to buffer incoming
 *				data until the pilot arrives.
 *
 * Arguments :
 *			r_fll_r		:	real part of the FLL-corrected data
 *			r_fll_i		:	imaginary part of the FLL-corrected data
 *			r_r			:	real part of the non-FLL-corrected data
 *			r_i			:	imaginary part of the non-FLL-corrected data
 *			rlen		:	length of the received data vectors. For now, must be 13312
 *			p0_r		:	real part of the transmitter-0 pilot template
 *			p0_i		:	imaginary part of the transmitter-0 pilot template
 *			p1_r		:	real part of the transmitter-0 pilot template
 *			p1_i		:	imaginary part of the transmitter-1 pilot template
 *			rf_r		:	real part of the output formatted data frame, of length rlen
 *			rf_i		:	imaginary part of the output formatted data frame, of length rlen
 *			valid		:	pointer to location indicating if rf is valid (i.e. has the pilot been found?).
 *
 *
 * Copyright (c) 2006 Joseph McRae Palmer
 ***/
void pilot_detector(float *r_fll_r, float *r_fll_i,
					float *r_r, float *r_i, int rlen,
					float *p0_r, float *p0_i, float *p1_r, float *p1_i,
					float *rf_r, float *rf_i, int *valid, float PosPeak)
{
	int i;  // loop indices
	FILE *fp_pd_test_r, *fp_pd_test_i;
	FILE *fp_pd_r0_neg=0, *fp_pd_r1_neg=0;
	FILE *fp_pd_r0_center=0, *fp_pd_r1_center=0;
	FILE *fp_pd_r0_pos=0, *fp_pd_r1_pos=0;
//	FILE *fp_h0_r, *fp_h0_i;
//	FILE *fp_h1_r, *fp_h1_i;

	//Correlator Output Buffers
	float r0_neg[SECTION_SIZE];
	float r1_neg[SECTION_SIZE];
	float r0_center[SECTION_SIZE];
	float r1_center[SECTION_SIZE];
	float r0_pos[SECTION_SIZE];
	float r1_pos[SECTION_SIZE];

	// Time reversed, conjugated pilots
	static float p0_template_r[PD_PILOT_LENGTH] = {0};
	static float p0_template_i[PD_PILOT_LENGTH] = {0};
	static float p1_template_r[PD_PILOT_LENGTH] = {0};
	static float p1_template_i[PD_PILOT_LENGTH] = {0};
	static int first_run = 1;

	//Max Values
	float max_val0_neg = 0;
	float max_val1_neg = 0;
	int max_ndx0_neg = -1;
	int max_ndx1_neg = -1;
	float max_val0_center = 0;
	float max_val1_center = 0;
	int max_ndx0_center = -1;
	int max_ndx1_center = -1;
	float max_val0_pos = 0;
	float max_val1_pos = 0;
	int max_ndx0_pos = -1;
	int max_ndx1_pos = -1;

	float max_val_neg = 0;
	int max_ndx_neg = -1;
	float max_val_center = 0;
	int max_ndx_center = -1;
	float max_val_pos = 0;
	int max_ndx_pos = -1;
	float max_val = 0;
	int max_ndx = -1;

	int pilot_detected = 0;
	int pilot_position = 0;
	int offset = 0;

	int samples_copied = 0;

//#ifdef WRITE_MSGS
		if (first_run)
		{
			openError = fopen_s(&fp_pd_test_r, "pd_test_r.txt", "wb");
			openError = fopen_s(&fp_pd_test_i, "pd_test_i.txt", "wb");
//			fp_pd_r0_neg = fopen("pd_r0_neg.txt", "wb");
//			fp_pd_r1_neg = fopen("pd_r1_neg.txt", "wb");
//			fp_pd_r0_center = fopen("pd_r0_center.txt", "wb");
//			fp_pd_r1_center = fopen("pd_r1_center.txt", "wb");
//			fp_pd_r0_pos = fopen("pd_r0_pos.txt", "wb");
//			fp_pd_r1_pos = fopen("pd_r1_pos.txt", "wb");
		}
		else
		{
			openError = fopen_s(&fp_pd_test_r, "pd_test_r.txt", "ab");
			openError = fopen_s(&fp_pd_test_i, "pd_test_i.txt", "ab");
//			fp_pd_r0_neg = fopen("pd_r0_neg.txt", "ab");
//			fp_pd_r1_neg = fopen("pd_r1_neg.txt", "ab");
//			fp_pd_r0_center = fopen("pd_r0_center.txt", "ab");
//			fp_pd_r1_center = fopen("pd_r1_center.txt", "ab");
//			fp_pd_r0_pos = fopen("pd_r0_pos.txt", "ab");
//			fp_pd_r1_pos = fopen("pd_r1_pos.txt", "ab");
		}
//#endif WRITE_MSGS
	// Time reverse and conjugate the pilot templates
	if(first_run)
	{
		/*fp_h0_r = fopen("h0_r.txt","wb");
		fp_h0_i = fopen("h0_i.txt","wb");
		fp_h1_r = fopen("h1_r.txt","wb");
		fp_h1_i = fopen("h1_i.txt","wb");*/
		//offset = PILOT_LENGTH_4 - PD_PILOT_LENGTH;
		for(i=0; i< PD_PILOT_LENGTH-PD_PILOT_LENGTH/4; i++){
			p0_template_r[i] = p0_r[(PD_PILOT_LENGTH-1)-i+offset];
			p0_template_i[i] = -1.0f*p0_i[(PD_PILOT_LENGTH-1)-i+offset];

			p1_template_r[i] = p1_r[(PD_PILOT_LENGTH-1)-i+offset];
			p1_template_i[i] = -1.0f*p1_i[(PD_PILOT_LENGTH-1)-i+offset];
		}
		/*fwrite(p0_template_r,sizeof(float),PD_PILOT_LENGTH,fp_h0_r);
		fwrite(p0_template_i,sizeof(float),PD_PILOT_LENGTH,fp_h0_i);
		fwrite(p1_template_r,sizeof(float),PD_PILOT_LENGTH,fp_h1_r);
		fwrite(p1_template_i,sizeof(float),PD_PILOT_LENGTH,fp_h1_i);
		fclose(fp_h0_r);
		fclose(fp_h0_i);
		fclose(fp_h1_r);
		fclose(fp_h1_i);*/
		first_run = 0;
	}
	//This loop assumes that the buffers of data coming in are 13312, the size of a frame
	// 13312 / PD_PILOT_LENGTH = NSECTIONS iterations
	for (i = 0; i < NSECTIONS; i++) {

//		if (fp_pd_test_i)
//		{
//			MyFwrite(r_fll_r + (i*SECTION_SIZE), sizeof(float), SECTION_SIZE, fp_pd_test_r);
//			MyFwrite(r_fll_i + (i*SECTION_SIZE), sizeof(float), SECTION_SIZE, fp_pd_test_i);
//		}
		pd_correlator((r_fll_r + (i*SECTION_SIZE)), (r_fll_i + (i*SECTION_SIZE)),
				   p0_template_r, p0_template_i,
				   p1_template_r, p1_template_i,
				   r0_neg, r1_neg,
				   r0_center, r1_center,
				   r0_pos, r1_pos);
#ifdef WRITE_MSGS
			fwrite(r0_neg, sizeof(float), SECTION_SIZE, fp_pd_r0_neg);
			fwrite(r1_neg, sizeof(float), SECTION_SIZE, fp_pd_r1_neg);
			fwrite(r0_center, sizeof(float), SECTION_SIZE, fp_pd_r0_center);
			fwrite(r1_center, sizeof(float), SECTION_SIZE, fp_pd_r1_center);
			fwrite(r0_pos, sizeof(float), SECTION_SIZE, fp_pd_r0_pos);
			fwrite(r1_pos, sizeof(float), SECTION_SIZE, fp_pd_r1_pos);
#endif WRITE_MSGS
		//find_max(float *x, int xlen, float *max_val, int *max_ind){
		find_max(r0_neg, SECTION_SIZE, &max_val0_neg, &max_ndx0_neg);
		find_max(r1_neg, SECTION_SIZE, &max_val1_neg, &max_ndx1_neg);
		find_max(r0_center, SECTION_SIZE, &max_val0_center, &max_ndx0_center);
		find_max(r1_center, SECTION_SIZE, &max_val1_center, &max_ndx1_center);
		find_max(r0_pos, SECTION_SIZE, &max_val0_pos, &max_ndx0_pos);
		find_max(r1_pos, SECTION_SIZE, &max_val1_pos, &max_ndx1_pos);

		// Determine which channel has the higher peak
		if (max_val0_neg > max_val1_neg){
			max_val_neg = max_val0_neg;
			max_ndx_neg = max_ndx0_neg;
		}
		else{
			max_val_neg = max_val1_neg;
			max_ndx_neg = max_ndx1_neg;
		}
		if (max_val0_center > max_val1_center){
			max_val_center = max_val0_center + max_val1_center;
			max_ndx_center = max_ndx0_center;
		}
		else{
			max_val_center = max_val0_center + max_val1_center;
			max_ndx_center = max_ndx1_center;
		}
		if (max_val0_pos > max_val1_pos){
			max_val_pos = max_val0_pos;
			max_ndx_pos = max_ndx0_pos;
		}
		else{
			max_val_pos = max_val1_pos;
			max_ndx_pos = max_ndx1_pos;
		}
		if(max_val_neg > max_val_center)
		{
			max_val = max_val_neg;
			max_ndx = max_ndx_neg;
		}
		else
		{
			max_val = max_val_center;
			max_ndx = max_ndx_center;
		}
		if(max_val_pos > max_val)
		{
			max_val = max_val_pos;
			max_ndx = max_ndx_pos;
		}
		if (i == 0)
		{
			average = (max_max + min_max) / 2;
			max_max = max_val;
			min_max = max_val;
		}
		else
		{
			if (max_val > max_max)
				max_max = max_val;
			if (max_val < min_max)
				min_max = max_val;
		}

		//Determine if the peak has broken the averaging threshold. Else fails at 50-50 H0 to H1 ratio and high noise. 50-50 give 1.414 gain. Noise crest as high as 6.0
		if (i == 0) { //max_val > average) { // THRESHOLD * 0.5 / PosPeak) {
		//	average = average + (max_val - average) * 0.5;	// fast attack
			FILE* fp_max;
			openError = fopen_s(&fp_max, "MaxValues.txt", "a");
			fprintf(fp_max, "%8.f %8.f\n", max_val0_center, max_val1_center);
			fclose(fp_max);
			printf("max_ndx = %d , max_val = %f\n", max_ndx, max_val);
			if (fp_pd_test_r)
			{
				MyFwrite(r_fll_r + (i*SECTION_SIZE), sizeof(float), 512, fp_pd_test_r);
				MyFwrite(r_fll_i + (i*SECTION_SIZE), sizeof(float), 512, fp_pd_test_i);
				fprintf(fp_pd_test_r, "Index=%d, Mag=%f\n", max_ndx, max_val);
				fprintf(fp_pd_test_i, "Index=%d, Mag=%f\n", max_ndx, max_val);
			}
			if (!pilot_detected) {
				//Pilot Detected!
				pilot_detected = 1;
				pilot_position = max_ndx + i*SECTION_SIZE - PILOT_LENGTH_4;
				// TODO issue. If pilot starts 100 samples into buffer, max_ndx is +101 and the memcpy never fills rf_r/i
				printf("Pilot Position = %d\n", pilot_position);
				if (pilot_position < 0){
					pilot_position = -1*pilot_position;
					// Copies the beginning of the frame from the last function call
					memcpy(rf_r, frame_buffer_r+((SECTION_SIZE-pilot_position)), pilot_position*sizeof(float));
					memcpy(rf_i, frame_buffer_i+((SECTION_SIZE-pilot_position)), pilot_position*sizeof(float));
					// Copies the rest of the frame from the current function call
					memcpy(rf_r+(pilot_position), r_r, (rlen - pilot_position)*sizeof(float));
					memcpy(rf_i+(pilot_position), r_i, (rlen - pilot_position)*sizeof(float));
				}
				if (fp_pd_test_r)
				{
					MyFwrite(rf_r + (i*SECTION_SIZE), sizeof(float), 512, fp_pd_test_r);
					MyFwrite(rf_i + (i*SECTION_SIZE), sizeof(float), 512, fp_pd_test_i);
					fprintf(fp_pd_test_r, "PilotPosition=%d\n", pilot_position);
					fprintf(fp_pd_test_i, "PilotPosition=%d\n", pilot_position);
				}
				// /* this was commented out, but is still reachable. The pilot must be negative to look back in time for valid data from last frame. If positive, the memcpy will try to access data that isn't made yet.
				else{
					printf("PD: Pilot Position is positive. This message should never print.\n");
				}

			}
		else
			{
				printf("Non-Pilot Peak = %8.f\n", max_val);
			}
		}
	}

	//Determine pilot detector mode
	if (pilot_detected){
		good_pilots++;
		if (good_pilots > 3){
			pd_acquired = 1;
			bad_pilots = 0;
		}
		else{
			pd_acquired = 0;
		}
	}
	else{
		bad_pilots++;
		if (bad_pilots > 127){
			pd_acquired = 0;
		}
	}
	// Copy last 512 samples for next function call
	memcpy(frame_buffer_r, r_r+12800, SECTION_SIZE*4);
	memcpy(frame_buffer_i, r_i+12800, SECTION_SIZE*4);

	if (fp_pd_test_r) fclose(fp_pd_test_r);
	if (fp_pd_test_i) fclose(fp_pd_test_i);
	if (fp_pd_r0_neg) fclose(fp_pd_r0_neg);
	if (fp_pd_r1_neg) fclose(fp_pd_r1_neg);
	if (fp_pd_r0_center) fclose(fp_pd_r0_center);
	if (fp_pd_r1_center) fclose(fp_pd_r1_center);
	if (fp_pd_r0_pos) fclose(fp_pd_r0_pos);
	if (fp_pd_r1_pos) fclose(fp_pd_r1_pos);

	*valid = pd_acquired;
}
