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
    .alpha(alpha),
    .oneMinusAlpha(oneMinusAlpha),
    .deviation(dev)
    );


wire loopFilterEn = symEn_phErr;

/************************ Leaky Integrator ************************************/

wire [35:0]productAlphaReal;
mpy18x18 mpyAlphaReal(
    .clk(clk), 
    .sclr(reset),
    .a(alpha), 
    .b({phaseErrorReal,8'h0}), 
    .p(productAlphaReal)
    );
wire [35:0]productOneMinusAlphaReal;
reg  [35:0]realSum;
mpy18x18 mpyOneMinusAlphaReal(
    .clk(clk), 
    .sclr(reset),
    .a(oneMinusAlpha), 
    .b(realSum[34:17]), 
    .p(productOneMinusAlphaReal)
    );
always @(posedge clk) begin
    if (symEn_phErr) begin
        realSum <= {productAlphaReal[34],productAlphaReal[34:0]} 
                 + {productOneMinusAlphaReal[34],productOneMinusAlphaReal[34:0]};
        end
    end

wire [35:0]productAlphaImag;
mpy18x18 mpyAlphaImag(
    .clk(clk), 
    .sclr(reset),
    .a(alpha), 
    .b({phaseErrorImag,8'h0}), 
    .p(productAlphaImag)
    );
wire [35:0]productOneMinusAlphaImag;
reg  [35:0]imagSum;
mpy18x18 mpyOneMinusAlphaImag(
    .clk(clk), 
    .sclr(reset),
    .a(oneMinusAlpha), 
    .b(imagSum[34:17]), 
    .p(productOneMinusAlphaImag)
    );
always @(posedge clk) begin
    if (symEn_phErr) begin
        imagSum <= {productAlphaImag[34],productAlphaImag[34:0]} 
                 + {productOneMinusAlphaImag[34],productOneMinusAlphaImag[34:0]};
        end
    end


`ifdef SIMULATE
real realSumReal = (realSum[34] ? realSum[34:17] - 262144.0 : realSum[34:17])/131072.0;
real imagSumReal = (imagSum[34] ? imagSum[34:17] - 262144.0 : imagSum[34:17])/131072.0;
`endif

reg [17:0]rotationReal;
reg [17:0]rotationImag;
always @(posedge clk) begin
    if (enableLoop) begin
    //if (1'b0) begin
        rotationReal <= realSum[34:17];
        rotationImag <= -imagSum[34:17];
        end
    else begin
        rotationReal <= 18'h04000;
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

wire    [20:0]  trellisGain;
wire    [17:0]  agcReal,agcImag;
variableGain errorGainReal(
    .clk(clk), .clkEn(symEn_phErr), .reset(reset), 
    .exponent(trellisGain[20:16]), .mantissa(trellisGain[15:0]),
    .din({rotationReal,30'h0}),
    .dout(agcReal)
    );
variableGain errorGainImag(
    .clk(clk), .clkEn(symEn_phErr), .reset(reset), 
    .exponent(trellisGain[20:16]), .mantissa(trellisGain[15:0]),
    .din({rotationImag,30'h0}),
    .dout(agcImag)
    );

`ifdef SIMULATE
real iRotReal = (agcReal[17] ? agcReal - 262144.0 : agcReal)/131072.0;
real qRotReal = (agcImag[17] ? agcImag - 262144.0 : agcImag)/131072.0;
`endif

wire    [17:0]  iLeaky,qLeaky;
cmpy18Sat leakyCmpy(clk,reset,iMpy,qMpy,agcReal,agcImag,iLeaky,qLeaky);

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

trellisAGC trellisAGC( 
    .clk(clk), .reset(reset), .syncIn(sym2xEn),
    .enableLoop(enableLoop),
    .iRef(iInput),.qRef(qInput),
    .iIn(iOut),.qIn(qOut),
    .agcGain(trellisGain)
    );

endmodule
