function plotFlByRewDelay(F, eventname)

% plotting parameters
cl = getcolors('delay');
x_range = [-.5 1]; % x axis range (seconds)

T = linspace(-5, 10, size(F{1,1},2));
for bin=1:numel(F)
    plotnice(T, F{bin}, cl{bin});
    hold on
end

xlim(x_range);
xlabel(converteventname(eventname))

end