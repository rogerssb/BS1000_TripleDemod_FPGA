`timescale 1ns/1ps
module rotMux 
  (
   clk, reset, symEn, sym2xEn, symEnEven,
   mfI_45_0, mfI_45_1, mfI_45_2, mfI_45_3, 
   mfI_54_0, mfI_54_1, mfI_54_2, mfI_54_3, 
   mfQ_45_0, mfQ_45_1, mfQ_45_2, mfQ_45_3, 
   mfQ_54_0, mfQ_54_1, mfQ_54_2, mfQ_54_3,
   iMfInRot, qMfInRot,
   symEnOut, sym2xEnOut, symEnEvenOut
   );
   parameter             MF_BITS = 8;
   
   input                 clk, reset;
   input                 symEn, sym2xEn, symEnEven;
   input [MF_BITS-1:0]   mfI_45_0, mfI_45_1, mfI_45_2, mfI_45_3, 
                         mfI_54_0, mfI_54_1, mfI_54_2, mfI_54_3, 
                         mfQ_45_0, mfQ_45_1, mfQ_45_2, mfQ_45_3, 
                         mfQ_54_0, mfQ_54_1, mfQ_54_2, mfQ_54_3;
   output [MF_BITS-1:0]  iMfInRot, qMfInRot;
   output                symEnOut, sym2xEnOut, symEnEvenOut;
   
// re-clock the Match Filter inputs to improve the fan-out on the register to register timing 
// from the matchfiter output to the imput of the ACS 
reg [MF_BITS-1:0]     mfI_45_0r, mfI_45_1r, mfI_45_2r, mfI_45_3r, 
                        mfI_54_0r, mfI_54_1r, mfI_54_2r, mfI_54_3r, 
                        mfQ_45_0r, mfQ_45_1r, mfQ_45_2r, mfQ_45_3r, 
                        mfQ_54_0r, mfQ_54_1r, mfQ_54_2r, mfQ_54_3r;
always @(posedge clk) begin
    if (reset) begin
        mfI_45_0r <= 0;
        mfI_45_1r <= 0;
        mfI_45_2r <= 0;
        mfI_45_3r <= 0;
        mfI_54_0r <= 0;
        mfI_54_1r <= 0;
        mfI_54_2r <= 0;
        mfI_54_3r <= 0;
        mfQ_45_0r <= 0;
        mfQ_45_1r <= 0;
        mfQ_45_2r <= 0;
        mfQ_45_3r <= 0;
        mfQ_54_0r <= 0;
        mfQ_54_1r <= 0;
        mfQ_54_2r <= 0;
        mfQ_54_3r <= 0;
    end
    else if (symEn) begin
        mfI_45_0r <= mfI_45_0;
        mfI_45_1r <= mfI_45_1;
        mfI_45_2r <= mfI_45_2;
        mfI_45_3r <= mfI_45_3;
        mfI_54_0r <= mfI_54_0;
        mfI_54_1r <= mfI_54_1;
        mfI_54_2r <= mfI_54_2;
        mfI_54_3r <= mfI_54_3;
        mfQ_45_0r <= mfQ_45_0;
        mfQ_45_1r <= mfQ_45_1;
        mfQ_45_2r <= mfQ_45_2;
        mfQ_45_3r <= mfQ_45_3;
        mfQ_54_0r <= mfQ_54_0;
        mfQ_54_1r <= mfQ_54_1;
        mfQ_54_2r <= mfQ_54_2;
        mfQ_54_3r <= mfQ_54_3;
    end
end

// Some control singnals  
reg [1:0]             inputMuxSel; // starts to count to 3, resets to 0 at symEn
always @(posedge clk) begin
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


// four 4to1 input muxes on the match filter inputs. 
reg [MF_BITS-1:0]    mfI45MuxOut, mfI54MuxOut,
                    mfQ45MuxOut, mfQ54MuxOut;
always @(inputMuxSel or 
        mfI_45_0r or mfI_54_0r or
        mfI_45_1r or mfI_54_1r or 
        mfI_45_2r or mfI_54_2r or 
        mfI_45_3r or mfI_54_3r or 
        mfQ_45_0r or mfQ_54_0r or
        mfQ_45_1r or mfQ_54_1r or 
        mfQ_45_2r or mfQ_54_2r or 
        mfQ_45_3r or mfQ_54_3r) 

    begin
    case(inputMuxSel) 
        0: begin
            mfI45MuxOut <= mfI_45_0r;
            mfI54MuxOut <= mfI_54_0r;
            mfQ45MuxOut <= mfQ_45_0r;
            mfQ54MuxOut <= mfQ_54_0r;
        end
        1: begin
            mfI45MuxOut <= mfI_45_1r;
            mfI54MuxOut <= mfI_54_1r;
            mfQ45MuxOut <= mfQ_45_1r;
            mfQ54MuxOut <= mfQ_54_1r;
        end
        2: begin
            mfI45MuxOut <= mfI_45_2r;
            mfI54MuxOut <= mfI_54_2r;
            mfQ45MuxOut <= mfQ_45_2r;
            mfQ54MuxOut <= mfQ_54_2r;
        end
        3: begin
            mfI45MuxOut <= mfI_45_3r;
            mfI54MuxOut <= mfI_54_3r;
            mfQ45MuxOut <= mfQ_45_3r;
            mfQ54MuxOut <= mfQ_54_3r;
        end
    endcase
    end

reg [MF_BITS-1:0]     iMfInRot, qMfInRot;
//reg [ACS_BITS-1:0]    accMetTmp;
always @(posedge clk) begin
//    if (symEn) begin
        if (~symEnEven) begin
            iMfInRot <= mfI45MuxOut;
            qMfInRot <= mfQ45MuxOut;
        end
        else begin
            iMfInRot <= mfI54MuxOut;
            qMfInRot <= mfQ54MuxOut;
        end
//    end
end

   reg [5:0] symEnSr;
   reg [5:0] sym2xEnSr;
   reg [5:0] symEnEvenSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
         sym2xEnSr <= 0;
         symEnEvenSr <= 0;
      end
      else begin
         symEnSr <= {symEnSr[4:0], symEn};
         sym2xEnSr <= {sym2xEnSr[4:0], sym2xEn};
         symEnEvenSr <= {symEnEvenSr[4:0], symEnEven};
      end
   end

   wire symEnOut = symEnSr[0];    
   wire sym2xEnOut = sym2xEnSr[0];    
   wire symEnEvenOut = symEnEvenSr[0];    
   
endmodule
