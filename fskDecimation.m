fs = 10000;   %sampling frequency in KHz
fn = fs/2;

R = 10;      % Decimation
N = 3;      % Order
M = 1;      % Differential Delay

plotPoints = R*1024;

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


% Halfband Filter
fhbs = fs/R;
fhbn = fhbs/2;

taps = 35;
order = taps-1;

delta = 0.05;
qf = remez(order,[0 0.25-delta 0.25+delta 0.5]/0.5,[1 1 0 0]);

[Hhb,w] = freqz(qf,1,plotPoints/R,fhbs);
Hhb = Hhb ./ max(Hhb);
Hhb = Hhb + 1e-6;
%figure(1);
%hold on
%plot(w,20*log10(abs(Hhb)),'r'),grid

Hdec = Hhb;
wdec = w;
for k = 2:R
    wdec = [wdec ; (w + (k-1)*fhbn)];
    if (2*floor(k/2) == k)
        Hdec = [Hdec ; Hhb((plotPoints/R) : -1 : 1)];
    else
        Hdec = [Hdec ; Hhb];    
    end
end

figure(1);
hold on
plot(wdec, 20*log10(abs(Hdec)),'b');
%axis([0 fn/R -90 10]);

% RRC Shaping filter
frs = fhbs/2;
frn = frs/2;

taps = 9;
order = taps-1;
%win = kaiser(taps,10);
%win = blackman(taps);
%bfilter = fir1(order,12800/R/frn,win);
%bfilter = rcosine(1024/R,frs,'sqrt',0.5,taps/2);
bfilter = rcosfir(0.5,order/2,2,1/frn,'sqrt');

[Hb,w] = freqz(bfilter,1,plotPoints/R/2,frs);
Hb = Hb ./ max(Hb);
Hb = Hb + 1e-6;

Hdec = Hb;
wdec = w;
for k = 2:2*R
    wdec = [wdec ; (w + (k-1)*frn)];
    if (2*floor(k/2) == k)
        Hdec = [Hdec ; Hb((plotPoints/R/2) : -1 : 1)];
    else
        Hdec = [Hdec ; Hb];    
    end
end

figure(1);
hold on
plot(wdec,20*log10(abs(Hdec)),'r'),grid




