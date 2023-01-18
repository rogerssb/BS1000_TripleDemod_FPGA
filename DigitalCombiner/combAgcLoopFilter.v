/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps

module combAgcLoopFilter (
    input           clk, clkEn, reset,
    input           busClk,
    input           cs,
    input           wr0,wr1,wr2,wr3,
    input   [5:0]   addr,
    input   [31:0]  din,
    output  [31:0]  dout,
    input   [11:0]  signalLevel0, signalLevel1,
    output  [31:0]  loopOutput0, loopOutput1,
    output  [15:0]  frontEndRatio0, frontEndRatio1,
    output          agc_d_outputs, byPassAgc
);

    // Microprocessor interface
    wire    [4:0]   posErrorGain,negErrorGain;
    wire    [31:0]  lowerLimit;
    wire    [31:0]  upperLimit;
    wire    [7:0]   agcSetpoint;
   (* MARK_DEBUG="true" *)    reg     [31:0]  integrator0, integrator1;
    combAgcLoopRegs loopRegs(
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .busClk(busClk),
        .sysClk(clk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .agcSetpoint(agcSetpoint),
        .invertError(invertError),
        .zeroError(zeroError),
        .byPassAgc(byPassAgc),
        .posErrorGain(posErrorGain),
        .negErrorGain(negErrorGain),
        .upperLimit(upperLimit),
        .lowerLimit(lowerLimit),
        .integrator0(integrator0[31:16]),
        .integrator1(integrator1[31:16]),
        .frontEndRatio0(frontEndRatio0),
        .frontEndRatio1(frontEndRatio1),
        .agc_d_outputs(agc_d_outputs)
        );

    // Channel 0 process
    /**************************** Adjust Error ************************************/
    reg  signed [11:0]   loopError0;
   (* MARK_DEBUG="true" *)    wire signed [12:0]   error0 = $signed({1'b0,agcSetpoint,4'b0}) - $signed({1'b0,signalLevel0});
    wire signed [12:0]   negError0 = $signed({1'b0,signalLevel0}) - $signed({1'b0,agcSetpoint,4'b0});
    always @(posedge clk) begin
        if (zeroError) begin
            loopError0 <= 12'h0;
        end
        else if (invertError) begin
            loopError0 <= $signed(negError0[12:1]);
        end
        else begin
            loopError0 <= $signed(error0[12:1]);
        end
    end



    /*************************** Lead Gain Section ********************************/

    reg signed  [31:0]  leadError0;
    wire        [4:0]   loopGain0 = loopError0[11] ? negErrorGain : posErrorGain;
    always @(posedge clk) begin
        if (reset) begin
            leadError0 <= 0;
        end
        else if (clkEn) begin
            leadError0[31] <= loopError0[11];
            case(loopGain0)
                  5'h00: leadError0[30:0] <= {{31{loopError0[11]}}};
                  5'h01: leadError0[30:0] <= {{30{loopError0[11]}},loopError0[10]};
                  5'h02: leadError0[30:0] <= {{29{loopError0[11]}},loopError0[10:9]};
                  5'h03: leadError0[30:0] <= {{28{loopError0[11]}},loopError0[10:8]};
                  5'h04: leadError0[30:0] <= {{27{loopError0[11]}},loopError0[10:7]};
                  5'h05: leadError0[30:0] <= {{26{loopError0[11]}},loopError0[10:6]};
                  5'h06: leadError0[30:0] <= {{25{loopError0[11]}},loopError0[10:5]};
                  5'h07: leadError0[30:0] <= {{24{loopError0[11]}},loopError0[10:4]};
                  5'h08: leadError0[30:0] <= {{23{loopError0[11]}},loopError0[10:3]};
                  5'h09: leadError0[30:0] <= {{22{loopError0[11]}},loopError0[10:2]};
                  5'h0A: leadError0[30:0] <= {{21{loopError0[11]}},loopError0[10:1]};
                  5'h0B: leadError0[30:0] <= {{20{loopError0[11]}},loopError0[10:0]};
                  5'h0C: leadError0[30:0] <= {{19{loopError0[11]}},loopError0[10:0], 1'b0};
                  5'h0D: leadError0[30:0] <= {{18{loopError0[11]}},loopError0[10:0], 2'b0};
                  5'h0E: leadError0[30:0] <= {{17{loopError0[11]}},loopError0[10:0], 3'b0};
                  5'h0F: leadError0[30:0] <= {{16{loopError0[11]}},loopError0[10:0], 4'b0};
                  5'h10: leadError0[30:0] <= {{15{loopError0[11]}},loopError0[10:0], 5'b0};
                  5'h11: leadError0[30:0] <= {{14{loopError0[11]}},loopError0[10:0], 6'b0};
                  5'h12: leadError0[30:0] <= {{13{loopError0[11]}},loopError0[10:0], 7'b0};
                  5'h13: leadError0[30:0] <= {{12{loopError0[11]}},loopError0[10:0], 8'b0};
                  5'h14: leadError0[30:0] <= {{11{loopError0[11]}},loopError0[10:0], 9'b0};
                  5'h15: leadError0[30:0] <= {{10{loopError0[11]}},loopError0[10:0],10'b0};
                  5'h16: leadError0[30:0] <= {{09{loopError0[11]}},loopError0[10:0],11'b0};
                  5'h17: leadError0[30:0] <= {{08{loopError0[11]}},loopError0[10:0],12'b0};
                  5'h18: leadError0[30:0] <= {{07{loopError0[11]}},loopError0[10:0],13'b0};
                  5'h19: leadError0[30:0] <= {{06{loopError0[11]}},loopError0[10:0],14'b0};
                  5'h1A: leadError0[30:0] <= {{05{loopError0[11]}},loopError0[10:0],15'b0};
                  5'h1B: leadError0[30:0] <= {{04{loopError0[11]}},loopError0[10:0],16'b0};
                  5'h1C: leadError0[30:0] <= {{03{loopError0[11]}},loopError0[10:0],17'b0};
                  5'h1D: leadError0[30:0] <= {{02{loopError0[11]}},loopError0[10:0],18'b0};
                  5'h1E: leadError0[30:0] <= {{01{loopError0[11]}},loopError0[10:0],19'b0};
                  5'h1F: leadError0[30:0] <= {loopError0[10:0],20'b0};
            endcase
        end
    end

    /*************************** Integrator Section ********************************/

    // limit and accumulate the lead error
    //            00<------|------------|-----80--------|---------|--------->ff
    // CASE1               LL                                     UL
    //
    wire    signed  [32:0] sum0 = $signed({1'b0,integrator0}) + $signed({leadError0[31],leadError0});
    always @ (posedge clk or posedge reset) begin
        if (reset || byPassAgc) begin
            integrator0 <= 32'h0000_0800;   // set initial gain to 1
        end
        else if (clkEn) begin
            // Have we overflowed the integrator in the negative direction?
            if (leadError0[31] && sum0[32]) begin
                integrator0 <= lowerLimit;
            end
            // Have we overflowed the integrator in the positive direction?
            else if (!leadError0[31] && sum0[32]) begin
                integrator0 <= upperLimit;
            end
            // Have we exceeded the limits?
            else if (sum0[31:0] >= upperLimit) begin
                integrator0 <= upperLimit;
            end
            else if (sum0[31:0] <= lowerLimit) begin
                integrator0 <= lowerLimit;
            end
            // Must be OK.
            else begin
                integrator0 <= $unsigned(sum0[31:0]);
            end
        end
    end


    // Channel 1 process
    /**************************** Adjust Error ************************************/
    reg  signed [11:0]   loopError1;
   (* MARK_DEBUG="true" *)    wire signed [12:0]   Error1 = $signed({1'b0,agcSetpoint,4'b0}) - $signed({1'b0,signalLevel1});
    wire signed [12:0]   negError1 = $signed({1'b0,signalLevel1}) - $signed({1'b0,agcSetpoint,4'b0});
    always @(posedge clk) begin
        if (zeroError) begin
            loopError1 <= 12'h0;
        end
        else if (invertError) begin
            loopError1 <= $signed(negError1[12:1]);
        end
        else begin
            loopError1 <= $signed(Error1[12:1]);
        end
    end



    /*************************** Lead Gain Section ********************************/

    reg signed  [31:0]  leadError1;
    wire        [4:0]   loopGain1 = loopError1[11] ? negErrorGain : posErrorGain;
    always @(posedge clk) begin
        if (reset) begin
            leadError1 <= 0;
        end
        else if (clkEn) begin
            leadError1[31] <= loopError1[11];
            case(loopGain1)
                  5'h00: leadError1[30:0] <= {{31{loopError1[11]}}};
                  5'h01: leadError1[30:0] <= {{30{loopError1[11]}},loopError1[10]};
                  5'h02: leadError1[30:0] <= {{29{loopError1[11]}},loopError1[10:9]};
                  5'h03: leadError1[30:0] <= {{28{loopError1[11]}},loopError1[10:8]};
                  5'h04: leadError1[30:0] <= {{27{loopError1[11]}},loopError1[10:7]};
                  5'h05: leadError1[30:0] <= {{26{loopError1[11]}},loopError1[10:6]};
                  5'h06: leadError1[30:0] <= {{25{loopError1[11]}},loopError1[10:5]};
                  5'h07: leadError1[30:0] <= {{24{loopError1[11]}},loopError1[10:4]};
                  5'h08: leadError1[30:0] <= {{23{loopError1[11]}},loopError1[10:3]};
                  5'h09: leadError1[30:0] <= {{22{loopError1[11]}},loopError1[10:2]};
                  5'h0A: leadError1[30:0] <= {{21{loopError1[11]}},loopError1[10:1]};
                  5'h0B: leadError1[30:0] <= {{20{loopError1[11]}},loopError1[10:0]};
                  5'h0C: leadError1[30:0] <= {{19{loopError1[11]}},loopError1[10:0], 1'b0};
                  5'h0D: leadError1[30:0] <= {{18{loopError1[11]}},loopError1[10:0], 2'b0};
                  5'h0E: leadError1[30:0] <= {{17{loopError1[11]}},loopError1[10:0], 3'b0};
                  5'h0F: leadError1[30:0] <= {{16{loopError1[11]}},loopError1[10:0], 4'b0};
                  5'h10: leadError1[30:0] <= {{15{loopError1[11]}},loopError1[10:0], 5'b0};
                  5'h11: leadError1[30:0] <= {{14{loopError1[11]}},loopError1[10:0], 6'b0};
                  5'h12: leadError1[30:0] <= {{13{loopError1[11]}},loopError1[10:0], 7'b0};
                  5'h13: leadError1[30:0] <= {{12{loopError1[11]}},loopError1[10:0], 8'b0};
                  5'h14: leadError1[30:0] <= {{11{loopError1[11]}},loopError1[10:0], 9'b0};
                  5'h15: leadError1[30:0] <= {{10{loopError1[11]}},loopError1[10:0],10'b0};
                  5'h16: leadError1[30:0] <= {{09{loopError1[11]}},loopError1[10:0],11'b0};
                  5'h17: leadError1[30:0] <= {{08{loopError1[11]}},loopError1[10:0],12'b0};
                  5'h18: leadError1[30:0] <= {{07{loopError1[11]}},loopError1[10:0],13'b0};
                  5'h19: leadError1[30:0] <= {{06{loopError1[11]}},loopError1[10:0],14'b0};
                  5'h1A: leadError1[30:0] <= {{05{loopError1[11]}},loopError1[10:0],15'b0};
                  5'h1B: leadError1[30:0] <= {{04{loopError1[11]}},loopError1[10:0],16'b0};
                  5'h1C: leadError1[30:0] <= {{03{loopError1[11]}},loopError1[10:0],17'b0};
                  5'h1D: leadError1[30:0] <= {{02{loopError1[11]}},loopError1[10:0],18'b0};
                  5'h1E: leadError1[30:0] <= {{01{loopError1[11]}},loopError1[10:0],19'b0};
                  5'h1F: leadError1[30:0] <= {loopError1[10:0],20'b0};
            endcase
        end
    end

    /*************************** Integrator Section ********************************/

    // limit and accumulate the lead error
    //            00<------|------------|-----80--------|---------|--------->ff
    // CASE1               LL                                     UL
    //
    wire    signed  [32:0] sum1 = $signed({1'b0,integrator1}) + $signed({leadError1[31],leadError1});
    always @ (posedge clk or posedge reset) begin
        if (reset || byPassAgc) begin
            integrator1 <= 32'h0000_0800;   // set initial gain to 1
        end
        else if (clkEn) begin
            // Have we overflowed the integrator in the negative direction?
            if (leadError1[31] && sum1[32]) begin
                integrator1 <= lowerLimit;
            end
            // Have we overflowed the integrator in the positive direction?
            else if (!leadError1[31] && sum1[32]) begin
                integrator1 <= upperLimit;
            end
            // Have we exceeded the limits?
            else if (sum1[31:0] >= upperLimit) begin
                integrator1 <= upperLimit;
            end
            else if (sum1[31:0] <= lowerLimit) begin
                integrator1 <= lowerLimit;
            end
            // Must be OK.
            else begin
                integrator1 <= $unsigned(sum1[31:0]);
            end
        end
    end

    assign loopOutput0 = integrator0;
    assign loopOutput1 = integrator1;

endmodule
