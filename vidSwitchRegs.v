/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/
// Modified for 3 bit switch options. FZ 12-7-21
//  0  Vid3[2:0] 0 Vid2[2:0] 0 Vid1[2:0] 0 Vid0[2:0]
`timescale 1ns/10ps

`include "addressMap.v"

module vidSwitchRegs(
    input               busClk,
   (* MARK_DEBUG="true" *)    input       [12:0]  addr,
   (* MARK_DEBUG="true" *)    input       [31:0]  din,
   (* MARK_DEBUG="true" *)    output  reg [31:0]  dout,
   (* MARK_DEBUG="true" *)    input               cs,
   (* MARK_DEBUG="true" *)    input               wr0, wr1, wr2, wr3,
   (* MARK_DEBUG="true" *)    output  reg [2:0]   vid0Select,
   (* MARK_DEBUG="true" *)    output  reg [2:0]   vid1Select,
   (* MARK_DEBUG="true" *)    output  reg [2:0]   vid2Select,
   (* MARK_DEBUG="true" *)    output  reg [2:0]   vid3Select
);

    parameter RegSpace = `VIDSWITCHSPACE;

    reg vsSpace;
    always @* begin
        casex(addr)
            RegSpace:               vsSpace = cs;
            default:                vsSpace = 0;
        endcase
    end


    //************************** General Registers ********************************

    always @(posedge busClk) begin
        if (vsSpace && wr0) begin
            casex (addr)
                `VIDSWITCH_CONTROL:   begin
                    vid0Select <= din[2:0];
                    vid1Select <= din[6:4];
                end
                default: ;
            endcase
        end
        if (vsSpace && wr1) begin
            casex (addr)
                `VIDSWITCH_CONTROL:   begin
                    vid2Select <= din[10:8];
                    vid3Select <= din[14:12];
                end
                default: ;
            endcase
        end
    end

    always @* begin
        if (vsSpace) begin
            casex (addr)
                `VIDSWITCH_CONTROL: begin
                    dout = {
                        16'b0,
                        1'b0,vid3Select,1'b0,vid2Select,
                        1'b0,vid1Select,1'b0,vid0Select
                    };
                end
                default: begin
                    dout = 32'b0;
                end
            endcase
        end
        else begin
            dout = 32'hx;
        end
    end


endmodule

