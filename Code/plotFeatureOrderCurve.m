function plotFeatureOrderCurve()
    mList = 1:100;
    orderList = 2*mList + 1;
    stop_band_freq = 10; % in unit of Hz
    
    freq_resolution = 0.001; % in unit of Hz
    f_s = 125;
    freqList = [0: freq_resolution :f_s/2];
    
    f_stop_list = [];
    loss_list = [];
    for index =1:100
        freq_amp_list = abs(MovingAverageLPF_FrequenceDomain(freqList, f_s, mList(index)));
        [f_stop, loss] = calcPassbandUpperLimitAndBlockbandLoss(freqList, freq_amp_list, stop_band_freq);
        f_stop_list = [f_stop_list, f_stop];
        loss_list = [loss_list, loss];
    end
    
    plot(orderList, f_stop_list);
    title('Passband upper limit (Hz) v.s. order of moving average filter');
    xlabel('order of moving average filter');
    ylabel('Passband upper limit (Hz)');
    
end

