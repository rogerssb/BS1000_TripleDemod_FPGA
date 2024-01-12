/*
 *	defines.h contains the defines for the tier1_stc_receiver project
 *	that are needed by several files
 *
 * Copyright (c) 2005 Tom Nelson, Brigham Young University
 */
#ifndef DEFINES_H


	#define DEFINES_H

        #ifdef __CYGWIN__
            #define _ftime ftime
            #define _timeb timeb
        #endif

	// comment out the next define to prevent code overwriting the dozens of .dat files
	//#define WRITE_MSGS 

	#define PILOT_LENGTH				128		// number of pilot bits
	#define DATA_FRAME_LENGTH			3200	// maximum number of data bits that will be inserted into the frame
	#define FRAME_LENGTH_10				33280	// = 3328 bits * 10 samples/bit (the number of samples to be generated at the first sample rate)
	#define FRAME_LENGTH				29867	// = 3328 bits * 2800/312 samples/bit (the number of samples to be generated at the output rate)
	#define EXTRA_SAMPLES				1280		// 128 bits at 10 samples/bit (number of samples from previous frame to be use at beginning of new frame)
	#define FRAME_LENGTH_4				13312	// = 3328 bits * 4 sample/bit (the number of samples to be generated at the third sample rate)

	#define DATA_LENGTH_4				12800	// number of samples in the data field at 4 samples/bit sample rate
	#define PILOT_LENGTH_4				512		// length of the pilot signal at 4 samples/bit
	#define PILOT_HALF_LENGTH_4			256		// length of pilot used for pilot detection
	#define PD_PILOT_LENGTH				512
	#define FILTER_EXTRA_SAMPS			16		// 16 because we want to filter 4 extra bits worth of signal
	#define FILTER_STARTUP_SAMPS		3		// 3 because we need extra samples to avoid filter transients

	#define FILT_PILOT_START_4			12801	// first pilot peak is at 12805 after the detection filter
												// but we need 4 samples before that
	#define	FILT_DATA_START_4			10		// first data bit is at 3 after the detection filter, we want to be lined
												// up with the third data bit which is at 11, but the interpolator needs
												// one sample before that
	#define EXTRA_DEMOD_SAMPLES			10		// extra samples from previous pilot sequence needed to "warm up" the trellis
	#define EXTRA_DEMOD_TAIL_SAMPLES	20		// extra samples needed at the end of the signal to detect the last 4 bits in the frame

	#define TSAMPLE_4					2.403846153846154e-008		// sample time interval at 41.6 MHz
	#define TSAMPLE_45					2.023809523809524e-008		// sample time interval at 46.67 MHz
		
	#define FE_ACQUIRE					0		// frequency estimator operating modes	
	#define FE_TRACK					1
		
	#define PD_ACQUIRE					0		// pilot detector operating modes	
	#define PD_TRACK					1

#endif
