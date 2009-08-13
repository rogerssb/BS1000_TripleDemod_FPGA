fnco = 2;
fbit = 2;
fsym = fbit/2;
samplesPerSymbol = 2;
samplesPerTernarySymbol = 1;
fs = samplesPerSymbol*fsym;
fn = fs/2;

% SOQPSK Parameters
T1 = 1.5;
T2 = 0.5;
T1PlusT2 = T1 + T2; 
rho = 0.7;
beta = 1.25;

% time vector normalized by the symbol period spaced at the sample rate
tNorm = -T1PlusT2 : 1/samplesPerTernarySymbol : T1PlusT2; 

% Create the frequency pulse normalized
midPoint = (length(tNorm) + 1)/2;
win = zeros(1,length(tNorm));
win((-T1:1/samplesPerTernarySymbol:T1).*samplesPerTernarySymbol + midPoint) = 1;
win((-T1:-1/samplesPerTernarySymbol:-T1PlusT2).*samplesPerTernarySymbol + midPoint) = 0.5 + 0.5*cos(pi*((T1:1/samplesPerTernarySymbol:T1PlusT2) - T1)/T2);
win((T1:1/samplesPerTernarySymbol:T1PlusT2).*samplesPerTernarySymbol + midPoint) = 0.5 + 0.5*cos(pi*((T1:1/samplesPerTernarySymbol:T1PlusT2) - T1)/T2);
bfilter = win .* cos(pi*rho*beta*tNorm) ./ (1 - 4*((rho*beta*tNorm).^2)) .* sinc(beta*tNorm);
dcGain = sum(bfilter)/fs;
gainAdjust = pi/2/dcGain;
bfilter = gainAdjust .* bfilter;


