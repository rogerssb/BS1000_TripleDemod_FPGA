/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

module stcModTopRegs(
    input                       busClk,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input                       clk,
    input               [15:0]  versionNumber,
    output  reg                 reset,
    output  reg                 reboot,
    output  reg         [23:0]  rebootAddress,
    output  reg         [23:0]  pnPolyTaps,
    output  reg         [4:0]   pnPolyLength,
    output  reg signed  [17:0]  h0Real,
    output  reg signed  [17:0]  h0Imag,
    output  reg signed  [17:0]  h1Real,
    output  reg signed  [17:0]  h1Imag,
    output  reg signed  [7:0]   h0Tau,
    output  reg signed  [7:0]   h1Tau,
    output  reg signed          txEnable
);


    //****************************** Reset Pulse **********************************

    reg             rs,rs0,rs1,rs2;
    reg     [2:0]   resetCount;
    always @(posedge clk or posedge rs) begin
        if (rs) begin
            rs0 <= 1;
            rs1 <= 0;
            rs2 <= 0;
            resetCount <= 0;
            reset <= 0;
        end
        else begin
            rs1 <= rs0;
            rs2 <= rs1;
            if (rs2) begin
                resetCount <= 5;
                reset <= 1;
                rs0 <= 0;
            end
            else if (resetCount != 0) begin
                resetCount <= resetCount - 1;
                reset <= 1;
            end
            else begin
                reset <= 0;
            end
        end
    end

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `SYS_RESET:    rs <= 1;
                default:        rs <= 0;
            endcase
        end
        else begin
            rs <= 0;
        end
    end


    //************************* Reboot Trigger ************************************
    reg reboot_decode;
    always @(posedge busClk)
        begin
        if (cs && wr2)
            begin
            casex (addr)
                `SYS_REBOOT_ADDR:
                    begin
                    reboot_decode = 1'b1 ;
                    end
                default: reboot_decode = 1'b0 ;
        endcase
        end
        else
            begin
            reboot_decode = 1'b0 ;
        end
    end

    reg [7:0]reboot_decode_sync;
    always @ (posedge clk) begin
        reboot_decode_sync <= {reboot_decode_sync[6:0],reboot_decode};
        reboot <= (reboot_decode_sync[7:6] == 2'b10);
    end



    //************************** General Registers ********************************

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `SYS_REBOOT_ADDR:       rebootAddress[7:0] <= dataIn[7:0];
                `SYS_STCMOD_PNPOLY:     pnPolyTaps[7:0] <= dataIn[7:0];
                `SYS_STCMOD_H0REAL:     h0Real[7:0] <= dataIn[7:0];
                `SYS_STCMOD_H0IMAG:     h0Imag[7:0] <= dataIn[7:0];
                `SYS_STCMOD_H1REAL:     h1Real[7:0] <= dataIn[7:0];
                `SYS_STCMOD_H1IMAG:     h1Imag[7:0] <= dataIn[7:0];
                `SYS_STCMOD_H0TAU:      h0Tau <= dataIn[7:0];
                `SYS_STCMOD_H1TAU:      h1Tau <= dataIn[7:0];
                default: ;
            endcase
        end
        if (cs && wr1) begin
            casex (addr)
                `SYS_REBOOT_ADDR:       rebootAddress[15:8] <= dataIn[15:8];
                `SYS_STCMOD_PNPOLY:     pnPolyTaps[15:8] <= dataIn[15:8];
                `SYS_STCMOD_H0REAL:     h0Real[15:8] <= dataIn[15:8];
                `SYS_STCMOD_H0IMAG:     h0Imag[15:8] <= dataIn[15:8];
                `SYS_STCMOD_H1REAL:     h1Real[15:8] <= dataIn[15:8];
                `SYS_STCMOD_H1IMAG:     h1Imag[15:8] <= dataIn[15:8];
                default: ;
            endcase
        end
        if (cs && wr2) begin
            casex (addr)
                `SYS_REBOOT_ADDR:       rebootAddress[23:16] <= dataIn[23:16];
                `SYS_STCMOD_PNPOLY:     pnPolyTaps[23:16] <= dataIn[23:16];
                `SYS_STCMOD_H0REAL:     h0Real[17:16] <= dataIn[17:16];
                `SYS_STCMOD_H0IMAG:     h0Imag[17:16] <= dataIn[17:16];
                `SYS_STCMOD_H1REAL:     h1Real[17:16] <= dataIn[17:16];
                `SYS_STCMOD_H1IMAG:     h1Imag[17:16] <= dataIn[17:16];
                default: ;
            endcase
        end
        if (cs && wr3) begin
            casex (addr)
                `SYS_STCMOD_PNPOLY:     pnPolyLength <= dataIn[28:24];
                `SYS_STCMOD_CONTROL:    txEnable <= dataIn[31];
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `SYS_RESET,
                `SYS_VERSION: begin
                    dataOut = {versionNumber,16'b0};
                    end
                `SYS_TYPE: begin
                    dataOut = {txEnable,15'b0,`STC_MOD_IMAGE};
                    end
                `SYS_STCMOD_CONTROL: begin
                    dataOut = {txEnable,15'b0,`STC_MOD_IMAGE};
                    end
                `SYS_STCMOD_PNPOLY: begin
                    dataOut = {3'b0,pnPolyLength,pnPolyTaps};
                    end
                `SYS_STCMOD_H0REAL: begin
                    dataOut = {14'b0,h0Real};
                    end
                `SYS_STCMOD_H0IMAG: begin
                    dataOut = {14'b0,h0Imag};
                    end
                `SYS_STCMOD_H1REAL: begin
                    dataOut = {14'b0,h1Real};
                    end
                `SYS_STCMOD_H1IMAG: begin
                    dataOut = {14'b0,h1Imag};
                    end
                `SYS_STCMOD_H0TAU: begin
                    dataOut = {24'h0,h0Tau};
                    end
                `SYS_STCMOD_H1TAU: begin
                    dataOut = {24'h0,h1Tau};
                    end
                default: begin
                    dataOut = 32'b0;
                    end
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end


endmodule

