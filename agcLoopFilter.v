/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include ".\addressMap.v"

module agcLoopFilter (
    input           clk, clkEn, reset, 
    `ifdef USE_BUS_CLOCK
    input           busClk,
    `endif
    input           cs,
    input           wr0,wr1,wr2,wr3,
    input   [12:0]  addr,
    input   [31:0]  din,
    output  [31:0]  dout,
    input   [7:0]   signalLevel,
    output  [31:0]  loopOutput
);

    // Microprocessor interface
    wire    [4:0]   posErrorGain,negErrorGain;
    wire    [31:0]  lowerLimit;
    wire    [31:0]  upperLimit;
    wire    [7:0]   agcSetpoint;
    reg     [31:0]  integrator;
    agcLoopRegs loopRegs(
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .agcSetpoint(agcSetpoint),
        .invertError(invertError),
        .zeroError(zeroError),
        .posErrorGain(posErrorGain),
        .negErrorGain(negErrorGain),
        .upperLimit(upperLimit),
        .lowerLimit(lowerLimit),
        .integrator(integrator)
        );

    /**************************** Adjust Error ************************************/
    reg  signed [7:0]   loopError;
    wire signed [8:0]   error = $signed({1'b0,agcSetpoint}) - $signed({1'b0,signalLevel});
    wire signed [8:0]   negError = $signed({1'b0,signalLevel}) - $signed({1'b0,agcSetpoint});
    always @(posedge clk) begin 
        if (zeroError) begin
            loopError <= 8'h0;
        end
        else if (invertError) begin
            loopError <= $signed(negError[8:1]);
        end
        else begin
            loopError <= $signed(error[8:1]);
        end
    end



    /*************************** Lead Gain Section ********************************/

    reg signed  [31:0]  leadError;
    wire        [4:0]   loopGain = loopError[7] ? negErrorGain : posErrorGain;
    always @(posedge clk) begin
        if (reset) begin
            leadError <= 0;
        end
        else if (clkEn) begin
            leadError[31] <= loopError[7];
            case(loopGain)
                  5'h00: leadError[30:0] <= {{31{loopError[7]}}};
                  5'h01: leadError[30:0] <= {{30{loopError[7]}},loopError[6]};
                  5'h02: leadError[30:0] <= {{29{loopError[7]}},loopError[6:5]};
                  5'h03: leadError[30:0] <= {{28{loopError[7]}},loopError[6:4]};
                  5'h04: leadError[30:0] <= {{27{loopError[7]}},loopError[6:3]};
                  5'h05: leadError[30:0] <= {{26{loopError[7]}},loopError[6:2]};
                  5'h06: leadError[30:0] <= {{25{loopError[7]}},loopError[6:1]};
                  5'h07: leadError[30:0] <= {{24{loopError[7]}},loopError[6:0]};
                  5'h08: leadError[30:0] <= {{23{loopError[7]}},loopError[6:0], 1'b0};
                  5'h09: leadError[30:0] <= {{22{loopError[7]}},loopError[6:0], 2'b0};
                  5'h0A: leadError[30:0] <= {{21{loopError[7]}},loopError[6:0], 3'b0};
                  5'h0B: leadError[30:0] <= {{20{loopError[7]}},loopError[6:0], 4'b0};
                  5'h0C: leadError[30:0] <= {{19{loopError[7]}},loopError[6:0], 5'b0};
                  5'h0D: leadError[30:0] <= {{18{loopError[7]}},loopError[6:0], 6'b0};
                  5'h0E: leadError[30:0] <= {{17{loopError[7]}},loopError[6:0], 7'b0};
                  5'h0F: leadError[30:0] <= {{16{loopError[7]}},loopError[6:0], 8'b0};
                  5'h10: leadError[30:0] <= {{15{loopError[7]}},loopError[6:0], 9'b0};
                  5'h11: leadError[30:0] <= {{14{loopError[7]}},loopError[6:0],10'b0};
                  5'h12: leadError[30:0] <= {{13{loopError[7]}},loopError[6:0],11'b0};
                  5'h13: leadError[30:0] <= {{12{loopError[7]}},loopError[6:0],12'b0};
                  5'h14: leadError[30:0] <= {{11{loopError[7]}},loopError[6:0],13'b0};
                  5'h15: leadError[30:0] <= {{10{loopError[7]}},loopError[6:0],14'b0};
                  5'h16: leadError[30:0] <= {{09{loopError[7]}},loopError[6:0],15'b0};
                  5'h17: leadError[30:0] <= {{08{loopError[7]}},loopError[6:0],16'b0};
                  5'h18: leadError[30:0] <= {{07{loopError[7]}},loopError[6:0],17'b0};
                  5'h19: leadError[30:0] <= {{06{loopError[7]}},loopError[6:0],18'b0};
                  5'h1A: leadError[30:0] <= {{05{loopError[7]}},loopError[6:0],19'b0};
                  5'h1B: leadError[30:0] <= {{04{loopError[7]}},loopError[6:0],20'b0};
                  5'h1C: leadError[30:0] <= {{03{loopError[7]}},loopError[6:0],21'b0};
                  5'h1D: leadError[30:0] <= {{02{loopError[7]}},loopError[6:0],22'b0};
                  5'h1E: leadError[30:0] <= {{01{loopError[7]}},loopError[6:0],23'b0};
                  5'h1F: leadError[30:0] <= {loopError[6:0],24'b0};
            endcase
        end
    end

    /*************************** Integrator Section ********************************/

    // limit and accumulate the lead error
    //            00<------|------------|-----80--------|---------|--------->ff
    // CASE1               LL                                     UL
    //
    wire    signed  [32:0] sum = $signed({1'b0,integrator}) + $signed({leadError[31],leadError});
    always @ (posedge clk or posedge reset) begin
        if (reset) begin
            integrator <= 0;
        end
        else if (clkEn) begin
            // Have we overflowed the integrator in the negative direction?
            if (leadError[31] && sum[32]) begin     
                integrator <= lowerLimit;
            end
            // Have we overflowed the integrator in the positive direction?
            else if (!leadError[31] && sum[32]) begin
                integrator <= upperLimit;
            end
            // Have we exceeded the limits?
            else if (sum[31:0] >= upperLimit) begin
                integrator <= upperLimit;
            end
            else if (sum[31:0] <= lowerLimit) begin
                integrator <= lowerLimit;
            end
            // Must be OK.
            else begin
                integrator <= $unsigned(sum[31:0]);
            end
        end
    end

    `ifdef SIMULATE
    real integratorReal;
    always @* integratorReal = $itor(integrator)/(2**28);
    `endif

    assign loopOutput = integrator;

endmodule
