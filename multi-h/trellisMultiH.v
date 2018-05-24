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
    #(parameter MF_BITS =   10,
                ROT_BITS =  8)
(
    input                           clk,reset,
    input                           symEnEvenIn,
    input                           symEnIn,
    input                           sym2xEnIn,
    input           signed  [17:0]  iIn,qIn,
    `ifdef USE_BUS_CLOCK
    input                           busClk,
    `endif
    input                           cs,
    input                           wr0,wr1,wr2,wr3,
    input                   [12:0]  addr,
    input                   [31:0]  din,
    output          reg     [31:0]  dout,
    input                   [3:0]   dac0Select,dac1Select,dac2Select,
    output          reg             dac0ClkEn,
    output  reg     signed  [17:0]  dac0Data,
    output          reg             dac1ClkEn,
    output  reg     signed  [17:0]  dac1Data,
    output          reg             dac2ClkEn,
    output  reg     signed  [17:0]  dac2Data,
    output                  [1:0]   decision,
   `ifndef EMBED_MULTIH_CARRIER_LOOP
    output  signed  [ROT_BITS-1:0]  phaseError,
    output                          phaseErrorEn,
    output                          phaseErrorValid,
    `else
    output                          multihCarrierLock,
    `endif
    output                          symEnOut,
    output                          sym2xEnOut
);

    //parameter MF_BITS = 10;
    //parameter ROT_BITS = 8;

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
            symEn <= symEnIn;
            symbolSlipped <= 0;
        end
    end
    `else
    reg     [17:0]  slipI,slipQ;
    reg             symEnEven,symEn,sym2xEn;
    always @(posedge clk) begin
        // Reclock the inputs
        slipI <= iIn;
        slipQ <= qIn;
        symEnEven <= symEnEvenIn;
        symEn <= symEnIn;
        sym2xEn <= sym2xEnIn;
    end
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


    `ifdef SIMULATE
    real phErrReal;
    always @(phaseError) phErrReal = $itor($signed(phaseError))/(2**9);
    `endif

    `ifdef SIMULATE
    real iInReal,qInReal;
    always @(iInLatch) iInReal = $itor($signed(iInLatch))/(2**17);
    always @(qInLatch) qInReal = $itor($signed(qInLatch))/(2**17);
    `endif

    `ifdef EMBED_MULTIH_CARRIER_LOOP
    wire    [ROT_BITS-1:0]  phaseError;
    wire                    phaseErrorEn;
    wire                    phaseErrorValid;
    wire    [17:0]  loopDac0Data,loopDac1Data,loopDac2Data;
    wire    [17:0]  iLoop,qLoop;
    wire    [31:0]  loopDout;
    multihCarrierLoop multihLoop(
        .clk(clk),
        .reset(reset),
        .symEnEven(symEnEven),
        .symEn(symEn),
        .sym2xEn(sym2xEn),
        .iIn(iInLatch),
        .qIn(qInLatch),
        .phaseError(phaseError),
        .phaseErrorEn(phaseErrorEn),
        .phaseErrorValid(phaseErrorValid),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(loopDout),
        .dac0Select(dac0Select),.dac1Select(dac1Select),.dac2Select(dac2Select),
        .dac0ClkEn(loopDac0ClkEn),
        .dac0Data(loopDac0Data),
        .dac0En(loopDac0En),
        .dac1ClkEn(loopDac1ClkEn),
        .dac1Data(loopDac1Data),
        .dac1En(loopDac1En),
        .dac2ClkEn(loopDac2ClkEn),
        .dac2Data(loopDac2Data),
        .dac2En(loopDac2En),
        .demodLock(multihCarrierLock),
        .iOut(iLoop),
        .qOut(qLoop),
        .symEnEvenOut(symEnEvenLoop),
        .symEnOut(symEnLoop),
        .sym2xEnOut(sym2xEnLoop)
    );

    `else   //EMBED_MULTIH_CARRIER_LOOP

    wire    [17:0]  iLoop = iInLatch;
    wire    [17:0]  qLoop = qInLatch;
    wire    [31:0]  multihLoopDout = 0;
    wire            symEnEvenLoop = symEnEven;
    wire            symEnLoop = symEn;
    wire            sym2xEnLoop = sym2xEn;

    `endif  //EMBED_MULTIH_CARRIER_LOOP


    wire [MF_BITS-1:0]
        mf_p3p3_45Real, mf_p3p1_45Real, mf_p3m1_45Real, mf_p3m3_45Real,
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

    mfiltBank uut_mfiltBank  (
        .clk                   (clk       ),
        .reset                 (reset     ),
        .symEnEven             (symEnEvenLoop),
        .symEn                 (symEnLoop     ),
        .sym2xEn               (sym2xEnLoop   ),
        .i                     (iLoop),
        .q                     (qLoop),
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
        .symEnEvenOut          (symEnEvenRot  ),
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
    reg             tbEnable;
    wire    [9:0]   maxAcs;
    viterbiMultiH /*#(MF_BITS, ROT_BITS)*/ viterbiMultiH
       (
        .clk                   (clk           ),
        .reset                 (reset         ),
        .symEnEven             (symEnEvenRot  ),
        .symEn                 (symEnRot      ),
        .sym2xEn               (sym2xEnRot    ),
        `ifdef ALDEC_SIM
        .tbEnable              (1'b1         ),
        .decayFactor           (8'hff         ),
        `else
        .tbEnable              (tbEnable      ),
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
        .maxAcs                (maxAcs        ),
        .phaseError            (phaseError    ),
        .phaseErrorEn          (phaseErrorEn  ),
        .phaseErrorValid       (phaseErrorValid),
        .symEnOut              (symEnOut      ),
        .sym2xEnOut            (sym2xEnOut    )
    );



//************************ Trellis Register Definitions ************************

    reg trellisSpace;
    always @* begin
        casex(addr)
            `MULTIH_SPACE: trellisSpace <= cs;
            default:        trellisSpace <= 0;
            endcase
        end

    `ifdef USE_BUS_CLOCK

    always @(posedge busClk) begin
        if (trellisSpace && wr0) begin
            casex (addr)
                `TRELLIS_DECAY:     decayFactor <= din[7:0];
                `TRELLIS_CONTROL:   begin
                                    symbolDelay <= din[1];
                                    tbEnable <= din[2];
                                    end
                default: ;
                endcase
            end
        end

    `ifdef USE_SLIP
    always @(posedge busClk or posedge symbolSlipped) begin
        if (symbolSlipped) begin
            symbolSlip <= 0;
            end
        else if (trellisSpace && wr0) begin
            casex (addr)
                `TRELLIS_CONTROL:   symbolSlip <= din[0];
                default: ;
                endcase
            end
        end
    `endif

    `else //USE_BUS_CLOCK

    always @(negedge wr0) begin
        if (trellisSpace) begin
            casex (addr)
                `TRELLIS_DECAY:     decayFactor <= din[7:0];
                `TRELLIS_CONTROL:   begin
                                    symbolDelay <= din[1];
                                    tbEnable <= din[2];
                                    end
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

    `endif //USE_BUS_CLOCK

    reg     [31:0]  trellisDout;
    always @* begin
        if (trellisSpace) begin
            casex (addr)
                `TRELLIS_DECAY:     trellisDout = {24'b0,decayFactor};
                `ifdef USE_SLIP
                `TRELLIS_CONTROL:   trellisDout = {29'b0,tbEnable,symbolDelay,symbolSlip};
                `else
                `TRELLIS_CONTROL:   trellisDout = {29'b0,tbEnable,symbolDelay,1'b0};
                `endif
                default:            trellisDout = 32'hx;
            endcase
        end
        else begin
            trellisDout = 32'hx;
        end
    end

    always @* begin
        if (trellisSpace) begin
            dout = trellisDout;
        end
        `ifdef EMBED_MULTIH_CARRIER_LOOP
        else begin
            dout = loopDout;
        end
        `else
        else begin
            dout = 32'hx;
        end
        `endif
    end


//******************************************************************************
//                               DAC Output Mux
//******************************************************************************

always @(posedge clk) begin
    case (dac0Select)
        `DAC_TRELLIS_I: begin
            dac0Data <= iInLatch;
            dac0ClkEn <= sym2xEn;
            end
        `DAC_TRELLIS_Q: begin
            dac0Data <= qInLatch;
            dac0ClkEn <= sym2xEn;
            end
        `DAC_TRELLIS_PHERR: begin
            dac0Data <= {normalize,17'b0};
            dac0ClkEn <= symEnOut;
            end
        `DAC_TRELLIS_INDEX: begin
            dac0Data <= {1'b0,index,11'b0};
            dac0ClkEn <= symEnOut;
            end
        `ifdef EMBED_MULTIH_CARRIER_LOOP
        default: begin
            dac0Data <= loopDac0Data;
            dac0ClkEn <= loopDac0ClkEn;
            end
        `else
        default: begin
            dac0Data <= 0;
            dac0ClkEn <= 0;
            end
        `endif
        endcase

    case (dac1Select)
        `DAC_TRELLIS_I: begin
            dac1Data <= {mf_p3p3_45Real,{(18-MF_BITS){1'b0}}};
            dac1ClkEn <= symEnRot;
            //dac1Data <= iInLatch;
            //dac1ClkEn <= sym2xEn;
            end
        `DAC_TRELLIS_Q: begin
            dac1Data <= {mf_p3p3_45Imag,{(18-MF_BITS){1'b0}}};
            dac1ClkEn <= symEnRot;
            //dac1Data <= qInLatch;
            //dac1ClkEn <= sym2xEn;
            end
        `DAC_TRELLIS_PHERR: begin
            dac1Data <= {maxAcs,8'b0};
            dac1ClkEn <= symEnOut;
            end
        `DAC_TRELLIS_INDEX: begin
            dac1Data <= {1'b0,index,11'b0};
            dac1ClkEn <= symEnOut;
            end
        `ifdef EMBED_MULTIH_CARRIER_LOOP
        default: begin
            dac1Data <= loopDac1Data;
            dac1ClkEn <= loopDac1ClkEn;
            end
        `else
        default: begin
            dac0Data <= 0;
            dac0ClkEn <= 0;
            end
        `endif
        endcase

    case (dac2Select)
        `DAC_TRELLIS_I: begin
            dac2Data <= iInLatch;
            dac2ClkEn <= sym2xEn;
            end
        `DAC_TRELLIS_Q: begin
            dac2Data <= qInLatch;
            dac2ClkEn <= sym2xEn;
            end
        `DAC_TRELLIS_PHERR: begin
            dac2Data <= {phaseError,10'b0};
            dac2ClkEn <= symEnOut;
            end
        `DAC_TRELLIS_INDEX: begin
            dac2Data <= {1'b0,index,11'b0};
            dac2ClkEn <= symEnOut;
            end
        `ifdef EMBED_MULTIH_CARRIER_LOOP
        default: begin
            dac2Data <= loopDac2Data;
            dac2ClkEn <= loopDac2ClkEn;
            end
        `else
        default: begin
            dac0Data <= 0;
            dac0ClkEn <= 0;
            end
        `endif
        endcase

    end

endmodule


