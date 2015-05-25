# Generate the SOQPSK frequency pulse

samplesPerSymbol = 1;
samplesPerTernarySymbol = 2*samplesPerSymbol;

% SOQPSK Parameters
T1 = 1.5;
T2 = 0.5;
T1PlusT2 = T1 + T2; 
rho = 0.7;
B = 1.25;

% time vector normalized by the symbol period spaced at the sample rate
tNorm = -T1PlusT2 : 1/samplesPerTernarySymbol : T1PlusT2; 
tT1Norm = -T1:1/samplesPerTernarySymbol:T1;

cpiece = cos(pi*rho*B*tNorm) ./ (1 - 4*((rho*B*tNorm).^2));
spiece = sinc(B*tNorm);

% Create the frequency pulse normalized
midPoint = (length(tNorm) + 1)/2;
win = zeros(1,length(tNorm));
win = 0.5 + 0.5*cos(pi*(tNorm - T1)/T2);
win(round(tT1Norm.*samplesPerTernarySymbol + midPoint)) = 1;

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
g
g = floor(g*1024+0.5)

fid = fopen('soqpskMod.coe','w');
fprintf(fid,'radix=10;\n');
fprintf(fid,'coefdata=\n');
fprintf(fid,'%d,\n',g);
fclose(fid);



