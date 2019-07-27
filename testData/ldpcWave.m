% ldpcWave.m - create a stimulus waveform for the sig gen

writeMatFile = 0;
writeTestVectors = 1;

% PN sequence order
pnOrder = 6;
pnLength = 2^pnOrder - 1;

% Carrier phase offset
phaseOffset = 2*pi/2;

% Samples per bit
if writeTestVectors
    U = 64;
else
    U = 4;  
end

% Length of syncword
syncLength = 64;  

% LDPC parameters
codeRate = 4/5;
infoBitsPerCodeword = 1024;
codewordBits = infoBitsPerCodeword/codeRate;
parityBits = codewordBits - infoBitsPerCodeword;


% Constants for extracting a cyclic waveform
bitsPerFrame = syncLength + codewordBits;
frames = pnLength;

% Offset to start grabbing soqpsk samples
OFFSET_BITS = bitsPerFrame - 384;


syncBits = [ 1 1 1 1    1 1 0 0     1 0 1 1     1 0 0 0 ...
             1 0 0 0    1 0 0 1     0 0 1 1     1 0 0 0 ...
             1 1 0 1    1 0 0 0     1 1 0 1     0 1 1 1 ...
             0 1 1 0    1 0 1 0     0 1 0 0     1 1 1 1 ]; 
syncMatrix = ones(frames,1) * syncBits;

% Create a frame per row of pn data
infoBits = cast(pngen(11,frames*infoBitsPerCodeword),'double');
infoMatrix = reshape(infoBits,[frames infoBitsPerCodeword]);

% LDPC encode each row
load W_ROW_ROM;
for i=1:frames
    codedMatrix(i,:) = LdpcEncoder1(infoMatrix(i,:),W_ROW_ROM,parityBits/8);
end


% Combine sync with payload
framedBits = [ syncMatrix codedMatrix];

% Add cyclic start and end frames
framedBits = [ syncBits   codedMatrix(frames,:) ;       ...
               syncMatrix codedMatrix ;                 ...
               syncBits   codedMatrix(1,:) ]; 

% Turn it back into a single row vector
framedBits = reshape(framedBits',[1 (frames+2)*bitsPerFrame]);

% SOQPSK Modulator
FeherDiffEncode = 0;
z = soqpskmod(framedBits, U, 1, FeherDiffEncode);

% get the middle portion to avoid the startup and ending transistions
midSectionStart = OFFSET_BITS*U;
midSectionEnd = midSectionStart + frames*bitsPerFrame*U;

beginning = angle(z(midSectionStart-16:midSectionStart+16));
endz = angle(z(midSectionEnd-16:midSectionEnd+16));

figure(1);
plot(beginning, '*');
%figure;
%plot(middle, '*');
figure(2);
plot(endz, '*');

z = z(midSectionStart:midSectionEnd-1);

figure(3);
plot(angle(z(1:32)), '*');
figure(4);
plot(angle(z(end-32:end)), '*');

lenz = length(z)

beginingPhase = angle(z(1))
endingPhase = angle(z(end))

%figure;
%plot(angle(z), '*');

if (writeMatFile == 1) 
    fprintf('Generating ldpcWaveform_1024_4_5.mat\n');
    title = sprintf('ldpcWaveform_1024_4_5.mat');
    I=real(z);
    Q=imag(z);
    save(title, 'I', 'Q', '-v6');
    IT = I';
    QT = Q';
end

if writeTestVectors == 1
    realz = real(z);
    imagz = imag(z);
    save('ldpcWaveformI_1024_4_5.txt','realz','-ascii');
    save('ldpcWaveformQ_1024_4_5.txt','imagz','-ascii');
    z = z .* exp(-j*(2*pi*(1:length(z))/4 + phaseOffset));
    realz = real(z);
    save('ldpcWaveform_1024_4_5.txt','realz','-ascii');
end


