`timescale 1ns / 10 ps

module demod( 
    clk, reset, syncIn, 
    rd, wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    iRx, qRx, 
    demodClk,
    demodData,
    demodBit
    );

input           clk;
input           reset;
input           syncIn;
input           rd,wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]   iRx;
input   [17:0]   qRx;
output          demodClk;
output  [7:0]   demodData;
output          demodBit;


/******************************************************************************
                                Global Registers
******************************************************************************/
// Microprocessor interface
reg demodSpace;
always @(addr) begin
    casex(addr)
        `DEMODSPACE: demodSpace <= 1;
        default:     demodSpace <= 0;
        endcase
    end
wire    [2:0]   demodMode;
wire    [31:0]  demodDout;
demodRegs demodRegs(
    .addr(addr),
    .dataIn(din),
    .dataOut(demodDout),
    .cs(demodSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .demodMode(demodMode)
    );

/******************************************************************************
                                Downconverter
******************************************************************************/
wire [17:0]iDdc,qDdc;
wire [31:0]ddcDout;
ddc ddc( 
    .clk(clk), .reset(reset), .syncIn(syncIn), 
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(ddcDout),
    .ddcFreqOffset(32'h0),
    .offsetEn(1'b1),
    .symTimes2SyncOut(ddcSymTimes2Sync),
    .symTimes4SyncOut(ddcSymTimes4Sync),
    .iIn(iRx), .qIn(qRx), 
    .iOut(iDdc), .qOut(qDdc)
    );


/******************************************************************************
                                uP dout mux
******************************************************************************/
reg [31:0]dout;
always @(addr or 
         demodDout or
         ddcDout) begin
    casex (addr)
        `DEMODSPACE:        dout <= demodDout;
        `DDCSPACE:          dout <= ddcDout;
        default:            dout <= 32'bx;
        endcase
    end

endmodule
