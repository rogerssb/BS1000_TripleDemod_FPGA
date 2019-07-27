% ldpcSyncWave.m - create a stimulus waveform for the sig gen

writeMatFile = 0;
writeTestVectors = 1;

% Carrier phase offset
phaseOffset = 1*pi/2;

% Samples per bit
U = 16;  

% Length of syncword
syncLength = 64;  

% Constants for extracting a cyclic waveform
PHASE_ROLLOVER = 2;
NCYCLES = PHASE_ROLLOVER * 6;
OFFSET_BITS = -256;

syncBits = [ 1 1 1 1    1 1 0 0     1 0 1 1     1 0 0 0 ...
             1 0 0 0    1 0 0 1     0 0 1 1     1 0 0 0 ...
             1 1 0 1    1 0 0 0     1 1 0 1     0 1 1 1 ...
             0 1 1 0    1 0 1 0     0 1 0 0     1 1 1 1 ]; 
payloadBits = pngen(11,20*64);

bitsIn = [syncBits payloadBits];
patternLength = length(bitsIn);
for i = 2:NCYCLES
    bitsIn = [bitsIn [syncBits payloadBits]];
end
lenBitsIn = length(bitsIn)
NBITS = lenBitsIn

FeherDiffEncode = 0;
z = soqpskmod(bitsIn, U, 1, FeherDiffEncode);

% get the middle portion to avoid the startup and ending transistions
midSectionStart = PHASE_ROLLOVER*U*patternLength + OFFSET_BITS*U;
midSectionEnd = (NCYCLES-PHASE_ROLLOVER)*U*patternLength + OFFSET_BITS*U

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
    fprintf('Generating ldpcSyncWaveform.mat\n', O);
    title = sprintf('ldpcSyncWaveform.mat', O);
    I=real(z);
    Q=imag(z);
    Marker = zeros(1, length(z));
    Marker(1) = 1;
    save(title, 'I', 'Q', 'Marker', '-mat');
    IT = I';
    QT = Q';
end

if writeTestVectors == 1
    z = z .* exp(-j*(2*pi*(1:length(z))/4 + phaseOffset));
    realz = real(z);
    save('ldpcSyncWaveform.txt','realz','-ascii');
end

