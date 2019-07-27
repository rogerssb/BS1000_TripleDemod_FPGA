% Written by Erik Perrins, 2016, esp@ieee.org

% Pick your favorite encoder implementation.

if(0) % Option 0: A simple mod-2 matrix-vector multiplication in MATLAB
    TxCodeWord = mod(TxInfoWord*G,2);
end

if(1) % Option 1: The one shown in the CCSDS Orange Book
    TxCodeWord = LdpcEncoder1(TxInfoWord,W_ROW_ROM,m);
end

if(0) % Option 2
    TxCodeWord = LdpcEncoder2(TxInfoWord,W_COL_ROM,m);
end
