`timescale 1ns / 10 ps
`include ".\addressMap.v"

`ifdef SILOS
module dualSoqpskMod(
    clk,
    clkEn,
    reset,
    modSampleEn,
    posEdgeModClkEn,
    modData0,
    modData1,
    modDataValid,
    deviationClkEn,
    deviation0,
    deviation1
);
    input                       clk;
    input                       clkEn;
    input                       reset;
    input                       modSampleEn;
    input                       posEdgeModClkEn;
    input                       modData0;
    input                       modData1;
    input                       modDataValid;
    output                      deviationClkEn;
    output  reg signed  [17:0]  deviation0;
    output  reg signed  [17:0]  deviation1;
`else
module dualSoqpskMod(
    input                       clk,
    input                       clkEn,
    input                       reset,
    input                       modSampleEn,
    input                       posEdgeModClkEn,
    input                       modData0,
    input                       modData1,
    input                       modDataValid,
    output                      deviationClkEn,
    output  reg signed  [17:0]  deviation0,
    output  reg signed  [17:0]  deviation1
);
`endif

    // Encode the bit streams
    wire    [1:0]   ternData0;
    soqpsk_ternary_encoder ternEnc0 (
        .clock(clk),
        .clockEnable(clkEn),
        .reset(!modDataValid),
        .enable(posEdgeModClkEn),
        .data_in(modData0),
        .data_out(ternData0),
        .data_valid(ternDataEn)
    ) ;
    wire    [1:0]   ternData1;
    soqpsk_ternary_encoder ternEnc1 (
        .clock(clk),
        .clockEnable(clkEn),
        .reset(!modDataValid),
        .enable(posEdgeModClkEn),
        .data_in(modData1),
        .data_out(ternData1),
        .data_valid()
    ) ;

    // Turn bit stream into carrier deviation samples interpolated to two samples
    // per bit.
    reg signed  [2:0]   modValue0;
    reg signed  [2:0]   modValue1;
    always @(posedge clk) begin
        if (clkEn) begin
            if (!modDataValid) begin
                modValue0 <= $signed(3'h0);
                modValue1 <= $signed(3'h0);
            end
            else if (modSampleEn) begin
                if (ternDataEn) begin
                    if (ternData0 == 2'b01) begin
                        //modValue0 <= $rtoi(0.5*(2**2));
                        modValue0 <= $signed(3'h2);                   // +1/2
                    end
                    else if (ternData0 == 2'b11) begin
                        //modValue0 <= $rtoi(-0.5*(2**2));
                        modValue0 <= $signed(3'h6);                   // -1/2
                    end
                end
                else begin
                    modValue0 <= $signed(3'h0);
                end
                if (ternDataEn) begin
                    if (ternData1 == 2'b01) begin
                        //modValue1 <= $rtoi(0.5*(2**2));
                        modValue1 <= $signed(3'h2);                   // +1/2
                    end
                    else if (ternData1 == 2'b11) begin
                        //modValue1 <= $rtoi(-0.5*(2**2));
                        modValue1 <= $signed(3'h6);                   // -1/2
                    end
                end
                else begin
                    modValue1 <= $signed(3'h0);
                end
            end
        end
    end

    // Run the samples through the shaping filter
    `ifdef USE_VIVADO_CORES

    wire    [15:0]  firTdata0;
    soqpskFir modFir0(
        .aclk(clk),
        .aclken(clkEn),
        .aresetn(!reset),
        .s_axis_data_tvalid(modSampleEn),
        .s_axis_data_tready(firReady0),
        .s_axis_data_tdata({5'b0,modValue0}),
        .m_axis_data_tvalid(firClkEn),
        .m_axis_data_tuser(),
        .m_axis_data_tdata(firTdata0)
    );
    wire    signed  [17:0]  firOut0 = {{2{firTdata0[15]}},firTdata0};

    wire    [15:0]  firTdata1;
    soqpskFir modFir1(
        .aclk(clk),
        .aclken(clkEn),
        .aresetn(!reset),
        .s_axis_data_tvalid(modSampleEn),
        .s_axis_data_tready(firReady1),
        .s_axis_data_tdata({5'b0,modValue1}),
        .m_axis_data_tvalid(),
        .m_axis_data_tuser(),
        .m_axis_data_tdata(firTdata1)
    );
    wire    signed  [17:0]  firOut1 = {{2{firTdata1[15]}},firTdata1};

    `else

    wire    signed  [17:0]  firOut;
    soqpskFir modFir(
        .clk(clk),
        .nd(modSampleEn & clkEn),
        .rfd(),
        .rdy(firReady),
        .din(modValue),
        .dout(firOut)
    );
    reg             firClkEn;
    always @(posedge clk) begin
        if (firReady & !clkEn) begin
            firClkEn <= 1;
        end
        else if (clkEn) begin
            firClkEn <= 0;
        end
    end

    `endif //USE_VIVADO_CORES

    //assign deviationClkEn = (firReady & clkEn) | (firClkEn & clkEn);
    assign deviationClkEn = firClkEn;

    always @(posedge clk) begin
        if (clkEn) begin
            if (!modDataValid) begin
                deviation0 <= 0;
                deviation1 <= 0;
            end
            else if (deviationClkEn) begin
                deviation0 <= $signed({firOut0[12:0],5'b0});
                deviation1 <= $signed({firOut1[12:0],5'b0});
            end
        end
    end

endmodule
