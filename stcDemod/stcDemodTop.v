`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

module stcDemodTop (
    input                   sysClk,

    // Flexbus connections
    input                   fbClk,
    input                   fb_ale,
    input                   fb_csn,
    input                   fb_oen,
    input                   fb_wrn,
    input           [15:0]  fb_addr,
    input           [15:0]  fb_data,

    // ADC Inputs
    input           [13:0]  adc2,
    input                   adc2_overflow,
    input           [13:0]  adc3,
    input                   adc3_overflow,
    output                  adc01_powerDown,
    output                  adc23_powerDown,

    // DAC configuration interface
    output                  dac_rst,
    output                  dac_sclk,
    inout                   dac_sdio,
    output                  dac0_nCs,
    output                  dac1_nCs,
    output                  dac2_nCs,

    // DAC datapath interface
    output          [13:0]  dac0_d,dac1_d,dac2_d,
    output                  dac0_clk,dac1_clk,dac2_clk,

    // Clock and data outputs
    output                  bsClkOut,bsDataOut,
    output                  fsClkOut,fsDataOut,
    output                  encClkOut,encDataOut,
    output                  bsDiffClkOut, bsDiffDataOut,
    output                  fsDiffClkOut, fsDiffDataOut,

    // Lock indicators
    output                  ch0Lockn, ch1Lockn,

    // PLL Interface Signals
    output                  pll_SCK,
    output                  pll_SDI,
    output                  pll0_CS,
    output                  pll0_REF,
    input                   pll0_OUT1,
    output                  pll0_PWDn,
    output                  pll1_CS,
    output                  pll1_REF,
    input                   pll1_OUT1,
    output                  pll1_PWDn,
    output                  pll2_CS,
    output                  pll2_REF,
    input                   pll2_OUT1,
    output                  pll2_PWDn

);

    parameter VER_NUMBER = 16'd1;
    parameter ADDR_BITS = `ADDRESS_BITS;


    //******************************************************************************
    //                          Clock Distribution
    //******************************************************************************
    systemClock systemClock (
        .clk_in1(sysClk),
        .clk_out1(clk),
        .locked(clkLocked)
     );

     // Create a clock enable aligned with the 93.33 MHz reference clock
     reg    detectedSysClkHigh;
     always @(negedge clk) begin
        detectedSysClkHigh <= sysClk;
     end
     reg    clkEnable;
     always @(posedge clk) begin
        clkEnable <= detectedSysClkHigh;
     end

    flexbusClock flexbusClock (
        .clk_in1(fbClk),
        .clk_out1(fb_clk),
        .locked(fbClkLocked)
    );




    //******************************************************************************
    //                         Flexbus Interface
    //******************************************************************************

    wire    [ADDR_BITS-1:0]     addr;
    wire    [31:0]              dataIn;
    flexbus #(.ADDR_BITS(ADDR_BITS))flexbus(
        .fb_clk(fb_clk),
        .fb_ale(fb_ale),
        .fb_csn(fb_csn),
        .fb_wrn(fb_wrn),
        .fb_ad({fb_data,fb_addr}),
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr[ADDR_BITS-1:1]),
        .dataIn(dataIn)
    );
    assign  addr[0] = 1'b0;
    wire    rd = !fb_oen;


    //******************************************************************************
    //                        Decimating Downconverter
    //******************************************************************************

    `ifdef USE_DDC
    `else
    wire    signed  [17:0]  pilotReal,pilotImag;
    fixedFrontend fe(
        .clk(clk),
        .pilotfound(pilotFound),
        .validin(clkEnable),
        .a2d_data(ifSample),
        .imagout(),  
        .realout(),  
        .startout(), 
        .validout(), 
        .pilotreal(pilotReal),
        .pilotimag(pilotImag),
        .fe_valid(pilotValid)  
    );
    `endif

    //******************************************************************************
    //                        Space Time Demod
    //******************************************************************************

    //----------------------- Pilot Detector ----------------------------------

    pilotDetection pd(
        .clk(clk),
        .conj_imag(1'b0),
        .validpilot(pilotValid),
        .realdata(pilotReal),
        .imagdata(pilotImag),
        .pilot_found(pilotFound),
        .max_val(),
        .new_pilot(),
        .pilot_index(),
        .pilot_indexes()
    );

    //----------------------- Detection Filter --------------------------------


    //-------------------------- Estimators -----------------------------------

    `define USE_FIXED_ESTIMATES
    `ifdef USE_FIXED_ESTIMATES
    wire    signed  [17:0]  h0EstReal,h0EstImag;
    assign                  h0EstReal = 18'h10000;  // 1.0 + j0.0
    assign                  h0EstImag = 18'h00000;  
    wire    signed  [17:0]  h1EstReal,h1EstImag;
    assign                  h1EstReal = 18'h00000;  // 0.0 + j0.0
    assign                  h1EstImag = 18'h00000;
    wire    signed  [5:0]   deltaTauEst;
    assign                  deltaTauEst = 6'h00;
    wire            [17:0]  ch0Mu,ch1Mu;
    assign                  ch0Mu = 18'h00000;
    assign                  ch1Mu = 18'h00000;
    `else
    `endif

    //------------------------- Interpolators ---------------------------------

    wire    signed      [17:0]  sample0r;
    interpolator ch0r(
        .clk(clk),
        .clkEn(clkEnable),
        .reset(reset),
        .interpolate(interpolate),
        .mu(ch0Mu),
        .inputEn(sampleEn),
        .din(s0r),
        .outputEn(interpOutEn),
        .dout(sample0r)
    );
    wire    signed      [17:0]  sample0i;
    interpolator ch0i(
        .clk(clk),
        .clkEn(clkEnable),
        .reset(reset),
        .interpolate(interpolate),
        .mu(ch0Mu),
        .inputEn(sampleEn),
        .din(s0i),
        .outputEn(),
        .dout(sample0i)
    );

    wire    signed      [17:0]  sample1r;
    interpolator ch1r(
        .clk(clk),
        .clkEn(clkEnable),
        .reset(reset),
        .interpolate(interpolate),
        .mu(ch1Mu),
        .inputEn(sampleEn),
        .din(s1r),
        .outputEn(),
        .dout(sample1r)
    );
    wire    signed      [17:0]  sample1i;
    interpolator ch1i(
        .clk(clk),
        .clkEn(clkEnable),
        .reset(reset),
        .interpolate(interpolate),
        .mu(ch1Mu),
        .inputEn(sampleEn),
        .din(s1i),
        .outputEn(),
        .dout(sample1i)
    );

    //------------------------- Trellis Detector ------------------------------

    wire                [3:0]   tdBits;
    trellisDetector td(
        .clk(clk), 
        .clkEn(clkEnable),
        .reset(reset),
        .sampleEn(interpOutEn),
        .startFrame(loadEstimates),
        .in0Real(sample0r), .in0Imag(sample0i), 
        .in1Real(sample1r), .in1Imag(sample1i),
        .deltaTauEst(deltaTauEst),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag), 
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .finalMetricOutputEn(),
        .finalMetric(),
        .outputEn(tdOutEn),
        .outputBits(tdBits)
    );


//******************************************************************************
//                       Clock/Data Jitter Reduction
//******************************************************************************

    wire    [7:0]   dll0PhaseError;
    wire    [31:0]  dll0Dout;
    digitalPLL #(.REG_SPACE(`DLL0SPACE)) dll0(
        .clk(clk),
        .reset(reset),
        .busClk(fb_clk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(dll0Dout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .referenceClkEn(tdOutEn),
        .dllOutputClk(pll0_REF),
        .dllOutputClkEn(),
        .phaseError(dll0PhaseError)
    );

    // SPI interface to the PLLs
    wire    [31:0]  pllDout;
    ics307Interface #(.SysclkDivider(4)) pllIntfc (
        .reset(reset),
        .busClk(fb_clk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(pllDout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .clk(clk),
        .SCK(pll_SCK),
        .SDI(pll_SDI),
        .CS0(pll0_CS),
        .CS1(pll1_CS),
        .CS2(pll2_CS),
        .EN0(pll0_PWDn),
        .EN1(pll1_PWDn),
        .EN2(pll2_PWDn),
        .pll0Reset(pll0Reset),
        .pll1Reset(pll1Reset),
        .pll2Reset(pll2Reset)
    );

    //------------- PLL Reference Clocks --------------
    assign          pll1_REF = 1'b0;
    assign          pll2_REF = 1'b0;

    //------------- Serialize the 4 STC Bits ----------
    reg             [3:0]   stcSR;
    reg             [1:0]   tdBitCount;
    reg                     pll0WrEn;
    always @(posedge clk) begin
        if (tdOutEn) begin
            stcSR <= tdBits;
            tdBitCount <= 3;
            pll0WrEn <= 1;
        end
        else if (tdBitCount > 0) begin
            stcSR <= {1'b0,stcSR[3:1]};
        end
        else begin
            pll0WrEn <= 0;
        end
    end
    //------------- PLL0 Data FIFO --------------------
    reg             pll0_ReadEnable;
    jitterFifo pll0Fifo(
        .rst(pll0Reset),
        .wr_clk(clk),
        .rd_clk(pll0_OUT1),
        .din(stcSR[0]),
        .wr_en(pll0WrEn),
        .rd_en(pll0_ReadEnable),
        .dout(pll0_dout),
        .full(pll0_Full),
        .empty(pll0_Empty),
        .prog_full(pll0_HalfFull)
    );
    always @(posedge pll0_OUT1) begin
        if (pll0Reset) begin
            pll0_ReadEnable <= 0;
        end
        else if (pll0_HalfFull) begin
            pll0_ReadEnable <= 1;
        end
    end





    //******************************************************************************
    //                              DAC Outputs
    //******************************************************************************
    reg     signed  [17:0]  interp0DataIn;
    reg                     interp0ClkEn;
    always @(posedge clk) begin
        case (dac0InputSelect)
            `SYS_DAC_INPUT_SEL_CH0: begin
                interp0DataIn <= ch0Dac0Data;
                interp0ClkEn <= ch0Dac0ClkEn;
            end
            `SYS_DAC_INPUT_SEL_CH1: begin
                interp0DataIn <= ch1Dac0Data;
                interp0ClkEn <= ch1Dac0ClkEn;
            end
            `SYS_DAC_INPUT_SEL_DLL0: begin
                interp0DataIn <= {1'b0,dll0PhaseError,9'b0};
                interp0ClkEn <= 1'b1;
            end
            `SYS_DAC_INPUT_SEL_DLL1: begin
                interp0DataIn <= {1'b0,dll1PhaseError,9'b0};
                interp0ClkEn <= 1'b1;
            end
            default: begin
                interp0DataIn <= ch0Dac0Data;
                interp0ClkEn <= ch0Dac0ClkEn;
            end
        endcase
    end
    wire            [31:0]  interp0Dout;
    wire    signed  [17:0]  interp0DataOut;
    interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) dac0Interp(
        .clk(clk), .reset(reset), .clkEn(interp0ClkEn),
        .busClk(fb_clk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp0Dout),
        .dataIn(interp0DataIn),
        .dataOut(interp0DataOut)
        );
    reg             [13:0]  dac0_d;
    always @(posedge clk) begin
        dac0_d <= $unsigned({~interp0DataOut[17],interp0DataOut[16:4]});
    end

    reg     signed  [17:0]  interp1DataIn;
    reg                     interp1ClkEn;
    always @(posedge clk) begin
        case (dac1InputSelect)
            `SYS_DAC_INPUT_SEL_CH0: begin
                interp1DataIn <= ch0Dac1Data;
                interp1ClkEn <= ch0Dac1ClkEn;
            end
            `SYS_DAC_INPUT_SEL_CH1: begin
                interp1DataIn <= ch1Dac1Data;
                interp1ClkEn <= ch1Dac1ClkEn;
            end
            default: begin
                interp1DataIn <= ch0Dac1Data;
                interp1ClkEn <= ch0Dac1ClkEn;
            end
        endcase
    end
    wire            [31:0]  interp1Dout;
    wire    signed  [17:0]  interp1DataOut;
    interpolate #(.RegSpace(`INTERP1SPACE), .FirRegSpace(`VIDFIR1SPACE)) dac1Interp(
        .clk(clk), .reset(reset), .clkEn(interp1ClkEn),
        .busClk(fb_clk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp1Dout),
        .dataIn(interp1DataIn),
        .dataOut(interp1DataOut)
        );
    reg     [13:0]  dac1_d;
    always @(posedge clk) begin
        dac1_d <= $unsigned({~interp1DataOut[17],interp1DataOut[16:4]});
    end

    reg     signed  [17:0]  interp2DataIn;
    reg                     interp2ClkEn;
    always @(posedge clk) begin
        case (dac2InputSelect)
            `SYS_DAC_INPUT_SEL_CH0: begin
                interp2DataIn <= ch0Dac2Data;
                interp2ClkEn <= ch0Dac2ClkEn;
            end
            `SYS_DAC_INPUT_SEL_CH1: begin
                interp2DataIn <= ch1Dac2Data;
                interp2ClkEn <= ch1Dac2ClkEn;
            end
            default: begin
                interp2DataIn <= ch0Dac2Data;
                interp2ClkEn <= ch0Dac2ClkEn;
            end
        endcase
    end
    wire            [31:0]  interp2Dout;
    wire    signed  [17:0]  interp2DataOut;
    interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) dac2Interp(
        .clk(clk), .reset(reset), .clkEn(interp2ClkEn),
        .busClk(fb_clk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp2Dout),
        .dataIn(interp2DataIn),
        .dataOut(interp2DataOut)
        );
    reg     [13:0]  dac2_d;
    always @(posedge clk) begin
        dac2_d <= $unsigned({~interp2DataOut[17],interp2DataOut[16:4]});
    end


    assign dac0_clk = clk;
    assign dac1_clk = clk;
    assign dac2_clk = clk;

//******************************************************************************
//                               Output Assignments
//******************************************************************************

    assign  adc01_powerDown = 1'b1;
    assign  adc23_powerDown = 1'b0;

    assign  dac_rst =       1'b0;
    assign  dac_sclk =      1'b0;
    assign  dac0_nCs =      1'b1;
    assign  dac1_nCs =      1'b1;
    assign  dac2_nCs =      1'b1;
    assign  dac_sdio =      1'b0;

    assign  ch0Lockn =      1'b1;
    assign  ch1Lockn =      1'b1;

    assign  bsDataOut =     pll0_dout;
    assign  bsClkOut =      pll0_OUT1;

    assign  fsClkOut =      1'b0;
    assign  fsDataOut =     1'b0;
    assign  encClkOut =     1'b0;
    assign  encDataOut =    1'b0;
    assign  bsDiffClkOut =  1'b0;
    assign  bsDiffDataOut = 1'b0;
    assign  fsDiffClkOut =  1'b0;
    assign  fsDiffDataOut = 1'b0;

endmodule
