
`ifndef ADDRESS_MAP
`define ADDRESS_MAP

//`define INTERNAL_ADAPT
`define SYM_DEVIATION
`define ADD_SOQPSK_TRELLIS
//`define FM_FILTER
`define ADD_DESPREADER


// Split the memory space for the different functions
`define DEMODSPACE      12'b0000_0xxx_xxxx
`ifdef FM_FILTER
`define VIDFIRSPACE     12'b0000_1xxx_xxxx
`endif
`define DESPREADSPACE   12'b0001_xxxx_xxxx
`define DDCSPACE        12'b0010_0xxx_xxxx
`define DDCFIRSPACE     12'b0010_1xxx_xxxx
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
`define SUBCARR_TOP_SPACE      12'b1101_0xxx_xxxx   // same as MISC space
`define SDISPACE        12'b1101_1xxx_xxxx
`define TRELLISLFSPACE  12'b1110_0xxx_xxxx
`define TRELLIS_SPACE   12'b1110_1xxx_xxxx
`define DAC_SPACE       12'b1111_0xxx_xxxx
`define UARTSPACE       12'b1111_1xxx_xxxx

// Define the global radio memory map
`define DEMOD_CONTROL   12'bxxxx_xxx0_00xx
`define MODE_AM             5'b00000
`define MODE_PM             5'b00001
`define MODE_FM             5'b00010
`define MODE_2FSK           5'b00011
`define MODE_BPSK           5'b00100
`define MODE_QPSK           5'b00101
`define MODE_OQPSK          5'b00110
`define MODE_AUQPSK         5'b00111
`define MODE_PCMTRELLIS     5'b01000
`define MODE_SOQPSK         5'b01001
`define MODE_MULTIH         5'b01010
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
`define DAC_DS_CODE         4'b1100
`define DAC_TRELLIS_I       4'b1100
`define DAC_TRELLIS_Q       4'b1101
`define DAC_TRELLIS_PHERR   4'b1110
`define DAC_TRELLIS_INDEX   4'b1111
`define DEMOD_FALSELOCK     12'bxxxx_xxx0_10xx
`define DEMOD_STATUS        12'bxxxx_xxx0_11xx
`define DEMOD_AMTC          12'bxxxx_xxx1_00xx
`define DEMOD_FSKDEV        12'bxxxx_xxx1_010x
`define EQUAL_STEP_EXPO     12'bxxxx_xxx1_011x
`define EQUAL_CONTROL       12'bxxxx_xxx1_100x
`define EQUAL_REF_LEVEL     12'bxxxx_xxx1_101x

// Define the FM memory map
`define FM_MOD_FREQ     12'bxxxx_xxxx_00xx
`define FM_MOD_DEV      12'bxxxx_xxxx_01xx
`define FM_MOD_BITRATE  12'bxxxx_xxxx_10xx
`define FM_MOD_CIC      12'bxxxx_xxxx_11xx

// Define the DDC memory map
`define DDC_CENTER_FREQ 12'bxxxx_xxxx_00xx
`define DDC_CONTROL     12'bxxxx_xxxx_01xx
`define DDC_DECIMATION  12'bxxxx_xxxx_10xx

// Define the DDC Fir memory map
`define DDC_FIR_COEFF_0 12'bxxxx_xxxx_000x
`define DDC_FIR_COEFF_1 12'bxxxx_xxxx_001x
`define DDC_FIR_COEFF_2 12'bxxxx_xxxx_010x
`define DDC_FIR_COEFF_3 12'bxxxx_xxxx_011x
`define DDC_FIR_COEFF_4 12'bxxxx_xxxx_100x
`define DDC_FIR_COEFF_5 12'bxxxx_xxxx_101x
`define DDC_FIR_COEFF_6 12'bxxxx_xxxx_110x
`define DDC_FIR_COEFF_7 12'bxxxx_xxxx_111x

// Define the CIC Decimator memory map
`define CIC_DECIMATION  12'bxxxx_xxxx_00xx
`define CIC_SHIFT       12'bxxxx_xxxx_01xx

// Define the Loop Filter memory map
`define LF_CONTROL      12'bxxxx_xxx0_00xx
`define LF_LEAD_LAG     12'bxxxx_xxx0_01xx
`define LF_LIMIT        12'bxxxx_xxx0_10xx
`define LF_LOOPDATA0    12'bxxxx_xxx0_11xx
`define LF_LOCKDETECTOR 12'bxxxx_xxx1_00xx
`define LF_INTEGRATOR   12'bxxxx_xxx1_01xx
`define LF_LEAD_LAG1    12'bxxxx_xxx1_10xx
`define LF_LOOPDATA1    12'bxxxx_xxx1_11xx

// Define the AGC Loop Filter memory map
`define ALF_CONTROL     12'bxxxx_xxx0_00xx
`define ALF_SETPOINT    12'bxxxx_xxx0_01xx
`define ALF_GAINS       12'bxxxx_xxx0_10xx
`define ALF_ULIMIT      12'bxxxx_xxx0_11xx
`define ALF_LLIMIT      12'bxxxx_xxx1_00xx
`define ALF_INTEGRATOR  12'bxxxx_xxx1_01xx

// Define the Carrier Loop Filter memory map
`define CLF_CONTROL      12'bxxxx_xxx0_00xx
`define CLF_LEAD_LAG     12'bxxxx_xxx0_01xx
`define CLF_ULIMIT       12'bxxxx_xxx0_10xx
`define CLF_LOOPDATA     12'bxxxx_xxx0_11xx
`define CLF_LOCKDETECTOR 12'bxxxx_xxx1_00xx
`define CLF_INTEGRATOR   12'bxxxx_xxx1_01xx
`define CLF_LLIMIT       12'bxxxx_xxx1_10xx

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


// Define the MISCELLANEOUS and subcarrier top level registers
`define MISC_RESET      12'bxxxx_xxxx_000x
`define MISC_VERSION    12'bxxxx_xxxx_001x
`define MISC_CLOCK      12'bxxxx_xxxx_01xx
`define DAC_IN_SEL      12'bxxxx_xxxx_100x
`define DEC_IN_SEL      12'bxxxx_xxxx_101x
`define REBOOT_ADDR     12'bxxxx_xxxx_11xx

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
`define SDI_CONTROL         12'bxxxx_xxxx_00xx
`define SDI_MODE_DISABLED       2'b00
`define SDI_MODE_CONSTELLATION  2'b01
`define SDI_MODE_EYE            2'b10
`define SDI_MODE_ARTM           2'b11
`define SDI_ARTM_THRESHOLD  12'bxxxx_xxxx_01xx
`define SDI_ARTM_COUNTS     12'bxxxx_xxxx_10xx

// Define the UART registers
`define UART_BAUD_DIV   12'bxxxx_xxxx_00xx

// Define the Despreader registers
`define DESPREAD_INIT_A             12'bxxxx_xx00_00xx
`define DESPREAD_POLYTAPS_A         12'bxxxx_xx00_01xx
`define DESPREAD_RESTART_COUNT_A    12'bxxxx_xx00_10xx
`define DESPREAD_IOUTTAPS_A         12'bxxxx_xx00_11xx
`define DESPREAD_QOUTTAPS_A         12'bxxxx_xx01_00xx
`define DESPREAD_CONTROL_A          12'bxxxx_xx01_01xx
`define DESPREAD_EPOCH_A            12'bxxxx_xx01_10xx
`define DESPREAD_INIT_B             12'bxxxx_xx10_00xx
`define DESPREAD_POLYTAPS_B         12'bxxxx_xx10_01xx
`define DESPREAD_RESTART_COUNT_B    12'bxxxx_xx10_10xx
`define DESPREAD_IOUTTAPS_B         12'bxxxx_xx10_11xx
`define DESPREAD_QOUTTAPS_B         12'bxxxx_xx11_00xx
`define DESPREAD_CONTROL_B          12'bxxxx_xx11_01xx
`define DESPREAD_EPOCH_B            12'bxxxx_xx11_10xx
`define DESPREAD_CONTROL            12'bxxxx_xx11_11xx
`define MODE_NASA_FWD                   2'b00
`define MODE_NASA_DG1_MODE1             2'b01
`define MODE_NASA_DG1_MODE2             2'b10
`endif