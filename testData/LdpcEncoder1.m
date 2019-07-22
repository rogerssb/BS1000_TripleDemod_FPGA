function CodeBits = LdpcEncoder1(MessageBits,W_ROW_ROM,ShiftRegLen)

% LdpcEncoder1  LDPC encoder for the AR4JA LDPC codes developed by JPL
%    C = LdpcEncoder1(U,W_ROW_ROM,ShiftRegLen) returns the codeword C given
%    the information (message) bits U using the generator matrix rows
%    stored in W_ROW_ROM. Using a brute-force implementation, the codeword
%    is simply C = mod(U*G,2). In other words, the codeword C is simply the
%    result of a matrix-vector multiplication between U and G, where the
%    arithmetic is performed modulo-2 [i.e., the arithmetic is performed
%    "over GF(2)" using the language of forward error correction (FEC)
%    codes].
%
%    The only thing special about the implementation inside this function
%    is that it exploits the quasi-cyclic structure of the Accumulate-
%    Repeat-4-Jagged-Accumulate (AR4JA) LDPC codes that were developed at
%    NASA's Jet Propulsion Lab (JPL). The encoder consists of a set of
%    shift registers and a ROM. Each shift register has a length of
%    ShiftRegLen. A complete description of the AR4JA LDPC codes is found
%    in [1]. For LDPC codes, the generator matrix G can be very large and
%    very dense (meaning that it has a lot of 1's).  This implementation
%    minimizes the memory required to store the generator matrix, and it
%    also uses an architecture that is ready for a high-speed hardware
%    implementation.
%
%    This implementation (Implementation #1) was recommended in [1]. It
%    uses a row-based ROM. It processes the message bits one-by-one, and
%    produces the parity bits at the very end, all-at-once.
%
%
%    [1] Consultive Committee for Space Data Systems (CCSDS) Experimental
%    Specification CCSDS 131.1-O-2, "Low Density Parity Check Codes For Use
%    in Near-Earth and Deep Space Applications," September 2007.


%
% Written by Erik Perrins, 2016, esp@ieee.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

NumMsgBits   = length(MessageBits);
NumParBits   = size(W_ROW_ROM,2);
NumRowsInRom = size(W_ROW_ROM,1);
NumShiftRegs = size(W_ROW_ROM,2)/ShiftRegLen;

% Get ready to implement [1, Figure 3-2]. The end goal is to compute the parity
% bits.
MessagePointer = 1; % Remember that MATLAB indexes from one
ParityBits     = zeros(1, NumParBits);


% Loop on the number of rows in the ROM.
for RomRowIndex = 0:NumRowsInRom - 1
    
    % Grab the row of the ROM indexed by RomRowIndex and load it into the
    % shift registers (Remember to add one for the MATLAB index). We are
    % representing the shift registers as a ShiftRegLen-by-NumShiftRegs matrix.
    ShiftRegisters = reshape(W_ROW_ROM(RomRowIndex+1,:)',...
        ShiftRegLen, NumShiftRegs);

    % Loop through ShiftRegLen cyclic (barrel) shifts of the registers
    for ll = 0:ShiftRegLen-1
        
        % There are NumShiftRegs shift registers, we need to concatenate their
        % contents into one (very wide) vector.
        ConcatenatedContentsOfRegisters = ShiftRegisters(:)';
        
        % Multiply (AND) the concatenated contents of the shift registers with
        % the incoming message bit and add (XOR) them with the accumulated
        % parity bits, then store the result in the parity bit registers.
        ParityBits = mod(ParityBits + ...
            MessageBits(MessagePointer)*ConcatenatedContentsOfRegisters, 2);
        
        % Clock the cyclic (barrel) shift registers. The values at the BOTTOM
        % of the register matrix need to be placed at the TOP of the register
        % matrix.
        ShiftRegisters = [ShiftRegisters(end,:); ShiftRegisters(1:end-1,:)];

        % Increment the message pointer.
        MessagePointer = MessagePointer + 1;
    end
end


% Because this is a systematic code, we form the codeword by concatenating the
% parity bits at the end of the message bits.
CodeBits = [MessageBits,ParityBits];
