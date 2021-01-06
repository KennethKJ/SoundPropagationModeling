
% Change dir to containing folder
fullPath = which('runGroundCalc.m');
filepath = fileparts(fullPath);
cd(filepath)

% Add relative paths
addpath('.\GUIs')
addpath(genpath('.\Functions'))

% Run
GroundCalc();

