`timescale 1ns/10ps

`include "addressMap.v"

module turbo #(parameter TURBOBITS = 3) (
    input                       clk93, clk31, clkEn,reset,
    input                       busClk,
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input               [1:0]   bitsyncMode,
    input                       iSymEn,
    input       signed  [17:0]  iSymData,
    input                       qSymEn,
    input       signed  [17:0]  qSymData,
    output  reg                 dac0ClkEn,
    output  reg signed  [17:0]  dac0Data,
    output  reg                 dac1ClkEn,
    output  reg signed  [17:0]  dac1Data,
    output  reg                 dac2ClkEn,
    output  reg signed  [17:0]  dac2Data,
    output                      turboBitEnOut,
    output                      turboBitOut
    );

    reg turboSpace;
    always @* begin
        casex(addr)
            `TURBOSPACE:    turboSpace = cs;
            default:        turboSpace = 0;
        endcase
    end

    wire    [15:0]  invMeanMantissa;
    wire    [2:0]   invMeanExponent;
    wire    [2:0]   codeRate;
    wire    [2:0]   codeLength;
    wire    [3:0]   maxIterations;
    wire    [15:0]  outputEnClkDiv;
    wire    [3:0]   dac0Select;
    wire    [3:0]   dac1Select;
    wire    [3:0]   dac2Select;
    turboRegs tregs(
        .busClk(busClk),
        .cs(turboSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .codeRate(codeRate),
        .codeLength(codeLength),
        .maxIterations(maxIterations),
        .outputEnClkDiv(outputEnClkDiv),
        .dac0Select(dac0Select),
        .dac1Select(dac1Select),
        .dac2Select(dac2Select)
    );

    // Clock enables.
    wire            iSoftEn = (clkEn & iSymEn);
    wire            qSoftEn = (clkEn & qSymEn);

    // Soft Decision Mapper
    wire    signed  [TURBOBITS-1:0]  iSoft;
    ldpcDecisionMapper #(.OUTBITS(TURBOBITS)) iMap(
        .clk(clk93),
        .clkEn(iSoftEn),
        .reset(reset),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .dIn(iSymData),
        .dOut(iSoft)
    );
    wire    signed  [TURBOBITS-1:0]  qSoft;
    ldpcDecisionMapper #(.OUTBITS(TURBOBITS)) qMap(
        .clk(clk93),
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
    reg signed  [TURBOBITS-1:0] bitSoft;
    reg signed  [TURBOBITS-1:0] qSoftDelayed;
    always @(posedge clk93) begin
        if (clkEn) begin
            case (bitsyncMode)
                // BPSK or FSK. Use i channel only
                `BS_MODE_SINGLE_CH: begin
                    if (iSoftEn) begin
                        bitSoft <= iSoft;
                    end
                end
                // QPSK. Demux the two soft decisions
                `BS_MODE_DUAL_CH: begin
                    if (iSoftEn) begin
                        bitSoft <= iSoft;
                        qSoftDelayed <= qSoft;
                    end
                    else if (clkEn) begin
                        bitSoft <= qSoftDelayed;
                    end
                end
                // OQPSK.
                `BS_MODE_OFFSET_CH: begin
                    if (iSoftEn) begin
                        bitSoft <= iSoft;
                    end
                    else if (qSoftEn) begin
                        bitSoft <= qSoft;
                    end
                end
                default: begin
                    if (iSoftEn) begin
                        bitSoft <= iSoft;
                    end
                end
            endcase
        end
    end

    wire    [3:0]   iterationNumber;
    TurboDecoder #(.DATA_WIDTH(TURBOBITS+1)) turbod (
        .clk93(clk93),
		  .clk31(clk31),
        .Reset(reset),
        .bitsyncMode(bitsyncMode),
        .ch0En(iSoftEn),
        // Add an LSB of 1 to create a mid-rise quantizer
        .ch0Data({iSoft,1'b1}),
        .ch1En(qSoftEn),
        // Add an LSB of 1 to create a mid-rise quantizer
        .ch1Data({qSoft,1'b1}),
        .Iterations(maxIterations),
        .Rate(codeRate),
        .Frame(codeLength),
        .ClkPerBit(outputEnClkDiv),
        .IterationCntr(iterationNumber),
        .DataOut(),
        .Magnitude(),
        .SyncOut(),
        .uHat(),
        .ValidOut(),
		  .BitClk(),
        .BitOut(turboBitOut),
        .BitOutEn(turboBitEnOut)
    );

    always @(posedge clk93) begin
        case (dac0Select)
            `DAC_I: begin
                dac0Data <= {{iSoft,1'b1},{(18-TURBOBITS-1){1'b0}}};
                dac0ClkEn <= clkEn;
            end
            `DAC_Q: begin
                dac0Data <= {1'b0,turboBitEnOut,16'b0};
                dac0ClkEn <= 1'b1;
            end
            default: begin
                dac0Data <= {{iSoft,1'b1},{(18-TURBOBITS-1){1'b0}}};
                dac0ClkEn <= clkEn;
            end
        endcase
        case (dac1Select)
            `DAC_I: begin
                dac1Data <= {{qSoft,1'b1},{(18-TURBOBITS-1){1'b0}}};
                dac1ClkEn <= clkEn;
            end
            `DAC_Q: begin
                dac1Data <= {1'b0,turboBitOut,16'b0};
                dac1ClkEn <= 1'b1;
            end
            default: begin
                dac1Data <= {{qSoft,1'b1},{(18-TURBOBITS-1){1'b0}}};
                dac1ClkEn <= clkEn;
            end
        endcase
        case (dac2Select)
            `DAC_I: begin
                dac2Data <= {{iSoft,1'b1},{(18-TURBOBITS-1){1'b0}}};
                dac2ClkEn <= clkEn;
            end
            `DAC_Q: begin
                dac2Data <= {{qSoft,1'b1},{(18-TURBOBITS-1){1'b0}}};
                dac2ClkEn <= clkEn;
            end
            default: begin
                dac2Data <= {{iSoft,1'b1},{(18-TURBOBITS-1){1'b0}}};
                dac2ClkEn <= clkEn;
            end
        endcase
    end
endmodule

