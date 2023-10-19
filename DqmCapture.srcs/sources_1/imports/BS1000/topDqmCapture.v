`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 05:28:00 PM
// Design Name: 
// Module Name: topDqmCapture
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module topDqmCapture(
        input   sysClk,
        input   singleEndedClk,
        input   singleEndedData,
        output  spare,
        output  dqmCapUart_O
    );

    reg         reset   = 1;
    reg [1:0]   eCnt    = 0;
    wire        enable  = 1;   

    systemClock sysClk_buffer
    (
        // Clock in ports
        .clk_in1(sysClk),      // input clk_in1
        // Clock out ports
        .clk_out1(clk)    // output clk_out1
    );

    always @(posedge clk)
        eCnt <= eCnt + 1;
   
    always @(posedge clk) begin
        if(eCnt == 2'b11)
            reset <= 1'b0;
    end    
       
    wire cs = 0;
    wire wr0 = 0;
    wire wr1 = 0;
    wire wr2 = 0;
    wire wr3= 0;
    wire [12:0] addr = 13'h0;
    wire [31:0] dataIn  = 32'h0;
    wire [31:0] dout;
    wire [1:0] rotation;
    wire [3:0] inputSourceSelect;
    wire fb_clk = 0;
    wire framedClkEn;
    wire framesync;
    wire framesyncPulse;
    wire frameEndOfPayload;
    wire syncDetectData;
    wire inSync;
    wire payloadStart;
    wire framer_Clk = singleEndedClk;
    wire framerData = singleEndedData;    
    
    wire    [1:0]   framerRotation;
    wire    [31:0]  framerDout;
   framerTop framer(
       .reset(reset),
       .busClk(fb_clk),
       .cs(cs),
       .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
       .addr(addr),
       .din(dataIn),
       .dout(framerDout),
       .clk(framer_Clk),
       .clkEn(1'b1),
       .dataBitIn(framerData),
       .rotation(framerRotation),
       .inputSourceSelect(),
       .framesyncPulse(framer_Sync),
       .framedBitOut(framer_Data),
       .framesync(framesync),
       .framedClkEn(framedClkEn),
       .frameEndOfPayload(frameEndOfPayload),
       .payloadStart(payloadStart)
   );

 reg framer_Data_0, 
   framedClkEn_0, 
   payloadStart_0,
   frameEndOfPayload_0;
   
   always@(posedge framer_Clk) begin
       framer_Data_0       <= framer_Data;
       framedClkEn_0       <= framedClkEn;
       payloadStart_0      <= payloadStart; 
       frameEndOfPayload_0 <= frameEndOfPayload; 
   end
   
   bert_top dqmCaptureBert(
           .reset(reset),
           .busClk(fb_clk),
           .cs(bertSpace),
           .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
           .addr(addr),
           .dataIn(dataIn),
           .dataOut(dBertDOut),
           .clk(framer_Clk),
           .enable(framedClkEn_0),
           .data(framer_Data_0),
           .inputSourceSelect(),
           .syncDetectData(syncDetectData),
           .inSync(inSync)
       );
   
    dqmCapture dqmCapture(
           .clkFramer(framer_Clk),      
           .enable(1'b1),      
           .reset(reset),      
           .frameData(framer_Data_0),
           .frameSyncPulse(payloadStart_0),
           .frameEndOfPayload(frameEndOfPayload_0),          
           .clkSys(clk),
           .uartOut(spare),
           .syncDetectData(syncDetectData),
           .inSync(inSync),
           .framePayloadClkEn(framedClkEn_0)
       );   

    assign dqmCapUart_O = spare;    

    
endmodule
