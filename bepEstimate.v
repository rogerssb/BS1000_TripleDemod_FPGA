`timescale 1ns/100ps
`include "addressMap.v"

//`define USE_SYMMETRIC_LUT
`define ADD_COMPLEX_DETECTOR

module bepEstimate(
  input                 clk,
  input                 reset,
  input                 wr0,wr1,wr2,wr3,
  input         [12:0]  addr,
  input         [31:0]  dataIn,
  output        [31:0]  dataOut,
  input                 symEn,
  input signed  [17:0]  symData,
  input signed  [17:0]  iData,  
  input signed  [17:0]  qData,  
  input                 sym2xEn,
  output        [16:0]  absValue
);

// Decode the two address spaces
reg bep_space;
always @* begin
  casex(addr)
    `BEPSPACE: bep_space = 1;
    default: bep_space = 0;
  endcase
end
wire bep_en = bep_space;

reg ram_space;
always @* begin
  casex(addr)
    `BEPRAMSPACE: ram_space = 1;
    default: ram_space = 0;
  endcase
end
wire ram_en = ram_space;

// Reclock the inputs to help with routing
reg     signed  [17:0]  bepData;
reg                     clkEn;
`ifdef ADD_COMPLEX_DETECTOR
reg                     useComplex;
reg     signed  [17:0]  iBepData,qBepData;
`endif
always @(posedge clk) begin
    `ifdef ADD_COMPLEX_DETECTOR
    clkEn <= useComplex ? sym2xEn : symEn;
    bepData <= symData;
    iBepData <= iData;
    qBepData <= qData;
    `else
    clkEn <= symEn;
    bepData <= symData;
    `endif
end

// Take the absolute value
reg         [16:0]  absSymData;
wire signed [17:0]  negSymData = -bepData;
always @(posedge clk) begin
  if (clkEn) begin
    if (bepData[17]) begin
      absSymData <= negSymData[16:0];
    end
    else begin
      absSymData <= bepData[16:0];
    end
  end
end

`ifdef ADD_COMPLEX_DETECTOR

wire    [15:0]  complexAbsValue;
complexMagEstimate complexAbs( 
    .clk(clk), 
    .reset(reset), 
    .clkEn(clkEn),
    .iIn(iBepData),.qIn(qBepData),
    .complexMag(complexAbsValue)
);
assign          absValue = useComplex ? {complexAbsValue,1'b0} : absSymData;

`else    //ADD_COMPLEX_DETECTOR

assign          absValue = absSymData;

`endif   //ADD_COMPLEX_DETECTOR



`ifdef SIMULATE
real mean;
always @* mean = $itor(absValue)/(2**17);
`endif

// Scale by the inverse of the mean
reg         [15:0]  inverseMantissa;
reg         [2:0]   inverseExponent;
wire        [35:0]  inverseProduct;
mpy18x18WithCe mantissaMpy(
    .clk(clk),
    .ce(clkEn),
    .a({1'b0,absValue}),
    .b({1'b0,inverseMantissa,1'b0}),
    .p(inverseProduct)
);
`ifdef USE_SYMMETRIC_LUT
// Saturate the output as we shift with the exponent
wire        [5:0]  llr;
unsignedShiftAndSaturate33to6 exponentShift(
    .clk(clk), 
    .clkEn(clkEn),
    .shift(inverseExponent),
    .dIn(inverseProduct[34:1]),
    .dOut(llr)
);
`else
// Saturate the output as we shift with the exponent
wire        [4:0]  llr;
unsignedShiftAndSaturate33to5 exponentShift(
    .clk(clk), 
    .clkEn(clkEn),
    .shift(inverseExponent),
    .dIn(inverseProduct[34:1]),
    .dOut(llr)
);
`endif

// LUT memories
wire [31:0]lut_out;
bepLut0to7 dpram_wr0 (
    `ifdef USE_SYMMETRIC_LUT
    .a(addr[7:2]),
    `else
    .a(addr[6:2]),
    `endif
    .d(dataIn[7:0]),
    .dpra(llr),
    .clk(wr0),
    .we(ram_en),
    .qdpo_ce(clkEn),
    .qdpo_clk(clk),
    .qspo(),
    .qdpo(lut_out[7:0])
);

bepLut8to15 dpram_wr1 (
    `ifdef USE_SYMMETRIC_LUT
    .a(addr[7:2]),
    `else
    .a(addr[6:2]),
    `endif
    .d(dataIn[15:8]),
    .dpra(llr),
    .clk(wr1),
    .we(ram_en),
    .qdpo_ce(clkEn),
    .qdpo_clk(clk),
    .qspo(),
    .qdpo(lut_out[15:8])
);

bepLut16to23 dpram_wr2 (
    `ifdef USE_SYMMETRIC_LUT
    .a(addr[7:2]),
    `else
    .a(addr[6:2]),
    `endif
    .d(dataIn[23:16]),
    .dpra(llr),
    .clk(wr2),
    .we(ram_en),
    .qdpo_ce(clkEn),
    .qdpo_clk(clk),
    .qspo(),
    .qdpo(lut_out[23:16])
);

bepLut24to31 dpram_wr3 (
    `ifdef USE_SYMMETRIC_LUT
    .a(addr[7:2]),
    `else
    .a(addr[6:2]),
    `endif
    .d(dataIn[31:24]),
    .dpra(llr),
    .clk(wr3),
    .we(ram_en),
    .qdpo_ce(clkEn),
    .qdpo_clk(clk),
    .qspo(),
  .qdpo(lut_out[31:24])
);

// Count out LUT reads into blocks
reg [7:0] block_size;
reg [15:0] count;
wire last_count =
  (block_size == 14) ? count[14] : (
  (block_size == 13) ? count[13] : (
  (block_size == 12) ? count[12] : (
  (block_size == 11) ? count[11] : (
  (block_size == 10) ? count[10] : (
  (block_size == 9) ? count[9] : (
  (block_size == 8) ? count[8] : (
  (block_size == 7) ? count[7] : (1'b0))))))));

always @(posedge clk) begin
  if (clkEn) begin
    if (last_count) begin
      count <= 16'd1;
    end
    else begin
      count <= count + 16'd1;
    end
  end
end

// Sum the LUT data
reg [45:0] sum;
always @(posedge clk) begin
  if (clkEn) begin
    if (last_count) begin
      sum <= lut_out;
    end
    else begin
      sum <= sum + lut_out;
    end
  end
end

// Latch the sum
reg [45:7] buffer;
always @(posedge clk) begin
  if (clkEn) begin
    if (last_count) begin
      buffer <= sum[45:7];
    end
  end
end

// Scale the sum
wire [31:0] estimate =
  block_size == 14 ? buffer[45:14] : (
  block_size == 13 ? buffer[44:13] : (
  block_size == 12 ? buffer[43:12] : (
  block_size == 11 ? buffer[42:11] : (
  block_size == 10 ? buffer[41:10] : (
  block_size == 9 ? buffer[40:9] : (
  block_size == 8 ? buffer[39:8] : (
  block_size == 7 ? buffer[38:7] : (32'd0))))))));

// Processor registers
always @(negedge wr0) begin
  if (bep_en) begin
    casex (addr)
      `BEP_BLOCK_SIZE: begin
        block_size[7:0] <= dataIn[7:0];
      end
      `BEP_MEAN_INVERSE: begin
        inverseMantissa[7:0] <= dataIn[7:0];
      end
      default: ;
    endcase
  end
end

always @(negedge wr1) begin
  if (bep_en) begin
    casex (addr)
      `BEP_MEAN_INVERSE: begin
        inverseMantissa[15:8] <= dataIn[15:8];
      end
      default: ;
    endcase
  end
end

always @(negedge wr2) begin
  if (bep_en) begin
    casex (addr)
      `BEP_MEAN_INVERSE: begin
        inverseExponent <= dataIn[18:16];
      end
      default: ;
    endcase
  end
end

always @(negedge wr3) begin
  if (bep_en) begin
    casex (addr)
      `BEP_BLOCK_SIZE: begin
        useComplex <= dataIn[31];
      end
      default: ;
    endcase
  end
end


reg [31:0] read_mux;
always @* begin
  if (bep_en) begin
    casex (addr)
      `BEP_BLOCK_SIZE: begin
        `ifdef ADD_COMPLEX_DETECTOR
        read_mux = {useComplex,23'b0, block_size};
        `else
        read_mux = {24'b0, block_size};
        `endif
      end
      `BEP_ESTIMATE: begin
        read_mux = estimate;
      end
      `BEP_MEAN_INVERSE: begin
        read_mux = {13'b0,inverseExponent,inverseMantissa};
      end
      default: begin
        read_mux = 32'b0;
      end
    endcase
  end
  else begin
    read_mux = 32'b0;
  end
end

assign dataOut = read_mux;

endmodule