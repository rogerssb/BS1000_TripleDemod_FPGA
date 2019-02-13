`timescale 1ns/10ps
`include "addressMap.v"

module spiBusInterface(
    input                   clk,
    input                   reset,
    input                   spiClk,
    input                   spiCS,
    input                   spiDataIn,
    output  reg             spiDataOut,
    output                  spiDataOE,
    output  reg             cs,
    output  reg             wr0,wr1,wr2,wr3,
    output  reg [12:0]      addr,
    output  reg [31:0]      dataIn,
    input       [31:0]      dataOut
);

    //--------------------------- SPI Interface -------------------------------
    /*
    This is based on a transaction protocol that abstracts CPU bus cycles. All
    transactions start with a 16-bit control word which contains read/write,
    data size, and register address information. Write operations continue with
    the data to be written. Read operations expect the slave (this FPGA) to
    respond with the requested data.
    */
    reg             [2:0]   spiState;
        `define SPI_IDLE        3'b000
        `define SPI_CTRL        3'b001
        `define SPI_WR16        3'b011
        `define SPI_WR32        3'b010
        `define SPI_RD16        3'b101
        `define SPI_RD32        3'b110
        `define SPI_FINISH      3'b111
    reg             [31:0]  spiSR;
    reg             [5:0]   spiBitcount;
    reg                     spiWrite;
    wire            [1:0]   spiXferSize = spiSR[13:12];
        `define SPI_SIZE_8      2'b00
        `define SPI_SIZE_16     2'b01
        `define SPI_SIZE_32     2'b11
    wire                    spiAddr1 = spiSR[0];
    assign                  spiDataOE = !spiWrite && (spiState != `SPI_IDLE);
    always @(posedge spiClk or negedge spiCS) begin
        if (!spiCS) begin
            cs <= 0;
            addr <= 0;
            wr0 <= 0;
            wr1 <= 0;
            wr2 <= 0;
            wr3 <= 0;
            spiWrite <= 0;
            spiSR <= 0;
            spiBitcount <= 15;
            spiState <= `SPI_IDLE;
        end
        else begin
            case (spiState)
                `SPI_IDLE: begin
                    spiSR <= {spiSR[30:0],spiDataIn};
                    spiBitcount <= spiBitcount - 1;
                    spiWrite <= spiDataIn;
                    spiState <= `SPI_CTRL;
                end
                `SPI_CTRL: begin
                    if (spiBitcount == 2) begin
                        // A read doesn't need the two LSBs of the address
                        // We take advantage of that by starting the
                        // read cycle two clocks early so the data is
                        // available to load in the SR.
                        if (!spiWrite) begin
                            cs <= 1;
                            wr0 <= 0;
                            wr1 <= 0;
                            wr2 <= 0;
                            wr3 <= 0;
                            addr <= {spiSR[9:0],spiDataIn,2'b00};
                        end
                        spiBitcount <= spiBitcount - 1;
                        spiSR <= {spiSR[30:0],spiDataIn};
                    end
                    else if (spiBitcount == 0) begin
                        if (spiWrite) begin
                            addr <= {spiSR[11:0],spiDataIn};
                            case (spiXferSize)
                                `SPI_SIZE_16: begin
                                    wr0 <= !spiAddr1;
                                    wr1 <= !spiAddr1;
                                    wr2 <=  spiAddr1;
                                    wr3 <=  spiAddr1;
                                    spiSR <= {spiSR[30:0],spiDataIn};
                                    spiBitcount <= 15;
                                    spiState <= `SPI_WR16;
                                end
                                default: begin
                                    wr0 <= 1;
                                    wr1 <= 1;
                                    wr2 <= 1;
                                    wr3 <= 1;
                                    spiSR <= {spiSR[30:0],spiDataIn};
                                    spiBitcount <= 31;
                                    spiState <= `SPI_WR32;
                                end
                            endcase
                        end
                        else begin
                            case (spiXferSize)
                                `SPI_SIZE_16: begin
                                    if (spiAddr1) begin
                                        spiSR <= dataOut;
                                    end
                                    else begin
                                        spiSR <= {dataOut[15:0],16'b0};
                                    end
                                    spiBitcount <= 15;
                                    spiState <= `SPI_RD16;
                                end
                                default: begin
                                    spiSR <= dataOut;
                                    spiBitcount <= 31;
                                    spiState <= `SPI_RD32;
                                end
                            endcase
                        end
                    end
                    else begin
                        spiBitcount <= spiBitcount - 1;
                        spiSR <= {spiSR[30:0],spiDataIn};
                    end
                end
                `SPI_WR16: begin
                    if (spiBitcount == 1) begin
                        cs <= 1;
                        spiBitcount <= spiBitcount - 1;
                        spiSR <= {spiSR[30:0],spiDataIn};
                        spiState <= `SPI_FINISH;
                    end
                    else begin
                        spiBitcount <= spiBitcount - 1;
                        spiSR <= {spiSR[30:0],spiDataIn};
                    end
                end
                `SPI_WR32: begin
                    if (spiBitcount == 1) begin
                        cs <= 1;
                        spiBitcount <= spiBitcount - 1;
                        spiSR <= {spiSR[30:0],spiDataIn};
                        spiState <= `SPI_FINISH;
                    end
                    else begin
                        spiBitcount <= spiBitcount - 1;
                        spiSR <= {spiSR[30:0],spiDataIn};
                    end
                end
                `SPI_RD16: begin
                    if (spiBitcount == 0) begin
                        spiState <= `SPI_FINISH;
                    end
                    else begin
                        spiBitcount <= spiBitcount - 1;
                        spiSR <= {spiSR[30:0],1'b0};
                    end
                end
                `SPI_RD32: begin
                    if (spiBitcount == 0) begin
                        spiState <= `SPI_FINISH;
                    end
                    else begin
                        spiBitcount <= spiBitcount - 1;
                        spiSR <= {spiSR[30:0],1'b0};
                    end
                end
                `SPI_FINISH: begin
                    cs <= 0;
                    wr0 <= 0;
                    wr1 <= 0;
                    wr2 <= 0;
                    wr3 <= 0;
                    spiState <= `SPI_IDLE;
                end
                default: begin
                    cs <= 0;
                    wr0 <= 0;
                    wr1 <= 0;
                    wr2 <= 0;
                    wr3 <= 0;
                    spiState <= `SPI_IDLE;
                end
            endcase
        end
    end

    always @(negedge spiClk) begin
        spiDataOut <= spiSR[31];
    end

    // dataIn mux
    always @* begin
        // 32 bit write
        if (wr0 & wr2) begin
            dataIn = {spiSR[30:0],spiDataIn};
        end
        // 16 bit LSW write
        else if (wr0) begin
            dataIn = {16'b0,spiSR[14:0],spiDataIn};
        end
        // 16 bit MSW write
        else begin
            dataIn = {spiSR[14:0],spiDataIn,16'b0};
        end
    end

endmodule


`ifdef TEST_MODULE

`timescale 1ns/100ps

module test;

    reg reset,clk;

    // Create the clocks
    parameter HC = 5;
    parameter C = 2*HC;
    reg clken;
    always #HC clk = clk^clken;

    // SPI Clock
    `define CLK_DECIMATION 8/2
    integer clkCount;
    reg     spiClkEn;
    always @(posedge clk) begin
        if (reset) begin
            clkCount <= `CLK_DECIMATION-1;
            spiClkEn <= 0;
        end
        else if (clkCount == 0) begin
            clkCount <= `CLK_DECIMATION-1;
            spiClkEn <= 1;
        end
        else begin
            clkCount <= clkCount - 1;
            spiClkEn <= 0;
        end
    end

    // SPI Master State machine
    reg             spiStart;
    reg             spiClk;
    reg     [47:0]  spiSR;
    wire            spiData = spiSR[47];
    integer         shiftCount;
    reg             spiCS;
    reg             spiWrite;
    reg     [1:0]   spiSize;
    reg     [12:0]  spiAddr;
    reg     [31:0]  spiWriteData;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shiftCount <= 0;
            spiCS <= 0;
            spiWrite <= 0;
            spiClk <= 0;
        end
        else if (spiClkEn) begin
            if (spiStart) begin
                spiCS <= 1;
                if (spiWrite) begin
                    // WR16
                    if (spiSize == `SPI_SIZE_16) begin
                        spiSR <= {spiWrite,spiSize,spiAddr,spiWriteData};
                        shiftCount <= 32;
                    end
                    // WR32
                    else begin
                        spiSR <= {spiWrite,spiSize,spiAddr,spiWriteData};
                        shiftCount <= 48;
                    end
                end
                else begin
                    // RD16
                    if (spiSize == `SPI_SIZE_16) begin
                        spiSR <= {spiWrite,spiSize,spiAddr,32'hx};
                        shiftCount <= 32;
                    end
                    // RD32
                    else begin
                        spiSR <= {spiWrite,spiSize,spiAddr,32'hx};
                        shiftCount <= 48;
                    end
                end
            end
            else if (spiClk) begin
                spiClk <= 0;
                if (shiftCount > 0) begin
                    spiSR <= {spiSR[46:0],1'b0};
                    shiftCount <= shiftCount - 1;
                end
            end
            else begin
                if (shiftCount == 0) begin
                    spiCS <= 0;
                end
                else begin
                    spiClk <= 1;
                end
            end
        end
    end

    wire    cs;
    wire    wr0,wr1,wr2,wr3;
    wire    [12:0]  addr;
    wire    [31:0]  dataIn;
    wire    [31:0]  dataOut;
    ddcRegs ddc(
        .busClk(spiClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .ddcCenterFreq(),
        .bypassCic(),
        .bypassHb(),
        .bypassFir(),
        .enableBasebandInputs(),
        .adcDecimation()
    );



    // UUT
    reg     [31:0]  readData;
    spiBusInterface spi(
        .clk(clk),
        .reset(reset),
        .spiClk(spiClk),
        .spiCS(spiCS),
        .spiDataIn(spiData),
        .spiDataOut(),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(dataOut)
        //.dataOut(readData)
    );

    initial begin
        reset = 0;
        clk = 0;

        // Turn on the clock
        clken=1;
        #(10*C) ;

        reset = 1;
        #(2*C) ;
        reset = 0;

        // Write 16
        spiWrite = 1;
        spiSize = `SPI_SIZE_16;
        spiAddr = 13'h0000;
        spiWriteData = 32'h01234567;
        @(posedge spiClkEn) ;
        spiStart <= 1;
        @(posedge spiClkEn) ;
        spiStart <= 0;
        repeat (2*32) @(negedge spiClkEn) ;

        repeat (10) @(negedge spiClkEn) ;

        // Write 16
        spiWrite = 1;
        spiSize = `SPI_SIZE_16;
        spiAddr = 13'h0002;
        spiWriteData = 32'h76543210;
        @(negedge spiClkEn) ;
        spiStart <= 1;
        @(negedge spiClkEn) ;
        spiStart <= 0;
        repeat (2*32) @(negedge spiClkEn) ;

        repeat (10) @(negedge spiClkEn) ;

        // Write 32
        spiWrite = 1;
        spiSize = `SPI_SIZE_32;
        spiAddr = 13'h0000;
        spiWriteData = 32'ha5a55a5a;
        @(negedge spiClkEn) ;
        spiStart <= 1;
        @(negedge spiClkEn) ;
        spiStart <= 0;
        repeat (2*48) @(negedge spiClkEn) ;

        repeat (10) @(negedge spiClkEn) ;

        // Read 16
        spiWrite = 0;
        spiSize = `SPI_SIZE_16;
        spiAddr = 13'h0000;
        @(negedge spiClkEn) ;
        readData <= 32'h01234567;
        spiStart <= 1;
        @(negedge spiClkEn) ;
        spiStart <= 0;
        repeat (2*32) @(negedge spiClkEn) ;

        repeat (10) @(negedge spiClkEn) ;

        // Read 16
        spiWrite = 0;
        spiSize = `SPI_SIZE_16;
        spiAddr = 13'h0002;
        @(negedge spiClkEn) ;
        readData <= 32'h01234567;
        spiStart <= 1;
        @(negedge spiClkEn) ;
        spiStart <= 0;
        repeat (2*32) @(negedge spiClkEn) ;

        repeat (10) @(negedge spiClkEn) ;

        // Read 32
        spiWrite = 0;
        spiSize = `SPI_SIZE_32;
        spiAddr = 13'h0000;
        @(negedge spiClkEn) ;
        readData <= 32'h76543210;
        spiStart <= 1;
        @(negedge spiClkEn) ;
        spiStart <= 0;
        repeat (2*48) @(negedge spiClkEn) ;

        repeat (10) @(negedge spiClkEn) ;


        $stop;

    end


endmodule
`endif