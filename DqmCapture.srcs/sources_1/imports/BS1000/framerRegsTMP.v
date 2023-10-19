`timescale 1ns / 10 ps

module framerRegs(
    input                       busClk,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output           [31:0]  dout,
    input                       framesync,
    input               [1:0]   syncState,
    input                       invertData,
    output           [4:0]   bitsPerWord,
    output           [15:0]  wordsPerFrame,
    output           [31:0]  syncwordMask,
    output           [31:0]  syncword,
    output      signed  [6:0]   syncThreshold,
    output reg          [3:0]   inputSourceSelect = 3'b111
    // ,
    // input               [31:0]  lockCount, unLockCount,
    // input               [15:0]  DqmSmooth, DqmRaw, DqmMax, DqmMin,
    // output                   framerCountsReset
);

    
    //always @* begin
     assign   bitsPerWord         = 5'd8-1;
     assign   wordsPerFrame       = 16'd132-1;
     assign   syncwordMask        = (32'hFFFF);
     assign   syncword            = 16'hFAC4;
     //assign   framerCountsReset   = 0;
     assign   dout                = 31'hzzzzzzzz;
    //end
    assign    syncThreshold = 7'd15;

    // vio_0 vio_framerReg (
    //     .clk(busClk),                // input wire clk
    //     .probe_in0(DqmRaw),    // input wire [15 : 0] probe_in0
    //     .probe_in1(DqmMax),    // input wire [15 : 0] probe_in1
    //     .probe_in2(DqmMin),    // input wire [15 : 0] probe_in2
    //     .probe_out0(framerCountsReset)  // output wire [0 : 0] probe_out0
    // );

 endmodule