/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include ".\addressMap.v"

module demodRegs(
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    input                       highFreqOffset,
    input                       bitsyncLock,
    input                       auBitsyncLock,
    input                       demodLock,
    input               [15:0]  fskDeviation,
    output  reg         [4:0]   demodMode,
    output  reg                 oqpskIthenQ,
    `ifdef ADD_DESPREADER
    output  reg                 despreadLock,
    output  reg                 enableDespreader,
    `endif
    `ifdef ADD_SCPATH
    output  reg                 enableScPath,
    `endif
    output  reg     [3:0]       dac0Select,
    output  reg     [3:0]       dac1Select,
    output  reg     [3:0]       dac2Select,
    output  reg     [15:0]      falseLockAlpha,
    output  reg     [15:0]      falseLockThreshold,
    output  reg     [4:0]       amTC
);

    `ifdef USE_BUS_CLOCK

    always @(posedge busClk) begin
        if (cs & wr0) begin
            casex (addr)
                `DEMOD_CONTROL: begin
                    demodMode <= dataIn[4:0];
                    end
                `DEMOD_DACSELECT: begin
                    dac0Select <= dataIn[3:0];
                    end
                `DEMOD_FALSELOCK: begin
                    falseLockAlpha[7:0] <= dataIn[7:0];
                    end
                `DEMOD_AMTC: begin
                    amTC <= dataIn[4:0];
                    end
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr1) begin
            casex (addr)
                `ifdef ADD_DESPREADER
                `ifdef ADD_SCPATH
                `DEMOD_CONTROL: begin
                    oqpskIthenQ <= dataIn[13];
                    enableScPath <= dataIn[14];
                    enableDespreader <= dataIn[15];
                    end
                `else
                `DEMOD_CONTROL: begin
                    oqpskIthenQ <= dataIn[13];
                    enableDespreader <= dataIn[15];
                    end
                `endif
                `else
                `ifdef ADD_SCPATH
                `DEMOD_CONTROL: begin
                    oqpskIthenQ <= dataIn[13];
                    enableScPath <= dataIn[14];
                    end
                `else
                `DEMOD_CONTROL: begin
                    oqpskIthenQ <= dataIn[13];
                    end
                `endif
                `endif
                `DEMOD_DACSELECT: begin
                    dac1Select <= dataIn[11:8];
                    end
                `DEMOD_FALSELOCK: begin
                    falseLockAlpha[15:8] <= dataIn[15:8];
                    end
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr2) begin
            casex (addr)
                `DEMOD_DACSELECT: begin
                    dac2Select <= dataIn[19:16];
                    end
                `DEMOD_FALSELOCK: begin
                    falseLockThreshold[7:0] <= dataIn[23:16];
                    end
                default: ;
            endcase
        end
    end

    always @(posedge busClk) begin
        if (cs & wr3) begin
            casex (addr)
                `DEMOD_FALSELOCK: begin
                    falseLockThreshold[15:8] <= dataIn[31:24];
                    end
                default: ;
            endcase
        end
    end

    reg [31:0]dataOut;
    always @* begin
        if (cs) begin
            casex (addr)
                `ifdef ADD_DESPREADER
                `ifdef ADD_SCPATH
                `DEMOD_CONTROL:     dataOut = {16'b0,enableDespreader,enableScPath,oqpskIthenQ,8'b0,demodMode};
                `else
                `DEMOD_CONTROL:     dataOut = {16'b0,enableDespreader,1'b0,oqpskIthenQ,8'b0,demodMode};
                `endif
                `else
                `ifdef ADD_SCPATH
                `DEMOD_CONTROL:     dataOut = {16'b0,1'b0,enableScPath,oqpskIthenQ,8'b0,demodMode};
                `else
                `DEMOD_CONTROL:     dataOut = {16'b0,2'b0,oqpskIthenQ,8'b0,demodMode};
                `endif
                `endif

                `DEMOD_DACSELECT:   dataOut = {12'h0,dac2Select,4'h0,dac1Select,4'h0,dac0Select};
                `DEMOD_FALSELOCK:   dataOut = {falseLockThreshold,falseLockAlpha};
                `ifdef ADD_DESPREADER
                `DEMOD_STATUS:      dataOut = {27'h0,despreadLock,
                `else
                `DEMOD_STATUS:      dataOut = {28'h0,
                `endif
                                               auBitsyncLock,highFreqOffset,bitsyncLock,demodLock};
                `DEMOD_AMTC:        dataOut = {27'b0,amTC};
                `ifdef SYM_DEVIATION
                `DEMOD_FSKDEV:      dataOut = {16'b0,fskDeviation};
                `else
                `DEMOD_FSKDEV:      dataOut = {negDeviation,posDeviation};
                `endif
                default:            dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

    `else //USE_BUS_CLOCK

    always @(negedge wr0) begin
        if (cs) begin
            casex (addr)
                `DEMOD_CONTROL: begin
                    demodMode <= dataIn[4:0];
                    end
                `DEMOD_DACSELECT: begin
                    dac0Select <= dataIn[3:0];
                    end
                `DEMOD_FALSELOCK: begin
                    falseLockAlpha[7:0] <= dataIn[7:0];
                    end
                `DEMOD_AMTC: begin
                    amTC <= dataIn[4:0];
                    end
                default: ;
            endcase
        end
    end

    always @(negedge wr1) begin
        if (cs) begin
            casex (addr)
                `ifdef ADD_DESPREADER
                `ifdef ADD_SCPATH
                `DEMOD_CONTROL: begin
                    oqpskIthenQ <= dataIn[13];
                    enableScPath <= dataIn[14];
                    enableDespreader <= dataIn[15];
                    end
                `else
                `DEMOD_CONTROL: begin
                    oqpskIthenQ <= dataIn[13];
                    enableDespreader <= dataIn[15];
                    end
                `endif
                `else
                `ifdef ADD_SCPATH
                `DEMOD_CONTROL: begin
                    oqpskIthenQ <= dataIn[13];
                    enableScPath <= dataIn[14];
                    end
                `else
                `DEMOD_CONTROL: begin
                    oqpskIthenQ <= dataIn[13];
                    end
                `endif
                `endif
                `DEMOD_DACSELECT: begin
                    dac1Select <= dataIn[11:8];
                    end
                `DEMOD_FALSELOCK: begin
                    falseLockAlpha[15:8] <= dataIn[15:8];
                    end
                default: ;
            endcase
        end
    end

    always @(negedge wr2) begin
        if (cs) begin
            casex (addr)
                `DEMOD_DACSELECT: begin
                    dac2Select <= dataIn[19:16];
                    end
                `DEMOD_FALSELOCK: begin
                    falseLockThreshold[7:0] <= dataIn[23:16];
                    end
                default: ;
            endcase
        end
    end

    always @(negedge wr3) begin
        if (cs) begin
            casex (addr)
                `DEMOD_FALSELOCK: begin
                    falseLockThreshold[15:8] <= dataIn[31:24];
                    end
                default: ;
            endcase
        end
    end

    reg [31:0]dataOut;
    always @* begin
        if (cs) begin
            casex (addr)
                `ifdef ADD_DESPREADER
                `ifdef ADD_SCPATH
                `DEMOD_CONTROL:     dataOut = {16'b0,enableDespreader,enableScPath,oqpskIthenQ,8'b0,demodMode};
                `else
                `DEMOD_CONTROL:     dataOut = {16'b0,enableDespreader,1'b0,oqpskIthenQ,8'b0,demodMode};
                `endif
                `else
                `ifdef ADD_SCPATH
                `DEMOD_CONTROL:     dataOut = {16'b0,1'b0,enableScPath,oqpskIthenQ,8'b0,demodMode};
                `else
                `DEMOD_CONTROL:     dataOut = {16'b0,2'b0,oqpskIthenQ,8'b0,demodMode};
                `endif
                `endif

                `DEMOD_DACSELECT:   dataOut = {12'h0,dac2Select,4'h0,dac1Select,4'h0,dac0Select};
                `DEMOD_FALSELOCK:   dataOut = {falseLockThreshold,falseLockAlpha};
                `ifdef ADD_DESPREADER
                `DEMOD_STATUS:      dataOut = {27'h0,despreadLock,
                `else
                `DEMOD_STATUS:      dataOut = {28'h0,
                `endif
                                               auBitsyncLock,highFreqOffset,bitsyncLock,demodLock};
                `DEMOD_AMTC:        dataOut = {27'b0,amTC};
                `ifdef SYM_DEVIATION
                `DEMOD_FSKDEV:      dataOut = {16'b0,fskDeviation};
                `else
                `DEMOD_FSKDEV:      dataOut = {negDeviation,posDeviation};
                `endif
                default:            dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end

    `endif //USE_BUS_CLOCK

endmodule

