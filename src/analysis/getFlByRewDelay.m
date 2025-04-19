function delayF = getFlByRewDelay(pdata, bdata, baselinecorrect)
% pdata: event-aligned photometry signals (array)
% bdata: trial info (table)
% 
% Trials excluded from analysis: 
% (1) un-rewarded trials
% (2) delay shorter than 750 ms to minimize bleed-over response from
% previous event


if size(pdata,1) ~= size(bdata,1)
    error('number of trials do not match')
end

if nargin<3
    baselinecorrect = false;
end

T = linspace(-5, 10, size(pdata, 2));

% Get reward delay quartiles based on delay distribution over all sessions
n_bins = 4;
delays = bdata.RewardDelay;
delays(delays>=100 | delays<0.75)=[]; % exclude catch trials and short trials
bins = log2(quantile(delays, 0:1/n_bins:1));

hittrials = find(bdata.TrialType==1); % rewarded trials
data = pdata(hittrials, :);
d = log2(bdata.RewardDelay(hittrials));
bin_n = discretize(d, bins);

delayF = cell(1, n_bins);
for n=1:n_bins
    F = data(bin_n==n,:);
    if baselinecorrect
        delayF{n} = blsubtract(T, 0.1, 0, F);
    else
        delayF{n} = F;
    end
end



end