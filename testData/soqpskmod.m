%## soqpskmod - soqpsk modulator
%## generates a complex soqpsk modulated signal from the input bit stream
%
%## y = soqpskmod(X, U, SOQPSK_TG)
%##
%## X - input bit stream - 0's and 1's
%## U - Upsample multiple over X, i.e. the samples per bit time
%## SOQPSK_TG - if non-zero use the TG waveform, otherwise MIL square pulse

function y = soqpskmod(X, U, SOQPSK_TG, FeherDiffEncode)
    if nargin < 3
        usage('y = soqpskmod(X,U,SOQPSK_TG)');
    end
    
    numPoints = length(X);
    
    % The SOQPSK precoder is a double differential encoder followed by a ternary
    % encoder. This is known as the 4 state encoder. These operations can be
    % combined to for a differntial precoder whose only state is the sign state
    % We show both here with a test for which one to use
    FourStateEncoder = 1;
    DiffEncode = 0;
    if FourStateEncoder == 1
        % double differential encode followed by ternary encode
        % diff encode the bits
        if FeherDiffEncode == 1
            d = zeros(1, numPoints);
            for i = 2:numPoints
                if mod(i,2)
                    d(i) = xor(X(i), ~d(i-1));
                else
                    d(i) = xor(X(i), d(i-1));
                end %if
            end
        elseif DiffEncode
            d = zeros(1, numPoints);
            for i = 3:numPoints
                d(i) = xor(X(i), d(i-2));
            end %for
        else 
            d = cast(X,'double');
        end %if FeherDiffEncode
    
        % precode to ternary
        for i=3:numPoints
            alpha(i) = ((-1)^(i+1))*(2*d(i-1) - 1)*(d(i) - d(i-2));
        end
    else    
        % differential precoder
        signState = 1;
        for i=1:numPoints
            alpha(i) = ((-1)^signState)*X(i);
            signState = mod(signState+alpha(i)+1, 2);
        end
    end
    
    d
    alpha

    % Upsample it to get impulse responses
    impulse = upsample(alpha, U);
    
    % Generate the frequency pulse. T in this case is duration of the alpha
    % ternary symbol and a bit time. The QPSK symbol duration is 2T.
    %SOQPSK_TG = 1;
    if SOQPSK_TG == 1
        % For SOQPSK-TG we have and L=8T pulse
        B = 1.25;
        rho = 0.7;
        T1 = 1.5;
        T2 = 0.5;
        T1PlusT2 = T1 + T2;
        samplesPerSymbol = 2*U;
        % time vector normalized by the symbol period spaced at the sample rate
%        if mod(U,2) == 0
%            tNorm = -T1PlusT2+(1/(2*samplesPerSymbol)) : 1/samplesPerSymbol : T1PlusT2;
%            tT1Norm = -T1+(1/(2*samplesPerSymbol)) : 1/samplesPerSymbol : T1;
%        else
            tNorm = -T1PlusT2 : 1/samplesPerSymbol : T1PlusT2;
            tT1Norm = -T1:1/samplesPerSymbol:T1;
%        end
        
        cpiece = cos(pi*rho*B*tNorm) ./ (1 - 4*((rho*B*tNorm).^2));
        spiece = sinc(B*tNorm);
        
        midPoint = (length(tNorm) + 1)/2;
        win = zeros(1,length(tNorm));
        win = 0.5 + 0.5*cos(pi*(tNorm - T1)/T2);
        win(round(tT1Norm.*samplesPerSymbol + midPoint)) = 1;

        g = win .* cpiece .* spiece;
        dcGain = sum(g);
        gainAdjust = 1/(2*dcGain);
        g = g*gainAdjust;
        
        g
        %figure;
        %plot(cpiece, 'b*');
        %hold on;
        %plot(spiece, 'r*');
        %plot(win, 'k*');
        %hold off;
    else
        % For SOQPSK-MIL we have a square frequency pulse
        g = 0.5*ones(1, U)/U;
    end
    
    %g
    %figure;
    %plot(g, '*');
    % phase pulse (only needed for reference)
    %q = cumsum(g);
    %hold on;
    %plot(q, 'r*');
    %hold off;
    
    % Convolve pulse with upsampled ternary waveform
    fm = conv(g, impulse);
    %fm = filter(g, 1, impulse);
    %figure;
    %plot(fm, '*');
    
    % Need intergral of fm to modulate phase
    theta = cumsum(fm);
    
    % deviation is 1/2
    h = 0.5;
    
    %figure;
    %plot(theta*h, '*');

    % create the complex modulated output
    y = exp(j*2*pi*h*theta-j*pi/4);
    
    
end

%!demo
%! n = 20;
%! U = 1;
%! X = randint(1, n, 2)
%! X = [zeros(1,4),1,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1,0,0,1,0]
%! X = [zeros(1,4),0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]
%! X = [zeros(1,4),1,1,0,0,1,1,0,0,1,1,0,0,0,1,1]
%! X = zeros(1, n)
%! X = ones(1,n)
%! y = soqpskmod(X, U, 0);
%! figure;
%! plot(angle(y), '*');
%! y = soqpskmod(X, U, 1);
%! figure;
%! plot(angle(y), '*');
%! figure;
%! plot(y, '*');
%! I = downsample(real(y), U, 1);
%! Q = downsample(imag(y), U, 1);
%! figure;
%! plot(I(1:length(Q)),Q,'*');
