//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Trellis Carrier Loop
// Created      24 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module trellisCarrierLoop(clk,reset,symEn,sym2xEn,
  iIn,qIn,
  phaseError,
  wr0,wr1,wr2,wr3,
  addr,
  din,dout,
  iOut,qOut
  );

input clk,reset,symEn,sym2xEn;
input [17:0]iIn,qIn;
input   [7:0]   phaseError;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;
output [17:0]iOut,qOut;

wire[31:0]carrierFreqOffset;
carrierLoop carrierLoop(
  .clk(clk), 
  .reset(reset), 
  .ddcSync(),
  .resampSync(),
  .symSync(symEn),
  .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
  .addr(addr),
  .din(din),
  .dout(dout),
  .demodMode(`MODE_PCMTRELLIS),
  .phase(phaseError),
  .freq(),
  .highFreqOffset(1'b0),
  .offsetError(),
  .offsetErrorEn(),
  .symPhase(),
  .carrierFreqOffset(carrierFreqOffset),
  .carrierFreqEn(carrierFreqEn),
  .loopError(),
  .carrierLock(),
  .lockCounter()
  );

// Create the LO frequency
reg [31:0] newOffset;
always @(posedge clk) begin
    if (reset) begin
        newOffset <= 0;
        end
    else if (carrierFreqEn) begin
        newOffset <= carrierFreqOffset;
        end
    end

wire [17:0]bReal,bImag;
dds dds(
  .clk(clk),
  .sclr(reset),
  .we(1'b1),
  .data(newOffset), // Bus [31 : 0] 
  .cosine(bReal), // Bus [17 : 0] 
  .sine(bImag)); // Bus [17 : 0] 

cmpy18 cmpy18(clk,reset,iIn,qIn,bReal,bImag,iOut,qOut);

endmodule