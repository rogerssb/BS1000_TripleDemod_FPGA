`timescale 1ns/100ps
`include "addressMap.v"


module uartRegs(
    addr,
    dataIn,
    dataOut,
    wr0, wr1, wr2, wr3,
    baudDiv
    );

input   [12:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   wr0,wr1,wr2,wr3;

output  [15:0]  baudDiv;
reg     [15:0]  baudDiv;

    
reg uartSpace;
always @* begin
  casex(addr)
    `UARTSPACE: uartSpace = 1;
    default:    uartSpace = 0;
  endcase
end


always @(negedge wr0) begin
    if (uartSpace) begin
        casex (addr) 
            `UART_BAUD_DIV: baudDiv[7:0] = dataIn[7:0];
            endcase
        end
    end

always @(negedge wr1) begin
    if (uartSpace) begin
        casex (addr) 
            `UART_BAUD_DIV: baudDiv[15:8] = dataIn[15:8];
            endcase
        end
    end

reg [31:0]dataOut;
always @* begin
    if (uartSpace) begin
        casex (addr)
            `UART_BAUD_DIV:     dataOut = {16'b0,baudDiv};
            default:            dataOut = 32'h0;
            endcase
        end
    else begin
        dataOut = 32'hx;
        end
    end
endmodule


module uartBaudGen(
    clk,
    reset,
    baudDiv,
    baudEn
    );
input           clk;
input           reset;
input   [15:0]  baudDiv;
output          baudEn;

reg     [15:0]  baudCount;
reg             baudEn;
always @(posedge clk) begin
    if (reset) begin
        baudCount <= baudDiv;
        baudEn <= 0;
        end
    else begin
        if (baudCount == 0) begin
            baudCount <= baudDiv;
            baudEn <= 1;
            end
        else begin
            baudCount <= baudCount - 1;
            baudEn <= 0;
            end
        end
    end
endmodule


module uartTx(
    clk,
    reset,
    baudEn,
    data,
    dataAvailable,
    dataNeeded,
    uartOutput
    );

input           clk;
input           reset;
input           baudEn;
input   [7:0]   data;
input           dataAvailable;
output          dataNeeded;
output          uartOutput;

parameter   UARTTX_IDLE =   3'b000,
            UARTTX_START =  3'b001,
            UARTTX_DATA =   3'b011,
            UARTTX_STOP =   3'b010;
reg     [2:0]   txState;
reg     [7:0]   txSR;
reg     [2:0]   txBitcount;
reg             dataNeeded;
reg             uartOutput;
always @(posedge clk) begin
    if (reset) begin
        txState <= UARTTX_IDLE;
        dataNeeded <= 1;
        uartOutput <= 1;
        end
    else if (baudEn) begin
        case (txState) 
            UARTTX_IDLE: begin
                if (dataAvailable) begin
                    txState <= UARTTX_START;
                    txSR <= data;
                    txBitcount <= 7;
                    dataNeeded <= 0;
                    uartOutput <= 0;
                    end
                end
            UARTTX_START: begin
                txState <= UARTTX_DATA;
                uartOutput <= txSR[0];
                txSR <= {1'b0,txSR[7:1]};
                end
            UARTTX_DATA: begin
                if (txBitcount == 0) begin
                    txState <= UARTTX_STOP;
                    uartOutput <= 1;
                    dataNeeded <= 1;
                    end
                else begin
                    uartOutput <= txSR[0];
                    txSR <= {1'b0,txSR[7:1]};
                    txBitcount <= txBitcount - 1;
                    end
                end
            UARTTX_STOP: begin
                if (dataAvailable) begin
                    txState <= UARTTX_START;
                    txSR <= data;
                    txBitcount <= 7;
                    dataNeeded <= 0;
                    uartOutput <= 0;
                    end
                else begin
                    txState <= UARTTX_IDLE;
                    uartOutput <= 1;
                    end
                end
            default: begin
                txState <= UARTTX_IDLE;
                dataNeeded <= 1;
                end
            endcase
        end
    end
endmodule
