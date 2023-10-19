`timescale 1 ns / 100 ps

module dqmCapture(
    input                       clkFramer,
    input                       enable,
    input                       reset,
    input                       frameData,
    input                       frameSyncPulse,
    input                       frameEndOfPayload,    
    input                       clkSys,
    output                      uartOut,
    input                       syncDetectData,
    input                       inSync,
    input                       framePayloadClkEn
);   

    parameter real CLK_FREQ=93333333.33;    
    parameter stateStart             = 3'b000;
    parameter stateWaitDataCapture   = 3'b001;
    parameter stateDataCapture       = 3'b010;
    parameter stateWaitNextFrameSync = 3'b011;
    parameter stateWaitBERTCapture   = 3'b100;
    parameter stateTx                = 3'b101;
    parameter stateWaitTxDone        = 3'b110;

    parameter DqmPerFrame            = 64; 
    parameter BytesPerFrame          = 1 + (DqmPerFrame*2) + 6 + 6 + 1;   //total frame byte count = frame start byte + Dqm bytes + Error count bytes + frame number bytes + frame end byte
    parameter FrameBerStartPos       = 1 + (DqmPerFrame*2) + 6;           //start position of BER Error Count
    parameter FrameStart            = 8'hA5;
    parameter FrameEnd              = 8'h5A;


    //-- clkFramer domain --//
        // these values define Frame Sync payload 
        // current fixed to capture IRIG DQM 
    wire [13:0]     dataCaptureBitPos    =  14'd16;   
    wire [13:0]     dataCaptureLength    =  14'd16;   
    reg  [7:0]      frameDataByte;
    reg  [ 2:0]     state             = stateStart;
    reg  [13:0]     count;
    reg  [31:0]     frameCount        = 0;
    wire [ 3:0]     dataBitCnt        = (count) & 3'b111;    
    reg  [6:0]      DqmCapCount;      
    reg  [7:0]      state_fifo_din;
    reg             state_fifo_wr;
    wire            fifo_wr_en;
    wire [7:0]      fifo_din = state_fifo_din;
    wire            fifo_full;  
    reg             frameSyncPulse_0;
    reg             frameEndOfPayload_0;
    reg             fifoEmpty0, fifoEmpty;
    reg             state_fifoRd;
    //-- clkSys domain --//
    wire            baudEn;   
    wire [15:0]     baudDiv              = 16'd101; //921,600    //16'd7; //12M (11.666667M actual)    
    wire [ 7:0]     uartData;
    wire            uartDataAvailable; 
    wire            fifo_rd_en;
    wire [ 7:0]     fifo_dout;  
    wire            fifo_empty;
    reg             uartRd0, uartRd;    
    reg  [31:0]     berErrors;
    reg  [23:0]     bitTotal;
    reg  [ 7:0]     status;

    assign          uartData            = fifo_dout;
    assign          uartDataAvailable   = !fifo_empty & uartRd;    
    assign          fifo_rd_en          = uartDataNeeded & baudEn & !fifo_empty & uartRd;
    assign          fifo_wr_en          = state_fifo_wr & enable;
    wire [31:0]     next_error          = (syncDetectData == 1'b1) ? 32'd1 : 32'd0;
    
    //-- crossing clock domains --//
    always @(posedge clkFramer) begin
        if(reset) begin
            fifoEmpty0 <= 0;
            fifoEmpty  <= 0;
        end
        else begin
            fifoEmpty0 <= fifo_empty;
            fifoEmpty  <= fifoEmpty0;
        end
    end
    always @(posedge clkSys) begin
        if(reset) begin
            uartRd0 <= 0;
            uartRd  <= 0;
        end
        else begin
            uartRd0 <= state_fifoRd;
            uartRd  <= uartRd0;
        end
    end

    /// Frame Sync Data comes out Framer delayed must delay sync pulses to align 
    always @(posedge clkFramer) begin
        frameSyncPulse_0     <= frameSyncPulse;
        frameEndOfPayload_0  <= frameEndOfPayload;
    end

    uartBaudGen uartbg(
       .clk(clkSys),
       .reset(reset),
       .baudDiv(baudDiv),
       .baudEn(baudEn)
    );   
    
    uartTx uartTx(
       .clk(clkSys),
       .reset(reset),
       .baudEn(baudEn),
       .data(uartData),
       .dataAvailable(uartDataAvailable),
       .dataNeeded(uartDataNeeded),
       .uartOutput(uartOut)
    );        

    dqmFifo dqmFifo (
        .rst(reset),            // input wire rst
        .wr_clk(clkFramer),     // input wire wr_clk
        .rd_clk(clkSys),        // input wire rd_clk
        .din(fifo_din),         // input wire [7 : 0] din
        .wr_en(fifo_wr_en),     // input wire wr_en
        .rd_en(fifo_rd_en),     // input wire rd_en
        .dout(fifo_dout),       // output wire [7 : 0] dout
        .full(fifo_full),       // output wire full
        .empty(fifo_empty)      // output wire empty
    );

    always @(posedge clkFramer) begin
       if(enable) begin
          frameDataByte  <= {frameDataByte[6:0],frameData};
       end
    end
    
    always @(posedge clkFramer) begin
        if(state == stateStart) begin
            status      <= 7'h00;
            berErrors   <= 32'h0000;
            bitTotal    <= 24'h000;
        end
        else begin
            if(framePayloadClkEn) begin
                bitTotal            <= bitTotal + 1;
                if(next_error)
                    berErrors       <= berErrors + next_error;
                if(!inSync)
                    status[0]       <= 1'b1;
            end
        end
    end

    ///---- Data Capture State Machine
    always @(posedge clkFramer) begin
        if (reset) begin
            state                     <= stateStart;
            count                     <= 14'h0000;
            frameCount                <= 24'h000000;            
            state_fifo_wr             <= 1'b0;
            state_fifoRd              <= 1'b0;
        end
        else if(enable) begin
            case (state)
            stateStart : begin
                state_fifoRd        <= 1'b0;
                if (frameSyncPulse && !fifo_full) begin
                    state           <= stateWaitDataCapture;              
                    count           <= 14'h00;                  
                    DqmCapCount     <= 6'h00;
                    state_fifo_din  <= FrameStart;
                    state_fifo_wr   <= 1'b1;
                end
                else
                    state_fifo_wr   <=1'b0;
            end
            stateWaitDataCapture : begin
                state_fifo_wr   <= 1'b0;
                if (count == dataCaptureBitPos) begin
                    state           <= stateDataCapture;
                end               
                count               <= count + 1;                
            end
            stateDataCapture : begin
                if (count == dataCaptureBitPos + dataCaptureLength) begin
                    if(DqmCapCount < DqmPerFrame - 1) 
                        state       <= stateWaitNextFrameSync;
                    else 
                        state       <= stateWaitBERTCapture;                    
                    
                    DqmCapCount     <= DqmCapCount + 1;
                end                
                if(dataBitCnt == 3'b111) begin
                    state_fifo_din  <= frameDataByte;
                    state_fifo_wr   <= 1'b1;
                end
                else begin
                    state_fifo_wr   <= 1'b0;
                end               
                count               <= count + 1;                
            end
            stateWaitNextFrameSync: begin
                state_fifo_wr   <= 1'b0;
                if (frameSyncPulse) begin
                    state           <= stateWaitDataCapture;  
                    count           <= 14'h00;          
                end
                else
                    count           <= count + 1;
            end
            stateWaitBERTCapture : begin
                //if (count == dataCaptureBitPos + dataCaptureLength + bertPayloadBitPos) begin
                if(frameEndOfPayload_0) begin                   
                        state_fifo_din  <= berErrors[31:24];
                        state_fifo_wr   <= 1'b1;
                        state           <= stateTx;
                        count           <= 14'h0000;
                        state_fifoRd    <= 1'b1;                        
                    end                
                else                  
                    count           <= count + 1;               
            end
             stateTx : begin
                case (count) 
                0: state_fifo_din   <= berErrors[23:16];
                1: state_fifo_din   <= berErrors[15: 8];
                2: state_fifo_din   <= berErrors[ 7: 0];
                3: state_fifo_din   <= bitTotal[23:16];
                4: state_fifo_din   <= bitTotal[15: 8];
                5: state_fifo_din   <= bitTotal[ 7: 0];
                6: state_fifo_din   <= status;
                default: begin 
                    state_fifo_din  <= FrameEnd; 
                    state           <= stateWaitTxDone;
                end                
                endcase                
                count               <= count + 1;
            end
            stateWaitTxDone : begin
                state_fifo_wr       <= 1'b0;
                if(fifoEmpty) begin
                    state_fifoRd    <= 1'b0;
                    state           <= stateStart;
                end
            end
            default: begin
                state               <= stateStart;
            end
            endcase
        end
    end
   
  
   
endmodule
