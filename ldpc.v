`timescale 1ns/10ps

`include "addressMap.v"

module ldpc #(parameter LDPCBITS = 3) (
    input                   clk,clkEn,reset,
    input                   busClk,
    input                   cs,
    input                   wr0,wr1,wr2,wr3,
    input           [12:0]  addr,
    input           [31:0]  din,
    output          [31:0]  dout,
    input                   iSymEn,
    input   signed  [17:0]  iSymData,
    input                   qSymEn,
    input   signed  [17:0]  qSymData,
    output                  ldpcBitEnOut,
    output                  ldpcBitOut
    );

    `define VITERBI_SYMEN_DELAY 19

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
    wire    [10:0]  syncThreshold;
    wire            inSync;
    wire    [1:0]   syncState;
    wire    [1:0]   rotation;
    `define LDPC_0_DEGREES      2'b00
    `define LDPC_90_DEGREES     2'b01
    `define LDPC_180_DEGREES    2'b10
    `define LDPC_270_DEGREES    2'b11
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
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .codeLength4096(codeLength4096),
        .codeRate(codeRate),
        .syncThreshold(syncThreshold),
        .ldpcRun(ldpcRun)
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
                        bitSoft <= qSoft;
                    end
                    else if (qSoftEn) begin
                        bitSoft <= -iSoft;
                    end
                `LDPC_180_DEGREES:
                    if (iSoftEn) begin
                        bitSoft <= -iSoft;
                    end
                    else if (qSoftEn) begin
                        bitSoft <= -qSoft;
                    end
                `LDPC_270_DEGREES:
                    if (iSoftEn) begin
                        bitSoft <= -qSoft;
                    end
                    else if (qSoftEn) begin
                        bitSoft <= iSoft;
                    end
            endcase
        end
    end

    ldpcFramer ldpcf(
        .clk(clk),
        .clkEn(clkEn),
        .reset(reset),
        .dataBitIn(bitSoft[LDPCBITS-1]),
        .codeLength4096(codeLength4096),
        .codeRate(codeRate),
        .syncThreshold(syncThreshold),
        .rotation(rotation),
        .frameSync(inSync),
        .codewordEn(codewordEn)
    );

    // Create the LDPC decoder interface
    reg signed  [LDPCBITS:0]    softDecision;
    always @(posedge clk) begin
        if (reset) begin
        end
        else if (clkEn) begin
            // Line up the soft decisions with the codewordEnable
            // and add an LSB of 1 to create a mid-rise quantizer
            softDecision <= $signed({bitSoft,1'b1});
        end
    end

endmodule

