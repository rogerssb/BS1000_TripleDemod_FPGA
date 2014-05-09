/////////////////////////////////////////////////////
// despreader
/////////////////////////////////////////////////////

`timescale 1ns / 10 ps
`include ".\addressMap.v"

module dualDespreader (
    clk,
    clkEn, auClkEn,
    reset,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    iIn, qIn,
    dout,
    despreadMode,
    iCode, qCode
    );

parameter SoftBits = 6;

input           clk;
input           clkEn, auClkEn;
input           reset;
input           wr0, wr1, wr2, wr3;
input   [11:0]  addr;
input   [31:0]  din;
input   [17:0]  iIn, qIn;
output  [31:0]  dout;
output  [1:0]   despreadMode;
output          iCode, qCode;

// Microprocessor interface
reg cs;
always @(addr) begin
    casex(addr)
        `DESPREADSPACE: cs <= 1;
        default: cs <= 0;
        endcase
    end

wire    [17:0]  init_a, codeRestartCount_a, polyTaps_a, iOutTaps_a, qOutTaps_a;
wire    [17:0]  init_b, codeRestartCount_b, polyTaps_b, iOutTaps_b;
despreaderRegs regs(
    .addr(addr),
    .din(din),
    .dout(dout),
    .cs(cs),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .despreadMode(despreadMode),
    .init_a(init_a),
    .polyTaps_a(polyTaps_a),
    .codeRestartCount_a(codeRestartCount_a),
    .iOutTaps_a(iOutTaps_a),
    .qOutTaps_a(qOutTaps_a),
    .init_b(init_b),
    .polyTaps_b(polyTaps_b),
    .codeRestartCount_b(codeRestartCount_b),
    .iOutTaps_b(iOutTaps_b)
    );

// Used for debug
reg ld;

reg     iSampleEn, iOnTime, iChipEn;
always @(posedge clk) begin
    if (reset) begin
        iOnTime <= 0;
    end
    else if (clkEn) begin
        iSampleEn <= 1;
        if (iOnTime) begin
            iOnTime <= 0;
            iChipEn <= 1;
        end
        else begin
            iOnTime <= 1;
            iChipEn <= 0;
        end
    end
    else begin
        iSampleEn <= 0;
        iChipEn <= 0;
    end
end

reg     qSampleEn, qOnTime, qChipEn;
always @(posedge clk) begin
    if (reset) begin
        qOnTime <= 0;
    end
    else if (clkEn) begin
        qSampleEn <= 1;
        if (qOnTime) begin
            qOnTime <= 0;
            qChipEn <= 1;
        end
        else begin
            qOnTime <= 1;
            qChipEn <= 0;
        end
    end
    else begin
        qSampleEn <= 0;
        qChipEn <= 0;
    end
end


wire out_a;
codes_gen codes_gen_a(
    .clk(clk),
    .clkEn(iChipEn),
    .reset(reset),
    .ld(ld | reset),
    .init(init_a),
    .polyTaps(polyTaps_a),
    .restartCount(codeRestartCount_a),
    .iOutTaps(iOutTaps_a),
    .qOutTaps(qOutTaps_a),
    .iOut(iOut_a),
    .qOut(qOut_a)
    );

wire out_b;
codes_gen codes_gen_b(
    .clk(clk),
    .clkEn(clkEn),
    .reset(reset),
    .ld(ld | reset),
    .polyTaps(polyTaps_b),
    .restartCount(codeRestartCount_b),
    .iOutTaps(iOutTaps_b),
    .iOut(iOut_b)
    );

reg iCode;
reg qCode;
always @ (posedge clk) begin
    if (iChipEn) begin
        casex (despreadMode)
            `MODE_NASA_DG1_MODE1: begin
                iCode <= iOut_a;
            end

            `MODE_NASA_DG1_MODE2: begin
                iCode <= iOut_a;
            end

            `MODE_NASA_FWD: begin
                iCode <= iOut_a;
            end

            default: begin
                iCode <= iOut_a;
            end
        endcase
    end
    if (qChipEn) begin
        casex (despreadMode)
            `MODE_NASA_DG1_MODE1: begin
                qCode <= qOut_a;
            end

            `MODE_NASA_DG1_MODE2: begin
                qCode <= iOut_b;
            end

            `MODE_NASA_FWD: begin
                qCode <= iOut_b;
            end

            default: begin
                qCode <= qOut_a;
            end
        endcase
    end
end

`define NEW_MAPPING
`ifdef NEW_MAPPING
// Map the inputs to soft decision bits
reg     [SoftBits-1:0]   iSoft;
reg     [SoftBits-1:0]   qSoft;

always @(posedge clk) begin
    if (iIn[17:(18-SoftBits)] == {1'b1,{(SoftBits-1){1'b0}}}) begin
        iSoft <= {1'b1,{(SoftBits-2){1'b0}},1'b1};
    end
    else begin
        iSoft <= iIn[17:(18-SoftBits)];
    end

    if (qIn[17:(18-SoftBits)] == {1'b1,{(SoftBits-1){1'b0}}}) begin
        qSoft <= {1'b1,{(SoftBits-2){1'b0}},1'b1};
    end
    else begin
        qSoft <= qIn[17:(18-SoftBits)];
    end
end

`else

// Map the inputs to soft decision bits
reg     [2:0]   iSoft;
reg     [2:0]   qSoft;

always @(posedge clk) begin
    casex (iIn[17:14]) 
        4'b011x:    iSoft <= 3'b011;
        4'b0101:    iSoft <= 3'b011;
        4'b0100:    iSoft <= 3'b010;
        4'b0011:    iSoft <= 3'b010;
        4'b0010:    iSoft <= 3'b001;
        4'b0001:    iSoft <= 3'b001;
        4'b0000:    iSoft <= 3'b000;
        4'b1111:    iSoft <= 3'b000;
        4'b1110:    iSoft <= 3'b111;
        4'b1101:    iSoft <= 3'b111;
        4'b1100:    iSoft <= 3'b110;
        4'b1011:    iSoft <= 3'b110;
        4'b1010:    iSoft <= 3'b101;
        4'b100x:    iSoft <= 3'b101;
    endcase
    casex (qIn[17:14]) 
        4'b011x:    qSoft = 3'b011;
        4'b0101:    qSoft = 3'b011;
        4'b0100:    qSoft = 3'b010;
        4'b0011:    qSoft = 3'b010;
        4'b0010:    qSoft = 3'b001;
        4'b0001:    qSoft = 3'b001;
        4'b0000:    qSoft = 3'b000;
        4'b1111:    qSoft = 3'b000;
        4'b1110:    qSoft = 3'b111;
        4'b1101:    qSoft = 3'b111;
        4'b1100:    qSoft = 3'b110;
        4'b1011:    qSoft = 3'b110;
        4'b1010:    qSoft = 3'b101;
        4'b100x:    qSoft = 3'b101;
    endcase
end
`endif

wire    [17:0]  iOnTimeCorr;
despreadCorrelator #(.CorrLength(16), .InputBits(SoftBits)) 
iCorrOnTime(
    .clk(clk),
    .clkEn(iSampleEn & iOnTime),
    .reset(reset),
    .codeBit(iCode),
    .rx(iSoft),
    .corrOut()
    );

wire    [17:0]  iOffTimeCorr;
despreadCorrelator #(.CorrLength(16), .InputBits(SoftBits)) 
iCorrOffTime(
    .clk(clk),
    .clkEn(iSampleEn & !iOnTime),
    .reset(reset),
    .codeBit(iCode),
    .rx(iSoft),
    .corrOut()
    );


endmodule


