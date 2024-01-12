/*
 * complex_math.c contains a collection of routines that implement mathematical operations for complex numbers.
 *
 * Copyright (c) 2005 Joseph McRae Palmer
*/

#include "complex_math.h"

/***
* FUNCTION: complex_mult()
* DESCRIPTION: Implements the multiply operation for single-precision floating-point complex numbers. 
* ARGUMENTS: 
*		a	:	real part of operand 1
*		b	:	imaginary part of operand 1
*		c	:	real part of operand 2
*		d	:	imaginary part of operand 2
*		x	:	pointer to the real part of the result
*		y	:	pointer to the imaginary part of the result
*
*
* Copyright (c) 2005 Joseph McRae Palmer
***/
void complex_mult(float a, float b, float c, float d, float *x, float *y){
    *x = a*c-b*d;
    *y = a*d+b*c;
}



/***
* FUNCTION: complex_mult_double()
* DESCRIPTION: Implements the multiply operation for double-precision floating-point complex numbers. 
* ARGUMENTS: 
*		a	:	real part of operand 1
*		b	:	imaginary part of operand 1
*		c	:	real part of operand 2
*		d	:	imaginary part of operand 2
*		x	:	pointer to the real part of the result
*		y	:	pointer to the imaginary part of the result
*
*
* Copyright (c) 2005 Joseph McRae Palmer
***/
void complex_mult_double(double a, double b, double c, double d, double *x, double *y){
    *x = a*c-b*d;
    *y = a*d+b*c;
}



/***
* FUNCTION: complex_abs2()
* DESCRIPTION: Implements the magnitude squared operation for a single-precision floating-point complex numbers. 
* ARGUMENTS: 
*		a	:	real part of the operand 
*		b	:	imaginary part the operand 
*		m	:	pointer to the result
*
*
* Copyright (c) 2005 Joseph McRae Palmer
***/
void complex_abs2(float a, float b, float *m){
    *m = a*a+b*b;
}



/***
* FUNCTION: complex_abs2_double()
* DESCRIPTION: Implements the magnitude squared operation for a double-precision floating-point complex numbers. 
* ARGUMENTS: 
*		a	:	real part of the operand 
*		b	:	imaginary part the operand 
*		m	:	pointer to the result
*
*
* Copyright (c) 2005 Joseph McRae Palmer
***/
void complex_abs2_double(double a, double b, double *m){
    *m = a*a+b*b;
}

