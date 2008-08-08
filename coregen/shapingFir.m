fs = 1;   %sampling frequency
fn = fs/2;

writeFile = 1;

plotPoints = 8192;

taps = 9;
order = taps-1;
%bfilter = rcosfir(0.5,order/2,2,1/fn,'sqrt');
bfilter = rcosfir(0.5,order/2,2,1/fn);
dcGain = sum(bfilter);
gainAdjust = 2^(ceil(log2(dcGain)) - log2(dcGain));
bfilter = gainAdjust .* bfilter;
bfilter = round((2^8).*bfilter);

[Hb,w] = freqz(bfilter,1,plotPoints,fs);
Hb = Hb ./ max(Hb);
Hb = Hb + 1e-6;
plot(w,20*log10(abs(Hb)),'r'),grid

%axis([0 fn -90 10]);

if writeFile == 1
    fd = fopen('shapingFir.coe','w');
    fprintf(fd,'radix=10;\n');
    fprintf(fd,'coefdata=\n');
    fprintf(fd,'%d,\n',bfilter(1:(2*order)));
    fprintf(fd,'%d;\n',bfilter(2*taps-1));
    fclose(fd);
end

