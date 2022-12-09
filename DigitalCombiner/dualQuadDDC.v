
`timescale 1ns / 10 ps

module dualQuadDdc(
    input           clk, reset, invert,
    input   [17:0]  ifIn1, ifIn2,
    output          clkEnOut,
    output  [17:0]  iOut1, qOut1, iOut2, qOut2
    );

reg [1:0]   phase;
reg [17:0]  iMix1, qMix1, iMix2, qMix2;

always @(posedge clk) begin
    if (reset) begin
        phase <= 0;
        end
    else
        if (invert) begin
            phase <= phase + 1;
        end
        else begin
            phase <= phase - 1;
        end
        case (phase)
            0:  begin
                iMix1 <= ifIn1 << 1;
                qMix1 <= 0;
                iMix2 <= ifIn2 << 1;
                qMix2 <= 0;
                end
            1:  begin
                iMix1 <= 0;
                qMix1 <= ifIn1 << 1;
                iMix2 <= 0;
                qMix2 <= ifIn2 << 1;
                end
            2:  begin               // watch for -1 saturating. x20000 x -1 = x1ffff + 1 (invert and add 1) = x20000
                iMix1 <= ~ifIn1 << 1;
                qMix1 <= 0;
                iMix2 <= ~ifIn2 << 1;
                qMix2 <= 0;
                end
            default: begin
                iMix1 <= 0;
                qMix1 <= ~ifIn1 << 1;
                iMix2 <= 0;
                qMix2 <= ~ifIn2 << 1;
                end
        endcase
    end

// Halfband Filters
dualHalfbandDecimate hb1(
    .clk(clk), .reset(reset), .clkEn(1'b1),
    .iIn(iMix1),.qIn(qMix1),
    .iOut(iOut1),.qOut(qOut1),
    .clkEnOut(clkEnOut)
    );

dualHalfbandDecimate hb2(
    .clk(clk), .reset(reset), .clkEn(1'b1),
    .iIn(iMix2),.qIn(qMix2),
    .iOut(iOut2),.qOut(qOut2),
    .clkEnOut()
    );

endmodule