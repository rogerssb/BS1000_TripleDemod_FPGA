`timescale 1ns/10ps

`include "addressMap.v"

module rsEncoder(
    input                   clk,clkEn,reset,
    input                   rsParity32,
    input                   rsASMEnable,
    input           [31:0]  rsEncoderASM,
    input                   infoBitValid,
    input                   infoBit,
    output  reg             inputReady,
    output                  rsBitEn,
    output                  rsBit
    );

    //`define RSENC_VARIABLE_R


    // Reed Solomon Encoder Reset
    `ifdef RSENC_VARIABLE_R
    wire    encoderControlReady;
    wire    encReset = !encoderControlReady;
    `else

    reg     encReset;
    reg     currentParity;
    reg     [3:0] resetCount;
    always @(posedge clk) begin
        if (reset) begin
            encReset <= 0;
            currentParity <= !rsParity32;
            resetCount <= 0;
        end
        else if (clkEn) begin 
            if (currentParity != rsParity32) begin
                currentParity <= rsParity32;
                encReset <= 1;
                resetCount <= 15;
            end
            else if (resetCount > 0) begin
                resetCount <= resetCount - 1;
            end
            else begin
                encReset <= 0;
            end
        end
    end

    `endif

    `ifdef SIMULATE
    reg             rsReset;
    initial         rsReset = 0;
    `endif

    // Number of information Symbols

    `ifdef RSENC_VARIABLE_R

    wire    [7:0]   kMinus1 = rsParity32 ? 8'd222 : 8'd238;   
    wire    [7:0]   r =       rsParity32 ? 8'd32  : 8'd16;
    reg             encCtrlValid;
    reg             encCtrlRestarted;
    always @(posedge clk) begin
        if (reset) begin
            encCtrlValid <= 0;
            encCtrlRestarted <= 0;
        end
        else begin
            if (encoderControlReady && encCtrlRestarted && encoderReady) begin
                encCtrlValid <= 0;
            end
            else if (encoderControlReady && !encCtrlValid && !encCtrlRestarted) begin
                encCtrlValid <= 1;
                encCtrlRestarted <= 1;
            end
            else if (!encoderControlReady && encCtrlRestarted) begin
                encCtrlRestarted <= 0;
            end
        end
    end

    `else //RSENC_VARIABLE_R

    wire    [7:0]   kMinus1 = rsParity32 ? 8'd222 : 8'd238;   
    wire    [7:0]   r =       rsParity32 ? 8'd32  : 8'd16;

    `endif //RSENC_VARIABLE_R

    // Serial to parallel
    reg     [7:0]   inSR;
    reg     [2:0]   infoBitCount;
    always @(posedge clk) begin
        `ifdef SIMULATE
        if (encReset | rsReset) begin
        `else
        if (encReset) begin
        `endif
            infoBitCount <= 7;
        end
        else if (clkEn & infoBitValid) begin
            if (inputReady) begin
                inSR <= {inSR[6:0],infoBit};
                if (infoBitCount == 0) begin
                    infoBitCount <= 7;
                end
                else begin
                    infoBitCount <= infoBitCount - 1;
                end
            end
            else begin
            end

        end
    end
    reg             rsInputValid;
    reg     [7:0]   rsInputSymbol;
    always @(posedge clk) begin
        `ifdef SIMULATE
        if (encReset | rsReset) begin
        `else
        if (encReset) begin
        `endif
            rsInputValid <= 0;
        end
        else if (encoderReady) begin
            if (rsInputValid == 0) begin
                if (infoBitCount == 0) begin
                    rsInputSymbol <= inSR;
                    rsInputValid <= infoBitValid;
                end
            end
            else begin
                rsInputValid <= 0;
            end
        end
    end

    `ifdef RSENC_VARIABLE_R

    wire    [7:0]   rsOutputSymbol;
    rsEnc_255_varR rsEnc (
        .aclk(clk),
        .aclken(1'b1),
        .aresetn(!reset),
        .s_axis_input_tdata(rsInputSymbol),
        .s_axis_input_tvalid(rsInputValid),
        .s_axis_input_tready(encoderReady),
        .s_axis_input_tlast(1'b0),
        .s_axis_ctrl_tdata({r,8'd255}),
        .s_axis_ctrl_tvalid(encCtrlValid),
        .s_axis_ctrl_tready(encoderControlReady),
        .m_axis_output_tdata(rsOutputSymbol),
        .m_axis_output_tvalid(rsOutputValid),
        .m_axis_output_tlast(),
        .event_s_input_tlast_missing(),
        .event_s_input_tlast_unexpected(),
        .event_s_ctrl_tdata_invalid()
    );

    `else //RSENC_VARIABLE_R

    wire    [7:0]   rs239OutputSymbol;
    rs_255_239 rsEnc239 (
        .aclk(clk),                                                      // input wire aclk
        .aclken(1'b1),                                                   // input wire aclken
        .aresetn(!encReset),
        .s_axis_input_tdata(rsInputSymbol),                              // input wire [7 : 0] s_axis_input_tdata
        .s_axis_input_tvalid(rsInputValid),                              // input wire s_axis_input_tvalid
        .s_axis_input_tready(encoder239Ready),                           // output wire s_axis_input_tready
        .s_axis_input_tlast(1'b0),                                       // input wire s_axis_input_tlast
        .m_axis_output_tdata(rs239OutputSymbol),                         // output wire [7 : 0] m_axis_output_tdata
        .m_axis_output_tvalid(rs239OutputValid),                         // output wire m_axis_output_tvalid
        .m_axis_output_tlast(),                                          // output wire m_axis_output_tlast
        .event_s_input_tlast_missing(),                                  // output wire event_s_input_tlast_missing
        .event_s_input_tlast_unexpected()                                // output wire event_s_input_tlast_unexpected
    );

    wire    [7:0]   rs223OutputSymbol;
    rs_255_223 rsEnc223 (
        .aclk(clk),                                                      // input wire aclk
        .aclken(1'b1),                                                   // input wire aclken
        .aresetn(!encReset),
        .s_axis_input_tdata(rsInputSymbol),                              // input wire [7 : 0] s_axis_input_tdata
        .s_axis_input_tvalid(rsInputValid),                              // input wire s_axis_input_tvalid
        .s_axis_input_tready(encoder223Ready),                           // output wire s_axis_input_tready
        .s_axis_input_tlast(1'b0),                                       // input wire s_axis_input_tlast
        .m_axis_output_tdata(rs223OutputSymbol),                         // output wire [7 : 0] m_axis_output_tdata
        .m_axis_output_tvalid(rs223OutputValid),                         // output wire m_axis_output_tvalid
        .m_axis_output_tlast(),                                          // output wire m_axis_output_tlast
        .event_s_input_tlast_missing(),                                  // output wire event_s_input_tlast_missing
        .event_s_input_tlast_unexpected()                                // output wire event_s_input_tlast_unexpected
    );

    wire    [7:0]   rsOutputSymbol =    rsParity32 ? rs223OutputSymbol : rs239OutputSymbol;
    wire            rsOutputValid =     rsParity32 ? rs223OutputValid  : rs239OutputValid;
    wire            encoderReady =      rsParity32 ? encoder223Ready   : encoder239Ready;

    `endif // RSENC_VARIABLE_R

    // Output FIFO
    wire    [7:0]   fifoByte;
    reg             fifoRdEn;
    fifo8x32 fifo(
        .clk(clk),
        .clkEn(1'b1),
        .reset(encReset),
        .wrEn(rsOutputValid),
        .din(rsOutputSymbol),
        .rdEn(fifoRdEn),
        .dout(fifoByte),
        .fifoEmpty(fifoEmpty)
    );

    reg     [7:0]   rsInputCount;
    always @(posedge clk) begin
        if (encReset) begin
            rsInputCount <= 0;
        end
        else if (infoBitValid && (infoBitCount == 0)) begin
            if (rsInputCount < kMinus1) begin
                rsInputCount <= rsInputCount + 1;
            end
        end
        else if (fifoRdEn) begin
            if ((rsInputCount == kMinus1) && (rsOutputCount == 254)) begin
                rsInputCount <= 0;
            end
        end
    end

    reg     [7:0]   rsOutputCount;
    always @(posedge clk) begin
        if (encReset) begin
            rsOutputCount <= 0;
        end
        else if (fifoRdEn) begin
            if (rsOutputCount < 254) begin
                rsOutputCount <= rsOutputCount + 1;
            end
            else begin
                rsOutputCount <= 0;
            end
        end
    end

    reg     [2:0]   asmState;
        `define RS_ASM_IDLE         3'b000
        `define RS_ASM_PARITY       3'b001
        `define RS_ASM_ASM0         3'b011
        `define RS_ASM_ASM1         3'b010
        `define RS_ASM_ASM2         3'b110
        `define RS_ASM_ASM3         3'b111
    always @(posedge clk) begin
        if (encReset) begin
            inputReady <= 1;
            asmState <= `RS_ASM_IDLE;
        end
        if (rsASMEnable) begin
            case (asmState)
                `RS_ASM_IDLE: begin
                    if (infoBitValid && (infoBitCount == 0)) begin
                        if (rsInputCount == kMinus1) begin
                            asmState <= `RS_ASM_PARITY;
                            inputReady <= 0;
                        end
                    end
                end
                `RS_ASM_PARITY: begin
                    if (infoBitValid && (codedBitCount == 0)) begin
                        if ((rsInputCount == kMinus1) && (rsOutputCount == 254)) begin
                            asmState <= `RS_ASM_ASM0;
                        end
                    end
                end
                `RS_ASM_ASM0: begin
                    if (infoBitValid && (codedBitCount == 0)) begin
                        asmState <= `RS_ASM_ASM1;
                    end
                end
                `RS_ASM_ASM1: begin
                    if (infoBitValid && (codedBitCount == 0)) begin
                        asmState <= `RS_ASM_ASM2;
                    end
                end
                `RS_ASM_ASM2: begin
                    if (infoBitValid && (codedBitCount == 0)) begin
                        asmState <= `RS_ASM_ASM3;
                    end
                end
                `RS_ASM_ASM3: begin
                    if (infoBitValid && (codedBitCount == 2)) begin
                        inputReady <= 1;
                    end
                    if (infoBitValid && (codedBitCount == 0)) begin
                        asmState <= `RS_ASM_IDLE;
                    end
                end
                default: begin
                    asmState <= `RS_ASM_IDLE;
                    inputReady <= 1;
                end
            endcase
        end
        else begin
            if (infoBitValid && (infoBitCount == 0)) begin
                if (rsInputCount == kMinus1) begin
                    inputReady <= 0;
                end
            end
            else if (infoBitValid && (codedBitCount == 2)) begin
                if ((rsInputCount == kMinus1) && (rsOutputCount == 254)) begin
                    inputReady <= 1;
                end
            end
        end
    end

    // Parallel to serial
    reg     [7:0]   outSR;
    assign          rsBit = outSR[7];
    reg     [2:0]   codedBitCount;
    always @(posedge clk) begin
        `ifdef SIMULATE
        if (encReset | rsReset) begin
        `else
        if (encReset) begin
        `endif
            codedBitCount <= 0;
            fifoRdEn <= 0;
        end
        else if (clkEn & infoBitValid) begin
            if (rsASMEnable) begin
                case (asmState)
                    `RS_ASM_IDLE: begin
                        if (!fifoEmpty && (codedBitCount == 0)) begin
                            outSR <= fifoByte;
                            fifoRdEn <= 1;
                            codedBitCount <= 7;
                        end
                        else if (codedBitCount > 0) begin
                            outSR <= {outSR[6:0],1'b0};
                            codedBitCount <= codedBitCount - 1;
                        end
                    end
                    `RS_ASM_PARITY: begin
                        if (!fifoEmpty && (codedBitCount == 0)) begin
                            outSR <= fifoByte;
                            fifoRdEn <= 1;
                            codedBitCount <= 7;
                        end
                        else if (fifoEmpty && (codedBitCount == 0) && (rsOutputCount == 254)) begin
                            outSR <= fifoByte;
                            fifoRdEn <= 0;
                            codedBitCount <= 7;
                        end
                        else if (codedBitCount > 0) begin
                            outSR <= {outSR[6:0],1'b0};
                            codedBitCount <= codedBitCount - 1;
                        end
                    end
                    `RS_ASM_ASM0: begin
                        if (codedBitCount == 0) begin
                            outSR <= rsEncoderASM[31:24];
                            codedBitCount <= 7;
                        end
                        else if (codedBitCount > 0) begin
                            outSR <= {outSR[6:0],1'b0};
                            codedBitCount <= codedBitCount - 1;
                        end
                    end
                    `RS_ASM_ASM1: begin
                        if (codedBitCount == 0) begin
                            outSR <= rsEncoderASM[23:16];
                            codedBitCount <= 7;
                        end
                        else if (codedBitCount > 0) begin
                            outSR <= {outSR[6:0],1'b0};
                            codedBitCount <= codedBitCount - 1;
                        end
                    end
                    `RS_ASM_ASM2: begin
                        if (codedBitCount == 0) begin
                            outSR <= rsEncoderASM[15:8];
                            codedBitCount <= 7;
                        end
                        else if (codedBitCount > 0) begin
                            outSR <= {outSR[6:0],1'b0};
                            codedBitCount <= codedBitCount - 1;
                        end
                    end
                    `RS_ASM_ASM3: begin
                        if (codedBitCount == 0) begin
                            outSR <= rsEncoderASM[7:0];
                            codedBitCount <= 7;
                        end
                        else if (codedBitCount > 0) begin
                            outSR <= {outSR[6:0],1'b0};
                            codedBitCount <= codedBitCount - 1;
                        end
                    end
                    default: begin
                        codedBitCount <= 0;
                        fifoRdEn <= 0;
                    end
                endcase
            end
            else begin
                if (!fifoEmpty && (codedBitCount == 0)) begin
                    outSR <= fifoByte;
                    fifoRdEn <= 1;
                    codedBitCount <= 7;
                end
                else if (codedBitCount > 0) begin
                    outSR <= {outSR[6:0],1'b0};
                    codedBitCount <= codedBitCount - 1;
                end
            end
        end
        else begin
            fifoRdEn <= 0;
        end
    end
    assign rsBit = outSR[7];
    assign rsBitEn = (clkEn && infoBitValid);

endmodule


`ifdef TEST_MODULE

module test;
    parameter CLOCK_FREQ = 93.333333e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    parameter CLOCK_DECIMATION = 1;
    parameter BITRATE_DECIMATION = 4;

    /*
    Instantiate the global internals for the FPGA library
    */
    glbl glbl();

    reg     reset;
    initial reset = 0;

    // Create the clocks
    reg     clk;
    initial clk = 1;
    reg     clken;
    always #HC clk = clk^clken;
    `define CLOCK_PERIOD   (C*1e-9)


    // Clock Enable
    reg     clkEnable;
    initial clkEnable = 0;
    integer clkCount;
    initial clkCount = 0;
    always @(posedge clk) begin
        if (clkCount == CLOCK_DECIMATION-1) begin
            clkCount <= 0;
            clkEnable <= 1;
        end
        else begin
            clkCount <= clkCount + 1;
            clkEnable <= 0;
        end
    end

    // Bitrate Enable
    reg     bitClkEn;
    reg     infoClkEn;
    integer bitCount;
    initial bitCount = 1;
    always @(posedge clk) begin
        if (clkEnable) begin
            if (bitCount == 0) begin
                bitCount <= BITRATE_DECIMATION - 1;
                bitClkEn <= 1;
                infoClkEn <= ready;
            end
            else begin
                bitCount <= bitCount - 1;
                bitClkEn <= 0;
                infoClkEn <= 0;
            end
        end
        else begin
            bitClkEn <= 0;
            infoClkEn <= 0;
        end
    end

    // Random data
    parameter PN17 = 16'h00b8,
              MASK17 = 16'h0099;
    reg [15:0]sr;
    reg  randData;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sr <= MASK17;
        end
        else if (infoClkEn) begin
            sr <= {sr[14:0], ^(PN17 & sr)};
            randData <= sr[0];
        end
    end

    //----------------------------------- UUT ---------------------------------
    reg             rsParity32;
    initial         rsParity32 = 0;
    reg             rsASMEnable;
    initial         rsASMEnable = 0;
    rsEncoder rsEnc(
        .clk(clk),
        .clkEn(clkEnable),
        .reset(reset),
        .rsParity32(rsParity32),
        .rsASMEnable(rsASMEnable),
        .rsEncoderASM(32'h12345678),
        .infoBitValid(bitClkEn),
        .infoBit(randData),
        .inputReady(ready),
        .rsBitEn(),
        .rsBit()
    );


    initial begin
        reset = 0;

        // Turn on the clock
        clken=1;
        #(10*C) ;

        #(16*C) ;
        reset = 1;
        rsEnc.rsReset = 0;

        repeat (2) @ (posedge bitClkEn) ;

        /*
        while (!rsEnc.encoderReady) begin
            repeat (1) @ (posedge bitClkEn) ;
        end
        */
        reset = 0;

        repeat (40000) @ (posedge clk) ;

        rsParity32 = 1;

        repeat (40000) @ (posedge clk) ;

        rsParity32 = 0;
        rsASMEnable = 1;

        repeat (40000) @ (posedge clk) ;

        rsParity32 = 1;

        repeat (40000) @ (posedge clk) ;

        $stop;

    end


endmodule

`endif
