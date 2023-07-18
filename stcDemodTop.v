`timescale 1ns/100ps
`include "addressMap.v"
// Rev 601, FZ 9-14-19. Modified the TEST_DACS generic to remove the interpolators when not using their outputs. I use this for the 7k160 build to reduce DSP usage.

module stcDemodTop (

    `ifdef R6100

    input               spiClk,
    input               spiCSn,
    input               spiDataIn,
    inout               spiDataOut,

    `else   //R6100

    // Flexbus connections
    input               fbClk,
    input               fb_ale,
    input               fb_csn,
    input               fb_oen,
    input               fb_wrn,
    input       [15:0]  fb_addr,
    inout       [15:0]  fb_data,

    `endif //R6100

    // ADC Inputs
    input       [13:0]  adc0,
    input               adc0_overflow,
    output              adc01_powerDown,
    `ifdef R6100
    input               adc0Clk,
    `else // R6100
    input               sysClk,
    `endif // R6100

    // DAC configuration interface
    output              dac_rst,
    output              dac_sclk,
    output              dac_sdio,
    output              dac0_nCs,
    output              dac1_nCs,
    `ifndef R6100
    output              dac2_nCs,
    `endif

    // DAC datapath interface
    output              dac0_clk,
    output  reg [13:0]  dac0_d,
    output              dac1_clk,
    output  reg [13:0]  dac1_d,
    `ifndef R6100
    output              dac2_clk,
    output  reg [13:0]  dac2_d,
    `endif

    // Clock and data outputs
    output              ch0ClkOut,ch0DataOut,
    output              ch1ClkOut,ch1DataOut,
    output              ch2ClkOut,ch2DataOut,
    output              ch3ClkOut,ch3DataOut,

    `ifdef R6100

    // PLL Interface Signals
    output              pll0_REF,
    input               pll0_OUT1,
    output              pll1_REF,
    input               pll1_OUT1,

    `ifdef ADD_AM
    // AM ADC Interface
    input               amAdcDataIn,
    output              amAdcClk,
    output              amAdcCSn,

    // AM DAC Interface
    output              amDacDataOut,
    output              amDacClk,
    output              amDacCSn,
    `endif

    // Video Switch Select Lines            these are redefined in NGR demod
    output      [1:0]   video0InSelect,     // Filt1[2], Filt0[2]
    output reg  [1:0]   video0OutSelect,    // Filt0[1:0] same as non_NGR
    output      [1:0]   video1InSelect,     // AGC 50, Ana 50 switches
    output reg  [1:0]   video1OutSelect,    // Filt1[1:0] same as non_NGR
               // I didn't rename the pins to conserve the pinout.xdc files
    `else   //R6100

    // PLL Interface Signals
    output              pll_SCK,
    output              pll_SDI,
    output              pll0_CS,
    output              pll0_REF,
    input               pll0_OUT1,
    output              pll0_PWDn,
    output              pll1_CS,
    output              pll1_REF,
    input               pll1_OUT1,
    output              pll1_PWDn,
    output              pll2_CS,
    output              pll2_REF,
    input               pll2_OUT1,
    output              pll2_PWDn,

    `endif //R6100

    `ifdef ADD_SPI_GATEWAY
    //output              spiFlashCK, //Output through the STARTUPE2 primitive
    output              spiFlashCSn,
    output              spiFlashMOSI,
    input               spiFlashMISO,
    `endif

    // Lock indicators
    output              lockLed0n, lockLed1n,


    `ifdef R6100

        output  reg         Sw50Ohm,
        input               FPGA_ID0, FPGA_ID1,

//        `ifdef COMBINER // assumes the sidecar is attached, the SBS signals are defined later
            inout    [40:1]     SideCar,
 /*       `elsif ADD_BITSYNC
            // Bitsync ADC
            input       [13:0]  bsAdc,
            input               bsAdc_overflow,
            output              bsAdc_powerDown,

            // Input Impedance and Topology controls
            output              bsHighImpedance,
            output              bsSingleEnded,

            // Gain and Offset DAC interfaces
            output              bsDacSELn,
            output              bsDacSCLK, bsDacMOSI,
        `endif  //ADD_BITSYNC
*/
       `ifdef COMBINER  // both sides need these signals
            input  [4:0]        PrevData_p,
                                PrevData_n,
                                NextData_p,
                                NextData_n,
            input               NextClk_p,
                                NextClk_n,
                                PrevClk_p,
                                PrevClk_n,
        `elsif COMBINER_DEMOD // combiner

        // interFpga data
            output [4:0]        PrevData_p,
                                PrevData_n,
                                NextData_p,
                                NextData_n,
            output              NextClk_p,
                                NextClk_n,
                                PrevClk_p,
                                PrevClk_n,
        `endif



    // SDI Output
        output              sdiOut,
        output              DQMOut

    `else   //R6100

        // SDI Output
    output              sdiOut

    `endif //R6100

);

    parameter VER_NUMBER = 16'd682;


//******************************************************************************
//                          Clock Distribution
//******************************************************************************
    `ifdef R6100
    systemClock systemClock (
        .clk_in1(adc0Clk),
        .clk93(clk),
        .clk93Dly(clkDly),
        .clk186(clk186),
        .clkOver2(clk46r6),
        .locked(clkLocked)
    );


    `define ADD_FRANKS_KLUDGE
    `ifdef ADD_FRANKS_KLUDGE
    reg spiClk0,spiClk1;
    always @(posedge clk) begin
        spiClk0 <= spiClk;
        spiClk1 <= spiClk0;
    end
    BUFG spiBufg(
        .I(spiClk1),
        .O(busClk)
    );

    `else //ADD_FRANKS_KLUDGE

    BUFG spiBufg(
        .I(spiClk),
        .O(busClk)
    );
    `endif //ADD_FRANKS_KLUDGE

    `else //R6100
    systemClock systemClock (
        .clk_in1(sysClk),
        .clk93(clk),
        .clk93Dly(clkDly),
        .clk186(clk186),
        .clkOver2(clk46r6),
        .locked(clkLocked)
     );

    flexbusClock flexbusClock (
        .clk_in1(fbClk),
        .clk_out1(busClk),
        .locked(fbClkLocked)
    );
    `endif //R6100



    `ifdef R6100
    /******************************************************************************
                                 SPI Config Interface
    ******************************************************************************/
    wire    [12:0]  addr;
    wire    [31:0]  dataIn;
    reg     [31:0]  rd_mux;
    spiBusInterface spi(
        .clk(clk),
        .reset(reset),
        .spiClk(busClk),
        .spiCS(!spiCSn),
        .spiDataIn(spiDataIn),
        .spiDataOut(spiOut),
        .spiDataOE(spiDataOE),
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(rd_mux)
    );
    assign spiDataOut = spiDataOE ? spiOut : 1'bz;

    `else //R6100

    /******************************************************************************
                                 Bus Interface
    ******************************************************************************/
    wire    [12:0]  addr;
    wire    [31:0]  dataIn;
    flexbus flexbus(
        .fb_clk(busClk),
        .fb_ale(fb_ale),
        .fb_csn(fb_csn),
        .fb_wrn(fb_wrn),
        .fb_ad({fb_data,fb_addr}),
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr[12:1]),
        .dataIn(dataIn)
    );
    assign  addr[0] = 1'b0;
    wire    rd = !fb_oen;

    `endif //R6100

    `ifdef ADD_SPI_GATEWAY
    /******************************************************************************
                               SPI Flash Interface
    ******************************************************************************/
    reg spiGatewaySpace;
    always @* begin
        casex(addr)
            `SPIGW_SPACE:   spiGatewaySpace = cs;
            default:        spiGatewaySpace = 0;
        endcase
    end
    wire            [31:0]  spiGatewayDout;
    spiGateway spiGw(
        .clk(clk),
        .reset(reset),
        .busClk(busClk),
        .cs(spiGatewaySpace),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(spiGatewayDout),
        .spiClk(spiFlashCK),
        .spiCS(spiFlashCS),
        .spiDataIn(spiFlashMISO),
        .spiDataOut(spiFlashMOSI)
    );
    assign spiFlashCSn = ~spiFlashCS;

    STARTUPE2 startupe2(
        .CFGCLK(),
        .CFGMCLK(),
        .EOS(),
        .PREQ(),
        .CLK(1'b0),
        .GSR(1'b0),
        .GTS(1'b0),
        .KEYCLEARB(1'b0),
        .PACK(1'b0),
        .USRCCLKO(spiFlashCK),
        .USRCCLKTS(1'b0),
        .USRDONEO(1'b1),
        .USRDONETS(1'b0)
    );
    `endif



//******************************************************************************
//                           Reclock ADC Inputs
//******************************************************************************
    reg             [13:0]  adc0Reg;
    reg     signed  [17:0]  adc0In;

    `ifdef COMBINER
        wire            [17:0]  combinerIF;
        wire    clk93r3 = clk;
        wire            combinerEn;
    always @(posedge clk) begin
        adc0Reg <= adc0;
            if (combinerEn) begin
                adc0In <= combinerIF;
            end
            else begin
                adc0In <= $signed({~adc0Reg[13],adc0Reg[12:0],4'b0});
            end
        end
/*  STC in a 160 doesn't have enough DSPs for the PreDisortion module.
    `elsif COMBINER_DISTORT
        reg     signed  [17:0]  adc0InPre;
        wire    signed  [17:0]  adc0InPost;
        wire    clk93r3 = clk;
        wire            [11:0]  amDataIn_u;

        always @(posedge clk) begin
            adc0Reg     <= adc0;
            adc0InPre   <= $signed({~adc0Reg[13],adc0Reg[12:0],4'b0});
            adc0In      <= adc0InPost;
        end

        reg combSpace;
        always @* begin
            casex(addr)
                `COMBINER_SPACE:    combSpace = cs;
                default:            combSpace = 0;
            endcase
        end

    wire    [15:0]  Noise1, Noise2;
    wire    [17:0]  ncoCos, ncoSin;
    wire    [31:0]  combDataOut;
         DemodPreDist Distort
         (
            .clk46r6        (clk46r6),
            .clk93r3        (clk93r3),
            .clk186         (clk186),
            .reset          (reset),
            .cs             (combSpace),
            .addr           (addr[5:0]),
            .dataIn         (dataIn),
            .dataOut        (combDataOut),
            .wr0            (wr0),
            .wr1            (wr1),
            .wr2            (wr2),
            .wr3            (wr3),
            .busClk         (busClk),
            .FPGA_ID0       (FPGA_ID0),
            .FPGA_ID1       (FPGA_ID1),
            .adc0In         (adc0InPre),
            .chAgc          (amDataIn_u),
            .Noise1         (Noise1),
            .Noise2         (Noise2),
            .NcoCos         (ncoCos),
            .NcoSin         (ncoSin),
            .RealOut        (),
            .ImagOut        (),
            .ifOut          (adc0InPost)
        );
        */
    `else
    always @(posedge clk) begin
        adc0Reg <= adc0;
        adc0In <= $signed({~adc0Reg[13],adc0Reg[12:0],4'b0});
    end
    `endif

    `ifdef R6100
    //Assume IF/BS Sidecar is used. This is just muxing if IF_BS_n is low,
    // but keeps pin names constant
    wire        [17:0]  DdsData;
    wire                DdsIO_Reset;
    wire                DdsIO_Update;
    wire                DdsReset;
    wire                DdsCS_n;
    wire                DdsSClk;
    wire                DdsMosi;
    wire                IF_BS_n;
    wire      [13:0]    bsAdc;
    wire                bsAdc_overflow, bsAdc_powerDown;
    // Input Impedance and Topology controls
    wire                bsHighImpedance, bsSingleEnded;

    // Gain and Offset DAC interfaces
    wire                bsDacSELn, bsDacSCLK, bsDacMOSI;

   ifBsMux ifBsMux (
        .IF_BS_n         (IF_BS_n),
        .SideCar         (SideCar),
        .DdsData         (DdsData),
        .DdsIO_Reset     (DdsIO_Reset),
        .DdsIO_Update    (DdsIO_Update),
        .DdsReset        (DdsReset),
        .DdsCS_n         (DdsCS_n),
        .DdsSClk         (DdsSClk),
        .DdsMosi         (DdsMosi),
        .DdsMiso         (DdsMiso),
        .SideCarClk      (SideCarClk),
        .DdsSyncClk      (DdsSyncClk),
        .bsAdc_powerDown (bsAdc_powerDown),
        .bsHighImpedance (bsHighImpedance),
        .bsSingleEnded   (bsSingleEnded),
        .bsDacSELn       (bsDacSELn),
        .bsDacSCLK       (bsDacSCLK),
        .bsDacMOSI       (bsDacMOSI),
        .bsAdc           (bsAdc),
        .bsAdc_overflow  (bsAdc_overflow)
    );
    `endif

//******************************************************************************
//                             Top Level Registers
//******************************************************************************

    reg semcoTopSpace;
    always @* begin
        casex(addr)
            `SEMCO_TOP_SPACE:       semcoTopSpace = cs;
            default:                semcoTopSpace = 0;
        endcase
    end

    wire    [31:0]  boot_addr;
    wire    [8:0]   idCode;
    wire    [3:0]   ch0MuxSelect;
    wire    [3:0]   ch1MuxSelect;
    wire    [31:0]  semcoTopDout;
    semcoTopRegs topRegs(
        .busClk(busClk),
        .cs(semcoTopSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(semcoTopDout),
        .clk(clk),
        .versionNumber(VER_NUMBER),
        .fpgaType(`FPGA_TYPE),
        .idCode(idCode),
        .reset(reset),
        .reboot(reboot),
        .rebootAddress(boot_addr),
        .dac0InputSelect(),
        .dac1InputSelect(),
        .dac2InputSelect(),
        .ch0MuxSelect(),
        .ch1MuxSelect(),
        .combinerTestMode(combinerTestMode)
    );

`ifdef ADD_MULTIBOOT
//******************************************************************************
//                           Multiboot Controller
//******************************************************************************
    `ifdef ADD_IDCODE

    multibootK7_FZ multiboot(
        .clk(clk),
        .reset(reset),
        .pulse(reboot),
        .addr(boot_addr),
        .idCode(idCode)
    );

    `else //ADD_IDCODE

    multibootK7 multiboot(
        .clk(clk),
        .pulse(reboot),
        .addr(boot_addr),
        .reset(reset)
    );

    `endif //ADD_IDCODE

`endif //ADD_MULTIBOOT

//******************************************************************************
//                         STC Registers
//******************************************************************************

    reg stcTopSpace;
    always @* begin
        casex(addr)
            `STC_DEMOD_SPACE:       stcTopSpace = cs;
            default:                stcTopSpace = 0;
        endcase
    end

    wire    signed  [15:0]  ch0Mag,ch1Mag;
    wire    signed  [5:0]   stcDeltaTau;
    wire            [15:0]  clocksPerBit;
    wire            [11:0]  hxThreshSlv;
    wire            [3:0]   stcDac0Select;
    wire            [3:0]   stcDac1Select;
    wire            [3:0]   stcDac2Select;
    wire            [31:0]  stcDout;

    stcRegs stcTopReg(
        .busClk(busClk),
        .cs(stcTopSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(stcDout),
        .ch0Mag(ch0Mag),
        .ch1Mag(ch1Mag),
        .stcDeltaTau(stcDeltaTau),
        .lockStatus0(pilotFound),
        .lockStatus1(pilotLocked),
        .spectrumInvert(SpectrumInv),
        .clocksPerBit(clocksPerBit),
        .hxThreshSlv(hxThreshSlv),      // AGC dependent, usually x"180"
        .dac0Select(stcDac0Select),
        .dac1Select(stcDac1Select),
        .dac2Select(stcDac2Select)
);


//******************************************************************************
//                         Downconverter
//******************************************************************************

    wire    signed  [8:0]   sampleRateError;
    wire    signed  [17:0]  iDdc,qDdc, HxEstR, HxEstI;
    wire    signed  [3:0]   demodDac0Select,demodDac1Select,demodDac2Select;
    wire    signed  [17:0]  demodDac0Data,demodDac1Data,demodDac2Data;
    wire            [4:0]   demodMode;
    wire            [31:0]  demodDout;
    stcDownconverter stcDdc(
        .clk(clk), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(demodDout),
        .iRx(adc0In), .qRx(18'h0),
        .maxChEstI(HxEstR), .maxChEstQ(HxEstI),
        .maxChEstClkEn(phaseDiffEn),
        .sampleRateErrorEn(sampleRateErrorEn),
        .sampleRateError(sampleRateError),
        .locked(pilotFound),
        .iStc(iDdc), .qStc(qDdc),
        .resampSync(stcDdcClkEn),
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0Sync(demodDac0ClkEn),
        .dac0Data(demodDac0Data),
        .dac1Sync(demodDac1ClkEn),
        .dac1Data(demodDac1Data),
        .dac2Sync(demodDac2ClkEn),
        .dac2Data(demodDac2Data),
        .demodMode(demodMode)
    );


/******************************************************************************
                            Pilot Carrier Loop
******************************************************************************/
    wire    signed  [17:0]  phaseDiffNB, phaseDiffWB;
    wire    signed  [31:0]  pilotFreqLag;
    wire    signed  [31:0]  pilotFreqLead;
    wire    signed  [11:0]  pilotLeadError;
    wire    signed  [11:0]  pilotLagError;
    wire    signed  [11:0]  pilotFreqError;
    wire            [31:0]  pilotDout;
    stcLoop #(.RegSpace(`PILOT_LF_SPACE)) pilot(
        .clk(clk), .reset(reset),
        .clkEn(phaseDiffEn),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(pilotDout),
        .phaseDiffNB(phaseDiffNB[17:6]),
        .phaseDiffWB(phaseDiffWB[17:6]),
        .carrierFreqOffset(pilotFreqLag),
        .carrierLeadFreq(pilotFreqLead),
        .carrierFreqEn(pilotFreqOffsetEn),
        .phaseLoopError(pilotLeadError),
        .lagError(pilotLagError),
        .avgFreqError(pilotFreqError),
        .freqAcquired(pilotFreqAcquired),
        .lockCounter()
    );

    // LO Generator
    wire    [47:0]  m_axis;
    wire    [17:0]  qDds = m_axis[41:24];
    wire    [17:0]  iDds = m_axis[17:0];
    `ifdef SIMULATE
    reg ddsSimReset;
    initial ddsSimReset = 0;
    wire ddsReset = ddsSimReset || reset;
    `else
    wire ddsReset = reset;
    `endif
    wire    signed  [31:0]  pilotFreq = pilotFreqLag + pilotFreqLead;
    dds6p0 dds(
      .aclk(clk),
      .aclken(1'b1),
      .aresetn(!ddsReset),
      .m_axis_data_tdata(m_axis),
      .m_axis_data_tvalid(),
      .s_axis_phase_tdata(pilotFreq),
      .s_axis_phase_tvalid(1'b1)
    );


    // Complex Multiplier
    wire [17:0]iStc;
    wire [17:0]qStc;
    cmpy18 #(.UnityGain(1)) mixer(
        .clk(clk),
        .reset(reset),
        .aReal(iDdc),
        .aImag(qDdc),
        .bReal(iDds),
        .bImag(qDds),
        .pReal(iStc),
        .pImag(qStc)
    );




//******************************************************************************
//                                 STC Demod
//******************************************************************************
    wire    signed  [17:0]  stcDac0Data;
    wire                    stcDac0ClkEn;
    wire    signed  [17:0]  stcDac1Data;
    wire                    stcDac1ClkEn;
    wire    signed  [17:0]  stcDac2Data;
    wire                    stcDac2ClkEn;
    wire                    stcBitEnOut;
    wire                    stcBit;
    wire            [31:0]  stcPeaks;
    assign  ch0Mag = $signed(stcPeaks[15:0]);
    assign  ch1Mag = $signed(stcPeaks[31:16]);

    STC stcDemod(
        .ResampleR(iStc),
        .ResampleI(qStc),
        .Clk93(clk),
        .Clk93Dly(clkDly),
        .Clk186(clk186),
        .ValidIn(stcDdcClkEn),
        .ClocksPerBit(clocksPerBit),
        .DacSelect0(stcDac0Select),
        .DacSelect1(stcDac1Select),
        .DacSelect2(stcDac2Select),
        .SpectrumInv(SpectrumInv),
        .PhaseDiffNB(phaseDiffNB),
        .PhaseDiffWB(phaseDiffWB),
        .PhaseDiffEn(phaseDiffEn),
        .PilotOffset(sampleRateError),
        .StartOfFrame(sampleRateErrorEn),
        .ClkOutEn(stcBitEnOut),
        .PilotFound(pilotFound),
        .PilotLocked(pilotLocked),
        .HxEstR(HxEstR),
        .HxEstI(HxEstI),
        .Peaks(stcPeaks),
        .DeltaTau(stcDeltaTau),
        .DataOut(stcBitOut),
        .Dac0Data(stcDac0Data),
        .Dac0ClkEn(stcDac0ClkEn),
        .Dac1Data(stcDac1Data),
        .Dac1ClkEn(stcDac1ClkEn),
        .Dac2Data(stcDac2Data),
        .Dac2ClkEn(stcDac2ClkEn)
    );

//******************************************************************************
`ifdef COMBINER
    /* to do a combiner build
        Define COMBINER in Project Settings-General-Verilog Options.
        Set impl325 as active in Design Runs, the constrs_325 should go active
        DC_DemodTop should be listed as unused in Design Sources
        Generate Bitstream.
    */
    reg combSpace;
    always @* begin
        casex(addr)
            `COMBINER_SPACE:    combSpace = cs;
            default:            combSpace = 0;
        endcase
    end

    wire    [12:0]  RealLock, ImagLock;
    wire    [31:0]  combDataOut;
    DigitalCombiner Combiner
    (
        .clk46r6        (clk46r6),
        .clk93r3        (clk93r3),
        .clk186         (clk186),
        .SideCarClk     (SideCarClk),
        .reset          (!FPGA_ID1 || reset),
        .cs             (combSpace),
        .addr           (addr[5:0]),
        .dataIn         (dataIn),
        .dataOut        (combDataOut),
        .wr0            (wr0),
        .wr1            (wr1),
        .wr2            (wr2),
        .wr3            (wr3),
        .busClk         (busClk),

        .PrevData_p     (PrevData_p),
        .PrevData_n     (PrevData_n),
        .NextData_p     (NextData_p),
        .NextData_n     (NextData_n),
        .NextClk_p      (NextClk_p),
        .NextClk_n      (NextClk_n),
        .PrevClk_p      (PrevClk_p),
        .PrevClk_n      (PrevClk_n),

        .ch0MseSum(ch0MseSum),
        .ch0Log10MseSum(ch0Log10MSE),
        .ch1MseSum(ch1MseSum),
        .ch1Log10MseSum(ch1Log10MSE),

        .ifOut          (combinerIF),
        .realout        (iCombData),     // combiner runs at 46.6MHz
        .imagout        (qCombData),     // I/Q outputs
        .combinerEn     (combinerEn),
        .locked         (combLocked),
        .imaglock       (ImagLock),
        .reallock       (RealLock),
        .agc0_gt_agc1   (bestSrcSel),
        .realxord       (),
        .imagxord       (),
        .ifBS_n         (IF_BS_n),
        .DdsData        (DdsData),
        .DdsIO_Reset    (DdsIO_Reset),
        .DdsIO_Update   (DdsIO_Update),
        .DdsReset       (DdsReset),
        .DdsCS_n        (DdsCS_n),
        .DdsSClk        (DdsSClk),
        .DdsMosi        (DdsMosi),
        .DdsMiso        (DdsMiso),
        .DdsSyncClk     (DdsSyncClk),

        .dataI          (bertDataIn)
    );


//    assign lockLed0n = RealLock[12];
//    assign lockLed1n = ImagLock[12];

`elsif COMBINER_DEMOD
    /* to do a pre-combiner demod build
        Set impl_160 as active in Design Runs, the constraint set should change to constrs_160
        Redefine COMBINER to COMBINER_DEMOD in Project Settings-General-Verilog Options.
        Define COMBINER_DISTORT if desired for testing
        DigitalCombiner will now be listed as unused in Design Sources
        Generate Bitstream.
    */
// See line 353
//    `ifndef COMBINER_DISTORT

        //******************************************************************************
        //                           AM ADC Interface
        //******************************************************************************
        wire    signed  [11:0]  amDataIn;
        // A/D input is inverted and signed, convert it to unsigned positive slope
        wire    unsigned [11:0] amDataIn_u = {amDataIn[11], ~amDataIn[10:0]};
        ad7476Interface amAdc(
            .clk(clk),
            .reset(reset),
            .spiDin(amAdcDataIn),
            .spiClk(amAdcClk),
            .spiCSn(amAdcCSn),
            .adcData(amDataIn),
            .adcDataEn(amDataEn)
        );
//    `endif

    dqmChip2Chip c2c (
        .clk(clk),
        .reset(reset),
        .combinerStartOfFrame(),
        .dqmStartOfFrame(),
        .mseSum(mseSum),
        .log10MseSum(log10MSE),
        .mseMCLK(mseMCLK),
        .mseMFS(mseMFS),
        .mseMDATA(mseMDATA),
        .ch0SCLK(1'b0),
        .ch0SFS(1'b0),
        .ch0SDATA(1'b0),
        .ch0MseSum(),
        .ch0Log10MseSum(),
        .ch1SCLK(1'b0),
        .ch1SFS(1'b0),
        .ch1SDATA(1'b0),
        .ch1MseSum(),
        .ch1Log10MseSum()
    );

//******************************************************************************
//                               Combiner Outputs from Demod
//******************************************************************************
     DC_DemodTop combinerOut(
        .clk93r3        (clk),
        .Reset          (reset),
        .FPGA_ID0       (FPGA_ID0),
        .FPGA_ID1       (FPGA_ID1),
        .testMode       (combinerTestMode),
        .adc0           (adc0In[17:4]), // grab just the raw a/d data. I'll convert to 18 bit signed in combiner
        .amDataIn       (amDataIn_u),
        // DQM serial inputs
        .dqmCLK         (mseMCLK),   // demod DQM is out only
        .dqmFS          (mseMFS),    // the same data is sent to toNext and toPrev
        .dqmDATA        (mseMDATA),
        .dataEn         (bertClkEn),
        .dataI          (bertDataIn),
        .PrevData_p     (PrevData_p),
        .PrevData_n     (PrevData_n),
        .NextData_p     (NextData_p),
        .NextData_n     (NextData_n),
        .NextClk_p      (NextClk_p),
        .NextClk_n      (NextClk_n),
        .PrevClk_p      (PrevClk_p),
        .PrevClk_n      (PrevClk_n)

    );

`endif


`ifdef ADD_BERT
//******************************************************************************
//                            Bit Error Rate Tester
//******************************************************************************

    reg bertSpace;
    always @* begin
        casex(addr)
            `BERT_SPACE:            bertSpace = cs;
            default:                bertSpace = 0;
            endcase
        end

    wire    [3:0]   bertSourceSelect;
    reg             bertClkEn;
    reg             bertDataIn;
    always @* begin
        casex (bertSourceSelect)
            default:   begin
                bertClkEn = stcBitEnOut;
                bertDataIn = stcBit;
            end
        endcase
    end

    wire    [31:0]  bertDout;
    bert_top bert(
        .reset(reset),
        .busClk(busClk),
        .cs(bertSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(bertDout),
        .clk(clk),
        .enable(bertClkEn),
        .data(bertDataIn),
        .inputSourceSelect(bertSourceSelect)
    );
`endif //ADD_BERT


//******************************************************************************
//                            Derandomizer
//******************************************************************************

    reg dualDecoderSpace;
    always @* begin
        casex(addr)
            `DUAL_DECODERSPACE:     dualDecoderSpace = cs;
            default:                dualDecoderSpace = 0;
        endcase
    end

    wire    [31:0]  dualDecDout;
    stcDerandomizer stcDerand (
        .reset(reset),
        .en(dualDecoderSpace),
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(dualDecDout),
        .clk(clk),
        .bitInputEn(stcBitEnOut),
        .bitInput(stcBitOut),
        .bitOutput(decBitOut)
    );

//                       Clock/Data Jitter Reduction
//******************************************************************************

    `ifdef R6100


    `else //R6100

    // SPI interface to the PLLs
    wire    [31:0]  pllDout;
    ics307Interface #(.SysclkDivider(4)) pllIntfc (
        .reset(reset),
        .busClk(busClk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(pllDout),
        .cs(cs),
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

    `endif //R6100

    //----------------------- Channel 0 Jitter Attenuation --------------------

    wire    [3:0]   cAndD0SourceSelect;
    reg             cAndD0ClkEn;
    reg     [2:0]   cAndD0DataIn;
    always @* begin
        casex (cAndD0SourceSelect)
            `CandD_SRC_STC: begin
                cAndD0ClkEn = stcBitEnOut;
                cAndD0DataIn = {decBitOut,2'b0};
            end
            default:   begin
                cAndD0ClkEn = stcBitEnOut;
                cAndD0DataIn = {decBitOut,2'b0};
            end
        endcase
    end

    wire    [2:0]   cAndD0DataOut;
    wire    [31:0]  cAndD0Dout;
    clkAndDataOutput #(.RegSpace(`CandD0SPACE)) cAndD0 (
        .clk(clk), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(cAndD0Dout),
        .clkEnIn(cAndD0ClkEn),
        .dataIn(cAndD0DataIn),
        .pllOutputClk(pll0_OUT1),
        .sourceSelect(cAndD0SourceSelect),
        .pllReferenceClk(pll0_REF),
        .outputClk(ch0ClkOut),
        .outputData(cAndD0DataOut)
    );
    assign ch0DataOut = cAndD0DataOut[2];
    assign ch2ClkOut = ch0ClkOut;
    assign ch2DataOut = cAndD0DataOut[2];

    //----------------------- Channel 1 Jitter Attenuation --------------------

    wire    [3:0]   cAndD1SourceSelect;
    reg             cAndD1ClkEn;
    reg     [2:0]   cAndD1DataIn;
    always @* begin
        casex (cAndD1SourceSelect)
            `CandD_SRC_STC: begin
                cAndD1ClkEn = stcBitEnOut;
                cAndD1DataIn = {decBitOut,2'b0};
            end
            default:   begin
                cAndD1ClkEn = stcBitEnOut;
                cAndD1DataIn = {decBitOut,2'b0};
            end
        endcase
    end

    wire    [2:0]   cAndD1DataOut;
    wire    [31:0]  cAndD1Dout;
    clkAndDataOutput #(.RegSpace(`CandD1SPACE)) cAndD1 (
        .clk(clk), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(cAndD1Dout),
        .clkEnIn(cAndD1ClkEn),
        .dataIn(cAndD1DataIn),
        .pllOutputClk(pll1_OUT1),
        .sourceSelect(cAndD1SourceSelect),
        .pllReferenceClk(pll1_REF),
        .outputClk(cAndD1ClkOut),
        .outputData(cAndD1DataOut)
    );
    assign ch1DataOut = cAndD1DataOut[2];
    assign ch1ClkOut = cAndD1ClkOut;
    assign ch3DataOut = cAndD1DataOut[2];
        `ifdef COMBINER
        assign ch3ClkOut = !bestSrcSel;
        `else
        assign ch3ClkOut = cAndD1ClkOut;
        `endif
//    assign ch1ClkOut = stcBitEnOut;
//    assign ch3DataOut = decBitOut;
//    assign ch3ClkOut = stcBitEnOut;

    assign          pll2_REF = 1'b0;
    assign          pll2_Data = 1'b0;
    assign          pll2_Clk = 1'b0;



//******************************************************************************
//                              Interpolators
//******************************************************************************
    reg     [17:0]  interp0DataIn;
    reg             interp0ClkEn;
    wire    [3:0]   dac0Source;
    always @(posedge clk) begin
        case (dac0Source)
            `DAC_SRC_DEMOD: begin
                interp0DataIn <= demodDac0Data;
                interp0ClkEn <= demodDac0ClkEn;
            end
            `DAC_SRC_STC: begin
                interp0DataIn <= stcDac0Data;
                interp0ClkEn <= stcDac0ClkEn;
            end
            default: begin
                interp0DataIn <= {pilotLagError,6'b0};
                interp0ClkEn <= 1'b1;
            end
        endcase
    end
    wire    [31:0]  interp0Dout;
    wire    [17:0]  interp0DataOut;
    //`define USE_INTERPOLATORS
    `ifdef USE_INTERPOLATORS
    interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) dac0Interp(
        .clk(clk), .reset(reset), .clkEn(interp0ClkEn),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp0Dout),
        .dataIn(interp0DataIn),
        .dacSource(dac0Source),
        .clkEnOut(),
        .dataOut(interp0DataOut)
        );
    always @(posedge clk) begin
        dac0_d[12:0] <= interp0DataOut[16:4];
        dac0_d[13] <= ~interp0DataOut[17];
    end

    `else //USE_INTERPOLATORS

    // Chip select decodes
    reg interp0CS;
    always @* begin
        casex (addr)
            `INTERP0SPACE: begin
                interp0CS = cs;
            end
            default: begin
                interp0CS = 0;
            end
        endcase
    end

    // Register interface
    interpRegs interpRegs0  (
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(interp0CS),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(interp0Dout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .bypass(),
        .test(),
        .invert(),
        .bypassEQ(),
        .source(dac0Source),
        .testValue(),
        .cicExponent(),
        .cicMantissa(),
        .gainExponent(),
        .gainMantissa()
    );

    always @(posedge clk) begin
        //dac0_d <= adc0Reg;
        dac0_d[12:0] <= interp0DataIn[16:4];
        dac0_d[13] <= ~interp0DataIn[17];
    end
    `endif

    reg     [17:0]  interp1DataIn;
    reg             interp1ClkEn;
    wire    [3:0]   dac1Source;
    always @(posedge clk) begin
        case (dac1Source)
            `DAC_SRC_DEMOD: begin
                interp1DataIn <= demodDac1Data;
                interp1ClkEn <= demodDac1ClkEn;
            end
            `DAC_SRC_STC: begin
                interp1DataIn <= stcDac1Data;
                interp1ClkEn <= stcDac1ClkEn;
            end
            default: begin
                interp1DataIn <= {1'b0,pilotFreqAcquired,16'b0};
                //interp1DataIn <= {1'b0,phaseDiffEn,16'b0};
                interp1ClkEn <= 1'b1;
            end
        endcase
    end
    wire    [31:0]  interp1Dout;
    wire    [17:0]  interp1DataOut;
    `ifdef USE_INTERPOLATORS
    interpolate #(.RegSpace(`INTERP1SPACE), .FirRegSpace(`VIDFIR1SPACE)) dac1Interp(
        .clk(clk), .reset(reset), .clkEn(interp1ClkEn),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp1Dout),
        .dataIn(interp1DataIn),
        .dacSource(dac1Source),
        .clkEnOut(),
        .dataOut(interp1DataOut)
        );
    always @(posedge clk) begin
        dac1_d[12:0] <= interp1DataOut[16:4];
        dac1_d[13] <= ~interp1DataOut[17];
    end

    `else //USE_INTERPOLATORS

    // Chip select decodes
    reg interp1CS;
    always @* begin
        casex (addr)
            `INTERP1SPACE: begin
                interp1CS = cs;
            end
            default: begin
                interp1CS = 0;
            end
        endcase
    end

    // Register interface
    interpRegs interpRegs1  (
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(interp1CS),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(interp1Dout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .bypass(),
        .test(),
        .invert(),
        .bypassEQ(),
        .source(dac1Source),
        .testValue(),
        .cicExponent(),
        .cicMantissa(),
        .gainExponent(),
        .gainMantissa()
    );

    always @(posedge clk) begin
        dac1_d[12:0] <= interp1DataIn[16:4];
        dac1_d[13] <= ~interp1DataIn[17];
    end
    `endif //USE_INTERPOLATORS

    `ifndef R6100
    reg     [17:0]  interp2DataIn;
    reg             interp2ClkEn;
    wire    [3:0]   dac2Source;
    always @(posedge clk) begin
        case (dac2Source)
            `DAC_SRC_DEMOD: begin
                interp2DataIn <= demodDac2Data;
                interp2ClkEn <= demodDac2ClkEn;
            end
            `DAC_SRC_STC: begin
                interp2DataIn <= stcDac2Data;
                interp2ClkEn <= stcDac2ClkEn;
            end
            default: begin
                interp2DataIn <= {1'b0,pilotFreqAcquired,16'b0};
                interp2ClkEn <= 1'b1;
            end
        endcase
    end
    wire    [31:0]  interp2Dout;
    wire    [17:0]  interp2DataOut;
    `ifdef USE_INTERPOLATORS
    interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) dac2Interp(
        .clk(clk), .reset(reset), .clkEn(interp2ClkEn),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp2Dout),
        .dataIn(interp2DataIn),
        .dacSource(dac2Source),
        .clkEnOut(),
        .dataOut(interp2DataOut)
        );
    always @(posedge clk) begin
        dac2_d[12:0] <= interp2DataOut[16:4];
        dac2_d[13] <= ~interp2DataOut[17];
    end

    `else //USE_INTERPOLATORS

    // Chip select decodes
    reg interp2CS;
    always @* begin
        casex (addr)
            `INTERP2SPACE: begin
                interp2CS = cs;
            end
            default: begin
                interp2CS = 0;
            end
        endcase
    end

    // Register interface
    interpRegs interpRegs2 (
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(interp2CS),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(interp2Dout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .bypass(),
        .test(),
        .invert(),
        .bypassEQ(),
        .source(dac2Source),
        .testValue(),
        .cicExponent(),
        .cicMantissa(),
        .gainExponent(),
        .gainMantissa()
    );

    always @(posedge clk) begin
        //dac2_d <= adc0Reg;
        dac2_d[12:0] <= interp2DataIn[16:4];
        dac2_d[13] <= ~interp2DataIn[17];
    end
    `endif  //USE_INTERPOLATORS

    `endif //not R6100


    assign dac0_clk = clk;
    assign dac1_clk = clk;
    `ifndef R6100
    assign dac2_clk = clk;
    `endif

//******************************************************************************
//                               Output Assignments
//******************************************************************************

    assign adc01_powerDown = 1'b0;

    assign dac_rst = 1'b1;
    assign dac_sclk = 1'b0;
    assign dac0_nCs = 1'b0;
    assign dac1_nCs = 1'b0;
    assign dac2_nCs = 1'b0;
    assign dac_sdio = 1'b0;

    assign lockLed0n = !pilotFound;
    assign lockLed1n = !pilotLocked;

    assign sdiOut = 1'b0;

    `ifdef R6100
/*
    `ifdef ADD_AM
    //******************************************************************************
    //                           AM ADC Interface
    //******************************************************************************
    wire    signed  [11:0]  amDataIn;
    ad7476Interface amAdc(
        .clk(clk),
        .reset(reset),
        .spiDin(amAdcDataIn),
        .spiClk(amAdcClk),
        .spiCSn(amAdcCSn),
        .adcData(amDataIn),
        .adcDataEn(amDataEn)
    );

    //******************************************************************************
    //                           AM DAC Interface
    //******************************************************************************
    max5352Interface amDac(
        .clk(clk),
        .reset(reset),
        .dacDataEn(amDataEn),
        .dacData(amDataIn),
        .spiDout(amDacDataOut),
        .spiClk(amDacClk),
        .spiCSn(amDacCSn)
    );
    `endif
*/
    //******************************************************************************
    //                          Video Switch Interface
    //******************************************************************************
        // For the NGR demod, there are 3 filter selects and two 50/75 switch drivers that replace videoOutSels
        wire    [2:0]   vid0Select;
        wire    [2:0]   vid1Select;
        wire    [2:0]   vid2Select;
        wire    [2:0]   vid3Select;
    wire    [31:0]  vsDout;
    vidSwitchRegs vsregs(
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(vsDout),
        .vid0Select(vid0Select),
        .vid1Select(vid1Select),
            .vid2Select(vid2Select),
            .vid3Select(vid3Select)
    );

        wire   ngrMode = vid3Select[0];

        assign video0InSelect = ngrMode ? {vid1Select[2], vid0Select[2]} : vid0Select[1:0]; // Sw_Vid_0_A[1:0]  Pin D18:D20
        assign video1InSelect = ngrMode ? vid2Select[1:0] : vid1Select[1:0];                // Sw_Vid_1_A[1:0]  Pin D14:D16

    always @* begin
            if (ngrMode) begin // NGR_DEMOD
                video0OutSelect = vid0Select[1:0];    // Sw_Filt_0_A0  Pin D26:D28
                video1OutSelect = vid1Select[1:0];    // Sw_Filt_1_A[1:0]  Pin D22, D24
                Sw50Ohm = vid2Select[2];    // Sw_50_Ohm, Sw_Vid_1_A[1:0] Pins D11, D14:D16
            end
            else begin  //Original R6080

            //This is to fix an error on the board layout
                case (vid0Select[1:0])
		            2'b00: begin
		                video0OutSelect = 2'b00;
		            end
		            2'b01: begin
		                video0OutSelect = 2'b10;
		            end
		            2'b10: begin
		                video0OutSelect = 2'b01;
		            end
		            2'b11: begin
		                video0OutSelect = 2'b11;
		            end
        		endcase
                case (vid1Select[1:0])
		            2'b00: begin
		                video1OutSelect = 2'b00;
		            end
		            2'b01: begin
		                video1OutSelect = 2'b10;
		            end
		            2'b10: begin
		                video1OutSelect = 2'b01;
		            end
		            2'b11: begin
		                video1OutSelect = 2'b11;
		            end
        		endcase
    		end
        end // NGR_DEMOD
    `endif //R6100


    `ifdef R6100

    //******************************************************************************
    //                           Processor Read Data Mux
    //******************************************************************************
    always @* begin
        casex(addr)
            `SEMCO_TOP_SPACE:   rd_mux = semcoTopDout;

            `ifdef ADD_SPI_GATEWAY
            `SPIGW_SPACE:       rd_mux = spiGatewayDout;
            `endif

            `STC_DEMOD_SPACE:   rd_mux = stcDout;

            `DEMODSPACE,
            `DDCSPACE,
            `DDCFIRSPACE,
            `CICDECSPACE,
            `RESAMPSPACE,
            `BITSYNCSPACE,
            `CARRIERSPACE,
            `CHAGCSPACE :       rd_mux = demodDout;

            `PILOT_LF_SPACE:    rd_mux = pilotDout;

            `DUAL_DECODERSPACE: rd_mux = dualDecDout;

            `VIDFIR0SPACE,
            `INTERP0SPACE:      rd_mux = interp0Dout;

            `VIDFIR1SPACE,
            `INTERP1SPACE:      rd_mux = interp1Dout;

            `CandD0SPACE:       rd_mux = cAndD0Dout;
            `CandD1SPACE:       rd_mux = cAndD1Dout;

            `VIDSWITCHSPACE:    rd_mux = vsDout;


            `ifdef ADD_BERT
            `BERT_SPACE:        rd_mux = bertDout;
            `endif

            `ifdef COMBINER_DISTORT
             `COMBINER_SPACE:   rd_mux = combDataOut;
             `endif
            `ifdef COMBINER
             `COMBINER_SPACE:   rd_mux = combDataOut;
             `endif

             default :          rd_mux = 32'hxxxx;
        endcase
    end

    `else //R6100

    //******************************************************************************
    //                           Processor Read Data Mux
    //******************************************************************************
    reg [15:0] rd_mux;
    always @* begin
        casex(addr)
            `SEMCO_TOP_SPACE:   begin
                if (addr[1]) begin
                    rd_mux = semcoTopDout[31:16];
                end
                else begin
                    rd_mux = semcoTopDout[15:0];
                end
            end
            `ifdef ADD_SPI_GATEWAY
            `SPIGW_SPACE:       begin
                if (addr[1]) begin
                    rd_mux = spiGatewayDout[31:16];
                end
                else begin
                    rd_mux = spiGatewayDout[15:0];
                end
            end
            `endif

            `STC_DEMOD_SPACE:   begin
                if (addr[1]) begin
                    rd_mux = stcDout[31:16];
                end
                else begin
                    rd_mux = stcDout[15:0];
                end
            end

            `DEMODSPACE,
            `DDCSPACE,
            `DDCFIRSPACE,
            `CICDECSPACE,
            `RESAMPSPACE,
            `BITSYNCSPACE,
            `CARRIERSPACE,
            `CHAGCSPACE : begin
                if (addr[1]) begin
                    rd_mux = demodDout[31:16];
                end
                else begin
                    rd_mux = demodDout[15:0];
                end
            end

            `PILOT_LF_SPACE: begin
                if (addr[1]) begin
                    rd_mux = pilotDout[31:16];
                end
                else begin
                    rd_mux = pilotDout[15:0];
                end
            end

            `DUAL_DECODERSPACE: begin
                if (addr[1]) begin
                    rd_mux = dualDecDout[31:16];
                end
                else begin
                    rd_mux = dualDecDout[15:0];
                end
            end

            `VIDFIR0SPACE,
            `INTERP0SPACE: begin
                if (addr[1]) begin
                    rd_mux = interp0Dout[31:16];
                end
                else begin
                    rd_mux = interp0Dout[15:0];
                end
            end
             `VIDFIR1SPACE,
             `INTERP1SPACE: begin
                if (addr[1]) begin
                    rd_mux = interp1Dout[31:16];
                end
                else begin
                    rd_mux = interp1Dout[15:0];
                end
            end
             `VIDFIR2SPACE,
             `INTERP2SPACE: begin
                if (addr[1]) begin
                    rd_mux = interp2Dout[31:16];
                end
                else begin
                    rd_mux = interp2Dout[15:0];
                end
            end
            `CandD0SPACE: begin
                if (addr[1]) begin
                    rd_mux = cAndD0Dout[31:16];
                end
                else begin
                    rd_mux = cAndD0Dout[15:0];
                end
            end
            `CandD1SPACE: begin
                if (addr[1]) begin
                    rd_mux = cAndD1Dout[31:16];
                end
                else begin
                    rd_mux = cAndD1Dout[15:0];
                end
            end
            `PLL0SPACE,
            `PLL1SPACE,
            `PLL2SPACE: begin
                if (addr[1]) begin
                    rd_mux = pllDout[31:16];
                    end
                else begin
                    rd_mux = pllDout[15:0];
                    end
                end

            `ifdef COMBINER
             `COMBINER_SPACE:   begin
                if (addr[1]) begin
                    rd_mux = combDataOut[31:16];
                end
                else begin
                    rd_mux = combDataOut[15:0];
                end
             end
             `endif

            `ifdef ADD_BERT
            `BERT_SPACE:        begin
                if (addr[1]) begin
                    rd_mux = bertDout[31:16];
                end
                else begin
                    rd_mux = bertDout[15:0];
                end
            end
            `endif

            `ifdef COMBINER_DISTORT
             `COMBINER_SPACE:   begin
                if (addr[1]) begin
                    rd_mux = combDataOut[31:16];
                end
                else begin
                    rd_mux = combDataOut[15:0];
                end
             end
             `endif

             default : rd_mux = 16'hxxxx;
            endcase
         end

    assign fb_data = (cs & rd) ? rd_mux : 16'hzzzz;

    `endif //R6100


endmodule

