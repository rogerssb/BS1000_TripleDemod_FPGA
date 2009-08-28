//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Viterbi Decoder Test
// Created      17 june 09
//-----------------------------------------------------------------------------
// 1.0      (amj)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module test;

reg clk,reset;
reg clkDiv2;
reg [79:0]din;
reg symEn,sym2xEn;


trellisSoqpsk uut
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
    .decision(decision)
	//.sym2xEnDly(sym2xEnDly)
 );
 
wire testDec1;

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

initial begin
    cntEna = 0;
    #250 cntEna = 1;
    end

reg [4:0]cnt; initial cnt = 20;
reg cntEna;

	
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

reg simBit;	
	
always @(posedge clk)begin
   // #1;
   //if(cnt == 17) cnt <= 0;
   if(cnt == 8) cnt <= 0;
   //else if(cntEna) cnt <= cnt +1 + randData;
   else if(cntEna) cnt <= cnt +1;	  
   case(cnt)
     //0,8: begin 
     0,4: begin
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
     //4,13: begin	
     2,6: begin
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
	
	
  
  
  
//`define ONEZERO
//`define ALLONES
`define RANDOM
//`define RANDOM_SIM_NO_NOISE
//`define RANDOM_SIM_NOISE

integer file1,file2;
initial begin
`ifndef IQ_MAG
  uut.soqpskViterbi.simReset = 1;
`endif
  #100 reset = !reset;
  #100 reset = !reset;
  index = 0;
  bitIndex = 0;
  bitError = 0;
  din = 0;
  
`ifdef ONEZERO
      $readmemh("P:/semco/matlab_sim_results/soqpsk/One Zero/mfinputs.hex", readMem);
`endif
      
`ifdef ALLONES
      $readmemh("P:/semco/matlab_sim_results/soqpsk/All Ones/mfinputs.hex", readMem);
`endif
            
`ifdef RANDOM
      $readmemh("P:/semco/matlab_sim_results/soqpsk/Random/mfinputs.hex", readMem);
`endif

//`ifdef RANDOM_SIM_NO_NOISE
//      $readmemh("c:/projects/semco/hdl/data/noisy_data.txt", readMemResult);
//      $readmemh("c:/projects/semco/hdl/data/clean_samples.hex", readMem);
//`endif

//`ifdef RANDOM_SIM_NOISE
//      $readmemh("c:/projects/semco/hdl/data/noisy_data.txt", readMemResult);
//      $readmemh("c:/projects/semco/hdl/data/noisy_samples.hex", readMem);
//`endif


`ifndef IQ_MAG
#305 uut.soqpskViterbi.simReset = 0; // release the accumulation reset when valid data out of the rotators
`endif
   

  end

  // BERT 
  reg acsDecision;
  reg [15:0] bertSr;
  
  integer bitError;
  always @(posedge clk) begin
     //if (sym2xEnDly) begin	
     if (sym2xEn) begin	
		  bertSr <= {bertSr[14:0], simBit};
		  acsDecision <= testDec1;
		  //if (acsDecision != bertSr[6]) begin		  // without carrier loop
		  if (decision != bertSr[11]) begin			  // with carrierloop
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