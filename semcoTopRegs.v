/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/10ps

`include "addressMap.v"

module semcoTopRegs(
    input               busClk,
    input       [12:0]  addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input               clk,
    input       [15:0]  versionNumber,
    input       [15:0]  fpgaType,
    input       [8:0]   idCode,
    output  reg         reset,
    output  reg         reboot,
    output  reg [31:0]  rebootAddress,
    output  reg [2:0]   dac0InputSelect,
    output  reg [2:0]   dac1InputSelect,
    output  reg [2:0]   dac2InputSelect,
    output  reg [3:0]   ch0MuxSelect,
    output  reg [3:0]   ch1MuxSelect
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
        if (cs && wr3)
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
                `SYS_REBOOT_ADDR:   rebootAddress[7:0] <= dataIn[7:0];
                `SYS_DAC_INPUT_SEL: dac0InputSelect <= dataIn[2:0];
                `SYS_OUTPUT_SEL:    begin
                                    ch0MuxSelect <= dataIn[3:0];
                                    ch1MuxSelect <= dataIn[7:4];
                                    end
                default: ;
            endcase
        end
        if (cs && wr1) begin
            casex (addr)
                `SYS_REBOOT_ADDR:   rebootAddress[15:8] <= dataIn[15:8];
                `SYS_DAC_INPUT_SEL: dac1InputSelect <= dataIn[10:8];
                default: ;
            endcase
        end
        if (cs && wr2) begin
            casex (addr)
                `SYS_REBOOT_ADDR:   rebootAddress[23:16] <= dataIn[23:16];
                `SYS_DAC_INPUT_SEL: dac2InputSelect <= dataIn[18:16];
                default: ;
            endcase
        end
        if (cs && wr3) begin
            casex (addr)
                `SYS_REBOOT_ADDR:   rebootAddress[31:24] <= dataIn[31:24];
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
                `SYS_SUBSYSTEM_CTRL: begin
                    dataOut = {32'b0};
                    end
                `SYS_TYPE,
                `SYS_IDCODE: begin
                    dataOut = {7'b0,idCode,fpgaType};
                    end
                `SYS_DAC_INPUT_SEL: begin
                    dataOut = {8'b0,
                               5'b0,dac2InputSelect,
                               5'b0,dac1InputSelect,
                               5'b0,dac0InputSelect};
                    end
                `SYS_OUTPUT_SEL: begin
                    dataOut = {24'b0,
                               ch1MuxSelect,ch0MuxSelect};
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

