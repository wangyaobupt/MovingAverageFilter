function plotMovingAverageLPF_FrequencyGraph( order )
    freq_resolution = 0.001; % in unit of Hz
    f_s = 125;
    freqList = [0: freq_resolution :f_s/2];

    freq_amp_list = abs(MovingAverageLPF_FrequenceDomain(freqList, f_s, order));
    
    figure;
    plot(freqList, freq_amp_list);
    title(sprintf('Amp Freq Graph of Moving average filter, order = %d, f_s =%f Hz', 2*order+1,f_s));
    ylabel('Amp/Baseline = 1') ;
    xlabel('Frequency/Hz');
end

