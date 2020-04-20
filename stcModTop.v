`timescale 1ns/100ps
`include "addressMap.v"

module stcModTop (

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

    `ifdef R6100

    // Video Switch Select Lines
    output      [1:0]   video0InSelect,
    output reg  [1:0]   video0OutSelect,
    output      [1:0]   video1InSelect,
    output reg  [1:0]   video1OutSelect,

    `endif //R6100

    output              adc01_powerDown
);

    parameter VER_NUMBER = 16'd539;


//******************************************************************************
//                          Clock Distribution
//******************************************************************************
    `ifdef R6100
    systemClock systemClock (
        .clk_in1(adc0Clk),
        .clk_out1(clk),
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

//******************************************************************************
//                             Top Level Registers
//******************************************************************************

    reg stcModSpace;
    always @* begin
        casex(addr)
            `STC_MOD_SPACE:         stcModSpace = cs;
            default:                stcModSpace = 0;
        endcase
    end

    wire            [23:0]  pnPolyTaps;
    wire            [4:0]   pnPolyLength;
    wire    signed  [17:0]  h0Real,h0Imag;
    wire    signed  [17:0]  h1Real,h1Imag;
    wire            [31:0]  stcTopDout;
    stcModTopRegs topRegs(
        .busClk(busClk),
        .cs(stcModSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(stcTopDout),
        .clk(clk),
        .versionNumber(VER_NUMBER),
        .reset(reset),
        .reboot(reboot),
        .rebootAddress(),
        .pnPolyTaps(pnPolyTaps),
        .pnPolyLength(pnPolyLength),
        .h0Real(h0Real),
        .h0Imag(h0Imag),
        .h1Real(h1Real),
        .h1Imag(h1Imag),
        .txEnable(txEnableAsync)
    );
    reg [1:0]   txEnableSR;
    reg         txEnable;
    always @(posedge clk) begin
        if (reset) begin
            txEnableSR <= 0;
        end
        else begin
            txEnableSR <= {txEnableSR[0],txEnableAsync};
            txEnable <= txEnableSR[1] && txEnableSR[0];
        end
    end


    //******************************************************************************
    //                               PN Generator
    //******************************************************************************
    bert_lfsr pn_lfsr (
        .poly(pnPolyTaps),
        .poly_length(pnPolyLength),
        .reset(reset),
        .clock(clk),
        .enable(pnBitEn && posEdgeModClkEn),
        .reload(1'b0),
        .load_data(24'b0),
        .data(),
        .serial(pnBit)/*,
        .serialC(pnBit)*/
    );

    //******************************************************************************
    //                           Two Channel Framer
    //******************************************************************************
    stcFramer stcf (
        .clk(clk),
        .clkEn(posEdgeModClkEn),
        .reset(reset),
        .payloadBit(pnBit),
        .payloadBitEn(pnBitEn),
        .stcBit0(stcBit0),
        .stcBit1(stcBit1),
        .stcFrameSync(stcFrameSync)
    );


    //******************************************************************************
    //                          STC Modulator
    //******************************************************************************

    wire    signed  [17:0]  modWaveform0;
    wire    signed  [17:0]  modWaveform1;
    wire    signed  [31:0]  fmModFreq0;
    wire    signed  [31:0]  fmModFreq1;
    wire            [31:0]  stcModDout;
    stcMod stcMod(
        .clk(clk), .clkEn(1'b1), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(stcModDout),
        .modData0(stcBit0),
        .modData1(stcBit1),
        .modDataValid(txEnable),
        .txEnable(txEnable),
        .posEdgeModClkEn(posEdgeModClkEn),
        .modWaveform0(modWaveform0),
        .modWaveform1(modWaveform1),
        .fmModFreq0(fmModFreq0),
        .fmModFreq1(fmModFreq1)
    );


    //******************************************************************************
    //                                DDS Units
    //******************************************************************************

    `ifdef SIMULATE
    reg ddsSimReset;
    initial ddsSimReset = 0;
    wire ddsReset = ddsSimReset || reset;
    `else
    wire ddsReset = reset;
    `endif

    wire            [47:0]  m_axis0;
    wire    signed  [17:0]  qStc0 = m_axis0[41:24];
    wire    signed  [17:0]  iStc0 = m_axis0[17:0];
    dds6p0 dds0(
      .aclk(clk),
      .aclken(1'b1),
      .aresetn(!ddsReset),
      .m_axis_data_tdata(m_axis0),
      .m_axis_data_tvalid(),
      .s_axis_phase_tdata(fmModFreq0),
      .s_axis_phase_tvalid(1'b1)
    );

    wire            [47:0]  m_axis1;
    wire    signed  [17:0]  qStc1 = m_axis1[41:24];
    wire    signed  [17:0]  iStc1 = m_axis1[17:0];
    dds6p0 dds1(
      .aclk(clk),
      .aclken(1'b1),
      .aresetn(!ddsReset),
      .m_axis_data_tdata(m_axis1),
      .m_axis_data_tvalid(),
      .s_axis_phase_tdata(fmModFreq1),
      .s_axis_phase_tvalid(1'b1)
    );


    //******************************************************************************
    //                             Channel Model
    //******************************************************************************

    wire    signed  [17:0]  iCh0;
    wire    signed  [17:0]  qCh0;
    cmpy18 cmpy0(
        .clk(clk),
        .reset(reset),
        .aReal(iStc0),
        .aImag(qStc0),
        .bReal(h0Real),
        .bImag(h0Imag),
        .pReal(iCh0),
        .pImag(qCh0)
    );
    wire    signed  [17:0]  iCh1;
    wire    signed  [17:0]  qCh1;
    cmpy18 cmpy1(
        .clk(clk),
        .reset(reset),
        .aReal(iStc1),
        .aImag(qStc1),
        .bReal(h1Real),
        .bImag(h1Imag),
        .pReal(iCh1),
        .pImag(qCh1)
    );

    wire    signed  [17:0]  iTx = iCh0 + iCh1;
    wire    signed  [17:0]  qTx = qCh0 + qCh1;

//******************************************************************************
//                              Interpolators
//******************************************************************************
    reg     [17:0]  interp0DataIn;
    wire    [3:0]   dac0Source;
    `define DAC_SRC_CH0_FM          4'b0000
    `define DAC_SRC_CH0_I           4'b0001
    `define DAC_SRC_CH0_Q           4'b0010
    `define DAC_SRC_CH1_FM          4'b0011
    `define DAC_SRC_CH1_I           4'b0100
    `define DAC_SRC_CH1_Q           4'b0101
    `define DAC_SRC_TX_I            4'b0110
    `define DAC_SRC_TX_Q            4'b0111
    `define DAC_SRC_POLY            4'b1000
    always @(posedge clk) begin
        case (dac0Source)
            `DAC_SRC_CH0_FM: begin
                interp0DataIn <= modWaveform0;
            end
            `DAC_SRC_CH0_I: begin
                interp0DataIn <= iCh0;
            end
            `DAC_SRC_CH0_Q: begin
                interp0DataIn <= qCh0;
            end
            `DAC_SRC_CH1_FM: begin
                interp0DataIn <= modWaveform1;
            end
            `DAC_SRC_CH1_I: begin
                interp0DataIn <= iCh1;
            end
            `DAC_SRC_CH1_Q: begin
                interp0DataIn <= qCh1;
            end
            `DAC_SRC_TX_I: begin
                interp0DataIn <= iTx;
            end
            `DAC_SRC_TX_Q: begin
                interp0DataIn <= qTx;
            end
            `DAC_SRC_POLY: begin
                interp0DataIn <= {1'b0,stcBit0,16'b0};
            end
            default: begin
                interp0DataIn <= modWaveform0;
            end
        endcase
    end
    wire    [31:0]  interp0Dout;
    wire    [17:0]  interp0DataOut;
    interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) dac0Interp(
        .clk(clk), .reset(reset), .clkEn(1'b1),
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

    reg     [17:0]  interp1DataIn;
    wire    [3:0]   dac1Source;
    always @(posedge clk) begin
        case (dac1Source)
            `DAC_SRC_CH0_FM: begin
                interp1DataIn <= modWaveform0;
            end
            `DAC_SRC_CH0_I: begin
                interp1DataIn <= iCh0;
            end
            `DAC_SRC_CH0_Q: begin
                interp1DataIn <= qCh0;
            end
            `DAC_SRC_CH1_FM: begin
                interp1DataIn <= modWaveform1;
            end
            `DAC_SRC_CH1_I: begin
                interp1DataIn <= iCh1;
            end
            `DAC_SRC_CH1_Q: begin
                interp1DataIn <= qCh1;
            end
            `DAC_SRC_TX_I: begin
                interp1DataIn <= iTx;
            end
            `DAC_SRC_TX_Q: begin
                interp1DataIn <= qTx;
            end
            `DAC_SRC_POLY: begin
                interp1DataIn <= {1'b0,stcBit1,16'b0};
            end
            default: begin
                interp1DataIn <= modWaveform0;
            end
        endcase
    end
    wire    [31:0]  interp1Dout;
    wire    [17:0]  interp1DataOut;
    interpolate #(.RegSpace(`INTERP1SPACE), .FirRegSpace(`VIDFIR1SPACE)) dac1Interp(
        .clk(clk), .reset(reset), .clkEn(1'b1),
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

    `ifndef R6100
    reg     [17:0]  interp2DataIn;
    wire    [3:0]   dac2Source;
    always @(posedge clk) begin
        case (dac2Source)
            `DAC_SRC_CH0_FM: begin
                interp2DataIn <= modWaveform0;
            end
            `DAC_SRC_CH0_I: begin
                interp2DataIn <= iCh0;
            end
            `DAC_SRC_CH0_Q: begin
                interp2DataIn <= qCh0;
            end
            `DAC_SRC_CH1_FM: begin
                interp2DataIn <= modWaveform1;
            end
            `DAC_SRC_CH1_I: begin
                interp2DataIn <= iCh1;
            end
            `DAC_SRC_CH1_Q: begin
                interp2DataIn <= qCh1;
            end
            `DAC_SRC_TX_I: begin
                interp2DataIn <= iTx;
            end
            `DAC_SRC_TX_Q: begin
                interp2DataIn <= qTx;
            end
            `DAC_SRC_POLY: begin
                interp2DataIn <= stcFrameSync ? 18'h20000 : {1'b0,pnBit,16'b0};
            end
            default: begin
                interp2DataIn <= modWaveform0;
            end
        endcase
    end
    wire    [31:0]  interp2Dout;
    wire    [17:0]  interp2DataOut;
    interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) dac2Interp(
        .clk(clk), .reset(reset), .clkEn(1'b1),
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

    `ifdef R6100

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


    `ifdef R6100

    //******************************************************************************
    //                           Processor Read Data Mux
    //******************************************************************************
    always @* begin
        casex(addr)
            `STC_MOD_SPACE:     rd_mux = stcTopDout;

            `FMMODSPACE:        rd_mux = stcModDout;

            `VIDFIR0SPACE,
            `INTERP0SPACE:      rd_mux = interp0Dout;

            `VIDFIR1SPACE,
            `INTERP1SPACE:      rd_mux = interp1Dout;

            `VIDSWITCHSPACE:    rd_mux = vsDout;

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
            `STC_MOD_SPACE:   begin
                if (addr[1]) begin
                    rd_mux = stcTopDout[31:16];
                end
                else begin
                    rd_mux = stcTopDout[15:0];
                end
            end

            `FMMODSPACE: begin
                if (addr[1]) begin
                    rd_mux = stcModDout[31:16];
                end
                else begin
                    rd_mux = stcModDout[15:0];
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
             default : rd_mux = 16'hxxxx;
            endcase
         end

    assign fb_data = (cs & rd) ? rd_mux : 16'hzzzz;

    `endif //R6100

endmodule

