    parameter ADDR_BITS = 13;

    reg     cs;
    initial cs = 1;

    reg     wr0,wr1,wr2,wr3;
    initial begin
        wr0 = 0; wr1 = 0; wr2 = 0; wr3 = 0;
    end

    reg     [ADDR_BITS-1:0] a;
    initial a = 0;

    reg     [31:0]  d;
    initial d = 32'hz;

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


    `ifdef USE_BUS_CLOCK

    reg     busClk;

    task write16;
      input [12:0]addr;
      input [15:0]data;
      begin

        a = addr;
        busClk = 1;
        if (addr[1]) begin
            d[31:16] = data;
            #20 ;
                busClk = 0;
                wr2 = 1; wr3 = 1;
            #20 ;
                busClk = 1;
            #20 ;
                busClk = 0;
                wr2 = 0; wr3 = 0;
            end
        else begin
            d[15:0] = data;
            #20 ;
                busClk = 0;
                wr0 = 1; wr1 = 1;
            #20 ;
                busClk = 1;
            #20 ;
                busClk = 0;
                wr0 = 0; wr1 = 0;
            end
        #20 ;
            busClk = 1;
            d = 32'hz;
        #20 ;
            busClk = 0;
        #20 ;
      end
    endtask

    task write32;
      input [12:0]addr;
      input [31:0]data;
      begin
        a = addr;
        d = data;

             busClk = 1;
        #20  ;
             busClk = 0;
             wr0 = 1; wr1 = 1; wr2 = 1; wr3 = 1;
        #20  ;
             busClk = 1;
        #20  ;
             busClk = 0;
             wr0 = 0; wr1 = 0; wr2 = 0; wr3 = 0;
        #20  ;
             busClk = 1;
             d = 32'hz;
        #20  ;
             busClk = 0;
        #20  ;
      end
    endtask

    `else  // USE_BUS_CLOCK

    task write16;
      input [ADDR_BITS-1:0]addr;
      input [15:0]data;
      begin

        a = addr;
        if (addr[1]) begin
            d[31:16] = data;
            #100 wr2 = 1; wr3 = 1;
            #100 wr2 = 0; wr3 = 0;
            end
        else begin
            d[15:0] = data;
            #100 wr0 = 1; wr1 = 1;
            #100 wr0 = 0; wr1 = 0;
            end
        #100
        d = 32'hz;
        #200;
      end
    endtask

    task write32;
      input [ADDR_BITS-1:0]addr;
      input [31:0]data;
      begin
        a = addr;
        d = data;
        #100 wr0 = 1; wr1 = 1; wr2 = 1; wr3 = 1;
        #100 wr0 = 0; wr1 = 0; wr2 = 0; wr3 = 0;
        #100
        d = 32'hz;
        #200;
      end
    endtask

    `endif  //USE_BUS_CLOCK

    task read32;
      input [ADDR_BITS-1:0]addr;
      begin
        a = addr;
        #200;
      end
    endtask

