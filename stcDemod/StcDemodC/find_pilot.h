/*
 * Copyright (c) 2005 Joseph McRae Palmer
 */

#ifndef FIND_PILOT_H
    #define FIND_PILOT_H
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
	#include <string.h>
    #include "complex_math.h"
    #include "fft.h"
	#include "defines.h"

    #ifndef PI
        #define PI 3.14159265
    #endif
    
    

    void find_max(float *x, int xlen, float *max_val, int *max_ind);
	void pilot_detector(float *r_fll_r, float *r_fll_i,
					float *r_r, float *r_i, int rlen, 
					float *p0_r, float *p0_i, float *p1_r, float *p1_i, 
					float *rf_r, float *rf_i, int *valid);  
    void pd_correlator(float* x_r, float* x_i,
        float* h0_r, float* h0_i,
        float* h1_r, float* h1_i,
        float* r0_neg, float* r1_neg,
        float* r0_center, float* r1_center,
        float* r0_pos, float* r1_pos);

#endif

