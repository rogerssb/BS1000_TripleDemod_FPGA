%  pcmfmwave.m - create a stimulus waveform for test bench

writeMatFile = 0;
writeTestVectors = 1;

% Samples per symbol
U = 3;

% Order of the pn sequence
O= 6;

% Mod Index
h=14/20;

% Number of times to cycle through the PN sequence
NCYCLES=20*4;

% Number of bits to generate
NBITS = NCYCLES*(2^O-1)

bitsIn = pngen(O,NBITS);

lenBitsIn = length(bitsIn)

z = pcmfmmod(bitsIn, U, h);

% get the middle portion to avoid the startup and ending transistions
midSectionStart = 20*U*(2^O-1)
midSectionEnd = (NCYCLES-20)*U*(2^O-1)

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

beginningPhase = angle(z(1))
endingPhase = angle(z(end))

%figure;
%plot(angle(z), '*');

if writeMatFile == 1
    printf('Generating pcmfm_pn%d_h%1.2f.mat\n', O, h);
    title = sprintf('pcmfm_pn%d_h%1.2f.mat', O, h);
    I=real(z);
    Q=imag(z);
    Marker = zeros(1, length(z));
    Marker(1) = 1;
    save('-mat-binary', title, 'I', 'Q', 'Marker');
end

if writeTestVectors == 1
    z = z .* exp(-j*2*pi*(1:length(z))/4);
    realz = real(z);
    save('pcmfmTestData_3sps.txt','realz','-ascii');
end