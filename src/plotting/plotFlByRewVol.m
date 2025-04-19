function plotFlByRewVol(F, eventname)

% plotting parameters
cl = getcolors('volume');
x_range = [-.5 1]; % x axis range (seconds)

T = linspace(-5, 10, size(F{1,1},2));
for rew=1:5
    plotnice(T, F{rew}, cl{rew});
    hold on
end

xlim(x_range);
xlabel(converteventname(eventname))

end