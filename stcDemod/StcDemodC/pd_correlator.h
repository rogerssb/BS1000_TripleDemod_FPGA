#ifndef PD_CORRELATOR_H
#define PD_CORRELATOR_H

#include "defines.h"
#include "complex_math.h"
#include "fft.h"

void pd_correlator(
    float *x_r, float *x_i,
    float *h0_r, float *h0_i, 
    float *h1_r, float *h1_i, 
    float *r0_neg, float *r1_neg,
    float *r0_center, float *r1_center,
    float *r0_pos, float *r1_pos
);

#endif
