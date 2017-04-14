function [ f_passband_upperlimit, blockbandLoss ] = calcPassbandUpperLimitAndBlockbandLoss( freqList, freqAmpList, blockFreq)
    baseline_of_passband = freqAmpList(1);
    half_power_level = (sqrt(2)/2)*baseline_of_passband;
    for index=2:length(freqAmpList)
        if (freqAmpList(index) <= half_power_level && freqAmpList(index-1) >= half_power_level)
            break;
        end
    end

    f_passband_upperlimit = freqList(index);
    
    stopIdx = find(freqList == blockFreq);
    blockbandLoss = 10*log10(freqAmpList(stopIdx)/baseline_of_passband);   

end

