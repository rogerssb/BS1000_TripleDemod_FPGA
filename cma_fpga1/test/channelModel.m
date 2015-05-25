fs = 1;
fn = fs/2;

taps = 5;
order = taps-1;

%cm = [1.0 0.0 0.0 0.6+j*0.6 0.0];
cm = [1.0 0.9 0.0 0.0 0.0];

t = -(taps-1)/2/fs:1/fs:(taps-1)/2/fs;
offset = 7/16;
cm = (cos(2*pi*offset*fs*t) + j*sin(2*pi*offset*fs*t)) .* cm;
cm = cm';

[H1,w1] = freqz(cm,1,512,fs,'whole');
H1 = H1 + 1e-8;
figure(1);
hold off;
plot(w1,20*log10(abs(H1)),'b'),grid
axis([0 1.0 -90 10]);

dcGain = sum(cm);
gainAdjust = 2^(ceil(log2(dcGain)) - log2(dcGain));
%cm = gainAdjust .* cm;
%cm = round((2^9).*cm);

[H1,w1] = freqz(cm,1,512,fs,'whole');
H1 = H1 ./ max(abs(H1));
H1 = H1 + 1e-8;
figure(1);
hold on;
plot(w1,20*log10(abs(H1)),'r'),grid

cm




