% main_simulation.m
% Simple MATLAB simulation harness for traffic light negotiation (Bangalore version)
clear; close all; clc;
addpath(genpath(fileparts(mfilename('fullpath'))));

% Configuration
img_folder = fullfile(pwd, 'data','images');
out_folder = fullfile(pwd, 'data','output');
if ~exist(out_folder,'dir'), mkdir(out_folder); end

img_files = dir(fullfile(img_folder,'*.jpg'));
if isempty(img_files)
    fprintf('No images in %s. Add images and rerun.\n', img_folder);
    return;
end

% Vehicle initial state (x,y,theta) meters
vehicle.x = 0; vehicle.y = -20; vehicle.theta = 0; vehicle.v = 5; % m/s

% Stop line assumed at y = 0
stop_line_y = 0;

log = [];
for i=1:length(img_files)
    img_path = fullfile(img_folder, img_files(i).name);
    I = imread(img_path);
    % Perception
    detection = perception_detectTrafficLight(I);
    % Distance to stop line (simple projection using vehicle.y)
    d_to_stop = stop_line_y - vehicle.y;
    % Controller decision
    action = controller_state_machine(detection, d_to_stop, vehicle);
    % Log
    entry.frame = img_files(i).name;
    entry.detection = detection;
    entry.action = action;
    log = [log; entry]; %#ok<AGROW>
    % Display quick visualization
    fprintf('Frame: %s | TL: %s | Action: %s\n', img_files(i).name, detection.state, action);
end

% Save log
save(fullfile(out_folder,'detection_log.mat'),'log');
fid = fopen(fullfile(out_folder,'detection_log.txt'),'w');
for k=1:numel(log)
    fprintf(fid, '%s -- State:%s -- Action:%s\n', log(k).frame, log(k).detection.state, log(k).action);
end
fclose(fid);
fprintf('Simulation finished. Outputs in %s\n', out_folder);
