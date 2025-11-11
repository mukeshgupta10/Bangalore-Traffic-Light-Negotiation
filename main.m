clc; clear; close all;

% Project root
projectRoot = 'C:\Users\user\Desktop\Bangalore_TrafficLight_Project';

% Image path
imgPath = fullfile(projectRoot, 'data', 'images');

% Get image list
imageFiles = dir(fullfile(imgPath, '*.jpg'));

if isempty(imageFiles)
    error('⚠️ No JPG images found in %s. Please add images and retry.', imgPath);
else
    disp('✅ Images found:');
    disp({imageFiles.name});
end

% Display first image
img = imread(fullfile(imgPath, imageFiles(1).name));
imshow(img);
title('Bangalore Smart Traffic Light Simulation');

