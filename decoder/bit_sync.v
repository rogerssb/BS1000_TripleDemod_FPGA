//------------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Bit Synchronizer
// Created      February 19, 2009
//------------------------------------------------------------------------------
// 1.0      Initial coding
//
//
//------------------------------------------------------------------------------

`timescale 1ns/100ps
`include "addressMap.v"

module bit_sync
  (
  rs,
  en,
  wr0,wr1,
  addr,
  din,
  dout,
  ck933,
  symb_clk_en,
  symb_clk_2x_en,
  symb_i,
  symb_q,
  dout_i,
  cout_i,
  dout_q,
  cout_q
  );

input rs,en,wr0,wr1;
input ck933,symb_clk_en,symb_clk_2x_en;
input [11:0]addr;
input [15:0]din;
output [15:0]dout;
input [2:0]symb_i,symb_q;
output dout_i,cout_i,dout_q,cout_q;

//------------------------------------------------------------------------------
//                          Biphase to NRZ Conversion
//------------------------------------------------------------------------------

reg [2:0]last_symb_i;
always @(posedge ck933)begin
  if(symb_clk_en)
    last_symb_i <= symb_i;
end

wire biphase_en;
wire [2:0] nrz_i;
biphase_to_nrz biphase_to_nrz
  (
  .rs(rs),
  .clk(ck933),
  .symb_clk_en(symb_clk_en),
  .biphase_en(biphase_en),
  .biphase(biphase),
  .symb_i(symb_i),
  .last_symb_i(last_symb_i),
  .nrz_i(nrz_i)
  );

reg [2:0] nrz_q, nrz_delay_i, nrz_delay_q;
always @(posedge ck933 or posedge rs)begin
  if(rs)begin
    nrz_delay_i <= 0;
    nrz_delay_q <= 0;
    nrz_q <= 0;
    end
  else if(symb_clk_en)begin
    if(biphase_en)begin
      nrz_q <= symb_q;
      nrz_delay_i <= nrz_i;
      nrz_delay_q <= nrz_q;
      end
    end
end

//------------------------------------------------------------------------------
//                          Mark Space Inversion Decode
//------------------------------------------------------------------------------

wire [2:0] dec_i;
wire [1:0]mode;
mrk_spc_decode mrk_spc_decode_i
  (
  .rs(rs),
  .din(nrz_i),
  .last_din(nrz_delay_i),
  .clk(ck933),
  .clk_en(symb_clk_en),
  .biphase_en(biphase_en),
  .mode(mode),
  .dout(dec_i)
  );

wire [2:0] dec_q;
mrk_spc_decode mrk_spc_decode_q
  (
  .rs(rs),
  .din(nrz_q),
  .last_din(nrz_delay_q),
  .clk(ck933),
  .clk_en(symb_clk_en),
  .biphase_en(biphase_en),
  .mode(mode),
  .dout(dec_q)
  );

//------------------------------------------------------------------------------
//                          QPSK / OQPSK Demultiplexing
//------------------------------------------------------------------------------

reg [2:0] demux_i, demux_q;
wire swap;

always @(posedge ck933)begin
  if(symb_clk_2x_en)begin
    if(swap ^ symb_clk_en)
      demux_i <= dec_i;
    else
      demux_i <= dec_q;
    demux_q <= dec_q;
    end
end

//------------------------------------------------------------------------------
//                             FQPSK Demultiplexing
//------------------------------------------------------------------------------

reg [2:0]dec_delay_i, dec_delay_q;
reg [2:0]feher_demux_i,feher_demux_q;
always @(posedge ck933) begin
    if(symb_clk_2x_en)begin
      dec_delay_i <= dec_i;
      dec_delay_q <= dec_q;
      feher_demux_i <= (swap ^ symb_clk_en) ? (dec_delay_i ^ dec_q) :
                                              (dec_delay_i ^ ~dec_q);
      feher_demux_q <= dec_delay_q;
      end
  end

//------------------------------------------------------------------------------
//                             Output Selection
//------------------------------------------------------------------------------

reg [2:0] out_sel_i, out_sel_q;
wire feher, demux;

always @(posedge ck933) begin
  if(symb_clk_2x_en)begin
    if(feher)begin
      out_sel_i <= feher_demux_i;
      out_sel_q <= feher_demux_q;
      end
    else if(demux)begin
      out_sel_i <= demux_i;
      out_sel_q <= demux_q;
      end
    else begin
      out_sel_i <= dec_i;
      out_sel_q <= dec_q;
      end
    end
end

//------------------------------------------------------------------------------
//                        Randomized NRZ-L Decoder
//------------------------------------------------------------------------------

reg [14:0]rand_nrz_shft;
wire rand_nrz_shft_en = demux ? symb_clk_2x_en : symb_clk_2x_en;  //was div_n==0;
reg  rand_nrz_dec_out;

always @(posedge ck933 or posedge rs) begin
  if(rs) begin
    rand_nrz_shft <= 15'h0 ;
    rand_nrz_dec_out <= 1'b0 ;
    end
  else if(rand_nrz_shft_en)begin
    rand_nrz_shft <= {rand_nrz_shft[13:0],out_sel_i[2]} ;
    rand_nrz_dec_out <= out_sel_i[2] ^ (rand_nrz_shft[14]^rand_nrz_shft[13]) ;
    end
  end

wire derandomize;
wire derand_out_i = derandomize ? rand_nrz_dec_out : out_sel_i[2] ;
wire derand_out_q = derandomize ? rand_nrz_dec_out : out_sel_q[2] ;

//------------------------------------------------------------------------------
//                     Output Formatting and Inversions
//------------------------------------------------------------------------------

wire data_inv;
wire [2:0] sign_mag_i = data_inv ? ~{derand_out_i,out_sel_i[1:0]} :
                                    {derand_out_i,out_sel_i[1:0]};

wire [2:0] sign_mag_q = data_inv ? ~{derand_out_q,out_sel_q[1:0]} :
                                    {derand_out_q,out_sel_q[1:0]};

wire [2:0]formatted_out_i;
format_output format_output_i
  (
  .din(sign_mag_i),
  .clk(ck933),
  .clk_en(symb_clk_2x_en),
  .mode(sign_mag),
  .rs(rs),
  .dout(formatted_out_i)
  );

wire [2:0]formatted_out_q;
format_output format_output_q
  (
  .din(sign_mag_q),
  .clk(ck933),
  .clk_en(symb_clk_2x_en),
  .mode(sign_mag),
  .rs(rs),
  .dout(formatted_out_q)
  );

wire clk_sel;
wire clock_sel_out = biphase ? biphase_en : (
                     clk_sel ? symb_clk_en : symb_clk_2x_en);

wire clk_inv;
wire clock_out = clock_sel_out ^ !clk_inv;

reg [2:0] dout_i;
reg [2:0] dout_q;

always @(negedge clock_out)begin
  dout_i <= formatted_out_i;
  dout_q <= formatted_out_q;
  end

assign cout_i = clock_out;
assign cout_q = clock_out;

//------------------------------------------------------------------------------
//                                 Registers
//------------------------------------------------------------------------------

wire [15:0]regs_q;
bit_sync_regs bit_sync_regs
  (
  .wr0(wr0),
  .wr1(wr1),
  .a(addr),
  .di(din[15:0]),
  .do(dout[15:0]),
  .en(en),
  .d(regs_q),
  .q(regs_q)
  );

assign {mode,
        sign_mag,
        biphase,
        swap,
        feher,
        demux,
        derandomize,
        data_inv,
        clk_sel,
        clk_inv} = regs_q[10:0];


/*
//------------------------------------------------------------------------------
//                                Peak detection
//------------------------------------------------------------------------------

// Create a one clock pulse from the decay pulse.
reg decayDelayed,decayPulse;
always @(posedge ck933) begin
    decayDelayed <= decay;
    decayPulse <= decay & ! decayDelayed;
end
PeakDetect PeakI(rs, ck933, decayPulse, I_Video, posPeakI, negPeakI);
PeakDetect PeakQ(rs, ck933, decayPulse, Q_Video, posPeakQ, negPeakQ);


//------------------------------------------------------------------------------
//                             Signal Quality
//------------------------------------------------------------------------------

`ifdef ARTM_SIGQUAL

// Create a signal quality metric from the iEnd/qEnd samples from the DCL

reg [6:0]iEndSample,qEndSample;
reg [6:0]iEndSat,qEndSat;
always @(posedge symb_clk) begin
    iEndSample <= iEnd;
    qEndSample <= qEnd;
end
// wire    hold = (en && ((addr == `BS_POSPEAKI) || (addr == `BS_POSPEAKI)));

wire [7:0] meanI, meanQ;

dualRail dualRail(symb_clk, rs, sig_qual_hold, /*hold,asterisk_here/ demodLock, bitSyncLock,
                tolerance, iEndSample, qEndSample, ck_45M, serialOut,
                interiorCount,exteriorCount,
                meanI,meanQ);

assign sigQualData = 8'h00; // VS

`else
// define iEnd and qEnd, bitSyncLock and serialOut as outputs just to show up in UCF file
wire    serialOut = ((|iEnd) | (|qEnd)), bitSyncLock = 1'b1;

// Create a signal quality metric from the ADC samples

reg [5:0]adcI;
reg [4:0]absI;
always @(posedge ck933) begin
    adcI <= I_ADC;
    if (adcI[5]) begin
        absI = adcI[4:0];
    end
    else begin
        absI = ~adcI[4:0];
    end
end
sigQual sigQual(ck933,rs,absI,sigQualData);

`endif
*/


endmodule
