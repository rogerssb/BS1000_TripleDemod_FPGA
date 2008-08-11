fs = 10000;   %sampling frequency in KHz
fn = fs/2;

R = 10;      % Decimation
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

% Post CIC filter
frs = fs/R;
frn = frs/2;

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
Hdec = Hb;
wdec = w;
for k = 2:R
    wdec = [wdec ; (w + (k-1)*frn)];
    if (2*floor(k/2) == k)
        Hdec = [Hdec ; Hb((plotPoints/R) : -1 : 1)];
    else
        Hdec = [Hdec ; Hb];    
    end
end

plot(wdec, 20*log10(abs(Hdec)),'b');


% Show the combined response
Hcomb = 20*log10(abs(H)) + 20*log10(abs(Hdec));
plot(wdec, Hcomb, 'r');

%axis([0 fn/R -90 10]);
axis([0 fn -90 10]);

