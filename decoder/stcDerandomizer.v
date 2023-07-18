//------------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Decoder
// Created      February 19, 2009
//------------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//------------------------------------------------------------------------------

`timescale 1ns/100ps
`include "addressMap.v"

module stcDerandomizer (
    input                   reset,
    input                   en,
    `ifdef USE_BUS_CLOCK
    input                   busClk,
    `endif
    input                   wr0,wr1,wr2,wr3,
    input           [12:0]  addr,
    input           [31:0]  din,
    output          [31:0]  dout,
    input                   clk,
    input                   bitInputEn,
    input                   bitInput,
    output                  bitOutput
);

    wire            [2:0]   derandMode;
    decoderRegs decoderRegs(
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(en),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .fifoReset(),
        .clkPhase(),
        .clkSelect(),
        .dataInvert(),
        .derandomize(derandMode),
        .demuxEnable(),
        .feherEnable(),
        .iqSwap(),
        .biphaseEnable(),
        .millerEnable(),
        .mode(),
        .inputSelect(),
        .pcmEncoderMode()
    );

//------------------------------------------------------------------------------
//                        Randomized NRZ-L Decoder
//------------------------------------------------------------------------------

    reg     [22:0]  rand_nrz_shft ;
    reg             rand_nrz_shft_en;
    always @* begin
        rand_nrz_shft_en = bitInputEn;
    end

    reg             rand_nrz_dec_out ;

    always @ ( posedge clk or posedge reset ) begin
        if ( reset ) begin
            rand_nrz_shft <= 23'h0 ;
            rand_nrz_dec_out <= 1'b0 ;
        end
        else if ( rand_nrz_shft_en ) begin
            rand_nrz_shft <= {rand_nrz_shft[21:0], bitInput} ;
            case (derandMode)
                `DEC_DERAND_MODE_RNRZ15:
                    rand_nrz_dec_out <= bitInput ^ (rand_nrz_shft[14]^rand_nrz_shft[13]) ;
                `DEC_DERAND_MODE_RNRZ9:
                    rand_nrz_dec_out <= bitInput ^ (rand_nrz_shft[8]^rand_nrz_shft[4]) ;
                `DEC_DERAND_MODE_RNRZ11:
                    rand_nrz_dec_out <= bitInput ^ (rand_nrz_shft[10]^rand_nrz_shft[8]) ;
                `DEC_DERAND_MODE_RNRZ17:
                    rand_nrz_dec_out <= bitInput ^ (rand_nrz_shft[16]^rand_nrz_shft[13]) ;
                `DEC_DERAND_MODE_RNRZ23:
                    rand_nrz_dec_out <= bitInput ^ (rand_nrz_shft[22]^rand_nrz_shft[17]) ;
                default:
                    rand_nrz_dec_out <= bitInput ^ (rand_nrz_shft[14]^rand_nrz_shft[13]) ;
            endcase
        end
    end

    wire    derandomize = (derandMode != `DEC_DERAND_MODE_OFF);
    assign  bitOutput = derandomize ? rand_nrz_dec_out : bitInput ;


endmodule

