%  pcmfmmod - pcmfm modulator
%  generates a complex pcmfm modulated signal from the input bit stream

%  y = pcmfmmod(X, U)
% 
%  X - input bit stream - 0's and 1's
%  U - Upsample multiple over X, i.e. the samples per bit time

function y = pcmfmmod(X, U, varargin)
    
    if nargin < 2
        usage('y = pcmfmmod(X,U)');
    end %if

    % Allow h to be passed in as a third argument.
    if nargin == 3
        h = varargin{1};
    else
        h = 0.7;    % deviation is 7/10 for frequency pulse with area 1/2
    end %if
    
    % Convert the bit stream to anti-podal
    d = (cast(X,'double')*2.0 - 1.0);

    % Upsample it to get impulse responses
    impulse = upsample(d, U);

    % Generate 2RC pulse normalized for up sampling gain
    g = rcpulse((2*(U)),2)/(U);
    %figure;
    %plot(g, 'b*');
    % Generate the phase pulse for a look see
    q = cumsum(g);
    %hold on;
    %plot(q, 'r*');
    %hold off;
    
    % Convolve pulse with upsampled input
    fm = conv(g, impulse);
    %figure;
    %plot(fm, 'b*');
    % Need intergral of fm to modulate phase
    theta = cumsum(fm);
    %theta = conv(q, impulse)
    % We need to produce an even multiple of U for downstream
    % modules.
    %theta(length(theta)+1) = theta(length(theta));
    %figure;
    %plot(theta*h, 'r*');
    
    % Create complex output
    %theta = 2*pi*h*theta;
    %inphase = cos(theta);
    %quadrature = sin(theta);
    %y = complex(inphase, quadrature);
    y = exp(j*2*pi*h*theta);

end  % function

%!demo
%! n = 128;
%! U = 2;
%! X = randint(1, n, 2);
%! y = pcmfmmod(X, U);
%! figure;
%! plot(real(y), imag(y));
%! title("PCM-FM XY Plot")
%! figure;
%! N = n*U;
%! freqResp = fft(y, N);
%! plot([-N/2:N/2-1]*U/N, 20*log10(fftshift(abs(freqResp))));
%! xlabel("frequency (Hz)")
%! ylabel("amplitude (dB)")
%! title("PCM-FM frequency response");

