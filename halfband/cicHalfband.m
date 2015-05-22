% /******************************************************************************
% Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved
% 
% This source code is the Intellectual Property of Koos Technical Services,Inc. 
% (KTS) and is provided under a License Agreement which protects KTS' ownership and
% derivative rights in exchange for negotiated compensation.
% ******************************************************************************/

fs = 2916667/2;   %sampling frequency in Hz
fn = fs/2;

R = 1;      % Decimation
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
Hc = Hc ./ abs(Hc(1));
Hc = Hc + 1e-6;
figure(1);
hold on
plot(w,20*log10(abs(Hc)),'g'),grid


% Post CIC halfband
taps = 35;
order = taps-1;
delta = 0.05;
bfilter = remez(order,2*[0 0.25-delta 0.25+delta 0.5],[1 1 0 0]);

[Hb,w] = freqz(bfilter,1,plotPoints/R,frs);
Hb = Hb ./ max(Hb);
Hb = Hb + 1e-8;
figure(1);
hold on
plot(w,20*log10(abs(Hb)),'r'),grid

% Post Halfband FIR
taps = 15;
order = taps-1;
%win = chebwin(taps,50);
%win = nuttallwin(taps);
win = kaiser(taps,7);
%win = blackman(taps);
%win = gausswin(taps);
%win = bohmanwin(taps);
%win = tukeywin(taps,0.7);
fc = 2*0.1;
bfilter = fir1(order,fc,win);

[Hf,wf] = freqz(bfilter,1,plotPoints/R/2,frs/2);
Hf = Hf ./ max(Hf);
Hf = Hf + 1e-6;
Hf = ones(plotPoints/R/2,1);
figure(1);
hold on
plot(wf,20*log10(abs(Hf)),'m'),grid



% Repeat the halfband response across the cic response
if R == 1
    Hsum = Hb .* [Hf ; Hf((plotPoints/2):-1:1)];
    Hdec = [Hsum ; Hsum(plotPoints:-1:1)];
    wdec = [w ; (w(plotPoints) + w(1:plotPoints))];
else
    Hsum = Hb .* Hc .* [Hf ; Hf((plotPoints/R/2):-1:1)];
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
    % Show the combined response
    Hcomb = 20*log10(abs(H)) + 20*log10(abs(Hdec));
    plot(wdec, Hcomb, 'k');
end

plot(wdec, 20*log10(abs(Hdec)),'b');



%axis([0 2*fn/R -10 10]);
axis([0 2*fn/R -90 10]);
%axis([0 fn -90 10]);

