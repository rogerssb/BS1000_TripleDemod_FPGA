% This program is basically a precomputed divider.
function AM_Gain = AM_GainDiff()
    AM_Gain = zeros(16384,1);
    for Max = 0:127
        for Min = 0:127
            Index = Max*128+Min+1;
            if (Max >= Min)
                if (Min > 0)
                    Gain = (Max-Min)/Max/2;
                else
                    Gain = 1;
                end
            else
                if (Max > 0)
                    Gain =  (Min-Max)/Min/2;
                else
                    Gain = 1;
                end
            end
            AM_Gain(Index) = Gain;
        end
    end
    AM_Gain(1) = 0;     % used to disable output if inputs are zero
end
