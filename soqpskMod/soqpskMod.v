`timescale 1ns / 10 ps

module soqpskMod
  ( 
    clk, reset,
    cs,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    modData,
    modClkIn,
    modClkOut,
    modDataValid,
    soqpskModFreq,
    modSampleEn                  
    );

input clk;
input reset;
input cs;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;
input modData;
input modClkIn;
output modClkOut;
input modDataValid;
//input txSelect;
//input [1:0]fskMode;
output [31:0]soqpskModFreq;
output modSampleEn;
   
// Register interface
wire [31:0]carrierFreq;
wire [17:0]deviation;
wire [15:0]bitrateDiv;
wire [4:0]cicShift;
soqpskModRegs soqpskModRegs  (
    .cs(cs),
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .carrierFreq(carrierFreq),
    .deviation(deviation),
    .bitrateDiv(bitrateDiv),
    .modClkSel(modClkSel),
    .cicShift(cicShift)
    );

// Generate internal bitrate clock
reg modClkOut;
reg modSampleEn;
reg [15:0]bitrateCount;
always @(posedge clk) begin
    if (reset) begin
        bitrateCount <= bitrateDiv;
        modClkOut <= 0;
        end
    else if (bitrateCount == 0) begin
        bitrateCount <= bitrateDiv;
        modClkOut <= ~modClkOut;
        modSampleEn <= 1;
        end
    else begin
        modSampleEn <= 0;
        bitrateCount <= bitrateCount - 1;
        end
    end


   reg             evenOdd;
   always @(posedge clk) begin
      if (reset) begin
         evenOdd <= 1;
      end
      else if (modSampleEn) begin
         if (modClkOut) begin
            evenOdd <= !evenOdd;
         end
      end
   end  



   
//`define BILLY_PRECODER
`ifdef BILLY_PRECODER 
   // Differential encoder from Billys Matlab sim
   // d[n] = a[n] xor d[n-2]
   reg     [1:0]   binSR;
   always @(posedge clk) begin
      if (reset) begin
         binSR <= 2'b01;
      end
      else if (modSampleEn) begin
         if (modClkOut) begin
            binSR <= {binSR[0], diffEncValue};
         end
      end
   end  
   wire diffEncValue = modDataLatch ^ binSR[1];
`endif

   // Do the IRIG standard differential encoding for SOQPSK-TG
   // I[2n]   = a[2n] xor not(Q[2n-1])
   // Q[2n+1] = a[2n+1] xor I[2n]
   //reg  diffEncValueTG;
   reg  modDataLatch;
   reg  diffEncValueTG_1d;
   always @(posedge clk) begin
      if (reset) begin
         modDataLatch <= 0;
         diffEncValueTG_1d <= 0;
      end
      else if (modSampleEn) begin
         if (modClkOut) begin
            modDataLatch <= modData;
            diffEncValueTG_1d <= diffEncValueTG;
         end
      end
   end  

   wire diffEncValueTG = !evenOdd ?  modDataLatch ^ diffEncValueTG_1d : modDataLatch ^ !diffEncValueTG_1d;
   
   
// Do the dibit to ternary encoding
reg     [2:0]   bitSR;
reg     [2:0]   modValue;
   always @(posedge clk) begin
      if (reset) begin
         bitSR <= 3'b0;
      end
      else if (modSampleEn) begin
         if (modClkOut) begin
`ifdef BILLY_PRECODER 
            bitSR <= {bitSR[1:0],diffEncValue};
`else // SOQPK-TG
            bitSR <= {bitSR[1:0], diffEncValueTG};
`endif
         end
         if (modClkOut) begin
            case (bitSR)
              3'b001: begin
                 if (evenOdd) begin
                    modValue <= 3'b010;
                 end
                 else begin
                    modValue <= 3'b110;
                 end
              end
              3'b011: begin
                 if (evenOdd) begin
                    modValue <= 3'b110;
                 end
                 else begin
                    modValue <= 3'b010;
                 end
              end
              3'b100: begin
                 if (evenOdd) begin
                    modValue <= 3'b110;
                 end
                 else begin
                    modValue <= 3'b010;
                 end
              end
              3'b110: begin
                 if (evenOdd) begin
                    modValue <= 3'b010;
                 end
                 else begin
                    modValue <= 3'b110;
                 end
              end
              default begin // all other cases output zero
                 modValue <= 3'b000;
              end
            endcase
          end
         else begin
            //modValue <= 3'b000;
         end
      end
   end
   

   reg [2:0] firIn;
   always @(posedge clk) begin
      if (reset) begin
         firIn <= 3'b0;
      end
      else if (modSampleEn) begin
         if (modClkOut) begin
            firIn <=modValue;
         end
         else begin
            firIn <= 1'b0;
         end
      end
   end
   
            

   
// Run the samples through the shaping filter
wire [16:0]shapingFirOut;
soqpskFir soqpskFir(
    .clk(clk), 
    .nd(modSampleEn),
    .rfd(),
    .rdy(shapedReady),
    //.din(modValue),
    .din(firIn),
    .dout(shapingFirOut)
    );
   
	
`ifdef SIMULATE
real shapedReal;
always @(shapingFirOut) shapedReal = $itor($signed(shapingFirOut))/(2**13);
//always @(shapingFirOut) shapedReal = ((shapingFirOut > 131071.0) ? (shapingFirOut - 262144.0) : shapingFirOut)/131072.0;
`endif

// CIC Interpolation Filter
wire [33:0]cicOut;
cicInterpolate cicInterpolate(
    .clk(clk), .reset(reset), .clkEn(shapedReady),
    .dIn({shapingFirOut[11:0],6'b0}), 
    .dOut(cicOut)
    );
wire [17:0]devInput;
shift34to18 cicGainAdjust(
    .clk(clk), .clkEn(1'b1),
    .shift(cicShift),
    .dIn(cicOut),
    .dOut(devInput)
    );

`ifdef SIMULATE
real interpReal;
always @(devInput) interpReal = (devInput[17] ? (devInput - 262144.0) : devInput)/131072.0;
`endif

wire [35:0]devValue;
mpy18x18 devScaler (
    .sclr(1'b0),
    .clk(clk),
    .a(devInput),
    .b(deviation),
    .p(devValue)
    );
wire [31:0]modFreq = devValue[34:3];

assign soqpskModFreq = modFreq + carrierFreq;

endmodule
