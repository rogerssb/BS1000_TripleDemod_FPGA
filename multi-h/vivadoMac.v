// This is a verilog synthesizable version of the DSP48A module, dsp48_mac.v,
// used in the Spartan 3DSP inplementation.

`timescale 1 ns/1 ps

module dsp48_mac (
    input                       sclr,
    input                       clk,
    input       signed  [17:0]  a,
    input       signed  [17:0]  b,
    input                       acc,
    input                       accClr,
    output  reg signed  [47:0]  p
);

    reg     signed  [17:0]  aReg,bReg;
    reg     signed  [35:0]  mReg;
    always @(posedge clk) begin
        if (sclr) begin
            aReg <= 0;
            bReg <= 0;
            mReg <= 0;
        end
        else begin
            aReg <= a;
            bReg <= b;
            mReg <= aReg * bReg;
        end

        if (accClr) begin
            p <= 0;
        end
        else if (acc) begin
            p <= p + {{12{mReg[35]}},mReg};
        end
        else begin
            p <= {{12{mReg[35]}},mReg};
        end
    end

endmodule