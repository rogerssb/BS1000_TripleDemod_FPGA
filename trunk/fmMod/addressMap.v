`ifndef ADDRESS_MAP
`define ADDRESS_MAP

// Split the memory space for the different functions
`define RADIOSPACE      12'b0000_xxxx_xxxx
`define FMMODSPACE      12'b0001_xxxx_xxxx
`define DDCSPACE        12'b0010_xxxx_xxxx
`define CICRESAMPSPACE  12'b0011_xxxx_xxxx
`define BITSYNCSPACE    12'b0100_xxxx_xxxx
`define INPUTAGCSPACE   12'b0101_xxxx_xxxx
`define TXRAMPSPACE     12'b0110_xxxx_xxxx
`define CHAGCSPACE      12'b0111_xxxx_xxxx

// Define the global radio memory map
`define RADIO_CONTROL   12'hxx0
`define MODE_2FSK       2'b00
`define MODE_SHAPED2FSK 2'b01
`define MODE_4FSK       2'b10
`define MODE_SHAPED4FSK 2'b11
`define UNIQUE_WORD     12'hxx4

// Define the FM memory map
`define FM_MOD_FREQ     12'hxx0
`define FM_MOD_DEV      12'hxx4
`define FM_MOD_BITRATE  12'hxx8
`define FM_MOD_CIC      12'hxxc

// Define the DDC memory map
`define DDC_CENTER_FREQ 12'hxx0

// Define the CIC Resampler memory map
`define CIC_SHIFT       12'hxx0

// Define the Loop Filter memory map
`define LF_CONTROL      12'bxxxx_xxx0_0000
`define LF_LEAD_LAG     12'bxxxx_xxx0_0100
`define LF_LIMIT        12'bxxxx_xxx0_1000
`define LF_LOOPOFFSET   12'bxxxx_xxx0_1100
`define LF_FSKTHRESHOLD 12'bxxxx_xxx1_0000

// Define the AGC Loop Filter memory map
`define ALF_CONTROL     12'bxxxx_xxx0_0000
`define ALF_SETPOINT    12'bxxxx_xxx0_0100
`define ALF_GAINS       12'bxxxx_xxx0_1000
`define ALF_ULIMIT      12'bxxxx_xxx0_1100
`define ALF_LLIMIT      12'bxxxx_xxx1_0000

// Define the Ramp memory map
`define RAMP_GAIN       12'hxx0
`define RAMP_CONTROL    12'hxx4


`endif




