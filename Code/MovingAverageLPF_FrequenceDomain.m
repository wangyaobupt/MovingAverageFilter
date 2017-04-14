function [ Re ] = MovingAverageHPF_FrequenceDomain( freq_in_hz, f_sample,order )
    sum = 0;
    for i=1:order
        sum = sum + cos(2*pi*freq_in_hz/f_sample*i);
    end
    Re = (1 + 2*sum) / (2*order+1);
end

