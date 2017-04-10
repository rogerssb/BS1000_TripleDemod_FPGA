% rcpulse - raised cosine pulse
% Creates a time domain pulse with raised cosine shape.

% y = rcpulse(N,L)
%
% where N is the total number of taps or order of the filter
% L is the number of symbols the pulse occupies
%

function y = rcpulse(N,L)
    
    if nargin < 2
        usage('y = rcpulse(N,L)');
    end %if
    
    for i=1:N
        y(i) = (1/(2*L)) * (1 - cos(2*pi*(i-1)/N));
    end %for

end %function

%!demo
%! figure;
%! plot(rcpulse(39,2), 'b;Raised Cosine Pulse Response;');
%! title('Raised Cosine Pulse N=39 L=2');
%! figure;
%! plot(rcpulse(6,3), '*');
%! title('Raised Cosine Pulse N=6 L=3');
