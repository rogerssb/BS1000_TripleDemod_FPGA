`ifndef ADDRESS_MAP
`define ADDRESS_MAP

// Split the memory space for the different functions
`define DEMODSPACE      12'b0000_xxxx_xxxx
`define FMMODSPACE      12'b0001_xxxx_xxxx
`define DDCSPACE        12'b0010_xxxx_xxxx
`define CICDECSPACE     12'b0011_xxxx_xxxx
`define BITSYNCSPACE    12'b0100_xxxx_xxxx
`define CHAGCSPACE      12'b0111_xxxx_xxxx
`define RESAMPSPACE     12'b1000_xxxx_xxxx
`define CARRIERSPACE    12'b1001_xxxx_xxxx
`define INTERP0SPACE    12'b1010_xxxx_xxxx
`define INTERP1SPACE    12'b1011_xxxx_xxxx
`define INTERP2SPACE    12'b1100_xxxx_xxxx

`define MISC_SPACE      12'b1101_xxxx_xxxx
`define GPIOSPACE       12'b1110_xxxx_xxxx
`define DAC_SPACE       12'b1111_xxxx_xxxx




// Define the global radio memory map
`define DEMOD_CONTROL   12'hxx0
`define MODE_AM         3'b000
`define MODE_PM         3'b001
`define MODE_FM         3'b010
`define MODE_2FSK       3'b011
`define MODE_BPSK       3'b100
`define MODE_QPSK       3'b110
`define MODE_OQPSK      3'b111

// Define the FM memory map
`define FM_MOD_FREQ     12'bxxxx_xxxx_00xx
`define FM_MOD_DEV      12'bxxxx_xxxx_01xx
`define FM_MOD_BITRATE  12'bxxxx_xxxx_10xx
`define FM_MOD_CIC      12'bxxxx_xxxx_11xx

// Define the DDC memory map
`define DDC_CENTER_FREQ 12'bxxxx_xxxx_00xx
`define DDC_CONTROL     12'bxxxx_xxxx_01xx

// Define the CIC Decimator memory map
`define CIC_DECIMATION  12'bxxxx_xxxx_00xx
`define CIC_SHIFT       12'bxxxx_xxxx_01xx

// Define the Loop Filter memory map
`define LF_CONTROL      12'bxxxx_xxx0_00xx
`define LF_LEAD_LAG     12'bxxxx_xxx0_01xx
`define LF_LIMIT        12'bxxxx_xxx0_10xx
`define LF_LOOPDATA     12'bxxxx_xxx0_11xx

// Define the AGC Loop Filter memory map
`define ALF_CONTROL     12'bxxxx_xxx0_00xx
`define ALF_SETPOINT    12'bxxxx_xxx0_01xx
`define ALF_GAINS       12'bxxxx_xxx0_10xx
`define ALF_ULIMIT      12'bxxxx_xxx0_11xx
`define ALF_LLIMIT      12'bxxxx_xxx1_00xx
`define ALF_INTEGRATOR  12'bxxxx_xxx1_01xx

// Define the DDC memory map
`define RESAMPLER_RATE  12'hxx0

// Define the interpolator memory map
`define INTERP_EXPONENT 12'bxxxx_xxxx_00xx
`define INTERP_MANTISSA 12'bxxxx_xxxx_01xx


// Define the MISCELLANEOUS locations
`define RESET       12'hxx0
`define VERSION     12'hxx2

// Define the GPIO locations
`define LEDS        12'hxx0

// Define the DAC control locations
`define DAC_WDATA      12'hxx0
`define DAC_RDATA      12'hxx2
`define DAC_SELECT     12'hxx4
`define DAC_STATUS     12'hxx6


`endif




