

`timescale 1ns/100ps

module CombinerTop (

     input     [17:0]  ch1Adc, ch2Adc, ch1RealIn, ch1ImagIn, ch2RealIn, ch2ImagIn,
     input     [11:0]  ch1Agc, ch2Agc,
     input             reset, clk, clk2x, clkOver2, busClk, complexOrIF,
     input     [4:0]   addr,
     input             cs, wr0, wr1, wr2, wr3,
     input     [31:0]  dataIn,

     output            locked, agc1_gt_agc2,
                       RealXord, ImagXord, ifBS_n, combinerEn,
     output    [17:0]  ifOut,
     output    [31:0]  dataOut,
     output    [17:0]  maxImagout, minImagout, imagout, realout, phase_detect,
     output    [17:0]  maxRealout, minRealout, gainOutMax, gainOutMin,
     output    [12:0]  RealLock, ImagLock,
     output    [31:0]  lag_out,
     output    [21:0]  nco_control_out
);

//******************************************************************************
//                          Combiner/BitSync Interface
//******************************************************************************


    `define COMB_LAG_COEF      5'b0_00xx
    `define COMB_LEAD_COEF     5'b0_01xx
    `define COMB_SWEEP_RATE    5'b0_10xx
    `define COMB_SWEEP_LIMIT   5'b0_110x
    `define COMB_OPTIONS       5'b0_111x
    `define COMB_REF_LEVEL     5'b1_00xx

     wire    [17:0]  ch1RealPre, ch1ImagPre, ch2RealPre, ch2ImagPre;

     dualQuadDdc preDdc    // Down convert incoming IFs to baseband, do both channels with same phase LO
         (
         .clk(clk),
         .reset(reset),
         .ifIn1(ch1Adc),
         .ifIn2(ch2Adc),
         .syncOut(),
         .iOut1(ch1RealPre),
         .qOut1(ch1ImagPre),
         .iOut2(ch2RealPre),
         .qOut2(ch2ImagPre)
         );

     reg    [7:0]   simReset;
     always @(posedge clk) begin
        simReset <= (reset) ? 8'hFF : {simReset[6:0], 1'b0};
     end

     wire    [17:0]  ch1Real, ch1Imag, ch2Real, ch2Imag;
     assign ch1Real = (simReset[7]) ? 0 : (complexOrIF) ? ch1RealIn : ch1RealPre;
     assign ch1Imag = (simReset[7]) ? 0 : (complexOrIF) ? ch1ImagIn : ch1ImagPre;
     assign ch2Real = (simReset[7]) ? 0 : (complexOrIF) ? ch2RealIn : ch2RealPre;
     assign ch2Imag = (simReset[7]) ? 0 : (complexOrIF) ? ch2ImagIn : ch2ImagPre;

     DigitalCombiner DigitalCombiner_u
         (
             .clk                (clkOver2),
             .clk2x              (clk),
             .clk4x              (clk2x),
             .reset              (reset),
             .ce                 (1'b1),
             .cs                 (cs),
             .busClk             (busClk),
             .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
             .addr               (addr),
             .dataIn             (dataIn),
             .dataOut            (dataOut),
             .re1In              (ch1Real),
             .im1In              (ch1Imag),
             .re2In              (ch2Real),
             .im2In              (ch2Imag),
             .ch1agc             (ch1Agc),
             .ch2agc             (ch2Agc),
             .realout            (realout),
             .imagout            (imagout),
             .ifOut              (ifOut),
             .combinerEn         (combinerEn),
             .reallock           (RealLock),
             .imaglock           (ImagLock),
             .locked             (locked),
             .agc1_gt_agc2       (agc1_gt_agc2),
             .lag_out            (lag_out),
             .nco_control_out    (nco_control_out),
             .phase_detect       (phase_detect),
             .maximagout         (maxImagout),
             .maxrealout         (maxRealout),
             .minimagout         (minImagout),
             .minrealout         (minRealout),
             .realxord           (RealXord),
             .imagxord           (ImagXord),
             .gainoutmax         (gainOutMax),
             .gainoutmin         (gainOutMin),
             .ifBS_n             (ifBS_n)
         );


endmodule

