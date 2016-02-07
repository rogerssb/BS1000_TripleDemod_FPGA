`ifndef ADDRESS_MAP
`define ADDRESS_MAP

//`define INTERNAL_ADAPT
`define SYM_DEVIATION
`define ADD_SOQPSK_TRELLIS
//`define FM_FILTER

`ifdef LEGACY_DEMOD
`define CIC_COMP_USE_MPY
`define USE_DDC_FIR
`define ADD_DESPREADER
`define ADD_SCPATH
`endif

`ifdef TRELLIS_DEMOD
`define CIC_COMP_USE_MPY
`endif

`ifdef SUBCARRIER_DEMOD
`define DDC_CIC_COMP_USE_MPY
`endif

`ifdef BITSYNC_BERT
`define USE_BUS_CLOCK
`define DF_CIC_COMP_USE_MPY
`define BS_CIC_COMP_USE_MPY
`endif



`ifdef BITSYNC_BERT

// Top level registers
`define BITSYNC_BERT_SPACE  13'b0_00xx_000x_xxxx

`define CH0_DECODERSPACE    13'b0_00xx_1000_xxxx
`define CH1_DECODERSPACE    13'b0_00xx_1001_xxxx
`define DUAL_DECODERSPACE   13'b0_00xx_1010_xxxx

`define INTERP0SPACE        13'b0_00xx_0010_xxxx
`define VIDFIR0SPACE        13'b0_00xx_0011_xxxx
`define INTERP1SPACE        13'b0_00xx_0100_xxxx
`define VIDFIR1SPACE        13'b0_00xx_0101_xxxx
`define INTERP2SPACE        13'b0_00xx_0110_xxxx
`define VIDFIR2SPACE        13'b0_00xx_0111_xxxx

// Bitsync subsystem registers
`define BITSYNC_TOP_SPACE   13'b0_01xx_0000_xxxx

`define CH0_BITSYNCSPACE    13'b0_01x0_010x_xxxx
`define BITSYNCSPACE        `CH0_BITSYNCSPACE
`define CH0_RESAMPSPACE     13'b0_01x0_0110_xxxx
`define CH0_DFSPACE         13'b0_01x0_0111_xxxx
`define CH0_DFFIRSPACE      13'b0_01x0_1000_xxxx
`define CH0_AGCSPACE        13'b0_01x0_1001_xxxx

`define CH1_BITSYNCSPACE    13'b0_01x1_010x_xxxx
`define BITSYNCAUSPACE      `CH1_BITSYNCSPACE
`define CH1_RESAMPSPACE     13'b0_01x1_0110_xxxx
`define CH1_DFSPACE         13'b0_01x1_0111_xxxx
`define CH1_DFFIRSPACE      13'b0_01x1_1000_xxxx
`define CH1_AGCSPACE        13'b0_01x1_1001_xxxx


// BERT subsystem registers
`define BERT_SPACE              13'b1_00xx_xxxx_xxxx

`define BERT_POLY               13'bx_xxxx_x000_00xx
`define POLARITY_HYSTERESIS     13'bx_xxxx_x001_01xx
`define SLIP_LIMIT              13'bx_xxxx_x001_10xx
`define SLIP_THRESHOLD          13'bx_xxxx_x001_11xx
`define SLIP_RECOVERY           13'bx_xxxx_x010_00xx
`define SYNC_THRESHOLD          13'bx_xxxx_x010_01xx
`define SINGLE_TEST_LENGTH      13'bx_xxxx_x010_10xx
`define SINGLE_TEST_ERRORS      13'bx_xxxx_x010_11xx
`define CONTINUOUS_TEST_ERRORS  13'bx_xxxx_x011_00xx
`define TEST_CONTROL            13'bx_xxxx_x011_01xx
`define PNGEN_POLY              13'bx_xxxx_x011_10xx


// Framesync subsystem registers

// PN Generator subsystem registers


// Define the system top level memory map
`define SYS_RESET           13'bx_xxxx_xxx0_000x
`define SYS_VERSION         13'bx_xxxx_xxx0_001x
`define SYS_TYPE            13'bx_xxxx_xxx0_010x
`define SYS_DAC_INPUT_SEL   13'bx_xxxx_xxx0_011x
    `define SYS_DAC_INPUT_SEL_CH0   3'b000
    `define SYS_DAC_INPUT_SEL_CH1   3'b001
    `define SYS_DAC_INPUT_SEL_BERT  3'b010
    `define SYS_DAC_INPUT_SEL_FS    3'b011
    `define SYS_DAC_INPUT_SEL_PNGEN 3'b100
`define SYS_CLOCK           13'bx_xxxx_xxx0_10xx
`define SYS_REBOOT_ADDR     13'bx_xxxx_xxx0_11xx
`define SYS_SUBSYSTEM_CTRL  13'bx_xxxx_xxx1_00xx
`define SYS_OUTPUT_SEL      13'bx_xxxx_xxx1_01xx
    `define SYS_OUTPUT_SEL_CH0_BS   4'b0000
    `define SYS_OUTPUT_SEL_CH0_PCM  4'b0001
    `define SYS_OUTPUT_SEL_CH1_BS   4'b0010
    `define SYS_OUTPUT_SEL_CH1_PCM  4'b0011
    `define SYS_OUTPUT_SEL_DUAL_BS  4'b0100
    `define SYS_OUTPUT_SEL_DUAL_PCM 4'b0101
    `define SYS_OUTPUT_SEL_PNGEN    4'b0110
    `define SYS_OUTPUT_SEL_FS       4'b0111
`define SYS_BERT_MUX_SEL    13'bx_xxxx_xxx1_10xx

// Define bitsyncTopRegs memory map
`define BS_TOP_CONTROL          13'bx_xxxx_xxxx_00xx
`define MODE_SINGLE_CH              2'b00
`define MODE_IND_CH                 2'b01
`define MODE_DUAL_CH                2'b10
`define MODE_OFFSET_CH              2'b11
`define BS_TOP_CH0_DACSELECT    13'bx_xxxx_xxxx_01xx
`define BS_TOP_CH1_DACSELECT    13'bx_xxxx_xxxx_10xx
`define BS_DAC_ADC                  4'b0000
`define BS_DAC_DC                   4'b0001
`define BS_DAC_DF                   4'b0010
`define BS_DAC_SYM                  4'b0011
`define BS_DAC_AGC                  4'b0100
`define BS_DAC_LOCK                 4'b0101
`define BS_TOP_STATUS           13'bx_xxxx_xxxx_11xx

// Define the Resampler memory map
`define RESAMP_RATE         13'bx_xxxx_xxxx_00xx

// Define the Decimating Filter memory map
`define DF_CONTROL          13'bx_xxxx_xxxx_00xx
`define DF_CIC_DECIMATION   13'bx_xxxx_xxxx_01xx
`define DF_CIC_SHIFT        13'bx_xxxx_xxxx_10xx

// Define the Decimating Filter Fir memory map
`define DF_FIR_COEFF_0      13'bx_xxxx_xxxx_000x
`define DF_FIR_COEFF_1      13'bx_xxxx_xxxx_001x
`define DF_FIR_COEFF_2      13'bx_xxxx_xxxx_010x
`define DF_FIR_COEFF_3      13'bx_xxxx_xxxx_011x
`define DF_FIR_COEFF_4      13'bx_xxxx_xxxx_100x
`define DF_FIR_COEFF_5      13'bx_xxxx_xxxx_101x
`define DF_FIR_COEFF_6      13'bx_xxxx_xxxx_110x
`define DF_FIR_COEFF_7      13'bx_xxxx_xxxx_111x




`else  //BITSYNC_BERT

// Split the memory space for the different functions
`define DEMODSPACE          13'bx_0000_0xxx_xxxx
`ifdef FM_FILTER
`define VIDFIRSPACE         13'b0_0000_1xxx_xxxx
`endif
`define DESPREADSPACE       13'b0_0001_xxxx_xxxx
`define DDCSPACE            13'bx_0010_00xx_xxxx
`define DDCFIRSPACE         13'bx_0010_01xx_xxxx
`define CICDECSPACE         13'bx_0010_10xx_xxxx
`define BITSYNCSPACE        13'bx_0100_0xxx_xxxx
`define BITSYNCAUSPACE      13'bx_0100_1xxx_xxxx
`define DECODERSPACE        13'b0_0101_0xxx_xxxx
`define SC0_DECODERSPACE    13'b0_0101_1xxx_xxxx
`define SC1_DECODERSPACE    13'b1_0101_1xxx_xxxx
`define PLLSPACE            13'b0_0110_xxxx_xxxx
`define CHAGCSPACE          13'bx_0111_xxxx_xxxx
`define RESAMPSPACE         13'bx_1000_xxxx_xxxx
`define CARRIERSPACE        13'bx_1001_xxxx_xxxx
`define INTERP0SPACE        13'b0_1010_0xxx_xxxx
`define VIDFIR0SPACE        13'b0_1010_1xxx_xxxx
`define INTERP1SPACE        13'b0_1011_0xxx_xxxx
`define VIDFIR1SPACE        13'b0_1011_1xxx_xxxx
`define INTERP2SPACE        13'b0_1100_0xxx_xxxx
`define VIDFIR2SPACE        13'b0_1100_1xxx_xxxx
`define SCINTERPSPACE       13'b1_1100_0xxx_xxxx
`define SCVIDFIRSPACE       13'b1_1100_1xxx_xxxx
`define MISC_SPACE          13'b0_1101_0xxx_xxxx
`define SUBCARR_TOP_SPACE   13'b0_1101_0xxx_xxxx   // same as MISC space
`define SDISPACE            13'b0_1101_1xxx_xxxx
`define TRELLISLFSPACE      13'b0_1110_0xxx_xxxx
`define TRELLIS_SPACE       13'b0_1110_1xxx_xxxx
`define DAC_SPACE           13'b0_1111_0xxx_xxxx
`define UARTSPACE           13'b0_1111_1xxx_xxxx
`define SCDDCSPACE          13'b1_0010_00xx_xxxx
`define SCDDCFIRSPACE       13'b1_0010_01xx_xxxx
`define SCCICDECSPACE       13'b1_0010_10xx_xxxx
`define SCAGCSPACE          13'b1_0111_xxxx_xxxx
`define SCCARRIERSPACE      13'b1_1001_xxxx_xxxx

`endif  //BITSYNC_BERT

// Define the global radio memory map
`define DEMOD_CONTROL   13'bx_xxxx_xxx0_00xx
`define MODE_AM             5'b00000
`define MODE_PM             5'b00001
`define MODE_FM             5'b00010
`define MODE_2FSK           5'b00011
`define MODE_BPSK           5'b00100
`define MODE_QPSK           5'b00101
`define MODE_OQPSK          5'b00110
`define MODE_AQPSK          5'b00111
`define MODE_PCMTRELLIS     5'b01000
`define MODE_SOQPSK         5'b01001
`define MODE_MULTIH         5'b01010
`define MODE_AUQPSK         5'b01011
`define MODE_UQPSK          5'b01100
`define MODE_SINGLE_RAIL    2'b00
`define MODE_DUAL_RAIL      2'b01
`define MODE_IND_RAIL       2'b10
`define DEMOD_DACSELECT 13'bx_xxxx_xxx0_01xx
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
`define DAC_DS_LOCK         4'b1101
`define DAC_DS_EPOCH        4'b1110
`define DAC_TRELLIS_I       4'b1100
`define DAC_TRELLIS_Q       4'b1101
`define DAC_TRELLIS_PHERR   4'b1110
`define DAC_TRELLIS_INDEX   4'b1111
`define DEMOD_FALSELOCK     13'bx_xxxx_xxx0_10xx
`define DEMOD_STATUS        13'bx_xxxx_xxx0_11xx
`define DEMOD_AMTC          13'bx_xxxx_xxx1_00xx
`define DEMOD_FSKDEV        13'bx_xxxx_xxx1_010x
`define EQUAL_STEP_EXPO     13'bx_xxxx_xxx1_011x
`define EQUAL_CONTROL       13'bx_xxxx_xxx1_100x
`define EQUAL_REF_LEVEL     13'bx_xxxx_xxx1_101x

// Define the FM memory map
`define FM_MOD_FREQ     13'bx_xxxx_xxxx_00xx
`define FM_MOD_DEV      13'bx_xxxx_xxxx_01xx
`define FM_MOD_BITRATE  13'bx_xxxx_xxxx_10xx
`define FM_MOD_CIC      13'bx_xxxx_xxxx_11xx

// Define the DDC memory map
`define DDC_CENTER_FREQ 13'bx_xxxx_xxxx_00xx
`define DDC_CONTROL     13'bx_xxxx_xxxx_01xx
`define DDC_DECIMATION  13'bx_xxxx_xxxx_10xx

// Define the DDC Fir memory map
`define DDC_FIR_COEFF_0 13'bx_xxxx_xxxx_000x
`define DDC_FIR_COEFF_1 13'bx_xxxx_xxxx_001x
`define DDC_FIR_COEFF_2 13'bx_xxxx_xxxx_010x
`define DDC_FIR_COEFF_3 13'bx_xxxx_xxxx_011x
`define DDC_FIR_COEFF_4 13'bx_xxxx_xxxx_100x
`define DDC_FIR_COEFF_5 13'bx_xxxx_xxxx_101x
`define DDC_FIR_COEFF_6 13'bx_xxxx_xxxx_110x
`define DDC_FIR_COEFF_7 13'bx_xxxx_xxxx_111x

// Define the CIC Decimator memory map
`define CIC_DECIMATION  13'bx_xxxx_xxxx_00xx
`define CIC_SHIFT       13'bx_xxxx_xxxx_01xx

// Define the Loop Filter memory map
`define LF_CONTROL      13'bx_xxxx_xxx0_00xx
`define LF_LEAD_LAG     13'bx_xxxx_xxx0_01xx
`define LF_LIMIT        13'bx_xxxx_xxx0_10xx
`define LF_LOOPDATA0    13'bx_xxxx_xxx0_11xx
`define LF_LOCKDETECTOR 13'bx_xxxx_xxx1_00xx
`define LF_INTEGRATOR   13'bx_xxxx_xxx1_01xx
`define LF_LEAD_LAG1    13'bx_xxxx_xxx1_10xx
`define LF_LOOPDATA1    13'bx_xxxx_xxx1_11xx

// Define the AGC Loop Filter memory map
`define ALF_CONTROL     13'bx_xxxx_xxx0_00xx
`define ALF_SETPOINT    13'bx_xxxx_xxx0_01xx
`define ALF_GAINS       13'bx_xxxx_xxx0_10xx
`define ALF_ULIMIT      13'bx_xxxx_xxx0_11xx
`define ALF_LLIMIT      13'bx_xxxx_xxx1_00xx
`define ALF_INTEGRATOR  13'bx_xxxx_xxx1_01xx

// Define the Carrier Loop Filter memory map
`define CLF_CONTROL      13'bx_xxxx_xxx0_00xx
`define CLF_LEAD_LAG     13'bx_xxxx_xxx0_01xx
`define CLF_ULIMIT       13'bx_xxxx_xxx0_10xx
`define CLF_LOOPDATA     13'bx_xxxx_xxx0_11xx
`define CLF_LOCKDETECTOR 13'bx_xxxx_xxx1_00xx
`define CLF_INTEGRATOR   13'bx_xxxx_xxx1_01xx
`define CLF_LLIMIT       13'bx_xxxx_xxx1_10xx

// Define the DDC memory map
`define RESAMPLER_RATE          13'bx_xxxx_xxxx_00xx
`define RESAMPLER_AURATE        13'bx_xxxx_xxxx_01xx
`define RESAMPLER_AUDECIMATION  13'bx_xxxx_xxxx_10xx
`define RESAMPLER_AUSHIFT       13'bx_xxxx_xxxx_11xx

// Define the interpolator memory map
`define INTERP_CONTROL  13'bx_xxxx_xxxx_00xx
`define INTERP_EXPONENT 13'bx_xxxx_xxxx_01xx
`define INTERP_MANTISSA 13'bx_xxxx_xxxx_10xx
`define INTERP_TEST     13'bx_xxxx_xxxx_11xx

// Define the decoder memory map
`define DEC_OPTIONS     13'bx_xxxx_xxxx_000x

// Define the MISCELLANEOUS and subcarrier top level registers
`define MISC_RESET      13'bx_xxxx_xxx0_000x
`define MISC_VERSION    13'bx_xxxx_xxx0_001x
`define MISC_CLOCK      13'bx_xxxx_xxx0_01xx
`define DAC_IN_SEL      13'bx_xxxx_xxx0_100x
`define DAC_IN_SEL_DEMOD    2'b00
`define DAC_IN_SEL_SC0      2'b01
`define DAC_IN_SEL_SC1      2'b10
`define DEC_IN_SEL      13'bx_xxxx_xxx0_101x
`define REBOOT_ADDR     13'bx_xxxx_xxx0_11xx
`define MISC_TYPE       13'bx_xxxx_xxx1_000x
// FPGA Image Types
// NOTE: Multi H is listed as 3 because we don't want to rebuild the image to 
// add the readback circuitry and it defaults to 3
`define LEGACY_DEMOD_IMAGE          16'h0
`define TRELLIS_DEMOD_IMAGE         16'h1
`define TWOCHANNEL_SCDEMOD_IMAGE    16'h2
`define MULTIH_DEMOD_IMAGE          16'h3
`define BITSYNC_BERT_IMAGE          16'h4

// Define the DAC control locations
`define DAC_WDATA       13'bx_xxxx_xxxx_x00x
`define DAC_RDATA       13'bx_xxxx_xxxx_x01x
`define DAC_SELECT      13'bx_xxxx_xxxx_x10x
`define DAC_STATUS      13'bx_xxxx_xxxx_x11x

`define SYMB_PLL_REF    13'bx_xxxx_xxxx_x00x
`define SYMB_PLL_FBK    13'bx_xxxx_xxxx_x01x
`define SYMB_PLL_VCO    13'bx_xxxx_xxxx_x10x
`define SYMB_PLL_NCO    13'bx_xxxx_xxxx_x11x

// Define the Leaky Integrator registers
`define LEAKY_CONTROL   13'bx_xxxx_xxxx_00xx
`define LEAKY_ALPHA     13'bx_xxxx_xxxx_01xx
`define LEAKY_ONE       13'bx_xxxx_xxxx_10xx
`define LEAKY_DEV       13'bx_xxxx_xxxx_11xx

// Define the Trellis registers
`define USE_DECAY
`define TRELLIS_BER     13'bx_xxxx_xxxx_00xx
`define TRELLIS_DEV     13'bx_xxxx_xxxx_01xx
`define TRELLIS_DECAY   13'bx_xxxx_xxxx_10xx
`define TRELLIS_CONTROL 13'bx_xxxx_xxxx_11xx

// Define the SDI registers
`define SDI_CONTROL         13'bx_xxxx_xxxx_00xx
`define SDI_MODE_DISABLED       3'b000
`define SDI_MODE_CONSTELLATION  3'b001
`define SDI_MODE_EYE            3'b010
`define SDI_MODE_ARTM           3'b011
`define SDI_MODE_IEPOCH         3'b100
`define SDI_MODE_QEPOCH         3'b101
`define SDI_ARTM_THRESHOLD  13'bx_xxxx_xxxx_01xx
`define SDI_ARTM_COUNTS     13'bx_xxxx_xxxx_10xx

// Define the UART registers
`define UART_BAUD_DIV   13'bx_xxxx_xxxx_00xx

// Define the Despreader registers
`define DESPREAD_INIT_A             13'bx_xxxx_xx00_00xx
`define DESPREAD_POLYTAPS_A         13'bx_xxxx_xx00_01xx
`define DESPREAD_RESTART_COUNT_A    13'bx_xxxx_xx00_10xx
`define DESPREAD_IOUTTAPS_A         13'bx_xxxx_xx00_11xx
`define DESPREAD_QOUTTAPS_A         13'bx_xxxx_xx01_00xx
`define DESPREAD_CONTROL_A          13'bx_xxxx_xx01_01xx
`define DESPREAD_EPOCH_A            13'bx_xxxx_xx01_10xx
`define DESPREAD_SYNC_CONTROL       13'bx_xxxx_xx01_11xx
`define DESPREAD_INIT_B             13'bx_xxxx_xx10_00xx
`define DESPREAD_POLYTAPS_B         13'bx_xxxx_xx10_01xx
`define DESPREAD_RESTART_COUNT_B    13'bx_xxxx_xx10_10xx
`define DESPREAD_IOUTTAPS_B         13'bx_xxxx_xx10_11xx
`define DESPREAD_QOUTTAPS_B         13'bx_xxxx_xx11_00xx
`define DESPREAD_CONTROL_B          13'bx_xxxx_xx11_01xx
`define DESPREAD_EPOCH_B            13'bx_xxxx_xx11_10xx
`define DESPREAD_CONTROL            13'bx_xxxx_xx11_11xx
`define DS_MODE_NASA_FWD                    3'b000
`define DS_MODE_NASA_DG1_MODE1              3'b001
`define DS_MODE_NASA_DG1_MODE2              3'b010
`define DS_MODE_NASA_DG1_MODE3_SPREAD_I     3'b011
`define DS_MODE_NASA_DG1_MODE3_SPREAD_Q     3'b100







`endif