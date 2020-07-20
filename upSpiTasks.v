    parameter ADDR_BITS = 13;

    // SPI Signals
    reg     spiCS,spiDataIn;
    initial spiCS = 0;
    initial spiDataIn = 0;

    // Processor bus controls
    wire    cs;
    wire    wr0,wr1,wr2,wr3;

    // Processor address bus
    wire    [ADDR_BITS-1:0] a;

    // Processor data bus
    wire    [31:0]  d;

    // Create a bus clock
    reg     bc;
    initial bc = 0;
    `define BC_DECIMATION   4
    integer bcCount;
    initial bcCount = `BC_DECIMATION-1;
    always @(posedge clk) begin
        if (bcCount == 0) begin
            bc <= ~bc;
            bcCount <= `BC_DECIMATION-1;
        end
        else begin
            bcCount <= bcCount - 1;
        end
    end
    wire    busClk = (bc & spiCS);

    function [ADDR_BITS-1:0] createAddress;
        input [ADDR_BITS-1:0] addrA;
        input [ADDR_BITS-1:0] addrB;

        integer i;
        reg [ADDR_BITS-1:0]finalAddress;

        begin
        for (i = 0; i < ADDR_BITS; i = i+1) begin
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
        input [12:0]addr;
        input [15:0]data;
        begin: t1
            integer i;

            @(negedge bc) ;
            spiCS = 1;
            spiDataIn = 1'b1;   // Write cycle
            @(negedge bc) ;
            spiDataIn = 1'b0;   // Xfer Size = 16 bits
            @(negedge bc) ;
            spiDataIn = 1'b1;
            @(negedge bc) ;
            // Address field
            for (i = 12; i >= 0; i = i - 1) begin
                spiDataIn = addr[i];
                @(negedge bc) ;
            end
            // 16 bits of data
            for (i = 15; i >= 0; i = i - 1) begin
                spiDataIn = data[i];
                @(negedge bc) ;
            end
            spiCS = 0;

            repeat (2) @(negedge bc) ;
        end
    endtask


    task write32;
        input [12:0]addr;
        input [31:0]data;
        begin: t1
            integer i;

            @(negedge bc) ;
            spiCS = 1;
            spiDataIn = 1'b1;   // Write cycle
            @(negedge bc) ;
            spiDataIn = 1'b1;   // Xfer Size = 32 bits
            @(negedge bc) ;
            spiDataIn = 1'b1;
            @(negedge bc) ;
            // Address field
            for (i = 12; i >= 0; i = i - 1) begin
                spiDataIn = addr[i];
                @(negedge bc) ;
            end
            // 16 bits of data
            for (i = 31; i >= 0; i = i - 1) begin
                spiDataIn = data[i];
                @(negedge bc) ;
            end
            spiCS = 0;

            repeat (2) @(negedge bc) ;
        end
    endtask

    task read32;
        input [12:0]addr;
        begin: t1
            integer i;

            @(negedge bc) ;
            spiCS = 1;
            spiDataIn = 1'b0;   // Read cycle
            @(negedge bc) ;
            spiDataIn = 1'b1;   // Xfer Size = 32 bits
            @(negedge bc) ;
            spiDataIn = 1'b1;
            @(negedge bc) ;
            // Address field
            for (i = 12; i >= 0; i = i - 1) begin
                spiDataIn = addr[i];
                @(negedge bc) ;
            end
            // 16 bits of data
            for (i = 31; i >= 0; i = i - 1) begin
                spiDataIn = 1'bx;
                @(negedge bc) ;
            end
            spiCS = 0;

            repeat (2) @(negedge bc) ;
        end
    endtask



