`timescale 1ns/10ps

`include "addressMap.v"

module ldpc #(parameter LDPCBITS = 3) (
    input                       clk,clkEn,reset,
    input                       busClk,
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input                       iSymEn,
    input       signed  [17:0]  iSymData,
    input                       qSymEn,
    input       signed  [17:0]  qSymData,
    input               [3:0]   dac0Select,dac1Select,dac2Select,
    output  reg                 dac0ClkEn,
    output  reg signed  [17:0]  dac0Data,
    output  reg                 dac1ClkEn,
    output  reg signed  [17:0]  dac1Data,
    output  reg                 dac2ClkEn,
    output  reg signed  [17:0]  dac2Data,
    output                      ldpcBitEnOut,
    output                      ldpcBitOut
    );

    //`define LDPC_2X

    reg ldpcSpace;
    always @* begin
        casex(addr)
            `LDPCSPACE:     ldpcSpace = cs;
            default:        ldpcSpace = 0;
        endcase
    end

    wire    [15:0]  invMeanMantissa;
    wire    [2:0]   invMeanExponent;
    wire    [1:0]   codeRate;
    wire    [1:0]   derandMode;
    wire    [10:0]  syncThreshold;
    wire            inSync;
    wire    [1:0]   syncState;
    wire    [1:0]   rotation;
        `define LDPC_0_DEGREES      2'b00
        `define LDPC_90_DEGREES     2'b01
        `define LDPC_180_DEGREES    2'b10
        `define LDPC_270_DEGREES    2'b11
    wire    [15:0]  outputEnClkDiv;
    wire    [15:0]  maxIterations;
    wire    [31:0]  dllCenterFreq;
    wire    [4:0]   dllLoopGain;
    wire    [7:0]   dllFeedbackDivider;
    ldpcRegs lregs(
        .busClk(busClk),
        .cs(ldpcSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .inSync(inSync),
        .syncState(syncState),
        .rotation(rotation),
        .ldpcReady(ldpcReady),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .codeLength4096(codeLength4096),
        .codeRate(codeRate),
        .derandMode(derandMode),
        .syncThreshold(syncThreshold),
        .ldpcRun(ldpcRun),
        .outputEnClkDiv(outputEnClkDiv),
        .maxIterations(maxIterations),
        .invertData(invertData),
        .dllCenterFreq(dllCenterFreq),
        .dllLoopGain(dllLoopGain),
        .dllFeedbackDivider(dllFeedbackDivider)
    );

    // Clock enables.
    wire            iSoftEn = (clkEn & iSymEn);
    wire            qSoftEn = (clkEn & qSymEn);

    // Soft Decision Mapper
    wire    signed  [LDPCBITS-1:0]  iSoft;
    ldpcDecisionMapper #(.OUTBITS(LDPCBITS)) iMap(
        .clk(clk),
        .clkEn(iSoftEn),
        .reset(reset),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .dIn(iSymData),
        .dOut(iSoft)
    );
    wire    signed  [LDPCBITS-1:0]  qSoft;
    ldpcDecisionMapper #(.OUTBITS(LDPCBITS)) qMap(
        .clk(clk),
        .clkEn(qSoftEn),
        .reset(reset),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .dIn(qSymData),
        .dOut(qSoft)
    );

    // Recover a soft decision bit stream
    // NOTE: The bit inversion causes a numeric inversion because we're using
    // a mid-rise quantizer
    reg signed  [LDPCBITS-1:0] bitSoft;
    always @(posedge clk) begin
        if (clkEn) begin
            case (rotation)
                `LDPC_0_DEGREES:
                    if (iSoftEn) begin
                        bitSoft <= iSoft;
                    end
                    else if (qSoftEn) begin
                        bitSoft <= qSoft;
                    end
                `LDPC_90_DEGREES:
                    if (iSoftEn) begin
                        bitSoft <= ~iSoft;
                    end
                    else if (qSoftEn) begin
                        bitSoft <= qSoft;
                    end
                `LDPC_180_DEGREES:
                    if (iSoftEn) begin
                        bitSoft <= ~iSoft;
                    end
                    else if (qSoftEn) begin
                        bitSoft <= ~qSoft;
                    end
                `LDPC_270_DEGREES:
                    if (iSoftEn) begin
                        bitSoft <= iSoft;
                    end
                    else if (qSoftEn) begin
                        bitSoft <= ~qSoft;
                    end
            endcase
        end
    end

    wire    signed  [17:0]  correlation;
    wire    signed  [17:0]  sprtSyncCount;
    ldpcFramer ldpcf(
        .clk(clk),
        .clkEn(clkEn),
        .reset(reset),
        .ldpcRun(ldpcRun),
        .ldpcReady(ldpcReady),
        .dataBitIn(bitSoft[LDPCBITS-1]),
        .codeLength4096(codeLength4096),
        .codeRate(codeRate),
        .syncThreshold(syncThreshold),
        .rotation(rotation),
        .frameSyncState(syncState),
        .frameSync(inSync),
        .codewordEn(codewordEn),
        .correlation(correlation),
        .sprtSyncCount(sprtSyncCount)
    );

    // Create the LDPC decoder interface
    reg signed  [LDPCBITS-1:0]  bitSoftDelayed;
    reg signed  [LDPCBITS:0]    softDecision;
    always @(posedge clk) begin
        if (reset) begin
        end
        else if (clkEn) begin
            // Line up the soft decisions with the codewordEnable
            // and add an LSB of 1 to create a mid-rise quantizer
            bitSoftDelayed <= invertData ? ~bitSoft : bitSoft;
            softDecision <= $signed({bitSoftDelayed,1'b1});
        end
    end

    `ifdef USE_FAKE_LDPC_DECODER

    assign ldpcReady = ldpcRun;
    assign ldpcBitEnOut = (clkEn & codewordEn);
    assign ldpcBitOut = softDecision[LDPCBITS];

    `else // USE_FAKE_LDPC_DECODER

    `ifdef LDPC_2X
     ldpcClkDoubler ldpcc (
        .clk_in1(clk),
        .reset(reset),
        .locked(locked),
        .clk_out1(clk2x)
     );
    `endif

    wire    [15:0]  ldpcWriteAddr;
    wire    [7:0]   iterationNumber;
    wire    [7:0]   iterationNumberB;
    ldpcDecoder ldpcd (
        `ifdef LDPC_2X
        .clock_2x(clk2x),
        `endif
        .clock_rtl(clk),
        .reset_rtl(reset),
        .LDPC_RUN(ldpcRun),
        .deran_sel(derandMode),
        .clk_div(outputEnClkDiv),
        .BLOCK_RATE(codeRate),
        .BLOCK_SIZE({codeLength4096,~codeLength4096}),
        .sync(codewordEn),
        .write_clk_en(clkEn),
        .data_in(softDecision),
        .buff_ready(ldpcReady),
        .DECODE_OUT(ldpcBitOut),
        .DECODE_OUT_VALID(ldpcBitEnOut),
        .rd_clk_in(dllClkEn),
        //.rd_clk_in(clkEnOut),
        .rd_clk_out(clkEnOut),
        .cur_write_pos_V(ldpcWriteAddr),
        .Iteration_Number(iterationNumber),
        .Decoder_B_Iterations(iterationNumberB),
        .pMaxIterations(maxIterations),
        .read_clk_en(),
        .cur_read_pos_V(),
        .deran_data(),
        .deran_data_ap_vld(),
        .ERR_CODE(),
        .LDPC_MODE(),
        .cnt(),
        .cnt_B(),
        .full(),
        .overrun()
    );

    // First stage attenuation using a Digital PLL
    wire    [7:0]   dllPhaseError;
    digitalPLL dll(
        .clk(clk),
        .reset(!ldpcReady),
        .centerFreq(dllCenterFreq),
        .loopGain(dllLoopGain),
        .feedbackDivider(dllFeedbackDivider),
        .referenceClkEn(clkEnOut),
        .feedbackClkEn(dllClkEn),
        .dllOutputClk(),
        .filteredRefClk(pllReferenceClk),
        .phaseError()
    );


    `endif //USE_FAKE_LDPC_DECODER

    always @(posedge clk) begin
        case (dac0Select)
            `DAC_I: begin
                dac0Data <= {softDecision,{(18-LDPCBITS){1'b0}}};
                dac0ClkEn <= clkEn;
            end
            `DAC_Q: begin
                dac0Data <= {1'b0,ldpcBitEnOut,16'b0};
                dac0ClkEn <= 1'b1;
            end
            `DAC_LDPC_CORR: begin
                dac0Data <= correlation;
                dac0ClkEn <= clkEn;
            end
            `DAC_LDPC_SPRT: begin
                dac0Data <= sprtSyncCount;
                dac0ClkEn <= clkEn;
            end
            `DAC_LDPC_CTRL: begin
                dac0Data <= {1'b0,codewordEn,16'b0};
                dac0ClkEn <= clkEn;
            end
            default: begin
                dac0Data <= {softDecision,{(18-LDPCBITS){1'b0}}};
                dac0ClkEn <= clkEn;
            end
        endcase
        case (dac1Select)
            `DAC_I: begin
                dac1Data <= {softDecision,{(18-LDPCBITS){1'b0}}};
                dac1ClkEn <= clkEn;
            end
            `DAC_Q: begin
                dac1Data <= {1'b0,ldpcBitOut,16'b0};
                dac1ClkEn <= 1'b1;
            end
            `DAC_LDPC_CORR: begin
                dac1Data <= correlation;
                dac1ClkEn <= clkEn;
            end
            `DAC_LDPC_SPRT: begin
                dac1Data <= sprtSyncCount;
                dac1ClkEn <= clkEn;
            end
            `ifndef USE_FAKE_LDPC_DECODER
            `DAC_LDPC_CTRL: begin
                dac1Data <= {1'b0,iterationNumber[2:0],14'b0};
                dac1ClkEn <= clkEn;
            end
            `endif
            default: begin
                dac1Data <= {softDecision,{(18-LDPCBITS){1'b0}}};
                dac1ClkEn <= clkEn;
            end
        endcase
        case (dac2Select)
            `DAC_I: begin
                dac2Data <= {softDecision,{(18-LDPCBITS){1'b0}}};
                dac2ClkEn <= clkEn;
            end
            `DAC_LDPC_CORR: begin
                dac2Data <= correlation;
                dac2ClkEn <= clkEn;
            end
            `DAC_LDPC_SPRT: begin
                dac2Data <= sprtSyncCount;
                dac2ClkEn <= clkEn;
            end
            `ifndef USE_FAKE_LDPC_DECODER
            `DAC_LDPC_CTRL: begin
                dac2Data <= {1'b0,iterationNumberB[2:0],14'b0};
                dac2ClkEn <= clkEn;
            end
            `endif
            default: begin
                dac2Data <= {softDecision,{(18-LDPCBITS){1'b0}}};
                dac2ClkEn <= clkEn;
            end
        endcase
    end
endmodule

