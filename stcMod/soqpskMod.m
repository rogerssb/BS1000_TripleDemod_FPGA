writeFile = 0;

% Generate the SOQPSK frequency pulse

samplesPerSymbol = 1;
samplesPerTernarySymbol = 4*samplesPerSymbol;

fs = samplesPerTernarySymbol;
fn = fs/2;

% SOQPSK Parameters
T1 = 1.5;
T2 = 0.5;
T1PlusT2 = T1 + T2; 
rho = 0.7;
B = 1.25;

% time vector normalized by the symbol period spaced at the sample rate
Ts = 1/samplesPerTernarySymbol;
tNorm = -T1PlusT2 : Ts : T1PlusT2; 
tT1Norm = -T1:1/samplesPerTernarySymbol:T1;

cpiece = cos(pi*rho*B*tNorm) ./ (1 - 4*((rho*B*tNorm).^2));
spiece = sinc(B*tNorm);

% Create the frequency pulse normalized
midpoint = (length(tNorm) + 1)/2;
win = zeros(1,length(tNorm));
win = 0.5 + 0.5*cos(pi*(tNorm - T1)/T2);
win(round(tT1Norm.*samplesPerTernarySymbol + midpoint)) = 1;
g = win .* cpiece .* spiece;

dcGain = sum(g);
% Normally we would scale for 0.5 area under the curve but we plan to drive
% this with 0.5 impulses
%gainAdjust = 1/(2*dcGain);
gainAdjust = 1/(dcGain);
g = g*gainAdjust;

%figure;
%plot(cpiece, '0*');
%hold on;
%plot(spiece, '1*');
%plot(win, '2*');
%plot(g, '3*');
%hold off;

g = floor(g*1024+0.5);

[Hg,w] = freqz(g,1,2048,fs);
Hg = Hg + 1e-6;
figure(1);
hold off
plot(w,20*log10(abs(Hg)/max(abs(Hg))),'r'),grid
axis([0 fs/2 -90 10]);

if writeFile == 1
    fid = fopen('soqpskMod.coe','w');
    fprintf(fid,'radix=10;\n');
    fprintf(fid,'coefdata=\n');
    fprintf(fid,'%d,\n',g);
    fclose(fid);
end

% Create three symbol sequences
wx = 1;
symSpacing = 2; %samples
midpoint = (length(g) + 1)/2 + symSpacing;
waveform = zeros(3^3,length(g) + 2*symSpacing);
symSet = [0 1 -1];
for sym0 = symSet
    for sym1 = symSet
        for sym2 = symSet
            waveform(wx,:) = [(sym0 .* g) zeros(1,2*symSpacing)] ...
                         + [zeros(1,symSpacing) (sym1 .* g) zeros(1,symSpacing)] ...
                         + [zeros(1,2*symSpacing) (sym2 .* g)];
            wx = wx + 1;
        end
    end
end

% Extract the middle three samples
mfSamples = zeros(27,3);
mfSamples(:) = waveform(:,midpoint-symSpacing:symSpacing:midpoint+symSpacing);
mfSamples = mfSamples/max(max(mfSamples));
%mfSamples = floor(mfSamples*2+0.5);
