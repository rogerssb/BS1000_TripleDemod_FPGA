`timescale 1ns/10ps
`include "addressMap.v"

`ifdef BITSYNC_BERT

module digitalPLL(
    input                   clk,
    input                   reset,
    input                   busClk,
    input           [12:0]  addr,
    input           [31:0]  dataIn,
    output  reg     [31:0]  dataOut,
    input                   wr0, wr1, wr2, wr3,
    input                   referenceClkEn,
    output  reg             dllOutputClk,
    output                  filteredRefClk,
    output  reg     [7:0]   phaseError
);

    parameter REG_SPACE = `DLL0SPACE;

    // Processor Interface
    reg dllSpace;
    always @* begin
        casex(addr)
            REG_SPACE:  dllSpace = 1;
            default:    dllSpace = 0;
        endcase
    end

    reg     [31:0]  centerFreq;
    reg     [4:0]   loopGain;
    reg     [7:0]   feedbackDivider;
    always @(posedge busClk) begin
        if (dllSpace && wr0) begin
            casex (addr)
                `DLL_CENTER_FREQ: begin
                    centerFreq[7:0] <= dataIn[7:0];
                end
                `DLL_GAINS: begin
                    loopGain[4:0] <= dataIn[4:0];
                end
                default: ;
            endcase
        end
        if (dllSpace && wr1) begin
            casex (addr)
                `DLL_CENTER_FREQ: begin
                    centerFreq[15:8] <= dataIn[15:8];
                end
                default: ;
            endcase
        end
        if (dllSpace && wr2) begin
            casex (addr)
                `DLL_CENTER_FREQ: begin
                    centerFreq[23:16] <= dataIn[23:16];
                end
                `DLL_OUTPUT_DIV: begin
                    feedbackDivider <= dataIn[23:16];
                end
                default: ;
            endcase
        end
        if (dllSpace && wr3) begin
            casex (addr)
                `DLL_CENTER_FREQ: begin
                    centerFreq[31:24] <= dataIn[31:24];
                end
                default: ;
            endcase
        end
    end

    always @* begin
        if (dllSpace) begin
            casex (addr)
                `DLL_CENTER_FREQ:       dataOut = centerFreq;
                `DLL_GAINS:             dataOut = {8'b0,feedbackDivider,11'b0,loopGain};
                `DLL_OUTPUT_DIV:        dataOut = {8'b0,feedbackDivider,11'b0,loopGain};
                default:                dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

`else //BITSYNC_BERT

module digitalPLL(
    input                   clk,
    input                   reset,
    input           [31:0]  centerFreq,
    input           [4:0]   loopGain,
    input           [7:0]   feedbackDivider,
    input                   referenceClkEn,
    output  reg             dllOutputClk,
    output                  filteredRefClk,
    output  reg     [7:0]   phaseError
);



`endif // BITSYNC_BERT

    // NCO
    reg     [31:0]  phase;
    reg     [31:0]  leadError;
    reg     [31:0]  phaseInc;
    wire    [31:0]  phaseSum = phase + phaseInc;
    reg     [1:0]   clkSR;
    always @(posedge clk) begin
        if (reset) begin
            phase <= 0;
        end
        else begin
            phase <= phaseSum[31:0];
            clkSR <= {clkSR[0],phaseSum[31]};
        end
        dllOutputClk <= phase[31];
    end

    `define ADD_DIVIDER
    `ifdef  ADD_DIVIDER

    reg             feedbackClkEn;
    reg             vcoClkEn;
    reg     [7:0]   feedbackCounter;
    always @(posedge clk) begin
        vcoClkEn <= (clkSR == 2'b10);
        if (reset) begin
            feedbackCounter <= feedbackDivider-1;
        end
        else if (vcoClkEn) begin
            if (feedbackCounter > 0) begin
                feedbackCounter <= feedbackCounter - 1;
            end
            else begin
                feedbackCounter <= feedbackDivider-1;
            end
        end
        feedbackClkEn <= (clkSR == 2'b10) && (feedbackCounter == 0);
    end

    reg     [6:0]   outputCounter;
    wire    [6:0]   outputDivider = feedbackDivider[7:1] - 1;
    reg             div2Clock;
    always @(posedge dllOutputClk) begin
        if (reset) begin
            outputCounter <= outputDivider;
            div2Clock <= 0;
        end
        else if (outputCounter > 0) begin
            outputCounter <= outputCounter - 1;
        end
        else begin
            outputCounter <= outputDivider;
            div2Clock <= ~div2Clock;
        end
    end
    assign filteredRefClk = (outputDivider == 7'h7f) ? dllOutputClk : div2Clock;

    `else   //ADD_DIVIDER

    reg             feedbackClkEn;
    always @(posedge clk) begin
        feedbackClkEn <= (clkSR == 2'b10);
    end
    assign filteredRefClk = dllOutputClk;

    `endif //ADD_DIVIDER


    // Phase Comparator
    always @(posedge clk) begin
        if (reset) begin
            phaseError <= 0;
        end
        else if (referenceClkEn & !feedbackClkEn) begin
            phaseError <= phaseError - 1;
        end
        else if (feedbackClkEn & !referenceClkEn) begin
            phaseError <= phaseError + 1;
        end
    end

    // Proportional Loop Filter
    always @(posedge clk) begin
        if (reset) begin
            leadError <= 0;
            end
        else begin
            case(loopGain)
                  5'h00: leadError <= 0;
                  5'h01: leadError <= {{30{phaseError[7]}},phaseError[7:6]};
                  5'h02: leadError <= {{29{phaseError[7]}},phaseError[7:5]};
                  5'h03: leadError <= {{28{phaseError[7]}},phaseError[7:4]};
                  5'h04: leadError <= {{27{phaseError[7]}},phaseError[7:3]};
                  5'h05: leadError <= {{26{phaseError[7]}},phaseError[7:2]};
                  5'h06: leadError <= {{25{phaseError[7]}},phaseError[7:1]};
                  5'h07: leadError <= {{24{phaseError[7]}},phaseError};
                  5'h08: leadError <= {{23{phaseError[7]}},phaseError, 1'b0};
                  5'h09: leadError <= {{22{phaseError[7]}},phaseError, 2'b0};
                  5'h0A: leadError <= {{21{phaseError[7]}},phaseError, 3'b0};
                  5'h0B: leadError <= {{20{phaseError[7]}},phaseError, 4'b0};
                  5'h0C: leadError <= {{19{phaseError[7]}},phaseError, 5'b0};
                  5'h0D: leadError <= {{18{phaseError[7]}},phaseError, 6'b0};
                  5'h0E: leadError <= {{17{phaseError[7]}},phaseError, 7'b0};
                  5'h0F: leadError <= {{16{phaseError[7]}},phaseError, 8'b0};
                  5'h10: leadError <= {{15{phaseError[7]}},phaseError, 9'b0};
                  5'h11: leadError <= {{14{phaseError[7]}},phaseError,10'b0};
                  5'h12: leadError <= {{13{phaseError[7]}},phaseError,11'b0};
                  5'h13: leadError <= {{12{phaseError[7]}},phaseError,12'b0};
                  5'h14: leadError <= {{11{phaseError[7]}},phaseError,13'b0};
                  5'h15: leadError <= {{10{phaseError[7]}},phaseError,14'b0};
                  5'h16: leadError <= {{ 9{phaseError[7]}},phaseError,15'b0};
                  5'h17: leadError <= {{ 8{phaseError[7]}},phaseError,16'b0};
                  5'h18: leadError <= {{ 7{phaseError[7]}},phaseError,17'b0};
                  5'h19: leadError <= {{ 6{phaseError[7]}},phaseError,18'b0};
                  5'h1A: leadError <= {{ 5{phaseError[7]}},phaseError,19'b0};
                  5'h1B: leadError <= {{ 4{phaseError[7]}},phaseError,20'b0};
                  5'h1C: leadError <= {{ 3{phaseError[7]}},phaseError,21'b0};
                  5'h1D: leadError <= {{ 2{phaseError[7]}},phaseError,22'b0};
                  5'h1E: leadError <= {{ 1{phaseError[7]}},phaseError,23'b0};
                  5'h1F: leadError <= {phaseError,24'b0};
            endcase
        end
    end

    wire    [31:0]  errorSum = centerFreq + leadError;
    always @(posedge clk) begin
        // Positive Overflow?
        if (errorSum[31] & !leadError[31]) begin
            phaseInc <= 32'h7fff_ffff;
        end
        // Negative Overflow?
        else if (errorSum[31] & leadError[31]) begin
            phaseInc <= 32'h0000_0000;
        end
        else begin
            phaseInc <= errorSum;
        end
    end



endmodule
