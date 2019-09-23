function [kIndexOut,enOut]= kIndexCounter(start,limit)
    %FSM states
    IDLE = 0;
    LOAD = 1;
    COUNT = 2;
 
    persistent state, state = xl_state(IDLE, {xlUnsigned,2,0});
    persistent kIndex, kIndex = xl_state(0,{xlUnsigned,13,0});
    persistent en, en = xl_state(0,{xlBoolean,false});
    kIndexOut = kIndex;
    enOut = en;

    switch state
        case IDLE
            if start == true
                state = LOAD;
            end
            en = false;
        case LOAD
            kIndex = 0;
            state = COUNT;
            en = true;
        case COUNT
            if(kIndex+1 < limit)
                kIndex = kIndex + 1;
            else
                state = IDLE;
                en = false;
            end
    end
    
end