`timescale 1ns / 10 ps
`include "./addressMap.v"

`ifdef SILOS
module soqpskMod(
    clk,
    clkEn,
    reset,
    modSampleEn,
    posEdgeModClkEn,
    modData,
    modDataValid,
    deviationClkEn,
    deviation
);
    input                       clk;
    input                       clkEn;
    input                       reset;
    input                       modSampleEn;
    input                       posEdgeModClkEn;
    input                       modData;
    input                       modDataValid;
    output                      deviationClkEn;
    output  reg signed  [17:0]  deviation;
`else
module soqpskMod(
    input                       clk,
    input                       clkEn,
    input                       reset,
    input                       modSampleEn,
    input                       posEdgeModClkEn,
    input                       modData,
    input                       modDataValid,
    output                      deviationClkEn,
    output  reg signed  [17:0]  deviation
);
`endif

    // Encode the bit stream
    soqpsk_differential_encoder diffEnc (
        .clock(clk),
        .reset(!modDataValid),
        .enable(posEdgeModClkEn & clkEn),
        .data_in(modData),
        .data_out(diffData)
    ) ;

    wire    [1:0]   ternData;
    soqpsk_ternary_encoder ternEnc (
        .clock(clk),
        .clockEnable(clkEn),
        .reset(!modDataValid),
        .enable(posEdgeModClkEn),
        .data_in(!diffData),
        .data_out(ternData),
        .data_valid(ternDataEn)
    ) ;

    // Turn bit stream into carrier deviation samples interpolated to two samples
    // per bit.
    reg signed  [2:0]   modValue;
    always @(posedge clk) begin
        if (clkEn) begin
            if (!modDataValid) begin
                modValue <= $signed(3'h0);
            end
            else if (modSampleEn) begin
                if (ternDataEn) begin
                    if (ternData == 2'b01) begin
                        //modValue <= $rtoi(0.5*(2**2));
                        modValue <= $signed(3'h2);                   // +1/2
                    end
                    else if (ternData == 2'b11) begin
                        //modValue <= $rtoi(-0.5*(2**2));
                        modValue <= $signed(3'h6);                   // -1/2
                    end
                end
                else begin
                    modValue <= $signed(3'h0);
                end
            end
        end
    end

    // Run the samples through the shaping filter
    `ifdef USE_VIVADO_CORES

    wire    [15:0]  firTdata;
    soqpskFir modFir(
        .aclk(clk),
        .aclken(clkEn),
        .aresetn(!reset),
        .s_axis_data_tvalid(modSampleEn),
        .s_axis_data_tready(firReady),
        .s_axis_data_tdata({5'b0,modValue}),
        .m_axis_data_tvalid(firClkEn),
        .m_axis_data_tuser(),
        .m_axis_data_tdata(firTdata)
    );
    wire    signed  [17:0]  firOut = {firTdata[13:0],4'b0};

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
                deviation <= 0;
            end
            else if (deviationClkEn) begin
                deviation <= $signed({firOut[15:0],2'b0});
            end
        end
    end

endmodule
