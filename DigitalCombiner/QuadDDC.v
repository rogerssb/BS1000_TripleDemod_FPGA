
`timescale 1ns / 10 ps

module quadDdc(
    input           clk, reset,
    input   [17:0]  ifIn,
    output          syncOut,
    output  [17:0]  iOut, qOut
    );

reg [1:0]   phase;
reg [17:0]  iMix, qMix;

always @(posedge clk) begin
    if (reset) begin
        phase <= 0;
        end
    else
        phase <= phase + 1;
        case (phase)
            0:  begin
                iMix <= ifIn;
                qMix <= 0;
                end
            1:  begin
                iMix <= 0;
                qMix <= ifIn;
                end
            2:  begin
                iMix <= -ifIn;
                qMix <= 0;
                end
            default: begin
                iMix <= 0;
                qMix <= -ifIn;
                end
        endcase
    end

// First Halfband Filters
dualHalfbandDecimate hb0(
    .clk(clk), .reset(reset), .clkEn(1'b1),
    .iIn(iMix),.qIn(qMix),
    .iOut(iOut),.qOut(qOut),
    .clkEnOut(SyncOut)
    );

endmodule