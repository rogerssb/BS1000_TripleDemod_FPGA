`timescale 1ns/100ps
module test ;

reg clk; initial clk = 0 ;
reg clkEn; initial clkEn = 0 ;
always #5 clk = !clk ;

reg [1:0]cnt; initial cnt = 0 ;
always @ (posedge clk) begin
    cnt <= cnt - 1 ;
    clkEn <= cnt == 2'b0 ;
    end

reg init,reset ;
initial begin
    #1000 init = 1 ;
    #1000 init = 0 ;
    end

always @ (posedge clk) begin
    if (init) begin
        reset <= 1 ;
        end
    else if (clkEn) begin
        reset <= 0 ;
        end
    end

parameter pipeDelay = 5 ;
reg [2:0]updateCount ;
always @(posedge clk) begin
    if (reset) begin
        updateCount <= pipeDelay -1;
        end
    else if (clkEn) begin
        if (updateCount == 3'h0) begin
            updateCount <= pipeDelay -1 ;
            end
        else begin
            updateCount <= updateCount - 3'h1 ;
            end
        end
    end

reg wtUpdate ;
always @ (posedge clk) begin
	  if (reset) wtUpdate <= 0 ;
	  else if (clkEn) begin
        wtUpdate <= updateCount == 3'b0 ;
        end
    end

// Random data
parameter PN17 = 16'h008e,
          MASK17 = 16'h00ff;
reg [15:0]sr;
reg [4:0]zeroCount;
reg  randData;


reg [3:0] modClkCnt ;
reg modClkEn;
always @ (posedge clk) begin
    if (reset) begin
        modClkCnt <= 0 ;
        modClkEn <= 0 ;
        end
    else begin
        if (modClkCnt == 8) begin
            modClkCnt <= 0 ;
            end
        else begin
            modClkCnt <= modClkCnt +1 ;
            end
        end
        modClkEn <= modClkCnt == 0 ;
    end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        zeroCount <= 5'b0;
        sr <= MASK17;
//        modClkEn <= 0;
        randData <= 0;
        end
//    else if (clkEn) begin
//        modClkEn <= ~modClkEn;
        if (modClkEn) begin
            if (sr[0] | (zeroCount == 5'b11111))
                begin
                zeroCount <= 5'h0;
                sr <= {1'b0, sr[15:1]} ^ PN17;
                end
            else
                begin
                zeroCount <= zeroCount + 5'h1;
                sr <= sr >> 1;
                end
            randData <= sr[0];
            end
//        end
    end

wire txSelect = randData;

wire  [17:0]iDds,qDds ;
dds dds(
    .clk(clk),
    .reset(reset),
    .txSelect(txSelect),
    .rxFreq(32'h08000000),
    .txFreq(32'hf8000000),
    .iDds(iDds),
    .qDds(qDds));

parameter SCALE = 2 ;
wire [17:0]iScale = {{SCALE{iDds[17]}},iDds[17:SCALE]} ;
wire [17:0]qScale = {{SCALE{qDds[17]}},qDds[17:SCALE]} ;

wire [17:0]iIn,qIn;
channelModel channelModel(
    .clk(clk),
    .iTx(iScale),
    .qTx(qScale),
    .iCh(iIn),
    .qCh(qIn),
    .reset(reset)
    );

wire [17:0]gates_iOut,gates_qOut ;
cma gates(
    clk,
    clkEn,
    reset,
    3'h1,
    16'h2000,
    iIn,qIn,
    gates_iOut,gates_qOut,
    1'b0, //bypass
    1'b0 //wtReset
    ) ;

wire [17:0]floats_iOut,floats_qOut ;
cmaEqualizer floats(
    clk,
    clkEn,
    reset,
    3'h1,
    18'h02000,
    iIn,qIn,
    floats_iOut,floats_qOut,
    gates.wtUpdate
    );

real real_iIn = 0.0 ; always @* real_iIn = $itor($signed(iIn)) / (2**17) ;
real real_qIn = 0.0 ; always @* real_qIn = $itor($signed(qIn)) / (2**17) ;
real real_inMag = 0.0 ; always @* real_inMag = real_iIn*real_iIn + real_qIn*real_qIn ;

real real_iScale = 0.0 ; always @* real_iScale = $itor($signed(iScale)) / (2**17) ;
real real_qScale = 0.0 ; always @* real_qScale = $itor($signed(qScale)) / (2**17) ;
real real_chInMag = 0.0 ; always @* real_chInMag = real_iScale*real_iScale + real_qScale*real_qScale ;

endmodule //cma_test
