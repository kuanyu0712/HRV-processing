% Load .mat file
matFilePath = 'post_mat_channel10/00402871-EDF.mat'; % 替換為你的檔案路徑
dataStruct = load(matFilePath);

% Extract the data
fieldNames = fieldnames(dataStruct); % 獲取變數名稱
data = dataStruct.(fieldNames{1}); % 假設只有一個變數，提取第一個變數

% Check if the data is one-dimensional
if isvector(data)
    % Plot the data
    figure;
    plot(data, '-o', 'MarkerSize', 4, 'LineWidth', 1);
    xlabel('Sample Index');
    ylabel('Amplitude');
    title('Visualization of 1D Data');
    grid on;
else
    error('The data is not one-dimensional.');
end


%% 
matFilePath = 'post_mat_channel10/00402871-EDF.mat'; % 替換為你的檔案路徑
dataStruct = load(matFilePath);

% Extract the data
fieldNames = fieldnames(dataStruct); % 獲取變數名稱
data = dataStruct.(fieldNames{1}); % 假設只有一個變數，提取第一個變數

% Limit data to the first 5000 points
numPoints = 50000;
dataToPlot = data(1:min(numPoints, length(data))); % 確保資料長度足夠

% Plot the data
figure;
plot(dataToPlot, '-o', 'MarkerSize', 4, 'LineWidth', 1);
xlabel('Sample Index');
ylabel('Amplitude');
title('Visualization of the First 5000 Points');
grid on;
