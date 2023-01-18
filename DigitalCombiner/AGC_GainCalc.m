% This program is basically a precomputed divider.
function AGC_Gain = AGC_GainCalc()
    AGC_Gain = zeros(16384,1);
    dB_Range=1;
    Offset=0.5;
    for Index = 0:8190
        Linear=10.^(-Index*dB_Range/20/8192);
        Gain=Linear/(Linear+1);
        AGC_Gain(Index+1) = Gain-Offset;
        AGC_Gain(16384-Index) = 1-Gain-Offset;
    end
    % if saturated, turn into full strength switch
    AGC_Gain(8192) = -1;
    AGC_Gain(8193) = 1;
end
