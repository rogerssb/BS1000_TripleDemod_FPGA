`timescale 1ns/1ps

// Finds the index (0-19) of the metric wih the largest number. The maxValue is also computed but is not used in the design
// If all inputs are the same the 19th (13hex) index will be picked.
// All done with 2's complement numbers
module maxMetric(clk,reset,symEn,
                 accMetOut0 , accMetOut1 , accMetOut2 , accMetOut3 , accMetOut4 , 
                 accMetOut5 , accMetOut6 , accMetOut7 , accMetOut8 , accMetOut9 , 
                 accMetOut10, accMetOut11, accMetOut12, accMetOut13, accMetOut14, 
                 accMetOut15, accMetOut16, accMetOut17, accMetOut18, accMetOut19,
                 index, symEnDly
                 );
   
   parameter            size = 8;
   input                clk,reset,symEn;
   input [(size-1)+4:0] accMetOut0 , accMetOut1 , accMetOut2 , accMetOut3 , 
                        accMetOut4 , accMetOut5 , accMetOut6 , accMetOut7 , 
                        accMetOut8 , accMetOut9 , accMetOut10, accMetOut11, 
                        accMetOut12, accMetOut13, accMetOut14, accMetOut15, 
                        accMetOut16, accMetOut17, accMetOut18, accMetOut19;
   output [4:0]         index; // max index (0-19)
   output               symEnDly;
   reg [4:0]            index;                      

   wire [(size-1)+4:0]  maxValS1_0, maxValS1_1, maxValS1_2, maxValS1_3, maxValS1_4,
                        maxValS2,
                        maxValS3;
                                    
   reg [(size-1)+4:0]   maxVal; // the maximum value is not used in the design but it is nice for debug
   reg [(size-1)+4:0]   maxValS1_4_dly1clk;
      
   wire [4:0]           iS1_0; // possible value 3..0
   wire [4:0]           iS1_1; // possible value 4..7
   wire [4:0]           iS1_2; // possible value 8..11
   wire [4:0]           iS1_3; // possible value 12..15
   wire [4:0]           iS1_4; // possible value 16..19
   reg [4:0]            iS1_4_dly1clk;
   
   wire [4:0]           iS2, iS3;
   
   reg [4:0]            iS2_dly1clk;
   
   reg [4:0]            indexS2;
   reg                  syncToACS;
   reg [1:0]            cnt;
               
   // Stage 1 compare. The index value comming out of is scaled to 0..19 using the parameter indesOffset, by adding 4,8,12,or 16
   comp4twosComp  #(size, 0)  compS1_0_3   (clk, /*reset*/, accMetOut0 , accMetOut1 , accMetOut2 , accMetOut3 , iS1_0, maxValS1_0);
   comp4twosComp  #(size, 4)  compS1_4_7   (clk, /*reset*/, accMetOut4 , accMetOut5 , accMetOut6 , accMetOut7 , iS1_1, maxValS1_1);
   comp4twosComp  #(size, 8)  compS1_8_11  (clk, /*reset*/, accMetOut8 , accMetOut9 , accMetOut10, accMetOut11, iS1_2, maxValS1_2);
   comp4twosComp  #(size, 12) compS1_12_15 (clk, /*reset*/, accMetOut12, accMetOut13, accMetOut14, accMetOut15, iS1_3, maxValS1_3);
   comp4twosComp  #(size, 16) compS1_16_19 (clk, /*reset*/, accMetOut16, accMetOut17, accMetOut18, accMetOut19, iS1_4, maxValS1_4);
   // Stage 2 compare
   comp4twosComp  #(size, 0)  compS2_0_3   (clk, /*reset*/, maxValS1_0 , maxValS1_1 , maxValS1_2 , maxValS1_3 , iS2  , maxValS2  );
   // Stage 3 compare (final compare)
   comp4twosComp  #(size, 0)  compS3_0_3   (clk, /*reset*/, maxValS2   , maxValS1_4_dly1clk, 12'b111111111111, 12'b111111111111, iS3, maxValS3);

   always @(posedge clk) begin
      iS1_4_dly1clk <= iS1_4;
      iS2_dly1clk <= iS2;
      maxValS1_4_dly1clk <= maxValS1_4;
   end
          
   // Mux the largest index after stage 1 using the select out of stage 2
   always @(posedge clk)
     begin
        case (iS2_dly1clk)
             0: indexS2 <= iS1_0;
             1: indexS2 <= iS1_1; 
             2: indexS2 <= iS1_2;
             3: indexS2 <= iS1_3;
        endcase
     end

 
   // Latching the final index and MaxVal
   always @(posedge clk)
     begin
        if (reset) begin
           index <= 0;
           maxVal <= 0;
        end
        else if (syncToACS) begin
           maxVal <= maxValS3;
           if (iS3==0)
             index <= indexS2;
           else
             index <= iS1_4_dly1clk;
        end
     end
   
   
   // counter used to create a delayed verion of the synEn
   always @(posedge clk)
     begin
        if (reset || symEn) begin
           cnt <= 0;
        end
        else begin
           if (cnt < 3)
             cnt <= cnt + 1;
           else
             cnt <= cnt;
        end
     end
   
   // Delayed syncEn
   always @(posedge clk)
     begin
        if (reset) begin
           syncToACS <= 0;
        end
        else begin
           if (cnt == 0) begin
              syncToACS <= 1;
           end
           else begin
              syncToACS <= 0;
           end
        end
     end

   reg [3:0]             symEnSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
      end
      else begin
         symEnSr <= {symEnSr[2:0], symEn};
      end
   end
   assign symEnDly = symEnSr[3];

   
endmodule