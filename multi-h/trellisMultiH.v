//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       SOQPSK Viterbi Decoder Top
// Created      24 April 09
//-----------------------------------------------------------------------------
// 1.0      (amj) initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
`include "addressMap.v"

module trellisMultiH
  (
   clk,reset,symEnIn,sym2xEnIn,
   iIn,qIn,
   wr0,wr1,wr2,wr3,
   addr,
   din,dout,
   dac0Select,dac1Select,dac2Select,
   dac0Sync,
   dac0Data,
   dac1Sync,
   dac1Data,
   dac2Sync,
   dac2Data,
   decision,
   symEnOut,
   sym2xEnOut
   );
   
   parameter MF_BITS = 10;
   parameter ROT_BITS = 8;

   input                    clk,reset,symEnIn,sym2xEnIn;
   input [17:0]             iIn,qIn;
   input                    wr0,wr1,wr2,wr3;
   input [11:0]             addr;
   input [31:0]             din;
   output [31:0]            dout;
   input [3:0]              dac0Select,dac1Select,dac2Select;
   output                   dac0Sync;
   output [17:0]            dac0Data;
   output                   dac1Sync;
   output [17:0]            dac1Data;
   output                   dac2Sync;
   output [17:0]            dac2Data;
   output [1:0]             decision;
   output                   symEnOut;
   output                   sym2xEnOut;
   
   
   wire [1:0]          decision;

//`define ALDEC_SIM
`define BYPASS_LOOP

//`define USE_SLIP
`ifdef USE_SLIP
// Symbol Slip State Machine
reg             symbolSlip;
reg             symbolSlipped;
reg     [1:0]   slipSR;
wire            slip = (slipSR[1]);
reg             slippedSymEn;
reg     [17:0]  slipI,slipQ;
reg             symEn,sym2xEn;
always @(posedge clk) begin
    // Reclock the inputs
    slipI <= iIn;
    slipQ <= qIn;
    sym2xEn <= sym2xEnIn;

    // Create a gated version of symEn.
    slipSR <= {slipSR[0],symbolSlip};
    if (symEnIn && slip) begin
        symEn <= 0;
        symbolSlipped <= 1;
        end
    else begin
        symEn <= 1;
        symbolSlipped <= 0;
        end
    end
`else
wire    [17:0]  slipI = iIn;
wire    [17:0]  slipQ = qIn;
wire            symEn = symEnIn;
wire            sym2xEn = sym2xEnIn;
`endif

// Latching the incomming I and Q samples 
reg     [17:0]  iInLatch,qInLatch;
reg     [17:0]  iDelay,qDelay;
reg             symbolDelay;
always @(posedge clk) begin
    if (reset) begin
        iInLatch <= 0;
        qInLatch <= 0;
        end
    else if (sym2xEn) begin
        if (symbolDelay) begin
            iDelay <= slipI;
            qDelay <= slipQ;
            iInLatch <= iDelay;
            qInLatch <= qDelay;
            end
        else begin
            iInLatch <= slipI;
            qInLatch <= slipQ;
            end
        end
    end

   
   //reg [7:0]           phErrShft;
`ifdef BYPASS_LOOP
   wire [17:0]         carrierLoopIOut,carrierLoopQOut;
   assign carrierLoopIOut = iInLatch;
   assign carrierLoopQOut = qInLatch;
`else
   wire [17:0]         carrierLoopIOut,carrierLoopQOut;
   wire [31:0]         trellisLoopDout;
   trellisCarrierLoop trellisCarrierLoop
     (
      .clk(clk),
      .reset(reset),
      .symEn(symEn),
      .sym2xEn(sym2xEn),
      .iIn(iInLatch),
      .qIn(qInLatch),
      .phaseError(phaseError),
      .wr0(wr0),
      .wr1(wr1),
      .wr2(wr2),
      .wr3(wr3),
      .addr(addr),
      .din(din),
      .dout(trellisLoopDout),
      .iOut(carrierLoopIOut),
      .qOut(carrierLoopQOut),
      .symEnDly(),
      .sym2xEnDly(sym2xEnLoop)
       );
`endif  
   

`ifdef SIMULATE
   real                phErrReal;
   always @(phaseError) phErrReal = $itor($signed(phaseError))/(2**9);
`endif
   

   
`ifdef SIMULATE
   real                carrierLoopIOut_REAL, carrierLoopQOut_REAL;
   always @(carrierLoopIOut) carrierLoopIOut_REAL = $itor($signed(carrierLoopIOut))/(2**17);
   always @(carrierLoopQOut) carrierLoopQOut_REAL = $itor($signed(carrierLoopQOut))/(2**17);
   real iInReal,qInReal;
   always @(iInLatch) iInReal = $itor($signed(iInLatch))/(2**17);
   always @(qInLatch) qInReal = $itor($signed(qInLatch))/(2**17);
`endif


   wire [MF_BITS-1:0]  mf_p3p3_45Real, mf_p3p1_45Real, mf_p3m1_45Real, mf_p3m3_45Real,
     mf_m3p3_45Real, mf_m3p1_45Real, mf_m3m1_45Real, mf_m3m3_45Real,
     mf_p1p3_45Real, mf_p1p1_45Real, mf_p1m1_45Real, mf_p1m3_45Real,
     mf_m1p3_45Real, mf_m1p1_45Real, mf_m1m1_45Real, mf_m1m3_45Real,
     mf_p3p3_54Real, mf_p3p1_54Real, mf_p3m1_54Real, mf_p3m3_54Real,
     mf_m3p3_54Real, mf_m3p1_54Real, mf_m3m1_54Real, mf_m3m3_54Real,
     mf_p1p3_54Real, mf_p1p1_54Real, mf_p1m1_54Real, mf_p1m3_54Real,
     mf_m1p3_54Real, mf_m1p1_54Real, mf_m1m1_54Real, mf_m1m3_54Real,
     mf_p3p3_45Imag, mf_p3p1_45Imag, mf_p3m1_45Imag, mf_p3m3_45Imag,
     mf_m3p3_45Imag, mf_m3p1_45Imag, mf_m3m1_45Imag, mf_m3m3_45Imag,
     mf_p1p3_45Imag, mf_p1p1_45Imag, mf_p1m1_45Imag, mf_p1m3_45Imag,
     mf_m1p3_45Imag, mf_m1p1_45Imag, mf_m1m1_45Imag, mf_m1m3_45Imag,
     mf_p3p3_54Imag, mf_p3p1_54Imag, mf_p3m1_54Imag, mf_p3m3_54Imag,
     mf_m3p3_54Imag, mf_m3p1_54Imag, mf_m3m1_54Imag, mf_m3m3_54Imag,
     mf_p1p3_54Imag, mf_p1p1_54Imag, mf_p1m1_54Imag, mf_p1m3_54Imag,
     mf_m1p3_54Imag, mf_m1p1_54Imag, mf_m1m1_54Imag, mf_m1m3_54Imag;

   mfiltBank uut_mfiltBank
     (
      .clk                   (clk       ),
      .reset                 (reset     ),
      .symEn                 (symEn     ),
      .sym2xEn               (sym2xEn   ),
      .i                     (carrierLoopIOut),
      .q                     (carrierLoopQOut),
      .mf_p3p3_45Real        (mf_p3p3_45Real),
      .mf_p3p1_45Real        (mf_p3p1_45Real),
      .mf_p3m1_45Real        (mf_p3m1_45Real),
      .mf_p3m3_45Real        (mf_p3m3_45Real),
      .mf_m3p3_45Real        (mf_m3p3_45Real),
      .mf_m3p1_45Real        (mf_m3p1_45Real),
      .mf_m3m1_45Real        (mf_m3m1_45Real),
      .mf_m3m3_45Real        (mf_m3m3_45Real),
      .mf_p1p3_45Real        (mf_p1p3_45Real),
      .mf_p1p1_45Real        (mf_p1p1_45Real),
      .mf_p1m1_45Real        (mf_p1m1_45Real),
      .mf_p1m3_45Real        (mf_p1m3_45Real),
      .mf_m1p3_45Real        (mf_m1p3_45Real),
      .mf_m1p1_45Real        (mf_m1p1_45Real),
      .mf_m1m1_45Real        (mf_m1m1_45Real),
      .mf_m1m3_45Real        (mf_m1m3_45Real),
      .mf_p3p3_54Real        (mf_p3p3_54Real),
      .mf_p3p1_54Real        (mf_p3p1_54Real),
      .mf_p3m1_54Real        (mf_p3m1_54Real),
      .mf_p3m3_54Real        (mf_p3m3_54Real),
      .mf_m3p3_54Real        (mf_m3p3_54Real),
      .mf_m3p1_54Real        (mf_m3p1_54Real),
      .mf_m3m1_54Real        (mf_m3m1_54Real),
      .mf_m3m3_54Real        (mf_m3m3_54Real),
      .mf_p1p3_54Real        (mf_p1p3_54Real),
      .mf_p1p1_54Real        (mf_p1p1_54Real),
      .mf_p1m1_54Real        (mf_p1m1_54Real),
      .mf_p1m3_54Real        (mf_p1m3_54Real),
      .mf_m1p3_54Real        (mf_m1p3_54Real),
      .mf_m1p1_54Real        (mf_m1p1_54Real),
      .mf_m1m1_54Real        (mf_m1m1_54Real),
      .mf_m1m3_54Real        (mf_m1m3_54Real),
      .mf_p3p3_45Imag        (mf_p3p3_45Imag),
      .mf_p3p1_45Imag        (mf_p3p1_45Imag),
      .mf_p3m1_45Imag        (mf_p3m1_45Imag),
      .mf_p3m3_45Imag        (mf_p3m3_45Imag),
      .mf_m3p3_45Imag        (mf_m3p3_45Imag),
      .mf_m3p1_45Imag        (mf_m3p1_45Imag),
      .mf_m3m1_45Imag        (mf_m3m1_45Imag),
      .mf_m3m3_45Imag        (mf_m3m3_45Imag),
      .mf_p1p3_45Imag        (mf_p1p3_45Imag),
      .mf_p1p1_45Imag        (mf_p1p1_45Imag),
      .mf_p1m1_45Imag        (mf_p1m1_45Imag),
      .mf_p1m3_45Imag        (mf_p1m3_45Imag),
      .mf_m1p3_45Imag        (mf_m1p3_45Imag),
      .mf_m1p1_45Imag        (mf_m1p1_45Imag),
      .mf_m1m1_45Imag        (mf_m1m1_45Imag),
      .mf_m1m3_45Imag        (mf_m1m3_45Imag),
      .mf_p3p3_54Imag        (mf_p3p3_54Imag),
      .mf_p3p1_54Imag        (mf_p3p1_54Imag),
      .mf_p3m1_54Imag        (mf_p3m1_54Imag),
      .mf_p3m3_54Imag        (mf_p3m3_54Imag),
      .mf_m3p3_54Imag        (mf_m3p3_54Imag),
      .mf_m3p1_54Imag        (mf_m3p1_54Imag),
      .mf_m3m1_54Imag        (mf_m3m1_54Imag),
      .mf_m3m3_54Imag        (mf_m3m3_54Imag),
      .mf_p1p3_54Imag        (mf_p1p3_54Imag),
      .mf_p1p1_54Imag        (mf_p1p1_54Imag),
      .mf_p1m1_54Imag        (mf_p1m1_54Imag),
      .mf_p1m3_54Imag        (mf_p1m3_54Imag),
      .mf_m1p3_54Imag        (mf_m1p3_54Imag),
      .mf_m1p1_54Imag        (mf_m1p1_54Imag),
      .mf_m1m1_54Imag        (mf_m1m1_54Imag),
      .mf_m1m3_54Imag        (mf_m1m3_54Imag),
      .symEnOut              (symEnRot      ), 
      .sym2xEnOut            (sym2xEnRot    )
      );   

`ifdef SIMULATE   
//`define SIM_MATCHFILTER_OUTPUTS
`ifdef SIM_MATCHFILTER_OUTPUTS
   always @(posedge clk)
     begin
        if (symEn)begin
           $display("\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f \t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f \t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f \t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f \t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f \t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f \t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f \t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f",  
                     $itor($signed(mf_p3p3_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_p3p3_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p3p1_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_p3p1_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p3m1_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_p3m1_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p3m3_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_p3m3_45Imag))/(2**(MF_BITS-2)),
                     $itor($signed(mf_p1p3_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_p1p3_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p1p1_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_p1p1_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p1m1_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_p1m1_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p1m3_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_p1m3_45Imag))/(2**(MF_BITS-2)),
                     $itor($signed(mf_m1p3_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_m1p3_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m1p1_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_m1p1_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m1m1_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_m1m1_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m1m3_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_m1m3_45Imag))/(2**(MF_BITS-2)),
                     $itor($signed(mf_m3p3_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_m3p3_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m3p1_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_m3p1_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m3m1_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_m3m1_45Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m3m3_45Real))/(2**(MF_BITS-2)), $itor($signed(mf_m3m3_45Imag))/(2**(MF_BITS-2)),
                     $itor($signed(mf_p3p3_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_p3p3_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p3p1_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_p3p1_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p3m1_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_p3m1_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p3m3_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_p3m3_54Imag))/(2**(MF_BITS-2)),
                     $itor($signed(mf_p1p3_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_p1p3_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p1p1_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_p1p1_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p1m1_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_p1m1_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_p1m3_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_p1m3_54Imag))/(2**(MF_BITS-2)),
                     $itor($signed(mf_m1p3_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_m1p3_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m1p1_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_m1p1_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m1m1_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_m1m1_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m1m3_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_m1m3_54Imag))/(2**(MF_BITS-2)),
                     $itor($signed(mf_m3p3_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_m3p3_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m3p1_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_m3p1_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m3m1_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_m3m1_54Imag))/(2**(MF_BITS-2)), $itor($signed(mf_m3m3_54Real))/(2**(MF_BITS-2)), $itor($signed(mf_m3m3_54Imag))/(2**(MF_BITS-2))
                    );
        end
     end
`endif   
`endif

/* -----\/----- EXCLUDED -----\/-----
 always @(posedge clk)
     begin
        if (symEn)begin
           $display("\t%f\t%f", iInReal, qInReal);
        end
     end
 -----/\----- EXCLUDED -----/\----- */

   
//`ifdef SIMULATE
//   real rotMfz0ImagOut_REAL, rotMfz1ImagOut_REAL, rotMfz2ImagOut_REAL, rotMfz3ImagOut_REAL, rotMfp0ImagOut_REAL, rotMfp1ImagOut_REAL, rotMfp2ImagOut_REAL, rotMfp3ImagOut_REAL, rotMfm0ImagOut_REAL, rotMfm1ImagOut_REAL, rotMfm2ImagOut_REAL, rotMfm3ImagOut_REAL;
//   always @(posedge clk)begin
//      if(symEnOut)begin
//         rotMfz0ImagOut_REAL = $itor($signed(rotMfz0ImagOut))/(2**(ROT_BITS-2)); rotMfz1ImagOut_REAL = $itor($signed(rotMfz1ImagOut))/(2**(ROT_BITS-2)); rotMfz2ImagOut_REAL = $itor($signed(rotMfz2ImagOut))/(2**(ROT_BITS-2)); rotMfz3ImagOut_REAL = $itor($signed(rotMfz3ImagOut))/(2**(ROT_BITS-2)); rotMfp0ImagOut_REAL = $itor($signed(rotMfp0ImagOut))/(2**(ROT_BITS-2)); rotMfp1ImagOut_REAL = $itor($signed(rotMfp1ImagOut))/(2**(ROT_BITS-2)); rotMfp2ImagOut_REAL = $itor($signed(rotMfp2ImagOut))/(2**(ROT_BITS-2)); rotMfp3ImagOut_REAL = $itor($signed(rotMfp3ImagOut))/(2**(ROT_BITS-2)); rotMfm0ImagOut_REAL = $itor($signed(rotMfm0ImagOut))/(2**(ROT_BITS-2)); rotMfm1ImagOut_REAL = $itor($signed(rotMfm1ImagOut))/(2**(ROT_BITS-2)); rotMfm2ImagOut_REAL = $itor($signed(rotMfm2ImagOut))/(2**(ROT_BITS-2)); rotMfm3ImagOut_REAL = $itor($signed(rotMfm3ImagOut))/(2**(ROT_BITS-2));
//      end
//   end
//`endif   

   wire    [5:0]   index;

reg     [7:0]   decayFactor;      
wire    [7:0]   phaseError;
        
viterbiMultiH /*#(MF_BITS, ROT_BITS)*/ viterbiMultiH
   (
    .clk                   (clk           ), 
    .reset                 (reset         ), 
    .symEn                 (symEnRot      ),     // Make sure that the mfilt data is aligned with the quadrary symbol interval  
    .sym2xEn               (sym2xEnRot    ),     // Make sure that the mfilt data is aligned with the quadrary symbol interval  
    `ifdef ALDEC_SIM
    .decayFactor           (8'hff         ),
    `else
    .decayFactor           (decayFactor   ),
    `endif
    .mf_p3p3_45Real        (mf_p3p3_45Real),
    .mf_p3p1_45Real        (mf_p3p1_45Real),
    .mf_p3m1_45Real        (mf_p3m1_45Real),
    .mf_p3m3_45Real        (mf_p3m3_45Real),
    .mf_m3p3_45Real        (mf_m3p3_45Real),
    .mf_m3p1_45Real        (mf_m3p1_45Real),
    .mf_m3m1_45Real        (mf_m3m1_45Real),
    .mf_m3m3_45Real        (mf_m3m3_45Real),
    .mf_p1p3_45Real        (mf_p1p3_45Real),
    .mf_p1p1_45Real        (mf_p1p1_45Real),
    .mf_p1m1_45Real        (mf_p1m1_45Real),
    .mf_p1m3_45Real        (mf_p1m3_45Real),
    .mf_m1p3_45Real        (mf_m1p3_45Real),
    .mf_m1p1_45Real        (mf_m1p1_45Real),
    .mf_m1m1_45Real        (mf_m1m1_45Real),
    .mf_m1m3_45Real        (mf_m1m3_45Real),
    .mf_p3p3_54Real        (mf_p3p3_54Real),
    .mf_p3p1_54Real        (mf_p3p1_54Real),
    .mf_p3m1_54Real        (mf_p3m1_54Real),
    .mf_p3m3_54Real        (mf_p3m3_54Real),
    .mf_m3p3_54Real        (mf_m3p3_54Real),
    .mf_m3p1_54Real        (mf_m3p1_54Real),
    .mf_m3m1_54Real        (mf_m3m1_54Real),
    .mf_m3m3_54Real        (mf_m3m3_54Real),
    .mf_p1p3_54Real        (mf_p1p3_54Real),
    .mf_p1p1_54Real        (mf_p1p1_54Real),
    .mf_p1m1_54Real        (mf_p1m1_54Real),
    .mf_p1m3_54Real        (mf_p1m3_54Real),
    .mf_m1p3_54Real        (mf_m1p3_54Real),
    .mf_m1p1_54Real        (mf_m1p1_54Real),
    .mf_m1m1_54Real        (mf_m1m1_54Real),
    .mf_m1m3_54Real        (mf_m1m3_54Real),
    .mf_p3p3_45Imag        (mf_p3p3_45Imag),
    .mf_p3p1_45Imag        (mf_p3p1_45Imag),
    .mf_p3m1_45Imag        (mf_p3m1_45Imag),
    .mf_p3m3_45Imag        (mf_p3m3_45Imag),
    .mf_m3p3_45Imag        (mf_m3p3_45Imag),
    .mf_m3p1_45Imag        (mf_m3p1_45Imag),
    .mf_m3m1_45Imag        (mf_m3m1_45Imag),
    .mf_m3m3_45Imag        (mf_m3m3_45Imag),
    .mf_p1p3_45Imag        (mf_p1p3_45Imag),
    .mf_p1p1_45Imag        (mf_p1p1_45Imag),
    .mf_p1m1_45Imag        (mf_p1m1_45Imag),
    .mf_p1m3_45Imag        (mf_p1m3_45Imag),
    .mf_m1p3_45Imag        (mf_m1p3_45Imag),
    .mf_m1p1_45Imag        (mf_m1p1_45Imag),
    .mf_m1m1_45Imag        (mf_m1m1_45Imag),
    .mf_m1m3_45Imag        (mf_m1m3_45Imag),
    .mf_p3p3_54Imag        (mf_p3p3_54Imag),
    .mf_p3p1_54Imag        (mf_p3p1_54Imag),
    .mf_p3m1_54Imag        (mf_p3m1_54Imag),
    .mf_p3m3_54Imag        (mf_p3m3_54Imag),
    .mf_m3p3_54Imag        (mf_m3p3_54Imag),
    .mf_m3p1_54Imag        (mf_m3p1_54Imag),
    .mf_m3m1_54Imag        (mf_m3m1_54Imag),
    .mf_m3m3_54Imag        (mf_m3m3_54Imag),
    .mf_p1p3_54Imag        (mf_p1p3_54Imag),
    .mf_p1p1_54Imag        (mf_p1p1_54Imag),
    .mf_p1m1_54Imag        (mf_p1m1_54Imag),
    .mf_p1m3_54Imag        (mf_p1m3_54Imag),
    .mf_m1p3_54Imag        (mf_m1p3_54Imag),
    .mf_m1p1_54Imag        (mf_m1p1_54Imag),
    .mf_m1m1_54Imag        (mf_m1m1_54Imag),
    .mf_m1m3_54Imag        (mf_m1m3_54Imag),
    .index                 (index         ),
    .decision              (decision      ),
    .normalize             (normalize     ),
    .phaseError            (phaseError    ),
    .devError              (              ),
    .symEnOut              (symEnOut      ),    
    .sym2xEnOut            (sym2xEnOut    )     
    );
    

   /* -----\/----- EXCLUDED -----\/-----
   reg [7:0]            dataBits;
  
   reg                  satPos,satNeg;
   wire                 sign = phaseError[7];

   always @(posedge clk) begin
      if (symEnOut) begin
         dataBits <= {phaseError[6:0], 1'b0};
         satPos <= !sign && (phaseError[9:6] != 5'b0000);
         satNeg <=  sign && (phaseError[9:6] != 5'b1111);
         if (satPos) begin
            phErrShft <= 8'h7f;
         end
         else if (satNeg) begin
            phErrShft <= 8'h81;
         end
         else begin
            phErrShft <= dataBits;
         end
      end   
   end
    -----/\----- EXCLUDED -----/\----- */

// This is a kludge to create a 2x clock enable from the 1x clock enable to satisfy the design
// of the pre-existing line decoder. This design assumes at least 3 clocks between each 1x clock
// enable.
//reg se0;
//assign sym2xEnOut = se0 | symEnOut;
//always @(posedge clk) begin
//    se0 <= symEnOut;
//    end

   
//************************ Trellis Register Definitions ************************

reg trellisSpace;
always @(addr) begin
    casex(addr)
        `TRELLIS_SPACE: trellisSpace <= 1;
        default:        trellisSpace <= 0;
        endcase
    end

always @(negedge wr0) begin
    if (trellisSpace) begin
        casex (addr) 
            `TRELLIS_DECAY:     decayFactor <= din[7:0];
            `TRELLIS_CONTROL:   symbolDelay <= din[1];
            default: ;
            endcase
        end
    end

`ifdef USE_SLIP
always @(negedge wr0 or posedge symbolSlipped) begin
    if (symbolSlipped) begin
        symbolSlip <= 0;
        end
    else if (trellisSpace) begin
        casex (addr) 
            `TRELLIS_CONTROL:   symbolSlip <= din[0];
            default: ;
            endcase
        end
    end
`endif

reg [31:0]dout;
always @(trellisSpace or addr
         or decayFactor
         ) begin
    if (trellisSpace) begin
        casex (addr)
            `TRELLIS_DECAY:     dout <= {24'b0,decayFactor};
            default:            dout <= 32'hx;
            endcase
        end
    else begin
        dout <= 32'hx;
        end
    end


//******************************************************************************
//                               DAC Output Mux
//******************************************************************************

reg             dac0Sync;
reg     [17:0]  dac0Data;
reg             dac1Sync;
reg     [17:0]  dac1Data;
reg             dac2Sync;
reg     [17:0]  dac2Data;
always @(posedge clk) begin
    case (dac0Select) 
        `DAC_TRELLIS_I: begin
            dac0Data <= carrierLoopIOut;
            `ifdef BYPASS_LOOP
            dac0Sync <= sym2xEn;
            `else
            dac0Sync <= sym2xEnLoop;
            `endif
            end
        `DAC_TRELLIS_Q: begin
            dac0Data <= carrierLoopQOut;
            `ifdef BYPASS_LOOP
            dac0Sync <= sym2xEn;
            `else
            dac0Sync <= sym2xEnLoop;
            `endif
            end
        `DAC_TRELLIS_PHERR: begin
            dac0Data <= {normalize,17'b0};
            dac0Sync <= symEnOut;
            end
        `DAC_TRELLIS_INDEX: begin
            dac0Data <= {1'b0,index,11'b0};
            dac0Sync <= symEnOut;
            end
        default: begin
            dac0Data <= {normalize,17'b0};
            dac0Sync <= symEnOut;
            end
        endcase

    case (dac1Select) 
        `DAC_TRELLIS_I: begin
            dac1Data <= carrierLoopIOut;
            `ifdef BYPASS_LOOP
            dac1Sync <= sym2xEn;
            `else
            dac1Sync <= sym2xEnLoop;
            `endif
            end
        `DAC_TRELLIS_Q: begin
            dac1Data <= carrierLoopQOut;
            `ifdef BYPASS_LOOP
            dac0Sync <= sym2xEn;
            `else
            dac0Sync <= sym2xEnLoop;
            `endif
            end
        `DAC_TRELLIS_PHERR: begin
            dac1Data <= {normalize,17'b0};
            dac1Sync <= symEnOut;
            end
        `DAC_TRELLIS_INDEX: begin
            dac1Data <= {1'b0,index,11'b0};
            dac1Sync <= symEnOut;
            end
        default: begin
            dac1Data <= {normalize,17'b0};
            dac1Sync <= symEnOut;
            end
        endcase

    case (dac2Select) 
        `DAC_TRELLIS_I: begin
            dac2Data <= carrierLoopIOut;
            `ifdef BYPASS_LOOP
            dac2Sync <= sym2xEn;
            `else
            dac2Sync <= sym2xEnLoop;
            `endif
            end
        `DAC_TRELLIS_Q: begin
            dac2Data <= carrierLoopQOut;
            `ifdef BYPASS_LOOP
            dac2Sync <= sym2xEn;
            `else
            dac2Sync <= sym2xEnLoop;
            `endif
            end
        `DAC_TRELLIS_PHERR: begin
            dac2Data <= {normalize,17'b0};
            dac2Sync <= symEnOut;
            end
        `DAC_TRELLIS_INDEX: begin
            dac2Data <= {1'b0,index,11'b0};
            dac2Sync <= symEnOut;
            end
        default: begin
            dac2Data <= {normalize,17'b0};
            dac2Sync <= symEnOut;
            end
        endcase

    end

endmodule


