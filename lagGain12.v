/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps

module lagGain12 (
    input                       clk, clkEn, reset,
    input       signed  [11:0]  error,
    input               [4:0]   lagExp,
    input       signed  [31:0]  upperLimit,
    input       signed  [31:0]  lowerLimit,
    input                       sweepEnable,
    input               [31:0]  sweepRateMag,
    input                       carrierInSync,
    input                       clearAccum,
    input               [1:0]   acqTrackControl,
    input                       track,
    output  reg signed  [39:0]  lagAccum
);

    /*************************** Lag Gain Section ********************************/

    // NOTE: The acqTrackControl tells how much to divide the loopwidth by. The choices are
    // zero, 1/2, 1/4, and 1/8. In the loop filter calculations, the lag term is
    // proportional to the square of the loopwidth. That's why the acqTrackControl
    // is shifted left one bit in this calculation.
    wire            [5:0]   lagSum = {1'b0,lagExp} - {3'b0,acqTrackControl,1'b0};
    reg             [4:0]   lagGain;
    reg     signed  [39:0]  lagError;
    always @(posedge clk) begin
        // Set lag gain
        // Are we using the gain to force the lag term to zero?
        if (lagExp == 0) begin
            lagGain <= 0;
        end
        else if (track) begin
            // Did the difference overflow?
            if (lagSum[5]) begin
                // Yes. Limit to the minimum.
                lagGain <= 1;
            end
            else begin
                lagGain <= lagSum[4:0];
            end
        end
        else begin
            lagGain <= lagExp;
        end

        // Calculate the lag error.
        if (reset) begin
            lagError <= 0;
        end
        else if (clkEn) begin
            case(lagGain)
                5'h00: lagError <= $signed(40'h0);
                5'h01: lagError <= $signed({{30{error[11]}},error[11:2]});
                5'h02: lagError <= $signed({{29{error[11]}},error[11:1]});
                5'h03: lagError <= $signed({{28{error[11]}},error});
                5'h04: lagError <= $signed({{27{error[11]}},error, 1'b0});
                5'h05: lagError <= $signed({{26{error[11]}},error, 2'b0});
                5'h06: lagError <= $signed({{25{error[11]}},error, 3'b0});
                5'h07: lagError <= $signed({{24{error[11]}},error, 4'b0});
                5'h08: lagError <= $signed({{23{error[11]}},error, 5'b0});
                5'h09: lagError <= $signed({{22{error[11]}},error, 6'b0});
                5'h0A: lagError <= $signed({{21{error[11]}},error, 7'b0});
                5'h0B: lagError <= $signed({{20{error[11]}},error, 8'b0});
                5'h0C: lagError <= $signed({{19{error[11]}},error, 9'b0});
                5'h0D: lagError <= $signed({{18{error[11]}},error,10'b0});
                5'h0E: lagError <= $signed({{17{error[11]}},error,11'b0});
                5'h0F: lagError <= $signed({{16{error[11]}},error,12'b0});
                5'h10: lagError <= $signed({{15{error[11]}},error,13'b0});
                5'h11: lagError <= $signed({{14{error[11]}},error,14'b0});
                5'h12: lagError <= $signed({{13{error[11]}},error,15'b0});
                5'h13: lagError <= $signed({{12{error[11]}},error,16'b0});
                5'h14: lagError <= $signed({{11{error[11]}},error,17'b0});
                5'h15: lagError <= $signed({{10{error[11]}},error,18'b0});
                5'h16: lagError <= $signed({{09{error[11]}},error,19'b0});
                5'h17: lagError <= $signed({{08{error[11]}},error,20'b0});
                5'h18: lagError <= $signed({{07{error[11]}},error,21'b0});
                5'h19: lagError <= $signed({{06{error[11]}},error,22'b0});
                5'h1A: lagError <= $signed({{05{error[11]}},error,23'b0});
                5'h1B: lagError <= $signed({{04{error[11]}},error,24'b0});
                5'h1C: lagError <= $signed({{03{error[11]}},error,25'b0});
                5'h1D: lagError <= $signed({{02{error[11]}},error,26'b0});
                5'h1E: lagError <= $signed({{01{error[11]}},error,27'b0});
                5'h1F: lagError <= $signed({error,28'b0});
                endcase
            end
        end

    parameter SWEEP_OFF     = 3'b001;
    parameter SWEEP_UP      = 3'b010;
    parameter SWEEP_DOWN    = 3'b100;
    reg         [2:0]   sweepState;
    reg                 sweepingUp;
    reg signed  [31:0]  sweepOffset;
    wire        [31:0]  negSweepRateMag = -sweepRateMag;
    reg                 hitUpperLimit,hitLowerLimit;
    always @ (posedge clk) begin
        if (clkEn) begin
            if (sweepEnable) begin
                case (sweepState)
                    SWEEP_OFF: begin
                        if (carrierInSync) begin
                            sweepState <= SWEEP_OFF;
                            sweepOffset <= 0;
                            end
                        else begin
                            if (sweepingUp) begin
                                sweepState <= SWEEP_UP;
                                sweepOffset <= sweepRateMag;
                                end
                            else begin
                                sweepState <= SWEEP_DOWN;
                                sweepOffset <= negSweepRateMag;
                                end
                            end
                        end
                    SWEEP_UP: begin
                        if (carrierInSync) begin
                            sweepState <= SWEEP_OFF;
                            sweepOffset <= 0;
                            sweepingUp <= 1;
                            end
                        else if (hitUpperLimit) begin
                            sweepState <= SWEEP_DOWN;
                            sweepOffset <= negSweepRateMag;
                            end
                        else begin
                            sweepOffset <= sweepRateMag;
                            end
                        end
                    SWEEP_DOWN: begin
                        if (carrierInSync) begin
                            sweepState <= SWEEP_OFF;
                            sweepOffset <= 0;
                            sweepingUp <= 0;
                            end
                        else if (hitLowerLimit) begin
                            sweepState <= SWEEP_UP;
                            sweepOffset <= sweepRateMag;
                            end
                        else begin
                            sweepOffset <= negSweepRateMag;
                            end
                        end
                    default: begin
                        sweepState <= SWEEP_OFF;
                        sweepOffset <= 0;
                        sweepingUp <= 1;
                        end
                    endcase
                end
            else begin
                sweepState <= SWEEP_OFF;
                sweepOffset <= 0;
                sweepingUp <= 1;
                end
            end
        end


    wire    signed  [39:0]  sum = lagAccum + lagError + $signed({{8{sweepOffset[31]}},sweepOffset});
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
                    hitLowerLimit <= 0;
                    hitUpperLimit <= 1;
                end
                // In this case, the lower limit is reached
                3'b001: begin
                    lagAccum <= $signed({lowerLimit,8'hff});
                    hitLowerLimit <= 1;
                    hitUpperLimit <= 0;
                end
                // In this case, we might reach the upper limit
                3'b010: begin
                    if ($signed(sum[39:8]) >= upperLimit) begin
                        lagAccum <= $signed({upperLimit,8'h0});
                        hitLowerLimit <= 0;
                        hitUpperLimit <= 1;
                    end
                    else begin
                        lagAccum <= sum;
                        hitLowerLimit <= 0;
                        hitUpperLimit <= 0;
                    end
                end
                // In this case, we might reach the lower limit
                3'b011: begin
                    if ($signed(sum[39:8]) <= lowerLimit) begin
                        lagAccum <= $signed({lowerLimit,8'hff});
                        hitLowerLimit <= 1;
                        hitUpperLimit <= 0;
                    end
                    else begin
                        lagAccum <= sum;
                        hitLowerLimit <= 0;
                        hitUpperLimit <= 0;
                    end
                end
                // In this case, we might reach either limit
                3'b000: begin
                    if ($signed(sum[39:8]) >= upperLimit) begin
                        lagAccum <= $signed({upperLimit,8'h0});
                        hitLowerLimit <= 0;
                        hitUpperLimit <= 1;
                    end
                    else if ($signed(sum[39:8]) <= lowerLimit) begin
                        lagAccum <= $signed({lowerLimit,8'hff});
                        hitLowerLimit <= 1;
                        hitUpperLimit <= 0;
                    end
                    else begin
                        lagAccum <= sum;
                        hitLowerLimit <= 0;
                        hitUpperLimit <= 0;
                    end
                end
                // In this case, we might reach either limit
                3'b111: begin
                    if ($signed(sum[39:8]) <= lowerLimit) begin
                        lagAccum <= $signed({lowerLimit,8'hff});
                        hitLowerLimit <= 1;
                        hitUpperLimit <= 0;
                    end
                    else if ($signed(sum[39:8]) >= upperLimit) begin
                        lagAccum <= $signed({upperLimit,8'h0});
                        hitLowerLimit <= 0;
                        hitUpperLimit <= 1;
                    end
                    else begin
                        lagAccum <= sum;
                        hitLowerLimit <= 0;
                        hitUpperLimit <= 0;
                    end
                end
                // Illegal state. Freeze the accumulator.
                3'b10x: begin
                    lagAccum <= lagAccum;
                    hitLowerLimit <= 0;
                    hitUpperLimit <= 0;
                end
            endcase
        end
    end


endmodule
