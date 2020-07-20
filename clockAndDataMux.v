`timescale 1ns/100ps
`include "addressMap.v"

module clockAndDataMux(
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

    reg             outputClk_reg;
    assign          outputClk = outputClk_reg;
    always @* begin
        case (muxSelect)
            0:          outputClk_reg = clkInvert0 ? !clk0 : clk0;
            1:          outputClk_reg = clkInvert1 ? !clk1 : clk1;
            2:          outputClk_reg = clkInvert2 ? !clk2 : clk2; 
            3:          outputClk_reg = clkInvert3 ? !clk3 : clk3;
            4:          outputClk_reg = clkInvert4 ? !clk4 : clk4; 
            5:          outputClk_reg = clkInvert5 ? !clk5 : clk5;
            6:          outputClk_reg = clkInvert6 ? !clk6 : clk6;
            7:          outputClk_reg = clkInvert7 ? !clk7 : clk7;    
            default:    outputClk_reg = clkInvert0 ? !clk0 : clk0;
            
        endcase
    end

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
