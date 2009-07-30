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
`include "./addressMap.v"
           
module trellisCarrierLoop(clk,reset,symEn,sym2xEn,
  iIn,qIn,
  legacyBit,
  phaseErrorReal,phaseErrorImag,
  symEn_phErr,
  wr0,wr1,wr2,wr3,
  addr,
  din,dout,
  enableLoop,
  phaseError,
  iOut,qOut,
  symEnDly,
  sym2xEnDly,
  freq
  );

input           clk,reset,symEn,sym2xEn;
input   [17:0]  iIn,qIn;
input           legacyBit;
input   [9:0]   phaseErrorReal,phaseErrorImag;
input           symEn_phErr;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
output          enableLoop;
output  [7:0]   phaseError;
output  [17:0]  iOut,qOut;
output          symEnDly;
output          sym2xEnDly;
output  [7:0]   freq;

wire[31:0]carrierFreqOffset;

/***************************** Control Registers ******************************/

reg trellisSpace;
always @(addr) begin
    casex(addr)
        `TRELLIS_SPACE: trellisSpace <= 1;
        default:        trellisSpace <= 0;
        endcase
    end
wire    [31:0]  dout;
wire    [31:0]  dev;
wire    [17:0]  alpha,oneMinusAlpha;
leakyRegs leakyRegs(
    .cs(trellisSpace),
    .addr(addr),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .dataIn(din),
    .dataOut(dout),
    .enableLoop(enableLoop),
    .invertLoop(invertLoop),
    .alpha(alpha),
    .oneMinusAlpha(oneMinusAlpha),
    .deviation(dev)
    );


/************************* Cartesion to Polar *********************************/
wire    [7:0]   phase;
vm_cordic_fast cordic(
    .clk(clk),
    .ena(symEn_phErr),
    .x(phaseErrorReal),.y(phaseErrorImag),
    .p(phase),
    .enOut(phaseSymEn)
    );
assign phaseError = phase;

/************************ Leaky Integrator ************************************/

wire [35:0]productAlpha;
mpy18x18 mpyAlpha(
    .clk(clk), 
    .sclr(reset),
    .a(alpha), 
    .b({phase,10'h0}), 
    .p(productAlpha)
    );
wire [35:0]productOneMinusAlpha;
reg  [35:0]phaseSum;
mpy18x18 mpyOneMinusAlpha(
    .clk(clk), 
    .sclr(reset),
    .a(oneMinusAlpha), 
    .b(phaseSum[34:17]), 
    .p(productOneMinusAlpha)
    );
always @(posedge clk) begin
    if (phaseSymEn) begin
        phaseSum <= {productAlpha[34],productAlpha[34:0]} 
                  + {productOneMinusAlpha[34],productOneMinusAlpha[34:0]};
        end
    end

`ifdef SIMULATE
real phaseSumReal = (phaseSum[34] ? phaseSum[34:17] - 262144.0 : phaseSum[34:17])/131072.0;
`endif

wire    [9:0]   rotReal,rotImag;
polar2Cart polar2Cart(
    .sclr(reset),
    .ce(phaseSymEn), 
    .clk(clk), 
    .we(1'b1), 
    .data(phaseSum[34:21]), 
    .sine(rotImag), 
    .cosine(rotReal)
);

reg [17:0]rotationReal;
reg [17:0]rotationImag;
always @(posedge clk) begin
    if (enableLoop) begin
        rotationReal <= {rotReal,8'b0};
        if (invertLoop) begin
            rotationImag <= {rotImag,8'b0};
            end
        else begin
            rotationImag <= {-rotImag,8'b0};
            end
        end
    else begin
        rotationReal <= 18'h1ffff;
        rotationImag <= 18'h0;
        end
    end

// Create the LO frequency
reg [31:0] deviationCorrection;
always @(posedge clk) begin
    if (symEn) begin
        if (legacyBit) begin
            deviationCorrection <= dev;
            end
        else begin
            deviationCorrection <= -dev;
            end
        end
    end
wire [31:0] ddsFreq = deviationCorrection;

wire ddsReset = reset;


// Delay the input samples to line up with the legacy demod's detected bit
reg     [17:0]  iIns[24:0];
reg     [17:0]  qIns[24:0];
always @(posedge clk) begin
    if (sym2xEn) begin
        iIns[ 0] <= iIn;
        iIns[ 1] <= iIns[ 0];
        iIns[ 2] <= iIns[ 1];
        iIns[ 3] <= iIns[ 2];
        iIns[ 4] <= iIns[ 3];
        iIns[ 5] <= iIns[ 4];
        iIns[ 6] <= iIns[ 5];
        iIns[ 7] <= iIns[ 6];
        iIns[ 8] <= iIns[ 7];
        iIns[ 9] <= iIns[ 8];
        iIns[10] <= iIns[ 9];
        iIns[11] <= iIns[10];
        iIns[12] <= iIns[11];
        iIns[13] <= iIns[12];
        iIns[14] <= iIns[13];
        iIns[15] <= iIns[14];
        iIns[16] <= iIns[15];
        iIns[17] <= iIns[16];
        iIns[18] <= iIns[17];
        iIns[19] <= iIns[18];
        iIns[20] <= iIns[19];
        iIns[21] <= iIns[20];
        iIns[22] <= iIns[21];
        iIns[23] <= iIns[22];
        iIns[24] <= iIns[23];
        qIns[ 0] <= qIn;
        qIns[ 1] <= qIns[ 0];
        qIns[ 2] <= qIns[ 1];
        qIns[ 3] <= qIns[ 2];
        qIns[ 4] <= qIns[ 3];
        qIns[ 5] <= qIns[ 4];
        qIns[ 6] <= qIns[ 5];
        qIns[ 7] <= qIns[ 6];
        qIns[ 8] <= qIns[ 7];
        qIns[ 9] <= qIns[ 8];
        qIns[10] <= qIns[ 9];
        qIns[11] <= qIns[10];
        qIns[12] <= qIns[11];
        qIns[13] <= qIns[12];
        qIns[14] <= qIns[13];
        qIns[15] <= qIns[14];
        qIns[16] <= qIns[15];
        qIns[17] <= qIns[16];
        qIns[18] <= qIns[17];
        qIns[19] <= qIns[18];
        qIns[20] <= qIns[19];
        qIns[21] <= qIns[20];
        qIns[22] <= qIns[21];
        qIns[23] <= qIns[22];
        qIns[24] <= qIns[23];
        end
    end
wire    [17:0]  iInput = iIns[22];
wire    [17:0]  qInput = qIns[22];

wire [17:0]bReal,bImag;
wire    [17:0]  iMpy,qMpy;
dds dds(
  .clk(clk),
  .sclr(ddsReset),
  .ce(sym2xEn),
  .we(1'b1),
  .data(ddsFreq), // Bus [31 : 0]
  .cosine(bReal), // Bus [17 : 0] 
  .sine(bImag)); // Bus [17 : 0] 

cmpy18Sat mixerCmpy(clk,reset,iInput,qInput,bReal,bImag,iMpy,qMpy);

`ifdef SIMULATE
real iRotReal = (rotationReal[17] ? rotationReal - 262144.0 : rotationReal)/131072.0;
real qRotReal = (rotationImag[17] ? rotationImag - 262144.0 : rotationImag)/131072.0;
`endif

wire    [17:0]  iLeaky,qLeaky;
cmpy18Sat leakyCmpy(clk,reset,iMpy,qMpy,rotationReal,rotationImag,iLeaky,qLeaky);

reg [7:0] symEnSr;
reg [7:0] sym2xEnSr;
reg [17:0]  iOut,qOut;
always @(posedge clk) begin
    if (reset) begin
        symEnSr <= 0;
        sym2xEnSr <= 0;
        end
    else begin
        symEnSr <= {symEnSr[6:0], symEn};
        sym2xEnSr <= {sym2xEnSr[6:0], sym2xEn};
        end
    if (sym2xEnDly) begin
        iOut <= iLeaky;
        qOut <= qLeaky;
        end
    end

assign symEnDly = symEnSr[7];
assign sym2xEnDly = sym2xEnSr[7];

wire    [7:0]   freq;
fmDemod fmDemod( 
    .clk(clk), .reset(reset), .sync(sym2xEnDly),
    .iFm(iOut),.qFm(qOut),
    .demodMode(`MODE_2FSK),
    .freq(freq)
    );

`ifdef SIMULATE
real iOutReal;
always @(iOut) iOutReal = (iOut[17] ? iOut - 272144.0 : iOut)/131072.0;
real iInReal;
always @(iInput) iInReal = (iInput[17] ? iInput - 272144.0 : iInput)/131072.0;
real qInReal;
always @(qInput) qInReal = (qInput[17] ? qInput - 272144.0 : qInput)/131072.0;

real freqReal = (freq[7] ? freq - 256.0 : freq)/128.0;

`endif

endmodule
