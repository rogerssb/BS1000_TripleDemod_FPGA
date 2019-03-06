/*-------------------------------------------------------------------------------
                  PROPRIETARY NOTICE
----------------------------------------------------------------------------
(c) Copyright 2014 Semco Inc. All rights reserved.

This file contains Semco Inc. proprietary information. It is the
property of Semco Inc. and shall not be used, disclosed to others or
reproduced without the express written consent of Semco Inc.,
including, but without limitation, it is not to be used in the creation,
manufacture, development, or derivation of any designs, or configuration.

----------------------------------------------------------------------------

Company:     Semco Inc.

Module Name: DecodeTurboInit.vhd
Description:

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
% There are two main tasks that need to be performed:
%  1. De-multiplex the single received stream into separate streams for
%     Encoder A and Encoder B. These should be interleaved/deinterleaved into
%     the order expected by their respective decoder. Also, any punctured bits
%     (i.e., those not transmitted) should be filled in with zeros (i.e., a zero
%     LLR means its equiprobable the missing bit was a 0 or a 1).
%
%  2. Re-format the received channel outputs. These arrive off the channel as
%     bit-based LLR-type information: meaning that a positive sign corresponds
%     to a +1 (logical 1) and a negative sign corresponds to a -1 (logical 0),
%     with the magnitude corresponding to the relative certainty of the
%     +/- sign. We simply have to "unpackage" them, which entails applying the
%     proper +/- sign, dividing by 2, and adding the proper bit values c_bold
%     that make up each symbol C.
%
% Written by Erik Perrins, 2017, esp@ieee.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r = r(:)'; % Force row vector format

% De-multiplex the single received stream into separate A and B streams, as if
% they were received from a single (i.e., not turbo) component encoder.

if    (Rnominal == 1/2)
    % Separate the two output streams
    r_uA     = r(1:2:end);
    rParity  = r(2:2:end);

    % Encoder A was fed with InputA, followed by four termination bits, and
    % corresponding received bits for all of this are found in r_uA. But with
    % Out1A, we only have every other bit because of the puncturing, so the
    % missing bits we will represent with zeros (equiprobable for 0's or 1's).
    r_c1A = zeros(size(r_uA));
    r_c1A(1:2:end) = rParity(1:2:end);
    % KEY FACT: Encoder A has Out0A, which means r_uA is viewed as a part of c
    r_c_boldA = [r_uA(:)';r_c1A(:)'];

    % Encoder B was fed with interleaved InputA, but the entire InputB was not
    % part of the transmission, so we don't have to re-create it here. We just
    % have to obtain Out1B, similar to the above with the puncturing.
    r_c1B = zeros(size(r_c1A));
    r_c1B(2:2:end) = rParity(2:2:end);
    % KEY FACT: Encoder B doesn't have Out0B, so its not found in its c
    r_c_boldB = [r_c1B(:)'];

elseif(Rnominal == 1/3)
    % Separate the three output streams
    r_uA  = r(1:3:end);
    r_c1A = r(2:3:end);
    r_c1B = r(3:3:end);

    % Encoder A was fed with InputA, followed by four termination bits, and
    % corresponding received bits for all of this are found in r_uA.
    % KEY FACT: Encoder A has Out0A, which means r_uA is viewed as a part of c
    r_c_boldA = [r_uA(:)';r_c1A(:)'];

    % Encoder B was fed with interleaved InputA, but the entire InputB was not
    % part of the transmission, so we don't have to re-create it here.
    % KEY FACT: Encoder B doesn't have Out0B, so its not found in its c
    r_c_boldB = [r_c1B(:)'];

elseif(Rnominal == 1/4)
    % Separate the four output streams
    r_uA  = r(1:4:end);
    r_c2A = r(2:4:end);
    r_c3A = r(3:4:end);
    r_c1B = r(4:4:end);

    % Encoder A was fed with InputA, followed by four termination bits, and
    % corresponding received bits for all of this are found in r_uA.
    % KEY FACT: Encoder A has Out0A, which means r_uA is viewed as a part of c
    r_c_boldA = [r_uA(:)';r_c2A(:)';r_c3A(:)'];

    % Encoder B was fed with interleaved InputA, but the entire InputB was not
    % part of the transmission, so we don't have to re-create it here.
    % KEY FACT: Encoder B doesn't have Out0B, so its not found in its c
    r_c_boldB = [r_c1B(:)'];

elseif(Rnominal == 1/6)
    % Separate the six output streams
    r_uA  = r(1:6:end);
    r_c1A = r(2:6:end);
    r_c2A = r(3:6:end);
    r_c3A = r(4:6:end);
    r_c1B = r(5:6:end);
    r_c3B = r(6:6:end);

    % Encoder A was fed with InputA, followed by four termination bits, and
    % corresponding received bits for all of this are found in r_uA.
    % KEY FACT: Encoder A has Out0A, which means r_uA is viewed as a part of c
    r_c_boldA = [r_uA(:)';r_c1A(:)';r_c2A(:)';r_c3A(:)'];

    % Encoder B was fed with interleaved InputA, but the entire InputB was not
    % part of the transmission, so we don't have to re-create it here.
    % KEY FACT: Encoder B doesn't have Out0B, so its not found in its c
    r_c_boldB = [r_c1B(:)';r_c3B(:)'];

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Re-format the received channel outputs. Both r_c_boldA and r_c_boldB are
% n0-by-time matrices, meaning that the first dimension corresponds to the
% number of code bits per time step (n0) and the second dimension is the number
% of time steps. There are MC = 2^n0 possible values that the code bits can
% assume. We simply need to enumerate these MC possible values, and then convert
% the vector of n0 bit-based soft values into MC symbol-based soft values. We
% need the antipodal version of c_bold, called a_bold to do this.

% The alphabet of C is simply decimal values from 0 to 2^n0A-1.
n0A = size(r_c_boldA,1);
C_alphabetA = [0:2^n0A-1]';
% We will decompose each decimal value into a vector of binary values, which
% results in a MC-by-n0 matrix of 0's and 1's. This dec-to-bin conversion
% establishes a MSB-LSB convention that that must be observed again in a moment.
c_bold_alphabetA = de2bi([0:2^n0A-1]', 'left-msb');

% We need the antipodal version of this matrix, full of -1's and +1's
a_bold_alphabetA = 2*c_bold_alphabetA - 1;
% To convert the bit-based soft values to symbol-based, we simply do a
% vector-vector dot product of the antipodal bits and the bit-based soft values.
% Because a_bold_alphabet is MC-by-n0, and the received matrix is n0-by-time,
% the matrix-matrix product of this is perfect for the job, and results in a
% matrix that is MC-by-time:
P_CI_A = a_bold_alphabetA*r_c_boldA/2; % The /2 is part of the "unpackaging"
% The last thing we need to do is convert the ec_bold trellis table from being
% bit-based to symbol-based, using the same MSB-LSB convention used above:
eCA = ec_boldA*2.^[n0A-1:-1:0]';

% Repeat the above for Encoder B:
n0B = size(r_c_boldB,1);
C_alphabetB = [0:2^n0B-1]';
c_bold_alphabetB = de2bi([0:2^n0B-1]', 'left-msb');
a_bold_alphabetB = 2*c_bold_alphabetB - 1;
P_CI_B = a_bold_alphabetB*r_c_boldB/2; % The /2 is part of the "unpackaging"
eCB = ec_boldB*2.^[n0B-1:-1:0]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.ALL;
USE work.Semco_pkg.ALL;

ENTITY DecodeTurboInit IS
      Port (
         Clk,
         reset,
         ce,
         ValidIn     : IN  std_logic;
         DeRand      : IN  SfixPci;
         Rate        : IN  integer range 0 to 6;
         ValidOut    : OUT std_logic;
         PCIA        : OUT SFIX_PCI_ARRAY(0 to 15);
         PCIB        : OUT SFIX_PCI_ARRAY(0 to 3);
         eCA,
         eCB         : OUT UINT4_ARRAY(0 to 31)
   );
END DecodeTurboInit;


ARCHITECTURE rtl OF DecodeTurboInit IS

   -- constant
   constant  ZERO       : SfixPci := (others=>'0');
   -- Signals
   signal   rReg        : SFIX_PCI_ARRAY(0 to 5);
   signal   rAcc        : SFIX_PCI_ARRAY(0 to 15);
   signal   RateCntr    : natural range 0 to 5;
   signal   FirstRound,
            Rate2Phase  : std_logic;
   signal   OldRate     : integer range 0 to 6 := 0;

BEGIN

  Delay_process: process (Clk)
   begin
      if (rising_edge(Clk)) then
         if ( (Rate /= OldRate) or (reset = '1') ) then
            RateCntr   <= 0;
            OldRate    <= Rate;
            rReg       <= (others=>(others=>'0'));
            PCIA       <= (others=>(others=>'0'));
            PCIB       <= (others=>(others=>'0'));
            FirstRound <= '0';
            Rate2Phase <= '1';
            ValidOut   <= '0';
         elsif (ce) then
            if (ValidIn) then
               if (RateCntr < Rate-1) then
                  RateCntr <= RateCntr + 1;
               else
                  RateCntr <= 0;
               end if;
               rReg(RateCntr) <= DeRand;
               -- compute P_CI's
               case (RateCntr) is
                  when 0 =>
                     rAcc(0)  <= resize(-DeRand, rAcc(0) );
                     rAcc(1)  <= resize(-DeRand, rAcc(1) );
                     rAcc(2)  <= resize(-DeRand, rAcc(2) );
                     rAcc(3)  <= resize(-DeRand, rAcc(3) );
                     rAcc(4)  <= resize(-DeRand, rAcc(4) );
                     rAcc(5)  <= resize(-DeRand, rAcc(5) );
                     rAcc(6)  <= resize(-DeRand, rAcc(6) );
                     rAcc(7)  <= resize(-DeRand, rAcc(7) );
                     rAcc(8)  <= resize( DeRand, rAcc(8) );
                     rAcc(9)  <= resize( DeRand, rAcc(9) );
                     rAcc(10) <= resize( DeRand, rAcc(10));
                     rAcc(11) <= resize( DeRand, rAcc(11));
                     rAcc(12) <= resize( DeRand, rAcc(12));
                     rAcc(13) <= resize( DeRand, rAcc(13));
                     rAcc(14) <= resize( DeRand, rAcc(14));
                     rAcc(15) <= resize( DeRand, rAcc(15));
                  when 1 =>
                     rAcc(0)  <= resize(rAcc(0)  - DeRand, rAcc(0) );
                     rAcc(1)  <= resize(rAcc(1)  - DeRand, rAcc(1) );
                     rAcc(2)  <= resize(rAcc(2)  - DeRand, rAcc(2) );
                     rAcc(3)  <= resize(rAcc(3)  - DeRand, rAcc(3) );
                     rAcc(4)  <= resize(rAcc(4)  + DeRand, rAcc(4) );
                     rAcc(5)  <= resize(rAcc(5)  + DeRand, rAcc(5) );
                     rAcc(6)  <= resize(rAcc(6)  + DeRand, rAcc(6) );
                     rAcc(7)  <= resize(rAcc(7)  + DeRand, rAcc(7) );
                     rAcc(8)  <= resize(rAcc(8)  - DeRand, rAcc(8) );
                     rAcc(9)  <= resize(rAcc(9)  - DeRand, rAcc(9) );
                     rAcc(10) <= resize(rAcc(10) - DeRand, rAcc(10));
                     rAcc(11) <= resize(rAcc(11) - DeRand, rAcc(11));
                     rAcc(12) <= resize(rAcc(12) + DeRand, rAcc(12));
                     rAcc(13) <= resize(rAcc(13) + DeRand, rAcc(13));
                     rAcc(14) <= resize(rAcc(14) + DeRand, rAcc(14));
                     rAcc(15) <= resize(rAcc(15) + DeRand, rAcc(15));
                  when 2 =>
                     rAcc(0)  <= resize(rAcc(0)  - DeRand, rAcc(0) );
                     rAcc(1)  <= resize(rAcc(1)  - DeRand, rAcc(1) );
                     rAcc(2)  <= resize(rAcc(2)  + DeRand, rAcc(2) );
                     rAcc(3)  <= resize(rAcc(3)  + DeRand, rAcc(3) );
                     rAcc(4)  <= resize(rAcc(4)  - DeRand, rAcc(4) );
                     rAcc(5)  <= resize(rAcc(5)  - DeRand, rAcc(5) );
                     rAcc(6)  <= resize(rAcc(6)  + DeRand, rAcc(6) );
                     rAcc(7)  <= resize(rAcc(7)  + DeRand, rAcc(7) );
                     rAcc(8)  <= resize(rAcc(8)  - DeRand, rAcc(8) );
                     rAcc(9)  <= resize(rAcc(9)  - DeRand, rAcc(9) );
                     rAcc(10) <= resize(rAcc(10) + DeRand, rAcc(10));
                     rAcc(11) <= resize(rAcc(11) + DeRand, rAcc(11));
                     rAcc(12) <= resize(rAcc(12) - DeRand, rAcc(12));
                     rAcc(13) <= resize(rAcc(13) - DeRand, rAcc(13));
                     rAcc(14) <= resize(rAcc(14) + DeRand, rAcc(14));
                     rAcc(15) <= resize(rAcc(15) + DeRand, rAcc(15));
                  when 3 =>
                     If (Rate =  6) then
                        rAcc(0)  <= resize(rAcc(0)  - DeRand, rAcc(0) );
                        rAcc(1)  <= resize(rAcc(1)  + DeRand, rAcc(1) );
                        rAcc(2)  <= resize(rAcc(2)  - DeRand, rAcc(2) );
                        rAcc(3)  <= resize(rAcc(3)  + DeRand, rAcc(3) );
                        rAcc(4)  <= resize(rAcc(4)  - DeRand, rAcc(4) );
                        rAcc(5)  <= resize(rAcc(5)  + DeRand, rAcc(5) );
                        rAcc(6)  <= resize(rAcc(6)  - DeRand, rAcc(6) );
                        rAcc(7)  <= resize(rAcc(7)  + DeRand, rAcc(7) );
                        rAcc(8)  <= resize(rAcc(8)  - DeRand, rAcc(8) );
                        rAcc(9)  <= resize(rAcc(9)  + DeRand, rAcc(9) );
                        rAcc(10) <= resize(rAcc(10) - DeRand, rAcc(10));
                        rAcc(11) <= resize(rAcc(11) + DeRand, rAcc(11));
                        rAcc(12) <= resize(rAcc(12) - DeRand, rAcc(12));
                        rAcc(13) <= resize(rAcc(13) + DeRand, rAcc(13));
                        rAcc(14) <= resize(rAcc(14) - DeRand, rAcc(14));
                        rAcc(15) <= resize(rAcc(15) + DeRand, rAcc(15));
                     end if;
                  when others =>
               end case;
               if (RateCntr = 0) then
                  FirstRound <= '1';
                  ValidOut <= FirstRound;
                  /* Now take the N colimns of BoldA and multiply by the bitwise antipodal of 0 to 2^N-1
                  0  => 0000  => -1, -1, -1, -1
                  1  => 0001  => -1, -1, -1,  1
                  2  => 0010  => -1, -1,  1, -1
                  3  => 0011  => -1, -1,  1,  1
                  ...
                  15 => 1111  =>  1,  1,  1,  1

                  Then divide by 2
                  */
                  if (Rate = 2) then
                     /* Rate 2 data is split into two streams
                        Odd data into stream 1
                        Even data into stream 2 but every fourth sample is set to 0 to depuncture
                     */
                     if (not Rate2Phase) then
                        PCIA(0)  <= resize((-rReg(0) - rReg(1)) / 2, ZERO, fixed_wrap, fixed_truncate);
                        PCIA(1)  <= resize((-rReg(0) + rReg(1)) / 2, ZERO, fixed_wrap, fixed_truncate);
                        PCIA(2)  <= resize(( rReg(0) - rReg(1)) / 2, ZERO, fixed_wrap, fixed_truncate);
                        PCIA(3)  <= resize(( rReg(0) + rReg(1)) / 2, ZERO, fixed_wrap, fixed_truncate);
                        PCIB(0)  <= ZERO;
                        PCIB(1)  <= ZERO;
                     else
                        PCIA(0)  <= resize( -rReg(0) / 2, ZERO, fixed_wrap, fixed_truncate);
                        PCIA(1)  <= resize( -rReg(0) / 2, ZERO, fixed_wrap, fixed_truncate);
                        PCIA(2)  <= resize(  rReg(0) / 2, ZERO, fixed_wrap, fixed_truncate);
                        PCIA(3)  <= resize(  rReg(0) / 2, ZERO, fixed_wrap, fixed_truncate);
                        PCIB(0)  <= resize( -rReg(1) / 2, ZERO, fixed_wrap, fixed_truncate);
                        PCIB(1)  <= resize(  rReg(1) / 2, ZERO, fixed_wrap, fixed_truncate);
                     end if;
                     PCIA(4)  <= ZERO;
                     PCIA(5)  <= ZERO;
                     PCIA(6)  <= ZERO;
                     PCIA(7)  <= ZERO;
                     PCIA(8)  <= ZERO;
                     PCIA(9)  <= ZERO;
                     PCIA(10) <= ZERO;
                     PCIA(11) <= ZERO;
                     PCIA(12) <= ZERO;
                     PCIA(13) <= ZERO;
                     PCIA(14) <= ZERO;
                     PCIA(15) <= ZERO;
                     PCIB(2)  <= ZERO;
                     PCIB(3)  <= ZERO;
                     eCA         <= (x"0", x"3", x"1", x"2", x"0", x"3", x"1", x"2",
                                     x"0", x"3", x"1", x"2", x"0", x"3", x"1", x"2",
                                     x"0", x"3", x"1", x"2", x"0", x"3", x"1", x"2",
                                     x"0", x"3", x"1", x"2", x"0", x"3", x"1", x"2");
                     eCB         <= (x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0",
                                     x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0",
                                     x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0",
                                     x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0");
                     Rate2Phase <= not Rate2Phase;
                  elsif (Rate = 3) then
                  /* Rate 3 data is broken into BoldA and BoldB but BoldA is actually two streams wide
                     Input         r_c_Bolda          r_c_BoldB
                     -0.997      -0.997   -1.015     -0.598
                     -1.015       0.936    1.464     -1.034
                     -0.598       0.604   -1.197      0.086
                      0.936      -0.672    1.284     -0.779
                      1.464
                     -1.034
                      0.604
                 */
                     PCIA(0)  <= resize((-rReg(0) - rReg(1)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(1)  <= resize((-rReg(0) + rReg(1)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(2)  <= resize(( rReg(0) - rReg(1)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(3)  <= resize(( rReg(0) + rReg(1)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(4)  <= ZERO;
                     PCIA(5)  <= ZERO;
                     PCIA(6)  <= ZERO;
                     PCIA(7)  <= ZERO;
                     PCIA(8)  <= ZERO;
                     PCIA(9)  <= ZERO;
                     PCIA(10) <= ZERO;
                     PCIA(11) <= ZERO;
                     PCIA(12) <= ZERO;
                     PCIA(13) <= ZERO;
                     PCIA(14) <= ZERO;
                     PCIA(15) <= ZERO;
                     PCIB(0)  <= resize(-rReg(2) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIB(1)  <= resize( rReg(2) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIB(2)  <= ZERO;
                     PCIB(3)  <= ZERO;
                     eCA         <= (x"0", x"3", x"1", x"2", x"0", x"3", x"1", x"2",
                                     x"0", x"3", x"1", x"2", x"0", x"3", x"1", x"2",
                                     x"0", x"3", x"1", x"2", x"0", x"3", x"1", x"2",
                                     x"0", x"3", x"1", x"2", x"0", x"3", x"1", x"2");
                     eCB         <= (x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0",
                                     x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0",
                                     x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0",
                                     x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0");
                  elsif (Rate = 4) then
                     /* Rate 4 data is broken into BoldA and BoldB but BoldA is actually three streams wide
                        Input       r_c_Bolda               r_c_BoldB
                         1.150     1.150  0.710  1.683     -0.475
                         0.710    -0.962 -1.320 -0.166     -1.883
                         1.683     0.800 -1.058 -0.785      2.024
                        -0.475
                        -0.962
                        -1.320
                        -0.166
                        -1.883
                         0.800
                      */
                     PCIA(0)  <= resize(rAcc(0)  / 2, ZERO, fixed_wrap, fixed_truncate); -- resize((-rReg(0) - rReg(1) - rReg(2)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(1)  <= resize(rAcc(2)  / 2, ZERO, fixed_wrap, fixed_truncate); -- resize((-rReg(0) - rReg(1) + rReg(2)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(2)  <= resize(rAcc(4)  / 2, ZERO, fixed_wrap, fixed_truncate); -- resize((-rReg(0) + rReg(1) - rReg(2)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(3)  <= resize(rAcc(6)  / 2, ZERO, fixed_wrap, fixed_truncate); -- resize((-rReg(0) + rReg(1) + rReg(2)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(4)  <= resize(rAcc(8)  / 2, ZERO, fixed_wrap, fixed_truncate); -- resize(( rReg(0) - rReg(1) - rReg(2)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(5)  <= resize(rAcc(10) / 2, ZERO, fixed_wrap, fixed_truncate); -- resize(( rReg(0) - rReg(1) + rReg(2)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(6)  <= resize(rAcc(12) / 2, ZERO, fixed_wrap, fixed_truncate); -- resize(( rReg(0) + rReg(1) - rReg(2)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(7)  <= resize(rAcc(14) / 2, ZERO, fixed_wrap, fixed_truncate); -- resize(( rReg(0) + rReg(1) + rReg(2)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(8)  <= ZERO;
                     PCIA(9)  <= ZERO;
                     PCIA(10) <= ZERO;
                     PCIA(11) <= ZERO;
                     PCIA(12) <= ZERO;
                     PCIA(13) <= ZERO;
                     PCIA(14) <= ZERO;
                     PCIA(15) <= ZERO;
                     PCIB(0)  <= resize(-rReg(3) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIB(1)  <= resize( rReg(3) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIB(2)  <= ZERO;
                     PCIB(3)  <= ZERO;
                     eCA         <= (x"0", x"7", x"1", x"6", x"3", x"4", x"2", x"5",
                                     x"2", x"5", x"3", x"4", x"1", x"6", x"0", x"7",
                                     x"0", x"7", x"1", x"6", x"3", x"4", x"2", x"5",
                                     x"2", x"5", x"3", x"4", x"1", x"6", x"0", x"7");
                     eCB         <= (x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0",
                                     x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0",
                                     x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0",
                                     x"0", x"1", x"1", x"0", x"0", x"1", x"1", x"0");
                  else
                     /* Rate 6 data is broken into BoldA and BoldB but BoldA is four streams wide and BoldB is two streams
                     Input       r_c_Bolda                            r_c_BoldB
                     -1.455      -1.455  -0.729  -1.143  -2.194       -1.339  -1.240
                     -0.729       1.505   1.163   1.934   0.761        1.076   1.792
                     -1.143       1.786  -0.704  -0.199  -1.344        1.743   2.111
                     -2.194
                     -1.339
                     -1.240
                      1.505
                      1.163
                      1.934
                      0.761
                      1.076
                      1.792
                      1.786
                      */
                     PCIA(0)  <= resize(rAcc(0)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize((-rReg(0) - rReg(1) - rReg(2) - rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(1)  <= resize(rAcc(1)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize((-rReg(0) - rReg(1) - rReg(2) + rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(2)  <= resize(rAcc(2)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize((-rReg(0) - rReg(1) + rReg(2) - rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(3)  <= resize(rAcc(3)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize((-rReg(0) - rReg(1) + rReg(2) + rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(4)  <= resize(rAcc(4)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize((-rReg(0) + rReg(1) - rReg(2) - rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(5)  <= resize(rAcc(5)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize((-rReg(0) + rReg(1) - rReg(2) + rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(6)  <= resize(rAcc(6)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize((-rReg(0) + rReg(1) + rReg(2) - rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(7)  <= resize(rAcc(7)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize((-rReg(0) + rReg(1) + rReg(2) + rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(8)  <= resize(rAcc(8)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize(( rReg(0) - rReg(1) - rReg(2) - rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(9)  <= resize(rAcc(9)  / 2, ZERO, fixed_wrap, fixed_truncate); --resize(( rReg(0) - rReg(1) - rReg(2) + rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(10) <= resize(rAcc(10) / 2, ZERO, fixed_wrap, fixed_truncate); --resize(( rReg(0) - rReg(1) + rReg(2) - rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(11) <= resize(rAcc(11) / 2, ZERO, fixed_wrap, fixed_truncate); --resize(( rReg(0) - rReg(1) + rReg(2) + rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(12) <= resize(rAcc(12) / 2, ZERO, fixed_wrap, fixed_truncate); --resize(( rReg(0) + rReg(1) - rReg(2) - rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(13) <= resize(rAcc(13) / 2, ZERO, fixed_wrap, fixed_truncate); --resize(( rReg(0) + rReg(1) - rReg(2) + rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(14) <= resize(rAcc(14) / 2, ZERO, fixed_wrap, fixed_truncate); --resize(( rReg(0) + rReg(1) + rReg(2) - rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIA(15) <= resize(rAcc(15) / 2, ZERO, fixed_wrap, fixed_truncate); --resize(( rReg(0) + rReg(1) + rReg(2) + rReg(3)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIB(0)  <= resize((-rReg(4) - rReg(5)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIB(1)  <= resize((-rReg(4) + rReg(5)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIB(2)  <= resize(( rReg(4) - rReg(5)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     PCIB(3)  <= resize(( rReg(4) + rReg(5)) / 2, ZERO, fixed_wrap, fixed_truncate);
                     eCA         <= (x"0", x"F", x"5", x"A", x"3", x"C", x"6", x"9",
                                     x"2", x"D", x"7", x"8", x"1", x"E", x"4", x"B",
                                     x"0", x"F", x"5", x"A", x"3", x"C", x"6", x"9",
                                     x"2", x"D", x"7", x"8", x"1", x"E", x"4", x"B");
                     eCB         <= (x"0", x"3", x"3", x"0", x"1", x"2", x"2", x"1",
                                     x"0", x"3", x"3", x"0", x"1", x"2", x"2", x"1",
                                     x"0", x"3", x"3", x"0", x"1", x"2", x"2", x"1",
                                     x"0", x"3", x"3", x"0", x"1", x"2", x"2", x"1");
                  end if;
               else
                  ValidOut <= '0';
               end if;
            else
               ValidOut <= '0';
            end if;
         end if;
      end if;
   end process Delay_process;

END rtl;

