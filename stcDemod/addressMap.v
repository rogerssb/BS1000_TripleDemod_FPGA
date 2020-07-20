`ifndef ADDRESS_MAP
`define ADDRESS_MAP

// Number of LS bits used to decode the address space
`define ADDRESS_BITS        13

// Split the memory space for the different functions
`define DLL0SPACE           `ADDRESS_BITS'bx_00xx_1010_0xxx
`define DLL1SPACE           `ADDRESS_BITS'bx_00xx_1010_1xxx
`define DLL2SPACE           `ADDRESS_BITS'bx_00xx_1011_0xxx
`define PLLSPACE            `ADDRESS_BITS'bx_00xx_11xx_xxxx
`define DDCSPACE            `ADDRESS_BITS'bx_0010_00xx_xxxx
`define DDCFIRSPACE         `ADDRESS_BITS'bx_0010_01xx_xxxx
`define CICDECSPACE         `ADDRESS_BITS'bx_0010_10xx_xxxx
`define CHAGCSPACE          `ADDRESS_BITS'bx_0111_xxxx_xxxx
`define RESAMPSPACE         `ADDRESS_BITS'bx_1000_xxxx_xxxx
`define INTERP0SPACE        `ADDRESS_BITS'bx_1010_0xxx_xxxx
`define VIDFIR0SPACE        `ADDRESS_BITS'bx_1010_1xxx_xxxx
`define INTERP1SPACE        `ADDRESS_BITS'bx_1011_0xxx_xxxx
`define VIDFIR1SPACE        `ADDRESS_BITS'bx_1011_1xxx_xxxx
`define INTERP2SPACE        `ADDRESS_BITS'bx_1100_0xxx_xxxx
`define VIDFIR2SPACE        `ADDRESS_BITS'bx_1100_1xxx_xxxx
`define MISC_SPACE          `ADDRESS_BITS'bx_1101_0xxx_xxxx
`define DAC_SPACE           `ADDRESS_BITS'bx_1111_0xxx_xxxx

// Digital PLL subsystem registers
`define DLL_CENTER_FREQ     `ADDRESS_BITS'bx_xxxx_xxxx_x0xx
`define DLL_GAINS           `ADDRESS_BITS'bx_xxxx_xxxx_x1xx

// PLL subsystem registers
`define PLL0_BITS_0to31     `ADDRESS_BITS'bx_xxxx_xx00_00xx
`define PLL0_BITS_68to99    `ADDRESS_BITS'bx_xxxx_xx00_01xx
`define PLL0_BITS_100to131  `ADDRESS_BITS'bx_xxxx_xx00_10xx
`define PLL0_CONTROL        `ADDRESS_BITS'bx_xxxx_xx00_110x
`define PLL0_XFER           `ADDRESS_BITS'bx_xxxx_xx00_111x
`define PLL1_BITS_0to31     `ADDRESS_BITS'bx_xxxx_xx01_00xx
`define PLL1_BITS_68to99    `ADDRESS_BITS'bx_xxxx_xx01_01xx
`define PLL1_BITS_100to131  `ADDRESS_BITS'bx_xxxx_xx01_10xx
`define PLL1_CONTROL        `ADDRESS_BITS'bx_xxxx_xx01_110x
`define PLL1_XFER           `ADDRESS_BITS'bx_xxxx_xx01_111x
`define PLL2_BITS_0to31     `ADDRESS_BITS'bx_xxxx_xx10_00xx
`define PLL2_BITS_68to99    `ADDRESS_BITS'bx_xxxx_xx10_01xx
`define PLL2_BITS_100to131  `ADDRESS_BITS'bx_xxxx_xx10_10xx
`define PLL2_CONTROL        `ADDRESS_BITS'bx_xxxx_xx10_110x
`define PLL2_XFER           `ADDRESS_BITS'bx_xxxx_xx10_111x

// Define the DDC memory map
`define DDC_CENTER_FREQ `ADDRESS_BITS'bx_xxxx_xxxx_00xx
`define DDC_CONTROL     `ADDRESS_BITS'bx_xxxx_xxxx_01xx
`define DDC_DECIMATION  `ADDRESS_BITS'bx_xxxx_xxxx_10xx

// Define the DDC Fir memory map
`define DDC_FIR_COEFF_0 `ADDRESS_BITS'bx_xxxx_xxxx_000x
`define DDC_FIR_COEFF_1 `ADDRESS_BITS'bx_xxxx_xxxx_001x
`define DDC_FIR_COEFF_2 `ADDRESS_BITS'bx_xxxx_xxxx_010x
`define DDC_FIR_COEFF_3 `ADDRESS_BITS'bx_xxxx_xxxx_011x
`define DDC_FIR_COEFF_4 `ADDRESS_BITS'bx_xxxx_xxxx_100x
`define DDC_FIR_COEFF_5 `ADDRESS_BITS'bx_xxxx_xxxx_101x
`define DDC_FIR_COEFF_6 `ADDRESS_BITS'bx_xxxx_xxxx_110x
`define DDC_FIR_COEFF_7 `ADDRESS_BITS'bx_xxxx_xxxx_111x

// Define the CIC Decimator memory map
`define CIC_DECIMATION  `ADDRESS_BITS'bx_xxxx_xxxx_00xx
`define CIC_SHIFT       `ADDRESS_BITS'bx_xxxx_xxxx_01xx

// Define the AGC Loop Filter memory map
`define ALF_CONTROL     `ADDRESS_BITS'bx_xxxx_xxx0_00xx
`define ALF_SETPOINT    `ADDRESS_BITS'bx_xxxx_xxx0_01xx
`define ALF_GAINS       `ADDRESS_BITS'bx_xxxx_xxx0_10xx
`define ALF_ULIMIT      `ADDRESS_BITS'bx_xxxx_xxx0_11xx
`define ALF_LLIMIT      `ADDRESS_BITS'bx_xxxx_xxx1_00xx
`define ALF_INTEGRATOR  `ADDRESS_BITS'bx_xxxx_xxx1_01xx

// Define the Resampler memory map
`define RESAMPLER_RATE          `ADDRESS_BITS'bx_xxxx_xxx0_00xx
`define RESAMPLER_AURATE        `ADDRESS_BITS'bx_xxxx_xxx0_01xx
`define RESAMPLER_AUDECIMATION  `ADDRESS_BITS'bx_xxxx_xxx0_10xx
`define RESAMPLER_AUSHIFT       `ADDRESS_BITS'bx_xxxx_xxx0_11xx

// Define the interpolator memory map
`define INTERP_CONTROL  `ADDRESS_BITS'bx_xxxx_xxxx_00xx
`define INTERP_EXPONENT `ADDRESS_BITS'bx_xxxx_xxxx_01xx
`define INTERP_MANTISSA `ADDRESS_BITS'bx_xxxx_xxxx_10xx
`define INTERP_TEST     `ADDRESS_BITS'bx_xxxx_xxxx_11xx

// Define the MISCELLANEOUS and subcarrier top level registers
`define MISC_RESET      `ADDRESS_BITS'bx_xxxx_xxx0_000x
`define MISC_VERSION    `ADDRESS_BITS'bx_xxxx_xxx0_001x
`define MISC_CLOCK      `ADDRESS_BITS'bx_xxxx_xxx0_01xx
`define DAC_IN_SEL      `ADDRESS_BITS'bx_xxxx_xxx0_100x
    `define DAC_IN_SEL_DEMOD    2'b00
    `define DAC_IN_SEL_SC0      2'b01
    `define DAC_IN_SEL_SC1      2'b10
`define DEC_IN_SEL      `ADDRESS_BITS'bx_xxxx_xxx0_101x
    `define DEC_MUX_SEL_DEMOD   2'b00
    `define DEC_MUX_SEL_SC0     2'b01
    `define DEC_MUX_SEL_VITERBI 2'b10
    `define OUT_MUX_SEL_DEMOD   2'b00
    `define OUT_MUX_SEL_SC0     2'b01
    `define OUT_MUX_SEL_SC1     2'b10
    `define OUT_MUX_SEL_DQM     2'b11
`define REBOOT_ADDR     `ADDRESS_BITS'bx_xxxx_xxx0_11xx
`define MISC_TYPE       `ADDRESS_BITS'bx_xxxx_xxx1_000x
// FPGA Image Types
// NOTE: Multi H is listed as 3 because we don't want to rebuild the image to
// add the readback circuitry and it defaults to 3
`define LEGACY_DEMOD_IMAGE          16'h0
`define TRELLIS_DEMOD_IMAGE         16'h1
`define TWOCHANNEL_SCDEMOD_IMAGE    16'h2
`define MULTIH_DEMOD_IMAGE          16'h3
`define BITSYNC_BERT_IMAGE          16'h4
`define LEGACY_CMA_IMAGE            16'h5

// Define the DAC control locations
`define DAC_WDATA       `ADDRESS_BITS'bx_xxxx_xxxx_x00x
`define DAC_RDATA       `ADDRESS_BITS'bx_xxxx_xxxx_x01x
`define DAC_SELECT      `ADDRESS_BITS'bx_xxxx_xxxx_x10x
`define DAC_STATUS      `ADDRESS_BITS'bx_xxxx_xxxx_x11x

`endif //ADDRESS_MAP

