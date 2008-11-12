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
`define FM_MOD_FREQ     12'hxx0
`define FM_MOD_DEV      12'hxx4
`define FM_MOD_BITRATE  12'hxx8
`define FM_MOD_CIC      12'hxxc

// Define the DDC memory map
`define DDC_CENTER_FREQ 12'hxx0

// Define the CIC Decimator memory map
`define CIC_DECIMATION  12'hxx0
`define CIC_SHIFT       12'hxx4

// Define the Loop Filter memory map
`define LF_CONTROL      12'bxxxx_xxx0_0000
`define LF_LEAD_LAG     12'bxxxx_xxx0_0100
`define LF_LIMIT        12'bxxxx_xxx0_1000
`define LF_LOOPDATA     12'bxxxx_xxx0_1100

// Define the AGC Loop Filter memory map
`define ALF_CONTROL     12'bxxxx_xxx0_0000
`define ALF_SETPOINT    12'bxxxx_xxx0_0100
`define ALF_GAINS       12'bxxxx_xxx0_1000
`define ALF_ULIMIT      12'bxxxx_xxx0_1100
`define ALF_LLIMIT      12'bxxxx_xxx1_0000

// Define the DDC memory map
`define RESAMPLER_RATE  12'hxx0


`endif




