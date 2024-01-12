/*
 * Copyright (c) 2005 Joseph McRae Palmer
 */

#ifndef FFT_H
    #define FFT_H
    #include "complex_math.h"

	#ifndef PI_2
		#define PI_2 6.28318530718
	#endif

    int br(int oi, int len);
    void bit_reverse_copy(float *x, float *X, int len);
    void vector_copy(float *x, int xlen, float *X, int Xlen);
    void fft(float *x_r, float *x_i, int xlen, float *X_r, float *X_i, int Xlen);
    void ifft(float *x_r, float *x_i, int xlen, float *X_r, float *X_i, int Xlen);
#endif

