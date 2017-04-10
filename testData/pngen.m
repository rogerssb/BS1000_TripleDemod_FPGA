%## PN Sequence generator
%##
%## d = pnseq(O, N)
%## O is the order of the PN generator
%## N is the number of points you want in the sequence

function d = pngen(O, N)

    if nargin < 2
        usage('d = pnseq(O,N)');
    end

    % Create a pn register in the galois field of order O.
    pnreg = gf(1,O);
    
    for i = 1:N
        d(i) = mod(pnreg.x,2);
        pnreg = pnreg * 2;
    end

end

%!demo
%! O=6
%! N=128
%! d = pngen(O,N)