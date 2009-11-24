// The coefficiants in this file is a 8 bit represantation of a n*2pi/32 rotation
// See excel sheet multi-h.xls
// REAL                    IMAG                         REAL         IMAG
parameter C_RE0 = 8'hFF;   parameter C_IM0 = 8'h00;  //(1.000000000, 0.000000000)   //  0
parameter C_RE1 = 8'hFB;   parameter C_IM1 = 8'h32;  //(0.980785280, 0.195090322)   //  2pi/32
parameter C_RE2 = 8'hED;   parameter C_IM2 = 8'h62;  //(0.923879533, 0.382683432)   //  4pi/32
parameter C_RE3 = 8'hD5;   parameter C_IM3 = 8'h8E;  //(0.831469612, 0.555570233)   //  6pi/32
parameter C_RE4 = 8'hB5;   parameter C_IM4 = 8'hB5;  //(0.707106781, 0.707106781)   //  8pi/32   (45 deg)  re=im=sqrt(2)/2
