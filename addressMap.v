`ifndef ADDRESS_MAP
`define ADDRESS_MAP

// Split the memory space for the different functions
`define DEMODSPACE      12'b0000_0xxx_xxxx
`define FMMODSPACE      12'b0001_xxxx_xxxx
`define DDCSPACE        12'b0010_xxxx_xxxx
`define CICDECSPACE     12'b0011_xxxx_xxxx
`define BITSYNCSPACE    12'b0100_0xxx_xxxx
`define BITSYNCAUSPACE  12'b0100_1xxx_xxxx
`define DECODERSPACE    12'b0101_xxxx_xxxx
`define PLLSPACE        12'b0110_xxxx_xxxx
`define CHAGCSPACE      12'b0111_xxxx_xxxx
`define RESAMPSPACE     12'b1000_xxxx_xxxx
`define CARRIERSPACE    12'b1001_xxxx_xxxx
`define INTERP0SPACE    12'b1010_xxxx_xxxx
`define INTERP1SPACE    12'b1011_xxxx_xxxx
`define INTERP2SPACE    12'b1100_xxxx_xxxx
`define MISC_SPACE      12'b1101_0xxx_xxxx
`define SDISPACE        12'b1101_1xxx_xxxx
`define TRELLISLFSPACE  12'b1110_0xxx_xxxx
`define TRELLIS_SPACE   12'b1110_1xxx_xxxx
`define DAC_SPACE       12'b1111_0xxx_xxxx
`define UARTSPACE       12'b1111_1xxx_xxxx

// Define the global radio memory map
`define DEMOD_CONTROL   12'bxxxx_xxx0_00xx
`define MODE_AM             4'b0000
`define MODE_PM             4'b0001
`define MODE_FM             4'b0010
`define MODE_2FSK           4'b0011
`define MODE_BPSK           4'b0100
`define MODE_QPSK           4'b0101
`define MODE_OQPSK          4'b0110
`define MODE_AUQPSK         4'b0111
`define MODE_PCMTRELLIS     4'b1000
`define MODE_SOQPSK         4'b1001
`define MODE_MULTIH         4'b1010
`define MODE_SINGLE_RAIL    2'b00
`define MODE_DUAL_RAIL      2'b01
`define MODE_IND_RAIL       2'b10
`define DEMOD_DACSELECT 12'bxxxx_xxx0_01xx
`define DAC_I               4'b0000
`define DAC_Q               4'b0001
`define DAC_ISYM            4'b0010
`define DAC_QSYM            4'b0011
`define DAC_FREQ            4'b0100
`define DAC_PHASE           4'b0101
`define DAC_MAG             4'b0110
`define DAC_PHERROR         4'b0111
`define DAC_BSLOCK          4'b1000
`define DAC_FREQLOCK        4'b1001
`define DAC_AVGFREQ         4'b1010
`define DAC_FREQERROR       4'b1011
`define DAC_TRELLIS_I       4'b1100
`define DAC_TRELLIS_Q       4'b1101
`define DAC_TRELLIS_PHERR   4'b1110
`define DAC_TRELLIS_INDEX   4'b1111
`define DEMOD_FALSELOCK 12'bxxxx_xxx0_10xx
`define DEMOD_STATUS    12'bxxxx_xxx0_11xx
`define DEMOD_AMTC      12'bxxxx_xxx1_00xx
`define DEMOD_FSKDEV    12'bxxxx_xxx1_01xx

// Define the FM memory map
`define FM_MOD_FREQ     12'bxxxx_xxxx_00xx
`define FM_MOD_DEV      12'bxxxx_xxxx_01xx
`define FM_MOD_BITRATE  12'bxxxx_xxxx_10xx
`define FM_MOD_CIC      12'bxxxx_xxxx_11xx

// Define the DDC memory map
//`define DDC_CENTER_FREQ 12'bxxxx_xxxx_00xx
//`define DDC_CONTROL     12'bxxxx_xxxx_01xx
`define DDC_CENTER_FREQ 12'bxxxx_xx00_00xx
`define DDC_CONTROL     12'bxxxx_xx00_01xx
`define DDC_FIR_COEFF_0 12'bxxxx_xx00_10xx
`define DDC_FIR_COEFF_1 12'bxxxx_xx00_11xx
`define DDC_FIR_COEFF_2 12'bxxxx_xx01_00xx
`define DDC_FIR_COEFF_3 12'bxxxx_xx01_01xx
`define DDC_FIR_COEFF_4 12'bxxxx_xx01_10xx
`define DDC_FIR_COEFF_5 12'bxxxx_xx01_11xx
`define DDC_FIR_COEFF_6 12'bxxxx_xx10_00xx
`define DDC_FIR_COEFF_7 12'bxxxx_xx10_01xx

// Define the CIC Decimator memory map
`define CIC_DECIMATION  12'bxxxx_xxxx_00xx
`define CIC_SHIFT       12'bxxxx_xxxx_01xx

// Define the Loop Filter memory map
`define LF_CONTROL      12'bxxxx_xxx0_00xx
`define LF_LEAD_LAG     12'bxxxx_xxx0_01xx
`define LF_LIMIT        12'bxxxx_xxx0_10xx
`define LF_LOOPDATA     12'bxxxx_xxx0_11xx
`define LF_LOCKDETECTOR 12'bxxxx_xxx1_00xx
`define LF_INTEGRATOR   12'bxxxx_xxx1_01xx

// Define the AGC Loop Filter memory map
`define ALF_CONTROL     12'bxxxx_xxx0_00xx
`define ALF_SETPOINT    12'bxxxx_xxx0_01xx
`define ALF_GAINS       12'bxxxx_xxx0_10xx
`define ALF_ULIMIT      12'bxxxx_xxx0_11xx
`define ALF_LLIMIT      12'bxxxx_xxx1_00xx
`define ALF_INTEGRATOR  12'bxxxx_xxx1_01xx

// Define the DDC memory map
`define RESAMPLER_RATE          12'bxxxx_xxx0_00xx
`define RESAMPLER_AURATE        12'bxxxx_xxx0_01xx
`define RESAMPLER_AUDECIMATION  12'bxxxx_xxx0_10xx
`define RESAMPLER_AUSHIFT       12'bxxxx_xxx0_11xx

// Define the interpolator memory map
`define INTERP_CONTROL  12'bxxxx_xxxx_00xx
`define INTERP_EXPONENT 12'bxxxx_xxxx_01xx
`define INTERP_MANTISSA 12'bxxxx_xxxx_10xx
`define INTERP_TEST     12'bxxxx_xxxx_11xx


// Define the MISCELLANEOUS locations
`define MISC_RESET      12'bxxxx_xxxx_x00x
`define MISC_VERSION    12'bxxxx_xxxx_x01x
`define MISC_CLOCK      12'bxxxx_xxxx_x1xx

// Define the DAC control locations
`define DAC_WDATA       12'bxxxx_xxxx_x00x
`define DAC_RDATA       12'bxxxx_xxxx_x01x
`define DAC_SELECT      12'bxxxx_xxxx_x10x
`define DAC_STATUS      12'bxxxx_xxxx_x11x

`define SYMB_PLL_REF    12'bxxxx_xxxx_x00x
`define SYMB_PLL_FBK    12'bxxxx_xxxx_x01x
`define SYMB_PLL_VCO    12'bxxxx_xxxx_x10x
`define SYMB_PLL_NCO    12'bxxxx_xxxx_x11x

// Define the Leaky Integrator registers
`define LEAKY_CONTROL   12'bxxxx_xxxx_00xx
`define LEAKY_ALPHA     12'bxxxx_xxxx_01xx
`define LEAKY_ONE       12'bxxxx_xxxx_10xx
`define LEAKY_DEV       12'bxxxx_xxxx_11xx

// Define the Trellis registers
`define USE_DECAY
`define TRELLIS_BER     12'bxxxx_xxxx_00xx
`define TRELLIS_DEV     12'bxxxx_xxxx_01xx
`define TRELLIS_DECAY   12'bxxxx_xxxx_10xx
`define TRELLIS_CONTROL 12'bxxxx_xxxx_11xx

// Define the SDI registers
`define SDI_CONTROL     12'bxxxx_xxxx_00xx
`define SDI_MODE_DISABLED       2'b00
`define SDI_MODE_CONSTELLATION  2'b01
`define SDI_MODE_EYE            2'b10
`define SDI_MODE_ARTM           2'b11

// Define the UART registers
`define UART_BAUD_DIV   12'bxxxx_xxxx_00xx

`endif
