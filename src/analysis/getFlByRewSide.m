function sideF = getFlByRewSide(pdata, bdata, baselinecorrect)
% pdata: event-aligned photometry signals (array)
% bdata: trial info (table)
% hemi: 1=left hemi, 2=right hemi

if size(pdata,1) ~= size(bdata,1)
    error('number of trials do not match')
end

if nargin<4
    baselinecorrect = false;
end

T = linspace(-5, 10, size(pdata, 2));

for rewside=1:2
    F = getTrialsByRewSide(pdata, bdata, rewside);
    if baselinecorrect
        sideF{rewside} = blsubtract(T, 0.1, 0,F);
    else
        sideF{rewside} = F;
    end
end


end