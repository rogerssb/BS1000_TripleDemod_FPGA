`timescale 1ns/100ps

module channelModel(
    clk,
    iTx,qTx,
    iCh,qCh,
    reset
    );

input           clk,reset;
input   [17:0]  iTx,qTx;
output  [17:0]  iCh,qCh;

`ifdef EASY
parameter c0Real = 0.0,
          c0Imag = 0.4750,
          c1Real = 1.0,
          c1Imag = 0.0,
          c2Real = 0.0,
          c2Imag = -0.4750;
`else
parameter c0Real =  1.6504, c0Imag =  0.6836,
          c1Real =  0.0, c1Imag =  0.0,
          c2Real =  0.0, c2Imag =  0.0,
          c3Real =  -1.5767, c3Imag =  0.3137,
          c4Real =  0.0, c4Imag =  0.0;
`endif

real txReal = 0.0 ; always @* txReal = $itor($signed(iTx))/(2**17);
real txImag = 0.0 ; always @* txImag = $itor($signed(qTx))/(2**17);

real    tx0Real,tx1Real,tx2Real,tx3Real,tx4Real;
real    tx0Imag,tx1Imag,tx2Imag,tx3Imag,tx4Imag;
always @(posedge clk) begin
    if (reset) begin
        tx0Real <= 0.0 ;
        tx0Imag <= 0.0 ;
        tx1Real <= 0.0 ;
        tx1Imag <= 0.0 ;
        tx2Real <= 0.0 ;
        tx2Imag <= 0.0 ;
        tx3Real <= 0.0 ;
        tx3Imag <= 0.0 ;
        tx4Real <= 0.0 ;
        tx4Imag <= 0.0 ;
        end
    else begin
        tx0Real <= txReal;
        tx0Imag <= txImag;
        tx1Real <= tx0Real;
        tx1Imag <= tx0Imag;
        tx2Real <= tx1Real;
        tx2Imag <= tx1Imag;
        tx3Real <= tx2Real;
        tx3Imag <= tx2Imag;
        tx4Real <= tx3Real;
        tx4Imag <= tx3Imag;
        end
    end

real tap0Real = 0.0 ; always @* tap0Real = tx0Real*c0Real - tx0Imag*c0Imag;
real tap0Imag = 0.0 ; always @* tap0Imag = tx0Real*c0Imag + tx0Imag*c0Real;
real tap1Real = 0.0 ; always @* tap1Real = tx1Real*c1Real - tx1Imag*c1Imag;
real tap1Imag = 0.0 ; always @* tap1Imag = tx1Real*c1Imag + tx1Imag*c1Real;
real tap2Real = 0.0 ; always @* tap2Real = tx2Real*c2Real - tx2Imag*c2Imag;
real tap2Imag = 0.0 ; always @* tap2Imag = tx2Real*c2Imag + tx2Imag*c2Real;
real tap3Real = 0.0 ; always @* tap3Real = tx3Real*c3Real - tx3Imag*c3Imag;
real tap3Imag = 0.0 ; always @* tap3Imag = tx3Real*c3Imag + tx3Imag*c3Real;
real tap4Real = 0.0 ; always @* tap4Real = tx4Real*c4Real - tx4Imag*c4Imag;
real tap4Imag = 0.0 ; always @* tap4Imag = tx4Real*c4Imag + tx4Imag*c4Real;

real chReal = 0.0 ; always @* chReal = tap0Real + tap1Real + tap2Real + tap3Real + tap4Real;
real chImag = 0.0 ; always @* chImag = tap0Imag + tap1Imag + tap2Imag + tap3Imag + tap4Imag;

integer iChInt = 0 ; always @* iChInt = $rtoi(chReal * (2**17));
assign iCh = iChInt[17:0];
integer qChInt = 0 ; always @* qChInt = $rtoi(chImag * (2**17));
assign qCh = qChInt[17:0];

endmodule
