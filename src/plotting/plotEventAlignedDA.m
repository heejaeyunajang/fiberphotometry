function plotEventAlignedDA(events, DA_vol, DA_delay, DA_side, hemi)
% Main plotting script to plot event-aligned DA responses for all
% conditions

if ~isequal(size(events), size(DA_vol), size(DA_delay), size(DA_side))
    error('All inputs must have the same size')
end

figure(units='inches', position=[7, 3, 6, 4.6])
t = tiledlayout(3, numel(events), Padding="compact", TileSpacing="compact");

ax_row1 = gobjects(1, numel(events));
ax_row2 = gobjects(1, numel(events));
ax_row3 = gobjects(1, numel(events));

for e = 1:numel(events)
    ax_row1(e) = nexttile(t, e);
    plotFlByRewVol(DA_vol{e}, events{e});
    xline(0, 'k--');
    
    ax_row2(e) = nexttile(t, e + numel(events));
    plotFlByRewDelay(DA_delay{e}, events{e});
    xline(0, 'k--');
    
    ax_row3(e) = nexttile(t, e + 2*numel(events));
    plotFlByRewSide(DA_side{e}, hemi, events{e});
    xline(0, 'k--');
end

% Sync y-limits across each row
rows = {ax_row1, ax_row2, ax_row3};
for r = 1:3
    yl = cell2mat(arrayfun(@(ax) ylim(ax), rows{r}, 'UniformOutput', false)');
    global_ylim = [min(yl(:,1)), max(yl(:,2))];
    arrayfun(@(ax) ylim(ax, global_ylim), rows{r});
end

% Opt-out data does not exist for the reward delay condition 
nexttile(8); 
axis off;
cla;

ylabel(t, 'DA (z-score)')
xlabel(t, 'Time from event (s)')

end