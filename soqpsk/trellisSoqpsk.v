//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       SOQPSK Viterbi Decoder Top
// Created      24 April 09
//-----------------------------------------------------------------------------
// 1.0      (amj) initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
`include "../addressMap.v"

module trellisSoqpsk
  (
   clk,reset,symEn,sym2xEn,
   iIn,qIn,
   wr0,wr1,wr2,wr3,
   addr,
   din,dout,
   dac0Select,dac1Select,dac2Select,
   dac0Sync,
   dac0Data,
   dac1Sync,
   dac1Data,
   dac2Sync,
   dac2Data,
   decision,
   ternarySymEnOut,
   //ternarySym2xEnOut
   );
   
   parameter size = 8;
   parameter ROT_BITS = 10;
   
   parameter MFM_CONST_REAL = 18'h09615;
   parameter MFM_CONST_IMAG = 18'h1E982;
   parameter MFP_CONST_REAL = 18'h09615;
   parameter MFP_CONST_IMAG = 18'h2167E;

   input         clk,reset,symEn,sym2xEn;
   input [17:0]  iIn,qIn;
   input         wr0,wr1,wr2,wr3;
   input [11:0]  addr;
   input [31:0]  din;
   output [31:0] dout;
   input [3:0]   dac0Select,dac1Select,dac2Select;
   output        dac0Sync;
   output [17:0] dac0Data;
   output        dac1Sync;
   output [17:0] dac1Data;
   output        dac2Sync;
   output [17:0] dac2Data;
   output        decision;
   output        ternarySymEnOut;
   //output        ternarySym2xEnOut;
   
   
   wire [ROT_BITS-1:0] phaseError;
   wire                decision;
   
   reg [7:0]           phErrShft;
   wire [17:0]         carrierLoopIOut,carrierLoopQOut;
   wire [31:0]         trellisLoopDout;
   trellisCarrierLoop trellisCarrierLoop
     (
      .clk(clk),
      .reset(reset),
      .symEn(symEn),
      .sym2xEn(sym2xEn),
      .iIn(iIn),
      .qIn(qIn),
      .phaseError(phErrShft),
      .wr0(wr0),
      .wr1(wr1),
      .wr2(wr2),
      .wr3(wr3),
      .addr(addr),
      .din(din),
      .dout(trellisLoopDout),
      .iOut(carrierLoopIOut),
      .qOut(carrierLoopQOut),
      .symEnDly(symEnDly),
      .sym2xEnDly(ternarySymEnOut)
      );

`ifdef SIMULATE
   real                phErrReal;
   always @(phErrShft) phErrReal = (phErrShft[7] ? phErrShft - 256.0 : phErrShft);
`endif
   


`ifdef SIMULATE
   real                carrierLoopIOut_REAL, carrierLoopQOut_REAL;
   always @(carrierLoopIOut) carrierLoopIOut_REAL = $itor($signed(carrierLoopIOut))/(2**17);
   always @(carrierLoopQOut) carrierLoopQOut_REAL = $itor($signed(carrierLoopQOut))/(2**17);
`endif

   
   // match filter zero (constant 1 multiply so we add 4 flops to align with "mfm" and "mfp")
   // Now due to a scaling factor in the mfilter the mfm and mfp output has to be scaled back by mult by 2, this
   // adds another flop.
   reg [17:0]         mfzISr0, mfzISr1, mfzISr2, mfzISr3, mfzISr4, 
                      mfzQSr0, mfzQSr1, mfzQSr2, mfzQSr3, mfzQSr4;
   always @(posedge clk) begin
      if (ternarySymEnOut) begin
         mfzISr0  <=  carrierLoopIOut;
         mfzISr1  <=  mfzISr0;
         mfzISr2  <=  mfzISr1;
         mfzISr3  <=  mfzISr2; 
         mfzISr4  <=  mfzISr3; 
         mfzQSr0  <=  carrierLoopQOut;
         mfzQSr1  <=  mfzQSr0;
         mfzQSr2  <=  mfzQSr1;
         mfzQSr3  <=  mfzQSr2; 
         mfzQSr4  <=  mfzQSr3; 
      end
   end
   wire [17:0]          mfzI=mfzISr4;
   wire [17:0]          mfzQ=mfzQSr4;

   // Match filter minus
   wire [17:0] mfmI,mfmQ;
   mfilter #(MFM_CONST_REAL, MFM_CONST_IMAG) mfm
     (
      .clk     (clk              ), 
      .reset   (reset            ), 
      .symEn   (symEnDly         ), 
      .sym2xEn (ternarySymEnOut       ),
      .iIn     (carrierLoopIOut  ),
      .qIn     (carrierLoopQOut  ),
      .iOut    (mfmI             ),
      .qOut    (mfmQ             )
      );

   // Match filter plus
   wire [17:0] mfpI,mfpQ;
   mfilter #(MFP_CONST_REAL, MFP_CONST_IMAG) mfp
     (
      .clk     (clk              ), 
      .reset   (reset            ), 
      .symEn   (symEnDly         ), 
      .sym2xEn (ternarySymEnOut       ),
      .iIn     (carrierLoopIOut  ),
      .qIn     (carrierLoopQOut  ),
      .iOut    (mfpI             ),
      .qOut    (mfpQ             )
      );
        
   // Rotations
   wire [ROT_BITS-1:0] rotMfz0Real, rotMfz1Real, rotMfz2Real, rotMfz3Real,  // 4 real part rotated "match filter zero" outputs
                       rotMfm0Real, rotMfm1Real, rotMfm2Real, rotMfm3Real,  // 4 real part rotated "match filter minus" outputs
                       rotMfp0Real, rotMfp1Real, rotMfp2Real, rotMfp3Real,  // 4 real part rotated "match filter plus" outputs
                       rotMfz0Imag, rotMfz1Imag, rotMfz2Imag, rotMfz3Imag,  // 4 imag part rotated "match filter zero" outputs
                       rotMfm0Imag, rotMfm1Imag, rotMfm2Imag, rotMfm3Imag,  // 4 imag part rotated "match filter minus" output
                       rotMfp0Imag, rotMfp1Imag, rotMfp2Imag, rotMfp3Imag;  // 4 imag part rotated "match filter plus" outputs
   
   // Instead of multipying the minus and plus mfR's I divide the mfZ by two (It's done by shifitng the vector and sign extending the with the sign bit).
   // The reason for this is to get around a sutuation issue with the multBy2withSat() 
   assign              rotMfz0Real =  {mfzI[17], mfzI[17:17-(ROT_BITS-2)]}, rotMfz0Imag =  {mfzQ[17], mfzQ[17:17-(ROT_BITS-2)]};
   assign              rotMfz1Real =  {mfzQ[17], mfzQ[17:17-(ROT_BITS-2)]}, rotMfz1Imag = -{mfzI[17], mfzI[17:17-(ROT_BITS-2)]}; 
   assign              rotMfz2Real = -{mfzI[17], mfzI[17:17-(ROT_BITS-2)]}, rotMfz2Imag = -{mfzQ[17], mfzQ[17:17-(ROT_BITS-2)]};
   assign              rotMfz3Real = -{mfzQ[17], mfzQ[17:17-(ROT_BITS-2)]}, rotMfz3Imag =  {mfzI[17], mfzI[17:17-(ROT_BITS-2)]};

   assign              rotMfm0Real =  mfmI[17:17-(ROT_BITS-1)], rotMfm0Imag =  mfmQ[17:17-(ROT_BITS-1)];
   assign              rotMfm1Real =  mfmQ[17:17-(ROT_BITS-1)], rotMfm1Imag = -mfmI[17:17-(ROT_BITS-1)];
   assign              rotMfm2Real = -mfmI[17:17-(ROT_BITS-1)], rotMfm2Imag = -mfmQ[17:17-(ROT_BITS-1)];
   assign              rotMfm3Real = -mfmQ[17:17-(ROT_BITS-1)], rotMfm3Imag =  mfmI[17:17-(ROT_BITS-1)];

   assign              rotMfp0Real =  mfpI[17:17-(ROT_BITS-1)], rotMfp0Imag =  mfpQ[17:17-(ROT_BITS-1)];
   assign              rotMfp1Real =  mfpQ[17:17-(ROT_BITS-1)], rotMfp1Imag = -mfpI[17:17-(ROT_BITS-1)];
   assign              rotMfp2Real = -mfpI[17:17-(ROT_BITS-1)], rotMfp2Imag = -mfpQ[17:17-(ROT_BITS-1)];
   assign              rotMfp3Real = -mfpQ[17:17-(ROT_BITS-1)], rotMfp3Imag =  mfpI[17:17-(ROT_BITS-1)];

   reg [ROT_BITS-1:0]  rotMfz0RealOut, rotMfz1RealOut, rotMfz2RealOut, rotMfz3RealOut,
                       rotMfm0RealOut, rotMfm1RealOut, rotMfm2RealOut, rotMfm3RealOut,
                       rotMfp0RealOut, rotMfp1RealOut, rotMfp2RealOut, rotMfp3RealOut,
                       rotMfz0ImagOut, rotMfz1ImagOut, rotMfz2ImagOut, rotMfz3ImagOut,
                       rotMfm0ImagOut, rotMfm1ImagOut, rotMfm2ImagOut, rotMfm3ImagOut,
                       rotMfp0ImagOut, rotMfp1ImagOut, rotMfp2ImagOut, rotMfp3ImagOut;
   
   // sync with sym2xEn
   always @(posedge clk) begin
      if (ternarySymEnOut) begin
         // mfz real
         rotMfz0RealOut <= rotMfz0Real;
         rotMfz1RealOut <= rotMfz1Real;
         rotMfz2RealOut <= rotMfz2Real;
         rotMfz3RealOut <= rotMfz3Real;
         // mfz imag
         rotMfz0ImagOut <= rotMfz0Imag;
         rotMfz1ImagOut <= rotMfz1Imag;
         rotMfz2ImagOut <= rotMfz2Imag;
         rotMfz3ImagOut <= rotMfz3Imag;
         // mfm real
         rotMfm0RealOut <= rotMfm0Real;
         rotMfm1RealOut <= rotMfm1Real;
         rotMfm2RealOut <= rotMfm2Real;
         rotMfm3RealOut <= rotMfm3Real;
         // mfm imag
         rotMfm0ImagOut <= rotMfm0Imag;
         rotMfm1ImagOut <= rotMfm1Imag;
         rotMfm2ImagOut <= rotMfm2Imag;
         rotMfm3ImagOut <= rotMfm3Imag;
         // mfp real
         rotMfp0RealOut <= rotMfp0Real;
         rotMfp1RealOut <= rotMfp1Real;
         rotMfp2RealOut <= rotMfp2Real;
         rotMfp3RealOut <= rotMfp3Real;
         // mfp imag
         rotMfp0ImagOut <= rotMfp0Imag;
         rotMfp1ImagOut <= rotMfp1Imag;
         rotMfp2ImagOut <= rotMfp2Imag;
         rotMfp3ImagOut <= rotMfp3Imag;
      end
   end

`ifdef SIMULATE

   real rotMfz0ImagOut_REAL,
     rotMfz1ImagOut_REAL,
     rotMfz2ImagOut_REAL,
     rotMfz3ImagOut_REAL,
     rotMfp0ImagOut_REAL,
     rotMfp1ImagOut_REAL,
     rotMfp2ImagOut_REAL,
     rotMfp3ImagOut_REAL,
     rotMfm0ImagOut_REAL, 
     rotMfm1ImagOut_REAL,
     rotMfm2ImagOut_REAL, 
     rotMfm3ImagOut_REAL;
   
   
   always @(posedge clk)begin
      if(ternarySymEnOut)begin
         rotMfz0ImagOut_REAL = $itor($signed(rotMfz0ImagOut))/(2**(ROT_BITS-2));
         rotMfz1ImagOut_REAL = $itor($signed(rotMfz1ImagOut))/(2**(ROT_BITS-2));
         rotMfz2ImagOut_REAL = $itor($signed(rotMfz2ImagOut))/(2**(ROT_BITS-2));
         rotMfz3ImagOut_REAL = $itor($signed(rotMfz3ImagOut))/(2**(ROT_BITS-2));
         rotMfp0ImagOut_REAL = $itor($signed(rotMfp0ImagOut))/(2**(ROT_BITS-2));
         rotMfp1ImagOut_REAL = $itor($signed(rotMfp1ImagOut))/(2**(ROT_BITS-2));
         rotMfp2ImagOut_REAL = $itor($signed(rotMfp2ImagOut))/(2**(ROT_BITS-2));
         rotMfp3ImagOut_REAL = $itor($signed(rotMfp3ImagOut))/(2**(ROT_BITS-2));
         rotMfm0ImagOut_REAL = $itor($signed(rotMfm0ImagOut))/(2**(ROT_BITS-2));
         rotMfm1ImagOut_REAL = $itor($signed(rotMfm1ImagOut))/(2**(ROT_BITS-2));
         rotMfm2ImagOut_REAL = $itor($signed(rotMfm2ImagOut))/(2**(ROT_BITS-2));
         rotMfm3ImagOut_REAL = $itor($signed(rotMfm3ImagOut))/(2**(ROT_BITS-2));

      end
   end
`endif   

   wire    [1:0]   index;

reg     [7:0]   decayFactor;   
soqpskViterbi #(size, ROT_BITS) soqpskViterbi
   (
    // For the SOQPSK mode the there is one sample per symbol and there for the faster sym2xEn is used as symEn
    .clk(clk), .reset(reset), .symEn(ternarySymEnOut), 
	`ifdef ALDEC_SIM
	.decayFactor(8'hff),
	`else
    .decayFactor(decayFactor),
	`endif
    .mfZr0Real(rotMfz0RealOut), .mfPr0Real(rotMfp0RealOut), .mfMr0Real(rotMfm0RealOut),
    .mfZr1Real(rotMfz1RealOut), .mfPr1Real(rotMfp1RealOut), .mfMr1Real(rotMfm1RealOut),
    .mfZr2Real(rotMfz2RealOut), .mfPr2Real(rotMfp2RealOut), .mfMr2Real(rotMfm2RealOut),
    .mfZr3Real(rotMfz3RealOut), .mfPr3Real(rotMfp3RealOut), .mfMr3Real(rotMfm3RealOut),
    .mfZr0Imag(rotMfz0ImagOut), .mfPr0Imag(rotMfp0ImagOut), .mfMr0Imag(rotMfm0ImagOut),
    .mfZr1Imag(rotMfz1ImagOut), .mfPr1Imag(rotMfp1ImagOut), .mfMr1Imag(rotMfm1ImagOut),
    .mfZr2Imag(rotMfz2ImagOut), .mfPr2Imag(rotMfp2ImagOut), .mfMr2Imag(rotMfm2ImagOut),
    .mfZr3Imag(rotMfz3ImagOut), .mfPr3Imag(rotMfp3ImagOut), .mfMr3Imag(rotMfm3ImagOut),
    .index(index),
    .decision(decision),
    .phaseError(phaseError),
    .devError()
    );

   reg [7:0]            dataBits;
  
   reg                  satPos,satNeg;
   wire                 sign = phaseError[9];

   always @(posedge clk) begin
      if (ternarySymEnOut) begin
         dataBits <= {phaseError[6:0], 1'b0};
         satPos <= !sign && (phaseError[9:6] != 5'b0000);
         satNeg <=  sign && (phaseError[9:6] != 5'b1111);
         if (satPos) begin
            phErrShft <= 8'h7f;
         end
         else if (satNeg) begin
            phErrShft <= 8'h81;
         end
         else begin
            phErrShft <= dataBits;
         end
      end   
   end

// This is a kludge to create a 2x clock enable from the 1x clock enable to satisfy the design
// of the pre-existing line decoder. This design assumes at least 3 clocks between each 1x clock
// enable.
//reg se0;
//assign ternarySym2xEnOut = se0 | ternarySymEnOut;
//always @(posedge clk) begin
//    se0 <= ternarySymEnOut;
//    end

   
/************************ Trellis Register Definitions ************************/

reg trellisSpace;
always @(addr) begin
    casex(addr)
        `TRELLIS_SPACE: trellisSpace <= 1;
        default:        trellisSpace <= 0;
        endcase
    end

always @(negedge wr0) begin
    if (trellisSpace) begin
        casex (addr) 
            `TRELLIS_DECAY:     decayFactor <= din[7:0];
            default: ;
            endcase
        end
    end

reg [31:0]trellisDout;
always @(trellisSpace or addr
         or decayFactor
         ) begin
    if (trellisSpace) begin
        casex (addr)
            `TRELLIS_DECAY:     trellisDout <= {24'b0,decayFactor};
            default:            trellisDout <= 32'hx;
            endcase
        end
    else begin
        trellisDout <= 32'hx;
        end
    end

reg [31:0]dout;
always @(addr or 
         trellisDout or trellisLoopDout
         ) begin
    casex (addr)
        `TRELLIS_SPACE:     dout <= trellisDout;
        `TRELLISLFSPACE:    dout <= trellisLoopDout;
        default:            dout <= 32'hx;
        endcase
    end



/******************************************************************************
                               DAC Output Mux
******************************************************************************/

reg             dac0Sync;
reg     [17:0]  dac0Data;
reg             dac1Sync;
reg     [17:0]  dac1Data;
reg             dac2Sync;
reg     [17:0]  dac2Data;
always @(posedge clk) begin
    case (dac0Select) 
        `DAC_TRELLIS_I: begin
            dac0Data <= carrierLoopIOut;
            dac0Sync <= ternarySymEnOut;
            end
        `DAC_TRELLIS_Q: begin
            dac0Data <= carrierLoopQOut;
            dac0Sync <= ternarySymEnOut;
            end
        `DAC_TRELLIS_PHERR: begin
            dac0Data <= {phErrShft,10'b0};
            dac0Sync <= ternarySymEnOut;
            end
        `DAC_TRELLIS_INDEX: begin
            dac0Data <= {1'b0,index,12'b0};
            dac0Sync <= ternarySymEnOut;
            end
        default: begin
            dac0Data <= {phErrShft,10'b0};
            dac0Sync <= ternarySymEnOut;
            end
        endcase

    case (dac1Select) 
        `DAC_TRELLIS_I: begin
            dac1Data <= carrierLoopIOut;
            dac1Sync <= ternarySymEnOut;
            end
        `DAC_TRELLIS_Q: begin
            dac1Data <= carrierLoopQOut;
            dac1Sync <= ternarySymEnOut;
            end
        `DAC_TRELLIS_PHERR: begin
            dac1Data <= {phErrShft,10'b0};
            dac1Sync <= ternarySymEnOut;
            end
        `DAC_TRELLIS_INDEX: begin
            dac1Data <= {1'b0,index,12'b0};
            dac1Sync <= ternarySymEnOut;
            end
        default: begin
            dac1Data <= {phErrShft,10'b0};
            dac1Sync <= ternarySymEnOut;
            end
        endcase

    case (dac2Select) 
        `DAC_TRELLIS_I: begin
            dac2Data <= carrierLoopIOut;
            dac2Sync <= ternarySymEnOut;
            end
        `DAC_TRELLIS_Q: begin
            dac2Data <= carrierLoopQOut;
            dac2Sync <= ternarySymEnOut;
            end
        `DAC_TRELLIS_PHERR: begin
            dac2Data <= {phErrShft,10'b0};
            dac2Sync <= ternarySymEnOut;
            end
        `DAC_TRELLIS_INDEX: begin
            dac2Data <= {1'b0,index,12'b0};
            dac2Sync <= ternarySymEnOut;
            end
        default: begin
            dac2Data <= {phErrShft,10'b0};
            dac2Sync <= ternarySymEnOut;
            end
        endcase

    end

endmodule



/* -----\/----- EXCLUDED -----\/-----

module multBy2withSat(clk, symEn, sym2xEn, dIn, dOut, symEnDly, sym2xEnOut);
   
   input                 clk,symEn, sym2xEn; 
   input [17:0]          dIn;
   output [17:0]         dOut;
   output                symEnDly, sym2xEnOut;
      
   reg [17:0]            dataBits;
   reg [17:0]            dOut;//, dOutTmp;
  
   reg                   satPos,satNeg;
   wire                  sign = dIn[17];
   always @(posedge clk) begin
      if (sym2xEn) begin
         dataBits <= {dIn[16:0], 1'b0};
         satPos <= !sign && (dIn[17:16] != 2'b00);
         satNeg <=  sign && (dIn[17:16] != 2'b11);
         //dOut <= dOutTmp;
         if (satPos) begin
            dOut <= 18'h1ffff;
         end
         else if (satNeg) begin
            dOut <= 18'h20001;
         end
         else begin
            dOut <= dataBits;
         end
      end   
   end

   // It works to reuse the symEn without delay because it takes 2 sym2xEn to produce the times 2 output
   // Had to add "dOut <= dOutTmp" to line up the 2 samples per symbol correctly 
   assign symEnDly = symEn;
   assign sym2xEnOut = sym2xEn;
   
endmodule
 -----/\----- EXCLUDED -----/\----- */
