`include "/addressMap.v"
`timescale 1ns / 10 ps


module clkAndDataOutput 
    (
    input               clk, reset,
    input               busClk,
    input       [12:0]  addr,
    input       [31:0]  din,
    output      [31:0]  dout,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input               clkEnIn,
    input       [2:0]   dataIn,
    input               pllOutputClk,
    output      [3:0]   sourceSelect,
    output              pllReferenceClk,
    output              outputClk,
    output      [2:0]   outputData
);

    parameter RegSpace = `CandD0SPACE;

    // Configuration Regs
    wire    [1:0]   clkPhase;
    wire    [31:0]  dllCenterFreq;
    wire    [4:0]   dllLoopGain;
    wire    [7:0]   dllFeedbackDivider;
    wire    [31:0]  clkAndDataDout;
    clkAndDataRegs #(.RegSpace(RegSpace)) cAndDRegs(
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(dout),
        .source(sourceSelect),
        .clkPhase(clkPhase),
        .clkReset(clkReset),
        .finalOutputSelect(dllSelect),
        .dllCenterFreq(dllCenterFreq),
        .dllLoopGain(dllLoopGain),
        .dllFeedbackDivider(dllFeedbackDivider)
    );

    // First stage attenuation using a Digital PLL
    wire    [7:0]   dllPhaseError;
    digitalPLL dll(
        .clk(clk),
        .reset(clkReset),
        .centerFreq(dllCenterFreq),
        .loopGain(dllLoopGain),
        .feedbackDivider(dllFeedbackDivider),
        .referenceClkEn(clkEnIn),
        .feedbackClkEn(),
        .dllOutputClk(dllOutputClk),
        .filteredRefClk(pllReferenceClk),
        .phaseError(dllPhaseError)
    );

    // Make a Gray-coded divider to create four phase clock
    reg     [1:0]   dllDivider;
    wire            dllReadClk = dllDivider[0];
    wire            dll90Clk   = dllDivider[1];
    always @(posedge dllOutputClk) begin
        case (dllDivider)
            2'b00:      dllDivider <= 2'b01;
            2'b01:      dllDivider <= 2'b11;
            2'b11:      dllDivider <= 2'b10;
            2'b10:      dllDivider <= 2'b00;
            default:    dllDivider <= 2'b00;
        endcase
    end

    // First stage jitter attenuation FIFO
    reg             dll_ReadEnable;
    wire    [2:0]   dll_Symbol;
    wire            dll_HalfFull;

    `ifndef USE_FIFO_64    
            jitterFifo dllFifo(
                .rst(clkReset),
                .wr_clk(clk),
                .rd_clk(dllReadClk),
                .din(dataIn),
                .wr_en(clkEnIn),
                .rd_en(dll_ReadEnable),
                .dout(dll_Symbol),
                .full(dll_Full),
                .empty(dll_Empty),
                .prog_full(dll_HalfFull)
            );
    `else
            jitterFifo64 dllFifo(
                .rst(clkReset),
                .wr_clk(clk),
                .rd_clk(dllReadClk),
                .din(dataIn),
                .wr_en(clkEnIn),
                .rd_en(dll_ReadEnable),
                .dout(dll_Symbol),
                .full(dll_Full),
                .empty(dll_Empty),
                .prog_full(dll_HalfFull)
            );
    `endif

    always @(posedge dllReadClk) begin
        if (clkReset) begin
            dll_ReadEnable <= 0;
        end
        else if (dll_HalfFull) begin
            dll_ReadEnable <= 1;
        end
    end

    // First stage final data output
    reg             dllClk;
    reg     [2:0]   dllData;
    always @(posedge dllOutputClk) begin
        dllData <= dll_Symbol;
        case (clkPhase)
            `CandD_CLK_PHASE_0:   dllClk <= dllReadClk;
            `CandD_CLK_PHASE_90:  dllClk <= dll90Clk;
            `CandD_CLK_PHASE_180: dllClk <= !dllReadClk;
            `CandD_CLK_PHASE_270: dllClk <= !dll90Clk;
        endcase
    end

    // Second stage - This uses an external PLL. The reference input to the
    //  PLL is the DLL output.

    // Make a Gray-coded divider
    reg     [1:0]   pllDivider;
    wire            pllReadClk = pllDivider[0];
    wire            pll90Clk   = pllDivider[1];
    always @(posedge pllOutputClk) begin
        case (pllDivider)
            2'b00:      pllDivider <= 2'b01;
            2'b01:      pllDivider <= 2'b11;
            2'b11:      pllDivider <= 2'b10;
            2'b10:      pllDivider <= 2'b00;
            default:    pllDivider <= 2'b00;
        endcase
    end

    // Second stage jitter attenuation FIFO
    reg             pll_ReadEnable;
    wire    [2:0]   pll_Symbol;
    wire            pll_HalfFull;
    `ifndef USE_FIFO_64
            jitterFifo pllFifo(
                .rst(clkReset),
                .wr_clk(clk),
                .rd_clk(pllReadClk),
                .din(dataIn),
                .wr_en(clkEnIn),
                .rd_en(pll_ReadEnable),
                .dout(pll_Symbol),
                .full(pll_Full),
                .empty(pll_Empty),
                .prog_full(pll_HalfFull)
            );
   `else
            jitterFifo64 pllFifo(
                .rst(clkReset),
                .wr_clk(clk),
                .rd_clk(pllReadClk),
                .din(dataIn),
                .wr_en(clkEnIn),
                .rd_en(pll_ReadEnable),
                .dout(pll_Symbol),
                .full(pll_Full),
                .empty(pll_Empty),
                .prog_full(pll_HalfFull)
            );
   `endif

   always @(posedge pllReadClk) begin
        if (clkReset) begin
            pll_ReadEnable <= 0;
        end
        else if (pll_HalfFull) begin
            pll_ReadEnable <= 1;
        end
    end

    // Second stage final data output
    reg             pllClk;
    reg     [2:0]   pllData;
    always @(posedge pllOutputClk) begin
        pllData <= pll_Symbol;
        case (clkPhase)
            `CandD_CLK_PHASE_0:   pllClk <= pllReadClk;
            `CandD_CLK_PHASE_90:  pllClk <= pll90Clk;
            `CandD_CLK_PHASE_180: pllClk <= !pllReadClk;
            `CandD_CLK_PHASE_270: pllClk <= !pll90Clk;
        endcase
    end

    // Final Output Mux
    assign outputClk =  dllSelect ? dllClk :    pllClk;
    assign outputData = dllSelect ? dllData :   pllData;

endmodule

