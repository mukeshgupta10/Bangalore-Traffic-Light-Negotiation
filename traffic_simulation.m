clc; clear; close all;

% === Project Setup ===
projectRoot = 'C:\Users\user\Desktop\Bangalore_TrafficLight_Project';
imgPath = fullfile(projectRoot, 'data', 'images');

% Load images
redLight = imread(fullfile(imgPath, 'img_02.jpg'));   % Red
greenLight = imread(fullfile(imgPath, 'img_03.jpg'));  % Green

% === Simulation Window ===
figure('Name','Bangalore Smart Traffic Light','NumberTitle','off',...
       'Color',[0.1 0.1 0.1],'Position',[500 200 600 700]);

axis off;
set(gcf,'MenuBar','none');
title('🚦 Bangalore Smart Traffic Light Control System','Color','w','FontSize',14);

% === Main Loop ===
while true
    % RED LIGHT
    imshow(redLight);
    title('🔴 STOP - Vehicles must halt','Color','r','FontSize',16,'FontWeight','bold');
    pause(3);

    % GREEN LIGHT
    imshow(greenLight);
    title('🟢 GO - Vehicles can move','Color','g','FontSize',16,'FontWeight','bold');
    pause(3);
end
