clc;
clear;
close all;
sampling = 5000;
% 新的 mat 檔案資料夾
NewOutputDir = 'C:\Users\user\Desktop\PhysioNet-Cardiovascular-Signal-Toolbox-master\HRV_processing\pre_channel10';

% 讀取資料夾中的所有 .mat 檔案
files = dir([NewOutputDir '\' '*.mat']);
filesNumber = length(files);

% 檢查是否有檔案
if filesNumber == 0
    error('No .mat files found in the specified directory.');
end

% 繪製每個檔案的第10通道資料（僅前5000個點）
for f = 1:filesNumber
    % 加載資料
    dataFile = load([NewOutputDir '\' files(f).name]);
    
    % 確認是否存在 'channel10' 變數
    if ~isfield(dataFile, 'channel10')
        warning('File (%s) does not contain variable "channel10". Skipping...', files(f).name);
        continue;
    end
    
    % 取得第10通道資料
    channel10 = dataFile.channel10;
    
    % 僅取前5000個點
    if length(channel10) < sampling
        warning('File (%s) contains fewer than 200 samples. Plotting all available data...', files(f).name);
        dataToPlot = channel10;
    else
        dataToPlot = channel10(1:sampling);
    end
    
    % 繪圖
    figure;
    plot(dataToPlot, '-', 'MarkerSize', 4, 'LineWidth', 1);
    title(['ECG Signal (First 200 Points) - ' files(f).name], 'Interpreter', 'none');
    xlabel('Sample Index');
    ylabel('Amplitude');
    grid on;
    
    % 暫停以觀察圖形
    pause(1); % 可調整秒數，或改為手動關閉圖形再進入下一個
end

disp('All plots generated.');
