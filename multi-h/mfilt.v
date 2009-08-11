//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       multi-h match filter
// Created      05 August 09
//-----------------------------------------------------------------------------
// This module implements a decimating FIR filter. The implementation uses the 
// dsp48a xilinx core to perform a 4 coefficient MAC. The incomming I and Q is
// multiplied with a set of complex coefficient (coeffA + j*coeffB) which are passed in as 
// paremeters.
//  mf0 = (i + j*q) * (coeffA + j*coeffB)
//  mf1 = (i + j*q) * conj(coeffA + j*coeffB) 
//      = (i + j*q) * (coeffA - j*coeffB)

//  
// 1.0      AMJ initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
  
module mfilt
  (
   clk, reset, symEn, sym2xEn,
   i,       // data-in normally I 
   q,       // data-in normally Q
   mf0I,    // match filter output real
   mf0Q,    // match filter output imag
   mf1I,    // match filter output real
   mf1Q     // match filter output imag
   );
   
   // assign coefficients at module instantiation
   parameter cA0 = 18'h0, cA1 = 18'h0, cA2 = 18'h0, cA3 = 18'h0,
             cB0 = 18'h0, cB1 = 18'h0, cB2 = 18'h0, cB3 = 18'h0;

   //parameter             NUM_BITS = 10;
   input                 clk, reset, symEn, sym2xEn;
   input [17:0]          i, q;
   output [35:0]         mf0I, mf0Q;
   output [35:0]         mf1I, mf1Q;

   reg [17:0]            coeffA, coeffB;
   reg [17:0]            dataA, dataB;
   reg [35:0]            macALatch, macBLatch;
   

   assign                accClr = reset;
   reg                   accTmp, acc;
   wire [35:0]           macA, macB, macC, macD;
   reg [35:0]            mf0I, mf0Q;
   reg [35:0]            mf1I, mf1Q;

   // dataReal*coeffReal
   dsp48_mac macA_inst
     (
      .sclr   (reset   ),
      .clk    (clk     ),
      .a      (coeffA  ),//real
      .b      (dataA   ),//real
      .acc    (acc     ),
      .accClr (accClr  ),
      .p      (macA    ) 
      );
   //dataImag*coeffImag
   dsp48_mac macB_inst
     (
      .sclr   (reset   ),
      .clk    (clk     ),
      .a      (coeffB  ),//imag
      .b      (dataB   ),//imag
      .acc    (acc     ),
      .accClr (accClr  ),
      .p      (macB    )
      );

   // dataReal*coeffImag
   dsp48_mac macC_inst
     (
      .sclr   (reset   ),
      .clk    (clk     ),
      .a      (coeffB  ),//imag
      .b      (dataA   ),//real
      .acc    (acc     ),
      .accClr (accClr  ),
      .p      (macC    ) 
      );

   // dataImag*coeffReal
   dsp48_mac macD_inst
     (
      .sclr   (reset   ),
      .clk    (clk     ),
      .a      (coeffA  ),//real
      .b      (dataB   ),//imag
      .acc    (acc     ),
      .accClr (accClr  ),
      .p      (macD    )
      );

   
   reg [17:0]            ir, qr;
   always @(posedge clk)
     begin
        if (reset) begin
           ir <= 0;
           qr <= 0;
        end
        else begin 
           if (sym2xEn) begin
              ir <= i;
              qr <= q;
           end
        end
     end


   // This is a realy ugly solution on the bit aligning of data into the mac
   // First the I and Q is latched and sifted in on the sym2xEn. Then, relatched with the
   // symEn to make sure the 4 samples are stable over a symEn. It must be a better way
   // to do this!
   
   reg [17:0]            dA0, dA1, dA2, dA3,
                         dB0, dB1, dB2, dB3;
   always @(posedge clk)
     begin
        if (reset) begin
           dA0 <= 0;
           dA1 <= 0;
           dA2 <= 0;
           dA3 <= 0;
           dB0 <= 0;
           dB1 <= 0;
           dB2 <= 0;
           dB3 <= 0;
        end
        else begin 
           if (sym2xEn) begin
              dA0 <= i;
              dA1 <= dA0;
              dA2 <= dA1;
              dA3 <= dA2;
              dB0 <= q;
              dB1 <= dB0;
              dB2 <= dB1;
              dB3 <= dB2;
           end
        end
     end
   
   reg [17:0]            dA0r, dA1r, dA2r, dA3r,
                         dB0r, dB1r, dB2r, dB3r;
   always @(posedge clk)
     begin
        if (reset) begin
           dA0r <= 0;
           dA1r <= 0;
           dA2r <= 0;
           dA3r <= 0;
           dB0r <= 0;
           dB1r <= 0;
           dB2r <= 0;
           dB3r <= 0;
        end
        else begin 
           if (symEn) begin
              dA0r <= dA0;
              dA1r <= dA1;
              dA2r <= dA2;
              dA3r <= dA3;
              dB0r <= dB0;
              dB1r <= dB1;
              dB2r <= dB2;
              dB3r <= dB3;
           end
        end
      end

   
   reg [1:0] coeffSel;
   always @(posedge clk)
     begin
        acc <= accTmp;
        if (symEn) begin
           coeffSel <= 0;
           accTmp <= 0;
        end
        else if (coeffSel<3) begin
           coeffSel <= coeffSel+1;
           accTmp <= 1;
        end
        else begin
           accTmp <= 0;
        end
     end

   // shift in the 4 coefficients and data at the 100MHz clock so we can run the 
   // MAC every symEn  
   always @(cA0 or cA1 or cA2 or cA3 or cB0 or cB1 or cB2 or cB3 or
            dA0r or dA1r or dA2r or dA3r or dB0r or dB1r or dB2r or dB3 or
            coeffSel)
     begin
        case (coeffSel)
          0: begin coeffA <= cA0; coeffB <= cB0; dataA <= dA3r; dataB <= dB3r; end
          1: begin coeffA <= cA1; coeffB <= cB1; dataA <= dA2r; dataB <= dB2r; end
          2: begin coeffA <= cA2; coeffB <= cB2; dataA <= dA1r; dataB <= dB1r; end
          3: begin coeffA <= cA3; coeffB <= cB3; dataA <= dA0r; dataB <= dB0r; end
        endcase
     end

   reg [3:0]   macLatchSr;
   always @(posedge clk)
     if (reset) begin
        macLatchSr <= 0;
     end
     else if (coeffSel == 3) begin
        macLatchSr <= {macLatchSr, coeffSel[1]};
     end
     else begin
        macLatchSr <= {macLatchSr, 1'b0};
     end
   
   
   always @(posedge clk)
     if (reset) begin
        mf0I <= 0;
        mf0Q <= 0;	
        mf1I <= 0;
        mf1Q <= 0;	
     end
     else if (macLatchSr[3:2] == 2'b01) begin
        mf0I <= {macA[34], macA[34:0]} - {macB[34], macB[34:0]};
        mf0Q <= {macC[34], macC[34:0]} + {macD[34], macD[34:0]};
        mf1I <= {macA[34], macA[34:0]} + {macB[34], macB[34:0]};  // this output represents a multiplication of the complex conjugate of the coefficient
        mf1Q <= {macC[34], macC[34:0]} - {macD[34], macD[34:0]}; // this output represents a multiplication of the complex conjugate of the coefficient
     end

        
`ifdef SIMULATE
   real i_real;
   real c_real;
   real acc_real;
   real macALatch_real;
   real macI_real;
   real q_real;
   real cIm_real;
   real accQ_real;
   real macBLatch_real;
   real macQ_real;
      
   always @(dataA or coeffA or macA or macALatch)
     begin
        // 
        i_real <= $itor($signed(dataA))/(2**17);
        c_real <= $itor($signed(coeffA))/(2**17);
        acc_real <= $itor($signed(macA))/(2**(35-1));   // why a div by 2?? 
        macALatch_real <= $itor($signed(macALatch))/(2**(35-1));   // why a div by 2?? 
        macI_real <= $itor($signed(mf0I))/(2**(35-1));   // why a div by 2?? 
        // 
        q_real <= $itor($signed(dataB))/(2**17);
        cIm_real <= $itor($signed(coeffB))/(2**17);
        accQ_real <= $itor($signed(macB))/(2**(35-1));   // why a div by 2?? 
        macBLatch_real <= $itor($signed(macBLatch))/(2**(35-1));   // why a div by 2?? 
        macQ_real <= $itor($signed(mf0Q))/(2**(35-1));   // why a div by 2?? 
     end
   

   always @(posedge clk)
     begin
        if (symEn)begin
         $display("%f\t%f",
                  $itor($signed(mf0I))/(2**(35-1)),
                  $itor($signed(mf0Q))/(2**(35-1)));
                  //$itor($signed(dataA))/(2**17),
                  //$itor($signed(coeffA))/(2**17),
                  //$itor($signed(macALatch))/(2**32));
        end
     end

`endif
      
endmodule
