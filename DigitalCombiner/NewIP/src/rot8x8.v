//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       multi-h phase rotator
// Created      16 dec 09
//-----------------------------------------------------------------------------
//
// 1.0      AMJ initial coding
//
// 1.1 Rewrite of the previous rotator but now with the full angle going into the
//     complex multipier. ie not just computing the angle in half of one quadrant.
//     this was done to minimized the transoprt delay throught the rotator module.
//     Now the delay through the rotator should be only on clock. The multiplier
//     input ports are both signed 2-complement.
//     Simulated and it looks like the first 10 sampels agrees with the matlab sim
//
// 1.2 Had to add a pipeline delay on the cReal, cImag, i, and q to improve timing
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
`include "addressMap.v"

module rot8x8
  (
   clk, reset, symEn, sym2xEn,
   i,       // data-in normally I
   q,       // data-in normally Q
   angle,
   symEnOut,
   sym2xEnOut,
   iOut,
   qOut
   );

`include "rotCoeff.v"

   parameter               ROT_BITS=8;
   input                   clk, reset, symEn, sym2xEn;
   input [(ROT_BITS-1):0]  i, q;
   input [4:0]             angle;
   output                  symEnOut;
   output                  sym2xEnOut;
   output [(ROT_BITS-1):0] iOut, qOut;


   // The rot module is running at the 100 MHz rate and not the symEn rate, so we have to provide synch signal aligned with data.
   reg [5:0] symEnSr;
   reg [5:0] sym2xEnSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
         sym2xEnSr <= 0;
      end
      else begin
         symEnSr <= {symEnSr[4:0], symEn};
         sym2xEnSr <= {sym2xEnSr[4:0], sym2xEn};
      end
   end

   assign symEnOut = symEnSr[4];
   assign sym2xEnOut = sym2xEnSr[4];

   reg [7:0]     cReal,
                 cImag;

   // muxing the coefficients which will rotate I and Q samples the amount to angle
   always @(posedge clk) begin
      case (angle)
        0 : begin cReal <= C_RE0 ; cImag <= C_IM0 ; end
        1 : begin cReal <= C_RE1 ; cImag <= C_IM1 ; end
        2 : begin cReal <= C_RE2 ; cImag <= C_IM2 ; end
        3 : begin cReal <= C_RE3 ; cImag <= C_IM3 ; end
        4 : begin cReal <= C_RE4 ; cImag <= C_IM4 ; end
        5 : begin cReal <= C_RE5 ; cImag <= C_IM5 ; end
        6 : begin cReal <= C_RE6 ; cImag <= C_IM6 ; end
        7 : begin cReal <= C_RE7 ; cImag <= C_IM7 ; end
        8 : begin cReal <= C_RE8 ; cImag <= C_IM8 ; end
        9 : begin cReal <= C_RE9 ; cImag <= C_IM9 ; end
        10: begin cReal <= C_RE10; cImag <= C_IM10; end
        11: begin cReal <= C_RE11; cImag <= C_IM11; end
        12: begin cReal <= C_RE12; cImag <= C_IM12; end
        13: begin cReal <= C_RE13; cImag <= C_IM13; end
        14: begin cReal <= C_RE14; cImag <= C_IM14; end
        15: begin cReal <= C_RE15; cImag <= C_IM15; end
        16: begin cReal <= C_RE16; cImag <= C_IM16; end
        17: begin cReal <= C_RE17; cImag <= C_IM17; end
        18: begin cReal <= C_RE18; cImag <= C_IM18; end
        19: begin cReal <= C_RE19; cImag <= C_IM19; end
        20: begin cReal <= C_RE20; cImag <= C_IM20; end
        21: begin cReal <= C_RE21; cImag <= C_IM21; end
        22: begin cReal <= C_RE22; cImag <= C_IM22; end
        23: begin cReal <= C_RE23; cImag <= C_IM23; end
        24: begin cReal <= C_RE24; cImag <= C_IM24; end
        25: begin cReal <= C_RE25; cImag <= C_IM25; end
        26: begin cReal <= C_RE26; cImag <= C_IM26; end
        27: begin cReal <= C_RE27; cImag <= C_IM27; end
        28: begin cReal <= C_RE28; cImag <= C_IM28; end
        29: begin cReal <= C_RE29; cImag <= C_IM29; end
        30: begin cReal <= C_RE30; cImag <= C_IM30; end
        31: begin cReal <= C_RE31; cImag <= C_IM31; end
      endcase
   end

   reg [ROT_BITS-1:0] ir, qr;
   always @(posedge clk) begin
      if (reset) begin
         ir <= 0;
         qr <= 0;
      end
      else begin
         ir <= i;
         qr <= q;
      end
   end


   wire [15:6] ixCi, qxCi;
   wire [15:6] ixCr, qxCr;

    `ifdef SEMCO_DEMOD
   mult8x8 reCr
     (
      .SCLR  (reset          ),
      .CE    (1'b1           ),
      .CLK   (clk            ),
      .A     (ir             ),  // [7 : 0]
      .B     (cReal          ),  // [7 : 0]
      .P     (ixCr           )   // [15 : 6]
      );

   mult8x8 imCi
     (
      .SCLR  (reset          ),
      .CE    (1'b1           ),
      .CLK   (clk            ),
      .A     (qr             ),  // [7 : 0]
      .B     (cImag          ),  // [7 : 0]
      .P     (qxCi           )   // [15 : 6]
      );

   mult8x8 reCi
     (
      .SCLR  (reset          ),
      .CE    (1'b1           ),
      .CLK   (clk            ),
      .A     (ir             ),  // [7 : 0]
      .B     (cImag          ),  // [7 : 0]
      .P     (ixCi           )   // [15 : 6]
      );

   mult8x8 imCr
     (
      .SCLR  (reset          ),
      .CE    (1'b1           ),
      .CLK   (clk            ),
      .A     (qr             ),  // [7 : 0]
      .B     (cReal          ),  // [7 : 0]
      .P     (qxCr           )   // [15 : 6]
      );
    `else //SEMCO_DEMOD
   mult8x8 reCr
     (
      .sclr  (reset          ),
      .ce    (1'b1           ),
      .clk   (clk            ),
      .a     (ir             ),  // [7 : 0]
      .b     (cReal          ),  // [7 : 0]
      .p     (ixCr           )   // [15 : 6]
      );

   mult8x8 imCi
     (
      .sclr  (reset          ),
      .ce    (1'b1           ),
      .clk   (clk            ),
      .a     (qr             ),  // [7 : 0]
      .b     (cImag          ),  // [7 : 0]
      .p     (qxCi           )   // [15 : 6]
      );

   mult8x8 reCi
     (
      .sclr  (reset          ),
      .ce    (1'b1           ),
      .clk   (clk            ),
      .a     (ir             ),  // [7 : 0]
      .b     (cImag          ),  // [7 : 0]
      .p     (ixCi           )   // [15 : 6]
      );

   mult8x8 imCr
     (
      .sclr  (reset          ),
      .ce    (1'b1           ),
      .clk   (clk            ),
      .a     (qr             ),  // [7 : 0]
      .b     (cReal          ),  // [7 : 0]
      .p     (qxCr           )   // [15 : 6]
      );
    `endif //SEMCO_DEMOD


   //******************************************************
   // Need to compensate for the div by 2 in the mult cores
   //******************************************************
   `define MPY2
   `ifdef MPY2
   wire [16:16-ROT_BITS] iOutTmp, qOutTmp;
   assign iOutTmp = {ixCr[15], ixCr} - {qxCi[15], qxCi};
   assign qOutTmp = {ixCi[15], ixCi} + {qxCr[15], qxCr};

   reg  [(ROT_BITS-1):0]   iOut, qOut;
   always @(posedge clk)
     if (reset) begin
        iOut <= 0;
        qOut <= 0;
     end
     else begin
        if (iOutTmp[16] & !iOutTmp[15]) begin
            iOut <= {1'b1,{ROT_BITS-2{1'b0}},1'b1};
            end
        else if (!iOutTmp[16] & iOutTmp[15]) begin
            iOut <= {1'b0,{ROT_BITS-1{1'b1}}};
            end
        else begin
            iOut <= iOutTmp[15:15-ROT_BITS+1];
            end
        if (qOutTmp[16] & !qOutTmp[15]) begin
            qOut <= {1'b1,{ROT_BITS-2{1'b0}},1'b1};
            end
        else if (!qOutTmp[16] & qOutTmp[15]) begin
            qOut <= {1'b0,{ROT_BITS-1{1'b1}}};
            end
        else begin
            qOut <= qOutTmp[15:15-ROT_BITS+1];
            end
     end
   `else
   reg [16:16-ROT_BITS] iOutTmp, qOutTmp;
   wire [(ROT_BITS-1):0]   iOut, qOut;
   always @(posedge clk)
     if (reset) begin
        iOutTmp <= 0;
        qOutTmp <= 0;
     end
     else begin
        iOutTmp <= {ixCr[15], ixCr} - {qxCi[15], qxCi};
        qOutTmp <= {ixCi[15], ixCi} + {qxCr[15], qxCr};
     end
   assign iOut = iOutTmp[16:16-ROT_BITS+1];
   assign qOut = qOutTmp[16:16-ROT_BITS+1];
   `endif


`ifdef SIMULATE
   real i_real, q_real;
   real iOut_real, qOut_real;
   always @(i or q or iOut or qOut) begin
      i_real <= $itor($signed(ir))/(2**(ROT_BITS-2));
      q_real <= $itor($signed(qr))/(2**(ROT_BITS-2));
      iOut_real <= $itor($signed(iOut))/(2**(ROT_BITS-2));
      qOut_real <= $itor($signed(qOut))/(2**(ROT_BITS-2));
   end
`endif

endmodule // rot8x8
