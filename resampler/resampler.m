% This generates the filter coefficients for the resampler. The resampler accepts an
% input sample rate, fi, between of 2*fo > fi > fo, where fo is the output sample rate.

ds = 9;         % ds = data spread, fir taps used for each delay
ip = 32;        % ip = interpolation points, number of delays available within a sample
taps = ds*ip;   % total taps
order = taps-1;

fi = ip;        % fi is normalized to ip;
fn = fi/2;
fc = 0.5/fn;

writeFile = 1;

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
plot(w,G,'b');
hold on;
for i = 1:(ip-1)
    g = downsample(h,ip,i);
    [G w] = grpdelay(g,1,1024,fi/ip);
    plot(w,G,'b');
    end
hold off;
axis([0 2 (ds/2 - 1) ds/2]);




if writeFile == 1
    h = round((2^17)*h*ip);
    for i = 1:(ip*ds)
        if (h(i) < 0)
            h(i) = h(i) + 2^18;
        end
    end
    fid = fopen('resampler.hex','w');
    fprintf(fid,'%X\n',h);
    fclose(fid);
end

