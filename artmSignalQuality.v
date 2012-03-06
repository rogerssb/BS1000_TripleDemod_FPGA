/******************************************************************************
  This routine counts the number of I and/or Q data samples that are beyond a
  tolerance level from the average level of the previous 1024 sample packet.
********************************************************************************/

`timescale 1ns / 10 ps

module artmSignalQuality(
    sysClk,
    reset,
    hold,
    demodLock,
    bitSyncLock,
    symEnable,
    iSymData, qSymData,
    threshold,
    serialOut,
    interiorCountOut,
    exteriorCountOut,
    meanI, meanQ
    );


input sysClk, reset, hold, demodLock, bitSyncLock;

input           symEnable;
input   [17:0]  iSymData,qSymData;
input   [7:0]   threshold;
output          serialOut;
output  [10:0]  interiorCountOut,exteriorCountOut;
output  [7:0]   meanI,meanQ;

//***************************************************************************
//                       Take Absolue Value of End Samples
//***************************************************************************

reg     [17:0]  iEndSat,qEndSat;
wire    [17:0]  iNegEndSat = -iEndSat;
wire    [17:0]  qNegEndSat = -qEndSat;
reg     [5:0]   absI,absQ;
always @(posedge sysClk) begin
    if (symEnable) begin
        // Saturate inputs at +/- (2^17)-1
        if (iSymData == 18'h20000) begin 
            iEndSat <= 18'h20001;
            end
        else begin
            iEndSat <= iSymData;
            end
        if (qSymData == 18'h20000) begin    
            qEndSat <= 18'h20001;
            end
        else begin
            qEndSat <= qSymData;
            end
        // Absolute value
        if (iEndSat[17]) begin                
            absI <= iNegEndSat[16:11];
            end
        else begin
            absI <= iEndSat[16:11];
            end
        if (qEndSat[17]) begin                          
            absQ <= qNegEndSat[16:11];
            end
        else begin
            absQ <= qEndSat[16:11];
            end
        end
    end

//***************************************************************************
//                          Symbol Counter
//***************************************************************************

reg [9:0] symbolCount;
wire dumpCounters = (symbolCount == 0);
reg dumpCounters0,dumpCounters1;
reg dumpCountersDelayed;
always @(posedge sysClk or posedge reset) begin
    if (reset) begin
        symbolCount <= 0;
        dumpCounters0 <= 0;
        dumpCounters1 <= 0;
        dumpCountersDelayed <= 0;
        end
    else if (symEnable) begin
        symbolCount <= symbolCount - 1;
        dumpCounters0 <= dumpCounters;
        dumpCounters1 <= dumpCounters;
        dumpCountersDelayed <= dumpCounters0;
        end
    end

//***************************************************************************
//                        Calculate the Mean of I/Q
//***************************************************************************
//
// Takes the average of I and Q. This average is used to determine interior
// and exterior thresholds.
//

reg [15:0]meanSumI, meanSumQ;
reg [7:0]meanI, meanQ;
wire [15:0] sumI = meanSumI + {10'h00,absI};
wire [15:0] sumQ = meanSumQ + {10'h00,absQ};
always @(posedge sysClk) begin
    if (symEnable) begin
        if (dumpCounters0) begin
            meanSumI <= {10'h00,absI};
            meanSumQ <= {10'h00,absQ};
            meanI <= meanSumI[15:8] + {7'b0,meanSumI[7]};               // round
            meanQ <= meanSumQ[15:8] + {7'b0,meanSumQ[7]};               // round
            end
        else begin
            meanSumI <= sumI;          // mean = mean + absI
            meanSumQ <= sumQ;          // mean = mean + absQ
            end
        end
    end

//***************************************************************************
//                        Count Threshold Crossings
//***************************************************************************
//
// Count interior and exterior threshold crossings. The threshold is derived
// from the mean values.
//

wire    [8:0]   intDiffI = {1'b0,meanI} - {1'b0,threshold};
wire    [7:0]   intThreshI = (intDiffI[8]) ? (8'h0) : intDiffI[7:0];
wire    [8:0]   extSumI = {1'b0,meanI} + {1'b0,threshold};
wire    [7:0]   extThreshI = (extSumI[8]) ? (8'hff) : extSumI[7:0];
wire    [8:0]   intDiffQ = {1'b0,meanQ} - {1'b0,threshold};
wire    [7:0]   intThreshQ = (intDiffQ[8]) ? (8'h0) : intDiffQ[7:0];
wire    [8:0]   extSumQ = {1'b0,meanQ} + {1'b0,threshold};
wire    [7:0]   extThreshQ = (extSumQ[8]) ? (8'hff) : extSumQ[7:0];
wire    [1:0]   interiorHit = ({absI,2'b0} < intThreshI ) + ({absQ,2'b0} < intThreshQ );
wire    [1:0]   exteriorHit = ({absI,2'b0} > extThreshI ) + ({absQ,2'b0} > extThreshQ );
reg     [10:0]  interiorCount;
reg     [10:0]  interiorHold;
reg     [10:0]  exteriorCount;
reg     [10:0]  exteriorHold;
always @(posedge sysClk) begin
    if (symEnable) begin
        if (dumpCounters1) begin
            interiorHold <= interiorCount;
            exteriorHold <= exteriorCount;
            interiorCount <= {9'b0,interiorHit};
            exteriorCount <= {9'b0,exteriorHit};
            end
        else begin
            interiorCount <= interiorCount + {9'b0,interiorHit};
            exteriorCount <= exteriorCount + {9'b0,exteriorHit};
            end
        end
    end



//***************************************************************************
//                        Uart Data Latches
//***************************************************************************
//
// Create data latches to hold the count values for the Uart to shift out.
//

reg     [10:0]  uartInteriorHold;
reg     [10:0]  uartExteriorHold;
assign          interiorCountOut = (!hold) ? uartInteriorHold : interiorCountOut;
assign          exteriorCountOut = (!hold) ? uartExteriorHold : exteriorCountOut;
reg             uartDataStrobe;
reg             uartDataAvailable;
wire dataAvailable = dumpCountersDelayed                        // Sets with dumpCountersDelayed
                  || (dataAvailable && !uartDataStrobe);        // Resets with uartDataStrobe
always @ (posedge sysClk) begin
    if (uartDataStrobe) begin                                 // Latch the data
        uartInteriorHold <= interiorHold;
        uartExteriorHold <= exteriorHold;
        end
    uartDataStrobe <= dataAvailable ||
                      uartDataStrobe && !uartDataAvailable;   // Create a Uart data strobe
    end


//***************************************************************************
//                        Create UART State Machine
//***************************************************************************

parameter UART_IDLE =   0;
parameter UART_START =  1;
parameter UART_STATUS = 2;
parameter UART_INTMSB = 3;
parameter UART_INTLSB = 4;
parameter UART_EXTMSB = 5;
parameter UART_EXTLSB = 6;
parameter BITS_PER_CHAR = 10;    // Start bit, stop bit, and 8 character bits
parameter SOM = 8'hFF;          // define Start of Message character
parameter START = 1'b0;         // define Uart start bit
parameter STOP = 1'b1;          // define Uart stop bit
parameter CLKS_PER_BIT = 810;   // divide 93.333MHz to 115.2 KHz


// Uart bit counter
reg [9:0]uartClk;
wire uartBitBoundary = (uartClk == 0);
always @(posedge sysClk or posedge reset) begin
    if (reset) begin
        uartClk <= (CLKS_PER_BIT - 1);
        end
    else if (uartBitBoundary) begin
        uartClk <= (CLKS_PER_BIT - 1);
        end
    else begin
        uartClk <= uartClk - 1;
        end
    end

// Uart Character counter
reg [3:0]uartBitCounter;
wire uartCharBoundary = (uartBitCounter == 0);
always @(posedge sysClk or posedge reset) begin
    if (reset) begin
        uartBitCounter <= (BITS_PER_CHAR - 1);
        end
    else if (uartBitBoundary && uartCharBoundary) begin
        uartBitCounter <= (BITS_PER_CHAR - 1);
        end
    else if (uartBitBoundary) begin
        uartBitCounter <= uartBitCounter - 1;
        end
    end

// Uart state machine
reg [9:0]shifter;
wire serialOut = shifter[0];    // uart data is LSB first
reg [2:0]uartState;
always @ (posedge sysClk or posedge reset) begin
    if (reset) begin
        shifter <= 0;
        uartState <= UART_IDLE;
        uartDataAvailable <= 1'b0;
        end
    else if (uartBitBoundary && uartCharBoundary) begin
        casex (uartState)
            UART_EXTLSB: begin
                uartDataAvailable <= 1'b0;
                shifter <= {STOP, 1'b0, uartExteriorHold[6:0], START};
                uartState <= UART_IDLE;
                end
            UART_EXTMSB: begin
                shifter <= {STOP, 5'b0, uartExteriorHold[9:7], START};
                uartState <= UART_EXTLSB;
                end
            UART_INTLSB: begin
                shifter <= {STOP, 1'b0, uartInteriorHold[6:0], START};
                uartState <= UART_EXTMSB;
                end
            UART_INTMSB: begin
                shifter <= {STOP, 5'b0, uartInteriorHold[9:7], START};
                uartState <= UART_INTLSB;
                end
            UART_STATUS: begin
            //    shifter <= {STOP, 6'b0, demodLock, bitSyncLock, START};
                shifter <= demodLock ? {STOP, 8'h16, START} : {STOP, 8'h00, START};
                        uartState <= UART_INTMSB;
                end
            UART_START: begin
                shifter <= {STOP, SOM, START};
                uartState <= UART_STATUS;
                end
            UART_IDLE: begin
                shifter <= 10'h3ff;
                if (uartDataStrobe) begin
                    uartDataAvailable <= 1'b1;
                    uartState <= UART_START;
                    end
                end
            default: begin
                shifter <= 10'b0000000000;
                uartState <= UART_IDLE;
                end
            endcase
        end
    else if (uartBitBoundary) begin
        shifter <= {1'b1, shifter[9:1]} ;               // shift out LSB first
        end
    end

endmodule

/*
`ifdef SIMULATE
`timescale 1 ns /10 ps

 module testBed;

//        defparam dualRail.CLKS_PER_BIT = 10;

        reg     symClk, clk, reset, demodLock, bitSyncLock;
        reg     [6:0]   iSymData, qSymData;
        reg     [7:0] threshold;
        wire    serialOut;
        wire [7:0]sigQualData;
        wire [7:0]interiorCountOut,exteriorCountOut;
        wire [7:0]meanI,meanQ;

       dualRail dualRail(symClk, reset, demodLock, bitSyncLock,
                threshold, iSymData, qSymData, clk, serialOut,
                interiorCountOut, exteriorCountOut,
                meanI,meanQ);

//        dualRail dualRail(symClk, reset, demodLock, bitSyncLock,
//                threshold, absI, absQ, clk, serialOut, sigQualData);

        always #25
                symClk = !symClk;       // 20MHz symbol clock

        always #11.11                                   // 45MHz clock
                clk = !clk;

        reg [1:0]dataState;
        always @(posedge symClk) begin
            case (dataState)
                0: begin
                    iSymData <= 63;
                    qSymData <= -63;
                    dataState <= 1;
                    end
                1: begin
                    iSymData <= 33;
                    qSymData <= 63;
                    dataState <= 2;
                    end
                2: begin
                    iSymData <= -33;
                    qSymData <= 33;
                    dataState <= 3;
                    end
                3: begin
                    iSymData <= -63;
                    qSymData <= -33;
                    dataState <= 0;
                    end
                endcase
            end

        initial begin
                symClk = 0; reset = 0; clk = 0; threshold = 10; iSymData = 50; qSymData = -50;
                demodLock = 1; bitSyncLock = 1;
                dataState <= 0;
                #100;
                reset = 1;
                #100;
                reset = 0;
                #(10*400000);
                $stop;

        end

endmodule
`endif
*/
