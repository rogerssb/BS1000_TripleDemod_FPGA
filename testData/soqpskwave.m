% soqpskwave.m - create a stimulus waveform for the sig gen

writeMatFile = 0;
writeTestVectors = 1;

% Samples per bit
U = 32;  

% Order of PN Sequency
O = 11;  

PHASE_ROLLOVER = 2;
NCYCLES=PHASE_ROLLOVER*4
NBITS = NCYCLES*(2^O-1)

bitsIn = pngen(O,NBITS);

lenBitsIn = length(bitsIn)

FeherDiffEncode = 1;
z = soqpskmod(bitsIn, U, 1, FeherDiffEncode);

% get the middle portion to avoid the startup and ending transistions
midSectionStart = PHASE_ROLLOVER*U*(2^O-1)
midSectionEnd = (NCYCLES-PHASE_ROLLOVER)*U*(2^O-1)

beginning = angle(z(midSectionStart-16:midSectionStart+16));
endz = angle(z(midSectionEnd-16:midSectionEnd+16));

figure;
plot(beginning, '*');
%figure;
%plot(middle, '*');
figure;
plot(endz, '*');

z = z(midSectionStart:midSectionEnd-1);

figure;
plot(angle(z(1:32)), '*');
figure;
plot(angle(z(end-32:end)), '*');

lenz = length(z)

beginingPhase = angle(z(1))
endingPhase = angle(z(end))

%figure;
%plot(angle(z), '*');

if (writeMatFile == 1) 
    fprintf('Generating soqpsk_pn%d.mat\n', O);
    title = sprintf('soqpsk_pn%d.mat', O);
    I=real(z);
    Q=imag(z);
    Marker = zeros(1, length(z));
    Marker(1) = 1;
    save(title, 'I', 'Q', 'Marker', '-mat');
    IT = I';
    QT = Q';
end

if writeTestVectors == 1
    z = z .* exp(-j*2*pi*(1:length(z))/4);
    realz = real(z);
    save('soqpskTestData.txt','realz','-ascii');
end

