//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Viterbi Decoder Test
// Created      07 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module test;

reg clk,reset;
reg clkDiv2;
reg [79:0]din;
reg symEn,sym2xEn;


trellis uut
(
        .clk(clk), .reset(reset), .symEn(symEn), .sym2xEn(sym2xEn), 
    .iIn(din[57:40]), .qIn(din[17:0]), 
    .wr0(), .wr1(), .wr2(), .wr3(), 
    .addr(), 
    .din(), .dout(), 
    .dac0Select(), .dac1Select(), .dac2Select(), 
    .dac0Sync(), 
    .dac0Data(), 
    .dac1Sync(), 
    .dac1Data(), 
    .dac2Sync(), 
    .dac2Data(), 
    .decision(decision), 
    .symEnOut(symEn_tbtDly), 
    .oneOrZeroPredecessor(testDec1)
 );
 
//trellis uut2(clk,reset,symEn_uut2,sym2xEn_uut2,din_uut2[57:40],din_uut2[17:0],,,,,,,,);


initial clk = 0;
initial clkDiv2 = 0;
initial reset = 0;

always #4 clk = !clk; 
always @(posedge clk) clkDiv2 = !clkDiv2; 
        


reg [79:0] readMem[20009:0];
reg [0:0] readMemResult[10001:0];
//reg [1:0] index;
reg [15:0] index;  
reg [15:0] bitIndex;  

reg cntEna;
initial begin
    cntEna = 0;
    #250 cntEna = 1;
    end

reg [4:0]cnt; initial cnt = 20;

// for uut2     
reg [79:0]din_uut2;
reg symEn_uut2, sym2xEn_uut2;
reg [7:0] index_uut2;  
reg cntEna_uut2;
initial begin
    cntEna_uut2 = 0;
    #250 cntEna_uut2 = 1;
    end
reg [4:0]cnt_uut2; initial cnt_uut2 = 20;
// end for uut2
        
        
        
        
// Random data
parameter  PN17 = 16'h008e,
           MASK17 = 16'h00ff;
reg [15:0] sr;
reg [4:0]  zeroCount;
reg        randData;
always @(negedge clk or posedge reset) begin
    if (reset) begin
        zeroCount <= 5'b0;
        sr <= MASK17;
        end
    else if (sr[0] | (zeroCount == 5'b11111))
        begin
        zeroCount <= 5'h0;
        sr <= {1'b0, sr[15:1]} ^ PN17;
        end
    else
        begin
        zeroCount <= zeroCount + 5'h1;
        sr <= sr >> 1;
        end
    randData <= sr[0];
    end

reg [23:0] delaySr;
reg simBit;     
always @(posedge clk) begin
        delaySr <= {delaySr[22:0], simBit};
end
reg [15:0]symEnShift;
//always @(posedge clk)symEnShift <= {symEnShift[14:0],(sym2xEnDly_mult2 && !symEnDly_mult2)};
always @(posedge clk)symEnShift <= {symEnShift[14:0],(sym2xEn && !symEn)};

wire rotEnaTb = symEnShift[4];


reg resultDly; 
always @(posedge clk) begin
        if (rotEnaTb) begin //should be the symEn comming out of the last module who is produsinf the decision bit
                resultDly <= delaySr[23];
        end     
end

        
always @(posedge clk)begin
 // #1;
  //if(cnt == 17) cnt <= 0;
  if(cnt == 13) cnt <= 0;
  //else if(cntEna) cnt <= cnt +1 + randData;
  else if(cntEna) cnt <= cnt +1;          
  case(cnt)
    //0,8: begin 
        0,5,10: begin
      symEn <= 1;
      sym2xEn <= 1;
          simBit <= readMemResult[bitIndex];
      din <= readMem[index];
          //if (index >= 79) begin index <= 0; end // reading in 4*20 samples then wrap around. 20 comes from the # trellis states 
      if (index >= 20000) begin index <= 0; end // reading in 4*20 samples then wrap around. 20 comes from the # trellis states
          else begin 
             index <= index +1;
             bitIndex <= bitIndex +1; 
          end
      end
    //3,11: begin       
        2,7,12: begin
      symEn <= 0;
      sym2xEn <= 1;
          //simBit <= readMemResult[index];
      din <= readMem[index];
          //if (index >= 79) begin index <= 0; end // reading in 4*20 samples then wrap around. 20 comes from the # trellis states
          if (index >= 20000) begin index <= 0; end // reading in 4*20 samples then wrap around. 20 comes from the # trellis states
          else begin index <= index +1; end
      end
    default: begin
      symEn <= 0;
      sym2xEn <= 0;
      //din <= 0;
      end
    endcase
  end
        
        
// always @(posedge clk)begin
//  #1;
//  if(cnt == 17) cnt <= 0;
//  //if(cnt == 15) cnt <= 0;
//  else if(cntEna) cnt <= cnt +1;
//  case(cnt)
//    //0,9: begin
//    0,4,9,14: begin
//    //0,8: begin
//    //0, 10: begin
//      symEn <= 1;
//      sym2xEn <= 1;
//      din <= readMem[index];
//        if (index >= 79) begin index <= 0; end // reading in 4*20 samples then wrap around. 20 comes from the # trellis states
//        else begin index <= index +1; end
//      end
//    //3,11: begin
//    2,7,11,16: begin
//    //4,12: begin
//    //6,16: begin
//      symEn <= 0;
//      sym2xEn <= 1;
//      din <= readMem[index];
//        if (index >= 79) begin index <= 0; end // reading in 4*20 samples then wrap around. 20 comes from the # trellis states
//        else begin index <= index +1; end
//      end
//    default: begin
//      symEn <= 0;
//      sym2xEn <= 0;
//      din <= 0;
//      end
//    endcase
//  end

  
  
  
//`define ONEZERO
//`define ALLZEROES
//`define ALLONES
//`define RANDOM
//`define RANDOM_SIM_NO_NOISE
`define RANDOM_SIM_NOISE

integer bitError, bertIndex;
integer file1,file2;
initial begin
  #100 reset = !reset;
`ifndef IQ_MAG
  uut.viterbi_top.simReset = 1;
`endif
//uut2.viterbi_top.simReset = 1;
  #100 reset = !reset;
  //cnt_uut2 = 0;
  //cnt = 0;
  index = 0;
  bitIndex = 0;
  index_uut2 = 0;
  bitError = 0;
  din = 0;
  din_uut2 = 0; 
  uut.decayFactor =  8'hd9;
`ifdef ONEZERO 
      $readmemh("P:/semco/matlab sim results/One Zero/mfinputs.hex", readMem);
      //$readmemh("P:/semco/MultiModeDemod_107-001/pcmFmFilterRotator/One Zero/mfinputs.hex", readMem);
//    file1 = $fopen("../One Zero/filterOutput.dat");
//    file2 = $fopen("../One Zero/rotatorOutput.dat");
`endif
      
`ifdef ALLZEROES
      $readmemh("P:/semco/MultiModeDemod_107-001/pcmFmFilterRotator/All Zeroes/mfinputs.hex", readMem);
//    file1 = $fopen("../All Zeroes/filterOutput.dat");
//    file2 = $fopen("../All Zeroes/rotatorOutput.dat");
`endif
      
`ifdef ALLONES
      $readmemh("P:/semco/MultiModeDemod_107-001/pcmFmFilterRotator/All Ones/mfinputs.hex", readMem);
//    file1 = $fopen("../All Ones/filterOutput.dat");
//    file2 = $fopen("../All Ones/rotatorOutput.dat");
`endif
      
`ifdef RANDOM
      $readmemh("P:/semco/MultiModeDemod_107-001/pcmFmFilterRotator/Random/mfinputs.hex", readMem);
//    file1 = $fopen("../Random/filterOutput.dat");
//    file2 = $fopen("../Random/rotatorOutput.dat");
`endif

`ifdef RANDOM_SIM_NO_NOISE
      $readmemh("./simData/noisy_data.txt", readMemResult);
      $readmemh("./simData/clean_samples.hex", readMem);
`endif

`ifdef RANDOM_SIM_NOISE
      $readmemh("./simData/noisy_data.txt", readMemResult);
      $readmemh("./simData/noisy_samples.hex", readMem);
`endif


`ifndef IQ_MAG
#380 uut.viterbi_top.simReset = 0; // release the accumulation reset when valid data out of the rotators
  //#180 uut2.viterbi_top.simReset = 0; // release the accumulation reset when valid data out of the rotators
`endif
   

  end

  // BERT 
  reg acsDecision;
  reg [31:0] bertSr;
  
  always @(posedge clk) begin
      if (reset) begin
          bertIndex <= 0;
      end
      else if (symEn_tbtDly) begin      
            bertSr <= {bertSr[30:0], readMemResult[bertIndex]};
            acsDecision <= testDec1;
            bertIndex = bertIndex + 1;
            if (decision != bertSr[4]) begin           // without carrier loop
            //if (decision != bertSr[9]) begin              // without carrier loop   4 deep traceback
            //if (decision != bertSr[10]) begin               // without carrier loop   4 deep traceback
            //if (decision != bertSr[11]) begin                     // with carrierloop
                bitError <= bitError + 1;
            end
      end
  end
  
                          


  
//integer file3;
//initial file3 = $fopen("resultDly.dat") ;
//
//   always @(posedge clk)begin
//        if (rotEnaTb) begin 
//           $fdisplay(file3, "%b", resultDly);
//        end
//   end
// 
//integer file4;
//initial file4 = $fopen("din.dat") ;
//
//   always @(posedge clk)begin
//        if (sym2xEn) begin 
//           $fdisplay(file4, "%h_%h", din[79:40],din[39:0]);
//        end
//   end
  
  
 
endmodule