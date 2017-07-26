`timescale 1ns/100ps
`include "addressMap.v"

module semcoDemodTop (

    `ifdef TRIPLE_DEMOD

    input               spiClk,
    input               spiCSn,
    input               spiDataIn,
    inout               spiDataOut,

    `else   //TRIPLE_DEMOD

    // Flexbus connections
    input               fbClk,
    input               fb_ale,
    input               fb_csn,
    input               fb_oen,
    input               fb_wrn,
    input       [15:0]  fb_addr,
    inout       [15:0]  fb_data,

    `endif //TRIPLE_DEMOD

    // ADC Inputs
    input       [13:0]  adc0,
    input               adc0_overflow,
    output              adc01_powerDown,
    input               adc0Clock,

    // DAC configuration interface
    output              dac_rst,
    output              dac_sclk,
    output              dac_sdio,
    output              dac0_nCs,
    output              dac1_nCs,
    `ifndef TRIPLE_DEMOD
    output              dac2_nCs,
    `endif

    // DAC datapath interface
    output              dac0_clk,
    output  reg [13:0]  dac0_d,
    output              dac1_clk,
    output  reg [13:0]  dac1_d,
    `ifndef TRIPLE_DEMOD
    output              dac2_clk,
    output  reg [13:0]  dac2_d,
    `endif

    // Clock and data outputs
    output              ch0ClkOut,ch0DataOut,
    output              ch1ClkOut,ch1DataOut,

    // Lock indicators
    output              lockLed0n, lockLed1n,

    `ifdef TRIPLE_DEMOD

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
    output              amDacCSn

    `else   //TRIPLE_DEMOD

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
    output              pll2_PWDn

    `endif //TRIPLE_DEMOD

);

    parameter VER_NUMBER = 16'd454;


//******************************************************************************
//                          Clock Distribution
//******************************************************************************
    systemClock systemClock (
        .clk_in1(adc0Clock),
        .clk_out1(clk),
        .locked(clkLocked)
     );

    `ifdef TRIPLE_DEMOD
    BUFG spiBufg(
        .I(spiClk),
    //    .O(spiBufgClk)
        .O(busClk)
    );
    //spiBusClock spiBusClock (
    //    .clk_in1(spiBufgClk),
    //    .clk_out1(busClk),
    //    .locked(spiClkLocked)
    //);

    `else //TRIPLE_DEMOD
    flexbusClock flexbusClock (
        .clk_in1(fbClk),
        .clk_out1(busClk),
        .locked(fbClkLocked)
    );
    `endif //TRIPLE_DEMOD



    `ifdef TRIPLE_DEMOD
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

    `else //TRIPLE_DEMOD

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

    `endif //TRIPLE_DEMOD

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
            `SEMCO_TOP_SPACE:       semcoTopSpace = 1;
            default:                semcoTopSpace = 0;
        endcase
    end

    wire    [23:0]  boot_addr;
    wire    [2:0]   dac0InputSelect;
    wire    [2:0]   dac1InputSelect;
    wire    [2:0]   dac2InputSelect;
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
        .reset(reset),
        .reboot(reboot),
        .rebootAddress(boot_addr),
        .dac0InputSelect(dac0InputSelect),
        .dac1InputSelect(dac1InputSelect),
        .dac2InputSelect(dac2InputSelect),
        .ch0MuxSelect(ch0MuxSelect),
        .ch1MuxSelect(ch1MuxSelect)
    );


//******************************************************************************
//                          Legacy Demod
//******************************************************************************

    wire    signed  [17:0]  iDemodSymData;
    wire    signed  [17:0]  qDemodSymData;
    wire    signed  [17:0]  iTrellis,qTrellis;
    wire    signed  [3:0]   demodDac0Select,demodDac1Select,demodDac2Select;
    wire    signed  [17:0]  demodDac0Data,demodDac1Data,demodDac2Data;
    wire    signed  [4:0]   demodMode;
    wire asyncMode = ( (demodMode == `MODE_AQPSK)
                    || (demodMode == `MODE_AUQPSK)
                    );
    wire    signed  [17:0]  iDemodEye,qDemodEye;
    wire            [4:0]   demodEyeOffset;
    wire            [31:0]  demodDout;
    demod demod(
        .clk(clk), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(demodDout),
        .iRx(adc0In), .qRx(18'h0),
        .bbClkEn(1'b0),
        .iBB(18'h0), .qBB(18'h0),
        .iSym2xEn(iDemodSym2xEn),
        .iSymEn(iDemodSymEn),
        .iSymData(iDemodSymData),
        .iSymClk(iDemodSymClk),
        .iBit(iDemodBit),
        .qSym2xEn(qDemodSym2xEn),
        .qSymEn(qDemodSymEn),
        .qSymClk(qDemodSymClk),
        .qSymData(qDemodSymData),
        .qBit(qDemodBit),
        .auSymClk(auDemodSymClk),
        .auBit(auDemodBit),
        .timingLock(demodTimingLock),
        .carrierLock(demodCarrierLock),
        .trellisSymEn(trellisSymEn),
        .iTrellis(iTrellis),
        .qTrellis(qTrellis),
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

//******************************************************************************
//                                PCM Decoders
//******************************************************************************
    reg dualDecoderSpace;
    always @* begin
        casex(addr)
            `DUAL_DECODERSPACE:     dualDecoderSpace = 1;
            default:                dualDecoderSpace = 0;
        endcase
    end

    reg                 dualCh0Input;
    reg                 dualCh1Input;
    reg                 dualSymEn;
    reg                 dualSym2xEn;
    reg                 dualSymClk;
    always @(posedge clk) begin
        dualCh0Input <= iDemodBit;
        dualCh1Input <= qDemodBit;
        dualSymEn <= iDemodSymEn;
        dualSym2xEn <= iDemodSym2xEn;
        dualSymClk <= iDemodSymClk;
    end

    wire    [31:0]  dualDecDout;
    decoder dualDecoder
    (
        .clk(clk),
        .rs(reset),
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
        .fifo_rs(),
        .clkPhase(),
        .bypass_fifo(),
        .symb_clk(dualPcmSymClk),
        .inputSelect(dualDecInputSelect)
    );

    reg ch1DecoderSpace;
    always @* begin
        casex(addr)
            `CH1_DECODERSPACE:      ch1DecoderSpace = 1;
            default:                ch1DecoderSpace = 0;
        endcase
    end

    reg                 ch1DecInput;
    reg                 ch1DecSymEn;
    reg                 ch1DecSym2xEn;
    reg                 ch1DecSymClk;
    always @(posedge clk) begin
        ch1DecInput <= qDemodBit;
        ch1DecSymEn <= qDemodSymEn;
        ch1DecSym2xEn <= qDemodSym2xEn;
        ch1DecSymClk <= qDemodSymClk;
    end


    wire    [31:0]  ch1DecDout;
    pcmDecoder dec1 (
        .clk(clk),
        .rs(reset),
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
        .fifo_rs(),
        .clkPhase(),
        .bypass_fifo(),
        .symb_clk(ch1PcmSymClk),
        .inputSelect(ch1DecInputSelect)
    );



//******************************************************************************
//                       Clock/Data Jitter Reduction
//******************************************************************************

    `ifdef TRIPLE_DEMOD


    `else //TRIPLE_DEMOD

    // SPI interface to the PLLs
    wire    [31:0]  pllDout;
    ics307Interface #(.SysclkDivider(4)) pllIntfc (
        .reset(reset),
        .busClk(busClk),
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

    `endif //TRIPLE_DEMOD

    //----------------------- Channel 0 Jitter Attenuation --------------------

    // Configuration Regs
    wire    [2:0]   clkAndDataSource0;
    wire    [1:0]   clkAndDataPhase0;
    wire    [31:0]  clkAndData0Dout;
    clkAndDataRegs #(.RegSpace(`CandD0SPACE)) clkAndDataRegs0(
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(clkAndData0Dout),
        .source(clkAndDataSource0),
        .clkPhase(clkAndDataPhase0),
        .clkReset(clkReset0)
    );

    // Clock and Data Source Selection
    reg     [2:0]   clkAndDataSource0Data;
    reg             clkAndDataSource0ClkEn;
    always @(posedge clk) begin
        case (clkAndDataSource0)
            default: begin
                clkAndDataSource0ClkEn <= dualPcmClkEn;
                clkAndDataSource0Data <= {dualDataI,dualDataQ,1'b0};
            end
        endcase
    end

    // First stage attenuation using a Digital PLL
    wire    [7:0]   dll0PhaseError;
    wire    [31:0]  dll0Dout;
    digitalPLL #(.REG_SPACE(`DLL0SPACE)) dll0(
        .clk(clk),
        .reset(clkReset0),
        .busClk(busClk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(dll0Dout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .referenceClkEn(clkAndDataSource0ClkEn),
        .dllOutputClk(dll0OutClk),
        .filteredRefClk(pll0_REF),
        .phaseError(dll0PhaseError)
    );

    // Make a Gray-coded divider to create four phase clock
    reg     [1:0]   dll0Divider;
    wire            dll0ReadClk = dll0Divider[0];
    wire            dll090Clk   = dll0Divider[1];
    always @(posedge dll0OutClk) begin
        case (dll0Divider)
            2'b00:      dll0Divider <= 2'b01;
            2'b01:      dll0Divider <= 2'b11;
            2'b11:      dll0Divider <= 2'b10;
            2'b10:      dll0Divider <= 2'b00;
            default:    dll0Divider <= 2'b00;
        endcase
    end

    // First stage jitter attenuation FIFO
    reg             dll0_ReadEnable;
    wire    [2:0]   dll0_Symbol;
    jitterFifo dll0Fifo(
        .rst(clkReset0),
        .wr_clk(clk),
        .rd_clk(dll0ReadClk),
        .din(clkAndDataSource0Data),
        .wr_en(clkAndDataSource0ClkEn),
        .rd_en(dll0_ReadEnable),
        .dout(dll0_Symbol),
        .full(dll0_Full),
        .empty(dll0_Empty),
        .prog_full(dll0_HalfFull)
    );
    always @(posedge dll0ReadClk) begin
        if (clkReset0) begin
            dll0_ReadEnable <= 0;
        end
        else if (dll0_HalfFull) begin
            dll0_ReadEnable <= 1;
        end
    end

    // First stage final data output
    reg             dll0_Clk, dll0_Data, dllSync_Data;
    always @(posedge dll0OutClk) begin
        dll0_Data <= dll0_Symbol[2];
        dllSync_Data <= dll0_Symbol[1];
        case (clkAndDataPhase0)
            `DEC_CLK_PHASE_0:   dll0_Clk <= dll0ReadClk;
            `DEC_CLK_PHASE_90:  dll0_Clk <= dll090Clk;
            `DEC_CLK_PHASE_180: dll0_Clk <= !dll0ReadClk;
            `DEC_CLK_PHASE_270: dll0_Clk <= !dll090Clk;
        endcase
    end

    // Second stage - This uses an external PLL. The reference input to the
    //  PLL is the DLL output.

    // Make a Gray-coded divider
    reg     [1:0]   pll0Divider;
    wire            pll0ReadClk = pll0Divider[0];
    wire            pll090Clk   = pll0Divider[1];
    always @(posedge pll0_OUT1) begin
        case (pll0Divider)
            2'b00:      pll0Divider <= 2'b01;
            2'b01:      pll0Divider <= 2'b11;
            2'b11:      pll0Divider <= 2'b10;
            2'b10:      pll0Divider <= 2'b00;
            default:    pll0Divider <= 2'b00;
        endcase
    end

    // Second stage jitter attenuation FIFO
    reg             pll0_ReadEnable;
    wire    [2:0]   pll0_Symbol;
    jitterFifo pll0Fifo(
        .rst(clkReset0),
        .wr_clk(clk),
        .rd_clk(pll0ReadClk),
        .din({dualDataI,dualDataQ,1'b0}),
        .wr_en(clkAndDataSource0ClkEn),
        .rd_en(pll0_ReadEnable),
        .dout(pll0_Symbol),
        .full(pll0_Full),
        .empty(pll0_Empty),
        .prog_full(pll0_HalfFull)
    );
    always @(posedge pll0ReadClk) begin
        if (clkReset0) begin
            pll0_ReadEnable <= 0;
        end
        else if (pll0_HalfFull) begin
            pll0_ReadEnable <= 1;
        end
    end

    // Second stage final data output
    reg             pll0_Clk, pll0_Data, sync_Data;
    always @(posedge pll0_OUT1) begin
        pll0_Data <= pll0_Symbol[2];
        sync_Data <= pll0_Symbol[1];
        case (clkAndDataPhase0)
            `DEC_CLK_PHASE_0:   pll0_Clk <= pll0ReadClk;
            `DEC_CLK_PHASE_90:  pll0_Clk <= pll090Clk;
            `DEC_CLK_PHASE_180: pll0_Clk <= !pll0ReadClk;
            `DEC_CLK_PHASE_270: pll0_Clk <= !pll090Clk;
        endcase
    end


    //----------------------- Channel 1 Jitter Attenuation --------------------

    // Configuration Regs
    wire    [2:0]   clkAndDataSource1;
    wire    [1:0]   clkAndDataPhase1;
    wire    [31:0]  clkAndData1Dout;
    clkAndDataRegs #(.RegSpace(`CandD1SPACE)) clkAndDataRegs1(
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(clkAndData1Dout),
        .source(clkAndDataSource1),
        .clkPhase(clkAndDataPhase1),
        .clkReset(clkReset1)
    );

    // Clock and Data Source Selection
    reg     [2:0]   clkAndDataSource1Data;
    reg             clkAndDataSource1ClkEn;
    always @(posedge clk) begin
        case (clkAndDataSource1)
            default: begin
                clkAndDataSource1ClkEn <= ch1PcmClkEn;
                clkAndDataSource1Data <= {ch1PcmData,2'b0};
            end
        endcase
    end

    // First stage attenuation using a Digital PLL
    wire    [7:0]   dll1PhaseError;
    wire    [31:0]  dll1Dout;
    digitalPLL #(.REG_SPACE(`DLL1SPACE)) dll1(
        .clk(clk),
        .reset(clkReset1),
        .busClk(busClk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(dll1Dout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .referenceClkEn(clkAndDataSource1ClkEn),
        .dllOutputClk(dll1OutClk),
        .filteredRefClk(pll1_REF),
        .phaseError(dll1PhaseError)
    );

    // Make a Gray-coded divider to create a four-phase clock
    reg     [1:0]   dll1Divider;
    wire            dll1ReadClk = dll1Divider[0];
    wire            dll190Clk   = dll1Divider[1];
    always @(posedge dll1OutClk) begin
        case (dll1Divider)
            2'b00:      dll1Divider <= 2'b01;
            2'b01:      dll1Divider <= 2'b11;
            2'b11:      dll1Divider <= 2'b10;
            2'b10:      dll1Divider <= 2'b00;
            default:    dll1Divider <= 2'b00;
        endcase
    end
    // First stage jitter attenuation FIFO
    reg             dll1_ReadEnable;
    wire    [2:0]   dll1_Symbol;
    jitterFifo dll1Fifo(
        .rst(clkReset1),
        .wr_clk(clk),
        .rd_clk(dll1ReadClk),
        .din(clkAndDataSource1Data),
        .wr_en(clkAndDataSource1ClkEn),
        .rd_en(dll1_ReadEnable),
        .dout(dll1_Symbol),
        .full(dll1_Full),
        .empty(dll1_Empty),
        .prog_full(dll1_HalfFull)
    );
    always @(posedge dll1ReadClk) begin
        if (clkReset1) begin
            dll1_ReadEnable <= 0;
        end
        else if (dll1_HalfFull) begin
            dll1_ReadEnable <= 1;
        end
    end

    // First stage final data output
    reg             dllAsync_Clk, dllAsync_Data;
    always @(posedge dll1OutClk) begin
        dllAsync_Data <= dll1_Symbol[2];
        case (clkAndDataPhase1)
            `DEC_CLK_PHASE_0:   dllAsync_Clk <= dll1ReadClk;
            `DEC_CLK_PHASE_90:  dllAsync_Clk <= dll190Clk;
            `DEC_CLK_PHASE_180: dllAsync_Clk <= !dll1ReadClk;
            `DEC_CLK_PHASE_270: dllAsync_Clk <= !dll190Clk;
        endcase
    end
    assign          dll1_Data = asyncMode ? dllAsync_Data : dllSync_Data;
    assign          dll1_Clk = asyncMode ? dllAsync_Clk : dll0_Clk;

    // Make a Gray-coded divider
    reg     [1:0]   pll1Divider;
    wire            pll1ReadClk = pll1Divider[0];
    wire            pll190Clk   = pll1Divider[1];
    always @(posedge pll1_OUT1) begin
        case (pll1Divider)
            2'b00:      pll1Divider <= 2'b01;
            2'b01:      pll1Divider <= 2'b11;
            2'b11:      pll1Divider <= 2'b10;
            2'b10:      pll1Divider <= 2'b00;
            default:    pll1Divider <= 2'b00;
        endcase
    end

    // Second stage jitter attenuation FIFO
    reg             pll1_ReadEnable;
    wire    [2:0]   pll1_Symbol;
    jitterFifo pll1Fifo(
        .rst(clkReset1),
        .wr_clk(clk),
        .rd_clk(pll1ReadClk),
        .din(clkAndDataSource1Data),
        .wr_en(clkAndDataSource1ClkEn),
        .rd_en(pll1_ReadEnable),
        .dout(pll1_Symbol),
        .full(pll1_Full),
        .empty(pll1_Empty),
        .prog_full(pll1_HalfFull)
    );
    always @(posedge pll1ReadClk) begin
        if (clkReset1) begin
            pll1_ReadEnable <= 0;
        end
        else if (pll1_HalfFull) begin
            pll1_ReadEnable <= 1;
        end
    end

    // Second stage final data output
    reg             async_Clk, async_Data;
    always @(posedge pll1_OUT1) begin
        async_Data <= pll1_Symbol[2];
        case (clkAndDataPhase1)
            `DEC_CLK_PHASE_0:   async_Clk <= pll1ReadClk;
            `DEC_CLK_PHASE_90:  async_Clk <= pll190Clk;
            `DEC_CLK_PHASE_180: async_Clk <= !pll1ReadClk;
            `DEC_CLK_PHASE_270: async_Clk <= !pll190Clk;
        endcase
    end
    assign          pll1_Data = asyncMode ? async_Data : sync_Data;
    assign          pll1_Clk = asyncMode ? async_Clk : pll0_Clk;

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
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp0Dout),
        .dataIn(interp0DataIn),
        .dacSource(dac0Source),
        .clkEnOut(),
        .dataOut(interp0DataOut)
        );
    `define TEST_DACS
    `ifdef TEST_DACS
    wire    signed  [11:0]  amDataIn;
    always @(posedge clk) begin
        dac0_d <= {~amDataIn[11],amDataIn[10:0],2'b0};
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
        dac1_d <= adc0Reg;
    end
    `else
    always @(posedge clk) begin
        dac1_d[12:0] <= interp1DataOut[16:4];
        dac1_d[13] <= ~interp1DataOut[17];
    end
    `endif

    `ifndef TRIPLE_DEMOD
    reg     [17:0]  interp2DataIn;
    reg             interp2ClkEn;
    wire    [3:0]   dac2Source;
    always @(posedge clk) begin
        case (dac1Source)
            `DAC_SRC_DEMOD: begin
                interp2DataIn <= demodDac2Data;
                interp2ClkEn <= demodDac2ClkEn;
            end
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
        dac2_d <= adc0Reg;
    end
    `else
    always @(posedge clk) begin
        dac2_d[12:0] <= interp2DataOut[16:4];
        dac2_d[13] <= ~interp2DataOut[17];
    end
    `endif  //TEST_DACS

    `endif //not TRIPLE_DEMOD


    assign dac0_clk = clk;
    assign dac1_clk = clk;
    `ifndef TRIPLE_DEMOD
    assign dac2_clk = clk;
    `endif

//******************************************************************************
//                               Output Assignments
//******************************************************************************

    assign adc01_powerDown = 1'b0;

    assign dac_rst = 1'b0;
    assign dac_sclk = 1'b0;
    assign dac0_nCs = 1'b1;
    assign dac1_nCs = 1'b1;
    assign dac2_nCs = 1'b1;
    assign dac_sdio = 1'b0;

    clockAndDataMux ch0Mux(
        .muxSelect(ch0MuxSelect),
        .clk0(dualSymClk),
        .clkInvert0(1'b0),
        .data0(dualCh0Input),
        .clk1(pll0_Clk),
        .clkInvert1(1'b0),
        .data1(pll0_Data),
        .clk2(ch1DecSymClk),
        .clkInvert2(1'b0),
        .data2(ch1DecInput),
        .clk3(pll1_Clk),
        .clkInvert3(1'b0),
        .data3(pll1_Data),
        .clk4(1'b0),
        .clkInvert4(1'b0),
        .data4(1'b0),
        .clk5(1'b0),
        .clkInvert5(1'b0),
        .data5(1'b0),
        .clk6(1'b0),
        .clkInvert6(1'b0),
        .data6(1'b0),
        .clk7(1'b0),
        .clkInvert7(1'b0),
        .data7(1'b0),
        .outputClk(ch0ClkOut),
        .outputData(ch0DataOut)
    );

    clockAndDataMux ch1Mux(
        .muxSelect(ch1MuxSelect),
        .clk0(dualSymClk),
        .clkInvert0(1'b0),
        .data0(dualCh0Input),
        .clk1(pll0_Clk),
        .clkInvert1(1'b0),
        .data1(pll0_Data),
        .clk2(ch1DecSymClk),
        .clkInvert2(1'b0),
        .data2(ch1DecInput),
        .clk3(pll1_Clk),
        .clkInvert3(1'b0),
        .data3(pll1_Data),
        .clk4(1'b0),
        .clkInvert4(1'b0),
        .data4(1'b0),
        .clk5(1'b0),
        .clkInvert5(1'b0),
        .data5(1'b0),
        .clk6(1'b0),
        .clkInvert6(1'b0),
        .data6(1'b0),
        .clk7(1'b0),
        .clkInvert7(1'b0),
        .data7(1'b0),
        .outputClk(ch1ClkOut),
        .outputData(ch1DataOut)
    );


    assign lockLed0n = !demodTimingLock;
    assign lockLed1n = !demodCarrierLock;

    `ifdef TRIPLE_DEMOD

    //******************************************************************************
    //                           AM ADC Interface
    //******************************************************************************
    //wire    signed  [11:0]  amDataIn;
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

    `endif //TRIPLE_DEMOD


    `ifdef TRIPLE_DEMOD

    //******************************************************************************
    //                           Processor Read Data Mux
    //******************************************************************************
    always @* begin
        casex(addr)
            `SEMCO_TOP_SPACE:   rd_mux = semcoTopDout;

            `DEMODSPACE,
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

            `DLL0SPACE:         rd_mux = dll0Dout;
            `DLL1SPACE:         rd_mux = dll1Dout;

            `DUAL_DECODERSPACE: rd_mux = dualDecDout;

            `CH1_DECODERSPACE:  rd_mux = ch1DecDout;

            `CandD0SPACE:       rd_mux = clkAndData0Dout;
            `CandD1SPACE:       rd_mux = clkAndData1Dout;

             default :          rd_mux = 16'hxxxx;
        endcase
    end

    `else //TRIPLE_DEMOD

    //******************************************************************************
    //                           Processor Read Data Mux
    //******************************************************************************
    reg [15:0] rd_mux;
    always @* begin
        casex(addr)
            `DEMODSPACE,
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
            `DLL0SPACE: begin
                if (addr[1]) begin
                    rd_mux = dll0Dout[31:16];
                    end
                else begin
                    rd_mux = dll0Dout[15:0];
                    end
                end
            `DLL1SPACE: begin
                if (addr[1]) begin
                    rd_mux = dll1Dout[31:16];
                    end
                else begin
                    rd_mux = dll1Dout[15:0];
                    end
                end
            `PLLSPACE: begin
                if (addr[1]) begin
                    rd_mux = pllDout[31:16];
                    end
                else begin
                    rd_mux = pllDout[15:0];
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
            `CH1_DECODERSPACE: begin
                if (addr[1]) begin
                    rd_mux = ch1DecDout[31:16];
                    end
                else begin
                    rd_mux = ch1DecDout[15:0];
                    end
                end
            `CandD0SPACE: begin
                if (addr[1]) begin
                    rd_mux = clkAndData0Dout[31:16];
                    end
                else begin
                    rd_mux = clkAndData0Dout[15:0];
                    end
                end
            `CandD1SPACE: begin
                if (addr[1]) begin
                    rd_mux = clkAndData1Dout[31:16];
                    end
                else begin
                    rd_mux = clkAndData1Dout[15:0];
                    end
                end
             default : rd_mux = 16'hxxxx;
            endcase
         end

    assign fb_data = (cs & rd) ? rd_mux : 16'hzzzz;

    `endif //TRIPLE_DEMOD

endmodule

