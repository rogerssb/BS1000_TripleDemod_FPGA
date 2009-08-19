`include "../addressMap.v"
`timescale 1ns/100ps

`define MATLAB_VECTORS


module testSoqpskMod;

reg reset,clk,we0,we1,we2,we3,rd;
reg sync;
reg [11:0]a;
reg [31:0]d;
wire [31:0]dout;

// Create the clocks
parameter HC = 50;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;
`define SAMPLE_PERIOD   (C*1e-9)
`define SAMPLE_FREQ     (1e9/C)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072


real carrierFreqHz = 1000000;
//real carrierFreqHz = 0;
real carrierFreqNorm;
always @(carrierFreqHz) carrierFreqNorm = carrierFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer carrierFreqInt;
always @(carrierFreqNorm) carrierFreqInt = carrierFreqNorm;
wire [31:0] carrierFreq = carrierFreqInt;

real bitrateBps = 250000;
real bitrateSamples;
always @(bitrateBps) bitrateSamples = 1/bitrateBps/`SAMPLE_PERIOD/2;

integer bitrateSamplesInt;
always @(bitrateSamples) bitrateSamplesInt = bitrateSamples;
wire [15:0]bitrateDivider = bitrateSamplesInt - 1;
real deviationHz;
always @(bitrateBps) deviationHz = 1.28*2*0.25 * bitrateBps;
real deviationNorm;
always @(deviationHz) deviationNorm = deviationHz * `SAMPLE_PERIOD * `TWO_POW_32;
integer deviationInt;
always @(deviationNorm) deviationInt = deviationNorm;
wire [31:0]deviationQ31 = deviationInt;
wire [17:0]deviation = deviationQ31[31:14];

// Create a bit stream
reg     modDataTB;
reg     modDataMLab;
wire    modClk;
parameter PN17 = 16'h008e,
          MASK17 = 16'h00ff;

reg [15:0]sr;
reg [4:0]zeroCount;
   always @(negedge modClk or posedge reset) begin
      if (reset) begin
         zeroCount <= 5'b0;
         sr <= MASK17;
      end
      else if (sr[0] | (zeroCount == 5'b11111)) begin
         zeroCount <= 5'h0;
         sr <= {1'b0, sr[15:1]} ^ PN17;
      end
      else begin
         zeroCount <= zeroCount + 5'h1;
         sr <= sr >> 1;
      end
      modDataTB <= sr[0];
      //    txUserData <= 0;
   end
   
   reg [20:0] srMLab;
   integer srTernary [39:0];
   reg [2:0] ternary;
   integer i;
   always @(negedge modClk or posedge reset) begin
      if (reset) begin
         srMLab <= 21'b01001_0100_0010_0001_0010;
         srTernary[0] = -1;
         srTernary[1] = 0;
         srTernary[2] = 0;
         srTernary[3] = -1;
         srTernary[4] = 0;
         srTernary[5] = 1;
         srTernary[6] = 0;
         srTernary[7] = 0;
         srTernary[8] = 0;
         srTernary[9] = 0;
         srTernary[10] = 1;
         srTernary[11] = 0;
         srTernary[12] = 0;
         srTernary[13] = 0;
         srTernary[14] = 0;
         srTernary[15] = 1;
         srTernary[16] = 0;
         srTernary[17] = 0;
         srTernary[18] = 1;
         srTernary[19] = 0;
	 i=0;
         modDataMLab <= 1'b0;
      end
      else if (modDataValid) begin
         srMLab <= srMLab << 1;
	 if (i<19) i=i+1;
      end
      modDataMLab <= srMLab[20];
      ternary <= srTernary[i];
   end

`define MATLAB   
`ifdef MATLAB 
   wire modData = modDataMLab;
`else
   wire modData = modDataTB;
`endif

// Instantiate the modulator
   reg          modDataValid;
   reg          txSelect;
   reg [1:0]    fskMode;
   wire [31:0]  fmModFreq;

/* -----\/----- EXCLUDED -----\/-----
fmMod fmMod(
    .clk(clk), .reset(reset),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dout),
    .modData(modData),
    .modClkIn(),
    .modClkOut(modClk),
    .modDataValid(modDataValid),
    .txSelect(txSelect),
    .fskMode(`MODE_2FSK),
    .fmModFreq(fmModFreq)
    );
 -----/\----- EXCLUDED -----/\----- */


soqpskMod soqpskMod
  ( 
    .clk(clk), .reset(reset),
    .cs(1'b1), // soqpskModReg cs
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dout),
    .modData(modData),
    .modClkIn(),
    .modClkOut(modClk),
    .modDataValid(modDataValid),
    .soqpskModFreq(soqpskModFreq)
    );

`ifdef TEST_SOQPAKFIR
// Generate internal bitrate clock
reg modClkOutUUT;
reg modSampleEn;
reg [15:0]bitrateCount;
   always @(posedge clk) begin
      if (reset) begin
         bitrateCount <= bitrateDivider;
         modClkOutUUT <= 0;
      end
      else if (bitrateCount == 0) begin
         bitrateCount <= bitrateDivider;
         modClkOutUUT <= ~modClkOutUUT;
         modSampleEn <= 1 ;
      end
      else begin
         modSampleEn <= 0;
         bitrateCount <= bitrateCount - 1;
      end
   end
   
   wire [16:0] firOut;
   soqpskFir modFir_UUT
     (
      .clk(clk), 
      .nd(modSampleEn),
      .rfd(),
      .rdy(rdy),
      .din(ternary),
      .dout(firOut)
      );
   
   always @(posedge clk)begin
      if(modDataValid & rdy) begin
         $display("%f", $itor($signed(firOut))/(2**17));
      end
   end
`endif
	
wire    [17:0]iDds,qDds;
dds dds(
  .clk(clk),
  .sclr(reset),
  .ce(1'b1),
  .we(1'b1),
  .data(32'b0), // Bus [31 : 0]
  .cosine(iDds), // Bus [17 : 0] 
  .sine(qDds)); // Bus [17 : 0] 
   

`ifdef MATLAB_VECTORS
/******************************************************************************
                          Vector data for Matlab Analysis
******************************************************************************/
reg     sampleVectors;
integer outfile;
integer vectorCount;
initial begin
    sampleVectors = 0;
    outfile = $fopen("fskVectors.dat");
    vectorCount = 0;
    end
always @(negedge clk) begin
    if (sampleVectors) begin
        //$fwrite(outfile,"%f %f\n",dds.sine,dds.cosine);
        vectorCount <= vectorCount + 1;
        if (vectorCount == 10239) begin
            $fclose(outfile);
            $stop;
            end
        end
    end
`endif





function [11:0] createAddress;
    input [11:0] addrA;
    input [11:0] addrB;
    
    integer i;
    reg [11:0]finalAddress;

    begin
    for (i = 0; i < 12; i = i+1) begin
        if (addrA[i] === 1'bx) begin
            finalAddress[i] = addrB[i];
            end
        else if (addrB[i] === 1'bx) begin
            finalAddress[i] = addrA[i];
            end
        else begin
            finalAddress[i] = addrA[i] | addrB[i];
            end
        end
    createAddress = finalAddress;
    end
endfunction


task write16;
  input [11:0]addr;
  input [15:0]data;
  begin

    a = addr;
    rd = 0;
    if (addr[1]) begin
        d[31:16] = data;
        #100 we2 = 1; we3 = 1;
        #100 we2 = 0; we3 = 0; 
        end
    else begin
        d[15:0] = data;
        #100 we0 = 1; we1 = 1;
        #100 we0 = 0; we1 = 0; 
        end
    #100  
    d = 32'hz;
    #200;
  end
endtask

task write32;
  input [11:0]addr;
  input [31:0]data;
  begin
    a = addr;
    d = data;
    rd = 0;
    #100 we0 = 1; we1 = 1; we2 = 1; we3 = 1;
    #100 we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
    #100
    d = 32'hz;
    #200;
  end
endtask

task read32;
  input [11:0]addr;
  begin
    a = addr;
    rd = 0;
    #100 rd = 1;
    #100 rd = 0;
    #200;
  end
endtask

initial begin
    modDataValid = 0;
    txSelect = 1;
    reset = 0;
    sync = 1;
    clk = 0;
    rd = 0;
    we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
    d = 32'hz;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    // Init the FM register set
    write32(createAddress(`FMMODSPACE,`FM_MOD_FREQ), carrierFreq);
    write32(createAddress(`FMMODSPACE,`FM_MOD_DEV), {14'bx,deviation});
    write32(createAddress(`FMMODSPACE,`FM_MOD_BITRATE), {1'b0,15'bx,bitrateDivider});
    write32(createAddress(`FMMODSPACE,`FM_MOD_CIC), 9);

    reset = 1;
    #(2*C) ;
    reset = 0;									  

    // Wait 8 bit periods for the shaping filter to flush
    #(16*bitrateSamplesInt*C) ;

    // Create a reset to clear the shapingFir 
    reset = 1;
    #(2*C) ;
    reset = 0;

    // Wait 1 bit periods
    #(2*bitrateSamplesInt*C) ;


    // Create a reset to clear the nco accumulator
    reset = 1;
    #(2*C) ;
    reset = 0;

    // Set the valid bit and wait 5 bit periods
    #(2*bitrateSamplesInt*C) ;
    modDataValid = 1;
    #(10*bitrateSamplesInt*C) ;

    `ifdef MATLAB_VECTORS
    sampleVectors = 1;
    `else
    #(256*bitrateSamplesInt*C) ;
    $stop;
    `endif

    end

endmodule

