/*
 * Copyright (c) 2005 Joseph McRae Palmer
 */

#ifndef PILOT_DETECTOR_H
    #define PILOT_DETECTOR_H
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
	int FLL(float *s_in_r, float *s_in_i, float *signal_r, float *signal_i, float *v, int num_samps, float K);
	void pilot_detector(float *r_fll_r, float *r_fll_i,
					float *r_r, float *r_i, int rlen, float fll_K,
					float *p0_r, float *p0_i, float *p1_r, float *p1_i, 
					float *rf_r, float *rf_i, int *valid);  

#endif

