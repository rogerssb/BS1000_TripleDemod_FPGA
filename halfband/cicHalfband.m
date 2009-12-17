fs = 46667;   %sampling frequency in KHz
fn = fs/2;

R = 2;      % Decimation
N = 3;      % Order
M = 1;      % Differential Delay

plotPoints = 1024*R;

fstep = fn/plotPoints;
f = (fstep:fstep:fn)/fs;
num = sin(pi*R*M*f);
den = sin(pi*f);
H = (num./den).^N;

H = H';
H = H./max(H);
H = abs(H);
H = H + 1e-6;
dBH = 20*log10(H);
figure(1)
hold off
plot(f.*fs,dBH);

% Decimated sample rates
frs = fs/R;
frn = frs/2;

% CIC Compensation filter
taps = 11;
order = taps-1;
wc = 0.025:0.05:0.275;
gain = 1./abs(sinc(wc).^3);
wc = [0.025:0.05:0.475];
gain = [ gain(1:(length(gain)-1)) gain((length(gain)-1):-1:1)];
bfilter = remez(order,2*[wc],[gain]);

[Hc,w] = freqz(bfilter,1,plotPoints/R,frs);
% Hc = Hc ./ max(Hc);
Hc = Hc + 1e-6;
figure(1);
hold on
plot(w,20*log10(abs(Hc)),'g'),grid




% Post CIC halfband
taps = 17;
order = taps-1;
delta = 0.0625;
bfilter = remez(order,2*[0 0.25-delta 0.25+delta 0.5],[1 1 0 0]);

[Hb,w] = freqz(bfilter,1,plotPoints/R,frs);
Hb = Hb ./ max(Hb);
Hb = Hb + 1e-6;
figure(1);
hold on
plot(w,20*log10(abs(Hb)),'r'),grid

% Repeat the halfband response across the cic response
Hsum = Hb .* Hc;
% Hsum = Hc;
Hdec = Hsum;
wdec = w;
for k = 2:R
    wdec = [wdec ; (w + (k-1)*frn)];
    if (2*floor(k/2) == k)
        Hdec = [Hdec ; Hsum((plotPoints/R) : -1 : 1)];
    else
        Hdec = [Hdec ; Hsum];    
    end
end

plot(wdec, 20*log10(abs(Hdec)),'b');


% Show the combined response
Hcomb = 20*log10(abs(H)) + 20*log10(abs(Hdec));
plot(wdec, Hcomb, 'k');

axis([0 fn/R -90 10]);
%axis([0 fn -90 10]);

