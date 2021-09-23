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

module decoder (
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
    input                   symb_clk_en,
    input                   symb_clk_2x_en,
    input                   symb_i,
    input                   symb_q,
    output                  dout_i,
    output                  dout_q,
    output reg              outputClkEn,
    output                  fifo_reset,
    output          [1:0]   clkPhase,
    output                  symb_clk,
    output          [2:0]   inputSelect
);

    wire            [1:0]   mode;
    wire            [2:0]   derandMode;
    wire            [3:0]   pcmEncoderMode;
    decoderRegs decoderRegs(
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(en),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .fifoReset(fifo_reset),
        .clkPhase(clkPhase),
        .clkSelect(clk_sel),
        .dataInvert(data_inv),
        .derandomize(derandMode),
        .demuxEnable(demux),
        .feherEnable(feher),
        .iqSwap(swap),
        .biphaseEnable(biphase),
        .millerEnable(miller),
        .mode(mode),
        .inputSelect(inputSelect),
        .pcmEncoderMode(pcmEncoderMode)
    );

//------------------------------------------------------------------------------
//                          Biphase to NRZ Conversion
//------------------------------------------------------------------------------

// All I data passes through the biphase to nrz module whether biphase encoding
// is enabled or not. This module introduces one symb_clk_en delay into the I
// path.

wire            biphase_en ;
wire            nrz_i ;

biphase_to_nrz biphase_to_nrz
  (
  .rs           (reset),
  .clk          (clk),
  .symb_clk_en  (symb_clk_en),
  .biphase_en   (biphase_en),
  .biphase      (biphase),
  .symb_i       (symb_i),
  .nrz_i        (nrz_i)
  ) ;
wire            biphaseClkEn = (biphase_en & symb_clk_en);

// nrz_i is delayed one biphase_en with respect to symb_q because of its path
// through biphase_to_nrz. Here, the I/Q paths are resynchronized by injecting
// one biphase_en delay into the q path. biphase_en is an output from module
// biphase_to_nrz. A delayed copy of each is also created for input to the
// mark/space decoder module.

reg             nrz_q, nrz_delay_i, nrz_delay_q ;

always @ ( posedge clk or posedge reset )
    begin
    if ( reset )
        begin
        nrz_delay_i <= 0;
        nrz_delay_q <= 0;
        nrz_q <= 0;
        end
    else if ( symb_clk_en )
        begin
        if ( biphase_en )
            begin
            nrz_q <= symb_q;
            nrz_delay_i <= nrz_i;
            nrz_delay_q <= nrz_q;
            end
        end
    end

//------------------------------------------------------------------------------
//                          Mark Space Inversion Decode
//------------------------------------------------------------------------------

wire            dec_i;
mrk_spc_decode mrk_spc_decode_i
  (
  .rs           (reset),
  .din          (nrz_i),
  .last_din     (nrz_delay_i),
  .clk          (clk),
  .clk_en       (symb_clk_en),
  .biphaseMode  (biphase),
  .biphase_en   (biphase_en),
  .mode         (mode),
  .dout         (dec_i)
  );

wire            dec_q;
mrk_spc_decode mrk_spc_decode_q
  (
  .rs           (reset),
  .din          (nrz_q),
  .last_din     (nrz_delay_q),
  .clk          (clk),
  .clk_en       (symb_clk_en),
  .biphaseMode  (biphase),
  .biphase_en   (biphase_en),
  .mode         (mode),
  .dout         (dec_q)
  );

//------------------------------------------------------------------------------
//                             Miller Decoding
//------------------------------------------------------------------------------
    millerDecoder md(
        .clk(clk),
        .reset(reset),
        .clkEn(1'b1),
        .pcmEn(symb_clk_en),
        .pcmMode({miller,1'b0,mode}),
        .pcmBit(symb_i),
        .nrzEn(millerBitEn),
        .nrzBit(millerBit)
    );



//------------------------------------------------------------------------------
//                          QPSK / OQPSK Demultiplexing
//------------------------------------------------------------------------------

reg             mux_ctrl ;
always @ ( posedge clk )
    begin
    if ( symb_clk_2x_en )
        begin
        if ( symb_clk_en )
            begin
            mux_ctrl <= 1 ;
            end
        else
            begin
            mux_ctrl <= 0 ;
            end
        end
    end

reg             demux_out;
always @ ( posedge clk )
    begin
    if ( symb_clk_2x_en )
        begin
        if ( swap ^ mux_ctrl )
            begin
            demux_out <= dec_i ;
            end
        else
            begin
            demux_out <= dec_q ;
            end
        end
    end

//------------------------------------------------------------------------------
//                             FQPSK Demultiplexing
//------------------------------------------------------------------------------

reg             dec_delay_i, dec_delay_q ;
reg             feher_demux_out;
always @ ( posedge clk )
    begin
    if ( symb_clk_2x_en )
        begin
        dec_delay_i <= dec_i ;
        dec_delay_q <= dec_q ;
        feher_demux_out <= ( swap ^ mux_ctrl ) ? ( dec_delay_i ^ dec_q ) :
                                               ( dec_delay_i ^ !dec_q ) ;
        end
    end

//------------------------------------------------------------------------------
//                             Output Selection
//------------------------------------------------------------------------------

reg             out_sel_i, out_sel_q ;
always @ ( posedge clk )
    begin
    if ( symb_clk_2x_en )
        begin
        if ( feher )
            begin
            out_sel_i <= !feher_demux_out ;
            out_sel_q <= feher_demux_out ;
            end
        else if ( demux )
            begin
            out_sel_i <= !demux_out ;
            out_sel_q <= demux_out ;
            end
        else if (swap)
            begin
            out_sel_i <= dec_q ;
            out_sel_q <= dec_i ;
            end
        else if (miller)
            begin
            out_sel_i <= millerBit ;
            out_sel_q <= millerBit ;
            end
        else if (symb_clk_en)
            begin
            out_sel_i <= dec_i ;
            out_sel_q <= dec_q ;
            end
        end
    end

//------------------------------------------------------------------------------
//                        Randomized NRZ-L Decoder
//------------------------------------------------------------------------------

    reg     [22:0]  rand_nrz_shft ;
    reg             rand_nrz_shft_en;
    always @* begin
        if (miller) begin
            rand_nrz_shft_en = (millerBitEn & symb_clk_en);
        end
        else if (biphase) begin
            rand_nrz_shft_en = (biphase_en & symb_clk_en);
        end
        else if (demux) begin
            rand_nrz_shft_en = symb_clk_2x_en;
        end
        else if (feher) begin
            rand_nrz_shft_en = symb_clk_2x_en;
        end
        else begin
            rand_nrz_shft_en = symb_clk_en;
        end
    end

    reg             rand_nrz_dec_out ;

    always @ ( posedge clk or posedge reset ) begin
        if ( reset ) begin
            rand_nrz_shft <= 23'h0 ;
            rand_nrz_dec_out <= 1'b0 ;
        end
        else if ( rand_nrz_shft_en ) begin
            rand_nrz_shft <= {rand_nrz_shft[21:0], out_sel_i} ;
            case (derandMode)
                `DEC_DERAND_MODE_RNRZ15:
                    rand_nrz_dec_out <= out_sel_i ^ (rand_nrz_shft[14]^rand_nrz_shft[13]) ;
                `DEC_DERAND_MODE_RNRZ9:
                    rand_nrz_dec_out <= out_sel_i ^ (rand_nrz_shft[8]^rand_nrz_shft[4]) ;
                `DEC_DERAND_MODE_RNRZ11:
                    rand_nrz_dec_out <= out_sel_i ^ (rand_nrz_shft[10]^rand_nrz_shft[8]) ;
                `DEC_DERAND_MODE_RNRZ17:
                    rand_nrz_dec_out <= out_sel_i ^ (rand_nrz_shft[16]^rand_nrz_shft[13]) ;
                `DEC_DERAND_MODE_RNRZ23:
                    rand_nrz_dec_out <= out_sel_i ^ (rand_nrz_shft[22]^rand_nrz_shft[17]) ;
                default:
                    rand_nrz_dec_out <= out_sel_i ^ (rand_nrz_shft[14]^rand_nrz_shft[13]) ;
            endcase
        end
    end

    wire    derandomize = (derandMode != `DEC_DERAND_MODE_OFF);
    wire    derand_out_i = derandomize ? rand_nrz_dec_out : out_sel_i ;
    wire    derand_out_q = derandomize ? rand_nrz_dec_out : out_sel_q ;

//------------------------------------------------------------------------------
//                                  Inversions
//------------------------------------------------------------------------------

    wire    data_inv_i = data_inv ? !derand_out_i : derand_out_i ;
    wire    data_inv_q = data_inv ? !derand_out_q : derand_out_q ;

//------------------------------------------------------------------------------
//                               Output Formatting
//------------------------------------------------------------------------------



    reg     pcmSymClkEn;
    reg     pcmSym2xClkEn;
    always @* begin
        if (miller) begin
            pcmSymClkEn = (millerBitEn & symb_clk_en);
            case (pcmEncoderMode)
                `PNGEN_PCM_NRZL,
                `PNGEN_PCM_NRZM,
                `PNGEN_PCM_NRZS: begin
                    pcmSym2xClkEn = (millerBitEn & symb_clk_en);
                    outputClkEn = (millerBitEn & symb_clk_en);
                end
                default: begin
                    pcmSym2xClkEn = symb_clk_en;
                    outputClkEn = symb_clk_en;
                end
            endcase
        end
        else if (biphase) begin
            pcmSymClkEn = (biphase_en & symb_clk_en);
            case (pcmEncoderMode)
                `PNGEN_PCM_NRZL,
                `PNGEN_PCM_NRZM,
                `PNGEN_PCM_NRZS: begin
                    pcmSym2xClkEn = (biphase_en & symb_clk_en);
                    outputClkEn = (biphase_en & symb_clk_en);
                end
                default: begin
                    pcmSym2xClkEn = symb_clk_en;
                    outputClkEn = symb_clk_en;
                end
            endcase
        end
        else if (clk_sel) begin
            pcmSymClkEn = symb_clk_en;
            case (pcmEncoderMode)
                `PNGEN_PCM_NRZL,
                `PNGEN_PCM_NRZM,
                `PNGEN_PCM_NRZS: begin
                    pcmSym2xClkEn = symb_clk_en;
                    outputClkEn = symb_clk_en;
                end
                default: begin
                    pcmSym2xClkEn = symb_clk_2x_en;
                    outputClkEn = symb_clk_2x_en;
                end
            endcase
        end
        else begin
            outputClkEn = symb_clk_2x_en;
            pcmSymClkEn = symb_clk_2x_en;
            pcmSym2xClkEn = symb_clk_2x_en;
        end
    end

    reg         symbol_clk;
    always @(posedge clk) begin
        if (miller) begin
            if (millerBitEn & symb_clk_en) begin
                symbol_clk <= 1;
            end
            else if (symb_clk_en) begin
                symbol_clk <= ~symbol_clk;
            end
        end
        else if (biphase) begin
            if (biphase_en & symb_clk_en) begin
                symbol_clk <= 1;
            end
            else if (symb_clk_en) begin
                symbol_clk <= ~symbol_clk;
            end
        end
        else begin
            if (symb_clk_en) begin
                symbol_clk <= 1;
            end
            else if (symb_clk_2x_en) begin
                symbol_clk <= ~symbol_clk;
            end
        end
    end
    assign symb_clk = clk_sel ? symbol_clk : symb_clk_2x_en;

    `ifdef BITSYNC_BERT
    pcmEncoder pcmEncI(
        .clk(clk),
        .reset(reset),
        .clkEn(1'b1),
        .sym2xClkEn(pcmSym2xClkEn),
        .symClkEn(pcmSymClkEn),
        .pcmMode(pcmEncoderMode),
        .pcmInvert(1'b0),
        .nrzBit(data_inv_i),
        .pcmBit(pcm_i)
    );
    pcmEncoder pcmEncQ(
        .clk(clk),
        .reset(reset),
        .clkEn(1'b1),
        .sym2xClkEn(pcmSym2xClkEn),
        .symClkEn(pcmSymClkEn),
        .pcmMode(pcmEncoderMode),
        .pcmInvert(1'b0),
        .nrzBit(data_inv_q),
        .pcmBit(pcm_q)
    );


    assign dout_i = pcm_i ;
    assign dout_q = pcm_q ;

    `else //BITSYNC_BERT

    assign dout_i = data_inv_i ;
    assign dout_q = data_inv_q ;

    `endif //BITSYNC_BERT

//------------------------------------------------------------------------------
//                                 Registers
//------------------------------------------------------------------------------

endmodule

`ifdef TEST_MODULE

module decoder_test;

reg reset,en,wr0,wr1;
reg clk,symb_clk_en,symb_clk_2x_en;
reg [12:0]addr;
reg [15:0]din;
wire [15:0]dout;
reg [2:0]symb_i,symb_q;
wire dout_i,dout_q,outputClkEn;
wire fifo_reset;
wire clk_inv;

decoder uut
  (
  reset,
  en,
  wr0,wr1,
  addr,
  din,
  dout,
  clk,
  symb_clk_en,
  symb_clk_2x_en,
  symb_i,
  symb_q,
  dout_i,
  dout_q,
  outputClkEn,
  fifo_reset,
  clk_inv
  );

initial begin
  reset = 0;
  en = 0;
  wr0 = 0;
  wr1 = 0;
  clk = 0;
  symb_clk_en = 0;
  symb_clk_2x_en = 0;
  addr = 0;
  din = 0;
  symb_i = 0;
  symb_q = 0;

  uut.decoder_regs.q = 16'h0004;

  #100 reset = !reset;
  #100 reset = !reset;
end

always #5 clk = !clk;

//set symb_clk_en rate at 4 MHz

reg [4:0]symb_divider;
always @(posedge clk or posedge reset)begin
  if(reset)begin
    symb_divider <= 0;
    symb_clk_en <= 0;
    end
  else if(symb_divider==24)begin
    symb_divider <= 0;
    symb_clk_en <= 1;
    end
  else begin
    symb_divider <= symb_divider +1;
    symb_clk_en <= 0;
    end
end

endmodule

`endif
