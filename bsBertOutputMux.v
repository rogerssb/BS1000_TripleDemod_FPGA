`timescale 1ns/100ps
`include "addressMap.v"

module bsBertOutputMux(
    input   [3:0]   muxSelect,
    input           ch0BitsyncClk,
    input           ch0BitsyncData,
    input           ch0DecoderClk,
    input           ch0DecoderData,
    input           ch1BitsyncClk,
    input           ch1BitsyncData,
    input           ch1DecoderClk,
    input           ch1DecoderData,
    input           dualBitsyncClk,
    input           dualBitsyncData,
    input           dualDecoderClk,
    input           dualDecoderData,
    input           pngenClk,
    input           pngenData,
    input           framesyncClk,
    input           framesyncData,
    output          outputClk,
    output          outputData
);

    reg             outputClk_reg;
    assign          outputClk = outputClk_reg;
    always @* begin
        case (muxSelect)
            `SYS_OUTPUT_SEL_CH0_BS:     outputClk_reg = ch0BitsyncClk;
            `SYS_OUTPUT_SEL_CH0_PCM:    outputClk_reg = ch0DecoderClk;
            `SYS_OUTPUT_SEL_CH1_BS:     outputClk_reg = ch1BitsyncClk;  
            `SYS_OUTPUT_SEL_CH1_PCM:    outputClk_reg = ch1DecoderClk;
            `SYS_OUTPUT_SEL_DUAL_BS:    outputClk_reg = dualBitsyncClk; 
            `SYS_OUTPUT_SEL_DUAL_PCM:   outputClk_reg = dualDecoderClk;
            `SYS_OUTPUT_SEL_PNGEN:      outputClk_reg = pngenClk;   
            `SYS_OUTPUT_SEL_FS:         outputClk_reg = framesyncClk;      
            default:                    outputClk_reg = ch0BitsyncClk;
            
        endcase
    end

    reg             outputData_reg;
    assign          outputData = outputData_reg;
    always @* begin
        case (muxSelect)
            `SYS_OUTPUT_SEL_CH0_BS:     outputData_reg = ch0BitsyncData;
            `SYS_OUTPUT_SEL_CH0_PCM:    outputData_reg = ch0DecoderData;
            `SYS_OUTPUT_SEL_CH1_BS:     outputData_reg = ch1BitsyncData;  
            `SYS_OUTPUT_SEL_CH1_PCM:    outputData_reg = ch1DecoderData;
            `SYS_OUTPUT_SEL_DUAL_BS:    outputData_reg = dualBitsyncData; 
            `SYS_OUTPUT_SEL_DUAL_PCM:   outputData_reg = dualDecoderData;
            `SYS_OUTPUT_SEL_PNGEN:      outputData_reg = pngenData;   
            `SYS_OUTPUT_SEL_FS:         outputData_reg = framesyncData;      
            default:                    outputData_reg = ch0BitsyncData;
            
        endcase
    end

endmodule
