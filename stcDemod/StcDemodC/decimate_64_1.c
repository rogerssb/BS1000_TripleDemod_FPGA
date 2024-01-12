#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MALLOC(x) (malloc(x))
#define FREE(x) (free(x))

#ifndef REAL
	#define REAL double 
#endif

#define FILTER_ORDER 8
#define NUM_C 2

// filter coefficients for the half-band filter (because of symmetry, only need first half of non-zero coefficients).
//REAL h_bf_2_1[NUM_C] = {-0.000379, 0.001957, -0.005557, 0.012484, -0.024825, 0.047133, -0.095392, 0.314598};
//REAL h_bf_2_1[NUM_C] = {-0.021739f, 0.277325f};
//REAL h_c = 0.5;
REAL h_c =  0.50428003183361492f;
REAL h_bf_2_1[NUM_C] = {-0.049436909329760352f,  0.2972968934129529f};

void decimate_2_1(REAL *x, int nx, int phase, REAL *y)
{
    int nx2;
    REAL bank0_output;//, bank1_output;
    REAL bank0[FILTER_ORDER+1] = {0.0};
    //REAL bank1[FILTER_ORDER/2] = {0.0};
    REAL acc;
    int i,j,y_ind;    // loop iterators
    
    nx2 = (nx + 1)/2; // get the ceiling of half the length of the input

	// initialize the filter banks

	//printf("NX is %d\n", nx);
    
    y_ind = 0;
    for(i=0; i<nx+FILTER_ORDER/2; i++)
    {
        // shift in next two samples
        for(j=FILTER_ORDER; j>=1; j--)
        {
            bank0[j] = bank0[j-1];
        }
        if(i < nx)
        {
            bank0[0] = x[i];
        } 
        else 
        {
            bank0[0] = 0.0;
        }
        
        // add bank outputs, save in output array, ignoring startup transients
        if(i >= (FILTER_ORDER/2+phase) && y_ind < nx2 && i%2==((0+phase)%2))
        {        
			// compute filter output of bank0
			acc = h_c*bank0[FILTER_ORDER/2];
			//acc = h_bf_2_1[NUM_C-1]*bank0[FILTER_ORDER/2];
			for(j=0; j<NUM_C; j++)
			{
				acc += (bank0[2*j+1] + bank0[FILTER_ORDER-2*j-1])*h_bf_2_1[j];
				//acc += (bank0[j] + bank0[FILTER_ORDER-j])*h_bf_2_1[j];
			}

            y[y_ind] = acc;
			//printf("Bank0(0) = %4.4f, i=%d, Acc = %4.4f, y_ind=%d\n", bank0[0], i, acc, y_ind);
            y_ind++;
        }
    }
}

void decimate_64_1(REAL *x, int nx, int phase, REAL *y)
{
	REAL *working;
	int i;
	REAL temp;

	working = (REAL *)MALLOC(nx*sizeof(REAL));
/*	for (i = 0; i < 512; i++)
	{
		x[i] = i/128.0;
		temp = x[i];
	};
*/
	decimate_2_1(x, nx, (0x1&phase), working);
	decimate_2_1(working, nx>>1, (0x1&(phase>>1)), working);
	decimate_2_1(working, nx>>2, (0x1&(phase>>2)), working);
	decimate_2_1(working, nx>>3, (0x1&(phase>>3)), working);
	decimate_2_1(working, nx>>4, (0x1&(phase>>4)), working);
	decimate_2_1(working, nx>>5, (0x1&(phase>>5)), y);/**/

	FREE(working);
}
