//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       multi-h match filter
// Created      05 August 09
//-----------------------------------------------------------------------------
// This module implements a decimating FIR filter. The implementation uses the 
// dsp48a xilinx core to perform a 4 coefficient MAC (see updated 2.0). The incomming I and Q is
// multiplied with a set of complex coefficient (coeffA + j*coeffB) which are passed in as 
// paremeters.
//  mf0 = (i + j*q) * (coeffA + j*coeffB)
//  mf1 = (i + j*q) * conj(coeffA + j*coeffB) 
//      = (i + j*q) * (coeffA - j*coeffB)

//  
// 1.0      AMJ initial coding
// 2.0      bug fix: We can't do the MAC using the dsp48 since the dsp48 output
//          also has to be a decrimenting accumulation and not just incrementing.
//          Now, the accumulatior was moved outside the dsp48 core and the 
//          +/- accumlation is done with logic elements.   
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
  
module mfilt
  (
   clk, reset, symEn, sym2xEn,
   i,       // data-in normally I 
   q,       // data-in normally Q
   mf0IOut, // match filter output real
   mf0QOut, // match filter output imag
   mf1IOut, // match filter output real
   mf1QOut  // match filter output imag
   );
   
   // assign coefficients at module instantiation
   parameter cA0 = 18'h0, cA1 = 18'h0, cA2 = 18'h0, cA3 = 18'h0,
             cB0 = 18'h0, cB1 = 18'h0, cB2 = 18'h0, cB3 = 18'h0;

   parameter             MF_BITS = 10;
   input                 clk, reset, symEn, sym2xEn;
   input [17:0]          i, q;
   output [MF_BITS-1:0]         mf0IOut, mf0QOut;
   output [MF_BITS-1:0]         mf1IOut, mf1QOut;

   reg [17:0]            coeffA, coeffB;
   reg [17:0]            dataA, dataB;
  

   wire                  accClr = reset;
   wire [47:0]           multA, multB, multC, multD; 
   reg [35:0]            mf0I, mf0Q;
   reg [35:0]            mf1I, mf1Q;

   
   // dataReal*coeffReal
   dsp48_mac macA_inst
     (
      .sclr   (reset   ),
      .clk    (clk     ),
      .a      (coeffA  ),//real
      .b      (dataA   ),//real
      .acc    (1'b0    ),
      .accClr (accClr  ),
      .p      (multA    ) 
      );
   //dataImag*coeffImag
   dsp48_mac macB_inst
     (
      .sclr   (reset   ),
      .clk    (clk     ),
      .a      (coeffB  ),//imag
      .b      (dataB   ),//imag
      .acc    (1'b0    ),
      .accClr (accClr  ),
      .p      (multB    )
      );

   // dataReal*coeffImag
   dsp48_mac macC_inst
     (
      .sclr   (reset   ),
      .clk    (clk     ),
      .a      (coeffB  ),//imag
      .b      (dataA   ),//real
      .acc    (1'b0    ),
      .accClr (accClr  ),
      .p      (multC    ) 
      );

   // dataImag*coeffReal
   dsp48_mac macD_inst
     (
      .sclr   (reset   ),
      .clk    (clk     ),
      .a      (coeffA  ),//real
      .b      (dataB   ),//imag
      .acc    (1'b0    ),
      .accClr (accClr  ),
      .p      (multD    )
      );


   

   

/* -----\/----- EXCLUDED -----\/-----
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
 -----/\----- EXCLUDED -----/\----- */


   // This is a realy ugly solution on the bit aligning of data into the mac
   // First the I and Q is latched and shifted in on the sym2xEn. Then, relatched with the
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
        if (symEn) begin
           coeffSel <= 0;
        end
        else if (coeffSel<3) begin
           coeffSel <= coeffSel+1;
        end
     end
   
   
   // shift in the 4 coefficients and data at the 100MHz clock so we can run the 
   // MAC every symEn  
//   always @(cA0 or cA1 or cA2 or cA3 or cB0 or cB1 or cB2 or cB3 or
//            dA0r or dA1r or dA2r or dA3r or dB0r or dB1r or dB2r or dB3 or
//            coeffSel)
   always @(posedge clk)
     if (reset) begin
        coeffA <= 0;
        coeffB <= 0;
        dataA <= 0; 
        dataB <= 0;
     end
     else begin
        case (coeffSel)
          0: begin coeffA <= cA0; coeffB <= cB0; dataA <= dA3r; dataB <= dB3r; end
          1: begin coeffA <= cA1; coeffB <= cB1; dataA <= dA2r; dataB <= dB2r; end
          2: begin coeffA <= cA2; coeffB <= cB2; dataA <= dA1r; dataB <= dB1r; end
          3: begin coeffA <= cA3; coeffB <= cB3; dataA <= dA0r; dataB <= dB0r; end
        endcase
     end

   
   reg [6:0]   multLatchSr;
   always @(posedge clk)
     if (reset) begin
        multLatchSr <= 0;
     end
     else if (coeffSel == 3) begin
        multLatchSr <= {multLatchSr, coeffSel[1]};
     end
     else begin
        multLatchSr <= {multLatchSr, 1'b0};
     end
   
   reg [35:0]  aMinusb; 
   reg [35:0]  dPlusc;
   reg [35:0]  aPlusb;
   reg [35:0]  dMinusc;
   //wire [35:0]  aMinusb = {multA[34], multA[34:0]} - {multB[34], multB[34:0]};
   //wire [35:0]  dPlusc  = {multD[34], multD[34:0]} + {multC[34], multC[34:0]};
   //wire [35:0]  aPlusb  = {multA[34], multA[34:0]} + {multB[34], multB[34:0]};
   //wire [35:0]  dMinusc = {multD[34], multD[34:0]} - {multC[34], multC[34:0]};


   //wire accRst = (multLatchSr[1:0] == 2'b01);
   wire accRst = (multLatchSr[2:1] == 2'b01);
   always @(posedge clk) begin
      if (reset) begin
         mf0I <= 0;
         mf0Q <= 0;
         mf1I <= 0;
         mf1Q <= 0;
         aMinusb <= 0;       
         dPlusc  <= 0;
         aPlusb  <= 0;
         dMinusc <= 0;
      end
      else if (accRst) begin
         aMinusb <= {multA[34], multA[34:0]} - {multB[34], multB[34:0]};
         dPlusc  <= {multD[34], multD[34:0]} + {multC[34], multC[34:0]};
         aPlusb  <= {multA[34], multA[34:0]} + {multB[34], multB[34:0]};
         dMinusc <= {multD[34], multD[34:0]} - {multC[34], multC[34:0]};
         // Match filter Zero
         mf0I <= aMinusb;
         mf0Q <= dPlusc;
         // Match filter One
         mf1I <= aPlusb;
         mf1Q <= dMinusc;
      end
      else begin
         aMinusb <= {multA[34], multA[34:0]} - {multB[34], multB[34:0]};
         dPlusc  <= {multD[34], multD[34:0]} + {multC[34], multC[34:0]};
         aPlusb  <= {multA[34], multA[34:0]} + {multB[34], multB[34:0]};
         dMinusc <= {multD[34], multD[34:0]} - {multC[34], multC[34:0]};
         // Match filter Zero
         mf0I <= mf0I + aMinusb;
         mf0Q <= mf0Q + dPlusc;
         // Match filter One
         mf1I <= mf1I + aPlusb;
         mf1Q <= mf1Q + dMinusc;
      end
   end

   
   // going from the 36 bits out of the DSP46 core to MF_BITS out of the module, with sign extention
//   wire [MF_BITS-1:0]     mf0IOut = mf0I[35:35-(MF_BITS-1)];
//   wire [MF_BITS-1:0]     mf0QOut = mf0Q[35:35-(MF_BITS-1)];
//   wire [MF_BITS-1:0]     mf1IOut = mf1I[35:35-(MF_BITS-1)];
//   wire [MF_BITS-1:0]     mf1QOut = mf1Q[35:35-(MF_BITS-1)];

   reg [MF_BITS-1:0]     mf0IOut;
   reg [MF_BITS-1:0]     mf0QOut;
   reg [MF_BITS-1:0]     mf1IOut;
   reg [MF_BITS-1:0]     mf1QOut;
/* -----\/----- EXCLUDED -----\/-----
   reg [35:0]     mf0IOut;
   reg [35:0]     mf0QOut;
   reg [35:0]     mf1IOut;
   reg [35:0]     mf1QOut;
 -----/\----- EXCLUDED -----/\----- */
      
   always @(posedge clk)
     if (reset) begin
        mf0IOut <= 0;
        mf0QOut <= 0;
        mf1IOut <= 0;
        mf1QOut <= 0;       
     end
     //else if (multLatchSr[5:4] == 2'b01) begin
     else if (multLatchSr[6:5] == 2'b01) begin
/* -----\/----- EXCLUDED -----\/-----
        mf0IOut <= mf0I;
        mf0QOut <= mf0Q;
        mf1IOut <= mf1I;  
        mf1QOut <= mf1Q;
 -----/\----- EXCLUDED -----/\----- */
        mf0IOut <= mf0I[35:35-(MF_BITS-1)];
        mf0QOut <= mf0Q[35:35-(MF_BITS-1)];
        mf1IOut <= mf1I[35:35-(MF_BITS-1)];  
        mf1QOut <= mf1Q[35:35-(MF_BITS-1)];
     end
          

`ifdef SIMULATE
   real i_real;
   real c_real;
   real acc_real;
   real multI_real;
   real q_real;
   real cIm_real;
   real accQ_real;
   real multQ_real;
      
   always @(dataA or coeffA or multA or dataB or coeffB or multB or 
            mf0I or mf0Q)
     begin
        // 
        i_real <= $itor($signed(dataA))/(2**17);
        c_real <= $itor($signed(coeffA))/(2**17);
        acc_real <= $itor($signed(multA))/(2**(35-1));   // why a div by 2?? 
        multI_real <= $itor($signed(mf0I))/(2**(35-1));   // why a div by 2?? 
        // 
        q_real <= $itor($signed(dataB))/(2**17);
        cIm_real <= $itor($signed(coeffB))/(2**17);
        accQ_real <= $itor($signed(multB))/(2**(35-1));   // why a div by 2?? 
        multQ_real <= $itor($signed(mf0Q))/(2**(35-1));   // why a div by 2?? 
     end
   

   always @(posedge clk)
     begin
//        if (symEn)begin
//           $display("\t%f\t%f",
//                  $itor($signed(i))/(2**(17)),
//                  $itor($signed(q))/(2**(17)));
 //                 $itor($signed(mf0I))/(2**(35-1)),
 //                 $itor($signed(mf0Q))/(2**(35-1)));
                  //$itor($signed(dataA))/(2**17),
                  //$itor($signed(coeffA))/(2**17),
                  //$itor($signed(multALatch))/(2**32));
//        end
     end

`endif
      
endmodule
