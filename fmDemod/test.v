`include "../addressMap.v"
`timescale 1ns/100ps

module test;

reg reset,clk,we0,we1,we2,we3,rd;
reg sync;
reg [11:0]a;
reg [31:0]d;
wire [31:0]dout;

// Create the clocks
`define SAMPLE_PERIOD (C*1e-9)
parameter HC = 5;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;

/*
wire [17:0]modulation;
real modFreqReal = 100000*`SAMPLE_PERIOD*2147483648;
integer modFreqInt = modFreqReal;
wire [31:0]modFreq = modFreqInt;
nco modNco( .sclr(reset),
            .clk(clk),
            .we(1'b1),
            .data(modFreqInt),
            .sine(modulation)
            );
wire [31:0]carrierOffset = {modulation, 14'b0};
*/
`define CARRIER_FREQ    32'h00200000
wire [17:0]iFm;
wire [17:0]qFm;
nco carrier(.sclr(reset),     
            .clk(clk),        
            .we(1'b1),        
            .data(`CARRIER_FREQ),
            .sine(qFm),
            .cosine(iFm)
            );                


// Instantiate the chip
fmDemod fmDemod(.clk(clk), .reset(reset), .sync(1'b1),
                .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
                .addr(a),
                .din(d),
                .dout(dout),
                .iFm(iFm),.qFm(qFm)
                );

function [11:0] createAddress;
    input [11:0] addrA;
    input [11:0] addrB;
    
    integer i;
    reg [11:0]finalAddress;

    begin
    for (i = 0; i < 12; i = i+1) begin
        if (addrA[i] === 1'bx) begin
            finalAddress[i] = addrB[i];
            end
        else if (addrB[i] === 1'bx) begin
            finalAddress[i] = addrA[i];
            end
        else begin
            finalAddress[i] = addrA[i] | addrB[i];
            end
        end
    createAddress = finalAddress;
    end
endfunction


task write16;
  input [11:0]addr;
  input [15:0]data;
  begin

    a = addr;
    rd = 0;
    if (addr[1]) begin
        d[31:16] = data;
        #100 we2 = 1; we3 = 1;
        #100 we2 = 0; we3 = 0; 
        end
    else begin
        d[15:0] = data;
        #100 we0 = 1; we1 = 1;
        #100 we0 = 0; we1 = 0; 
        end
    #100  
    d = 32'hz;
    #200;
  end
endtask

task write32;
  input [11:0]addr;
  input [31:0]data;
  begin
    a = addr;
    d = data;
    rd = 0;
    #100 we0 = 1; we1 = 1; we2 = 1; we3 = 1;
    #100 we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
    #100
    d = 32'hz;
    #200;
  end
endtask

task read32;
  input [11:0]addr;
  begin
    a = addr;
    rd = 0;
    #100 rd = 1;
    #100 rd = 0;
    #200;
  end
endtask

initial begin
    reset = 0;
    sync = 1;
    clk = 0;
    rd = 0;
    we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
    d = 32'hz;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    // Init the FM register set
    write32(createAddress(`FMSPACE,`FM_CONTROL0), 
            ( (3)                // Discriminator Delay
            )
            );

    // Create a reset to clear the nco accumulator
    reset = 1;
    #(2*C) ;
    reset = 0;

    #(1024*C) ;
    $stop;

    end

endmodule

