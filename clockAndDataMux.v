`timescale 1ns/100ps
`include "addressMap.v"

module clockAndDataMux(
    input   [3:0]   muxSelect,
    input           clk0,
    input           data0,
    input           clk1,
    input           data1,
    input           clk2,
    input           data2,
    input           clk3,
    input           data3,
    input           clk4,
    input           data4,
    input           clk5,
    input           data5,
    input           clk6,
    input           data6,
    input           clk7,
    input           data7,
    output          outputClk,
    output          outputData
);

    reg             outputClk_reg;
    assign          outputClk = outputClk_reg;
    always @* begin
        case (muxSelect)
            0:          outputClk_reg = clk0;
            1:          outputClk_reg = clk1;
            2:          outputClk_reg = clk2; 
            3:          outputClk_reg = clk3;
            4:          outputClk_reg = clk4; 
            5:          outputClk_reg = clk5;
            6:          outputClk_reg = clk6;
            7:          outputClk_reg = clk7;    
            default:    outputClk_reg = clk0;
            
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
