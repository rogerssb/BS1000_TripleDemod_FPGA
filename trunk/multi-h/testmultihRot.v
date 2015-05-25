//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       multi-h Test bench
// Created      5 August 09
//-----------------------------------------------------------------------------
// 1.0      (amj)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module test;

   reg        clk,reset;
   reg        clkDiv2;
   reg [79:0] din, dinH;
   reg        symEn,sym2xEn;

`include "mfiltCoeff.v"

`ifdef SIM_MFILT
   mfilt # (C0_0, C0_1, C0_2, C0_3, C1_0, C1_1, C1_2, C1_3) uut_mfilt
     (
      .clk     (clk       ), 
      .reset   (reset     ), 
      .symEn   (symEn     ), 
      .sym2xEn (sym2xEn   ),
      .i       (din[57:40]),    
      .q       (din[17:0] ),    
      .mf0I    (          ),   
      .mf0Q    (          ),
      .mf1I    (          ),   
      .mf1Q    (          )
      );
   
   mfiltBank uut_mfiltBank
     (
      .clk     (clk       ),
      .reset   (reset     ),
      .symEn   (symEn     ),
      .sym2xEn (sym2xEn   ),
      .i       (din[57:40]),
      .q       (din[17:0] )
      );   
`endif



//`define SIM_ROT
`ifdef SIM_ROT
   rotator uut_rot
     (
      .clk     (clk       ), 
      .reset   (reset     ), 
      .symEn   (symEn     ), 
      .i       (dinH[57:40]),    
      .q       (dinH[17:0] ),
      .sel     (rotSel    ),
      .iOut    (          ),   
      .qOut    (          )
      );
`endif


   wire [4:0] tilt;
   testTilt testTilt
     (
      .clk   (clk  ), 
      .reset (reset), 
      .symEn (symEn),
      .tilt  (tilt )
      );


   acsMultH acsMultH 
     (
      .clk               (clk    ),
      .reset             (reset  ),
      .symEn             (symEn  ),
      .sym2xEn           (sym2xEn),
      //.decayFactor       (8'hff),
/* -----\/----- EXCLUDED -----\/-----
      .mfI_45_0          (1      ),
      .mfI_45_1          (2      ),
      .mfI_45_2          (3      ),
      .mfI_45_3          (4      ),
      .mfI_54_0          (6      ),
      .mfI_54_1          (7      ),
      .mfI_54_2          (8      ),
      .mfI_54_3          (9      ),
      .mfQ_45_0          (101    ),
      .mfQ_45_1          (102    ),
      .mfQ_45_2          (103    ),
      .mfQ_45_3          (104    ),
      .mfQ_54_0          (106    ),
      .mfQ_54_1          (107    ),
      .mfQ_54_2          (108    ),
      .mfQ_54_3          (109    ),
 -----/\----- EXCLUDED -----/\----- */
      .mfI_45_0          (dinH[57:40]),
      .mfI_45_1          (dinH[57:40]),
      .mfI_45_2          (dinH[57:40]),
      .mfI_45_3          (dinH[57:40]),
      .mfI_54_0          (dinH[57:40]),
      .mfI_54_1          (dinH[57:40]),
      .mfI_54_2          (dinH[57:40]),
      .mfI_54_3          (dinH[57:40]),
      .mfQ_45_0          (dinH[17:0] ),
      .mfQ_45_1          (dinH[17:0] ),
      .mfQ_45_2          (dinH[17:0] ),
      .mfQ_45_3          (dinH[17:0] ),
      .mfQ_54_0          (dinH[17:0] ),
      .mfQ_54_1          (dinH[17:0] ),
      .mfQ_54_2          (dinH[17:0] ),
      .mfQ_54_3          (dinH[17:0] ),

      .tilt              (tilt       ),
      .accMet_45_0       (accMet_45_0),
      .accMet_45_1       (accMet_45_1),
      .accMet_45_2       (accMet_45_2),
      .accMet_45_3       (accMet_45_3),
      .accMet_54_0       (accMet_54_0),
      .accMet_54_1       (accMet_54_1),
      .accMet_54_2       (accMet_54_2),
      .accMet_54_3       (accMet_54_3),
      .selOut            (           ),
      .normalizeIn       ( norm      ),
      .normalizeOut      ( norm      ),
      .accMetOut         (accMetOut  ),
      .iOut              (           ),
      .qOut              (           )
      );

   wire [11:0] accMetOut;
   wire [11:0] accMet_45_0 = accMetOut;
   wire [11:0] accMet_45_1 = accMetOut;
   wire [11:0] accMet_45_2 = accMetOut;
   wire [11:0] accMet_45_3 = accMetOut;
   wire [11:0] accMet_54_0 = accMetOut;
   wire [11:0] accMet_54_1 = accMetOut;
   wire [11:0] accMet_54_2 = accMetOut;
   wire [11:0] accMet_54_3 = accMetOut;
   
   
   wire       testDec1;
   
   initial clk = 0;
   initial clkDiv2 = 0;
   initial reset = 0;
   
   always #4 clk = !clk; 
   always @(posedge clk) clkDiv2 = !clkDiv2; 
   


reg [79:0] readMem[3000:0];
reg [0:0] readMemResult[100:0];
//reg [1:0] index;
reg [15:0] index;  
reg [15:0] bitIndex;  

reg [4:0] rotSel;	

initial begin 
	rotSel = 0;
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
      if (rotEnaTb) begin //should be the symEn comming out of the last module who is produsing the decision bit
	 resultDly <= delaySr[23];
      end	
   end

integer indexH;
initial indexH=0;
   
reg simBit;	
always @(posedge clk)begin
   if(cnt == 13) begin 
      cnt <= 0;
   end	   
   else if(cntEna) begin 
      cnt <= cnt +1;
      case(cnt)
        0: begin
           symEn <= 1;
           sym2xEn <= 1;
	   rotSel <= rotSel + 1;
           dinH <= readMem[indexH];
           indexH <= indexH + 1;
        end
        1,2: begin
           symEn <= 0;
           sym2xEn <= 0;
           dinH <= readMem[indexH];
           indexH <= indexH + 1;
        end
        7: begin
           symEn <= 1;
           sym2xEn <= 1;
	   rotSel <= rotSel + 1;
           dinH <= readMem[indexH];
           indexH <= indexH + 1;
        end
        8,9: begin
           symEn <= 0;
           sym2xEn <= 0;
           dinH <= readMem[indexH];
           indexH <= indexH + 1;
        end
        3,10: begin
           symEn <= 0;
           sym2xEn <= 1;
           dinH <= readMem[indexH];
        end
        default: begin
           symEn <= 0;
           sym2xEn <= 0;
           dinH <= 0;
           //din <= 0;
        end
      endcase
   end
end	 

/* -----\/----- EXCLUDED -----\/-----
integer indexH;
initial indexH=0;
always @(posedge clk)begin
	if(cntEn) begin
	dinH <= readMem[indexH];
	indexH <= indexH + 1;
	end
end
 -----/\----- EXCLUDED -----/\----- */

	

	
//`define MULTI_H_ROT_TEST  
`define MULTI_H_ROT_TEST_2  
//`define ONEZERO
//`define ALLONES
//`define RANDOM
//`define RANDOM_SIM_NO_NOISE
//`define RANDOM_SIM_NOISE

integer file1,file2;
initial begin
  //uut.soqpskTop.simReset = 1;
  #100 reset = !reset;
  #100 reset = !reset;
  index = 0;
  bitIndex = 0;
  bitError = 0;
  din = 0;
  
`ifdef MULTI_H_ROT_TEST
      $readmemh("C:/projects/semco/svn_checkout_folder/multi-h/mult-h-rot-test.hex", readMem);
`endif

`ifdef MULTI_H_ROT_TEST_2
      $readmemh("C:/projects/semco/svn_checkout_folder/multi-h/mult-h-rot-test2.hex", readMem);
`endif
      
`ifdef ALLONES
//      $readmemh("P:/semco/matlab_sim_results/multi-h/incNum.hex", readMem);
      $readmemh("P:/semco/matlab_sim_results/multi-h/mfinputs.hex", readMem);
`endif
            
`ifdef RANDOM
      $readmemh("", readMem);
`endif

//`ifdef RANDOM_SIM_NO_NOISE
//      $readmemh("c:/projects/semco/hdl/data/noisy_data.txt", readMemResult);
//      $readmemh("c:/projects/semco/hdl/data/clean_samples.hex", readMem);
//`endif

//`ifdef RANDOM_SIM_NOISE
//      $readmemh("c:/projects/semco/hdl/data/noisy_data.txt", readMemResult);
//      $readmemh("c:/projects/semco/hdl/data/noisy_samples.hex", readMem);
//`endif


//#305 uut.soqpskTop.simReset = 0; // release the accumulation reset when valid data out of the rotators
   

  end

  // BERT 
  integer bitError;
/* -----\/----- EXCLUDED -----\/-----
  reg acsDecision;
  reg [15:0] bertSr;
  
  always @(posedge clk) begin
	  if (sym2xEn) begin	
		  bertSr <= {bertSr[14:0], simBit};
		  acsDecision <= testDec1;
		  //if (acsDecision != bertSr[6]) begin		  // without carrier loop
		  if (decision != bertSr[11]) begin			  // with carrierloop
			  bitError <= bitError + 1;
		  end
	  end
  end
 -----/\----- EXCLUDED -----/\----- */
  
			  


  
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