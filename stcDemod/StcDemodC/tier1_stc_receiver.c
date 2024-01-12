/*
 *	This is the main file for the tier1_stc_receiver project.
 *	It parses input parameters, sets up everything for the simulation,
 *	and runs the processing loop which generates a space-time coded
 *	Tier 1 signal with the specified channel impairments and then
 *	calls the synchronization, estimation, and detection routines to
 *	produce demodulated output bits.  It also counts bit errors and
 *	reports the bit error rate.
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 *
 */

#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

////////////////////////////////
// includes
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdbool.h>

#include <sys/timeb.h>		// for random starting seeds
#include <time.h>
#include <limits.h>

#include "version.h"

////////////////////////////////
// defines
#include "defines.h"

#define		PI_2		6.28318530718
#define		NB			8.97435897435897		// number of samples/bit at the point where noise is added
#define		MAX_ITER	1000000000

#define		DATA_SKIP	640

#define		INITIAL_FRAME_SKIPS		10				// number of frames to wait before counting bit errors
#define		BAD_FRAME_THRESHOLD		1300			// when a frame is completely bad there will be about 50% errors

#define		TrellisLength			FRAME_LENGTH_4

////////////////////////////////
// global variables
#include "pilot_templates.h"


float signal_0_r[FRAME_LENGTH_10+EXTRA_SAMPLES];		// arrays to hold modulated signal 0
float signal_0_i[FRAME_LENGTH_10+EXTRA_SAMPLES+10];

float signal_1_r[FRAME_LENGTH_10+EXTRA_SAMPLES];		// arrays to hold modulated signal 1
float signal_1_i[FRAME_LENGTH_10+EXTRA_SAMPLES+10];

float signal_rx[FRAME_LENGTH_10];						// array to hold the received signal
// (a real signal centered at Fs/4)

float signal_r[FRAME_LENGTH];							// arrays to hold the final output signal (received signal)
float signal_i[FRAME_LENGTH];

float signal_4spb_r[FRAME_LENGTH_4+EXTRA_DEMOD_TAIL_SAMPLES];					// arrays to hold the data at 4 samples per bit
float signal_4spb_i[FRAME_LENGTH_4+EXTRA_DEMOD_TAIL_SAMPLES];

float rf_r[FRAME_LENGTH_4+EXTRA_DEMOD_TAIL_SAMPLES];								// arrays for holding received data frame
float rf_i[FRAME_LENGTH_4+EXTRA_DEMOD_TAIL_SAMPLES];

float pilot_buffer_r[PILOT_LENGTH_4+10];
float pilot_buffer_i[PILOT_LENGTH_4+10];

float v[FRAME_LENGTH];									// array to hold the DDS output of the FLL

float buffer_r[FRAME_LENGTH_4+EXTRA_DEMOD_SAMPLES+EXTRA_DEMOD_TAIL_SAMPLES];
float buffer_i[FRAME_LENGTH_4+EXTRA_DEMOD_SAMPLES+EXTRA_DEMOD_TAIL_SAMPLES];

float last_frame_r[FRAME_LENGTH+EXTRA_DEMOD_TAIL_SAMPLES]; // Used to hold last frame so the
float last_frame_i[FRAME_LENGTH+EXTRA_DEMOD_TAIL_SAMPLES]; // EXTRA_DEMOD_TAIL_SAMPLES can be added to the end
														   // and then sent to the trellis.

float est_buffer[TrellisLength] = {0};		// FZ used to hold estimates in first position only for file output

float last_tau_0_est;
float last_tau_1_est;
float last_h0_est_r;
float last_h0_est_i;
float last_h1_est_r;
float last_h1_est_i;

float	freq_off;
bool	FreqEstEq0 = false;
float	snr;
float	Ch0Power;

float *s0_r;
float *s0_i;
float *s1_r;
float *s1_i;

float *s_data_r;
float *s_data_i;

int	BitsIn[DATA_FRAME_LENGTH+15];								// array to hold the input data bits
int BitsOut[DATA_FRAME_LENGTH];								// array to hold the output data bits
int	LastBitsIn[DATA_FRAME_LENGTH];							// array to hold the previous input data bits

int	tmp_bits[DATA_FRAME_LENGTH];

int	FirstTime = 0;

/*|TESTING|*/
extern float	test_min;
/*|TESTING|*/
extern int		good_pilots;

errno_t		openError;

////////////////////////////////
// function definitions
// a test
float ran1(long *idum);
int rand_bit(unsigned long *iseed);
void Init_Rx_Constants(void);
int Gen_Frame(int *b, int num_data_bits, int mode, float *signal_0_r, float *signal_0_i,
			  float *signal_1_r, float *signal_1_i);
int Gen_FQPSK_JR(int *bits, int num_data_bits, float *signal_r, float *signal_i);
int Channel(float *s_in0_r, float *s_in0_i, float *s_in1_r, float *s_in1_i, int num_in_samps,
			float *signal_out, int *num_out_samps, float delta_tau, float h0_r,
			float h0_i, float h1_r, float h1_i, float freq_off, float sigma, long *idum);
int Detection_filter(float *s_in_r, float *s_in_i, float *s_out_r, float *s_out_i, int num_out_samps);
int Interpolator(float *s_in_r, float *s_in_i, float *s_out_r, float *s_out_i, int num_out_samples, float mu);
int Trellis_detector(float *s_in0_r, float *s_in0_i, float *s_in1_r, float *s_in1_i, int *BitsOut,
					 int num_out_bits, float delta_tau, float h0_r, float h0_i, float h1_r, float h1_i);
void aliasing_ddc(float *s_in, int s_in_len,
				  float *s_out_r, float *s_out_i, int s_out_len, int *s_out_len_used);
void resample_156_175(float *xf_r, float *xf_i, int nxf, float *y_r, float *y_i, int ny);
void pilot_detector(float *r_fll_r, float *r_fll_i,
				float *r_r, float *r_i, int rlen,
				float *p0_r, float *p0_i, float *p1_r, float *p1_i,
				float *rf_r, float *rf_i, int *valid, float PosPeak);
void frequency_estimator(float r_r[PILOT_LENGTH_4], float r_i[PILOT_LENGTH_4],
						 float *p0_r, float *p0_i, float *p1_r, float *p1_i,
						 float tau_0_est, float tau_1_est, float h0_est_r, float h0_est_i, float h1_est_r, float h1_est_i,
                         float *freq, int *fe_mode);
int Timing_channel_estimator(float *s_r, float *s_i, float *tau_est0, float *tau_est1,
							 float *h0_est_r, float *h0_est_i, float *h1_est_r, float *h1_est_i);
float MaxElement(float Array[], int ArraySize);
float MinElement(float Array[], int ArraySize);
extern void MyFwrite(void const* _Buffer, size_t _ElementSize, size_t _ElementCount, FILE* _Stream);


float MaxElement(float Array[], int ArraySize)	// find most positive value
{
	float max = Array[0];
	for (int i = 1; i < ArraySize; i++)
	{
		if (Array[i] > max)
			max = Array[i];
	}
	return (max);
}

float MinElement(float Array[], int ArraySize)	// find most negative value
{
	float min = Array[0];
	for (int i = 1; i < ArraySize; i++)
	{
		if (Array[i] < min)
			min = Array[i];
	}
	return (min);
}
/*
*	Function
*
*		main(int argc, char *argv[])
*
*	Description
*
*		The main function for tier1_stc_receiver.c.  Takes the input arguments
*		and controls the Monte Carlo simulation of the Tier 1 STC system
*
*/
int main(int argc, char *argv[])
{
	FILE	*outfp = NULL;
	FILE	*fp_input_r = NULL;
	FILE	*fp_input_i = NULL;
	FILE	*fp_input = NULL;

	int		BitCount;
	int		ErrorCount;
	int		Errs;
	int		BadFrames;
	int		BadFrameIndicator;

	int		NumErrs;
	int		SigMode;
	float	PE;
	float	sigma;
	float	sigma_sq;
	float	Nb;
	float	PhaseOffset;
	float	phase_offset;
	float	delta_tau;

	float	angle;
	float	angle0;
	float	h1_power;
	float	h0_power;
	float	h0_amp;
	float	h1_amp;
	float	h0_r;
	float	h0_i;
	float	h1_r;
	float	h1_i;
	float	h0_est_r;
	float	h0_est_i;
	float	h1_est_r;
	float	h1_est_i;
	float	tau_0_est;
	float	tau_1_est;
	float	delta_tau_est;

	int		i, j, n = 0;

	int		num_output_samples;
	int Rd1, Rd2, Rd3, ReadR, ReadI, EstDone, PrnErr, StartIla, Valid2047, ValidIla, TempErr, PrnErrs = 0, SampleCount = 0;

	float	mu;
	int		m_ndx;
	int		FirstEstimate = 1;
	int		FirstFrameToInterpolate = 0;
	long	idum;
	unsigned long iseed;

	struct _timeb timebuffer0;
	struct _timeb timebuffer1;
	struct _timeb timebuffer2;
	double	del_t;
	int		hours;
	int		mins;
	int		secs;

	int		bit_ndx = 0;

	int		ddc_out_len = 0;

	int		pilot_found;					// pilot has been located, and pilot_start_ind is valid

	float	freq_est;				// current estimate of the frequency offset
	int		fe_mode;							// current estimate of the frequency offset
	int		current_pilot_buf = 0;

	float	d_theta;				// variables used for the frequency offset remixer
	float	theta;
	float	tmp_r, tmp_i;
	float	c, s;

	float	*buff_ptr_r;
	float	*buff_ptr_i;

	int		Verbose;
#ifdef WRITE_MSGS
	FILE * fp_signal_r;
	FILE * fp_signal_i;
	FILE * fp_bits;
	FILE * fp_det_r;
	FILE * fp_det_i;
	FILE * fp_compare_r;

	//FILE * fp_estimates  = fopen("estimates_c.txt","wb");

	FILE * fp_signal_0_r = fopen("signal_0_r.txt", "wb");
	FILE * fp_signal_0_i = fopen("signal_0_i.txt", "wb");
	FILE * fp_signal_1_r = fopen("signal_1_r.txt", "wb");
	FILE * fp_signal_1_i = fopen("signal_1_i.txt", "wb");

	FILE * fp_delta_tau_est = fopen("delta_tau_est.txt", "wb");
	FILE * fp_h0_est_r = fopen("h_0_r.txt", "wb");
	FILE * fp_h0_est_i = fopen("h_0_i.txt", "wb");
	FILE * fp_h1_est_r = fopen("h_1_r.txt", "wb");
	FILE * fp_h1_est_i = fopen("h_1_i.txt", "wb");

	FILE * fp_golden_bits = fopen("golden_bits.txt", "wb");
#endif WRITE_MSGS
	// display the version of the project
	printf("Version %d.%02d\n\n", VERSION, SUBVERSION);

	// parse the input arguments
	if (argc == 9 || argc == 10)
	{
		// get the parameters
		snr = (float)atof(argv[1]);
		NumErrs = atoi(argv[2]);
		SigMode = atoi(argv[3]);
		if (SigMode < 0 || SigMode > 1)
		{
			printf("Error: Invalid SigMode: %d--must be 0 or 1\n\n", SigMode);
			return(0);
		}
		//		else if(SigMode == 0)
		//		{
		//			printf("\nNote: SOQPSK-TG mode not currently functional--switching to FQPSK-JR mode\n\n");
		//			SigMode = 1;
		//		}
		//
		PhaseOffset = (float)atof(argv[4]);					// phase offset in degrees

		delta_tau = (float)atof(argv[5]);
		freq_off = (float)atof(argv[6]);
		Ch0Power = (float)atof(argv[7]);

		// open output file
		openError = fopen_s(&outfp, argv[8], "a");
		if (outfp == NULL)
		{
			printf("Error opening output file %s\n\n", argv[7]);
			return(0);
		}

		if (argc == 10)
		{
			i = atoi(argv[9]);
			if (i == 1)
				Verbose = 1;
			else
				Verbose = 2;
		}
		else
			Verbose = 0;
	}
	else					// wrong number of arguments
	{
		printf("\nUsage: \n%s SNR NumErrors SigMode Phase Offset FreqOffset Ch0Power Outfile [Verbose]\n\n", argv[0]);

		printf("\t%s perfoms Monte-Carlo simulations to estimate\n", argv[0]);
		printf("\tthe probability of bit error for SOQPSK-TG or\n");
		printf("\tFQPSK-JR in the presence of AWGN.  This is a complete \n");
		printf("\tend to end simulation where all required parameters are \n");
		printf("\testimated by the receiver.\n\n");
		printf("\tCommand line arguments:\n");
		printf("\tSNR        - signal to noise ratio in dB for this run\n");
		printf("\tNumErrors  - number of errors before quitting\n");
		printf("\tSigMode    - Modulated signal: 0 = SOQPSK-TG, 1 = FQPSK-JR\n");
		printf("\tPhase      - phase angle between complex channel gains (degrees)\n");
		printf("\tDelay      - offset of channel 1 relative to channel 0\n");
		printf("\t             (-0.5Tb to 0.5Tb)\n");
		printf("\tFreqOffset - frequency offset (in Hz) \n");
		printf("\tCh0Power   - fraction of power received via channel 0 \n");
		printf("\tOutfile    - output text file for results (SNR/PE pairs)\n");
		printf("\t[Verbose]  - optional verbosity level: if absent then only the\n");
		printf("\t             final bit count and bit error count are reported,\n");
		printf("\t             if present and equal to 1 then the bit error count\n");
		printf("\t             for each frame is reported, otherwise several\n");
		printf("\t             estimated parameters in addition to the error count \n");
		printf("\t             are reported each frame (requires a text window about\n");
		printf("\t             160 characters wide to view properly).\n\n");
		return(0);
	}

	// initialize things
	phase_offset = (float)(PhaseOffset*PI_2 / 360.0);		// phase offset in radians
	// signal power
	Nb = (float)NB;		// number of samples in a bit (used to compute the snr and the noise variance)

	// initialize the seeds (use the computer clock to initialize them)
	_ftime64_s(&timebuffer0);

	idum = -1 * (timebuffer0.time % 1000 + timebuffer0.millitm * 1000);
	iseed = (unsigned long)(12345678);// ran1(&idum) * (ULONG_MAX - 1));	// FZ, forced to repeat for simulation consistency

	FILE* fp_max;
	openError = fopen_s(&fp_max, "MaxValues.txt", "w");	// erase old file
	fclose(fp_max);

	// record the signal mode and the other parameters in the output file
	if (SigMode == 0)
		fprintf(outfp, "SOQPSK-TG\n");
	else
		fprintf(outfp, "FQPSK-JR\n");
	fprintf(outfp, "Phase diff.:\t%f\n", PhaseOffset);
	fprintf(outfp, "Delta tau:\t%f\n", delta_tau);
	fprintf(outfp, "Freq. offset:\t%f\n", freq_off);
	fprintf(outfp, "Chan. 0 power:\t%f\n", Ch0Power);

	// set the complex channel gains, h0 and h1
	h0_power = Ch0Power;
	h1_power = 1.0f - h0_power;
	angle0 = 0;
	printf("Ch0 Power = %.1f%%\n", h0_power * 100);
	// get the start time for this run
	_ftime64_s(&timebuffer1);

	// compute the noise variance for the given SNR in dB (snr = Eb/N0) for a REAL signal and REAL noise
	//
	// Eb = T*Nb/2			where T is the sample period (1/Fs) and Nb is the number of samples/bit
	// N0 = 2*T*sigma^2		where sigma^2 is the noise variance
	//
	// So:	snr = Eb/N0 = (T*Nb/2)/(2*T*sigma^2) = Nb/(4*sigma^2)
	// and
	//		sigma^2 = Nb/(4*snr)

	sigma_sq = (float)(Nb / (4.0*pow(10.0, snr / 10.0)));

	sigma = (float)sqrt(sigma_sq);
	printf("snr = %.1f, sigma = %.4f\n", snr, sigma);

#ifdef WRITE_MSGS
	fp_signal_r = fopen("signal_r.txt", "wb");
	fp_signal_i = fopen("signal_i.txt", "wb");
	fp_bits = fopen("bits.txt", "wb");
	fp_compare_r = fopen("compare_r.txt", "wb");
#endif WRITE_MSGS
	/*|TESTING|*/
#ifdef _DEBUG
	//sigma = 0.0f;		// turn off the noise when debugging
#endif
	/*|TESTING|*/

	// initialize the error count and bit count
	ErrorCount = 0;
	BitCount = 0;
	BadFrames = 0;
	BadFrameIndicator = 0;

	theta = 0.0f;

	// initialize the timing and channel estimates for the first call to the frequency estimator
	tau_0_est = 0.0f;
	tau_1_est = 0.0f;

	h0_est_r = 0.7071f;
	h0_est_i = 0.0f;
	h1_est_r = 0.7071f;
	h1_est_i = 0.0f;

	// initialize the pointers in the buffers (for the trellis detector)
	buff_ptr_r = &(buffer_r[EXTRA_DEMOD_SAMPLES]);
	buff_ptr_i = &(buffer_i[EXTRA_DEMOD_SAMPLES]);

	for (j = 0; j < DATA_FRAME_LENGTH; j++)
	{
		LastBitsIn[j] = 0;
	}
#ifdef WRITE_MSGS
	fp_det_r = fopen("det_r.txt", "wb");
	fp_det_i = fopen("det_i.txt", "wb");

	FILE	*fp_fft_out_r,
		*fp_fft_out_i,
		*fp_R0_r,
		*fp_R0_i,
		*fp_R1_r,
		*fp_R1_i,
		*fp_tau_0_est,
		*fp_tau_1_est,
		*fp_h_0_r_est,
		*fp_h_0_i_est,
		*fp_h_1_r_est,
		*fp_h_1_i_est,
		*fp_trellis_start;
	fp_tau_0_est = fopen("tau_0_est.txt", "wb");
	fp_tau_1_est = fopen("tau_1_est.txt", "wb");
	fp_h_0_r_est = fopen("h_0_r_est.txt", "wb");
	fp_h_0_i_est = fopen("h_0_i_est.txt", "wb");
	fp_h_1_r_est = fopen("h_1_r_est.txt", "wb");
	fp_h_1_i_est = fopen("h_1_i_est.txt", "wb");
	fp_trellis_start = fopen("trellis_start.txt", "wb");
	fp_trellis_in_r = fopen("trellis_in_r.txt", "wb");
	fp_trellis_in_i = fopen("trellis_in_i.txt", "wb");
	// erase previous files for appending
	fp_fft_out_r = fopen("fft_out_r.txt", "wb");
	fp_fft_out_i = fopen("fft_out_i.txt", "wb");
	fclose(fp_fft_out_r);
	fclose(fp_fft_out_i);
	char FileName[30], HOffset[10], FOffset[10];
	strcpy(HOffset, "neg66k_");
	if (freq_off < 0)
		strcpy(FOffset, "neg100");
	else if (freq_off > 0)
		strcpy(FOffset, "pos100");
	else
		strcpy(FOffset, "center");
	sprintf(FileName, "fp_r0_r_%s%s.txt", HOffset, FOffset);
	fp_R0_r = fopen(FileName, "wb");
	sprintf(FileName, "fp_r0_i_%s%s.txt", HOffset, FOffset);
	fp_R0_i = fopen(FileName, "wb");
	sprintf(FileName, "fp_r1_r_%s%s.txt", HOffset, FOffset);
	fp_R1_r = fopen(FileName, "wb");
	sprintf(FileName, "fp_r1_i_%s%s.txt", HOffset, FOffset);
	fp_R1_i = fopen(FileName, "wb");
	fclose(fp_R0_r);
	fclose(fp_R0_i);
	fclose(fp_R1_r);
	fclose(fp_R1_i);
	strcpy(HOffset, "center_");
	sprintf(FileName, "fp_r0_r_%s%s.txt", HOffset, FOffset);
	fp_R0_r = fopen(FileName, "wb");
	sprintf(FileName, "fp_r0_i_%s%s.txt", HOffset, FOffset);
	fp_R0_i = fopen(FileName, "wb");
	sprintf(FileName, "fp_r1_r_%s%s.txt", HOffset, FOffset);
	fp_R1_r = fopen(FileName, "wb");
	sprintf(FileName, "fp_r1_i_%s%s.txt", HOffset, FOffset);
	fp_R1_i = fopen(FileName, "wb");
	fclose(fp_R0_r);
	fclose(fp_R0_i);
	fclose(fp_R1_r);
	fclose(fp_R1_i);
	strcpy(HOffset, "pos66k_");
	sprintf(FileName, "fp_r0_r_%s%s.txt", HOffset, FOffset);
	fp_R0_r = fopen(FileName, "wb");
	sprintf(FileName, "fp_r0_i_%s%s.txt", HOffset, FOffset);
	fp_R0_i = fopen(FileName, "wb");
	sprintf(FileName, "fp_r1_r_%s%s.txt", HOffset, FOffset);
	fp_R1_r = fopen(FileName, "wb");
	sprintf(FileName, "fp_r1_i_%s%s.txt", HOffset, FOffset);
	fp_R1_i = fopen(FileName, "wb");
	fclose(fp_R0_r);
	fclose(fp_R0_i);
	fclose(fp_R1_r);
	fclose(fp_R1_i);
	fp_R0_r = fopen("fp_r0_ifft_r.txt", "wb");
	fclose(fp_R0_r);
#endif WRITE_MSGS

	openError = fopen_s(&fp_max, "HexOutLive.txt", "w");	// erase old file
	fclose(fp_max);
	float	maxH0r=0, minH0r=2;

				// generate the random bits, FZ TODO, move outside of loop below to repeat same pattern each frame
//		for (j = 0; j < DATA_FRAME_LENGTH; j++)
//		{
//			BitsIn[j] = rand_bit(&iseed);
//			//BitsIn[j] = 0.0f;
//		}
	// loop over the bit errors

	for (j = 0; j < sizeof(BitsIn); j++) {
		BitsIn[j] = 1;
	}
	for (n = 0; n < 100; n++)			// in debug mode just process a fixed number of frames
	{
		//***************************************************************************************
		//
		// Transmitter
		//
		//***************************************************************************************
		h0_amp = (float)sqrt(h0_power);
		h1_amp = (float)sqrt(h1_power);

		// use a random angle for channel 0
		angle0 = 0 * PI_2 / 360;// +(float)(0.01f * (ran1(&idum) - 1.0));

		h0_r = (float)(cos(angle0) * h0_amp);
		h0_i = (float)(sin(angle0) * h0_amp);

		// offset the angle of channel 1 from that of channel 0 by the specified amount
		angle = (float)(angle0 + phase_offset);// +(0.1f * (ran1(&idum) - 1.0));

		h1_r = (float)(cos(angle) * h1_amp);
		h1_i = (float)(sin(angle) * h1_amp);
		printf("angle0 = %f, angle1 = %f\n", angle0 * 360 / PI_2, angle * 360 / PI_2);

   		iseed = (unsigned long)(12345678);
//				// generate the random bits
		for (j = 0; j < 15; j++) {
			BitsIn[j] = BitsIn[j + DATA_FRAME_LENGTH];	// copy tail of previous frame
		}
		for (j = 15; j < DATA_FRAME_LENGTH+15; j++)	// create new frame with 15 tail bits for continuity on next frame
		{
			BitsIn[j] = (BitsIn[j - 15] + BitsIn[j - 14]) % 2;	// generate PRN15 code so result is verifiable
			//BitsIn[j] = rand_bit(&iseed);
			//BitsIn[j] = 1.0f;
		}

		// generate the two STC encoded modulated frames at 10 samples/bit
		Gen_Frame(BitsIn, DATA_FRAME_LENGTH, SigMode, signal_0_r, signal_0_i, signal_1_r, signal_1_i);

		// Gen_Frame() generates more than one frame worth of samples to avoid edge effects between calls.
		// Set pointers to skip the beginning and end of the signals output by Gen_Frame()
		// so that exactly one frame worth of data is sent to Channel().
		s0_r = &(signal_0_r[DATA_SKIP]);
		s0_i = &(signal_0_i[DATA_SKIP]);
		s1_r = &(signal_1_r[DATA_SKIP]);
		s1_i = &(signal_1_i[DATA_SKIP]);

		// impose the channel impairments on the signals and resample to 2800/312 samples/bit,
		// mix to Fs/4, convert to a real signal, and add noise--the output of Channel() is a
		// simulation of what should come out of the ADC
		Channel(s0_r, s0_i, s1_r, s1_i, FRAME_LENGTH_10, signal_rx, &num_output_samples,
			delta_tau - .01*n, h0_r, h0_i, h1_r, h1_i, freq_off, sigma, &iseed);	// was &idum

		// if signal exceeds a/d range, scale accordingly
		float PosPeak = 1.46; /* MaxElement(signal_rx, num_output_samples);
			float NegPeak = MinElement(signal_rx, num_output_samples);
			if (PosPeak < -NegPeak)
				PosPeak = -NegPeak;
			if (PosPeak > 1.5)
			{	// saturate noise spikes. The A/D would anyway
				PosPeak = 1.5;
			} don't do on every iteration, signal level is unstable */ 
			if (PosPeak > 0.95) {
				for (i = 0; i < num_output_samples; i++)
				{
					signal_rx[i] *= 0.5 / PosPeak;
				}
			}

//***************************************************************************************
		//
		// Receiver Front End
		//
		//***************************************************************************************
				//{
				//	int nn = 0;
				//	for(nn=0; nn < FRAME_LENGTH; nn++)
				//	{
				//		signal_rx[nn] = signal_rx[nn] * 0.25;
				//	}
				//}

// convert to complex, reduce sample rate by 1/2, and shift down to baseband
		aliasing_ddc(signal_rx, num_output_samples,
			signal_r, signal_i, FRAME_LENGTH, &ddc_out_len);
#ifdef WRITE_MSGS
		MyFwrite(signal_r, sizeof(float), ddc_out_len, fp_signal_r);
		MyFwrite(signal_i, sizeof(float), ddc_out_len, fp_signal_i);
#endif WRITE_MSGS



		// resample from 46.67 M samples/s to 41.6 M samples/s (4 samples/bit)
		resample_156_175(signal_r, signal_i, ddc_out_len, signal_4spb_r, signal_4spb_i, FRAME_LENGTH_4);

//#define LIVE_DATA
#ifdef LIVE_DATA
		int	PhaseDiff, DataAddr, TrellisBits, TrellisOutEn;
		if (FirstTime < 1)
		{
			openError  = fopen_s(&fp_input, "C:/Semco/Vivado/Demods2017/stcDemod/Documentation/ValidIla19M.csv", "r");
			fscanf_s(fp_input, "%*[^\n]\n");
			good_pilots = 3;
			FirstFrameToInterpolate = 1;
			FirstTime = 0;
			FreqEstEq0 = true;
			// find the first start pulse then move to center of pilot to get a negative pilot offset
			do {
				if (fscanf_s(fp_input, "%i,%i,%i,%i,%i,%i,%i,%x,%i,%i,%i,%i,%i,%i\n", &Rd1, &Rd2, &Rd3, &DataAddr, &ReadI, &ReadR, &PhaseDiff, &TrellisBits, &EstDone, &PrnErr, &StartIla, &Valid2047, &ValidIla, &TrellisOutEn) < 1)
				{
					printf("\n\n\nRan out of Live data\n\n\n");
					exit(EXIT_FAILURE);
				}
				SampleCount++;
			} while (StartIla == 0);
			for (i=0;i<260;i++) {
				if (fscanf_s(fp_input, "%i,%i,%i,%i,%i,%i,%i,%x,%i,%i,%i,%i,%i,%i\n", &Rd1, &Rd2, &Rd3, &DataAddr, &ReadI, &ReadR, &PhaseDiff, &TrellisBits, &EstDone, &PrnErr, &StartIla, &Valid2047, &ValidIla, &TrellisOutEn) < 1)
				{
					printf("\n\n\nRan out of Live data\n\n\n");
					exit(EXIT_FAILURE);
				}
				SampleCount++;
			} 
		}
		else
		{
			for (i = 0; i < 3200 - 15; i++)	// Live data is in Prn15 format, therefore the first, second and 15th bits should
			{
				TempErr = (BitsOut[i + 0] + BitsOut[i + 1] + BitsOut[i + 15]) % 2;
				PrnErrs += TempErr;
				if (TempErr > 0 && PrnErrs < 40)
				{
					printf("Prn Error found at index %d, sample count %d\n", i, SampleCount - 24716 + i);
				}
			}
			printf("PRN15 bit errors = %4d\n", PrnErrs);
		}
		if (fp_input)
		{
			for (i = 0; i < 13312; i++)
			{
				if (fscanf_s(fp_input, "%i,%i,%i,%i,%i,%i,%i,%x,%i,%i,%i,%i,%i,%i\n", &Rd1, &Rd2, &Rd3, &DataAddr, &ReadI, &ReadR, &PhaseDiff, &TrellisBits, &EstDone, &PrnErr, &StartIla, &Valid2047, &ValidIla, &TrellisOutEn) < 1)
				{
					printf("\n\n\nRan out of Live data\n\n\n");
					exit(EXIT_FAILURE);
				}
				SampleCount++;
				while (ValidIla == 0)	// if line is not valid, skip it. Typical of Starts and Invalid2047
				{
					if (fscanf_s(fp_input, "%i,%i,%i,%i,%i,%i,%i,%x,%i,%i,%i,%i,%i,%i\n", &Rd1, &Rd2, &Rd3, &DataAddr, &ReadI, &ReadR, &PhaseDiff, &TrellisBits, &EstDone, &PrnErr, &StartIla, &Valid2047, &ValidIla, &TrellisOutEn) < 1)
					{
						printf("\n\n\nRan out of Live data\n\n\n");
						exit(EXIT_FAILURE);
					}
					SampleCount++;
				}
				signal_4spb_r[i] = ReadR / pow(2, 17);	// live data is much smaller than sim data
				signal_4spb_i[i] = ReadI / pow(2, 17);
			}
		}
		PosPeak = MaxElement(signal_4spb_i, 13312);
#endif LIVE_DATA

		//***************************************************************************************
		//
		// Setup for trellis detector
		//
		//***************************************************************************************
				// pilot detector (if no pilot detected yet then go back to the top of the loop after this step)  FZ Note, the pilot_detector is expecting FLL outputs for first two inputs but not used

		pilot_detector(signal_4spb_r, signal_4spb_i,
			signal_4spb_r, signal_4spb_i,
			FRAME_LENGTH_4 + EXTRA_DEMOD_TAIL_SAMPLES,
			p0_r, p0_i, p1_r, p1_i,
			rf_r, rf_i, &pilot_found, PosPeak);/**/

		// if the pilot wasn't found then move on to the next frame
		if(!pilot_found)
		{
			if(Verbose)
				printf("pilot not found\n");	

			// record the current input bits for checking errors in the output of the next detected
			// frame (there is a 1 frame lag between the input and the output due to buffering above)
			//for(j = 0; j < DATA_FRAME_LENGTH; j++)
			//{
			//	LastBitsIn[j] = BitsIn[j];
			//}
			//continue;
		}
		FirstTime++;

//		#ifdef WRITE_MSGS
		FILE* fp_resampled_r;
		FILE* fp_resampled_i;
		char Filename1[80];
		int		resampleInt[FRAME_LENGTH_4] = { 0 };
		if (n > INITIAL_FRAME_SKIPS)
		{
			if (n == INITIAL_FRAME_SKIPS + 1)
			{
				sprintf(Filename1, "C:/Semco/Vivado/Demods2017/stcDemod/simData/resampled_r.txt");
				fp_resampled_r = fopen(Filename1, "w");
				sprintf(Filename1, "C:/Semco/Vivado/Demods2017/stcDemod/simData/resampled_i.txt");
				fp_resampled_i = fopen(Filename1, "w");
				// fill first part of file with last half of a pilot to center the upcoming pilot in the first demod packet
				MyFwrite(rf_r + FRAME_LENGTH_4 - 256 * sizeof(float), sizeof(float), 256, fp_resampled_r);
				MyFwrite(rf_i + FRAME_LENGTH_4 - 256 * sizeof(float), sizeof(float), 256, fp_resampled_i);
			}
			else
			{
				sprintf(Filename1, "C:/Semco/Vivado/Demods2017/stcDemod/simData/resampled_r.txt");
				fp_resampled_r = fopen(Filename1, "a");
				sprintf(Filename1, "C:/Semco/Vivado/Demods2017/stcDemod/simData/resampled_i.txt");
				fp_resampled_i = fopen(Filename1, "a");
			//	for (i = 0; i < FRAME_LENGTH_4; i++)
			//	{
			//		resampleInt[i] = (int)(rf_r[i] * 25000);
			//		if ((resampleInt[i] > 128000) || (resampleInt[i] < -128000))
			//			resampleInt[i] /= 2;
			//	}
				MyFwrite(rf_r, sizeof(float), FRAME_LENGTH_4, fp_resampled_r);
			//	for (i = 0; i < FRAME_LENGTH_4 - 13; i++)
			//	{
			//		resampleInt[i] = (int)(rf_i[i] * 25000);
			//		if ((resampleInt[i] > 128000) || (resampleInt[i] < -128000))
			//			resampleInt[i] /= 2;
			//	}
				MyFwrite(rf_i, sizeof(float), FRAME_LENGTH_4, fp_resampled_i);
			}
			fclose(fp_resampled_r);
			fclose(fp_resampled_i);
		}
//		#endif WRITE_MSGS

//TODO
#ifdef WRITE_MSGS
		float zeros[1] = { 0.0 };
		float ones[1] = { 1.0 };
		FILE *fp_R, *fp_I, *fp_V, *fp_S;
		int DeadTime = 1784;	// 1784 is dead time for 10Mb
		char FilenameR[160], FilenameI[160], FilenameV[160], FilenameS[160];
		if (FirstTime == 1)
		{
			FirstTime++;
			sprintf(FilenameR, "C:/Users/frank.ziegler/Documents/GitHub/stcDemod/simData/AllOnesDataR_%.0fHz_%ddB_%dPercent.txt", freq_off, (int)snr, (int)(Ch0Power * 100));
			sprintf(FilenameI, "C:/Users/frank.ziegler/Documents/GitHub/stcDemod/simData/AllOnesDataI_%.0fHz_%ddB_%dPercent.txt", freq_off, (int)snr, (int)(Ch0Power * 100));
			sprintf(FilenameV, "C:/Users/frank.ziegler/Documents/GitHub/stcDemod/simData/AllOnesDataV_%.0fHz_%ddB_%dPercent.txt", freq_off, (int)snr, (int)(Ch0Power * 100));
			sprintf(FilenameS, "C:/Users/frank.ziegler/Documents/GitHub/stcDemod/simData/AllOnesDataS_%.0fHz_%ddB_%dPercent.txt", freq_off, (int)snr, (int)(Ch0Power * 100));
			fp_R = fopen(FilenameR, "w");
			fp_I = fopen(FilenameI, "w");
			fp_V = fopen(FilenameV, "w");
			fp_S = fopen(FilenameS, "w");
			// prime the Detection Filter by writing the last packet first. It's ignored by the estimators
			MyFwrite(&rf_r[25*512], sizeof(float), 512, fp_R);
			MyFwrite(&rf_i[25*512], sizeof(float), 512, fp_I);
			MyFwrite(ones,  1, 512, fp_V);
			MyFwrite(zeros, 1, 512, fp_S);
		}
		else
		{
			fp_R = fopen(FilenameR, "a");
			fp_I = fopen(FilenameI, "a");
			fp_V = fopen(FilenameV, "a");
			fp_S = fopen(FilenameS, "a");
		}
		// write some fill before the start
		MyFwrite(&rf_r[0], 1, DeadTime, fp_R);
		MyFwrite(&rf_i[0], 1, DeadTime, fp_I);
		MyFwrite(zeros, 1, DeadTime, fp_V);
		MyFwrite(zeros, 1, DeadTime-257, fp_S);
		fprintf(fp_S, "%f\n", 1.0);				// start pulse
		MyFwrite(zeros, 1, 256, fp_S);
		for (i = 0; i < 26; i++)
		{
			MyFwrite(&rf_r[i*512], sizeof(float), 512, fp_R);
			MyFwrite(&rf_i[i*512], sizeof(float), 512, fp_I);
			MyFwrite(ones,  1, 512, fp_V);
			MyFwrite(zeros, 1, 512, fp_S);
			if (i == 25)	// don't write interpacket on last call
			{
				continue;
			}
			MyFwrite(&rf_r[i*512+511], 1, DeadTime, fp_R);	// repeat last value across interpacket
			MyFwrite(&rf_i[i*512+511], 1, DeadTime, fp_I);
			MyFwrite(zeros, 1, DeadTime, fp_V);
			MyFwrite(zeros, 1, DeadTime, fp_S);
		}
		fclose(fp_R);
		fclose(fp_I);
		fclose(fp_V);
		fclose(fp_S);
#endif WRITE_MSGS
//TODO
		// frequency estimator
		frequency_estimator(rf_r, rf_i,
				    p0_r, p0_i, p1_r, p1_i,
				    tau_0_est, tau_1_est, h0_est_r, h0_est_i, h1_est_r, h1_est_i,
				    &freq_est, &fe_mode);
		if(Verbose == 2)
			printf("%d: f=% 8.1fHz; ", n, freq_est);
// TODO remove	
		if (FreqEstEq0)
			freq_est = 0;
		else
		{
			// mix the residual frequency offset out of the data
			d_theta = (float)(-PI_2 * freq_est * TSAMPLE_4);

			for (i = 0; i < FRAME_LENGTH_4; i++)
			{
				theta += d_theta;
				if (theta > PI_2)		// keep the phase between -2 pi and +2 pi
					theta -= (float)PI_2;
				else if (theta < -1 * PI_2)
					theta += (float)PI_2;

				c = (float)cos(theta);
				s = (float)sin(theta);

				tmp_r = rf_r[i] * c - rf_i[i] * s;
				tmp_i = rf_i[i] * c + rf_r[i] * s;

				rf_r[i] = tmp_r;
				rf_i[i] = tmp_i;
			}
		}
		// detection filter
		Detection_filter(rf_r, rf_i, buff_ptr_r, buff_ptr_i, FRAME_LENGTH_4);
		//if(n >= 2){
		//	MyFwrite(buff_ptr_r, sizeof(float), FRAME_LENGTH_4, fp_det_r);
		//	MyFwrite(buff_ptr_i, sizeof(float), FRAME_LENGTH_4, fp_det_i);
		//}
		for(j = 0; j < PILOT_LENGTH_4-1; j++)
		{
#define	PILOT_OFFSET	3	// This is the offset needed to get the pilot samples properly aligned in the
							// pilot buffer so that the timing search is centered on the nominal zero delay sample.
							// It is based on the way the DDC and pilot detector currently function (as of Sept. 15, 2006).
			pilot_buffer_r[j] = buff_ptr_r[PILOT_OFFSET + j];	// save the pilot samples for processing the
			pilot_buffer_i[j] = buff_ptr_i[PILOT_OFFSET + j];	// next frame
		}


		// estimate channel and timing from the pilots
		Timing_channel_estimator(pilot_buffer_r+PILOT_HALF_LENGTH_4, pilot_buffer_i+PILOT_HALF_LENGTH_4, &tau_0_est, &tau_1_est,
		&h0_est_r, &h0_est_i, &h1_est_r, &h1_est_i);
/*TODO */
		if (h0_est_r > maxH0r)
			maxH0r = h0_est_r;
		if (h0_est_r < minH0r)
			minH0r = h0_est_r;
		if (Verbose == 2)
		{
			float Phase0, Phase1;
			Phase0 = atan2(h0_est_i, h0_est_r) * 360 / PI_2;
			Phase1 = atan2(h1_est_i, h1_est_r) * 360 / PI_2;
			printf("t0:% .3f, t1:% .3f, (% .3f); h0: (% .4f, % .4f), |%.4f| <%.4f>; h1: (% .4f, % .4f), |%.4f| <%.4f>, Diff = % .3f",
				tau_0_est, tau_1_est, tau_1_est - tau_0_est, h0_est_r, h0_est_i,
				sqrt(pow(h0_est_r, 2) + pow(h0_est_i, 2)), Phase0,
				h1_est_r, h1_est_i,
				sqrt(pow(h1_est_r, 2) + pow(h1_est_i, 2)), Phase1, Phase1 - Phase0);
		}
		// don't continue on to the trellis detector the first time through because the timing and
		// channel estimates are bogus the first time so there's no point in trying to detect the bits
		// until there are valid timing and channel estimates

#ifndef LIVE_DATA
		if (FirstEstimate)
		{
			FirstEstimate = 0;
			FirstFrameToInterpolate = 1;

			if(Verbose == 2)
				printf("\n");

			continue;
		}
#endif
		// We need to wait until the next frame arrives in order to start the trellis.  The trellis needs the first
		// 20 samples of the next frame in order to start.
		if(FirstFrameToInterpolate)
		{
			FirstFrameToInterpolate = 0;

			// record the current input bits for checking errors in the output of the next detected
			// frame (there is a 1 frame lag between the input and the output due to buffering above)
			for(j = 0; j < DATA_FRAME_LENGTH; j++)
			{
				LastBitsIn[j] = BitsIn[j];
			}
			// Copy frame so it can receive EXTRA_DEMOD_TAIL_SAMPLES from beginning of next frame
			for(i=0; i < FRAME_LENGTH; i++)
			{
				last_frame_r[i] = buff_ptr_r[i];
				last_frame_i[i] = buff_ptr_i[i];
			}
			last_tau_0_est = tau_0_est;
			last_tau_1_est = tau_1_est;
			last_h0_est_r = h0_est_r;
			last_h0_est_i = h0_est_i;
			last_h1_est_r = h1_est_r;
			last_h1_est_i = h1_est_i;

			if(Verbose == 2)
				printf("\n");

#ifndef LIVE_DATA
			continue;
#endif
		}

		// Add EXTRA_DEMOD_TAIL_SAMPLES for trellis
		for(i=0; i < EXTRA_DEMOD_TAIL_SAMPLES; i++)
		{
			last_frame_r[i+FRAME_LENGTH_4] = buff_ptr_r[i];
			last_frame_i[i+FRAME_LENGTH_4] = buff_ptr_i[i];
		}
		int TrellisOffset = 1;
//TODO
#ifdef WRITE_MSGS
		int tmpI0, tmpR0, tmpI1, tmpR1;

		fp_input_r = fopen("C:/Users/frank.ziegler/Documents/GitHub/stcDemod/simData/InterpRam.txt", "r");
		for (i = 0; i < 1500; i++)
		{
			if (fscanf(fp_input_r, "%d %d %d %d", &tmpR0, &tmpI0, &tmpR1, &tmpI1) < 1)
			{
				printf("\n\n\nRan out out Live data\n\n\n");
				exit(EXIT_FAILURE);
			}
			last_frame_r[i+0+PILOT_LENGTH_4-EXTRA_DEMOD_SAMPLES] = tmpR0 / pow(2, 17);	// last frame is offset by mndx0 and mndx1, same data
			last_frame_i[i+0+PILOT_LENGTH_4-EXTRA_DEMOD_SAMPLES] = tmpI0 / pow(2, 17);
		}
		last_h0_est_r = -0.5974;
		last_h0_est_i = -0.5196;
		last_h1_est_r = -0.0095;
		last_h1_est_i =  0.0136;
		last_tau_0_est = -0.28125;	//if HxMag < 0.05, then TAUx = 0
		last_tau_1_est = 0;
		fp_input_r = fopen("HexOutLive.txt", "w");	// Erase previous file
		fclose(fp_input_r);
		TrellisOffset = 7;

#endif WRITE_MSGS
//TODO
		// interpolate to get properly aligned samples (4 streams of 1 sample/bit data)
		// need to compute mu from tau_0 and tau_1
		// need to be sure that the pointers point to the proper starting place in the data
		if (last_tau_0_est >= 0)
			m_ndx = (int)(4 * last_tau_0_est);
		else
			m_ndx = (int)(4 * last_tau_0_est) - 1;
		mu = 4 * last_tau_0_est - m_ndx;

 #ifdef WRITE_MSGS
		float TrellisBufferR[13312], TrellisBufferI[13312];
		for(i=0; i<13312; i++)
		{
			TrellisBufferR[i] = last_frame_r[1+m_ndx+PILOT_LENGTH_4-EXTRA_DEMOD_SAMPLES + i];
			TrellisBufferI[i] = last_frame_i[1+m_ndx+PILOT_LENGTH_4-EXTRA_DEMOD_SAMPLES + i];
		}

		FILE *fp_trellis_in_r, *fp_trellis_in_i;
		fp_trellis_in_r = fopen("trellis_in_r_H0=H1.txt", "w");		// Note, this writes over the previous frame
		fp_trellis_in_i = fopen("trellis_in_i_H0=H1.txt", "w");
		MyFwrite(TrellisBufferR, sizeof(float), 13312, fp_trellis_in_r);
		MyFwrite(TrellisBufferI, sizeof(float), 13312, fp_trellis_in_i);
		fclose(fp_trellis_in_r);
		fclose(fp_trellis_in_i);
#endif WRITE_MSGS
#ifdef WRITE_MSGS
		est_buffer[0] = last_tau_0_est;
		MyFwrite(est_buffer,sizeof(float), TrellisLength, fp_tau_0_est);
		est_buffer[0] = last_tau_1_est;
		MyFwrite(est_buffer,sizeof(float), TrellisLength, fp_tau_1_est);
		est_buffer[0] = last_h0_est_r;
		MyFwrite(est_buffer,sizeof(float), TrellisLength, fp_h_0_r_est);
		est_buffer[0] = last_h0_est_i;
		MyFwrite(est_buffer,sizeof(float), TrellisLength, fp_h_0_i_est);
		est_buffer[0] = last_h1_est_r;
		MyFwrite(est_buffer,sizeof(float), TrellisLength, fp_h_1_r_est);
		est_buffer[0] = last_h1_est_i;
		MyFwrite(est_buffer,sizeof(float), TrellisLength, fp_h_1_i_est);
		est_buffer[0] = 1;
		MyFwrite(est_buffer,sizeof(float), TrellisLength, fp_trellis_start);
#endif WRITE_MSGS

		Interpolator(&(last_frame_r[1+m_ndx+PILOT_LENGTH_4-EXTRA_DEMOD_SAMPLES + TrellisOffset]),
					 &(last_frame_i[1+m_ndx+PILOT_LENGTH_4-EXTRA_DEMOD_SAMPLES + TrellisOffset]),
					 signal_0_r, signal_0_i, DATA_FRAME_LENGTH+8, mu);		// aligned with ch. 0

		if(last_tau_1_est >= 0)
			m_ndx = (int)(4*last_tau_1_est);
		else
			m_ndx = (int)(4*last_tau_1_est)-1;
		mu = 4*last_tau_1_est - m_ndx;

		Interpolator(&(last_frame_r[1+m_ndx+PILOT_LENGTH_4-EXTRA_DEMOD_SAMPLES + TrellisOffset]),
					 &(last_frame_i[1+m_ndx+PILOT_LENGTH_4-EXTRA_DEMOD_SAMPLES + TrellisOffset]),
					 signal_1_r, signal_1_i, DATA_FRAME_LENGTH+8, mu);		// aligned with ch.1


#ifdef WRITE_MSGS
		FILE * fp_sig_0_r;
		FILE * fp_sig_0_i;
		FILE * fp_sig_1_r;
		FILE * fp_sig_1_i;
		fp_sig_0_r = fopen("sig_0_r.txt", "w");
		fp_sig_0_i = fopen("sig_0_i.txt", "w");
		fp_sig_1_r = fopen("sig_1_r.txt", "w");
		fp_sig_1_i = fopen("sig_1_i.txt", "w");
		MyFwrite(signal_0_r, sizeof(float), DATA_FRAME_LENGTH + 8, fp_sig_0_r);
		MyFwrite(signal_0_i, sizeof(float), DATA_FRAME_LENGTH + 8, fp_sig_0_i);
		MyFwrite(signal_1_r, sizeof(float), DATA_FRAME_LENGTH + 8, fp_sig_1_r);
		MyFwrite(signal_1_i, sizeof(float), DATA_FRAME_LENGTH + 8, fp_sig_1_i);
		fclose(fp_sig_0_r);
		fclose(fp_sig_0_i);
		fclose(fp_sig_1_r);
		fclose(fp_sig_1_i);
#endif WRITE_MSGS
//***************************************************************************************
//
// Detector and backend
//
//***************************************************************************************
		// detect the frame of data to generate 3200 data bits
		delta_tau_est = last_tau_1_est - last_tau_0_est;

		printf("\nHello %d\n",n);
#ifdef WRITE_MSGS
			MyFwrite(signal_0_r, sizeof(float), 3204, fp_signal_0_r);
			MyFwrite(signal_0_i, sizeof(float), 3204, fp_signal_0_i);
			MyFwrite(signal_1_r, sizeof(float), 3204, fp_signal_1_r);
			MyFwrite(signal_1_i, sizeof(float), 3204, fp_signal_1_i);

			MyFwrite(&delta_tau_est, sizeof(float), 1, fp_delta_tau_est);
			MyFwrite(&last_h0_est_r, sizeof(float), 1, fp_h0_est_r);
			MyFwrite(&last_h0_est_i, sizeof(float), 1, fp_h0_est_i);
			MyFwrite(&last_h1_est_r, sizeof(float), 1, fp_h1_est_r);
			MyFwrite(&last_h1_est_i, sizeof(float), 1, fp_h1_est_i);
#endif WRITE_MSGS
		Trellis_detector(signal_0_r, signal_0_i, signal_1_r, signal_1_i, BitsOut,
			DATA_FRAME_LENGTH, delta_tau_est, last_h0_est_r, last_h0_est_i, last_h1_est_r, last_h1_est_i);
		//printf("tau0=%f, tau1=%f, delta_tau=%f, h0_r=%f, h0_i=%f, h1_r=%f, h1_i=%f\n",last_tau_0_est,last_tau_1_est, delta_tau_est,last_h0_est_r, last_h0_est_i, last_h1_est_r, last_h1_est_i);

		// Copy frame so it can receive EXTRA_DEMOD_TAIL_SAMPLES from beginning of next frame
		for(i=0; i < FRAME_LENGTH; i++)
		{
			last_frame_r[i] = buff_ptr_r[i];
			last_frame_i[i] = buff_ptr_i[i];
		}
		last_tau_0_est = tau_0_est;
		last_tau_1_est = tau_1_est;
		last_h0_est_r = h0_est_r;
		last_h0_est_i = h0_est_i;
		last_h1_est_r = h1_est_r;
		last_h1_est_i = h1_est_i;
#ifdef WRITE_MSGS
			MyFwrite(LastBitsIn, DATA_FRAME_LENGTH, sizeof(int), fp_golden_bits);
#endif WRITE_MSGS
		// count bit errors
		Errs = 0;
		for(j = 0; j < DATA_FRAME_LENGTH; j++)
		{
			if(BitsOut[j] != LastBitsIn[j])
				Errs++;
			tmp_bits[j] = BitsOut[j] - LastBitsIn[j];
		}

		// don't count bit errors during the initial transient time
		if(n > INITIAL_FRAME_SKIPS)
		{
			if(Errs > BAD_FRAME_THRESHOLD)
			{
				// count bad frames
				BadFrames++;
			}
			else							// don't count bit errors on a bad frame
			{
				// increment bit counter
				BitCount += DATA_FRAME_LENGTH;

				// accumulate the bit errors
				ErrorCount += Errs;
			}
		}

		// record the current input bits for checking errors in the output of the next detected
		// frame (there is a 1 frame lag between the input and the output due to buffering above)
		for(j = 0; j < DATA_FRAME_LENGTH; j++)
		{
			LastBitsIn[j] = BitsIn[j];
		}

		if (n > INITIAL_FRAME_SKIPS)
			printf("Errs: %4d, %d/%d, BER: %.3g\n",Errs,ErrorCount,BitCount,((float)ErrorCount)/((float)BitCount));
		else
			printf("Errs: %4d, %d/%d\n",Errs,ErrorCount,BitCount);

	}

	printf("minR0 = %f, maxR0 = %f\n", minH0r, maxH0r);

	// get the end time for this snr	
	_ftime64_s(&timebuffer2);

	del_t = timebuffer2.time - timebuffer1.time;

	hours = (int)floor(del_t/3600);
	mins = (int)floor((del_t-hours*3600)/60);
	secs = (int)(del_t-hours*3600-mins*60 + 0.5);

	printf("%02d:%02d:%02d  SNR: %4.1f, Errs: %4d, Bits: %d, PE: %g, bad frames: %d, total frames: %d\n",
		hours,mins,secs,snr,ErrorCount,BitCount,(float)ErrorCount/(float)BitCount,BadFrames,n);

	// compute the PE for this SNR
	PE = (float)ErrorCount/(float)BitCount;

	// write out the results to the output file
	fprintf(outfp,"SNR=%f\tPE=%.10f\tErrorCount=%d\tBitCount=%d\tBadFrames=%d\n",snr,PE,ErrorCount,BitCount,BadFrames);

	// close the output file
	fclose(outfp);
#ifdef WRITE_MSGS
	fclose(fp_tau_0_est);
	fclose(fp_tau_1_est);
	fclose(fp_h_0_r_est);
	fclose(fp_h_0_i_est);
	fclose(fp_h_1_r_est);
	fclose(fp_h_1_i_est);
	fclose(fp_trellis_start);
#endif WRITE_MSGS
	// all done



return(0);
}
