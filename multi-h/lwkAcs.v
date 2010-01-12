`timescale 1ns/1ps
module acsMultH
  (
   clk, reset, symEn, sym2xEn, symEnEven,
   symEnEvenRot,
   `ifdef USE_DECAY
   decayFactor,
   `endif
   iMfInRot, qMfInRot,
   accMetMuxOut_0, accMetMuxOut_1, accMetMuxOut_2, accMetMuxOut_3,
   selOut,
   normalizeIn, normalizeOut,
   accMetOut,
   iOut, qOut,
   symEnOut, sym2xEnOut
   );
   parameter             ROT_45_0=0, ROT_45_1=0, ROT_45_2 =0,ROT_45_3=0,
                         ROT_54_0=0, ROT_54_1=0, ROT_54_2 =0,ROT_54_3=0;
   //parameter             ACS_BITS = 12;
   parameter             ACS_BITS = 8;
   parameter             MF_BITS = 10;
   parameter             ROT_BITS = 8;
   parameter             ENABLE_DEBUG_PRINTOUT=0;  // Turnes on the debug display printout. You can look at induvidual ASC outputs by turning  
   
   input                 clk, reset;
   input                 symEn, sym2xEn, symEnEven;
   input                 symEnEvenRot;
   `ifdef USE_DECAY
   input [7:0]           decayFactor;
   `endif
   input [MF_BITS-1:0]   iMfInRot, qMfInRot;
   input [ACS_BITS-1:0]  accMetMuxOut_0, accMetMuxOut_1, accMetMuxOut_2, accMetMuxOut_3;
   

   output [1:0]          selOut;
   input                 normalizeIn;
   output                normalizeOut;
   output [ACS_BITS-1:0] accMetOut;     
   output [ROT_BITS-1:0] iOut;
   output [ROT_BITS-1:0] qOut;
   output                symEnOut, sym2xEnOut;

   reg [5:0] symEnSr;
   reg [5:0] sym2xEnSr;
   reg [5:0] symEnEvenRotSr;
   wire      symEnRot, sym2xEnRot;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
         sym2xEnSr <= 0;
         symEnEvenRotSr <= 0;
      end
      else begin
         symEnSr <= {symEnSr[4:0], symEnRot};
         sym2xEnSr <= {sym2xEnSr[4:0], sym2xEnRot};
         symEnEvenRotSr <= {symEnEvenRotSr[4:0], symEnEvenRot};
      end
   end

   wire symEnAdder = symEnRot; //symEnSr[3];    
   wire symEnEvenAdder = symEnEvenRotSr[1]; //symEnEvenRotSr[5];  // 2 clocks through rotator and 4 in the ACS loop
   wire symEnMax = symEnSr[3];    
   wire sym2xEnMax = sym2xEnSr[3];    
   wire symEnOut = symEnMax;
   wire sym2xEnOut = sym2xEnMax;


   // Some control singnals  
   reg [1:0]             inputMuxSel; // starts to count to 3, resets to 0 at symEn
   always @(posedge clk)
     begin
        if (reset) begin
           inputMuxSel <= 3; //0;
        end
        else begin 
           if (symEn) begin
              inputMuxSel <= 0;
           end
           else begin
              if (inputMuxSel<3) begin
                 inputMuxSel <= inputMuxSel+1;
              end
           end
        end
     end

   reg [1:0]             inputMuxSelAcs; // starts to count to 3, resets to 0 at symEn
   always @(posedge clk)
     begin
        if (reset) begin
           inputMuxSelAcs <= 0;
        end
        else begin 
           if (symEnAdder) begin
              inputMuxSelAcs <= 0;
           end
           else begin
              if (inputMuxSelAcs<3) begin
                 inputMuxSelAcs <= inputMuxSelAcs+1;
              end
           end
        end
     end

   
   wire [4:0]           tilt;
   tilt tiltModule
     (
      .clk       (clk        ), 
      .reset     (reset      ), 
      .symEn     (symEn      ),
      .tilt      (tilt       ),
      .symEnEven (symEnEven  )
      );

   
   // Selects the amount of rotation bases on the matlab signal theta(n-2), here called ROT_45/54_?. 
   reg [4:0] rotSel;
   always @(inputMuxSel or symEnEvenRot or tilt)
     begin
        if (~symEnEvenRot) begin
           case(inputMuxSel) 
             0: begin
                rotSel <= 32 - (tilt + (ROT_45_0<<1));
             end
             1: begin
                rotSel <= 32 - (tilt + (ROT_45_1<<1));
             end
             2: begin
                rotSel <= 32 - (tilt + (ROT_45_2<<1));
             end
             3: begin
                rotSel <= 32 - (tilt + (ROT_45_3<<1));
             end
           endcase // case(inputMuxSel)
        end
        else begin
           case(inputMuxSel) 
             0: begin
                rotSel <= 32 - (tilt + (ROT_54_0<<1));
             end
             1: begin
                rotSel <= 32 - (tilt + (ROT_54_1<<1));
             end
             2: begin
                rotSel <= 32 - (tilt + (ROT_54_2<<1));
             end
             3: begin
                rotSel <= 32 - (tilt + (ROT_54_3<<1));
             end
           endcase // case(inputMuxSel)
        end
     end
   
   wire [ROT_BITS-1:0] iOutRot, qOutRot;
   rot8x8 rotator
     (
      .clk        (clk        ), 
      .reset      (reset      ), 
      .symEn      (symEn      ), 
      .sym2xEn    (sym2xEn    ), 
      .i          (iMfInRot[MF_BITS-1:MF_BITS-ROT_BITS] ),    
      .q          (qMfInRot[MF_BITS-1:MF_BITS-ROT_BITS] ),
      .angle      (rotSel     ),
      .symEnOut   (symEnRot   ),   
      .sym2xEnOut (sym2xEnRot ),   
      .iOut       (iOutRot    ),   
      .qOut       (qOutRot    )
      );


`ifdef SIMULATE
   real iOutRot_real, qOutRot_real;
   always @(iOutRot or qOutRot) begin
      iOutRot_real <= $itor($signed(iOutRot))/(2**(ROT_BITS-2));
      qOutRot_real <= $itor($signed(qOutRot))/(2**(ROT_BITS-2));
   end
`endif

`define LWK
`ifdef LWK
   // Going from a serial stream out of the rotator to parallel
   reg [ROT_BITS-1:0] iOutRot_0, iOutRot_1, iOutRot_2, iOutRot_3, 
                       qOutRot_0, qOutRot_1, qOutRot_2, qOutRot_3;
   always @(posedge clk) begin
        case(inputMuxSelAcs) 
          0: begin
             iOutRot_0 <= iOutRot;
             qOutRot_0 <= qOutRot;
          end                              
          1: begin                         
             iOutRot_1 <= iOutRot;
             qOutRot_1 <= qOutRot;
          end                              
          2: begin                         
             iOutRot_2 <= iOutRot;
             qOutRot_2 <= qOutRot;
          end                              
          3: begin                         
             iOutRot_3 <= iOutRot; 
             qOutRot_3 <= qOutRot;
          end
        endcase
     end

   // Latching the I and Q at the symbol rate
   reg [ROT_BITS-1:0] iOutRot_0r, iOutRot_1r, iOutRot_2r, iOutRot_3r, 
                      qOutRot_0r, qOutRot_1r, qOutRot_2r, qOutRot_3r;
   always @(posedge clk) begin
      if (reset) begin
      end
      else if (symEnRot) begin
         iOutRot_0r <= iOutRot_0;
         qOutRot_0r <= qOutRot_0;
         iOutRot_1r <= iOutRot_1;
         qOutRot_1r <= qOutRot_1;
         iOutRot_2r <= iOutRot_2;
         qOutRot_2r <= qOutRot_2;
         //iOutRot_3r <= iOutRot_3; 
         //qOutRot_3r <= qOutRot_3;
         iOutRot_3r <= iOutRot; 
         qOutRot_3r <= qOutRot;
      end
   end
`else
   // Going from a serial stream out of the rotator to parallel
   reg [ROT_BITS-1:0] iOutRot_0, iOutRot_1, iOutRot_2, iOutRot_3, 
                       qOutRot_0, qOutRot_1, qOutRot_2, qOutRot_3;
   always @(inputMuxSelAcs or iOutRot or qOutRot)
     begin
        case(inputMuxSelAcs) 
          0: begin
             iOutRot_0 <= iOutRot;
             qOutRot_0 <= qOutRot;
          end                              
          1: begin                         
             iOutRot_1 <= iOutRot;
             qOutRot_1 <= qOutRot;
          end                              
          2: begin                         
             iOutRot_2 <= iOutRot;
             qOutRot_2 <= qOutRot;
          end                              
          3: begin                         
             iOutRot_3 <= iOutRot; 
             qOutRot_3 <= qOutRot;
          end
        endcase
     end

   // Latching the I and Q at the symbol rate
   reg [ROT_BITS-1:0] iOutRot_0r, iOutRot_1r, iOutRot_2r, iOutRot_3r, 
                      qOutRot_0r, qOutRot_1r, qOutRot_2r, qOutRot_3r;
   always @(posedge clk) begin
      if (reset) begin
      end
      else if (symEnRot) begin
         iOutRot_0r <= iOutRot_0;
         qOutRot_0r <= qOutRot_0;
         iOutRot_1r <= iOutRot_1;
         qOutRot_1r <= qOutRot_1;
         iOutRot_2r <= iOutRot_2;
         qOutRot_2r <= qOutRot_2;
         iOutRot_3r <= iOutRot_3; 
         qOutRot_3r <= qOutRot_3;
      end
   end
`endif

   // ************* 4 parallel adders ****************
        
   // 2-comp adder: Adds a vector of width 8 and one of 12.
   wire [ACS_BITS-1:0]    aExt0 = {{(ACS_BITS-ROT_BITS){iOutRot_0r[ROT_BITS-1]}}, iOutRot_0r};
   wire [ACS_BITS-1:0]    bExt0 = accMetMuxOut_0;
   wire [ACS_BITS-1:0]    sum0 = aExt0 + bExt0;
   // 2-comp adder: Adds a vector of width 8 and one of 12.
   wire [ACS_BITS-1:0]    aExt1 = {{(ACS_BITS-ROT_BITS){iOutRot_1r[ROT_BITS-1]}}, iOutRot_1r};
   wire [ACS_BITS-1:0]    bExt1 = accMetMuxOut_1;
   wire [ACS_BITS-1:0]    sum1 = aExt1 + bExt1;
   // 2-comp adder: Adds a vector of width 8 and one of 12.
   wire [ACS_BITS-1:0]    aExt2 = {{(ACS_BITS-ROT_BITS){iOutRot_2r[ROT_BITS-1]}}, iOutRot_2r};
   wire [ACS_BITS-1:0]    bExt2 = accMetMuxOut_2;
   wire [ACS_BITS-1:0]    sum2 = aExt2 + bExt2;
   // 2-comp adder: Adds a vector of width 8 and one of 12.
   wire [ACS_BITS-1:0]    aExt3 = {{(ACS_BITS-ROT_BITS){iOutRot_3r[ROT_BITS-1]}}, iOutRot_3r};
   wire [ACS_BITS-1:0]    bExt3 = accMetMuxOut_3;
   wire [ACS_BITS-1:0]    sum3 = aExt3 + bExt3;

`ifdef SIMULATE
   real aExt0_real, aExt1_real, aExt2_real, aExt3_real,
        bExt0_real, bExt1_real, bExt2_real, bExt3_real;
   always @(aExt0 or aExt1 or aExt2 or aExt3 or
            bExt0 or bExt1 or bExt2 or bExt3) begin
      aExt0_real <= $itor($signed(aExt0))/(2**(ROT_BITS-2));
      aExt1_real <= $itor($signed(aExt1))/(2**(ROT_BITS-2));
      aExt2_real <= $itor($signed(aExt2))/(2**(ROT_BITS-2));
      aExt3_real <= $itor($signed(aExt3))/(2**(ROT_BITS-2));
      bExt0_real <= $itor($signed(bExt0))/(2**(ROT_BITS-2));
      bExt1_real <= $itor($signed(bExt1))/(2**(ROT_BITS-2));
      bExt2_real <= $itor($signed(bExt2))/(2**(ROT_BITS-2));
      bExt3_real <= $itor($signed(bExt3))/(2**(ROT_BITS-2));
   end
   real sum0_real, sum1_real, sum2_real, sum3_real;
   always @(sum0 or sum1 or sum2 or sum3) begin
      sum0_real <= $itor($signed(sum0))/(2**(ROT_BITS-2));
      sum1_real <= $itor($signed(sum1))/(2**(ROT_BITS-2));
      sum2_real <= $itor($signed(sum2))/(2**(ROT_BITS-2));
      sum3_real <= $itor($signed(sum3))/(2**(ROT_BITS-2));
   end
`endif


   
   // ************* maxMetric compare and sel *****************
   
   wire [ACS_BITS-1:0]    bestMetric;
   wire [5:0]             select;
   compSel  #(ACS_BITS, 0) compSel
     (
      .clk    (clk),
      .ce     (symEnRot),
      .reset  (reset),
      .a      (sum0),
      .b      (sum1),
      .c      (sum2),
      .d      (sum3),
      .index  (select),
      .normalize(normalizeIn),
      .maxVal (bestMetric)
      );
        

   // ** Selecting the winning rotated metrics for phase error correction ** 
   reg [1:0]              selOut;
   reg [ROT_BITS-1:0]     iOut;
   reg [ROT_BITS-1:0]     qOut;
   always @(posedge clk)
      if (reset) begin
         iOut <= 0;
         qOut <= 0;
      end
      else if (symEnRot) begin
         selOut <= select[1:0];
         case (select)
           0: begin
              iOut <= iOutRot_0r;
              qOut <= qOutRot_0r;
           end
           1: begin
              iOut <= iOutRot_1r;
              qOut <= qOutRot_1r;
           end
           2: begin
              iOut <= iOutRot_2r;
              qOut <= qOutRot_2r ;
           end
           3: begin
              iOut <= iOutRot_3r;
              qOut <= qOutRot_3r ;
           end
         endcase
      end
   
   
   
   // --------- Normailzation and forget factor -------------
//`define USE_DELAYED_NORM
`ifdef USE_DELAYED_NORM
`else
   reg normalizeOut;
   always @(bestMetric[ACS_BITS-1:ACS_BITS-2] or normalizeIn) begin
      if ((bestMetric[ACS_BITS-1:ACS_BITS-2] == 2'b01) && !normalizeIn ) begin //check (in the pos. case) if the acc. 8th bit saturate
         normalizeOut <= 1;
      end
      else begin
         normalizeOut <= 0;
      end
   end
`endif
   
`ifdef USE_DECAY
   wire [ACS_BITS-1:0]   accMetOut;
   wire [12:0]           decayOut;
   assign                accMetOut = decayOut[12:1] + decayOut[0];
   
   mult12x8 accumDecay
     (
//      .ce(symEnRot), 
      .ce(symEnMax), 
      .clk(clk), 
      .sclr(reset),
      .a(normalizeIn ? accTemp : bestMetric), 
      .b(decayFactor), 
      .p(decayOut)
      );

`ifdef USE_DELAYED_NORM
   reg normalizeOut;
   always @(decayOut[12:11]) begin
         if ((decayOut[12:11] == 2'b01) ) begin //check (in the pos. case) if the acc. 8th bit saturate
            normalizeOut <= 1;
         end
         else begin
            normalizeOut <= 0;
         end
      end
`endif
   
`else
assign accMetOut = bestMetric;

`endif   


   
endmodule

   
