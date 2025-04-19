% Main script that plots event-aligned dopamine responses by
% (1) reward offer amount in mixed blocks
% (2) delay to reward
% (3) side of reward port relative to recording site (contra vs ipsi)

% Clear environment
clear; clc; close all

% define paths
gitdir = 'C:\Users\hjj296\Documents\GitHub'; % <-- CHANGE THIS TO YOUR LOCAL REPO PATH
bdatadir = fullfile(gitdir, 'fiberphotometry', 'data');
ratname = 'J028';
bdatafile = fullfile(bdatadir, sprintf('ratTrial_%s.mat', ratname));
pdatafile = 'Z:\PhotometryData\GRAB_DA_DMS\J028_DA_ch2_aDMS_tmac.mat';

%% Load behavior and dopamine data
% Load behavior data of an example rat (struct that concatenates all
% behavior sessions)
load(bdatafile, 'A');
ratTrial = A;

% Load dopamine data <-- UPDATE THIS AFTER UPLOADING DATA IN A PUBLIC SPACE
load(pdatafile, 'pstruct')
pstruct = pstruct.(ratname);
load(strrep(pdatafile, 'ch2_aDMS_tmac', 'bstruct'), 'bstruct')
bstruct = bstruct.(ratname);
hemi = 2; % 1=left hemi (ch1) / 2=right hemi(ch2)

%% Get event-aligned average DA signals by different conditions

events = {'CPIn', 'SideOn', 'SideOff', 'OptOut'};

DA_vol = cell(1, length(events)); % Sorted by reward volume (mixed block only)
DA_delay = cell(1, length(events)); % Sorted by delay to reward
DA_side = cell(1, length(events)); % Sorted by reward port side
                                   % relative to recording hemisphere

baselinecorrect = false;                           
for e=1:length(events)
    pdata = pstruct.(events{e});
    bdata = bstruct.(events{e});
    DA_vol{e} = getFlByRewVol(pdata, bdata, 'mixed', baselinecorrect);
    DA_delay{e} = getFlByRewDelay(pdata, bdata, baselinecorrect);
    DA_side{e} = getFlByRewSide(pdata, bdata, baselinecorrect);
end


%% Plot results
plotEventAlignedDA(events, DA_vol, DA_delay, DA_side, hemi);


