`timescale 1ns/100ps
`include "addressMap.v"

module sdi(
    clk,
    reset,
    wr0,wr1,wr2,wr3,
    addr,
    dataIn,
    dataOut,
    iSymEn,
    iSymData,
    qSymEn,
    qSymData,
    eyeSync,
    iEye,qEye,
    eyeOffset,
    bitsyncLock, demodLock,
    `ifdef ADD_DESPREADER
    iEpoch, qEpoch,
    `endif
    sdiOut
    );

input           clk;
input           reset;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  dataIn;
output  [31:0]  dataOut;
input           iSymEn;
input   [17:0]  iSymData;
input           qSymEn;
input   [17:0]  qSymData;
input           eyeSync;
input   [17:0]  iEye,qEye;
input   [4:0]   eyeOffset;
input           bitsyncLock, demodLock;
`ifdef ADD_DESPREADER
input           iEpoch, qEpoch;
`endif
output          sdiOut;


reg sdiSpace;
always @* begin
  casex(addr)
    `SDISPACE:      sdiSpace = 1;
    default:        sdiSpace = 0;
  endcase
end

wire            fifoFull;
reg             sdiEnable;
reg     [2:0]   sdiMode;
reg     [7:0]   artmThreshold;
wire            sdiEnableReset = (fifoFull || reset);
always @(negedge wr0 or posedge sdiEnableReset) begin
    if (sdiEnableReset) begin
        sdiEnable <= 0;
        end
    else if (sdiSpace) begin
        casex (addr) 
            `SDI_CONTROL: begin
                sdiEnable <= dataIn[7];
                sdiMode <= dataIn[2:0];
                end     
            `SDI_ARTM_THRESHOLD: begin
                artmThreshold[7:0] <= dataIn[7:0];
                end
            endcase
        end
    end

wire            fifoEmpty;
wire    [10:0]  interiorCountOut;
wire    [10:0]  exteriorCountOut;
reg             holdCount;
reg     [31:0]  sdiDout;
always @* begin
    casex(addr)
        `SDI_CONTROL:           begin
                                sdiDout = {fifoEmpty,28'b0,sdiMode};
                                holdCount = 0;
                                end
        `SDI_ARTM_THRESHOLD:    begin
                                sdiDout = {24'b0,artmThreshold};
                                holdCount = 0;
                                end
        `SDI_ARTM_COUNTS:       begin
                                sdiDout = {5'b0,exteriorCountOut,5'b0,interiorCountOut};
                                holdCount = sdiSpace;
                                end
        default:                begin
                                sdiDout = 32'hx;
                                holdCount = 0;
                                end
        endcase
    end


//*****************************************************************************
//                        Eye and Constellation Modes
//*****************************************************************************

reg     fifoEn0,fifoEn;
always @(posedge clk or posedge fifoFull) begin
    if (fifoFull) begin
        fifoEn0 <= 0;
        fifoEn <= 0;
        end
    else begin
        fifoEn0 <= sdiEnable;
        fifoEn <= fifoEn0;
        end
    end

// Eye diagram data acquisition state machine
parameter EYE_IDLE =    2'b00,
          EYE_WAIT =    2'b01;
reg     [1:0]   eyeState;
reg             eyeEn;
always @(posedge clk) begin
    if (reset) begin
        eyeState <= EYE_IDLE;
        eyeEn <= 0;
        end
    else if (eyeSync) begin
        case (eyeState)
            EYE_IDLE: begin
                if (fifoEn && iSymEn) begin
                    eyeEn <= 1;
                    eyeState <= EYE_WAIT;
                    end
                end
            EYE_WAIT: begin
                if (!fifoEn) begin
                    eyeState <= EYE_IDLE;
                    eyeEn <= 0;
                    end
                end
            default: begin
                eyeState <= EYE_IDLE;
                eyeEn <= 0;
                end
            endcase
        end
    end



wire    [15:0]  iSym;
reg             fifoReadEn;
reg             fifoReset;
reg     [15:0]  iIn,qIn;
reg             wrEn;
always @(posedge clk) begin
    if (sdiMode == `SDI_MODE_CONSTELLATION) begin
        iIn <= iSymData[17:2];
        qIn <= qSymData[17:2];
        wrEn <= iSymEn;
    end
    else begin
        iIn <= iEye[17:2];
        qIn <= qEye[17:2];
        wrEn <= (eyeEn && eyeSync);
    end
end

dataFifo iFifo (
    .srst(fifoReset), 
    .rd_en(fifoReadEn), 
    .wr_en(wrEn && fifoEn), 
    .full(fifoFull), 
    .empty(fifoEmpty), 
    .clk(clk), 
    .dout(iSym), 
    .din(iIn)
    );
wire    [15:0]  qSym;
dataFifo qFifo (
    .srst(fifoReset), 
    .rd_en(fifoReadEn), 
    .wr_en(wrEn && fifoEn), 
    .full(), 
    .empty(), 
    .clk(clk), 
    .dout(qSym), 
    .din(qIn)
    );

// UART Data Mux
parameter MUX_IDLE =        4'b0000,
          MUX_CMSB =        4'b0001,
          MUX_CMSB_WAIT =   4'b0011,
          MUX_CLSB =        4'b0010,
          MUX_CLSB_WAIT =   4'b0110,
          MUX_IMSB =        4'b0111,
          MUX_IMSB_WAIT =   4'b0101,    
          MUX_ILSB =        4'b0100,
          MUX_ILSB_WAIT =   4'b1100,
          MUX_QMSB =        4'b1101,
          MUX_QMSB_WAIT =   4'b1111,
          MUX_QLSB =        4'b1110,
          MUX_QLSB_WAIT =   4'b1010;
reg     [3:0]   muxState;
reg             uartDataAvailable;
wire            uartDataNeeded;
reg     [7:0]   uartData;
reg     [15:0]  uartCount;
always @(posedge clk) begin
    if (reset) begin
        muxState <= MUX_IDLE;
        uartDataAvailable <= 0;
        fifoReadEn <= 0;
        fifoReset <= 1;
        uartCount <= 0;
        end
    else begin
        case (muxState) 
            MUX_IDLE: begin
                fifoReset <= 0;
                if (!fifoEn && !fifoEmpty && uartDataNeeded) begin
                    muxState <= MUX_CMSB;
                    uartDataAvailable <= 1;
                    uartData <= uartCount[15:8];
                    end
                end
            MUX_CMSB: begin
                if (!uartDataNeeded) begin
                    muxState <= MUX_CMSB_WAIT;
                    end
                end
            MUX_CMSB_WAIT: begin
                if (uartDataNeeded) begin
                    muxState <= MUX_CLSB;
                    uartData <= uartCount[7:0];
                    uartCount <= uartCount + 1;
                    end
                end
            MUX_CLSB: begin
                if (!uartDataNeeded) begin
                    muxState <= MUX_CLSB_WAIT;
                    end
                end
            MUX_CLSB_WAIT: begin
                if (uartDataNeeded) begin
                    muxState <= MUX_IMSB;
                    uartData <= iSym[15:8];
                    end
                end
            MUX_IMSB: begin
                if (!uartDataNeeded) begin
                    muxState <= MUX_IMSB_WAIT;
                    end
                end
            MUX_IMSB_WAIT: begin
                if (uartDataNeeded) begin
                    muxState <= MUX_ILSB;
                    uartData <= iSym[7:0];
                    end
                end
            MUX_ILSB: begin
                if (!uartDataNeeded) begin
                    muxState <= MUX_ILSB_WAIT;
                    end
                end
            MUX_ILSB_WAIT: begin
                if (uartDataNeeded) begin
                    muxState <= MUX_QMSB;
                    uartData <= qSym[15:8];
                    end
                end
            MUX_QMSB: begin
                if (!uartDataNeeded) begin
                    muxState <= MUX_QMSB_WAIT;
                    end
                end
            MUX_QMSB_WAIT: begin
                if (uartDataNeeded) begin
                    muxState <= MUX_QLSB;
                    uartData <= qSym[7:0];
                    fifoReadEn <= 1;
                    end
                end
            MUX_QLSB: begin
                fifoReadEn <= 0;
                if (!uartDataNeeded) begin
                    muxState <= MUX_QLSB_WAIT;
                    end
                end
            MUX_QLSB_WAIT: begin
                if (fifoEmpty) begin
                    muxState <= MUX_IDLE;
                    uartDataAvailable <= 0;
                    fifoReset <= 1;
                    uartCount <= 0;
                    end
                else if (!fifoEmpty && uartDataNeeded) begin
                    muxState <= MUX_CMSB;
                    uartData <= uartCount[15:8];
                    end
                end
            default: begin
                muxState <= MUX_IDLE;
                uartDataAvailable <= 0;
                fifoReadEn <= 0;
                uartCount <= 0;
                end
            endcase
        end
    end

wire    [15:0]  baudDiv;
wire    [31:0]  uartDout;
uartRegs uartRegs(
    .addr(addr),
    .dataIn(dataIn),
    .dataOut(uartDout),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .baudDiv(baudDiv)
    );

uartBaudGen uartbg(
    .clk(clk),
    .reset(reset),
    .baudDiv(baudDiv),
    .baudEn(baudEn)
    );

uartTx uartTx(
    .clk(clk),
    .reset(reset),
    .baudEn(baudEn),
    .data(uartData),
    .dataAvailable(uartDataAvailable),
    .dataNeeded(uartDataNeeded),
    .uartOutput(uartOut)
    );


//*****************************************************************************
//                               ARTM Mode
//*****************************************************************************
artmSignalQuality artm(
    .sysClk(clk),
    .reset(reset),
    .hold(holdCount),
    .demodLock(demodLock),
    .bitSyncLock(bitsyncLock),
    .symEnable(iSymEn),
    .iSymData(iSymData), .qSymData(qSymData),
    .threshold(artmThreshold),
    .interiorCountOut(interiorCountOut),
    .exteriorCountOut(exteriorCountOut),
    .serialOut(artmOut)
    );

//*****************************************************************************
//                              Module Outputs
//*****************************************************************************

`ifdef ADD_DESPREADER
reg sdiOut;
always @* begin
    casex (sdiMode)
        `SDI_MODE_ARTM:     sdiOut = artmOut;
        `SDI_MODE_IEPOCH:   sdiOut = iEpoch;
        `SDI_MODE_QEPOCH:   sdiOut = qEpoch;
        default:            sdiOut = uartOut;
    endcase
end
`else
assign sdiOut = (sdiMode == `SDI_MODE_ARTM) ? artmOut : uartOut ;
`endif

reg     [31:0]  dataOut;
always @* begin
    casex(addr)
        `SDISPACE:      dataOut = sdiDout;
        `UARTSPACE:     dataOut = uartDout;
        default:        dataOut = 32'hx;
        endcase
    end

endmodule
