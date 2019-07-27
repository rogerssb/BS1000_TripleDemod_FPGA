% ldpcTestPattern.m - create baseband I/Q for testLdpcDecoder.v using a fixed codeword

writeTestVectors = 1;

% Codeword samples
load 'txcodeword.mat';

% Length of syncword
syncLength = 64;  

% LDPC parameters
codeRate = 4/5;
infoBitsPerCodeword = 1024;
codewordBits = infoBitsPerCodeword/codeRate;
parityBits = codewordBits - infoBitsPerCodeword;


% Constants for extracting a cyclic waveform
bitsPerFrame = syncLength + codewordBits;
frames = 32;

syncBits = [ 1 1 1 1    1 1 0 0     1 0 1 1     1 0 0 0 ...
             1 0 0 0    1 0 0 1     0 0 1 1     1 0 0 0 ...
             1 1 0 1    1 0 0 0     1 1 0 1     0 1 1 1 ...
             0 1 1 0    1 0 1 0     0 1 0 0     1 1 1 1 ]; 
frameBits = [ syncBits not(TxCodeWord)' ];
frameMatrix = ones(frames,1) * frameBits;

frameMatrix = (frameMatrix - 0.5);

if writeTestVectors == 1
    testBits = reshape(frameMatrix',[1 bitsPerFrame*frames]);
    iData = downsample(testBits,2,0);
    iData = upsample(iData,2,0);
    qData = downsample(testBits,2,1);
    qData = upsample(qData,2,1);
    save('ldpcTestPattern_I_1024_4_5.txt','iData','-ascii');
    save('ldpcTestPattern_Q_1024_4_5.txt','qData','-ascii');
end


