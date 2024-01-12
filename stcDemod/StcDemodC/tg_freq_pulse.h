/* 
 *  This header file contains the taps for the SOQPSK-TG frequency pulse 
 *  sampled at a rate of 10 samples/bit 
 *  
 *  The filter is partitioned with a polyphase partition so that the filter
 *  can be used for upsampling from 1 sample/ bit to 10 samples/bit.
 *  
 *  Note that the pulse was scaled by pi/2 when it was created.
 *  
 *  This file was produced by c:\nelson\Tier 1 STC\gen_tg_pulse_header.m
 *
 * Copyright (c) 2005 Tom Nelson, Brigham Young University
 */ 

#define    SAMPS_PER_BIT_TG   10
#define    TG_FILT_LEN        8

float tg_freq_pulse_0[TG_FILT_LEN] = {  0.00000000f, 
                                       -0.00085889f, 
                                       -0.00758819f, 
                                        0.04251570f, 
                                        0.09755542f, 
                                        0.03414098f, 
                                       -0.00802549f, 
                                       -0.00038479f, 
                                        };

float tg_freq_pulse_1[TG_FILT_LEN] = { -0.00001602f, 
                                       -0.00151623f, 
                                       -0.00646675f, 
                                        0.05110257f, 
                                        0.09596153f, 
                                        0.02620167f, 
                                       -0.00790361f, 
                                       -0.00008559f, 
                                        };

float tg_freq_pulse_2[TG_FILT_LEN] = { -0.00004895f, 
                                       -0.00234669f, 
                                       -0.00455046f, 
                                        0.05965370f, 
                                        0.09283168f, 
                                        0.01888802f, 
                                       -0.00735372f, 
                                        0.00004656f, 
                                        };

float tg_freq_pulse_3[TG_FILT_LEN] = { -0.00007079f, 
                                       -0.00332112f, 
                                       -0.00175081f, 
                                        0.06790678f, 
                                        0.08827889f, 
                                        0.01235088f, 
                                       -0.00650574f, 
                                        0.00004862f, 
                                        };

float tg_freq_pulse_4[TG_FILT_LEN] = { -0.00005904f, 
                                       -0.00438971f, 
                                        0.00199102f, 
                                        0.07559634f, 
                                        0.08246572f, 
                                        0.00669771f, 
                                       -0.00548157f, 
                                       -0.00001616f, 
                                        };

float tg_freq_pulse_5[TG_FILT_LEN] = { -0.00001235f, 
                                       -0.00548157f, 
                                        0.00669771f, 
                                        0.08246572f, 
                                        0.07559634f, 
                                        0.00199102f, 
                                       -0.00438971f, 
                                       -0.00008545f, 
                                        };

float tg_freq_pulse_6[TG_FILT_LEN] = {  0.00004009f, 
                                       -0.00650574f, 
                                        0.01235088f, 
                                        0.08827889f, 
                                        0.06790678f, 
                                       -0.00175081f, 
                                       -0.00332112f, 
                                       -0.00011866f, 
                                        };

float tg_freq_pulse_7[TG_FILT_LEN] = {  0.00004087f, 
                                       -0.00735372f, 
                                        0.01888802f, 
                                        0.09283168f, 
                                        0.05965370f, 
                                       -0.00455046f, 
                                       -0.00234669f, 
                                       -0.00010565f, 
                                        };

float tg_freq_pulse_8[TG_FILT_LEN] = { -0.00007936f, 
                                       -0.00790361f, 
                                        0.02620167f, 
                                        0.09596153f, 
                                        0.05110257f, 
                                       -0.00646675f, 
                                       -0.00151623f, 
                                       -0.00006251f, 
                                        };

float tg_freq_pulse_9[TG_FILT_LEN] = { -0.00037538f, 
                                       -0.00802549f, 
                                        0.03414098f, 
                                        0.09755542f, 
                                        0.04251570f, 
                                       -0.00758819f, 
                                       -0.00085889f, 
                                       -0.00001842f, 
                                        };


