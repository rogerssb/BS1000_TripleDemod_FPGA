/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps
// Define the Combiner AGC Loop Filter memory map
`ifndef CALF_CONTROL
    `define CALF_CONTROL     13'bx_xxxx_xx10_00xx
    `define CALF_SETPOINT    13'bx_xxxx_xx10_01xx
    `define CALF_GAINS       13'bx_xxxx_xx10_10xx
    `define CALF_ULIMIT      13'bx_xxxx_xx10_11xx
    `define CALF_LLIMIT      13'bx_xxxx_xx11_00xx
    `define CALF_INTEGRATOR0 13'bx_xxxx_xx11_01xx
    `define CALF_INTEGRATOR1 13'bx_xxxx_xx11_10xx
    `define CALF_SQUELCH     13'bx_xxxx_xx11_11xx
`endif

module combAgcLoopRegs(
    input               busClk,
    input       [12:0]  addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input       [31:0]  integrator0, integrator1,
    output  reg [7:0]   agcSetpoint     = 8'hE0,
    output  reg         invertError     = 1'b0,
    output  reg         zeroError       = 1'b0,
    output  reg [4:0]   posErrorGain    = 5'h1B,
    output  reg [4:0]   negErrorGain    = 5'h1B,
    output  reg [31:0]  upperLimit      = 32'h4fffffff,
    output  reg [31:0]  lowerLimit      = 32'h00000000,
    output  reg [12:0]  squelchLvl      = 13'h100,
    output  reg [15:0]  squelchRatio    = 16'h0042  // 1/500 or 10dB of range
);

    always @(posedge busClk) begin

        if (cs && wr0) begin
            casex (addr)
                `CALF_CONTROL: begin
                    zeroError <= dataIn[0];
                    invertError <= dataIn[1];
                    end
                `CALF_SETPOINT: begin
                    agcSetpoint <= dataIn[7:0];
                    end
                `CALF_GAINS: begin
                   posErrorGain <= dataIn[4:0];
                   end
                `CALF_ULIMIT: begin
                    upperLimit[7:0] <= dataIn[7:0];
                    end
                `CALF_LLIMIT: begin
                    lowerLimit[7:0] <= dataIn[7:0];
                    end
                `CALF_SQUELCH: begin
                    squelchLvl[7:0] <= dataIn[7:0];
                    end
                default: ;
            endcase
        end

        if (cs && wr1) begin
            casex (addr)
                `CALF_ULIMIT: begin
                    upperLimit[15:8] <= dataIn[15:8];
                    end
                `CALF_LLIMIT: begin
                    lowerLimit[15:8] <= dataIn[15:8];
                    end
                `CALF_SQUELCH: begin
                    squelchLvl[12:8] <= dataIn[12:8];
                    end
                default:  ;
            endcase
        end

        if (cs && wr2) begin
            casex (addr)
                `CALF_GAINS: begin
                   negErrorGain <= dataIn[20:16];
                   end
                `CALF_ULIMIT: begin
                    upperLimit[23:16] <= dataIn[23:16];
                    end
                `CALF_LLIMIT: begin
                    lowerLimit[23:16] <= dataIn[23:16];
                    end
                `CALF_SQUELCH: begin
                    squelchRatio[7:0] <= dataIn[23:16];
                    end
                default:  ;
            endcase
        end

        if (cs && wr3) begin
            casex (addr)
                `CALF_ULIMIT: begin
                    upperLimit[31:24] <= dataIn[31:24];
                    end
                `CALF_LLIMIT: begin
                    lowerLimit[31:24] <= dataIn[31:24];
                    end
                `CALF_SQUELCH: begin
                    squelchRatio[15:8] <= dataIn[31:24];
                    end
                default:  ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `CALF_CONTROL:       dataOut = {30'bx,invertError,zeroError};
                `CALF_SETPOINT:      dataOut = {24'bx,agcSetpoint};
                `CALF_GAINS:         dataOut = {11'bx,negErrorGain,11'bx,posErrorGain};
                `CALF_ULIMIT:        dataOut = upperLimit;
                `CALF_LLIMIT:        dataOut = lowerLimit;
                `CALF_INTEGRATOR0:   dataOut = integrator0;
                `CALF_INTEGRATOR1:   dataOut = integrator1;
                `CALF_SQUELCH:       dataOut = {squelchRatio,3'bx,squelchLvl};
                default:             dataOut = 32'hx;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

endmodule
