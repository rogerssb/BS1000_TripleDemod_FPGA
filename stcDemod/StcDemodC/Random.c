/*
 *	Random.c contains the random number generator routines
 *
 *	Random number generator routines taken from Numerical Recipes in C,
 *	2nd Edition, pp. 280, 289-290, 298-299.
 *
 */
 
 

////////////////////////////////
// includes
#include <math.h>

////////////////////////////////
// defines

// defines for ran1()
#define	IA	16807
#define	IM	2147483647
#define	AM	(1.0/IM)
#define	IQ	127773
#define	IR	2836
#define	NTAB	32
#define	NDIV	(1+(IM-1)/NTAB)
#define	EPS	1.2e-7
#define	RNMX	(1.0-EPS)

// defines for rand_bit()
#define IB0		0x00000001		// taps for a 31st order primitive polynomial
#define IB3		0x00000004
#define IB31	0x40000000
#define MASK	(IB3)


////////////////////////////////
// global variables
 
 
/*
 *	Function
 *
 *		ran1()
 *
 *	Description
 *
 *		ran1() generates a uniformly distributed random number between 0.0 and 1.0
 *
 *
 *	Inputs
 *
 *		long *idum			- seed for random number generator (should be passed 
 *							  back into the function each time the function is 
 *							  called and not be modified outside of this function)
 *
 *	Outputs
 *
 *		ran1() returns a uniformly distributed random number (a float between 0.0 and 1.0)
 *
 *	Side Effects
 *
 *		The seed is updated
 *
 */


float ran1(long *idum)
{
	int j;
	long k;
	static long iy = 0;
	static long iv[NTAB];
	float temp;

	if(*idum <= 0 || !iy)
	{
		if(-(*idum) < 1)
			*idum = 1;
		else
			*idum = -(*idum);

		for(j = NTAB+7; j >=0; j--)
		{
			k = (*idum)/IQ;
			*idum = IA*(*idum - k*IQ) - IR*k;
			if(*idum < 0)
				*idum += IM;
			if(j < NTAB)
				iv[j] = *idum;
		}
		iy = iv[0];
	}

	k = (*idum)/IQ;
	*idum = IA*(*idum - k*IQ) - IR*k;
	if(*idum < 0)
		*idum += IM;
	j = iy/NDIV;
	iy = iv[j];
	iv[j] = *idum;

	if((temp=(float)AM*iy) > RNMX)
		return((float)RNMX);
	else
		return(temp);
}


/*
 *	Function
 *
 *		randn()
 *
 *	Description
 *
 *		randn() generates a gaussian distributed random number with zero mean and unit variance
 *
 *		The random numbers are generated in pairs, so on the first call randn() returns the first
 *		random number and stores the second.  On the next call the second random number is returned.
 *
 *
 *	Inputs
 *
 *		long *idum			- seed for random number generator (should be passed 
 *							  back into the function each time the function is 
 *							  called and not be modified outside of this function)
 *
 *	Outputs
 *
 *		randn() returns a gaussian distributed random number with zero mean and unit variance
 *
 *	Side Effects
 *
 *		The seed is updated
 *
 */
float randn(long *idum)
{
	static int iset = 0;
	static float	gset;
	float fac, rsq, v1, v2;

	if(iset == 0)		// there isn't an already computed rv waiting to be used
	{
		// get two uniform rv's on the interval [-1,1]
		do
		{
			v1 = 2.0f*ran1(idum)-1.0f;
			v2 = 2.0f*ran1(idum)-1.0f;
			rsq = v1*v1 + v2*v2;
		} while(rsq >= 1 || rsq == 0.0);	// if they are outside the unit circle, try again

		// perform the Box-Muller transformation to get two normal rv's
		fac = (float)sqrt(-2.0*log(rsq)/rsq);

		gset = v1*fac;		// store this normal rv for next time
		iset = 1;			// set the flag
		return(v2*fac);		// return this normal rv
	}
	else				// there is an already computed rv waiting to be used
	{
		iset = 0;		// clear flag
		return(gset);	// return the precomputed rv
	}
}



/*
 *	Function
 *
 *		rand_bit()
 *
 *	Description
 *
 *		rand_bit() generates a random bit (0 or 1)
 *
 *		The bits are generated pseudo-randomly with a shift register.
 *
 *
 *	Inputs
 *
 *		unsignedlong *idum	- seed for random number generator (should be passed 
 *							  back into the function each time the function is 
 *							  called and not be modified outside of this function)
 *
 *	Outputs
 *
 *		rand_bit() returns a random bit (0 or 1)
 *
 *	Side Effects
 *
 *		The seed is updated
 *
 */
int rand_bit(unsigned long *iseed)
{
	if(*iseed & IB31)
	{
		*iseed = ((*iseed ^ MASK) << 1) | IB0;
		return(1);
	}
	else
	{
		*iseed <<= 1;
		return(0);
	}
}
