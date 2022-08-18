/*
    This is the top module for BS1000 and R6100 flavors of demods and thus
    needs some configuration to accomplish the desired results. All variations
    are controlled by setting defines in the Vivado Verilog Options GUI. Click
    on Settings, General, Verilog Options and add/remove Defines as needed.
    TRIPLE_DEMOD builds the R6100 board from the tripleDemod.xpr project. This define
    also adds the following options in the addressMap.v file.
        `ifdef TRIPLE_DEMOD
        `define SEMCO_DEMOD
        `define ADD_FRAMER
        `define ADD_BITSYNC
        `define ADD_MULTIBOOT
        `define ADD_SPECTRAL_SWEEP
        `define R6100
        `endif

    ADD_PN_GEN includes the PN Generator
    NO_LDPC_ENC turns off the LDPC encoder since it won't fit with ADD_PN_GEN
    COMBINER turns the I/Os to inputs for the combiner
    ADD_SPI_GATEWAY turns on the SPI Flash signals. TRIPLE_DEMOD
    ADD_LDPC turns on the LDPC module
    ADD_VITERBI
    ADD_TRELLIS
    ADD_MULTIH
    ADD_DQM

    NOTE ALSO, the combiner is built on a 7k325 vs the 7k160 of the rest. The
    "Project Part" will need modified when changing configurations and then
    the IPs will need updating to the new part.
*/

`timescale 1ns/100ps
`define TRIPLE_DEMOD
`define COMBINER
`define ADD_PN_GEN
`define NO_LDPC_ENC
`define USE_VIVADO_CORES
`include "addressMap.v"

module semcoDemodTopComb (

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

        // AM ADC Interface
        input               amAdcDataIn,
        output              amAdcClk,
        output              amAdcCSn,

        // AM DAC Interface
        output              amDacDataOut,
        output              amDacClk,
        output              amDacCSn,

        // Video Switch Select Lines
        output      [1:0]   video0InSelect,
        output reg  [1:0]   video0OutSelect,
        output      [1:0]   video1InSelect,
        output reg  [1:0]   video1OutSelect,

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
        output               Sw50Ohm,
        input                FPGA_ID0, FPGA_ID1,

       `ifdef COMBINER  // both sides need these signals
            input  [4:0]        PrevData_p,
                                PrevData_n,
                                NextData_p,
                                NextData_n,
            input               NextClk_p,
                                NextClk_n,
                                PrevClk_p,
                                PrevClk_n,
        `else // combiner

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

        inout    [40:1]     SideCar,

        // SDI Output
        output              sdiOut,
        output              DQMOut

    `else   //R6100

        // SDI Output
        output              sdiOut

    `endif //R6100
);

    parameter VER_NUMBER = 16'd801; // bogus value till finalized

//******************************************************************************
//                          Clock Distribution
//******************************************************************************
    `ifdef R6100
    systemClock systemClock (
        .clk_in1(adc0Clk),
        .clk_out1(clk),
        .clk2x(clk2x),
        .clkOver2(clkOver2),
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
        .clk_out1(clk),
        .locked(clkLocked)
     );

    flexbusClock flexbusClock (
        .clk_in1(fbClk),
        .clk_out1(busClk),
        .locked(fbClkLocked)
    );
    `endif //R6100




    `ifdef R6100
//******************************************************************************
//                            SPI Config Interface
//******************************************************************************
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

//******************************************************************************
//                            Bus Interface
//******************************************************************************
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
//******************************************************************************
//                          SPI Flash Interface
//******************************************************************************
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
    always @(posedge clk) begin
        adc0Reg <= adc0;
        adc0In <= $signed({~adc0Reg[13],adc0Reg[12:0],4'b0});
    end



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
        .reset(reset),
        .reboot(reboot),
        .rebootAddress(boot_addr),
        .dac0InputSelect(),
        .dac1InputSelect(),
        .dac2InputSelect(),
        .ch0MuxSelect(),
        .ch1MuxSelect(),
        .pngenEnable(pngenEnable),
        .framerEnable(framerEnable)
    );

`ifdef ADD_MULTIBOOT
//******************************************************************************
//                           Multiboot Controller
//******************************************************************************

    multibootK7 multiboot(
        .clk(clk),
        .pulse(reboot),
        .addr(boot_addr),
        .reset(reset)
    );

`endif //ADD_MULTIBOOT



//******************************************************************************
//                          Combiner/BitSync Interface
//******************************************************************************
        wire    [13:0]  bsAdc;
        wire            bsAdc_overflow, bsAdc_powerDown, bsHighImpedance, bsSingleEnded,
                        bsDacSELn, bsDacSCLK, bsDacMOSI, IF_BS_n;
        wire            reset = spiCSn;

    wire    signed  [17:0]  iBB, qBB;
    wire                    bbClkEn;

    reg         [17:0]  DdsData;
    wire                DdsIO_Reset, DdsTxEn, DdsIO_Update, DdsReset,
                        DdsCS_n, DdsSClk, DdsMosi, DdsMiso,
                        SideCarClk, DdsSyncClk, clk, clk2x, clkOver2;
/*
        assign bsAdc[13] = !IF_BS_n ? SideCar[4]  : 1'b0;
        assign bsAdc[12] = !IF_BS_n ? SideCar[6]  : 1'b0;
        assign bsAdc[11] = !IF_BS_n ? SideCar[8]  : 1'b0;
        assign bsAdc[10] = !IF_BS_n ? SideCar[10] : 1'b0;
        assign bsAdc[9]  = !IF_BS_n ? SideCar[12] : 1'b0;
        assign bsAdc[8]  = !IF_BS_n ? SideCar[14] : 1'b0;
        assign bsAdc[7]  = !IF_BS_n ? SideCar[16] : 1'b0;
        assign bsAdc[6]  = !IF_BS_n ? SideCar[18] : 1'b0;
        assign bsAdc[5]  = !IF_BS_n ? SideCar[20] : 1'b0;
        assign bsAdc[4]  = !IF_BS_n ? SideCar[22] : 1'b0;
        assign bsAdc[3]  = !IF_BS_n ? SideCar[24] : 1'b0;
        assign bsAdc[2]  = !IF_BS_n ? SideCar[26] : 1'b0;
        assign bsAdc[1]  = !IF_BS_n ? SideCar[28] : 1'b0;
        assign bsAdc[0]  = !IF_BS_n ? SideCar[30] : 1'b0;

        assign SideCar[2]  = IF_BS_n;
        assign SideCar[4]  = IF_BS_n ? DdsData[17]  : 1'bz;
        assign SideCar[6]  = IF_BS_n ? DdsData[16]  : 1'bz;
        assign SideCar[8]  = IF_BS_n ? DdsData[15]  : 1'bz;
        assign SideCar[10] = IF_BS_n ? DdsData[14]  : 1'bz;
        assign SideCar[12] = IF_BS_n ? DdsData[13]  : 1'bz;
        assign SideCar[14] = IF_BS_n ? DdsData[12]  : 1'bz;
        assign SideCar[16] = IF_BS_n ? DdsData[11]  : 1'bz;
        assign SideCar[18] = IF_BS_n ? DdsData[10]  : 1'bz;
        assign SideCar[20] = IF_BS_n ? DdsData[9]   : 1'bz;
        assign SideCar[22] = IF_BS_n ? DdsData[8]   : 1'bz;
        assign SideCar[24] = IF_BS_n ? DdsData[7]   : 1'bz;
        assign SideCar[26] = IF_BS_n ? DdsData[6]   : 1'bz;
        assign SideCar[28] = IF_BS_n ? DdsData[5]   : 1'bz;
        assign SideCar[30] = IF_BS_n ? DdsData[4]   : 1'bz;
        assign SideCar[34] = IF_BS_n ? DdsData[3]   : 1'bz;
        assign SideCar[36] = IF_BS_n ? DdsData[2]   : 1'bz;
        assign SideCar[38] = IF_BS_n ? DdsData[1]   : 1'bz;
        assign SideCar[40] = IF_BS_n ? DdsData[0]   : bsHighImpedance;

        assign SideCar[11] = IF_BS_n ? DdsIO_Reset  : bsAdc_powerDown;
        assign SideCar[15] = IF_BS_n ? 1'b1         : 1'bz;
        assign SideCar[19] = IF_BS_n ? DdsIO_Update : 1'bz;
        assign SideCar[21] = IF_BS_n ? DdsReset     : 1'bz;
        assign SideCar[23] = IF_BS_n ? DdsCS_n      : bsDacSELn;
        assign SideCar[25] = IF_BS_n ? DdsSClk      : bsDacSCLK;
        assign SideCar[27] = IF_BS_n ? DdsMosi      : bsDacMOSI;
        assign SideCar[29] = IF_BS_n ? 1'bz         : bsSingleEnded;
        assign DdsMiso = SideCar[29];
        assign bsAdc_overflow = 1'b0;   // this signal isn't connected in bs/combiner board
        assign SideCarClk = SideCar[32];
        assign DdsSyncClk = !IF_BS_n ? SideCar[17] : 1'b0;
        assign IF_BS_n    = !Vio9[0];
*/
    `ifdef COMBINER
        wire    [4:0]   PrevData, NextData;
        genvar n;
        generate
            for (n=0; n<5; n=n+1)
            begin: Input1Buffers
                IBUFDS # (
                    .DIFF_TERM     ("TRUE"), // Differential Termination
                    .IBUF_LOW_PWR  ("FALSE"),// Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
                    .IOSTANDARD    ("LVDS")
                    )
                    DataBuf1
                    (
                        .I  (NextData_p[n]),
                        .IB (NextData_n[n]),
                        .O  (NextData[n])
                    );

                IBUFDS # (
                    .DIFF_TERM     ("TRUE"), // Differential Termination
                    .IBUF_LOW_PWR  ("FALSE"),// Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
                    .IOSTANDARD    ("LVDS"))
                    DataBuf2
                    (
                        .I  (PrevData_p[n]),
                        .IB (PrevData_n[n]),
                        .O  (PrevData[n])
                    );
            end
        endgenerate

        IBUFDS #(
            .DIFF_TERM     ("TRUE"), // Differential Termination
            .IBUF_LOW_PWR  ("FALSE"),// Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            .IOSTANDARD    ("LVDS"))
            ClkBuf1
            (
                .I  (NextClk_p),
                .IB (NextClk_n),
                .O  (NextClk )
            );

        IBUFDS #(
            .DIFF_TERM     ("TRUE"), // Differential Termination
            .IBUF_LOW_PWR  ("FALSE"),// Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            .IOSTANDARD    ("LVDS"))
            ClkBuf2
            (
                .I  (PrevClk_p),
                .IB (PrevClk_n),
                .O  (PrevClk)
            );

        wire            [7:0]   DataOut10, DataOut11, DataOut12, DataOut13, DataOut14,
                                DataOut20, DataOut21, DataOut22, DataOut23, DataOut24;

        CombinerSerDesIn #(.PORTS(6)) SerDes_u
            (
            .Clk93M    (clk),
            .Reset     (!IF_BS_n || !FPGA_ID1 || reset),
            .ClkIn1    (NextClk),  // Next is Ch1
            .DataIn1   (NextData),
            .DataOut10 (DataOut10),
            .DataOut11 (DataOut11),
            .DataOut12 (DataOut12),
            .DataOut13 (DataOut13),
            .DataOut14 (DataOut14),
            .ClkIn2    (PrevClk),  // Prev is Ch2
            .DataIn2   (PrevData),
            .DataOut20 (DataOut20),
            .DataOut21 (DataOut21),
            .DataOut22 (DataOut22),
            .DataOut23 (DataOut23),
            .DataOut24 (DataOut24)
            );

        wire    [13:0]  Ch1Adc = {DataOut11[5:0], DataOut10};
        wire    [13:0]  Ch2Adc = {DataOut21[5:0], DataOut20};
        wire    [11:0]  Ch1Agc = {DataOut13[3:0], DataOut12};
        wire    [11:0]  Ch2Agc = {DataOut23[3:0], DataOut22};
        wire    [17:0]  LagCoef, LeadCoef, SweepRate, phase_detect,
                        MaxImagout, MaxRealout, MinImagout, ProbeOut2,
                        MinRealout, GainOutMax, GainOutMin,
                        Ch1Real, Ch1Imag, Ch2Real, Ch2Imag,
                        Ch1Adc17, Ch2Adc17, Ch1Diff, Ch2Diff;
        wire    [12:0]  RealLock, ImagLock;
        wire    [31:0]  lag_out;
        wire    [21:0]  nco_control_out;
        wire    [10:0]  abs_agc_diff;

        assign  lockLed0n = RealLock;
        assign  lockLed1n = ImagLock;


     dualQuadDdc preDdc    // Down convert incoming IFs to baseband, do both channels with same phase LO
         (
         .clk(clk),
         .reset(reset),
         .ifIn1(Ch1Adc),
         .ifIn2(Ch2Adc),
         .syncOut(),
         .iOut1(Ch1Real),
         .qOut1(Ch1Imag),
         .iOut2(Ch2Real),
         .qOut2(Ch2Imag)
         );

        reg combSpace;
        always @* begin
            casex(addr)
                `COMBINER_SPACE:    combSpace = cs;
                default:            combSpace = 0;
            endcase
        end
        DigitalCombiner Combiner
        (
            .clk            (clkOver2),
            .clk2x          (clk),
            .clk4x          (clk2x),
            .reset          (reset),
            .cs             (combSpace),
            .wr0            (wr0),
            .wr1            (wr1),
            .wr2            (wr2),
            .wr3            (wr3),
            .busClk         (busClk),
            .re1In          (Ch1Real),
            .im1In          (Ch1Imag),
            .re2In          (Ch2Real),
            .im2In          (Ch2Imag),
            .ch1agc         (Ch1agc),
            .ch2agc         (Ch2agc),
            .addr           (addr),
            .dataIn         (dataIn),
            .dataOut        (combDataOut),
            .maximagout     (),
            .maxrealout     (),
            .minimagout     (),
            .minrealout     (),
            .realout        (iBB),
            .imagout        (qBB),
            .ifOut          (),
            .gainoutmax		(),
            .gainoutmin		(),
            .phase_detect   (),
            .agc1_gt_agc2	(),
            .realxord		(),
            .imagxord		(),
            .combinerEn		(combinerEn),
            .locked		    (combLocked),
            .CarrierDetect	(CarrierDetect),
            .ifBS_n         (),
            .imaglock		(),
            .reallock       (),
            .lag_out        (),
            .nco_control_out(),
        );

/*
        PdClkMmcm DdsClkBufg (
            .clk_in1  (SideCarClk),
                .reset    (!IF_BS_n || !FPGA_ID1 || reset),
            .locked   (),
            .clk_out1 (DdsPdClkBufg),
            .clk_out2 (DdsPdClk2xBufg)
        );

            reg     [17:0]      RealCmbFF, ImagCmbFF, ImagCmbFFDly;
            always @ (posedge DdsPdClkBufg) begin
                RealCmbFF      <= iBB;
                ImagCmbFF      <= qBB;
                ImagCmbFFDly   <= ImagCmbFF;
            end

            always @ (posedge DdsPdClk2xBufg) begin
                if (DdsPdClkBufg) begin
                    DdsData <= ImagCmbFFDly;
                end
                else begin
                    DdsData <= RealCmbFF;
                end
            end
        `endif

       // The upconverter mixes R*R and I*I then adds, I*I is -1 so needs inverted

       AD9957 AD9957_u (
            .clk       (clk),
            .reset     (!IF_BS_n || !FPGA_ID1 || reset),
            .DdsMiso   (DdsMiso),
            .DdsMosi   (DdsMosi),
            .DdsCS_n   (DdsCS_n),
            .DdsClk    (DdsSClk),
            .IO_Reset  (DdsIO_Reset),
            .DdsReset  (DdsReset),
            .DdsUpdate (DdsIO_Update)
       );
*/
    `endif  // combiner


//******************************************************************************
//                          Legacy Demod
//******************************************************************************

    wire    signed  [17:0]  iDemodSymData;
    wire    signed  [17:0]  qDemodSymData;
    wire    signed  [17:0]  iTrellis,qTrellis;
    wire            [12:0]  mag;
    `ifdef ADD_LDPC
    wire    signed  [17:0]  iLdpc,qLdpc;
    `endif
    wire    signed  [3:0]   demodDac0Select,demodDac1Select,demodDac2Select;
    wire    signed  [17:0]  demodDac0Data,demodDac1Data,demodDac2Data;
    wire    signed  [4:0]   demodMode;
    wire asyncMode = ( (demodMode == `MODE_AQPSK)
                    || (demodMode == `MODE_AUQPSK)
                    );
    wire pcmTrellisMode = (demodMode == `MODE_PCMTRELLIS);
    wire multihMode = (demodMode == `MODE_MULTIH);
    wire    signed  [17:0]  iDemodEye,qDemodEye;
    wire            [4:0]   demodEyeOffset;
    wire            [31:0]  demodDout;
    demod demod(
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
        .bbClkEn(bbClkEn),
        .iBB(iBB), .qBB(qBB),       // if using the combiner, the RF input is ignored
        .iSym2xEn(iDemodSym2xEn),
        .iSymEn(iDemodSymEn),
        .iSymData(iDemodSymData),
        .iSymClk(iDemodSymClk),
        .iBitEn(iDemodBitEn),
        .iBit(iDemodBit),
        .qSym2xEn(qDemodSym2xEn),
        .qSymEn(qDemodSymEn),
        .qSymClk(qDemodSymClk),
        .qSymData(qDemodSymData),
        .qBitEn(qDemodBitEn),
        .qBit(qDemodBit),
        .auSymClk(auDemodSymClk),
        .auBit(auDemodBit),
        .timingLock(demodTimingLock),
        .carrierLock(demodCarrierLock),
        .trellisSymEn(trellisSymEn),
        .iTrellis(iTrellis),
        .qTrellis(qTrellis),
        `ifdef ADD_LDPC
        .iLdpcSymEn(iLdpcSymEn),.qLdpcSymEn(qLdpcSymEn),
        .iLdpc(iLdpc),
        .qLdpc(qLdpc),
        `endif
        `ifdef ADD_SUPERBAUD_TED
        .multihSymEnEven(trellisSymEnEven),
        `endif
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0Sync(demodDac0ClkEn),
        .dac0Data(demodDac0Data),
        .dac1Sync(demodDac1ClkEn),
        .dac1Data(demodDac1Data),
        .dac2Sync(demodDac2ClkEn),
        .dac2Data(demodDac2Data),
        .demodMode(demodMode),
        .mag(mag),
        .magClkEn(magClkEn),
        `ifdef ADD_SCPATH
        output                  enableScPath,
        output  signed  [17:0]  iBBOut, qBBOut,
        output                  bbClkEnOut,
        `endif
        `ifdef ADD_DESPREADER
        output                  iEpoch,qEpoch,
        `endif
        .sdiSymEn(demodSdiSymEn),
        .eyeSync(demodEyeClkEn),
        .iEye(iDemodEye),   .qEye(qDemodEye),
        .eyeOffset(demodEyeOffset)
    );

`ifdef ADD_BITSYNC
//******************************************************************************
//                    Standalone Single Channel Bitsync
//******************************************************************************
    reg             [13:0]  bsAdcReg;
    reg     signed  [17:0]  bsAdcIn;
    reg             [1:0]   bsAdcOverflowSR;
    wire                    bsAdcOverflow = bsAdcOverflowSR[1];
    always @(posedge clk) begin
        bsAdcReg <= bsAdc;
        bsAdcIn <= $signed({~bsAdcReg[13],bsAdcReg[12:0],4'b0});
        bsAdcOverflowSR <= {bsAdcOverflowSR[0],bsAdc_overflow};
    end

    wire    signed  [17:0]  sbsSymData;
    wire    signed  [17:0]  sbsDac0Data;
    wire    signed  [17:0]  sbsDac1Data;
    wire    signed  [17:0]  sbsDac2Data;
    wire    signed  [17:0]  sbsInputGain;
    wire    signed  [17:0]  sbsDcOffset;
    wire            [31:0]  sbsDout;
    singleBitsyncTop sbs(
        .clk(clk), .clkEn(1'b1), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(sbsDout),
        .rx(bsAdcIn),
        .rxSaturated(bsAdcOverflow),
        .rotation(2'b00),
        .lock(sbsLock),
        .sym2xEn(sbsSym2xEn),
        .symEn(sbsSymEn),
        .symData(sbsSymData),
        .symClk(sbsSymClk),
        .bitOutput(sbsBit),
        .dac0ClkEn(sbsDac0ClkEn),
        .dac0Data(sbsDac0Data),
        .dac1ClkEn(sbsDac1ClkEn),
        .dac1Data(sbsDac1Data),
        .dac2ClkEn(sbsDac2ClkEn),
        .dac2Data(sbsDac2Data),
        .highImpedance(bsHighImpedance),
        .singleEnded(bsSingleEnded),
        .gain(sbsInputGain),
        .dcOffset(sbsDcOffset)
    );

    //------------------------- AGC/DC Offset DAC Interfaces -------------------
    mcp48xxInterface dacInterface (
        .clk(clk),
        .clkEn0(sbsSymEn),
        .clkEn1(1'b0),
        .reset(reset),
        .dac0GainSelA(1'b1),
        .dac0GainSelB(1'b1),
        .dac0ValueA(sbsInputGain[17:6]),
        .dac0ValueB(sbsDcOffset[17:6]),
        .dac1GainSelA(1'b0),
        .dac1GainSelB(1'b0),
        .dac1ValueA(12'b0),
        .dac1ValueB(12'b0),
        .SCK(bsDacSCLK),
        .SDI(bsDacMOSI),
        .CS0n(bsDacSELn),
        .CS1n()
    );



`endif //ADD_BITSYNC


`ifdef ADD_VITERBI
//******************************************************************************
//                           Viterbi Decoders
//******************************************************************************
//
//  The viterbi was originally used in the bitsync bert card so there's a value
//  called bitsyncMode that doesn't exist in the legacy demod. We re-create it
//  here from demodMode so we don't have two versions of viterbi to support.
//

    reg         [1:0]   bitsyncMode;
    always @* begin
        case (demodMode)
            `MODE_QPSK:   bitsyncMode = `BS_MODE_DUAL_CH;
            `MODE_OQPSK:  bitsyncMode = `BS_MODE_OFFSET_CH;
            default:      bitsyncMode = `BS_MODE_IND_CH;
        endcase
    end

    wire    [31:0]  vitDout;
    viterbi viterbi(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(vitDout),
        .bitsyncMode(bitsyncMode),
        .ch0SymEn(iDemodSymEn),
        .ch0SymData(iDemodSymData),
        .ch1SymEn(qDemodSymEn),
        .ch1SymData(qDemodSymData),
        .ch0BitEnOut(ch0VitBitEn),
        .ch0BitOut(ch0VitBit),
        .ch1BitEnOut(ch1VitBitEn),
        .ch1BitOut(ch1VitBit)
        );
    reg                 ch0VitSym2xEn;
    reg                 ch1VitSym2xEn;
    always @* begin
        case (bitsyncMode)
            `BS_MODE_DUAL_CH,
            `BS_MODE_OFFSET_CH: begin
                ch0VitSym2xEn = iDemodSym2xEn;
                ch1VitSym2xEn = iDemodSym2xEn;
            end
            default: begin
                ch0VitSym2xEn = iDemodSymEn;
                ch1VitSym2xEn = qDemodSymEn;
            end
        endcase
    end
`endif //ADD_VITERBI


`ifdef ADD_TRELLIS
//******************************************************************************
//                        PCMFM Trellis Decoder
//******************************************************************************

    reg                     pcmSymEn;
    reg                     pcmSym2xEn;
    reg     signed  [17:0]  iPcmIn,qPcmIn;
    always @(posedge clk) begin
        pcmSymEn <= trellisSymEn & pcmTrellisMode;
        pcmSym2xEn <= iDemodSym2xEn & pcmTrellisMode;
        iPcmIn <= iTrellis;
        qPcmIn <= qTrellis;
    end

    wire            [17:0]  pcmDac0Data;
    wire            [17:0]  pcmDac1Data;
    wire            [17:0]  pcmDac2Data;
    wire            [31:0]  trellisDout;
    trellis pcmTrellis(
        .clk(clk), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(trellisDout),
        .symEn(pcmSymEn),
        .sym2xEn(pcmSym2xEn),
        .iIn(iPcmIn),.qIn(qPcmIn),
        .legacyBit(iDemodBit),
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0ClkEn(pcmDac0ClkEn),
        .dac0Data(pcmDac0Data),
        .dac1ClkEn(pcmDac1ClkEn),
        .dac1Data(pcmDac1Data),
        .dac2ClkEn(pcmDac2ClkEn),
        .dac2Data(pcmDac2Data),
        .decision(pcmTrellisBit),
        .symEnOut(pcmTrellisSymEnOut),
        .sym2xEnOut(pcmTrellisSym2xEnOut),
        .oneOrZeroPredecessor()
    );
`endif //ADD_TRELLIS

`ifdef ADD_MULTIH
//******************************************************************************
//                          Multih Trellis Decoder
//******************************************************************************
    wire    [1:0]   multihBit;
    wire    [17:0]  multih0Out,multih1Out,multih2Out;
    wire    [31:0]  multihDout;
    trellisMultiH multih (
        .clk(clk),
        .reset(reset),
        .symEnEvenIn(trellisSymEnEven & multihMode),
        .symEnIn(trellisSymEn & multihMode),
        .sym2xEnIn(iDemodSym2xEn & multihMode),
        .iIn(iTrellis),
        .qIn(qTrellis),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(multihDout),
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0ClkEn(multih0ClkEn),
        .dac0Data(multih0Out),
        .dac1ClkEn(multih1ClkEn),
        .dac1Data(multih1Out),
        .dac2ClkEn(multih2ClkEn),
        .dac2Data(multih2Out),
        `ifndef EMBED_MULTIH_CARRIER_LOOP
        .phaseError(),
        .phaseErrorEn(),
        .phaseErrorValid(),
        `else
        .multihCarrierLock(multihCarrierLock),
        `endif
        .symEnOut(multihSymEnOut),
        .sym2xEnOut(multihSym2xEnOut),
        .decision(multihBit)
    );

    //`define BYPASS_MULTIH_DECODER
    `ifdef BYPASS_MULTIH_DECODER
    reg multihDataOut;
    reg multihClkOut;
    always @(posedge clk) begin
        if (multihSym2xEnOut) begin
            multihClkOut <= 1;
            if (multihSymEnOut) begin
                multihDataOut <= multihBit[1];
            end
            else begin
                multihDataOut <= multihBit[0];
            end
        end
        else begin
            multihClkOut <= 0;
        end
    end
    `endif

    `ifndef EMBED_MULTIH_CARRIER_LOOP
    wire multihCarrierLock = 1'b1;
    `endif

    wire    timingLock = demodTimingLock;
    wire    carrierLock = multihMode ? multihCarrierLock : demodCarrierLock;
`else //ADD_MULTIH

    wire    timingLock = demodTimingLock;
    wire    carrierLock = demodCarrierLock;

`endif //ADD_MULTIH

`ifdef ADD_LDPC
//******************************************************************************
//                              LDPC Decoder
//******************************************************************************
    wire            [17:0]  ldpcDac0Data;
    wire            [17:0]  ldpcDac1Data;
    wire            [17:0]  ldpcDac2Data;
    wire            [31:0]  ldpcDout;
    ldpc #(.LDPCBITS(7)) ldpc(
        .clk(clk), .clkEn(iDemodSym2xEn), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(ldpcDout),
        .iSymEn(iLdpcSymEn),
        .iSymData(iLdpc),
        .qSymEn(qLdpcSymEn),
        .qSymData(qLdpc),
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0ClkEn(ldpcDac0ClkEn),
        .dac0Data(ldpcDac0Data),
        .dac1ClkEn(ldpcDac1ClkEn),
        .dac1Data(ldpcDac1Data),
        .dac2ClkEn(ldpcDac2ClkEn),
        .dac2Data(ldpcDac2Data),
        .ldpcBitEnOut(ldpcBitEnOut),
        .ldpcBitOut(ldpcBitOut)
    );
`endif


`ifdef ADD_FRAMER
//******************************************************************************
//                        QPSK/OQPSK Ambiguity Removal
//******************************************************************************

    wire    [1:0]   rotation;
    reg             iRotBit,qRotBit,qDemodBitDelay;
    always @(posedge clk) begin
        case (demodMode)
            `MODE_QPSK: begin
                if (iDemodBitEn) begin
                    case (rotation)
                        0: begin
                            iRotBit <= iDemodBit;
                            qRotBit <= qDemodBit;
                        end
                        1: begin
                            iRotBit <= qDemodBit;
                            qRotBit <= ~iDemodBit;
                        end
                        2: begin
                            iRotBit <= ~iDemodBit;
                            qRotBit <= ~qDemodBit;
                        end
                        3: begin
                            iRotBit <= ~qDemodBit;
                            qRotBit <= iDemodBit;
                        end
                    endcase
                end
            end
            `MODE_OQPSK: begin
                if (iDemodBitEn) begin
                    qDemodBitDelay <= qDemodBit;
                    case (rotation)
                        0: begin
                            iRotBit <= iDemodBit;
                            qRotBit <= qDemodBit;
                        end
                        1: begin
                            iRotBit <= qDemodBitDelay;
                            qRotBit <= ~iDemodBit;
                        end
                        2: begin
                            iRotBit <= ~iDemodBit;
                            qRotBit <= ~qDemodBit;
                        end
                        3: begin
                            iRotBit <= ~qDemodBitDelay;
                            qRotBit <= iDemodBit;
                        end
                    endcase
                end
            end
            default: begin
                if (iDemodBitEn) begin
                    iRotBit <= iDemodBit;
                end
                if (qDemodBitEn) begin
                    qRotBit <= qDemodBit;
                end
            end
        endcase
    end
`endif //ADD_FRAMER


//******************************************************************************
//                                PCM Decoders
//******************************************************************************
    reg dualDecoderSpace;
    always @* begin
        casex(addr)
            `DUAL_DECODERSPACE:     dualDecoderSpace = cs;
            default:                dualDecoderSpace = 0;
        endcase
    end

    wire        [2:0]   dualSrcSelect;
    reg                 dualCh0Input;
    reg                 dualCh1Input;
    reg                 dualSymEn;
    reg                 dualSym2xEn;
    always @(posedge clk) begin
        case (dualSrcSelect)
            `ifdef ADD_VITERBI
            `DEC_SRC_VITERBI: begin
                dualCh0Input <= ch0VitBit;
                dualCh1Input <= ch0VitBit;
                dualSymEn <= ch0VitBitEn;
                dualSym2xEn <= ch0VitSym2xEn;
            end
            `endif //ADD_VITERBI
            default: begin
                `ifdef ADD_TRELLIS
                if (pcmTrellisMode) begin
                    dualCh0Input <= pcmTrellisBit;
                    dualCh1Input <= pcmTrellisBit;
                    dualSymEn <= pcmTrellisSymEnOut;
                    dualSym2xEn <= pcmTrellisSym2xEnOut;
                end
                `ifdef ADD_MULTIH
                else if (multihMode) begin
                    dualCh0Input <= multihBit[0];
                    dualCh1Input <= multihBit[1];
                    dualSymEn <= multihSymEnOut;
                    dualSym2xEn <= multihSym2xEnOut;
                end
                `endif
                else begin
                    `ifdef ADD_FRAMER
                    dualCh0Input <= iRotBit;
                    dualCh1Input <= qRotBit;
                    dualSymEn <= iDemodBitEn;
                    dualSym2xEn <= iDemodSym2xEn;
                    `else //ADD_FRAMER
                    dualCh0Input <= iDemodBit;
                    dualCh1Input <= qDemodBit;
                    dualSymEn <= iDemodBitEn;
                    dualSym2xEn <= iDemodSym2xEn;
                    `endif //ADD_FRAMER
                end

                `else //ADD_TRELLIS

                `ifdef ADD_FRAMER
                dualCh0Input <= iRotBit;
                dualCh1Input <= qRotBit;
                dualSymEn <= iDemodBitEn;
                dualSym2xEn <= iDemodSym2xEn;
                `else //ADD_FRAMER
                dualCh0Input <= iDemodBit;
                dualCh1Input <= qDemodBit;
                dualSymEn <= iDemodBitEn;
                dualSym2xEn <= iDemodSym2xEn;
                `endif //ADD_FRAMER

                `endif //ADD_TRELLIS
            end
        endcase
    end

    wire    [31:0]  dualDecDout;
    decoder dualDecoder
    (
        .clk(clk),
        .reset(reset),
        .en(dualDecoderSpace),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(dualDecDout),
        .symb_clk_en(dualSymEn),          // symbol rate clock enable
        .symb_clk_2x_en(dualSym2xEn),     // 2x symbol rate clock enable
        .symb_i(dualCh0Input),            // data input,
        .symb_q(dualCh1Input),            // data input,
        .dout_i(dualDataI),
        .dout_q(dualDataQ),
        .outputClkEn(dualPcmClkEn),
        .fifo_reset(),
        .clkPhase(),
        .symb_clk(dualPcmSymClk),
        .inputSelect(dualSrcSelect)
    );

    reg ch1DecoderSpace;
    always @* begin
        casex(addr)
            `CH1_DECODERSPACE:      ch1DecoderSpace = cs;
            default:                ch1DecoderSpace = 0;
        endcase
    end

    wire        [2:0]   pcmSrcSelect;
    reg                 ch1DecInput;
    reg                 ch1DecSymEn;
    reg                 ch1DecSym2xEn;
    always @(posedge clk) begin
        case (pcmSrcSelect)
            `ifdef ADD_BITSYNC
            `DEC_SRC_SBS: begin
                ch1DecInput <= sbsBit;
                ch1DecSymEn <= sbsSymEn;
                ch1DecSym2xEn <= sbsSym2xEn;
            end
            `endif
            `ifdef ADD_LDPC
            `DEC_SRC_LDPC: begin
                ch1DecInput <= ldpcBitOut;
                ch1DecSymEn <= ldpcBitEnOut;
                ch1DecSym2xEn <= 1'b1;
            end
            `endif
            `ifdef ADD_VITERBI
            `DEC_SRC_VITERBI: begin
                ch1DecInput <= ch1VitBit;
                ch1DecSymEn <= ch1VitBitEn;
                ch1DecSym2xEn <= ch1VitSym2xEn;
            end
            `endif //ADD_VITERBI
            default: begin
                ch1DecInput <= qDemodBit;
                ch1DecSymEn <= qDemodBitEn;
                ch1DecSym2xEn <= qDemodSym2xEn;
            end
        endcase
    end


    wire    [31:0]  ch1DecDout;
    pcmDecoder dec1 (
        .clk(clk),
        .reset(reset),
        .busClk(busClk),
        .en(ch1DecoderSpace),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(ch1DecDout),
        .symb_clk_en(ch1DecSymEn),        // symbol rate clock enable
        .symb_clk_2x_en(ch1DecSym2xEn),   // 2x symbol rate clock enable
        .symb(ch1DecInput),               // data input,
        .data_out(ch1PcmData),            // data output
        .clkEn_out(ch1PcmClkEn),          // clk output
        .fifo_reset(),
        .clkPhase(),
        .symb_clk(ch1PcmSymClk),
        .inputSelect(pcmSrcSelect)
    );


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
            `BERT_SRC_LEGACY_I: begin
                `ifdef ADD_FRAMER
                bertClkEn = iDemodBitEn;
                bertDataIn = iRotBit;
                `else
                bertClkEn = iDemodBitEn;
                bertDataIn = iDemodBit;
                `endif
            end
            `BERT_SRC_LEGACY_Q: begin
                `ifdef ADD_FRAMER
                bertClkEn = qDemodBitEn;
                bertDataIn = qRotBit;
                `else
                bertClkEn = qDemodBitEn;
                bertDataIn = qDemodBit;
                `endif
            end
            `ifdef ADD_TRELLIS
            `BERT_SRC_PCMTRELLIS: begin
                bertClkEn = pcmTrellisSymEnOut;
                bertDataIn = pcmTrellisBit;
            end
            `endif
            `ifdef ADD_LDPC
            `BERT_SRC_LDPC: begin
                bertClkEn = ldpcBitEnOut;
                bertDataIn = ldpcBitOut;
            end
            `endif
            `BERT_SRC_DEC0_CH0: begin
                bertClkEn = dualPcmClkEn;
                bertDataIn = dualDataI;
            end
            `BERT_SRC_DEC0_CH1: begin
                bertClkEn = dualPcmClkEn;
                bertDataIn = dualDataQ;
            end
            `BERT_SRC_DEC1_CH0: begin
                bertClkEn = ch1PcmClkEn;
                bertDataIn = ch1PcmData;
            end
            //`BERT_SRC_DEC1_CH1:
            //`BERT_SRC_DEC2_CH0:
            //`BERT_SRC_DEC2_CH1:
            //`BERT_SRC_DEC3_CH0:
            //`BERT_SRC_DEC3_CH1:
            default:   begin
                bertClkEn = iDemodBitEn;
                bertDataIn = iDemodBit;
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

`ifdef ADD_FRAMER
//******************************************************************************
//                               Framer
//******************************************************************************

    wire    [3:0]   framerSourceSelect;
    reg             framerClkEn;
    reg             framerDataIn;
    always @* begin
        casex (framerSourceSelect)
            `FRAMER_SRC_LEGACY_I: begin
                `ifdef ADD_FRAMER
                framerClkEn = iDemodBitEn;
                framerDataIn = iRotBit;
                `else
                framerClkEn = iDemodBitEn;
                framerDataIn = iDemodBit;
                `endif
            end
            `FRAMER_SRC_LEGACY_Q: begin
                `ifdef ADD_FRAMER
                framerClkEn = qDemodBitEn;
                framerDataIn = qRotBit;
                `else
                framerClkEn = qDemodBitEn;
                framerDataIn = qDemodBit;
                `endif
            end
            `ifdef ADD_TRELLIS
            `FRAMER_SRC_PCMTRELLIS: begin
                framerClkEn = pcmTrellisSymEnOut;
                framerDataIn = pcmTrellisBit;
            end
            `endif
            `ifdef ADD_LDPC
            `FRAMER_SRC_LDPC: begin
                framerClkEn = ldpcBitEnOut;
                framerDataIn = ldpcBitOut;
            end
            `endif
            `FRAMER_SRC_DEC0_CH0: begin
                framerClkEn = dualPcmClkEn;
                framerDataIn = dualDataI;
            end
            `FRAMER_SRC_DEC0_CH1: begin
                framerClkEn = dualPcmClkEn;
                framerDataIn = dualDataQ;
            end
            `FRAMER_SRC_DEC1_CH0: begin
                framerClkEn = ch1PcmClkEn;
                framerDataIn = ch1PcmData;
            end
            //`FRAMER_SRC_DEC1_CH1:
            //`FRAMER_SRC_DEC2_CH0:
            //`FRAMER_SRC_DEC2_CH1:
            //`FRAMER_SRC_DEC3_CH0:
            //`FRAMER_SRC_DEC3_CH1:
            default:   begin
                framerClkEn = iDemodBitEn;
                framerDataIn = iDemodBit;
            end
        endcase
    end

    wire    [1:0]   framerRotation;
    wire    [31:0]  framerDout;
    framerTop framer(
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(framerDout),
        .clk(clk),
        .clkEn(framerClkEn),
        .dataBitIn(framerDataIn),
        .rotation(framerRotation),
        .inputSourceSelect(framerSourceSelect),
        .framesyncPulse(framer_Sync),
        .framedBitOut(framerBitOut),
        .framesync(framesync)
    );

    assign rotation = framerEnable ? framerRotation : 2'b0;
`endif //ADD_FRAMER



`ifdef ADD_DQM
//******************************************************************************
//                                   DQM
//******************************************************************************
    wire    [3:0]   dqmSourceSelect;
    reg             dqmBitEnIn;
    reg             dqmBitIn;
    always @(posedge clk) begin
        casex (dqmSourceSelect)
            `ifdef ADD_TRELLIS
            `DQM_SRC_PCMTRELLIS: begin
                dqmBitEnIn <= pcmTrellisSymEnOut;
                dqmBitIn <= pcmTrellisBit;
            end
            `endif
            `DQM_SRC_DEC0_CH0: begin
                dqmBitEnIn <= dualPcmClkEn;
                dqmBitIn <= dualDataI;
            end
            default: begin
                dqmBitEnIn <= dualPcmClkEn;
                dqmBitIn <= dualDataI;
            end
        endcase
    end



    wire    [31:0]  dqmDout;
    dqm dqm(
        .clk(clk),
        .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(dqmDout),
        .bitClkEn(dqmBitEnIn),
        .payloadBit(dqmBitIn),
        .magClkEn(magClkEn),
        .mag(mag),
        .sourceSelect(dqmSourceSelect),
        .dqmBitEn(dqmBitEn),
        .dqmBit(dqmBit)
    );

`endif //ADD_DQM

`ifdef ADD_PN_GEN

//******************************************************************************
//                               PN Generator
//******************************************************************************
    wire    [31:0]  pngenDout;
    pngenTop pngen(
        .clk(clk),
        .clkEn(pngenEnable),
        .reset(reset),
        .busClk(busClk),
        // TODO, needed CS to prevent early writes with garbage only on triple demod
        .wr0(cs & wr0), .wr1(cs & wr1), .wr2(cs & wr2), .wr3(cs & wr3),
        .addr(addr),
        .din(dataIn),
        .dout(pngenDout),
        .pnClkEn(pnClkEn),
        .nrzBit(pnNrzBit),
        .pnBit(pnBit),
        .pnClk(pnClk)
    );

 `endif
//******************************************************************************
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
            `CandD_SRC_LEGACY_I: begin
                `ifdef ADD_FRAMER
                cAndD0ClkEn = iDemodBitEn;
                cAndD0DataIn = {iRotBit,qRotBit,1'b0};
                `else
                cAndD0ClkEn = iDemodBitEn;
                cAndD0DataIn = {iDemodBit,qDemodBit,1'b0};
                `endif
            end
            `CandD_SRC_LEGACY_Q: begin
                `ifdef ADD_FRAMER
                cAndD0ClkEn = qDemodBitEn;
                cAndD0DataIn = {qRotBit,1'b0,1'b0};
                `else
                cAndD0ClkEn = qDemodBitEn;
                cAndD0DataIn = {qDemodBit,1'b0,1'b0};
                `endif
            end
            `ifdef ADD_TRELLIS
            `CandD_SRC_PCMTRELLIS: begin
                cAndD0ClkEn = pcmTrellisSymEnOut;
                cAndD0DataIn = {pcmTrellisBit,pcmTrellisBit,1'b0};
            end
            `endif
            //`CandD_SRC_MULTIH:
            //`CandD_SRC_STC:
            `ifdef ADD_PN_GEN
            // should never get here since the Pn outputs are on clock1&3
            `CandD_SRC_PNGEN: begin
                cAndD0ClkEn = pnClkEn;
                cAndD0DataIn = {pnBit,2'b0};
            end
            `endif
            `ifdef ADD_LDPC
            `CandD_SRC_LDPC: begin
                cAndD0ClkEn = ldpcBitEnOut;
                cAndD0DataIn = {ldpcBitOut,2'b0};
            end
            `endif
            `ifdef ADD_DQM
            `CandD_SRC_DQM: begin
                cAndD0ClkEn = dqmBitEn;
                cAndD0DataIn = {dqmBit,2'b0};
            end
            `endif
            `CandD_SRC_DEC0_CH0: begin
                cAndD0ClkEn = dualPcmClkEn;
                cAndD0DataIn = {dualDataI,dualDataQ,1'b0};
            end
            `CandD_SRC_DEC0_CH1: begin
                cAndD0ClkEn = dualPcmClkEn;
                cAndD0DataIn = {dualDataQ,dualDataI,1'b0};
            end
            `CandD_SRC_DEC1_CH0: begin
                cAndD0ClkEn = ch1PcmClkEn;
                cAndD0DataIn = {ch1PcmData,1'b0,1'b0};
            end
            //`CandD_SRC_DEC1_CH1:
            //`CandD_SRC_DEC2_CH0:
            //`CandD_SRC_DEC2_CH1:
            //`CandD_SRC_DEC3_CH0:
            //`CandD_SRC_DEC3_CH1:
            default:   begin
                cAndD0ClkEn = iDemodBitEn;
                cAndD0DataIn = {iDemodBit,qDemodBit,1'b0};
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
        .outputClk(cAndD0ClkOut),
        .outputData(cAndD0DataOut)
    );
    //`define BYPASS_CANDD0
    `ifdef BYPASS_CANDD0
    assign ch0ClkOut = cAndD0ClkEn;
    assign ch0DataOut = cAndD0DataIn[2];
    assign ch2ClkOut = cAndD0ClkEn;
    assign ch2DataOut = cAndD0DataIn[2];
    `else
    assign ch0ClkOut = cAndD0ClkOut;
    assign ch0DataOut = cAndD0DataOut[2];
    assign ch2ClkOut = cAndD0ClkOut;
    assign ch2DataOut = cAndD0DataOut[2];
    `endif

    //----------------------- Channel 1 Jitter Attenuation --------------------

    wire    [3:0]   cAndD1SourceSelect;
    reg             cAndD1ClkEn;
    reg     [2:0]   cAndD1DataIn;
    always @* begin
       casex (cAndD1SourceSelect)
           `CandD_SRC_LEGACY_I: begin
               `ifdef ADD_FRAMER
               cAndD1ClkEn = iDemodBitEn;
               cAndD1DataIn = {iRotBit,qRotBit,1'b0};
               `else
               cAndD1ClkEn = iDemodBitEn;
               cAndD1DataIn = {iDemodBit,qDemodBit,1'b0};
               `endif
           end
           `CandD_SRC_LEGACY_Q: begin
               `ifdef ADD_FRAMER
               cAndD1ClkEn = qDemodBitEn;
               cAndD1DataIn = {qRotBit,1'b0,1'b0};
               `else
               cAndD1ClkEn = qDemodBitEn;
               cAndD1DataIn = {qDemodBit,1'b0,1'b0};
               `endif
           end
           `ifdef ADD_TRELLIS
           `CandD_SRC_PCMTRELLIS: begin
               cAndD1ClkEn = pcmTrellisSymEnOut;
               cAndD1DataIn = {pcmTrellisBit,pcmTrellisBit,1'b0};
           end
           `endif
           //`CandD_SRC_MULTIH:
           //`CandD_SRC_STC:
           `ifdef ADD_PN_GEN
           `CandD_SRC_PNGEN: begin
               cAndD1ClkEn = pnClkEn;
               cAndD1DataIn = {pnBit,2'b0};
           end
           `endif
           `ifdef ADD_LDPC
           `CandD_SRC_LDPC: begin
               cAndD1ClkEn = ldpcBitEnOut;
               cAndD1DataIn = {ldpcBitOut,2'b0};
           end
           `endif
           `ifdef ADD_DQM
           `CandD_SRC_DQM: begin
               cAndD1ClkEn = dqmBitEn;
               cAndD1DataIn = {dqmBit,2'b0};
           end
           `endif
           `CandD_SRC_DEC0_CH0: begin
               cAndD1ClkEn = dualPcmClkEn;
               cAndD1DataIn = {dualDataI,dualDataQ,1'b0};
           end
           `CandD_SRC_DEC0_CH1: begin
               cAndD1ClkEn = dualPcmClkEn;
               cAndD1DataIn = {dualDataQ,dualDataI,1'b0};
           end
           `CandD_SRC_DEC1_CH0: begin
               cAndD1ClkEn = ch1PcmClkEn;
               cAndD1DataIn = {ch1PcmData,1'b0,1'b0};
           end
           //`CandD_SRC_DEC1_CH1:
           //`CandD_SRC_DEC2_CH0:
           //`CandD_SRC_DEC2_CH1:
           //`CandD_SRC_DEC3_CH0:
           //`CandD_SRC_DEC3_CH1:
           default:   begin
               cAndD1ClkEn = iDemodBitEn;
               cAndD1DataIn = {iDemodBit,qDemodBit,1'b0};
           end
       endcase
    end

    `ifdef BYPASS_MULTIH_DECODER
    wire    [31:0]  cAndD1Dout = 32'h0;
    assign ch1DataOut = multihDataOut;
    assign ch1ClkOut = multihClkOut;
    assign ch3DataOut = multihDataOut;
    assign ch3ClkOut = multihClkOut;
    `else
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
    //`define BYPASS_CANDD1
    `ifdef TEST_LDPC
    assign ch1DataOut = ldpcBitOut;
    assign ch1ClkOut = ldpcBitEnOut;
    assign ch3ClkOut = cAndD1ClkOut;
    assign ch3DataOut = cAndD1DataOut[2];
    `elif BYPASS_CANDD1
    assign ch1ClkOut = cAndD1ClkEn;
    assign ch1DataOut = cAndD1DataIn[2];
    assign ch3ClkOut = cAndD1ClkEn;
    assign ch3DataOut = cAndD1DataIn[2];
    `else
    assign ch1ClkOut = cAndD1ClkOut;
    assign ch1DataOut = cAndD1DataOut[2];
    assign ch3ClkOut = cAndD1ClkOut;
    assign ch3DataOut = cAndD1DataOut[2];
    `endif //TEST_LDPC
    `endif //BYPASS_MULTIH_DECODER

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
            `ifdef ADD_TRELLIS
            `DAC_SRC_FMTRELLIS: begin
                interp0DataIn <= pcmDac0Data;
                interp0ClkEn <= pcmDac0ClkEn;
            end
            `endif
            `ifdef ADD_MULTIH
            `DAC_SRC_MULTIHTRELLIS: begin
                interp0DataIn <= multih0Out;
                interp0ClkEn <= multih0ClkEn;
            end
            `endif
            `ifdef ADD_LDPC
            `DAC_SRC_LDPC: begin
                interp0DataIn <= ldpcDac0Data;
                interp0ClkEn <= ldpcDac0ClkEn;
            end
            `endif
            `ifdef ADD_BITSYNC
            `DAC_SRC_SBS: begin
                interp0DataIn <= sbsDac0Data;
                interp0ClkEn <= sbsDac0ClkEn;
            end
            `endif
            default: begin
                interp0DataIn <= demodDac0Data;
                interp0ClkEn <= demodDac0ClkEn;
            end
        endcase
    end
    wire    [31:0]  interp0Dout;
    wire    [17:0]  interp0DataOut;
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
    //`define TEST_DACS
    `ifdef TEST_DACS
    always @(posedge clk) begin
        //dac0_d <= adc0Reg;
        dac0_d[12:0] <= interp0DataIn[16:4];
        dac0_d[13] <= ~interp0DataIn[17];
    end
    `else
    always @(posedge clk) begin
        dac0_d[12:0] <= interp0DataOut[16:4];
        dac0_d[13] <= ~interp0DataOut[17];
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
            `ifdef ADD_TRELLIS
            `DAC_SRC_FMTRELLIS: begin
                interp1DataIn <= pcmDac1Data;
                interp1ClkEn <= pcmDac1ClkEn;
            end
            `endif
            `ifdef ADD_MULTIH
            `DAC_SRC_MULTIHTRELLIS: begin
                interp1DataIn <= multih1Out;
                interp1ClkEn <= multih1ClkEn;
            end
            `endif
            `ifdef ADD_LDPC
            `DAC_SRC_LDPC: begin
                interp1DataIn <= ldpcDac1Data;
                interp1ClkEn <= ldpcDac1ClkEn;
            end
            `endif
            `ifdef ADD_BITSYNC
            `DAC_SRC_SBS: begin
                interp1DataIn <= sbsDac1Data;
                interp1ClkEn <= sbsDac1ClkEn;
            end
            `endif
            default: begin
                interp1DataIn <= demodDac1Data;
                interp1ClkEn <= demodDac1ClkEn;
            end
        endcase
    end
    wire    [31:0]  interp1Dout;
    wire    [17:0]  interp1DataOut;
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
    `ifdef TEST_DACS
    always @(posedge clk) begin
        //dac1_d <= adc0Reg;
        dac1_d[12:0] <= interp0DataIn[16:4];
        dac1_d[13] <= ~interp0DataIn[17];
    end
    `else
    always @(posedge clk) begin
        dac1_d[12:0] <= interp1DataOut[16:4];
        dac1_d[13] <= ~interp1DataOut[17];
    end
    `endif

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
            `ifdef ADD_TRELLIS
            `DAC_SRC_FMTRELLIS: begin
                interp2DataIn <= pcmDac2Data;
                interp2ClkEn <= pcmDac2ClkEn;
            end
            `endif
            `ifdef ADD_MULTIH
            `DAC_SRC_MULTIHTRELLIS: begin
                interp2DataIn <= multih2Out;
                interp2ClkEn <= multih2ClkEn;
            end
            `endif
            `ifdef ADD_LDPC
            `DAC_SRC_LDPC: begin
                interp2DataIn <= ldpcDac2Data;
                interp2ClkEn <= ldpcDac2ClkEn;
            end
            `endif
            `ifdef ADD_BITSYNC
            `DAC_SRC_SBS: begin
                interp2DataIn <= sbsDac2Data;
                interp2ClkEn <= sbsDac2ClkEn;
            end
            `endif
            default: begin
                interp2DataIn <= demodDac2Data;
                interp2ClkEn <= demodDac2ClkEn;
            end
        endcase
    end
    wire    [31:0]  interp2Dout;
    wire    [17:0]  interp2DataOut;
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
    `ifdef TEST_DACS
    always @(posedge clk) begin
        //dac2_d <= adc0Reg;
        dac2_d[12:0] <= interp2DataIn[16:4];
        dac2_d[13] <= ~interp2DataIn[17];
    end
    `else
    always @(posedge clk) begin
        dac2_d[12:0] <= interp2DataOut[16:4];
        dac2_d[13] <= ~interp2DataOut[17];
    end
    `endif  //TEST_DACS

    `endif //not R6100


    assign dac0_clk = clk;
    assign dac1_clk = clk;
    `ifndef R6100
    assign dac2_clk = clk;
    `endif

//******************************************************************************
//                        SDI Output Interface
//******************************************************************************

wire    [31:0]  sdiDout;
sdi sdi(
    .clk(clk),
    .reset(reset),
    .busClk(busClk),
    .cs(cs),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .dataIn(dataIn),
    .dataOut(sdiDout),
    .iSymEn(iDemodBitEn),
    .iSymData(iTrellis),
    .qSymEn(qDemodBitEn),
    .qSymData(qTrellis),
    .eyeSync(demodEyeClkEn),
    .iEye(iDemodEye),.qEye(qDemodEye),
    .eyeOffset(demodEyeOffset),
    .bitsyncLock(timingLock), .demodLock(carrierLock),
    `ifdef ADD_DESPREADER
    .iEpoch(iEpoch), .qEpoch(qEpoch),
    `endif
    .sdiOut(sdiOut)
    );

//******************************************************************************
//                               Output Assignments
//******************************************************************************

    assign adc01_powerDown = 1'b0;
    `ifdef ADD_BITSYNC
    assign bsAdc_powerDown = 1'b0;
    `endif

    assign dac_rst = 1'b1;
    assign dac_sclk = 1'b0;
    assign dac0_nCs = 1'b0;
    assign dac1_nCs = 1'b0;
    assign dac2_nCs = 1'b0;
    assign dac_sdio = 1'b0;
    assign Sw50Ohm  = 1'b0;

// TODO    assign lockLed0n = !timingLock;
// TODO    assign lockLed1n = !carrierLock;

    `ifdef R6100
*/
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
//                               Combiner Outputs from Demod
//******************************************************************************
    `ifdef COMBINER_DEMOD
     DC_DemodTop combinerOut(
        .Clk(clk),
        .Reset(spiCSn),
        .FPGA_ID0(FPGA_ID0),
        .FPGA_ID1(FPGA_ID1),
        .iDemodBit(iDemodBit),
        .qDemodBit(qDemodBit),
        .amDataEn(amDataEn),
        .amDataIn(amDataIn),
        .adc0(adc0),
        .PrevData_p(PrevData_p),
        .PrevData_n(PrevData_n),
        .NextData_p(NextData_p),
        .NextData_n(NextData_n),
        .NextClk_p(NextClk_p),
        .NextClk_n(NextClk_n),
        .PrevClk_p(PrevClk_p),
        .PrevClk_n(PrevClk_n)
    );
    `endif // combiner_demod
/*
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

    //******************************************************************************
    //                          Video Switch Interface
    //******************************************************************************

    wire    [1:0]   vid0Select;
    wire    [1:0]   vid1Select;
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
        .vid2Select(),
        .vid3Select()
    );

    assign video0InSelect = vid0Select;
    assign video1InSelect = vid1Select;

    //This is to fix an error on the board layout
    always @* begin
        case (vid0Select)
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
    end
    always @* begin
        case (vid1Select)
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

    `endif //R6100


    `ifdef ADD_SPECTRAL_SWEEP
    //******************************************************************************
    //                          Spectral Sweep Card
    //******************************************************************************
    wire [31:0] sscDout;
    ssc ssc(
        .atod(adc0In[17:4]),
        .clk(clk),
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(sscDout),
        .uartOut(DQMOut)
        );
    `endif  //ADD_SPECTRAL_SWEEP


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

            `ifdef ADD_LDPC
            `LDPCSPACE:         rd_mux = ldpcDout;
            `endif

            `ifdef ADD_DQM
            `DQMLUTSPACE,
            `DQMSPACE:          rd_mux = dqmDout;
            `endif

            `ifdef ADD_BERT
            `BERT_SPACE:        rd_mux = bertDout;
            `endif

            `ifdef ADD_PN_GEN
             `PNGEN_SPACE:      rd_mux = pngenDout;
            `endif

            `ifdef ADD_FRAMER
            `FRAMER_SPACE:      rd_mux = framerDout;
            `endif

            `DEMODSPACE,
            `ifdef ADD_CMA
            `EQUALIZERSPACE,
            `endif
            `ifdef ADD_DESPREADER
            `DESPREADSPACE,
            `endif
            `DDCSPACE,
            `DDCFIRSPACE,
            `CICDECSPACE,
            `BITSYNCSPACE,
            `BITSYNCAUSPACE,
            `RESAMPSPACE,
            `CARRIERSPACE,
            `CHAGCSPACE :       rd_mux = demodDout;

            `ifdef ADD_MULTIH
            `MULTIH_SPACE,
            `MULTIHLFSPACE:     rd_mux = multihDout;
            `endif //ADD_MULTIH

            `ifdef ADD_TRELLIS
            `TRELLIS_SPACE,
            `TRELLISLFSPACE:    rd_mux = trellisDout;
            `endif

            `UARTSPACE,
            `SDISPACE:          rd_mux = sdiDout;

            `ifdef ADD_SCPATH
            `SCDDCSPACE,
            `SCDDCFIRSPACE,
            `SCCICDECSPACE,
            `SCAGCSPACE,
            `SCCARRIERSPACE:    rd_mux = scPathDout;
            end
            `endif

            `VIDFIR0SPACE,
            `INTERP0SPACE:      rd_mux = interp0Dout;

            `VIDFIR1SPACE,
            `INTERP1SPACE:      rd_mux = interp1Dout;

            `ifdef ADD_VITERBI
            `VITERBISPACE:      rd_mux = vitDout;
            `endif

            `DUAL_DECODERSPACE: rd_mux = dualDecDout;

            `CH1_DECODERSPACE:  rd_mux = ch1DecDout;

            `CandD0SPACE:       rd_mux = cAndD0Dout;
            `CandD1SPACE:       rd_mux = cAndD1Dout;

            `VIDSWITCHSPACE:    rd_mux = vsDout;

            `ifdef ADD_SPECTRAL_SWEEP
            `SSCSPACE:          rd_mux = sscDout;
            `endif

            `ifdef ADD_BITSYNC
            `SBS_TOP_SPACE,
            `SBS_DFSPACE,
            `SBS_DFFIRSPACE,
            `SBS_RESAMPSPACE,
            `SBS_BITSYNCSPACE,
            `SBS_AGCSPACE:      rd_mux = sbsDout;
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

            `ifdef ADD_LDPC
            `LDPCSPACE:         begin
                if (addr[1]) begin
                    rd_mux = ldpcDout[31:16];
                end
                else begin
                    rd_mux = ldpcDout[15:0];
                end
            end
            `endif

            `ifdef ADD_DQM
            `DQMLUTSPACE,
            `DQMSPACE:         begin
                if (addr[1]) begin
                    rd_mux = dqmDout[31:16];
                end
                else begin
                    rd_mux = dqmDout[15:0];
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

            `ifdef ADD_FRAMER
            `FRAMER_SPACE:        begin
                if (addr[1]) begin
                    rd_mux = framerDout[31:16];
                end
                else begin
                    rd_mux = framerDout[15:0];
                end
            end
            `endif

            `ifdef ADD_PN_GEN
             `PNGEN_SPACE:      TODO, pnGen is not intended for non6100 builds. FZ
            `endif

            `DEMODSPACE,
            `ifdef ADD_CMA
            `EQUALIZERSPACE,
            `endif
            `ifdef ADD_DESPREADER
            `DESPREADSPACE,
            `endif
            `DDCSPACE,
            `DDCFIRSPACE,
            `CICDECSPACE,
            `BITSYNCSPACE,
            `BITSYNCAUSPACE,
            `RESAMPSPACE,
            `CARRIERSPACE,
            `CHAGCSPACE : begin
                if (addr[1]) begin
                    rd_mux = demodDout[31:16];
                end
                else begin
                    rd_mux = demodDout[15:0];
                end
            end
            `ifdef ADD_MULTIH
            `MULTIH_SPACE,
            `MULTIHLFSPACE: begin
                if (addr[1]) begin
                    rd_mux = multihDout[31:16];
                end
                else begin
                    rd_mux = multihDout[15:0];
                end
            end
            `endif //ADD_MULTIH

            `ifdef ADD_TRELLIS
            `TRELLIS_SPACE,
            `TRELLISLFSPACE: begin
                if (addr[1]) begin
                    rd_mux = trellisDout[31:16];
                end
                else begin
                    rd_mux = trellisDout[15:0];
                end
            end
            `endif //ADD_TRELLIS

            `UARTSPACE,
            `SDISPACE: begin
                if (addr[1]) begin
                    rd_mux = sdiDout[31:16];
                end
                else begin
                    rd_mux = sdiDout[15:0];
                end
            end
            `ifdef ADD_SCPATH
            `SCDDCSPACE,
            `SCDDCFIRSPACE,
            `SCCICDECSPACE,
            `SCAGCSPACE,
            `SCCARRIERSPACE: begin
                if (addr[1]) begin
                    rd_mux = scPathDout[31:16];
                end
                else begin
                    rd_mux = scPathDout[15:0];
                end
            end
            `endif
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

            `ifdef ADD_VITERBI
            `VITERBISPACE: begin
                if (addr[1]) begin
                    rd_mux = vitDout[31:16];
                    end
                else begin
                    rd_mux = vitDout[15:0];
                    end
                end
            `endif

            `DUAL_DECODERSPACE: begin
                if (addr[1]) begin
                    rd_mux = dualDecDout[31:16];
                    end
                else begin
                    rd_mux = dualDecDout[15:0];
                    end
                end
            `CH1_DECODERSPACE: begin
                if (addr[1]) begin
                    rd_mux = ch1DecDout[31:16];
                    end
                else begin
                    rd_mux = ch1DecDout[15:0];
                    end
                end

            `ifdef ADD_BITSYNC
            `SBS_TOP_SPACE,
            `SBS_DFSPACE,
            `SBS_DFFIRSPACE,
            `SBS_RESAMPSPACE,
            `SBS_BITSYNCSPACE,
            `SBS_AGCSPACE: begin
                if (addr[1]) begin
                    rd_mux = sbsDout[31:16];
                end
                else begin
                    rd_mux = sbsDout[15:0];
                end
            end
            `endif

             default : rd_mux = 16'hxxxx;
            endcase
         end

    assign fb_data = (cs & rd) ? rd_mux : 16'hzzzz;

    `endif //R6100

*/

endmodule

