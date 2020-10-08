`timescale 1ns/10ps
`include "addressMap.v"

module digitalPLL(
    input                   clk,
    input                   reset,
    input           [31:0]  centerFreq,
    input           [4:0]   loopGain,
    input           [7:0]   feedbackDivider,
    input                   referenceClkEn,
    output  reg             feedbackClkEn,
    output  reg             dllOutputClk,
    output                  filteredRefClk,
    output  reg     [7:0]   phaseError
);



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

    always @(posedge clk) begin
        feedbackClkEn <= (clkSR == 2'b10);
    end
    assign filteredRefClk = dllOutputClk;

    `endif //ADD_DIVIDER


    // Phase Comparator
    `define DLL_INVERT
    always @(posedge clk) begin
        if (reset) begin
            phaseError <= 0;
        end
        else if (referenceClkEn & !feedbackClkEn) begin
            `ifdef DLL_INVERT
            if ( phaseError[7] || (!phaseError[7] && (phaseError < 8'h7f) ) ) begin
                phaseError <= phaseError + 1;
            end
            `else
            //if ( !phaseError[7] || (phaseError[7] && (phaseError > 8'h81) ) ) begin
                phaseError <= phaseError - 1;
            //end
            `endif
        end
        else if (feedbackClkEn & !referenceClkEn) begin
            `ifdef DLL_INVERT
            if ( !phaseError[7] || (phaseError[7] && (phaseError > 8'h81) ) ) begin
                phaseError <= phaseError - 1;
            end
            `else
            //if ( phaseError[7] || (!phaseError[7] && (phaseError < 8'h7f) ) ) begin
                phaseError <= phaseError + 1;
            //end
            `endif
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
