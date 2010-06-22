fs = 1;
fn = fs/2;

plotPoints = 1024;

writeFile = 0;

taps = 11;
order = taps-1;
wc = 0.025:0.05:0.275;
gain = 1./abs(sinc(wc).^3);
wc = [0.025:0.05:0.475];
gain = [ gain(1:(length(gain)-1)) gain((length(gain)-1):-1:1)];
bfilter = remez(order,2*[wc],[gain]);

[Hc,w] = freqz(bfilter,1,plotPoints,fs);
Hc = Hc + 1e-6;
figure(1);
hold off
plot(w,20*log10(abs(Hc)),'r'),grid

dcGain = sum(bfilter);
gainAdjust = 2^(ceil(log2(dcGain)) - log2(dcGain) - 1);
bfilter = gainAdjust .* bfilter;
bfilter = round((2^17).*bfilter);

if writeFile == 1
    fid = fopen('cicCompCoefs.h','w');
    fprintf(fid,'parameter val0 = %d;\n',bfilter(2));
    fprintf(fid,'wire [17:0] coef0 = val0;\n');
    fprintf(fid,'parameter val1 = %d;\n',bfilter(4));
    fprintf(fid,'wire [17:0] coef1 = val1;\n');
    fprintf(fid,'parameter val2 = %d;\n',round(bfilter(6)/2));
    fprintf(fid,'wire [17:0] coef2 = val2;\n');
    fclose(fid);
end



