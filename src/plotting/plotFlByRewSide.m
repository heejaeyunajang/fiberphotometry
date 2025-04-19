function plotFlByRewSide(F, hemi, eventname)

% plotting parameters
cl = getcolors('side');
x_range = [-.5 1]; % x axis range (seconds)

T = linspace(-5, 10, size(F{1,1},2));
for side=1:2
    if hemi~=side
        plotnice(T, F{side}, cl.contra);
    else
        plotnice(T, F{side}, cl.ipsi);
    end
    hold on
end

xlim(x_range);
xlabel(converteventname(eventname))

end