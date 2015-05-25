% This generates the filter coefficients for the resampler. The resampler accepts an
% input sample rate, fi, between of 2*fo > fi > fo, where fo is the output sample rate.

ds = 9;         % ds = data spread, fir taps used for each delay
ip = 32;        % ip = interpolation points, number of delays available within a sample
taps = ds*ip;   % total taps
order = taps-1;

fi = ip;        % fi is normalized to ip;
fn = fi/2;
fc = 0.5/fn;

writeFile = 0;

%win = chebwin(taps,50);
%win = nuttallwin(taps);
win = kaiser(taps,9);
%win = blackman(taps);
%win = gausswin(taps);
%win = bohmanwin(taps);
%win = tukeywin(taps,0.7);
h = fir1(order,fc,win);

[H w] = freqz(h,1,1024,fi);
%H = H/max(abs(H));
H = H + 1e-8;

% This is the undecimated response of the interpolation filter
figure(1);
plot(w,20*log10(abs(H)),'r'),grid
axis([0 2 -90 10]);


% Build the decimated response of each filter
decimator = kron(ones(1,ds),eye(ip));
gain = h*decimator';

hold on;
for i = (ip-ip):(ip-1)
    g = downsample(h,ip,i);
    [G w] = freqz(g,1,10240,fi/ip);
    %G = G/max(abs(G));
    G = G + 1e-8;
    plot(w,20*log10(ip*abs(G)),'b');
    end
hold off;

figure(2);

g = downsample(h,ip,0);
[G w] = grpdelay(g,1,1024,fi/ip);
plot(w,G,'r');
hold on;
for i = 1:(ip-1)
    g = downsample(h,ip,i);
    [G w] = grpdelay(g,1,1024,fi/ip);
    plot(w,G,'b');
    end
hold off;
axis([0 2 (ds/2 - 1) ds/2]);

k = 0:99;
x = sin(2*pi*(k)/20);
g = downsample(h,ip,0);
y = filter(g,1,x);
figure(3);
plot(k,y,'b');
hold on;
g = downsample(h,ip,16);
y = filter(g,1,x);
plot(k,y,'r');
hold off;


% Build the lookup table for the time offset calculation. It contains 1/x, where x
% is the input to the LUT.
x = 1:31;
x = ones(1,31)./x;
x = [1.0 x];
lut = round((2^17 - 1) .* x);
fid = fopen('reciprocalLut.coe','w');
fprintf(fid,'memory_initialization_radix=10;\n');
fprintf(fid,'memory_initialization_vector=\n');
fprintf(fid,'%d,\n',lut(1:31));
fprintf(fid,'%d;\n',lut(32));
fclose(fid);


if writeFile == 1
    %dcGain = ip;
    %gainAdjust = 2^(ceil(log2(dcGain)) - log2(dcGain));
    gainAdjust = ip;

    g = h(1:ip);
    g = gainAdjust .* g;
    g = round((2^17).*g);
    fid = fopen('resamplerTap0.coe','w');
    fprintf(fid,'memory_initialization_radix=10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',g(1:ip-1));
    fprintf(fid,'%d;\n',g(ip));
    fclose(fid);

    g = h(ip+1:2*ip);
    g = gainAdjust .* g;
    g = round((2^17).*g);
    fid = fopen('resamplerTap1.coe','w');
    fprintf(fid,'memory_initialization_radix=10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',g(1:ip-1));
    fprintf(fid,'%d;\n',g(ip));
    fclose(fid);

    g = h(2*ip+1:3*ip);
    g = gainAdjust .* g;
    g = round((2^17).*g);
    fid = fopen('resamplerTap2.coe','w');
    fprintf(fid,'memory_initialization_radix=10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',g(1:ip-1));
    fprintf(fid,'%d;\n',g(ip));
    fclose(fid);

    g = h(3*ip+1:4*ip);
    g = gainAdjust .* g;
    g = round((2^17).*g);
    fid = fopen('resamplerTap3.coe','w');
    fprintf(fid,'memory_initialization_radix=10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',g(1:ip-1));
    fprintf(fid,'%d;\n',g(ip));
    fclose(fid);

    g = h(4*ip+1:5*ip);
    g = gainAdjust .* g;
    g = round((2^17).*g);
    fid = fopen('resamplerTap4.coe','w');
    fprintf(fid,'memory_initialization_radix=10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',g(1:ip-1));
    fprintf(fid,'%d;\n',g(ip));
    fclose(fid);

    g = h(5*ip+1:6*ip);
    g = gainAdjust .* g;
    g = round((2^17).*g);
    fid = fopen('resamplerTap5.coe','w');
    fprintf(fid,'memory_initialization_radix=10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',g(1:ip-1));
    fprintf(fid,'%d;\n',g(ip));
    fclose(fid);

    g = h(6*ip+1:7*ip);
    g = gainAdjust .* g;
    g = round((2^17).*g);
    fid = fopen('resamplerTap6.coe','w');
    fprintf(fid,'memory_initialization_radix=10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',g(1:ip-1));
    fprintf(fid,'%d;\n',g(ip));
    fclose(fid);

    g = h(7*ip+1:8*ip);
    g = gainAdjust .* g;
    g = round((2^17).*g);
    fid = fopen('resamplerTap7.coe','w');
    fprintf(fid,'memory_initialization_radix=10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',g(1:ip-1));
    fprintf(fid,'%d;\n',g(ip));
    fclose(fid);

    g = h(8*ip+1:9*ip);
    g = gainAdjust .* g;
    g = round((2^17).*g);
    fid = fopen('resamplerTap8.coe','w');
    fprintf(fid,'memory_initialization_radix=10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',g(1:ip-1));
    fprintf(fid,'%d;\n',g(ip));
    fclose(fid);

    end

