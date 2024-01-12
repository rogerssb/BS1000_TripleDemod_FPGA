/***
 * fft.c contains functions which implement the forward and inverse Fast Fourier Transform. Both
 * functions use the iterative, decimation-in-frequency, radix-2 FFT algorithm. This algorithm
 * involves a data reordering operation at completion.
 ***/

#include <stdlib.h>
#include "fft.h"



///////////////////////////////////////////////
// Helper functions

// generates a bit reversed index
int br(int oi, int len){
    int ni = 0,len2=0,i;
    int bl,bh;
    len2 = (int)(ceil((float)len/2.0));
    
    for(i=0; i<len2; i++){
        bl = 1&(oi >> i);
        bh = 1&(oi >> (len-1-i));
        
        ni = ni | (bl << (len-1-i));
        ni = ni | (bh << i);
    }
    
    return ni;
}

// performs an array copy, but with the indices in bit-reversed order
void bit_reverse_copy(float *x, float *X, int len){
    int i, index_len;
    index_len = (int)(log((float)len)/log(2.0f));
    for(i=0; i<len; i++){
        X[i] = x[br(i,index_len)];
    }    
}
void bit_reverse_copy_double(double *x, double *X, int len){
    int i, index_len;
    index_len = (int)(log((double)len)/log(2.0));
    for(i=0; i<len; i++){
        X[i] = x[br(i,index_len)];
    }    
}

// performs an array copy. If Xlen > xlen, then the destination array is zero-padded.
void vector_copy(float *x, int xlen, float *X, int Xlen){
    int i;
    for(i=0; i<xlen; i++){
        X[i] = x[i];
    }   
    for(i=xlen;i<Xlen;i++){ // zero pad
        X[i] = 0.0f;
    }
}
void vector_copy_double(double *x, int xlen, double *X, int Xlen){
    int i;
    for(i=0; i<xlen; i++){
        X[i] = x[i];
    }   
    for(i=xlen;i<Xlen;i++){ // zero pad
        X[i] = 0.0;
    }
}







/////////////////////////////////////////////////////////
// User functions


/*******
 * FUNCTION : fft()
 * DESCRIPTION :	fft() implements the forward Fast Fourier Transform. The iterative,
 *					decimation-in-frequence, radix-2 algorithm is used. If the length of
 *					the input vector xlen is less than the output vector length Xlen, then
 *					the input will be zero-padded. Note that Xlen must be a power of two.
 * ARGUMENTS :	
 *			x_r		:	real part of the input vector
 *			x_i		:	imaginary part of the input vector
 *			xlen	:	length of the input vector
 *			X_r		:	real part of the output vector
 *			X_i		:	imaginary part of the output vector
 *			Xlen	:	length of the output vector, must be a power of two
 *
 *
 * Copyright (c) 2005 Joseph McRae Palmer
 *******/
void fft(float *x_r, float *x_i, int xlen, float *X_r, float *X_i, int Xlen){
    int s,k,j,m;
    int n,logn;
    float wm_r, wm_i, w_r, w_i;
    float t_r, t_i, u_r, u_i;
    float *Xtemp_r, *Xtemp_i;
    
	// allocate storage for intermediate results
    Xtemp_r = (float *)malloc(Xlen*sizeof(float)); 
    Xtemp_i = (float *)malloc(Xlen*sizeof(float));

    n = Xlen;
    logn = (int)(log((float)Xlen)/log(2.0));
      
	// copy input vector, will zero-pad if xlen < Xlen
    vector_copy(x_r,xlen,Xtemp_r,Xlen); 
    vector_copy(x_i,xlen,Xtemp_i,Xlen); 

	///////////////////////////////////////////////////
	// FFT kernel
    for(s=logn; s >= 1; s--) {	// loop through the log2(Xlen) columns of butterflies
        m = 1 << s;
        wm_r = (float)cos(PI_2/(float)m); wm_i = (float)-sin(PI_2/(float)m); // set the phaser incrementor

		// loop through the Xlen/2 rows of butterflies
        for(k=0; k<n; k+=m){	
            w_r = 1; w_i=0;		// initialize the phasor
            for(j=0; j<m/2; j++){

				// execute the butterfly
                t_r = Xtemp_r[k+j]; t_i = Xtemp_i[k+j]; 
                u_r = Xtemp_r[k+j+m/2]; u_i = Xtemp_i[k+j+m/2]; 
                Xtemp_r[k+j] = t_r + u_r; Xtemp_i[k+j] = t_i + u_i;
                Xtemp_r[k+j+m/2] = t_r - u_r; Xtemp_i[k+j+m/2] = t_i - u_i;
                complex_mult(w_r, w_i, Xtemp_r[k+j+m/2], Xtemp_i[k+j+m/2],
                                Xtemp_r+k+j+m/2, Xtemp_i+k+j+m/2);
                complex_mult(w_r,w_i,wm_r,wm_i,&w_r,&w_i); // spin the phasor
            }
        }
    }

	// reorder the output vector to bit-reversed order
   bit_reverse_copy(Xtemp_r,X_r,Xlen);  
   bit_reverse_copy(Xtemp_i,X_i,Xlen);  

   // unallocate the memory for intermediate results
   free(Xtemp_r);
   free(Xtemp_i);
}
void fft_double(double *x_r, double *x_i, int xlen, double *X_r, double *X_i, int Xlen){
    int s,k,j,m;
    int n,logn;
    double wm_r, wm_i, w_r, w_i;
    double t_r, t_i, u_r, u_i;
    double *Xtemp_r, *Xtemp_i;
    
	// allocate storage for intermediate results
    Xtemp_r = (double *)malloc(Xlen*sizeof(double)); 
    Xtemp_i = (double *)malloc(Xlen*sizeof(double));

    n = Xlen;
    logn = (int)(log((double)Xlen)/log(2.0));
      
	// copy input vector, will zero-pad if xlen < Xlen
    vector_copy_double(x_r,xlen,Xtemp_r,Xlen); 
    vector_copy_double(x_i,xlen,Xtemp_i,Xlen); 

	///////////////////////////////////////////////////
	// FFT kernel
    for(s=logn; s >= 1; s--) {	// loop through the log2(Xlen) columns of butterflies
        m = 1 << s;
        wm_r = (double)cos(PI_2/(double)m); wm_i = (double)-sin(PI_2/(double)m); // set the phaser incrementor

		// loop through the Xlen/2 rows of butterflies
        for(k=0; k<n; k+=m){	
            w_r = 1; w_i=0;		// initialize the phasor
            for(j=0; j<m/2; j++){

				// execute the butterfly
                t_r = Xtemp_r[k+j]; 
				t_i = Xtemp_i[k+j]; 
                u_r = Xtemp_r[k+j+m/2]; 
				u_i = Xtemp_i[k+j+m/2]; 
                Xtemp_r[k+j] = t_r + u_r; 
				Xtemp_i[k+j] = t_i + u_i;
                Xtemp_r[k+j+m/2] = t_r - u_r; 
				Xtemp_i[k+j+m/2] = t_i - u_i;
                complex_mult_double(w_r, w_i, 
					Xtemp_r[k+j+m/2], Xtemp_i[k+j+m/2],
                    Xtemp_r+k+j+m/2, Xtemp_i+k+j+m/2);
                complex_mult_double(w_r,w_i,wm_r,wm_i,&w_r,&w_i); // spin the phasor
            }
        }
    }

	// reorder the output vector to bit-reversed order
   bit_reverse_copy_double(Xtemp_r,X_r,Xlen);  
   bit_reverse_copy_double(Xtemp_i,X_i,Xlen);  

   // unallocate the memory for intermediate results
   free(Xtemp_r);
   free(Xtemp_i);
}



/*******
 * FUNCTION : ifft()
 * DESCRIPTION :	fft() implements the inverse Fast Fourier Transform. The iterative,
 *					decimation-in-frequency, radix-2 algorithm is used. If the length of
 *					the input vector xlen is less than the output vector length Xlen, then
 *					the input will be zero-padded. Note that Xlen must be a power of two.
 * ARGUMENTS :	
 *			x_r		:	real part of the input vector
 *			x_i		:	imaginary part of the input vector
 *			xlen	:	length of the input vector
 *			X_r		:	real part of the output vector
 *			X_i		:	imaginary part of the output vector
 *			Xlen	:	length of the output vector, must be a power of two
 *
 *
 * Copyright (c) 2005 Joseph McRae Palmer
 *******/
void ifft(float *x_r, float *x_i, int xlen, float *X_r, float *X_i, int Xlen){
    int s,k,j,m;
    int n,logn;
	float Ninv;
    float wm_r, wm_i, w_r, w_i;
    float t_r, t_i, u_r, u_i;
    float *Xtemp_r, *Xtemp_i;
    
	// allocate storage for intermediate results
    Xtemp_r = (float *)malloc(Xlen*sizeof(float));
    Xtemp_i = (float *)malloc(Xlen*sizeof(float));

    n = Xlen;
    logn = (int)(log((float)Xlen)/log(2.0));
      
	// copy input vector, will zero-pad if xlen < Xlen
   // imaginary and real parts swapped for the inverse FFT
    vector_copy(x_r,xlen,Xtemp_i,Xlen); 
    vector_copy(x_i,xlen,Xtemp_r,Xlen); 
	
	///////////////////////////////////////////////////
	// FFT kernel
    for(s=logn; s >= 1; s--) { // loop through the log2(Xlen) columns of butterflies
        m = 1 << s;
        wm_r = (float)cos(PI_2/(float)m); wm_i = (float)-sin(PI_2/(float)m); // set the phaser incrementor

		// loop through the Xlen/2 rows of butterflies
        for(k=0; k<n; k+=m){
            w_r = 1; w_i=0;		// initialize the phasor
            for(j=0; j<m/2; j++){

				// execute the butterfly
                t_r = Xtemp_r[k+j]; t_i = Xtemp_i[k+j]; 
                u_r = Xtemp_r[k+j+m/2]; u_i = Xtemp_i[k+j+m/2]; 
                Xtemp_r[k+j] = t_r + u_r; Xtemp_i[k+j] = t_i + u_i;
                Xtemp_r[k+j+m/2] = t_r - u_r; Xtemp_i[k+j+m/2] = t_i - u_i;
                complex_mult(w_r,w_i,Xtemp_r[k+j+m/2],Xtemp_i[k+j+m/2],
                                Xtemp_r+k+j+m/2,Xtemp_i+k+j+m/2);
                complex_mult(w_r,w_i,wm_r,wm_i,&w_r,&w_i); // spin the phasor
            }
        }
    }

	// for the inverse FFT, scale the output vector by the inverse of the output length
	Ninv = 1.0f/Xlen;
   for(j=0;j<Xlen;j++){
        Xtemp_r[j] *= Ninv;
        Xtemp_i[j] *= Ninv;
   }

   // reorder the output vector to bit-reversed order
   // imaginary and real parts swapped for the inverse FFT
   bit_reverse_copy(Xtemp_r,X_i,Xlen);  
   bit_reverse_copy(Xtemp_i,X_r,Xlen);  

   // unallocate the memory for intermediate results
   free(Xtemp_r);
   free(Xtemp_i);
}

