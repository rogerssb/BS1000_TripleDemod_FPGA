/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include ".\addressMap.v"

module pcmAgcLoopFilter (
    input                   clk, 
    input                   clkEn, 
    input                   reset, 
    `ifdef USE_BUS_CLOCK
    input                   busClk,
    `endif
    input                   cs,
    input                   wr0,
    input                   wr1,
    input                   wr2,
    input                   wr3,
    input           [12:0]  addr,
    input           [31:0]  din,
    output          [31:0]  dout,
    input           [16:0]  signalLevel,
    input           [7:0]   log2SignalLevel,
    output          [31:0]  loopOutput
);

    // Microprocessor interface
    wire            [4:0]   posErrorGain,negErrorGain;
    wire            [31:0]  lowerLimit;
    wire            [31:0]  upperLimit;
    wire            [16:0]  agcSetpoint;
    reg             [31:0]  integrator;
    pcmAgcLoopRegs loopRegs(
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
        .useLinear(useLinear),
        .posErrorGain(posErrorGain),
        .negErrorGain(negErrorGain),
        .upperLimit(upperLimit),
        .lowerLimit(lowerLimit),
        .integrator(integrator)
    );

    /**************************** Adjust Error ************************************/
    reg     signed  [17:0]  loopError;
    wire    signed  [17:0]  error = $signed({1'b0,agcSetpoint}) - $signed({1'b0,signalLevel});
    wire    signed  [8:0]   log2Error = $signed({1'b0,agcSetpoint[7:0]}) - $signed({1'b0,log2SignalLevel});
    always @(posedge clk) begin 
        if (zeroError) begin
            loopError <= 18'h0;
            end
        else if (useLinear) begin
            if (invertError) begin
                loopError <= -error;
            end
            else begin
                loopError <= error;
            end
        end
        else begin
            if (invertError) begin
                loopError <= {-log2Error,9'b0};
            end
            else begin
                loopError <= {log2Error,9'b0};
            end
        end
    end



/*************************** Lead Gain Section ********************************/

reg [31:0]leadError;
wire [4:0]loopGain = loopError[17] ? negErrorGain : posErrorGain;
always @(posedge clk) begin
    if (reset) begin
        leadError <= 0;
        end
    else if (clkEn) begin
        leadError[31] <= loopError[17];
        case(loopGain)
              5'h00: leadError[30:0] <= {{31{loopError[17]}}};
              5'h01: leadError[30:0] <= {{30{loopError[17]}},loopError[16]};
              5'h02: leadError[30:0] <= {{29{loopError[17]}},loopError[16:15]};
              5'h03: leadError[30:0] <= {{28{loopError[17]}},loopError[16:14]};
              5'h04: leadError[30:0] <= {{27{loopError[17]}},loopError[16:13]};
              5'h05: leadError[30:0] <= {{26{loopError[17]}},loopError[16:12]};
              5'h06: leadError[30:0] <= {{25{loopError[17]}},loopError[16:11]};
              5'h07: leadError[30:0] <= {{24{loopError[17]}},loopError[16:10]};
              5'h08: leadError[30:0] <= {{23{loopError[17]}},loopError[16: 9]};
              5'h09: leadError[30:0] <= {{22{loopError[17]}},loopError[16: 8]};
              5'h0A: leadError[30:0] <= {{21{loopError[17]}},loopError[16: 7]};
              5'h0B: leadError[30:0] <= {{20{loopError[17]}},loopError[16: 6]};
              5'h0C: leadError[30:0] <= {{19{loopError[17]}},loopError[16: 5]};
              5'h0D: leadError[30:0] <= {{18{loopError[17]}},loopError[16: 4]};
              5'h0E: leadError[30:0] <= {{17{loopError[17]}},loopError[16: 3]};
              5'h0F: leadError[30:0] <= {{16{loopError[17]}},loopError[16: 2]};
              5'h10: leadError[30:0] <= {{15{loopError[17]}},loopError[16: 1]};
              5'h11: leadError[30:0] <= {{14{loopError[17]}},loopError[16: 0]};
              5'h12: leadError[30:0] <= {{13{loopError[17]}},loopError[16: 0], 1'b0};
              5'h13: leadError[30:0] <= {{12{loopError[17]}},loopError[16: 0], 2'b0};
              5'h14: leadError[30:0] <= {{11{loopError[17]}},loopError[16: 0], 3'b0};
              5'h15: leadError[30:0] <= {{10{loopError[17]}},loopError[16: 0], 4'b0};
              5'h16: leadError[30:0] <= {{09{loopError[17]}},loopError[16: 0], 5'b0};
              5'h17: leadError[30:0] <= {{08{loopError[17]}},loopError[16: 0], 6'b0};
              5'h18: leadError[30:0] <= {{07{loopError[17]}},loopError[16: 0], 7'b0};
              5'h19: leadError[30:0] <= {{06{loopError[17]}},loopError[16: 0], 8'b0};
              5'h1A: leadError[30:0] <= {{05{loopError[17]}},loopError[16: 0], 9'b0};
              5'h1B: leadError[30:0] <= {{04{loopError[17]}},loopError[16: 0],10'b0};
              5'h1C: leadError[30:0] <= {{03{loopError[17]}},loopError[16: 0],11'b0};
              5'h1D: leadError[30:0] <= {{02{loopError[17]}},loopError[16: 0],12'b0};
              5'h1E: leadError[30:0] <= {{01{loopError[17]}},loopError[16: 0],13'b0};
              5'h1F: leadError[30:0] <= {loopError[16:0],14'b0};
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
            else if ($unsigned(sum[31:0]) >= upperLimit) begin
                integrator <= upperLimit;
            end
            else if ($unsigned(sum[31:0]) <= lowerLimit) begin
                integrator <= lowerLimit;
            end
            // Must be OK.
            else begin
                integrator <= $unsigned(sum[31:0]);
            end
        end
        else begin
            integrator <= integrator;
        end
    end

`ifdef SIMULATE
real integratorReal;
always @* integratorReal = $itor(integrator)/(2.0**32);
`endif

assign loopOutput = integrator;

endmodule
