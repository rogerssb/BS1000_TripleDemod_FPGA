/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps

module stcLagGain12 (
    input                       clk, clkEn, reset, 
    input       signed  [11:0]  phaseError,
    input       signed  [11:0]  freqError,
    input               [4:0]   phaseLagExp,
    input               [4:0]   freqLagExp,
    input       signed  [31:0]  upperLimit,
    input       signed  [31:0]  lowerLimit,
    input                       carrierInSync,
    input                       freqAcquired,
    input                       clearAccum,
    output  reg signed  [39:0]  lagAccum
);

    /*************************** Lag Gain Section ********************************/

    reg     signed  [39:0]  phaseLagError;
    always @(posedge clk) begin
        // Calculate the lag error.
        if (reset) begin
            phaseLagError <= 0;
        end
        else if (clkEn) begin
            case(phaseLagExp)
                5'h00: phaseLagError <= $signed(40'h0);
                5'h01: phaseLagError <= $signed({{30{phaseError[11]}},phaseError[11:2]});  
                5'h02: phaseLagError <= $signed({{29{phaseError[11]}},phaseError[11:1]});  
                5'h03: phaseLagError <= $signed({{28{phaseError[11]}},phaseError});  
                5'h04: phaseLagError <= $signed({{27{phaseError[11]}},phaseError, 1'b0});  
                5'h05: phaseLagError <= $signed({{26{phaseError[11]}},phaseError, 2'b0});  
                5'h06: phaseLagError <= $signed({{25{phaseError[11]}},phaseError, 3'b0});  
                5'h07: phaseLagError <= $signed({{24{phaseError[11]}},phaseError, 4'b0});  
                5'h08: phaseLagError <= $signed({{23{phaseError[11]}},phaseError, 5'b0});  
                5'h09: phaseLagError <= $signed({{22{phaseError[11]}},phaseError, 6'b0}); 
                5'h0A: phaseLagError <= $signed({{21{phaseError[11]}},phaseError, 7'b0}); 
                5'h0B: phaseLagError <= $signed({{20{phaseError[11]}},phaseError, 8'b0}); 
                5'h0C: phaseLagError <= $signed({{19{phaseError[11]}},phaseError, 9'b0}); 
                5'h0D: phaseLagError <= $signed({{18{phaseError[11]}},phaseError,10'b0}); 
                5'h0E: phaseLagError <= $signed({{17{phaseError[11]}},phaseError,11'b0}); 
                5'h0F: phaseLagError <= $signed({{16{phaseError[11]}},phaseError,12'b0}); 
                5'h10: phaseLagError <= $signed({{15{phaseError[11]}},phaseError,13'b0}); 
                5'h11: phaseLagError <= $signed({{14{phaseError[11]}},phaseError,14'b0}); 
                5'h12: phaseLagError <= $signed({{13{phaseError[11]}},phaseError,15'b0}); 
                5'h13: phaseLagError <= $signed({{12{phaseError[11]}},phaseError,16'b0}); 
                5'h14: phaseLagError <= $signed({{11{phaseError[11]}},phaseError,17'b0}); 
                5'h15: phaseLagError <= $signed({{10{phaseError[11]}},phaseError,18'b0}); 
                5'h16: phaseLagError <= $signed({{09{phaseError[11]}},phaseError,19'b0}); 
                5'h17: phaseLagError <= $signed({{08{phaseError[11]}},phaseError,20'b0}); 
                5'h18: phaseLagError <= $signed({{07{phaseError[11]}},phaseError,21'b0}); 
                5'h19: phaseLagError <= $signed({{06{phaseError[11]}},phaseError,22'b0}); 
                5'h1A: phaseLagError <= $signed({{05{phaseError[11]}},phaseError,23'b0}); 
                5'h1B: phaseLagError <= $signed({{04{phaseError[11]}},phaseError,24'b0}); 
                5'h1C: phaseLagError <= $signed({{03{phaseError[11]}},phaseError,25'b0}); 
                5'h1D: phaseLagError <= $signed({{02{phaseError[11]}},phaseError,26'b0}); 
                5'h1E: phaseLagError <= $signed({{01{phaseError[11]}},phaseError,27'b0}); 
                5'h1F: phaseLagError <= $signed({phaseError,28'b0});                
                endcase
            end
        end

    reg     signed  [39:0]  freqLagError;
    always @(posedge clk) begin
        // Calculate the lag error.
        if (reset) begin
            freqLagError <= 0;
        end
        else if (clkEn) begin
            case(freqLagExp)
                5'h00: freqLagError <= $signed(40'h0);
                5'h01: freqLagError <= $signed({{30{freqError[11]}},freqError[11:2]});  
                5'h02: freqLagError <= $signed({{29{freqError[11]}},freqError[11:1]});  
                5'h03: freqLagError <= $signed({{28{freqError[11]}},freqError});  
                5'h04: freqLagError <= $signed({{27{freqError[11]}},freqError, 1'b0});  
                5'h05: freqLagError <= $signed({{26{freqError[11]}},freqError, 2'b0});  
                5'h06: freqLagError <= $signed({{25{freqError[11]}},freqError, 3'b0});  
                5'h07: freqLagError <= $signed({{24{freqError[11]}},freqError, 4'b0});  
                5'h08: freqLagError <= $signed({{23{freqError[11]}},freqError, 5'b0});  
                5'h09: freqLagError <= $signed({{22{freqError[11]}},freqError, 6'b0}); 
                5'h0A: freqLagError <= $signed({{21{freqError[11]}},freqError, 7'b0}); 
                5'h0B: freqLagError <= $signed({{20{freqError[11]}},freqError, 8'b0}); 
                5'h0C: freqLagError <= $signed({{19{freqError[11]}},freqError, 9'b0}); 
                5'h0D: freqLagError <= $signed({{18{freqError[11]}},freqError,10'b0}); 
                5'h0E: freqLagError <= $signed({{17{freqError[11]}},freqError,11'b0}); 
                5'h0F: freqLagError <= $signed({{16{freqError[11]}},freqError,12'b0}); 
                5'h10: freqLagError <= $signed({{15{freqError[11]}},freqError,13'b0}); 
                5'h11: freqLagError <= $signed({{14{freqError[11]}},freqError,14'b0}); 
                5'h12: freqLagError <= $signed({{13{freqError[11]}},freqError,15'b0}); 
                5'h13: freqLagError <= $signed({{12{freqError[11]}},freqError,16'b0}); 
                5'h14: freqLagError <= $signed({{11{freqError[11]}},freqError,17'b0}); 
                5'h15: freqLagError <= $signed({{10{freqError[11]}},freqError,18'b0}); 
                5'h16: freqLagError <= $signed({{09{freqError[11]}},freqError,19'b0}); 
                5'h17: freqLagError <= $signed({{08{freqError[11]}},freqError,20'b0}); 
                5'h18: freqLagError <= $signed({{07{freqError[11]}},freqError,21'b0}); 
                5'h19: freqLagError <= $signed({{06{freqError[11]}},freqError,22'b0}); 
                5'h1A: freqLagError <= $signed({{05{freqError[11]}},freqError,23'b0}); 
                5'h1B: freqLagError <= $signed({{04{freqError[11]}},freqError,24'b0}); 
                5'h1C: freqLagError <= $signed({{03{freqError[11]}},freqError,25'b0}); 
                5'h1D: freqLagError <= $signed({{02{freqError[11]}},freqError,26'b0}); 
                5'h1E: freqLagError <= $signed({{01{freqError[11]}},freqError,27'b0}); 
                5'h1F: freqLagError <= $signed({freqError,28'b0});                
                endcase
            end
        end

    reg     signed  [39:0]  lagError;
    always @(posedge clk) begin
        if (reset) begin
            lagError <= 0;
        end
        else if (clkEn) begin
            if (!freqAcquired) begin
                lagError <= freqLagError;
            end
            else begin
                lagError <= phaseLagError;
            end
        end
    end

    wire    signed  [39:0]  sum = lagAccum + lagError;
    always @ (posedge clk) begin
        if (reset) begin
            lagAccum <= 0;
        end
        else if (clearAccum) begin
            lagAccum <= 0;
        end
        else if (clkEn) begin
            // Test the upper and lower limits on the accumulator.

            casex ({upperLimit[31],lowerLimit[31],sum[39]})
                // In this case, the upper limit is reached
                3'b110: begin
                    lagAccum <= $signed({upperLimit,8'h0});
                end
                // In this case, the lower limit is reached
                3'b001: begin
                    lagAccum <= $signed({lowerLimit,8'hff});
                end
                // In this case, we might reach the upper limit
                3'b010: begin
                    if ($signed(sum[39:8]) >= upperLimit) begin 
                        lagAccum <= $signed({upperLimit,8'h0});
                    end
                    else begin
                        lagAccum <= sum;
                    end
                end
                // In this case, we might reach the lower limit
                3'b011: begin
                    if ($signed(sum[39:8]) <= lowerLimit) begin
                        lagAccum <= $signed({lowerLimit,8'hff});
                    end
                    else begin
                        lagAccum <= sum;
                    end
                end
                // In this case, we might reach either limit
                3'b000: begin
                    if ($signed(sum[39:8]) >= upperLimit) begin 
                        lagAccum <= $signed({upperLimit,8'h0});
                    end
                    else if ($signed(sum[39:8]) <= lowerLimit) begin
                        lagAccum <= $signed({lowerLimit,8'hff});
                    end
                    else begin
                        lagAccum <= sum;
                    end
                end
                // In this case, we might reach either limit
                3'b111: begin
                    if ($signed(sum[39:8]) <= lowerLimit) begin
                        lagAccum <= $signed({lowerLimit,8'hff});
                    end
                    else if ($signed(sum[39:8]) >= upperLimit) begin 
                        lagAccum <= $signed({upperLimit,8'h0});
                    end
                    else begin
                        lagAccum <= sum;
                    end
                end
                // Illegal state. Freeze the accumulator.
                3'b10x: begin
                    lagAccum <= lagAccum;
                end
            endcase
        end
    end


endmodule
