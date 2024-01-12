/***
 * find_pilot.c implements the pilot detector. It utilizes a frequency domain matched filter.
 * Two matched filters are used, one for each pilot template. A controller is then used to
 * decide which filter response to use. Besides detecting the pilot, find_pilot.c also
 * formats the data stream into frames. Each frame contains 12,800 data samples, followed by
 * the 256-sample pilot.
 *
 * Copyright (c) 2005 Joseph McRae Palmer
 ***/

#include "find_pilot.h"

#define BUF_LENGTH 13823

#define MEDIAN_LENGTH	7
#define MEDIAN_LOC		3
int pilot_start_buffer[MEDIAN_LENGTH] = {0, 0, 0, 0, 0, 0, 0};
int	pilot_start_ndx[MEDIAN_LENGTH] = {0, 1, 2, 3, 4, 5, 6};

#define PD_DATA_LENGTH 12800

#define FFT_LENGTH 4096

#define THRESHOLD 0.25e5 

//extern FILE * fp_output_r;
//extern FILE * fp_output_i;

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

// implements a median filter that smooths jitter in the pilot location
int median_filt(int x, int *data, int *ndx_array, int len, int median_loc)
{
	int	i;
	int	ndx;
	static int frame_cnt = MEDIAN_LOC;

	// increment all of the indexes in the index array
	for(i = 0; i < len; i++)
		ndx_array[i]++;

	// find the oldest sample in the data array (its index will now be len)
	ndx = 0;
	while(ndx < len-1 && ndx_array[ndx] != len)
		ndx++;

	// discard it by shifting everything down
	for(i = ndx; i < len-1; i++)
	{
		ndx_array[i] = ndx_array[i+1];
		data[i] = data[i+1];
	}

	// determine where x should be inserted into the array
	ndx = 0;
	while(x > data[ndx] && ndx < len-1)
		ndx++;

	// shift samples up and insert x
	for(i = len-1; i > ndx; i--)
	{
		data[i] = data[i-1];
		ndx_array[i] = ndx_array[i-1];
	}
	data[ndx] = x;
	ndx_array[ndx] = 0;

	// return the median value
	if(frame_cnt >= 0)		// if the median filter doesn't have enough samples in it yet
	{						// to return a valid result then just return the input sample
		frame_cnt--;
		return(x);
	}
	else
		return(data[median_loc]);
}



///////////////////////////////////////////////////////
// user functions

/***
 * FUNCTION : find_pilot()
 *
 * DESCRIPTION : find_pilot() detects the pilot in the input stream. After detection, it
 *				continues to verify the location, and also formats the data frames. Each frame
 *				contains 12,800 data samples at the front, followed by the 256-sample pilot
 *				which was detected. Note that the source of the data stream used for detection 
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
 * Copyright (c) 2005 Joseph McRae Palmer
 ***/
void find_pilot(float *r_fll_r, float *r_fll_i,
				float *r_r, float *r_i, int rlen, 
				float *p0_r, float *p0_i, float *p1_r, float *p1_i, 
				float *rf_r, float *rf_i, int *valid){                    
    FILE *pd_out_r, *pd_out_i;
	char file_r[40],file_i[40];
	float filler[128] = {0.0f};
	static int frame_count = 0;

    int num_transforms,stride;
    int i,k,l;  // loop indices
    int current_ind0, current_ind1, current_max_ind0;
    int max_ind0, max_ind1;
	float max_val0, max_val1;
    int current_max_ind1;
    
	float current_max_val0, current_max_val1;

    // record if acquisition has been made
    static int acquired = 0;
    
    // store pilot index of frames
    static int pilot_0 = -1;
    static int pilot_1 = -1;
	static int pilot_start = -1;
	int pilot_start_r = 0, pilot_start_i;
	int buf_pilot_start = 0;
    
    // record number of good pilots seen in a row
    static int good_pilots0 = 0;  
    static int good_pilots1 = 0;
    static int bad_pilots = 0;
   
    // store the pilot signal templates
    static first_run = 1;
    float p0_template_r[PILOT_LENGTH_4], p0_template_i[PILOT_LENGTH_4]; 
    float p1_template_r[PILOT_LENGTH_4], p1_template_i[PILOT_LENGTH_4];
    static float P0_r[FFT_LENGTH], P0_i[FFT_LENGTH];
    static float P1_r[FFT_LENGTH], P1_i[FFT_LENGTH];
    
    // ping-pong buffers
	static float buf_r[2*BUF_LENGTH] = {0};
	static float buf_i[2*BUF_LENGTH] = {0};
	static float buf_fll_r[2*BUF_LENGTH] = {0};
	static float buf_fll_i[2*BUF_LENGTH] = {0};
	static current_buf = 0;
	static old_buf = 1;
	int old_buf_data_length_r = 0;
	int old_buf_data_length_i = 0;

    float temp0_r[FFT_LENGTH], temp0_i[FFT_LENGTH]; 
    float temp1_r[FFT_LENGTH], temp1_i[FFT_LENGTH];
    float c0[FFT_LENGTH], c1[FFT_LENGTH];
    float R_r[FFT_LENGTH], R_i[FFT_LENGTH];
    float val0,val1; // current max values
    int ind0,ind1; // current indices of max values
    FILE * fp_p0_r = fopen("p0_r.dat", "wb");
	FILE * fp_p0_i = fopen("p0_i.dat", "wb");
	FILE * fp_p1_r = fopen("p1_r.dat", "wb");
	FILE * fp_p1_i = fopen("p1_i.dat", "wb");
	
	fwrite(p0_r, sizeof(float), 512, fp_p0_r);
	fwrite(p0_i, sizeof(float), 512, fp_p0_i);
	fwrite(p1_r, sizeof(float), 512, fp_p1_r);
	fwrite(p1_i, sizeof(float), 512, fp_p1_i);

	fclose(fp_p0_r);
	fclose(fp_p0_i);
	fclose(fp_p1_r);
	fclose(fp_p1_i);

    num_transforms = (int)(ceil(BUF_LENGTH/((float)FFT_LENGTH-511)));	// number of FFTs to compute for each input frame
    stride = (int)ceil(BUF_LENGTH/(float)num_transforms);	// amount to stride through data between each transform
    
    
    // create templates (time reversed and conjugated)
    // only runs the first time find_pilot() is called
    if(first_run){
        first_run = 0;
        for(i=0; i< PILOT_LENGTH_4; i++){
            p0_template_r[i] = p0_r[(PILOT_LENGTH_4-1)-i]; p0_template_i[i] = -1.0f*p0_i[(PILOT_LENGTH_4-1)-i];
            p1_template_r[i] = p1_r[(PILOT_LENGTH_4-1)-i]; p1_template_i[i] = -1.0f*p1_i[(PILOT_LENGTH_4-1)-i];
        }
        fft(p0_template_r,p0_template_i,PILOT_LENGTH_4,P0_r,P0_i,FFT_LENGTH);
        fft(p1_template_r,p1_template_i,PILOT_LENGTH_4,P1_r,P1_i,FFT_LENGTH);
    }
    
	/****
     * copy input data into buffer from fll
	 ****/

	// copy last 511 samples to beginning of buffer
	memcpy(buf_fll_r+current_buf*BUF_LENGTH,
		buf_fll_r+old_buf*BUF_LENGTH+BUF_LENGTH-(PILOT_LENGTH_4-1),
		(PILOT_LENGTH_4-1)*sizeof(float));
	memcpy(buf_fll_i+current_buf*BUF_LENGTH,
		buf_fll_i+old_buf*BUF_LENGTH+BUF_LENGTH-(PILOT_LENGTH_4-1),
		(PILOT_LENGTH_4-1)*sizeof(float));
	// copy new frame into end of buffer
	memcpy(buf_fll_r+current_buf*BUF_LENGTH+(PILOT_LENGTH_4-1),
		r_fll_r,FRAME_LENGTH_4*sizeof(float));
	memcpy(buf_fll_i+current_buf*BUF_LENGTH+(PILOT_LENGTH_4-1),
		r_fll_i,FRAME_LENGTH_4*sizeof(float));

	/*fwrite(buf_fll_r, sizeof(float), 2*BUF_LENGTH, fp_output_r);
	fwrite(filler,sizeof(float),128,fp_output_r);
	fwrite(buf_fll_i, sizeof(float), 2*BUF_LENGTH, fp_output_i);
	fwrite(filler,sizeof(float),128,fp_output_i);*/

	/****
	 * copy input data into buffer from resampler
	 ****/

	// copy last 511 samples to beginning of buffer
	memcpy(buf_r+current_buf*BUF_LENGTH,
		buf_r+old_buf*BUF_LENGTH+BUF_LENGTH-(PILOT_LENGTH_4-1),
		(PILOT_LENGTH_4-1)*sizeof(float));
	memcpy(buf_i+current_buf*BUF_LENGTH,
		buf_i+old_buf*BUF_LENGTH+BUF_LENGTH-(PILOT_LENGTH_4-1),
		(PILOT_LENGTH_4-1)*sizeof(float));
	// copy new frame into end of buffer
	memcpy(buf_r+current_buf*BUF_LENGTH+(PILOT_LENGTH_4-1),
		r_r,FRAME_LENGTH_4*sizeof(float));
	memcpy(buf_i+current_buf*BUF_LENGTH+(PILOT_LENGTH_4-1),
		r_i,FRAME_LENGTH_4*sizeof(float));
    
    current_ind0 = 0;
    current_ind1 = 0;
    current_max_ind0 = 0;
    current_max_val0 = 0;
    current_max_ind1 = 0;
    current_max_val1 = 0;    


	/////////////////////////////////////////////////////////
	/* The frequency-domain, complex matched filter kernel.
	 * Ideally, a 16384-point FFT would give the most accurate result. But, for reasons
	 * of improved efficiency, a FFT_LENGTH-point FFT is used instead. This requires less memory,
	 * and gives a good response also. Because of this, the input data must be searched 
	 * over multiple windows.
	 */

	/*sprintf(file_r,"pd_out_%d_r.dat",frame_count);
	sprintf(file_i,"pd_out_%d_i.dat",frame_count++);
	pd_out_r = fopen(file_r,"wb");
	pd_out_i = fopen(file_i,"wb");*/

	/*fwrite(buf_fll_r+current_buf*BUF_LENGTH, sizeof(float), BUF_LENGTH, fp_output_r);
	fwrite(buf_fll_i+current_buf*BUF_LENGTH, sizeof(float), BUF_LENGTH, fp_output_i);*/

    for(k=0; k<num_transforms; k++){
        if(current_ind0+stride+(PILOT_LENGTH_4-1) < BUF_LENGTH){
            fft(buf_fll_r+current_buf*BUF_LENGTH+current_ind0,
				buf_fll_i+current_buf*BUF_LENGTH+current_ind0,
				stride+(PILOT_LENGTH_4-1),R_r,R_i,FFT_LENGTH);
        } else {
            fft(buf_fll_r+current_buf*BUF_LENGTH+current_ind0,
				buf_fll_i+current_buf*BUF_LENGTH+current_ind0,
				BUF_LENGTH-current_ind0,R_r,R_i,FFT_LENGTH);
        }
        for(l=0;l<FFT_LENGTH;l++){ // frequency domain convolution
            complex_mult(R_r[l],R_i[l],P0_r[l],P0_i[l],&temp0_r[l],&temp0_i[l]);
            complex_mult(R_r[l],R_i[l],P1_r[l],P1_i[l],&temp1_r[l],&temp1_i[l]);
        }
        // transform back to time domain
        ifft(temp0_r,temp0_i,FFT_LENGTH,temp0_r,temp0_i,FFT_LENGTH);
        ifft(temp1_r,temp1_i,FFT_LENGTH,temp1_r,temp1_i,FFT_LENGTH);
        for(l=0;l<FFT_LENGTH;l++){ // compute magnitude squared of complex temp arrays
            complex_abs2(temp0_r[l],temp0_i[l],&c0[l]);
            complex_abs2(temp1_r[l],temp1_i[l],&c1[l]);
        }

		/*fwrite(c0,sizeof(float),FFT_LENGTH,pd_out_r);
		fwrite(filler,sizeof(float),128,pd_out_r);
		fwrite(c1,sizeof(float),FFT_LENGTH,pd_out_i);
		fwrite(filler,sizeof(float),128,pd_out_i);*/

		// locate the maximum value for the current window, save if is the biggest so far
        find_max(c0,FFT_LENGTH,&val0,&ind0);
        if (current_max_val0 < val0){
            current_max_val0 = val0;
            current_max_ind0 = current_ind0 + ind0;
        }
        find_max(c1,FFT_LENGTH,&val1,&ind1);
        if (current_max_val1 < val1){
            current_max_val1 = val1;
            current_max_ind1 = current_ind1 + ind1;
			}
        current_ind0 = current_ind0 + stride;
        current_ind1 = current_ind1 + stride;
        if (current_ind0 > BUF_LENGTH){
            break;
        }
    }

	/*fclose(pd_out_r);
	fclose(pd_out_i);*/
    
    max_ind0 = current_max_ind0 - (PILOT_LENGTH_4-1);
	max_val0 = current_max_val0;
    max_ind1 = current_max_ind1 - (PILOT_LENGTH_4-1);
	max_val1 = current_max_val1;

	//printf("\tmax_ind = %d\tmax_val = %f\n",max_ind1,max_val1); 



    
	///////////////////////////////////////////////////////////////////////
	// Control and decision 
    if(!acquired){	// trying to find the pilot
        if ( abs(max_ind0-pilot_0) < 3 && max_val0 > THRESHOLD){
            good_pilots0++;
        } else {
            good_pilots0 = 0;
        }
        if ( abs(max_ind1-pilot_1) < 3 && max_val1 > THRESHOLD){
            good_pilots1++;
        } else {
            good_pilots1 = 0;
        }
        
        if(good_pilots0 > 2 || good_pilots1 > 2){
            acquired = 1;
            bad_pilots = 0;
        }    
        pilot_0 = max_ind0; //current_max_ind0 - 255;
        pilot_1 = max_ind1; //current_max_ind1 - 255;
		*valid = 0;   
    } else if(acquired){	// pilot is located, decide where it is, and save location
        if ( (abs(max_ind0-pilot_0) >= 3 || max_val0 < THRESHOLD) 
			&& (abs(max_ind1-pilot_1) >= 3 || max_val1 < THRESHOLD) ){
            bad_pilots++;
        } else {
            bad_pilots = 0;
			// use the earliest pilot as the start point
			if(pilot_0 < pilot_1 && pilot_0 >= 0)
			{
				if(abs(max_ind0-pilot_0) < 3)
					pilot_start = current_max_ind0 - (PILOT_LENGTH_4-1);
				else
					pilot_start = pilot_0;
			}
			else
			{
				if( abs(max_ind1-pilot_1) < 3 )
					pilot_start = current_max_ind1 - (PILOT_LENGTH_4-1);
				else
					pilot_start = pilot_1;
			}

			// update the pilot locations if this was a good pilot correlation
			if(abs(max_ind0-pilot_0) < 3 && max_val0 > THRESHOLD)
				pilot_0 = current_max_ind0 - (PILOT_LENGTH_4-1);
			if( abs(max_ind1-pilot_1) < 3 && max_val1 > THRESHOLD)
			{
				pilot_1 = current_max_ind1 - (PILOT_LENGTH_4-1);
			}
        }

		// run the pilot_start filter through the median filter to help remove outliers
		pilot_start = median_filt(pilot_start, pilot_start_buffer, pilot_start_ndx, MEDIAN_LENGTH, MEDIAN_LOC);




		//////////////////////////////////////////////////////////////////////
		// Output data frame formatting

		// copy data into output buffer
		// copy stuff from old buffer first
		pilot_start_r = pilot_start + 1;
		pilot_start_i = pilot_start;
		old_buf_data_length_r = PD_DATA_LENGTH - pilot_start_r;
		old_buf_data_length_i = PD_DATA_LENGTH - pilot_start_i;
		if(pilot_start_r < 0 || pilot_start_i < 0){
            acquired = 0;
            good_pilots0 = 0;
            good_pilots1 = 0;
			*valid = 0;   
			current_buf = (current_buf+1)%2;
			old_buf = (old_buf+1)%2;
			return;
		}
		if(old_buf_data_length_r >= 0 || old_buf_data_length_r >= 0){
			memcpy(rf_r, buf_r+old_buf*BUF_LENGTH+BUF_LENGTH-old_buf_data_length_r-(PILOT_LENGTH_4-1),
				old_buf_data_length_r*sizeof(float));
			memcpy(rf_i, buf_i+old_buf*BUF_LENGTH+BUF_LENGTH-old_buf_data_length_i-(PILOT_LENGTH_4-1),
				old_buf_data_length_i*sizeof(float));
			// now copy stuff from active buffer
			memcpy(rf_r+old_buf_data_length_r, 
				buf_r+current_buf*BUF_LENGTH, 
				(PD_DATA_LENGTH-old_buf_data_length_r)*sizeof(float));
			memcpy(rf_i+old_buf_data_length_i, 
				buf_i+current_buf*BUF_LENGTH, 
				(PD_DATA_LENGTH-old_buf_data_length_i)*sizeof(float));
		} else {

			memcpy(rf_r, 
				buf_r+current_buf*BUF_LENGTH + pilot_start_r - PD_DATA_LENGTH, 
				PD_DATA_LENGTH*sizeof(float));
			memcpy(rf_i, 
				buf_i+current_buf*BUF_LENGTH + pilot_start_i - PD_DATA_LENGTH, 
				PD_DATA_LENGTH*sizeof(float));
		}
		
		// copy detected pilot into output buffer
		memcpy(rf_r+DATA_LENGTH_4, 
			buf_r+current_buf*BUF_LENGTH+pilot_start_r, 
			PILOT_LENGTH_4*sizeof(float));
		memcpy(rf_i+DATA_LENGTH_4, 
			buf_i+current_buf*BUF_LENGTH+pilot_start_i, 
			PILOT_LENGTH_4*sizeof(float));

        if(bad_pilots > 100){
            acquired = 0;
            good_pilots0 = 0;
            good_pilots1 = 0;
        }    
		*valid = 1;    
    }

	// toggle active ping-pong buffers	
	current_buf = (current_buf+1)%2;
	old_buf = (old_buf+1)%2;
}
