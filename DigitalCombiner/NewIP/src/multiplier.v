module multiplier #(parameter AWIDTH=18, BWIDTH=18, PLSTAGES=0) (
    input                                   clk,
    input                                   clkEn,
    input                                   reset,
    input       signed  [AWIDTH-1:0]        a,
    input       signed  [BWIDTH-1:0]        b,
    output      signed  [AWIDTH+BWIDTH-1:0] p
);

    reg     signed  [AWIDTH+BWIDTH:0]   product;

    generate

        case (PLSTAGES)
            1: begin
                always @(posedge clk) begin
                    if (reset) begin
                        product <= 0;
                    end
                    else if (clkEn) begin
                        product <= a*b;
                    end
                end
            end
            2: begin
                reg     signed  [AWIDTH-1:0]    aReg;
                reg     signed  [BWIDTH-1:0]    bReg;

                always @(posedge clk) begin
                    if (reset) begin
                        aReg <= 0;
                        bReg <= 0;
                        product <= 0;
                    end
                    else if (clkEn) begin
                        aReg <= a;
                        bReg <= b;
                        product <= a*b;
                    end
                end
            end
            default: begin
                always @* begin
                    product = a*b;
                end
            end
        endcase

    endgenerate

    assign p = product[AWIDTH+BWIDTH-1:0];


endmodule
