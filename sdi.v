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
    sdiOut
    );

input           clk;
input           reset;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  dataIn;
output  [31:0]  dataOut;
input           iSymEn;
input   [17:0]  iSymData;
input           qSymEn;
input   [17:0]  qSymData;
output          sdiOut;


reg sdiSpace;
always @(addr) begin
  casex(addr)
    `SDISPACE:      sdiSpace <= 1;
    default:        sdiSpace <= 0;
  endcase
end

wire    fifoDone;
reg     sdiEnable;
wire    sdiEnableReset = (fifoDone || reset);
always @(negedge wr0 or posedge sdiEnableReset) begin
    if (sdiEnableReset) begin
        sdiEnable <= 0;
        end
    else if (sdiSpace) begin
        casex (addr) 
            `SDI_CONTROL:       sdiEnable <= 1;
            endcase
        end
    end
wire    fifoEmpty;
reg     [31:0]  sdiDout;
always @(addr or
         fifoEmpty) begin
    casex(addr)
        `SDI_CONTROL:           sdiDout <= {31'b0,fifoEmpty};
        default:                sdiDout <= 32'hx;
        endcase
    end

reg     fifoEn0,fifoEn;
always @(posedge clk or posedge fifoDone) begin
    if (fifoDone) begin
        fifoEn0 <= 0;
        fifoEn <= 0;
        end
    else begin
        fifoEn0 <= sdiEnable;
        fifoEn <= fifoEn0;
        end
    end

wire    [15:0]  iSym;
reg             fifoReadEn;
dataFifo iFifo (
    .srst(reset), 
    .rd_en(fifoReadEn), 
    .wr_en(iSymEn && fifoEn), 
    .full(fifoDone), 
    .empty(fifoEmpty), 
    .clk(clk), 
    .dout(iSym), 
    .din(iSymData[17:2])
    );
wire    [15:0]  qSym;
dataFifo qFifo (
    .srst(reset), 
    .rd_en(fifoReadEn), 
    .wr_en(qSymEn && fifoEn), 
    .full(), 
    .empty(), 
    .clk(clk), 
    .dout(qSym), 
    .din(qSymData[17:2])
    );

// UART Data Mux
parameter MUX_IDLE =        4'b0000,
          MUX_IMSB =        4'b0001,
          MUX_IMSB_WAIT =   4'b0011,    
          MUX_ILSB =        4'b0010,
          MUX_ILSB_WAIT =   4'b0110,
          MUX_QMSB =        4'b0111,
          MUX_QMSB_WAIT =   4'b0101,
          MUX_QLSB =        4'b0100,
          MUX_QLSB_WAIT =   4'b1100;
reg     [3:0]   muxState;
reg             uartDataAvailable;
wire            uartDataNeeded;
reg     [7:0]   uartData;
always @(posedge clk) begin
    if (reset) begin
        muxState <= MUX_IDLE;
        uartDataAvailable <= 0;
        fifoReadEn <= 0;
        end
    else begin
        case (muxState) 
            MUX_IDLE: begin
                if (!fifoEn && !fifoEmpty && uartDataNeeded) begin
                    muxState <= MUX_IMSB;
                    uartDataAvailable <= 1;
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
                    end
                else if (!fifoEmpty && uartDataNeeded) begin
                    muxState <= MUX_IMSB;
                    uartData <= iSym[15:8];
                    end
                end
            default: begin
                muxState <= MUX_IDLE;
                uartDataAvailable <= 0;
                fifoReadEn <= 0;
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
    .uartOutput(sdiOut)
    );


reg     [31:0]  dataOut;
always @(addr or sdiDout or uartDout) begin
    casex(addr)
        `SDISPACE:      dataOut <= sdiDout;
        `UARTSPACE:     dataOut <= uartDout;
        default:        dataOut <= 32'hx;
        endcase
    end

endmodule
