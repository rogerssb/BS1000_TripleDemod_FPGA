/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include ".\addressMap.v"

module bitsyncBertRegs(
    busClk,
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    clk,
    versionNumber,
    bitsyncEnable,
    bertEnable,
    framesyncEnable,
    pnGeneratorEnable,
    reset,
    reboot,
    rebootAddress,
    dac0InputSelect,
    dac1InputSelect,
    dac2InputSelect,
    bsCoaxMuxSelect,
    encCoaxMuxSelect,
    fsMuxSelect,
    bsRS422MuxSelect,
    fsRS422MuxSelect,
    bertMuxSelect
    );

input           busClk;
input   [12:0]  addr;
input   [31:0]  dataIn;
output  [31:0]  dataOut;
input           cs;
input           wr0,wr1,wr2,wr3;
input           clk;
input   [15:0]  versionNumber;

output          bitsyncEnable;
reg             bitsyncEnable;

output          bertEnable;
reg             bertEnable;

output          framesyncEnable;
reg             framesyncEnable;

output          pnGeneratorEnable;
reg             pnGeneratorEnable;

output          reset;
(* max_fanout = 1000 *) reg             reset;

output          reboot;
reg             reboot;

output  [23:0]  rebootAddress;
reg     [23:0]  rebootAddress;

output  [2:0]   dac0InputSelect;
reg     [2:0]   dac0InputSelect;

output  [2:0]   dac1InputSelect;
reg     [2:0]   dac1InputSelect;

output  [2:0]   dac2InputSelect;
reg     [2:0]   dac2InputSelect;

output  [3:0]   bsCoaxMuxSelect;
reg     [3:0]   bsCoaxMuxSelect;

output  [3:0]   encCoaxMuxSelect;
reg     [3:0]   encCoaxMuxSelect;

output  [3:0]   fsMuxSelect;
reg     [3:0]   fsMuxSelect;

output  [3:0]   bsRS422MuxSelect;
reg     [3:0]   bsRS422MuxSelect;

output  [3:0]   fsRS422MuxSelect;
reg     [3:0]   fsRS422MuxSelect;

output  [3:0]   bertMuxSelect;
reg     [3:0]   bertMuxSelect;

//****************************** Reset Pulse **********************************

reg             rs,rs0,rs1,rs2;
reg     [2:0]   resetCount;
always @(posedge clk or posedge rs) begin
    if (rs) begin
        rs0 <= 1;
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
always @ (posedge clk)
    begin
    reboot_decode_sync <= {reboot_decode_sync[6:0],reboot_decode};
    reboot <= (reboot_decode_sync[7:6] == 2'b10);
    end



//************************** General Registers ********************************

always @(posedge busClk) begin 
    if (cs && wr0) begin
        casex (addr)
            `SYS_SUBSYSTEM_CTRL: begin
                bitsyncEnable <= dataIn[0];
                bertEnable <= dataIn[1];
                framesyncEnable <= dataIn[2];
                pnGeneratorEnable <= dataIn[3];
            end
            `SYS_REBOOT_ADDR:   rebootAddress[7:0] <= dataIn[7:0];
            `SYS_DAC_INPUT_SEL: dac0InputSelect <= dataIn[2:0];
            `SYS_OUTPUT_SEL:    begin
                                bsCoaxMuxSelect <= dataIn[3:0];
                                bsRS422MuxSelect <= dataIn[7:4];
                                end
            `SYS_BERT_MUX_SEL:  bertMuxSelect <= dataIn[3:0];
            default: ;
        endcase
    end
    if (cs && wr1) begin
        casex (addr)
            `SYS_REBOOT_ADDR:   rebootAddress[15:8] <= dataIn[15:8];
            `SYS_DAC_INPUT_SEL: dac1InputSelect <= dataIn[10:8];
            `SYS_OUTPUT_SEL:    encCoaxMuxSelect <= dataIn[11:8];
            default: ;
        endcase
    end
    if (cs && wr2) begin
        casex (addr)
            `SYS_REBOOT_ADDR:   rebootAddress[23:16] <= dataIn[23:16];
            `SYS_DAC_INPUT_SEL: dac2InputSelect <= dataIn[18:16];
            `SYS_OUTPUT_SEL:    begin
                                fsMuxSelect <= dataIn[19:16];
                                fsRS422MuxSelect <= dataIn[23:20];
                                end
            default: ;
        endcase
    end
    if (cs && wr3) begin
        casex (addr)
            default: ;
        endcase
    end
end

reg [31:0]dataOut;
always @* begin
    if (cs) begin
        casex (addr)
            `SYS_VERSION: begin
                dataOut = {versionNumber,16'b0};
                end
            `SYS_SUBSYSTEM_CTRL: begin
                dataOut = {28'b0,pnGeneratorEnable,framesyncEnable,bertEnable,bitsyncEnable};
                end
            `SYS_TYPE: begin
                dataOut = {16'b0,`BITSYNC_BERT_IMAGE};
                end
            `SYS_DAC_INPUT_SEL: begin
                dataOut = {8'b0,
                           5'b0,dac2InputSelect,
                           5'b0,dac1InputSelect,
                           5'b0,dac0InputSelect};
                end
            `SYS_OUTPUT_SEL: begin
                dataOut = {8'b0,
                           fsRS422MuxSelect,fsMuxSelect,
                           4'b0,encCoaxMuxSelect,
                           bsRS422MuxSelect,bsCoaxMuxSelect};
                end
            `SYS_BERT_MUX_SEL: begin
                dataOut = {28'b0,bertMuxSelect};
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

