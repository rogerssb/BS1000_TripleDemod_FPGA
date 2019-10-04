`ifndef ADDRESS_MAP
`define ADDRESS_MAP

// FPGA Image Types
// NOTE: Multi H is listed as 3 because we don't want to rebuild the image to
// add the readback circuitry and it defaults to 3
`define LEGACY_DEMOD_IMAGE          16'h0
`define TRELLIS_DEMOD_IMAGE         16'h1
`define TWOCHANNEL_SCDEMOD_IMAGE    16'h2
`define MULTIH_DEMOD_IMAGE          16'h3
`define BITSYNC_BERT_IMAGE          16'h4
`define LEGACY_CMA_IMAGE            16'h5
`define SEMCO_DEMOD_IMAGE           16'h6
`define LDPC_DEMOD_IMAGE            16'h7
`define STC_DEMOD_IMAGE             16'h8

//`define INTERNAL_ADAPT
`define SYM_DEVIATION
`define ADD_SOQPSK_TRELLIS
//`define FM_FILTER

`ifdef LEGACY_DEMOD
`define CIC_COMP_USE_MPY
`define USE_DDC_FIR
//`define ADD_DESPREADER
`define ADD_SCPATH
`define ADD_DQM
`define ADD_SUPERBAUD_TED
//`define ALTERNATE_PHASE
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
`define ADD_BERT
`define USE_DEMOD_CandD
//`define ADD_TURBO
`define ADD_MSE
`endif

`ifdef TRIPLE_DEMOD
`define SEMCO_DEMOD
`define R6100
`endif

`ifdef TRIPLE_LDPC
`define LDPC_DEMOD
`define R6100
`endif

`ifdef SEMCO_DEMOD
`define FPGA_TYPE           `SEMCO_DEMOD_IMAGE
`define SEMCO_DEMOD_MAP
`define USE_BUS_CLOCK
`define USE_VIVADO_CORES
`define USE_DDC_FIR
//`define ADD_DESPREADER
//`define ADD_SCPATH
`define ADD_CMA
`define ADD_TRELLIS
`define ADD_MULTIH
//`define ADD_LDPC
`define ADD_DQM
`define ADD_SUPERBAUD_TED
`ifndef SIMULATE
`define EMBED_MULTIH_CARRIER_LOOP
`endif
`define ADD_SPI_GATEWAY
`define ADD_BERT
`define ADD_MULTIBOOT
`define ADD_SPECTRAL_SWEEP
`endif

`ifdef LDPC_DEMOD
`define FPGA_TYPE           `LDPC_DEMOD_IMAGE
`define SEMCO_DEMOD_MAP
`define USE_BUS_CLOCK
`define USE_VIVADO_CORES
`define USE_DDC_FIR
//`define ADD_DESPREADER
//`define ADD_SCPATH
`define ADD_CMA
//`define ADD_TRELLIS
//`define ADD_MULTIH
`define ADD_LDPC
`define ADD_DQM
`define ADD_SUPERBAUD_TED
`ifndef SIMULATE
`define EMBED_MULTIH_CARRIER_LOOP
`endif
`define ADD_SPI_GATEWAY
`define ADD_BERT
`define ADD_MULTIBOOT
`define ADD_SPECTRAL_SWEEP
`endif

`ifdef ADD_LDPC
    //`define TEST_LDPC
`endif

`ifdef ADD_CMA
    `define ADD_CMA_DISPLAY
`endif

`ifdef BITSYNC_BERT

// Top level registers
`define BITSYNC_BERT_SPACE  13'b0_00xx_000x_xxxx
    // Define the system top level memory map
    `define SYS_RESET           13'bx_xxxx_xxx0_000x
    `define SYS_VERSION         13'bx_xxxx_xxx0_001x
    `define SYS_RSVD0           13'bx_xxxx_xxx0_01xx
    `define SYS_DAC_INPUT_SEL   13'bx_xxxx_xxx0_10xx
        `define SYS_DAC_INPUT_SEL_CH0   3'b000
        `define SYS_DAC_INPUT_SEL_CH1   3'b001
        `define SYS_DAC_INPUT_SEL_BERT  3'b010
        `define SYS_DAC_INPUT_SEL_FS    3'b011
        `define SYS_DAC_INPUT_SEL_PNGEN 3'b100
        `define SYS_DAC_INPUT_SEL_DLL0  3'b101
        `define SYS_DAC_INPUT_SEL_DLL1  3'b110
        `define SYS_DAC_INPUT_SEL_TURBO 3'b111
    `define SYS_REBOOT_ADDR     13'bx_xxxx_xxx0_11xx
    `define SYS_TYPE            13'bx_xxxx_xxx1_000x
    `define SYS_RSVD1           13'bx_xxxx_xxx1_001x
    `define SYS_SUBSYSTEM_CTRL  13'bx_xxxx_xxx1_01xx
    `define SYS_OUTPUT_SEL      13'bx_xxxx_xxx1_10xx
        `define SYS_OUTPUT_SEL_CH0_BS   4'b0000
        `define SYS_OUTPUT_SEL_CH0_PCM  4'b0001
        `define SYS_OUTPUT_SEL_CH1_BS   4'b0010
        `define SYS_OUTPUT_SEL_CH1_PCM  4'b0011
        `define SYS_OUTPUT_SEL_SINGLE   4'b0100
        `define SYS_OUTPUT_SEL_DIFF     4'b0101
        `define SYS_OUTPUT_SEL_PNGEN    4'b0110
        `define SYS_OUTPUT_SEL_FS       4'b0111
    `define SYS_BERT_MUX_SEL    13'bx_xxxx_xxx1_110x
    `define SYS_FRAMER_MUX_SEL  13'bx_xxxx_xxx1_111x

`define INTERP0SPACE        13'b0_00xx_0010_xxxx
`define VIDFIR0SPACE        13'b0_00xx_0011_xxxx
`define INTERP1SPACE        13'b0_00xx_0100_xxxx
`define VIDFIR1SPACE        13'b0_00xx_0101_xxxx
`define INTERP2SPACE        13'b0_00xx_0110_xxxx
`define VIDFIR2SPACE        13'b0_00xx_0111_xxxx

`define DUAL_DECODERSPACE   13'b0_00xx_1000_xxxx
`define CH1_DECODERSPACE    13'b0_00xx_1001_xxxx
`define DEC_CONTROL         13'bx_xxxx_xxxx_00xx
    `define DEC_DERAND_MODE_OFF     3'b000
    `define DEC_DERAND_MODE_RNRZ15  3'b001
    `define DEC_DERAND_MODE_RNRZ9   3'b010
    `define DEC_DERAND_MODE_RNRZ11  3'b011
    `define DEC_DERAND_MODE_RNRZ17  3'b100
    `define DEC_DERAND_MODE_RNRZ23  3'b101
    `define DEC_CLK_PHASE_0         2'b00
    `define DEC_CLK_PHASE_180       2'b01
    `define DEC_CLK_PHASE_90        2'b10
    `define DEC_CLK_PHASE_270       2'b11
    `define DEC_INPUT_BS            2'b00
    `define DEC_INPUT_TURBO         2'b01
    `define DEC_INPUT_VITERBI       2'b10

`ifdef USE_DEMOD_CandD

// Clock and Data subsystem registers
`define CandD0SPACE         13'b0_00xx_1011_xxxx
`define CandD1SPACE         13'b0_00xx_1101_xxxx
`define CandD2SPACE         13'b0_00xx_1111_xxxx
    `define CandD_CONTROL           13'bx_xxxx_xxxx_00xx
        `define CandD_SRC_LEGACY_I      4'b0000
        `define CandD_SRC_LEGACY_Q      4'b0001
        `define CandD_SRC_PCMTRELLIS    4'b0010
        `define CandD_SRC_MULTIH        4'b0011
        `define CandD_SRC_STC           4'b0100
        `define CandD_SRC_PNGEN         4'b0101
        `define CandD_SRC_LDPC          4'b0110
        `define CandD_SRC_TURBO         4'b0111
        `define CandD_SRC_DEC0_CH0      4'b1000
        `define CandD_SRC_DEC0_CH1      4'b1001
        `define CandD_SRC_DEC1_CH0      4'b1010
        `define CandD_SRC_DEC1_CH1      4'b1011
        `define CandD_SRC_DEC2_CH0      4'b1100
        `define CandD_SRC_DEC2_CH1      4'b1101
        `define CandD_SRC_DEC3_CH0      4'b1110
        `define CandD_SRC_DEC3_CH1      4'b1111
        `define CandD_CLK_PHASE_0       2'b00
        `define CandD_CLK_PHASE_90      2'b01
        `define CandD_CLK_PHASE_180     2'b10
        `define CandD_CLK_PHASE_270     2'b11
    `define CandD_DLL_CENTER_FREQ   13'bx_xxxx_xxxx_01xx
    `define CandD_DLL_GAINS         13'bx_xxxx_xxxx_100x
    `define CandD_DLL_FDBK_DIV      13'bx_xxxx_xxxx_101x

// PLL subsystem registers
`define PLL0SPACE           13'b0_00xx_1010_xxxx
`define PLL1SPACE           13'b0_00xx_1100_xxxx
`define PLL2SPACE           13'b0_00xx_1110_xxxx
    `define PLL0_BITS_0to31     13'bx_xxxx_xxxx_00xx
    `define PLL0_BITS_68to99    13'bx_xxxx_xxxx_01xx
    `define PLL0_BITS_100to131  13'bx_xxxx_xxxx_10xx
    `define PLL0_CONTROL        13'bx_xxxx_xxxx_110x
    `define PLL0_XFER           13'bx_xxxx_xxxx_111x
    `define PLL1_BITS_0to31     13'bx_xxxx_xxxx_00xx
    `define PLL1_BITS_68to99    13'bx_xxxx_xxxx_01xx
    `define PLL1_BITS_100to131  13'bx_xxxx_xxxx_10xx
    `define PLL1_CONTROL        13'bx_xxxx_xxxx_110x
    `define PLL1_XFER           13'bx_xxxx_xxxx_111x
    `define PLL2_BITS_0to31     13'bx_xxxx_xxxx_00xx
    `define PLL2_BITS_68to99    13'bx_xxxx_xxxx_01xx
    `define PLL2_BITS_100to131  13'bx_xxxx_xxxx_10xx
    `define PLL2_CONTROL        13'bx_xxxx_xxxx_110x
    `define PLL2_XFER           13'bx_xxxx_xxxx_111x

`else //USE_DEMOD_CandD

// Digital PLL subsystem registers
`define DLL0SPACE           13'b0_00xx_1010_0xxx
`define DLL1SPACE           13'b0_00xx_1010_1xxx
`define DLL2SPACE           13'b0_00xx_1011_0xxx
    `define DLL_CENTER_FREQ     13'bx_xxxx_xxxx_x0xx
    `define DLL_GAINS           13'bx_xxxx_xxxx_x10x
    `define DLL_OUTPUT_DIV      13'bx_xxxx_xxxx_x11x

// PLL subsystem registers
`define PLLSPACE            13'b0_00xx_11xx_xxxx
    `define PLL0_BITS_0to31     13'bx_xxxx_xx00_00xx
    `define PLL0_BITS_68to99    13'bx_xxxx_xx00_01xx
    `define PLL0_BITS_100to131  13'bx_xxxx_xx00_10xx
    `define PLL0_CONTROL        13'bx_xxxx_xx00_110x
    `define PLL0_XFER           13'bx_xxxx_xx00_111x
    `define PLL1_BITS_0to31     13'bx_xxxx_xx01_00xx
    `define PLL1_BITS_68to99    13'bx_xxxx_xx01_01xx
    `define PLL1_BITS_100to131  13'bx_xxxx_xx01_10xx
    `define PLL1_CONTROL        13'bx_xxxx_xx01_110x
    `define PLL1_XFER           13'bx_xxxx_xx01_111x
    `define PLL2_BITS_0to31     13'bx_xxxx_xx10_00xx
    `define PLL2_BITS_68to99    13'bx_xxxx_xx10_01xx
    `define PLL2_BITS_100to131  13'bx_xxxx_xx10_10xx
    `define PLL2_CONTROL        13'bx_xxxx_xx10_110x
    `define PLL2_XFER           13'bx_xxxx_xx10_111x

`endif //USE_DEMOD_CandD

// Bitsync subsystem registers
`define BITSYNC_TOP_SPACE   13'b0_01xx_000x_xxxx

`define VITERBISPACE        13'b0_01xx_0010_0xxx
`define VIT_INVERSE_MEAN       13'bx_xxxx_xxxx_00xx
`define VIT_BER_TEST_LENGTH    13'bx_xxxx_xxxx_01xx
`define VIT_STATUS             13'bx_xxxx_xxxx_10xx

`define CH0_BITSYNCSPACE    13'b0_01x0_010x_xxxx
`define BITSYNCSPACE        `CH0_BITSYNCSPACE
    `define BS_TOP_CONTROL          13'bx_xxxx_xxx0_00xx
        `define BS_MODE_SINGLE_CH       2'b00
        `define BS_MODE_IND_CH          2'b01
        `define BS_MODE_DUAL_CH         2'b10
        `define BS_MODE_OFFSET_CH       2'b11
    `define BS_TOP_CH0_CONTROL      13'bx_xxxx_xxx0_01xx
    `define BS_TOP_CH1_CONTROL      13'bx_xxxx_xxx0_10xx
    `define BS_DAC_ADC                  4'b0000
    `define BS_DAC_DC                   4'b0001
    `define BS_DAC_DF                   4'b0010
    `define BS_DAC_SYM                  4'b0011
    `define BS_DAC_AGC                  4'b0100
    `define BS_DAC_LOCK                 4'b0101
    `define BS_DC_REMOVAL_ENABLE       32'b1000_0000_0000_0000_0000_0000_0000_0000
    `define BS_HIGH_Z                  32'b0100_0000_0000_0000_0000_0000_0000_0000
    `define BS_SINGLE_ENDED            32'b0010_0000_0000_0000_0000_0000_0000_0000
    `define BS_TOP_STATUS           13'bx_xxxx_xxx0_11xx
    `define BS_TOP_DC_GAINS         13'bx_xxxx_xxx1_00xx
`define CH0_RESAMPSPACE     13'b0_01x0_0110_xxxx
    `define RESAMP_RATE         13'bx_xxxx_xxxx_00xx
`define CH0_DFSPACE         13'b0_01x0_0111_xxxx
    `define DF_CONTROL          13'bx_xxxx_xxxx_00xx
    `define DF_CIC_DECIMATION   13'bx_xxxx_xxxx_01xx
    `define DF_CIC_SHIFT        13'bx_xxxx_xxxx_10xx
`define CH0_DFFIRSPACE      13'b0_01x0_1000_xxxx
    `define DF_FIR_COEFF_0      13'bx_xxxx_xxxx_000x
    `define DF_FIR_COEFF_1      13'bx_xxxx_xxxx_001x
    `define DF_FIR_COEFF_2      13'bx_xxxx_xxxx_010x
    `define DF_FIR_COEFF_3      13'bx_xxxx_xxxx_011x
    `define DF_FIR_COEFF_4      13'bx_xxxx_xxxx_100x
    `define DF_FIR_COEFF_5      13'bx_xxxx_xxxx_101x
    `define DF_FIR_COEFF_6      13'bx_xxxx_xxxx_110x
    `define DF_FIR_COEFF_7      13'bx_xxxx_xxxx_111x
`define CH0_AGCSPACE        13'b0_01x0_101x_xxxx

`define CH1_BITSYNCSPACE    13'b0_01x1_010x_xxxx
`define BITSYNCAUSPACE      `CH1_BITSYNCSPACE
`define CH1_RESAMPSPACE     13'b0_01x1_0110_xxxx
`define CH1_DFSPACE         13'b0_01x1_0111_xxxx
`define CH1_DFFIRSPACE      13'b0_01x1_1000_xxxx
`define CH1_AGCSPACE        13'b0_01x1_101x_xxxx


// BERT subsystem registers
`define BERT_SPACE              13'b0_10xx_xxxx_xxxx
    `define BERT_POLY               13'bx_xxxx_x000_00xx
    `define POLARITY_THRESHOLD      13'bx_xxxx_x000_01xx
    `define SLIP_LIMIT              13'bx_xxxx_x000_10xx
    `define SLIP_THRESHOLD          13'bx_xxxx_x000_11xx
    `define SLIP_RECOVERY           13'bx_xxxx_x001_00xx
    `define SYNC_THRESHOLD          13'bx_xxxx_x001_01xx
    `define SINGLE_TEST_LENGTH      13'bx_xxxx_x001_10xx
    `define SINGLE_TEST_ERRORS      13'bx_xxxx_x001_11xx
    `define SINGLE_TEST_COUNT       13'bx_xxxx_x010_00xx
    `define CONTINUOUS_TEST_ERRORS  13'bx_xxxx_x010_01xx
    `define CONTINUOUS_TEST_COUNT   13'bx_xxxx_x010_10xx
    `define TEST_CONTROL            13'bx_xxxx_x010_11xx


// PN Generator subsystem registers
`define PNGEN_SPACE             13'b0_11xx_xxxx_xxxx
    `define PNGEN_POLY              13'bx_xxxx_xxxx_00xx
    `define PNGEN_RATE              13'bx_xxxx_xxxx_01xx
    `define PNGEN_PCM_MODE          13'bx_xxxx_xxxx_10xx
        `define PNGEN_PCM_NRZL          4'b0000
        `define PNGEN_PCM_NRZM          4'b0001
        `define PNGEN_PCM_NRZS          4'b0010
        `define PNGEN_PCM_BIPL          4'b0100
        `define PNGEN_PCM_BIPM          4'b0101
        `define PNGEN_PCM_BIPS          4'b0110
        `define PNGEN_PCM_DMM           4'b1000
        `define PNGEN_PCM_DMS           4'b1001
        `define PNGEN_PCM_MDMM          4'b1010
        `define PNGEN_PCM_MDMS          4'b1011

// Framesync subsystem registers
`define FRAMER_SPACE            13'b1_00xx_0000_xxxx
    `define FRAMER_CONTROL          13'bx_xxxx_xxxx_00xx
    `define FRAMER_SYNCWORD         13'bx_xxxx_xxxx_01xx
    `define FRAMER_SYNCWORD_MASK    13'bx_xxxx_xxxx_10xx
    `define FRAMER_STATUS           13'bx_xxxx_xxxx_11xx

// Dual MSE subsystem registers
`define DMSE_SPACE              13'b1_00xx_0001_xxxx
    `define DMSE_CH0_MEAN           13'bx_xxxx_xxxx_000x
    `define DMSE_CH0_AVG_LENGTH     13'bx_xxxx_xxxx_001x
    `define DMSE_CH0_MSE            13'bx_xxxx_xxxx_010x
    `define DMSE_CH0_MSE_OFFSET     13'bx_xxxx_xxxx_011x
    `define DMSE_CH1_MEAN           13'bx_xxxx_xxxx_100x
    `define DMSE_CH1_AVG_LENGTH     13'bx_xxxx_xxxx_101x
    `define DMSE_CH1_MSE            13'bx_xxxx_xxxx_110x
    `define DMSE_CH1_MSE_OFFSET     13'bx_xxxx_xxxx_111x

`define TURBOSPACE              13'b1_00xx_001x_xxxx
    `define TURBO_CONTROL           13'bx_xxxx_xxx0_00xx
    `define TURBO_INVERSE_MEAN      13'bx_xxxx_xxx0_01xx
    `define TURBO_OUTPUT_CLK_DIV    13'bx_xxxx_xxx0_10xx
    `define TURBO_DAC_SELECT        13'bx_xxxx_xxx0_11xx
    `define TURBO_ASM_PARMS         13'bx_xxxx_xxx1_00xx


`elsif SEMCO_DEMOD_MAP

//-------------------------------- Semco Demod --------------------------------

// Top level registers
`define SEMCO_TOP_SPACE     13'b0_00xx_000x_xxxx
    // Define the system top level memory map
    `define SYS_RESET           13'bx_xxxx_xxx0_000x
    `define SYS_VERSION         13'bx_xxxx_xxx0_001x
    `define SYS_RSVD0           13'bx_xxxx_xxx0_01xx
    `define SYS_DAC_INPUT_SEL   13'bx_xxxx_xxx0_10xx
        `define SYS_DAC_INPUT_SEL_DEMOD 3'b000
    `define SYS_REBOOT_ADDR     13'bx_xxxx_xxx0_11xx
    `define SYS_TYPE            13'bx_xxxx_xxx1_000x
    `define SYS_RSVD1           13'bx_xxxx_xxx1_001x
    `define SYS_SUBSYSTEM_CTRL  13'bx_xxxx_xxx1_01xx
    `define SYS_OUTPUT_SEL      13'bx_xxxx_xxx1_10xx
        `define SYS_OUTPUT_SEL_CH0_BS   4'b0000
        `define SYS_OUTPUT_SEL_CH0_PCM  4'b0001
        `define SYS_OUTPUT_SEL_CH1_BS   4'b0010
        `define SYS_OUTPUT_SEL_CH1_PCM  4'b0011

`define SPIGW_SPACE         13'b0_00xx_0010_xxxx
    `define SPIGW_CYCLE32       13'bx_xxxx_xxxx_00xx
    `define SPIGW_CYCLE16       13'bx_xxxx_xxxx_010x
    `define SPIGW_RSVD0         13'bx_xxxx_xxxx_011x
    `define SPIGW_CYCLE8        13'bx_xxxx_xxxx_100x
    `define SPIGW_RSVD1         13'bx_xxxx_xxxx_101x
    `define SPIGW_CONTROL       13'bx_xxxx_xxxx_11xx

`define LDPCSPACE               13'b0_00xx_010x_xxxx
    `define LDPC_CONTROL            13'bx_xxxx_xxx0_00xx
        `define LDPC_RATE_1_2           2'b01
        `define LDPC_RATE_2_3           2'b10
        `define LDPC_RATE_4_5           2'b11
        `define LDPC_CODE_LENGTH_1024   1'b0
        `define LDPC_CODE_LENGTH_4096   1'b1
        `define LDPC_DERAND_NONE        2'b00
    `define LDPC_INVERSE_MEAN       13'bx_xxxx_xxx0_01xx
    `define LDPC_OUTPUT_CLK_DIV     13'bx_xxxx_xxx0_10xx
    `define LDPC_STATUS             13'bx_xxxx_xxx0_11xx
    `define LDPC_DLL_CENTER_FREQ    13'bx_xxxx_xxx1_00xx
    `define LDPC_DLL_GAINS          13'bx_xxxx_xxx1_010x
    `define LDPC_DLL_FDBK_DIV       13'bx_xxxx_xxx1_011x

`define FMMODSPACE              13'b0_00xx_011x_xxxx
    `define FM_MOD_FREQ         12'bxxxx_xxx0_00xx
    `define FM_MOD_DEV          12'bxxxx_xxx0_01xx
    `define FM_MOD_BITRATE      12'bxxxx_xxx0_10xx
    `define FM_MOD_CIC          12'bxxxx_xxx0_11xx


`define DUAL_DECODERSPACE   13'b0_00xx_1000_xxxx
`define CH1_DECODERSPACE    13'b0_00xx_1001_xxxx
    `define DEC_CONTROL         13'bx_xxxx_xxxx_00xx
        `define DEC_DERAND_MODE_OFF     3'b000
        `define DEC_DERAND_MODE_RNRZ15  3'b001
        `define DEC_DERAND_MODE_RNRZ9   3'b010
        `define DEC_DERAND_MODE_RNRZ11  3'b011
        `define DEC_DERAND_MODE_RNRZ17  3'b100
        `define DEC_DERAND_MODE_RNRZ23  3'b101
        `define DEC_CLK_PHASE_0         2'b00
        `define DEC_CLK_PHASE_180       2'b01
        `define DEC_CLK_PHASE_90        2'b10
        `define DEC_CLK_PHASE_270       2'b11
        // These are used to define the PCM decoder modes and are
        // shared with the PN Generator which is not used in this build
        `define PNGEN_PCM_NRZL          4'b0000
        `define PNGEN_PCM_NRZM          4'b0001
        `define PNGEN_PCM_NRZS          4'b0010
        `define PNGEN_PCM_BIPL          4'b0100
        `define PNGEN_PCM_BIPM          4'b0101
        `define PNGEN_PCM_BIPS          4'b0110
        `define PNGEN_PCM_DMM           4'b1000
        `define PNGEN_PCM_DMS           4'b1001
        `define PNGEN_PCM_MDMM          4'b1010
        `define PNGEN_PCM_MDMS          4'b1011

// PLL subsystem registers
`define PLL0SPACE           13'b0_00xx_1010_xxxx
`define PLL1SPACE           13'b0_00xx_1100_xxxx
`define PLL2SPACE           13'b0_00xx_1110_xxxx
    `define PLL0_BITS_0to31     13'bx_xxxx_xxxx_00xx
    `define PLL0_BITS_68to99    13'bx_xxxx_xxxx_01xx
    `define PLL0_BITS_100to131  13'bx_xxxx_xxxx_10xx
    `define PLL0_CONTROL        13'bx_xxxx_xxxx_110x
    `define PLL0_XFER           13'bx_xxxx_xxxx_111x
    `define PLL1_BITS_0to31     13'bx_xxxx_xxxx_00xx
    `define PLL1_BITS_68to99    13'bx_xxxx_xxxx_01xx
    `define PLL1_BITS_100to131  13'bx_xxxx_xxxx_10xx
    `define PLL1_CONTROL        13'bx_xxxx_xxxx_110x
    `define PLL1_XFER           13'bx_xxxx_xxxx_111x
    `define PLL2_BITS_0to31     13'bx_xxxx_xxxx_00xx
    `define PLL2_BITS_68to99    13'bx_xxxx_xxxx_01xx
    `define PLL2_BITS_100to131  13'bx_xxxx_xxxx_10xx
    `define PLL2_CONTROL        13'bx_xxxx_xxxx_110x
    `define PLL2_XFER           13'bx_xxxx_xxxx_111x

// Clock and Data subsystem registers
`define CandD0SPACE         13'b0_00xx_1011_xxxx
`define CandD1SPACE         13'b0_00xx_1101_xxxx
`define CandD2SPACE         13'b0_00xx_1111_xxxx
    `define CandD_CONTROL           13'bx_xxxx_xxxx_00xx
        `define CandD_SRC_LEGACY_I      4'b0000
        `define CandD_SRC_LEGACY_Q      4'b0001
        `define CandD_SRC_PCMTRELLIS    4'b0010
        `define CandD_SRC_MULTIH        4'b0011
        `define CandD_SRC_STC           4'b0100
        `define CandD_SRC_PNGEN         4'b0101
        `define CandD_SRC_LDPC          4'b0110
        `define CandD_SRC_DQM           4'b0111
        `define CandD_SRC_DEC0_CH0      4'b1000
        `define CandD_SRC_DEC0_CH1      4'b1001
        `define CandD_SRC_DEC1_CH0      4'b1010
        `define CandD_SRC_DEC1_CH1      4'b1011
        `define CandD_SRC_DEC2_CH0      4'b1100
        `define CandD_SRC_DEC2_CH1      4'b1101
        `define CandD_SRC_DEC3_CH0      4'b1110
        `define CandD_SRC_DEC3_CH1      4'b1111
        `define CandD_CLK_PHASE_0       2'b00
        `define CandD_CLK_PHASE_90      2'b01
        `define CandD_CLK_PHASE_180     2'b10
        `define CandD_CLK_PHASE_270     2'b11
    `define CandD_DLL_CENTER_FREQ   13'bx_xxxx_xxxx_01xx
    `define CandD_DLL_GAINS         13'bx_xxxx_xxxx_100x
    `define CandD_DLL_FDBK_DIV      13'bx_xxxx_xxxx_101x

// Legacy Demod subsystem registers
`define DEMODSPACE          13'b0_0100_000x_xxxx
`define DDCSPACE            13'b0_0100_0010_xxxx
`define DDCFIRSPACE         13'b0_0100_0011_xxxx
`define CICDECSPACE         13'b0_0100_0100_0xxx
`define RESAMPSPACE         13'b0_0100_0101_xxxx
`define BITSYNCSPACE        13'b0_0100_011x_xxxx
`define BITSYNCAUSPACE      13'b0_0100_100x_xxxx
`define CHAGCSPACE          13'b0_0100_101x_xxxx
`define CARRIERSPACE        13'b0_0100_110x_xxxx
`define EQUALIZERSPACE      13'b0_0100_1110_xxxx
`define TRELLIS_SPACE       13'b0_0100_1111_xxxx
`define TRELLISLFSPACE      13'b0_0101_000x_xxxx
`define MULTIH_SPACE        13'b0_0101_0010_xxxx
`define MULTIHLFSPACE       13'b0_0101_010x_xxxx
`define SDISPACE            13'b0_0101_0110_xxxx
`define UARTSPACE           13'b0_0101_0111_xxxx
`define DQMSPACE            13'b0_0101_1000_xxxx
    `define DQM_SYNC_WORD       16'hfac4
    `define DQM_MSE_CONTROL     13'bx_xxxx_xxxx_00xx
    `define DQM_LOG10MSE        13'bx_xxxx_xxxx_01xx
        `define DQM_LOG10MSE_OFFSET 13'bx_xxxx_xxxx_011x
    `define DQM_CLKS_PER_BIT    13'bx_xxxx_xxxx_100x
    `define DQM_PAYLOAD_SIZE    13'bx_xxxx_xxxx_101x
    `define DQM_SRC_SELECT      13'bx_xxxx_xxxx_11xx
        `define DQM_SRC_LEGACY_I    4'b0000
        `define DQM_SRC_LEGACY_Q    4'b0001
        `define DQM_SRC_PCMTRELLIS  4'b0010
        `define DQM_SRC_MULTIH      4'b0011
        `define DQM_SRC_STC         4'b0100
        `define DQM_SRC_PNGEN       4'b0101
        `define DQM_SRC_LDPC        4'b0110
        `define DQM_SRC_RSVD0       4'b0111
        `define DQM_SRC_DEC0_CH0    4'b1000
        `define DQM_SRC_DEC0_CH1    4'b1001
        `define DQM_SRC_DEC1_CH0    4'b1010
        `define DQM_SRC_DEC1_CH1    4'b1011
        `define DQM_SRC_DEC2_CH0    4'b1100
        `define DQM_SRC_DEC2_CH1    4'b1101
        `define DQM_SRC_DEC3_CH0    4'b1110
        `define DQM_SRC_DEC3_CH1    4'b1111
`define DQMLUTSPACE         13'b0_0110_xxxx_xxxx

// BERT subsystem registers
`define BERT_SPACE          13'b0_0111_xxxx_xxxx
    `define BERT_POLY               13'bx_xxxx_x000_00xx
    `define POLARITY_THRESHOLD      13'bx_xxxx_x000_01xx
    `define SLIP_LIMIT              13'bx_xxxx_x000_10xx
    `define SLIP_THRESHOLD          13'bx_xxxx_x000_11xx
    `define SLIP_RECOVERY           13'bx_xxxx_x001_00xx
    `define SYNC_THRESHOLD          13'bx_xxxx_x001_01xx
    `define SINGLE_TEST_LENGTH      13'bx_xxxx_x001_10xx
    `define SINGLE_TEST_ERRORS      13'bx_xxxx_x001_11xx
    `define SINGLE_TEST_COUNT       13'bx_xxxx_x010_00xx
    `define CONTINUOUS_TEST_ERRORS  13'bx_xxxx_x010_01xx
    `define CONTINUOUS_TEST_COUNT   13'bx_xxxx_x010_10xx
    `define TEST_CONTROL            13'bx_xxxx_x010_11xx
    `define SOURCE_SELECT           13'bx_xxxx_x011_000x
        `define BERT_SRC_LEGACY_I    4'b0000
        `define BERT_SRC_LEGACY_Q    4'b0001
        `define BERT_SRC_PCMTRELLIS  4'b0010
        `define BERT_SRC_VIT0        4'b0011
        `define BERT_SRC_STC         4'b0100
        `define BERT_SRC_VIT1        4'b0101
        `define BERT_SRC_LDPC        4'b0110
        `define BERT_SRC_RSVD0       4'b0111
        `define BERT_SRC_DEC0_CH0    4'b1000
        `define BERT_SRC_DEC0_CH1    4'b1001
        `define BERT_SRC_DEC1_CH0    4'b1010
        `define BERT_SRC_DEC1_CH1    4'b1011
        `define BERT_SRC_DEC2_CH0    4'b1100
        `define BERT_SRC_DEC2_CH1    4'b1101
        `define BERT_SRC_DEC3_CH0    4'b1110
        `define BERT_SRC_DEC3_CH1    4'b1111


// Video Interpolators and FIRs
`define INTERP0SPACE        13'b0_1000_0000_xxxx
`define VIDFIR0SPACE        13'b0_1000_0001_xxxx
`define INTERP1SPACE        13'b0_1000_0010_xxxx
`define VIDFIR1SPACE        13'b0_1000_0011_xxxx
`define INTERP2SPACE        13'b0_1000_0100_xxxx
`define VIDFIR2SPACE        13'b0_1000_0101_xxxx

// Video Switch Control registers
`define VIDSWITCHSPACE      13'b0_1000_1000_xxxx
    `define VIDSWITCH_CONTROL   13'bx_xxxx_xxxx_00xx

// Spectral Sweep Card
`define SSCSPACE            13'b0_1000_1001_xxxx


`else  // Old demod builds
//------------------------------ Old Demod ------------------------------------

// Split the memory space for the different functions
`define DEMODSPACE          13'bx_0000_0xxx_xxxx
`ifdef FM_FILTER
`define VIDFIRSPACE         13'b0_0000_1xxx_xxxx
`endif
`define DESPREADSPACE       13'b0_0001_xxxx_xxxx
`define EQUALIZERSPACE      13'b0_0001_xxxx_xxxx    // same as DESPREADSPACE
`define DDCSPACE            13'bx_0010_00xx_xxxx
`define DDCFIRSPACE         13'bx_0010_01xx_xxxx
`define CICDECSPACE         13'bx_0010_10xx_xxxx
`define BEPSPACE            13'b0_0011_0xxx_xxxx
`define BEPRAMSPACE         13'b0_0011_1xxx_xxxx
`define BITSYNCSPACE        13'bx_0100_0xxx_xxxx
`define BITSYNCAUSPACE      13'bx_0100_1xxx_xxxx
`define DECODERSPACE        13'b0_0101_0xxx_xxxx
`define SC0_DECODERSPACE    13'b0_0101_1xxx_xxxx
`define SC1_DECODERSPACE    13'b1_0101_1xxx_xxxx
`define PLLSPACE            13'b0_0110_xxxx_xxxx
`define VITERBISPACE        13'b1_0110_xxxx_xxxx
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
`define MULTIHLFSPACE       13'b0_1110_0xxx_xxxx   // saame as TRELLIS space
`define MULTIH_SPACE        13'b0_1110_1xxx_xxxx
`define DAC_SPACE           13'b0_1111_0xxx_xxxx
`define UARTSPACE           13'b0_1111_1xxx_xxxx
`define SCDDCSPACE          13'b1_0010_00xx_xxxx
`define SCDDCFIRSPACE       13'b1_0010_01xx_xxxx
`define SCCICDECSPACE       13'b1_0010_10xx_xxxx
`define SCAGCSPACE          13'b1_0111_xxxx_xxxx
`define SCCARRIERSPACE      13'b1_1001_xxxx_xxxx


// define the viterbi decoder registers
`define VIT_INVERSE_MEAN            13'bx_xxxx_xxxx_00xx
`define VIT_STATUS                  13'bx_xxxx_xxxx_01xx

// define the data quality metric registers
`define DQM_SPACE                   `BEPSPACE
`define DQM_BLOCK_SIZE              13'bx_xxxx_xxx0_000x
`define DQM_FRAME_WORD_0            13'bx_xxxx_xxx0_001x
`define DQM_FRAME_WORD_1            13'bx_xxxx_xxx0_010x
`define DQM_FRAME_WORD_2            13'bx_xxxx_xxx0_011x
`define BEP_BLOCK_SIZE              13'bx_xxxx_xxx1_000x
`define BEP_ESTIMATE                13'bx_xxxx_xxx1_01xx
`define BEP_MEAN_INVERSE            13'bx_xxxx_xxx1_10xx

`endif  // Different demod builds address space definitions



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
`define DAC_LDPC_CORR       4'b1100
`define DAC_LDPC_SPRT       4'b1101
`define DAC_LDPC_CTRL       4'b1110
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
`define DEMOD_EQ_STEP_SIZE  13'bx_xxxx_xxx1_10xx
`define DEMOD_EQ_REF_LEVEL  13'bx_xxxx_xxx1_11xx

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
// Define the Equalizer memory map
`define EQ_CONTROL          13'bx_xxxx_xxxx_00xx
`define EQ_STEP_SIZE        13'bx_xxxx_xxxx_01xx
`define EQ_CMA_REFERENCE    13'bx_xxxx_xxxx_10xx

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
`define INTERP_CONTROL          13'bx_xxxx_xxxx_000x
    `define INTERP_SOURCE_BITS      4
    `define INTERP_SOURCE_OFFSET    8
        `define DAC_SRC_DEMOD           0
        `define DAC_SRC_IFPATH          1
        `define DAC_SRC_SCDEMOD0        2
        `define DAC_SRC_SCDEMOD1        3
        `define DAC_SRC_FMTRELLIS       4
        `define DAC_SRC_SOQTRELLIS      5
        `define DAC_SRC_MULTIHTRELLIS   6
        `define DAC_SRC_LDPC            7
`define INTERP_GAIN_MANTISSA    13'bx_xxxx_xxxx_001x
`define INTERP_CIC_EXPONENT     13'bx_xxxx_xxxx_010x
`define INTERP_GAIN_EXPONENT    13'bx_xxxx_xxxx_011x
`define INTERP_CIC_MANTISSA     13'bx_xxxx_xxxx_10xx
`define INTERP_TEST             13'bx_xxxx_xxxx_11xx

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
`define DEC_MUX_SEL_DEMOD   2'b00
`define DEC_MUX_SEL_SC0     2'b01
`define DEC_MUX_SEL_VITERBI 2'b10
`define OUT_MUX_SEL_DEMOD   2'b00
`define OUT_MUX_SEL_SC0     2'b01
`define OUT_MUX_SEL_SC1     2'b10
`define OUT_MUX_SEL_DQM     2'b11
`define REBOOT_ADDR     13'bx_xxxx_xxx0_11xx
`define MISC_TYPE       13'bx_xxxx_xxx1_000x

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

// Define the Spectral Sweep registers
`define SSC_BAUD_DIV   13'bx_xxxx_xxxx_00xx
`define SSC_CONTROL    13'bx_xxxx_xxxx_01xx
`define SSC_FRAME_WAIT 13'bx_xxxx_xxxx_10xx
`define SSC_CH         13'bx_xxxx_xxxx_11xx

`endif //ADDRESS_MAP

