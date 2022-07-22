`timescale 1ns/100ps
`include "addressMap.v"

module clockAndDataBufgMux(
    input   [3:0]   muxSelect,
    input           clk0,
    input           clkInvert0,
    input           data0,
    input           clk1,
    input           clkInvert1,
    input           data1,
    input           clk2,
    input           clkInvert2,
    input           data2,
    input           clk3,
    input           clkInvert3,
    input           data3,
    input           clk4,
    input           clkInvert4,
    input           data4,
    input           clk5,
    input           clkInvert5,
    input           data5,
    input           clk6,
    input           clkInvert6,
    input           data6,
    input           clk7,
    input           clkInvert7,
    input           data7,
    output          outputClk,
    output          outputData
);

    reg         [6:0]   Sel;
    always @* begin
        case (muxSelect)
            0:          Sel = 7'b000_0000;
            1:          Sel = 7'b000_0001;
            2:          Sel = 7'b000_0010;
            3:          Sel = 7'b000_0100;
            4:          Sel = 7'b000_1000;
            5:          Sel = 7'b001_0000;
            6:          Sel = 7'b010_0000;
            7:          Sel = 7'b100_0000;
            default:    Sel = 7'b000_0000;
        endcase
    end

   BUFGMUX BUFGMUX10 (
      .I0(clkInvert0 ^ clk0), // 1-bit input: Clock input (S=0)
      .I1(clkInvert1 ^ clk1), // 1-bit input: Clock input (S=1)
      .S(Sel[0]), // 1-bit input: Clock select
      .O(mux01)  // 1-bit output: Clock output
   );

   BUFGMUX BUFGMUX2 (
      .I0(mux01), // 1-bit input: Clock input (S=0)
      .I1(clkInvert2 ^ clk2), // 1-bit input: Clock input (S=1)
      .S(Sel[1]), // 1-bit input: Clock select
      .O(mux2)  // 1-bit output: Clock output
   );

   BUFGMUX BUFGMUX3 (
      .I0(mux2), // 1-bit input: Clock input (S=0)
      .I1(clkInvert3 ^ clk3), // 1-bit input: Clock input (S=1)
      .S(Sel[2]), // 1-bit input: Clock select
      .O(mux3)  // 1-bit output: Clock output
   );

   BUFGMUX BUFGMUX4 (
      .I0(mux3), // 1-bit input: Clock input (S=0)
      .I1(clkInvert4 ^ clk4), // 1-bit input: Clock input (S=1)
      .S(Sel[3]), // 1-bit input: Clock select
      .O(mux4)  // 1-bit output: Clock output
   );

   BUFGMUX BUFGMUX5 (
      .I0(mux4), // 1-bit input: Clock input (S=0)
      .I1(clkInvert5 ^ clk5), // 1-bit input: Clock input (S=1)
      .S(Sel[4]), // 1-bit input: Clock select
      .O(mux5)  // 1-bit output: Clock output
   );

   BUFGMUX BUFGMUX6 (
      .I0(mux5), // 1-bit input: Clock input (S=0)
      .I1(clkInvert6 ^ clk6), // 1-bit input: Clock input (S=1)
      .S(Sel[5]), // 1-bit input: Clock select
      .O(mux6)  // 1-bit output: Clock output
   );

   BUFGMUX BUFGMUX7 (
      .I0(mux6), // 1-bit input: Clock input (S=0)
      .I1(clkInvert7 ^ clk7), // 1-bit input: Clock input (S=1)
      .S(Sel[6]), // 1-bit input: Clock select
      .O(outputClk)  // 1-bit output: Clock output
   );



    reg             outputData_reg;
    assign          outputData = outputData_reg;
    always @* begin
        case (muxSelect)
            0:          outputData_reg = data0;
            1:          outputData_reg = data1;
            2:          outputData_reg = data2;
            3:          outputData_reg = data3;
            4:          outputData_reg = data4;
            5:          outputData_reg = data5;
            6:          outputData_reg = data6;
            7:          outputData_reg = data7;
            default:    outputData_reg = data0;

        endcase
    end

endmodule
