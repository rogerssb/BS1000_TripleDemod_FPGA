% This program is basically a precomputed divider.
function AGC_Gain = AGC_GainCalc()
    dBRange=11;
    AGC_Gain = zeros(16384,1);
    for Index = 0:8191
        Gain = 0.5*10.^(Index*(-dBRange/20)/8192);
        AGC_Gain(Index+1) = Gain;
    end
    for Index = 8192:16383
        Gain = 1-0.5*10.^((16383-Index)*(-dBRange/20)/8192);
        AGC_Gain(Index+1) = Gain;
    end
end
