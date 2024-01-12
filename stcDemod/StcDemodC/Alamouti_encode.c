/*
 *	Alamouti_encode.c contains the function that generates two Alamouti encoded bit streams 
 *	from the input bit stream.
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */
 
 
////////////////////////////////
// includes


////////////////////////////////
// defines


////////////////////////////////
// global variables
 
 
/*
 *	Function
 *
 *		Alamouti_encode()
 *
 *	Description
 *
 *		Alamouti_encode() generates two Almouti STC encoded bit streams from the input
 *		bit streams.
 *
 *	Inputs
 *
 *		int *b_in				- input bits to be encoded
 *		int num_data_bits		- number of data bits to be encoded
 *		int *b0					- output bit stream 0 (must be able to hold num_data_bits ints)
 *		int *b1					- output bit stream 1 (must be able to hold num_data_bits ints)
 *
 *	Outputs
 *
 *		The function returns 0 on success 
 *
 *	Side Effects
 *
 *		The b0 and b1 arrays are filled with encoded bits
 *
 */
int Alamouti_encode(int *b, int num_data_bits, int *b0, int *b1)
{
	int i;

	for(i = 0; i < num_data_bits; i = i+4)
	{
		// channel 0 bits
		b0[i]   = b[i];
		b0[i+1] = b[i+1];
		b0[i+2] = (~b[i+2]) & 0x1;		// complement the I bit of the second symbol
		b0[i+3] = b[i+3];

		// channel 1 bits
		b1[i]   = b[i+2];		// reverse the order of the symbols
		b1[i+1] = b[i+3];
		b1[i+2] = b[i];
		b1[i+3] = (~b[i+1]) & 0x1;		// complement the Q bit of the first symbol
	}

	return(0);
}

 
