`timescale 1ns/100ps
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// complex multiplier
// verne stauffer
// august 2012
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// R + jI = (a + jb)(c + jd) = (ac - bd) + j(bc + ad)
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module cmult18 (
    A, // input [17 : 0]
    B, // input [17 : 0]
    C, // input [17 : 0]
    D, // input [17 : 0]
    R, // output [17 : 0]
    I, // output [17 : 0]
    EN, // input
    CK, // input
    RS); // input

input [17:0]A,B,C,D;
input EN,CK,RS;
output [17:0]R,I;
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [17:0]limit;
    input [18:0]in;
    if (in[18] && !in[17]) begin
        limit = 18'h20001;
        `ifdef SIMULATE
        $display ("cmult18 Limited");
        `endif
        end
    else if (!in[18] && in[17]) begin
        limit = 18'h1ffff;
        `ifdef SIMULATE
        $display ("cmult18 Limited");
        `endif
        end
    else limit = in[17:0];
endfunction
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Synchronous DSP48A
// 1)multiplications ac and bd are performed in state 001
// 2)multiplications ad and bc are performed in state 010
// 3)the a and b terms have fixed multiplier input assignments
// 4)so that only the c and d terms are multiplexed
// 4)the products are summed and latched in state 10
// 5)state 11 is invalid
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [17:0]inst1_b;      // dsp48a_inst1 input b
wire [47:0]inst1_p;     // dsp48a_inst1 output p
reg [17:0]inst2_b;      // dsp48a_inst2 input b
wire [47:0]inst2_p;     // dsp48a_inst2 output p
reg [17:0]ac,ad,bc,bd;  // product term latches
reg [17:0]R,I;          // sum term latches
reg [2:0]state;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// this clock contributes one pipeline delay
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
always @ (posedge CK) begin
    if (RS) begin
        state <= 3'b0;
        inst1_b <= 18'h0;
        inst2_b <= 18'h0;
        ac <= 18'h0;
        bd <= 18'h0;
        bc <= 18'h0;
        ad <= 18'h0;
        R <= 18'h0;
        I <= 18'h0;
        end
    else begin
        state <= {state[1:0],EN};
        case (state)
        3'b001: begin
            inst1_b <= C;
            inst2_b <= D;
            end
        3'b010: begin
            ac <= inst1_p[34:17];
            bd <= inst2_p[34:17];
            inst1_b <= D;
            inst2_b <= C;
            end
        3'b100: begin
            bc <= inst1_p[34:17];
            ad <= inst2_p[34:17];
            end
        3'b000: begin
            R <= limit({ac[17],ac} - {bd[17],bd});
            I <= limit({bc[17],bc} + {ad[17],ad});
            end
        endcase
        end
    end

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//OPMODE[7] Specifies whether the post-add/sub is an adder or subtracter
//0 – Specifies post-adder/subtracter to perform an addition operation
//1 – Specifies post-adder/subtracter to perform a subtraction operation
`define OP7 1'b0

//OPMODE[6] Specifies whether the pre-add/sub is an adder or subtracter
//0 – Specifies pre-adder/subtracter to perform an addition operation
//1 – Specifies pre-adder/subtracter to perform a subtraction operation
`define OP6 1'b0

//OPMODE[5] Force a value on carry-in to the post-adder. Only applicable when
//CARRYINSEL = "OPMODE5".
`define OP5 1'b0

//OPMODE[4] Specifies the use of the pre-add/sub
//0 – Bypass the pre-adder supplying the data on port B directly to the multiplier
//1 – Selects to use the pre-adder adding or subtracting the values on the B and D
//ports prior to the multiplier
`define OP4 1'b0

//OPMODE[3:2] Specifies the source of the Y input to the post-add/sub
//0 – Specifies to place all zeroes (disable the post-adder/subtracter and propagate
//the multiplier product to P)
//1 – Use the PCIN
//2 – Use the P port (accumulator)
//3 – Use the C port
`define OP32 2'b00

//OPMODE[1:0] Specifies the source of the X input to the post-add/sub
//0 – Specifies to place all zeroes (disable the post-adder/subtracter)
//1 – Use the multiplier product
//2 – Use the P output signal (accumulator)
//3 – Use the concatenated D, B, A input signals
`define OP10 2'b01

wire [7:0]dsp48a_op = {`OP7,`OP6,`OP5,`OP4,`OP32,`OP10};
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// DSP48A: DSP Function Block
// Spartan-3A DSP
// Xilinx HDL Libraries Guide, version 13.4
DSP48A #(
    .A0REG(0), // Enable=1/disable=0 first stage A input pipeline register
    .A1REG(0), // Enable=1/disable=0 second stage A input pipeline register
    .B0REG(0), // Enable=1/disable=0 first stage B input pipeline register
    .B1REG(0), // Enable=1/disable=0 second stage B input pipeline register
    .CARRYINREG(0), // Enable=1/disable=0 CARRYIN input pipeline register
    .CARRYINSEL("OPMODE5"), // Specify carry-in source, "CARRYIN" or "OPMODE5"
    .CREG(0), // Enable=1/disable=0 C input pipeline register
    .DREG(0), // Enable=1/disable=0 D pre-adder input pipeline register
    .MREG(0), // Enable=1/disable=0 M pipeline register
    .OPMODEREG(0), // Enable=1/disable=0 OPMODE input pipeline register
    .PREG(0), // Enable=1/disable=0 P output pipeline register
    .RSTTYPE("SYNC") // Specify reset type, "SYNC" or "ASYNC"
    ) DSP48A_inst1
        (
        .BCOUT(), // 18-bit B port cascade output
        .CARRYOUT(), // 1-bit carry output
        .P(inst1_p), // 48-bit output
        .PCOUT(), // 48-bit cascade output
        .A(A), // 18-bit A data input
        .B(inst1_b), // 18-bit B data input (can be connected to fabric or BCOUT of adjacent DSP48A)
        .C(48'b0), // 48-bit C data input
        .CARRYIN(1'b0), // 1-bit carry input signal
        .CEA(1'b0), // 1-bit active high clock enable input for A input registers
        .CEB(1'b0), // 1-bit active high clock enable input for B input registers
        .CEC(1'b0), // 1-bit active high clock enable input for C input registers
        .CECARRYIN(1'b0), // 1-bit active high clock enable input for CARRYIN registers
        .CED(1'b0), // 1-bit active high clock enable input for D input registers
        .CEM(1'b0), // 1-bit active high clock enable input for multiplier registers
        .CEOPMODE(1'b0), // 1-bit active high clock enable input for OPMODE registers
        .CEP(1'b0), // 1-bit active high clock enable input for P output registers
        .CLK(1'b0), //ck), // Clock input
        .D(18'b0), // 18-bit B pre-adder data input
        .OPMODE(dsp48a_op), // 8-bit operation mode input
        .PCIN(48'b0), // 48-bit P cascade input
        .RSTA(1'b0), // 1-bit reset input for A input pipeline registers
        .RSTB(1'b0), // 1-bit reset input for B input pipeline registers
        .RSTC(1'b0), // 1-bit reset input for C input pipeline registers
        .RSTCARRYIN(1'b0), // 1-bit reset input for CARRYIN input pipeline registers
        .RSTD(1'b0), // 1-bit reset input for D input pipeline registers
        .RSTM(1'b0), // 1-bit reset input for M pipeline registers
        .RSTOPMODE(1'b0), // 1-bit reset input for OPMODE input pipeline registers
        .RSTP(reset) // 1-bit reset input for P output pipeline registers
        );
// End of DSP48A_inst instantiation

// DSP48A: DSP Function Block
// Spartan-3A DSP
// Xilinx HDL Libraries Guide, version 13.4
DSP48A #(
    .A0REG(0), // Enable=1/disable=0 first stage A input pipeline register
    .A1REG(0), // Enable=1/disable=0 second stage A input pipeline register
    .B0REG(0), // Enable=1/disable=0 first stage B input pipeline register
    .B1REG(0), // Enable=1/disable=0 second stage B input pipeline register
    .CARRYINREG(0), // Enable=1/disable=0 CARRYIN input pipeline register
    .CARRYINSEL("OPMODE5"), // Specify carry-in source, "CARRYIN" or "OPMODE5"
    .CREG(0), // Enable=1/disable=0 C input pipeline register
    .DREG(0), // Enable=1/disable=0 D pre-adder input pipeline register
    .MREG(0), // Enable=1/disable=0 M pipeline register
    .OPMODEREG(0), // Enable=1/disable=0 OPMODE input pipeline register
    .PREG(0), // Enable=1/disable=0 P output pipeline register
    .RSTTYPE("SYNC") // Specify reset type, "SYNC" or "ASYNC"
    ) DSP48A_inst2
        (
        .BCOUT(), // 18-bit B port cascade output
        .CARRYOUT(), // 1-bit carry output
        .P(inst2_p), // 48-bit output
        .PCOUT(), // 48-bit cascade output
        .A(B), // 18-bit A data input
        .B(inst2_b), // 18-bit B data input (can be connected to fabric or BCOUT of adjacent DSP48A)
        .C(48'b0), // 48-bit C data input
        .CARRYIN(1'b0), // 1-bit carry input signal
        .CEA(1'b0), // 1-bit active high clock enable input for A input registers
        .CEB(1'b0), // 1-bit active high clock enable input for B input registers
        .CEC(1'b0), // 1-bit active high clock enable input for C input registers
        .CECARRYIN(1'b0), // 1-bit active high clock enable input for CARRYIN registers
        .CED(1'b0), // 1-bit active high clock enable input for D input registers
        .CEM(1'b0), // 1-bit active high clock enable input for multiplier registers
        .CEOPMODE(1'b0), // 1-bit active high clock enable input for OPMODE registers
        .CEP(1'b0), // 1-bit active high clock enable input for P output registers
        .CLK(1'b0), //ck), // Clock input
        .D(18'b0), // 18-bit B pre-adder data input
        .OPMODE(dsp48a_op), // 8-bit operation mode input
        .PCIN(48'b0), // 48-bit P cascade input
        .RSTA(1'b0), // 1-bit reset input for A input pipeline registers
        .RSTB(1'b0), // 1-bit reset input for B input pipeline registers
        .RSTC(1'b0), // 1-bit reset input for C input pipeline registers
        .RSTCARRYIN(1'b0), // 1-bit reset input for CARRYIN input pipeline registers
        .RSTD(1'b0), // 1-bit reset input for D input pipeline registers
        .RSTM(1'b0), // 1-bit reset input for M pipeline registers
        .RSTOPMODE(1'b0), // 1-bit reset input for OPMODE input pipeline registers
        .RSTP(reset) // 1-bit reset input for P output pipeline registers
        );
// End of DSP48A_inst instantiation

`ifdef SIMULATE
real a = 0.0; always @* a = $itor($signed(A)) / 2**17;
real b = 0.0; always @* b = $itor($signed(B)) / 2**17;
real c = 0.0; always @* c = $itor($signed(C)) / 2**17;
real d = 0.0; always @* d = $itor($signed(D)) / 2**17;

integer sim_r = 0; always @* sim_r = $rtoi((a*c - b*d) * 2**17);
integer sim_i = 0; always @* sim_i = $rtoi((b*c + a*d) * 2**17);

integer sim_R,sim_I;
always @ (posedge CK) begin
    if (RS) begin
        sim_R <= 'h0;
        sim_I <= 'h0;
        end
    else if (EN) begin
        sim_R <= sim_r;
        sim_I <= sim_i;
        end
    end
`endif // SIMULATE
endmodule //cmult18