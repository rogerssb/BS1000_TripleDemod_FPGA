/*
 * Copyright (c) 2005 Joseph McRae Palmer
 */

#ifndef COMPLEX_MATH_H
    #define COMPLEX_MATH_H
    #include <math.h>

    #define REAL float

    void complex_mult(float a, float b, float c, float d, float *x, float *y);
	void complex_mult_double(double a, double b, double c, double d, double *x, double *y);

    void complex_abs2(float a, float b, float *m);
    void complex_abs2_double(double a, double b, double *m);

#endif


