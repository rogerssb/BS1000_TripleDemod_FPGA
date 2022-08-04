`timescale 1ns/1ps
`include "addressMap.v"


module dqmChip2Chip #(parameter LOG_BITS = 11)
(
    input                               clk,
    input                               reset,
    input                               combinerStartOfFrame,
    input                               dqmStartOfFrame,
    input       signed  [33:0]          mseSum,
    input       signed  [LOG_BITS-1:0]  log10MseSum,
    output                              mseMCLK,
    output  reg                         mseMFS,
    output                              mseMDATA,
    input                               ch0SCLK,
    input                               ch0SFS,
    input                               ch0SDATA,
    output  reg signed  [33:0]          ch0MseSum,
    output  reg signed  [LOG_BITS-1:0]  ch0Log10MseSum,
    input                               ch1SCLK,
    input                               ch1SFS,
    input                               ch1SDATA,
    output  reg signed  [33:0]          ch1MseSum,
    output  reg signed  [LOG_BITS-1:0]  ch1Log10MseSum

);

    // Output master interface for data to combiner
    /*
    Divide the system clock, clk, by 4 to generate the clock used as
    the master interface clock. Set it up so mseReset changes on positive
    edges.
    */
    reg     [1:0]   clkCount;
    assign          mseMCLK = clkCount[1];
    reg             mseReset;
    always @(posedge clk) begin
        if (reset) begin
            clkCount <= 3;
            mseReset <= 1;
        end
        else if (clkCount > 0) begin
            clkCount <= clkCount - 1;
        end
        else begin
            clkCount <= 3;
            mseReset <= 0;
        end
    end

    reg         [47:0]  mseSR;
    assign              mseMDATA = mseSR[47];
    reg         [5:0]   mseBitcount;
    always @(negedge mseMCLK) begin
        if (mseReset) begin
            mseBitcount <= 0;
        end
        else if (mseBitcount < 47) begin
            mseBitcount <= mseBitcount + 1;
            mseSR <= {mseSR[46:0],1'b0};
        end
        else begin
            mseBitcount <= 0;
            mseSR <= {3'b0,log10MseSum,mseSum};
        end
        mseMFS <= (mseBitcount == 47);
    end


    // Input slave interface for data from channel 0
    reg         [47:0]  ch0SR;
    reg         [5:0]   ch0SBitcount;
    always @(posedge ch0SCLK) begin
        if (ch0SFS) begin
            ch0SBitcount <= 47;
            ch0SR <= {ch0SR[46:0],ch0SDATA};
            ch0MseSum <= $signed(ch0SR[33:0]);
            ch0Log10MseSum <= $signed(ch0SR[(34+LOG_BITS-1):34]);
        end
        else if (ch0SBitcount > 0) begin
            ch0SBitcount <= ch0SBitcount - 1;
            ch0SR <= {ch0SR[46:0],ch0SDATA};
        end
    end

    // Input slave interface for data from channel 1
    reg         [47:0]  ch1SR;
    reg         [5:0]   ch1SBitcount;
    always @(posedge ch1SCLK) begin
        if (ch1SFS) begin
            ch1SBitcount <= 47;
            ch1SR <= {ch1SR[46:0],ch1SDATA};
            ch1MseSum <= $signed(ch1SR[33:0]);
            ch1Log10MseSum <= $signed(ch1SR[(34+LOG_BITS-1):34]);
        end
        else if (ch1SBitcount > 0) begin
            ch1SBitcount <= ch1SBitcount - 1;
            ch1SR <= {ch1SR[46:0],ch1SDATA};
        end
    end





endmodule


