`timescale 100 ps / 1 ps
module top_tb ;
    parameter sysClk = 93333333.33;   
    parameter PERIOD = (1/sysClk)/(1e-10);
    parameter BIT_CLK_RATE = 40000000.0;
    parameter BIT_PERIOD = (1/BIT_CLK_RATE)/(1e-10);

    reg CLK;
    initial begin
      CLK = 1'b0;
      #(PERIOD/2);
      forever
         #(PERIOD/2) CLK = ~CLK;
    end

    reg BitClk;
    initial begin
      BitClk = 1'b0;
      #(BIT_PERIOD/2);
      forever
         #(BIT_PERIOD/2) BitClk = ~BitClk;
    end

    // create reset 
    reg         reset   ;
    reg         enable  ;   
    initial begin
        reset = 0;
        enable = 0;
        #(PERIOD)
        reset = 1;
        #(PERIOD*10)
        reset = 0;
        #(PERIOD)
        enable = 1;
    end


    //--- Generate Framed Serial Bit Stream with DQM header and PN11 pattern
    //   parameter   frameSize = 1072;
    parameter   framePayloadSize  = 1024;
    parameter   frameSize         = framePayloadSize + 48;
    parameter   pnInit            = 11'b10000000000;    

    reg             dataBit;   
    reg  [14:0]     frameBitCount;
    wire [11:0]     frameByteCount  = frameBitCount[14:3];
    reg  [ 7:0]     frameDataByte;
    wire [15:0]     frameSyncWord   = 16'hFAC4;
    wire [ 2:0]     bitPos          = 3'h7-frameBitCount[2:0];    
    reg  [10:0]     pnsr            = 11'b11000000001;
    reg  [15:0]     dqmValue        = 16'h0000;
    wire            randBit         = pnsr[10];// ^ ((pnsr == 11'b100_0100_0010) ? 1'b1 : 1'b0);           //make a error 1 every 2^11-1 bits
   
   always@(posedge BitClk)
      dataBit <= (frameByteCount > 5) ? randBit : frameDataByte[bitPos];

    always @(posedge BitClk) begin
      if(reset)
         frameBitCount <= frameSize-1;
      else begin
         if(enable) begin
            if(frameBitCount == frameSize-1)
               frameBitCount = 0 ;
            else
               frameBitCount <= frameBitCount + 1;
         end
      end
   end
   always@(posedge BitClk) begin
      if(reset) begin
         pnsr        <= pnInit;
      end
      else begin
         if(frameByteCount > 5)
            pnsr     <= {pnsr[9:0], pnsr[10]^pnsr[8]};
      end
   end

   always @(posedge BitClk) begin
      if(reset)
         dqmValue <= 16'hAA00;
    //   else begin
        //  if(frameBitCount == 48)
        //     dqmValue <= dqmValue + 1;
    //  end
   end

   always @(*) begin
      case (frameByteCount)
         4'b0000: begin           //Sync Word High Byte
            frameDataByte        <= frameSyncWord[15:8];
         end
         4'b0001: begin           //Sync Word Low Byte
            frameDataByte        <= frameSyncWord[7:0];
         end
         4'b0010: begin          //Rsv & VER high byte
            frameDataByte        <= 8'h00;
         end
         4'b0011: begin          //RSV & VER Low Byte
            frameDataByte        <= 8'h00;
         end
         4'b0100: begin          //DQM High Byte            
            frameDataByte        <= dqmValue[15:8];
         end
         4'b0101: begin          //DQM High Byte            
            frameDataByte        <= dqmValue[ 7:0];                 
         end        
      endcase  
   end

    topDqmCapture top_inst (
        // Input Ports - Single Bit
        .sysClk      (CLK),   
        .singleEndedClk(BitClk),
        .singleEndedData(dataBit),
        // Input Ports - Busses
        // Output Ports - Single Bit
        .dqmCapUart_O (dqmCapUart_O),
        .spare(spare)    
        // Output Ports - Busses
        // InOut Ports - Single Bit
        // InOut Ports - Busses
    );

endmodule