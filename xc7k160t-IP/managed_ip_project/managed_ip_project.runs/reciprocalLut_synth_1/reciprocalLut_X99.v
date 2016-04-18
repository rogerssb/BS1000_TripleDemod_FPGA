// Jagadeesh Vasudevamurthy reciprocalLut_X99.v
// Please do not remove the header
// Char array passed is as follows
//--------------------------------------
//0:00000 11111111111111111
//1:00001 11111111111111111
//2:00010 10000000000000000
//3:00011 01010101010101010
//4:00100 01000000000000000
//5:00101 00110011001100110
//6:00110 00101010101010101
//7:00111 00100100100100100
//8:01000 00100000000000000
//9:01001 00011100011100011
//10:01010 00011001100110011
//11:01011 00010111010001100
//12:01100 00010101010101011
//13:01101 00010011101100010
//14:01110 00010010010010010
//15:01111 00010001000100010
//16:10000 00010000000000000
//17:10001 00001111000011110
//18:10010 00001110001110010
//19:10011 00001101011110010
//20:10100 00001100110011010
//21:10101 00001100001100001
//22:10110 00001011101000110
//23:10111 00001011001000011
//24:11000 00001010101010101
//25:11001 00001010001111011
//26:11010 00001001110110001
//27:11011 00001001011110110
//28:11100 00001001001001001
//29:11101 00001000110101000
//30:11110 00001000100010001
//31:11111 00001000010000100
// default NOT given
// Parallel mux
//--------------------------------------
// PLA starts now
module reciprocalLut_X99(a,o);
	input[4:0]  a;
	output reg[16:0]  o;
	always @(a)
	begin
		case(a)
			5'b00000: o = 17'b11111111111111111;
			5'b00001: o = 17'b11111111111111111;
			5'b00010: o = 17'b10000000000000000;
			5'b00011: o = 17'b01010101010101010;
			5'b00100: o = 17'b01000000000000000;
			5'b00101: o = 17'b00110011001100110;
			5'b00110: o = 17'b00101010101010101;
			5'b00111: o = 17'b00100100100100100;
			5'b01000: o = 17'b00100000000000000;
			5'b01001: o = 17'b00011100011100011;
			5'b01010: o = 17'b00011001100110011;
			5'b01011: o = 17'b00010111010001100;
			5'b01100: o = 17'b00010101010101011;
			5'b01101: o = 17'b00010011101100010;
			5'b01110: o = 17'b00010010010010010;
			5'b01111: o = 17'b00010001000100010;
			5'b10000: o = 17'b00010000000000000;
			5'b10001: o = 17'b00001111000011110;
			5'b10010: o = 17'b00001110001110010;
			5'b10011: o = 17'b00001101011110010;
			5'b10100: o = 17'b00001100110011010;
			5'b10101: o = 17'b00001100001100001;
			5'b10110: o = 17'b00001011101000110;
			5'b10111: o = 17'b00001011001000011;
			5'b11000: o = 17'b00001010101010101;
			5'b11001: o = 17'b00001010001111011;
			5'b11010: o = 17'b00001001110110001;
			5'b11011: o = 17'b00001001011110110;
			5'b11100: o = 17'b00001001001001001;
			5'b11101: o = 17'b00001000110101000;
			5'b11110: o = 17'b00001000100010001;
			5'b11111: o = 17'b00001000010000100;
// defaults of ALL_0 and ALL_X are never routine to input pla. ALL_X,ALL_1 are expanded by me. Output never has default
//			 Parallel mux
		endcase
	end
endmodule