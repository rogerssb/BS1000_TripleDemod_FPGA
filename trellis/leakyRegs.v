`timescale 1ns/10ps

`include ".\addressMap.v"

module leakyRegs(
    addr,
    dataIn,
    dataOut,
    cs,
    wr0, wr1, wr2, wr3,
    enableLoop,
    alpha, oneMinusAlpha,
    deviation
    );

input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   cs;
input   wr0,wr1,wr2,wr3;

output          enableLoop;
reg             enableLoop;

output  [17:0]  alpha;
reg     [17:0]  alpha;

output  [17:0]  oneMinusAlpha;
reg     [17:0]  oneMinusAlpha;

output  [31:0]  deviation;
reg     [31:0]  deviation;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `LEAKY_CONTROL: enableLoop <= dataIn[0];
            `LEAKY_ALPHA: begin
                alpha[7:0] <= dataIn[7:0];
                end
            `LEAKY_ONE: begin
                oneMinusAlpha[7:0] <= dataIn[7:0];
                end
            `LEAKY_DEV: begin
                deviation[7:0] <= dataIn[7:0];
                end
            default: ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `LEAKY_ALPHA: begin
                alpha[15:8] <= dataIn[15:8];
                end
            `LEAKY_ONE: begin
                oneMinusAlpha[15:8] <= dataIn[15:8];
                end
            `LEAKY_DEV: begin
                deviation[15:8] <= dataIn[15:8];
                end
            default:  ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `LEAKY_ALPHA: begin
                alpha[17:16] <= dataIn[17:16];
                end
            `LEAKY_ONE: begin
                oneMinusAlpha[17:16] <= dataIn[17:16];
                end
            `LEAKY_DEV: begin
                deviation[23:16] <= dataIn[23:16];
                end
            default:  ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
            `LEAKY_DEV: begin
                deviation[31:24] <= dataIn[31:24];
                end
            default:  ;
            endcase
        end
    end

reg [31:0]dataOut;
always @(addr or cs or
         enableLoop or
         alpha or oneMinusAlpha or
         deviation
         ) begin
    if (cs) begin
        casex (addr)
            `LEAKY_CONTROL: dataOut <= {31'h0,enableLoop};
            `LEAKY_ALPHA:   dataOut <= {14'h0,alpha};
            `LEAKY_ONE:     dataOut <= {14'h0,oneMinusAlpha};
            `LEAKY_DEV:     dataOut <= deviation;
            default:        dataOut <= 32'hx;
            endcase
        end
    else begin
        dataOut <= 32'hx;
        end
    end



endmodule
