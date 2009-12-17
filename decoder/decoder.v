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

module decoder
  (
  rs,
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
  cout,
  fifo_rs,
  clk_inv
  );

input rs,en,wr0,wr1;
input clk,symb_clk_en,symb_clk_2x_en;
input [11:0]addr;
input [15:0]din;
output [15:0]dout;
input [2:0]symb_i,symb_q;
output dout_i,dout_q,cout;
output fifo_rs;
output clk_inv;

//------------------------------------------------------------------------------
//                          Biphase to NRZ Conversion
//------------------------------------------------------------------------------

reg [2:0]last_symb_i;
always @(posedge clk)begin
  if(symb_clk_en)
    last_symb_i <= symb_i;
end

wire biphase,biphase_en;
wire [2:0] nrz_i;
biphase_to_nrz biphase_to_nrz
  (
  .rs(rs),
  .clk(clk),
  .symb_clk_en(symb_clk_en),
  .biphase_en(biphase_en),
  .biphase(biphase),
  .symb_i(symb_i),
  .last_symb_i(last_symb_i),
  .nrz_i(nrz_i)
  );

reg [2:0] nrz_q, nrz_delay_i, nrz_delay_q;
always @(posedge clk or posedge rs)begin
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
  .clk(clk),
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
  .clk(clk),
  .clk_en(symb_clk_en),
  .biphase_en(biphase_en),
  .mode(mode),
  .dout(dec_q)
  );

//------------------------------------------------------------------------------
//                          QPSK / OQPSK Demultiplexing
//------------------------------------------------------------------------------

reg mux_ctrl;
always @(posedge clk)begin
    if(symb_clk_2x_en)begin
        if (symb_clk_en) begin
            mux_ctrl <= 1;
            end
        else begin
            mux_ctrl <= 0;
            end
        end
    end

reg [2:0] demux_i, demux_q;
wire swap;

always @(posedge clk)begin
  if(symb_clk_2x_en)begin
    if(swap ^ mux_ctrl) //symb_clk_en)
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
always @(posedge clk) begin
    if(symb_clk_2x_en)begin
      dec_delay_i <= dec_i;
      dec_delay_q <= dec_q;
      feher_demux_i <= (swap ^ mux_ctrl /*symb_clk_en*/ ) ? (dec_delay_i ^ dec_q) :
                                              (dec_delay_i ^ ~dec_q);
      feher_demux_q <= dec_delay_q;
      end
  end

//------------------------------------------------------------------------------
//                             Output Selection
//------------------------------------------------------------------------------

reg [2:0] out_sel_i, out_sel_q;
wire feher, demux;

always @(posedge clk) begin
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
wire rand_nrz_shft_en = demux ? symb_clk_2x_en : symb_clk_en;  //was div_n==0;
reg  rand_nrz_dec_out;

always @(posedge clk or posedge rs) begin
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

wire sign_mag;
wire [2:0]formatted_out_i;
format_output format_output_i
  (
  .din(sign_mag_i),
  .clk(clk),
  .clk_en(symb_clk_2x_en),
  .mode(sign_mag),
  .rs(rs),
  .dout(formatted_out_i)
  );

wire [2:0]formatted_out_q;
format_output format_output_q
  (
  .din(sign_mag_q),
  .clk(clk),
  .clk_en(symb_clk_2x_en),
  .mode(sign_mag),
  .rs(rs),
  .dout(formatted_out_q)
  );

wire clk_sel;
assign cout = biphase ? biphase_en : (
              clk_sel ? symb_clk_en : symb_clk_2x_en);

assign dout_i = formatted_out_i[2];
assign dout_q = formatted_out_q[2];

//------------------------------------------------------------------------------
//                                 Registers
//------------------------------------------------------------------------------

wire [15:0]regs_q;
decoder_regs decoder_regs
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
        clk_inv,
        fifo_rs} = regs_q[11:0];


/*
//------------------------------------------------------------------------------
//                                Peak detection
//------------------------------------------------------------------------------

reg decayDelayed,decayPulse;
always @(posedge clk) begin
    decayDelayed <= decay;
    decayPulse <= decay & ! decayDelayed;
end
PeakDetect PeakI(rs, clk, decayPulse, I_Video, posPeakI, negPeakI);
PeakDetect PeakQ(rs, clk, decayPulse, Q_Video, posPeakQ, negPeakQ);

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
always @(posedge clk) begin
    adcI <= I_ADC;
    if (adcI[5]) begin
        absI = adcI[4:0];
    end
    else begin
        absI = ~adcI[4:0];
    end
end
sigQual sigQual(clk,rs,absI,sigQualData);

`endif
*/

endmodule

/*
module decoder_test;

reg rs,en,wr0,wr1;
reg clk,symb_clk_en,symb_clk_2x_en;
reg [11:0]addr;
reg [15:0]din;
wire [15:0]dout;
reg [2:0]symb_i,symb_q;
wire dout_i,dout_q,cout;
wire fifo_rs;
wire clk_inv;

decoder uut
  (
  rs,
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
  cout,
  fifo_rs,
  clk_inv
  );

initial begin
  rs = 0;
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

  #100 rs = !rs;
  #100 rs = !rs;
end

always #5 clk = !clk;

//set symb_clk_en rate at 4 MHz

reg [4:0]symb_divider;
always @(posedge clk or posedge rs)begin
  if(rs)begin
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
*/
