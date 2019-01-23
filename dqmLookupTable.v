`timescale 1ns/1ps
`include "addressMap.v"


module dqmLookupTable #(
    parameter   LOGBITS = 11,
                regSpace = `DQMLUTSPACE
    )
(
    input                       clk,
    input                       reset,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output              [31:0]  dataOut,
    input       signed  [15:0]  log10MSE,
    output              [15:0]  dqmValue
);


    wire    signed  [LOGBITS-1:0]   ebno = -$signed(log10MSE[LOGBITS-1:0]);
    wire            [7:0]           ebnoRounded = $signed(ebno[8:2]) + log10MSE[1];
    reg             [6:0]           mseLutAddr;
    always @* begin
        // Saturate negative?
        if (ebno[LOGBITS-1]) begin
            mseLutAddr = 0;
        end
        // Saturate positive?
        else if (!ebno[LOGBITS-1] & ebnoRounded[7]) begin
            mseLutAddr = 7'h7f;
        end
        else begin
            mseLutAddr = ebnoRounded[6:0];
        end
    end


    reg lutSpace;
    always @* begin
        casex(addr)
            regSpace:   lutSpace = cs;
            default:    lutSpace = 0;
        endcase
    end

    wire    [15:0]  lsDqmValue;
    wire    [15:0]  lsLutDout;
    dqmLut lsLut(
        .clka(busClk),
        .ena(lutSpace),
        .wea(wr0),
        .addra(addr[7:2]),
        .dina(dataIn[15:0]),
        .douta(lsLutDout),
        .clkb(clk),
        .enb(1'b1),
        .web(1'b0),
        .addrb(mseLutAddr[6:1]),
        .dinb(16'd0),
        .doutb(lsDqmValue)
    );
    wire    [15:0]  msDqmValue;
    wire    [15:0]  msLutDout;
    dqmLut msLut(
        .clka(busClk),
        .ena(lutSpace),
        .wea(wr2),
        .addra(addr[7:2]),
        .dina(dataIn[31:16]),
        .douta(msLutDout),
        .clkb(clk),
        .enb(1'b1),
        .web(1'b0),
        .addrb(mseLutAddr[6:1]),
        .dinb(16'd0),
        .doutb(msDqmValue)
    );
    assign dqmValue = mseLutAddr[0] ? msDqmValue : lsDqmValue;
    assign dataOut = {msLutDout,lsLutDout};


endmodule
