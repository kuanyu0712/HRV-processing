clc;
clear;
close all;
tic;

% Input and output directories
InputDir = 'C:\Users\user\Desktop\PhysioNet-Cardiovascular-Signal-Toolbox-master\HRV_processing\pre';
OutputDir = 'C:\Users\user\Desktop\PhysioNet-Cardiovascular-Signal-Toolbox-master\HRV_processing\pre_mat';
NewOutputDir = 'C:\Users\user\Desktop\PhysioNet-Cardiovascular-Signal-Toolbox-master\HRV_processing\pre_channel10';

% Load all .edf files in the folder
files = dir([InputDir '\' '*.edf']); 
filesNumber = length(files);

% Create output directories if they do not exist
if exist(OutputDir, 'dir') ~= 7
    mkdir(OutputDir);
end

if exist(NewOutputDir, 'dir') ~= 7
    mkdir(NewOutputDir);
end

for f = 1:filesNumber
    % Read .edf file
    [hdr, data] = edfread([InputDir '\' files(f).name]);
    fprintf('file(%d/%d): %s is loaded.\n', f, filesNumber, files(f).name(1:end-4));
    
    % Save the entire data to the output directory
    save(strcat(OutputDir, '\', files(f).name(1:end-4), '.mat'), 'data');
    fprintf('file(%d/%d): %s is saved.\n', f, filesNumber, files(f).name(1:end-4));
    
    % Extract the 10th channel
    if size(data, 1) >= 10  % Check if there are at least 10 channels
        channel10 = data(10, :);
        save(strcat(NewOutputDir, '\', files(f).name(1:end-4), '.mat'), 'channel10');
        fprintf('file(%d/%d): %s (10th channel) is saved.\n', f, filesNumber, files(f).name(1:end-4));
    else
        warning('file(%d/%d): %s has less than 10 channels.\n', f, filesNumber, files(f).name(1:end-4));
    end
    
    % Clear data for the next iteration
    clear data channel10;
    close all;
end

toc;
