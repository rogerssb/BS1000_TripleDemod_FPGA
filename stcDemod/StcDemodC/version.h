/*
 * version.h
 *
 *	This file contains the version number for the project as well as a log of
 *	the changes for each version
 *
 *	Copyright (c) 2005 Tom Nelson, Brigham Young University
 */

#define VERSION			1
#define SUBVERSION		2

/****************************************************************************
Revision History
-----------------------------------------------------------------------------
Version 1.0, Dec. 21, 2005
This is the original version shipped to the Edwards people.  
NTN

-----------------------------------------------------------------------------
Version 1.1, Dec. 22, 2005
Added version tracking and changed code to start counting bit errors after 
a specified number of frames.  Also added a median filter to the frequency
estimator to cut down on outliers in the frequency estimates.  Made minor
change to verbose display.  Added "BadFrame" counter to give indication of
how many frames were completely bad (~50% bit errors).  These errors occur 
as a result of bad parameter estimates (especially bad frequency estimates) 
rather than noise in the trellis detector.  They mess up the BER estimates
so it's good to know when they occur.

Made changes to tier1_stc_receiver.c, frequency_estimator.c, and version.h.
NTN

-----------------------------------------------------------------------------
Version 1.2, Dec. 23, 2005
Changed code so that the errors that occur in a "bad frame" don't contribute 
to the BER.

Made changes to tier1_stc_receiver.c

-----------------------------------------------------------------------------





****************************************************************************/
