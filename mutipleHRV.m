clc;
clear;
close all;

% 設定檔案路徑
InputDir = 'C:\Users\user\Desktop\PhysioNet-Cardiovascular-Signal-Toolbox-master\HRV_processing\pre_channel10';
fs = 200;

% 執行啟動腳本
run('startup.m')

% 取得所有 .mat 檔案
matFiles = dir(fullfile(InputDir, '*.mat'));

% 處理每個檔案
for i = 1:length(matFiles)
    try
        % 讀取檔案
        currentFile = matFiles(i).name;
        [~, filename, ~] = fileparts(currentFile);  % 取得不含副檔名的檔名
        
        % 設定 HRV 參數
        HRVparams = InitializeHRVparams('BSPHRV', filename);
        HRVparams.Fs = fs;
        
        % 載入 ECG 資料
        dataPath = fullfile(InputDir, currentFile);
        ecg_data = load(dataPath);
        ecg = ecg_data.channel10;
        
        % 執行 HRV 分析
        [result, resFilename] = Main_HRV_Analysis(ecg, [], 'ECGWaveform', HRVparams);
        
        fprintf('Successfully processed %s\n', currentFile);
        
    catch ME
        fprintf('Error processing %s: %s\n', currentFile, ME.message);
        continue;
    end
end

fprintf('All files processed.\n');