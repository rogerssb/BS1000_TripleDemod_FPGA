fs = 1;
fn = fs/2;

taps = 35;
order = taps-1;

writeFile == 0;

delta = 0.05;
qf = remez(order,[0 0.25-delta 0.25+delta 0.5]/fn,[1 1 0 0]);

[H1,w1] = freqz(qf,1,512,1);
[p1,w1] = phasez(qf,1,512,1);
H1 = H1 + 1e-8;
figure(1);
hold off;
plot(w1,20*log10(abs(H1)),'b'),grid
axis([0 0.5 -90 10]);

dcGain = sum(qf);
gainAdjust = 2^(ceil(log2(dcGain)) - log2(dcGain));
qf = gainAdjust .* qf;
qf = round((2^9).*qf);

evenSum = sum(qf(1:2:order/2))


[H1,w1] = freqz(qf,1,512,1);
H1 = H1 ./ max(abs(H1));
H1 = H1 + 1e-8;
figure(1);
hold on;
plot(w1,20*log10(abs(H1)),'r'),grid


if writeFile==1
    fid = fopen('halfbandEven.coe','w');
    fprintf(fid,'radix=10;\n');
    fprintf(fid,'coefdata=\n');
    fprintf(fid,'%d,\n',qf(1:2:taps-2));
    fprintf(fid,'%d;\n',qf(taps));
    fclose(fid);
end



