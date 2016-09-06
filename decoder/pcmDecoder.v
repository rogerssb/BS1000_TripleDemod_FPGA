`timescale 1ns/100ps
`include "addressMap.v"

module pcmDecoder
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
  symb,
  data_out,
  clkEn_out,
  fifo_rs,
  clk_inv,
  bypass_fifo,
  symb_clk
  );

input rs,en,wr0,wr1;
input clk,symb_clk_en,symb_clk_2x_en;
input [11:0]addr;
input [15:0]din;
output [15:0]dout;
input  symb;
output data_out,clkEn_out;
output fifo_rs;
output clk_inv;
output symb_clk;
output bypass_fifo;

//------------------------------------------------------------------------------
//                          Biphase to NRZ Conversion
//------------------------------------------------------------------------------

// All data passes through the biphase to nrz module whether biphase encoding
// is enabled or not. This module introduces one symb_clk_en delay into the data
// path.

wire            biphase, biphase_en ;
wire            nrz ;

biphase_to_nrz biphase_to_nrz
  (
  .rs           (rs),
  .clk          (clk),
  .symb_clk_en  (symb_clk_en),
  .biphase_en   (biphase_en),
  .biphase      (biphase),
  .symb_i       (symb),
  .nrz_i        (nrz)
  ) ;
wire            biphaseClkEn = (biphase_en & symb_clk_en);

reg             nrz_delay;
always @ ( posedge clk or posedge rs )
    begin
    if ( rs )
        begin
        nrz_delay <= 0;
        end
    else if ( symb_clk_en )
        begin
        if ( biphase_en )
            begin
            nrz_delay <= nrz;
            end
        end
    end

//------------------------------------------------------------------------------
//                          Mark Space Inversion Decode
//------------------------------------------------------------------------------

wire            dec;
wire    [1:0]   mode;
mrk_spc_decode mrk_spc_decode
  (
  .rs           (rs),
  .din          (nrz),
  .last_din     (nrz_delay),
  .clk          (clk),
  .clk_en       (symb_clk_en),
  .biphaseMode  (biphase),
  .biphase_en   (biphase_en),
  .mode         (mode),
  .dout         (dec)
  );


//------------------------------------------------------------------------------
//                        Randomized NRZ-L Decoder
//------------------------------------------------------------------------------

reg     [14:0]  rand_nrz_shft ;
wire            rand_nrz_shft_en = symb_clk_en ;
reg             rand_nrz_dec_out ;

always @ ( posedge clk or posedge rs )
    begin
    if ( rs )
        begin
        rand_nrz_shft <= 15'h0 ;
        rand_nrz_dec_out <= 1'b0 ;
        end
    else if ( rand_nrz_shft_en )
        begin
        rand_nrz_shft <= {rand_nrz_shft[13:0], dec} ;
        rand_nrz_dec_out <= dec ^ (rand_nrz_shft[14]^rand_nrz_shft[13]) ;
        end
    end

wire    derandomize;
wire    derand_out = derandomize ? rand_nrz_dec_out : dec ;

//------------------------------------------------------------------------------
//                     Output Formatting and Inversions
//------------------------------------------------------------------------------

wire    data_inv;
wire    data_out = data_inv ? !derand_out : derand_out ;

wire        clk_sel;
assign      clkEn_out = biphase ? biphaseClkEn : (
                        clk_sel ? symb_clk_en : symb_clk_2x_en);

    reg         symbol_clk;
    always @(posedge clk) begin
        if (biphase) begin
            if (biphaseClkEn) begin
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

assign {
    bypass_fifo,
    mode,
    sign_mag,
    biphase,
    swap,
    feher,
    demux,
    derandomize,
    data_inv,
    clk_sel,
    clk_inv,
    fifo_rs} = regs_q[12:0];

endmodule

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


/*
module decoder_test;

reg rs,en,wr0,wr1;
reg clk,symb_clk_en,symb_clk_2x_en;
reg [11:0]addr;
reg [15:0]din;
wire [15:0]dout;
reg [2:0]symb_i,symb_q;
wire dout_i,dout_q,clk_out;
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
  clk_out,
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
